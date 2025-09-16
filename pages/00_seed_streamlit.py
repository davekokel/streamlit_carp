from pathlib import Path
import io
import pandas as pd
import streamlit as st

st.set_page_config(page_title="Seed Package Viewer", layout="wide")

BASE_SEED_DIR = Path("seed_package")
EXPORT_FILENAMES = {
    "fish": "04_entities_fish.csv",
    "links_fish_tg_allele": "05_links_fish_transgene_alleles.csv",
    "links_tg_plasmid": "05_links_transgene_plasmid.csv",
}

@st.cache_data(show_spinner=False)
def list_seed_packages(base_dir: Path):
    if not base_dir.exists():
        return [], None
    pkgs = sorted([p for p in base_dir.glob("seed_package_*") if p.is_dir()], reverse=True)
    latest = pkgs[0] if pkgs else None
    return pkgs, latest

def read_csv(p: Path):
    return pd.read_csv(p, dtype=str, keep_default_na=False)

def fmt_date_col(s: pd.Series) -> pd.Series:
    dt = pd.to_datetime(s, errors="coerce")
    return dt.dt.strftime("%Y-%m-%d").fillna("")

@st.cache_data(show_spinner=False)
def load_exports(pkg_dir: Path):
    exp = pkg_dir / "export"
    data = {}
    f = exp / EXPORT_FILENAMES["fish"]
    if f.exists():
        df = read_csv(f)
        if "date_birth" in df.columns: df["date_birth"] = fmt_date_col(df["date_birth"])
        data["fish"] = df
    l = exp / EXPORT_FILENAMES["links_fish_tg_allele"]
    if l.exists(): data["links"] = read_csv(l)
    p = exp / EXPORT_FILENAMES["links_tg_plasmid"]
    if p.exists(): data["tg_plasmid"] = read_csv(p)
    m = pkg_dir / "manifest.tsv"
    if m.exists():
        man = pd.read_csv(m, sep="|", header=None, names=["metric","count"])
        data["manifest"] = man
    return data

def download_btn(df: pd.DataFrame, filename: str, label="Download CSV"):
    buf = io.StringIO(); df.to_csv(buf, index=False)
    st.download_button(label, buf.getvalue(), file_name=filename, mime="text/csv")

def combined_view(fish: pd.DataFrame, links: pd.DataFrame):
    if fish is None or links is None or fish.empty or links.empty: return links or pd.DataFrame()
    if "fish_code" not in fish.columns or "fish_code" not in links.columns: return links
    cols_keep = ["fish_code","name","date_birth","line_building_stage","notes"]
    for c in cols_keep:
        if c not in fish.columns: fish[c] = ""
    m = links.merge(fish[cols_keep], on="fish_code", how="left", validate="m:1")
    order = ["fish_code","name","date_birth","line_building_stage",
             "transgene_name","allele_name","zygosity","notes"]
    for c in order:
        if c not in m.columns: m[c] = ""
    return m[order]

def filter_contains(df: pd.DataFrame, col: str, key: str):
    if col not in df.columns: return pd.Series(True, index=df.index)
    val = st.text_input(f"{col} contains", key=key)
    return df[col].str.contains(val, case=False, na=False) if val else pd.Series(True, index=df.index)

def main():
    st.title("🐟 Seed Package Viewer")

    pkgs, latest = list_seed_packages(BASE_SEED_DIR)
    if not pkgs:
        st.error(f"No seed packages under {BASE_SEED_DIR}")
        st.stop()

    sel = st.sidebar.selectbox(
        "Package",
        options=pkgs,
        index=pkgs.index(latest) if latest in pkgs else 0,
        format_func=lambda p: str(p.relative_to(BASE_SEED_DIR)),
    )
    if st.sidebar.button("Reload data"):
        st.cache_data.clear(); st.experimental_rerun()

    st.caption(f"Package: `{sel}`")
    data = load_exports(sel)

    # KPIs
    c = st.columns(5)
    fish = data.get("fish", pd.DataFrame())
    links = data.get("links", pd.DataFrame())
    tgpl = data.get("tg_plasmid", pd.DataFrame())
    man = data.get("manifest")
    def metric(name, fallback):
        if man is not None and name in set(man["metric"]):
            v = int(man.loc[man["metric"].eq(name), "count"].iloc[0]); return f"{v:,}"
        return fallback
    c[0].metric("Fish", metric("fish_total", f"{len(fish):,}"))
    c[1].metric("Allele links", metric("allele_links", f"{len(links):,}"))
    c[2].metric("Constructs", metric("transgenes_constructs", f"{tgpl['transgene_name'].nunique() if 'transgene_name' in tgpl else 0:,}"))
    c[3].metric("Alleles (distinct)", metric("transgene_alleles", f"{links['allele_name'].nunique() if 'allele_name' in links else 0:,}"))
    c[4].metric("Plasmids linked", metric("plasmids_linked", f"{tgpl['plasmid_name'].nunique() if 'plasmid_name' in tgpl else 0:,}"))
    st.divider()

    t1, t2, t3, t4 = st.tabs(["Fish", "Fish ↔ TG Allele", "TG ↔ Plasmid", "Combined"])

    with t1:
        if fish.empty: st.info("No fish export"); 
        else:
            st.write(f"Rows: **{len(fish):,}**")
            st.dataframe(fish, use_container_width=True)
            download_btn(fish, EXPORT_FILENAMES["fish"])

    with t2:
        if links.empty: st.info("No fish↔allele export")
        else:
            st.write(f"Rows: **{len(links):,}**")
            with st.expander("Filters"):
                m = filter_contains(links, "fish_code", "fc")
                m &= filter_contains(links, "transgene_name", "tg")
                m &= filter_contains(links, "allele_name", "al")
                m &= filter_contains(links, "zygosity", "zy")
                links = links.loc[m]
            st.dataframe(links, use_container_width=True)
            download_btn(links, EXPORT_FILENAMES["links_fish_tg_allele"])

    with t3:
        if tgpl.empty: st.info("No tg↔plasmid export")
        else:
            st.write(f"Rows: **{len(tgpl):,}**")
            with st.expander("Filters"):
                m = filter_contains(tgpl, "transgene_name", "tg2")
                m &= filter_contains(tgpl, "plasmid_name", "pl")
                tgpl = tgpl.loc[m]
            st.dataframe(tgpl, use_container_width=True)
            download_btn(tgpl, EXPORT_FILENAMES["links_tg_plasmid"])

    with t4:
        combo = combined_view(fish, data.get("links", pd.DataFrame()))
        if combo is None or combo.empty: st.info("No combined data")
        else:
            st.write(f"Rows: **{len(combo):,}**")
            with st.expander("Filters"):
                m = filter_contains(combo, "fish_code", "c_fc")
                m &= filter_contains(combo, "name", "c_nm")
                m &= filter_contains(combo, "transgene_name", "c_tg")
                m &= filter_contains(combo, "allele_name", "c_al")
                combo = combo.loc[m]
            st.dataframe(combo, use_container_width=True)
            download_btn(combo, "combined_fish_links.csv", "Download combined.csv")

    if man is not None:
        st.divider()
        st.subheader("Manifest")
        st.dataframe(man, use_container_width=True)

if __name__ == "__main__":
    main()
