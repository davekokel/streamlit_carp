import os
try:
    import streamlit as st
    ENV = st.secrets.get("env", {})
except Exception:
    ENV = {}
def getenv(k, default=None):
    return ENV.get(k, os.getenv(k, default))
