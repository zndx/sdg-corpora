---
chapter_id: ch_live_provenance_agent_subclass_e2e496
topic_id: 66
family: 05_provo_lineage
cited_terms: ['provenance_agent_subclass', 'profiling_produces_profile', 'agent_software_or_human']
model: engine-refine
---

Enterprise data pipelines require rigorous lineage tracking and role-based accountability to maintain compliance and operational integrity. Provenance subclasses serve as the foundational context for data lineage, categorizing workflows into distinct operational domains such as audit-trail-archive, clinical-trial-raw, feature-store-export, and telemetry-stream-alpha. Each subclass is assigned a unique identifier that anchors downstream governance records. Within this framework, responsibilities like system-auditor, data-steward, lab-coordinator, and etl-scheduler are formally mapped to provenance contexts through a relational junction table. This mapping enforces a clear separation of duties: a given provenance record links to responsibility records via subject and target foreign keys, while the role column explicitly defines the nature of the engagement, whether contributor, observer, or reviewer. Such structuring ensures that every data transformation or archival action carries an unambiguous chain of custody.

**t_provenance_agent_subclass**

| id | provenance |
| --- | --- |
| AGEN-0001 | audit-trail-archive |
| AGEN-0002 | clinical-trial-raw |
| AGEN-0003 | feature-store-export |
| AGEN-0004 | telemetry-stream-alpha |
| AGEN-0005 | pipeline-logs-v2 |
| AGEN-0006 | telemetry-stream-alpha |

**t_provenance_agent_subclass_responsibility**

| id | responsibility |
| --- | --- |
| AGEN-0001 | system-auditor |
| AGEN-0002 | data-steward |
| AGEN-0003 | lab-coordinator |
| AGEN-0004 | etl-scheduler |
| AGEN-0005 | lab-coordinator |
| AGEN-0006 | data-steward |
| AGEN-0007 | data-steward |

**t_provenance_agent_subclass__responsibility**

| id | provenance_id | responsibility_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0002 | AGEN-0004 | AGEN-0002 | observer |
| AGEN-0003 | AGEN-0002 | AGEN-0001 | reviewer |
| AGEN-0004 | AGEN-0004 | AGEN-0007 | reviewer |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | owner |
| AGEN-0006 | AGEN-0005 | AGEN-0007 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0003 | reviewer |
| AGEN-0008 | AGEN-0001 | AGEN-0001 | owner |

Operational reliability is captured through granular job profiling, which records the execution characteristics of pipeline stages. Each profiling event is tied to a specific output artifact via a produces foreign key, linking execution telemetry to a dimensional catalog that classifies outputs by category and assigns miscellaneous labels (misc) to each artifact. The profiling fact table logs critical performance and stability indicators, including duration seconds, which can span from roughly 1,113 seconds for rapid validation steps to over 6,700 seconds for intensive batch operations. Exit codes such as 725, 809, 348, and 827 provide machine-readable status signals for monitoring and alerting systems, while retry count values—ranging from 186 to 303 in observed runs—quantify fault tolerance and transient failure rates. Together, these metrics enable capacity planning, SLA enforcement, and post-incident root cause analysis.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

The actors driving these workflows, whether software services or human operators, are cataloged in a centralized agent registry that enforces licensing compliance and functional classification. Entries distinguish between automated components and personnel by recording agent designations alongside secondary and tertiary role descriptors. For instance, a pipeline might invoke a LegacySystemBridge coordinated by a PrometheusCollector, or route incidents through a SecurityAnalyst supported by a LegalHoldService. License terms such as GPL-3.0, Apache-2.0, MPL-2.0, and MIT are explicitly bound to each agent record, ensuring that third-party dependencies and internal tools remain auditable for regulatory and security reviews. Descriptive names like ComplianceChecker, IncidentTriage, LogAggregator, and ModelValidator further contextualize each actor’s operational purpose within the broader data ecosystem.

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

The interplay between provenance classification, execution profiling, and agent licensing forms a cohesive governance architecture. By anchoring job outputs to dimensional categories, correlating execution metrics with lineage contexts, and binding software or human actors to explicit license and responsibility frameworks, organizations achieve end-to-end traceability. When a profiling event fails or exceeds duration thresholds, operators can immediately resolve the producing artifact, identify the responsible provenance subclass, and determine which agent or role triggered the execution. This relational discipline transforms raw telemetry and metadata into actionable governance signals, reducing compliance friction, accelerating incident response, and maintaining data quality across heterogeneous, multi-tenant data environments.