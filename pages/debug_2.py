import streamlit as st
from lib.config import make_supabase_client

st.title("_debug_data")

sb = make_supabase_client()
st.write({
    "has_access": "sb_access_token" in st.session_state,
    "has_refresh": "sb_refresh_token" in st.session_state,
    "has_user": "sb_user" in st.session_state,
    "sb_user": st.session_state.get("sb_user"),
})

# Try a real table you expect to see on fish pages:
TABLE = "fish"  # change to the actual table name used on that page
try:
    res = sb.table(TABLE).select("*").limit(5).execute()
    st.write(f"Rows from {TABLE}:", res.data)
    st.write("Row count:", len(res.data or []))
except Exception as e:
    st.error(f"Query error: {e}")

    import streamlit as st
from lib.config import make_supabase_client, make_supabase_admin

st.title("RLS vs Data check")

TABLES = ["fish", "plasmids","rna"]  # <-- edit these to match your app

sb = make_supabase_client()      # authed client (RLS applies)
admin = make_supabase_admin()    # service role (bypasses RLS)

rows = {}
for t in TABLES:
    try:
        authed = sb.table(t).select("*", count="exact").limit(5).execute()
        adminv = admin.table(t).select("*", count="exact").limit(5).execute()
        rows[t] = {
            "authed_count": authed.count,
            "admin_count": adminv.count,
            "authed_sample": authed.data,
            "admin_sample": adminv.data,
        }
    except Exception as e:
        rows[t] = {"error": str(e)}

st.json(rows)

