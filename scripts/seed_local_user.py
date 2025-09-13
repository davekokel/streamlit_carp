from pathlib import Path
import sys, os, tomllib
from supabase import create_client

root = Path(__file__).resolve().parents[1]
secrets_path = root / ".streamlit" / "secrets.toml"

# ✅ Read TOML via file handle (binary) — avoids the bytes/str mismatch
secrets = {}
if secrets_path.exists():
    with open(secrets_path, "rb") as f:
        secrets = tomllib.load(f).get("env", {})

SUPABASE_URL = secrets.get("SUPABASE_URL") or os.getenv("SUPABASE_URL") or "http://127.0.0.1:54321"
ANON = secrets.get("SUPABASE_ANON_KEY") or os.getenv("SUPABASE_ANON_KEY")
SERVICE = secrets.get("SUPABASE_SERVICE_ROLE_KEY") or os.getenv("SUPABASE_SERVICE_ROLE_KEY")


if not SERVICE:
    raise SystemExit("Missing SUPABASE_SERVICE_ROLE_KEY (in .streamlit/secrets.toml [env] or env var).")
if not ANON:
    raise SystemExit("Missing SUPABASE_ANON_KEY (in .streamlit/secrets.toml [env] or env var).")
if len(sys.argv) < 3:
    raise SystemExit("Usage: python scripts/seed_local_user.py <email> <password>")

email, password = sys.argv[1], sys.argv[2]

admin = create_client(SUPABASE_URL, SERVICE)
client = create_client(SUPABASE_URL, ANON)

# Create; if it exists, reset password & ensure confirmed
try:
    admin.auth.admin.create_user({"email": email, "password": password, "email_confirm": True})
except Exception:
    users = admin.auth.admin.list_users(page=1, per_page=200)
    uid = next((u.id for u in users.users if (u.email or "").lower() == email.lower()), None)
    if not uid:
        raise
    admin.auth.admin.update_user_by_id(uid, {"password": password, "email_confirm": True})

# Verify sign-in with anon client
res = client.auth.sign_in_with_password({"email": email, "password": password})
print({"seeded_user": res.user.email})
