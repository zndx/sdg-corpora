---
chapter_id: ch_live_directive_authored_and_applies_a46ab7
topic_id: 40
family: 01_foundation
cited_terms: ['directive_authored_and_applies', 'process_uses_artifact', 'ebpfevent_observes_syscall_xref']
model: engine-refine
---

Regulatory compliance frameworks require precise, machine-readable binding of policy mandates to operational domains. Each directive—whether governing HIPAA Audit Logging, FDA 21 CFR Compliance, or ISO 27001 Access Control—is anchored by a unique identifier and explicitly scoped to its target environment, such as Edge Gateway Nodes or Customer PII Datasets. The governance model separates policy text from its enforcement parameters by normalizing attributes into typed value stores. An attr such as mandatory is persisted as an xsd:boolean with a concrete value of true, while scheduling constraints like effective_date are stored as xsd:date instances (e.g., 2023-01-05 or 2024-10-27). Numeric thresholds, including priority levels or enforcement indices, are captured as xsd:integer values ranging from 5 to 736, and free-text directives like Encoding 01 or pre-release note reside in string-typed containers. This type-disaggregated architecture ensures that validation, indexing, and audit queries operate against semantically homogeneous data rather than ambiguous text fields.

The linkage between a directive and its contextual parameters is mediated through the entity relationship, which binds typed attributes to specific policy instances. An entity does not merely store a value; it records the precise attribute identifier and the directive scope to which that value applies, enabling granular compliance mapping across heterogeneous systems. When a directive authored by the NIST Cyber Division applies to Cloud Storage Buckets, the entity table resolves which boolean flags, date ranges, or integer thresholds govern that particular deployment. This separation of concerns allows regulatory bodies like the FDA Compliance Office or CISA National Director to issue updates to attribute definitions without rewriting the core policy records, maintaining an immutable audit trail while supporting dynamic enforcement configurations. Unstructured compliance annotations and release notes are routed to the misc classification, preserving their contextual relevance without disrupting the typed schema.

**t_directive_authored_and_applies**

| id | directive | authored_by | applies_to |
| --- | --- | --- | --- |
| APPL-0001 | HIPAA Audit Logging | FDA Compliance Office | ISO Certified Facilities |
| APPL-0002 | FDA 21 CFR Compliance | HSA Regulatory Board | Edge Gateway Nodes |
| APPL-0003 | ISO 27001 Access Control | NIST Cyber Division | Cloud Storage Buckets |
| APPL-0004 | FDA 21 CFR Compliance | CISA National Director | Customer PII Datasets |
| APPL-0005 | ISO 27001 Access Control | FDA Compliance Office | Financial Ledger Tables |
| APPL-0006 | GDPR Data Retention | European Commission | HIPAA Covered Entities |

**t_directive_authored_and_applies_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| APPL-0001 | effective_date | xsd:date |
| APPL-0002 | enforcement | xsd:string |
| APPL-0003 | mandatory | xsd:boolean |
| APPL-0004 | priority | xsd:integer |
| APPL-0005 | review_cycle_days | xsd:integer |
| APPL-0006 | scope | xsd:string |
| APPL-0007 | encoding | xsd:string |
| APPL-0008 | label_text | xsd:string |

**t_directive_authored_and_applies_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0003 | true |
| APPL-0002 | APPL-0002 | APPL-0003 | true |
| APPL-0003 | APPL-0003 | APPL-0003 | true |
| APPL-0004 | APPL-0004 | APPL-0003 | true |
| APPL-0005 | APPL-0005 | APPL-0003 | false |
| APPL-0006 | APPL-0006 | APPL-0003 | false |

**t_directive_authored_and_applies_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0001 | 2023-01-05 |
| APPL-0002 | APPL-0002 | APPL-0001 | 2024-10-27 |
| APPL-0003 | APPL-0003 | APPL-0001 | 2025-04-09 |
| APPL-0004 | APPL-0004 | APPL-0001 | 2024-01-05 |
| APPL-0005 | APPL-0005 | APPL-0001 | 2023-12-27 |
| APPL-0006 | APPL-0006 | APPL-0001 | 2023-04-20 |

**t_directive_authored_and_applies_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0004 | 5 |
| APPL-0002 | APPL-0001 | APPL-0005 | 736 |
| APPL-0003 | APPL-0002 | APPL-0004 | 5 |
| APPL-0004 | APPL-0002 | APPL-0005 | 165 |
| APPL-0005 | APPL-0003 | APPL-0004 | 3 |
| APPL-0006 | APPL-0003 | APPL-0005 | 417 |
| APPL-0007 | APPL-0004 | APPL-0004 | 1 |
| APPL-0008 | APPL-0004 | APPL-0005 | 521 |

**t_directive_authored_and_applies_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| APPL-0001 | APPL-0001 | APPL-0007 | Encoding 01 |
| APPL-0002 | APPL-0001 | APPL-0002 | Enforcement 02 |
| APPL-0003 | APPL-0001 | APPL-0008 | pre-release note |
| APPL-0004 | APPL-0001 | APPL-0009 | ja |
| APPL-0005 | APPL-0001 | APPL-0006 | Scope 05 |
| APPL-0006 | APPL-0002 | APPL-0007 | Encoding 06 |
| APPL-0007 | APPL-0002 | APPL-0002 | Enforcement 07 |
| APPL-0008 | APPL-0002 | APPL-0008 | pre-release note |

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

Beyond static policy definitions, operational workflows demand rigorous tracking of execution timelines and fault tolerance mechanisms. Process artifacts are scheduled against precise temporal windows, with scheduledat timestamps such as 2025-02-18T02:41:43 or 2024-07-19T11:09:21 establishing the baseline for service-level agreements. When a routine like log_shipment or index_rebuild encounters transient failures, the system records the retrycount—values such as 50, 207, or 487 iterations—providing a quantitative measure of system resilience. High retry volumes signal degraded infrastructure or resource contention, prompting capacity planning adjustments before scheduled maintenance windows like 2025-02-01T09:38:01 arrive. This telemetry transforms ad-hoc operational logs into structured performance baselines, enabling engineering teams to correlate scheduling drift with downstream compliance violations.

**t_process_uses_artifact**

| id | process | retry_count | scheduled_at |
| --- | --- | --- | --- |
| ARTI-0001 | log_shipment | 50 | 2025-02-18T02:41:43 |
| ARTI-0002 | index_rebuild | 207 | 2024-07-19T11:09:21 |
| ARTI-0003 | index_rebuild | 193 | 2025-02-01T09:38:01 |
| ARTI-0004 | trace_sampling | 487 | 2024-04-29T06:10:14 |

At the event layer, the dimensional model captures the full lifecycle of system transactions through the ebpfevent construct. Each event is classified by a category and measured against strict performance and outcome metrics. Duration is quantified in duration_seconds, with observed execution windows spanning from 889.87 seconds for routine operations to 5696.76 seconds for complex batch processes. The exit code—whether 988, 313, 278, or 158—serves as the definitive success or failure indicator, while the associated retry count (ranging from 38 to 427) contextualizes the effort required to reach that terminal state. By correlating event keys like XREF-0005 with their categorical labels and duration outliers, compliance officers can isolate systemic bottlenecks, validate SLA adherence, and demonstrate regulatory control over data lineage and processing integrity.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |