---
chapter_id: ch_live_process_uses_artifact_d54bd3
topic_id: 185
family: 01_foundation
cited_terms: ['process_uses_artifact', 'labrun_has_operator', 'subclass_basic']
model: engine-refine
---

Operational telemetry and governed execution rest on a small set of recurring attributes whose semantics must be stable across ingestion, reconciliation, and audit. The identifier anchors that stability: every durable entity—whether an artifact-bound process (`ARTI-0001` through `ARTI-0004`), a laboratory run (`OPER-0001` through `OPER-0004`), an operator registry row, or a subclass definition (`TSUB-0001` through `TSUB-0004`)—carries a primary key that survives renaming, redeployment, and cross-system federation. Without such keys, duration measurements, exit adjudication, and retry tallies cannot be attributed to a single accountable lineage; with them, a run keyed `OPER-0001` can be joined unambiguously to operator `OPER-0007` even when human-readable labels diverge. Identifier discipline is therefore not a naming convenience but the precondition for evidentiary completeness in any compliance handbook that must answer who executed what, when, and under which classification.

**t_process_uses_artifact**

| id | process | retry_count | scheduled_at |
| --- | --- | --- | --- |
| ARTI-0001 | log_shipment | 50 | 2025-02-18T02:41:43 |
| ARTI-0002 | index_rebuild | 207 | 2024-07-19T11:09:21 |
| ARTI-0003 | index_rebuild | 193 | 2025-02-01T09:38:01 |
| ARTI-0004 | trace_sampling | 487 | 2024-04-29T06:10:14 |

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

Operator and category jointly partition the execution plane into governable units. An operator is the actor or automation principal that performs work; in practice it appears as an operator key on factual run records—`OPER-0007` appears on both `OPER-0001` and `OPER-0004`, establishing operator reuse across distinct runs—while dimensional tables supply interpretive context. Category (`Operator Category 01` through `Operator Category 04`) situates each operator within a policy tier: retention rules, approval workflows, and escalation thresholds typically vary by category rather than by opaque key alone. Miscellaneous descriptive fields—here, `Operator Label 01` through `Operator Label 04`—serve a parallel function: they carry display semantics, ownership hints, or operational notes that governance frameworks treat as non-key metadata yet still require version control, because auditors routinely reconcile labels against keys during incident review. Subclass subjects such as *ISO 8601 timestamp*, *Parquet row group*, *Remote sensing platform*, and *Query execution engine* extend the same taxonomy outward, binding operators and artifacts to domain vocabulary so that category-based controls apply consistently across heterogeneous workloads.

Duration in seconds and exit code translate execution into measurable, adjudicable outcomes. Duration_seconds captures wall-clock or instrumented runtime for a completed attempt—values clustered near 4,856.18, 4,308.22, 4,764.89, and 5,155.73 seconds on the recorded lab runs—and underpins service-level objectives, capacity planning, and anomaly detection: sustained inflation relative to category baseline often signals resource contention or regression before exit codes degrade. Exit, expressed as exit_code, is the process-level verdict the shell or runtime returns upon termination; the spread among 122, 691, 566, and 3 illustrates why exit cannot be reduced to a binary pass/fail without a governed codebook. Compliance operations map exit ranges to severity classes, mandatory retry policies, and notification channels; a code of 3 may denote graceful completion in one operator category while 691 in another encodes a domain-specific fault requiring human disposition. Together, duration and exit furnish the quantitative and categorical evidence auditors expect when reconstructing whether a scheduled obligation was fulfilled within tolerance.

Retry count—whether persisted as retry_count or retrycount—records how many re-attempts preceded the state under review, and it is among the most consequential resilience indicators in operational governance. Process-level scheduling rows carry elevated counts—50 for `log_shipment`, 207 and 193 for repeated `index_rebuild` work, 487 for `trace_sampling`—signaling that upstream dependencies, lock contention, or sampling backpressure triggered automatic recovery loops rather than immediate abandonment. Run-level facts show a different distribution—265, 244, 106, and 12—reflecting that a single lab run identifier may aggregate fewer visible retries if the execution substrate collapses attempts or if partial success resets counters. Policy designers use retry thresholds to distinguish transient infrastructure faults from structural misconfiguration: uncapped retries preserve availability but risk masking systematic failure, while hard caps force escalation into operator review. Any handbook clause governing retries must therefore specify whether the authoritative count lives at schedule time, at run completion, or both, because divergent column naming across tables is a common integration hazard, not a semantic difference in intent.

ScheduledAt—stored as scheduled_at in ISO 8601 form such as `2025-02-18T02:41:43`, `2024-07-19T11:09:21`, `2025-02-01T09:38:01`, and `2024-04-29T06:10:14`—fixes the temporal contract under which work was expected to commence or become eligible. It aligns with subclass emphasis on *ISO 8601 timestamp* as a first-class subject and with companion notions like *Kestrel telemetry probe* or *Edge gateway node* that imply time-synchronized observability at the network edge. Scheduled time governs lateness detection, maintenance-window compliance, and forensic ordering when multiple rebuild or sampling jobs contend for the same operator category; pairing scheduledAt with realized duration_seconds and final exit_code closes the loop from promise to proof. Mature governance treats the tuple—identifier, operator, category, misc label, scheduledAt, duration, exit, retry count—as a single auditable fact pattern: the schedule states intent, the operator and category state authority, duration and exit state outcome, and retry count states whether the platform exhausted automated remediation before human obligation attached.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |