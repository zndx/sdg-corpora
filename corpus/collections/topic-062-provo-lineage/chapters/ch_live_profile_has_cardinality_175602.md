---
chapter_id: ch_live_profile_has_cardinality_175602
topic_id: 62
family: 02_observation_measurement
cited_terms: ['profile_has_cardinality', 'schemaorg_label_alignment', 'measurement_with_op_artifact']
model: engine-refine
---

In governed measurement and alignment systems, an entity denotes the durable object about which assertions are made—a schema.org label alignment instance such as ALIG-0001, an operational artifact such as ARTI-0002, or any record that accumulates typed observations over time. Entities are not self-describing; they are addressed through identifiers, stable surrogate keys (CARD-0001, ALIG-0003, ARTI-0004) that survive relabeling, reclassification, and cross-system federation. Identifier discipline matters because downstream joins, audit trails, and reconciliation all assume referential integrity: when fact_profile references cardinality_key CARD-0005 alongside CARD-0001 and CARD-0003, the presence of an unresolved key signals either provisional ingestion or a governance gap that must be closed before the profile is certified for operational use.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | sku_code | ARTI-0006 |
| ALIG-0002 | org_id | ARTI-0005 |
| ALIG-0003 | data_asset_name | ARTI-0006 |
| ALIG-0004 | data_asset_name | ARTI-0002 |
| ALIG-0005 | sku_code | ARTI-0003 |
| ALIG-0006 | work_title | ARTI-0004 |
| ALIG-0007 | subject_person | ARTI-0003 |
| ALIG-0008 | course_title | ARTI-0004 |

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | ALIG-0006 |
| ARTI-0002 | Seismic Calibration Unit | ALIG-0003 |
| ARTI-0003 | Turbidity Index | ALIG-0008 |
| ARTI-0004 | Seismic Calibration Unit | ALIG-0007 |
| ARTI-0005 | pH Batch Alpha Assay | ALIG-0001 |
| ARTI-0006 | Soil Moisture Profile | ALIG-0003 |

An attr names the semantic role a datum plays on an entity—confidence, dimension_kind, method, recorded_at—while attr_type constrains how that role may be represented and validated. Declaring confidence as xsd:decimal and recorded_at as xsd:dateTime is not cosmetic typing; it routes each assertion to the appropriate value store and enforces parseability, comparability, and unit semantics at the boundary. The same attr vocabulary recurs across alignment and measurement contexts, so that confidence recorded as 0.916 on ALIG-0001 and 0.264 on ALIG-0002 remains commensurate with confidence 0.340 on ARTI-0001 and 0.434 on ARTI-0002, even when the enclosing entities differ in provenance. String-typed attrs such as dimension_kind and method accommodate lexical miscellany—Dimension Kind 01, Encoding 02, nightly summary, change rationale—without collapsing heterogeneous prose into a single undifferentiated text column.

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

Cardinality and category supply the dimensional scaffolding within which quantitative profiles acquire interpretable meaning. Cardinality keys tie fact rows to governed cardinality definitions; a profile keyed CARD-0002 inherits Cardinality Label 02 and Cardinality Category 02 from the dimension, placing a raw measurement in an auditable taxonomic frame rather than leaving it as an orphan scalar. Category, in this sense, is the coarse stratification that groups labels for reporting, policy, and thresholding; cardinality is the finer grain at which analysts compare like-with-like. When fact_profile carries confidence 0.994 against uncertainty 557.92 for one cardinality and confidence 0.226 against uncertainty 488.10 for another, the contrast is meaningful only because each tuple is anchored to a declared cardinality identity, not because the numbers share a table.

Confidence and uncertainty articulate complementary faces of epistemic weight on the same underlying measurements. Confidence, whether stored as a profile field (0.299, 0.773) or materialized through the confidence attr on entities, expresses assessed belief in correctness or fit; uncertainty (284.36 through 622.09 in the sampled profiles) quantifies residual doubt, dispersion, or error budget in the units of the governing measure. High confidence does not extinguish uncertainty—0.994 confidence coexists with 557.92 uncertainty—and low confidence does not always imply high uncertainty, as the spread across CARD-0004 illustrates. Operational guides therefore treat the pair as joint inputs to acceptance rules, escalation, and re-measurement triggers rather than as redundant synonyms.

Misc captures payload values that are intentionally general—numeric magnitudes (728.94, 607.36), profile totals, cardinality labels, alignment timestamps—whose interpretation depends on entity, attr, and type context rather than on a single universal unit. A misc value of 747.18 on ALIG-0001 is legible only when read through its attr_id and attr_type lineage; likewise, recorded_at misc values such as 2024-11-29T12:22:57 and 2023-08-07T05:21:09 establish temporal provenance for otherwise identical attr shapes across alignment and artifact lineages. This separation—identifier and entity for identity, attr and attr_type for semantics, cardinality and category for classification, confidence and uncertainty for belief, misc for the carried datum—is what permits dense, evidence-anchored registries to scale without semantic drift: every number in the corpus remains tethered to the governance primitives that tell operators what it is, why it was recorded, and how far it may be trusted.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |