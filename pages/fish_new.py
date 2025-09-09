import streamlit as st
import pandas as pd
from datetime import date
from auth import auth_ui, sign_out
from utils_auth import ensure_auth, sign_out_and_clear

st.set_page_config(page_title="Assign Mom & Dad + New Fish", page_icon="🐟", layout="wide")
st.title("🐟 Assign Mom & Dad + New Fish")

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
def fetch_transgenes_for_fish(fish_id: int):
    link_rows = sb.table("fish_transgenes").select("transgene_id,created_at").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["transgene_id"] for r in link_rows if r.get("transgene_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","type","plasmid_id","description","created_at","created_by"])
    tgt = sb.table("transgenes").select("id,name,type,plasmid_id,description,created_at,created_by").in_("id", ids).order("name", desc=False).execute().data or []
    return pd.DataFrame(tgt)

@st.cache_data(show_spinner=False)
def fetch_strains_for_fish(fish_id: int):
    link = sb.table("fish_strains").select("strain_id").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["strain_id"] for r in link if r.get("strain_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","description"])
    out = sb.table("strains").select("id,name,description").in_("id", ids).order("name").execute().data or []
    return pd.DataFrame(out)

@st.cache_data(show_spinner=False)
def fetch_mutations_for_fish(fish_id: int):
    link = sb.table("fish_mutations").select("mutation_id").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["mutation_id"] for r in link if r.get("mutation_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","gene","notes"])
    out = sb.table("mutations").select("id,name,gene,notes").in_("id", ids).order("name").execute().data or []
    return pd.DataFrame(out)

@st.cache_data(show_spinner=False)
def fetch_selectedphenotypes_for_fish(fish_id: int):
    link = sb.table("fish_selectedphenotypes").select("selectedphenotype_id").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["selectedphenotype_id"] for r in link if r.get("selectedphenotype_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","type","description"])
    out = sb.table("selectedphenotypes").select("id,name,type,description").in_("id", ids).order("name").execute().data or []
    return pd.DataFrame(out)

@st.cache_data(show_spinner=False)
def fetch_treatments_for_fish(fish_id: int):
    link = sb.table("fish_treatments").select("treatment_id").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["treatment_id"] for r in link if r.get("treatment_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","type","description"])
    out = sb.table("treatments").select("id,name,type,description").in_("id", ids).order("name").execute().data or []
    return pd.DataFrame(out)

@st.cache_data(show_spinner=False)
def fetch_mounts_for_fish(fish_id: int):
    link = sb.table("fish_mounts").select("mount_id").eq("fish_id", fish_id).execute().data or []
    ids = sorted({r["mount_id"] for r in link if r.get("mount_id") is not None})
    if not ids:
        return pd.DataFrame(columns=["id","name","type","description"])
    out = sb.table("mounts").select("id,name,type,description").in_("id", ids).order("name").execute().data or []
    return pd.DataFrame(out)

@st.cache_data(show_spinner=False)
def fetch_tanks_for_fish(fish_id: int):
    out = sb.table("tanks").select("id,name,location,description,created_at").eq("fish_id", fish_id).order("created_at", desc=True).execute().data or []
    return pd.DataFrame(out)

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

def summarize_list_on(df: pd.DataFrame, col: str, max_items: int = 10):
    if df is None or df.empty or col not in df.columns:
        return {"count": 0, "items": ""}
    vals = [str(v) for v in df[col].astype(str).tolist() if str(v)]
    head = ", ".join(vals[:max_items])
    if len(vals) > max_items:
        head += f" …(+{len(vals)-max_items})"
    return {"count": len(vals), "items": head}

def parent_summary(fish_row: pd.Series):
    fid = int(fish_row["id"])
    tg = fetch_transgenes_for_fish(fid)
    stn = fetch_strains_for_fish(fid)
    mut = fetch_mutations_for_fish(fid)
    phen = fetch_selectedphenotypes_for_fish(fid)
    trt = fetch_treatments_for_fish(fid)
    mnt = fetch_mounts_for_fish(fid)
    tnk = fetch_tanks_for_fish(fid)
    tg_names = summarize_list_on(tg, "name")
    tg_descs = summarize_list_on(tg, "description")
    return {
        "fish_id": fish_row.get("id"),
        "name": fish_row.get("name"),
        "fish_code": fish_row.get("fish_code"),
        "date_birth": fish_row.get("date_birth"),
        "line_building_stage": fish_row.get("line_building_stage"),
        "transgenes_count": tg_names["count"],
        "transgenes_items": tg_names["items"],
        "transgenes_descriptions": tg_descs["items"],
        "strains_count": summarize_list(stn)["count"],
        "strains_items": summarize_list(stn)["items"],
        "mutations_count": summarize_list(mut)["count"],
        "mutations_items": summarize_list(mut)["items"],
        "phenotypes_count": summarize_list(phen)["count"],
        "phenotypes_items": summarize_list(phen)["items"],
        "treatments_count": summarize_list(trt)["count"],
        "treatments_items": summarize_list(trt)["items"],
        "mounts_count": summarize_list(mnt)["count"],
        "mounts_items": summarize_list(mnt)["items"],
        "tanks_count": summarize_list(tnk)["count"],
        "tanks_items": summarize_list(tnk)["items"],
    }

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

mom_summary = parent_summary(mom)
dad_summary = parent_summary(dad)

c1, c2 = st.columns(2)
with c1:
    st.subheader(f"Mom #{mom.get('id')}")
    st.table(pd.DataFrame([mom_summary]).T.rename(columns={0:"value"}))
with c2:
    st.subheader(f"Dad #{dad.get('id')}")
    st.table(pd.DataFrame([dad_summary]).T.rename(columns={0:"value"}))

st.divider()
st.subheader("Create New Fish")

def to_options(df_obj: pd.DataFrame, label_cols):
    if df_obj is None or df_obj.empty:
        return []
    lbl = None
    for c in label_cols:
        if c in df_obj.columns:
            lbl = c
            break
    if lbl is None:
        lbl = df_obj.columns[0]
    return [(f"{row.get(lbl)} (id={row.get('id')})", int(row.get("id"))) for _, row in df_obj.iterrows() if row.get("id") is not None]

mom_tg_df = fetch_transgenes_for_fish(int(mom["id"]))
dad_tg_df = fetch_transgenes_for_fish(int(dad["id"]))
mom_stn_df = fetch_strains_for_fish(int(mom["id"]))
dad_stn_df = fetch_strains_for_fish(int(dad["id"]))
mom_mut_df = fetch_mutations_for_fish(int(mom["id"]))
dad_mut_df = fetch_mutations_for_fish(int(dad["id"]))
mom_phen_df = fetch_selectedphenotypes_for_fish(int(mom["id"]))
dad_phen_df = fetch_selectedphenotypes_for_fish(int(dad["id"]))
mom_trt_df = fetch_treatments_for_fish(int(mom["id"]))
dad_trt_df = fetch_treatments_for_fish(int(dad["id"]))
mom_mnt_df = fetch_mounts_for_fish(int(mom["id"]))
dad_mnt_df = fetch_mounts_for_fish(int(dad["id"]))

tg_opts = list({v:k for k,v in to_options(pd.concat([mom_tg_df, dad_tg_df], ignore_index=True), ["name"]).items()}.items())
stn_opts = list({v:k for k,v in to_options(pd.concat([mom_stn_df, dad_stn_df], ignore_index=True), ["name"]).items()}.items())
mut_opts = list({v:k for k,v in to_options(pd.concat([mom_mut_df, dad_mut_df], ignore_index=True), ["name"]).items()}.items())
phen_opts = list({v:k for k,v in to_options(pd.concat([mom_phen_df, dad_phen_df], ignore_index=True), ["name"]).items()}.items())
trt_opts = list({v:k for k,v in to_options(pd.concat([mom_trt_df, dad_trt_df], ignore_index=True), ["name"]).items()}.items())
mnt_opts = list({v:k for k,v in to_options(pd.concat([mom_mnt_df, dad_mnt_df], ignore_index=True), ["name"]).items()}.items())

with st.form("new_fish_form", clear_on_submit=False):
    colf1, colf2 = st.columns(2)
    with colf1:
        name_val = st.text_input("Name", value=(mom.get("name") or ""))
        fish_code_val = st.text_input("Fish Code", value="")
        date_birth_val = st.date_input("Date of Birth", value=date.today())
        stage_val = st.text_input("Line Building Stage", value=(dad.get("line_building_stage") or mom.get("line_building_stage") or ""))
    with colf2:
        notes_val = st.text_area("Notes", value="")
        copy_mom_notes = st.checkbox("Include Mom notes", value=False)
        copy_dad_notes = st.checkbox("Include Dad notes", value=False)
    st.markdown("Linked items to add")
    colm1, colm2, colm3 = st.columns(3)
    with colm1:
        tg_sel = st.multiselect("Transgenes", options=[vid for vid,_ in tg_opts], format_func=lambda vid: dict(tg_opts)[vid])
        stn_sel = st.multiselect("Strains", options=[vid for vid,_ in stn_opts], format_func=lambda vid: dict(stn_opts)[vid])
    with colm2:
        mut_sel = st.multiselect("Mutations", options=[vid for vid,_ in mut_opts], format_func=lambda vid: dict(mut_opts)[vid])
        phen_sel = st.multiselect("Selected Phenotypes", options=[vid for vid,_ in phen_opts], format_func=lambda vid: dict(phen_opts)[vid])
    with colm3:
        trt_sel = st.multiselect("Treatments", options=[vid for vid,_ in trt_opts], format_func=lambda vid: dict(trt_opts)[vid])
        mnt_sel = st.multiselect("Mounts", options=[vid for vid,_ in mnt_opts], format_func=lambda vid: dict(mnt_opts)[vid])
    submitted = st.form_submit_button("Create Fish")

if submitted:
    full_notes = notes_val or ""
    if copy_mom_notes and mom.get("notes"):
        full_notes = (full_notes + "\n" + str(mom.get("notes"))).strip() if full_notes else str(mom.get("notes"))
    if copy_dad_notes and dad.get("notes"):
        full_notes = (full_notes + "\n" + str(dad.get("notes"))).strip() if full_notes else str(dad.get("notes"))
    payload = {
        "name": name_val or None,
        "date_birth": str(date_birth_val) if date_birth_val else None,
        "notes": full_notes or None,
        "mother_fish_id": int(mom["id"]),
        "father_fish_id": int(dad["id"]),
        "line_building_stage": stage_val or None,
        "fish_code": fish_code_val or None,
        "created_by": (user or {}).get("email") or None,
    }
    try:
        new_row = sb.table("fish").insert(payload).select("id").single().execute()
        new_id = int(new_row.data["id"])
        if tg_sel:
            sb.table("fish_transgenes").insert([{"fish_id": new_id, "transgene_id": i} for i in tg_sel]).execute()
        if stn_sel:
            sb.table("fish_strains").insert([{"fish_id": new_id, "strain_id": i} for i in stn_sel]).execute()
        if mut_sel:
            sb.table("fish_mutations").insert([{"fish_id": new_id, "mutation_id": i} for i in mut_sel]).execute()
        if phen_sel:
            sb.table("fish_selectedphenotypes").insert([{"fish_id": new_id, "selectedphenotype_id": i} for i in phen_sel]).execute()
        if trt_sel:
            sb.table("fish_treatments").insert([{"fish_id": new_id, "treatment_id": i} for i in trt_sel]).execute()
        if mnt_sel:
            sb.table("fish_mounts").insert([{"fish_id": new_id, "mount_id": i} for i in mnt_sel]).execute()
        st.success(f"Created fish #{new_id}")
        st.experimental_rerun()
    except Exception as e:
        st.error("Failed to create fish")
        st.exception(e)
