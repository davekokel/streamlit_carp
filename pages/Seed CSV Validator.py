from __future__ import annotations
from pathlib import Path
import io
import re
import pandas as pd
import streamlit as st

st.set_page_config(page_title="Seed CSV Validator", layout="wide")

BASE_SEED_DIR = Path("seed_package")
FISH_IMPORT = "04_entities_fish_import.csv"
LINKS_IMPORT = "05_links_fish_transgene_alleles_import.csv"
TG_PLASMID_EXPORT = "05_links_transgene_plasmid.csv"

REQUIRED_FISH_COLS = ["name","date_birth","line_building_stage","notes"]
REQUIRED_LINKS_COLS = ["fish_name","transgene_name","allele_name","zygosity","date_birth"]

ZYGO_ALLOWED = {"het","hom","hemi"}  # advisory only (empty allowed)
TG_NAME_RX = re.compile(r"^\s*Tg\([^)]+\)\s*$", re.IGNORECASE)

def list_packages(base_dir: Path):
    if not base_dir.exists():
        return []
    return sorted([p for p in base_dir.glob("seed_package_*") if p.is_dir()], reverse=True)

def read_csv(path: Path) -> pd.DataFrame:
    return pd.read_csv(path, dtype=str, keep_default_na=False)

def norm_date(s: pd.Series) -> pd.Series:
    dt = pd.to_datetime(s, errors="coerce")
    return dt.dt.strftime("%Y-%m-%d").fillna("")

def safe_trim(s: pd.Series) -> pd.Series:
    return s.astype(str).str.replace(r"\s+", " ", regex=True).str.strip()

def validate_headers(df: pd.DataFrame, required: list[str], label: str) -> list[dict]:
    issues = []
    missing = [c for c in required if c not in df.columns]
    extras = [c for c in df.columns if c not in required]
    if missing:
        issues.append(dict(row=None, field="headers", issue=f"missing: {missing}", severity="ERROR", where=label))
    if extras:
        issues.append(dict(row=None, field="headers", issue=f"unexpected: {extras}", severity="WARN", where=label))
    return issues

def validate_fish(df: pd.DataFrame) -> tuple[pd.DataFrame, list[dict]]:
    issues = []
    for c in REQUIRED_FISH_COLS:
        if c not in df.columns:
            return df, [dict(row=None, field="headers", issue=f"missing column {c}", severity="ERROR", where="fish")]
    d = df.copy()
    d["name"] = safe_trim(d["name"])
    d["date_birth"] = norm_date(d["date_birth"])
    # empty names
    bad = d.index[d["name"].eq("")]
    for i in bad:
        issues.append(dict(row=int(i)+2, field="name", issue="blank", severity="ERROR", where="fish"))
    # bad dates
    bad_date = pd.to_datetime(d["date_birth"], errors="coerce").isna() & d["date_birth"].ne("")
    for i in d.index[bad_date]:
        issues.append(dict(row=int(i)+2, field="date_birth", issue="invalid date (use YYYY-MM-DD or blank)", severity="ERROR", where="fish"))
    # dup by lower(name)+date
    key = d["name"].str.lower() + "||" + d["date_birth"]
    dup_mask = key.duplicated(keep=False)
    for i in d.index[dup_mask]:
        issues.append(dict(row=int(i)+2, field="name/date_birth", issue="duplicate name+date_birth", severity="ERROR", where="fish"))
    return d, issues

def validate_links(df: pd.DataFrame, fish_df: pd.DataFrame, constructs: set[str] | None) -> tuple[pd.DataFrame, list[dict]]:
    issues = []
    for c in REQUIRED_LINKS_COLS:
        if c not in df.columns:
            return df, [dict(row=None, field="headers", issue=f"missing column {c}", severity="ERROR", where="links")]
    d = df.copy()
    for c in ["fish_name","transgene_name","allele_name","zygosity"]:
        d[c] = safe_trim(d[c])
    d["date_birth"] = norm_date(d["date_birth"])

    # required fields
    req = ["fish_name","transgene_name","allele_name"]
    for c in req:
        for i in d.index[d[c].eq("")]:
            issues.append(dict(row=int(i)+2, field=c, issue="blank", severity="ERROR", where="links"))

    # zygosity advisory
    bad_zy = ~(d["zygosity"].str.lower().isin(ZYGO_ALLOWED) | d["zygosity"].eq(""))
    for i in d.index[bad_zy]:
        issues.append(dict(row=int(i)+2, field="zygosity", issue=f"unexpected value '{d.loc[i,'zygosity']}' (allowed: {sorted(ZYGO_ALLOWED)})", severity="WARN", where="links"))

    # transgene name shape
    bad_tg_shape = ~d["transgene_name"].apply(lambda x: bool(TG_NAME_RX.match(x)))
    for i in d.index[bad_tg_shape]:
        issues.append(dict(row=int(i)+2, field="transgene_name", issue="should look like Tg(plasmid)", severity="ERROR", where="links"))

    # transgene known in constructs (if we have export)
    if constructs:
        not_in_cat = ~d["transgene_name"].isin(constructs)
        for i in d.index[not_in_cat]:
            issues.append(dict(row=int(i)+2, field="transgene_name", issue="not found in constructs catalog (export)", severity="WARN", where="links"))

    # duplicates of link triple
    triple = (d["fish_name"].str.lower()+"||"+d["date_birth"]+"||"+
              d["transgene_name"].str.lower()+"||"+d["allele_name"].str.lower())
    dup = triple.duplicated(keep=False)
    for i in d.index[dup]:
        issues.append(dict(row=int(i)+2, field="row", issue="duplicate fish+date+transgene+allele", severity="ERROR", where="links"))

    # fish existence cross-check vs fish_df (by name+optional date)
    fish_keys = set(fish_df["name"].str.lower()+"||"+fish_df["date_birth"])
    for i, r in d.iterrows():
        k = r["fish_name"].lower()+"||"+r["date_birth"]
        k2 = r["fish_name"].lower()+"||"  # allow blank date in links if unique by name
        if r["date_birth"]:
            if k not in fish_keys:
                issues.append(dict(row=int(i)+2, field="fish_name/date_birth", issue="fish not found in fish import", severity="ERROR", where="links"))
        else:
            # blank date: require unique name in fish
            name_matches = (fish_df["name"].str.lower()==r["fish_name"].lower()).sum()
            if name_matches == 0:
                issues.append(dict(row=int(i)+2, field="fish_name", issue="fish name not found in fish import", severity="ERROR", where="links"))
            elif name_matches > 1:
                issues.append(dict(row=int(i)+2, field="fish_name", issue="ambiguous fish name (multiple in fish import; add date_birth here)", severity="ERROR", where="links"))
    return d, issues

def load_constructs(pkg: Path) -> set[str] | None:
    p = pkg/"export"/TG_PLASMID_EXPORT
    if not p.exists():
        return None
    tg = read_csv(p)
    if "transgene_name" not in tg.columns:
        return None
    return set(safe_trim(tg["transgene_name"]))

def issues_df(items: list[dict]) -> pd.DataFrame:
    if not items:
        return pd.DataFrame(columns=["where","row","field","severity","issue"])
    cols = ["where","row","field","severity","issue"]
    return pd.DataFrame(items)[cols].sort_values(["severity","where","row"], ascending=[True,True,True])

def download_btn(df: pd.DataFrame, filename: str, label="Download CSV"):
    buf = io.StringIO(); df.to_csv(buf, index=False)
    st.download_button(label, buf.getvalue(), file_name=filename, mime="text/csv")

def main():
    st.title("Seed CSV Validator")

    pkgs = list_packages(BASE_SEED_DIR)
    if not pkgs:
        st.error(f"No packages under {BASE_SEED_DIR}")
        st.stop()
    pkg = st.selectbox("Seed package", pkgs, index=0, format_func=lambda p: str(p.relative_to(BASE_SEED_DIR)))
    st.caption(f"Package: {pkg}")

    fish_path = pkg/"import"/FISH_IMPORT
    links_path = pkg/"import"/LINKS_IMPORT

    if not fish_path.exists():
        st.error(f"Missing {fish_path}")
        st.stop()
    if not links_path.exists():
        st.error(f"Missing {links_path}")
        st.stop()

    raw_fish = read_csv(fish_path)
    raw_links = read_csv(links_path)
    constructs = load_constructs(pkg)

    fish_clean, fish_issues = validate_fish(raw_fish)
    links_clean, links_issues = validate_links(raw_links, fish_clean, constructs)

    all_issues = fish_issues + links_issues
    df_issues = issues_df(all_issues)

    c1, c2, c3 = st.columns(3)
    c1.metric("Fish rows", f"{len(raw_fish):,}")
    c2.metric("Link rows", f"{len(raw_links):,}")
    c3.metric("Issues", f"{len(df_issues):,}")

    if len(df_issues)==0:
        st.success("No issues found. You’re good to reseed.")
    else:
        st.warning("Review issues below. Errors should be fixed before reseed.")
        st.dataframe(df_issues, use_container_width=True, height=320)

    st.divider()
    st.subheader("Fish import (cleaned preview)")
    st.dataframe(fish_clean, use_container_width=True, height=280)
    download_btn(fish_clean, FISH_IMPORT, "Download cleaned fish CSV")

    st.subheader("Links import (cleaned preview)")
    st.dataframe(links_clean, use_container_width=True, height=280)
    download_btn(links_clean, LINKS_IMPORT, "Download cleaned links CSV")

    if constructs is None:
        st.info("Construct catalog export not found; transgene existence checks limited to shape only.")
    else:
        st.caption(f"Constructs in catalog: {len(constructs)}")

if __name__ == "__main__":
    main()
