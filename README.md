# sdg-corpora — Signals Data Governance corpora

Independently-versioned home for the ontology-grounded SDG corpora. **Each commit is a
reproducible convergence snapshot** of the whole derivation chain — ontology → SKOS vocabulary
→ DDL footprint → corpus. Consumed via git submodule by **aegir** (train/eval), **atelier**
(independent classification), and **signals** (governance).

## Layout
| dir | what | role |
|-----|------|------|
| `ontology/`   | 540-template catalog (7 families), `sdg-vocab.ttl`, `family_complex.json` | the source |
| `vocabulary/` | `annotations.{csv,parquet}` (Atelier ReferenceCategory) + `vocabulary.ttl` (SKOS) | the shared type-system key, **derived** from the ontology |
| `ddl/`        | deterministic relational footprint (CREATE TABLEs + cross-family FKs) | the schema |
| `corpus/`     | generated textbook documents + populated relational tables (views on the footprint) | the data *(added by generation runs)* |

## The SKOS vocabulary (`vocabulary/`)
**548 concepts**: 7 BFO/CCO upper anchors (`bfo:Process`, `cco:Artifact`, `cco:*ICE`, …) + 540
template leaves — hierarchical (`code` / `notation` / `label` / `abbrev` / `parent_code` /
`description`). It is *grounded*: the codes **are** the ontology (`bfo_anchor_path` → hierarchy;
template → leaf). Regenerate via `aegir/scripts/build_skos_vocab.py`.

## Releases (for Atelier's git data source)
A tagged release packages `vocabulary/annotations.parquet` + `ontology/` + the populated DDL
tables — **without** the per-column reference codes. Atelier pins the release and classifies
columns into the SKOS vocabulary **blind** (values + vocab only); the reference (column→code,
deterministic from the spine) is held back as the scoring key → independent, pre-training
efficacy feedback on the corpus, and a clean measure of Aegir's downstream lift over it.

## Loading the ontology in Protégé

This repository is **standalone**: a fresh clone loads with nothing but its own files.

1. **File → Open → `ontology/sdg-ontology-comprehensive.owl`** — the comprehensive
   release: the catalog *and* the entity generations, with armed `rdfs:domain`/`range`
   semantics and BFO/CCO grounding — the certified union (HermiT-verified; see
   `ontology/HERMIT_CERTIFICATE.md` and `ontology/grounding_certificate.json`).
   Open `ontology/sdg-ontology.owl` instead for the catalog-scope ontology only.
   Manchester-syntax twins (`.omn`) sit beside both.
2. **Imports resolve locally.** Protégé reads `ontology/catalog-v001.xml` and maps the
   BFO + π(CCO) import IRI to `ontology/imports/cco-module.ttl`. No network access, no
   other repositories.
3. **Reasoning.** HermiT ships with Protégé; the certificates above record the verdicts
   this release was published under.

`just check` verifies the standalone invariants (imports resolvable, no machine-local
paths, artifacts parse); `just protege` prints these instructions. Both are optional —
the steps above need only Protégé itself.
