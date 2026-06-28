---
chapter_id: ch_live_verification_targets_artifact_20f485
topic_id: 105
family: 03_directive_governance
cited_terms: ['verification_targets_artifact', 'constraint_with_predicate', 'professional_expertise_domain']
model: engine-refine
---

Professional expertise domains constitute the primary organizational unit through which regulated organizations classify who may perform which work, in which sector, and under what service obligation. A domain such as Cybersecurity Auditor, when scoped to Manufacturing Operations and bound to Asset Valuation or Regulatory Compliance as its service type, does not merely label a job title; it establishes the jurisdictional envelope within which downstream verification, constraint enforcement, and evidentiary attribution may lawfully proceed. Forensic Accountant and Clinical Psychologist entries covering Public Infrastructure illustrate how the same sector classification can host materially different professional mandates, each with distinct compliance postures and audit expectations. Without a stable domain anchor, cross-functional reviews—whether of sensor calibration matrices or source code branches—would lack a defensible basis for assigning accountability.

Every governable object in the framework carries an identifier that survives renaming, reorganization, and successive review cycles. Identifiers such as DOMA-0001, ARTI-0002, and PRED-0003 function as durable registry keys: they permit a Compliance review cycle initiated under ARTI-0002 to be traced to the Sensor calibration matrix it targets, even when operational labels change on the shop floor or in the repository. The identifier does not encode meaning; it encodes persistence. That separation is deliberate. Meaning lives in typed attributes and in the relational roles that bind subjects to targets, while the identifier guarantees that a Data lineage audit recorded against ARTI-0003 and a contributor assignment on ARTI-0004 refer to the same logical artifact across tables, systems, and reporting periods.

Attributes and their declared attr_type supply the typed vocabulary through which entity state is recorded and validated. An entity—here, a professional expertise domain instance—may carry attr values drawn from a misc field whose interpretation is fixed by attr_type: confidence as xsd:decimal (0.863 for one Cybersecurity Auditor profile, 0.147 for another), dimension_kind and method as xsd:string ("Dimension Kind 01," "calibration record," "ja"), and recorded_at as xsd:dateTime (2024-07-30T07:07:17 through 2024-12-04T20:31:19). Partitioning values into type-specific stores is not an implementation convenience alone; it is a control mechanism. A Log retention mandate cannot be satisfied by a string where a timestamp is required, and an Authentication requirement evaluated through authRequirement predicates fails closed when unitSpecification or checksumValidation types are misapplied. Attribute typing thus converts informal metadata into auditable facts.

**t_professional_expertise_domain_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0004 | 2024-07-30T07:07:17 |
| DOMA-0002 | DOMA-0002 | DOMA-0004 | 2024-12-04T20:31:19 |
| DOMA-0003 | DOMA-0003 | DOMA-0004 | 2024-05-12T06:41:36 |
| DOMA-0004 | DOMA-0004 | DOMA-0004 | 2024-07-23T14:51:29 |
| DOMA-0005 | DOMA-0005 | DOMA-0004 | 2023-05-19T17:35:21 |
| DOMA-0006 | DOMA-0006 | DOMA-0004 | 2023-07-26T00:07:35 |
| DOMA-0007 | DOMA-0007 | DOMA-0004 | 2023-03-21T08:57:17 |
| DOMA-0008 | DOMA-0008 | DOMA-0004 | 2023-06-16T10:20:06 |

**t_professional_expertise_domain_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0001 | 0.863 |
| DOMA-0002 | DOMA-0001 | DOMA-0005 | 628.37 |
| DOMA-0003 | DOMA-0001 | DOMA-0007 | 315.52 |
| DOMA-0004 | DOMA-0002 | DOMA-0001 | 0.147 |
| DOMA-0005 | DOMA-0002 | DOMA-0005 | 438.62 |
| DOMA-0006 | DOMA-0002 | DOMA-0007 | 381.17 |
| DOMA-0007 | DOMA-0003 | DOMA-0001 | 0.471 |
| DOMA-0008 | DOMA-0003 | DOMA-0005 | 940.55 |

Industry sector and service type complete the domain record by situating professional expertise within market and regulatory context. Manufacturing Operations, Commercial Real Estate, and Public Infrastructure are not decorative tags; they determine which constraint bundles apply, which verification regimes are mandatory, and which predicate families—authRequirement, unitSpecification, checksumValidation—govern acceptable evidence. A Cybersecurity Auditor providing Regulatory Compliance in Commercial Real Estate operates under a different evidentiary standard than the same professional designation delivering Asset Valuation in Manufacturing Operations, even when both share decimal confidence scores and recorded_at stamps. Service type further refines obligation: Contract Drafting imposes documentary lineage requirements distinct from Asset Valuation’s valuation-chain proofs. Together, sector and service type prevent generic “expert” designations from collapsing into unenforceable generalities.

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

Relational governance in the framework is expressed through subject–target bindings qualified by role. In verification targeting, the subject (a verification event such as ARTI-0005’s Compliance review cycle) links to a target artifact—the Sensor calibration matrix or Source code branch—while role distinguishes reviewer from owner from contributor. The same pattern holds for constraints: a subject constraint (e.g., PRED-0005’s Quality assurance protocol) associates with a target predicate (authRequirement under PRED-0003), with roles of owner, observer, or contributor specifying whether the party must satisfy, monitor, or merely inform the obligation. Max latency threshold and Quality assurance protocol constraints do not float independently; they acquire force only when bound to concrete predicates and staffed through named roles. This triad—subject, target, role—is the operational grammar of accountability.

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

In practice, these constructs interlock across the compliance lifecycle. A professional expertise domain (entity DOMA-0001) accumulates typed attributes (confidence, recorded_at) while its covers_sector and provides_service_type fields determine which verification targets and constraint predicates enter scope. Verification against a Sensor calibration matrix proceeds under assigned roles; constraint satisfaction flows through predicate evaluation—Authentication requirement via authRequirement, checksum validation for integrity-sensitive artifacts. Misc values timestamp when expertise was recorded; identifiers ensure that a contributor on ARTI-0004 and a reviewer on ARTI-0002 refer to distinct, traceable participation in the same underlying compliance program. The framework’s density is its strength: sector and service type set jurisdiction, attr and attr_type preserve evidentiary form, subject–target–role bindings allocate duty, and identifiers hold the thread from initial domain registration through successive review cycles and lineage audits.

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

**t_professional_expertise_domain**

| id | professional_expertise_domain | covers_sector | provides_service_type |
| --- | --- | --- | --- |
| DOMA-0001 | Cybersecurity Auditor | Manufacturing Operations | Asset Valuation |
| DOMA-0002 | Cybersecurity Auditor | Commercial Real Estate | Regulatory Compliance |
| DOMA-0003 | Forensic Accountant | Public Infrastructure | Contract Drafting |
| DOMA-0004 | Clinical Psychologist | Public Infrastructure | Asset Valuation |
| DOMA-0005 | Data Architect | Healthcare Delivery | Regulatory Compliance |
| DOMA-0006 | Data Architect | Manufacturing Operations | Clinical Diagnosis |
| DOMA-0007 | Forensic Accountant | Manufacturing Operations | Network Penetration Testing |
| DOMA-0008 | Structural Engineer | Financial Services | Asset Valuation |

**t_professional_expertise_domain_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DOMA-0001 | confidence | xsd:decimal |
| DOMA-0002 | dimension_kind | xsd:string |
| DOMA-0003 | method | xsd:string |
| DOMA-0004 | recorded_at | xsd:dateTime |
| DOMA-0005 | uncertainty | xsd:decimal |
| DOMA-0006 | unit | xsd:string |
| DOMA-0007 | value | xsd:decimal |
| DOMA-0008 | encoding | xsd:string |

**t_professional_expertise_domain_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0002 | Dimension Kind 01 |
| DOMA-0002 | DOMA-0001 | DOMA-0008 | Encoding 02 |
| DOMA-0003 | DOMA-0001 | DOMA-0009 | calibration record |
| DOMA-0004 | DOMA-0001 | DOMA-0010 | ja |
| DOMA-0005 | DOMA-0001 | DOMA-0003 | manual |
| DOMA-0006 | DOMA-0001 | DOMA-0006 | mg/L |
| DOMA-0007 | DOMA-0002 | DOMA-0002 | Dimension Kind 07 |
| DOMA-0008 | DOMA-0002 | DOMA-0008 | Encoding 08 |