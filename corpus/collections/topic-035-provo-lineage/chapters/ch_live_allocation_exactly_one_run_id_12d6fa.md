---
chapter_id: ch_live_allocation_exactly_one_run_id_12d6fa
topic_id: 35
family: 05_provo_lineage
cited_terms: ['allocation_exactly_one_run_id', 'transformation_min_one_output', 'agent_responsible_for']
model: engine-refine
---

In governed data environments, every durable assertion must be anchored by an identifier—a stable, surrogate key that survives renaming of human-readable labels and permits unambiguous reference across tables, audit logs, and policy evaluations. Identifiers such as RUN-0001 through RUN-0004, OUTP-0001 through OUTP-0004, and RESP-0001 through RESP-0004 do not themselves encode business meaning; they exist so that downstream systems can cite the same entity consistently when descriptive attributes change. A run keyed as RUN-0002 may be described elsewhere as batch-ingest-prod or bound at execution time to session-77b, yet the identifier remains the canonical handle through which allocation records, lineage edges, and accountability statements are joined. Without such keys, compliance narratives collapse into ambiguous prose—two operators may believe they adjusted the same workload when they in fact touched distinct executions.

Subject and target constitute the directed endpoints of a governed relationship: the subject is the party or artifact that originates, performs, or holds obligation; the target is the entity affected, produced, or placed under stewardship. In allocation governance, a subject allocation (for example RUN-0002 linked as allocation_id in an association row) is asserted against a target run identifier (RUN-0002 as at_run_identifier_id), encoding that a named workload placement bears a specific operational context rather than merely co-occurring with it. The same structural grammar appears in transformation lineage, where transformation_id OUTP-0006 is recorded as subject to multiple output_dataset_id targets—OUTP-0003, OUTP-0005, OUTP-0001—reflecting that one normalization or conversion step may materialize several distinct datasets, and in agent responsibility, where agent_id RESP-0004 is declared subject to responsible_for_id RESP-0004, binding KafkaSource (when resolved through the agent dimension) to CustomerTransactions. Treating relationships as ordered pairs prevents symmetric confusions: ownership flows from agent to asset, not the reverse, and a transformation produces a dataset rather than merely sharing a taxonomy label with it.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_agent_responsible_for**

| id | agent |
| --- | --- |
| RESP-0001 | KafkaSource |
| RESP-0002 | LabSpectrometer |
| RESP-0003 | AuditDaemon |
| RESP-0004 | ComplianceOfficer |
| RESP-0005 | MetadataIndexer |
| RESP-0006 | MetadataIndexer |
| RESP-0007 | SampleHandler |
| RESP-0008 | PipelineOrchestrator |

**t_agent_responsible_for_responsible_for**

| id | responsible_for |
| --- | --- |
| RESP-0001 | CustomerTransactions |
| RESP-0002 | LabSamples |
| RESP-0003 | PipelineMetrics |
| RESP-0004 | AuditTrail |
| RESP-0005 | ResearchDataset |
| RESP-0006 | PipelineMetrics |

Role qualifies the subject–target link with normative semantics that identifiers alone cannot supply. Where RUN-0001 carries role contributor toward its paired run identifier, RUN-0003 is recorded as observer—distinctions that govern who may mutate state, who may attest to outcomes, and whose actions trigger escalation paths. In output lineage, OUTP-0001’s association to OUTP-0003 under role reviewer signals review authority over parsed access logs, whereas OUTP-0002 and OUTP-0003 attach as contributors to curated events table outputs, and OUTP-0004 assumes observer on standardized inventory index—mirroring separation of duties between authors, validators, and passive monitors. Agent responsibility exhibits the same pattern: owner on RESP-0001’s link contrasts with reviewer on RESP-0002 and RESP-0003 and observer on RESP-0004, so ComplianceOfficer’s relationship to AuditTrail can be evaluated differently from AuditDaemon’s reviewer posture on PipelineMetrics even when both agents appear in the same control matrix.

Cardinality constraints on the surrounding entities shape how identifiers, subjects, targets, and roles compose into enforceable policy. Allocation is modeled as exactly one run identifier per allocation key—etl-sync-west for RUN-0001 resolves through proc-id-4421, batch-ingest-prod through session-77b—so a workload cannot simultaneously claim incompatible execution contexts without violating integrity rules. Transformations carry a minimum-of-one output obligation: duplicate data normalization steps (OUTP-0001, OUTP-0002) must each terminate in at least one output_dataset—parsed access logs and curated events table respectively—while format conversion rows fan out to curated events table and standardized inventory index, ensuring no silent transformation leaves the catalog without a consumable artifact. Agent responsibility likewise demands that every agent identifier—KafkaSource, LabSpectrometer, AuditDaemon, ComplianceOfficer—maps to a responsible_for object—CustomerTransactions, LabSamples, PipelineMetrics, AuditTrail—so unattended components cannot persist in the inventory.

**t_allocation_exactly_one_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | etl-sync-west |
| RUN-0002 | batch-ingest-prod |
| RUN-0003 | query-opt-run |
| RUN-0004 | replica-clone-3 |
| RUN-0005 | model-deploy-stg |
| RUN-0006 | cache-warm-init |

**t_allocation_exactly_one_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | proc-id-4421 |
| RUN-0002 | session-77b |
| RUN-0003 | job-handle-11d |
| RUN-0004 | run-88f3a1 |
| RUN-0005 | run-tag-alpha |
| RUN-0006 | batch-snapshot-5e |
| RUN-0007 | pipeline-run-44f |
| RUN-0008 | task-uuid-003 |

**t_allocation_exactly_one_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0002 | RUN-0006 | contributor |
| RUN-0002 | RUN-0004 | RUN-0002 | contributor |
| RUN-0003 | RUN-0003 | RUN-0003 | observer |
| RUN-0004 | RUN-0005 | RUN-0002 | owner |
| RUN-0005 | RUN-0001 | RUN-0007 | contributor |
| RUN-0006 | RUN-0003 | RUN-0007 | observer |
| RUN-0007 | RUN-0004 | RUN-0007 | owner |
| RUN-0008 | RUN-0003 | RUN-0003 | contributor |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

**t_agent_responsible_for__responsible_for**

| id | agent_id | responsible_for_id | role |
| --- | --- | --- | --- |
| RESP-0001 | RESP-0004 | RESP-0004 | owner |
| RESP-0002 | RESP-0008 | RESP-0003 | reviewer |
| RESP-0003 | RESP-0007 | RESP-0004 | reviewer |
| RESP-0004 | RESP-0007 | RESP-0006 | observer |
| RESP-0005 | RESP-0007 | RESP-0003 | owner |
| RESP-0006 | RESP-0005 | RESP-0003 | reviewer |
| RESP-0007 | RESP-0007 | RESP-0004 | observer |
| RESP-0008 | RESP-0007 | RESP-0004 | observer |

In operational practice, auditors and platform engineers traverse these structures by resolving identifiers to descriptive attributes, then interpreting role-decorated subject–target edges as evidence of authority and lineage. A reviewer seeking the provenance of curated events table follows transformation_id OUTP-0006 through contributor associations on OUTP-0002 and OUTP-0003, while an access review traces RUN-0004’s owner role on its allocation–run-identifier pairing against replica-clone-3 and run-88f3a1. Governance frameworks treat such traversals as first-class queries: policy engines ask not whether two strings coappear but whether a qualified edge exists—owner, contributor, reviewer, observer—between the correct subject identifier and target identifier. When junction rows reference allocation_id RUN-0005 or agent_id RESP-0008 while base dimension tables enumerate only through RUN-0004 or RESP-0004, referential discipline surfaces orphan assertions before they contaminate compliance reports.

The practical consequence is that identifier, role, subject, and target form an interdependent vocabulary for machine-checkable accountability rather than a passive schema annotation. Identifiers grant permanence; subject and target grant directionality; roles grant the obligations and permissions that humans otherwise express in narrative runbooks. Systems that materialize all four consistently—binding batch-ingest-prod and session-77b under contributor semantics, recording OUTP-0006’s multi-output fan-out with differentiated reviewer and contributor stamps, and anchoring agent duty on PipelineMetrics and AuditTrail with distinct reviewer and observer postures—produce evidentiary graphs that withstand regulatory scrutiny. Those that store only labels, or that omit role on associative facts, may appear complete in dashboards yet fail under cross-examination, because the decisive question in governance is invariably relational: who, acting in what capacity, stood in what directed relationship to which governed object at the time the control applied.