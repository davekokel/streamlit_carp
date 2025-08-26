# app.py
import streamlit as st
from supabase_client import get_client

st.set_page_config(page_title="Supabase Visualizer", page_icon="🗃️", layout="wide")

st.title("🗃️ Supabase Visualizer")

with st.sidebar:
st.markdown("**Connection**\n\nUses the keys from `.streamlit/secrets.toml`.")

# Simple connection check
try:
sb = get_client()
pong = sb.rpc("pg_sleep", {"seconds": 0}).execute() # no-op if ext exists; ignore errors
st.success("Connected to Supabase ✔")
except Exception as e:
st.error(f"Could not connect: {e}")

st.markdown(
"""
Use the pages on the left to:
- **🔎 Data Explorer**: browse any table, filter, and download CSV.
- **📈 Quick Charts**: make simple charts by picking columns.
- **🧪 SQL Runner**: run safe `SELECT` queries.
"""
)
