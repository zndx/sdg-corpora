---
chapter_id: ch_live_classification_subclass_df41f5
topic_id: 105
family: 03_directive_governance
cited_terms: ['classification_subclass', 'bullying_response_process', 'allocation_subclass']
model: engine-refine
---

Bullying response processes constitute the governed workflows through which a school district documents, routes, and resolves interpersonal harm incidents, and each process is distinguished by a stable identifier that permits audit retrieval without ambiguity across case files, staff assignments, and downstream compliance checks. A playground dispute and a hallway shoving report are not interchangeable administrative events: they invoke different procedural postures, different evidentiary thresholds, and different accountable parties. Where PROC-0001 designates Playground-Dispute and PROC-0002 designates Hallway-Shoving-Report, the identifier anchors the record so that subsequent actions—counseling referrals, disciplinary determinations, parent notification—remain traceable to the originating process rather than dissolving into undifferentiated “behavior incidents.” The bullyingresponseprocess field carries the human-readable process name that staff and reviewers use in daily operations; the identifier carries the machine- and audit-durable key that systems, exports, and cross-references require.

Participation in a bullying response process is not anonymous or collective in the abstract; it is bound to schoolstaffrole assignments that specify which institutional actor holds procedural responsibility for a given workflow. GuidanceCounselor is recorded as the participant for Playground-Dispute, DeanOfStudents for Hallway-Shoving-Report, Principal for Cafeteria-Conflict, and VicePrincipal for Exclusion-Plan. These roles matter because they establish who may initiate steps, who receives escalations, and whose signature or attestation closes a stage. A cafeteria conflict routed to the Principal and an exclusion plan routed to the Vice Principal reflect deliberate governance design: restorative and situational interventions differ from plans that may restrict a student’s access to peers or spaces, and the role field makes that delegation explicit rather than inferred from job titles in an org chart.

Parallel to incident governance runs a classification layer in which compliance subclasses are evaluated, terminated, and recorded through exitcode and status pairs that function as the operational verdict of each assessment run. An OWASP Risk Rating evaluation that returns exitcode 493 and status failed signals that the control framework did not satisfy its acceptance criteria and cannot be treated as authoritative for risk posture until remediated. By contrast, a GDPR Data Category review completing with exitcode 581 and status complete, or a CIS Benchmark review completing with exitcode 197 and status complete, establishes that those subclasses have passed their respective gates. The pending disposition attached to exitcode 301 on another GDPR Data Category record illustrates the intermediate state that auditors must not collapse into either failure or completion: pending means the subprocess is in flight, dependencies unresolved, or reviewer action outstanding, and status therefore governs whether downstream allocations, reports, or policy attestations may proceed.

Where incident response meets data operations, allocation subclasses name the recurring workloads—nightly-ingest, etl-daily-load, batch-prod-main—that materialize compliance and behavioral analytics into production environments, and each allocation is executed through a transformation substrate such as Celery Worker, dbt Runner, Flink TaskManager, or TensorFlow Serving. The junction semantics of subject and target make the directed relationship auditable: subject identifies the originating allocation (for example ALLO-0001 nightly-ingest or ALLO-0004 batch-prod-main), while target identifies the executes_transformation node that performs the work (ALLO-0001 Celery Worker, ALLO-0005, ALLO-0006, or ALLO-0004 TensorFlow Serving). Role qualifies that edge—contributor, owner, or observer—so that responsibility for a pipeline link is not merely topological but accountable. An owner assignment on the etl-daily-load pairing confers operational authority over that binding; observer status on a batch-prod-main link permits monitoring without mutation rights; contributor status marks shared execution duty without sole custody.

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

Taken together, identifier stability across PROC-, CLAS-, and ALLO- namespaces, the schoolstaffrole participant binding on bullyingresponseprocess records, the exitcode/status adjudication on classification subclasses, and the subject–target–role triple on allocation-to-transformation links form a single evidentiary grammar. Investigators can reconstruct who was responsible for Exclusion-Plan, whether GDPR and CIS benchmark gates were complete or failed at the time of an incident export, and which batch workload and serving transformation produced the metrics that informed a dean’s decision. That reconstruction is the practical purpose of the model: not to catalog fields, but to ensure that human judgment in school safety workflows remains coupled to machine-verifiable compliance state and to data-lineage accountability, so that no report of Hallway-Shoving-Report or Cafeteria-Conflict stands isolated from the classification and ingestion posture that surrounded it when the record was created.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

**t_bullying_response_process**

| id | bullying_response_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Playground-Dispute | GuidanceCounselor |
| PROC-0002 | Hallway-Shoving-Report | DeanOfStudents |
| PROC-0003 | Cafeteria-Conflict | Principal |
| PROC-0004 | Exclusion-Plan | VicePrincipal |
| PROC-0005 | Cyberbullying-Alert | SchoolNurse |

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |