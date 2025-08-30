# supabase_client.py
from __future__ import annotations

import streamlit as st
from supabase import create_client, Client

@st.cache_resource(show_spinner=False)
def get_client() -> Client:
    """
    Service-role Supabase client for admin-only actions.
    ⚠️ Bypasses RLS — only use behind strict allowlists.
    """
    url = st.secrets.get("SUPABASE_URL")
    key = st.secrets.get("SUPABASE_SERVICE_ROLE_KEY")  # <-- service role (not anon)
    if not url or not key:
        raise RuntimeError(
            "Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in Streamlit Secrets."
        )
    return create_client(url, key)