
import io
import time
from typing import List, Dict, Any, Tuple
import pandas as pd
import streamlit as st
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from reportlab.pdfbase import pdfmetrics
from supabase import create_client, Client

st.set_page_config(page_title="Tank Labels: All Linked Fields", layout="wide")

# ----------------------------
# Supabase
# ----------------------------
@st.cache_resource
def get_sb() -> Client:
    url = st.secrets["supabase"]["url"]
    key = st.secrets["supabase"]["anon_key"]
    return create_client(url, key)

def _safe_fetch(table: str, limit: int = 100000) -> pd.DataFrame:
    try:
        sb = get_sb()
        res = sb.table(table).select("*").limit(limit).execute()
        data = res.data or []
        return pd.DataFrame(data)
    except Exception:
        return pd.DataFrame()

@st.cache_data(ttl=60)
def fetch_all() -> Dict[str, pd.DataFrame]:
    tables = [
        "tanks",
        "fish_tank_memberships",
        "fish",
        "fish_transgenes",
        "transgenes",
        "fish_treatments",
        "treatments",
        "fish_mounts",
        "mounts",
        "treatment_rnas",
        "rnas",
        "treatment_plasmids",
        "plasmids",
        "treatment_dyes",
        "dyes",
    ]
    dfs = {t: _safe_fetch(t) for t in tables}
    for df in dfs.values():
        if not df.empty:
            for c in df.columns:
                if pd.api.types.is_datetime64_any_dtype(df[c]):
                    df[c] = df[c].astype(str)
    return dfs

# ----------------------------
# Helpers
# ----------------------------
def _coalesce_cols(df: pd.DataFrame, candidates: List[str]) -> pd.Series:
    if df.empty:
        return pd.Series([pd.NA] * 0, dtype="object")
    existing = [c for c in candidates if c in df.columns]
    if not existing:
        return pd.Series([pd.NA] * len(df), index=df.index, dtype="object")
    s = df[existing[0]].copy()
    for c in existing[1:]:
        s = s.where(s.notna(), df[c])
    return s

def _norm_key_cols(df: pd.DataFrame, key_candidates: List[str], out_col: str) -> pd.DataFrame:
    df = df.copy()
    df[out_col] = _coalesce_cols(df, key_candidates)
    return df

def _first_nonempty(row: Dict[str, Any], candidates: List[str], default: str = "") -> str:
    for c in candidates:
        if c in row and pd.notna(row[c]) and str(row[c]).strip() != "":
            return str(row[c])
    return default

def _fmt_list(values: List[str], max_items: int = 9999) -> str:
    uniq = []
    seen = set()
    for v in values:
        s = str(v).strip()
        if s and s not in seen:
            uniq.append(s)
            seen.add(s)
    return ", ".join(uniq)

def _agg_columns(rows: List[Dict[str, Any]], prefix: str, skip: set) -> Dict[str, str]:
    if not rows:
        return {}
    cols = set()
    for r in rows:
        cols.update(list(r.keys()))
    cols = [c for c in cols if c not in skip]
    out = {}
    for c in cols:
        vals = []
        for r in rows:
            v = r.get(c, None)
            if v is None or (isinstance(v, float) and pd.isna(v)):
                continue
            vals.append(v)
        out[f"{prefix}_{c}"] = _fmt_list(vals)
    return out

# ----------------------------
# Build the giant view
# ----------------------------
@st.cache_data(ttl=60)
def build_all_fields_view() -> Tuple[pd.DataFrame, Dict[str, pd.DataFrame]]:
    dfs = fetch_all()
    tanks = dfs["tanks"].copy()
    if tanks.empty:
        return tanks, dfs

    tanks = _norm_key_cols(tanks, ["id_uuid","id"], "__tank_key")

    ftm = dfs["fish_tank_memberships"].copy()
    fish = dfs["fish"].copy()

    ftg = dfs["fish_transgenes"].copy()
    tg = dfs["transgenes"].copy()

    ftx = dfs["fish_treatments"].copy()
    tx = dfs["treatments"].copy()

    fm = dfs.get("fish_mounts", pd.DataFrame()).copy()
    mounts = dfs.get("mounts", pd.DataFrame()).copy()

    trx_rna = dfs.get("treatment_rnas", pd.DataFrame()).copy()
    rna = dfs.get("rnas", pd.DataFrame()).copy()

    trx_plasmid = dfs.get("treatment_plasmids", pd.DataFrame()).copy()
    plasmid = dfs.get("plasmids", pd.DataFrame()).copy()

    trx_dye = dfs.get("treatment_dyes", pd.DataFrame()).copy()
    dye = dfs.get("dyes", pd.DataFrame()).copy()

    # Normalize keys
    if not ftm.empty:
        ftm["__tank_key"] = _coalesce_cols(ftm, ["tank_id_uuid","tank_id"])
        ftm["__fish_key"] = _coalesce_cols(ftm, ["fish_id_uuid","fish_id"])
    if not fish.empty:
        fish = _norm_key_cols(fish, ["id_uuid","id"], "__fish_key")

    if not ftg.empty:
        ftg["__fish_key"] = _coalesce_cols(ftg, ["fish_id_uuid","fish_id"])
        ftg["__tg_key"] = _coalesce_cols(ftg, ["transgene_id_uuid","transgene_id"])
    if not tg.empty:
        tg = _norm_key_cols(tg, ["id_uuid","id"], "__tg_key")

    if not ftx.empty:
        ftx["__fish_key"] = _coalesce_cols(ftx, ["fish_id_uuid","fish_id"])
        ftx["__tx_key"] = _coalesce_cols(ftx, ["treatment_id_uuid","treatment_id"])
    if not tx.empty:
        tx = _norm_key_cols(tx, ["id_uuid","id"], "__tx_key")

    if not fm.empty:
        fm["__fish_key"] = _coalesce_cols(fm, ["fish_id_uuid","fish_id"])
        fm["__mount_key"] = _coalesce_cols(fm, ["mount_id_uuid","mount_id"])
    if not mounts.empty:
        mounts = _norm_key_cols(mounts, ["id_uuid","id"], "__mount_key")

    if not trx_rna.empty:
        trx_rna["__tx_key"] = _coalesce_cols(trx_rna, ["treatment_id_uuid","treatment_id"])
        trx_rna["__rna_key"] = _coalesce_cols(trx_rna, ["rna_id_uuid","rna_id"])
    if not rna.empty:
        rna = _norm_key_cols(rna, ["id_uuid","id"], "__rna_key")

    if not trx_plasmid.empty:
        trx_plasmid["__tx_key"] = _coalesce_cols(trx_plasmid, ["treatment_id_uuid","treatment_id"])
        trx_plasmid["__plasmid_key"] = _coalesce_cols(trx_plasmid, ["plasmid_id_uuid","plasmid_id"])
    if not plasmid.empty:
        plasmid = _norm_key_cols(plasmid, ["id_uuid","id"], "__plasmid_key")

    if not trx_dye.empty:
        trx_dye["__tx_key"] = _coalesce_cols(trx_dye, ["treatment_id_uuid","treatment_id"])
        trx_dye["__dye_key"] = _coalesce_cols(trx_dye, ["dye_id_uuid","dye_id"])
    if not dye.empty:
        dye = _norm_key_cols(dye, ["id_uuid","id"], "__dye_key")

    # Index lookups
    fish_by = {r["__fish_key"]: r for _, r in fish.iterrows()} if not fish.empty else {}
    tg_by = {r["__tg_key"]: r for _, r in tg.iterrows()} if not tg.empty else {}
    tx_by = {r["__tx_key"]: r for _, r in tx.iterrows()} if not tx.empty else {}
    mount_by = {r["__mount_key"]: r for _, r in mounts.iterrows()} if not mounts.empty else {}
    rna_by = {r["__rna_key"]: r for _, r in rna.iterrows()} if not rna.empty else {}
    plasmid_by = {r["__plasmid_key"]: r for _, r in plasmid.iterrows()} if not plasmid.empty else {}
    dye_by = {r["__dye_key"]: r for _, r in dye.iterrows()} if not dye.empty else {}

    # Build relationships
    tank_to_fish: Dict[Any, List[Any]] = {}
    if not ftm.empty:
        for _, r in ftm.iterrows():
            tk = r.get("__tank_key"); fk = r.get("__fish_key")
            if pd.isna(tk) or pd.isna(fk): continue
            tank_to_fish.setdefault(tk, []).append(fk)

    fish_to_tg: Dict[Any, List[Any]] = {}
    if not ftg.empty:
        for _, r in ftg.iterrows():
            fk = r.get("__fish_key"); tgk = r.get("__tg_key")
            if pd.isna(fk) or pd.isna(tgk): continue
            fish_to_tg.setdefault(fk, []).append(tgk)

    fish_to_tx: Dict[Any, List[Any]] = {}
    if not ftx.empty:
        for _, r in ftx.iterrows():
            fk = r.get("__fish_key"); txk = r.get("__tx_key")
            if pd.isna(fk) or pd.isna(txk): continue
            fish_to_tx.setdefault(fk, []).append(txk)

    fish_to_mount: Dict[Any, List[Any]] = {}
    if not fm.empty:
        for _, r in fm.iterrows():
            fk = r.get("__fish_key"); mk = r.get("__mount_key")
            if pd.isna(fk) or pd.isna(mk): continue
            fish_to_mount.setdefault(fk, []).append(mk)

    tx_to_rna: Dict[Any, List[Any]] = {}
    if not trx_rna.empty:
        for _, r in trx_rna.iterrows():
            txk = r.get("__tx_key"); rk = r.get("__rna_key")
            if pd.isna(txk) or pd.isna(rk): continue
            tx_to_rna.setdefault(txk, []).append(rk)

    tx_to_plasmid: Dict[Any, List[Any]] = {}
    if not trx_plasmid.empty:
        for _, r in trx_plasmid.iterrows():
            txk = r.get("__tx_key"); pk = r.get("__plasmid_key")
            if pd.isna(txk) or pd.isna(pk): continue
            tx_to_plasmid.setdefault(txk, []).append(pk)

    tx_to_dye: Dict[Any, List[Any]] = {}
    if not trx_dye.empty:
        for _, r in trx_dye.iterrows():
            txk = r.get("__tx_key"); dk = r.get("__dye_key")
            if pd.isna(txk) or pd.isna(dk): continue
            tx_to_dye.setdefault(txk, []).append(dk)

    # Aggregate
    skip_cols_common = {"__fish_key","__tg_key","__tx_key","__mount_key","__rna_key","__plasmid_key","__dye_key"}
    agg_rows = []
    for _, trow in tanks.iterrows():
        tk = trow["__tank_key"]
        fkeys = tank_to_fish.get(tk, [])
        fish_rows = [fish_by.get(k, {}) for k in fkeys if k in fish_by]

        # Prepare per-tank aggregates
        out = trow.to_dict()

        # Canonical aliases for fish
        fish_alias = {
            "fish_name": _fmt_list([_first_nonempty(fr, ["name","fish_code","id_uuid","id"]) for fr in fish_rows]),
            "fish_code": _fmt_list([_first_nonempty(fr, ["fish_code","name","id_uuid","id"]) for fr in fish_rows]),
            "fish_date_birth": _fmt_list([_first_nonempty(fr, ["date_birth","birth_date","dob"]) for fr in fish_rows]),
            "fish_line_building_stage": _fmt_list([_first_nonempty(fr, ["line_building_stage"]) for fr in fish_rows]),
            "fish_sex": _fmt_list([_first_nonempty(fr, ["sex"]) for fr in fish_rows]),
        }
        out.update(fish_alias)

        # All fish columns aggregated
        fish_dicts = [dict(fr) for fr in fish_rows if isinstance(fr, (pd.Series, dict)) and len(fr) > 0]
        out.update(_agg_columns(fish_dicts, "fish", skip={"__fish_key"}))

        # Transgenes via fish
        tg_rows = []
        for fk in fkeys:
            for tgk in fish_to_tg.get(fk, []):
                r = tg_by.get(tgk, {})
                if r: tg_rows.append(r)
        tg_dicts = [dict(r) for r in tg_rows]
        out.update({
            "transgene_name": _fmt_list([_first_nonempty(r, ["name","descr","id_uuid","id"]) for r in tg_rows]),
        })
        out.update(_agg_columns(tg_dicts, "transgene", skip=skip_cols_common))

        # Treatments via fish
        tx_rows = []
        for fk in fkeys:
            for txk in fish_to_tx.get(fk, []):
                r = tx_by.get(txk, {})
                if r: tx_rows.append(r)
        tx_dicts = [dict(r) for r in tx_rows]
        out.update({
            "treatment_name": _fmt_list([_first_nonempty(r, ["name","type","id_uuid","id"]) for r in tx_rows]),
        })
        out.update(_agg_columns(tx_dicts, "treatment", skip=skip_cols_common))

        # Mounts via fish
        m_rows = []
        for fk in fkeys:
            for mk in fish_to_mount.get(fk, []):
                r = mount_by.get(mk, {})
                if r: m_rows.append(r)
        out.update(_agg_columns([dict(r) for r in m_rows], "mount", skip=skip_cols_common))

        # RNAs / Plasmids / Dyes via treatments
        rna_rows = []
        plasmid_rows = []
        dye_rows = []
        for txr in tx_rows:
            txk = txr.get("__tx_key")
            for rk in tx_to_rna.get(txk, []):
                rr = rna_by.get(rk, {})
                if rr: rna_rows.append(rr)
            for pk in tx_to_plasmid.get(txk, []):
                pr = plasmid_by.get(pk, {})
                if pr: plasmid_rows.append(pr)
            for dk in tx_to_dye.get(txk, []):
                dr = dye_by.get(dk, {})
                if dr: dye_rows.append(dr)

        out.update(_agg_columns([dict(r) for r in rna_rows], "rna", skip=skip_cols_common))
        out.update(_agg_columns([dict(r) for r in plasmid_rows], "plasmid", skip=skip_cols_common))
        out.update(_agg_columns([dict(r) for r in dye_rows], "dye", skip=skip_cols_common))

        agg_rows.append(out)

    view = pd.DataFrame(agg_rows)
    # Ensure strings for mixed columns
    for c in view.columns:
        if c.startswith(("fish_", "transgene_", "treatment_", "mount_", "rna_", "plasmid_", "dye_")):
            view[c] = view[c].astype(str)
    return view, dfs

# ----------------------------
# PDF generation
# ----------------------------
def fit_font(text: str, font_name: str, max_w: float, max_size: int, min_size: int = 6) -> int:
    size = max_size
    while size > min_size and pdfmetrics.stringWidth(text, font_name, size) > max_w:
        size -= 1
    return max(size, min_size)

def _wrap_line(text: str, font_name: str, size: int, max_w: float) -> List[str]:
    words = str(text).split()
    lines = []
    cur = ""
    for w in words:
        test = (cur + " " + w).strip()
        if pdfmetrics.stringWidth(test, font_name, size) <= max_w or not cur:
            cur = test
        else:
            lines.append(cur)
            cur = w
    if cur:
        lines.append(cur)
    return lines

def make_labels_pdf(rows: pd.DataFrame, main_field: str, sub_fields: List[str], w_in: float, h_in: float, margin_in: float) -> bytes:
    w = w_in * inch
    h = h_in * inch
    m = margin_in * inch
    buf = io.BytesIO()
    c = canvas.Canvas(buf, pagesize=(w, h))
    for _, r in rows.iterrows():
        main_text = str(r.get(main_field, "") or "")
        subs = []
        for f in sub_fields:
            if f != main_field and f in r and pd.notna(r[f]) and str(r[f]).strip() != "":
                subs.append(f"{f}: {r[f]}")

        avail_w = max(w - 2 * m, 10)
        main_size = fit_font(main_text, "Helvetica-Bold", avail_w, max_size=int(min(w, h) * 0.32))
        c.setFont("Helvetica-Bold", main_size)
        main_y = h/2 + main_size*0.35
        c.drawCentredString(w/2, main_y, main_text)

        base_sub_size = max(int(main_size * 0.38), 8)
        y = main_y - base_sub_size*1.4
        max_lines = 6
        used_lines = 0
        for line in subs:
            if used_lines >= max_lines:
                break
            wrapped = _wrap_line(line, "Helvetica", base_sub_size, avail_w)
            for wl in wrapped:
                if used_lines >= max_lines:
                    break
                line_size = fit_font(wl, "Helvetica", avail_w, max_size=base_sub_size)
                c.setFont("Helvetica", line_size)
                c.drawCentredString(w/2, y, wl)
                y -= line_size*1.15
                used_lines += 1

        c.showPage()
    c.save()
    return buf.getvalue()

# ----------------------------
# UI
# ----------------------------
st.title("Tank Labels — All Linked Fields")
view, dfs = build_all_fields_view()
if view.empty:
    st.warning("No tanks found or unable to load linked data.")
    st.stop()

# Global search on top
c_top1, c_top2 = st.columns([3,2])
with c_top1:
    q = st.text_input("Global search", "")
with c_top2:
    search_all = st.toggle("Search across all fields", value=True)

if q.strip():
    search_cols = list(view.columns) if search_all else [c for c in ["tank_code","name","fish_name","transgene_name","treatment_name"] if c in view.columns]
    mask_parts = []
    for c in search_cols:
        mask_parts.append(view[c].astype(str).str.contains(q, case=False, na=False))
    if mask_parts:
        mask = pd.concat(mask_parts, axis=1).any(axis=1)
        view = view.loc[mask]

# Field selection table with checkboxes
st.subheader("Fields")
all_fields = [c for c in view.columns if not c.startswith("__")]
default_fields = [c for c in ["tank_code","name","location","status","fish_name","fish_date_birth","fish_line_building_stage","transgene_name","treatment_name"] if c in all_fields]
fields_df = pd.DataFrame({"use": [c in default_fields for c in all_fields], "field": all_fields, "order": list(range(1, len(all_fields)+1))})
fields_df = st.data_editor(
    fields_df,
    hide_index=True,
    use_container_width=True,
    column_config={
        "use": st.column_config.CheckboxColumn("Use", default=False),
        "field": st.column_config.TextColumn("Field", disabled=True),
        "order": st.column_config.NumberColumn("Order", min_value=1, step=1),
    }
)
fields_df["order"] = pd.to_numeric(fields_df["order"], errors="coerce").fillna(0).astype(int)
chosen = fields_df[fields_df["use"] == True].copy()
ordered_fields = chosen.sort_values(["order","field"])["field"].tolist()

# Data grid with checkbox first column
st.subheader("Rows")
grid_cols = ordered_fields if ordered_fields else default_fields or all_fields[:12]
missing = [c for c in grid_cols if c not in view.columns]
if missing:
    st.warning(f"Missing columns resolved: {missing}")
grid_cols = [c for c in grid_cols if c in view.columns]

data = view[grid_cols].copy()
if "selected" not in data.columns:
    data.insert(0, "selected", True)

edited = st.data_editor(
    data,
    hide_index=True,
    use_container_width=True,
    column_config={"selected": st.column_config.CheckboxColumn("Print", default=True)},
)
sel = edited[edited["selected"] == True]
st.caption(f"{len(sel)}/{len(edited)} selected")

# Label settings
st.subheader("Label settings")
main_candidates = [c for c in ["tank_code","name","fish_name","transgene_name","treatment_name"] if c in view.columns] or list(view.columns)
label_main_field = st.selectbox("Main field (big text)", options=list(view.columns), index=(list(view.columns).index(main_candidates[0]) if main_candidates else 0))
label_sub_fields = st.multiselect(
    "Extra lines (small text)",
    options=[c for c in view.columns if c != label_main_field],
    default=[c for c in ordered_fields if c != label_main_field] or [c for c in ["name","location","status","fish_name","fish_date_birth","fish_line_building_stage","transgene_name","treatment_name"] if c in view.columns]
)

c1, c2, c3 = st.columns(3)
with c1:
    w_in = st.number_input("Label width (in)", value=3.5, min_value=0.5, step=0.1, format="%.2f")
with c2:
    h_in = st.number_input("Label height (in)", value=1.12, min_value=0.5, step=0.1, format="%.2f")
with c3:
    margin_in = st.number_input("Margin (in)", value=0.10, min_value=0.0, step=0.05, format="%.2f")

colA, colB = st.columns([1,2])
with colA:
    disable_btn = sel.empty or label_main_field not in sel.columns
    if st.button("Generate PDF"):
        if disable_btn:
            st.error("Select at least one row and ensure the chosen main field exists.")
        else:
            pdf_bytes = make_labels_pdf(sel, label_main_field, label_sub_fields, w_in, h_in, margin_in)
            fname = f"tank_labels_{time.strftime('%Y%m%d-%H%M%S')}.pdf"
            st.download_button("Download labels PDF", data=pdf_bytes, file_name=fname, mime="application/pdf")
with colB:
    st.info("Tip: Use the field table to choose and order columns. The global search filters rows before selection.")
