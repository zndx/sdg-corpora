---
chapter_id: ch_live_span_with_attribute_225def
topic_id: 66
family: 07_long_tail
cited_terms: ['span_with_attribute', 'agent_software_or_human', 'annotation_classifies_class']
model: engine-refine
---

Operational observability in distributed systems rests upon the disciplined capture of span-level telemetry, where each execution unit is identified by a unique span identifier and characterized by its duration, exit code, and retry behavior. A span such as ATTR-0001, which persisted for 4963.54 seconds before terminating with exit code 767 after 494 retries, conveys a markedly different operational story than ATTR-0002, which completed in 410.92 seconds with exit code 893 and only 145 retries. These temporal and failure metrics are not merely logged; they are classified through a span attribute taxonomy that assigns each span to a category—Span Attribute Category 01 through Span Attribute Category 04—while a human-readable label, such as Span Attribute Label 01, provides the semantic anchor for downstream analysis. The classification of spans into categories enables aggregation and alerting policies that operate at the level of concern rather than at the level of individual execution traces.

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

Complementing the operational telemetry, annotation records capture the interpretive layer applied to system events, encoding both the classification decision and its associated epistemic quality. Each annotation, identified by a class identifier such as CLAS-0001, references a classifies key that points to a semantic category—Classifies Category 01 through Classifies Category 04—while simultaneously recording a confidence score and an uncertainty magnitude. The confidence values observed across the annotation corpus range from 0.236 to 0.845, with the highest confidence (0.845) accompanying an uncertainty of 690.59 and a measured value of 979.94, whereas the lowest confidence (0.236) corresponds to an uncertainty of 593.98 and a value of 370.63. This inverse relationship between confidence and uncertainty is not universal—CLAS-0003 exhibits a confidence of 0.271 with an uncertainty of only 104.01—but the tension between these two measures is precisely what makes the annotation layer analytically valuable: it forces the distinction between what the system believes and how strongly it believes it.

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

The entities responsible for generating, processing, or auditing these spans and annotations are themselves catalogued within a registry of agents, software components, and human operators, each distinguished by an identifier, a functional name, and a licensing regime. The agent dimension captures multi-role assignments: the entity named ComplianceChecker (HUMA-0001) operates under the GPL-3.0 license and assumes the roles of LegacySystemBridge, PlatformEngineer, and PrometheusCollector, while the ModelValidator (HUMA-0004), licensed under MIT, functions as AirflowDAGRunner, PagerOnCallDispatcher, and DevOpsCoordinator. The diversity of licenses—GPL-3.0, Apache-2.0, MPL-2.0, and MIT—reflects the heterogeneous provenance of the tooling ecosystem, and the tripartite agent naming (agent, agent_2, agent_3) encodes the layered responsibilities that any single entity may bear across the operational lifecycle.

**t_agent_software_or_human**

| id | agent | agent_2 | agent_3 | license | name |
| --- | --- | --- | --- | --- | --- |
| HUMA-0001 | LegacySystemBridge | PlatformEngineer | PrometheusCollector | GPL-3.0 | ComplianceChecker |
| HUMA-0002 | SecurityAnalyst | IncidentResponder | LegalHoldService | Apache-2.0 | IncidentTriage |
| HUMA-0003 | MLopsSpecialist | PrometheusCollector | SentinelAuditBot | MPL-2.0 | LogAggregator |
| HUMA-0004 | AirflowDAGRunner | PagerOnCallDispatcher | DevOpsCoordinator | MIT | ModelValidator |
| HUMA-0005 | ShiftSupervisor | AirflowDAGRunner | KafkaStreamProcessor | Apache-2.0 | ModelValidator |
| HUMA-0006 | MLopsSpecialist | VaultSecretRotator | LegalHoldService | Apache-2.0 | LogAggregator |
| HUMA-0007 | IncidentResponder | PrometheusCollector | GlacierRecoveryJob | Apache-2.0 | AccessAuditor |
| HUMA-0008 | QualityAssuranceLead | MLopsSpecialist | PrometheusCollector | MPL-2.0 | IncidentTriage |

The relational architecture that binds these dimensions together is straightforward in principle and consequential in practice. The fact_span table anchors the operational record, with its span_attribute_key foreign key pointing to dim_span_attribute, thereby linking each execution trace to its categorical classification and descriptive label. Similarly, fact_annotation references dim_classifies through its classifies_key, ensuring that every confidence-uncertainty pair is grounded in a defined classification schema. The t_agent_software_or_human table stands as a peer dimension, its identifiers not directly referenced by the fact tables in the current schema but providing the essential provenance context for attributing spans and annotations to their originating or processing entities. Together, these tables form a minimal but complete observability fabric: spans capture what happened, annotations capture how it was interpreted, and agents capture who or what was responsible.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |