
import uuid
from datetime import datetime, timedelta
from typing import Dict, List, Optional
import pandas as pd
import streamlit as st
from supabase import create_client, Client

st.set_page_config(page_title="Link Fish to New Tanks", layout="wide")

# ------------------------ Supabase client ------------------------
@st.cache_resource
def get_sb() -> Client:
    url = st.secrets["supabase"]["url"]
    key = st.secrets["supabase"]["anon_key"]
    return create_client(url, key)

def safe_select_all(table: str, limit: int = 100000) -> pd.DataFrame:
    try:
        res = get_sb().table(table).select("*").limit(limit).execute()
        data = res.data or []
        return pd.DataFrame(data)
    except Exception as e:
        st.error(f"Failed to load {table}: {e}")
        return pd.DataFrame()

def insert_returning(table: str, obj: dict, returning_fallback_keys: Optional[Dict[str, object]] = None) -> Optional[dict]:
    """
    Insert and try to return the inserted row.
    Some supabase-py builds don't support .select() after insert; many still return rows by default.
    If not returned, we try a quick fallback fetch using provided keys.
    """
    try:
        res = get_sb().table(table).insert(obj).execute()
        rows = res.data or []
        if rows:
            return rows[0]
        # Fallback: try to fetch most recent by a unique-ish key set
        if returning_fallback_keys:
            tb = get_sb().table(table).select("*")
            for k, v in returning_fallback_keys.items():
                tb = tb.eq(k, v)
            # Prefer recently created
            tb = tb.order("created_at", desc=True).limit(1)
            res2 = tb.execute()
            rows2 = res2.data or []
            if rows2:
                return rows2[0]
        return None
    except Exception as e:
        st.error(f"Insert failed into {table}: {e}")
        return None

# ------------------------ Data loading ------------------------
@st.cache_data(ttl=60)
def load_fish(limit: int = 50000) -> pd.DataFrame:
    df = safe_select_all("fish", limit=limit)
    # ensure commonly-used columns exist
    for c in ["id","id_uuid","name","code","sex","status","date_birth","line_building_stage"]:
        if c not in df.columns:
            df[c] = None
    # convert datetimes to string for display
    for c in df.columns:
        if pd.api.types.is_datetime64_any_dtype(df[c]):
            df[c] = df[c].astype(str)
    return df

fish_df = load_fish()

# ------------------------ UI: Controls ------------------------
st.title("Link Fish to New Tanks")

with st.sidebar:
    st.header("Tank creation options")
    # Known enum values from your DB (verified earlier)
    site_code = st.selectbox("Site code (enum)", ["NURSERY", "ADULT"], index=0, help="Required. Must be one of the allowed enum values.")
    location = st.text_input("Location", value=site_code, help="Defaults to site code.")
    name_prefix = st.text_input("Tank name prefix", value="Tank for", help="The tank name will become: '<prefix> <fish_code or fish_name or id_uuid>'")
    rack = st.text_input("Rack (optional)", value="")
    volume_l = st.number_input("Volume (L, optional)", min_value=0.0, max_value=1000.0, value=0.0, step=0.5)
    notes = st.text_input("Notes (optional)", value="")
    created_by = st.text_input("created_by (UUID, required)", value="00000000-0000-0000-0000-000000000000", help="Used to satisfy NOT NULL; override with a real user UUID if desired.")
    per_page = st.number_input("Max fish to load", min_value=100, max_value=200000, value=50000, step=1000)
    refresh = st.button("Reload fish")

if refresh:
    st.cache_data.clear()
    fish_df = load_fish(limit=int(per_page))

# ------------------------ Search & select fish ------------------------
search_q = st.text_input("🔎 Search fish (by any visible column)", "", placeholder="e.g., code, name, sex, status, etc.")
work = fish_df.copy()

if search_q.strip():
    s = search_q.strip().lower()
    str_df = work.fillna("").astype(str)
    mask = str_df.apply(lambda row: s in " ".join(row.values).lower(), axis=1)
    work = work.loc[mask].copy()

# prepare selection editor
display_cols = ["_select","code","name","sex","status","date_birth","line_building_stage","id","id_uuid"]
for c in display_cols:
    if c not in work.columns:
        work[c] = None

if "_select" not in work.columns:
    work.insert(0, "_select", False)

# unique column names safeguard
seen = set()
uniq_cols = []
for c in display_cols:
    nc = c
    i = 2
    while nc in seen:
        nc = f"{c}_{i}"
        i += 1
    uniq_cols.append(nc); seen.add(nc)

view = work[uniq_cols].copy()
# map back the special names (we know order)
try:
    # Ensure first column is the checkbox named exactly "_select"
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
                st.error("Fish row missing id/id_uuid; cannot proceed for this fish.")
                continue

            handle = fish_code or fish_name or (str(fish_uuid)[:8] if fish_uuid else str(fish_id))
            suffix = str(uuid.uuid4())[:8]
            tank_name = f"{name_prefix} {handle} {suffix}".strip()

            tank_insert = {
                "name": tank_name,
                "location": location or site_code,
                "site_code": site_code,
                "rack": rack if rack else None,
                "volume_l": volume_l if volume_l else None,
                "notes": notes if notes else None,
                "created_by": created_by,
            }

            # Try to get inserted row back; if not, fallback fetch by (name, created_by) within recent 10 minutes.
            new_tank = insert_returning(
                "tanks",
                tank_insert,
                returning_fallback_keys={"name": tank_name, "created_by": created_by}
            )
            if not new_tank:
                continue

            tank_uuid = new_tank.get("id_uuid") or new_tank.get("id")
            tank_code = new_tank.get("code") or new_tank.get("tank_code")

            # membership link (prefer UUIDs)
            membership = {
                "started_at": datetime.utcnow().isoformat()
            }
            if fish_uuid:
                membership["fish_id_uuid"] = fish_uuid
            if isinstance(fish_id, (int, str)) and str(fish_id).isdigit():
                membership["fish_id"] = int(fish_id)

            if tank_uuid:
                membership["tank_id_uuid"] = tank_uuid
            tank_id_num = new_tank.get("id")
            if isinstance(tank_id_num, (int, str)) and str(tank_id_num).isdigit():
                membership["tank_id"] = int(tank_id_num)

            mem_row = insert_returning("fish_tank_memberships", membership)

            results.append({
                "fish_code": fish_code,
                "fish_name": fish_name,
                "fish_id_uuid": fish_uuid,
                "tank_code": tank_code,
                "tank_name": tank_name,
                "tank_id_uuid": tank_uuid,
                "membership_id": mem_row.get("id") if mem_row else None
            })

        if results:
            st.success(f"Created {len(results)} tank(s) and linked to fish.")
        else:
            st.warning("No tanks were created. Review errors above.")

# ------------------------ Results table ------------------------
if results:
    st.subheader("Results")
    st.dataframe(pd.DataFrame(results), use_container_width=True)

st.caption("Tip: If you need to move fish instead of creating new tanks, we can add a 'move to existing tank' mode with end-dating the previous membership.")
