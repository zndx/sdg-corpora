---
chapter_id: ch_live_aggregation_uses_function_e73b6f
topic_id: 91
family: 02_observation_measurement
cited_terms: ['aggregation_uses_function', 'belief_interval_at_confidence_level', 'classification_basic']
model: engine-refine
---

The governance of analytical outputs rests on a structured taxonomy of aggregation functions, each uniquely identified by an **identifier** such as `FUNC-0001` through `FUNC-0005` and classified within a **category** hierarchy. The dimension table for aggregation functions maps each identifier to a human-readable label—`Uses Aggregation Function Label 01` through `04`—and resolves its **category** membership through a foreign key (`category_id`) pointing to the category dimension, where categories themselves are enumerated as `Category Name 01` through `Category Name 04`. This two-tier classification scheme ensures that every aggregation operation can be traced to its semantic domain, enabling downstream consumers to reason about the provenance and scope of computed metrics without ambiguity.

**fact_aggregation**

| id | uses_aggregation_function_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | 0.857 | 811.48 | 835.01 |
| FUNC-0002 | FUNC-0004 | 0.688 | 850.83 | 952.80 |
| FUNC-0003 | FUNC-0004 | 0.639 | 844.56 | 52.67 |
| FUNC-0004 | FUNC-0005 | 0.024 | 527.80 | 996.14 |
| FUNC-0005 | FUNC-0002 | 0.062 | 315.40 | 941.21 |

**dim_uses_aggregation_function_category**

| id | category_name |
| --- | --- |
| FUNC-0001 | Category Name 01 |
| FUNC-0002 | Category Name 02 |
| FUNC-0003 | Category Name 03 |
| FUNC-0004 | Category Name 04 |
| FUNC-0005 | Category Name 05 |
| FUNC-0006 | Category Name 06 |

**dim_uses_aggregation_function**

| id | uses_aggregation_function_label | uses_aggregation_function_category | category_id |
| --- | --- | --- | --- |
| FUNC-0001 | Uses Aggregation Function Label 01 | Uses Aggregation Function Category 01 | FUNC-0003 |
| FUNC-0002 | Uses Aggregation Function Label 02 | Uses Aggregation Function Category 02 | FUNC-0003 |
| FUNC-0003 | Uses Aggregation Function Label 03 | Uses Aggregation Function Category 03 | FUNC-0002 |
| FUNC-0004 | Uses Aggregation Function Label 04 | Uses Aggregation Function Category 04 | FUNC-0005 |
| FUNC-0005 | Uses Aggregation Function Label 05 | Uses Aggregation Function Category 05 | FUNC-0006 |
| FUNC-0006 | Uses Aggregation Function Label 06 | Uses Aggregation Function Category 06 | FUNC-0002 |

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

Quantitative assessments of aggregation quality are captured in the fact table, where each record carries a **confidence** score and an associated **uncertainty** bound alongside a measured **value**. Confidence values range from a high of `0.857` for `FUNC-0001` down to a negligible `0.024` for `FUNC-0004`, reflecting the spectrum of reliability across different aggregation operations. The corresponding uncertainty figures—`811.48`, `850.83`, `844.56`, and `527.80`—provide a complementary measure of dispersion, while the observed values (`835.01`, `952.80`, `52.67`, `996.14`) represent the actual computed aggregates. Together, these three attributes form a triad of quality indicators that allow operators to filter, weight, or flag aggregation results based on their trustworthiness.

Classification records anchor analytical processes to operational context through **phase** and **triggered_by** dimensions. Classifications such as `sensor calibration`, `data validation`, `pipeline orchestration`, and repeated `sensor calibration` are each associated with a phase—either `execution` or `review`—and a trigger mechanism drawn from `schedule`, `manual`, or `retry`. This structure makes it possible to audit not only what was classified but when in the lifecycle the classification occurred and what initiated it, providing a complete provenance trail for governance and compliance purposes.

The belief interval framework extends this model by associating belief states with confidence levels, where each belief—ranging from `Calibration drift reading` and `Query result set` to `Schema migration status` and `Sensor telemetry snapshot`—is linked to a confidence level identifier such as `CLAS-0002` through `CLAS-0005`. Attribute metadata defines the schema of these belief records through **attr** (attribute name) and **attr_type** (attribute type) pairs, with attribute names including `confidence`, `dimension_kind`, `method`, and `recorded_at`, and their corresponding types expressed in XSD notation as `xsd:decimal`, `xsd:string`, and `xsd:dateTime`. This typed attribute system supports a value store partitioned by data type: decimal values like `0.649` and `174.38`, string values such as `Dimension Kind 01` and `audit excerpt`, and datetime values including `2023-02-13T08:09:52` and `2025-01-26T05:24:46`. Each value record references an **entity** and an **attr** through foreign keys, creating a flexible entity-attribute-value model that accommodates heterogeneous data while preserving type safety and referential integrity.

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | CLAS-0002 |
| LEVE-0002 | Query result set | CLAS-0005 |
| LEVE-0003 | Schema migration status | CLAS-0003 |
| LEVE-0004 | Sensor telemetry snapshot | CLAS-0004 |
| LEVE-0005 | Data lineage trace | CLAS-0002 |
| LEVE-0006 | Pipeline throughput metric | CLAS-0005 |
| LEVE-0007 | Schema migration status | CLAS-0004 |
| LEVE-0008 | Lab assay concentration | CLAS-0002 |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |