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
from postgrest.exceptions import APIError
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
# Session state (for parent selection & entry buffer)
# ------------------------------
if "parent_mother_id" not in st.session_state:
    st.session_state.parent_mother_id = None
if "parent_father_id" not in st.session_state:
    st.session_state.parent_father_id = None

# ------------------------------
# Helpers
# ------------------------------
@st.cache_data(ttl=60)
def fetch_fish(limit=500) -> pd.DataFrame:
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

# ---- Linked fetchers (return lists of dicts) ----
@st.cache_data(ttl=60)
def linked_transgenes(fish_id: int) -> list[dict]:
    r = (
        sb.table("fish_transgenes")
          .select("transgenes(id,name,plasmid_id,notes,plasmids(name,marker,resistance))")
          .eq("fish_id", fish_id).execute()
    )
    rows = r.data or []
    out = []
    for row in rows:
        tg = row.get("transgenes") or {}
        pl = tg.get("plasmids") or {}
        out.append({
            "name": tg.get("name"),
            "transgene_notes": tg.get("notes"),   # <-- pull notes from transgenes
            "plasmid_name": pl.get("name"),
            "marker": pl.get("marker"),
            "resistance": pl.get("resistance"),
        })
    return out

@st.cache_data(ttl=60)
def linked_mutations(fish_id: int) -> list[dict]:
    r = (sb.table("fish_mutations")
           .select("mutations(id,name,gene,notes)")
           .eq("fish_id", fish_id).execute())
    rows = r.data or []
    out = []
    for row in rows:
        mu = row.get("mutations") or {}
        out.append({"name": mu.get("name"), "gene": mu.get("gene"), "notes": mu.get("notes")})
    return out

@st.cache_data(ttl=60)
def linked_treatments(fish_id: int) -> list[dict]:
    r = (sb.table("fish_treatments")
           .select("treatments(id,treatment_type,treatment_name,notes)")
           .eq("fish_id", fish_id).execute())
    rows = r.data or []
    out = []
    for row in rows:
        tr = row.get("treatments") or {}
        out.append({"treatment_type": tr.get("treatment_type"), "treatment_name": tr.get("treatment_name"), "notes": tr.get("notes")})
    return out

@st.cache_data(ttl=60)
def linked_strains(fish_id: int) -> list[dict]:
    r = (sb.table("fish_strains")
           .select("strains(id,name,notes)")
           .eq("fish_id", fish_id).execute())
    rows = r.data or []
    out = []
    for row in rows:
        stn = row.get("strains") or {}
        out.append({"name": stn.get("name"), "notes": stn.get("notes")})
    return out

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
        out.update({
            "transgene_notes": "",  # only transgene notes (no 'transgenes' column)
            "mutations": "",
            "treatments": "",
            "strains": "",
        })
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


# ---- DB helpers: find/create & safe links ----
def _find_one(table: str, filters: dict, select_cols: str = "id"):
    q = sb.table(table).select(select_cols)
    for k, v in filters.items():
        q = q.eq(k, v)
    res = q.limit(1).execute()
    rows = res.data or []
    return rows[0] if rows else None

def _insert_returning_id(table: str, payload: dict) -> int | None:
    res = sb.table(table).insert(payload).execute()
    row = (res.data or [{}])[0]
    return row.get("id")

def get_or_create_by_name(table: str, name_field: str, name_val: str, extra: dict | None = None) -> int | None:
    """Simple name-based upsert for lookup tables (mutations, transgenes, strains)."""
    if not name_val:
        return None
    row = _find_one(table, {name_field: name_val}, select_cols="id")
    if row:
        return row.get("id")
    payload = {name_field: name_val}
    if extra:
        payload.update(extra)
    return _insert_returning_id(table, payload)

def get_or_create_treatment(treatment_type: str | None, treatment_name: str | None, notes: str | None) -> int | None:
    """Match on (treatment_type, treatment_name)."""
    if not treatment_name and not treatment_type:
        return None
    filters = {}
    if treatment_type:
        filters["treatment_type"] = treatment_type
    if treatment_name:
        filters["treatment_name"] = treatment_name
    row = _find_one("treatments", filters, select_cols="id")
    if row:
        return row.get("id")
    payload = {"treatment_type": treatment_type, "treatment_name": treatment_name, "notes": notes}
    return _insert_returning_id("treatments", payload)

def safe_link_upsert(table: str, payload: dict, on_conflict: str):
    """
    Upsert a join row (e.g., fish_mutations) using on_conflict to avoid duplicate key errors.
    """
    try:
        sb.table(table).upsert(payload, on_conflict=on_conflict).execute()
    except APIError as e:
        st.warning(f"Link upsert on {table} failed: {e}")

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

# Reorder & fixed-height grid
filtered = filtered.reset_index(drop=True)
front = [c for c in ["id", "name", "date_birth", "line_building_stage", "created_at"] if c in filtered.columns]
rest = [c for c in filtered.columns if c not in front]
filtered = filtered[front + rest]

gob = GridOptionsBuilder.from_dataframe(filtered)
gob.configure_default_column(resizable=True, sortable=True, filter=True)
gob.configure_selection(selection_mode="multiple", use_checkbox=True)
gob.configure_grid_options(
    rowSelection="multiple",
    rowMultiSelectWithClick=True,
    suppressRowClickSelection=False,
    domLayout="normal",
    pagination=True,
    paginationPageSize=25,
)

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

# ------------------------------
# Parent Selection UI
# ------------------------------
st.divider()
st.subheader("👪 Select Parents (choose two, then assign mother/father)")

if len(selected_rows) == 0:
    st.caption("👈 Select **two** rows above to enable parent assignment.")
elif len(selected_rows) == 1:
    st.warning("Select one more fish to assign mother and father.")
elif len(selected_rows) > 2:
    st.error("Please select **exactly two** fish to assign parents.")
else:
    # Exactly two selected
    def label_for(r: dict) -> str:
        rid = r.get("id")
        nm = r.get("name") or f"Fish {rid}"
        stage = r.get("line_building_stage") or ""
        db = r.get("date_birth") or ""
        meta = " · ".join([x for x in [str(db), stage] if x])
        return f"{nm} [id={rid}]" if not meta else f"{nm} [id={rid}] — {meta}"

    options = {label_for(r): r.get("id") for r in selected_rows}

    ids = list(options.values())
    default_mother = st.session_state.parent_mother_id or (ids[0] if ids else None)
    default_father = st.session_state.parent_father_id or (ids[1] if len(ids) > 1 else None)
    if default_mother == default_father and len(ids) == 2:
        default_mother, default_father = ids[0], ids[1]

    c1, c2, c3 = st.columns([1.2, 1.2, 0.6])
    with c1:
        mother_label = st.selectbox(
            "Mother",
            options=list(options.keys()),
            index=list(options.values()).index(default_mother) if default_mother in options.values() else 0,
            key="mother_select_label",
        )
        chosen_mother_id = options[mother_label]
    with c2:
        father_choices = {k: v for k, v in options.items() if v != chosen_mother_id}
        father_label = st.selectbox(
            "Father",
            options=list(father_choices.keys()),
            index=0 if default_father not in father_choices.values() else list(father_choices.values()).index(default_father),
            key="father_select_label",
        )
        chosen_father_id = father_choices[father_label]
    with c3:
        if st.button("↔️ Swap"):
            st.session_state.parent_mother_id = chosen_father_id
            st.session_state.parent_father_id = chosen_mother_id
            try:
                st.rerun()
            except AttributeError:
                st.experimental_rerun()

    st.session_state.parent_mother_id = chosen_mother_id
    st.session_state.parent_father_id = chosen_father_id

    # Pretty summary
    def row_by_id(fid: int) -> dict:
        for r in selected_rows:
            if r.get("id") == fid:
                return r
        return {}

    mrow = row_by_id(chosen_mother_id)
    frow = row_by_id(chosen_father_id)
    st.success(
        f"✅ Assigned **Mother**: {mrow.get('name', '—')} (id={chosen_mother_id})  |  "
        f"**Father**: {frow.get('name', '—')} (id={chosen_father_id})"
    )

    with st.expander("Parent IDs (for use elsewhere)"):
        st.code(
            {
                "mother_fish_id": st.session_state.parent_mother_id,
                "father_fish_id": st.session_state.parent_father_id,
            },
            language="json",
        )

# ------------------------------
# Feature Summary (matches other page)
# ------------------------------
st.divider()
st.subheader("🐟 Feature Summary (from linked tables)")

if not selected_rows:
    st.caption("👈 Select one or more rows above to populate the summary.")
else:
    summary_rows = [build_feature_row(r) for r in selected_rows]
    summary_df = pd.DataFrame(summary_rows)

    # Same fields as the other page:
    summary_cols = [
        "id", "name", "date_birth", "line_building_stage",
        "transgene_notes", "mutations", "treatments", "strains"
    ]
    summary_df = summary_df[[c for c in summary_cols if c in summary_df.columns]]

    # Fill empty/NaN with None for consistency
    summary_df = summary_df.where(pd.notnull(summary_df), None)

    st.dataframe(summary_df, use_container_width=True, hide_index=True)

    csv = summary_df.to_csv(index=False).encode("utf-8")
    st.download_button("Download feature summary (CSV)", csv, "fish_feature_summary.csv", "text/csv")


# ------------------------------
# ➕ Quick Create: single-row entry table (correct dtypes + reliable linking)
# ------------------------------
st.divider()
st.subheader("➕ Create New Fish (quick entry)")

def _init_entry_df() -> pd.DataFrame:
    # Correct dtypes: date as datetime64[ns]
    return pd.DataFrame(
        {
            "name": pd.Series([""], dtype="string"),
            "date_birth": pd.Series([pd.NaT], dtype="datetime64[ns]"),
            "notes": pd.Series([""], dtype="string"),
            "mutation_name": pd.Series([""], dtype="string"),
            "transgene_name": pd.Series([""], dtype="string"),
            "strain_name": pd.Series([""], dtype="string"),
            "treatment_type": pd.Series([""], dtype="string"),
            "treatment_name": pd.Series([""], dtype="string"),
            "treatment_notes": pd.Series([""], dtype="string"),
        }
    )

if "new_fish_entry_df" not in st.session_state:
    st.session_state.new_fish_entry_df = _init_entry_df()
else:
    # Keep dtype stable across reruns
    st.session_state.new_fish_entry_df["date_birth"] = pd.to_datetime(
        st.session_state.new_fish_entry_df["date_birth"], errors="coerce"
    )

edited_df = st.data_editor(
    st.session_state.new_fish_entry_df,
    num_rows="fixed",
    use_container_width=True,
    hide_index=True,
    column_config={
        "name": st.column_config.TextColumn("name"),
        "date_birth": st.column_config.DateColumn("date_birth"),
        "notes": st.column_config.TextColumn("notes"),
        "mutation_name": st.column_config.TextColumn("mutation_name"),
        "transgene_name": st.column_config.TextColumn("transgene_name"),
        "strain_name": st.column_config.TextColumn("strain_name"),
        "treatment_type": st.column_config.TextColumn("treatment_type"),
        "treatment_name": st.column_config.TextColumn("treatment_name"),
        "treatment_notes": st.column_config.TextColumn("treatment_notes"),
    },
    key="new_fish_entry_editor",
)

c_new1, c_new2 = st.columns([1, 1])
with c_new1:
    use_selected_parents = st.checkbox(
        "Use assigned mother/father from above (if set)",
        value=True if (st.session_state.parent_mother_id or st.session_state.parent_father_id) else False,
    )
with c_new2:
    create_clicked = st.button("Create Fish", type="primary")

if create_clicked:
    try:
        row = edited_df.iloc[0].to_dict()

        # --- Validate required fields ---
        name = (row.get("name") or "").strip()
        if not name:
            st.error("Please provide a fish 'name' before creating.")
            st.stop()

        # Normalize date to YYYY-MM-DD
        raw_db = row.get("date_birth")
        if pd.isna(raw_db):
            date_birth_iso = None
        else:
            db_ts = pd.to_datetime(raw_db, errors="coerce")
            date_birth_iso = None if pd.isna(db_ts) else db_ts.date().isoformat()

        notes = (row.get("notes") or "").strip() or None

        mutation_name = (row.get("mutation_name") or "").strip() or None
        transgene_name = (row.get("transgene_name") or "").strip() or None
        strain_name = (row.get("strain_name") or "").strip() or None

        treatment_type = (row.get("treatment_type") or "").strip() or None
        treatment_name = (row.get("treatment_name") or "").strip() or None
        treatment_notes = (row.get("treatment_notes") or "").strip() or None

        # --- Create fish ---
        fish_payload = {
            "name": name,
            "date_birth": date_birth_iso,
            "notes": notes,
        }
        if use_selected_parents:
            if st.session_state.parent_mother_id:
                fish_payload["mother_fish_id"] = st.session_state.parent_mother_id
            if st.session_state.parent_father_id:
                fish_payload["father_fish_id"] = st.session_state.parent_father_id

        fish_res = sb.table("fish").insert(fish_payload).execute()
        new_fish = (fish_res.data or [{}])[0]
        fish_id = new_fish.get("id")
        if not fish_id:
            raise RuntimeError("Fish was not created (no id returned).")

        # --- Lookups & Links (safe upserts) ---
        # Mutation
        if mutation_name:
            mutation_id = get_or_create_by_name("mutations", "name", mutation_name)
            if mutation_id:
                safe_link_upsert(
                    "fish_mutations",
                    {"fish_id": fish_id, "mutation_id": mutation_id},
                    on_conflict="fish_id,mutation_id",
                )

        # Transgene
        if transgene_name:
            transgene_id = get_or_create_by_name("transgenes", "name", transgene_name)
            if transgene_id:
                safe_link_upsert(
                    "fish_transgenes",
                    {"fish_id": fish_id, "transgene_id": transgene_id},
                    on_conflict="fish_id,transgene_id",
                )

        # Strain / background
        if strain_name:
            strain_id = get_or_create_by_name("strains", "name", strain_name)
            if strain_id:
                safe_link_upsert(
                    "fish_strains",
                    {"fish_id": fish_id, "strain_id": strain_id},
                    on_conflict="fish_id,strain_id",
                )

        # Treatment
        if treatment_type or treatment_name or treatment_notes:
            treatment_id = get_or_create_treatment(treatment_type, treatment_name, treatment_notes)
            if treatment_id:
                safe_link_upsert(
                    "fish_treatments",
                    {"fish_id": fish_id, "treatment_id": treatment_id},
                    on_conflict="fish_id,treatment_id",
                )

        st.success(f"✅ Created fish '{name}' (id={fish_id}) and linked features.")
        # Reset entry & refresh grid
        st.session_state.new_fish_entry_df = _init_entry_df()
        fetch_fish.clear()  # invalidate cache
        try:
            st.rerun()
        except AttributeError:
            st.experimental_rerun()

    except Exception as e:
        st.error(f"Error creating fish: {e}")
