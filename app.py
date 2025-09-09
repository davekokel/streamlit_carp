# app.py
import os
import streamlit as st
from auth import auth_ui, sign_out
from supabase_client import get_client

st.set_page_config(page_title="Supabase Visualizer", page_icon="🗃️", layout="wide")
st.title("🗃️ Supabase Visualizer")

sb = None
user = {}
auth_err = None
try:
    try:
        sb, user = auth_ui(prefer_password_first=True)
    except TypeError:
        try:
            sb, user = auth_ui(default_tab="password")
        except TypeError:
            sb, user = auth_ui()
except Exception as e:
    auth_err = e

st.components.v1.html("""
<script>
setTimeout(() => {
  const inputs = Array.from(document.querySelectorAll('input'));
  const email = inputs.find(i => i.type==='text' && /email/i.test(i.getAttribute('aria-label')||''));
  const user  = inputs.find(i => i.type==='text' && !/email/i.test(i.getAttribute('aria-label')||''));
  const pw    = inputs.find(i => i.type==='password');
  if (email){ email.setAttribute('autocomplete','username'); email.setAttribute('name','username'); }
  if (!email && user){ user.setAttribute('autocomplete','username'); user.setAttribute('name','username'); }
  if (pw){ pw.setAttribute('autocomplete','current-password'); pw.setAttribute('name','password'); }
}, 200);
</script>
""", height=0)

with st.sidebar:
    st.markdown("**Connection**  \nUses keys from `.streamlit/secrets.toml` or env vars.")
    st.caption(f"Signed in as **{(user or {}).get('email','')}**")
    if st.button("Sign out"):
        sign_out(sb)
        st.rerun()

ADMIN_EMAILS = {
    e.strip().lower()
    for e in os.environ.get("ADMIN_EMAILS", "").split(",")
    if e.strip()
}

sb_admin = None
if (user or {}).get("email","").lower() in ADMIN_EMAILS:
    try:
        sb_admin = get_client()
        st.sidebar.success("Admin (service role) connected ✔")
    except Exception as e:
        st.sidebar.error(f"Admin connection failed: {e}")
else:
    st.sidebar.info("Standard user mode (RLS enforced)")

placeholder = st.empty()

if auth_err:
    with placeholder.container():
        st.error("Authentication component failed to load.")
        st.exception(auth_err)
else:
    ok = False
    probe_err = None
    try:
        if sb is not None:
            sb.table("profiles").select("id").limit(1).execute()
            ok = True
    except Exception as e:
        probe_err = e

    with placeholder.container():
        if ok:
            st.success("Connected to Supabase ✔ (user session)")
        else:
            st.info("Tried probing the 'profiles' table to verify connectivity.")
            st.caption("If your schema doesn't have 'profiles', change the table name in app.py.")
            if probe_err:
                st.exception(probe_err)

        st.markdown(
            """
            Use the pages on the left to:
            - **🔎 Data Explorer**: browse any table, filter, and download CSV.
            - **📈 Quick Charts**: make simple charts by picking columns.
            - **🧪 SQL Runner**: run safe `SELECT` queries.
            """
        )

        if sb_admin:
            with st.expander("🛠️ Admin tools (service role)"):
                st.write("You have access to admin-only features.")
