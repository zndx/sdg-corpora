---
chapter_id: ch_live_agent_software_or_human_ddc78f
topic_id: 66
family: 05_provo_lineage
cited_terms: ['agent_software_or_human', 'agent_with_role', 'aggregation_aggregates_measurement']
model: engine-refine
---

Agent role taxonomy and aggregate measurement form the backbone of governance frameworks for distributed intelligence systems, where every deployed component must be classified, licensed, versioned, and held to measurable standards of performance. An agent—whether software or human—carries a unique identifier such as HUMA-0001 or HUMA-0002, and is characterized by a primary function like SecurityAnalyst or MLopsSpecialist, a secondary capability such as IncidentResponder or PrometheusCollector, and a tertiary role including SentinelAuditBot or DevOpsCoordinator. These layered designations reflect the operational reality that modern agents rarely perform a single task; the LegacySystemBridge, for instance, also serves as a PlatformEngineer and is augmented by a PrometheusCollector, while the AirflowDAGRunner doubles as a PagerOnCallDispatcher and is supported by a DevOpsCoordinator. Each agent is governed by a license—GPL-3.0, Apache-2.0, MPL-2.0, or MIT—and carries a miscellaneous designation such as ComplianceChecker, IncidentTriage, LogAggregator, or ModelValidator that captures its regulatory or functional purpose.

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

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |

The agent role dimension provides the categorical scaffolding upon which these identifiers are organized. Each role identifier, ranging from ROLE-0001 through ROLE-0004, is associated with a human-readable label and a category classification, enabling aggregation and policy enforcement at the category level rather than the individual agent level. The fact_agent table records concrete deployments of these roles, linking each instance to its role definition via a foreign key relationship. A single role may be instantiated multiple times: ROLE-0006, for example, appears in two distinct agent records, while ROLE-0005 is referenced by two others. Each deployment carries a version number—ranging from 1 to 12—and a size in bytes that reflects the computational footprint of the agent binary or model, with values spanning from approximately 20.9 megabytes for a compact deployment to nearly 549 megabytes for a resource-intensive variant. This size information is critical for capacity planning and cost attribution, particularly in environments where agents are deployed at scale across heterogeneous infrastructure.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

Aggregate measurements constitute the observational layer of the governance framework, capturing quantified assessments of agent behavior, system health, or compliance posture. Each aggregate measurement is identified by a unique key such as MEAS-0001 or MEAS-0003 and is linked to a parent aggregate construct through a foreign key relationship. The aggregates themselves are classified within a category taxonomy—Category Name 01 through Category Name 04—and carry labels such as Aggregates Label 01 or Aggregates Label 03 that provide human-readable context. The category assignment is itself a foreign key, pointing to a dedicated category dimension table that standardizes classification across all aggregate types. This hierarchical structure—measurement to aggregate to category—enables roll-up reporting and cross-domain analysis, ensuring that metrics from disparate sources can be compared and consolidated under a unified taxonomy.

Confidence and uncertainty metrics accompany every aggregate measurement, providing a quantitative assessment of its reliability. Confidence values range from 0.024 to 0.857, with the measurement MEAS-0001 exhibiting a confidence of 0.857 and a corresponding uncertainty of 811.48, while MEAS-0004 registers a confidence of merely 0.024 against an uncertainty of 527.80. The measured value itself—ranging from 52.67 to 996.14—represents the point estimate, but without the confidence and uncertainty bounds, this value is of limited utility for decision-making. A measurement with high confidence and low uncertainty, such as MEAS-0002 with a confidence of 0.688 and uncertainty of 850.83, warrants greater operational attention than one with marginal confidence, even if the raw value appears more extreme. These statistical attributes are not optional metadata; they are integral to the governance framework, enabling risk-aware aggregation and preventing decisions based on measurements whose reliability is insufficient for the intended use case.