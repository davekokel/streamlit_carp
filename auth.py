# auth.py
from __future__ import annotations

from typing import Tuple, Dict, Any, Optional

import os
import streamlit as st
import streamlit.components.v1 as components
from supabase import create_client, Client


# ------------------------------
# Config helpers
# ------------------------------
def resolve_redirect_url() -> str:
    base = os.environ.get("PUBLIC_BASE_URL") or st.secrets.get("PUBLIC_BASE_URL")
    if base:
        return str(base).rstrip("/") + "/?auth_callback=1"
    return "/?auth_callback=1"


# ------------------------------
# Supabase client (cached)
# ------------------------------
@st.cache_resource(show_spinner=False)
def get_supabase(anon: bool = True) -> Client:
    """
    Returns a cached Supabase client.
    - anon=True  -> use anon key (RLS enforced; NORMAL PAGES)
    - anon=False -> use service role (bypasses RLS; ADMIN-ONLY PAGES)
    """
    url = os.environ.get("SUPABASE_URL") or st.secrets.get("SUPABASE_URL")
    if not url:
        raise RuntimeError("Missing SUPABASE_URL in secrets or env.")

    if anon:
        key = os.environ.get("SUPABASE_ANON_KEY") or st.secrets.get("SUPABASE_ANON_KEY")
        which = "SUPABASE_ANON_KEY"
    else:
        key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
        which = "SUPABASE_SERVICE_ROLE_KEY"

    if not key:
        raise RuntimeError(f"Missing {which} in secrets or env.")

    return create_client(url, key)


# ------------------------------
# Session restore
# ------------------------------
def _restore_session(sb: Client) -> Optional[Dict[str, Any]]:
    """
    Attempt to restore a saved auth session from st.session_state.
    Returns the user dict if logged in, else None.
    """
    sess = st.session_state.get("sb_session") or {}
    at = sess.get("access_token")
    rt = sess.get("refresh_token")
    if not (at and rt):
        return None

    try:
        sb.auth.set_session(access_token=at, refresh_token=rt)
        u = sb.auth.get_user().user
        if u:
            return {"id": u.id, "email": getattr(u, "email", None)}
    except Exception:
        # Try to refresh session if access token is stale
        try:
            res = sb.auth.refresh_session()
            if res and res.session:
                st.session_state["sb_session"] = {
                    "access_token": res.session.access_token,
                    "refresh_token": res.session.refresh_token,
                }
                u = sb.auth.get_user().user
                if u:
                    return {"id": u.id, "email": getattr(u, "email", None)}
        except Exception:
            pass

    # If we got here, stored tokens are invalid; clear them.
    for k in ("sb_session", "access_token", "refresh_token"):
        if k in st.session_state:
            del st.session_state[k]
    return None


# ------------------------------
# Sign out helper
# ------------------------------
def sign_out(sb: Client) -> None:
    """
    Sign the current user out and clear any saved tokens.
    """
    try:
        sb.auth.sign_out()
    except Exception:
        pass

    for k in ("sb_session", "access_token", "refresh_token"):
        if k in st.session_state:
            del st.session_state[k]

    try:
        st.query_params.clear()
    except Exception:
        pass


# ------------------------------
# Main UI gate
# ------------------------------
def auth_ui() -> Tuple[Client, Dict[str, Any]]:
    """
    Blocks with a small auth UI until the user is authenticated.
    Returns (sb_client_with_anon_key, user_dict).
    """
    sb = get_supabase(anon=True)

    # 1) Try restoring a saved session first
    user = _restore_session(sb)
    if user:
        return sb, user

    # 2) CLIENT-SIDE FRAGMENT CATCHER:
    # If the redirect brought a #access_token hash, grab it and turn into ?access_token=... query params
    components.html(
        """
        <script>
        (function () {
          var h = window.location.hash;
          if (h && h.indexOf("access_token=") !== -1) {
            var params = new URLSearchParams(h.substring(1));
            var at = params.get("access_token");
            var rt = params.get("refresh_token");
            if (at && rt) {
              var url = new URL(window.location.href);
              url.hash = "";  // strip fragment
              url.searchParams.set("access_token", at);
              url.searchParams.set("refresh_token", rt);
              window.location.replace(url.toString());
            }
          }
        })();
        </script>
        """,
        height=0,
    )

    # 3) SERVER-SIDE CONSUME TOKENS FROM QUERY PARAMS
    q = st.query_params
    at = q.get("access_token")
    rt = q.get("refresh_token")
    if at and rt:
        try:
            sb.auth.set_session(access_token=at, refresh_token=rt)
            u = sb.auth.get_user().user
            if u:
                # persist for future runs
                st.session_state["sb_session"] = {"access_token": at, "refresh_token": rt}
                # clear query params (tidy URL)
                st.query_params.clear()
                st.rerun()
        except Exception as e:
            st.warning(f"Token exchange failed: {e}")

    # ---- If we get here, still not logged in -> show login UI ----
    st.info("👋 If you clicked a magic link, you should land here signed in. If not, try the Magic Link tab or enter the 6-digit code from the email.")

    tabs = st.tabs(["Magic Link", "Password", "OAuth"])

    # --- Magic Link ---
    with tabs[0]:
        st.subheader("Email Magic Link")
        ml_email = st.text_input("Email", key="ml_email")
        col_ml1, col_ml2 = st.columns([1, 1])
        with col_ml1:
            if st.button("Send magic link"):
                try:
                    sb.auth.sign_in_with_otp({
                        "email": ml_email,
                        "options": {
                            "email_redirect_to": resolve_redirect_url(),
                            "should_create_user": False,  # invite-only/team-only
                        },
                    })
                    st.success("Magic link sent. Check your inbox.")
                except Exception as e:
                    st.error(f"Magic link failed: {e}")
        # OTP fallback: Supabase emails often include a 6-digit code too
        with col_ml2:
            code = st.text_input("Enter 6-digit code from email (optional)", max_chars=6)
            if st.button("Verify code"):
                try:
                    res = sb.auth.verify_otp({"email": ml_email, "token": code, "type": "email"})
                    if res and res.session:
                        st.session_state["sb_session"] = {
                            "access_token": res.session.access_token,
                            "refresh_token": res.session.refresh_token,
                        }
                        st.rerun()
                    else:
                        st.error("Verification failed. Double-check the code and email.")
                except Exception as e:
                    st.error(f"Verify failed: {e}")

    # --- Password Sign-in ---
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
                    # rerun to show the app
                st.rerun()
            except Exception as e:
                st.error(f"Sign in failed: {e}")

        st.caption("Forgot password? Send a reset link below.")
        forgot_email = st.text_input("Email for reset link", key="forgot_pw_email")
        if st.button("Send reset link"):
            try:
                sb.auth.reset_password_email(
                    forgot_email,
                    options={"redirect_to": resolve_redirect_url()}
                )
                st.success("Password reset email sent.")
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

    st.stop()