---
license: apache-2.0
language:
- en
size_categories:
- 1K<n<10K
task_categories:
- text-classification
- table-question-answering
tags:
- synthetic
- textbook
- ontology
- bfo
- cco
- skos
- column-type-annotation
- data-governance
- reasoning-traces
pretty_name: SDG Ontology-Grounded Synthetic Corpus v0.3
configs:
- config_name: chapters
  data_files: data/chapters.parquet
- config_name: columns
  data_files: data/columns.parquet
- config_name: vocabulary
  data_files: data/vocabulary.parquet
---

# SDG Ontology-Grounded Synthetic Corpus — v0.3 (first cut)

A **verifiable, attribution-clean** synthetic textbook corpus for relational data-governance
metadata, grounded in a BFO 2020 / CCO ontology. Unlike web-retrieval synthetic corpora, every
chapter is generated from **deterministic ontology axioms** (not scraped text), populates a
**deterministic relational schema**, and ships with the **generator's reasoning trace**.

Part of the [Aegir](https://github.com/zndx/aegir) project; the source artifacts live in
[zndx/sdg-corpora](https://github.com/zndx/sdg-corpora).

## Contents

| config / path | rows | description |
|---|---|---|
| `chapters` | 2,235 | textbook chapters — markdown **prose + the model's reasoning trace**, grounded in cited ontology axioms |
| `columns` | 16,516 | a **blind** relational column-classification benchmark — columns carry *values only* (anonymized ids); classify each into the `vocabulary` |
| `vocabulary` | 548 | the **SKOS** column-type label space (BFO/CCO-anchored: 7 upper concepts + 540 template leaves) |
| `ontology/` | 540 templates | the source ontology (7 families) + `sdg-vocab.ttl` |

Headline numbers: **9,230 relational tables · 16,516 columns · 79,746 cells · 5.79M reasoning tokens**, produced for **$34**.

## Why this is different (scale + quality vs the prior release)

| axis | v0.1 (`sdg-bertopic-correspondence`) | **v0.3 (this)** |
|---|---|---|
| units | 1,405 compositions | **2,235 chapters** |
| relational tables | 0 | **9,230** |
| columns / cells | 0 / 0 | **16,516 / 79,746** |
| reasoning tokens | 0 | **5.79M** |
| controlled vocabulary | none | **548-concept SKOS** |
| verifiability | one proxy (R≈0.52) | DDL-valid + 98% structural + flat collapse-trend |

## Quality assurance

- **No collapse.** A deterministic collapse-trend monitor (corpus distinct-n, gzip ratio, TF-IDF
  inter-chapter nearest-neighbour cosine, structure) binned by generation order is **flat across
  the entire run** — the size-controlled mode-collapse signal (intra-bin NN-cosine) holds at 0.5
  end-to-end. **0 near-duplicates**, 2 exact duplicates, 98% valid structured-table emission.
- **Verifiable.** Every column is slot-typed from the ontology; the relational schema validates
  under Trino ∩ Spark. Claims trace to cited Manchester-syntax axioms.

## The column-classification benchmark (`columns`)

A **blind** task: each column carries sampled values plus opaque `table_id`/`column_id` — **no
table names, template ids, or labels**. The label space is the `vocabulary` config (548 SKOS
codes). The per-column ground-truth (column → SKOS code) is **held out** as the benchmark answer
key. Predict a code per column from its values; request scoring against the held-out key.

## Reasoning traces (for RL / distillation)

Every chapter in `chapters` includes `response_reasoning` — the generator's chain-of-thought
(GLM-4.7 / Grok-4.3). 5.79M reasoning tokens total, paired with verifiable, ontology-grounded
outputs.

## Methodology

Ontology retrieval (verbalized Manchester axioms — *the WHAT*) + FinePDFs **style anchors**
(*the HOW*) → weighted GLM-4.7 / Grok-4.3 mix → markdown chapter + populated DDL tables + a
verifiable JSON schema → multi-scorer verification. Architecturally a descendant of
[textbook_quality](https://github.com/VikParuchuri/textbook_quality) (Vik Paruchuri), with web
retrieval **replaced by deterministic ontology retrieval** so every claim is verifier-checkable.

## License

Apache-2.0. The corpus is synthetic and attribution-clean (no scraped source text).
