from __future__ import annotations

import pandas as pd
import streamlit as st

st.set_page_config(page_title="Fish & Tanks Admin", layout="wide")

def _noop_auth_ui(*args, **kwargs):
    return None

def _resolve_client_and_user():
    try:
        from lib.config import make_supabase_client
    except Exception:
        make_supabase_client = None
    try:
        from utils_auth import ensure_auth
    except Exception:
        ensure_auth = None
    if ensure_auth is not None:
        for args in ((make_supabase_client, _noop_auth_ui), (_noop_auth_ui,), tuple()):
            try:
                res = ensure_auth(*[a for a in args if a is not None])
                if isinstance(res, tuple) and len(res) >= 1:
                    return res[0], (res[1] if len(res) > 1 else None)
                if res is not None:
                    return res, None
            except TypeError:
                continue
            except Exception:
                break
    try:
        if make_supabase_client is not None:
            sb = make_supabase_client()
        else:
            from supabase import create_client
            url = st.secrets["supabase"]["url"]
            key = st.secrets["supabase"]["anon_key"]
            sb = create_client(url, key)
        acc = st.session_state.get("sb_access_token")
        ref = st.session_state.get("sb_refresh_token")
        if acc and ref:
            try:
                sb.auth.set_session(acc, ref)
            except Exception:
                pass
        try:
            u = sb.auth.get_user()
            user = getattr(u, "user", None) or getattr(u, "data", None) or u
        except Exception:
            user = None
        return sb, user
    except Exception as e:
        st.error(f"Auth/client setup failed: {e}")
        st.stop()

sb, user = _resolve_client_and_user()

@st.cache_data(ttl=20, show_spinner=False)
def load_data():
    fish = sb.table("fish").select("*").execute().data or []
    tanks = sb.table("tanks").select("*").execute().data or []
    df_fish = pd.DataFrame(fish)
    df_tanks = pd.DataFrame(tanks)
    if not df_fish.empty and "date_birth" in df_fish.columns:
        try:
            df_fish["date_birth"] = pd.to_datetime(df_fish["date_birth"], errors="coerce")
        except Exception:
            pass
    if not df_fish.empty and not df_tanks.empty and "fish_id_uuid" in df_tanks.columns:
        tn = (
            df_tanks[[c for c in ["id","code","name","fish_id_uuid"] if c in df_tanks.columns]]
            .rename(columns={"code":"tank_code","name":"tank_name"})
        )
        grp = tn.groupby("fish_id_uuid").apply(lambda d: ", ".join(sorted(d["tank_code"].fillna(d["tank_name"]).astype(str).unique()))).rename("current_tanks")
        df_fish = df_fish.merge(grp, left_on="id", right_index=True, how="left")
        if "current_tanks" in df_fish:
            df_fish["current_tanks"] = df_fish["current_tanks"].fillna("")
    for d in (df_fish, df_tanks):
        if not d.empty:
            d.reset_index(drop=True, inplace=True)
    return df_fish, df_tanks

st.title("Fish & Tanks Admin")

df_fish, df_tanks = load_data()
st.caption(f"Loaded {len(df_fish)} fish · {len(df_tanks)} tanks")

fish_cols_pref = [
    "id","code","fish_code","name","date_birth","line_building_stage",
    "mother_fish_id_uuid","father_fish_id_uuid","notes","created_at","created_by","current_tanks",
]
fish_readonly = [c for c in ["id","created_at","created_by","current_tanks"] if c in df_fish.columns]
fish_mutable = [c for c in df_fish.columns if c not in fish_readonly]

fish_edit_df = pd.DataFrame({c: [] for c in fish_cols_pref}) if df_fish.empty else df_fish[[c for c in fish_cols_pref if c in df_fish.columns] + [c for c in df_fish.columns if c not in fish_cols_pref]].copy()
for c in fish_readonly:
    if c in fish_edit_df.columns:
        fish_edit_df[c] = fish_edit_df[c].astype(str)

fish_cfg = {}
if "date_birth" in fish_edit_df.columns and pd.api.types.is_datetime64_any_dtype(fish_edit_df["date_birth"]):
    fish_cfg["date_birth"] = st.column_config.DateColumn("date_birth")

with st.container(border=True):
    st.subheader("Fish")
    edited_fish = st.data_editor(
        fish_edit_df,
        hide_index=True,
        disabled=[c for c in fish_readonly if c in fish_edit_df.columns],
        use_container_width=True,
        num_rows="dynamic",
        column_config=(fish_cfg if fish_cfg else None),
        key="fish_editor",
    )
    c1, c2 = st.columns(2)
    with c1:
        if st.button("Apply Fish Changes", type="primary", use_container_width=True):
            before = fish_edit_df.copy()
            after = edited_fish.copy()
            key_field = "id"
            keys = [key_field]
            mut = [c for c in fish_mutable if c in after.columns and c != key_field]
            o = before[keys + [c for c in mut if c in before.columns]] if not before.empty else pd.DataFrame(columns=keys+mut)
            e = after[keys + mut]
            merged = o.merge(e, on=keys, how="outer", suffixes=("_o","_e"), indicator=True)
            updates = []
            for _, row in merged.iterrows():
                if row["_merge"] == "right_only":
                    payload = {k: row[k] for k in keys+mut if k in merged.columns and pd.notna(row[k])}
                    updates.append(payload)
                elif row["_merge"] == "both":
                    changed = {}
                    for c in mut:
                        eo, ee = f"{c}_o", f"{c}_e"
                        if eo in merged.columns and ee in merged.columns:
                            vo, ve = row[eo], row[ee]
                            if (pd.isna(vo) and pd.notna(ve)) or (pd.notna(vo) and pd.isna(ve)) or (str(vo) != str(ve)):
                                changed[c] = ve
                    if changed:
                        base = {k: row[k] for k in keys}
                        base.update(changed)
                        updates.append(base)
            if updates:
                norm = []
                for p in updates:
                    q = dict(p)
                    if "date_birth" in q and pd.notna(q["date_birth"]):
                        try:
                            q["date_birth"] = pd.to_datetime(q["date_birth"]).date().isoformat()
                        except Exception:
                            pass
                    norm.append(q)
                try:
                    sb.table("fish").upsert(norm, on_conflict="id").execute()
                    load_data.clear()
                    st.success(f"Upserted {len(norm)} fish row(s)")
                except Exception as e:
                    st.error("Fish upsert failed. Ensure RLS allows UPDATE/INSERT and 'id' is present for updates.")
                    st.exception(e)
            else:
                st.info("No changes detected")
    with c2:
        if st.button("Reset Fish Edits", use_container_width=True):
            st.rerun()

preferred_tanks = ["id","code","name","location","description","created_at","created_by","fish_id_uuid"]
tanks_readonly = [c for c in ["id","created_at","created_by"] if c in df_tanks.columns]
tanks_mutable = [c for c in df_tanks.columns if c not in tanks_readonly]

tanks_edit_df = pd.DataFrame({c: [] for c in preferred_tanks}) if df_tanks.empty else df_tanks[[c for c in preferred_tanks if c in df_tanks.columns] + [c for c in df_tanks.columns if c not in preferred_tanks]].copy()
for c in tanks_readonly:
    if c in tanks_edit_df.columns:
        tanks_edit_df[c] = tanks_edit_df[c].astype(str)

with st.container(border=True):
    st.subheader("Tanks")
    edited_tanks = st.data_editor(
        tanks_edit_df,
        hide_index=True,
        disabled=[c for c in tanks_readonly if c in tanks_edit_df.columns],
        use_container_width=True,
        num_rows="dynamic",
        key="tanks_editor",
    )
    c1, c2 = st.columns(2)
    with c1:
        if st.button("Apply Tank Changes", type="primary", use_container_width=True):
            before = tanks_edit_df.copy()
            after = edited_tanks.copy()
            key_field = "id"
            keys = [key_field]
            mut = [c for c in tanks_mutable if c in after.columns and c != key_field]
            o = before[keys + [c for c in mut if c in before.columns]] if not before.empty else pd.DataFrame(columns=keys+mut)
            e = after[keys + mut]
            merged = o.merge(e, on=keys, how="outer", suffixes=("_o","_e"), indicator=True)
            updates = []
            for _, row in merged.iterrows():
                if row["_merge"] == "right_only":
                    payload = {k: row[k] for k in keys+mut if k in merged.columns and pd.notna(row[k])}
                    updates.append(payload)
                elif row["_merge"] == "both":
                    changed = {}
                    for c in mut:
                        eo, ee = f"{c}_o", f"{c}_e"
                        if eo in merged.columns and ee in merged.columns:
                            vo, ve = row[eo], row[ee]
                            if (pd.isna(vo) and pd.notna(ve)) or (pd.notna(vo) and pd.isna(ve)) or (str(vo) != str(ve)):
                                changed[c] = ve
                    if changed:
                        base = {k: row[k] for k in keys}
                        base.update(changed)
                        updates.append(base)
            if updates:
                try:
                    sb.table("tanks").upsert(updates, on_conflict="id").execute()
                    load_data.clear()
                    st.success(f"Upserted {len(updates)} tank row(s)")
                except Exception as e:
                    st.error("Tank upsert failed. Ensure RLS allows UPDATE/INSERT and 'id' is present for updates.")
                    st.exception(e)
            else:
                st.info("No changes detected")
    with c2:
        if st.button("Reset Tank Edits", use_container_width=True):
            st.rerun()

with st.container(border=True):
    st.subheader("Assign Fish → Tank")
    if df_tanks.empty or df_fish.empty:
        st.info("No tanks or fish available.")
    else:
        tlab = "code" if "code" in df_tanks.columns else ("name" if "name" in df_tanks.columns else "id")
        flab = "code" if "code" in df_fish.columns else ("name" if "name" in df_fish.columns else "id")
        t_idx = st.selectbox("Tank", options=list(range(len(df_tanks))), format_func=lambda i: f"{df_tanks.loc[i, tlab]}")
        f_idx = st.selectbox("Fish", options=list(range(len(df_fish))), format_func=lambda i: f"{df_fish.loc[i, flab]}")
        c1, c2, c3 = st.columns(3)
        with c1:
            if st.button("Assign", type="primary", use_container_width=True):
                tank_id = df_tanks.loc[t_idx, "id"]
                fish_id = df_fish.loc[f_idx, "id"]
                try:
                    sb.table("tanks").update({"fish_id_uuid": fish_id}).eq("id", tank_id).execute()
                    load_data.clear()
                    st.success("Assigned")
                except Exception as e:
                    st.error("Assign failed.")
                    st.exception(e)
        with c2:
            if st.button("Clear Tank", use_container_width=True):
                tank_id = df_tanks.loc[t_idx, "id"]
                try:
                    sb.table("tanks").update({"fish_id_uuid": None}).eq("id", tank_id).execute()
                    load_data.clear()
                    st.success("Cleared")
                except Exception as e:
                    st.error("Clear failed.")
                    st.exception(e)

with st.expander("SQL semantics"):
    st.markdown(
        """
- **fish** upserts use `ON CONFLICT (id)`.
- **tanks** upserts use `ON CONFLICT (id)` and assignment writes `tanks.fish_id_uuid`.
- Derived `current_tanks` is computed from tanks where `fish_id_uuid = fish.id`.
        """
    )
