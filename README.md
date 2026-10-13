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
| `corpus/tagging/` | `answer_key.{csv,parquet}` — one row per published column | the CTA/SKOS answer key for downstream training and scoring |

## The SKOS vocabulary (`vocabulary/`)
**548 concepts**: 7 BFO/CCO upper anchors (`bfo:Process`, `cco:Artifact`, `cco:*ICE`, …) + 540
template leaves — hierarchical (`code` / `notation` / `label` / `abbrev` / `parent_code` /
`description`). It is *grounded*: the codes **are** the ontology (`bfo_anchor_path` → hierarchy;
template → leaf). Regenerate via `aegir/scripts/build_skos_vocab.py`.

## Column answer key (`corpus/tagging/`)
`answer_key.csv` (and the parquet twin) is the relational CTA/SKOS ground truth for
every published collection table. Join on `collection`, `table`, `column`.

| column | meaning |
|---|---|
| `role` | `sdg:SurrogateIdentifierColumn`, `sdg:ForeignKeyColumn`, `sdg:AttributeColumn`, or `sdg:AuditTimestampColumn` |
| `concept` | the generator's recorded concept for the column |
| `reference_code` | a code in `vocabulary/annotations.csv`, or empty |
| `ref_basis` | how the code was obtained: `leaf`, `entity-leaf`, `fk-target`, `genus-anchor`, `genus-name`, or `unresolved` |

A code is written only when a recorded link already names a vocabulary concept:
the column concept for an attribute, or the designated entity (its class, else its
BFO/CCO genus anchor) for an identifier or foreign key. Unresolved rows keep the
concept, the structural role, the entity, and the genus — they do not receive an
invented code. `summary.json` counts the basis mix. Regenerate from the matching
construct run with `just emit-column-answer-key` in aegir.

A **blind** classification run must not read this directory. Downstream training
and scoring should. The separate opaque-id DDL release
(`aegir/scripts/build_atelier_release.py`) still keeps its own `reference.parquet`
beside that blind surface; this key is the collection-keyed one.

## Loading the relational corpus into PostgreSQL

The parquet files under `ddl/<run>/` remain the dataset of record; `ddl/<run>/sql/`
is the directly-loadable projection, **one database flavor per directory**:

| flavor | schema source |
|---|---|
| `sql/postgres/` | assembled from the recorded column specs, types mapped by polyglot_sql |
| `sql/trino/`    | the native `ddl_text` |
| `sql/spark/`    | the Iceberg flavor (`ddl_iceberg`) |

Each directory is self-contained — load the files in numeric order:

```sh
just load-postgres                                     # psql defaults ($PGHOST, $PGPORT, …)
just load-postgres "postgresql://user@host:5432/mydb"  # explicit connection
```

Every table carries its template/BFO provenance in-database as a table comment
(`SELECT obj_description('<table>'::regclass);`), and the ontology↔table associations
ship beside the SQL in `ddl/<run>/ontology_entity_associations.json` — a loaded
database remains fully tag-able back to the ontology.

## The comprehensive lowering (`ddl-comprehensive/`)

Where `ddl/` is the 520-table catalog spine WITH row data and views, `ddl-comprehensive/`
is kvasir's deterministic schema over the ENTIRE certified union — every entity class,
junction, and closed vocabulary the ontology carries (~5k relations, schema-only), each
with its ontological source in `ontology_entity_associations.json` and its election
citation in `plan.json`. FK constraints ship as a post-CREATE pass, so one command loads
it anywhere:

```sh
just load-comprehensive "postgresql://user@host:5432/mydb"
```

Shipped only under a green HermiT certificate (`certificate.json` records the verdict).

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
