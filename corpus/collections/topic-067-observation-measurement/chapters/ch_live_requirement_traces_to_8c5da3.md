---
chapter_id: ch_live_requirement_traces_to_8c5da3
topic_id: 67
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'labrun_min_one_sample', 'policy_subclass']
model: engine-refine
---

Within compliance and governance architectures, the distinction between an entity and its attributes forms the structural backbone of auditability. An entity—whether a laboratory sample identified as SAMP-0001, a policy subclass such as POLI-0001, or a requirement trace designated TRAC-0001—represents a discrete, addressable object within the system. Each entity receives a stable identifier, a human-readable key like SEQ-EXP-99 or PROTOCOL-V3, that persists across all references and joins. Attributes, by contrast, are not embedded as fixed columns but are declared independently through an attribute registry: the name `duration_seconds` paired with the type `xsd:decimal`, or `end_time` mapped to `xsd:dateTime`, or `enforcement` recorded as `xsd:string`. This separation of attribute definition from attribute value permits schema evolution without migration, allows heterogeneous value types to coexist under a single entity, and ensures that every measurement—whether the decimal value 4946.17 associated with entity SAMP-0002, the integer 670 bound to the same entity, or the string `edge-03`—is traceable to its declared type and semantic name.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | TRAC-0003 |
| POLI-0002 | Provenance Directive | TRAC-0002 |
| POLI-0003 | Data Retention Policy | TRAC-0003 |
| POLI-0004 | Metadata Governance | TRAC-0006 |
| POLI-0005 | Telemetry Privacy Standard | TRAC-0003 |
| POLI-0006 | Provenance Directive | TRAC-0002 |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

The value tables implement this separation through a multi-typed entity-attribute-value pattern. Rather than storing all values as strings, the system distributes them across type-specific tables: `t_labrun_min_one_sample_val_datetime` holds timestamps such as `2024-08-01T16:02:07` and `2023-01-19T08:28:14`; `t_labrun_min_one_sample_val_decimal` stores numeric measurements like 2021.10 and 5150.87; `t_labrun_min_one_sample_val_int` captures integer codes including 230, 435, and 129; and `t_labrun_min_one_sample_val_varchar` preserves free-form text such as `Log Level 02`, `closeout`, and `complete`. Each value row carries an `entity_id` that anchors it to the subject entity, an `attr_id` that resolves to the attribute definition, and a `value` column typed to the schema. This design guarantees type safety at query time while preserving the flexibility to assign any combination of attributes to any entity—entity SAMP-0001, for instance, carries a duration of 2021.10, an end time of `2024-08-01T16:02:07`, an exit code of 230, and a host of `edge-03`, all resolved through distinct value tables but unified under a single entity key.

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

Policy governance introduces a parallel attribute-value structure, applied not to laboratory samples but to regulatory instruments. The `t_policy_subclass` table declares policies such as the Telemetry Privacy Standard (POLI-0001), the Provenance Directive (POLI-0002), and the Data Retention Policy (POLI-0003), each governing one or more requirement traces—POLI-0001 governs TRAC-0003, POLI-0002 governs TRAC-0002, POLI-0003 governs TRAC-0003. Their attributes follow the same EAV pattern: `effective_date` typed as `xsd:date` yields values like 2023-01-31 and 2024-06-17; `enforcement` as `xsd:string` carries `Enforcement 02`; `mandatory` as `xsd:boolean` resolves to true or false; and `priority` as `xsd:integer` holds values such as 1, 3, 740, and 958. The boolean table stores POLI-0001 as false and POLI-0002 as true, indicating that the Telemetry Privacy Standard is not mandatory while the Provenance Directive is. The integer table assigns POLI-0001 a priority of 1 and POLI-0003 a priority of 3, establishing a relative ordering of policy weight.

Requirement traceability operates through a tripartite relationship that binds a subject to a target via a role. The `t_requirement_traces_to` table enumerates requirements—Network Segmentation Rule (TRAC-0001), Access Control Mandate (TRAC-0002), Privacy Compliance Requirement (TRAC-0003 and TRAC-0004)—while `t_requirement_traces_to_traces_to` lists the standards to which they map: HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, and ISO 27001 Control. The join table `t_requirement_traces_to__traces_to` then specifies the nature of each linkage. TRAC-0001 traces to TRAC-0004 with the role `owner`, meaning the Network Segmentation Rule owns its dependency on the Privacy Compliance Requirement; TRAC-0004 traces to TRAC-0004 with the role `reviewer`, indicating that the Privacy Compliance Requirement reviews itself; and TRAC-0004 also appears as a contributor to TRAC-0001. These roles—owner, reviewer, contributor—encode the direction and character of compliance dependencies, transforming a flat list of requirements into a navigable graph of accountability.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

The combined effect of these structures is a system in which every compliance artifact can be queried along three orthogonal axes: what it is (entity and identifier), what properties it has (attribute and value), and how it relates to other artifacts (subject, target, and role). A compliance auditor seeking to verify that the Telemetry Privacy Standard (POLI-0001), effective 2023-01-31 and non-mandatory, governs the Privacy Compliance Requirement (TRAC-0004) which in turn is owned by the Network Segmentation Rule (TRAC-0001), can traverse from policy to requirement to trace without schema changes or data duplication. Similarly, a laboratory operations manager can retrieve all attributes of sample SAMP-0001—its duration of 2021.10 seconds, its end time of `2024-08-01T16:02:07`, its exit code of 230, and its host `edge-03`—from four separate value tables, each typed to the attribute definition. This architecture enforces data integrity through type discipline, supports unlimited attribute growth, and preserves the full provenance of every compliance decision.