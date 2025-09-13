import os
from dataclasses import dataclass
import streamlit as st

@dataclass(frozen=True)
class AppConfig:
    supabase_url: str
    supabase_anon_key: str | None
    supabase_service_role_key: str | None
    database_url: str | None

def get_config() -> AppConfig:
    env = st.secrets.get("env", {})
    url = os.getenv("SUPABASE_URL") or env.get("SUPABASE_URL") or "http://127.0.0.1:54321"
    anon = os.getenv("SUPABASE_ANON_KEY") or env.get("SUPABASE_ANON_KEY")
    service = os.getenv("SUPABASE_SERVICE_ROLE_KEY") or env.get("SUPABASE_SERVICE_ROLE_KEY")
    db = os.getenv("DATABASE_URL") or os.getenv("DB_URL") or env.get("DATABASE_URL")
    return AppConfig(url, anon, service, db)

def make_supabase_client():
    from supabase import create_client
    cfg = get_config()
    return create_client(cfg.supabase_url, cfg.supabase_anon_key)

def make_supabase_admin():
    from supabase import create_client
    cfg = get_config()
    if not cfg.supabase_service_role_key:
        raise RuntimeError("Missing SUPABASE_SERVICE_ROLE_KEY")
    return create_client(cfg.supabase_url, cfg.supabase_service_role_key)

def make_engine(echo=False, future=True):
    import sqlalchemy as sa
    cfg = get_config()
    if not cfg.database_url:
        raise RuntimeError("Missing DATABASE_URL/DB_URL")
    return sa.create_engine(cfg.database_url, echo=echo, future=future)
