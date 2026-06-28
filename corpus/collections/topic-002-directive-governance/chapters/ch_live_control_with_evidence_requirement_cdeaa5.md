---
chapter_id: ch_live_control_with_evidence_requirement_cdeaa5
topic_id: 2
family: 03_directive_governance
cited_terms: ['control_with_evidence_requirement', 'transformation_not_recoverable', 'transformation_subclass']
model: engine-refine
---

Enforcement classifications and language designations form the governance backbone of any control framework, determining both the weight of a requirement and the audience to which it applies. A requirement such as REQU-0001, governing Data Encryption at Rest and demanding System Audit Log evidence, carries a deprecated enforcement posture—its mandate has been superseded or sunsetted—whereas REQU-0004, also tied to Data Encryption at Rest but requiring Manager Approval Email evidence, remains mandatory and is authored in Japanese (ja) to address a distinct regional compliance obligation. Advisory controls like REQU-0002, which mandates Baseline Configuration Checks supported by ISO 27001 Certification evidence, occupy a middle ground: they signal organizational expectation without the force of compulsion. The language field (en, es, ja) ensures that regulatory language reaches the appropriate operational teams, while the enforcement enum—deprecated, advisory, mandatory—provides an unambiguous signal to auditors and engineers alike about the current standing of each requirement.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

Identifiers serve as the immutable anchor across all three registries, enabling cross-referential integrity without ambiguity. The prefix conventions (REQU-, RECO-, TRAN-) immediately communicate the domain of each record: evidence requirements, irreversible transformations, and transformation subclasses respectively. Within each domain, the sequential suffix (0001 through 0004) provides a stable lookup key that survives renames, reorganizations, and lifecycle transitions. An identifier such as RECO-0002 does not merely label a record; it ties together the transformation named "cipher key rotation," its irreversible counterpart "hash truncation," the scheduled execution window of 2024-07-23T05:41:48, and the manual trigger mechanism—all in a single, queryable reference.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | Telemetry Aggregation Rollup | partition compaction | 2023-05-27T08:30:46 | event |
| RECO-0002 | cipher key rotation | hash truncation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | telemetry filtering | partition pruning | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | Metadata Enrichment Workflow | log rotation | 2023-08-05T01:48:14 | api |
| RECO-0005 | Calibration Curve Fitting | Log Pattern Extraction | 2023-09-25T17:59:19 | manual |
| RECO-0006 | telemetry filtering | Feature Vector Normalization | 2024-03-31T12:21:12 | event |
| RECO-0007 | Metadata Enrichment Workflow | Schema Evolution Migration | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | log rotation | metadata extraction | 2025-04-13T18:22:12 | schedule |

The phase and status fields together capture the operational lifecycle of transformation subclasses with precision. A record like TRAN-0001, which describes a parquet compaction operation acting on REST API Response Bodies, is currently in the review phase with a failed status—indicating that the transformation has been proposed, examined, and rejected or errored during validation. By contrast, TRAN-0002 and TRAN-0004, both in the execution phase, have achieved complete status: the former handles cipher key rotation against Reagent Batch Alpha entities, while the latter performs Metadata Enrichment Workflow operations on PostgreSQL Schema Definitions. TRAN-0003, also in execution phase but holding a pending status, represents Checksum Integrity Validation against PCAP Archive Files—a transformation that has been approved for execution but has not yet reached completion. This phase-status matrix (review/execution crossed with pending/complete/failed) provides a real-time operational dashboard without requiring external tooling.

**t_transformation_subclass**

| id | transformation | uses_entity | phase | status |
| --- | --- | --- | --- | --- |
| TRAN-0001 | parquet compaction | REST API Response Bodies | review | failed |
| TRAN-0002 | cipher key rotation | Reagent Batch Alpha | execution | complete |
| TRAN-0003 | Checksum Integrity Validation | PCAP Archive Files | execution | pending |
| TRAN-0004 | Metadata Enrichment Workflow | PostgreSQL Schema Definitions | execution | complete |

Scheduling and trigger mechanisms govern when irreversible transformations execute and by what authority. The scheduled_at column records the planned execution timestamp for each transformation: RECO-0001 (Telemetry Aggregation Rollup with partition compaction) is scheduled for 2023-05-27T08:30:46, while RECO-0003 (telemetry filtering with partition pruning) is set for 2025-03-09T11:37:12, reflecting a multi-year planning horizon. The triggered_by field reveals the provenance of the execution request—event-driven, manual intervention, cron schedule, or API invocation. RECO-0001 is event-triggered, suggesting an automated pipeline response to a telemetry threshold; RECO-0002 is manually triggered, indicating operator-initiated cipher key rotation; RECO-0003 follows a schedule, consistent with routine telemetry filtering; and RECO-0004, performing Metadata Enrichment Workflow with log rotation, is API-triggered, likely invoked by an orchestration service. Together, these fields ensure that every irreversible transformation is both time-stamped and attributable, satisfying audit and compliance requirements for operational traceability.