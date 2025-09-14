
import uuid
from datetime import datetime
from typing import Dict, List, Optional, Tuple
import pandas as pd
import streamlit as st
from supabase import create_client, Client

st.set_page_config(page_title="Link Fish → New Tanks (moves handle overlap)", layout="wide")

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
        return pd.DataFrame(data)
    except Exception as e:
        st.error(f"Failed to load {table}: {e}")
        return pd.DataFrame()

def insert_returning(sb: Client, table: str, obj: dict, returning_fallback_keys: Optional[Dict[str, object]] = None) -> Optional[dict]:
    """
    Insert and try to return the inserted row.
    Some supabase-py builds don't return rows on insert; we fallback to a filtered select.
    """
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
    candidates = ["started_at","started","start_at","started_on", None]
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

def end_date_active_memberships(fish_uuid: Optional[str], fish_id: Optional[int]) -> int:
    """
    Close out any active membership intervals for this fish by setting valid_to=now.
    Returns number of rows updated (best-effort).
    Requires UPDATE permission by RLS.
    """
    ts = datetime.utcnow().isoformat()
    updated = 0
    # Null valid_to
    if fish_uuid:
        SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id_uuid", fish_uuid).is_("valid_to", None).execute()
        updated += 1  # best-effort counter (we don't get affected count easily)
        SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id_uuid", fish_uuid).gt("valid_to", ts).execute()
        updated += 1
    if fish_id is not None:
        try:
            SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id", int(fish_id)).is_("valid_to", None).execute()
            updated += 1
            SB_WRITE.table("fish_tank_memberships").update({"valid_to": ts}).eq("fish_id", int(fish_id)).gt("valid_to", ts).execute()
            updated += 1
        except Exception:
            pass
    return updated

# ------------------------ Data loading ------------------------
@st.cache_data(ttl=120)
def load_fish(limit: int = 50000) -> pd.DataFrame:
    df = safe_select_all("fish", limit=limit)
    for c in ["id","id_uuid","name","code","sex","status","date_birth","line_building_stage"]:
        if c not in df.columns:
            df[c] = None
    for c in df.columns:
        if pd.api.types.is_datetime64_any_dtype(df[c]):
            df[c] = df[c].astype(str)
    return df

fish_df = load_fish()

# ------------------------ UI: Controls in MAIN column ------------------------
st.title("Link Fish → New Tanks")

with st.form("create_cfg"):
    st.subheader("Tank creation settings")
    c1, c2, c3 = st.columns([1,1,2])
    with c1:
        site_code = st.selectbox("Site code (enum)", ["NURSERY", "ADULT"], index=0)
        volume_l = st.number_input("Volume (L)", min_value=0.0, max_value=1000.0, value=0.0, step=0.5)
    with c2:
        location = st.text_input("Location", value=site_code, help="Often same as site_code")
        rack = st.text_input("Rack", value="")
    with c3:
        name_prefix = st.text_input("Tank name prefix", value="tank of", help="Tank name: '<prefix> <fish_name|fish_code|uuid8>'")
        notes = st.text_input("Notes", value="")
    c4, c5 = st.columns([1,3])
    with c4:
        created_by = st.text_input("created_by (UUID)", value="00000000-0000-0000-0000-000000000000")
    with c5:
        st.caption("If RLS blocks writes, either use a service role server-side or add update/insert policies for anon/authenticated.")
    submitted = st.form_submit_button("Save settings")

# ------------------------ Search & select fish ------------------------
search_q = st.text_input("🔎 Search fish", "", placeholder="code, name, sex, status, …")
work = fish_df.copy()
if search_q.strip():
    s = search_q.lower().strip()
    str_df = work.fillna("").astype(str)
    mask = str_df.apply(lambda row: s in " ".join(row.values).lower(), axis=1)
    work = work.loc[mask].copy()

display_cols = ["_select","code","name","sex","status","date_birth","line_building_stage","id","id_uuid"]
for c in display_cols:
    if c not in work.columns:
        work[c] = None
if "_select" not in work.columns:
    work.insert(0, "_select", False)

# Ensure unique col names for editor
seen = set(); uniq_cols = []
for c in display_cols:
    i = 1; nc = c
    while nc in seen:
        i += 1; nc = f"{c}_{i}"
    seen.add(nc); uniq_cols.append(nc)
view = work[uniq_cols].copy()
try:
    view.columns = ["_select"] + list(view.columns[1:])
except Exception:
    pass

st.subheader(f"Fish — {len(view)} row(s)")
edited = st.data_editor(
    view.head(2000),
    use_container_width=True,
    column_config={"_select": st.column_config.CheckboxColumn("Select")},
    disabled=[c for c in view.columns if c not in ["_select"]],
    hide_index=True,
    key="fish_editor"
)
selected = edited[edited.get("_select", pd.Series(dtype=bool)) == True].copy() if "_select" in edited.columns else pd.DataFrame()
st.caption(f"Selected fish: {len(selected)}")

# ------------------------ Action: Create tanks + memberships ------------------------
st.markdown("---")
do_create = st.button("Create new Tanks for selected Fish and link them")

results: List[Dict] = []
errors: List[str] = []

if do_create:
    if selected.empty:
        st.warning("Select at least one fish in the table above.")
    else:
        for _, row in selected.iterrows():
            fish_code = row.get("code") or ""
            fish_name = row.get("name") or ""
            fish_id = row.get("id")
            fish_uuid = row.get("id_uuid")
            if not fish_uuid and fish_id is None:
                errors.append("Fish row missing id/id_uuid; skipping.")
                continue

            # Close active membership(s) to satisfy non-overlap constraint
            try:
                end_date_active_memberships(fish_uuid, fish_id)
            except Exception as e:
                errors.append(f"Update memberships (end-date) failed by RLS: {e}")

            # Build tank
            handle_core = fish_name or fish_code or (str(fish_uuid)[:8] if fish_uuid else str(fish_id))
            suffix = str(uuid.uuid4())[:8]
            tank_name = f"{name_prefix} {handle_core} {suffix}".strip()

            tank_insert = {
                "name": tank_name,
                "location": location or site_code,
                "site_code": site_code,
                "rack": rack if rack else None,
                "volume_l": volume_l if volume_l else None,
                "notes": notes if notes else None,
                "created_by": created_by,
            }

            # Insert tank
            try:
                new_tank = insert_returning(
                    SB_WRITE, "tanks", tank_insert,
                    returning_fallback_keys={"name": tank_name, "created_by": created_by}
                )
            except Exception as e:
                errors.append(f"Insert into tanks failed: {e}")
                continue

            if not new_tank:
                errors.append("Insert into tanks returned no row; check RLS or constraints.")
                continue

            tank_uuid = new_tank.get("id_uuid") or new_tank.get("id")
            tank_code = new_tank.get("code") or new_tank.get("tank_code")

            # Insert new membership with valid_from=now (matches exclusion constraint uses tstzrange(valid_from, coalesce(valid_to, 'infinity')) )
            ts_now = datetime.utcnow().isoformat()
            membership_base = {}
            if fish_uuid: membership_base["fish_id_uuid"] = fish_uuid
            if isinstance(fish_id, (int, str)) and str(fish_id).isdigit():
                membership_base["fish_id"] = int(fish_id)
            if tank_uuid: membership_base["tank_id_uuid"] = tank_uuid
            tank_id_num = new_tank.get("id")
            if isinstance(tank_id_num, (int, str)) and str(tank_id_num).isdigit():
                membership_base["tank_id"] = int(tank_id_num)

            # Try preferred schema: valid_from
            mem_row = None
            used_time_col = None
            try:
                payload = dict(membership_base)
                payload["valid_from"] = ts_now
                mem_row = insert_returning(SB_WRITE, "fish_tank_memberships", payload)
                used_time_col = "valid_from"
            except Exception as e:
                # Fallback to probe
                mem_row, used_time_col, errp = insert_membership_with_time_probe(membership_base)
                if not mem_row:
                    errors.append(f"Insert into fish_tank_memberships failed: {errp or str(e)}")

            results.append({
                "fish_code": fish_code,
                "fish_name": fish_name,
                "fish_id_uuid": fish_uuid,
                "tank_code": tank_code,
                "tank_name": tank_name,
                "tank_id_uuid": tank_uuid,
                "membership_id": mem_row.get("id") if isinstance(mem_row, dict) else None,
                "membership_time_col_used": used_time_col
            })

        if results:
            st.success(f"Created {len(results)} tank(s) and linked to fish.")
        if errors:
            with st.expander("Errors & policy tips", expanded=True):
                for e in errors:
                    st.error(e)
                st.markdown("""
If you see **RLS update** errors while ending old memberships, allow `UPDATE` on the join table (paste into terminal):

```bash
cat <<'SQL' | psql "$STAGING_DB_URL" -v ON_ERROR_STOP=1
drop policy if exists ftm_update_anon_all on public.fish_tank_memberships;
create policy ftm_update_anon_all on public.fish_tank_memberships
for update to anon
using (true)
with check (true);
SQL
```

Then retry creating tanks again.
                """)

# ------------------------ Results table ------------------------
if results:
    st.subheader("Results")
    df_res = pd.DataFrame(results)
    st.dataframe(df_res, use_container_width=True)
    st.download_button("Download results CSV", df_res.to_csv(index=False), file_name="new_tanks_links.csv", mime="text/csv")
