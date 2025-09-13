#!/usr/bin/env python3
import sys
from pathlib import Path
try:
    import tomllib
except ModuleNotFoundError:
    import tomli as tomllib
p = Path(".streamlit/secrets.toml")
b = p.read_bytes()
cfg = tomllib.loads(b.decode("utf-8"))
url = cfg.get("supabase", {}).get("url", "").strip()
key = cfg.get("supabase", {}).get("anon_key", "").strip()
if not url or not key:
    print("Missing [supabase] url/anon_key in secrets.toml"); sys.exit(2)
txt = b.decode("utf-8")
add = []
if "SUPABASE_URL" not in txt: add.append(f'SUPABASE_URL = "{url}"\n')
if "SUPABASE_ANON_KEY" not in txt: add.append(f'SUPABASE_ANON_KEY = "{key}"\n')
if add:
    with p.open("a", encoding="utf-8") as f: f.write("\n" + "".join(add))
    print("Added flat keys for compatibility")
else:
    print("Flat keys already present")
