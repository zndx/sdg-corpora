---
chapter_id: ch_live_subclass_to_independent_continuant_a2ab5e
topic_id: 191
family: 01_foundation
cited_terms: ['subclass_to_independent_continuant', 'transformation_associated_with_agent', 'requirement_min_one_verification']
model: engine-refine
---

In a governed information model, every record that must be audited, compared across time, or bound to policy is first stabilized through an identifier—a durable key that survives renaming, relocation, and reclassification. Identifiers such as CONT-0001, AGEN-0003, and VERI-0002 do not themselves describe the world; they anchor it. An entity is the thing those keys denote: an independent continuant that persists through change (Audit Log Stream 5, Firewall Appliance 7, Server Rack 14A), a transformation episode (Archive Export Run, Model Retraining Cycle), or a verifiable requirement (Latency threshold 50ms, Backup frequency daily). Operational and compliance value arises because identifiers let distinct assertions—attribute values, associations, verification linkages—refer to the same underlying object without ambiguity, even when human-readable labels collide or evolve.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | CONT-0004 |
| VERI-0002 | Audit log completeness | CONT-0001 |
| VERI-0003 | Backup frequency daily | CONT-0002 |
| VERI-0004 | Backup frequency daily | CONT-0002 |
| VERI-0005 | Schema validation strict | CONT-0004 |
| VERI-0006 | PII masking rule | CONT-0006 |

Attributes declare what may be said about an entity, and attr_type constrains how it may be said. An attr is not a value but a named slot in the model: location, owner, mandatory, effective_date. Its attr_type fixes the semantic and storage contract—xsd:string for free text such as on-prem-dc1 or Tags 04, cco:Person when owner must resolve to a person (here, sre), xsd:boolean for enforceable flags, xsd:date for temporal bounds (2023-09-25 through 2025-02-12), xsd:integer for ordered priority (1, 285, 542). Separating attr from attr_type permits a single governance catalog to govern validation, reporting, and interchange: auditors know that mandatory on VERI-0002 is a boolean assertion subject to typed tables, while enforcement on the same requirement remains a string governed elsewhere. Typed attr_type partitions the value plane so that misc—the concrete assertion stored against entity and attr—lands in the correct representation without coercion errors.

The misc column, read in context, is the evidentiary payload: the fact recorded at assertion time. Values are never free-floating; each misc entry is keyed by the pairing of entity_id and attr_id, so CONT-0001’s location is on-prem-dc1, its name is Name 02, and its owner is sre, each line independently auditable. Where several requirements share an attribute definition—as when VERI-0001 through VERI-0004 all carry a mandatory attr typed xsd:boolean—the same attr_id (VERI-0003) binds parallel misc rows whose values diverge (false, true, false, false), exposing policy heterogeneity that a single global default would conceal. Likewise, effective_date values on VERI-0001–VERI-0004 establish non-overlapping or staggered enforcement windows without altering the requirement’s identity, and integer misc on priority distinguishes low-severity VERI-0001 (1) from VERI-0002 (285). In practice, misc is what investigators query; identifier, entity, attr, and attr_type are what make that query legible and defensible.

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

Relational assertions extend the same discipline beyond scalar properties through subject, target, and role. A subject is the entity that initiates or bears the relationship in the modeled direction; a target is the entity at the other pole. In transformation–agent association, subject transformation_id (e.g., AGEN-0006, AGEN-0007) links to target was_associated_with_id (AGEN-0001, AGEN-0002, AGEN-0005) not as an undifferentiated edge but under role: contributor, reviewer, observer. Thus Model Retraining Cycle and Sensor Calibration Pass may both associate with Senior Data Engineer, yet AGEN-0003 as observer and AGEN-0004 as contributor impose different accountability traces—who may alter artifacts versus who may only witness execution. The parallel was_associated_with surface (GitHub CI Pipeline, Docker Container, Senior Data Engineer) supplies the human- or system-meaningful target label while identifier columns preserve join integrity across revisions.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

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

Verification closes the loop between requirements and the entities that substantiate them. Each requirement carries its own identifier and attr scaffold—effective_date, enforcement, mandatory, priority—while verified_by points to the continuant or stream that supplies evidence: Server Rack 14A (CONT-0004) for latency threshold, Audit Log Stream 5 (CONT-0001) for audit log completeness, repeated Audit Log Stream 5 rows for backup frequency attestations. Identifier stability here matters twice: the requirement VERI-0003 and VERI-0004 share the text Backup frequency daily yet remain distinct obligations with distinct effective_date and priority misc; CONT-0002’s repeated appearance as verifier signals a single trusted observability source applied across controls. Governance frameworks that treat attr, attr_type, entity, identifier, misc, role, subject, and target as first-class constructs can therefore reconstruct not only what was required and what was true at assertion time, but who or what stood in which role, and through which typed channel the claim was recorded—conditions necessary for traceable compliance, change control, and post-incident reconstruction without conflating names, values, and relationships.

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |