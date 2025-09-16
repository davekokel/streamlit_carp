import os
from datetime import datetime, timezone, date
from uuid import uuid4
import re
import pandas as pd
import streamlit as st
from supabase import create_client
from postgrest import APIError

st.set_page_config(page_title="Fish → Tanks Wizard (v14: membership id_uuid)", layout="wide")

ZERO_UID = "00000000-0000-0000-0000-000000000000"
TANK_TYPES = ["2L","4L","6L"]

@st.cache_resource(show_spinner=False)
def get_client():
    url = os.environ.get("SUPABASE_URL") or st.secrets["supabase"]["url"]
    key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or st.secrets["supabase"]["service_role_key"]
    return create_client(url, key)

sb = get_client()

def tanks_has(col: str) -> bool:
    try:
        sb.table("tanks").select(col).limit(0).execute()
        return True
    except APIError:
        return False

HAS_TANK_CODE   = tanks_has("tank_code")
HAS_SITE_CODE   = tanks_has("site_code")
HAS_NAME        = tanks_has("name")
HAS_NOTES       = tanks_has("notes")
HAS_TANK_TYPE   = tanks_has("tank_type")
HAS_CODE        = tanks_has("code")

@st.cache_data(ttl=10, show_spinner=False)
def fetch_fish(search: str, limit: int, page: int):
    q = sb.table("fish").select("id_uuid,fish_code,name,date_birth", count="exact")
    if search:
        try:
            q = q.or_(f"name.ilike.%{search}%,fish_code.ilike.%{search}%")
        except Exception:
            q = q.ilike("fish_code", f"%{search}%")
    q = q.order("fish_code")
    res = q.execute()
    data = res.data or []
    total = int(getattr(res, "count", None) or len(data))
    start = (page - 1) * limit
    end = start + limit
    data = data[start:end]
    df = pd.DataFrame(data)
    if not df.empty:
        df["fish_name"] = df.apply(lambda r: (r.get("name") or "").strip() or (r.get("fish_code") or "").strip(), axis=1)
        df["birthday"] = pd.to_datetime(df.get("date_birth"), errors="coerce").dt.date
        df["age_days"] = (pd.to_datetime(date.today()) - pd.to_datetime(df["birthday"])).dt.days
    else:
        df = pd.DataFrame(columns=["id_uuid","fish_code","fish_name","birthday","age_days"])
    return df, total

@st.cache_data(ttl=10, show_spinner=False)
def fetch_transgenes_map(fish_uuid_list: list[str]):
    if not fish_uuid_list:
        return {}
    ftg = sb.table("fish_transgenes").select("fish_id_uuid,transgene_id_uuid").in_("fish_id_uuid", fish_uuid_list).execute().data or []
    tg_ids = sorted({r.get("transgene_id_uuid") for r in ftg if r.get("transgene_id_uuid")})
    names_by_uuid = {}
    if tg_ids:
        trows = sb.table("transgenes").select("id_uuid,name,descr").in_("id_uuid", tg_ids).execute().data or []
        for t in trows:
            label = t.get("name") or t.get("descr") or ""
            if t.get("id_uuid"):
                names_by_uuid[t["id_uuid"]] = label
    by_fish = {}
    for r in ftg:
        fuid = r.get("fish_id_uuid")
        tuid = r.get("transgene_id_uuid")
        if fuid and tuid:
            by_fish.setdefault(fuid, set()).add(names_by_uuid.get(tuid, ""))
    for fuid, labels in by_fish.items():
        labs = [x for x in sorted(set(labels)) if x]
        by_fish[fuid] = ", ".join(labs)
    return by_fish

def next_seq_site_yy(site: str, yy: int) -> int:
    site_up = (site or "X").upper()
    yy_str = f"{yy:02d}"
    prefix = f"{site_up}-TANK-{yy_str}-"
    try:
        rows = sb.table("tanks").select("tank_code").ilike("tank_code", prefix + "%").execute().data or []
    except APIError:
        rows = []
    max_n = 0
    for r in rows:
        tc = (r.get("tank_code") or "").upper()
        m = re.match(rf"^{re.escape(site_up)}-TANK-{yy_str}-(\d{{4}})$", tc, flags=re.IGNORECASE)
        if m:
            try:
                max_n = max(max_n, int(m.group(1)))
            except Exception:
                pass
    return max_n + 1

def build_tank_codes(site_by_row: dict[str,str], year4: int) -> dict[str,str]:
    yy = year4 % 100
    out = {}
    by_site = {}
    for key, site in site_by_row.items():
        by_site.setdefault((site or "X").upper(), []).append(key)
    for site_up, keys in by_site.items():
        start = next_seq_site_yy(site_up, yy)
        for i, key in enumerate(sorted(keys), start=start):
            out[key] = f"{site_up}-TANK-{yy:02d}-{i:04d}"
    return out

def infer_site_by_age(age_days: float, juvenile_cutoff: int) -> str:
    if age_days is None:
        return "NURSERY"
    return "NURSERY" if age_days < juvenile_cutoff else "ADULT"

st.title("Fish → Tanks Wizard (membership id_uuid)")

with st.sidebar:
    st.header("Find fish")
    server_search = st.text_input("Server-side search (name or code)")
    limit = st.number_input("Rows per page", value=200, min_value=50, max_value=2000, step=50)
    page = st.number_input("Page", min_value=1, value=1, step=1)

    st.header("Tank settings")
    tank_type = st.selectbox("Tank type (tank_type enum)", TANK_TYPES, index=1)
    notes = st.text_input("Notes", value="")

    st.header("Age → Site mapping (NURSERY/ADULT)")
    juvenile_cutoff = st.number_input("Juvenile cutoff (days): < cutoff → NURSERY, otherwise ADULT", min_value=1, value=90, step=1)
    st.caption("Allowed site_code values: NURSERY, ADULT")

df, total = fetch_fish(server_search, int(limit), int(page))
st.caption(f"Showing {len(df)} of {total} fish (page {page})")

if df.empty:
    st.info("No fish match your filters.")
    st.stop()

tg_map = fetch_transgenes_map(df["id_uuid"].dropna().astype(str).tolist())
df["transgenes"] = df["id_uuid"].map(tg_map).fillna("")

view = df[["fish_code","fish_name","birthday","age_days","transgenes","id_uuid"]].copy().reset_index(drop=True)

global_q = st.text_input("Global search (filters name, code, transgenes, birthday)", key="global_q")
if global_q:
    hay = (view["fish_code"].fillna("") + " " + view["fish_name"].fillna("") + " " +
           view["transgenes"].fillna("") + " " + view["birthday"].astype(str).fillna(""))
    mask = hay.str.contains(global_q, case=False, na=False)
    view = view[mask].reset_index(drop=True)

if "fish_selection" not in st.session_state:
    st.session_state.fish_selection = set()

left, mid, right = st.columns([1,1,6])
with left:
    if st.button("Select all (page)"):
        st.session_state.fish_selection |= set(view["id_uuid"].astype(str))
with mid:
    if st.button("Clear all (page)"):
        st.session_state.fish_selection -= set(view["id_uuid"].astype(str))

view.insert(0, "selected", False)
view["selected"] = view["id_uuid"].astype(str).isin(st.session_state.fish_selection)

edited = st.data_editor(
    view[["selected","fish_code","fish_name","birthday","age_days","transgenes","id_uuid"]],
    use_container_width=True,
    hide_index=True,
    height=min(720, 160 + 28 * (len(view) + 1)),
    column_config={
        "selected": st.column_config.CheckboxColumn(required=False),
        "fish_code": st.column_config.TextColumn(disabled=True),
        "fish_name": st.column_config.TextColumn(disabled=True),
        "birthday": st.column_config.DateColumn(disabled=True),
        "age_days": st.column_config.NumberColumn(disabled=True),
        "transgenes": st.column_config.TextColumn(disabled=True),
        "id_uuid": st.column_config.TextColumn(disabled=True),
    },
    key="fish_editor",
)

page_sel = set(edited.loc[edited["selected"], "id_uuid"].astype(str))
st.session_state.fish_selection -= set(view["id_uuid"].astype(str)) - page_sel
st.session_state.fish_selection |= page_sel

sel_ids = sorted(st.session_state.fish_selection)
st.subheader("Selection")
st.write(f"Selected: **{len(sel_ids)}** fish")

if sel_ids:
    sel_df = view[view["id_uuid"].astype(str).isin(sel_ids)][["fish_code","fish_name","birthday","age_days","id_uuid"]].copy()

    planned_site = [infer_site_by_age(row.get("age_days"), int(juvenile_cutoff)) for _, row in sel_df.iterrows()]
    site_by_rowkey = {str(i): s for i, s in enumerate(planned_site)}

    year4 = datetime.now().year
    tank_code_map = build_tank_codes(site_by_rowkey, year4)

    preview = pd.DataFrame({
        "fish_code": sel_df["fish_code"].tolist(),
        "fish_name": sel_df["fish_name"].tolist(),
        "birthday": sel_df["birthday"].astype(str).tolist(),
        "age_days": sel_df["age_days"].tolist(),
        "site_code (DB)": planned_site,
        "tank_code (DB, also name/code)": [tank_code_map[str(i)] for i in range(len(sel_df))],
    })
    st.dataframe(preview, use_container_width=True, hide_index=True)
    st.download_button("Download preview CSV", data=preview.to_csv(index=False).encode("utf-8"),
                       file_name="fish_to_tanks_preview.csv", mime="text/csv", use_container_width=True)

create = st.button("Create tanks and link memberships", type="primary", use_container_width=True, disabled=(not sel_ids))

if create and sel_ids:
    sel_df = view[view["id_uuid"].astype(str).isin(sel_ids)][["fish_code","fish_name","birthday","age_days","id_uuid"]].copy()

    planned_site = [infer_site_by_age(row.get("age_days"), int(juvenile_cutoff)) for _, row in sel_df.iterrows()]
    site_by_rowkey = {str(i): s for i, s in enumerate(planned_site)}
    year4 = datetime.now().year
    tank_code_map = build_tank_codes(site_by_rowkey, year4)

    rows = []
    codes = []
    for i, (_, row) in enumerate(sel_df.iterrows()):
        tank_code = tank_code_map[str(i)]
        site_code = site_by_rowkey[str(i)]
        payload = {
            "tank_code": tank_code,
            "site_code": site_code,
            "name": tank_code,
            "created_by": ZERO_UID,
        }
        if HAS_TANK_TYPE and tank_type:
            payload["tank_type"] = tank_type
        if HAS_NOTES and notes:
            payload["notes"] = notes
        if HAS_CODE:
            payload["code"] = tank_code
        rows.append(payload)
        codes.append(tank_code)

    try:
        sb.table("tanks").upsert(rows, on_conflict="tank_code").execute()
    except APIError as e:
        st.error(f"Supabase error (tanks upsert): {getattr(e, 'message', str(e))}")
        st.stop()

    # Fetch tank UUIDs
    try:
        sel_tanks = sb.table("tanks").select("id_uuid,tank_code").in_("tank_code", codes).execute()
        tank_by_code = {r["tank_code"]: r for r in (sel_tanks.data or []) if r.get("tank_code")}
    except APIError as e:
        st.error(f"Supabase error (fetch tanks): {getattr(e, 'message', str(e))}")
        st.stop()

    # Prepare membership rows with client-generated id_uuid
    now = datetime.now(timezone.utc).isoformat()
    link_rows = []
    for i, (_, row) in enumerate(sel_df.iterrows()):
        tank_code = codes[i]
        tid = tank_by_code.get(tank_code, {}).get("id_uuid")
        fuid = str(row["id_uuid"])
        if tid and fuid:
            link_rows.append({
                "id_uuid": str(uuid4()),
                "fish_id_uuid": fuid,
                "tank_id_uuid": tid,
                "valid_from": now,
                "created_by": ZERO_UID
            })

    if link_rows:
        # De-dup existing
        fuuids = sorted({r["fish_id_uuid"] for r in link_rows})
        tuuids = sorted({r["tank_id_uuid"] for r in link_rows})
        try:
            existing = sb.table("fish_tank_memberships") \
                         .select("fish_id_uuid,tank_id_uuid") \
                         .in_("fish_id_uuid", fuuids) \
                         .in_("tank_id_uuid", tuuids) \
                         .execute().data or []
        except APIError:
            existing = []
        existing_pairs = {(r.get("fish_id_uuid"), r.get("tank_id_uuid")) for r in existing}
        to_insert = [r for r in link_rows if (r["fish_id_uuid"], r["tank_id_uuid"]) not in existing_pairs]

        if to_insert:
            try:
                sb.table("fish_tank_memberships").insert(to_insert).execute()
            except APIError:
                # Fallback one-by-one
                succeeded = 0
                last_err = None
                for r in to_insert:
                    try:
                        sb.table("fish_tank_memberships").insert(r).execute()
                        succeeded += 1
                    except APIError as e2:
                        last_err = e2
                if succeeded == 0 and last_err:
                    st.error(f"Supabase error (link memberships insert): {getattr(last_err, 'message', str(last_err))}")
                    st.stop()

    out = pd.DataFrame([{
        "tank_code": c,
        "site_code": site_by_rowkey[str(i)],
        "tank_id_uuid": tank_by_code.get(c, {}).get("id_uuid"),
    } for i, c in enumerate(codes)]).sort_values("tank_code")
    st.success(f"Created/updated {len(codes)} tank(s) and linked {len(sel_ids)} fish (skipped any existing links).")
    st.dataframe(out, use_container_width=True, hide_index=True)
    st.download_button("Download created tanks CSV", data=out.to_csv(index=False).encode("utf-8"),
                       file_name="created_tanks.csv", mime="text/csv", use_container_width=True)
