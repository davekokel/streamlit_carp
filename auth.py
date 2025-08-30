# auth.py
from __future__ import annotations
from typing import Tuple, Dict, Any, Optional
import os

import streamlit as st
import streamlit.components.v1 as components
from supabase import create_client, Client

# =========================
# Config & client helpers
# =========================

def resolve_redirect_url() -> str:
    """
    Redirect target for Supabase magic links / OAuth.
    Use a query-param callback because Streamlit doesn't serve custom paths.
    """
    base = os.environ.get("PUBLIC_BASE_URL") or st.secrets.get("PUBLIC_BASE_URL") or ""
    base = str(base).rstrip("/")
    return (base or "/") + "/?auth_callback=1"


@st.cache_resource(show_spinner=False)
def _make_client(url: str, key: str) -> Client:
    """Cache keyed by (url, key) so rotating keys yields a new client automatically."""
    return create_client(url, key)


def get_supabase(anon: bool = True) -> Client:
    """
    anon=True  -> anon key (RLS enforced; normal user actions)
    anon=False -> service-role (BYPASSES RLS; admin-only)
    """
    url = os.environ.get("SUPABASE_URL") or st.secrets.get("SUPABASE_URL")
    if not url:
        raise RuntimeError("Missing SUPABASE_URL in secrets/env.")
    key = (
        os.environ.get("SUPABASE_ANON_KEY") or st.secrets.get("SUPABASE_ANON_KEY")
        if anon else
        os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")
    )
    if not key:
        which = "SUPABASE_ANON_KEY" if anon else "SUPABASE_SERVICE_ROLE_KEY"
        raise RuntimeError(f"Missing {which} in secrets/env.")
    return _make_client(url, key)

# =========================
# Session management
# =========================

def _restore_session(sb: Client) -> Optional[Dict[str, Any]]:
    """Restore user from saved tokens in session_state if possible."""
    sess = st.session_state.get("sb_session") or {}
    at, rt = sess.get("access_token"), sess.get("refresh_token")
    if not (at and rt):
        return None
    try:
        sb.auth.set_session(access_token=at, refresh_token=rt)
        u = sb.auth.get_user().user
        if u:
            return {"id": u.id, "email": getattr(u, "email", None)}
    except Exception:
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
    # Clear bad tokens
    for k in ("sb_session", "access_token", "refresh_token"):
        if k in st.session_state:
            del st.session_state[k]
    return None


def sign_out(sb: Client) -> None:
    """Sign the user out and clear local tokens."""
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

# =========================
# Main gate UI
# =========================

def auth_ui(debug: bool = False) -> Tuple[Client, Dict[str, Any]]:
    """
    Block until authenticated. Returns (anon_client, {"id","email"}).

    Order:
      1) Inject fragment-catcher (hash -> query params)
      2) CONSUME query tokens (handle type=recovery here)
      3) Try restore existing session
      4) Show login UI (Magic link / Password / OAuth)
    """
    sb = get_supabase(anon=True)

    # 1) Client-side fragment catcher -> query params
    components.html(
        """
        <script>
        (function () {
          try {
            var h = window.location.hash;
            if (h && h.indexOf("access_token=") !== -1) {
              var params = new URLSearchParams(h.substring(1));
              var at  = params.get("access_token");
              var rt  = params.get("refresh_token");
              var typ = params.get("type"); // includes 'recovery' for reset links
              if (at && rt) {
                var url = new URL(window.location.href);
                url.hash = "";
                if (!url.searchParams.get("access_token")) {
                  url.searchParams.set("access_token", at);
                  url.searchParams.set("refresh_token", rt);
                  if (typ) url.searchParams.set("type", typ);
                  window.location.replace(url.toString());
                  return;
                }
              }
            }
          } catch (e) {}
        })();
        </script>
        """,
        height=0,
    )

    if debug:
        components.html(
            """
            <div style="font:12px monospace;color:#666" id="authdbg"></div>
            <script>
              var d=document.getElementById('authdbg');
              d.textContent = "href: " + window.location.href + "\\n" +
                              "hash: " + window.location.hash;
            </script>
            """,
            height=48,
        )

    # 2) Server-side: consume query tokens (PRIORITY path)
    q = st.query_params
    at, rt, typ = q.get("access_token"), q.get("refresh_token"), q.get("type")

    if at and rt:
        try:
            # If handling a recovery link, ignore any existing session so reset UI shows reliably
            if typ == "recovery":
                for k in ("sb_session", "access_token", "refresh_token"):
                    if k in st.session_state:
                        del st.session_state[k]

            sb.auth.set_session(access_token=at, refresh_token=rt)
            u = sb.auth.get_user().user
            if u:
                if typ == "recovery":
                    # Show the set-password form immediately
                    st.success("You're authenticated to reset your password.")
                    new1 = st.text_input("New password", type="password")
                    new2 = st.text_input("Confirm new password", type="password")
                    if st.button("Set password"):
                        if not new1 or new1 != new2:
                            st.error("Passwords don't match.")
                        else:
                            try:
                                sb.auth.update_user({"password": new1})
                                st.query_params.clear()
                                st.success("Password updated. You're signed in.")
                                st.rerun()
                            except Exception as e:
                                st.error(f"Password update failed: {e}")
                    st.stop()  # stay on reset UI until done

                # Normal magic-link: store session and continue
                st.session_state["sb_session"] = {"access_token": at, "refresh_token": rt}
                st.query_params.clear()
                st.rerun()
            else:
                st.warning("Token present but no user returned (expired/used?).")
        except Exception as e:
            st.error(f"Token exchange failed: {e}")

    # 3) No incoming tokens -> try restoring a saved session
    user = _restore_session(sb)
    if user:
        return sb, user

    # 4) Login UI (magic link / password / oauth)
    st.info(
        "Sign in to continue. If you clicked a magic link and landed here, "
        "it should auto-complete. Otherwise send a new link or paste the URL below."
    )
    tabs = st.tabs(["Magic Link", "Password", "OAuth"])

    # --- Magic Link ---
    with tabs[0]:
        st.subheader("Email Magic Link")
        ml_email = st.text_input("Email", key="ml_email")

        c1, c2 = st.columns(2)
        with c1:
            if st.button("Send magic link"):
                try:
                    sb.auth.sign_in_with_otp({
                        "email": ml_email,
                        "options": {
                            "email_redirect_to": resolve_redirect_url(),
                            # set False for invite-only; True simplifies testing
                            "should_create_user": True,
                        },
                    })
                    st.success("Magic link sent. Open it in the SAME browser as this app.")
                    st.caption("If it opens elsewhere, copy the URL and paste it on the right.")
                except Exception as e:
                    st.error(f"Magic link failed: {e}")

        with c2:
            st.caption("Paste the FULL magic-link URL if it opened in another app/browser:")
            pasted = st.text_input(
                "Paste URL (we'll extract access_token automatically)",
                placeholder="https://...streamlit.app/?auth_callback=1#access_token=...&refresh_token=...&type=recovery"
            )
            if st.button("Use pasted link"):
                from urllib.parse import urlparse, parse_qs
                pat = prt = ptyp = None
                try:
                    if pasted:
                        u = urlparse(pasted)
                        if u.fragment:
                            frag = parse_qs(u.fragment)
                            pat  = (frag.get("access_token") or [None])[0]
                            prt  = (frag.get("refresh_token") or [None])[0]
                            ptyp = (frag.get("type") or [None])[0]
                        if not pat or not prt:
                            qs = parse_qs(u.query or "")
                            pat  = pat  or (qs.get("access_token") or [None])[0]
                            prt  = prt  or (qs.get("refresh_token") or [None])[0]
                            ptyp = ptyp or (qs.get("type") or [None])[0]
                    if pat and prt:
                        sb.auth.set_session(access_token=pat, refresh_token=prt)
                        u = sb.auth.get_user().user
                        if u:
                            if ptyp == "recovery":
                                st.success("You're authenticated to reset your password.")
                                n1 = st.text_input("New password", type="password", key="newpw1")
                                n2 = st.text_input("Confirm new password", type="password", key="newpw2")
                                if st.button("Set password", key="setpw_paste"):
                                    if not n1 or n1 != n2:
                                        st.error("Passwords don't match.")
                                    else:
                                        try:
                                            sb.auth.update_user({"password": n1})
                                            st.success("Password updated. You're signed in.")
                                            st.rerun()
                                        except Exception as e:
                                            st.error(f"Password update failed: {e}")
                                st.stop()
                            st.session_state["sb_session"] = {"access_token": pat, "refresh_token": prt}
                            st.success("Signed in!")
                            st.rerun()
                        else:
                            st.error("Tokens parsed but no user returned—likely expired/used.")
                    else:
                        st.error("No access_token/refresh_token found in that URL.")
                except Exception as e:
                    st.error(f"Token import failed: {e}")

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
                st.rerun()
            except Exception as e:
                st.error(f"Sign in failed: {e}")

        st.caption("Forgot password? Send a reset link below.")
        reset_email = st.text_input("Email for reset link")
        if st.button("Send reset link"):
            try:
                sb.auth.reset_password_email(
                    reset_email,
                    options={"redirect_to": resolve_redirect_url()}
                )
                st.success("Password reset email sent. Click it and set a new password.")
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