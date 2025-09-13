import streamlit as st
import urllib.request
from supabase import create_client
from auth_store import load_session, clear_session, save_session
def _reach(url, key):
    req = urllib.request.Request(f"{url.rstrip('/')}/auth/v1/settings", headers={"apikey": key, "Authorization": f"Bearer {key}"})
    urllib.request.urlopen(req, timeout=5).read(1)
def _create():
    url = st.secrets.get("SUPABASE_URL", st.secrets["supabase"]["url"]).rstrip("/")
    key = st.secrets.get("SUPABASE_ANON_KEY", st.secrets["supabase"]["anon_key"]).strip()
    _reach(url, key)
    return create_client(url, key)
SB = _create()
def try_restore():
    sess = load_session()
    if not sess:
        return None
    try:
        SB.auth.set_session(sess["access_token"], sess["refresh_token"])
        SB.auth.get_user()
        return True
    except Exception:
        clear_session()
        return None
def save_current_session():
    try:
        s = SB.auth.get_session()
        at = getattr(s, "access_token", None) if s is not None else None
        rt = getattr(s, "refresh_token", None) if s is not None else None
        if not at and isinstance(s, dict):
            at = s.get("access_token")
            rt = s.get("refresh_token")
        if at and rt:
            save_session(at, rt)
    except Exception:
        pass
def sign_out_and_clear():
    try:
        SB.auth.sign_out()
    except Exception:
        pass
    clear_session()
try_restore()
