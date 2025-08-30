# utils.py
import pandas as pd
from supabase_client import get_client

sb = get_client()

# -------- universal table fetch --------
def fetch_all(table: str, chunk_size: int = 1000, max_rows: int = 50000) -> pd.DataFrame:
    """
    Fetch all rows from a Supabase table with pagination.
    Returns a pandas DataFrame.
    """
    rows, start, end = [], 0, chunk_size - 1
    while start < max_rows:
        res = sb.table(table).select("*").range(start, end).execute()
        batch = res.data
        if not batch:
            break
        rows.extend(batch)
        if len(batch) < chunk_size:
            break
        start, end = end + 1, end + chunk_size
    return pd.DataFrame(rows)

# -------- fish with readable names --------
def fetch_joined_fish(limit: int = 5000) -> pd.DataFrame:
    """
    Fetch fish with joined genotype_name and strain_name.
    """
    df_fish = fetch_all("fish", max_rows=limit)
    if df_fish.empty:
        return df_fish

    df_geno   = fetch_all("genotypes")
    df_strain = fetch_all("background_strains")

    if not df_geno.empty:
        df_fish = df_fish.merge(
            df_geno[["id", "genotype_name"]],
            left_on="genotype_id", right_on="id",
            how="left", suffixes=("", "_geno")
        ).drop(columns=["id_geno"], errors="ignore")

    if not df_strain.empty:
        df_fish = df_fish.merge(
            df_strain[["id", "strain_name"]],
            left_on="background_strain_id", right_on="id",
            how="left", suffixes=("", "_strain")
        ).drop(columns=["id_strain"], errors="ignore")

    return df_fish

# -------- transgenes with plasmid name + genotype list --------
def fetch_transgenes_with_names(limit: int = 50000) -> pd.DataFrame:
    """
    Fetch transgenes and attach:
      - plasmid_name from plasmids
      - genotypes: comma-separated genotype_name(s) via genotype_transgenes link table
    """
    df_tg   = fetch_all("transgenes", max_rows=limit)
    if df_tg.empty:
        return df_tg

    df_pl   = fetch_all("plasmids")
    df_gt   = fetch_all("genotypes")
    df_link = fetch_all("genotype_transgenes")

    # plasmid_name
    if not df_pl.empty and "id" in df_pl.columns:
        df_tg = df_tg.merge(
            df_pl[["id", "name"]],
            left_on="plasmid_id", right_on="id",
            how="left", suffixes=("", "_pl")
        ).rename(columns={"name": "plasmid_name"}) \
         .drop(columns=["id_pl"], errors="ignore")

    # genotypes (comma-separated)
    if not df_link.empty and not df_gt.empty:
        df_lj = df_link.merge(
            df_gt[["id", "genotype_name"]],
            left_on="genotype_id", right_on="id",
            how="left", suffixes=("", "_geno")
        ).drop(columns=["id_geno"], errors="ignore")

        genotypes_map = (
            df_lj.groupby("transgene_id")["genotype_name"]
                 .apply(lambda s: ", ".join(sorted(x for x in s.astype(str) if x and x != "nan")))
                 .to_dict()
        )
        df_tg["genotypes"] = df_tg["id"].map(genotypes_map).fillna("")

    # nice column order if present
    preferred = ["id", "transgene_name", "plasmid_id", "plasmid_name", "genotypes", "notes", "created_at", "updated_at"]
    cols = [c for c in preferred if c in df_tg.columns] + [c for c in df_tg.columns if c not in preferred]
    return df_tg[cols]
