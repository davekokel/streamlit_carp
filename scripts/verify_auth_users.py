import os
from sqlalchemy import create_engine, text

# Use env var if set; otherwise default to local Supabase DB URL
db_url = os.getenv("DATABASE_URL") or "postgresql://postgres:postgres@127.0.0.1:54322/postgres"

engine = create_engine(db_url, future=True)
with engine.begin() as con:
    n = con.execute(text("select count(*) from auth.users")).scalar()
print({"auth_users_count": int(n)})
