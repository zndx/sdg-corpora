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
