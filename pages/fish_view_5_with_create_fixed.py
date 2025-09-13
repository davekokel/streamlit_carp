from __future__ import annotations

import streamlit as st
from lib.config import make_supabase_client

@st.cache_resource
def sb_client():
    return make_supabase_client()

def attach_session():
    if "sb_access_token" in st.session_state and "sb_refresh_token" in st.session_state:
        sb_client().auth.set_session(st.session_state["sb_access_token"], st.session_state["sb_refresh_token"])

attach_session()
if "sb_user" not in st.session_state:
    st.switch_page("app.py")

sb = sb_client()


from typing import Any, Dict, List, Optional
import streamlit as st


def _options_rows(df: pd.DataFrame) -> List[Dict[str, Any]]:
    """Return list of row dicts with id/name/type/description and a minimal label from real fields only.
    Label priority: name > type > id (as string). No extra formatting or invented text.
    """
    if df is None or df.empty:
        return []
    def _c(frame: pd.DataFrame, key: str) -> Optional[str]:
        key_l = key.lower()
        for c in frame.columns:
            if c.lower() == key_l:
                return c
        return None
    id_c = _c(df, "id")
    name_c = _c(df, "name")
    type_c = _c(df, "type")
    desc_c = _c(df, "description")
    rows: List[Dict[str, Any]] = []
    for _, r in df.iterrows():
        _id = r.get(id_c) if id_c else None
        _name = (str(r.get(name_c)).strip() if name_c else "") or ""
        _type = (str(r.get(type_c)).strip() if type_c else "") or ""
        _desc = (str(r.get(desc_c)).strip() if desc_c else "") or ""
        label = _name if _name else (_type if _type else (str(_id) if _id is not None else ""))
        rows.append({"id": _id, "name": _name or None, "type": _type or None, "description": _desc or None, "label": label})
    return rows

def _options_map(df: pd.DataFrame) -> Dict[str, Dict[str, Any]]:
    """Return {label: rowdict} built only from DB fields; label is minimal (name or type or id)."""
    return {row["label"]: row for row in _options_rows(df)}

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

def summarize_list_on(df: pd.DataFrame, col: str, max_items: int = 10):
    if df is None or df.empty or col not in df.columns:
        return {"count": 0, "items": ""}
    vals = [str(v) for v in df[col].astype(str).tolist() if str(v)]
    head = ", ".join(vals[:max_items])
    if len(vals) > max_items:
        head += f" …(+{len(vals)-max_items})"
    return {"count": len(vals), "items": head}

def summarize_pair(df: pd.DataFrame, col_a: str, col_b: str, sep: str = " — ", max_items: int = 10):
    if df is None or df.empty or col_a not in df.columns:
        return {"count": 0, "items": ""}
    items = []
    for _, r in df.iterrows():
        a = str(r.get(col_a,"") or "").strip()
        b = str(r.get(col_b,"") or "").strip() if col_b in df.columns else ""
        if a or b:
            items.append(a if not b else f"{a}{sep}{b}")
    head = ", ".join(items[:max_items])
    if len(items) > max_items:
        head += f" …(+{len(items)-max_items})"
    return {"count": len(items), "items": head}


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
    tg_name_desc = summarize_pair(tg, "name", "description")

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



# =============================
# Extension: Create New Fish Workflow
# Continues after Mom/Dad selection and compact summaries above.
# =============================
import datetime as _dt

def _live_cols(_df: pd.DataFrame) -> dict:
    return {c.lower(): c for c in _df.columns}

def _col(_df: pd.DataFrame, key: str) -> str | None:
    kl = key.lower()
    for c in _df.columns:
        if c.lower() == kl:
            return c
    return None

@st.cache_data(show_spinner=False)
def _fetch_table(name: str, limit: int = 10000) -> pd.DataFrame:
    try:
        data = sb.table(name).select("*").limit(limit).execute().data or []
        return pd.DataFrame(data)
    except Exception as e:
        st.error(f"Failed to fetch '{name}': {e}")
        return pd.DataFrame()


def _compact_from_unified(unified: pd.DataFrame, ftype: str) -> pd.DataFrame:
    """Return a compact table (name, optional type/description) from unified features for a given feature_type.
    Rows are filtered to inherit == True. Only real columns present in unified are shown.
    """
    if unified is None or unified.empty:
        return pd.DataFrame()
    df = unified.copy()
    if "inherit" in df.columns:
        df = df[df["inherit"] == True]  # noqa: E712
    if "feature_type" in df.columns:
        df = df[df["feature_type"] == ftype]
    keep = []
    for k in ["name", "type", "description"]:
        if k in df.columns:
            keep.append(k)
    if not keep:
        return pd.DataFrame()
    out = df[keep].drop_duplicates().reset_index(drop=True)
    return out
def _detect_fk(link_df: pd.DataFrame, preferred: list[str]) -> str | None:
    if link_df.empty:
        return preferred[0] if preferred else None
    for p in preferred:
        c = _col(link_df, p)
        if c: return c
    cands = [c for c in link_df.columns if c.lower().endswith("_id") and c.lower() != "fish_id"]
    return cands[0] if cands else None

def _parent_unified_features(parent_id: int) -> pd.DataFrame:
    rows: list[dict] = []
    # Transgenes
    f_tg = _fetch_table("fish_transgenes")
    tg = _fetch_table("transgenes")
    if not f_tg.empty and not tg.empty:
        fish_id_c = _col(f_tg, "fish_id")
        fk = _detect_fk(f_tg, ["transgene_id"])
        tgt_id = _col(tg, "id") or "id"
        tgt_name = _col(tg, "name") or "name"
        tgt_type = _col(tg, "type")
        tgt_desc = _col(tg, "description")
        if fish_id_c and fk:
            m = f_tg[f_tg[fish_id_c] == parent_id].merge(tg, left_on=fk, right_on=tgt_id, how="left")
            for _, r in m.iterrows():
                row = {"feature_type":"transgene","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                if tgt_type: row["type"] = r.get(tgt_type)
                if tgt_desc: row["description"] = r.get(tgt_desc)
                rows.append(row)
    # Mutations
    f_mu = _fetch_table("fish_mutations")
    mu = _fetch_table("mutations")
    if not f_mu.empty and not mu.empty:
        fish_id_c = _col(f_mu, "fish_id")
        fk = _detect_fk(f_mu, ["mutation_id"])
        tgt_id = _col(mu, "id") or "id"
        tgt_name = _col(mu, "name") or "name"
        tgt_type = _col(mu, "type")
        tgt_desc = _col(mu, "description")
        if fish_id_c and fk:
            m = f_mu[f_mu[fish_id_c] == parent_id].merge(mu, left_on=fk, right_on=tgt_id, how="left")
            for _, r in m.iterrows():
                row = {"feature_type":"mutation","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                if tgt_type: row["type"] = r.get(tgt_type)
                if tgt_desc: row["description"] = r.get(tgt_desc)
                rows.append(row)
    # Treatments
    f_tr = _fetch_table("fish_treatments")
    tr = _fetch_table("treatments")
    if not f_tr.empty and not tr.empty:
        fish_id_c = _col(f_tr, "fish_id")
        fk = _detect_fk(f_tr, ["treatment_id"])
        tgt_id = _col(tr, "id") or "id"
        tgt_name = _col(tr, "name") or "name"
        tgt_type = _col(tr, "type")
        tgt_desc = _col(tr, "description")
        if fish_id_c and fk:
            m = f_tr[f_tr[fish_id_c] == parent_id].merge(tr, left_on=fk, right_on=tgt_id, how="left")
            for _, r in m.iterrows():
                row = {"feature_type":"treatment","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                if tgt_type: row["type"] = r.get(tgt_type)
                if tgt_desc: row["description"] = r.get(tgt_desc)
                rows.append(row)
    return pd.DataFrame(rows)

def _id_map(df: pd.DataFrame) -> dict[str, int]:
    n = _col(df, "name")
    i = _col(df, "id")
    if not n or not i or df.empty:
        return {}
    return {str(a): b for a, b in zip(df[n].astype(str), df[i])}

# ---- Toggle to open creation workflow ----
st.divider()
with st.expander("➕ Create a New Fish (extend this page)", expanded=True):
    # Use the mom/dad already picked above
    try:
        mom_id_val = int(mom.get("id"))
        dad_id_val = int(dad.get("id"))
    except Exception:
        st.warning("Pick two parents above to proceed with creation.")
        st.stop()

    
    
    # 1) Unified Features (inheritance only)
    st.markdown("### 1) Unified Features (inheritance only)")

    unified = pd.DataFrame(columns=["feature_type","id","name","source","inherit"])
    pf_m = _parent_unified_features(mom_id_val)
    pf_d = _parent_unified_features(dad_id_val)
    unified = pd.concat([unified, pf_m, pf_d], ignore_index=True)
    unified.drop_duplicates(subset=["feature_type","id"], inplace=True, ignore_index=True)

    # Optional columns only if present in any target table
    tg_all = _fetch_table("transgenes")
    mu_all = _fetch_table("mutations")
    tr_all = _fetch_table("treatments")
    if _col(tg_all, "type") or _col(mu_all, "type") or _col(tr_all, "type"):
        if "type" not in unified.columns: unified["type"] = None
    if _col(tg_all, "description") or _col(mu_all, "description") or _col(tr_all, "description"):
        if "description" not in unified.columns: unified["description"] = None

    st.markdown("**Unified Features** (toggle 'inherit' to include/exclude)")
    unified = st.data_editor(unified, num_rows="dynamic", hide_index=True, use_container_width=True, key="unified_editor_create")


    # 2) Add a New Treatment (table)
    st.markdown("### 2) Add a New Treatment")
    tr_live = _fetch_table("treatments")
    tr_cols = list(tr_live.columns) if not tr_live.empty else ["name", "type", "description"]
    # Keep only columns that actually exist among common set
    allowed_tr_cols = []
    for k in ["name", "type", "description"]:
        c = _col(tr_live, k)
        if c: allowed_tr_cols.append(c)
    if not allowed_tr_cols:
        # fallback to any writable-looking columns (exclude id)
        allowed_tr_cols = [c for c in tr_cols if c.lower() != "id"]

    # One blank row for entry; user can add more with "Add rows"
    new_tr_df = pd.DataFrame([{c: "" for c in allowed_tr_cols}])
    new_tr_df = st.data_editor(
        new_tr_df,
        num_rows="dynamic",
        hide_index=True,
        use_container_width=True,
        key="new_treatments_editor",
    )

    # Insert button
    if st.button("Insert New Treatment(s)"):
        inserted_ids = []
        for _, row in new_tr_df.iterrows():
            payload = {c: (row[c] if c in row and str(row[c]).strip() != "" else None) for c in allowed_tr_cols}
            # Skip empty rows
            if all(v in (None, "") for v in payload.values()):
                continue
            try:
                res = sb.table("treatments").insert(payload).execute().data or []
                if res:
                    # Detect id column from returned row
                    id_key = next((k for k in res[0].keys() if k.lower() == "id"), None)
                    if id_key:
                        inserted_ids.append(res[0][id_key])
            except Exception as e:
                st.error(f"Failed to insert treatment: {e}")
        if inserted_ids:
            st.success(f"Inserted {len(inserted_ids)} new treatment(s): {inserted_ids}")
            # Refresh tr_all and tr_map; append to unified as 'treatment' entries
            tr_all = _fetch_table("treatments")
            tr_map = _options_map(tr_all)
            for _id in inserted_ids:
                # Find the label row for this id
                ent = next((v for v in tr_map.values() if v.get("id") == _id), None)
                if ent:
                    add_row = {"feature_type":"treatment","id":ent["id"],"name":ent.get("name"),"type":ent.get("type"),"description":ent.get("description"),"source":"added-new","inherit":True}
                    globals()["unified"] = pd.concat([globals()["unified"], pd.DataFrame([add_row])], ignore_index=True)
        else:
            st.info("No non-empty rows to insert.")


    
    
    
    # 3) Preview of the New Fish
    st.markdown("### 3) Preview of the New Fish")

    # Compact feature summaries (same compact style as mom/dad summaries)
    # Build from unified (inherit == True), including any newly added treatments
    def _collect_items(unified_df: pd.DataFrame, ftype: str, key: str) -> list[str]:
        if unified_df is None or unified_df.empty:
            return []
        df = unified_df.copy()
        if "inherit" in df.columns:
            df = df[df["inherit"] == True]  # noqa: E712
        if "feature_type" in df.columns:
            df = df[df["feature_type"] == ftype]
        return [str(x).strip() for x in df[key].dropna().astype(str).tolist()] if key in df.columns else []

    tg_names = _collect_items(unified, "transgene", "name")
    tg_descs = _collect_items(unified, "transgene", "description")
    mu_names = _collect_items(unified, "mutation", "name")
    tr_names = _collect_items(unified, "treatment", "name")

    # Show three compact tables like mom/dad
    cL, cC, cR = st.columns(3)
    with cL:
        st.markdown("**Transgenes**")
        tg_prev = _compact_from_unified(unified, "transgene")
        st.dataframe(tg_prev if not tg_prev.empty else pd.DataFrame(), use_container_width=True)
    with cC:
        st.markdown("**Mutations**")
        mu_prev = _compact_from_unified(unified, "mutation")
        st.dataframe(mu_prev if not mu_prev.empty else pd.DataFrame(), use_container_width=True)
    with cR:
        st.markdown("**Treatments**")
        tr_prev = _compact_from_unified(unified, "treatment")
        st.dataframe(tr_prev if not tr_prev.empty else pd.DataFrame(), use_container_width=True)

    # New Fish Details editor (but final preview is shown as a field/value table)
    fish_live = _fetch_table("fish")
    fish_lc = _live_cols(fish_live)
    preferred = ["fish_code", "name", "date_birth", "line_building_stage", "notes", "mother_fish_id", "father_fish_id", "created_by", "created_at"]
    fish_cols = [fish_lc[p] for p in fish_lc if p in [x.lower() for x in preferred]] or list(fish_live.columns)

    defaults: Dict[str, Any] = {}
for c in fish_cols:
    lc = c.lower()
    if lc in ("date_birth", "dob"):
        defaults[c] = _dt.date.today().isoformat()
    elif lc in ("mother_fish_id",):
        defaults[c] = mom_id_val
    elif lc in ("father_fish_id",):
        defaults[c] = dad_id_val
    elif lc in ("created_at",):
        # leave created_at empty; DB default may handle it
        defaults[c] = ""
    else:
        defaults[c] = ""


    st.markdown("**New Fish Details**")
    # Removed redundant details editor; using defaults below
    fish_details = defaults.copy()

    # Build a compact one-column 'value' table mirroring the mom/dad details style
    # Some rows (strains/phenotypes/mounts/tanks) may not exist yet; we leave them empty/zero
    line_building_stage = fish_details.get(next((k for k in fish_details.keys() if k.lower()=="line_building_stage"), "line_building_stage"), None)

    table_rows = [
        ("fish_id", ""),  # will be known after creation
        ("name", fish_details.get(next((k for k in fish_details if k.lower()=="name"), "name"), "")),
        ("fish_code", fish_details.get(next((k for k in fish_details if k.lower()=="fish_code"), "fish_code"), "")),
        ("date_birth", fish_details.get(next((k for k in fish_details if k.lower()=="date_birth"), "date_birth"), "")),
        ("line_building_stage", line_building_stage if line_building_stage is not None else ""),
        ("transgenes_count", len([x for x in tg_names if x])),
        ("transgenes_items", ", ".join([x for x in tg_names if x])),
        ("transgenes_descriptions", "; ".join([x for x in tg_descs if x])),
        ("strains_count", 0),
        ("strains_items", ""),
        ("mutations_count", len([x for x in mu_names if x])),
        ("mutations_items", ", ".join([x for x in mu_names if x])),
        ("phenotypes_count", 0),
        ("phenotypes_items", ""),
        ("treatments_count", len([x for x in tr_names if x])),
        ("treatments_items", ", ".join([x for x in tr_names if x])),
        ("mounts_count", 0),
        ("mounts_items", ""),
        ("tanks_count", 0),
        ("tanks_items", ""),
    ]
    preview_df = pd.DataFrame({"value": [v for _, v in table_rows]}, index=[k for k, _ in table_rows])
    edited_preview = st.data_editor(
        preview_df, height=800,
        num_rows="fixed",
        hide_index=False,
        use_container_width=True,
        key="new_fish_details_value_editor",
    )
    # Rebuild fish_details from the edited value column (only real schema fields)
    fish_details = defaults.copy()
    editable_keys = [
        "name","fish_code","date_birth","line_building_stage","notes",
        "mother_fish_id","father_fish_id","created_by","created_at"
    ]
    for k in editable_keys:
        if k in edited_preview.index:
            fish_details[k] = edited_preview.loc[k, "value"]



    # Build payload internally (no JSON shown)
    def _build_payload() -> dict:
        f = unified.copy()
        if "inherit" in f.columns:
            f = f[f["inherit"] == True]  # noqa: E712
        getids = lambda t: f.loc[f["feature_type"] == t, "id"].dropna().unique().tolist() if "id" in f.columns else []
        return {
            "fish": fish_details,
            "parents": {"mother_id": mom_id_val, "father_id": dad_id_val},
            "transgene_ids": getids("transgene"),
            "mutation_ids": getids("mutation"),
            "treatment_ids": getids("treatment"),
        }

    payload = _build_payload()

    if st.button("Create New Fish", type="primary"):
        # Insert fish (only allowed columns)
        live_cols_map = _live_cols(fish_live)
        safe_fish = {live_cols_map[k.lower()]: v for k, v in fish_details.items() if k.lower() in live_cols_map}
        try:
            inserted = sb.table("fish").insert(safe_fish).execute().data
            if not inserted:
                raise RuntimeError("Insert returned no row")
            new_fish_id = inserted[0].get(_col(pd.DataFrame([inserted[0]]), "id") or "id")
        except Exception as e:
            st.error(f"Create failed: {e}")
            st.stop()

        # Link junction rows
        def _link_many(link_table: str, fk_pref: list[str], ids: list[int]) -> str | None:
            link_live = _fetch_table(link_table)
            fish_id_c = _col(link_live, "fish_id") or "fish_id"
            fk_c = _detect_fk(link_live, fk_pref) or (fk_pref[0] if fk_pref else None)
            try:
                for x in ids:
                    sb.table(link_table).insert({fish_id_c: new_fish_id, fk_c: x}).execute()
                return None
            except Exception as e:
                return f"{link_table}: {e}"

        errs = []
        pl = payload
        if pl.get("transgene_ids"): errs.append(_link_many("fish_transgenes", ["transgene_id"], pl["transgene_ids"]) or None)
        if pl.get("mutation_ids"):  errs.append(_link_many("fish_mutations",  ["mutation_id"],  pl["mutation_ids"]) or None)
        if pl.get("treatment_ids"): errs.append(_link_many("fish_treatments", ["treatment_id"], pl["treatment_ids"]) or None)
        errs = [e for e in errs if e]

        if errs:
            st.warning("Created fish, but linking issues: " + "; ".join(errs))
        else:
            st.success(f"✅ Fish created (id={new_fish_id}).")
