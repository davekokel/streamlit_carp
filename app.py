# --- AUTH GATE (Supabase) START ---
import streamlit as st
from supabase import create_client

def _supabase_client():
    return create_client(st.secrets["SUPABASE_URL"], st.secrets["SUPABASE_ANON_KEY"])

def _require_login():
    st.sidebar.markdown("### Sign in")
    email = st.sidebar.text_input("Email", key="_email")
    pw = st.sidebar.text_input("Password", type="password", key="_pw")
    col_a, col_b = st.sidebar.columns(2)
    do_login = col_a.button("Sign in", key="_signin")
    do_reset = col_b.button("Forgot password", key="_forgot")

    if do_login:
        try:
            sb = _supabase_client()
            res = sb.auth.sign_in_with_password({"email": email, "password": pw})
            sess = res.session
            if sess:
                st.session_state["_sb_tokens"] = {
                    "access_token": sess.access_token,
                    "refresh_token": sess.refresh_token,
                    "expires_in": int(getattr(sess, "expires_in", 3600) or 3600),
                }
                st.session_state["_authed"] = True
                st.success("Logged in")
                st.rerun()
        except Exception as e:
            st.error(f"Login failed: {e}")

    if do_reset:
        if (email or "").strip():
            try:
                _supabase_client().auth.reset_password_email(email, options={"redirect_to": "http://localhost:8501"})
                st.sidebar.success("Reset link sent if the account exists.")
            except Exception as e:
                st.sidebar.error(f"{e}")
        else:
            st.sidebar.info("Enter your email above first.")

    if st.sidebar.button("Sign out", key="_signout"):
        st.session_state.pop("_sb_tokens", None)
        st.session_state.pop("_email", None)
        st.session_state["_authed"] = False
        st.rerun()

    if not st.session_state.get("_authed"):
        st.stop()

    return _supabase_client()

_sb = _require_login()
# --- AUTH GATE (Supabase) END ---

import os, pathlib, json, datetime as _dt, requests
import streamlit as st
import monkeypatch_auth
from supa_client import SB, save_current_session, sign_out_and_clear
from supabase import create_client

st.set_page_config(page_title="Carp", layout="wide")
st.set_option("client.showErrorDetails", True)
st.sidebar.write(f"build: {_dt.datetime.now().isoformat(timespec='seconds')}")

URL  = st.secrets.get("SUPABASE_URL", st.secrets["supabase"]["url"])
ANON = st.secrets.get("SUPABASE_ANON_KEY", st.secrets["supabase"]["anon_key"])
SVC  = st.secrets.get("SERVICE_ROLE_KEY")
DBURL = st.secrets.get("DATABASE_URL")

st.sidebar.info(
    f"SUPABASE_URL={URL}\n"
    f"ANON[0:8]={ANON[:8]}\n"
    f"SVC set?={'yes' if SVC else 'no'}\n"
    f"ENV_URL={os.environ.get('SUPABASE_URL')}\n"
    f"ENV_ANON[0:8]={str(os.environ.get('SUPABASE_ANON_KEY') or '')[:8]}"
)

pre = st.sidebar.container()
pre.subheader("diag (pre-gate)")
pre.write({"cwd": os.getcwd(), "app_dir": str(pathlib.Path(__file__).resolve().parent)})
pre.write({"URL": URL, "ANON_present": bool(ANON), "SVC_present": bool(SVC)})

with st.sidebar.expander("debug: raw REST login"):
    rest_email = st.text_input("email (REST)", key="rest_email")
    rest_pass  = st.text_input("password (REST)", type="password", key="rest_pass")
    if st.button("Try REST login", key="rest_try"):
        u = URL.rstrip("/") + "/auth/v1/token?grant_type=password"
        r = requests.post(
            u,
            headers={"apikey": ANON, "Authorization": f"Bearer {ANON}", "Content-Type": "application/json"},
            json={"email": rest_email, "password": rest_pass},
            timeout=10,
        )
        st.write("status", r.status_code)
        try:
            st.code(json.dumps(r.json(), indent=2))
        except Exception:
            st.write(r.text)

def rest_password_login(url: str, anon_key: str, email: str, password: str):
    u = url.rstrip("/") + "/auth/v1/token?grant_type=password"
    r = requests.post(
        u,
        headers={"apikey": anon_key, "Authorization": f"Bearer {anon_key}", "Content-Type": "application/json"},
        json={"email": email, "password": password},
        timeout=10,
    )
    if r.status_code == 200:
        body = r.json()
        return {
            "access_token": body.get("access_token"),
            "refresh_token": body.get("refresh_token"),
            "user": body.get("user"),
        }
    try:
        raise RuntimeError(f"REST login failed {r.status_code}: {json.dumps(r.json())}")
    except Exception:
        raise RuntimeError(f"REST login failed {r.status_code}: {r.text}")

@st.cache_resource
@st.cache_resource
def sb_admin(url, svc_key):
    if not svc_key:
        raise RuntimeError("SERVICE_ROLE_KEY missing in .streamlit/secrets.toml")
    return create_client(url, svc_key)

ADM = sb_admin(URL, SVC) if SVC else None

def is_authed():
    return (
        "sb_user" in st.session_state
        and "sb_access_token" in st.session_state
        and "sb_refresh_token" in st.session_state
    )

def attach_session():
    if "sb_access_token" in st.session_state and "sb_refresh_token" in st.session_state:
        try:
            SB.auth.set_session(st.session_state["sb_access_token"], st.session_state["sb_refresh_token"])
        except Exception:
            for k in ("sb_access_token", "sb_refresh_token", "sb_user"):
                st.session_state.pop(k, None)

def sign_in_ui():
    st.title("Sign in")
    with st.form("login_form", clear_on_submit=False):
        st.text_input("Email", key="login_email", placeholder="you@example.com")
        st.text_input("Password", type="password", key="login_password", placeholder="••••••••")
        submitted = st.form_submit_button("Sign in")
    _, c2 = st.columns(2)
    if c2.button("Use a different account", key="login_switch"):
        st.session_state.clear()
        st.rerun()
    if submitted:
        email_val = (st.session_state.get("login_email") or "").strip()
        password_val = st.session_state.get("login_password") or ""
        if not email_val:
            st.warning("Please enter your email address."); st.stop()
        if not password_val:
            st.warning("Please enter your password."); st.stop()
        if len(password_val) < 6:
            st.warning("Password should be at least 6 characters."); st.stop()
        try:
            res = SB.auth.sign_in_with_password({"email": email_val, "password": password_val})
            st.session_state["sb_user"] = {"id": res.user.id, "email": res.user.email}
            st.session_state["sb_access_token"] = res.session.access_token
            st.session_state["sb_refresh_token"] = res.session.refresh_token
            st.rerun()
        except Exception as e_sdk:
            if "Invalid login credentials" in str(e_sdk):
                try:
                    rest = rest_password_login(URL, ANON, email_val, password_val)
                    if not rest["access_token"] or not rest["refresh_token"]:
                        raise RuntimeError("REST login returned no tokens")
                    SB.auth.set_session(rest["access_token"], rest["refresh_token"])
                    u = rest.get("user") or {}
                    st.session_state["sb_user"] = {"id": u.get("id") or "unknown", "email": u.get("email") or email_val}
                    st.session_state["sb_access_token"] = rest["access_token"]
                    st.session_state["sb_refresh_token"] = rest["refresh_token"]
                    st.success("Signed in via REST fallback")
                    st.rerun()
                except Exception as e_rest:
                    import traceback
                    st.error("Login failed (SDK and REST)")
                    st.code("SDK: " + repr(e_sdk))
                    st.code("REST: " + repr(e_rest))
                    st.code(traceback.format_exc())
                    st.stop()
            else:
                import traceback
                st.error("Login failed (SDK)")
                st.code(repr(e_sdk))
                st.code(traceback.format_exc())
                st.stop()

attach_session()

if not is_authed():
    sign_in_ui()
    st.stop()

st.sidebar.write(f"Signed in as {st.session_state['sb_user']['email']}")
if st.sidebar.button("Sign out", key="logout"):
    try:
        SB.auth.sign_out()
    except Exception:
        pass
    st.session_state.clear()
    st.rerun()

st.title("Home")
st.write("Welcome.")

diag = st.sidebar.container()
diag.subheader("diag (post-gate)")

try:
    r = SB.table("rna").select("id,name").limit(1).execute()
    diag.write(f"anon read ok: {r.data}")
except Exception as e:
    diag.error(f"anon read failed: {e}")

try:
    if ADM is None:
        raise RuntimeError("No service client")
    sr = ADM.table("rna").select("id").limit(1).execute()
    diag.write("service key works (DB read via service role ok)")
except Exception as e:
    diag.error(f"service-role DB read failed: {e}")