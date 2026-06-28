---
chapter_id: ch_live_requirement_under_standard_1e61fb
topic_id: 20
family: 03_directive_governance
cited_terms: ['requirement_under_standard', 'schemaorg_review_target', 'syscall_equiv_in_subsystem']
model: engine-refine
---

Governance architectures depend on deterministic entity resolution to maintain unbroken audit trails across heterogeneous policy and technical domains. Each operational object is anchored by a unique identifier—STAN-0001 for a sampling requirement, TARG-0004 for a service target, or SUBS-0003 for a syscall subsystem—that survives schema migrations and cross-referencing. These identifiers function as immutable keys, ensuring that compliance artifacts, technical dependencies, and regulatory directives can be traced without ambiguity. When a requirement such as Minimum sampling rate is mapped under standard TARG-0004, the identifier guarantees that downstream validators, automated auditors, and human reviewers reference the exact same artifact, regardless of how the underlying data model evolves or how systems are decomposed.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | TARG-0004 |
| STAN-0002 | Quality threshold | TARG-0002 |
| STAN-0003 | Provenance tracking | TARG-0004 |
| STAN-0004 | Access control policy | TARG-0002 |
| STAN-0005 | Provenance tracking | TARG-0002 |
| STAN-0006 | Access control policy | TARG-0001 |

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

Once an entity is resolved, its properties are governed by a strict attribute typing discipline that separates schema definition from runtime values. The attribute catalog—listing descriptors such as effective_date, enforcement, mandatory, and priority—declares both the semantic intent and the expected attr type, including xsd:date, xsd:string, xsd:boolean, and xsd:integer. This type-aware partitioning ensures that misc values are stored in type-safe containers: boolean flags like true or false gate mandatory compliance checks, date literals such as 2024-02-08 or 2023-09-30 anchor temporal enforcement windows, and integer thresholds like 224 or 622 define quantitative limits. By decoupling the attribute schema from its heterogeneous value payloads, the system preserves data integrity while supporting flexible, domain-specific policy expressions that can be programmatically validated.

Beyond isolated attributes, operational compliance demands explicit relationship modeling, where subject and target entities are bound by directional semantics and mediated through role assignments. A junction construct links a subject—such as a schemaorg target or a syscall definition—to a target resource, while a role field codifies the nature of the association. For instance, a subsystem may designate a PostgreSQLTable as its target with the role owner, or assign a GraphQLEndpoint the role contributor, establishing clear lines of accountability. Similarly, syscall equivalences map review cycles where entities assume the role reviewer or observer, enabling granular permission boundaries and audit-ready provenance. This triad of subject, target, and role transforms static data into a navigable policy graph that reflects actual organizational workflows rather than abstract dependencies.

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

The convergence of typed attributes, deterministic identifiers, and role-mediated relationships creates a verifiable compliance substrate. When an entity like STAN-0002 carries a priority of 4 and an effective_date of 2024-03-15, and simultaneously links to a target under standard TARG-0002 with an enforcement attribute of type xsd:string, the system can automatically evaluate temporal validity, threshold breaches, and ownership chains. Auditors can reconstruct the full provenance of a requirement—from its initial declaration through its attribute assignments and relational bindings—without relying on opaque application logic. This structured approach to attr typing, entity resolution, and role-based targeting ensures that governance policies remain machine-readable, enforceable, and resilient to structural drift.

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |