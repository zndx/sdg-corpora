---
chapter_id: ch_live_control_subclass_a8f86f
topic_id: 16
family: 03_directive_governance
cited_terms: ['control_subclass', 'control_under_framework', 'control_with_classification_tier']
model: engine-refine
---

Governance architectures rely on a disciplined taxonomy of identifiers and entities to maintain traceability across policy enforcement and risk mitigation workflows. Each operational control—whether designated as CONT-0001 for MFA enforcement or FRAM-0001 for a network firewall aligned to GDPR—receives a persistent, machine-readable identifier that anchors its lifecycle. These identifiers do not merely label static artifacts; they serve as foreign keys that bind controls to regulatory frameworks, threat models, and classification tiers. When a control such as CONT-0004, which mandates TLS 1.3, is evaluated against a network intrusion vector, the system resolves its identity through a structured relationship matrix rather than ad hoc text matching. This deterministic binding ensures that audit trails, compliance reports, and automated policy checks reference unambiguous entities, eliminating the ambiguity that typically plagues decentralized security operations.

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | GDPR |
| FRAM-0002 | Threat detection | NIST 800-53 |
| FRAM-0003 | Session timeout | HIPAA |
| FRAM-0004 | Configuration baseline | GDPR |
| FRAM-0005 | Vulnerability scan | NIST CSF |
| FRAM-0006 | Access review | COBIT |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

The expressive capacity of these entities is extended through an attr registry that decouples metadata definition from value storage. Each attr is paired with an attr type—xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively—enforcing schema discipline across heterogeneous policy domains. By separating attribute definitions from their concrete instantiations, the framework accommodates divergent classification schemes without schema migration. A control classified under NIST 800-53 may carry an effective_date of 2023-06-25, while an identical attribute applied to a HIPAA-aligned baseline records 2024-04-08, reflecting jurisdictional or operational variance. The attr type system guarantees that downstream processors can validate, index, and query these attributes without runtime coercion or type ambiguity, preserving data integrity across compliance pipelines.

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

Actual attribute values reside in dedicated value repositories, indexed by entity and attribute identifiers, and categorized by their semantic type. This misc-value architecture permits high-cardinality metadata to scale independently of the core control registry. Boolean flags such as mandatory resolve to true or false depending on the control tier, while integer fields capture priority rankings like 104 or 994, enabling quantitative risk scoring. String-valued attributes store operational directives such as Encoding 01 or Enforcement 02, alongside contextual annotations like pre-release note or audit excerpt. Because these misc values are bound to entities through explicit foreign keys, compliance officers can reconstruct the complete metadata state of any control at a given point in time, supporting both retrospective auditing and forward-looking policy simulation.

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

Control relationships are formalized through subject-target mappings that encode accountability and functional dependencies. In this model, the subject represents the originating control or policy mechanism, while the target denotes the risk vector, dependent control, or regulatory artifact it addresses. The relationship itself is qualified by a role—owner, reviewer, observer, or contributor—which dictates workflow permissions, approval chains, and reporting obligations. For instance, when CONT-0004 functions as the subject targeting a service outage mitigation path, its role as owner establishes direct responsibility, whereas a reviewer role would trigger secondary validation before policy activation. This tripartite structure transforms static control inventories into dynamic governance graphs, where impact analysis, blast radius calculations, and compliance drift detection operate on explicit relational edges rather than inferred associations.

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

Collectively, this architecture establishes a machine-actionable compliance fabric. The interplay of persistent identifiers, typed attributes, decoupled value stores, and role-qualified relationships enables organizations to model regulatory requirements, map them to technical controls, and track enforcement status across heterogeneous environments. When a framework like GDPR requires a configuration baseline, the system resolves the control through its identifier, validates its mandatory attribute, checks its effective_date against current policy windows, and verifies that the responsible role has acknowledged the target threat. Such precision reduces manual reconciliation, accelerates audit readiness, and ensures that governance decisions are grounded in verifiable, queryable data rather than institutional memory.