
import re
from typing import Dict, List, Tuple, Optional, Set
import pandas as pd
import streamlit as st
from supabase import create_client, Client

st.set_page_config(page_title="Master Search + Linked Explorer (v20 link-counts always visible)", layout="wide")

# ---------- Supabase ----------
@st.cache_resource
def get_sb() -> Client:
    url = st.secrets["supabase"]["url"]
    key = st.secrets["supabase"]["anon_key"]
    return create_client(url, key)

def _safe_fetch(table: str, limit: int = 100000, filters: Optional[List[Tuple[str, str, object]]] = None) -> pd.DataFrame:
    try:
        sb = get_sb()
        q = sb.table(table).select("*")
        if filters:
            for col, op, val in filters:
                if op == "eq":
                    q = q.eq(col, val)
                elif op == "in":
                    q = q.in_(col, val if isinstance(val, list) else [val])
                elif op == "is":
                    q = q.is_(col, val)
                else:
                    q = q.eq(col, val)
        res = q.limit(limit).execute()
        data = res.data or []
        df = pd.DataFrame(data)
        for c in df.columns:
            if pd.api.types.is_datetime64_any_dtype(df[c]):
                df[c] = df[c].astype(str)
        return df
    except Exception:
        return pd.DataFrame()

@st.cache_data(ttl=60)
def load_tables(tables: List[str], per_table_limit: int) -> Dict[str, pd.DataFrame]:
    return {t: _safe_fetch(t, limit=per_table_limit) for t in tables}

DATAFRAMES: Dict[str, pd.DataFrame] = {}

# ---------- Relationship map ----------
PRIMARY_TABLES = [
    "fish","tanks","transgenes","plasmids","fluors","rna","treatments",
    "mutations","selectedphenotypes","strains","mounts"
]
JOIN_TABLES = {
    "fish_transgenes","fish_tank_memberships","fish_treatments","fish_mounts",
    "fish_mutations","fish_selectedphenotypes","fish_strains",
    "plasmid_fluors","rna_fluors","transgene_fluors","transgenes_fluors",
    "fish_parents"
}

REL: Dict[str, Dict] = {
    "fish": {"pk": "id","parents": {}, "children": {
        "fish_tank_memberships": ["fish_id","fish_id_uuid"],
        "fish_transgenes": ["fish_id_uuid","fish_id"],
        "fish_treatments": ["fish_id","fish_id_uuid"],
        "fish_mounts": ["fish_id","fish_id_uuid"],
        "fish_mutations": ["fish_id","fish_id_uuid"],
        "fish_selectedphenotypes": ["fish_id","fish_id_uuid"],
        "fish_strains": ["fish_id","fish_id_uuid"],
        "fish_parents": ["child_id","child_id_uuid"],
    }},
    "tanks": {"pk": "id","parents": {}, "children": {"fish_tank_memberships": ["tank_id","tank_id_uuid","tank_uuid"]}},
    "transgenes": {"pk": "id","parents": {}, "children": {
        "fish_transgenes": ["transgene_id_uuid","transgene_id"],
        "transgene_fluors": ["transgene_id_uuid","transgene_id"],
        "transgenes_fluors": ["transgene_id_uuid","transgene_id"],
    }},
    "plasmids": {"pk": "id","parents": {}, "children": {"plasmid_fluors": ["plasmid_id","plasmid_id_uuid"]}},
    "fluors": {"pk": "id","parents": {}, "children": {
        "plasmid_fluors": ["fluor_id","fluor_id_uuid"],
        "rna_fluors": ["fluor_id","fluor_id_uuid"],
        "transgene_fluors": ["fluor_id","fluor_id_uuid"],
        "transgenes_fluors": ["fluor_id","fluor_id_uuid"],
    }},
    "rna": {"pk":"id","parents": {}, "children": {"rna_fluors": ["rna_id","rna_id_uuid"]}},
    "treatments": {"pk":"id","parents": {}, "children": {"fish_treatments": ["treatment_id"]}},
    "mutations": {"pk": "id","parents": {}, "children": {"fish_mutations": ["mutation_id","mutation_id_uuid"]}},
    "selectedphenotypes": {"pk": "id","parents": {}, "children": {"fish_selectedphenotypes": ["selectedphenotype_id","selectedphenotype_id_uuid"]}},
    "strains": {"pk": "id","parents": {}, "children": {"fish_strains": ["strain_id","strain_id_uuid"]}},
    "mounts": {"pk": "id","parents": {}, "children": {"fish_mounts": ["mount_id","mount_id_uuid"]}},

    # join tables
    "fish_tank_memberships": {"pk":"id","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "tank_id": ("tanks","id"), "tank_id_uuid": ("tanks","id_uuid"), "tank_uuid": ("tanks","id_uuid")}, "children": {}},
    "fish_transgenes": {"pk":"created_at","parents": {"fish_id_uuid": ("fish","id_uuid"), "transgene_id_uuid": ("transgenes","id_uuid")}, "children": {}},
    "fish_treatments": {"pk":"id","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "treatment_id": ("treatments","id")}, "children": {}},
    "fish_mounts": {"pk":"id","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "mount_id": ("mounts","id"), "mount_id_uuid": ("mounts","id_uuid")}, "children": {}},
    "fish_mutations": {"pk":"created_at","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "mutation_id": ("mutations","id"), "mutation_id_uuid": ("mutations","id_uuid")}, "children": {}},
    "fish_selectedphenotypes": {"pk":"created_at","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "selectedphenotype_id": ("selectedphenotypes","id"), "selectedphenotype_id_uuid": ("selectedphenotypes","id_uuid")}, "children": {}},
    "fish_strains": {"pk":"created_at","parents": {"fish_id": ("fish","id"), "fish_id_uuid": ("fish","id_uuid"), "strain_id": ("strains","id"), "strain_id_uuid": ("strains","id_uuid")}, "children": {}},
    "plasmid_fluors": {"pk":"plasmid_id","parents": {"plasmid_id": ("plasmids","id"), "plasmid_id_uuid": ("plasmids","id_uuid"), "fluor_id": ("fluors","id"), "fluor_id_uuid": ("fluors","id_uuid")}, "children": {}},
    "rna_fluors": {"pk":"rna_id","parents": {"rna_id": ("rna","id"), "rna_id_uuid": ("rna","id_uuid"), "fluor_id": ("fluors","id"), "fluor_id_uuid": ("fluors","id_uuid")}, "children": {}},
    "transgene_fluors": {"pk":"id","parents": {"transgene_id": ("transgenes","id"), "transgene_id_uuid": ("transgenes","id_uuid"), "fluor_id": ("fluors","id"), "fluor_id_uuid": ("fluors","id_uuid")}, "children": {}},
    "transgenes_fluors": {"pk":"transgene_id","parents": {"transgene_id": ("transgenes","id"), "transgene_id_uuid": ("transgenes","id_uuid"), "fluor_id": ("fluors","id"), "fluor_id_uuid": ("fluors","id_uuid")}, "children": {}},
    "fish_parents": {"pk":"child_id","parents": {"child_id": ("fish","id"), "child_id_uuid": ("fish","id_uuid"), "mom_id": ("fish","id"), "mom_id_uuid": ("fish","id_uuid"), "dad_id": ("fish","id"), "dad_id_uuid": ("fish","id_uuid")}, "children": {}},
}

PRIMARY_ORDER = ["fish","tanks","plasmids","fluors","rna","treatments","mutations","selectedphenotypes","strains","mounts","transgenes"]

DISPLAY_PREFS: Dict[str, List[str]] = {
    "fish": ["name","code","fish_code","sex","date_birth","status","line_building_stage","id","id_uuid"],
    "tanks": ["code","tank_code","name","rack","type","volume_l","notes","id","id_uuid"],
    "transgenes": ["name","type","plasmid_id","plasmid_id_uuid","id","id_uuid"],
    "plasmids": ["name","marker","resistance","nickname","id","id_uuid"],
    "fluors": ["name","excitation","emission","tag","id","id_uuid"],
    "rna": ["name","source","id","id_uuid"],
    "treatments": ["id","notes"],
    "mutations": ["name","gene","notes","id","id_uuid"],
    "selectedphenotypes": ["name","type","description","id","id_uuid"],
    "strains": ["name","description","id","id_uuid"],
    "mounts": ["name","type","date_mounted","mounting_orientation","id","id_uuid"],
}

def best_key(df_or_row) -> Optional[str]:
    if isinstance(df_or_row, pd.Series):
        cols = df_or_row.index.tolist()
    else:
        df = df_or_row
        cols = df.columns.tolist() if not df.empty else []
    for c in ["id", "id_uuid", "code", "tank_code", "fish_id", "name"]:
        if c in cols:
            return c
    return cols[0] if cols else None

LABEL_PREFIX_RE = re.compile(r'^\[(?:parent|child|via-child)\]\s+([A-Za-z0-9_]+)')
def base_table_from_label(label: str) -> str:
    m = LABEL_PREFIX_RE.match(label or "")
    if m:
        return m.group(1)
    m2 = re.match(r'^([A-Za-z0-9_]+)\b', label or "")
    if m2:
        return m2.group(1)
    return label or ""

def friendly_project(table: str, df: pd.DataFrame, source_label: str) -> pd.DataFrame:
    if df.empty:
        return df
    prefs = DISPLAY_PREFS.get(table, [])
    extra_patterns = ["name","code","id","uuid","sex","date","dob","genotype","line","strain","status","alive","rack","volume","marker","resistance","emission","excitation","tag"]
    keep = []
    for c in prefs:
        if c in df.columns and c not in keep:
            keep.append(c)
    for pat in extra_patterns:
        for c in df.columns:
            if pat in c.lower() and c not in keep:
                keep.append(c)
    pk = REL.get(table, {}).get("pk", "id")
    if pk in df.columns and pk not in keep:
        keep.append(pk)
    view = df[ [c for c in keep if c in df.columns] ].copy()
    view.insert(0, "Source", source_label)
    return view

def build_friendly_views(grouped: Dict[str, pd.DataFrame]) -> Dict[str, pd.DataFrame]:
    buckets: Dict[str, List[pd.DataFrame]] = {}
    for label, df in grouped.items():
        t = base_table_from_label(label)
        if t in JOIN_TABLES:
            continue
        proj = friendly_project(t, df, label)
        if proj.empty:
            continue
        buckets.setdefault(t, []).append(proj)
    friendly: Dict[str, pd.DataFrame] = {}
    for t, parts in buckets.items():
        cat = pd.concat(parts, ignore_index=True)
        key = REL.get(t, {}).get("pk", best_key(cat))
        if key and key in cat.columns:
            friendly[t] = cat.drop_duplicates(subset=[key])
        else:
            friendly[t] = cat.drop_duplicates()
    return friendly

@st.cache_data(ttl=60)
def search_all(dfs: Dict[str, pd.DataFrame], q: str, regex: bool, case: bool, all_terms: bool) -> Dict[str, pd.DataFrame]:
    out: Dict[str, pd.DataFrame] = {}
    for t, df in dfs.items():
        if df.empty:
            out[t] = pd.DataFrame()
            continue
        sdf = df.astype(str)
        if not q.strip():
            mask = pd.Series([True]*len(df), index=df.index)
        else:
            terms = [q] if regex else q.split()
            def contains(txt: str, term: str) -> bool:
                return term in txt if case else term.lower() in txt.lower()
            def rowmatch(row) -> bool:
                joined = " ".join(row.values)
                if regex:
                    import re as _re
                    flags = 0 if case else _re.IGNORECASE
                    return any(_re.search(term, joined, flags) for term in terms) if not all_terms else all(_re.search(term, joined, flags) for term in terms)
                return any(contains(joined, term) for term in terms) if not all_terms else all(contains(joined, term) for term in terms)
            mask = sdf.apply(rowmatch, axis=1)
        out[t] = df.loc[mask].copy()
    return out

# ---------- UI ----------
st.title("Master Search + Linked Explorer (v20)")

DEFAULT_TABLES = PRIMARY_TABLES + sorted(list(JOIN_TABLES))

with st.sidebar:
    st.header("Data & query options")
    per_table_limit = st.number_input("Rows per table to fetch", min_value=100, max_value=200000, value=20000, step=1000)
    tables_text = st.text_area("Tables to include (comma-separated)", ", ".join(DEFAULT_TABLES))
    tables = [t.strip() for t in tables_text.split(",") if t.strip()]
    st.write(f"{len(tables)} tables configured")
    if st.button("Reload data"):
        st.cache_data.clear()

dfs = load_tables(DEFAULT_TABLES, per_table_limit)
DATAFRAMES = dfs

# Search row
query_col, opts_col = st.columns([3, 2])
with query_col:
    q = st.text_input("🔎 Global search", "", placeholder="Search all tables")
with opts_col:
    regex = st.toggle("Use regex", value=False)
    case = st.toggle("Case sensitive", value=False)
    all_terms = st.toggle("Match all words (AND)", value=False)

direct_hits = search_all(dfs, q, regex, case, all_terms)
counts = {t: len(direct_hits.get(t, pd.DataFrame())) for t in DEFAULT_TABLES}

selectable_tables = [t for t in DEFAULT_TABLES if t not in JOIN_TABLES]
left, right = st.columns([1.2, 3.8])
with left:
    st.subheader("Tables")
    labels = [f"{t}  ({counts.get(t,0)})" for t in selectable_tables]
    default_idx = 0
    for i, t in enumerate(selectable_tables):
        if counts.get(t, 0) > 0:
            default_idx = i
            break
    selected_label = st.radio("Pick a table to view", options=labels, index=default_idx, label_visibility="collapsed")
    selected_table = selectable_tables[labels.index(selected_label)] if selected_label in labels else selectable_tables[default_idx]

with right:
    direct_df = direct_hits.get(selected_table, pd.DataFrame())
    pk_col = REL.get(selected_table, {}).get("pk", "id")
    st.subheader(f"Direct results — {selected_table} ({len(direct_df)} match(es))")

    sel_direct = pd.DataFrame()
    if not direct_df.empty:
        work = direct_df.copy()
        if "_select" not in work.columns:
            work.insert(0, "_select", False)
        cols_no_select = [c for c in work.columns if c != "_select"]
        if pk_col not in cols_no_select and pk_col in work.columns:
            cols_no_select.append(pk_col)
        view = work[["_select"] + cols_no_select][: min(2000, len(work))].copy()
        # unique column names
        seen = set(); uniq = []
        for c in view.columns:
            if c not in seen:
                uniq.append(c); seen.add(c)
            else:
                i=2; nc=f"{c}_{i}"
                while nc in seen:
                    i+=1; nc=f"{c}_{i}"
                uniq.append(nc); seen.add(nc)
        view.columns = uniq

        edited = st.data_editor(
            view,
            use_container_width=True,
            column_config={"_select": st.column_config.CheckboxColumn("Select")},
            disabled=[c for c in view.columns if c not in ["_select"]],
            hide_index=True,
            key=f"editor_dir_{selected_table}"
        )
        sel_direct = edited[edited.get("_select", pd.Series(dtype=bool)) == True].copy() if "_select" in edited.columns else pd.DataFrame()
    else:
        st.caption("No direct matches.")

    # ---------- Drilldown ----------
    if not sel_direct.empty:
        st.markdown("---")
        st.subheader("Drilldown — pick a related table")

        base_df = dfs.get(selected_table, pd.DataFrame())

        # Rehydrate full base rows for selected items using robust keys
        key_cols_candidates = ["id","id_uuid","uuid","code","tank_code"]
        key_cols_candidates += [c for c in base_df.columns if c.endswith("_code") and c not in key_cols_candidates]
        selected_keys: Dict[str, Set[str]] = {kc: set() for kc in key_cols_candidates if kc in base_df.columns}

        for _, row in sel_direct.iterrows():
            for kc in selected_keys.keys():
                if kc in row and pd.notna(row[kc]) and str(row[kc]) != "":
                    selected_keys[kc].add(str(row[kc]))

        if not any(selected_keys.values()):
            for c in base_df.columns:
                if c in ["_select"]: continue
                if c.endswith("_id") or c == "id":
                    vals = set(sel_direct.get(c, pd.Series(dtype=object)).dropna().astype(str).unique().tolist())
                    if vals:
                        selected_keys.setdefault(c, set()).update(vals)

        if not base_df.empty:
            mask = pd.Series([False]*len(base_df), index=base_df.index)
            for kc, vals in selected_keys.items():
                if not vals or kc not in base_df.columns: 
                    continue
                mask = mask | base_df[kc].astype(str).isin(vals)
            selected_full = base_df[mask].copy()
        else:
            selected_full = pd.DataFrame()

        # --- NEW: selected keys snapshot ---
        snap_cols = [c for c in ["id","id_uuid","code","tank_code"] if c in selected_full.columns]
        with st.expander("Selected keys snapshot", expanded=False):
            if selected_full.empty or not snap_cols:
                st.caption("No key columns to display. (Tip: make sure you selected rows with the checkbox, not just highlighted them.)")
            else:
                st.dataframe(selected_full[snap_cols].head(1000), use_container_width=True)

        # Helper funcs
        def _as_str_set(vals) -> Set[str]:
            return {str(v) for v in pd.Series(list(vals)).dropna().unique()}

        def candidate_parent_key_cols(parent_df: pd.DataFrame, p_pk: str) -> List[str]:
            cands = [p_pk, "id_uuid", "uuid", "code", "id"]
            out = []
            for c in cands:
                if c in parent_df.columns and c not in out:
                    out.append(c)
            for c in parent_df.columns:
                lc = c.lower()
                if lc.endswith("_id") or lc.endswith("_uuid") or lc == "code" or lc.endswith("_code"):
                    if c not in out:
                        out.append(c)
            return out

        def _isin_any_cols(df: pd.DataFrame, cols: List[str], values: Set[str]) -> pd.Series:
            if df.empty or not cols or not values:
                return pd.Series([False] * len(df), index=df.index)
            mask = pd.Series([False] * len(df), index=df.index)
            for c in cols:
                if c in df.columns:
                    mask = mask | df[c].astype(str).isin(values)
            return mask

        def candidate_row_values(row: pd.Series, table: str) -> Set[str]:
            vals: Set[str] = set()
            for key in ["id","id_uuid","uuid","code","name","tank_code"]:
                if key in row and pd.notna(row[key]):
                    vals.add(str(row[key]))
            for c in row.index:
                if c.endswith("_code") and pd.notna(row[c]):
                    vals.add(str(row[c]))
            base = table[:-1] if table.endswith("s") else table
            for key in [f"{base}_id", f"{base}_uuid", f"{base}_id_uuid", f"{table}_id", f"{table}_uuid"]:
                if key in row and pd.notna(row[key]):
                    vals.add(str(row[key]))
            for c in row.index:
                lc = c.lower()
                if lc.endswith("_id") or lc.endswith("_uuid") or lc.endswith("_id_uuid"):
                    v = row.get(c)
                    if pd.notna(v) and str(v) != "":
                        vals.add(str(v))
            return {v for v in vals if v not in {"", "None", "nan"}}

        def candidate_child_fk_cols(child_df: pd.DataFrame, selected_table: str, seeded: Optional[List[str]] = None) -> List[str]:
            cols = [c for c in (seeded or []) if c in child_df.columns]
            if child_df.empty:
                return cols
            base = selected_table[:-1] if selected_table.endswith("s") else selected_table
            for c in child_df.columns:
                lc = c.lower()
                if (base in lc or selected_table.lower() in lc) and (lc.endswith("_id") or lc.endswith("_uuid") or lc.endswith("_id_uuid") or lc == base or lc == f"{base}_id" or lc.endswith("_code")):
                    if c not in cols:
                        cols.append(c)
            return cols

        def fetch_parents(table: str, row: pd.Series) -> Dict[str, pd.DataFrame]:
            out: Dict[str, pd.DataFrame] = {}
            rel = REL.get(table, {})
            for fk_col, (p_table, p_pk) in rel.get("parents", {}).items():
                if fk_col in row and pd.notna(row[fk_col]):
                    dfp = DATAFRAMES.get(p_table, pd.DataFrame())
                    if dfp.empty:
                        continue
                    key_cols = candidate_parent_key_cols(dfp, p_pk)
                    vals = _as_str_set([row[fk_col]])
                    mask = _isin_any_cols(dfp, key_cols, vals)
                    rel_rows = dfp[mask]
                    if not rel_rows.empty:
                        out[f"[parent] {p_table}"] = rel_rows
            return out

        def fetch_children(table: str, row: pd.Series) -> Dict[str, pd.DataFrame]:
            out: Dict[str, pd.DataFrame] = {}
            rel_sel = REL.get(table, {})
            seeded_children = rel_sel.get("children", {})
            row_vals = candidate_row_values(row, table)
            for c_table, seeded_fks in seeded_children.items():
                dfc = DATAFRAMES.get(c_table, pd.DataFrame())
                if dfc.empty:
                    continue
                fk_cols = candidate_child_fk_cols(dfc, table, seeded_fks if isinstance(seeded_fks, list) else [seeded_fks])
                mask = _isin_any_cols(dfc, fk_cols, row_vals)
                child_rows = dfc[mask].copy()
                child_rows = child_rows.drop_duplicates()
                if not child_rows.empty:
                    out[f"[child] {c_table}"] = child_rows
            return out

        def fetch_siblings_via_children(table: str, row: pd.Series) -> Dict[str, pd.DataFrame]:
            out: Dict[str, pd.DataFrame] = {}
            children = fetch_children(table, row)
            for c_label, child_rows in children.items():
                c_table = base_table_from_label(c_label)
                child_parents = REL.get(c_table, {}).get("parents", {})
                for child_fk, (p_table, p_pk) in child_parents.items():
                    if p_table == table:
                        continue
                    dfp = DATAFRAMES.get(p_table, pd.DataFrame())
                    if dfp.empty or child_fk not in child_rows.columns:
                        continue
                    p_vals = set(child_rows[child_fk].astype(str).unique())
                    key_cols = candidate_parent_key_cols(dfp, p_pk)
                    mask = _isin_any_cols(dfp, key_cols, p_vals)
                    rel_rows = dfp[mask].copy()
                    rel_rows = rel_rows.drop_duplicates()
                    if not rel_rows.empty:
                        out[f"[via-child] {p_table}"] = rel_rows
            if table == "transgenes":
                base = DATAFRAMES.get("plasmids", pd.DataFrame())
                if not base.empty:
                    vals = set()
                    for col in ["plasmid_id","plasmid_id_uuid"]:
                        if col in row and pd.notna(row[col]):
                            vals.add(str(row[col]))
                    if vals:
                        key_cols = candidate_parent_key_cols(base, "id")
                        mask = _isin_any_cols(base, key_cols, vals)
                        pl = base[mask].copy()
                        if not pl.empty:
                            out["[parent] plasmids"] = pl
            return out

        # Build related for all selected rows
        friendly_bucket: Dict[str, pd.DataFrame] = {}
        path_debug = []  # (label, count)
        for _, sel_row in selected_full.iterrows():
            parents = fetch_parents(selected_table, sel_row)
            children = fetch_children(selected_table, sel_row)
            siblings = fetch_siblings_via_children(selected_table, sel_row)
            grouped = {}; grouped.update(parents); grouped.update(children); grouped.update(siblings)
            for lbl, df in grouped.items():
                path_debug.append((lbl, len(df)))
            friendly = build_friendly_views(grouped)
            for t, df in friendly.items():
                if t not in friendly_bucket:
                    friendly_bucket[t] = df.copy()
                else:
                    friendly_bucket[t] = pd.concat([friendly_bucket[t], df], ignore_index=True)

        # De-dup
        friendly_dedup: Dict[str, pd.DataFrame] = {}
        for t, df in friendly_bucket.items():
            key = REL.get(t, {}).get("pk", best_key(df))
            if key and key in df.columns:
                friendly_dedup[t] = df.drop_duplicates(subset=[key])
            else:
                friendly_dedup[t] = df.drop_duplicates()

        # --- ALWAYS VISIBLE: Link path counts ---
        with st.expander("Link path counts", expanded=False):
            if not path_debug:
                st.caption("No link paths found for the current selection.")
                st.caption("Tips: include join tables in the sidebar list; increase 'Rows per table'; make sure you checked the rows (not just highlighted).")
            else:
                for lbl, cnt in path_debug[:200]:
                    st.caption(f"{lbl}: {cnt}")

        if not friendly_dedup:
            st.caption("No linked data for your selection.")
        else:
            ordered = [t for t in PRIMARY_TABLES if t in friendly_dedup] + [t for t in friendly_dedup.keys() if t not in PRIMARY_TABLES]
            options = [f"{t}  ({len(friendly_dedup[t])})" for t in ordered]
            default_idx = 0
            for i, t in enumerate(ordered):
                if len(friendly_dedup[t]) > 0:
                    default_idx = i
                    break
            chosen_label = st.radio("Related tables", options=options, index=default_idx, label_visibility="collapsed")
            chosen_table = ordered[options.index(chosen_label)] if chosen_label in options else ordered[default_idx]

            df_show = friendly_dedup.get(chosen_table, pd.DataFrame())
            if df_show.empty:
                st.caption("No rows in this related table.")
            else:
                cols = [c for c in df_show.columns if c != "Source"] + (["Source"] if "Source" in df_show.columns else [])
                st.dataframe(df_show[cols].head(1000), use_container_width=True)
    else:
        st.caption("Tip: select one or more rows above to drill down into their linked data.")
