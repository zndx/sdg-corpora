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
- membrane-gated
- dual-register
pretty_name: SDG Ontology-Grounded Synthetic Corpus v0.4
configs:
- config_name: chapters
  data_files: data/chapters.parquet
- config_name: vocabulary
  data_files: data/vocabulary.parquet
---

# SDG Ontology-Grounded Synthetic Corpus — v0.4 (membrane-gated refinement)

A **verifiable, attribution-clean** synthetic textbook corpus for relational data-governance
metadata, grounded in a BFO 2020 / CCO ontology. Every chapter is generated from **deterministic
ontology axioms** (not scraped text), populates a **deterministic, referentially-intact relational
schema**, and is produced under an **iterative membrane-gated refinement loop** — an agent proposes,
deterministic reasoners (HermiT value-admissibility, referential integrity, prose-entailment) dispose.

Part of the [Aegir](https://github.com/zndx/aegir) project; source artifacts live in
[zndx/sdg-corpora](https://github.com/zndx/sdg-corpora).

## What changed since v0.3

v0.3 was a single-shot generation; an adversarial audit found it structurally sound but
semantically thin (concept-salad assembly, ~9% placeholder cells, and value contamination the
model would then *rationalize*). **v0.4 replaces single-shot generation with a membrane-gated
refinement loop** and re-grounds the ontology in the inputs:

| axis | v0.3 | **v0.4** |
|---|---|---|
| generation | single-shot | **membrane-gated refinement** (propose → HermiT/RI/prose gates → commit) |
| placeholder cells | ~9% | **0.1%** |
| relational tables | appended / often absent | **woven RI-true tables** in the prose |
| registers | one | **two** (natural ⊕ semantic) over the same schema |
| value contamination | rationalized | **rejected** by a value-level HermiT gate |
| ontology | 540 templates | **623** (540 + **83 FinePDFs-derived**, each HermiT- and input-alignment-gated) |
| provenance | model/ablation tags | **full per-proposal agent lineage** (prompt + reasoning + model) |

## Contents

| config / path | rows | description |
|---|---|---|
| `chapters` | 1,977 × 2 registers = **3,954** | textbook chapters — markdown prose + woven RI-true tables, in *natural* and *semantic* registers |
| _columns benchmark_ | embedded | the **4,116 RI-true relational tables are woven into each chapter's markdown**; a standalone blind column-classification parquet is being rebuilt for the refinement-loop surfaces (the v0.3 single-shot extractor read a JSON block this format no longer emits) |
| `vocabulary` | **623** template leaves (+ BFO/CCO upper anchors) | the **SKOS** column-type label space |
| `ontology/` (templates) | **623 templates** (8 families) | the generative source ontology (Manchester templates) + `sdg-vocab.ttl` |
| `ontology/sdg-ontology.{omn,owl}` | **227 classes** | the **realized, HermiT-validated** domain ontology — the FinePDFs-derived templates instantiated into concrete OWL axioms, **consistent** under BFO 2020 (continuant ⊥ occurrent) + CCO. Load it and re-run the reasoner; `HERMIT_CERTIFICATE.md` records the verdict. |

Headline: **1,977 chapters · 4,116 relational tables · 11.3M corpus tokens**, generated on local
(solar-powered) GPUs. Membrane pass rate on the production run: **98.8%**.

## Quality — measured, and honestly scoped

**Measured (structural / proxy):**
- placeholder-cell rate **0.001**; prose↔data entailment mean **0.581** (gate ≥ 0.30); 98.8%
  of proposals pass the full HermiT/RI/prose membrane.
- every column is slot-typed from the ontology; the relational schema is referentially intact and
  DDL-valid; claims trace to cited Manchester-syntax axioms.
- the **realized ontology** (227 classes from the derived templates) is **HermiT-consistent, 0
  unsatisfiable**, and ships as a loadable `sdg-ontology.owl` — so the BFO/CCO grounding is *checkable*
  by the consumer, not merely asserted.

**Not yet established (stated plainly):**
- **Downstream utility is unvalidated.** These are *proxy* quality gains. Whether the corpus lifts
  downstream model training over a non-grounded control has not yet been measured; that
  generalization experiment is queued, not done. Treat v0.4 as a quality-improved *research*
  corpus, not a proven training-data win.
- **Input-concept coverage is partial.** The ontology is the bridge from the FinePDFs inputs to the
  output; the corpus is still dominated by abstract upper-ontology templates, so its genuine
  *FinePDFs-concept* content is partial even though its structure is strong. The 83 input-derived
  templates (and their alignment gate) are the first step at closing this.

## The column-classification benchmark (`columns`)

A **blind** task: each column carries sampled values plus opaque `table_id`/`column_id` — no table
names, template ids, or labels. The label space is `vocabulary` (the SKOS codes). Per-column
ground-truth (column → SKOS code) is **held out** as the answer key. Predict a code per column from
its values; request scoring against the held-out key.

## Reasoning / agent traces

Every refined chapter is produced through a captured agent exchange — the proposer's prompt,
chain-of-thought, and generating model are recorded as first-class lineage (suitable for RL /
distillation). The membrane's gate verdicts are recorded alongside each accepted artifact.

## Methodology

Ontology retrieval (verbalized Manchester axioms — *the WHAT*) → an agent proposer (local Qwen /
Grok) drafts prose + RI-true relational tables → a **deterministic membrane** (value-level HermiT,
referential-integrity, prose-entailment) accepts only admissible artifacts → dual-register commit.
A descendant of [textbook_quality](https://github.com/VikParuchuri/textbook_quality), with web
retrieval replaced by deterministic ontology retrieval and single-shot generation replaced by the
membrane-gated loop.

## License

Apache-2.0. The corpus is synthetic and attribution-clean (no scraped source text).
