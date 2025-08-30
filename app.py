# app.py
import os
import streamlit as st

# Auth helpers (make sure auth.py is in the same folder)
from auth import auth_ui, sign_out, get_supabase

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
# sb = anon-key client (RLS enforced), user = {"id", "email"}
sb, user = auth_ui()  # blocks with login UI until authenticated

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
# Set ADMIN_EMAILS env var as a comma-separated list, or edit below.
ADMIN_EMAILS = {
    e.strip().lower()
    for e in os.environ.get("ADMIN_EMAILS", "you@company.com").split(",")
    if e.strip()
}

sb_admin = None
if user["email"].lower() in ADMIN_EMAILS:
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
# Lightweight check using the user-scoped anon client.
# Replace 'profiles' with any table that the signed-in user can read.
try:
    sb.table("profiles").select("id").limit(1).execute()
    st.success("Connected to Supabase ✔ (user session)")
except Exception as e:
    st.error(f"User session connection issue: {e}")

st.markdown(
    """
    Use the pages on the left to:
    - **🔎 Data Explorer**: browse any table, filter, and download CSV.
    - **📈 Quick Charts**: make simple charts by picking columns.
    - **🧪 SQL Runner**: run safe `SELECT` queries.
    """
)

# If you still want to show a separate “admin connection ok” check using your original get_client():
if sb_admin:
    with st.expander("🛠️ Admin tools (service role)"):
        st.write("You have access to admin-only features.")
        # Example: preview a table with service role (BE CAREFUL—bypasses RLS!)
        # preview = sb_admin.table("some_table").select("*").limit(5).execute().data
        # st.write(preview)

https://appcarp-dg9lwwnuwbrb4yqiju3ted.streamlit.app/?auth_callback=1#access_token=eyJhbGciOiJIUzI1NiIsImtpZCI6InNXTDF5SldtejNIUHVuS2MiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3hkd3ptcWJyYmtobWhjandrb3ByLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJkNTFiNzNlMy0yYzU3LTQyN2MtOWY5Yi05YzRjMDY3ZjkyMWYiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzU2NTc0NzUxLCJpYXQiOjE3NTY1NzExNTEsImVtYWlsIjoiZGF2ZWtva2VsQGJlcmtlbGV5LmVkdSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWxfdmVyaWZpZWQiOnRydWV9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6Im90cCIsInRpbWVzdGFtcCI6MTc1NjU3MTE1MX1dLCJzZXNzaW9uX2lkIjoiMTk0NGNiYWQtMTkzZi00NjdkLWIzNWItOTM0ZGVkYTNlMDNjIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.9AfekcZE4Y-A93f33aSPRkK94YbedLzGEPK1QwQEL-4&expires_at=1756574751&expires_in=3600&refresh_token=5j6k3lzucepl&token_type=bearer&type=magiclink