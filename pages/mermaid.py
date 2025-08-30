import streamlit as st
import streamlit.components.v1 as components

st.set_page_config(page_title="Mermaid ERD", layout="wide")
st.title("🐟 Database ER Diagram")

# Put ONLY Mermaid code here (no ```mermaid fences)
mermaid_erd = """
erDiagram

    FISH {
        bigint id PK
        text name
        date date_birth
        text notes
        bigint mother_fish_id FK
        bigint father_fish_id FK
        text line_building_stage
        timestamptz created_at
        text fish_code
    }

    FISH_FEATURE_SUMMARY {
        bigint fish_id FK
        text name
        text transgenes
        text mutations
        text strains
        text treatments
    }

    FISH_MUTATIONS {
        bigint fish_id FK
        bigint mutation_id FK
        timestamptz created_at
    }

    FISH_STRAINS {
        bigint fish_id FK
        bigint strain_id FK
        timestamptz created_at
    }

    FISH_TRANSGENES {
        bigint fish_id FK
        bigint transgene_id FK
        timestamptz created_at
    }

    FISH_TREATMENTS {
        bigint fish_id FK
        bigint treatment_id FK
        timestamptz created_at
    }

    FISH_YEAR_COUNTERS {
        integer year PK
        integer last_val
    }

    MUTATIONS {
        bigint id PK
        text name
        text gene
        text notes
        timestamptz created_at
    }

    STRAINS {
        bigint id PK
        text name
        text notes
        timestamptz created_at
    }

    TRANSGENES {
        bigint id PK
        text name
        bigint plasmid_id FK
        text notes
        timestamptz created_at
    }

    PLASMIDS {
        bigint id PK
        text name
        text description
        timestamptz created_at
    }

    TREATMENTS {
        bigint id PK
        text treatment_type
        text treatment_name
        text notes
        timestamptz created_at
    }

    TANKS {
        bigint id PK
        text name
        bigint fish_id FK
        text location
        text notes
        timestamptz created_at
    }

    %% ---------------- Relations ----------------
    FISH ||--o{ FISH_MUTATIONS : "has"
    FISH ||--o{ FISH_STRAINS : "has"
    FISH ||--o{ FISH_TRANSGENES : "has"
    FISH ||--o{ FISH_TREATMENTS : "receives"
    FISH ||--o{ TANKS : "kept in"

    FISH_MUTATIONS }o--|| MUTATIONS : "mutation"
    FISH_STRAINS }o--|| STRAINS : "strain"
    FISH_TRANSGENES }o--|| TRANSGENES : "transgene"
    FISH_TREATMENTS }o--|| TREATMENTS : "treatment"
    TRANSGENES }o--|| PLASMIDS : "plasmid"

    FISH ||--o{ FISH_FEATURE_SUMMARY : "summary"
"""

html = f"""
<div class="mermaid">
{mermaid_erd}
</div>
<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
<script>
  mermaid.initialize({{ startOnLoad: true, securityLevel: "loose" }});
</script>
"""

components.html(html, height=900, scrolling=True)
