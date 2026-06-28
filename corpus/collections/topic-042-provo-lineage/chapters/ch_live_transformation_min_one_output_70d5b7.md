---
chapter_id: ch_live_transformation_min_one_output_70d5b7
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_min_one_output', 'transformation_not_recoverable', 'transformation_only_uses_datasets']
model: engine-refine
---

Every governed transformation pipeline rests on a durable identifier that survives renaming, redeployment, and audit replay. Identifiers such as OUTP-0001, RECO-0003, and DATA-0002 are not display labels; they are the canonical keys by which lineage systems, access-control matrices, and incident investigators rejoin facts that would otherwise scatter across logs, schedules, and dependency graphs. A format conversion layer and a cipher key rotation may share a human-readable name in runbooks, but only RECO-0002 and OUTP-0001 preserve unambiguous reference when a curated events table is produced twice under different operational contexts or when a schema migration step must be correlated with a later batch compaction. Identifier stability is therefore a precondition for accountability: without it, role assignments, trigger provenance, and scheduled execution windows cannot be bound to the correct operational object when disputes arise or when compliance officers demand evidence of who authorized what and when.

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | feature engineering |
| DATA-0002 | validation check |
| DATA-0003 | data normalization |
| DATA-0004 | parquet compaction |
| DATA-0005 | hash truncation |
| DATA-0006 | sensor calibration |

Subject and target articulate the directional semantics of a governed relationship. The subject is the entity that asserts or performs the linkage—the transformation that claims an output dataset or declares dependency on an upstream entity—while the target is the resource acted upon or consumed. When OUTP-0006 is recorded as subject against output_dataset_id OUTP-0003, the registry encodes that a calibration routine and a validation check, both keyed under OUTP-0006, materially engage the same curated events table as target, yet under different junction records distinguished by their own identifiers. The inverse pattern appears where DATA-0003, a data normalization transformation, is subject to DATA-0002 as target in a uses-entity association, signaling that normalization draws on a feature registry cache rather than merely coexisting in the same catalog. This subject–target asymmetry matters because authorization rules, data-handling classifications, and breach notification obligations typically attach to the direction of use: the subject bears operational responsibility; the target inherits sensitivity and retention constraints.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | format conversion layer |
| OUTP-0002 | calibration routine |
| OUTP-0003 | validation check |
| OUTP-0004 | feature engineering |
| OUTP-0005 | record anonymization |
| OUTP-0006 | format conversion |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |

Role qualifies the subject’s posture toward the target without collapsing distinct duties into a single “access” bit. Reviewer, contributor, and observer are not interchangeable privileges; they encode how closely an actor or automated agent may influence, mutate, or merely witness a bound resource. OUTP-0001 carries reviewer role over its output linkage, implying approval or attestation rights over the parsed access logs that the format conversion layer emits, whereas OUTP-0002 and OUTP-0003 hold contributor role toward overlapping targets—both touching curated events table identifiers OUTP-0005 and OUTP-0001—while OUTP-0004 is constrained to observer on OUTP-0003 for the standardized inventory index. On the consumption side, DATA-0001 is reviewer over DATA-0002 while DATA-0003 and DATA-0004 participate as contributors to ingestion buffer queue and historical metrics dataset respectively, and DATA-0002 remains observer only. Roles thus operationalize least-privilege: they allow shared infrastructure—duplicate targets, shared subjects—without granting every transformation the same power to alter or certify downstream artifacts.

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

ScheduledAt anchors non-recoverable work to an auditable timeline. Transformations that cannot be rolled back—index rebuild, cipher key rotation, schema migration step, aggregation window rollup—require a recorded instant at which execution was intended or committed, not merely a relative delay in a queue. The timestamps 2023-05-27T08:30:46, 2024-07-23T05:41:48, 2025-03-09T11:37:12, and 2023-08-05T01:48:14 supply that forensic spine: they let operators reconstruct whether a schema migration step preceded or followed a format conversion layer in calendar time, and they give regulators a concrete answer when asked whether key rotation occurred before or after a known exposure window. ScheduledAt does not replace workflow orchestration, but in compliance-oriented registries it converts “sometime in the maintenance period” into a testable claim that can be compared against change tickets, maintenance notices, and downstream anomaly onsets.

TriggeredBy records the initiation channel through which an irreversible transformation entered the execution path, and it is distinct from both scheduling and role. A transformation may be scheduled for 2025-03-09T11:37:12 yet still be triggered_by manual if an operator explicitly commenced it; conversely, triggered_by event or api denotes exogenous or programmatic impetus that must be traced separately from the clock time stamped in ScheduledAt. The evidence set spans event-driven index rebuild, manually invoked cipher key rotation, schedule-fired schema migration step, and api-initiated aggregation window rollup—four modalities that imply different control tests: event paths require monitoring and correlation rules, manual paths require segregation of duties and approver identity, schedule paths require change-freeze adherence, and api paths require credential scope review. Treating TriggeredBy as decorative metadata invites audit failure, because investigators routinely ask not only when a destructive step ran but through which surface an attacker or a runaway integration could have invoked it.

Taken together, identifier, subject, target, role, ScheduledAt, and TriggeredBy form the minimum evidentiary lattice for transformation governance. Identifiers bind rows across output, dataset, recovery, and consumption views; subject and target orient those rows into actionable dependencies; role constrains authority along each edge; ScheduledAt and TriggeredBy timestamp and classify irreversible execution in ways that human labels like “calibration routine” or “parquet compaction” cannot. A registry that populates all six consistently allows an auditor to follow DATA-0001’s feature engineering from reviewer stance on the feature registry cache through to OUTP-0003’s contributor emission of curated events, while simultaneously proving that RECO-0004’s log parsing companion work was api-triggered at 2023-08-05T01:48:14 and is not recoverable by rollback. That end-to-end traceability is the operational purpose of the fields: not to describe schema shape, but to make transformation ecosystems legible under scrutiny.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | index rebuild | schema migration | 2023-05-27T08:30:46 | event |
| RECO-0002 | cipher key rotation | batch compaction | 2024-07-23T05:41:48 | manual |
| RECO-0003 | schema migration step | format conversion layer | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | aggregation window rollup | log parsing | 2023-08-05T01:48:14 | api |
| RECO-0005 | aggregation window rollup | sensor calibration | 2023-09-25T17:59:19 | manual |
| RECO-0006 | schema migration step | calibration routine | 2024-03-31T12:21:12 | event |
| RECO-0007 | telemetry normalization | aggregation window rollup | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | batch compaction | deduplication pass | 2025-04-13T18:22:12 | schedule |