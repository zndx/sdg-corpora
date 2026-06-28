---
chapter_id: ch_live_claim_basic_0f45c1
topic_id: 135
family: 06_belief_structure
cited_terms: ['claim_basic', 'verification_basic', 'transformation_governed_by']
model: engine-refine
---

The governance of data transformations rests upon a structured taxonomy of entities, attributes, and their associated metadata. Each entity—whether a claim identified by a code such as CLAI-0001 or a verification denoted by VERI-0001—serves as the primary anchor for a collection of measured or recorded properties. These properties, or attributes, are themselves catalogued with precision: a claim may carry a `confidence` score typed as `xsd:decimal`, a `dimension_kind` stored as `xsd:string`, or a `recorded_at` timestamp of type `xsd:dateTime`. Similarly, verifications are described through attributes such as `duration_seconds` (decimal), `exit_code` (integer), `host_name` (string), and `end_time` (datetime). The attribute type designation is not merely descriptive; it dictates the physical storage location and the validation constraints applied at ingestion, ensuring that a value of `0.443` for confidence is never conflated with a string value such as `Dimension Kind 01` or a datetime such as `2025-05-28T11:02:08`.

This type-aware separation of concerns manifests in a value-store architecture where attribute values are materialised across distinct tables according to their schema type. Decimal-valued attributes—such as a confidence reading of `0.828` or a duration of `4488.38` seconds—are persisted in dedicated decimal value tables, while string-valued attributes like `Encoding 02` or `ingest-21` reside in varchar value tables. Datetime attributes, including `2023-06-06T17:03:25` and `2025-05-09T15:15:58`, are stored separately, and integer attributes such as `exit_code` values of `182` and `828` follow their own partition. Each value row carries an `entity_id` that references the originating entity and an `attr_id` that resolves to the corresponding attribute definition, forming a tripartite linkage that preserves referential integrity across the type-disaggregated stores. The `id` column in each value table provides a unique surrogate key, while the `entity_id` and `attr_id` columns together constitute the foreign-key bridge to the entity and attribute registries.

The entity-attribute-value model is further enriched by categorical and priority metadata that govern the lifecycle of transformations. A transformation, identified by a key such as GOVE-0004 or GOVE-0006, is classified within a category—`Transformation Category 01` through `Transformation Category 04`—and assigned a priority level, uniformly observed as `2` across the sampled records. The review cycle, expressed in days, varies considerably: a transformation may be scheduled for review every `89` days, `407` days, `727` days, or `888` days, reflecting the operational criticality and regulatory exposure of the underlying data pipeline. These parameters are captured in a fact table that links each transformation key to its priority and review cadence, while a corresponding dimension table provides the human-readable label and categorical classification for each transformation entry.

**dim_transformation**

| id | transformation_label | transformation_category |
| --- | --- | --- |
| GOVE-0001 | Transformation Label 01 | Transformation Category 01 |
| GOVE-0002 | Transformation Label 02 | Transformation Category 02 |
| GOVE-0003 | Transformation Label 03 | Transformation Category 03 |
| GOVE-0004 | Transformation Label 04 | Transformation Category 04 |
| GOVE-0005 | Transformation Label 05 | Transformation Category 05 |
| GOVE-0006 | Transformation Label 06 | Transformation Category 06 |

The foreign-key topology of the schema enforces a clear hierarchy: entities are defined in their base tables, attributes are declared in attribute definition tables, and values are materialised in type-specific value tables that reference both entity and attribute identifiers. In the claim domain, the entity `CLAI-0001` is associated with a claim description of `Model accuracy below SLA` and carries attributes whose values span a confidence decimal of `0.443`, a dimension kind of `Dimension Kind 01`, and a recorded-at datetime of `2025-05-28T11:02:08`. In the verification domain, entity `VERI-0001` corresponds to a `Compliance snapshot test` and is annotated with a duration of `500.97` seconds, an exit code of `182`, a host name of `ingest-21`, and an end time of `2023-02-01T08:41:13`. The transformation fact table, keyed by identifiers such as GOVE-0001 through GOVE-0004, ties governance metadata to transformation keys, with the review cycle days ranging from `89` to `888` and priority held constant at `2`, thereby providing an auditable trail of transformation governance parameters.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

**fact_transformation**

| id | transformation_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0004 | 2 | 89 |
| GOVE-0002 | GOVE-0006 | 2 | 727 |
| GOVE-0003 | GOVE-0006 | 2 | 888 |
| GOVE-0004 | GOVE-0006 | 2 | 407 |
| GOVE-0005 | GOVE-0002 | 1 | 356 |
| GOVE-0006 | GOVE-0002 | 1 | 410 |
| GOVE-0007 | GOVE-0004 | 3 | 230 |