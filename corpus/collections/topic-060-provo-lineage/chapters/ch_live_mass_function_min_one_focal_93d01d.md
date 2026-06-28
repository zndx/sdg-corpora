---
chapter_id: ch_live_mass_function_min_one_focal_93d01d
topic_id: 60
family: 06_belief_structure
cited_terms: ['mass_function_min_one_focal', 'pignistic_transformation', 'observation_governed_by_policy']
model: engine-refine
---

The identifier serves as the immutable primary key for every entity within the evidence model, anchoring records across all domains with a predictable prefix scheme: mass-function focal elements carry identifiers such as FOCA-0001 through FOCA-0004, pignistic transformations bear TRAN-0001 through TRAN-0004, and policy-governed observations are designated POLI-0001 through POLI-0004. This convention ensures referential integrity when an entity references another—focal element FOCA-0001, for instance, carries a mass value of audit_trail_eta and resolves to focal element TRAN-0006, while observation POLI-0001 records the event north vent temperature spike and associates with duration_seconds measured at 2405.99. The identifier is not merely a label; it is the join key that threads through every attribute definition, every value assignment, and every relationship table, enabling the model to remain schema-flexible while preserving traceability.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | TRAN-0006 |
| FOCA-0002 | audit_trail_eta | TRAN-0002 |
| FOCA-0003 | provenance_record_epsilon | TRAN-0004 |
| FOCA-0004 | sensor_array_gamma | TRAN-0006 |
| FOCA-0005 | governance_log_delta | TRAN-0001 |
| FOCA-0006 | provenance_record_epsilon | TRAN-0001 |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

Attributes and their types constitute the second structural layer, decoupling property definitions from their concrete values. Each attribute carries an attr_name—confidence, dimension_kind, method, recorded_at in the mass-function domain; duration_seconds, end_time, exit_code, host_name in the observation domain—paired with an attr_type drawn from the XML Schema namespace: xsd:decimal for numeric measures, xsd:string for categorical labels, xsd:dateTime for temporal markers, and xsd:integer for discrete counts. This separation allows the same entity to accumulate heterogeneous properties without schema migration. Entity FOCA-0001, for example, is associated with attribute FOCA-0001 (confidence, xsd:decimal) holding value 0.223, with attribute FOCA-0002 (dimension_kind, xsd:string) holding value Dimension Kind 01, and with attribute FOCA-0004 (recorded_at, xsd:dateTime) holding value 2023-06-19T06:37:58. The value tables—val_datetime, val_decimal, val_varchar, val_int—partition storage by type, ensuring that each misc column contains only values conforming to the declared attr_type, thereby enforcing type safety at query time rather than at schema design time.

The entity itself is the conceptual container that binds attributes to their values, and it is referenced explicitly in every value row through the entity_id column. An entity may appear in multiple value tables if it possesses attributes of different types: entity FOCA-0001 appears in val_decimal with three distinct attribute associations (FOCA-0001, FOCA-0005, FOCA-0007), in val_varchar with four attribute associations (FOCA-0002, FOCA-0008, FOCA-0009, FOCA-0010), and in val_datetime with attribute FOCA-0004. Similarly, entity POLI-0001 spans val_decimal (duration_seconds = 2405.99), val_int (exit_code = 46), val_varchar (host_name = gw-12), and val_datetime (end_time = 2023-03-21T06:17:05). This multi-table value storage pattern is the operational mechanism by which the model achieves attribute-level flexibility while maintaining strict type discipline.

Subject and target, mediated by role, form the relationship layer that connects distinct entities into a directed graph. The junction table t_pignistic_transformation__pignistic_transform encodes these relationships with three columns: pignistic_id designates the subject, pignistic_transform_id designates the target, and role specifies the nature of the connection—reviewer or contributor in the observed data. Subject TRAN-0008 relates to target TRAN-0005 in the role of reviewer; subject TRAN-0006 relates to target TRAN-0003 as reviewer; subject TRAN-0005 relates to targets TRAN-0006 and TRAN-0002, the former as contributor and the latter as reviewer. This triadic structure—subject, target, role—allows a single entity to occupy multiple relational positions simultaneously, supporting complex provenance chains and accountability mappings without requiring additional tables or columns. The role column is the semantic hinge: it distinguishes between a reviewer who validates a transformed belief state and a contributor who authored it, transforming a bare edge into an auditable assertion.

The mass and pignistic transformation tables together illustrate how evidential reasoning is materialized in the model. The mass function table assigns a mass value—such as audit_trail_eta, provenance_record_epsilon, or sensor_array_gamma—to each focal element and links it to a corresponding pignistic transformation identifier (TRAN-0002, TRAN-0004, TRAN-0006). The pignistic transformation table then describes the transformation itself: TRAN-0002 carries the label telemetry belief assignment and transforms into a transformed belief state; TRAN-0004 carries diagnostic confidence matrix and transforms into a betting probability set. These transformations are not isolated; they participate in the subject-target-role graph, meaning that a transformed belief state can itself be a subject in another relationship, enabling multi-hop provenance. The identifier, attribute, value, and relationship structures described above provide the scaffolding that makes this graph queryable, auditable, and extensible without schema modification.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |