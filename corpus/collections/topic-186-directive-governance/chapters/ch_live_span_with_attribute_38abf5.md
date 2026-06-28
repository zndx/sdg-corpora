---
chapter_id: ch_live_span_with_attribute_38abf5
topic_id: 186
family: 07_long_tail
cited_terms: ['span_with_attribute', 'syscall_basic', 'lineage_edge_max_one_target']
model: engine-refine
---

Span attributes function as the primary classification mechanism for observability data, each identified by a unique identifier such as ATTR-0001 through ATTR-0004 and categorized into distinct groups like Span Attribute Category 01 through 04. These attributes carry human-readable labels—Span Attribute Label 01, Span Attribute Label 02, and so on—that provide contextual naming for otherwise opaque technical markers. The categorization enables grouping and aggregation of telemetry signals by functional domain, while the label text supports operational dashboards and incident response workflows where engineers need to quickly interpret what a given span represents without decoding raw identifiers.

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

The fact table for spans captures the measurable behavior of each classified attribute instance, recording duration in seconds, exit codes, and retry counts alongside the span attribute key that links back to the dimension table. A span associated with ATTR-0002, for instance, completed in 410.92 seconds with an exit code of 893 and 145 retries, whereas ATTR-0004 spans show substantially longer durations—ranging from 1,972.36 to 3,549.11 seconds—with exit codes of 599 and 91 and retry counts between 306 and 428. The exit code values, which include 767, 893, 599, and 91, encode the termination state of each span execution, while the retry count quantifies how many times the underlying operation was retried before reaching that final state. Together, these metrics allow operators to distinguish between transient failures that self-correct through retries and persistent errors that require intervention.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

System call records provide a complementary layer of low-level execution context, each identified by an identifier such as SYSC-0001 through SYSC-0004 and tagged with the actual syscall name—execve, mmap, stat—alongside a classification code like D-33, B-12, or E-21. The label text field attaches free-form annotations to these records, with entries such as "pre-release note," "nightly summary," and "calibration record" that document the operational significance of each syscall invocation. This table operates independently of the span attribute hierarchy but can be correlated through shared identifiers or temporal alignment, giving engineers a bridge between high-level span classifications and the kernel-level operations that produced them.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |

The lineage framework models data and process dependencies through a tripartite structure that separates lineage definitions from their target systems and the relationships that bind them. Lineage records, identified by TARG-0001 through TARG-0004, describe end-to-end chains such as the "Sensor calibration chain" and "Feature store refresh," while a parallel table maps target system identifiers to human-readable names like "Compliance audit log," "Risk scoring model," "Feature vector store," and "Executive dashboard." The join table that connects these two—using subject and target columns to reference the lineage and target tables respectively—adds a role dimension that specifies whether each entity acts as a contributor or owner in the relationship. For example, the lineage TARG-0001 serves as an owner relationship to the target TARG-0003, while TARG-0003 appears as a contributor to TARG-0006, establishing a directed graph of data provenance and accountability that supports compliance auditing and impact analysis.

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |