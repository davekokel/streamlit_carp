# --- AUTH GATE (Supabase) START ---
import streamlit as st
from supabase import create_client
import pandas as pd

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
                _supabase_client().auth.reset_password_email(
                    email, options={"redirect_to": "http://localhost:8501"}
                )
                st.sidebar.success("Reset link sent if the account exists.")
            except Exception as e:
                st.sidebar.error(f"{e}")
        else:
            st.sidebar.info("Enter your email above first.")

    if st.sidebar.button("Sign out", key="_signout"):
        st.session_state.pop("_sb_tokens", None)
        st.session_state.pop("_email", None)  # fine to pop; we don't assign to this widget key
        st.session_state["_authed"] = False
        st.rerun()

    if not st.session_state.get("_authed"):
        st.stop()

    return _supabase_client()

_sb = _require_login()
# --- AUTH GATE (Supabase) END ---

st.title("Auth & DB Healthcheck")

# Prove current user
try:
    u = _sb.auth.get_user()
    st.write("Signed in as:", getattr(getattr(u, "user", None), "email", None))
except Exception as e:
    st.error(f"auth.get_user() failed: {e}")

# Quick DB probe (adjust 'fish' to your table)
st.subheader("DB check: fish")
try:
    res = _sb.table("fish").select("id", count="exact").limit(1).execute()
    st.write("fish rows:", res.count)
    data = _sb.table("fish").select("*").limit(20).execute().data or []
    if data:
        st.dataframe(pd.DataFrame(data), hide_index=True, use_container_width=True)
except Exception as e:
    st.error(f"Query failed: {e}")
