---
chapter_id: ch_live_schemaorg_review_rating_8ba88b
topic_id: 163
family: 07_long_tail
cited_terms: ['schemaorg_review_rating', 'labrun_subclass', 'observation_records_state']
model: engine-refine
---

Within an entity-attribute-value data model, the identifier serves as the immutable primary key that anchors every record across all tables, whether it is RATI-0001 for a schema.org review rating, LABR-0001 for a laboratory run such as CellCulture-Exp12, or STAT-0001 for an observation record like Network latency spike. The entity is the concrete object or event being described — a product review of The Great Gatsby, an ELISA assay on plate ELISA-Plate88, or a reactor pressure threshold event — and it is the entity_id column in every value table that binds attribute values back to their owner. An attribute, recorded in the attr_name column of the definition tables, is a named property of that entity; duration_seconds, end_time, exit_code, and host_name appear identically in both the labrun and observation domains, demonstrating that the same attribute vocabulary can be reused across distinct entity types without ambiguity.

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | RATI-0004 |
| LABR-0002 | FlowCyt-Panel9 | RATI-0001 |
| LABR-0003 | ELISA-Plate88 | RATI-0005 |
| LABR-0004 | PCR-Run-Alpha7 | RATI-0005 |
| LABR-0005 | MassSpec-MS19 | RATI-0006 |
| LABR-0006 | NMR-Stand-04A | RATI-0004 |
| LABR-0007 | FlowCyt-Panel9 | RATI-0002 |
| LABR-0008 | RNASeq-Lib15 | RATI-0006 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

The attr_type column declares the semantic type of each attribute using XSD datatypes — xsd:decimal for duration_seconds, xsd:dateTime for end_time, xsd:integer for exit_code, and xsd:string for host_name — and this declaration drives the physical partitioning of value storage. Rather than storing all attribute values in a single untyped column, the model distributes them across four value tables keyed by type: t_labrun_subclass_val_decimal holds numeric measurements such as 7187.70 and 5360.85 for the duration_seconds attribute, t_labrun_subclass_val_datetime stores timestamps like 2023-06-03T03:48:13 and 2024-12-03T15:21:58, t_labrun_subclass_val_int captures integer exit codes including 241, 320, 688, and 479, and t_labrun_subclass_val_varchar carries free-form strings such as node-b14, Log Level 02, closeout, and pending. The same four-way split is replicated in the observation domain, where decimal values range from 1567.00 to 5274.11, datetime values span from 2023-08-02T17:44:58 to 2025-03-10T03:55:42, integer values include 958 and 41, and varchar values contain worker-07, Log Level 02, execution, and pending. This type-disaggregated design enforces schema-level type safety at query time while preserving the flexibility of an EAV architecture.

The misc column is the value carrier in every type-specific table; it holds the actual data — the decimal 4243.13, the timestamp 2024-08-16T12:27:34, the integer 517, the string pending — and its meaning is fully determined by the attr_id foreign key that points to the attribute definition and, transitively, to the attr_type that governs interpretation. The entity_id foreign key in each value table resolves to the owning entity, so that the value 7187.70 in t_labrun_subclass_val_decimal is unambiguously the duration_seconds of the lab run LABR-0001 (CellCulture-Exp12), and the value 958 in t_observation_records_state_val_int is the exit_code of the observation STAT-0001 (Network latency spike). This two-key resolution — entity_id plus attr_id — is what makes the EAV pattern queryable: any attribute value can be retrieved by joining the value table to the entity table on entity_id and to the attribute definition table on attr_id, yielding a row that contains the entity name, the attribute name, the declared type, and the misc value in a single result.

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | RATI-0005 |
| STAT-0002 | Water quality anomaly | RATI-0003 |
| STAT-0003 | Reactor pressure threshold | RATI-0003 |
| STAT-0004 | Reactor pressure threshold | RATI-0003 |
| STAT-0005 | Network latency spike | RATI-0004 |
| STAT-0006 | pH deviation alert | RATI-0003 |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

Beyond the entity-attribute-value core, the model supports binary relationships through a junction table that links two entities via subject, target, and role columns. In t_schemaorg_review_rating__review_rating, the schemaorg_id column acts as the subject — the entity initiating the relationship — and the review_rating_id column acts as the target — the entity receiving it — while the role column qualifies the nature of the link, taking values such as reviewer and contributor. For example, the row with id RATI-0001 connects schemaorg_id RATI-0004 (the product iPhone 15 Pro) to review_rating_id RATI-0001 (the rating 3.2 points) with role reviewer, establishing that the review of iPhone 15 Pro was authored by the entity holding rating 3.2 points in a reviewer capacity. The same structural pattern — subject, target, role — can be extended to any pair of entity types, making the junction table a general-purpose mechanism for expressing typed, directional associations without hard-coding relationship semantics into the entity tables themselves.

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |