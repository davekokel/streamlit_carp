
import uuid
from datetime import datetime
from typing import Dict, List, Optional, Tuple
import pandas as pd
import streamlit as st
from supabase import create_client, Client

st.set_page_config(page_title="Link Fish ⇄ Tanks — Create or Move", layout="wide")

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

@st.cache_data(ttl=120)
def load_tanks(limit: int = 50000) -> pd.DataFrame:
    df = safe_select_all("tanks", limit=limit)
    for c in ["id","id_uuid","code","tank_code","name","site_code","location","rack","volume_l"]:
        if c not in df.columns:
            df[c] = None
    return df

fish_df = load_fish()
tanks_df = load_tanks()

# ------------------------ UI: Common settings ------------------------
st.title("Link Fish ⇄ Tanks — Create or Move")

with st.form("global_cfg"):
    c1, c2 = st.columns([1,1])
    with c1:
        created_by = st.text_input("created_by (UUID)", value="00000000-0000-0000-0000-000000000000")
    with c2:
        st.caption("Writes use the service role if present in secrets; otherwise anon/auth per your RLS policies.")
    submitted = st.form_submit_button("Save settings")

tab_new, tab_move = st.tabs(["➕ Create NEW tank(s)", "↔️ Move to EXISTING tank"])

# ------------------------ TAB 1: Create NEW tanks ------------------------
with tab_new:
    st.subheader("Create NEW tank(s) and link selected fish")
    c1, c2, c3 = st.columns([1,1,2])
    with c1:
        site_code = st.selectbox("Site code (enum)", ["NURSERY", "ADULT"], index=0, key="new_site")
        volume_l = st.number_input("Volume (L)", min_value=0.0, max_value=1000.0, value=0.0, step=0.5, key="new_vol")
    with c2:
        location = st.text_input("Location", value=site_code, key="new_loc")
        rack = st.text_input("Rack", value="", key="new_rack")
    with c3:
        name_prefix = st.text_input("Tank name prefix", value="tank of", help="Becomes 'tank of <fish_name> <suffix>'", key="new_prefix")
        notes = st.text_input("Notes", value="", key="new_notes")

    # Fish selector
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

                # Create tank
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

                new_tank = insert_returning(SB_WRITE, "tanks", tank_insert, returning_fallback_keys={"name": tank_name, "created_by": created_by})
                if not new_tank:
                    errors_new.append("Insert into tanks returned no row; check RLS or constraints.")
                    continue

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
                    "op": "create+link",
                    "fish_name": fish_name, "fish_code": fish_code, "fish_id_uuid": fish_uuid,
                    "tank_code": tank_code, "tank_name": tank_name, "tank_id_uuid": tank_uuid
                })

            if results_new:
                st.success(f"Created {len(results_new)} tank(s) and linked fish.")
            if errors_new:
                with st.expander("Errors", expanded=True):
                    for e in errors_new:
                        st.error(e)

    if results_new:
        st.dataframe(pd.DataFrame(results_new), use_container_width=True)

# ------------------------ TAB 2: Move to EXISTING tank ------------------------
with tab_move:
    st.subheader("Move selected fish to ONE existing tank (end-date then link)")
    col_a, col_b = st.columns([1.2, 1.8])
    with col_a:
        tank_search = st.text_input("🔎 Search tanks", "", placeholder="code, name, rack, site_code, …", key="move_tank_search")
        twork = tanks_df.copy()
        if tank_search.strip():
            s = tank_search.lower().strip()
            str_df = twork.fillna("").astype(str)
            mask = str_df.apply(lambda row: s in " ".join(row.values).lower(), axis=1)
            twork = twork.loc[mask].copy()
        tcols = ["_pick","code","tank_code","name","site_code","location","rack","volume_l","id","id_uuid"]
        for c in tcols:
            if c not in twork.columns:
                twork[c] = None
        if "_pick" not in twork.columns:
            twork.insert(0, "_pick", False)
        picked_df = st.data_editor(
            twork[tcols].head(500),
            use_container_width=True,
            column_config={"_pick": st.column_config.CheckboxColumn("Pick")},
            disabled=[c for c in tcols if c not in ["_pick"]],
            hide_index=True,
            key="move_tank_editor"
        )
        picked = picked_df[picked_df.get("_pick", pd.Series(dtype=bool)) == True].copy() if "_pick" in picked_df.columns else pd.DataFrame()
        if len(picked) > 1:
            st.warning("Pick exactly one tank.")
        picked_row = picked.head(1) if not picked.empty else pd.DataFrame()

    with col_b:
        fsearch = st.text_input("🔎 Search fish", "", placeholder="code, name, …", key="move_fish_search")
        fwork = fish_df.copy()
        if fsearch.strip():
            s = fsearch.lower().strip()
            str_df = fwork.fillna("").astype(str)
            mask = str_df.apply(lambda row: s in " ".join(row.values).lower(), axis=1)
            fwork = fwork.loc[mask].copy()
        fcols = ["_select","name","code","sex","status","date_birth","line_building_stage","id","id_uuid"]
        for c in fcols:
            if c not in fwork.columns:
                fwork[c] = None
        if "_select" not in fwork.columns:
            fwork.insert(0, "_select", False)
        fsel = st.data_editor(
            fwork[fcols].head(2000),
            use_container_width=True,
            column_config={"_select": st.column_config.CheckboxColumn("Select")},
            disabled=[c for c in fcols if c not in ["_select"]],
            hide_index=True,
            key="move_fish_editor"
        )
        fish_sel = fsel[fsel.get("_select", pd.Series(dtype=bool)) == True].copy() if "_select" in fsel.columns else pd.DataFrame()
        st.caption(f"Selected fish: {len(fish_sel)}")

    do_move = st.button("Move selected fish → picked tank", key="btn_move")
    results_move: List[Dict] = []
    errors_move: List[str] = []

    if do_move:
        if picked_row.empty:
            st.warning("Pick exactly one tank on the left.")
        elif fish_sel.empty:
            st.warning("Select at least one fish on the right.")
        else:
            tr = picked_row.iloc[0]
            tank_uuid = tr.get("id_uuid") or tr.get("id")
            tank_id_num = tr.get("id")
            tank_code = tr.get("code") or tr.get("tank_code") or tr.get("name")

            for _, row in fish_sel.iterrows():
                fish_name = row.get("name") or ""
                fish_code = row.get("code") or ""
                fish_id = row.get("id")
                fish_uuid = row.get("id_uuid")
                if not fish_uuid and fish_id is None:
                    errors_move.append("Fish row missing id/id_uuid; skipping.")
                    continue

                # End-date current membership(s)
                end_date_active_memberships(fish_uuid, fish_id)

                # Insert membership to existing tank
                membership_base = {}
                if fish_uuid: membership_base["fish_id_uuid"] = fish_uuid
                if isinstance(fish_id, (int, str)) and str(fish_id).isdigit():
                    membership_base["fish_id"] = int(fish_id)
                if tank_uuid: membership_base["tank_id_uuid"] = tank_uuid
                if isinstance(tank_id_num, (int, str)) and str(tank_id_num).isdigit():
                    membership_base["tank_id"] = int(tank_id_num)

                mem_row, used_time_col, errp = insert_membership_with_time_probe(membership_base)
                if not mem_row:
                    errors_move.append(f"Insert into fish_tank_memberships failed: {errp or 'unknown error'}")
                results_move.append({
                    "op": "move→existing",
                    "fish_name": fish_name, "fish_code": fish_code, "fish_id_uuid": fish_uuid,
                    "to_tank": tank_code, "tank_id_uuid": tank_uuid
                })

            if results_move:
                st.success(f"Moved {len(results_move)} fish to {tank_code}.")
            if errors_move:
                with st.expander("Errors", expanded=True):
                    for e in errors_move:
                        st.error(e)

    if results_move:
        st.dataframe(pd.DataFrame(results_move), use_container_width=True)
