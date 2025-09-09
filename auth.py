# auth.py
from __future__ import annotations
from typing import Tuple, Dict, Any, Optional
import os

import streamlit as st
import streamlit.components.v1 as components
from supabase import create_client, Client

from utils_env import getenv
from supabase_client import create_client as _create_client


# =========================
# Config & client helpers
# =========================

def resolve_redirect_url() -> str:
    """
    Redirect target for Supabase magic links / OAuth.
    Uses PUBLIC_BASE_URL when present (e.g., https://your-app.streamlit.app).
    Falls back to root; app detects a special query flag.
    """
    base = os.environ.get("PUBLIC_BASE_URL") or st.secrets.get("PUBLIC_BASE_URL") or ""
    base = str(base).rstrip("/")
    # Streamlit apps generally live at "/", and we key off ?auth_callback=1
    return (base or "/") + "/?auth_callback=1"


@st.cache_resource(show_spinner=False)
def _make_client(url: str, key: str) -> Client:
    """Cache keyed by (url, key) so rotating keys yields a new client automatically."""
    return create_client(url, key)




def get_supabase(anon=True):
    url = getenv("SUPABASE_URL")
    anon_key = getenv("SUPABASE_ANON_KEY")
    service_key = getenv("SUPABASE_SERVICE_ROLE_KEY")
    if not url:
        raise RuntimeError("Missing SUPABASE_URL in secrets/env or environment.")
    key = anon_key if anon else (service_key or anon_key)
    if not key:
        raise RuntimeError("Missing Supabase key for selected mode.")
    return _create_client(url, key)



# =========================
# Session management
# =========================

def _restore_session(sb: Client) -> Optional[Dict[str, Any]]:
    """Restore user from saved tokens in session_state if possible."""
    sess = st.session_state.get("sb_session") or {}
    at, rt = sess.get("access_token"), sess.get("refresh_token")
    if not (at and rt):
        return None

    # First try: set provided tokens
    try:
        sb.auth.set_session(access_token=at, refresh_token=rt)
        u = sb.auth.get_user().user
        if u:
            return {"id": u.id, "email": getattr(u, "email", None)}
    except Exception:
        pass

    # Second try: refresh flow
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
# Safari-safe password form
# =========================

def _password_reset_form(form_key: str, submit_label: str = "Set password") -> Optional[tuple[str, str]]:
    """
    Renders a stable form for setting a new password, with Safari-friendly attributes.
    Returns (pw1, pw2) if submitted, else None.
    """
    import streamlit.components.v1 as components

    container = st.container()
    with container:
        with st.form(form_key, clear_on_submit=False, border=True):
            # Avoid the literal word "password" in labels to reduce autofill heuristics
            pw1 = st.text_input("New passphrase", type="password", key=form_key + "_pw1", placeholder="Enter new passphrase")
            pw2 = st.text_input("Confirm passphrase", type="password", key=form_key + "_pw2", placeholder="Re-enter new passphrase")
            submitted = st.form_submit_button(submit_label)

    # Mark inputs as "new-password" so Safari doesn't interrupt
    components.html(
        f"""
        <script>
        (function() {{
          try {{
            const forms = Array.from(parent.document.querySelectorAll('form'));
            const target = forms.filter(f => f.innerText.includes('{submit_label}')).slice(-1)[0];
            if (target) {{
              const inputs = target.querySelectorAll('input[type="password"]');
              inputs.forEach((inp, idx) => {{
                inp.setAttribute('autocomplete', 'new-password');
                inp.setAttribute('autocorrect', 'off');
                inp.setAttribute('autocapitalize', 'none');
                inp.setAttribute('spellcheck', 'false');
                inp.setAttribute('name', idx === 0 ? 'new-password' : 'new-password-confirm');
              }});
            }}
          }} catch (e) {{}}
        }})();
        </script>
        """,
        height=0,
    )

    if 'submitted' in locals() and submitted:
        return pw1, pw2
    return None


# =========================
# Page guard (optional)
# =========================

def require_auth(debug: bool = False) -> Tuple[Client, Dict[str, Any]]:
    """
    Convenience wrapper for pages:
        sb, user = require_auth()
    If not authenticated, this will render the auth UI and stop.
    """
    return auth_ui(debug=debug)


# =========================
# Main gate UI
# =========================

def _resolve_default_tab(prefer_password_first: bool, default_tab: Optional[str]) -> str:
    """
    Decide which tab should appear first.
    Priority:
      1) explicit default_tab param
      2) URL query param ?auth=...
      3) prefer_password_first flag
      4) fallback to 'password'
    Returns one of: 'password', 'magic', 'oauth'
    """
    # Normalize helper
    def norm(x: Optional[str]) -> Optional[str]:
        if not x:
            return None
        x = x.strip().lower()
        if x in ("password", "pass", "pw"):
            return "password"
        if x in ("magic", "magiclink", "link"):
            return "magic"
        if x in ("oauth", "social", "sso"):
            return "oauth"
        return None

    qp_choice = norm(st.query_params.get("auth"))
    param_choice = norm(default_tab)
    if param_choice:
        return param_choice
    if qp_choice:
        return qp_choice
    if prefer_password_first:
        return "password"
    return "password"  # default


def auth_ui(
    debug: bool = False,
    *,
    prefer_password_first: bool = False,
    default_tab: Optional[str] = None,
) -> Tuple[Client, Dict[str, Any]]:
    """
    Block until authenticated. Returns (anon_client, {"id","email"}).

    Order:
      1) Inject fragment-catcher (hash -> query params)
      2) CONSUME query tokens (handle type=recovery here; flag magiclink)
      3) If signed-in AND post-login prompt flag set -> show Set Password prompt
      4) Try restore existing session
      5) Show login UI (tabs: Password / Magic Link / OAuth) with chosen default first

    Parameters:
      prefer_password_first: bool      → if True, Password tab is shown first
      default_tab: {'password'|'magic'|'oauth'} → explicit first tab choice
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
              var typ = params.get("type"); // 'magiclink' or 'recovery'
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
            # For recovery links, ignore any existing session so reset UI shows reliably
            if typ == "recovery":
                for k in ("sb_session", "access_token", "refresh_token"):
                    if k in st.session_state:
                        del st.session_state[k]

            sb.auth.set_session(access_token=at, refresh_token=rt)
            u = sb.auth.get_user().user
            if u:
                if typ == "recovery":
                    st.success("You're authenticated to reset your password.")
                    vals = _password_reset_form("reset_pw_recovery", submit_label="Set password")
                    if vals:
                        new1, new2 = vals
                        if not new1 or new1 != new2:
                            st.error("Passphrases don't match.")
                        else:
                            try:
                                sb.auth.update_user({"password": new1})
                                st.query_params.clear()
                                st.success("Password updated. You're signed in.")
                                st.rerun()
                            except Exception as e:
                                st.error(f"Password update failed: {e}")
                    st.stop()  # stay on reset UI until done

                # If this was a magic link, set a post-login prompt to nudge password setup once.
                if typ == "magiclink":
                    st.session_state["post_login_prompt"] = "set_password"

                # Normal magic-link path: store session and continue
                st.session_state["sb_session"] = {"access_token": at, "refresh_token": rt}
                st.query_params.clear()
                st.rerun()
            else:
                st.warning("Token present but no user returned (expired/used?).")
        except Exception as e:
            st.error(f"Token exchange failed: {e}")

    # 3) If we already have a valid session AND a post-login prompt, show it now
    def _maybe_prompt_set_password(sb_client: Client) -> None:
        st.info("For easier sign-in next time, set a passphrase now.")
        vals = _password_reset_form("reset_pw_postlogin", submit_label="Set passphrase")
        c1, c2 = st.columns([3, 1])
        with c2:
            if st.button("Skip", key="skip_setpw"):
                st.session_state.pop("post_login_prompt", None)
                st.rerun()
        if vals:
            p1, p2 = vals
            if not p1 or p1 != p2:
                st.error("Passphrases don't match.")
            else:
                try:
                    sb_client.auth.update_user({"password": p1})
                    st.success("Passphrase set. You can now log in with email + passphrase.")
                    st.session_state.pop("post_login_prompt", None)
                    st.rerun()
                except Exception as e:
                    st.error(f"Password update failed: {e}")

    # Try to restore session so we can show the prompt in-context
    user = _restore_session(sb)
    if user:
        if st.session_state.get("post_login_prompt"):
            _maybe_prompt_set_password(sb)
            st.stop()  # hold here until user sets/Skips; next run will return normally
        return sb, user

    # 5) Login UI (Password / Magic Link / OAuth) with chosen default first
    choice = _resolve_default_tab(prefer_password_first, default_tab)

    base_order = ["Password", "Magic Link", "OAuth"]
    if choice == "magic":
        tab_order = ["Magic Link", "Password", "OAuth"]
    elif choice == "oauth":
        tab_order = ["OAuth", "Password", "Magic Link"]
    else:
        tab_order = ["Password", "Magic Link", "OAuth"]

    tabs = st.tabs(tab_order)
    tab_index = {name: i for i, name in enumerate(tab_order)}

    st.info(
        "Sign in to continue. If you clicked a magic link and landed here, "
        "it should auto-complete. Otherwise send a new link or paste the URL below."
    )

    # --- Password Sign-in (always implemented; now typically first) ---
    with tabs[tab_index["Password"]]:
        st.subheader("Password Sign-In")
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
            except Exception as e:
                st.error(f"Reset failed: {e}")
            else:
                st.success("Password reset email sent. Click it and set a new password.")

    # --- Magic Link ---
    with tabs[tab_index["Magic Link"]]:
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
                            "should_create_user": True,  # True simplifies testing; set False for invite-only
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
                placeholder="https://…/?auth_callback=1#access_token=…&refresh_token=…&type=recovery"
            )
            if st.button("Use pasted link"):
                from urllib.parse import urlparse, parse_qs, unquote
                import re

                def _extract_tokens_from_any(s: str):
                    """Return (access_token, refresh_token, type_or_codeflag) or (None,None,None)."""
                    if not s:
                        return None, None, None

                    # Iteratively decode common encodings (SafeLinks, %23 fragments, etc.)
                    dec = s.strip()
                    for _ in range(3):
                        new = unquote(dec)
                        if new == dec:
                            break
                        dec = new

                    # Try standard parse on the string as a URL (with nested unwrapping)
                    def _from_urlstring(url_s: str):
                        at = rt = typ = None
                        u = urlparse(url_s)

                        # Prefer fragment first (#access_token=…)
                        if u.fragment:
                            frag = parse_qs(u.fragment)
                            at  = (frag.get("access_token") or [None])[0]
                            rt  = (frag.get("refresh_token") or [None])[0]
                            typ = (frag.get("type") or [None])[0]

                        # Fall back to query (?access_token=…)
                        if (not at or not rt) and (u.query):
                            qs = parse_qs(u.query)
                            at  = at  or (qs.get("access_token") or [None])[0]
                            rt  = rt  or (qs.get("refresh_token") or [None])[0]
                            typ = typ or (qs.get("type") or [None])[0]

                        # Look for nested URLs in query values (SafeLinks wrappers)
                        if (not at or not rt) and u.query:
                            qs = parse_qs(u.query)
                            for values in qs.values():
                                for val in values:
                                    if "http" in val or "%3A%2F%2F" in val:
                                        a2, r2, t2 = _from_urlstring(unquote(val))
                                        if a2 and r2:
                                            return a2, r2, t2
                        return at, rt, typ

                    at, rt, typ = _from_urlstring(dec)

                    # Regex fallback anywhere in the string
                    if not (at and rt):
                        m = re.search(r'(?:[#?&])access_token=([^&#\s]+)', dec)
                        n = re.search(r'(?:[#?&])refresh_token=([^&#\s]+)', dec)
                        t = re.search(r'(?:[#?&])type=([^&#\s]+)', dec)
                        at = at or (m.group(1) if m else None)
                        rt = rt or (n.group(1) if n else None)
                        typ = typ or (t.group(1) if t else None)

                    # If still nothing, maybe it’s a PKCE-style link with ?code=…
                    if not (at and rt):
                        u = urlparse(dec)
                        code = None
                        if u.fragment:
                            code = (parse_qs(u.fragment).get("code") or [None])[0]
                        if not code and u.query:
                            code = (parse_qs(u.query).get("code") or [None])[0]
                        if not code and "code=" in dec:
                            m = re.search(r'(?:[#?&])code=([^&#\s]+)', dec)
                            code = m.group(1) if m else None
                        return at, rt, (typ or ("code:"+code if code else None))

                    return at, rt, typ

                try:
                    pat, prt, ptyp = _extract_tokens_from_any(pasted)

                    # If we got access/refresh tokens, use them
                    if pat and prt:
                        try:
                            sb.auth.set_session(access_token=pat, refresh_token=prt)
                            u = sb.auth.get_user().user
                            if u:
                                if ptyp == "recovery":
                                    st.success("You're authenticated to reset your password.")
                                    vals = _password_reset_form("reset_pw_from_paste", submit_label="Set password")
                                    if vals:
                                        n1, n2 = vals
                                        if not n1 or n1 != n2:
                                            st.error("Passphrases don't match.")
                                        else:
                                            try:
                                                sb.auth.update_user({"password": n1})
                                                st.success("Password updated. You're signed in.")
                                                st.rerun()
                                            except Exception as e:
                                                st.error(f"Password update failed: {e}")
                                    st.stop()
                                # magiclink from pasted URL -> prompt on next run
                                st.session_state["post_login_prompt"] = "set_password"
                                st.session_state["sb_session"] = {"access_token": pat, "refresh_token": prt}
                                st.success("Signed in!")
                                st.rerun()
                            else:
                                st.error("Tokens parsed but no user returned—likely expired/used.")
                        except Exception as e:
                            st.error(f"Token import failed: {e}")
                        st.stop()

                    # If it looks like a PKCE code link, try exchanging the code
                    if ptyp and isinstance(ptyp, str) and ptyp.startswith("code:"):
                        code = ptyp.split(":", 1)[1]
                        if code:
                            try:
                                # Some supabase-py versions expose exchange_code_for_session
                                res = sb.auth.exchange_code_for_session({"code": code})  # may vary by version
                                if res and res.session:
                                    st.session_state["sb_session"] = {
                                        "access_token": res.session.access_token,
                                        "refresh_token": res.session.refresh_token,
                                    }
                                    st.success("Signed in with code exchange!")
                                    st.rerun()
                                else:
                                    st.error("Code exchange returned no session (version mismatch or expired code).")
                            except AttributeError:
                                st.error("Your Supabase client doesn’t support code exchange; update supabase-py.")
                            except Exception as e:
                                st.error(f"Code exchange failed: {e}")
                            st.stop()

                    st.error("No access_token/refresh_token (or code) found in that URL.")
                except Exception as e:
                    st.error(f"Token import failed: {e}")

    # --- OAuth (optional) ---
    with tabs[tab_index["OAuth"]]:
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
