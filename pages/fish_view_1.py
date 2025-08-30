# pages/fish_view_aggrid_feature_summary_linked.py
# ------------------------------------------------------------
# Requirements:
#   pip install streamlit-aggrid
#   (and in requirements.txt: streamlit-aggrid)
# ------------------------------------------------------------
import os
import pandas as pd
import streamlit as st
from supabase import create_client
from st_aggrid import AgGrid, GridOptionsBuilder, GridUpdateMode

# ------------------------------
# Page config
# ------------------------------
st.set_page_config(page_title="Fish (Feature Summary from Links)", page_icon="🐟", layout="wide")
st.title("🐟 Fish — Feature Summary (from linked tables)")

# ------------------------------
# Supabase client (service role)
# ------------------------------
SUPABASE_URL = st.secrets.get("SUPABASE_URL")
SERVICE_ROLE_KEY = st.secrets.get("SERVICE_ROLE_KEY") or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
if not SUPABASE_URL or not SERVICE_ROLE_KEY:
    st.error("Missing SUPABASE_URL or SERVICE_ROLE_KEY in .streamlit/secrets.toml")
    st.stop()
sb = create_client(SUPABASE_URL, SERVICE_ROLE_KEY)

# ------------------------------
# Helpers
# ------------------------------
@st.cache_data(ttl=60)
def fetch_fish(limit=500) -> pd.DataFrame:
    """Fetch fish from Supabase"""
    try:
        resp = sb.table("fish").select("*").order("created_at", desc=True).limit(limit).execute()
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
    if not query.strip():
        return df
    mask = df.astype(str).apply(lambda s: s.str.contains(query, case=False, na=False, regex=False))
    return df[mask.any(axis=1)]

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
    out = []
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
    return [{"name": (mu.get("name")), "gene": mu.get("gene"), "notes": mu.get("notes")}
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
    """Return 'TransgeneName: note' for each linked transgene with notes."""
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
global_q = st.sidebar.text_input("Global search (all columns)", placeholder="e.g. 'cmv', 'amp', '2025-08-29'")
name_filter = st.sidebar.text_input("Name contains")
stage_filter = st.sidebar.text_input("Line building stage contains")

filtered = df.copy()
filtered = global_filter_df(filtered, global_q)

if name_filter:
    filtered = filtered[filtered["name"].str.contains(name_filter, case=False, na=False)]
if stage_filter and "line_building_stage" in filtered.columns:
    filtered = filtered[filtered["line_building_stage"].str.contains(stage_filter, case=False, na=False)]

st.subheader(f"Showing {len(filtered)} of {len(df)} fish")

# Grid
filtered = filtered.reset_index(drop=True)
front = [c for c in ["id", "name", "date_birth", "line_building_stage", "created_at"] if c in filtered.columns]
rest = [c for c in filtered.columns if c not in front]
filtered = filtered[front + rest]

gob = GridOptionsBuilder.from_dataframe(filtered)
gob.configure_default_column(resizable=True, sortable=True, filter=True)
gob.configure_selection(selection_mode="multiple", use_checkbox=True)
gob.configure_grid_options(rowSelection="multiple", domLayout="normal", pagination=True, paginationPageSize=25)

grid = AgGrid(
    filtered,
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
