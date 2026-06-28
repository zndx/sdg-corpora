---
chapter_id: ch_live_policy_applies_to_25857f
topic_id: 80
family: 01_foundation
cited_terms: ['policy_applies_to', 'trace_min_one_span', 'schemaorg_org_taxid']
model: engine-refine
---

Policy application records anchor the governance framework by binding regulatory directives to their operational targets through a structured identifier, a policy name, the entity to which the policy applies, an effective date, and a descriptive label. The identifier column—values such as APPL-0001 through APPL-0004—serves as the primary key for each application record, ensuring unambiguous reference across audit trails and compliance reports. The policy column carries the name of the governing directive, ranging from the Cloud Security Baseline to the Zero Trust Architecture Guideline, the GDPR Compliance Directive, and the Data Retention Standard. The applies_to column specifies the operational scope of each directive, with targets including API Gateway Endpoints, HR Personnel Files, Kubernetes Clusters, and Customer PII Datasets. The effective_date column records when each policy became operative, with dates such as 2025-01-11, 2023-03-13, 2024-06-14, and 2024-05-03 establishing a temporal ordering of regulatory enforcement. The label_text column provides a concise annotation for each record, with values like audit excerpt, nightly summary, and pre-release note offering contextual metadata for downstream processing and review workflows.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | Kubernetes Clusters | 2024-07-03 | nightly summary |

Operational traceability is captured through fact-level records that measure the execution characteristics of individual spans. Each trace record carries a unique identifier—SPAN-0001 through SPAN-0004—and references a parent span through the spans column, which functions as a foreign key pointing to the dimension table of span definitions. The duration_seconds column quantifies the elapsed time of each trace, with observed values of 1874.27, 2092.44, 3940.66, and 3336.66 seconds reflecting the variance in execution length across different operational contexts. The exit column records the exit code associated with each trace, with values such as 491, 900, 420, and 60 indicating the termination status of the underlying operation. The retry_count column tracks how many times a trace was retried before reaching its final state, with counts of 399, 179, 396, and 459 revealing the frequency of transient failures and the resilience of the system under test.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |

Span dimensions provide the categorical and descriptive metadata that contextualize the raw trace measurements. Each span dimension record is identified by a unique identifier and carries a spans_label—referred to in the column set as misc—with values such as Spans Label 01 through Spans Label 04, and a spans_category—referred to as category—with values like Spans Category 01 through Spans Category 04. These two columns together form a classification schema that enables grouping, filtering, and aggregation of trace data by functional domain or operational type. The foreign-key relationship between the spans column in the fact table and the identifier column in the span dimension table ensures that every trace measurement can be traced back to its categorical definition, supporting both real-time monitoring and retrospective compliance analysis.

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

Organizational taxonomy and tax identification are managed through a tripartite structure that links institutional entities to their tax identifiers and assigns governance roles to each association. The organization taxonomy table maps a unique identifier to a schemaorg name, with entries such as CERN Geneva, NSF Arlington, NASA Goddard, and a second occurrence of NSF Arlington representing the institutional entities under governance. The tax identification table pairs each organization identifier with a tax_i_d value—27-0699690, 95-6033790, 06-0600089, and 52-1693400—providing the regulatory identifiers required for financial and compliance reporting. The junction table that connects these two dimensions introduces three additional columns: subject, which references the schemaorg identifier; target, which references the tax identifier; and role, which assigns a governance function to the relationship, with values of reviewer, owner, and observer indicating the capacity in which each entity participates in the tax identification linkage. This structure enables precise attribution of responsibility and supports audit queries that require both organizational and fiscal context.

**t_schemaorg_org_taxid**

| id | schemaorg |
| --- | --- |
| TAXI-0001 | CERN Geneva |
| TAXI-0002 | NSF Arlington |
| TAXI-0003 | NASA Goddard |
| TAXI-0004 | NSF Arlington |
| TAXI-0005 | NSF Arlington |
| TAXI-0006 | MIT CSAIL |

**t_schemaorg_org_taxid_tax_i_d**

| id | tax_i_d |
| --- | --- |
| TAXI-0001 | 27-0699690 |
| TAXI-0002 | 95-6033790 |
| TAXI-0003 | 06-0600089 |
| TAXI-0004 | 52-1693400 |
| TAXI-0005 | 95-6033790 |
| TAXI-0006 | 20-0000116 |

**t_schemaorg_org_taxid__tax_i_d**

| id | schemaorg_id | tax_i_d_id | role |
| --- | --- | --- | --- |
| TAXI-0001 | TAXI-0005 | TAXI-0004 | reviewer |
| TAXI-0002 | TAXI-0004 | TAXI-0002 | reviewer |
| TAXI-0003 | TAXI-0004 | TAXI-0005 | owner |
| TAXI-0004 | TAXI-0006 | TAXI-0006 | observer |
| TAXI-0005 | TAXI-0004 | TAXI-0004 | owner |
| TAXI-0006 | TAXI-0005 | TAXI-0002 | observer |
| TAXI-0007 | TAXI-0003 | TAXI-0006 | observer |
| TAXI-0008 | TAXI-0006 | TAXI-0002 | owner |