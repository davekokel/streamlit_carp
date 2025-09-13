#!/usr/bin/env python3
import sys, urllib.request
try:
    import tomllib; load_toml = tomllib.load
except Exception:
    import tomli; load_toml = tomli.load
with open(".streamlit/secrets.toml","rb") as f:
    cfg = load_toml(f)
url = cfg["supabase"]["url"].rstrip("/")
key = cfg["supabase"]["anon_key"].strip()
if not url or not key:
    print("Secrets missing"); sys.exit(2)
req = urllib.request.Request(f"{url}/auth/v1/settings", headers={"apikey": key, "Authorization": f"Bearer {key}"})
try:
    with urllib.request.urlopen(req, timeout=5) as r:
        print("Auth OK", r.status)
except Exception as e:
    print("Auth check failed", e); sys.exit(3)
