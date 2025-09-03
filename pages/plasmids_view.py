# pages/plasmids_view.py
# ------------------------------------------------------------
# View the "plasmids" table from Supabase with search, sorting,
# column selection, refresh, and CSV export.
#
# Requirements:
#   pip install streamlit supabase pandas python-dotenv
#   (Have SUPABASE_URL and a key in env or .streamlit/secrets.toml)
# ------------------------------------------------------------
import os
from typing import List

import pandas as pd
import streamlit as st
from supabase import create_client

# ------------------------------
# Page config
# ------------------------------
st.set_page_config(page_title="Plasmids — View", page_icon="🧬", layout="wide")
st.title("🧬 Plasmids — View")

# ------------------------------
# Supabase client (prefer env, then secrets)
# ------------------------------
SUPABASE_URL = os.getenv("SUPABASE_URL") or st.secrets.get("SUPABASE_URL")
# Use SERVICE_ROLE_KEY for server-only admin reads, or ANON for RLS-protected reads.
SUPABASE_KEY = (
    os.getenv("SUPABASE_SERVICE_ROLE_KEY")
    or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
    or os.getenv("SUPABASE_ANON_KEY")
    or st.secrets.get("SUPABASE_ANON_KEY")
)

if not SUPABASE_URL or not SUPABASE_KEY:
    st.error(
        "Missing Supabase credentials. Set SUPABASE_URL and a key in environment "
        "variables or `.streamlit/secrets.toml`."
    )
    st.stop()

sb = create_client(SUPABASE_URL, SUPABASE_KEY)

# ------------------------------
# Helpers
# ------------------------------
@st.cache_data(show_spinner=False)
def fetch_all(table: str, chunk_size: int = 1000, max_rows: int = 50000) -> pd.DataFrame:
    """Fetch all rows from a Supabase table with pagination."""
    all_rows: List[dict] = []
    start, end = 0, chunk_size - 1
    while start < max_rows:
        res = sb.table(table).select("*").range(start, end).execute()
        rows = res.data or []
        if not rows:
            break
        all_rows.extend(rows)
        if len(rows) < chunk_size:
            break
        start += chunk_size
        end += chunk_size
    return pd.DataFrame(all_rows)

def fuzzy_filter_df(df: pd.DataFrame, query: str) -> pd.DataFrame:
    """Case-insensitive contains across all string-like columns."""
    if not query or df.empty:
        return df
    q = str(query).strip().lower()
    mask = pd.Series(False, index=df.index)
    for col in df.columns:
        # Convert to string to avoid NaN issues, then search
        col_vals = df[col].astype(str).str.lower()
        mask = mask | col_vals.str.contains(q, na=False)
    return df[mask]

# ------------------------------
# Data load
# ------------------------------
with st.spinner("Loading plasmids…"):
    try:
        df_raw = fetch_all("plasmids")
    except Exception as e:
        st.error(f"Error loading plasmids: {e}")
        st.stop()

if df_raw.empty:
    st.info("No rows found in `plasmids`.")
    st.stop()

# ------------------------------
# Sidebar controls
# ------------------------------
with st.sidebar:
    st.header("Filters & Options")
    st.caption("Use these to refine the table view.")

    # Column selection
    default_cols = list(df_raw.columns)
    selected_cols = st.multiselect(
        "Columns to display",
        options=default_cols,
        default=default_cols,
    )

    # Global search
    search_q = st.text_input("Search (all columns)", placeholder="e.g. h2b, CMV, tPT2A…")

    # Sorting
    sort_col = st.selectbox("Sort by", options=default_cols, index=0)
    sort_asc = st.toggle("Ascending", value=True)

    # Limit rows shown (for very large tables)
    show_limit = st.number_input("Max rows to display", min_value=100, max_value=100000, value=5000, step=100)

    # Actions
    col_btn1, col_btn2 = st.columns(2)
    with col_btn1:
        do_refresh = st.button("🔄 Refresh data", use_container_width=True)
    with col_btn2:
        # Download CSV of the currently filtered/selected view (handled after filtering)
        pass

if do_refresh:
    fetch_all.clear()  # clear cache
    with st.spinner("Refreshing…"):
        df_raw = fetch_all("plasmids")

# ------------------------------
# Apply filters
# ------------------------------
df_view = df_raw.copy()
if search_q:
    df_view = fuzzy_filter_df(df_view, search_q)

# Column subset
if selected_cols:
    df_view = df_view[selected_cols]

# Sort & limit
if sort_col in df_view.columns:
    try:
        # Attempt natural sorting for numeric-like columns
        df_view = df_view.sort_values(by=sort_col, ascending=sort_asc, kind="stable")
    except Exception:
        pass

if len(df_view) > show_limit:
    df_view = df_view.head(show_limit)

# ------------------------------
# Summary stats
# ------------------------------
c1, c2, c3 = st.columns(3)
with c1:
    st.metric("Total rows (plasmids)", len(df_raw))
with c2:
    st.metric("Rows shown", len(df_view))
with c3:
    st.metric("Columns shown", len(df_view.columns))

# ------------------------------
# Data table
# ------------------------------
st.write("### Table")
st.caption("Scroll horizontally for wide schemas. Use the search box in the sidebar to filter rows.")
st.dataframe(
    df_view,
    use_container_width=True,
    hide_index=True,
)

# ------------------------------
# CSV download (current view)
# ------------------------------
csv_bytes = df_view.to_csv(index=False).encode("utf-8")
st.download_button(
    "⬇️ Download CSV (current view)",
    data=csv_bytes,
    file_name="plasmids_view.csv",
    mime="text/csv",
)

# ------------------------------
# Debug / schema peek (optional)
# ------------------------------
with st.expander("Columns (schema peek)"):
    st.write(list(df_raw.columns))