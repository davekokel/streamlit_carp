#!/usr/bin/env python3
import sys, json, getpass, urllib.request
try:
    import tomllib; load = tomllib.load
except Exception:
    import tomli as tomllib; load = tomllib.load
with open(".streamlit/secrets.toml","rb") as f:
    s = load(f)
url = s["supabase"]["url"].rstrip("/")
key = s["supabase"]["anon_key"].strip()
email = input("Email: ").strip()
pwd = getpass.getpass("Password: ")
req = urllib.request.Request(
    f"{url}/auth/v1/token?grant_type=password",
    data=json.dumps({"email": email, "password": pwd}).encode(),
    headers={"Content-Type":"application/json","apikey": key,"Authorization": f"Bearer {key}"}
)
try:
    with urllib.request.urlopen(req, timeout=10) as r:
        print("OK", r.status)
        print(json.loads(r.read().decode()).keys())
        sys.exit(0)
except Exception as e:
    print("FAIL", e)
    sys.exit(1)
