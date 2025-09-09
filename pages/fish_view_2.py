import streamlit as st
import pandas as pd
from auth import auth_ui, sign_out
from utils_auth import ensure_auth, sign_out_and_clear

st.set_page_config(page_title="Assign Mom & Dad", page_icon="🐟", layout="wide")
st.title("🐟 Assign Mom & Dad")

sb, user = ensure_auth(auth_ui)

SELECT_COLUMNS = ["id","name","date_birth","notes","mother_fish_id","father_fish_id","line_building_stage","created_at","fish_code","created_by"]
SEARCHABLE_COLUMNS = ["name","notes","fish_code","line_building_stage"]
DEFAULT_HEIGHT = 500

@st.cache_data(show_spinner=False)
def fetch_fish(term, limit=500):
    cols = ",".join(SELECT_COLUMNS)
    q = sb.table("fish").select(cols).order("created_at", desc=True).limit(limit)
    if term:
        ors = ",".join([f"{c}.ilike.%{term}%" for c in SEARCHABLE_COLUMNS])
        q = q.or_(ors)
    data = q.execute().data or []
    return pd.DataFrame(data)

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

c1, c2 = st.columns(2)
with c1:
    st.subheader(f"Mom #{mom.get('id')}")
    st.table(pd.DataFrame(mom).reset_index().rename(columns={"index":"field",0:"value"}))
with c2:
    st.subheader(f"Dad #{dad.get('id')}")
    st.table(pd.DataFrame(dad).reset_index().rename(columns={"index":"field",0:"value"}))

st.divider()
st.subheader("Summary")
st.write({
    "mom_id": mom.get("id"),
    "dad_id": dad.get("id"),
    "mom_name": mom.get("name"),
    "dad_name": dad.get("name"),
    "mom_fish_code": mom.get("fish_code"),
    "dad_fish_code": dad.get("fish_code")
})
