# supabase_client.py
from supabase import create_client
import streamlit as st

@st.cache_resource(show_spinner=False)
def get_client():
url = st.secrets["SUPABASE_URL"]
key = st.secrets["SUPABASE_ANON_KEY"]
return create_client(url, key)
