import streamlit as st
from lib.config import make_supabase_client, make_supabase_admin, get_config

st.title("Auth Tools (Local)")

cfg = get_config()
st.code({"supabase_url": cfg.supabase_url, "has_service_role": bool(cfg.supabase_service_role_key)}, language="json")

# Inputs (give them stable keys so values persist across reruns)
email = st.text_input("Email", key="dev_email")
password = st.text_input("Password", type="password", key="dev_password")

col1, col2, col3 = st.columns(3)

# 1) Sign in with anon client
if col1.button("Sign in (anon client)"):
    if not email.strip() or not password:
        st.warning("Enter both email and password first.")
    else:
        try:
            sb = make_supabase_client()
            res = sb.auth.sign_in_with_password({"email": email.strip(), "password": password})
            st.success(f"Signed in: {res.user.email}")
            st.session_state["user_email"] = res.user.email
            st.session_state["jwt"] = res.session.access_token
        except Exception as e:
            st.error(str(e))

# 2) Create/Reset user with admin (service role), then sign in with anon
if col2.button("Create/Reset user (admin) + sign in"):
    if not cfg.supabase_service_role_key:
        st.error("Missing SUPABASE_SERVICE_ROLE_KEY in secrets/env for admin operations.")
    elif not email.strip() or not password:
        st.warning("Enter both email and password first.")
    else:
        try:
            admin = make_supabase_admin()
            # Try create; if it already exists, we'll fall back to update
            admin.auth.admin.create_user({"email": email.strip(), "password": password, "email_confirm": True})
        except Exception as e:
            msg = str(e).lower()
            if "already registered" in msg or "user already" in msg:
                # Reset password for existing user
                users = admin.auth.admin.list_users(page=1, per_page=200)
                uid = next((u.id for u in users.users if (u.email or "").lower() == email.strip().lower()), None)
                if uid:
                    admin.auth.admin.update_user_by_id(uid, {"password": password, "email_confirm": True})
                else:
                    st.error("User exists but could not find ID to update."); st.stop()
            else:
                st.error(str(e)); st.stop()
        # Now sign in with anon client
        try:
            sb = make_supabase_client()
            res = sb.auth.sign_in_with_password({"email": email.strip(), "password": password})
            st.success(f"Signed in: {res.user.email}")
            st.session_state["user_email"] = res.user.email
            st.session_state["jwt"] = res.session.access_token
        except Exception as e:
            st.error(str(e))

# 3) Sign up via anon (works locally if mailer autoconfirm is on; defaults true in Supabase local)
if col3.button("Sign up (anon)"):
    if not email.strip() or not password:
        st.warning("Enter both email and password first.")
    else:
        try:
            sb = make_supabase_client()
            res = sb.auth.sign_up({"email": email.strip(), "password": password})
            st.success("Sign-up attempted. If autoconfirm is enabled locally, try signing in now.")
            st.write(res)
        except Exception as e:
            st.error(str(e))


import streamlit as st
if st.button("Hard refresh Streamlit"):
    st.cache_resource.clear()
    st.session_state.clear()
    st.rerun()
