#!/usr/bin/env python3
import os, json, sys, urllib.request, urllib.parse
env = os.path.expanduser("~/.config/streamlit_carp/admin.env")
if not os.path.exists(env):
    print("admin.env missing"); sys.exit(2)
for line in open(env):
    line=line.strip()
    if not line or line.startswith("#") or "=" not in line: continue
    k,v=line.split("=",1)
    v=v.strip()
    if v.startswith('"') and v.endswith('"'): v=v[1:-1]
    os.environ[k.strip()]=v
base=os.environ["SUPABASE_URL"].rstrip("/")
key=os.environ["SERVICE_ROLE_KEY"]
email=os.environ.get("EMAIL","").strip()
pwd=os.environ.get("NEW_PASSWORD","").strip()
if not email or not pwd:
    print("set EMAIL and NEW_PASSWORD env vars"); sys.exit(2)
hdr={'apikey':key,'Authorization':f'Bearer {key}','Content-Type':'application/json'}
def call(path, method='GET', body=None):
    req=urllib.request.Request(f"{base}{path}", method=method, headers=hdr,
                               data=(json.dumps(body).encode() if body else None))
    return urllib.request.urlopen(req, timeout=15)
try:
    q=f"/auth/v1/admin/users?email={urllib.parse.quote(email)}"
    users=json.load(call(q))
    if users:
        uid=users[0]['id']
        call(f"/auth/v1/admin/users/{uid}", 'PATCH', {'password':pwd})
    else:
        call("/auth/v1/admin/users", 'POST', {'email':email,'password':pwd,'email_confirm':True})
    print("OK")
except Exception as e:
    print("FAIL", e); sys.exit(1)
