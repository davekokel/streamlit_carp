from __future__ import annotations

import re
from datetime import date
import pandas as pd
import uuid
import streamlit as st
# --- v30: ensure component helpers exist ---
if "_table_id_key" not in globals():
    def _table_id_key(table: str) -> str:
        try:
            rows = sb.table(table).select("*").limit(1).execute().data or []
            if rows:
                if "id_uuid" in rows[0]:
                    return "id_uuid"
                if "id" in rows[0]:
                    return "id"
        except Exception:
            pass
        return "id_uuid"


if "_fetch_component_options" not in globals():
    def _fetch_component_options() -> dict:
        out = {}
        # Exact sources per schema
        # rna(id_uuid uuid, name text), plasmids(id bigint, id_uuid uuid, name text), dyes(id_uuid uuid, name text)
        try:
            rows = sb.table("rna").select("id_uuid,name").limit(5000).execute().data or []
        except Exception as e:
            st.warning(f"Failed to load component options: {e}")
            rows = []
        out["RNA"] = [(str(r["id_uuid"]), str(r.get("name") or r["id_uuid"])) for r in rows if r.get("id_uuid")]
        try:
            rows = sb.table("plasmids").select("id,id_uuid,name").order("name").limit(5000).execute().data or []
        except Exception:
            rows = []
        out["Plasmid"] = [(str(r["id_uuid"]), str(r.get("name") or r["id_uuid"])) for r in rows if r.get("id_uuid")]
        # stash a uuid->id map in session_state for linking
        st.session_state["_plasmid_uuid_to_id_map"] = {str(r["id_uuid"]): int(r["id"]) for r in rows if r.get("id_uuid") and r.get("id") is not None}
        try:
            rows = sb.table("dyes").select("id_uuid,name").order("name").limit(5000).execute().data or []
        except Exception:
            rows = []
        out["Dye"] = [(str(r["id_uuid"]), str(r.get("name") or r["id_uuid"])) for r in rows if r.get("id_uuid")]
        return out


if "_link_trt_rnas" not in globals():
    def _link_trt_rnas(tid: str, rna_ids: list[str]):
        if not rna_ids:
            return
        rows = [{"treatment_id": tid, "rna_id": rid} for rid in rna_ids]
        try:
            sb.table("treatment_rnas").insert(rows).execute()
        except Exception as e:
            st.warning(f"Link RNA failed: {e}")

    def _link_trt_dyes(tid: str, dye_ids: list[str]):
        if not dye_ids:
            return
        rows = [{"treatment_id": tid, "dye_id_uuid": did} for did in dye_ids]
        try:
            sb.table("treatment_dyes").insert(rows).execute()
        except Exception as e:
            st.warning(f"Link dye failed: {e}")
# --- end v30 helpers ---

    def _link_trt_plasmids(tid: str, plasmid_ids: list[str]):
        if not plasmid_ids:
            return
        uuid_to_id = st.session_state.get("_plasmid_uuid_to_id_map", {})
        rows = []
        for pu in plasmid_ids:
            pid = uuid_to_id.get(str(pu))
            if pid is not None:
                rows.append({"treatment_id": tid, "plasmid_id": int(pid)})
        if not rows:
            return
        try:
            sb.table("treatment_plasmids").insert(rows).execute()
        except Exception as e:
            st.warning(f"Link plasmid failed: {e}")
    # --- end v30 helpers ---


st.set_page_config(page_title="Parents → Child", page_icon="🐟", layout="wide")
st.title("🐟 Parents → Child")
# ------------------------- Auth / client -------------------------
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
        for args in ((make_supabase_client,), tuple()):
            try:
                r = ensure_auth(*[a for a in args if a is not None])
                if isinstance(r, tuple) and len(r) >= 1:
                    return r[0], (r[1] if len(r) > 1 else None)
                if r is not None:
                    return r, None
            except Exception:
                pass
    try:
        from supabase import create_client
        sb = create_client(st.secrets["SUPABASE_URL"], st.secrets["SUPABASE_ANON_KEY"])
        a = st.session_state.get("sb_access_token"); r = st.session_state.get("sb_refresh_token")
        if a and r:
            try:
                sb.auth.set_session(a, r)
            except Exception:
                pass
        try:
            u = sb.auth.get_user()
            usr = getattr(u, "user", None) or getattr(u, "data", None) or u
        except Exception:
            usr = None
        return sb, usr
    except Exception as e:
        st.error(f"Auth/client setup failed: {e}")
        st.stop()

sb, user = _resolve_client_and_user()

def _get_user_id_email():
    """Return (user_id, email) from Supabase auth or session state; (None, None) if unavailable."""
    try:
        u = sb.auth.get_user()
        # supabase-py v2: u may have .user or be a dict-like
        uid = None
        email = None
        if hasattr(u, "user") and getattr(u, "user"):
            uu = getattr(u, "user")
            uid = getattr(uu, "id", None) or (uu.get("id") if isinstance(uu, dict) else None)
            email = getattr(uu, "email", None) or (uu.get("email") if isinstance(uu, dict) else None)
        elif isinstance(u, dict):
            uid = u.get("id") or (u.get("user", {}) or {}).get("id")
            email = u.get("email") or (u.get("user", {}) or {}).get("email")
    except Exception:
        uid = None; email = None
    # Session fallbacks
    if not uid:
        for k in ("user", "profile", "sb_user", "supabase_user"):
            v = st.session_state.get(k)
            if isinstance(v, dict) and v.get("id"):
                uid = v["id"]
                email = v.get("email")
                break
    return uid, email

uid, uemail = _get_user_id_email()

# --- Inline sign-in (only shows if not signed in) ---
if not uid:
    with st.expander("Sign in to access protected tables (RNA)", expanded=True):
        with st.form("login_form_v1", clear_on_submit=False):
            _email = st.text_input("Email", key="_auth_email_inline")
            _pw = st.text_input("Password", type="password", key="_auth_pw_inline")
            _do = st.form_submit_button("Sign in")
        if _do:
            try:
                sb.auth.sign_in_with_password({"email": _email, "password": _pw})
                st.success("Signed in. Reloading…")
                st.rerun()
            except Exception as e:
                st.error(f"Login failed: {e}")

with st.expander("Diagnostics • Supabase session & RNA visibility", expanded=False):
    try:
        # Show auth/user info
        _user = None
        try:
            _user = sb.auth.get_user()
        except Exception as _e:
            _user = {"error": str(_e)}
        st.write({"user": str(_user)})
        # Show project URL (best-effort)
        _url = getattr(sb, "rest_url", None) or getattr(sb, "supabase_url", None) or getattr(sb, "_supabase_url", None)
        st.write({"project_url": _url})
        # Sample rows from key tables to verify visibility under current role
        try:
            _rna_rows = sb.table("rna").select("id_uuid,name,created_by,created_at").limit(5).execute().data or []
        except Exception as e:
            _rna_rows = [{"error": str(e)}]
        try:
            _pl_rows = sb.table("plasmids").select("id_uuid,name").limit(5).execute().data or []
        except Exception as e:
            _pl_rows = [{"error": str(e)}]
        try:
            _dy_rows = sb.table("dyes").select("id_uuid,name").limit(5).execute().data or []
        except Exception as e:
            _dy_rows = [{"error": str(e)}]
        st.write({"rna_sample": _rna_rows, "plasmids_sample": _pl_rows, "dyes_sample": _dy_rows})
    except Exception as e:
        st.write({"diagnostics_error": str(e)})
st.caption("Signed in as: " + (uemail or "unknown") + (" (" + uid + ")" if uid else ""))

# ------------------------- Data access -------------------------
@st.cache_data(ttl=30, show_spinner=False)
def fetch_fish(limit: int = 2000) -> pd.DataFrame:
    q = sb.table("fish").select("*").order("created_at", desc=True).limit(limit)
    data = q.execute().data or []
    df = pd.DataFrame(data)
    if not df.empty and "date_birth" in df.columns:
        try:
            df["date_birth"] = pd.to_datetime(df["date_birth"], errors="coerce")
        except Exception:
            pass
    return df

LINK_MAP = {
    "Transgene": ("fish_transgenes", "transgene_id_uuid", "transgenes"),
    "Mutation":  ("fish_mutations",  "mutation_id_uuid",  "mutations"),
    "Treatment": ("fish_treatments", "treatment_id",      "treatments"),
}

TARGET_TABLE_KEY_PREF = {
    "transgenes": ["id_uuid", "id"],
    "mutations":  ["id_uuid", "id"],
    "treatments": ["id", "id_uuid"],
}

LABEL_PREF = {
    "Transgene": ["name","type","id","id_uuid"],
    "Mutation":  ["name","gene","id","id_uuid"],
    "Treatment": ["id","name"],
}

@st.cache_data(ttl=30, show_spinner=False)
def _choose_target_key(table: str) -> str:
    try:
        rows = sb.table(table).select("*").limit(1).execute().data or []
        if rows and isinstance(rows, list):
            pref = TARGET_TABLE_KEY_PREF.get(table, ["id_uuid","id"])
            for k in pref:
                if k in rows[0]:
                    return k
            if "id_uuid" in rows[0]:
                return "id_uuid"
            if "id" in rows[0]:
                return "id"
    except Exception:
        pass
    return "id"

@st.cache_data(ttl=30, show_spinner=False)
def fetch_feature_labels_bulk(fish_ids: list[str], which_kind: str) -> dict[str, list[str]]:
    if not fish_ids:
        return {}
    link_table, fk, target = LINK_MAP[which_kind]
    try:
        links = sb.table(link_table).select(f"fish_id_uuid,{fk}").in_("fish_id_uuid", fish_ids).execute().data or []
    except Exception:
        links = []
    by_fish: dict[str, list[str]] = {}
    if not links:
        return by_fish
    target_key = _choose_target_key(target)
    target_ids = sorted({r.get(fk) for r in links if r.get(fk) is not None})
    if not target_ids:
        return by_fish
    try:
        tgt_rows = sb.table(target).select("*").in_(target_key, target_ids).execute().data or []
    except Exception:
        tgt_rows = []
    if not tgt_rows:
        return by_fish
    def _label(row: dict) -> str:
        cols = LABEL_PREF.get(which_kind, [])
        for c in cols:
            v = row.get(c)
            if v not in (None, ""):
                return str(v)
        if "name" in row and row.get("name"):
            return str(row["name"])
        return str(row.get(target_key))
    label_by_id = {str(row.get(target_key) or row.get("id")): _label(row) for row in tgt_rows}
    for r in links:
        fid = str(r.get("fish_id_uuid"))
        tid = str(r.get(fk))
        if fid and tid in label_by_id:
            by_fish.setdefault(fid, []).append(label_by_id[tid])
    for k in by_fish:
        by_fish[k] = sorted(set(by_fish[k]))
    return by_fish

@st.cache_data(ttl=30, show_spinner=False)
def build_linked_feature_columns(fish_df: pd.DataFrame) -> pd.DataFrame:
    if fish_df.empty:
        return fish_df
    key_col = "id_uuid" if "id_uuid" in fish_df.columns else "id"
    ids = fish_df[key_col].astype(str).tolist()
    tg = fetch_feature_labels_bulk(ids, "Transgene")
    mu = fetch_feature_labels_bulk(ids, "Mutation")
    tr = fetch_feature_labels_bulk(ids, "Treatment")
    df = fish_df.copy()
    df["transgenes"] = df[key_col].astype(str).map(lambda k: ", ".join(tg.get(k, [])))
    df["mutations"]  = df[key_col].astype(str).map(lambda k: ", ".join(mu.get(k, [])))
    df["treatments"] = df[key_col].astype(str).map(lambda k: ", ".join(tr.get(k, [])))
    return df

@st.cache_data(ttl=60, show_spinner=False)
def _stage_options_from_data(df: pd.DataFrame) -> list[str]:
    if df is None or df.empty or "line_building_stage" not in df.columns:
        return []
    s = df["line_building_stage"].dropna().astype(str).str.strip()
    vals = sorted({v for v in s.tolist() if v})
    return vals



@st.cache_data(ttl=60, show_spinner=False)
def _tanks_key() -> str:
    try:
        rows = sb.table("tanks").select("*").limit(1).execute().data or []
        if rows:
            if "id_uuid" in rows[0]:
                return "id_uuid"
            if "id" in rows[0]:
                return "id"
    except Exception:
        pass
    return "id_uuid"

@st.cache_data(ttl=60, show_spinner=False)
def fetch_tanks() -> pd.DataFrame:
    try:
        rows = sb.table("tanks").select("*").order("name").execute().data or []
        if not rows:
            rows = sb.table("tanks").select("*").order("tank_code").execute().data or []
    except Exception:
        rows = []
    return pd.DataFrame(rows)


def _tank_label(row: dict) -> str:
    # Build a friendly label from likely columns
    parts = []
    for k in ("tank_code", "code", "name"):
        v = row.get(k)
        if v:
            parts.append(str(v))
            break
    # add location-ish hints if present
    for k in ("location", "rack", "room", "position"):
        v = row.get(k)
        if v not in (None, "", 0):
            parts.append(str(v))
    return " · ".join(parts) if parts else str(row.get("id_uuid") or row.get("id"))

def _tank_columns_info():
    """Return dict with inferred keys for tanks table: id_key, label_key, has_created_by, sample_keys."""
    try:
        rows = sb.table("tanks").select("*").limit(1).execute().data or []
        sample = rows[0] if rows else {}
    except Exception:
        sample = {}
    keys = set(sample.keys())
    id_key = "id_uuid" if "id_uuid" in keys else ("id" if "id" in keys else "id_uuid")
    label_key = None
    for k in ("name", "tank_code", "code"):
        if k in keys:
            label_key = k
            break
    has_created_by = "created_by" in keys
    return {"id_key": id_key, "label_key": label_key, "has_created_by": has_created_by, "keys": keys}

def _build_tank_payloads(labels: list[str], uid: str) -> list[dict]:
    info = _tank_columns_info()
    label_key = info.get("label_key") or "name"
    payloads = []
    for lab in labels:
        if not lab or not str(lab).strip():
            continue
        row = {label_key: str(lab).strip()}
        if info.get("has_created_by"):
            row["created_by"] = uid
        payloads.append(row)
    return payloads


@st.cache_data(ttl=60, show_spinner=False)
def _fish_tank_link_target():
    return {
        'table': 'fish_tank_memberships',
        'fish_fk_uuid': 'fish_id_uuid',
        'tank_fk_uuid': 'tank_id_uuid',
        'has_created_by': True,
    }
    return None




def _link_tanks(new_fish_uuid: str, tank_ids: list[str]):
    if not tank_ids:
        return
    target = _fish_tank_link_target()
    tbl = target['table']
    fish_fk_uuid = target['fish_fk_uuid']
    tank_fk_uuid = target['tank_fk_uuid']
    # Dedup tanks, ensure strings
    tank_ids = list(dict.fromkeys([str(t) for t in tank_ids if t]))
    payload = [{fish_fk_uuid: str(new_fish_uuid), tank_fk_uuid: str(t), 'valid_from': pd.Timestamp.utcnow().isoformat()} for t in tank_ids]
    uid, _ = _get_user_id_email()
    if uid and target.get("has_created_by"):
        for r in payload:
            r["created_by"] = uid
    try:
        sb.table(tbl).insert(payload).execute()
    except Exception as e:
        st.error(f"Could not link tanks via {tbl}: {getattr(e, 'message', str(e))}")
        return
    return

    target = _fish_tank_link_target()
    tbl = target['table']
    # Resolve fish.id (bigint)
    fish_id = None
    try:
        # UUID-like if it has hyphens
        if isinstance(new_fish_uuid, str) and '-' in new_fish_uuid:
            res = sb.table("fish").select("id").eq("id_uuid", new_fish_uuid).limit(1).execute().data or []
            if res:
                fish_id = int(res[0]["id"])
        else:
            fish_id = int(new_fish_uuid)
    except Exception:
        fish_id = None
    if fish_id is None:
        st.warning("Could not resolve fish.id for tank linking.")
        return
    # Resolve tank ids (bigint) from provided keys (we pass id_uuid strings from the UI)
    tank_ids = list(dict.fromkeys([str(t) for t in tank_ids]))  # de-dup, preserve order
    try:
        rows = sb.table("tanks").select("id,id_uuid").in_("id_uuid", tank_ids).execute().data or []
    except Exception:
        rows = []
    uu2id = {str(r["id_uuid"]): int(r["id"]) for r in rows if r.get("id") is not None and r.get("id_uuid")}
    tank_bigints = [uu2id.get(t) for t in tank_ids if uu2id.get(t) is not None]
    if not tank_bigints:
        st.info("No valid tanks resolved for linking.")
        return
    # Build payload
    payload = [{"fish_id": fish_id, "tank_id": tid} for tid in tank_bigints]
    uid, _ = _get_user_id_email()
    if uid and target.get("has_created_by"):
        for r in payload:
            r["created_by"] = uid
    try:
        sb.table(tbl).insert(payload).execute()
    except Exception as e:
        st.error(f"Could not link tanks via {tbl}: {getattr(e, 'message', str(e))}")
        return
    return

    # First, try to link via a join table (fish_tanks or fish_tank_memberships)
    target = _fish_tank_link_target()
    if target:
        try:
            fish_fk = target["fish_fk"]
            tank_fk = target["tank_fk"]
            rows = [{fish_fk: new_fish_uuid, tank_fk: tid} for tid in tank_ids]
            # add created_by if policy expects it
            if target.get("has_created_by"):
                uid, _ = _get_user_id_email()
                if uid:
                    for r in rows:
                        r["created_by"] = uid
            sb.table(target["table"]).insert(rows).execute()
            return
        except Exception as e:
            st.warning(f"Could not link tanks via {target.get('table')}: {e}")
    # Fallback: set a single tank id on fish if a direct column exists
    try:
        meta = sb.table("fish").select("*").limit(1).execute().data or []
        if meta:
            cols = meta[0].keys()
            if "tank_id_uuid" in cols:
                sb.table("fish").update({"tank_id_uuid": tank_ids[0]}).eq("id_uuid", new_fish_uuid).execute()
                return
            if "tank_id" in cols:
                sb.table("fish").update({"tank_id": tank_ids[0]}).eq("id", new_fish_uuid).execute()
                return
    except Exception:
        pass
    st.info("Tanks feature available, but no compatible linking method found (skipped).")

@st.cache_data(ttl=60, show_spinner=False)
def _treatments_table_info():
    # Exact schema: treatments(id uuid, notes text)
    return {
        "id_key": "id",
        "name_key": None,
        "notes_key": "notes",
        "type_key": None,
        "has_created_by": False,
        "keys": {"id", "notes"},
    }

def _build_treatment_payloads_from_df(df: pd.DataFrame, uid: str) -> list[dict]:
    # Exact schema: treatments(id uuid default, notes text). We only set notes.
    payloads = []
    if df is None or df.empty:
        return payloads
    for _, row in df.iterrows():
        notes = str(row.get("notes", "")).strip()
        payloads.append({"notes": notes or None})
    return payloads
    info = _treatments_table_info()
    name_key = info.get("name_key") or "name"
    notes_key = info.get("notes_key")
    type_key = info.get("type_key")
    payloads = []
    if df is None or df.empty:
        return payloads
    for _, row in df.iterrows():
        name = str(row.get("name", "")).strip()
        if not name:
            continue
        pay = {name_key: name}
        # optional
        ty = str(row.get("")).strip()
        if ty and type_key:
            pay[type_key] = ty
        nt = str(row.get("notes", "")).strip()
        if nt and notes_key:
            pay[notes_key] = nt
        if info.get("has_created_by") and uid:
            pay["created_by"] = str(uid)
        payloads.append(pay)
    return payloads

@st.cache_data(ttl=60, show_spinner=False)
def _fish_treatments_fk_key():
    """Detect fk key for treatments in fish_treatments (treatment_id vs treatment_id_uuid)."""
    try:
        rows = sb.table("fish_treatments").select("*").limit(1).execute().data or []
        keys = set(rows[0].keys()) if rows else set()
    except Exception:
        keys = set()
    if "treatment_id" in keys:
        return "treatment_id"
    if "treatment_id_uuid" in keys:
        return "treatment_id_uuid"
    return "treatment_id"

def _filter_local(df: pd.DataFrame, term: str) -> pd.DataFrame:
    term = (term or "").strip().lower()
    if not term or df.empty:
        return df
    cols = [c for c in ["code","fish_code","name","line_building_stage","notes","transgenes","mutations","treatments"] if c in df.columns]
    blob = df[cols].astype(str).agg(" ".join, axis=1).str.lower()
    try:
        pat = re.escape(term)
        mask = blob.str.contains(pat, na=False)
    except Exception:
        mask = blob.str.contains(term, na=False)
    return df[mask]

# ------------------------- UI: search + checkbox picker (trim-to-2, live counter) -------------------------
search_term = st.text_input("Search fish (code, name, stage, notes, transgenes…)", placeholder="eg: Tg(pDQM005) or ef1a or FSH-2025-0031")
raw_df = fetch_fish(limit=2000)
fish_df = build_linked_feature_columns(raw_df)
fish_df = _filter_local(fish_df, search_term)

if fish_df.empty:
    st.info("No fish found for this search.")
    st.stop()

front_cols = [c for c in ["code","fish_code","name","date_birth","line_building_stage","status","transgenes","mutations","treatments"] if c in fish_df.columns]
fish_key = "id_uuid" if "id_uuid" in fish_df.columns else "id"

state_key = "_picker_state_v15"
if state_key not in st.session_state:
    st.session_state[state_key] = {"order": []}  # newest last
order: list[str] = list(map(str, st.session_state[state_key]["order"]))

disp = fish_df[[fish_key] + front_cols].copy()
disp["_key"] = disp[fish_key].astype(str)
disp = disp.set_index("_key", drop=True)
selected_now = set(order[-2:])
disp["pick"] = disp.index.isin(selected_now)

column_order = ["pick"] + [c for c in front_cols if c in disp.columns]
cfg = {}
if "date_birth" in disp.columns and pd.api.types.is_datetime64_any_dtype(fish_df["date_birth"]):
    cfg["date_birth"] = st.column_config.DateColumn("date_birth")
cfg["transgenes"] = st.column_config.TextColumn("transgenes")
cfg["mutations"]  = st.column_config.TextColumn("mutations")
cfg["treatments"] = st.column_config.TextColumn("treatments")

ed = st.data_editor(
    disp[column_order],
    hide_index=True,
    height=460,
    use_container_width=True,
    disabled={c: True for c in column_order if c != "pick"},
    column_config={**cfg, "pick": st.column_config.CheckboxColumn("Select")},
    key="_picker_editor_v15",
)

ui_ids = set(map(str, ed.index[ed["pick"]].tolist()))
still = [i for i in order if i in ui_ids]
added = [i for i in ui_ids if i not in still]
order = (still + added)[-2:]
st.session_state[state_key] = {"order": order}
st.caption(f"Selected: **{len(order)}/2**")

if not order:
    st.info("Select one or two rows to continue.")
    st.stop()

# ------------------------- Mom/Dad selection (single 'Mom switch' radio) -------------------------
def _row_by_id(fid: str) -> pd.Series:
    return fish_df.loc[fish_df[fish_key].astype(str) == str(fid)].iloc[0]
def _label(fid: str) -> str:
    row = _row_by_id(fid)
    ident = row.get("fish_code") or row.get("code") or fid
    parts = [str(ident)]
    if row.get("name"):
        parts.append(str(row["name"]))
    if row.get("transgenes"):
        parts.append(str(row["transgenes"]))
    return " · ".join(parts)

labels_map = {fid: _label(fid) for fid in order}

if len(order) == 1:
    mom_id = order[0]
    dad_id = mom_id
else:
    default_mom = order[-1]  # most recently selected
    mom_id = st.radio(
        "Mom switch",
        options=order,
        format_func=lambda k: labels_map.get(k, k),
        horizontal=True,
        index=(order.index(default_mom) if default_mom in order else 0),
        key="mom_switch_v15",
    )
    dad_id = next((i for i in order if i != mom_id), mom_id)

st.success(f"Mom: {labels_map[mom_id]}")
st.success(f"Dad: {labels_map[dad_id]}")

# ------------------------- Combined features (trim to unique options; Parent column) -------------------------
@st.cache_data(ttl=30, show_spinner=False)
def _target_rows_with_labels(fish_id: str, which_kind: str) -> pd.DataFrame:
    link_table, fk, target = LINK_MAP[which_kind]
    tkey = _choose_target_key(target)
    try:
        link_rows = sb.table(link_table).select(fk).eq("fish_id_uuid", fish_id).execute().data or []
        ids = [r.get(fk) for r in link_rows if r.get(fk) is not None]
        if not ids:
            return pd.DataFrame(columns=["target_id", "Feature", "Details"])
        tgt_rows = sb.table(target).select("*").in_(tkey, ids).execute().data or []
    except Exception:
        tgt_rows = []
    if not tgt_rows:
        return pd.DataFrame(columns=["target_id", "Feature", "Details"])
    pref = LABEL_PREF.get(which_kind, [])
    if "name" not in pref:
        pref = ["name"] + pref
    def _label(row: dict) -> str:
        for c in pref:
            if c in row and row[c] not in (None, ""):
                return str(row[c])
        return str(row.get(tkey))
    def _details(row: dict) -> str:
        drop = set([tkey, "id", "id_uuid", "created_at", "updated_at"] + pref[:1])
        bits = []
        for k, v in row.items():
            if k in drop or v in (None, ""):
                continue
            bits.append(f"{k}={v}")
        return ", ".join(bits)
    df = pd.DataFrame(tgt_rows)
    if df.empty:
        return df
    df = df.copy()
    df["target_id"] = df[tkey].astype(str)
    df["Feature"] = df.apply(_label, axis=1)
    df["Details"] = df.apply(_details, axis=1)
    return df[["target_id","Feature","Details"]]

@st.cache_data(ttl=30, show_spinner=False)
def build_unique_options_with_parent(mom_id: str, dad_id: str) -> pd.DataFrame:
    rows = []
    for kind in ["Transgene","Mutation","Treatment"]:
        m = _target_rows_with_labels(mom_id, kind).assign(Kind=kind, Mom=True)
        d = _target_rows_with_labels(dad_id, kind).assign(Kind=kind, Dad=True)
        merged = pd.merge(m, d, on=["Kind","target_id","Feature","Details"], how="outer").fillna(False)
        if "Mom" not in merged.columns:
            merged["Mom"] = False
        if "Dad" not in merged.columns:
            merged["Dad"] = False
        # Reduce to one row per feature with Parent column
        def _parent_row(row):
            if row["Mom"] and row["Dad"]:
                return "Both"
            return "Mom" if row["Mom"] else "Dad"
        merged["Parent"] = merged.apply(_parent_row, axis=1)
        rows.append(merged[["Kind","target_id","Feature","Details","Parent"]])
    if not rows:
        return pd.DataFrame(columns=["Kind","target_id","Feature","Details","Parent"])
    out = pd.concat(rows, ignore_index=True)
    return out.sort_values(["Kind","Parent","Feature","Details"]).reset_index(drop=True)

st.subheader("Combined Features")
raw_combo = build_unique_options_with_parent(str(mom_id), str(dad_id))

# Kind filter
kind_opt = st.multiselect("Kinds", ["Transgene","Mutation","Treatment"], default=["Transgene","Mutation","Treatment"], key="kind_filter_v15")
combo = raw_combo if not kind_opt else raw_combo[raw_combo["Kind"].isin(kind_opt)]

# Inherit selection per unique feature (Kind|target_id)
inherit_key = "_inherit_sel_v15"
if inherit_key not in st.session_state:
    st.session_state[inherit_key] = set()

uids = [f"{k}|{tid}" for k, tid in zip(combo["Kind"], combo["target_id"])]
sel = set(st.session_state[inherit_key])
for uid in uids:
    if uid not in sel:
        sel.add(uid)  # default ON
combo_disp = combo.copy()
combo_disp["_uid"] = uids
combo_disp = combo_disp.set_index("_uid", drop=True)
combo_disp["Inherit"] = combo_disp.index.isin(sel)

editor_cols = ["Inherit","Parent","Kind","Feature","Details"]
ed_feats = st.data_editor(
    combo_disp[editor_cols],
    hide_index=True,
    use_container_width=True,
    height=440,
    column_config={
        "Inherit": st.column_config.CheckboxColumn("Inherit"),
        "Parent": st.column_config.TextColumn("Parent"),
        "Kind": st.column_config.TextColumn("Kind"),
        "Feature": st.column_config.TextColumn("Feature"),
        "Details": st.column_config.TextColumn("Details"),
    },
    disabled={"Parent": True, "Kind": True, "Feature": True, "Details": True},
    key="_inherit_editor_v15",
)
current_sel = set(ed_feats.index[ed_feats["Inherit"]].tolist())
st.session_state[inherit_key] = current_sel

# Summary counts per kind
sum_counts = combo_disp.assign(Inherit=ed_feats["Inherit"]).groupby("Kind")["Inherit"].sum().to_dict()
st.caption("Selected to inherit → " + ", ".join([f"{k}: {int(v)}" for k, v in sum_counts.items()]))

# ------------------------- Auto-generate child identifiers -------------------------
@st.cache_data(ttl=20, show_spinner=False)
def _next_fish_code(prefix: str = "FSH") -> str:
    yr = date.today().year
    try:
        q = sb.table("fish").select("fish_code").like("fish_code", f"{prefix}-{yr}-%").order("fish_code", desc=True).limit(1)
        last = (q.execute().data or [])
        if last:
            suf = last[0]["fish_code"].split("-")[-1]
            n = int(re.sub(r"[^0-9]","", suf)) + 1
        else:
            n = 1
    except Exception:
        n = 1
    return f"{prefix}-{yr}-{n:04d}"

# Generate once per run so preview matches insert
generated_code = _next_fish_code()
st.info(f"Child identifier will be auto-generated: **{generated_code}**")

# ------------------------- Create child -------------------------

# ------------------------- Add new treatments (optional) -------------------------

@st.cache_data(ttl=120, show_spinner=False)
def _treatment_type_options() -> list[str]:
    # Prefer a dedicated dictionary table if available
    opts = []
    try:
        rows = sb.table("treatment_types").select("*").order("name").execute().data or []
        if rows:
            for r in rows:
                v = r.get("name") or r.get("type") or r.get("code")
                if v:
                    opts.append(str(v))
    except Exception:
        pass
    if not opts:
        # Fallback to distinct values in treatments.type
        try:
            rows = sb.table("treatments").select("type").execute().data or []
            vals = {str(r.get("type")).strip() for r in rows if r.get("type") not in (None, "")}
            opts = sorted(vals)
        except Exception:
            opts = []
    return opts


@st.cache_data(ttl=60, show_spinner=False)
@st.cache_data(ttl=60, show_spinner=False)
def _treatment_columns_info():
    try:
        rows = sb.table("treatments").select("*").limit(1).execute().data or []
    except Exception:
        rows = []
    sample = rows[0] if rows else {}
    keys = set(sample.keys())
    id_key = "id_uuid" if "id_uuid" in keys else ("id" if "id" in keys else "id_uuid")
    optional = [c for c in ["type","method","dose","units","date","notes","description","name"] if c in keys]
    has_created_by = "created_by" in keys
    has_name = "name" in keys
    return {"id_key": id_key, "optional": optional, "has_created_by": has_created_by, "keys": keys, "has_name": has_name}

def _treatment_component_presence(limit: int = 200000) -> dict[str, set]:
    """Return map: treatment_id -> set({"RNA","Plasmid","Dye"}) based on component tables."""
    kinds_by_t = {}
    try:
        rr = sb.table("treatment_rnas").select("treatment_id").limit(limit).execute().data or []
        for r in rr:
            tid = str(r.get("treatment_id"))
            if tid:
                kinds_by_t.setdefault(tid, set()).add("RNA")
    except Exception:
        pass
    try:
        pp = sb.table("treatment_plasmids").select("treatment_id").limit(limit).execute().data or []
        for r in pp:
            tid = str(r.get("treatment_id"))
            if tid:
                kinds_by_t.setdefault(tid, set()).add("Plasmid")
    except Exception:
        pass
    try:
        dd = sb.table("treatment_dyes").select("treatment_id").limit(limit).execute().data or []
        for r in dd:
            tid = str(r.get("treatment_id"))
            if tid:
                kinds_by_t.setdefault(tid, set()).add("Dye")
    except Exception:
        pass
    return kinds_by_t

def _kind_label_from_set(s: set) -> str:
    if not s:
        return "Other"
    if len(s) == 1:
        return next(iter(s))
    return "Composite: " + "+".join(sorted(s))


def _fetch_all_treatments(limit: int = 5000) -> pd.DataFrame:
    info = _treatment_columns_info()
    id_key = info.get("id_key", "id_uuid")
    try:
        rows = sb.table("treatments").select("*").limit(limit).execute().data or []
    except Exception:
        rows = []
    df = pd.DataFrame(rows)
    if df.empty:
        return df
    df["treat_id"] = df[id_key].astype(str)
    cols = set(df.columns)
    def _label(row):
        for k in ["name", "description"]:
            if k in cols and row.get(k):
                return str(row.get(k))
        return str(row.get("treat_id"))
    def _details(row):
        parts = []
        if "dose" in cols and row.get("dose") not in (None, ""):
            parts.append(f"dose={row.get('dose')}")
        if "units" in cols and row.get("units"):
            parts.append(f"{row.get('units')}")
        if "method" in cols and row.get("method"):
            parts.append(f"method={row.get('method')}")
        if "notes" in cols and row.get("notes"):
            parts.append(f"notes={row.get('notes')}")
        return ", ".join(parts)
    df["Name"] = df.apply(_label, axis=1)
    if "date" in cols:
        try:
            df["Date"] = pd.to_datetime(df["date"], errors="coerce")
        except Exception:
            df["Date"] = df["date"]
    else:
        df["Date"] = None
    df["Details"] = df.apply(_details, axis=1)

    # Derive Kind from component tables
    presence = _treatment_component_presence()
    def _kind_for_row(row):
        s = presence.get(str(row["treat_id"]), set())
        return _kind_label_from_set(s)
    df["Kind"] = df.apply(_kind_for_row, axis=1)

    out_cols = ["treat_id", "Kind", "Name", "Details", "Date"]
    return df[out_cols]

with st.expander("Treatments (optional)", expanded=True):
    # ------------------------- Select Existing Treatments -------------------------
    st.subheader("Select Existing Treatments (by Kind)")

    # Load options
    _all_treats = _fetch_all_treatments()
    _type_opts = _treatment_type_options()

    # Filters
    c1, c2 = st.columns([2, 3])
    with c1:
        _treat_search = st.text_input("Search treatments", placeholder="Search name, details…", key="_treat_search_v26")
    with c2:
        _kind_opts = sorted([k for k in _all_treats["Kind"].dropna().unique().tolist()])
        _type_filter = st.multiselect("Filter by Kind", _kind_opts, default=_kind_opts, key="_treat_kind_filter_v27")

    # Apply filters
    df_t = _all_treats.copy()
    if not df_t.empty:
        if _type_filter:
            df_t = df_t[df_t["Kind"].isin(_type_filter)]
        if _treat_search:
            blob = (df_t["Name"].astype(str) + " " + df_t["Details"].astype(str)).str.lower()
            term = _treat_search.strip().lower()
            try:
                import re as _re
                pat = _re.escape(term)
                mask = blob.str.contains(pat, na=False)
            except Exception:
                mask = blob.str.contains(term, na=False)
            df_t = df_t[mask]

    if df_t.empty:
        st.info("No treatments match the current filters.")
    else:
        # Persist selection
        sel_key = "_sel_existing_treatments_v26"
        sel_set = set(st.session_state.get(sel_key, []))
        df_disp = df_t.copy()
        df_disp = df_disp.set_index("treat_id", drop=True)
        df_disp["Apply"] = df_disp.index.isin(sel_set)

        ed_cols = ["Apply", "Kind", "Name", "Details"]
        if "Date" in df_disp.columns:
            ed_cols.append("Date")
        ed = st.data_editor(
            df_disp[ed_cols],
            hide_index=False,
            use_container_width=True,
            height=320,
            column_config={
                "Apply": st.column_config.CheckboxColumn("Apply"),
                "Kind": st.column_config.TextColumn("Kind"),
                "Name": st.column_config.TextColumn("Name"),
                "Details": st.column_config.TextColumn("Details"),
            },
            disabled={"Kind": True, "Name": True, "Details": True, "Date": True},
            key="_existing_treat_editor_v26",
        )
        # Update selection from editor
        new_sel = set(ed.index[ed["Apply"]].tolist())
        st.session_state[sel_key] = list(new_sel)
        st.caption(f"Existing treatments selected: {len(new_sel)}")
    st.subheader("Add New Treatments (optional)")
    _new_treat_df = st.data_editor(
        pd.DataFrame(columns=["name","notes"]),
        num_rows="dynamic",
        use_container_width=True,
        hide_index=True,
        column_config={
            "name": st.column_config.TextColumn("name"),
            "notes": st.column_config.TextColumn("notes"),
        },
        key="_new_treat_editor_v22",
    )

    # Attach components to each NEW treatment row
    uid, _ = _get_user_id_email()
    if not uid:
        st.info("Sign in to attach RNAs/Plasmids/Dyes to new treatments.")
        _comp_opts = {"RNA": [], "Plasmid": [], "Dye": []}
    else:
        _comp_opts = _fetch_component_options()
    _rna_opts = _comp_opts.get("RNA", [])
    _plasmid_opts = _comp_opts.get("Plasmid", [])
    _dye_opts = _comp_opts.get("Dye", [])
    _tmpdf = _new_treat_df if isinstance(_new_treat_df, pd.DataFrame) else pd.DataFrame(_new_treat_df)
for _i, _row in _tmpdf.reset_index(drop=True).iterrows():
    _nm = _row.get("name") or f"New treatment #{_i+1}"
    with st.expander(f"{_nm}"):
        st.multiselect(
            "RNAs",
            options=[x[0] for x in _rna_opts],
            default=st.session_state.get(f"_newtrt_rna_{_i}", []),
            format_func=lambda _id: dict(_rna_opts).get(_id, _id),
            key=f"_newtrt_rna_{_i}",
        )
        st.multiselect(
            "Plasmids",
            options=[x[0] for x in _plasmid_opts],
            default=st.session_state.get(f"_newtrt_plasmid_{_i}", []),
            format_func=lambda _id: dict(_plasmid_opts).get(_id, _id),
            key=f"_newtrt_plasmid_{_i}",
        )
        st.multiselect(
            "Dyes",
            options=[x[0] for x in _dye_opts],
            default=st.session_state.get(f"_newtrt_dye_{_i}", []),
            format_func=lambda _id: dict(_dye_opts).get(_id, _id),
            key=f"_newtrt_dye_{_i}",
        )

    def _text(label: str, val: str = ""):
        v = st.text_input(label, value=val).strip()
        return v or None

    def _date(label: str):
        return st.date_input(label, value=None, format="YYYY-MM-DD")

    cL, cR = st.columns(2)
    with cL:
        # Removed manual code/fish_code entry; we'll generate them.
        child_name = _text("name (optional)", val=generated_code)
        child_date_birth = _date("date_birth (optional)")
        # line_building_stage dropdown based on existing values, with Custom/None
        stage_vals = _stage_options_from_data(raw_df)
        if stage_vals:
            stage_choice = st.selectbox("line_building_stage", ["— none —", *stage_vals, "Custom…"], index=0)
            if stage_choice == "Custom…":
                child_stage = _text("custom line_building_stage")
            elif stage_choice == "— none —":
                child_stage = None
            else:
                child_stage = stage_choice
        else:
            child_stage = _text("line_building_stage (optional)")
        child_notes = _text("notes (optional)")

    # --- Assign to Tanks (optional) ---
    # --- Create treatments ---
    _create_trts = st.button("Create treatments", key="_btn_create_treatments")
    if _create_trts:
        uid, _ = _get_user_id_email()
        if not uid:
            st.error("Sign in to create treatments.")
        else:
            _df = _new_treat_df if isinstance(_new_treat_df, pd.DataFrame) else pd.DataFrame(_new_treat_df)
            if _df is None or _df.empty:
                st.info("No new treatments to create.")
            else:
                created = 0
                failures = []
                for _i, _row in _df.reset_index(drop=True).iterrows():
                    try:
                        notes = str(_row.get("notes", "")).strip() or None
                        res = sb.table("treatments").insert({"notes": notes}, returning="representation").execute()
                        data = getattr(res, "data", None) or []
                        tid = (data[0].get("id") if data else None)
                        if not tid:
                            raise RuntimeError("Insert returned no id")
                        sel_rnas = st.session_state.get(f"_newtrt_rna_{_i}", []) or []
                        sel_plas = st.session_state.get(f"_newtrt_plasmid_{_i}", []) or []
                        sel_dyes = st.session_state.get(f"_newtrt_dye_{_i}", []) or []
                        _link_trt_rnas(tid, [str(x) for x in sel_rnas])
                        _link_trt_plasmids(tid, [str(x) for x in sel_plas])
                        _link_trt_dyes(tid, [str(x) for x in sel_dyes])
                        created += 1
                    except Exception as e:
                        failures.append(f"row {_i}: {e}")
                if created:
                    st.success(f"Created {created} treatment(s).")
                if failures:
                    st.warning("\n".join(failures))
    st.markdown("**Assign to Tanks (optional)**")
    _tanks_df = fetch_tanks()
    if _tanks_df is None or _tanks_df.empty:
        st.info("No tanks found or tanks table unavailable.")
        selected_tanks: list[str] = []
    else:
        tkey = _tanks_key()
        _tanks_df = _tanks_df.copy()
        _tanks_df["tid"] = _tanks_df[tkey].astype(str)
        label_map = {row["tid"]: _tank_label(row) for row in _tanks_df.to_dict(orient="records")}
        options = list(label_map.keys())
        default_selected = [tid for tid in st.session_state.get("_sel_tanks_v20", []) if tid in options]
        selected_tanks = st.multiselect(
            "Tanks",
            options=options,
            default=default_selected,
            format_func=lambda tid: label_map.get(tid, tid),
            key="_sel_tanks_widget_v20",
        )
        st.session_state["_sel_tanks_v20"] = selected_tanks
with st.expander("Create new tanks (optional)"):
    st.caption("Enter one tank per line. We'll create them and add to your selection.")
    _new_tanks_text = st.text_area("New tank labels", key="_new_tanks_text_v21", height=120, placeholder="e.g.\nTK-001\nNursery A3\nRack 2 - Pos 4")
    _create_tanks = st.button("Create tanks", key="_btn_create_tanks_v21")
    if _create_tanks:
        uid, _ = _get_user_id_email()
        if not uid:
            st.error("Please sign in to create tanks.")
        else:
            labels = [ln.strip() for ln in (_new_tanks_text or "").splitlines() if ln.strip()]
            if not labels:
                st.info("Nothing to create — add one label per line above.")
            else:
                try:
                    payloads = _build_tank_payloads(labels, uid=str(uid))
                    res = sb.table("tanks").insert(payloads).execute()
                    created = getattr(res, "data", None) or []
                    if not created:
                        # Try select to find just-inserted by labels
                        info = _tank_columns_info()
                        label_key = info.get("label_key") or "name"
                        q = sb.table("tanks").select("*").in_(label_key, labels).execute()
                        created = q.data or []
                    if created:
                        info = _tank_columns_info()
                        id_key = info.get("id_key", "id_uuid")
                        # Refresh label map with current tank rows
                        try:
                            # Merge newly created into options
                            new_ids = []
                            for row in created:
                                tid = str(row.get(id_key) or row.get("id") or row.get("id_uuid"))
                                if tid:
                                    new_ids.append(tid)
                            # add to selection and persist
                            selected_tanks = list(dict.fromkeys((selected_tanks or []) + new_ids))
                            st.session_state["_sel_tanks_v20"] = selected_tanks
                            st.success(f"Created {len(new_ids)} tank(s). Added to selection.")
                        except Exception:
                            st.success("Tanks created.")
                    else:
                        st.warning("No tanks returned from insert; verify in DB.")
                except Exception as e:
                    st.error(f"Creating tanks failed: {e}")



def _build_payload():
    uid, uemail = _get_user_id_email()
    if not uid:
        st.error("You're not signed in. Please sign in before creating a child fish.")
        st.stop()
    _child_name = globals().get("child_name")
    _child_date_birth = globals().get("child_date_birth")
    _child_stage = globals().get("child_stage")
    _child_notes = globals().get("child_notes")
    p = {
        "code": generated_code,
        "fish_code": generated_code,
        "name": (_child_name or generated_code),
        "mother_fish_id_uuid": mom_id,
        "father_fish_id_uuid": dad_id,
    }
    p["created_by"] = str(uid)
    if _child_date_birth:
        p["date_birth"] = pd.to_datetime(_child_date_birth).date().isoformat()
    if _child_stage:
        p["line_building_stage"] = _child_stage
    if _child_notes:
        p["notes"] = _child_notes
    return p

def _ids_selected_by_kind() -> dict[str, list[str]]:
    uids = st.session_state.get(inherit_key, set())
    by_kind = {"Transgene": set(), "Mutation": set(), "Treatment": set()}
    for uid in uids:
        try:
            kind, tid = uid.split("|", 1)
        except ValueError:
            continue
        if kind in by_kind:
            by_kind[kind].add(tid)
    return {k: sorted(list(v)) for k, v in by_kind.items()}

cDo, cPr = st.columns([1,2])
with cPr:
    st.markdown("**Preview payload**")
    st.json(_build_payload())
    st.markdown("**Selected features to inherit**")
    st.write(_ids_selected_by_kind())

    # Preview selected existing treatments (names)
    try:
        _all_t = _fetch_all_treatments()
        _emap = dict(zip(_all_t["treat_id"].astype(str), _all_t["Name"].astype(str)))
        _sel_names = [_emap.get(tid, tid) for tid in st.session_state.get("_sel_existing_treatments_v26", [])]
        if _sel_names:
            st.markdown("**Existing treatments selected**")
            st.write(_sel_names)
    except Exception:
        pass


    st.markdown("**New treatments to add**")
    st.write(st.session_state.get("_new_treatment_ids_v22", []))


    st.markdown("**Assign to Tanks**")
    _sel_tanks = st.session_state.get("_sel_tanks_v20", [])
    _lab_map = locals().get("label_map", {})
    lab = [_lab_map.get(t, t) for t in _sel_tanks]
    st.write(lab)


def _link_many(new_fish_uuid: str, which: str, ids: list[str]):
    if not ids:
        return
    table, fk, _ = LINK_MAP[which]
    rows = [{"fish_id_uuid": new_fish_uuid, fk: i} for i in ids]
    try:
        sb.table(table).insert(rows).execute()
    except Exception as e:
        st.warning(f"Linking {which} failed for some ids: {e}")

if cDo.button("Create Child"):
    payload = _build_payload()
    # Idempotency/duplicate guard: if a fish with this code already exists, show it and stop.
    try:
        existing = sb.table("fish").select("id,id_uuid,code,created_at,created_by").eq("code", generated_code).limit(1).execute().data or []
    except Exception:
        existing = []
    if existing:
        row = existing[0]
        st.warning(f"Already created: code {row.get('code')} (id={row.get('id_uuid') or row.get('id')}). No new record was made.")
        st.stop()
    try:
        res = sb.table("fish").insert(payload).execute()
        ins = getattr(res, "data", None) or []
        new_uuid = None
        if ins:
            row0 = ins[0]
            new_uuid = row0.get("id_uuid") or row0.get("id")
        if not new_uuid:
            # Fallback: look up by generated code (in case DB filled defaults but didn't return row)
            sel = sb.table("fish").select("id,id_uuid,code").eq("code", generated_code).order("created_at", desc=True).limit(1).execute().data or []
            if sel:
                new_uuid = sel[0].get("id_uuid") or sel[0].get("id")
        if not new_uuid:
            raise RuntimeError("insert succeeded but could not retrieve new id")
    except Exception as e:
        # If it failed because code already exists, treat as already-created
        msg = str(e)
        if "duplicate" in msg.lower() or "unique" in msg.lower() or "23505" in msg:
            try:
                sel = sb.table("fish").select("id,id_uuid,code").eq("code", generated_code).limit(1).execute().data or []
                if sel:
                    row = sel[0]
                    st.warning(f"Already created earlier: code {row.get('code')} (id={row.get('id_uuid') or row.get('id')}). No new record was made.")
                    st.stop()
            except Exception:
                pass
        st.error(f"Create failed: {e}")
        st.stop()
    chosen = _ids_selected_by_kind()
    # Include existing treatments chosen in the selector
    _existing_sel = st.session_state.get("_sel_existing_treatments_v26", [])
    if _existing_sel:
        chosen.setdefault("Treatment", [])
        chosen["Treatment"] = sorted(list({*chosen.get("Treatment", []), *_existing_sel}))

    try:
        _link_many(str(new_uuid), "Transgene", chosen.get("Transgene", []))
        _link_many(str(new_uuid), "Mutation",  chosen.get("Mutation", []))
        
        # Union inherited + ad-hoc new treatments
        extra_treats = st.session_state.get("_new_treatment_ids_v22", []) or []
        treat_ids = sorted(set((chosen.get("Treatment", []) or []) + extra_treats))
        # Use dynamic fk if needed
        try:
            # If join fk is not "treatment_id", adapt by temp overriding LINK_MAP for this call
            fk = _fish_treatments_fk_key()
            table, _, _ = LINK_MAP["Treatment"]
            rows = [{"fish_id_uuid": str(new_uuid), fk: t} for t in treat_ids] if fk != LINK_MAP["Treatment"][1] else [{"fish_id_uuid": str(new_uuid), LINK_MAP["Treatment"][1]: t} for t in treat_ids]
            sb.table(table).insert(rows).execute()
        except Exception:
            # Fallback to generic helper
            _link_many(str(new_uuid), "Treatment", treat_ids)


        # Link tanks if selected
        try:
            _link_tanks(str(new_uuid), st.session_state.get("_sel_tanks_v20", []))
        except Exception as e:
            st.warning(f"Child created ({new_uuid}), but adding to tanks failed: {e}")

    except Exception as e:
        st.warning(f"Child created ({new_uuid}), but linking failed: {e}")
    else:
        st.success(f"✅ Child fish created (id={new_uuid}), code={generated_code}.")