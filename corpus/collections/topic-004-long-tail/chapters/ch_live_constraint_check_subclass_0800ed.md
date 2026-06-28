---
chapter_id: ch_live_constraint_check_subclass_0800ed
topic_id: 4
family: 03_directive_governance
cited_terms: ['constraint_check_subclass', 'kernelhook_with_attached_program', 'evidence_basic']
model: engine-refine
---

Governance frameworks for data integrity rely on a structured taxonomy of identifiers that uniquely anchor every artifact across the compliance lifecycle. Evidence records carry identifiers such as EVID-0001 through EVID-0004, each associated with a specific dimension kind—temperature, count, or pressure—that classifies the nature of the measurement or observation. These dimension kinds serve as semantic tags, enabling downstream consumers to filter and reason about evidence by its physical or operational context. An evidence entry labeled "Compliance checklist" might carry a temperature dimension kind, while a "Latency benchmark result" could be tagged with count, and an "Incident postmortem" with pressure. This classification ensures that evidence is not merely stored but semantically indexed for auditability.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

The encoding of evidence artifacts introduces another layer of structural discipline. Evidence items are stored using character encodings such as ascii, latin1, or utf8, each selected according to the content requirements of the underlying document. A compliance checklist might be encoded in ascii for broad compatibility, whereas an incident postmortem containing international characters could require utf8. The encoding field is not merely a technical detail; it is a governance control that ensures evidence remains readable and verifiable across systems and time. Misaligned encodings can corrupt audit trails, making this a critical attribute in any compliance pipeline.

Attached programs represent the operational entities to which kernel hooks and other artifacts are bound. Each attached program is identified by a unique key—PROG-0001 through PROG-0006—and carries a human-readable label, such as "Attached Program Label 01," alongside a category classification like "Attached Program Category 01." These categories provide a grouping mechanism that supports policy enforcement at scale; for instance, all programs within a given category might share the same retention or encryption requirements. The dimension table for attached programs acts as the authoritative source for these labels and categories, ensuring consistency across fact tables that reference them.

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

Kernel hooks, which capture runtime behavior or system-level events, are linked to attached programs through a foreign key relationship. A kernel hook identified as PROG-0001 might reference attached program PROG-0001, while PROG-0002 could reference PROG-0004, establishing a many-to-one mapping between hooks and programs. Each hook carries a size in bytes—values such as 36,342,735 or 560,962,979 reflect the payload magnitude—and a version number, ranging from 1 to 10, that tracks evolution over time. The version field is essential for traceability: when a compliance audit references a specific kernel hook, the version ensures the exact artifact is retrieved, not a later or earlier iteration.

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

Constraint checks impose validation rules on evidence and are themselves governed by a structured schema. Each check carries an identifier such as CHEC-0001 and references one or more evidence items—EVID-0005, for example, appears in checks for "Null field rejection" and "Anomaly detection threshold." A mandatory flag determines whether the check is a hard requirement; checks marked true, such as those for null field rejection, must pass for compliance to be asserted, while optional checks like "Header presence check" (mandatory: false) serve as advisory controls. Priority levels, ranging from 1 to 5, order the execution and escalation of checks. A priority-1 check like "Null field rejection" takes precedence over a priority-5 check, ensuring that critical validations are evaluated first. This prioritization is vital in high-throughput environments where not all checks can run synchronously.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | EVID-0005 | true | 1 |
| CHEC-0002 | Null field rejection | EVID-0003 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | EVID-0005 | true | 4 |
| CHEC-0004 | Header presence check | EVID-0002 | false | 1 |
| CHEC-0005 | Batch size limit | EVID-0002 | false | 4 |