---
chapter_id: ch_live_labrun_with_protocol_74b6c2
topic_id: 27
family: 02_observation_measurement
cited_terms: ['labrun_with_protocol', 'verification_targets_artifact', 'schemaorg_creativework_author']
model: engine-refine
---

Identifiers serve as the immutable anchors of provenance and traceability across laboratory workflows and verification processes, each encoding a semantic prefix that signals its domain of origin. Protocol records carry identifiers such as PROT-0001 through PROT-0004, while artifact and author records use ARTI- and AUTH- prefixes respectively, enabling unambiguous cross-referencing without ambiguity. A laboratory run identified as MassSpec_LC_MS may be linked to protocol AUTH-0002, while the same run type Nanopore_FC_Nine maps to AUTH-0006, demonstrating how a single identifier can participate in multiple relational contexts—both as a primary key and as a foreign key referencing an author or creative work. The identifier column thus functions as the universal join mechanism, binding together disparate conceptual domains: experimental procedures, compliance reviews, and documentation artifacts.

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | AUTH-0002 |
| PROT-0002 | Nanopore_FC_Nine | AUTH-0006 |
| PROT-0003 | Nanopore_FC_Nine | AUTH-0006 |
| PROT-0004 | MassSpec_LC_MS | AUTH-0001 |
| PROT-0005 | Microbiome_16S_Seq | AUTH-0005 |
| PROT-0006 | Proteomics_ICP_MS | AUTH-0002 |

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | PROT-0006 |
| AUTH-0002 | Provenance_Trace_Report | PROT-0005 |
| AUTH-0003 | API_Reference_Guide | PROT-0006 |
| AUTH-0004 | Provenance_Trace_Report | PROT-0004 |
| AUTH-0005 | Sensor_Network_Spec | PROT-0006 |
| AUTH-0006 | Catalog_Metadata_Index | PROT-0005 |
| AUTH-0007 | Telemetry_Config_Spec | PROT-0003 |
| AUTH-0008 | Catalog_Metadata_Index | PROT-0005 |

Attributes and their associated types constitute the schema-level vocabulary through which entities are described in a type-safe manner. Protocol attributes such as duration_seconds, end_time, exit_code, and host_name are each declared with an explicit type—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—ensuring that downstream consumers can interpret values without schema inference. Similarly, author and creative work attributes include checksum, created_date, identifier, and license, typed as xsd:string, xsd:date, cco:DesignativeICE, and xsd:string. This separation of attribute definition from attribute value is deliberate: the attribute registry establishes the contract, while the value tables fulfill it. The type system is not merely declarative; it governs which value table receives a given datum, routing decimal values like 301.25, 4042.33, 6125.88, and 1565.69 to the decimal store, integer values such as 497, 434, 538, and 309 to the integer store, and datetime values including 2023-11-19T15:13:31 and 2023-04-19T03:43:36 to the datetime store.

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

Entities represent the concrete instances to which attributes are bound, and the entity_id column in each value table establishes the many-to-many relationship between entities and their typed properties. An entity identified as PROT-0001 may simultaneously hold a duration of 301.25 seconds, an end time of 2023-11-19T15:13:31, an exit code of 497, and a host name of node-b14, with each value residing in its respective typed table but unified through the shared entity_id. This normalized structure permits heterogeneous attribute sets across entities without schema drift: one entity may carry a checksum value of 7b14de08 and a license of GPL-3.0, while another carries a created_date of 2024-12-04 and an integer metric of 393. The entity concept is thus not a table but a logical construct—a vertex in a property graph whose edges are materialized across multiple value tables.

The misc column, appearing in every value table, captures the actual datum in a type-appropriate representation, whether that be a decimal literal, an ISO 8601 datetime, an integer, or a free-form string such as closeout, running, Log Level 02, gid://svc/77, or on-prem-dc1. This column is the sole carrier of business meaning; all other columns in the value tables serve structural purposes, linking the misc value back to its entity and its attribute definition. The design ensures that the value store is agnostic to the domain of the data it holds—whether it records a sensor calibration duration, a compliance review timestamp, or a software license identifier—while the attr_name and attr_type columns in the attribute registry provide the semantic context necessary for interpretation.

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Roles, subjects, and targets form the relational fabric that connects verification processes to the artifacts they govern. In the verification-target mapping, a verification record such as ARTI-0002 acts as the subject, pointing to a target artifact like ARTI-0003 through a relationship mediated by a role—reviewer, owner, or contributor. The same target artifact ARTI-0001 may appear under multiple subjects: ARTI-0005 assigns it the role of reviewer in one context and contributor in another, demonstrating that roles are not intrinsic properties of artifacts but contextual assignments that change depending on the verification process. This triad—subject, target, role—mirrors the classic subject-object-action pattern found in access control and provenance models, where the role column encodes the nature of the relationship rather than a static classification.

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |

The practical consequence of this architecture is that provenance can be reconstructed at any granularity. One can trace a laboratory run (MassSpec_LC_MS) to its governing protocol (AUTH-0002), then to the protocol's attributes (duration_seconds = 301.25, host_name = node-b14), then to the creative work (API_Reference_Guide) that documents it, and finally to the verification cycle (Compliance review cycle) that certifies it, with each step mediated by identifiers and roles. The separation of attribute definitions from their values, and of entities from their relationships, permits schema evolution without data migration: new attributes can be declared in the registry and populated in the value tables without altering existing records. This is not merely a database design choice but a governance mechanism, ensuring that every datum carries its type, its provenance, and its contextual role within the verification chain.