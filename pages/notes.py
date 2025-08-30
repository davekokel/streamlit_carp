import streamlit as st
from auth import auth_ui

st.set_page_config(page_title="Notes", page_icon="🗒️")
sb, user = auth_ui()

st.header("🗒️ My Notes")

title = st.text_input("Title")
body = st.text_area("Body")
if st.button("Add note"):
    sb.table("notes").insert({"user_id": user["id"], "title": title, "body": body}).execute()
    st.success("Note added.")

notes = sb.table("notes").select("*").eq("user_id", user["id"]).order("created_at", desc=True).execute().data
for n in notes:
    with st.expander(n["title"]):
        st.write(n["body"])