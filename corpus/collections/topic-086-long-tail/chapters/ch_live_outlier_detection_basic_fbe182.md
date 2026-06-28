---
chapter_id: ch_live_outlier_detection_basic_fbe182
topic_id: 86
family: 02_observation_measurement
cited_terms: ['outlier_detection_basic', 'policy_enforced_by', 'process_uses_artifact']
model: engine-refine
---

Operational anomaly governance rests on stable identifiers that bind heterogeneous observability signals to authoritative dimension records and enforceable policy posture. Each outlier instance carries a primary identifier—such as DETE-0001 through DETE-0004—that functions as the durable correlation key across fact and dimension layers, ensuring that a detected deviation referenced by outlier_key DETE-0003 in execution telemetry resolves unambiguously to the same entity whether the event is classified under Outlier Category 03 or subjected to downstream remediation. Identifier discipline matters because compliance investigations, capacity postmortems, and automated retry orchestration all depend on join integrity; without it, duration and exit telemetry fragment into orphaned measurements that cannot be attributed to a labeled outlier or linked to the process that produced it.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

The outlier itself is not merely a statistical departure but an operational object whose category and miscellaneous label supply the semantic frame within which raw execution metrics acquire governance meaning. Category partitions the anomaly population into auditable taxonomies—Outlier Category 01 through Outlier Category 04—while the miscellaneous label field (Outlier Label 01, Outlier Label 02, and so forth) carries human-readable provenance suitable for control narratives and executive dashboards. Duration in seconds quantifies elapsed wall-clock exposure: values ranging from 1182.39 seconds on the shortest observed run to 6466.78 on the longest establish whether an outlier reflects transient jitter or sustained degradation warranting escalation. Exit codes—760, 4, 490, 124 in the present cohort—encode termination semantics at the process boundary; they are the first forensic signal distinguishing benign completion, policy-blocked termination, and hard infrastructure failure, and they must be interpreted jointly with duration rather than in isolation.

Retry count appears in two operational contexts that share a name but serve distinct control purposes. Within outlier fact records, elevated retry_count values—293, 225, 101, and 308—indicate how persistently an anomalous execution path was reattempted before final disposition, a leading indicator of cascading load and masked root cause when retries succeed intermittently. Within process–artifact bindings, the homonymous retrycount field attached to scheduled workloads such as log_shipment, index_rebuild, and trace_sampling governs bounded re-execution policy: index_rebuild entries at 207 and 193 retries versus trace_sampling at 487 retries reveal materially different tolerance envelopes for idempotent maintenance versus sampling pipelines that may amplify noise if permitted excessive re-entry. Scheduledat timestamps—2025-02-18T02:41:43 for log_shipment, 2024-07-19T11:09:21 and 2025-02-01T09:38:01 for paired index_rebuild invocations, 2024-04-29T06:10:14 for trace_sampling—anchor each process to a deterministic temporal contract, enabling SLA attestation, change-window compliance, and correlation of outlier bursts to known batch schedules.

**t_process_uses_artifact**

| id | process | retry_count | scheduled_at |
| --- | --- | --- | --- |
| ARTI-0001 | log_shipment | 50 | 2025-02-18T02:41:43 |
| ARTI-0002 | index_rebuild | 207 | 2024-07-19T11:09:21 |
| ARTI-0003 | index_rebuild | 193 | 2025-02-01T09:38:01 |
| ARTI-0004 | trace_sampling | 487 | 2024-04-29T06:10:14 |

Policy enforcement introduces subject–target–role semantics that translate regulatory obligation into operational accountability. The subject identifies which control mandate is in scope—ISO27001 Encryption, CCPA Data Deletion, PCI-DSS Tokenization, or FINRA Record Retention—while the target designates the enforcing instrument: Splunk SIEM, ISO Audit Board, or AWS Config Rules. The role qualifier—observer, reviewer, or owner—specifies the authority gradient within that relationship; an observer posture on encryption and deletion controls implies monitoring without direct remediation authority, whereas owner assignment on record-retention enforcement confers accountable closure responsibility. Junction integrity is itself a compliance artifact: when policy_id ENFO-0006 appears in an enforcement edge while the canonical policy dimension enumerates only ENFO-0001 through ENFO-0004, orphan references surface gaps in control coverage that auditors treat as findings rather than data quirks.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

Taken together, these attributes form a closed evidentiary chain from scheduled process invocation through execution telemetry, anomaly classification, and policy attestation. An investigator tracing DETE-0003—with outlier_key self-reference, duration_seconds 5282.09, exit_code 490, and retry_count 101—moves from quantitative stress indicators to Outlier Category 03 and Outlier Label 03, then outward to whether the originating process schedule and the applicable PCI-DSS or FINRA enforcement role permitted or detected the failure. Mature governance treats category and misc labels as non-negotiable metadata requirements, duration_seconds and exit as mandatory outcome fields on every material run, retry_count and retrycount as separately governed retry budgets at the anomaly and process layers, and subject–target–role triples as the auditable proof that a detected outlier occurred within a control environment whose enforcement posture was explicitly defined before the event.