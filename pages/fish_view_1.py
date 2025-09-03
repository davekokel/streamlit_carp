# pages/fish_view_aggrid_feature_summary_linked.py
# ------------------------------------------------------------
# Auth-protected user page (RLS enforced via anon client from auth.py)
# Requirements:
#   pip install streamlit-aggrid
#   (and in requirements.txt: streamlit-aggrid)
# ------------------------------------------------------------
from __future__ import annotations

import math
import pandas as pd
import streamlit as st
from st_aggrid import AgGrid, GridOptionsBuilder, GridUpdateMode

# --- Auth gate (uses anon client; RLS applies) ---
from auth import auth_ui, sign_out

# ------------------------------
# Page config
# ------------------------------
st.set_page_config(page_title="Fish (Feature Summary from Links)", page_icon="🐟", layout="wide")
st.title("🐟 Fish — Feature Summary (from linked tables)")

# Block until signed in; returns anon-key Supabase client (RLS) + user dict
sb, user = auth_ui()

# Optional sign-out on this page
with st.sidebar:
    st.markdown("**Session**")
    st.caption(f"Signed in as **{user['email']}**")
    if st.button("Sign out"):
        sign_out(sb)
        st.rerun()

# ------------------------------
# Helpers
# ------------------------------
@st.cache_data(ttl=60)
def fetch_fish(limit: int = 500) -> pd.DataFrame:
    """Fetch fish from Supabase (RLS applies)."""
    try:
        resp = (
            sb.table("fish")
              .select("*")
              .order("created_at", desc=True)
              .limit(limit)
              .execute()
        )
        return pd.DataFrame(resp.data or [])
    except Exception as e:
        st.error(f"Error fetching fish: {e}")
        return pd.DataFrame()

def normalize_selection(sel):
    if isinstance(sel, pd.DataFrame):
        return sel.to_dict(orient="records")
    return sel or []

def _uniq_preserve(seq):
    seen = set(); out = []
    for x in seq:
        if x and x not in seen:
            seen.add(x); out.append(x)
    return out

def global_filter_df(df: pd.DataFrame, query: str) -> pd.DataFrame:
    """Case-insensitive literal substring match across ALL columns."""
    q = (query or "").strip()
    if not q:
        return df
    mask = df.astype(str).apply(lambda s: s.str.contains(q, case=False, na=False, regex=False))
    return df[mask.any(axis=1)]

def _split_terms(value: str) -> list[str]:
    """Split a text input on commas/whitespace into non-empty terms."""
    if not value:
        return []
    parts = [p.strip() for chunk in value.split(",") for p in chunk.split()]
    return [p for p in parts if p]

def _contains_any_ci(series: pd.Series, terms: list[str]) -> pd.Series:
    """Case-insensitive 'contains ANY of the terms' for a string series."""
    if not terms:
        return pd.Series(True, index=series.index)
    s = series.fillna("").astype(str).str.lower()
    mask = pd.Series(False, index=series.index)
    for t in terms:
        mask = mask | s.str.contains(t.lower(), na=False)
    return mask

def _combine_masks(mask_a: pd.Series, mask_b: pd.Series, op: str) -> pd.Series:
    op = (op or "AND").upper()
    if op == "OR":
        return mask_a | mask_b
    return mask_a & mask_b  # default AND

# ---- Linked fetchers ----
@st.cache_data(ttl=60)
def linked_transgenes(fish_id: int) -> list[dict]:
    r = (
        sb.table("fish_transgenes")
          .select("transgenes(id,name,notes,plasmids(name,marker,resistance))")
          .eq("fish_id", fish_id)
          .execute()
    )
    rows = r.data or []
    out: list[dict] = []
    for row in rows:
        tg = row.get("transgenes") or {}
        pl = tg.get("plasmids") or {}
        out.append({
            "name": tg.get("name"),
            "transgene_notes": tg.get("notes"),
            "plasmid_name": pl.get("name"),
            "marker": pl.get("marker"),
            "resistance": pl.get("resistance"),
        })
    return out

@st.cache_data(ttl=60)
def linked_mutations(fish_id: int) -> list[dict]:
    r = (
        sb.table("fish_mutations")
          .select("mutations(id,name,gene,notes)")
          .eq("fish_id", fish_id).execute()
    )
    rows = r.data or []
    return [{"name": mu.get("name"), "gene": mu.get("gene"), "notes": mu.get("notes")}
            for row in rows for mu in [row.get("mutations") or {}]]

@st.cache_data(ttl=60)
def linked_treatments(fish_id: int) -> list[dict]:
    r = (
        sb.table("fish_treatments")
          .select("treatments(id,treatment_type,treatment_name,notes)")
          .eq("fish_id", fish_id).execute()
    )
    rows = r.data or []
    return [{"treatment_type": tr.get("treatment_type"), "treatment_name": tr.get("treatment_name"), "notes": tr.get("notes")}
            for row in rows for tr in [row.get("treatments") or {}]]

@st.cache_data(ttl=60)
def linked_strains(fish_id: int) -> list[dict]:
    r = (
        sb.table("fish_strains")
          .select("strains(id,name,notes)")
          .eq("fish_id", fish_id).execute()
    )
    rows = r.data or []
    return [{"name": stn.get("name"), "notes": stn.get("notes")}
            for row in rows for stn in [row.get("strains") or {}]]

# ---- Formatters ----
def fmt_transgene_notes(rows: list[dict]) -> str:
    parts = []
    for r in rows:
        name = (r.get("name") or "").strip()
        note = (r.get("transgene_notes") or "").strip()
        if note:
            parts.append(f"{name + ': ' if name else ''}{note}")
    return "; ".join(_uniq_preserve(parts))

def fmt_mutations(rows: list[dict]) -> str:
    parts = []
    for r in rows:
        name = r.get("name"); gene = r.get("gene")
        parts.append(name if not gene else f"{name} ({gene})")
    return "; ".join(_uniq_preserve(parts))

def fmt_treatments(rows: list[dict]) -> str:
    parts = []
    for r in rows:
        t = r.get("treatment_type"); n = r.get("treatment_name")
        if t and n: parts.append(f"{t}: {n}")
        elif n: parts.append(n)
        elif t: parts.append(str(t))
    return "; ".join(_uniq_preserve(parts))

def fmt_strains(rows: list[dict]) -> str:
    return "; ".join(_uniq_preserve([r.get("name") for r in rows if r.get("name")]))

def build_feature_row(row_dict: dict) -> dict:
    fid = row_dict.get("id")
    out = {
        "id": row_dict.get("id"),
        "name": row_dict.get("name"),
        "date_birth": row_dict.get("date_birth"),
        "line_building_stage": row_dict.get("line_building_stage"),
    }
    if fid is None:
        out.update({"transgene_notes": "", "mutations": "", "treatments": "", "strains": ""})
        return out
    tg_rows = linked_transgenes(int(fid))
    mu_rows = linked_mutations(int(fid))
    tr_rows = linked_treatments(int(fid))
    stn_rows = linked_strains(int(fid))
    out.update({
        "transgene_notes": fmt_transgene_notes(tg_rows),
        "mutations": fmt_mutations(mu_rows),
        "treatments": fmt_treatments(tr_rows),
        "strains": fmt_strains(stn_rows),
    })
    return out

# ------------------------------
# Main display
# ------------------------------
df = fetch_fish(limit=500)
if df.empty:
    st.info("No fish found."); st.stop()

if "created_at" in df.columns:
    df["created_at"] = pd.to_datetime(df["created_at"], errors="coerce")

# Sidebar filters
st.sidebar.header("🔎 Filters")

# Global search (case-insensitive)
global_q = st.sidebar.text_input("Global search (all columns, case-insensitive)",
                                 placeholder="e.g. cmv, amp, 2025-08-29")

# Field-specific searches (comma-separated terms allowed)
name_filter  = st.sidebar.text_input("Name contains (comma-separated terms)")
stage_filter = st.sidebar.text_input("Line building stage contains (comma-separated terms)")
notes_filter = st.sidebar.text_input("Notes contains (comma-separated terms)")  # <-- NEW

# How to combine the field filters together
combine_logic = st.sidebar.radio("Combine Name + Stage + Notes with", options=["AND", "OR"], horizontal=True)

# Grid page size (affects page count)
page_size = st.sidebar.number_input("Rows per page", min_value=10, max_value=200, value=25, step=5)

# ---- Apply filters ----
filtered = df.copy()

# 1) Global filter (case-insensitive across all columns)
filtered = global_filter_df(filtered, global_q)

# 2) Field filters with AND/OR combination, each accepts multiple terms
name_terms  = _split_terms(name_filter)
stage_terms = _split_terms(stage_filter)
notes_terms = _split_terms(notes_filter)

mask_name  = pd.Series(True, index=filtered.index)
mask_stage = pd.Series(True, index=filtered.index)
mask_notes = pd.Series(True, index=filtered.index)

if "name" in filtered.columns and name_terms:
    mask_name = _contains_any_ci(filtered["name"], name_terms)

if "line_building_stage" in filtered.columns and stage_terms:
    mask_stage = _contains_any_ci(filtered["line_building_stage"], stage_terms)

if "notes" in filtered.columns and notes_terms:
    mask_notes = _contains_any_ci(filtered["notes"], notes_terms)

# Combine all three masks using the chosen logic
combined_mask = _combine_masks(mask_name, mask_stage, combine_logic)
combined_mask = _combine_masks(combined_mask, mask_notes, combine_logic)
filtered = filtered[combined_mask]

# Status / counts
total_rows = len(df)
shown_rows = len(filtered)
total_pages = max(1, math.ceil(shown_rows / int(page_size)))

# ------------------------------
# Upper pagination controls (Prev | Page # | Next)
# ------------------------------
if "fish_page" not in st.session_state:
    st.session_state.fish_page = 1

# If filters/page_size change, clamp/reset page
if st.session_state.fish_page > total_pages:
    st.session_state.fish_page = total_pages
if st.session_state.fish_page < 1:
    st.session_state.fish_page = 1

top_l, top_c, top_r = st.columns([1, 2, 1])
with top_l:
    if st.button("◀ Prev", use_container_width=True, disabled=(st.session_state.fish_page <= 1)):
        st.session_state.fish_page -= 1
        st.rerun()
with top_c:
    new_page = st.number_input(
        "Page",
        min_value=1,
        max_value=total_pages,
        value=st.session_state.fish_page,
        step=1,
        key="page_number_input",
        help="Jump to a specific page of fish.",
    )
    if new_page != st.session_state.fish_page:
        st.session_state.fish_page = int(new_page)
        st.rerun()
with top_r:
    if st.button("Next ▶", use_container_width=True, disabled=(st.session_state.fish_page >= total_pages)):
        st.session_state.fish_page += 1
        st.rerun()

st.caption(f"Showing {shown_rows} of {total_rows} fish • Page size: {int(page_size)} • Page {st.session_state.fish_page} of {total_pages}")

# Slice current page
start = (st.session_state.fish_page - 1) * int(page_size)
end = start + int(page_size)
page_df = filtered.iloc[start:end].reset_index(drop=True)

# Grid: bring common cols to the front
front = [c for c in ["id", "name", "date_birth", "line_building_stage", "created_at"] if c in page_df.columns]
rest = [c for c in page_df.columns if c not in front]
page_df = page_df[front + rest]

gob = GridOptionsBuilder.from_dataframe(page_df)
gob.configure_default_column(resizable=True, sortable=True, filter=True)
gob.configure_selection(selection_mode="multiple", use_checkbox=True)
gob.configure_grid_options(domLayout="normal", pagination=False)

grid = AgGrid(
    page_df,
    gridOptions=gob.build(),
    update_mode=GridUpdateMode.SELECTION_CHANGED,
    allow_unsafe_jscode=False,
    theme="balham",
    fit_columns_on_grid_load=True,
    height=420,
)

sel_raw = grid.get("selected_rows", [])
selected_rows = normalize_selection(sel_raw)

st.divider()
st.subheader("🐟 Feature Summary (from linked tables)")

if not selected_rows:
    st.caption("👈 Select one or more rows above to populate the summary.")
    st.stop()

summary_rows = [build_feature_row(r) for r in selected_rows]
summary_df = pd.DataFrame(summary_rows)

summary_cols = ["id", "name", "date_birth", "line_building_stage",
                "transgene_notes", "mutations", "treatments", "strains"]
summary_df = summary_df[[c for c in summary_cols if c in summary_df.columns]]

st.dataframe(summary_df, use_container_width=True, hide_index=True)

csv = summary_df.to_csv(index=False).encode("utf-8")
st.download_button("Download feature summary (CSV)", csv, "fish_feature_summary.csv", "text/csv")