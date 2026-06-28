---
chapter_id: ch_live_verification_subclass_182d66
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'process_min_one_input', 'schema_evolution_under_directive']
model: engine-refine
---

Attributes constitute the fundamental unit of data description within a schema, each defined by a name and a type that governs its permissible values and the operations applicable to it. An attribute such as `duration_seconds` carries the type `xsd:decimal`, permitting fractional numeric measurements, whereas `end_time` is typed as `xsd:dateTime` to enforce temporal formatting, `exit_code` as `xsd:integer` constrains it to whole numbers, and `host_name` as `xsd:string` accommodates arbitrary text. This type discipline is not merely declarative; it determines how values are stored, validated, and queried across the system. The same set of attribute names—`duration_seconds`, `end_time`, `exit_code`, `host_name`—appears across distinct entity families, yet the type bindings remain consistent, ensuring that a decimal duration measured in one context is comparable to a decimal duration in another, even when the entities themselves represent different operational domains.

Entities serve as the concrete instances to which attributes are bound, and each entity is identified by a unique identifier that anchors it within the data model. A verification event such as `VERI-0001`, classified as a Compliance renewal verification, may carry a duration of 5469.69 seconds, terminate at `2024-10-23T14:58:17`, report an exit code of 616, and execute on a host named `node-a01`. The same entity can simultaneously hold a log level designation of `Log Level 02`, a review status, and a running state, each stored in its own typed value table. This separation of values by type—decimal, datetime, integer, and varchar—reflects a deliberate normalization strategy that avoids the ambiguity of a single monolithic value column and instead preserves type integrity at the point of storage. The identifier `VERI-0001` thus functions as a foreign key across multiple value tables, each contributing a different facet of the entity's state.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

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

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

The relationship between entities and their attributes is mediated through a schema layer that introduces both classification and quality metrics. A schema key such as `DIRE-0007` may be associated with a schema label like `Schema Label 01` and categorized under `Schema Category 01`, establishing a hierarchical taxonomy that supports governance and auditability. More critically, each schema assignment carries a confidence score and an uncertainty measure. A confidence of 0.559 paired with an uncertainty of 435.16 signals a relatively strong association, whereas a confidence of 0.128 with an uncertainty of 36.42 indicates a weak link despite low absolute variance. These paired metrics enable downstream systems to weight schema-derived inferences appropriately, filtering or downgrading conclusions when confidence falls below operational thresholds.

**dim_schema**

| id | schema_label | schema_category |
| --- | --- | --- |
| DIRE-0001 | Schema Label 01 | Schema Category 01 |
| DIRE-0002 | Schema Label 02 | Schema Category 02 |
| DIRE-0003 | Schema Label 03 | Schema Category 03 |
| DIRE-0004 | Schema Label 04 | Schema Category 04 |
| DIRE-0005 | Schema Label 05 | Schema Category 05 |
| DIRE-0006 | Schema Label 06 | Schema Category 06 |
| DIRE-0007 | Schema Label 07 | Schema Category 07 |

Process definitions further extend the entity-attribute model by establishing input-output relationships between operational workflows and the verifications they consume. A process labeled Real-time stream processing may take `VERI-0003`—a GDPR data flow review—as its input, while a Batch data ingestion process consumes `VERI-0004`, a Security posture assessment. Each process input inherits the same attribute structure as its source entity, with duration, termination time, exit code, and host name all present and typed identically. The decimal duration for a process input such as `INPU-0001` might register at 2164.83 seconds, while its integer exit code reads 682, and its host name is `ingest-21`. This structural parity between source verifications and process inputs ensures that data flowing through the pipeline retains its semantic meaning and type constraints, enabling consistent validation at every stage of transformation.

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | VERI-0003 |
| INPU-0002 | Batch data ingestion | VERI-0004 |
| INPU-0003 | ETL transformation step | VERI-0003 |
| INPU-0004 | Feature engineering workflow | VERI-0004 |
| INPU-0005 | Real-time stream processing | VERI-0006 |
| INPU-0006 | Audit trail generation | VERI-0007 |

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

The overall architecture—where identifiers anchor entities, attributes define structure, typed value tables preserve data integrity, and schema layers inject classification and confidence—forms a coherent framework for managing complex, multi-domain data. The separation of concerns between entity definitions, attribute schemas, typed values, and process mappings allows each layer to evolve independently while maintaining referential integrity through foreign-key relationships. Confidence and uncertainty metrics, embedded at the schema level, provide a mechanism for quantifying the reliability of schema-derived assertions, ensuring that automated decisions can be calibrated against measured certainty rather than treated as binary truths.

**fact_schema**

| id | schema_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DIRE-0001 | DIRE-0007 | 0.346 | 496.72 | 934.63 |
| DIRE-0002 | DIRE-0004 | 0.128 | 36.42 | 722.91 |
| DIRE-0003 | DIRE-0007 | 0.279 | 132.28 | 890.32 |
| DIRE-0004 | DIRE-0007 | 0.559 | 435.16 | 628.85 |
| DIRE-0005 | DIRE-0002 | 0.314 | 996.56 | 660.34 |
| DIRE-0006 | DIRE-0003 | 0.661 | 71.96 | 765.11 |
| DIRE-0007 | DIRE-0005 | 0.981 | 108.29 | 904.01 |