---
chapter_id: ch_live_policy_subclass_governs_d771dd
topic_id: 186
family: 03_directive_governance
cited_terms: ['policy_subclass_governs', 'directive_union_constraint_or_policy', 'kernelhook_observes_syscall_xref']
model: engine-refine
---

In enterprise governance, every enforceable rule must be addressable as a distinct **entity** bound to a durable **identifier** so that policies, constraints, and operational hooks can be referenced consistently across audits, automation, and human review. Identifiers such as `GOVE-0001` and `POLI-0001` are not decorative labels; they are the join keys that let a retention mandate, its scoped application, and its attribute values remain the same object even as wording, owners, or enforcement posture change. When a directive like the Data Retention Policy appears both as a governing policy and as the subject of typed metadata, the identifier is what prevents drift between “what the organization says” and “what systems actually enforce.” Entity linkage works the same way in the attribute-value layer: each stored fact names an `entity_id` (for example `POLI-0003`) and an `attr_id` so that effective dates, mandatory flags, and numeric priorities attach to exactly one governed artifact rather than to a free-floating string in a document repository.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Data Retention Policy | Batch Size Constraint | Lab Assay Protocol |
| POLI-0002 | Incident Response Protocol | Integrity Check Requirement | Sampling Interval Rule |
| POLI-0003 | Financial Audit Trails | Calibration Frequency Spec | Telemetry Sampling Rule |
| POLI-0004 | Format Encoding Rule | Cloud Resource Quota Limit | Provenance Tracking Rule |
| POLI-0005 | Integrity Check Requirement | Containerized Microservices | Edge Telemetry Nodes |
| POLI-0006 | Batch Size Constraint | Lab Assay Protocol | Query Optimization Guideline |
| POLI-0007 | Customer PII Records | Validation Check | Financial Audit Trails |

**t_directive_union_constraint_or_policy_attr**

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

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |

Governance metadata is rarely flat. Organizations model it through **attr** names and **attr_type** declarations that separate the meaning of a field from the concrete value it carries. An attribute registry might define `effective_date` as `xsd:date`, `mandatory` as `xsd:boolean`, `enforcement` as `xsd:string`, and `priority` as `xsd:integer`, which forces each fact into a validated representation instead of a single catch-all text column. In practice this produces parallel value stores where the **misc** field holds the payload appropriate to the type: `2024-10-31` for activation, `true` or `false` for whether compliance is compulsory, `Encoding 01` or `fr` for operational parameters, and integers such as `3`, `17`, or `854` for ranked or counted requirements. The pattern matters because auditors and controllers need to know not only what was decided but whether a given value was a date, a boolean obligation, or a scalar limit—and because downstream validators can reject malformed assignments before they reach production controls.

**Priority** resolves conflict when multiple directives touch the same scope. A Logging Level Directive carrying priority `1` will typically prevail over a Cleanup Schedule at priority `5` when both could influence observability or retention behavior, while policies at priority `4`—such as Data Retention and Storage Quota—may require explicit precedence rules or composite approval rather than silent override. Priority is therefore both a runtime ordering signal and a governance design choice: low numbers often denote foundational controls whose violation would invalidate other assurances. **Reviewcycledays** complements priority by governing time, not precedence. A review interval of `799` days signals a slow-moving retention posture reviewed roughly every two years, whereas `277` days on a Storage Quota Policy implies more frequent reassessment as capacity economics and repository growth change faster than statutory retention language. Together, priority and review cadence define how long a rule stays authoritative and which rule wins when scopes overlap, such as when pH Range Specification appears under more than one governing policy.

Accountability and lineage complete the control story. **Owner** assigns operational responsibility for artifacts that bridge policy and instrumentation: an `sre` owner for repeated `bcc_tcpconnect` hooks, `platform-team` for filesystem watch telemetry, or `analytics` for later registrations reflects who must answer when a probe misbehaves or when syscall observation coverage gaps appear in an audit. **Createddate** anchors that responsibility in time. A hook recorded on `2023-03-30` versus one on `2025-04-07` tells reviewers whether an observation path predates a policy’s `effective_date` or was introduced under a newer enforcement regime. That temporal pairing is essential when proving that mandatory directives—three policies marked `true` and one `false` on the mandatory attribute—were actually observable in the environment for the full compliance period under review.

**t_kernelhook_observes_syscall_xref**

| id | kernelhook | created_date | owner |
| --- | --- | --- | --- |
| XREF-0001 | bcc_tcpconnect | 2025-01-25 | sre |
| XREF-0002 | bcc_tcpconnect | 2023-03-30 | ml-infra |
| XREF-0003 | tracee_fs_watch | 2024-11-21 | platform-team |
| XREF-0004 | bcc_tcpconnect | 2025-04-07 | analytics |
| XREF-0005 | tracee_fs_watch | 2024-03-25 | governance |

Taken together, identifiers and entities establish what is governed; attr and attr_type define how metadata is structured; misc carries the evidentiary values; priority and reviewcycledays schedule authority and renewal; and owner plus createddate bind rules to people and moments in the operational lifecycle. A reviewer examining Financial Audit Trails with mandatory `true` and an effective date of `2023-02-17` can trace from policy intent through typed attributes to the teams and hooks that make the directive measurable, which is the practical difference between a compliance handbook that lists aspirations and a governance framework that can be tested, versioned, and enforced.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | Data Retention Policy | pH Range Specification | 4 | 799 |
| GOVE-0002 | Cleanup Schedule | Laboratory Safety Mandate | 5 | 632 |
| GOVE-0003 | Logging Level Directive | pH Range Specification | 1 | 507 |
| GOVE-0004 | Storage Quota Policy | Source Code Repositories | 4 | 277 |
| GOVE-0005 | Source Code Repositories | Edge Telemetry Nodes | 3 | 143 |
| GOVE-0006 | Network Latency Limit | Calibration Frequency Spec | 5 | 666 |