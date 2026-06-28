---
chapter_id: ch_live_policy_only_governs_artifacts_b72541
topic_id: 66
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'schemaorg_place_longitude', 'agent_software_or_human']
model: engine-refine
---

Governance frameworks depend upon a disciplined taxonomy of identifiers to anchor every artifact, agent, and geographic reference within a unified namespace. The identifier column serves as the primary key across all registries, ensuring that each record—whether an artifact such as ARTI-0001, a human or software agent like HUMA-0002, or a geographic entity such as LONG-0003—can be referenced unambiguously across systems. In the policy registry, identifiers bind to concrete governance instruments: ARTI-0001 carries the Data Retention Policy, ARTI-0003 carries the Privacy Compliance Policy, and ARTI-0004 carries the Immutable Audit Policy. Similarly, agent identifiers map to functional roles—HUMA-0002 is the SecurityAnalyst paired with IncidentResponder and PrometheusCollector—while place identifiers anchor named locations such as HooverDam, MaunaLoaObservatory, GoldenGateBridge, and ISSOrbitModule. Without this consistent identification layer, enforcement actions, license attributions, and role assignments would lack a stable referent.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

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

Enforcement mechanisms determine how strictly a policy is applied, and the enforcement column captures this distinction with categorical precision. The values blocking, advisory, and deprecated reflect a spectrum of coerciveness: blocking policies demand compliance before action proceeds, advisory policies recommend adherence without halting execution, and deprecated policies have been superseded or withdrawn. ARTI-0001, governed by the Data Retention Policy, employs blocking enforcement at priority level 2, signaling that retention requirements are both mandatory and moderately urgent. By contrast, ARTI-0002 and ARTI-0004 both carry advisory enforcement at priorities 4 and 5 respectively, indicating lower urgency and non-coercive guidance. ARTI-0003, the Privacy Compliance Policy, is marked deprecated at priority 1—the highest priority numerically but functionally inert due to its deprecated status. This interplay between enforcement type and priority reveals that a policy's operational weight derives not from its rank alone but from the combination of its coerciveness and its ordering.

Priority itself functions as a numeric ranking that orders policies within the governance hierarchy, with lower integers denoting greater urgency. The values range from 1 through 5 across the artifact registry, and while priority 1 belongs to the deprecated Privacy Compliance Policy, the next highest active priority—2—belongs to the Data Retention Policy under blocking enforcement. The remaining policies occupy priorities 4 and 5, both advisory in nature. This structure ensures that when multiple policies apply to a single artifact, the system can resolve conflicts or determine processing order by consulting the priority column alongside the enforcement classification.

The relationship between geographic entities and their coordinate data is mediated through a junction table that assigns roles to subject-target pairs. Here, the subject column references a place identifier (such as LONG-0005 for HooverDam or LONG-0007 for MaunaLoaObservatory), the target column references a longitude record (such as LONG-0002 with value 2.2945 or LONG-0001 with value -27.9692), and the role column specifies the nature of the association—reviewer, contributor, or owner. LONG-0003 (GoldenGateBridge) appears as the subject in two relationships, both with the owner role, linking to LONG-0001 and LONG-0003 respectively. The longitude value 2.2945 is shared by MaunaLoaObservatory and ISSOrbitModule, suggesting either a data anomaly or a shared reference frame. This subject-target-role triad enables fine-grained provenance tracking, distinguishing who or what is responsible for a given coordinate assignment.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | HooverDam |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | GoldenGateBridge |
| LONG-0004 | ISSOrbitModule |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | PaloAltoResearchCenter |
| LONG-0007 | BlackRockForest |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

Software agents and human operators are catalogued with licensing information that governs their redistribution and modification rights. The license column records four distinct open-source licenses: GPL-3.0, Apache-2.0, MPL-2.0, and MIT. HUMA-0001 (LegacySystemBridge, ComplianceChecker) carries GPL-3.0, HUMA-0002 (SecurityAnalyst, IncidentTriage) carries Apache-2.0, HUMA-0003 (MLopsSpecialist, LogAggregator) carries MPL-2.0, and HUMA-0004 (AirflowDAGRunner, ModelValidator) carries MIT. These licenses are not merely administrative metadata; they constrain how each agent's codebase may be forked, combined with proprietary systems, or redistributed. The misc column, which captures functional descriptors such as ComplianceChecker, IncidentTriage, LogAggregator, and ModelValidator, provides a human-readable label that complements the more structured agent and agent_2 columns. Together, the license and misc attributes form a compact provenance record that supports both legal compliance and operational discoverability.