---
chapter_id: ch_live_transformation_associated_with_agent_b92aef
topic_id: 186
family: 05_provo_lineage
cited_terms: ['transformation_associated_with_agent', 'transformation_basic', 'frame_coarsening']
model: engine-refine
---

An identifier is the immutable key that anchors every entity in the system, providing a stable handle for cross-referencing across all tables. Identifiers follow a structured prefix convention—AGENT identifiers such as AGEN-0001 and AGEN-0002 denote transformation agents, while TRAN-0001 through TRAN-0004 identify transformation records, and COAR-0001 through COAR-0004 identify coarsening frames. This prefix-based scheme enables immediate recognition of an entity's domain without requiring a schema lookup, and the identifier column serves as the primary key in every entity table, ensuring that each record is uniquely addressable.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Model Retraining Cycle |
| AGEN-0002 | Log field extraction |
| AGEN-0003 | Archive Export Run |
| AGEN-0004 | Customer deduplication |
| AGEN-0005 | Schema evolution migration |
| AGEN-0006 | Hierarchical flattening |
| AGEN-0007 | Feature Engineering Job |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**t_transformation_basic**

| id | transformation |
| --- | --- |
| TRAN-0001 | Feature scaling |
| TRAN-0002 | Currency conversion |
| TRAN-0003 | Schema evolution migration |
| TRAN-0004 | Index Rebuild Job |
| TRAN-0005 | Customer deduplication |
| TRAN-0006 | Log Aggregation Task |

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | micro batch window |
| COAR-0002 | raw sensor tick | quarterly region cluster |
| COAR-0003 | raw sensor tick | spatial zone seven |
| COAR-0004 | processing pipeline tier | raw sensor tick |
| COAR-0005 | metadata catalog level | daily telemetry window |
| COAR-0006 | hourly sensor grid | logical dataset slice |

An entity represents a discrete, addressable thing in the data model—a transformation, a coarsening frame, or an agent—and is characterized by a set of attributes. The entity table itself holds the core identity and a human-readable label: the transformation "Feature scaling" carries identifier TRAN-0001, while "Currency conversion" is TRAN-0002; the coarsening frame described as "temporal observation scope" is identified by COAR-0001. Entities are the subjects of relationships and the owners of attribute values, forming the central nodes around which the rest of the data model is organized.

**t_transformation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0003 | 133 |
| TRAN-0002 | TRAN-0001 | TRAN-0007 | 93 |
| TRAN-0003 | TRAN-0002 | TRAN-0003 | 142 |
| TRAN-0004 | TRAN-0002 | TRAN-0007 | 123 |
| TRAN-0005 | TRAN-0003 | TRAN-0003 | 502 |
| TRAN-0006 | TRAN-0003 | TRAN-0007 | 13 |
| TRAN-0007 | TRAN-0004 | TRAN-0003 | 896 |
| TRAN-0008 | TRAN-0004 | TRAN-0007 | 153 |

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |

Attributes define the properties of an entity, and each attribute has a name and a type. The attribute definition table pairs an attribute identifier with its name—such as duration_seconds, end_time, exit_code, and host_name for transformations—and its type, drawn from the XSD vocabulary: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This separation of attribute metadata from attribute values enables type-safe storage and query routing. The type declaration determines which value table a given attribute's data belongs to, ensuring that decimal values like 795.94 and 7139.05 for the duration_seconds attribute are stored in the decimal value table, while datetime values such as 2025-05-04T13:03:22 and 2023-11-24T00:59:19 for the end_time attribute reside in the datetime value table, and string values like edge-03 and Log Level 02 for the host_name attribute are stored in the varchar value table.

**t_transformation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAN-0001 | duration_seconds | xsd:decimal |
| TRAN-0002 | end_time | xsd:dateTime |
| TRAN-0003 | exit_code | xsd:integer |
| TRAN-0004 | host_name | xsd:string |
| TRAN-0005 | log_level | xsd:string |
| TRAN-0006 | phase | xsd:string |
| TRAN-0007 | retry_count | xsd:integer |
| TRAN-0008 | scheduled_at | xsd:dateTime |

**t_transformation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0002 | 2025-05-04T13:03:22 |
| TRAN-0002 | TRAN-0001 | TRAN-0008 | 2023-11-24T00:59:19 |
| TRAN-0003 | TRAN-0001 | TRAN-0009 | 2024-10-31T22:10:22 |
| TRAN-0004 | TRAN-0002 | TRAN-0002 | 2024-05-26T15:20:00 |
| TRAN-0005 | TRAN-0002 | TRAN-0008 | 2024-04-05T04:09:32 |
| TRAN-0006 | TRAN-0002 | TRAN-0009 | 2025-06-07T09:12:29 |
| TRAN-0007 | TRAN-0003 | TRAN-0002 | 2023-11-14T02:28:35 |
| TRAN-0008 | TRAN-0003 | TRAN-0008 | 2023-01-21T02:20:55 |

**t_transformation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0001 | 795.94 |
| TRAN-0002 | TRAN-0002 | TRAN-0001 | 7139.05 |
| TRAN-0003 | TRAN-0003 | TRAN-0001 | 5074.97 |
| TRAN-0004 | TRAN-0004 | TRAN-0001 | 6971.76 |
| TRAN-0005 | TRAN-0005 | TRAN-0001 | 5283.27 |
| TRAN-0006 | TRAN-0006 | TRAN-0001 | 1285.62 |

**t_transformation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0004 | edge-03 |
| TRAN-0002 | TRAN-0001 | TRAN-0005 | Log Level 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0006 | review |
| TRAN-0004 | TRAN-0001 | TRAN-0010 | complete |
| TRAN-0005 | TRAN-0001 | TRAN-0011 | Triggered By 05 |
| TRAN-0006 | TRAN-0002 | TRAN-0004 | edge-03 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | Log Level 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | initiation |

The value tables implement an entity-attribute-value (EAV) pattern, where each row records a misc value for a specific entity and attribute combination. The entity_id column references the owning entity, the attr_id column references the attribute definition, and the value column holds the actual data. This design allows entities to have heterogeneous, extensible sets of attributes without requiring schema changes to the entity table itself. For instance, entity TRAN-0001 has a duration_seconds value of 795.94, an exit_code of 133, a host_name of edge-03, and an end_time of 2025-05-04T13:03:22, each stored in its respective typed value table but unified through the shared entity_id and attr_id foreign keys.

Subject and target are the directional endpoints of a relationship, and role specifies the nature of the connection between them. In the association table linking transformation agents to their collaborators, the transformation_id column identifies the subject—the entity at the origin of the relationship—while the was_associated_with_id column identifies the target—the entity at the receiving end. The role column then qualifies the relationship with a semantic label such as contributor, reviewer, or observer. For example, agent AGEN-0001 serves as a contributor to transformation AGEN-0006, while agent AGEN-0002 acts as a reviewer of the same transformation, and agent AGEN-0003 is an observer of transformation AGEN-0003. This triad of subject, target, and role enables rich, typed relationships that go beyond simple many-to-many associations.

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |