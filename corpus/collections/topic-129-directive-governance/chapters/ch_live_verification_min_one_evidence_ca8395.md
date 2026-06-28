---
chapter_id: ch_live_verification_min_one_evidence_ca8395
topic_id: 129
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence', 'gdpr_data_subject_right', 'kernel_event_with_pid']
model: engine-refine
---

In governed information systems, the **identifier** is the durable handle by which every record remains addressable across audits, lineage traces, and policy enforcement without ambiguity. Identifiers such as EVID-0001, RIGH-0003, and PID-0002 function as stable keys: they survive renaming of human-readable labels, schema migration, and cross-system federation. Their importance is procedural as much as technical. When an ISO27001 Compliance Audit is recorded under EVID-0001 and shown to produce PID-0002, or when the Right to Object under RIGH-0003 is tied to EVID-0002, investigators and automated validators resolve those references unambiguously. Without identifiers, evidence chains fracture at the first export, merge, or jurisdictional handoff.

An **entity** is the governed object those identifiers denote: a verification run, a data-subject right, a kernel event, or any other unit that must be described, compared, and retained as a whole. Entity identity is intentionally separate from the facts asserted about it. EVID-0001 may denote a single ISO27001 Compliance Audit, yet the same entity identifier appears repeatedly in value stores as entity_id, because one verification run simultaneously carries duration_seconds, end_time, exit_code, and host_name. Likewise RIGH-0001, RIGH-0002, RIGH-0003, and RIGH-0004 each denote a distinct entitlement—Right to Withdraw Consent, California CCPA, Right to Object, Right to Lodge Complaint—whose operative characteristics are assembled from many attribute bindings rather than from a single wide row. Partitioning identity from assertion allows the registry to grow new descriptive dimensions without rewriting historical records.

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | Right to Withdraw Consent | EVID-0005 |
| RIGH-0002 | California CCPA | EVID-0005 |
| RIGH-0003 | Right to Object | EVID-0002 |
| RIGH-0004 | Right to Lodge Complaint | EVID-0006 |
| RIGH-0005 | Right to Automated Decisions | EVID-0002 |
| RIGH-0006 | Right to Withdraw Consent | EVID-0006 |

**t_kernel_event_with_pid**

| id | kernel |
| --- | --- |
| PID-0001 | Darwin 22.4.0 |
| PID-0002 | Arch 2023.11 |
| PID-0003 | Ubuntu 22.04 |
| PID-0004 | Alpine 6.1.12 |
| PID-0005 | Red Hat 8.6 |
| PID-0006 | CentOS 7.9 |

**Attr** names the dimension along which an entity is characterised; **attr_type** constrains how that dimension may legally be populated and compared. Attribute definitions are typed contracts. duration_seconds is declared xsd:decimal, end_time xsd:dateTime, exit_code xsd:integer, host_name xsd:string; for rights, effective_date is xsd:date, mandatory xsd:boolean, priority xsd:integer. The type governs storage partition, validation, and evidentiary admissibility: a decimal duration of 2280.75 seconds cannot be coerced into a datetime field, and a boolean mandatory flag cannot silently absorb a string such as Enforcement 02. Typed separation is why end_time instances—2023-07-04T07:08:55 on EVID-0001, 2025-01-31T12:45:17 where entity_id again references EVID-0001—reside apart from decimal durations (2844.65 under EVID-0002, 5144.39 under EVID-0004) and integer exit codes (414 and 360 on one run, 47 and 492 across paired entities). Attribute identity (attr_id) further disambiguates when several attributes share a name across domains or when lineage must prove which definition governed a value at capture time.

The **misc** value is the instantiated fact: the only column whose contents are intentionally heterogeneous in meaning while homogeneous in role. misc holds what was true at assertion time—node-a01 as host_name, Log Level 02, review, failed as operational qualifiers, true or false for mandatory, priority 5 versus 122, effective_date 2025-05-21 against 2023-03-03. Storing values in misc within type-specialised tables preserves audit integrity: comparators operate on xsd:integer exit_code 414 without parsing varchar debris, and datetime ordering applies cleanly to 2025-03-23T07:51:24. In compliance practice, misc is the evidential payload; attr and attr_type are the dictionary; entity and identifier are the filing coordinates. A failed host_name on EVID-0001 and a mandatory false on RIGH-0003 are both misc, yet they answer different governance questions because their attr bindings differ.

Directed associations introduce **subject**, **target**, and **role** as the vocabulary of relationship, not description. Where entities merely carry attributes, subjects and targets participate in typed edges whose semantics must be explicit for accountability graphs to compile. A kernel event identified as PID-0001 (Darwin 22.4.0) links through associations in which kernel_id acts as subject and with_process_id_id as target: PID-0002 paired with PID-0005 under role owner, PID-0003 with PID-0002 under owner, while PID-0004 and PID-0006 associate to PID-0005 as observer. Role distinguishes entitlement from observation—owner versus observer—so the same target (PID-0005) may appear in multiple edges without collapsing distinct duties. Process identifiers 128, 128, 24576, and 8192 further ground those abstractions in runtime fact. Subjects initiate or bear obligation; targets receive linkage or scope; role qualifies the edge so downstream policy engines do not treat an observer attachment as ownership.

**t_kernel_event_with_pid_with_process_id**

| id | with_process_id |
| --- | --- |
| PID-0001 | 128 |
| PID-0002 | 128 |
| PID-0003 | 24576 |
| PID-0004 | 8192 |
| PID-0005 | 1024 |
| PID-0006 | 128 |

**t_kernel_event_with_pid__with_process_id**

| id | kernel_id | with_process_id_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0005 | owner |
| PID-0002 | PID-0003 | PID-0002 | owner |
| PID-0003 | PID-0005 | PID-0005 | observer |
| PID-0004 | PID-0006 | PID-0005 | observer |
| PID-0005 | PID-0001 | PID-0005 | observer |
| PID-0006 | PID-0005 | PID-0001 | owner |
| PID-0007 | PID-0003 | PID-0001 | reviewer |
| PID-0008 | PID-0003 | PID-0004 | observer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role implement a layered governance model in which definitions stay stable, facts stay typed, and relationships stay explicit. Verifications produce evidence (EVID-0003 yielding PID-0003 from a Cryptographic Signature Check; EVID-0004 and EVID-0001 both yielding PID-0001 from distinct controls) while rights grant data-subject authority back into the evidence layer (RIGH-0001 and RIGH-0002 both granting EVID-0005; RIGH-0004 granting EVID-0006). Controllers query by identifier, validate by attr_type, reconstruct narratives by joining entity to misc, and reconstruct authority and lineage by traversing subject–target–role paths. The architecture rewards discipline: each term names a distinct contractual job, and conflating them—treating a role as an attribute, or an identifier as a value—breaks the very traceability the framework exists to guarantee.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | PID-0002 |
| EVID-0002 | Data Lineage Trace | PID-0001 |
| EVID-0003 | Cryptographic Signature Check | PID-0003 |
| EVID-0004 | Schema Migration Validation | PID-0001 |
| EVID-0005 | Data Lineage Trace | PID-0002 |
| EVID-0006 | Schema Migration Validation | PID-0003 |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |