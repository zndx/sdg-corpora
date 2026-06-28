---
chapter_id: ch_live_metric_with_aggregation_bb3f82
topic_id: 42
family: 07_long_tail
cited_terms: ['metric_with_aggregation', 'transformation_min_one_input', 'claim_basic']
model: engine-refine
---

The foundation of any structured data model rests on the disciplined separation of identity from content. Every entity—whether a metric such as `memory_usage_gigabytes` or `cpu_utilization_percent`, a transformation like `DataMasking` or `FieldEncryption`, or a claim such as "Model accuracy below SLA" or "File checksum matches"—is anchored by a unique identifier, conventionally prefixed to signal provenance: `AGGR-0001` for aggregated metrics, `INPU-0001` for input transformations, `CLAI-0001` for compliance assertions. These identifiers function as the immutable keys that bind all subsequent attribute definitions and value assignments to a single, traceable entity. The prefix scheme itself encodes domain context, allowing an analyst to distinguish a metric identifier from a claim identifier without consulting a schema dictionary.

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | DataMasking |
| INPU-0002 | TimestampAlign |
| INPU-0003 | FieldEncryption |
| INPU-0004 | FieldEncryption |
| INPU-0005 | RowFiltering |
| INPU-0006 | DuplicateRemoval |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | NetworkTrafficLog |
| INPU-0002 | CustomerTransactions |
| INPU-0003 | NetworkTrafficLog |
| INPU-0004 | PatientRecords |
| INPU-0005 | SupplyChainEvents |
| INPU-0006 | NetworkTrafficLog |

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

Attributes and their types constitute the schema layer that sits atop this identity foundation. An attribute name—`checksum`, `created_date`, `confidence`, `dimension_kind`—describes a property of interest, while the attribute type constrains the shape and semantics of permissible values. Types drawn from XML Schema, such as `xsd:string`, `xsd:date`, `xsd:decimal`, and `xsd:dateTime`, enforce structural discipline, while domain-specific types like `cco:DesignativeICE` signal that a value carries designative semantics beyond the generic string. In the claim domain, for instance, the `confidence` attribute is typed as `xsd:decimal`, which directly governs the range of admissible values: `0.443`, `0.828`, `443.93`, `257.71`. The `recorded_at` attribute, typed as `xsd:dateTime`, constrains its values to timestamps such as `2025-05-28T11:02:08` or `2024-03-14T10:07:11`. This type-level discipline ensures that heterogeneous data—dates, integers, free-text strings—can coexist within a single entity without ambiguity.

The entity-attribute-value (EAV) pattern, realized through type-specialized value tables, is the mechanism by which heterogeneous properties are stored without requiring a fixed column set. For aggregated metrics, date values like `2025-01-26` and `2024-12-19` reside in the date-valued table, integer values such as `105`, `11`, `324`, and `2` in the integer-valued table, and string values including `1a4b6c2d`, `ref-8842`, `Apache-2.0`, and `zone-b` in the varchar-valued table. Each value row is triply linked: to the entity it describes (e.g., `AGGR-0001`), to the attribute it instantiates (e.g., `AGGR-0002` for `created_date`), and to the concrete value itself. This three-way linkage preserves referential integrity while allowing any entity to carry an arbitrary set of typed attributes. The same pattern applies to claims, where decimal values, datetime values, and varchar values are partitioned into their respective tables, each row pointing back to a claim entity like `CLAI-0001` and an attribute like `CLAI-0001` for `confidence`.

Relationships between entities are modeled through junction tables that explicitly name the subject, the target, and the role that connects them. In the transformation domain, the mapping between a transformation and its input dataset is captured not as a simple foreign key but as a tripartite relationship: the `transformation_id` serves as the subject, the `input_dataset_id` as the target, and the `role` column specifies the nature of the connection—`observer` in every recorded instance. This means that `INPU-0001` (the `DataMasking` transformation applied to `NetworkTrafficLog`) is linked to `INPU-0004` (the `FieldEncryption` transformation applied to `PatientRecords`) through a shared structural pattern, where the role column would distinguish whether a dataset is an input, an output, or a reference. The explicit role dimension enables queries that reason about data lineage and transformation topology without hardcoding relationship semantics into the schema.

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |

The claim entity illustrates how this same architectural pattern supports compliance and audit workflows. A claim such as "Schema version deprecated" or "File checksum matches" carries typed attributes—`confidence` as a decimal, `dimension_kind` as a string, `method` as a string, `recorded_at` as a datetime—that together form a verifiable assertion about system state. The `dimension_kind` attribute takes values like `Dimension Kind 01` and `Encoding 02`, while the `method` attribute references `audit excerpt` and locale codes such as `fr`. These values, stored in the varchar-valued table and linked to claim entities through the attribute identifier, provide the evidentiary substrate against which compliance decisions are made. The aggregation metrics, similarly, carry attributes like `license` with value `Apache-2.0` and `identifier` typed as `cco:DesignativeICE`, binding operational telemetry to governance requirements. Across all three domains—metrics, transformations, and claims—the consistent use of identifiers, typed attributes, and value partitioning creates a unified data fabric where identity, structure, and content are separable yet coherently linked.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | CLAI-0001 |
| AGGR-0002 | log_error_rate_per_minute | CLAI-0006 |
| AGGR-0003 | cpu_utilization_percent | CLAI-0001 |
| AGGR-0004 | api_response_time_p99 | CLAI-0002 |
| AGGR-0005 | queue_depth_messages | CLAI-0001 |
| AGGR-0006 | database_connection_pool_active | CLAI-0005 |
| AGGR-0007 | http_request_latency_ms | CLAI-0005 |
| AGGR-0008 | api_response_time_p99 | CLAI-0006 |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |

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