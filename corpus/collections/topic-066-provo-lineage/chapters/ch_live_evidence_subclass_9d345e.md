---
chapter_id: ch_live_evidence_subclass_9d345e
topic_id: 66
family: 06_belief_structure
cited_terms: ['evidence_subclass', 'agent_software_or_human', 'allocation_associated_with_agent']
model: engine-refine
---

Evidence in any governed system must first be identifiable before it can be evaluated, and the primary key `id` in the evidence subclass table serves this anchoring function with identifiers such as `EVID-0001` through `EVID-0004`, each tagging a discrete artifact—whether an IoT sensor reading batch, a query execution plan, or a Western blot film—that purports to support a claim. The claim itself, ranging from "Memory leak detected" to "GDPR compliance met," is never asserted in isolation; it carries an associated uncertainty value, a numeric measure that quantifies the degree of confidence or noise inherent in the evidence. These uncertainty figures—`777.57`, `535.87`, `239.52`, `418.27`—span a wide range, reflecting that some evidence is substantially more reliable than others, and the system does not collapse them into a binary pass/fail but preserves their gradations for downstream reasoning. Compounding this epistemic dimension is the language attribute, which records the provenance tongue of each evidence item: Japanese (`ja`), Spanish (`es`), or French (`fr`), a detail that matters when evidence must be interpreted by agents with varying linguistic capabilities or when regulatory frameworks demand language-specific handling.

**t_evidence_subclass**

| id | evidence | supports_claim | uncertainty | language |
| --- | --- | --- | --- | --- |
| EVID-0001 | IoT sensor reading batch | Memory leak detected | 777.57 | ja |
| EVID-0002 | Query execution plan | GDPR compliance met | 535.87 | es |
| EVID-0003 | Western blot film | Reagent purity verified | 239.52 | fr |
| EVID-0004 | Western blot film | Schema version locked | 418.27 | fr |
| EVID-0005 | IoT sensor reading batch | Schema version locked | 969.30 | es |
| EVID-0006 | ETL pipeline log | Memory leak detected | 692.45 | fr |

**t_allocation_associated_with_agent**

| id | allocation |
| --- | --- |
| AGEN-0001 | data-ingest-queue |
| AGEN-0002 | telemetry-ingest-window |
| AGEN-0003 | cloud-vpc-subnet |
| AGEN-0004 | compute-fleet-reserve |
| AGEN-0005 | analytics-pipeline-slice |
| AGEN-0006 | prod-cpu-batch |

**t_allocation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | helm-release-controller |
| AGEN-0002 | governance-policy-engine |
| AGEN-0003 | governance-policy-engine |
| AGEN-0004 | lab-sample-tracker |
| AGEN-0005 | helm-release-controller |
| AGEN-0006 | helm-release-controller |

The agents that consume, produce, or audit such evidence are themselves catalogued with equal structural rigor. In the agent registry, each entry carries a unique identifier—`HUMA-0001` through `HUMA-0004`—and a name drawn from a misc column that assigns human-readable labels like `ComplianceChecker`, `IncidentTriage`, `LogAggregator`, and `ModelValidator`. These names sit alongside the agent's functional designation, which may describe a software component such as `LegacySystemBridge` or `AirflowDAGRunner`, or a human role such as `SecurityAnalyst` or `MLopsSpecialist`. A secondary and tertiary agent column captures the broader ecosystem of related agents, so that a single entry might link `SecurityAnalyst` to `IncidentResponder` and `PrometheusCollector`, forming a chain of responsibility. Critically, each agent is governed by a license—`GPL-3.0`, `Apache-2.0`, `MPL-2.0`, or `MIT`—which encodes the legal terms under which the agent's code or operational procedures may be used, modified, or distributed, a constraint that becomes operationally significant in multi-tenant or open-source environments where license compatibility must be verified before integration.

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

Resource allocation provides the bridge between abstract agents and concrete infrastructure. The allocation table assigns identifiers such as `AGEN-0001` through `AGEN-0004` to named resources like `data-ingest-queue`, `telemetry-ingest-window`, `cloud-vpc-subnet`, and `compute-fleet-reserve`, each representing a bounded computational or organizational asset that an agent may draw upon. These allocations are not static; a separate table records historical associations, capturing which allocations were previously linked to systems such as `helm-release-controller`, `governance-policy-engine`, or `lab-sample-tracker`. This temporal dimension is essential for audit trails and capacity planning, as it reveals the lifecycle of resource assignments and the systems that have consumed or influenced them over time.

The relationship between allocations and their historical associations is mediated by a junction table that introduces the concept of role, distinguishing between `observer` and `contributor` positions. In this schema, the subject column identifies the allocation in question—referencing identifiers like `AGEN-0005` or `AGEN-0002`—while the target column points to the associated system, typically `AGEN-0004` or `AGEN-0005`. The role column then specifies the nature of the relationship: an allocation may observe a governance policy engine without directly modifying it, or it may contribute to a lab sample tracker in a way that alters its state. This tripartite structure—subject, target, role—encodes not merely that two entities are connected, but how they are connected, enabling fine-grained access control, impact analysis, and the reconstruction of complex dependency graphs from simple relational primitives.

**t_allocation_associated_with_agent__was_associated_with**

| id | allocation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | AGEN-0004 | observer |
| AGEN-0002 | AGEN-0006 | AGEN-0004 | contributor |
| AGEN-0003 | AGEN-0005 | AGEN-0005 | contributor |
| AGEN-0004 | AGEN-0002 | AGEN-0004 | observer |
| AGEN-0005 | AGEN-0003 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0002 | owner |
| AGEN-0008 | AGEN-0002 | AGEN-0001 | owner |