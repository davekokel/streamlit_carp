import time
import streamlit as st

def _get_expires_at(sb):
    try:
        s = sb.auth.get_session()
        if not s:
            return None
        ea = getattr(s, "expires_at", None)
        if ea is None and isinstance(s, dict):
            ea = s.get("expires_at")
        return int(ea) if ea is not None else None
    except Exception:
        return None

def _refresh_if_needed(sb, skew_seconds=300):
    try:
        exp = _get_expires_at(sb)
        if not exp:
            return sb
        now = int(time.time())
        if exp - now <= skew_seconds:
            sb.auth.refresh_session()
        return sb
    except Exception:
        return sb

def ensure_auth(auth_ui_func):
    if "sb_client" in st.session_state and "sb_user" in st.session_state:
        sb = st.session_state["sb_client"]
        sb = _refresh_if_needed(sb)
        st.session_state["sb_client"] = sb
        return sb, st.session_state["sb_user"]
    sb, user = auth_ui_func(prefer_password_first=True)
    st.session_state["sb_client"] = sb
    st.session_state["sb_user"] = user
    sb = _refresh_if_needed(sb)
    return sb, user

def sign_out_and_clear(sign_out_func):
    sb = st.session_state.get("sb_client")
    try:
        if sb:
            sign_out_func(sb)
    finally:
        for k in ("sb_client","sb_user"):
            if k in st.session_state:
                del st.session_state[k]
