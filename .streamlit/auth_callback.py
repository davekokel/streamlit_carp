# pages/auth_callback.py
from __future__ import annotations

import streamlit as st
import streamlit.components.v1 as components
from auth import get_supabase

st.set_page_config(page_title="Signing you in…", page_icon="🔐")

st.write("🔐 Finishing sign-in…")

# 1) Client-side: if we arrived with a hash fragment (#access_token=...), turn it into query params and reload
components.html(
    """
    <script>
    (function () {
      try {
        var h = window.location.hash;
        if (h && h.indexOf("access_token=") !== -1) {
          var params = new URLSearchParams(h.substring(1));
          var at = params.get("access_token");
          var rt = params.get("refresh_token");
          if (at && rt) {
            var url = new URL(window.location.href);
            url.hash = "";
            url.searchParams.set("access_token", at);
            url.searchParams.set("refresh_token", rt);
            window.location.replace(url.toString());
            return; // stop here; page will reload
          }
        }
      } catch (e) {}
    })();
    </script>
    """,
    height=0,
)

# 2) Server-side: consume query params and establish the session, then bounce to home
q = st.query_params
at = q.get("access_token")
rt = q.get("refresh_token")

if at and rt:
    try:
        sb = get_supabase(anon=True)
        sb.auth.set_session(access_token=at, refresh_token=rt)
        u = sb.auth.get_user().user
        if u:
            st.session_state["sb_session"] = {
                "access_token": at,
                "refresh_token": rt,
            }
            # clean URL and go home
            st.query_params.clear()
            st.success("Signed in! Redirecting…")
            st.experimental_set_query_params()  # no-op, ensures rerun
            st.rerun()  # this will rerun the page without params
    except Exception as e:
        st.error(f"Could not finish sign-in: {e}")
        st.stop()

# If we get here and still no tokens
st.info("No tokens found in the callback URL. If you opened the link in another browser, go back and use the 'Paste link' fallback.")