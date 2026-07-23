# sdg-corpora — standalone commands (no external repos required).
#
#   just check          — verify the standalone invariants (imports resolvable, no
#                         machine-local paths, artifacts parse where rdflib is available)
#   just protege        — how to load the ontology in Protégé
#   just load-postgres  — load the generated schema + data + views into PostgreSQL

default:
    @just --list

# Load the released relational corpus into PostgreSQL. The parquet files remain the
# dataset of record; ddl/<run>/sql/ is the directly-loadable projection, one flavor
# per directory (postgres/, trino/, spark/). Each table ships its template/BFO
# provenance as COMMENT ON TABLE (query: obj_description('<table>'::regclass));
# ontology↔table associations: ddl/<run>/ontology_entity_associations.json.
#   just load-postgres                                    # psql defaults ($PGHOST …)
#   just load-postgres "postgresql://user@host:5432/db"   # explicit connection
load-postgres conn="":
    #!/usr/bin/env bash
    set -euo pipefail
    sqldir=$(ls -d ddl/*/sql/postgres 2>/dev/null | head -1)
    [ -n "$sqldir" ] || { echo "no ddl/<run>/sql/postgres bundle in this checkout"; exit 1; }
    conn="{{conn}}"
    run_psql() { if [ -n "$conn" ]; then psql "$conn" "$@"; else psql "$@"; fi; }
    echo "loading $sqldir (schema → data → views)…"
    run_psql -v ON_ERROR_STOP=1 -q \
        -f "$sqldir/00_schema.sql" -f "$sqldir/01_data.sql" -f "$sqldir/02_views.sql"
    run_psql -tAc "SELECT 'loaded: '||(SELECT count(*) FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE')||' tables, '||(SELECT count(*) FROM information_schema.views WHERE table_schema='public')||' views'"

# Load the COMPREHENSIVE lowering (schema-only: the certified-union kvasir DDL over the
# full ontology — ~5k tables with FK constraints as a post-CREATE pass). Every table's
# ontological source is in ddl-comprehensive/<run>/ontology_entity_associations.json.
#   just load-comprehensive "postgresql://user@host:5432/db"
load-comprehensive conn="":
    #!/usr/bin/env bash
    set -euo pipefail
    f=$(ls ddl-comprehensive/*/ddl.sql 2>/dev/null | head -1)
    [ -n "$f" ] || { echo "no ddl-comprehensive/<run>/ddl.sql in this checkout"; exit 1; }
    conn="{{conn}}"
    run_psql() { if [ -n "$conn" ]; then psql "$conn" "$@"; else psql "$@"; fi; }
    echo "loading $f (schema-only)…"
    run_psql -v ON_ERROR_STOP=1 -q -f "$f"
    run_psql -tAc "SELECT 'loaded: '||count(*)||' tables' FROM information_schema.tables WHERE table_schema='public'"

# The standalone contract: a fresh clone must load with nothing but this repo.
check:
    #!/usr/bin/env bash
    set -euo pipefail
    ok=1
    [ -f ontology/catalog-v001.xml ] && echo "✓ ontology/catalog-v001.xml (import resolution)" \
        || { echo "✗ ontology/catalog-v001.xml MISSING"; ok=0; }
    [ -f ontology/imports/cco-module.ttl ] && echo "✓ ontology/imports/cco-module.ttl (BFO + π(CCO) theory)" \
        || { echo "✗ ontology/imports/cco-module.ttl MISSING"; ok=0; }
    if grep -l 'file:/' ontology/sdg-ontology*.omn ontology/sdg-ontology*.owl 2>/dev/null; then
        echo "✗ machine-local file: imports remain (not standalone)"; ok=0
    else
        echo "✓ no machine-local imports in shipped ontologies"
    fi
    for f in ontology/sdg-ontology.owl ontology/sdg-ontology-comprehensive.owl; do
        [ -f "$f" ] && echo "✓ $f present" || echo "· $f absent (optional)"
    done
    if command -v python3 >/dev/null && python3 -c "import rdflib" 2>/dev/null; then
        for f in ontology/sdg-ontology.owl ontology/sdg-ontology-comprehensive.owl; do
            [ -f "$f" ] || continue
            python3 -c "import sys, rdflib; g = rdflib.Graph(); g.parse(sys.argv[1]); print('✓', sys.argv[1], 'parses (', len(g), 'triples)')" "$f"
        done
    else
        echo "· rdflib unavailable — parse check skipped (file checks only)"
    fi
    [ "$ok" = "1" ] && echo "STANDALONE: OK" || { echo "STANDALONE: FAILED"; exit 1; }

# Loading the release in Protégé.
protege:
    @echo "Protégé (any recent version):"
    @echo "  1. File → Open → ontology/sdg-ontology-comprehensive.owl"
    @echo "     (the COMPREHENSIVE release: catalog + entity generations + armed"
    @echo "      rdfs:domains + grounding — the certified union; HermiT-verified)"
    @echo "     — or ontology/sdg-ontology.owl for the catalog-scope ontology only."
    @echo "  2. The BFO + π(CCO) import resolves automatically: Protégé reads"
    @echo "     ontology/catalog-v001.xml and maps the import IRI to"
    @echo "     ontology/imports/cco-module.ttl. No network, no other repos."
    @echo "  3. Reasoning: HermiT (bundled with Protégé). The shipped verdicts are in"
    @echo "     ontology/HERMIT_CERTIFICATE.md and ontology/grounding_certificate.json."
