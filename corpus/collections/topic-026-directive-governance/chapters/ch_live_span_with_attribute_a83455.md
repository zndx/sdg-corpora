---
chapter_id: ch_live_span_with_attribute_a83455
topic_id: 26
family: 07_long_tail
cited_terms: ['span_with_attribute', 'span_with_parent', 'span_with_status']
model: engine-refine
---

Distributed tracing treats each unit of work in a request path as a span: a bounded operation whose identity, relationships, and outcomes must be recorded consistently if operators are to reconstruct causality, enforce service-level objectives, and satisfy audit requirements. The identifier is the stable key that binds every fact, dimension row, and relationship edge to a single logical entity across ingestion, storage, and reporting. When an auth token validate span is linked to orchestrator job as parent, or when span attribute ATTR-0002 is resolved to Span Attribute Label 02, the identifier is what prevents conflation of similarly named operations and what allows a compliance review to trace a degraded data-ingestion-batch outcome back to the exact telemetry rows that produced it.

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | workflow step exec |
| PARE-0002 | auth token validate |
| PARE-0003 | message broker publish |
| PARE-0004 | api-gateway-request |
| PARE-0005 | user-authentication-flow |
| PARE-0006 | api gateway route |
| PARE-0007 | workflow step exec |
| PARE-0008 | cache lookup session |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | load balancer forward |
| PARE-0002 | orchestrator job |
| PARE-0003 | cache lookup session |
| PARE-0004 | orchestrator job |
| PARE-0005 | load balancer forward |
| PARE-0006 | log-aggregation-run |

Span attributes name the measurable facets attached to a span—latency drivers, error semantics, retry behavior, or domain-specific tags—and they are rarely useful in raw form until classified. Category partitions attributes into governance buckets: Span Attribute Category 01 through Span Attribute Category 04 each denote a distinct control or reporting family, while the misc field (here, the human-facing span attribute label) supplies the operator-readable name that dashboards, runbooks, and policy documents reference. A span attribute such as ATTR-0004 may appear on multiple fact records with different duration_seconds, exit codes, and retry counts, which is expected when the same attribute is observed across incidents, environments, or aggregation windows; category and label remain stable even as operational measurements fluctuate.

Duration seconds and exit together form the quantitative and qualitative terminus of a span attribute observation. Duration_seconds captures elapsed wall time for the attributed segment—values ranging from roughly 411 seconds on one ATTR-0002 observation to nearly 4,964 seconds on ATTR-0001 illustrate how the same taxonomy can surface both sub-minute operations and multi-hour batch segments that breach latency thresholds. Exit encodes termination semantics: non-zero codes such as 767, 893, 599, and 91 signal failure or abnormal completion paths that SLO burn-rate alerts and post-incident reviews must treat differently from clean success. Retry count adds a resilience dimension; counts in the hundreds (494 retries on one ATTR-0001 record, 428 on an ATTR-0004 record) indicate sustained automatic recovery attempts that may mask intermittent faults until quotas exhaust, making retry_count a leading indicator for flaky dependencies rather than a mere diagnostic counter.

Parentage models how spans nest within larger workflows. A child span such as workflow step exec may sit under load balancer forward, while message broker publish nests under cache lookup session; the span field names the operation under scrutiny and parent_span names its enclosing context. Subject and target generalize this pattern: in a typed relationship, subject is the span asserting the edge and target is the entity it connects to—api-gateway-request linked to orchestrator job, or auth token validate linked to a parent orchestrator job instance. Role qualifies the semantic of that link. An owner role denotes accountability for the child’s lifecycle relative to the parent; observer implies read-only or monitoring participation without operational authority; reviewer marks an approval or validation relationship, as when api-gateway-request is associated with orchestrator job under reviewer rather than owner. These roles matter in access-control matrices and in audit narratives that must distinguish who executed work from who attested to it.

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

Status association parallels parentage but binds spans to operational health classifications rather than structural hierarchy. Spans such as data-ingestion-batch, etl data transform, and service mesh proxy carry span_status values including degraded, timeout, and partial_failure—states that trigger distinct escalation playbooks and regulatory notification thresholds. Again subject and target appear: a span_id points to the span under evaluation and span_status_id points to the status record being asserted. Role differentiates how the span participates in that status: contributor indicates the span materially caused or sustained the condition, while observer indicates the span witnessed or reported it without being the primary fault surface. When data-ingestion-batch simultaneously appears as contributor to one status edge and observer on another, investigators can separate root-cause spans from correlated bystanders and avoid misattributing blast radius in executive summaries.

**t_span_with_status**

| id | span |
| --- | --- |
| STAT-0001 | data-ingestion-batch |
| STAT-0002 | etl data transform |
| STAT-0003 | cache lookup session |
| STAT-0004 | service mesh proxy |
| STAT-0005 | kafka consumer process |
| STAT-0006 | gateway auth check |

**t_span_with_status_span_status**

| id | span_status |
| --- | --- |
| STAT-0001 | degraded |
| STAT-0002 | timeout |
| STAT-0003 | partial_failure |
| STAT-0004 | partial_failure |
| STAT-0005 | partial_failure |
| STAT-0006 | degraded |

**t_span_with_status__span_status**

| id | span_id | span_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0005 | contributor |
| STAT-0002 | STAT-0005 | STAT-0006 | observer |
| STAT-0003 | STAT-0001 | STAT-0001 | contributor |
| STAT-0004 | STAT-0001 | STAT-0002 | observer |
| STAT-0005 | STAT-0003 | STAT-0002 | owner |
| STAT-0006 | STAT-0001 | STAT-0001 | owner |
| STAT-0007 | STAT-0004 | STAT-0006 | observer |
| STAT-0008 | STAT-0003 | STAT-0004 | reviewer |

In practice, identifiers knit the model into an enforceable observability contract. Dimension rows supply category and misc labels for attributes; fact rows supply duration_seconds, exit, and retry_count for each attributed execution; parent and status junctions supply subject, target, and role for graph and state semantics. An operator investigating partial_failure on ingestion need not memorize schema layout: they follow identifier lineage from STAT-0001 through related span_status records, cross-check parent chains from orchestrator job through api-gateway-request, and correlate attribute facts where exit 91 and 306 retries on ATTR-0004 suggest a retried gateway fault distinct from the 4,963-second ATTR-0001 run that may indicate batch overrun. That end-to-end traceability—stable identity, classified attributes, timed outcomes, hierarchical context, and role-qualified status—is what transforms raw telemetry into evidence suitable for operational governance and compliance attestation.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |