# sdg-corpora — standalone commands (no external repos required).
#
#   just check    — verify the standalone invariants (imports resolvable, no
#                   machine-local paths, artifacts parse where rdflib is available)
#   just protege  — how to load the ontology in Protégé

default:
    @just --list

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
