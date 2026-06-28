---
chapter_id: ch_live_dataset_was_attributed_to_adb3a5
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'process_with_participant', 'lineage_edge_to_target']
model: engine-refine
---

Within the governance framework, every observable datum is anchored to a unique identifier that serves as the primary key for traceability across the entire lineage graph. Dataset records in the fact table carry identifiers such as `ATTR-0001` through `ATTR-0004`, each encoding a version stamp—values of `2`, `5`, or `10`—and a precise byte count, ranging from `31,504,133` bytes for the smallest artifact to `676,110,880` bytes for the largest. These size metrics, stored as `size_bytes`, are not merely bookkeeping; they establish the material footprint of each dataset and enable capacity planning and cost attribution. The `version` column, an integer field, provides a monotonic revision sequence that allows auditors to reconstruct the temporal ordering of dataset mutations and to resolve which version was active at any given point in the data lifecycle.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

Attribution relationships are modeled through a foreign-key link from the fact table's `was_attributed_to_key` column to the dimension table `dim_was_attributed_to`, whose primary key `id` carries the same identifier namespace. This dimension table disambiguates provenance by supplying two descriptive columns: `was_attributed_to_label`, which holds human-readable strings such as `Was Attributed To Label 01` through `Was Attributed To Label 04`, and `was_attributed_to_category`, which assigns each attribution to a classification bucket like `Was Attributed To Category 01` through `Was Attributed To Category 04`. The category field is the analytical lever—queries group by category to aggregate attribution costs, while the label column provides the display text for reports. The foreign-key constraint ensures that every attribution reference in the fact table resolves to a valid dimension member, preventing orphaned provenance claims.

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

Process-level attributes are defined in a schema table that pairs each attribute identifier with a name and an XSD type. The attribute `duration_seconds` is typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. This type declaration is not decorative; it governs which value table receives the data. The architecture employs a type-dispatch pattern: four separate value tables—`t_process_with_participant_val_decimal`, `t_process_with_participant_val_datetime`, `t_process_with_participant_val_int`, and `t_process_with_participant_val_varchar`—each store rows keyed by a composite of `entity_id` and `attr_id`, with the `value` column holding the actual datum. A decimal attribute such as `duration_seconds` yields values like `565.34`, `6522.24`, `236.49`, and `5070.41`; a datetime attribute such as `end_time` yields ISO-8601 timestamps like `2024-06-12T21:46:50` and `2024-08-24T17:43:03`; an integer attribute such as `exit_code` yields values like `231`, `324`, `759`, and `24`; and a string attribute such as `host_name` yields values like `gw-12`, `Log Level 02`, `review`, and `failed`. The `entity_id` column in each value table is a foreign key into the process participant table, which itself is keyed by `id` and describes the process (e.g., `access review`, `network synchronization`, `compliance audit`) and its related component (e.g., `validation suite`, `scheduler service`, `training cluster`, `ingestion pipeline`). This design ensures that every typed value can be traced back to the exact process participant and attribute definition that produced it.

**t_process_with_participant**

| id | process | related |
| --- | --- | --- |
| PART-0001 | access review | validation suite |
| PART-0002 | network synchronization | scheduler service |
| PART-0003 | compliance audit | training cluster |
| PART-0004 | compliance audit | ingestion pipeline |
| PART-0005 | network synchronization | ingestion pipeline |
| PART-0006 | schema migration | scheduler service |
| PART-0007 | schema migration | compliance dataset |
| PART-0008 | quality assurance | validation suite |

**t_process_with_participant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PART-0001 | duration_seconds | xsd:decimal |
| PART-0002 | end_time | xsd:dateTime |
| PART-0003 | exit_code | xsd:integer |
| PART-0004 | host_name | xsd:string |
| PART-0005 | log_level | xsd:string |
| PART-0006 | phase | xsd:string |
| PART-0007 | retry_count | xsd:integer |
| PART-0008 | scheduled_at | xsd:dateTime |

**t_process_with_participant_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0002 | 2024-06-12T21:46:50 |
| PART-0002 | PART-0001 | PART-0008 | 2024-08-24T17:43:03 |
| PART-0003 | PART-0001 | PART-0009 | 2024-02-26T12:31:34 |
| PART-0004 | PART-0002 | PART-0002 | 2023-09-13T23:16:55 |
| PART-0005 | PART-0002 | PART-0008 | 2023-09-18T01:53:27 |
| PART-0006 | PART-0002 | PART-0009 | 2023-12-19T06:07:05 |
| PART-0007 | PART-0003 | PART-0002 | 2025-02-28T12:35:26 |
| PART-0008 | PART-0003 | PART-0008 | 2023-01-21T19:46:12 |

**t_process_with_participant_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0001 | 565.34 |
| PART-0002 | PART-0002 | PART-0001 | 6522.24 |
| PART-0003 | PART-0003 | PART-0001 | 236.49 |
| PART-0004 | PART-0004 | PART-0001 | 5070.41 |
| PART-0005 | PART-0005 | PART-0001 | 5946.70 |
| PART-0006 | PART-0006 | PART-0001 | 6238.25 |
| PART-0007 | PART-0007 | PART-0001 | 1191.07 |
| PART-0008 | PART-0008 | PART-0001 | 3672.98 |

**t_process_with_participant_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0003 | 231 |
| PART-0002 | PART-0001 | PART-0007 | 324 |
| PART-0003 | PART-0002 | PART-0003 | 759 |
| PART-0004 | PART-0002 | PART-0007 | 24 |
| PART-0005 | PART-0003 | PART-0003 | 283 |
| PART-0006 | PART-0003 | PART-0007 | 408 |
| PART-0007 | PART-0004 | PART-0003 | 247 |
| PART-0008 | PART-0004 | PART-0007 | 74 |

**t_process_with_participant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0004 | gw-12 |
| PART-0002 | PART-0001 | PART-0005 | Log Level 02 |
| PART-0003 | PART-0001 | PART-0006 | review |
| PART-0004 | PART-0001 | PART-0010 | failed |
| PART-0005 | PART-0001 | PART-0011 | Triggered By 05 |
| PART-0006 | PART-0002 | PART-0004 | node-b14 |
| PART-0007 | PART-0002 | PART-0005 | Log Level 07 |
| PART-0008 | PART-0002 | PART-0006 | execution |

Lineage edges connect upstream data sources to downstream consumers through the `t_lineage_edge_to_target` table, which records the `lineage` type of the source artifact—such as `ml_model_checkpoint`, `knowledge_base_dump`, or `raw_telemetry_feed`—and the `to_target` destination, including `executive_dashboard`, `feature_store_table`, and `risk_prediction_model`. Each edge carries a `unit` of measure, drawn from values like `nm`, `ratio`, `count`, and `kg`, and a `value` representing the magnitude of the relationship, such as `555.98`, `967.34`, `771.21`, or `171.35`. The unit column is critical for semantic correctness: a lineage edge measured in `kg` carries a different compliance implication than one measured in `ratio`, and the value column quantifies the edge for impact analysis. Together, the identifier, type, category, entity, and attribution columns form a closed graph in which every datum can be located, typed, categorized, and traced to its source and consumer.

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | ml_model_checkpoint | executive_dashboard | nm | 555.98 |
| TARG-0002 | knowledge_base_dump | feature_store_table | ratio | 967.34 |
| TARG-0003 | ml_model_checkpoint | executive_dashboard | count | 771.21 |
| TARG-0004 | raw_telemetry_feed | risk_prediction_model | kg | 171.35 |
| TARG-0005 | lab_sample_manifest | analytics_warehouse | count | 934.12 |
| TARG-0006 | quality_validation_suite | backup_snapshot | count | 626.71 |