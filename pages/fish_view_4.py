import streamlit as st
import pandas as pd
from auth import auth_ui, sign_out
from utils_auth import ensure_auth, sign_out_and_clear

st.set_page_config(page_title="Assign Mom & Dad + Compact Tables", page_icon="🐟", layout="wide")
st.title("🐟 Assign Mom & Dad + Compact Tables")

sb, user = ensure_auth(auth_ui)

FISH_SELECT = ["id","name","date_birth","notes","mother_fish_id","father_fish_id","line_building_stage","created_at","fish_code","created_by"]
FISH_SEARCH = ["name","notes","fish_code","line_building_stage"]
DEFAULT_HEIGHT = 480

@st.cache_data(show_spinner=False)
def fetch_fish(term, limit=500):
    cols = ",".join(FISH_SELECT)
    q = sb.table("fish").select(cols).order("created_at", desc=True).limit(limit)
    if term:
        ors = ",".join([f"{c}.ilike.%{term}%" for c in FISH_SEARCH])
        q = q.or_(ors)
    data = q.execute().data or []
    return pd.DataFrame(data)

@st.cache_data(show_spinner=False)
def fetch_table_rows_by_fish(table: str, fish_id: int, select_cols: str = "*", order_col: str | None = None, desc: bool = True, limit: int = 500):
    q = sb.table(table).select(select_cols).eq("fish_id", fish_id).limit(limit)
    if order_col:
        q = q.order(order_col, desc=desc)
    return pd.DataFrame(q.execute().data or [])

@st.cache_data(show_spinner=False)
def fetch_transgenes_for_fish(fish_id: int):
    link_rows = sb.table("fish_transgenes").select("transgene_id,created_at").eq("fish_id", fish_id).execute().data or []
    tg_ids = sorted({r["transgene_id"] for r in link_rows if r.get("transgene_id") is not None})
    if not tg_ids:
        return pd.DataFrame(columns=["id","name","type","plasmid_id","description","created_at","created_by"])
    tg = sb.table("transgenes").select("*").in_("id", tg_ids).order("name", desc=False).execute().data or []
    df_tg = pd.DataFrame(tg)
    df_link = pd.DataFrame(link_rows)
    if not df_link.empty and not df_tg.empty and "transgene_id" in df_link.columns:
        df_tg = df_tg.merge(df_link.rename(columns={"transgene_id":"id"}), on="id", how="left", suffixes=("","_linked"))
    return df_tg

def pick_display_column(df: pd.DataFrame):
    for c in ["name","label","description","id"]:
        if c in df.columns:
            return c
    return df.columns[0] if len(df.columns) else None

def summarize_list(df: pd.DataFrame, max_items: int = 10):
    if df is None or df.empty:
        return {"count": 0, "items": ""}
    col = pick_display_column(df)
    if not col:
        return {"count": len(df), "items": ""}
    vals = [str(v) for v in df[col].astype(str).tolist() if str(v)]
    head = ", ".join(vals[:max_items])
    if len(vals) > max_items:
        head += f" …(+{len(vals)-max_items})"
    return {"count": len(vals), "items": head}

def bundle_parent(fish_row: pd.Series):
    fid = int(fish_row["id"])
    tg = fetch_transgenes_for_fish(fid)
    mut = fetch_table_rows_by_fish("fish_mutations", fid)
    phen = fetch_table_rows_by_fish("fish_selectedphenotypes", fid)
    strain = fetch_table_rows_by_fish("fish_strains", fid)
    treat = fetch_table_rows_by_fish("fish_treatments", fid)
    mounts = fetch_table_rows_by_fish("fish_mounts", fid)
    tanks = fetch_table_rows_by_fish("tanks", fid)
    summary = {
        "fish_id": fish_row.get("id"),
        "name": fish_row.get("name"),
        "fish_code": fish_row.get("fish_code"),
        "date_birth": fish_row.get("date_birth"),
        "line_building_stage": fish_row.get("line_building_stage"),
        "transgenes_count": summarize_list(tg)["count"],
        "transgenes_items": summarize_list(tg)["items"],
        "mutations_count": summarize_list(mut)["count"],
        "mutations_items": summarize_list(mut)["items"],
        "phenotypes_count": summarize_list(phen)["count"],
        "phenotypes_items": summarize_list(phen)["items"],
        "strains_count": summarize_list(strain)["count"],
        "strains_items": summarize_list(strain)["items"],
        "treatments_count": summarize_list(treat)["count"],
        "treatments_items": summarize_list(treat)["items"],
        "mounts_count": summarize_list(mounts)["count"],
        "mounts_items": summarize_list(mounts)["items"],
        "tanks_count": summarize_list(tanks)["count"],
        "tanks_items": summarize_list(tanks)["items"],
    }
    return summary

with st.sidebar:
    term = st.text_input("Search fish", placeholder="name, notes, code, stage")
    st.caption(f"Signed in as {(user or {}).get('email','')}")
    if st.button("Sign out"):
        sign_out_and_clear(sign_out)
        st.rerun()

df = fetch_fish(term)
if df.empty:
    st.info("No matches.")
    st.stop()

if "pick_state" not in st.session_state or len(st.session_state.pick_state) != len(df):
    st.session_state.pick_state = [False] * len(df)

df_display = df.copy()
df_display.insert(0, "pick", st.session_state.pick_state)

ed = st.data_editor(
    df_display,
    hide_index=True,
    use_container_width=True,
    height=DEFAULT_HEIGHT,
    disabled={c: True for c in df_display.columns if c != "pick"},
    column_config={"pick": st.column_config.CheckboxColumn("Select")},
    key="fish_editor",
)

picks = ed["pick"].tolist()
st.session_state.pick_state = picks
picked_idx = [i for i, v in enumerate(picks) if v]

if len(picked_idx) < 2:
    st.warning("Select two rows to assign Mom & Dad.")
    st.stop()
if len(picked_idx) > 2:
    st.error("You selected more than two. Uncheck until only two remain.")
    st.stop()

a_idx, b_idx = picked_idx[0], picked_idx[1]
a, b = df.iloc[a_idx], df.iloc[b_idx]

if "mom_is_a" not in st.session_state:
    st.session_state.mom_is_a = True

col_actions = st.columns([1,3,3])
with col_actions[0]:
    if st.button("Swap Mom/Dad"):
        st.session_state.mom_is_a = not st.session_state.mom_is_a

mom = a if st.session_state.mom_is_a else b
dad = b if st.session_state.mom_is_a else a

mom_summary = bundle_parent(mom)
dad_summary = bundle_parent(dad)

c1, c2 = st.columns(2)
with c1:
    st.subheader(f"Mom #{mom.get('id')}")
    st.table(pd.DataFrame([mom_summary]).T.rename(columns={0:"value"}))
with c2:
    st.subheader(f"Dad #{dad.get('id')}")
    st.table(pd.DataFrame([dad_summary]).T.rename(columns={0:"value"}))

st.divider()
st.subheader("Assigned Parents")
st.table(pd.DataFrame([mom_summary, dad_summary]).set_index("fish_id"))
