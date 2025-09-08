import os
import streamlit as st
from urllib.parse import urlparse
from sqlalchemy import create_engine, text

db_url = os.environ.get("DATABASE_URL") or st.secrets["database"]["url"]
supa_url = os.environ.get("SUPABASE_URL") or st.secrets["supabase"]["url"]

engine = create_engine(db_url)
u = urlparse(db_url)
is_local_db = u.hostname in ("127.0.0.1", "localhost")
is_local_api = str(supa_url).startswith("http://127.0.0.1")

with engine.begin() as c:
    now = c.execute(text("select now()")).scalar()

st.sidebar.markdown("### Backend status")
st.sidebar.code({
    "DB host:port": f"{u.hostname}:{u.port or ''}",
    "SUPABASE_URL": supa_url,
    "DB now()": str(now),
}, language="json")

st.sidebar.success("LOCAL stack") if (is_local_db and is_local_api) else st.sidebar.warning("CLOUD stack")
