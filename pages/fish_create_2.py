# pages/fish_create_2.py
from __future__ import annotations

from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass
from datetime import date

import streamlit as st
import pandas as pd
from postgrest.exceptions import APIError

# ================== Layout: wider by ~25% ====================================
st.set_page_config(layout="wide")
st.markdown(
    """
    <style>
      .block-container { max-width: 85vw !important; }
    </style>
    """,
    unsafe_allow_html=True,
)

# ===== Supabase client helper ================================================
from auth import get_supabase  # cached Supabase client


# ===== Data model ============================================================
@dataclass
class Fish:
    id: int
    name: Optional[str] = None
    date_birth: Optional[str] = None
    notes: Optional[str] = None
    mother_fish_id: Optional[int] = None
    father_fish_id: Optional[int] = None
    line_building_stage: Optional[str] = None
    fish_code: Optional[str] = None
    created_at: Optional[str] = None
    created_by: Optional[str] = None


# ===== Helpers: auth refresh + retry on JWT expired ===========================
def _retry_with_refresh(run_query, *, clear_caches=None):
    sb = get_supabase()
    try:
        return run_query(sb)
    except APIError as e:
        msg = str(e)
        code = getattr(e, "code", None)
        if "JWT expired" in msg or code == "PGRST303":
            try:
                sb.auth.refresh_session()
            except Exception:
                pass
            if clear_caches:
                for f in clear_caches:
                    try: f.clear()
                    except Exception: pass
            return run_query(sb)
        raise


# ===== Cached reads (fish) ===================================================
FISH_COLS = (
    "id, name, date_birth, notes, mother_fish_id, father_fish_id, "
    "line_building_stage, fish_code, created_at, created_by"
)

@st.cache_data(show_spinner=False, ttl=60)
def list_fish(limit: int = 500) -> pd.DataFrame:
    def _call(sb):
        return sb.table("fish").select(FISH_COLS).order("id", desc=True).limit(limit).execute()
    resp = _retry_with_refresh(_call, clear_caches=[list_fish, get_fish_by_ids,
                                                   linked_treatments, linked_transgenes, linked_mutations])
    rows = resp.data or []
    df = pd.DataFrame(rows)
    if "created_at" in df:
        df["created_at"] = pd.to_datetime(df["created_at"], errors="coerce")
    if "date_birth" in df:
        df["date_birth"] = pd.to_datetime(df["date_birth"], errors="coerce").dt.date
    return df


@st.cache_data(show_spinner=False, ttl=60)
def get_fish_by_ids(ids: List[int]) -> List[Fish]:
    if not ids: return []
    def _call(sb):
        return sb.table("fish").select(FISH_COLS).in_("id", ids).execute()
    resp = _retry_with_refresh(_call, clear_caches=[list_fish, get_fish_by_ids,
                                                   linked_treatments, linked_transgenes, linked_mutations])
    rows = resp.data or []
    return [Fish(**r) for r in rows]


# ===== Linked fetchers with namespaced fields ================================
@st.cache_data(show_spinner=False, ttl=60)
def linked_treatments(fish_id: int) -> List[Dict[str, Any]]:
    def _call(sb):
        return (
            sb.table("fish_treatments")
            .select("fish_id, treatment_id, treatments(id, name, type, description)")
            .eq("fish_id", fish_id)
            .execute()
        )
    resp = _retry_with_refresh(_call)
    out: List[Dict[str, Any]] = []
    for r in resp.data or []:
        tr = r.get("treatments") or {}
        out.append({
            "category": "Treatment",
            "treatment_id": tr.get("id"),
            "treatment_name": tr.get("name"),
            "treatment_type": tr.get("type"),
            "treatment_description": tr.get("description"),
            "inherit": False,
        })
    return out


@st.cache_data(show_spinner=False, ttl=60)
def linked_transgenes(fish_id: int) -> List[Dict[str, Any]]:
    def _call(sb):
        return (
            sb.table("fish_transgenes")
            .select("fish_id, transgene_id, transgenes(id, name, type, description)")
            .eq("fish_id", fish_id)
            .execute()
        )
    resp = _retry_with_refresh(_call)
    out: List[Dict[str, Any]] = []
    for r in resp.data or []:
        tg = r.get("transgenes") or {}
        out.append({
            "category": "Transgene",
            "transgene_id": tg.get("id"),
            "transgene_name": tg.get("name"),
            "transgene_type": tg.get("type"),
            "transgene_description": tg.get("description"),
            "inherit": False,
        })
    return out


@st.cache_data(show_spinner=False, ttl=60)
def linked_mutations(fish_id: int) -> List[Dict[str, Any]]:
    def _call(sb):
        return (
            sb.table("fish_mutations")
            .select("fish_id, mutation_id, mutations(id, name)")
            .eq("fish_id", fish_id)
            .execute()
        )
    resp = _retry_with_refresh(_call)
    out: List[Dict[str, Any]] = []
    for r in resp.data or []:
        mu = r.get("mutations") or {}
        out.append({
            "category": "Mutation",
            "mutation_id": mu.get("id"),
            "mutation_name": mu.get("name"),
            "inherit": False,
        })
    return out


# ===== Inserts ===============================================================
def _make_new_fish_payload(
    name: Optional[str], date_birth: Optional[date], notes: Optional[str],
    line_building_stage: Optional[str], fish_code: Optional[str],
    mother_fish_id: Optional[int], father_fish_id: Optional[int],
) -> Dict[str, Any]:
    p = {}
    if name: p["name"] = name
    if date_birth: p["date_birth"] = date_birth.isoformat()
    if notes: p["notes"] = notes
    if line_building_stage: p["line_building_stage"] = line_building_stage
    if fish_code: p["fish_code"] = fish_code
    if mother_fish_id: p["mother_fish_id"] = mother_fish_id
    if father_fish_id: p["father_fish_id"] = father_fish_id
    return p


def create_fish(payload: Dict[str, Any]) -> Optional[int]:
    def _call(sb):
        return sb.table("fish").insert(payload).select("id").execute()
    resp = _retry_with_refresh(_call)
    data = resp.data or []
    return data[0].get("id") if data else None


def insert_links(table: str, rows: List[Dict[str, Any]]) -> None:
    if not rows: return
    def _call(sb):
        return sb.table(table).insert(rows).execute()
    _retry_with_refresh(_call)


def create_treatment(name: str, ttype: Optional[str], desc: Optional[str]) -> int:
    """Create a brand-new treatment and return its ID."""
    payload = {"name": name}
    if ttype: payload["type"] = ttype
    if desc: payload["description"] = desc

    def _call(sb):
        return sb.table("treatments").insert(payload).select("id").execute()
    resp = _retry_with_refresh(_call)
    data = resp.data or []
    if not data:
        raise RuntimeError("Treatment create returned no ID")
    return int(data[0]["id"])


# ===== UI builders ============================================================
def _parent_picker(df_all: pd.DataFrame) -> Tuple[Optional[int], Optional[int]]:
    st.markdown("**Select parents:**")
    parent_df = df_all[["id","name","fish_code","date_birth"]] if not df_all.empty else pd.DataFrame()
    parent_df = parent_df.sort_values("id", ascending=False).reset_index(drop=True)
    parent_df["Mother"] = False
    parent_df["Father"] = False
    edited = st.data_editor(parent_df, hide_index=True, use_container_width=True, key="parent_picker")
    m_ids = edited.loc[edited["Mother"], "id"].tolist() if "Mother" in edited else []
    f_ids = edited.loc[edited["Father"], "id"].tolist() if "Father" in edited else []
    return (m_ids[0] if len(m_ids)==1 else None, f_ids[0] if len(f_ids)==1 else None)


def _parent_links_df(fish_id: Optional[int]) -> pd.DataFrame:
    if not fish_id: return pd.DataFrame()
    rows = linked_treatments(fish_id) + linked_transgenes(fish_id) + linked_mutations(fish_id)
    df = pd.DataFrame(rows)
    # Nice ordering
    cat_order = {"Treatment":0, "Transgene":1, "Mutation":2}
    if not df.empty:
        df["__o"] = df["category"].map(cat_order).fillna(9)
        df = df.sort_values(["__o"], ascending=[True]).drop(columns="__o")
    return df


def _parent_links_editor(df: pd.DataFrame, key: str):
    if df.empty:
        st.caption("No linked items.")
        return df
    cfg = {}
    for col in df.columns:
        # Make all non-boolean columns read-only
        if col == "inherit":
            cfg[col] = st.column_config.CheckboxColumn("Inherit")
        else:
            cfg[col] = st.column_config.TextColumn(col.replace("_", " ").title(), disabled=True)
    return st.data_editor(df, key=key, hide_index=True, use_container_width=True, num_rows="fixed", column_config=cfg)


# ===== Page layout ============================================================
def main():
    st.title("Build a new fish from selected parents")

    # Step 1: Choose parents
    df_all = list_fish(limit=500)
    mother_id, father_id = _parent_picker(df_all)

    st.divider()
    st.subheader("Parent links (inheritance)")

    colL, colR = st.columns(2)
    with colL:
        st.markdown("**Mother**")
        m_df = _parent_links_df(mother_id)
        _parent_links_editor(m_df, "mother_links")

    with colR:
        st.markdown("**Father**")
        f_df = _parent_links_df(father_id)
        _parent_links_editor(f_df, "father_links")

    st.divider()
    st.subheader("New fish details")

    name = st.text_input("Name")
    fish_code = st.text_input("Fish code")
    date_birth = st.date_input("Birth date", value=None, format="YYYY-MM-DD")
    line_stage = st.text_input("Line-building stage")
    notes = st.text_area("Notes")

    # ---- New Treatment at creation ------------------------------------------
    st.markdown("### Optional: Add a brand-new treatment to this fish")
    with st.container(border=True):
        add_new_tr = st.checkbox("Add a new treatment", value=False)
        tr_name = tr_type = tr_desc = None
        if add_new_tr:
            tr_cols = st.columns([2, 1, 2])
            with tr_cols[0]:
                tr_name = st.text_input("Treatment name*", key="new_tr_name", placeholder="e.g., Heat Shock 37°C")
            with tr_cols[1]:
                tr_type = st.text_input("Treatment type", key="new_tr_type", placeholder="e.g., thermal")
            with tr_cols[2]:
                tr_desc = st.text_input("Treatment description", key="new_tr_desc", placeholder="Optional notes…")
            st.caption("Leave unchecked to skip. Only 'Treatment name' is required if adding.")

    # Create
    if st.button("Create new fish", type="primary"):
        try:
            # 1) Create fish
            payload = _make_new_fish_payload(
                name=name or None,
                date_birth=date_birth,
                notes=notes or None,
                line_building_stage=line_stage or None,
                fish_code=fish_code or None,
                mother_fish_id=mother_id,
                father_fish_id=father_id,
            )
            new_id = create_fish(payload)
            if not new_id:
                st.error("Failed to create fish")
                return

            # 2) Collect inherited links (from parents)
            def _collect_ids(key: str, category: str, idcol: str) -> List[int]:
                df = st.session_state.get(key)
                if isinstance(df, pd.DataFrame) and {"inherit","category",idcol}.issubset(df.columns):
                    sub = df[(df["inherit"] == True) & (df["category"] == category)]
                    return sub[idcol].dropna().astype(int).tolist()
                return []

            tr_ids = list(set(
                _collect_ids("mother_links", "Treatment", "treatment_id") +
                _collect_ids("father_links", "Treatment", "treatment_id")
            ))
            tg_ids = list(set(
                _collect_ids("mother_links", "Transgene", "transgene_id") +
                _collect_ids("father_links", "Transgene", "transgene_id")
            ))
            mu_ids = list(set(
                _collect_ids("mother_links", "Mutation", "mutation_id") +
                _collect_ids("father_links", "Mutation", "mutation_id")
            ))

            # 3) If requested, create a brand-new treatment and queue it to link
            if add_new_tr and tr_name:
                try:
                    new_tr_id = create_treatment(tr_name.strip(), (tr_type or None), (tr_desc or None))
                    tr_ids.append(new_tr_id)
                except Exception as e:
                    st.warning(f"New treatment not created: {e}")

            # 4) Insert link rows
            if tr_ids:
                insert_links("fish_treatments", [{"fish_id": new_id, "treatment_id": i} for i in tr_ids])
            if tg_ids:
                insert_links("fish_transgenes", [{"fish_id": new_id, "transgene_id": i} for i in tg_ids])
            if mu_ids:
                insert_links("fish_mutations", [{"fish_id": new_id, "mutation_id": i} for i in mu_ids])

            st.success(
                f"Created fish #{new_id} "
                f"(+ {len(tr_ids)} treatments, {len(tg_ids)} transgenes, {len(mu_ids)} mutations linked)."
            )
        except Exception as e:
            st.error(f"Create failed: {e}")


if __name__ == "__main__":
    main()
