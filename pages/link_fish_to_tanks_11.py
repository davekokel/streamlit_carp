
import uuid
from datetime import datetime
from typing import Dict, List, Optional, Tuple
import pandas as pd
import streamlit as st
from supabase import create_client, Client

st.set_page_config(page_title="Create Tanks for Selected Fish", layout="wide")

# ------------------------ Supabase clients ------------------------
@st.cache_resource
def get_clients() -> Dict[str, Client]:
    url = st.secrets["supabase"]["url"]
    anon_key = st.secrets["supabase"]["anon_key"]
    anon = create_client(url, anon_key)
    # Optional: service role key for writes (bypasses RLS). Only use if this app is server-side & secured.
    svc_key = st.secrets["supabase"].get("service_role_key") if "supabase" in st.secrets else None
    svc = create_client(url, svc_key) if svc_key else None
    return {"anon": anon, "svc": svc}

CL = get_clients()
SB_READ = CL["anon"]
SB_WRITE = CL["svc"] or CL["anon"]  # prefer service role for writes if provided

def safe_select_all(table: str, limit: int = 100000) -> pd.DataFrame:
    try:
        res = SB_READ.table(table).select("*").limit(limit).execute()
        data = res.data or []
        df = pd.DataFrame(data)
        # normalize datetime columns to strings for display
        for c in df.columns:
            if pd.api.types.is_datetime64_any_dtype(df[c]):
                df[c] = df[c].astype(str)
        return df
    except Exception as e:
        st.error(f"Failed to load {table}: {e}")
        return pd.DataFrame()

def insert_returning(sb: Client, table: str, obj: dict, returning_fallback_keys: Optional[Dict[str, object]] = None) -> Optional[dict]:
    res = sb.table(table).insert(obj).execute()
    rows = res.data or []
    if rows:
        return rows[0]
    if returning_fallback_keys:
        q = sb.table(table).select("*")
        for k, v in returning_fallback_keys.items():
            q = q.eq(k, v)
        q = q.order("created_at", desc=True).limit(1)
        res2 = q.execute()
        rows2 = res2.data or []
        if rows2:
            return rows2[0]
    return None

# Attempt membership insert trying multiple possible time column names
def insert_membership_with_time_probe(base_fields: Dict[str, object]) -> Tuple[Optional[dict], Optional[str], Optional[str]]:
    """
    Returns: (row, time_col_used, error_message)
    Tries time column keys in order; last step tries without any time column.
    """
    ts = datetime.utcnow().isoformat()
    candidates = ["valid_from","started_at","started","start_at","started_on", None]
    last_err = None
    for tk in candidates:
        payload = dict(base_fields)
        if tk is not None:
            payload[tk] = ts
        try:
            row = insert_returning(SB_WRITE, "fish_tank_memberships", payload)
            if row:
                return row, tk, None
        except Exception as e:
            last_err = str(e)
            continue
    return None, None, last_err

def end_date_active_memberships(fish_uuid: Optional[str], fish_id: Optional[int]) -> None:
    """
    Close out any active membership intervals for this fish by setting valid_to=now.
    Requires UPDATE permission by RLS.
    """
    ts = datetime.utcnow().isoformat()
    if fish_uuid:
        try:
            SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id_uuid", fish_uuid).is_("valid_to", None).execute()
        except Exception as e:
            st.warning(f"Could not end-date active memberships by UUID (RLS?): {e}")
    if fish_id is not None:
        try:
            SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id", int(fish_id)).is_("valid_to", None).execute()
        except Exception:
            pass

# ------------------------ Data loading ------------------------
@st.cache_data(ttl=120)
def load_fish(limit: int = 50000) -> pd.DataFrame:
    df = safe_select_all("fish", limit=limit)
    for c in ["id","id_uuid","name","code","sex","status","date_birth","line_building_stage"]:
        if c not in df.columns:
            df[c] = None
    return df

fish_df = load_fish()

# ------------------------ UI ------------------------
st.title("Create Tanks for Selected Fish")

with st.form("global_cfg"):
    created_by = st.text_input("created_by (UUID)", value="00000000-0000-0000-0000-000000000000")
    st.caption("Writes use the service role if present in secrets; otherwise anon/auth per your RLS policies.")
    st.form_submit_button("Save settings")

st.markdown("### 1) Pick Fish")
search_q = st.text_input("🔎 Search fish", "", placeholder="code, name, sex, status, …", key="new_search")
work = fish_df.copy()
if search_q.strip():
    s = search_q.lower().strip()
    str_df = work.fillna("").astype(str)
    mask = str_df.apply(lambda row: s in " ".join(row.values).lower(), axis=1)
    work = work.loc[mask].copy()

display_cols = ["_select","name","code","sex","status","date_birth","line_building_stage","id","id_uuid"]
for c in display_cols:
    if c not in work.columns:
        work[c] = None
if "_select" not in work.columns:
    work.insert(0, "_select", False)

st.write(f"Fish — {len(work)} row(s)")
edited = st.data_editor(
    work[display_cols].head(2000),
    use_container_width=True,
    column_config={"_select": st.column_config.CheckboxColumn("Select")},
    disabled=[c for c in display_cols if c not in ["_select"]],
    hide_index=True,
    key="new_editor"
)
selected = edited[edited.get("_select", pd.Series(dtype=bool)) == True].copy() if "_select" in edited.columns else pd.DataFrame()
st.caption(f"Selected fish: {len(selected)}")

st.markdown("---")
st.markdown("### 2) Tank Settings")

c1, c2, c3 = st.columns([1,1,1])
with c1:
    site_code = st.selectbox("Site code (enum)", ["NURSERY", "ADULT"], index=0, key="new_site")
with c2:
    location = st.text_input("Location", value=site_code, key="new_loc", help="Often same as site_code")
with c3:
    tank_type = st.selectbox("Tank type (enum)", ["2L","4L","6L"], index=1, key="tank_type")

rack = st.text_input("Rack", value="", key="new_rack")
notes = st.text_input("Notes", value="", key="new_notes")

do_create = st.button("Create tank(s) + link", key="btn_create")

results_new: List[Dict] = []
errors_new: List[str] = []

if do_create:
    if selected.empty:
        st.warning("Select at least one fish in the table above.")
    else:
        for _, row in selected.iterrows():
            fish_name = row.get("name") or ""
            fish_code = row.get("code") or ""
            fish_id = row.get("id")
            fish_uuid = row.get("id_uuid")
            if not fish_uuid and fish_id is None:
                errors_new.append("Fish row missing id/id_uuid; skipping.")
                continue

            # End-date current membership(s)
            end_date_active_memberships(fish_uuid, fish_id)

            # Internal unique name to satisfy NOT NULL + UNIQUE constraints (hidden from UI)
            auto_name = f"__auto__{str(uuid.uuid4())[:8]}"

            # Attempt insert WITH tank_type first; if it fails (column/enum missing), retry without it.
            base_tank = {
                "name": auto_name,
                "location": location or site_code,
                "site_code": site_code,
                "rack": rack if rack else None,
                "notes": notes if notes else None,
                "created_by": created_by,
            }
            tank_insert = dict(base_tank)
            tank_insert["tank_type"] = tank_type

            new_tank = None
            warn_no_type = False
            try:
                new_tank = insert_returning(SB_WRITE, "tanks", tank_insert, returning_fallback_keys={"name": auto_name, "created_by": created_by})
            except Exception as e:
                warn_no_type = True
                # retry without tank_type
                try:
                    new_tank = insert_returning(SB_WRITE, "tanks", base_tank, returning_fallback_keys={"name": auto_name, "created_by": created_by})
                except Exception as e2:
                    errors_new.append(f"Insert into tanks failed: {e2}")
                    new_tank = None

            if not new_tank:
                if not errors_new or not errors_new[-1].startswith("Insert into tanks failed"):
                    errors_new.append("Insert into tanks returned no row; check RLS or constraints.")
                continue
            elif warn_no_type:
                st.warning("Inserted tank without tank_type (column/enum may not exist yet).")

            tank_uuid = new_tank.get("id_uuid") or new_tank.get("id")
            tank_code = new_tank.get("code") or new_tank.get("tank_code")

            # Insert membership
            membership_base = {}
            if fish_uuid: membership_base["fish_id_uuid"] = fish_uuid
            if isinstance(fish_id, (int, str)) and str(fish_id).isdigit():
                membership_base["fish_id"] = int(fish_id)
            if tank_uuid: membership_base["tank_id_uuid"] = tank_uuid
            tank_id_num = new_tank.get("id")
            if isinstance(tank_id_num, (int, str)) and str(tank_id_num).isdigit():
                membership_base["tank_id"] = int(tank_id_num)

            mem_row, used_time_col, errp = insert_membership_with_time_probe(membership_base)
            if not mem_row:
                errors_new.append(f"Insert into fish_tank_memberships failed: {errp or 'unknown error'}")

            results_new.append({
                "fish_name": fish_name, "fish_code": fish_code, "fish_id_uuid": fish_uuid,
                "tank_code": tank_code, "tank_id_uuid": tank_uuid,
                "tank_type_set": tank_type if not warn_no_type else None
            })

        if results_new:
            st.success(f"Created {len(results_new)} tank(s) and linked fish.")
        if errors_new:
            with st.expander("Errors", expanded=True):
                for e in errors_new:
                    st.error(e)

if results_new:
    st.dataframe(pd.DataFrame(results_new), use_container_width=True)
