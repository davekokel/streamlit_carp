# pages/notes.py
from __future__ import annotations

import streamlit as st
from auth import auth_ui

st.set_page_config(page_title="Notes", page_icon="🗒️")
sb, user = auth_ui()  # blocks until signed in

st.header("🗒️ My Notes")
st.caption(f"Signed in as **{user['email']}**")

# --- Create note ---
with st.form("new_note", clear_on_submit=True):
    title = st.text_input("Title", placeholder="e.g., Tank checks for next week")
    body = st.text_area("Body", placeholder="Write your note…")
    submitted = st.form_submit_button("Add note", type="primary")
    if submitted:
        if not (title or "").strip():
            st.error("Please enter a title.")
        else:
            try:
                payload = {"user_id": user["id"], "title": title.strip(), "body": (body or "").strip()}
                sb.table("notes").insert(payload).execute()
                st.success("Note added.")
                st.rerun()
            except Exception as e:
                st.error(f"Could not add note: {e}")

st.divider()

# --- List notes (RLS should limit to this user) ---
try:
    q = sb.table("notes").select("*").eq("user_id", user["id"])
    # Prefer created_at desc if column exists; if not, omit order
    try:
        notes = q.order("created_at", desc=True).execute().data or []
    except Exception:
        notes = q.execute().data or []
except Exception as e:
    st.error(f"Could not load notes: {e}")
    notes = []

if not notes:
    st.info("No notes yet — add your first one above.")
else:
    for n in notes:
        title = n.get("title") or "(untitled)"
        body = n.get("body") or ""
        with st.expander(title, expanded=False):
            st.write(body)