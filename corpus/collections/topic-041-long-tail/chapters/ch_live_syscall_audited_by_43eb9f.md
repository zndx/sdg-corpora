---
chapter_id: ch_live_syscall_audited_by_43eb9f
topic_id: 41
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by', 'log_record_subclass', 'nonbreaking_change_subclass']
model: engine-refine
---

In distributed systems and compliance frameworks, the integrity of audit trails depends on a disciplined taxonomy of metadata that binds operational events to their governing context. Every audit record carries an identifier—AUDI-0001 through AUDI-0004, for instance—that serves as the immutable anchor for traceability, while the format field specifies the serialization convention employed, whether JSON, UUID, or CSV. The language attribute further disambiguates the provenance of each record, with values such as fr, en, and ja indicating the locale of the originating system or documentation. These attributes operate in concert: an execve invocation audited under AUDI-0002 arrives in UUID format and is documented in English, whereas the same syscall audited under AUDI-0003 uses CSV encoding and is recorded in Japanese. Such granularity ensures that downstream compliance tools can parse, route, and retain audit artifacts according to jurisdictional and technical requirements without ambiguity.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |

Log severity constitutes a parallel classification layer, one that governs how operational telemetry is prioritized, retained, and escalated. The fact_log table records individual log events keyed by identifiers such as RECO-0001 through RECO-0004, each carrying a log_severity_key that references a dimension table, dim_log_severity, where the severity is further elaborated through a label—Log Severity Label 01 through Log Severity Label 04—and a category—Log Severity Category 01 through Log Severity Category 04. The size_bytes column quantifies the payload of each log event, with values ranging from 442,933,768 bytes to 913,386,183 bytes, reflecting the substantial volume of telemetry that modern observability pipelines must ingest and retain. The version column, taking values such as 2, 6, and 7, tracks the schema revision of the log event itself, enabling backward-compatible evolution of the logging contract across system upgrades.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |

Change management introduces a third axis of classification, where the nature of a modification is captured through the nonbreaking_change_subclass taxonomy. Identifiers CHAN-0001 through CHAN-0004 map to concrete change types: Metric Name Addition, Dependency Version Bump, License Header Update, and Field Nullability Change. Each of these change classes is then associated with the systems or services it affects—ML Feature Store, Cloud Storage Bucket, GraphQL Endpoint, and Event Ingestion Pipeline—through a junction table that enforces a many-to-many relationship. This structure permits a single change type to propagate across multiple targets, and conversely, allows a single target to be influenced by multiple change classes, each tracked independently for audit and rollback purposes.

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

The junction table that mediates between change subclasses and their targets introduces the role attribute, which assigns a governance function to each relationship. Values such as observer, contributor, and reviewer delineate the capacity in which a change class interacts with a given target: a Metric Name Addition may serve as a contributor to an ML Feature Store, while a License Header Update assumes the role of reviewer for a GraphQL Endpoint. The subject column (nonbreaking_id) and target column (non_breaking_change_for_id) together form the foreign-key backbone of this relationship, ensuring that every assignment is referentially sound and that the provenance of each change can be reconstructed through standard join operations.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |

Together, these classification dimensions—identifier, format, language, log severity, category, size bytes, version, subject, target, and role—constitute a metadata fabric that renders operational data both machine-readable and governance-compliant. The foreign-key relationships between the audit table, the log fact and dimension tables, and the change management junction table ensure that every data point carries its contextual provenance, enabling automated compliance checks, capacity planning based on size_bytes distributions, and precise attribution of changes to their affected systems. In practice, this means that an auditor can trace a specific log event of 758,542,341 bytes at version 7 back through its severity category, while a release engineer can simultaneously determine which non-breaking change classes—such as a Dependency Version Bump—contributed to the systems that generated that telemetry.