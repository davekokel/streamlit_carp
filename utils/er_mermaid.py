from sqlalchemy import text

def generate_mermaid_er(engine, schema: str = "public") -> str:
    with engine.begin() as c:
        cols = c.execute(text("""
            SELECT table_name, column_name, data_type
            FROM information_schema.columns
            WHERE table_schema = :schema
            ORDER BY table_name, ordinal_position
        """), {"schema": schema}).fetchall()

        pks = c.execute(text("""
            SELECT tc.table_name, kcu.column_name
            FROM information_schema.table_constraints AS tc
            JOIN information_schema.key_column_usage AS kcu
              ON tc.constraint_name = kcu.constraint_name
             AND tc.table_schema   = kcu.table_schema
            WHERE tc.constraint_type='PRIMARY KEY'
              AND tc.table_schema=:schema
        """), {"schema": schema}).fetchall()

        fks = c.execute(text("""
            SELECT
              tc.table_name AS child_table,
              kcu.column_name AS child_column,
              ccu.table_name AS parent_table,
              ccu.column_name AS parent_column
            FROM information_schema.table_constraints AS tc
            JOIN information_schema.key_column_usage AS kcu
              ON tc.constraint_name = kcu.constraint_name
             AND tc.table_schema   = kcu.table_schema
            JOIN information_schema.constraint_column_usage AS ccu
              ON ccu.constraint_name = tc.constraint_name
             AND ccu.table_schema   = tc.table_schema
            WHERE tc.constraint_type='FOREIGN KEY'
              AND tc.table_schema=:schema
        """), {"schema": schema}).fetchall()

    pk_set = {(t, c) for t, c in pks}
    tables = {}
    for t, c, dt in cols:
        dt_clean = str(dt).replace(" ", "_").replace("(", "_").replace(")", "_")
        tables.setdefault(t, []).append((c, dt_clean, (t, c) in pk_set))

    lines = ["erDiagram"]
    for t in sorted(tables):
        lines.append(f"  {t} {{")
        for col, dt, is_pk in tables[t]:
            suffix = " PK" if is_pk else ""
            lines.append(f"    {dt} {col}{suffix}")
        lines.append("  }")

    for child, child_col, parent, parent_col in sorted(fks):
        lines.append(f"  {parent} ||--o{{ {child} : {child_col}")

    return "\n".join(lines)
