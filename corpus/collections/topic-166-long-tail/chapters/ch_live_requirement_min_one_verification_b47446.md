---
chapter_id: ch_live_requirement_min_one_verification_b47446
topic_id: 166
family: 03_directive_governance
cited_terms: ['requirement_min_one_verification', 'claim_supported_by_evidence', 'kernelhook_observes_syscall_xref']
model: engine-refine
---

In a rigorous compliance architecture, the integrity of an audit trail relies on the precise instantiation of entities, each anchored by a globally unique identifier that serves as the immutable reference point for downstream verification. Consider the requirement registry, where records such as `VERI-0001` and `VERI-0002` codify specific operational mandates—ranging from a strict latency threshold of 50ms to the necessity of daily backup frequencies. These identifiers are not merely labels; they function as the primary keys that bind disparate data points into a coherent governance structure. When an entity is instantiated, it carries a lineage that can be traced through cross-referential tables, ensuring that every assertion, such as the claim regarding "Model accuracy benchmark" (`EVID-0001`), is inextricably linked to its supporting evidence. The relational integrity is maintained through the `entity_id` foreign key, which maps granular attribute values back to their parent records, thereby preserving the contextual fidelity of the compliance posture.

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | EVID-0004 |
| VERI-0002 | Audit log completeness | EVID-0001 |
| VERI-0003 | Backup frequency daily | EVID-0002 |
| VERI-0004 | Backup frequency daily | EVID-0002 |
| VERI-0005 | Schema validation strict | EVID-0004 |
| VERI-0006 | PII masking rule | EVID-0006 |

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

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

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

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | VERI-0003 |
| EVID-0002 | Server latency threshold breach | VERI-0001 |
| EVID-0003 | Server latency threshold breach | VERI-0003 |
| EVID-0004 | Emissions compliance record | VERI-0003 |
| EVID-0005 | Emissions compliance record | VERI-0003 |
| EVID-0006 | Batch ingestion delay anomaly | VERI-0003 |

**t_kernelhook_observes_syscall_xref**

| id | kernelhook | created_date | owner |
| --- | --- | --- | --- |
| XREF-0001 | bcc_tcpconnect | 2025-01-25 | sre |
| XREF-0002 | bcc_tcpconnect | 2023-03-30 | ml-infra |
| XREF-0003 | tracee_fs_watch | 2024-11-21 | platform-team |
| XREF-0004 | bcc_tcpconnect | 2025-04-07 | analytics |
| XREF-0005 | tracee_fs_watch | 2024-03-25 | governance |

The governance framework further necessitates a robust mechanism for defining and classifying attributes, decoupling the semantic definition of a property from its concrete value. This is achieved through a dedicated attribute registry that catalogs metadata such as `attr_name` and `attr_type`, establishing a strict schema for validation. For instance, a requirement might define an attribute named `effective_date` constrained to the `xsd:date` type, or `enforcement` typed as `xsd:string`. This type system ensures data homogeneity across the enterprise; boolean constraints like `mandatory` are strictly enforced as `xsd:boolean`, while quantitative metrics, such as the priority levels assigned to specific claims, are stored as `xsd:integer`. By segregating the attribute definitions from their values, the system allows for dynamic schema evolution without compromising the structural integrity of historical records.

At the operational level, the actual values of these attributes—categorized under the `misc` designation—are persisted in type-specific repositories, ensuring that data is stored in its most efficient and semantically appropriate format. A boolean attribute like `mandatory` might resolve to a definitive `false` or `true` within the entity's context, while temporal attributes capture precise moments in time, such as `2023-09-25` or the granular timestamp `2024-08-09T04:01:38`. Quantitative evidence is equally rigorous; a claim supported by evidence might carry a decimal confidence score of `0.768` or a dimension value of `631.25`. This granular storage model allows the framework to handle a diverse array of data types, from simple strings like "Encoding 01" to complex numerical benchmarks, all while maintaining a strict foreign-key relationship to the parent entity and its defined attribute schema.

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Beyond the static definition of requirements and evidence, the operational lifecycle of the system is governed by strict accountability and temporal tracking, particularly for low-level system observability. Kernel hooks and system call intercepts, such as `bcc_tcpconnect` or `tracee_fs_watch`, are registered with a specific `created_date` to establish their provenance and lifecycle boundaries. For example, a hook instantiated on `2025-01-25` represents a distinct operational event, separate from one created on `2023-03-30`. Crucially, each of these operational artifacts is assigned an `owner`, designating the responsible governance entity—be it the `sre` team, `ml-infra`, or `platform-team`. This ownership model ensures that every system intervention and compliance assertion is traceable to a specific organizational unit, closing the loop on auditability and enforcing clear lines of responsibility within the technical infrastructure.