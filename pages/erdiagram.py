import os
import streamlit as st
from sqlalchemy import create_engine
from utils.er_mermaid import generate_mermaid_er

db_url = os.environ.get("DATABASE_URL") or st.secrets["database"]["url"]
engine = create_engine(db_url)

schema = st.text_input("Schema", "public")
mermaid_code = generate_mermaid_er(engine, schema=schema)

st.download_button("Download .mmd", mermaid_code, file_name=f"{schema}_erdiagram.mmd", mime="text/plain")

html = f"""
<div class="mermaid">
{mermaid_code}
</div>
<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
<script>mermaid.initialize({{ startOnLoad: true, theme: "default" }});</script>
"""
st.components.v1.html(html, height=800, scrolling=True)
