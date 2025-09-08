import os
import streamlit as st
from sqlalchemy import create_engine, text

db_url = os.environ.get("DATABASE_URL") or st.secrets["database"]["url"]
engine = create_engine(db_url)

schema = st.text_input("Schema", "public")

with engine.begin() as c:
    tables = c.execute(text("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema=:s AND table_type='BASE TABLE'
        ORDER BY table_name
    """), {"s": schema}).scalars().all()

table = st.selectbox("Table", tables) if tables else None

if table:
    with engine.begin() as c:
        cols = c.execute(text("""
            SELECT column_name, data_type, is_nullable, column_default
            FROM information_schema.columns
            WHERE table_schema=:s AND table_name=:t
            ORDER BY ordinal_position
        """), {"s": schema, "t": table}).mappings().all()

        pks = c.execute(text("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu
              ON tc.constraint_name = kcu.constraint_name
             AND tc.table_schema   = kcu.table_schema
            WHERE tc.table_schema=:s
              AND tc.table_name=:t
              AND tc.constraint_type='PRIMARY KEY'
            ORDER BY kcu.ordinal_position
        """), {"s": schema, "t": table}).scalars().all()

        fks = c.execute(text("""
            SELECT
              kcu.column_name   AS child_column,
              ccu.table_name    AS parent_table,
              ccu.column_name   AS parent_column
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu
              ON tc.constraint_name = kcu.constraint_name
             AND tc.table_schema   = kcu.table_schema
            JOIN information_schema.constraint_column_usage ccu
              ON ccu.constraint_name = tc.constraint_name
             AND ccu.table_schema   = tc.table_schema
            WHERE tc.table_schema=:s
              AND tc.table_name=:t
              AND tc.constraint_type='FOREIGN KEY'
            ORDER BY kcu.position_in_unique_constraint
        """), {"s": schema, "t": table}).mappings().all()

    st.subheader("Columns")
    st.dataframe(cols, use_container_width=True)

    st.subheader("Primary key columns")
    st.code(pks or [], language="json")

    st.subheader("Foreign keys")
    st.dataframe(fks, use_container_width=True)

st.divider()

with engine.begin() as c:
    fish_candidates = c.execute(text("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema=:s AND table_type='BASE TABLE' AND table_name ILIKE '%fish%'
        ORDER BY table_name
    """), {"s": schema}).scalars().all()
    mount_candidates = c.execute(text("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema=:s AND table_type='BASE TABLE' AND table_name ILIKE '%mount%'
        ORDER BY table_name
    """), {"s": schema}).scalars().all()

st.subheader("Quick candidates")
st.code({"fish_tables": fish_candidates, "mount_tables": mount_candidates}, language="json")

if table:
    with engine.begin() as c:
        fk_detail = c.execute(text("""
            SELECT
              kcu.column_name   AS child_column,
              ccu.table_name    AS parent_table,
              ccu.column_name   AS parent_column
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu
              ON tc.constraint_name = kcu.constraint_name
             AND tc.table_schema   = kcu.table_schema
            JOIN information_schema.constraint_column_usage ccu
              ON ccu.constraint_name = tc.constraint_name
             AND ccu.table_schema   = tc.table_schema
            WHERE tc.table_schema=:s
              AND tc.table_name=:t
              AND tc.constraint_type='FOREIGN KEY'
        """), {"s": schema, "t": table}).mappings().all()
    st.subheader(f"FKs for {table}")
    st.code([dict(r) for r in fk_detail], language="json")
