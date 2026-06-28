---
chapter_id: ch_live_iso27001_clause_subclass_7bb1b3
topic_id: 101
family: 07_long_tail
cited_terms: ['iso27001_clause_subclass', 'directive_traces_to_requirement', 'evidence_with_mass_function']
model: engine-refine
---

COMPLIANCE REQUIREMENTS AND EVIDENCE MANAGEMENT FRAMEWORK

The foundation of any governance data model rests on the disciplined use of identifiers to anchor every entity, attribute, and relationship within a traceable namespace. Identifiers such as CLAU-0001 and REQU-0001 serve as the immutable keys that bind clauses, requirements, and evidence records across the system, ensuring that every reference can be resolved unambiguously. Within this architecture, an entity represents a discrete governance object—whether an ISO 27001 clause subclass, a regulatory requirement, or an evidence artifact—and each entity carries a set of attributes that describe its properties. Attributes such as effective_date, enforcement, mandatory, and priority provide the metadata necessary to evaluate compliance posture, while their associated types—xsd:date, xsd:string, xsd:boolean, and xsd:integer—enforce schema-level constraints that prevent semantic drift. A requirement like REQU-0001, traced to the directive ISO 27001:2022, carries an effective_date of 2023-08-06 and a mandatory flag set to false, whereas REQU-0003, linked to the EU AI Act Article 9, carries an effective_date of 2025-05-18 and a mandatory flag set to true, illustrating how attribute values encode the temporal and regulatory weight of each requirement.

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

The separation of attribute values into type-specific value tables—boolean, date, integer, and varchar—reflects a deliberate normalization strategy that preserves type safety while supporting the heterogeneous nature of compliance metadata. Integer attributes such as priority and auxiliary metrics capture quantitative assessments: REQU-0001 carries a priority value of 4 and an auxiliary metric of 132, while REQU-002 carries a priority of 4 and a metric of 453, enabling downstream sorting and threshold-based alerting. Varchar attributes store free-form descriptors such as Encoding 01, Enforcement 02, nightly summary, and ja, providing the flexibility needed for policy-specific annotations that resist rigid typing. This typed-value decomposition ensures that queries can be optimized per type, that validation rules can be applied at ingestion, and that the data model remains extensible as new attribute types emerge across evolving regulatory regimes.

Relationships between governance objects are expressed through subject-target-role triples that encode the directionality and nature of each linkage. In the clause-subclass mapping, a subject such as CLAU-0004 relates to a target clause CLAU-0006 through a role of contributor, while CLAU-0001 relates to CLAU-0003 through a role of reviewer, and CLAU-0004 relates to CLAU-0006 through a role of owner. These role-labeled edges transform a flat collection of clauses into a structured dependency graph, making it possible to trace accountability, identify review chains, and detect circular dependencies. The subject and target columns in the relationship table form foreign keys back to the clause-subclass entity, ensuring referential integrity across the graph, while the role column captures the semantic context of the connection—whether the subject is reviewing, contributing to, or owning the target clause.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

Evidence management extends the framework beyond static requirements into the domain of verifiable proof. The evidence table associates artifacts such as provenance trace log, calibration certificate, telemetry dump, and signal capture data with specific requirements through a mass function column that references requirement identifiers like REQU-0001, REQU-0006, and REQU-0004. Each evidence record carries a dimension kind—pressure, temperature, or mass—that classifies the physical or logical domain of the evidence, and a method—automated, inferred, or hybrid—that describes how the evidence was collected or derived. An automated calibration certificate linked to REQU-0006 under the temperature dimension carries a different evidentiary weight than an inferred telemetry dump linked to REQU-0004 under the mass dimension, and the method classification enables auditors to assess the reliability of each evidence item based on its collection approach. This structure supports a formal evidentiary reasoning framework where mass functions quantify the degree of support that each artifact provides toward satisfying a given requirement, enabling aggregate confidence calculations across heterogeneous evidence sources.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | REQU-0001 | pressure | automated |
| FUNC-0002 | calibration certificate | REQU-0006 | temperature | automated |
| FUNC-0003 | telemetry dump | REQU-0004 | mass | inferred |
| FUNC-0004 | signal capture data | REQU-0006 | mass | hybrid |
| FUNC-0005 | system event record | REQU-0005 | length | automated |