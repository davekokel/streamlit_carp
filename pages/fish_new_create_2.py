import datetime as dt
from typing import Any, Dict, List, Optional

import pandas as pd
import streamlit as st

# Project auth (matches fish_view_5.py style)
from auth import auth_ui, sign_out  # type: ignore
from utils_auth import ensure_auth, sign_out_and_clear  # type: ignore

# ----------------------------
# Helpers
# ----------------------------
def fetch_table(sb, name: str, limit: int = 10000) -> pd.DataFrame:
    try:
        data = sb.table(name).select("*").limit(limit).execute().data
        return pd.DataFrame(data or [])
    except Exception as e:
        st.error(f"Failed to fetch '{name}': {e}")
        return pd.DataFrame()

def col(df: pd.DataFrame, key: str) -> Optional[str]:
    key_l = key.lower()
    for c in df.columns:
        if c.lower() == key_l:
            return c
    return None

def live_cols(df: pd.DataFrame) -> Dict[str, str]:
    return {c.lower(): c for c in df.columns}

def detect_fk(link_df: pd.DataFrame, preferred: List[str]) -> Optional[str]:
    if link_df.empty:
        return preferred[0] if preferred else None
    for p in preferred:
        c = col(link_df, p)
        if c: return c
    candidates = [c for c in link_df.columns if c.lower().endswith("_id") and c.lower() != "fish_id"]
    return candidates[0] if candidates else None

def compact_feature_table(link_df: pd.DataFrame, target_df: pd.DataFrame, parent_id: Any, fk_prefer: List[str]) -> pd.DataFrame:
    """Return a compact table (name, optional type/desc) for a feature type linked to parent_id."""
    if link_df.empty or target_df.empty or parent_id is None:
        return pd.DataFrame()
    fish_id_c = col(link_df, "fish_id")
    fk = detect_fk(link_df, fk_prefer)
    if not fish_id_c or not fk:
        return pd.DataFrame()
    tgt_id = col(target_df, "id") or "id"
    tgt_name = col(target_df, "name") or "name"
    df = link_df[link_df[fish_id_c] == parent_id].merge(target_df, left_on=fk, right_on=tgt_id, how="left")
    keep = [tgt_name]
    tcol = col(target_df, "type")
    dcol = col(target_df, "description")
    if tcol: keep.append(tcol)
    if dcol: keep.append(dcol)
    out = df[keep].drop_duplicates().reset_index(drop=True)
    out.columns = [c if i == 0 else c for i, c in enumerate(out.columns)]
    return out

# ----------------------------
# Page
# ----------------------------
def page():
    st.set_page_config(page_title="Create New Fish", layout="wide")
    st.title("Create New Fish")

    # Authenticate and get Supabase client
    sb, user = ensure_auth(auth_ui)
    if sb is None:
        st.error("Authentication failed or no Supabase client available.")
        st.stop()

    # Live tables
    fish_df         = fetch_table(sb, "fish")
    transgenes_df   = fetch_table(sb, "transgenes")
    mutations_df    = fetch_table(sb, "mutations")
    treatments_df   = fetch_table(sb, "treatments")
    f_tg_df         = fetch_table(sb, "fish_transgenes")
    f_mu_df         = fetch_table(sb, "fish_mutations")
    f_tr_df         = fetch_table(sb, "fish_treatments")

    # ------------------------------------
    # 0) Checkbox election table (like fish_view_5.py)
    # ------------------------------------
    st.markdown("### 0) Select Parents (Checkbox Election Table)")
    if fish_df.empty:
        st.error("No rows found in 'fish'. Add parents first, then return here.")
        st.stop()

    name_c = col(fish_df, "name") or fish_df.columns[0]
    id_c   = col(fish_df, "id") or fish_df.columns[0]
    code_c = col(fish_df, "fish_code")

    # Build a compact view with two checkbox columns
    elect_cols = [id_c, name_c] + ([code_c] if code_c else [])
    elect = fish_df[elect_cols].copy()
    elect.rename(columns={id_c: "fish_id", name_c: "name"}, inplace=True)
    elect.insert(0, "select_mom", False)
    elect.insert(1, "select_dad", False)

    # Persist prior selections via session_state if present
    if "election_state" not in st.session_state:
        st.session_state["election_state"] = elect.copy()
    else:
        # update data source columns if schema changed
        for c in elect.columns:
            if c not in st.session_state["election_state"].columns:
                st.session_state["election_state"][c] = elect[c]
        for c in list(st.session_state["election_state"].columns):
            if c not in elect.columns:
                st.session_state["election_state"].drop(columns=[c], inplace=True, errors="ignore")

    st.caption("Tick exactly one mom and one dad. The table is scrollable and editable for the two checkbox columns.")
    edited = st.data_editor(
        st.session_state["election_state"],
        hide_index=True,
        use_container_width=True,
        column_config={
            "select_mom": st.column_config.CheckboxColumn("Mom"),
            "select_dad": st.column_config.CheckboxColumn("Dad"),
        },
        key="election_editor",
    )
    # Enforce single selection for each
    mom_rows = edited[edited["select_mom"] == True]  # noqa: E712
    dad_rows = edited[edited["select_dad"] == True]  # noqa: E712
    if len(mom_rows) > 1:
        st.error("Please select only one Mother.")
    if len(dad_rows) > 1:
        st.error("Please select only one Father.")

    mom_id = mom_rows["fish_id"].iloc[0] if len(mom_rows) == 1 else None
    dad_id = dad_rows["fish_id"].iloc[0] if len(dad_rows) == 1 else None

    # ------------------------------------
    # 1) Compact Summary Tables for Mom and Dad
    # ------------------------------------
    st.markdown("### 1) Parent Summaries")
    c1, c2 = st.columns(2)
    with c1:
        st.subheader("Mother Summary")
        if mom_id is None:
            st.info("Select one Mother above.")
        else:
            tg = compact_feature_table(f_tg_df, transgenes_df, mom_id, ["transgene_id"])
            mu = compact_feature_table(f_mu_df, mutations_df,  mom_id, ["mutation_id"])
            tr = compact_feature_table(f_tr_df, treatments_df, mom_id, ["treatment_id"])
            if not tg.empty: st.markdown("**Transgenes**"); st.dataframe(tg, use_container_width=True)
            if not mu.empty: st.markdown("**Mutations**");  st.dataframe(mu, use_container_width=True)
            if not tr.empty: st.markdown("**Treatments**"); st.dataframe(tr, use_container_width=True)
    with c2:
        st.subheader("Father Summary")
        if dad_id is None:
            st.info("Select one Father above.")
        else:
            tg = compact_feature_table(f_tg_df, transgenes_df, dad_id, ["transgene_id"])
            mu = compact_feature_table(f_mu_df, mutations_df,  dad_id, ["mutation_id"])
            tr = compact_feature_table(f_tr_df, treatments_df, dad_id, ["treatment_id"])
            if not tg.empty: st.markdown("**Transgenes**"); st.dataframe(tg, use_container_width=True)
            if not mu.empty: st.markdown("**Mutations**");  st.dataframe(mu, use_container_width=True)
            if not tr.empty: st.markdown("**Treatments**"); st.dataframe(tr, use_container_width=True)

    st.divider()

    # ------------------------------------
    # 2) Unified Features (inherit + add)
    # ------------------------------------
    st.markdown("### 2) Add / Adjust Features")
    def parent_unified(parent_id: Any) -> pd.DataFrame:
        rows: List[Dict[str, Any]] = []
        # Transgenes
        if not f_tg_df.empty and not transgenes_df.empty and parent_id is not None:
            fish_id_c = col(f_tg_df, "fish_id")
            fk = detect_fk(f_tg_df, ["transgene_id"])
            tgt_id = col(transgenes_df, "id") or "id"
            tgt_name = col(transgenes_df, "name") or "name"
            tgt_type = col(transgenes_df, "type")
            tgt_desc = col(transgenes_df, "description")
            if fish_id_c and fk:
                m = f_tg_df[f_tg_df[fish_id_c] == parent_id].merge(transgenes_df, left_on=fk, right_on=tgt_id, how="left")
                for _, r in m.iterrows():
                    row = {"feature_type":"transgene","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                    if tgt_type: row["type"] = r.get(tgt_type)
                    if tgt_desc: row["description"] = r.get(tgt_desc)
                    rows.append(row)
        # Mutations
        if not f_mu_df.empty and not mutations_df.empty and parent_id is not None:
            fish_id_c = col(f_mu_df, "fish_id")
            fk = detect_fk(f_mu_df, ["mutation_id"])
            tgt_id = col(mutations_df, "id") or "id"
            tgt_name = col(mutations_df, "name") or "name"
            tgt_type = col(mutations_df, "type")
            tgt_desc = col(mutations_df, "description")
            if fish_id_c and fk:
                m = f_mu_df[f_tg_df[fish_id_c] == parent_id].merge(mutations_df, left_on=fk, right_on=tgt_id, how="left")
                for _, r in m.iterrows():
                    row = {"feature_type":"mutation","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                    if tgt_type: row["type"] = r.get(tgt_type)
                    if tgt_desc: row["description"] = r.get(tgt_desc)
                    rows.append(row)
        # Treatments
        if not f_tr_df.empty and not treatments_df.empty and parent_id is not None:
            fish_id_c = col(f_tr_df, "fish_id")
            fk = detect_fk(f_tr_df, ["treatment_id"])
            tgt_id = col(treatments_df, "id") or "id"
            tgt_name = col(treatments_df, "name") or "name"
            tgt_type = col(treatments_df, "type")
            tgt_desc = col(treatments_df, "description")
            if fish_id_c and fk:
                m = f_tr_df[f_tr_df[fish_id_c] == parent_id].merge(treatments_df, left_on=fk, right_on=tgt_id, how="left")
                for _, r in m.iterrows():
                    row = {"feature_type":"treatment","id":r.get(fk),"name":r.get(tgt_name),"source":"parent","inherit":True}
                    if tgt_type: row["type"] = r.get(tgt_type)
                    if tgt_desc: row["description"] = r.get(tgt_desc)
                    rows.append(row)
        return pd.DataFrame(rows)

    unified = pd.DataFrame(columns=["feature_type","id","name","source","inherit"])
    allow_type = any(col(d, "type") for d in [transgenes_df, mutations_df, treatments_df])
    allow_desc = any(col(d, "description") for d in [transgenes_df, mutations_df, treatments_df])
    if mom_id is not None:
        unified = pd.concat([unified, parent_unified(mom_id)], ignore_index=True)
    if dad_id is not None:
        unified = pd.concat([unified, parent_unified(dad_id)], ignore_index=True)
    unified.drop_duplicates(subset=["feature_type","id"], inplace=True, ignore_index=True)

    # Add picks
    def label_id_map(df: pd.DataFrame) -> Dict[str, Any]:
        name_c = col(df, "name")
        id_c = col(df, "id")
        if not name_c or not id_c or df.empty:
            return {}
        return {str(n): i for n, i in zip(df[name_c].astype(str), df[id_c])}

    tg_map = label_id_map(transgenes_df)
    mu_map = label_id_map(mutations_df)
    tr_map = label_id_map(treatments_df)

    cA, cB, cC = st.columns(3)
    with cA:
        add_tg = st.multiselect("Add transgenes", list(tg_map.keys()))
    with cB:
        add_mu = st.multiselect("Add mutations", list(mu_map.keys()))
    with cC:
        add_tr = st.multiselect("Add treatments", list(tr_map.keys()))

    for lbl in add_tg:
        unified = pd.concat([unified, pd.DataFrame([{"feature_type":"transgene","id":tg_map[lbl],"name":lbl,"source":"added","inherit":True}])], ignore_index=True)
    for lbl in add_mu:
        unified = pd.concat([unified, pd.DataFrame([{"feature_type":"mutation","id":mu_map[lbl],"name":lbl,"source":"added","inherit":True}])], ignore_index=True)
    for lbl in add_tr:
        unified = pd.concat([unified, pd.DataFrame([{"feature_type":"treatment","id":tr_map[lbl],"name":lbl,"source":"added","inherit":True}])], ignore_index=True)

    if allow_type and "type" not in unified.columns: unified["type"] = None
    if allow_desc and "description" not in unified.columns: unified["description"] = None
    st.markdown("**Unified Features** (toggle 'inherit' to include/exclude)")
    unified = st.data_editor(unified, num_rows="dynamic", hide_index=True, use_container_width=True, key="unified_editor")

    st.divider()

    # ------------------------------------
    # 3) New Fish Details (live columns only)
    # ------------------------------------
    st.markdown("### 3) New Fish Details")
    fish_lc = live_cols(fish_df)
    preferred = ["fish_code", "name", "date_birth", "sex", "line_build", "description"]
    fish_cols = [fish_lc[p] for p in fish_lc if p in [x.lower() for x in preferred]]
    if not fish_cols:
        fish_cols = list(fish_df.columns)

    defaults: Dict[str, Any] = {}
    for c in fish_cols:
        if c.lower() == "date_birth":
            defaults[c] = dt.date.today().isoformat()
        elif c.lower() == "line_build":
            defaults[c] = False
        else:
            defaults[c] = ""

    fish_details_df = st.data_editor(pd.DataFrame([defaults]), num_rows=1, hide_index=True, use_container_width=True, key="fish_details")
    fish_details = fish_details_df.iloc[0].to_dict()

    # ------------------------------------
    # 4) Preview & Create
    # ------------------------------------
    st.markdown("### 4) Preview & Create")
    def build_payload() -> Dict[str, Any]:
        f = unified.copy()
        if "inherit" in f.columns:
            f = f[f["inherit"] == True]  # noqa: E712
        getids = lambda t: f.loc[f["feature_type"] == t, "id"].dropna().unique().tolist() if "id" in f.columns else []
        return {
            "fish": fish_details,
            "parents": {"mother_id": mom_id, "father_id": dad_id},
            "transgene_ids": getids("transgene"),
            "mutation_ids": getids("mutation"),
            "treatment_ids": getids("treatment"),
        }

    payload = build_payload()
    st.json(payload, expanded=False)

    if st.button("Create New Fish", type="primary"):
        # Insert fish using only existing columns
        fish_live = live_cols(fish_df)
        safe_fish = {fish_live[k.lower()]: v for k, v in fish_details.items() if k.lower() in fish_live}
        try:
            inserted = sb.table("fish").insert(safe_fish).execute().data
            if not inserted:
                raise RuntimeError("Insert returned no row")
            new_fish_id = inserted[0].get(col(pd.DataFrame([inserted[0]]), "id") or "id")
        except Exception as e:
            st.error(f"Create failed: {e}")
            st.stop()

        # Link rows (best effort)
        def link_many(link_table: str, fk_pref: List[str], ids: List[Any]) -> Optional[str]:
            link_df = fetch_table(sb, link_table)
            fish_id_c = col(link_df, "fish_id") or "fish_id"
            fk_c = detect_fk(link_df, fk_pref) or (fk_pref[0] if fk_pref else None)
            try:
                for x in ids:
                    sb.table(link_table).insert({fish_id_c: new_fish_id, fk_c: x}).execute()
                return None
            except Exception as e:
                return f"{link_table}: {e}"

        errs = []
        if payload.get("transgene_ids"): errs.append(link_many("fish_transgenes", ["transgene_id"], payload["transgene_ids"]) or None)
        if payload.get("mutation_ids"):  errs.append(link_many("fish_mutations", ["mutation_id"], payload["mutation_ids"]) or None)
        if payload.get("treatment_ids"): errs.append(link_many("fish_treatments", ["treatment_id"], payload["treatment_ids"]) or None)
        errs = [e for e in errs if e]

        if errs:
            st.warning("Created fish, but linking issues: " + "; ".join(errs))
        else:
            st.success(f"✅ Fish created (id={new_fish_id}).")

if __name__ == "__main__":
    page()
