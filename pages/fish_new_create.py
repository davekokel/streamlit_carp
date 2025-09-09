import os
import datetime as dt
from typing import List, Dict, Any, Optional, Tuple

import pandas as pd
import streamlit as st

# Optional Supabase support
SUPABASE_AVAILABLE = True
try:
    from supabase import create_client, Client  # type: ignore
except Exception:
    SUPABASE_AVAILABLE = False
    Client = Any  # type: ignore


# ----------------------------
# Utilities
# ----------------------------
def to_options(df: pd.DataFrame, label_col: str, value_col: str = "id") -> List[Tuple[str, Any]]:
    """
    Turn a DataFrame into [(label, value), ...] options.
    Handles duplicates by keeping first occurrence of label.
    """
    if df.empty or label_col not in df.columns:
        return []
    mapping = {}
    for _, row in df.iterrows():
        label = str(row.get(label_col, ""))
        value = row.get(value_col, None)
        if label and label not in mapping:
            mapping[label] = value
    return list(mapping.items())


def badge(text: str) -> str:
    return f"<span style='background:#eef;border:1px solid #99c;border-radius:8px;padding:2px 6px;font-size:12px'>{text}</span>"


def get_supabase() -> Optional[Client]:
    url = os.environ.get("SUPABASE_URL", "").strip()
    key = os.environ.get("SUPABASE_KEY", "").strip()
    if not (url and key and SUPABASE_AVAILABLE):
        return None
    try:
        return create_client(url, key)
    except Exception:
        return None


# ----------------------------
# Data Access (Supabase or Mock)
# ----------------------------
def fetch_catalogs(sb: Optional[Client]) -> Dict[str, pd.DataFrame]:
    """
    Fetch option catalogs and fish (for parent picking).
    Expected tables (rename here if your schema differs):
      - fish (id, name, fish_code, date_birth, sex, line_build, description)
      - transgenes (id, name, type, description)
      - mutations (id, name, type, description)
      - treatments (id, name, type, description)
      - fish_transgenes (fish_id, transgene_id)
      - fish_mutations (fish_id, mutation_id)
      - fish_treatments (fish_id, treatment_id)
    """
    if sb is None:
        # ----- Mock data -----
        fish = pd.DataFrame([
            {"id": 1, "name": "Tg(pDQM059)320-Ken-P0_founder ♀", "fish_code": "FSH-2025-0050", "date_birth": "2025-02-25", "sex": "F", "line_build": True, "description": "Founder female"},
            {"id": 2, "name": "Tg(pDQM059)318-Ax-P0_founder ♂", "fish_code": "FSH-2025-0051", "date_birth": "2025-02-25", "sex": "M", "line_build": True, "description": "Founder male"},
        ])
        transgenes = pd.DataFrame([
            {"id": 10, "name": "CMV:SP6:mSG_J_IDT_opt", "type": "reporter", "description": "mStayGold optimized"},
            {"id": 11, "name": "ef1a:GCaMP6s", "type": "reporter", "description": "Calcium indicator"},
        ])
        mutations = pd.DataFrame([
            {"id": 20, "name": "scn1lab^−/−", "type": "loss-of-function", "description": "Dravet-like"},
        ])
        treatments = pd.DataFrame([
            {"id": 30, "name": "PTZ", "type": "chemo-convulsant", "description": "20 mM for 10 min"},
            {"id": 31, "name": "Diazepam", "type": "benzodiazepine", "description": "5 µM"},
        ])
        fish_transgenes = pd.DataFrame([{"fish_id": 1, "transgene_id": 10}, {"fish_id": 2, "transgene_id": 11}])
        fish_mutations = pd.DataFrame([{"fish_id": 1, "mutation_id": 20}])
        fish_treatments = pd.DataFrame([{"fish_id": 1, "treatment_id": 31}])
        return {
            "fish": fish,
            "transgenes": transgenes,
            "mutations": mutations,
            "treatments": treatments,
            "fish_transgenes": fish_transgenes,
            "fish_mutations": fish_mutations,
            "fish_treatments": fish_treatments,
        }

    # ----- Real Supabase fetches -----
    def fetch_table(name: str) -> pd.DataFrame:
        try:
            data = sb.table(name).select("*").execute().data
            return pd.DataFrame(data or [])
        except Exception as e:
            st.warning(f"Failed to fetch '{name}': {e}")
            return pd.DataFrame()

    fish = fetch_table("fish")
    transgenes = fetch_table("transgenes")
    mutations = fetch_table("mutations")
    treatments = fetch_table("treatments")
    fish_transgenes = fetch_table("fish_transgenes")
    fish_mutations = fetch_table("fish_mutations")
    fish_treatments = fetch_table("fish_treatments")

    return {
        "fish": fish,
        "transgenes": transgenes,
        "mutations": mutations,
        "treatments": treatments,
        "fish_transgenes": fish_transgenes,
        "fish_mutations": fish_mutations,
        "fish_treatments": fish_treatments,
    }


def linked_features_for_parent(parent_id: Any, catalogs: Dict[str, pd.DataFrame]) -> pd.DataFrame:
    """
    Build a unified table of features for a single parent.
    Columns: feature_type, id, name, type, description, source, inherit
    """
    rows = []
    # Transgenes
    ft = catalogs["fish_transgenes"]
    tg = catalogs["transgenes"]
    if not ft.empty and not tg.empty:
        t = ft[ft["fish_id"] == parent_id].merge(tg, left_on="transgene_id", right_on="id", how="left")
        for _, r in t.iterrows():
            rows.append({"feature_type": "transgene", "id": r.get("transgene_id"), "name": r.get("name"),
                         "type": r.get("type"), "description": r.get("description"), "source": "parent", "inherit": True})
    # Mutations
    fm = catalogs["fish_mutations"]
    mu = catalogs["mutations"]
    if not fm.empty and not mu.empty:
        m = fm[fm["fish_id"] == parent_id].merge(mu, left_on="mutation_id", right_on="id", how="left")
        for _, r in m.iterrows():
            rows.append({"feature_type": "mutation", "id": r.get("mutation_id"), "name": r.get("name"),
                         "type": r.get("type"), "description": r.get("description"), "source": "parent", "inherit": True})
    # Treatments
    ftr = catalogs["fish_treatments"]
    tr = catalogs["treatments"]
    if not ftr.empty and not tr.empty:
        t2 = ftr[ftr["fish_id"] == parent_id].merge(tr, left_on="treatment_id", right_on="id", how="left")
        for _, r in t2.iterrows():
            rows.append({"feature_type": "treatment", "id": r.get("treatment_id"), "name": r.get("name"),
                         "type": r.get("type"), "description": r.get("description"), "source": "parent", "inherit": True})
    return pd.DataFrame(rows)


def create_fish_payload(
    fish_details: Dict[str, Any], features_df: pd.DataFrame, mom_id: Optional[Any], dad_id: Optional[Any]
) -> Dict[str, Any]:
    """
    Build JSON-like payload for creation.
    """
    inheritable = features_df.copy()
    if "inherit" in inheritable.columns:
        inheritable = inheritable[inheritable["inherit"] == True]  # noqa: E712
    # Split by type
    tg_ids = inheritable.loc[inheritable["feature_type"] == "transgene", "id"].dropna().unique().tolist()
    mu_ids = inheritable.loc[inheritable["feature_type"] == "mutation", "id"].dropna().unique().tolist()
    tr_ids = inheritable.loc[inheritable["feature_type"] == "treatment", "id"].dropna().unique().tolist()
    payload = {
        "fish": fish_details,
        "parents": {"mother_id": mom_id, "father_id": dad_id},
        "transgene_ids": tg_ids,
        "mutation_ids": mu_ids,
        "treatment_ids": tr_ids,
    }
    return payload


def insert_new_treatment_if_needed(sb: Optional[Client], tr_name: str, tr_type: str, tr_desc: str) -> Optional[int]:
    if not tr_name:
        return None
    if sb is None:
        # mock id counter using hash (not persistent)
        return abs(hash((tr_name, tr_type, tr_desc))) % 10_000_000
    try:
        res = sb.table("treatments").insert({"name": tr_name, "type": tr_type, "description": tr_desc}).execute()
        rows = res.data or []
        if rows and "id" in rows[0]:
            return rows[0]["id"]
        # Fallback: fetch most recent by name
        q = sb.table("treatments").select("*").eq("name", tr_name).order("id", desc=True).limit(1).execute().data
        return q[0]["id"] if q else None
    except Exception as e:
        st.error(f"Failed to insert new treatment: {e}")
        return None


def create_fish_in_supabase(sb: Optional[Client], payload: Dict[str, Any]) -> Dict[str, Any]:
    """
    If Supabase is available, perform inserts; otherwise return echo payload.
    """
    if sb is None:
        return {"status": "mock", "payload": payload}

    fish = payload["fish"].copy()
    # Write fish
    try:
        fish_res = sb.table("fish").insert(fish).execute().data
        if not fish_res:
            raise RuntimeError("Insert returned no rows")
        fish_id = fish_res[0]["id"]
    except Exception as e:
        return {"status": "error", "error": f"Failed to insert fish: {e}"}

    # Link parents if schema supports it (example: fish.parents table or columns mother_id/father_id)
    try:
        if "mother_id" in sb.table("fish").select("*").limit(1).execute().data[0]:
            sb.table("fish").update({"mother_id": payload["parents"]["mother_id"], "father_id": payload["parents"]["father_id"]}).eq("id", fish_id).execute()
        else:
            # alternative via junction table 'fish_parents'
            try:
                sb.table("fish_parents").insert(
                    {"fish_id": fish_id, "mother_id": payload["parents"]["mother_id"], "father_id": payload["parents"]["father_id"]}
                ).execute()
            except Exception:
                pass
    except Exception:
        # best-effort; ignore
        pass

    # Link features
    try:
        for tg_id in payload.get("transgene_ids", []):
            sb.table("fish_transgenes").insert({"fish_id": fish_id, "transgene_id": tg_id}).execute()
        for mu_id in payload.get("mutation_ids", []):
            sb.table("fish_mutations").insert({"fish_id": fish_id, "mutation_id": mu_id}).execute()
        for tr_id in payload.get("treatment_ids", []):
            sb.table("fish_treatments").insert({"fish_id": fish_id, "treatment_id": tr_id}).execute()
    except Exception as e:
        return {"status": "partial", "fish_id": fish_id, "error": f"Linked features insert issues: {e}"}

    return {"status": "ok", "fish_id": fish_id}


# ----------------------------
# UI
# ----------------------------
def page():
    st.set_page_config(page_title="Create New Fish", layout="wide")
    st.title("Create New Fish")
    st.caption("Build a new fish by selecting parents, editing details, and choosing features to inherit or add.")

    sb = get_supabase()
    catalogs = fetch_catalogs(sb)

    # Parent pickers
    st.subheader("1) Parents")
    fish_df = catalogs["fish"].copy()
    mom_id = dad_id = None
    if fish_df.empty:
        st.info("No fish found. Using mock parents.")
    mom_opt = to_options(fish_df, "name", "id")
    dad_opt = to_options(fish_df, "name", "id")

    col1, col2 = st.columns(2)
    with col1:
        mom_label = st.selectbox("Mother", options=[lbl for (lbl, _) in mom_opt], index=0 if mom_opt else None)
        if mom_label:
            mom_id = dict(mom_opt).get(mom_label)
    with col2:
        dad_label = st.selectbox("Father", options=[lbl for (lbl, _) in dad_opt], index=1 if len(dad_opt) > 1 else 0 if dad_opt else None)
        if dad_label:
            dad_id = dict(dad_opt).get(dad_label)

    # Parent features unified
    st.markdown("**Parent Features (pre-selected to inherit)** " + badge("transgenes") + " " + badge("mutations") + " " + badge("treatments"), unsafe_allow_html=True)
    parent_features = pd.DataFrame(columns=["feature_type", "id", "name", "type", "description", "source", "inherit"])
    if mom_id is not None:
        parent_features = pd.concat([parent_features, linked_features_for_parent(mom_id, catalogs)], ignore_index=True)
    if dad_id is not None:
        parent_features = pd.concat([parent_features, linked_features_for_parent(dad_id, catalogs)], ignore_index=True)
    parent_features.drop_duplicates(subset=["feature_type", "id"], inplace=True, ignore_index=True)

    # Catalog options to add more features
    st.subheader("2) Add/Adjust Features")
    colA, colB, colC = st.columns(3)
    with colA:
        tg_opt = to_options(catalogs["transgenes"], "name", "id")
        add_tg = st.multiselect("Add transgenes", options=[lbl for (lbl, _) in tg_opt], default=[])
    with colB:
        mu_opt = to_options(catalogs["mutations"], "name", "id")
        add_mu = st.multiselect("Add mutations", options=[lbl for (lbl, _) in mu_opt], default=[])
    with colC:
        tr_opt = to_options(catalogs["treatments"], "name", "id")
        add_tr = st.multiselect("Add treatments", options=[lbl for (lbl, _) in tr_opt], default=[])

    # Inline: add a brand-new treatment
    with st.expander("➕ Add a brand-new treatment"):
        new_tr_name = st.text_input("Treatment name")
        new_tr_type = st.text_input("Treatment type")
        new_tr_desc = st.text_area("Treatment description")
        create_new_tr = st.checkbox("Insert this new treatment and include it")

    new_tr_id: Optional[int] = None
    if create_new_tr and new_tr_name:
        new_tr_id = insert_new_treatment_if_needed(sb, new_tr_name, new_tr_type, new_tr_desc)
        if new_tr_id is not None:
            st.success(f"New treatment created (id={new_tr_id}). It will be included.")

    # Build unified features DataFrame
    extra_rows = []
    if add_tg:
        tg_map = dict(tg_opt)
        for lbl in add_tg:
            extra_rows.append({"feature_type": "transgene", "id": tg_map.get(lbl), "name": lbl, "type": "", "description": "", "source": "added", "inherit": True})
    if add_mu:
        mu_map = dict(mu_opt)
        for lbl in add_mu:
            extra_rows.append({"feature_type": "mutation", "id": mu_map.get(lbl), "name": lbl, "type": "", "description": "", "source": "added", "inherit": True})
    if add_tr:
        tr_map = dict(tr_opt)
        for lbl in add_tr:
            extra_rows.append({"feature_type": "treatment", "id": tr_map.get(lbl), "name": lbl, "type": "", "description": "", "source": "added", "inherit": True})
    if new_tr_id is not None:
        extra_rows.append({"feature_type": "treatment", "id": new_tr_id, "name": new_tr_name, "type": new_tr_type, "description": new_tr_desc, "source": "added-new", "inherit": True})

    unified_features = pd.concat([parent_features, pd.DataFrame(extra_rows)], ignore_index=True)
    if unified_features.empty:
        unified_features = pd.DataFrame(columns=["feature_type", "id", "name", "type", "description", "source", "inherit"])

    st.markdown("**Unified Features Table** (toggle the 'inherit' column to include/exclude items)")
    unified_features = st.data_editor(
        unified_features,
        num_rows="dynamic",
        hide_index=True,
        column_config={
            "feature_type": st.column_config.SelectboxColumn("feature_type", options=["transgene", "mutation", "treatment"], required=True),
            "id": st.column_config.NumberColumn("id", help="Catalog ID"),
            "name": st.column_config.TextColumn("name", width="medium"),
            "type": st.column_config.TextColumn("type", width="small"),
            "description": st.column_config.TextColumn("description", width="large"),
            "source": st.column_config.TextColumn("source", disabled=True),
            "inherit": st.column_config.CheckboxColumn("inherit", help="Include this feature for the new fish"),
        },
        use_container_width=True,
        key="features_editor",
    )

    # Fish details (single row editor)
    st.subheader("3) Fish Details")
    today = dt.date.today().isoformat()
    fish_details_df = pd.DataFrame([{
        "fish_code": "",
        "name": "",
        "date_birth": today,
        "sex": "",
        "line_build": False,
        "description": "",
    }])
    fish_details_df = st.data_editor(
        fish_details_df,
        num_rows=1,
        hide_index=True,
        column_config={
            "fish_code": st.column_config.TextColumn("fish_code", help="e.g., FSH-2025-0123"),
            "name": st.column_config.TextColumn("name"),
            "date_birth": st.column_config.DateColumn("date_birth"),
            "sex": st.column_config.SelectboxColumn("sex", options=["F", "M", "U"]),
            "line_build": st.column_config.CheckboxColumn("line_build"),
            "description": st.column_config.TextColumn("description", width="large"),
        },
        use_container_width=True,
        key="fish_details_editor",
    )
    fish_details = fish_details_df.iloc[0].to_dict()

    # Preview
    st.subheader("4) Preview")
    payload = create_fish_payload(fish_details, unified_features, mom_id, dad_id)
    st.json(payload, expanded=False)

    # Create button
    st.subheader("5) Create")
    if st.button("Create New Fish", type="primary"):
        result = create_fish_in_supabase(sb, payload)
        if result.get("status") == "ok":
            st.success(f"✅ Fish created (id={result.get('fish_id')}).")
        elif result.get("status") == "partial":
            st.warning(f"⚠️ Fish created (id={result.get('fish_id')}) but feature linking had issues: {result.get('error')}")
        elif result.get("status") == "error":
            st.error(f"❌ Create failed: {result.get('error')}")
        else:
            st.info("Running in mock mode (no Supabase vars set). Payload shown above.")

if __name__ == "__main__":
    page()
