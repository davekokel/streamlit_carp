import streamlit as st
import pandas as pd
from auth import auth_ui, sign_out
from utils_auth import ensure_auth, sign_out_and_clear

st.set_page_config(page_title="Assign Mom & Dad + Links", page_icon="🐟", layout="wide")
st.title("🐟 Assign Mom & Dad + Linked Data")

sb, user = ensure_auth(auth_ui)

FISH_SELECT = ["id","name","date_birth","notes","mother_fish_id","father_fish_id","line_building_stage","created_at","fish_code","created_by"]
FISH_SEARCH = ["name","notes","fish_code","line_building_stage"]
DEFAULT_HEIGHT = 500

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

col_actions = st.columns([1,1,3,3])
with col_actions[0]:
    if st.button("Swap Mom/Dad"):
        st.session_state.mom_is_a = not st.session_state.mom_is_a
with col_actions[1]:
    choice = st.radio("Who is Mom?", ["A","B"], index=0 if st.session_state.mom_is_a else 1, horizontal=True)
    st.session_state.mom_is_a = (choice == "A")

mom = a if st.session_state.mom_is_a else b
dad = b if st.session_state.mom_is_a else a

def record_table(df_row):
    return pd.DataFrame(df_row).reset_index().rename(columns={"index":"field",0:"value"})

mom_id = int(mom["id"])
dad_id = int(dad["id"])

mom_tg = fetch_transgenes_for_fish(mom_id)
dad_tg = fetch_transgenes_for_fish(dad_id)

mom_mut = fetch_table_rows_by_fish("fish_mutations", mom_id)
dad_mut = fetch_table_rows_by_fish("fish_mutations", dad_id)

mom_phen = fetch_table_rows_by_fish("fish_selectedphenotypes", mom_id)
dad_phen = fetch_table_rows_by_fish("fish_selectedphenotypes", dad_id)

mom_strain = fetch_table_rows_by_fish("fish_strains", mom_id)
dad_strain = fetch_table_rows_by_fish("fish_strains", dad_id)

mom_treat = fetch_table_rows_by_fish("fish_treatments", mom_id)
dad_treat = fetch_table_rows_by_fish("fish_treatments", dad_id)

mom_mounts = fetch_table_rows_by_fish("fish_mounts", mom_id)
dad_mounts = fetch_table_rows_by_fish("fish_mounts", dad_id)

mom_tanks = fetch_table_rows_by_fish("tanks", mom_id)
dad_tanks = fetch_table_rows_by_fish("tanks", dad_id)

c1, c2 = st.columns(2)

with c1:
    st.subheader(f"Mom #{mom.get('id')}")
    st.table(record_table(mom))
    with st.expander("Transgenes", expanded=True):
        st.dataframe(mom_tg if not mom_tg.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=220)
    with st.expander("Mutations", expanded=False):
        st.dataframe(mom_mut if not mom_mut.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Phenotypes", expanded=False):
        st.dataframe(mom_phen if not mom_phen.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Strains", expanded=False):
        st.dataframe(mom_strain if not mom_strain.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Treatments", expanded=False):
        st.dataframe(mom_treat if not mom_treat.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Mounts", expanded=False):
        st.dataframe(mom_mounts if not mom_mounts.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Tanks", expanded=False):
        st.dataframe(mom_tanks if not mom_tanks.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)

with c2:
    st.subheader(f"Dad #{dad.get('id')}")
    st.table(record_table(dad))
    with st.expander("Transgenes", expanded=True):
        st.dataframe(dad_tg if not dad_tg.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=220)
    with st.expander("Mutations", expanded=False):
        st.dataframe(dad_mut if not dad_mut.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Phenotypes", expanded=False):
        st.dataframe(dad_phen if not dad_phen.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Strains", expanded=False):
        st.dataframe(dad_strain if not dad_strain.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Treatments", expanded=False):
        st.dataframe(dad_treat if not dad_treat.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Mounts", expanded=False):
        st.dataframe(dad_mounts if not dad_mounts.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)
    with st.expander("Tanks", expanded=False):
        st.dataframe(dad_tanks if not dad_tanks.empty else pd.DataFrame({"info":["none"]}), use_container_width=True, height=200)

st.divider()
st.subheader("Assigned Parents")
st.write({"mom_id": mom_id, "dad_id": dad_id, "mom_name": mom.get("name"), "dad_name": dad.get("name"), "mom_fish_code": mom.get("fish_code"), "dad_fish_code": dad.get("fish_code")})
