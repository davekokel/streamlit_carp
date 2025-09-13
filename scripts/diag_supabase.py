#!/usr/bin/env python3
import sys, urllib.request, socket, json, base64
from urllib.parse import urlparse
try:
    import tomllib; load_toml = tomllib.load
except Exception:
    import tomli as tomllib; load_toml = tomllib.load

with open(".streamlit/secrets.toml","rb") as f:
    cfg = load_toml(f)

url = cfg["supabase"]["url"].strip().rstrip("/")
key = cfg["supabase"]["anon_key"].strip()

print("URL:", url)
print("Key length:", len(key))
if not url or not key:
    print("Missing url or key"); sys.exit(2)

u = urlparse(url)
host = u.hostname
print("Host:", host)

try:
    socket.getaddrinfo(host, 443)
    print("DNS OK")
except Exception as e:
    print("DNS fail:", e); sys.exit(3)

def b64url_json(s):
    s += "=" * (-len(s) % 4)
    return json.loads(base64.urlsafe_b64decode(s.encode()).decode("utf-8"))

role, iss = "?", "?"
try:
    h,p,_ = key.split(".",2)
    H = b64url_json(h)
    P = b64url_json(p)
    role = P.get("role")
    iss = P.get("iss")
    print("JWT alg:", H.get("alg"))
    print("JWT role:", role)
    print("JWT iss:", iss)
except Exception as e:
    print("JWT parse error:", e)

req = urllib.request.Request(f"{url}/auth/v1/settings",
    headers={"apikey": key, "Authorization": f"Bearer {key}"})
try:
    with urllib.request.urlopen(req, timeout=5) as r:
        print("Auth HTTP:", r.status)
        print("Body preview:", r.read(120).decode("utf-8","ignore"))
except Exception as e:
    print("Auth request error:", e); sys.exit(4)

if iss:
    ihost = urlparse(iss).hostname or ""
    if ihost and ihost != host:
        print("Issuer/URL host mismatch:", ihost, "!=", host); sys.exit(5)

if role != "anon":
    print("Key role is not 'anon':", role); sys.exit(6)

print("Diagnostics OK")
