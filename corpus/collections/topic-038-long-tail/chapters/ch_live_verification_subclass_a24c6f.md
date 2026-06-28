---
chapter_id: ch_live_verification_subclass_a24c6f
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'constraint_with_violation_consequence', 'syscall_only_in_kernel_subsystem']
model: engine-refine
---

In governed verification and compliance systems, stable identifiers anchor every auditable fact to a durable record that survives reclassification, subsystem migration, and cross-reference during enforcement review. An identifier such as VERI-0001 denotes a compliance renewal verification activity; CONS-0001 names a schema validation rule whose violation triggers experiment halt; SUBS-0001 registers the read syscall within the namespaces kernel subsystem. These keys are not display labels—they are the canonical handles by which constraints bind to verification subclasses, by which attribute payloads attach to the correct subject, and by which temporal and procedural lineage may be reconstructed without ambiguity. Where the same identifier recurs across attribute-definition and attribute-value stores, the system asserts identity of reference rather than coincidence of naming.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

The entity, expressed as entity_id in value-bearing records, designates which governed object carries a given measurement, status, or metadata field at the moment of capture. A single verification run identified as VERI-0001 may therefore accumulate multiple typed observations: duration_seconds recorded as 5469.69, host_name recorded as node-a01, end_time recorded as 2024-10-23T14:58:17, and exit_code recorded as 616—all bound to the same entity while remaining distinguishable by attribute identity. Constraint records exhibit the same pattern: CONS-0001 carries mandatory true and effective_date 2024-01-12; CONS-0002 carries mandatory false and effective_date 2023-06-10, each entity_id pairing isolating enforcement posture to the rule instance that constrains VERI-0001 or related governed artifacts. Entity resolution is thus the operational prerequisite for any aggregate report, violation triage, or renewal comparison that must not commingle distinct verification events.

Attributes—attr in operational parlance—name the semantic dimension being asserted about an entity, while attr_type declares the governing datatype under which the value must be validated, stored, and interpreted. Verification subclasses declare attr_name entries including duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string); constraint-with-violation-consequence subclasses declare effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). The type assignment is not cosmetic: it routes each assertion into the appropriate value repository—decimal, datetime, integer, varchar, date, or boolean—so that comparisons, range checks, and schema validation operate on representations that conform to XSD semantics rather than on undifferentiated text. A GDPR data flow review and a security posture assessment may share attribute names across VERI-0002, VERI-0003, and VERI-0004, yet their attr_type contracts remain identical, preserving interoperability of analytics and constraint engines across heterogeneous verification programs.

The misc field—misc in extract and interchange contexts, value in persistence—holds the instantiated payload for a given entity–attribute pair and constitutes the evidentiary substance auditors examine. Decimal misc values such as 821.61 and 4016.93 quantify elapsed verification effort across distinct entities; integer misc values including 105, 713, and 29 encode exit codes whose divergence between paired runs on VERI-0001 and VERI-0002 may signal procedural or environmental deviation; varchar misc values ranging from node-a01 through Log Level 02, review, and running capture host identity, logging posture, workflow phase, and operational state without collapsing those distinct semantics into a single overloaded code list. Boolean misc on constraints—true for CONS-0001, false for CONS-0002 through CONS-0004—materializes whether a rule is mandatory at enforcement time, while varchar misc such as Encoding 01, Enforcement 02, calibration record, and fr records encoding schemes, enforcement tiers, and provenance annotations that govern how violations escalate to access revocation, rate throttling, or pipeline termination. Misc is therefore the locus of compliance proof and of constraint parametrization alike.

Issueddate—issued_date in subsystem registration—supplies temporal authority for when a syscall classification or kernel-subsystem mapping entered the governed corpus and became eligible for constraint application and audit citation. The read syscall mapped to namespaces subsystem code C-07 carries issued_date 2024-01-17; write mapped to inotify subsystem code B-12 carries 2023-04-09; openat and execve entries sharing code E-21 carry 2024-01-29 and 2024-04-20 respectively within fsnotify and vDSO subsystems. Issueddate does not substitute for attribute-level timestamps such as end_time 2024-02-27T03:56:28 or 2024-10-31T01:53:25 on verification entities; rather, it fixes the effective publication of the syscall rule itself, enabling reviewers to determine whether a verification executed before or after a subsystem boundary was formally recorded. Effective_date on constraints performs an analogous anchoring function at the policy layer—2023-06-27 for CONS-0003, 2023-12-08 for CONS-0004—so that mandatory false and priority 404 on CONS-0004 apply only within the temporal window the governance framework recognizes as authoritative.

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | read | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | write | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | openat | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | execve | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | read | inotify | C-07 | 2025-01-29 |

Taken together, identifier, entity, attr, attr_type, misc, and issueddate implement a typed, entity-centric evidence model in which verification subclasses (compliance renewal verification, GDPR data flow review, security posture assessment) and constraint subclasses (schema validation rule, provenance audit requirement, lab safety protocol) remain semantically rich without wide denormalized tables. Crosswalk from attr_type to storage tier prevents type coercion errors; entity_id enforces referential discipline among observations belonging to one governed instance; identifier keys enable constrains edges such as CONS-0001 and CONS-0002 binding to VERI-0001; issueddate and effective_date supply non-interchangeable temporal frames for infrastructure rules versus policy rules versus run-level measurements. Operational integrity depends on preserving this separation: misc values are admissible only when attr_type, entity, and identifier alignment is demonstrable, and any reconciliation across VERI-0001 through VERI-0004 or CONS-0001 through CONS-0004 must treat missing or mistyped attribute bindings as schema violations subject to the same consequence machinery the framework records—halt, revocation, throttling, or termination—rather than as benign data gaps.

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

**t_constraint_with_violation_consequence**

| id | constraint | constrains | on_violation |
| --- | --- | --- | --- |
| CONS-0001 | Schema validation rule | VERI-0001 | Experiment halt |
| CONS-0002 | Provenance audit requirement | VERI-0001 | Access revocation |
| CONS-0003 | Lab safety protocol | VERI-0005 | Rate throttling |
| CONS-0004 | Lab safety protocol | VERI-0007 | Pipeline termination |
| CONS-0005 | Access control matrix | VERI-0007 | Network partitioning |
| CONS-0006 | Encryption standard | VERI-0005 | Compliance flagging |

**t_constraint_with_violation_consequence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_with_violation_consequence_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | false |
| CONS-0004 | CONS-0004 | CONS-0003 | false |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_with_violation_consequence_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2024-01-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2023-06-10 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-27 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2023-12-08 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-04-22 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-17 |

**t_constraint_with_violation_consequence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 5 |
| CONS-0002 | CONS-0001 | CONS-0005 | 21 |
| CONS-0003 | CONS-0002 | CONS-0004 | 3 |
| CONS-0004 | CONS-0002 | CONS-0005 | 404 |
| CONS-0005 | CONS-0003 | CONS-0004 | 1 |
| CONS-0006 | CONS-0003 | CONS-0005 | 896 |
| CONS-0007 | CONS-0004 | CONS-0004 | 5 |
| CONS-0008 | CONS-0004 | CONS-0005 | 236 |

**t_constraint_with_violation_consequence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | calibration record |
| CONS-0004 | CONS-0001 | CONS-0009 | fr |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | change rationale |