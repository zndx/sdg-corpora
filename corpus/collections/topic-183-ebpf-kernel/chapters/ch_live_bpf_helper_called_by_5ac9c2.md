---
chapter_id: ch_live_bpf_helper_called_by_5ac9c2
topic_id: 183
family: 07_long_tail
cited_terms: ['bpf_helper_called_by', 'state_transitions_to', 'measurement_with_op_artifact']
model: engine-refine
---

The system models relationships between entities through a flexible attribute-value architecture where each entity is identified by a unique identifier such as CALL-0001 or ARTI-0001, and its properties are captured as named attributes with declared types. An attribute definition—such as `checksum` typed as `xsd:string`, `created_date` typed as `xsd:date`, or `identifier` typed as `cco:DesignativeICE`—establishes the semantic contract for what values are admissible, while the actual values are stored in type-specific value tables keyed by the entity and attribute identifiers. This separation of attribute schema from value storage enables heterogeneous data to coexist within a single entity: a single entity like CALL-0001 may carry a checksum value of `1a4b6c2d` in a varchar store, a date value of `2024-07-02` in a date store, and integer measurements such as `67` and `11` in an integer store, all referenced through the same entity-attribute pairing. The attr type declarations—spanning `xsd:string`, `xsd:date`, `xsd:dateTime`, `xsd:decimal`, and domain-specific types like `cco:DesignativeICE`—serve as the type system that governs validation, serialization, and downstream query semantics across the value tables.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | ARTI-0003 |
| CALL-0002 | xdp_router | ARTI-0006 |
| CALL-0003 | lsm:inode_create | ARTI-0005 |
| CALL-0004 | tracepoint:sched_process_exit | ARTI-0001 |
| CALL-0005 | raw_tracepoint:sys_enter | ARTI-0006 |
| CALL-0006 | cgroup_skb_ingress | ARTI-0004 |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | CALL-0004 |
| ARTI-0002 | Seismic Calibration Unit | CALL-0005 |
| ARTI-0003 | Turbidity Index | CALL-0002 |
| ARTI-0004 | Seismic Calibration Unit | CALL-0001 |
| ARTI-0005 | pH Batch Alpha Assay | CALL-0003 |
| ARTI-0006 | Soil Moisture Profile | CALL-0005 |

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

Transitions between states are modeled as first-class entities with their own identifiers (TRAN-0001 through TRAN-0004), each carrying a `transitions_to` reference that points to a target state, forming a directed graph of state evolution. For example, TRAN-0001 transitions to TRAN-0003, while TRAN-0002 and TRAN-0003 both converge on TRAN-0006, illustrating how multiple source states can map to a single destination. Each transition is enriched with quantitative metadata: a confidence score—ranging from 0.012 for TRAN-0002 to 0.523 for TRAN-0004—that reflects the system's certainty in the transition's validity, and an uncertainty metric—such as 951.90 for TRAN-0001 or 366.30 for TRAN-0004—that quantifies the magnitude of unexplained variance or risk associated with the transition. A supplementary value field, holding measurements like 195.86 or 619.50, provides an additional quantitative dimension that may represent the observed magnitude of the transition itself.

**fact_state**

| id | transitions_to_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0003 | 0.422 | 951.90 | 195.86 |
| TRAN-0002 | TRAN-0006 | 0.012 | 416.12 | 143.04 |
| TRAN-0003 | TRAN-0006 | 0.075 | 421.79 | 237.15 |
| TRAN-0004 | TRAN-0005 | 0.523 | 366.30 | 619.50 |

Categories provide a classification layer over transitions and other entities, enabling grouping and aggregation by semantic type. A transition's category is resolved through a dimension table that maps each transition identifier to a label (e.g., "Transitions To Label 01") and a category reference (e.g., "Transitions To Category 01"), which in turn links to a category dimension table where the category identifier (TRAN-0004, TRAN-0005) resolves to a human-readable category name such as "Category Name 01" or "Category Name 04". This two-level indirection—transition to category_id to category_name—allows categories to be reused across multiple transitions and updated independently of the transition records themselves. In the observed data, TRAN-0001 and TRAN-0003 share the same category_id (TRAN-0004), while TRAN-0002 and TRAN-0004 share another (TRAN-0005), demonstrating how the category dimension consolidates related transitions under shared classification labels.

**dim_transitions_to_category**

| id | category_name |
| --- | --- |
| TRAN-0001 | Category Name 01 |
| TRAN-0002 | Category Name 02 |
| TRAN-0003 | Category Name 03 |
| TRAN-0004 | Category Name 04 |
| TRAN-0005 | Category Name 05 |
| TRAN-0006 | Category Name 06 |
| TRAN-0007 | Category Name 07 |

**dim_transitions_to**

| id | transitions_to_label | transitions_to_category | category_id |
| --- | --- | --- | --- |
| TRAN-0001 | Transitions To Label 01 | Transitions To Category 01 | TRAN-0004 |
| TRAN-0002 | Transitions To Label 02 | Transitions To Category 02 | TRAN-0005 |
| TRAN-0003 | Transitions To Label 03 | Transitions To Category 03 | TRAN-0004 |
| TRAN-0004 | Transitions To Label 04 | Transitions To Category 04 | TRAN-0005 |
| TRAN-0005 | Transitions To Label 05 | Transitions To Category 05 | TRAN-0001 |
| TRAN-0006 | Transitions To Label 06 | Transitions To Category 06 | TRAN-0004 |

The measurement-with-artifact pattern extends the attribute-value model to observational data, where a measurement such as "Seismic Calibration Unit" or "Turbidity Index" is associated with an entity it describes. Each measurement artifact carries its own set of attributes—`confidence` typed as `xsd:decimal`, `dimension_kind` typed as `xsd:string`, `method` typed as `xsd:string`, and `recorded_at` typed as `xsd:dateTime`—with values stored in corresponding type-specific tables. For instance, ARTI-0001 records a confidence of 0.340 and a recorded timestamp of `2024-07-05T11:56:13`, while ARTI-0002 carries a confidence of 0.434 and a timestamp of `2024-04-19T15:36:13`. Additional varchar attributes capture descriptive metadata such as `Dimension Kind 01`, `Encoding 02`, `change rationale`, and `fr`, while decimal attributes hold quantitative measurements like 723.57 and 106.04. This structure allows each measurement artifact to be independently typed, versioned, and queried without altering the core schema.

Across all these patterns, the identifier serves as the universal binding mechanism: it appears as the primary key in entity tables, as a foreign key in value tables linking values back to their entities, and as a reference in transition and category dimensions. The attr and attr_type columns define what can be stored, the entity column anchors each value to a specific record, and the misc values—whether dates, strings, integers, decimals, or datetimes—represent the actual observable data. Confidence and uncertainty columns in the state transition table provide a dual lens on reliability: confidence expresses the probability or strength of the transition, while uncertainty quantifies the residual risk or variance. Together, these constructs form a cohesive data model that supports flexible entity modeling, typed attribute storage, state-transition tracking with quantified reliability, and categorical classification—all unified through a consistent identifier-based referencing scheme.

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |