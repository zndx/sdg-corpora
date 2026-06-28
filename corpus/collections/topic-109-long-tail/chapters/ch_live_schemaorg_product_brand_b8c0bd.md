---
chapter_id: ch_live_schemaorg_product_brand_b8c0bd
topic_id: 109
family: 07_long_tail
cited_terms: ['schemaorg_product_brand', 'belief_interval_only_unit_range', 'lineage_governed_by_directive']
model: engine-refine
---

Identifiers constitute the stable, machine-addressable spine upon which governed reference data and operational facts are joined across analytical and compliance boundaries. A surrogate key such as `BRAN-0001` or `RANG-0001` is not merely a row label but a durable contract: it permits a brand dimension record, a belief-interval entity, and every typed value assertion that references that entity to remain correlatable even when human-readable labels change, when schema versions advance, or when lineage directives are reissued under a different locale. The identifier therefore anchors provenance and reconciliation; without it, a throughput projection recorded at `2025-06-14T16:53:04` could not be unambiguously attributed to the same `RANG-0001` interval whose lower bound is expressed as a `95 pct threshold`, nor could a fact row carrying `size_bytes` of `895265030` be tied to the correct brand metadata when the foreign `brand_key` (`BRAN-0003`) does not equal the fact's own `id` (`BRAN-0001`)—a deliberate pattern that separates the identity of a published artifact from the brand identity under which it is catalogued.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

Brand and category supply the organizational semantics that identifiers alone cannot convey. Brand functions as a governed classification key linking quantitative facts to descriptive dimensions: `Brand Label 03` under `Brand Category 03` situates a corpus entry within a controlled taxonomy, while the fact layer records material properties—byte extent and revision—that matter for retention policy, reproducibility, and audit sampling. A `size_bytes` value of `338701831` paired with `version` `4` signals a specific immutable snapshot generation, distinct from a sibling artifact at `version` `8` occupying `998785819` bytes; compliance officers treat such pairs as evidentiary fingerprints when demonstrating that downstream models or reports consumed an approved revision rather than an ad hoc export. Category, in turn, constrains interpretive scope: two brands may share superficial naming conventions yet diverge in regulatory treatment because their category assignment places them under different disclosure or validation regimes.

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

Entity and attribute model the fine-grained assertion layer characteristic of interval-belief and interval-range governance, where a single logical record decomposes into a core entity (`RANG-0002` as throughput projection) and a constellation of named properties (`confidence`, `dimension_kind`, `method`, `recorded_at`) each governed by an explicit `attr_type`. Typing—`xsd:decimal` for numeric confidence (`0.788`), `xsd:string` for methodological or dimensional literals (`Dimension Kind 01`, `fr`), `xsd:dateTime` for temporal stamps—prevents silent coercion that would invalidate statistical guarantees or corrupt locale-sensitive text. The attribute registry (`attr_id` `RANG-0001` through `RANG-0010` in the value stores) decouples schema evolution from entity identity: new measurable facets can be introduced without re-keying the entity, while validators enforce that only values conforming to the declared type may populate the corresponding physical store (`val_decimal`, `val_varchar`, `val_datetime`). Entity multiplicity is visible in practice when one `RANG-0001` entity carries several distinct attributes—decimal measurements (`0.727`, `281.42`, `343.70`), a varchar dimension label, encoding designation, change rationale, and language tag—each stored under its own attribute binding yet reunifiable through shared `entity_id`.

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | 95 pct threshold |
| RANG-0002 | throughput projection | 0.84 confidence floor |
| RANG-0003 | packet loss guarantee | 0.82 probability threshold |
| RANG-0004 | noise floor estimate | 0.89 certainty bound |
| RANG-0005 | thermal drift assertion | 0.82 probability threshold |
| RANG-0006 | packet loss guarantee | 0.87 reliability floor |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

The misc designation captures values that resist reduction to a single semantic column yet remain indispensable for operational meaning: human-facing brand labels, free-text belief lower-bound phrasings (`0.84 confidence floor`, `0.89 certainty bound`), and auxiliary literals such as `change rationale` or `Encoding 02`. Misc is not an excuse for untyped chaos; rather, it marks fields whose interpretation depends on companion metadata—attribute name, entity context, or governing directive—rather than on intrinsic datatype alone. In belief-interval practice, the misc layer often carries the natural-language or semi-structured articulation of a guarantee that numeric stores later instantiate or corroborate, which is why auditors read misc strings alongside typed values: the phrase `packet loss guarantee` paired with bound `0.82 probability threshold` and decimal readings on the same entity establishes a coherent compliance narrative that neither column in isolation would fully support.

Unit and language extend governance from what was measured to how and for whom it must be read. Unit (`ms`, `m/s`, `count`) attaches dimensional discipline to lineage artifacts—`Model Training Registry` timed in milliseconds, `Sensor Telemetry Stream` enumerated as discrete counts, `Patient Cohort Dataset` velocities in metres per second—so that aggregation, thresholding, and cross-dataset joins do not commingle incompatible quantities. Language (`ja`, `de`, `en`) governs the linguistic jurisdiction of directives and, by extension, the locale assumptions under which labels, rationales, and lower-bound wordings remain authoritative; duplicate lineage entries for the same dataset under `en` may reflect parallel policy text rather than duplicate data, while a Japanese (`ja`) directive signals that downstream presentation and informed-consent language must align with that locale's regulatory corpus. Together, unit and language operationalize the principle that measurement integrity and communicative integrity are co-equal compliance requirements.

Version and byte extent close the loop between semantic governance and physical accountability. Version increments (`3`, `5`, `4`, `8` across brand-associated facts) timestamp the logical evolution of a published schema.org-aligned artifact independently of the calendar dates embedded in belief attributes (`2023-08-16T07:36:41`, `2025-03-17T08:26:16`), allowing policies that mandate "use the version current as of fiscal close" to be enforced without conflating content revision with observation time. Size in bytes furnishes a coarse integrity check and capacity-planning signal: orders-of-magnitude separation between `114301972` and `895265030` flags heterogeneous corpora that may warrant differential backup tiers, encryption standards, or sampling intensity in audit workflows. In mature practice, identifier-linked joins across brand, entity, attribute, unit, and version dimensions yield a defensible evidentiary chain—from governed directive through typed assertion to versioned, byte-measured publication—satisfying the dual demand that compliance systems both explain what is claimed and demonstrate, with concrete values, how that claim is stored, typed, localized, and revised over time.