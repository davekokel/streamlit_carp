# app.py
import os
import streamlit as st

# Auth helpers (make sure auth.py is in the same folder)
from auth import auth_ui, sign_out

# Your existing helper that returns a service-role client (admin-only!)
from supabase_client import get_client

# ------------------------------
# Page config
# ------------------------------
st.set_page_config(page_title="Supabase Visualizer", page_icon="🗃️", layout="wide")
st.title("🗃️ Supabase Visualizer")

# ------------------------------
# Require sign-in
# ------------------------------
# Hint the auth UI to show Password first (if supported), else gracefully fall back.
# We also set a query param that some auth_ui implementations read.
qp = st.query_params
if qp.get("auth") != "password":
    qp["auth"] = "password"
    st.query_params = qp  # updates the URL; harmless if unsupported

sb = None
user = None
_auth_ex = None

try:
    # Most likely signature if your auth_ui supports a preferred tab
    sb, user = auth_ui(prefer_password_first=True)
except TypeError as e:
    _auth_ex = e
    try:
        # Alternate common kw name
        sb, user = auth_ui(default_tab="password")
    except TypeError as e2:
        _auth_ex = e2
        # Final fallback: original call (Magic link might show first)
        sb, user = auth_ui()
        st.info(
            "Password-first hint not supported by your current auth_ui. "
            "If you want the Password tab to appear first permanently, "
            "add a parameter like prefer_password_first=True or default_tab='password' in auth.py."
        )

# ------------------------------
# Sidebar: session info & sign-out
# ------------------------------
with st.sidebar:
    st.markdown("**Connection**  \nUses keys from `.streamlit/secrets.toml` or env vars.")
    st.caption(f"Signed in as **{user['email']}**")
    if st.button("Sign out"):
        sign_out(sb)
        st.rerun()

# ------------------------------
# Optional: Admin connection (service role) for allowlisted emails
# ------------------------------
# Set ADMIN_EMAILS env var as a comma-separated list (e.g., "you@company.com,admin@org.org")
ADMIN_EMAILS = {
    e.strip().lower()
    for e in os.environ.get("ADMIN_EMAILS", "").split(",")
    if e.strip()
}

sb_admin = None
if user.get("email", "").lower() in ADMIN_EMAILS:
    try:
        sb_admin = get_client()  # your existing service-role client
        st.sidebar.success("Admin (service role) connected ✔")
    except Exception as e:
        st.sidebar.error(f"Admin connection failed: {e}")
else:
    st.sidebar.info("Standard user mode (RLS enforced)")

# ------------------------------
# App content (keeps your original UX)
# ------------------------------
ok = False
try:
    sb.table("profiles").select("id").limit(1).execute()
    ok = True
except Exception as e:
    st.info("Tried probing the 'profiles' table to verify connectivity.")
    st.caption("If your schema doesn't have 'profiles', change the table name below.")
    st.exception(e)

if ok:
    st.success("Connected to Supabase ✔ (user session)")

st.markdown(
    """
    Use the pages on the left to:
    - **🔎 Data Explorer**: browse any table, filter, and download CSV.
    - **📈 Quick Charts**: make simple charts by picking columns.
    - **🧪 SQL Runner**: run safe `SELECT` queries.
    """
)

# Optional: separate “admin connection ok” check using your original get_client()
if sb_admin:
    with st.expander("🛠️ Admin tools (service role)"):
        st.write("You have access to admin-only features.")
        # Example (disabled by default): preview with service role. BE CAREFUL—bypasses RLS!
        # preview = sb_admin.table("some_table").select("*").limit(5).execute().data
        # st.write(preview)
