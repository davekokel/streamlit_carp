import streamlit as st
from supabase import create_client
supabase = create_client(st.secrets["SUPABASE_URL"], st.secrets["SUPABASE_ANON_KEY"])
st.title("Login Test")
email = st.text_input("Email")
password = st.text_input("Password", type="password")
if st.button("Sign in"):
    try:
        res = supabase.auth.sign_in_with_password({"email": email, "password": password})
        st.success("Logged in")
        st.write((res.session.access_token[:20] + "...") if res.session else "No session")
    except Exception as e:
        st.error(f"Login failed: {e}")
