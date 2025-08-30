# auth.py
# -------------------------------------------------------------------
# Streamlit + Supabase Auth (invite-friendly)
# - Magic Link is default (great for first-time invited users)
# - Forgot-password flow on Password tab
# - Auto-picks redirect URL via resolve_redirect_url()
# - Persists session tokens in st.session_state["sb_session"]
# -------------------------------------------------------------------

import os
from typing import Optional, Tuple, Dict, Any

import streamlit as st
from supabase import create_client, Client


# ---------- Redirect helper ----------

def resolve_redirect_url() -> str:
    """
    URL to redirect back to after auth.
    Priority:
      1) st.secrets["PUBLIC_BASE_URL"]
      2) env PUBLIC_BASE_URL
      3) fallback: http://localhost:8501
    Must be allowed in Supabase -> Authentication -> URL Configuration.
    """
    url = (
        (st.secrets.get("PUBLIC_BASE_URL") if hasattr(st, "secrets") else None)
        or os.environ.get("PUBLIC_BASE_URL")
        or "http://localhost:8501"
    )
    return url.rstrip("/")


# ---------- Supabase client helpers ----------

@st.cache_resource
def get_supabase(anon: bool = True) -> Client:
    """
    Returns a Supabase client.
    - anon=True  -> ANON key (RLS enforced)
    - anon=False -> SERVICE ROLE key (bypasses RLS; admin-only)
    """
    url = os.environ.get("SUPABASE_URL") or st.secrets["SUPABASE_URL"]
    key = (
        os.environ.get("SUPABASE_ANON_KEY") or st.secrets.get("SUPABASE_ANON_KEY")
        if anon
        else os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
    )
    if not url or not key:
        raise RuntimeError("Missing SUPABASE_URL or API key(s) in env / st.secrets.")
    return create_client(url, key)


def _restore_session(sb: Client) -> Optional[Dict[str, Any]]:
    """
    Restore a saved session (if any) and return user dict or None.
    """
    try:
        sess = st.session_state.get("sb_session")
        if sess:
            sb.auth.set_session(
                access_token=sess.get("access_token"),
                refresh_token=sess.get("refresh_token"),
            )
        user = sb.auth.get_user().user
        if user:
            return {"id": user.id, "email": user.email}
    except Exception:
        pass
    return None


def sign_out(sb: Client) -> None:
    try:
        sb.auth.sign_out()
    finally:
        st.session_state.pop("sb_session", None)


# ---------- Main UI gate ----------

def auth_ui() -> Tuple[Client, Dict[str, Any]]:
    """
    Blocks with a small auth UI until the user is authenticated.
    Returns (sb_client_with_anon_key, user_dict).
    user_dict: {"id": <uuid>, "email": <str>}
    """
    sb = get_supabase(anon=True)

    # If we already have a session, restore & return
    user = _restore_session(sb)
    if user:
        return sb, user

    # First-time friendly banner
    st.info(
        "👋 First time here? If you were invited but haven’t set a password, "
        "**use the Magic Link tab** below. You can add a password later via “Forgot password”."
    )

    # Make Magic Link the first/default tab
    tabs = st.tabs(["Magic Link", "Password", "OAuth"])

    # --- Magic Link (invite-friendly, default) ---
    with tabs[0]:
        st.subheader("Email Magic Link")
        st.caption("For invited users: no password required.")
        ml_email = st.text_input("Email", key="ml_email")
        if st.button("Send magic link"):
            try:
                redirect_to = resolve_redirect_url()
                # Important: prevent auto sign-up if you keep invite-only
                sb.auth.sign_in_with_otp({
                    "email": ml_email,
                    "options": {
                        "email_redirect_to": redirect_to,
                        "should_create_user": False,
                    },
                })
                st.success("Magic link sent. Check your inbox.")
            except Exception as e:
                st.error(f"Magic link failed: {e}")

    # --- Password Sign-in (with Forgot Password) ---
    with tabs[1]:
        st.subheader("Password Sign in")
        email = st.text_input("Email", key="signin_email")
        password = st.text_input("Password", type="password", key="signin_pw")
        if st.button("Sign in"):
            try:
                res = sb.auth.sign_in_with_password({"email": email, "password": password})
                st.session_state["sb_session"] = {
                    "access_token": res.session.access_token,
                    "refresh_token": res.session.refresh_token,
                }
                st.rerun()
            except Exception as e:
                st.error(f"Sign in failed: {e}")

        st.divider()
        st.caption("Forgot your password? Send a reset link:")
        forgot_email = st.text_input("Email for reset link", key="forgot_pw_email")
        if st.button("Send reset link"):
            try:
                sb.auth.reset_password_email(
                    forgot_email,
                    options={"redirect_to": resolve_redirect_url()}
                )
                st.success("Password reset email sent. Check your inbox.")
            except Exception as e:
                st.error(f"Reset failed: {e}")

    # --- OAuth (optional) ---
    with tabs[2]:
        st.subheader("Social sign-in")
        st.caption("Enable providers in Supabase → Authentication → Providers.")
        col1, col2 = st.columns(2)
        with col1:
            if st.button("Continue with Google"):
                try:
                    url = sb.auth.sign_in_with_oauth({
                        "provider": "google",
                        "options": {"redirect_to": resolve_redirect_url()},
                    }).url
                    st.markdown(f"[Click to continue]({url})", unsafe_allow_html=True)
                except Exception as e:
                    st.error(f"Google OAuth failed: {e}")
        with col2:
            if st.button("Continue with GitHub"):
                try:
                    url = sb.auth.sign_in_with_oauth({
                        "provider": "github",
                        "options": {"redirect_to": resolve_redirect_url()},
                    }).url
                    st.markdown(f"[Click to continue]({url})", unsafe_allow_html=True)
                except Exception as e:
                    st.error(f"GitHub OAuth failed: {e}")

    # Halt page rendering until login succeeds
    st.stop()