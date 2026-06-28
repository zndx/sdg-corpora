---
chapter_id: ch_live_hipaa_safeguard_physical_aad458
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_physical', 'outlier_detection_basic', 'allocation_with_run_status']
model: engine-refine
---

In governed operational and compliance environments, stable identifiers function as the non-negotiable anchor for every assertion of fact, obligation, and outcome. Whether the entity in question is a physical safeguard control, a detection run, or a workload allocation, the identifier—PHYS-0001 through PHYS-0004, DETE-0001 through DETE-0004, STAT-0001 through STAT-0004—establishes a durable key that survives renaming, relabeling, and reclassification. Practitioners treat identifiers as the join surface across registries, fact tables, and relationship graphs: Alarm Siren System and Cabinet Lockdown Procedure may share a human-readable label in one register while remaining distinct records keyed as PHYS-0001 and PHYS-0004, and the same discipline applies when outlier facts reference detection keys such as DETE-0003 or DETE-0001. Without identifier integrity, audit reconstruction collapses; with it, an examiner can traverse from a failed vault-secret-rotate allocation at STAT-0003 to the precise safeguard pairing, role assignment, and anomaly telemetry that contextualized the event.

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |

Directed relationships in these frameworks are expressed not as undifferentiated links but as subject–target pairs qualified by role. The subject names the originating entity—the HIPAA control or allocation under governance—while the target names the entity to which that subject is bound: a safeguard procedure, a run-status outcome, or another governed artifact. Thus PHYS-0001 as subject may target PHYS-0002 under role owner, while PHYS-0003 as subject targets PHYS-0008 as observer, and in the operational plane STAT-0001 as subject may target STAT-0006 under reviewer even though both rows also carry their own standalone identifiers. Role is not decorative metadata; it encodes accountability. Owner implies custodial authority over Cabinet Lockdown Procedure and Equipment Maintenance Schedule; reviewer and observer impose separation of duties on Mantrap Entry and CCTV Monitoring; contributor and observer on kafka-consumer-group allocations distinguish who may alter state from who may only witness timeout-expired or disconnected-drift conditions. Governance reviews therefore interrogate role distributions as heavily as they interrogate the subjects and targets themselves, because a correct pairing with an incorrect role still constitutes a control deficiency.

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

Outliers occupy a parallel lane of evidence: they mark observations that depart from expected operational or statistical baselines and therefore demand explicit categorization before they can enter remediation workflows. Category—Outlier Category 01 through Outlier Category 04—supplies the taxonomic frame that determines escalation path, retention policy, and whether a given signal belongs to security, reliability, or compliance triage. Miscellaneous descriptive labels, instantiated here as Outlier Label 01 through Outlier Label 04, carry human-legible nuance that category alone cannot hold: the shorthand an on-call engineer recognizes, the phrase a committee minutes, the token a dashboard groups without exposing internal taxonomy. The outlier key itself ties each fact row back to the dimensional identity of the anomaly under study, so that repeated appearances of DETE-0003 across fact rows denote persistence of a condition rather than accidental duplication of prose.

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

Duration in seconds, exit code, and retry count translate outlier identity into executable history. Duration_seconds records elapsed wall-clock time for the detecting or remediating process—3360.34, 6466.78, 5282.09, 1182.39—and thereby distinguishes long-running structural faults from brief transient spikes that may self-heal. Exit code, recorded as exit in operational extracts, is the process verdict: 760, 4, 490, and 124 are not interchangeable integers but contractual signals about termination cause, success boundary, or policy-enforced halt. Retry_count quantifies resilience expenditure—293, 225, 101, 308 attempts respectively—and when read against duration and exit, reveals whether automation is thrashing against an unrecoverable dependency or legitimately pacing through backoff. A detection that accumulates 308 retries yet exits 124 after only 1182.39 seconds presents a different operational story than one that endures 6466.78 seconds, exits 4, and still records 225 retries; governance committees weigh these triplets when judging whether safeguards and allocations are fail-safe or merely fail-noisy.

The same identifier-and-relationship grammar binds compliance artifacts to runtime posture. Physical safeguard registers associate Alarm Siren System, Access Control Log, and related controls with Media Disposal Protocol, Mantrap Entry, CCTV Monitoring, and Equipment Maintenance Schedule, while allocation registries bind kafka-consumer-group, vault-secret-rotate, and gpu-cluster-alpha to run statuses including timeout-expired, disconnected-drift, and succeeded-final. An identifier on the allocation row does not guarantee the run status observed in production: STAT-0002 may reference kafka-consumer-group yet terminate in disconnected-drift, and STAT-0003 may pair vault-secret-rotate with succeeded-final only after the subject–target graph places STAT-0004 as contributor toward STAT-0002. Operational guides therefore instruct practitioners to resolve subject and target before inferring health from a lone allocation string, and to treat outlier category and exit jointly when a safeguard owner role coincides with elevated retry_count on a related detection key.

In practice, these fields compose a single evidentiary chain suitable for handbook treatment because each answers a distinct examiner question. Identifier answers which entity; subject and target answer how entities relate; role answers under what authority the relation holds; category and misc answer how to classify and name an anomaly; duration_seconds, exit, and retry_count answer what the automation actually did when confronted with that anomaly. A reviewer tracing PHYS-0004’s duplicate appearance as Cabinet Lockdown Procedure alongside PHYS-0008’s repeated targeting under owner can move without conceptual break to DETE-0003’s dual fact rows—durations 5282.09 and 1182.39, exits 490 and 124, retries 101 and 308—and then to STAT-0001’s kafka-consumer-group allocation observed variously under reviewer and contributor roles against timeout-expired and succeeded-final targets. That continuity is the operational purpose of the model: not to catalog columns, but to make accountability, classification, and runtime behavior mutually legible under audit load.

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