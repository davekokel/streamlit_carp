# pages/plasmids_view_elements.py
# ------------------------------------------------------------
# View plasmids and drill into associated plasmid_elements
#
# Requirements:
#   pip install streamlit supabase pandas streamlit-aggrid postgrest
#   (and add "streamlit-aggrid" to requirements.txt)
# ------------------------------------------------------------
import os
import pandas as pd
import streamlit as st
from typing import Optional
from supabase import create_client
from postgrest.exceptions import APIError
from st_aggrid import AgGrid, GridOptionsBuilder, GridUpdateMode

# ------------------------------
# Page config
# ------------------------------
st.set_page_config(page_title="Plasmids → Elements", page_icon="🧬", layout="wide")
st.title("🧬 Plasmids → Elements")
st.caption("Use the toolbar to search. Select a plasmid to see its **linked plasmid_elements** below.")

# ------------------------------
# Supabase client
# ------------------------------
SUPABASE_URL = st.secrets.get("SUPABASE_URL")
# Prefer service role (read-only usage here) but fall back to anon
SERVICE_ROLE_KEY = (
    st.secrets.get("SERVICE_ROLE_KEY")
    or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
    or st.secrets.get("SUPABASE_SERVICE_KEY")
)
ANON_KEY = st.secrets.get("SUPABASE_ANON_KEY") or st.secrets.get("ANON_KEY")

if not SUPABASE_URL or not (SERVICE_ROLE_KEY or ANON_KEY):
    st.error("Missing Supabase credentials. Set SUPABASE_URL and either SERVICE_ROLE_KEY or ANON_KEY in .streamlit/secrets.toml")
    st.stop()

sb = create_client(SUPABASE_URL, SERVICE_ROLE_KEY or ANON_KEY)

# ------------------------------
# Data access helpers
# ------------------------------
@st.cache_data(show_spinner=False, ttl=60)
def fetch_plasmids(name_q: str | None, notes_q: str | None, id_q: str | None) -> pd.DataFrame:
    """
    Return a DataFrame of plasmids with optional server-side filters.
    Now selects *all* columns from `plasmids`.
    - name_q, notes_q: case-insensitive contains via .ilike('%...%')
    - id_q: if int-like, filter by id exact; else ignored
    """
    try:
        q = sb.table("plasmids").select("*")
        if name_q:
            q = q.ilike("name", f"%{name_q}%")
        if notes_q:
            q = q.ilike("notes", f"%{notes_q}%")
        if id_q:
            try:
                q_id = int(id_q.strip())
                q = q.eq("id", q_id)
            except ValueError:
                pass
        res = q.order("name", desc=False).execute()
    except APIError as e:
        st.error(f"Error fetching plasmids: {e}")
        return pd.DataFrame()

    df = pd.DataFrame(res.data or [])
    if df.empty:
        return df

    # Bring key columns to the front if they exist; keep all others
    preferred = ["id", "name", "description", "resistance", "notes"]
    front = [c for c in preferred if c in df.columns]
    rest = [c for c in df.columns if c not in front]
    df = df[front + rest]

    # Avoid NaN display noise
    return df.where(pd.notnull(df), None)


@st.cache_data(show_spinner=False, ttl=60)
@st.cache_data(show_spinner=False, ttl=60)
def fetch_plasmid_links(plasmid_id: int) -> pd.DataFrame:
    """
    Read from the JOIN table and embed both sides.
    Uses element:plasmid_elements(*) so it won't break if columns differ.
    """
    try:
        res = (
            sb.table("plasmids_plasmid_elements")
              .select("""
                plasmid_id,
                element_id,
                position,
                notes,
                created_at,
                created_by,
                element:plasmid_elements(*),
                plasmid:plasmids(id,name)
              """)
              .eq("plasmid_id", plasmid_id)
              .order("position", desc=False)
              .execute()
        )
    except APIError as e:
        st.error(f"Error fetching links: {e}")
        return pd.DataFrame()

    rows = res.data or []
    if not rows:
        return pd.DataFrame()

    # Flatten while tolerating missing keys
    recs = []
    for r in rows:
        elem = r.get("element") or {}
        recs.append({
            "position": r.get("position"),
            "element_id": r.get("element_id"),
            "element_name": elem.get("name"),
            "element_type": elem.get("element_type"),  # 👈 new
            # prefer element.notes if present, else element.value, else None
            "element_meta": elem.get("notes") if "notes" in elem else elem.get("value"),
            "join_notes": r.get("notes"),
            "plasmid_id": r.get("plasmid_id"),
            "plasmid_name": (r.get("plasmid") or {}).get("name"),
            "created_at": r.get("created_at"),
            "created_by": r.get("created_by"),
        })

    df = pd.DataFrame.from_records(recs)
    # Keep columns stable
    wanted = [
        "position",
        "element_name",
        "element_type",   # 👈 keep order
        "element_meta",
        "join_notes",
        "element_id",
        "plasmid_id",
        "plasmid_name",
        "created_at",
        "created_by",
    ]
    for c in wanted:
        if c not in df.columns:
            df[c] = None
    df = df[wanted]
    return df.where(pd.notnull(df), None)


def _clear_caches():
    fetch_plasmids.clear()
    fetch_plasmid_links.clear()

# ------------------------------
# Toolbar (search & actions)
# ------------------------------
with st.container():
    t1, t2, t3, t4, t5 = st.columns([2, 2, 1.2, 2.5, 1])
    with t1:
        name_q = st.text_input("🔎 Name contains", value="", placeholder="e.g. CMV", label_visibility="visible")
    with t2:
        notes_q = st.text_input("📝 Notes contains", value="", placeholder="text in notes", label_visibility="visible")
    with t3:
        id_q = st.text_input("🆔 ID (exact)", value="", placeholder="e.g. 123", label_visibility="visible")
    with t4:
        quick_filter = st.text_input("⚡ Quick filter (client-side)", value="", placeholder="filters visible grid rows", label_visibility="visible")
    with t5:
        st.button("↻ Refresh", on_click=_clear_caches, use_container_width=True)

# ------------------------------
# Plasmid selector (wide, ~20 visible rows, scroll)
# ------------------------------
st.subheader("Plasmids")

df_plasmids = fetch_plasmids(name_q.strip() or None, notes_q.strip() or None, id_q.strip() or None)

if df_plasmids.empty:
    st.info("No plasmids match your filters.")
    st.stop()

# Build grid options from *all* columns
gob = GridOptionsBuilder.from_dataframe(df_plasmids)
gob.configure_selection(selection_mode="single", use_checkbox=True, rowMultiSelectWithClick=False)

# Helpful column sizing: tweak a few known fields; others use defaults
if "id" in df_plasmids.columns:
    gob.configure_column("id", header_name="ID", width=90)
if "name" in df_plasmids.columns:
    gob.configure_column("name", header_name="Name", width=160)
if "description" in df_plasmids.columns:
    gob.configure_column("description", header_name="Description", width=350, wrapText=True, autoHeight=True)
if "resistance" in df_plasmids.columns:
    gob.configure_column("resistance", header_name="Resistance", width=130)
if "notes" in df_plasmids.columns:
    gob.configure_column("notes", header_name="Notes", width=400, wrapText=True, autoHeight=True)

# Enable sort/filter/resize by default
gob.configure_default_column(resizable=True, filter=True, sortable=True)

grid_opts = gob.build()
if quick_filter:
    grid_opts["quickFilterText"] = quick_filter  # client-side "search anywhere"

grid = AgGrid(
    df_plasmids,
    gridOptions=grid_opts,
    theme="streamlit",
    update_mode=GridUpdateMode.SELECTION_CHANGED,
    allow_unsafe_jscode=False,
    fit_columns_on_grid_load=False,  # keep your custom widths
    height=300,  # ~20 rows visible; scroll for more
)

selected_rows = grid.selected_rows
selected_plasmid: Optional[dict] = dict(selected_rows[0]) if selected_rows else None

# ------------------------------
# Linked elements (below selector)
# ------------------------------
st.subheader("Linked elements")

if not selected_plasmid:
    st.caption("Select a plasmid above to see its linked elements.")
    st.stop()

pid = selected_plasmid.get("id")
pname = selected_plasmid.get("name")
st.markdown(f"**Selected:** `{pname}` (id={pid})")

df_links = fetch_plasmid_links(pid)

if df_links.empty:
    st.info("No elements linked to this plasmid yet.")
    st.stop()

st.dataframe(
    df_links.rename(columns={
        "position": "Position",
        "element_name": "Element",
        "element_meta": "Element Meta",
        "join_notes": "Link Notes",
        "element_id": "Element ID",
        "created_at": "Linked At",
        "created_by": "Linked By",
    }),
    use_container_width=True,
    hide_index=True,
)

# (Optional) Compact summary
with st.expander("Aggregate views (optional)"):
    try:
        agg_names = (
            df_links.sort_values("position", kind="stable")
                    .dropna(subset=["element_name"])
                    .groupby("plasmid_id")["element_name"]
                    .apply(lambda s: " | ".join(map(str, s)))
                    .reset_index()
        )
        agg_names = agg_names.merge(
            df_links[["plasmid_id", "plasmid_name"]].drop_duplicates(),
            on="plasmid_id",
            how="left"
        )
        agg_names = agg_names[["plasmid_id", "plasmid_name", "element_name"]].rename(columns={"element_name": "element_names"})
        st.markdown("**Concatenated element names**")
        st.dataframe(agg_names, use_container_width=True, hide_index=True)
    except Exception as e:
        st.warning(f"Aggregation skipped: {e}")

    try:
        summary_rows = []
        for _, row in df_links.iterrows():
            key = row.get("element_name")
            val = row.get("element_meta") or row.get("join_notes") or ""
            if key:
                summary_rows.append((key, val))
        if summary_rows:
            summary_df = pd.DataFrame(summary_rows, columns=["Element", "Value"]).dropna(how="all")
            st.markdown("**Key → Value summary**")
            st.dataframe(summary_df, use_container_width=True, hide_index=True)
    except Exception as e:
        st.warning(f"Summary skipped: {e}")

# ------------------------------
# Footer
# ------------------------------
st.caption(
    "Server-side filters (name/notes/id) reduce the query to Supabase; "
    "the Quick Filter narrows visible rows client-side in the grid."
)
