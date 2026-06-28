---
chapter_id: ch_live_allocation_succeeded_or_failed_e825c6
topic_id: 46
family: 05_provo_lineage
cited_terms: ['allocation_succeeded_or_failed', 'allocation_with_input_facets', 'allocation_with_output_facets']
model: engine-refine
---

Within any data governance framework, every allocation must carry a stable identifier that serves as the single point of reference across audit trails, lineage graphs, and incident reports. The system assigns identifiers such as `FAIL-0001` through `FAIL-0004` to track allocation outcomes, and `FACE-0001` through `FACE-0004` to track allocations enriched with input facets. These identifiers are not arbitrary; they encode the lifecycle phase of the allocation—failure records versus facet-enriched records—enabling operators to filter, aggregate, and correlate events without ambiguity. An allocation like `Model Training Run` or `Pipeline Summer Ingest` becomes traceable precisely because it is anchored to a unique key, and any downstream reference to that allocation resolves to the same record regardless of which table or view is consulted.

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | cache-warm-cycle |
| FACE-0002 | Cluster Alpha Node |
| FACE-0003 | ETL workflow sprint |
| FACE-0004 | cache-warm-cycle |
| FACE-0005 | Storage tier migration |
| FACE-0006 | cache-warm-cycle |
| FACE-0007 | Cluster Alpha Node |
| FACE-0008 | Storage tier migration |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | Data quality score |
| FACE-0002 | CSV Batch Dump |
| FACE-0003 | Data quality score |
| FACE-0004 | Pipeline execution trace |
| FACE-0005 | CSV Batch Dump |
| FACE-0006 | GraphQL Query Results |
| FACE-0007 | Sensor calibration matrix |

**t_allocation_with_output_facets**

| id | allocation | output_facet | host_name | status |
| --- | --- | --- | --- | --- |
| FACE-0001 | telemetry-buffer | User Event Stream | node-a01 | running |
| FACE-0002 | metric-rollup-daily | Raw JSON Logs | node-b14 | pending |
| FACE-0003 | Batch ingest pipeline | PostgreSQL Snapshot | node-a01 | running |
| FACE-0004 | batch-ingest-main | Telemetry timestamp stream | node-a01 | pending |
| FACE-0005 | Lab reagent distribution | Compute cost ledger | edge-03 | failed |
| FACE-0006 | lake-partition-q3 | Network throughput counter | gw-12 | pending |
| FACE-0007 | Batch ingest pipeline | Lab Reagent Batch | gw-12 | failed |

Status is the mechanism by which the system communicates the current state of an allocation at any given moment. Allocations transition through states such as `running`, `complete`, `pending`, and `failed`, and these transitions are the primary signal for operational dashboards and alerting pipelines. A `Batch ingest pipeline` may show status `running` on one node and `pending` on another, reflecting the distributed nature of data workflows. When an allocation reaches `failed` status—as seen with identifiers `FAIL-0001` and `FAIL-0004`—the status field becomes the trigger for remediation workflows, rollback procedures, or escalation to on-call engineers. Governance frameworks require that status be immutable once recorded for a given point in time, ensuring that audit logs reflect the state of the system as it existed when the observation was made.

**t_allocation_succeeded_or_failed**

| id | allocation | allocation_2 | allocation_3 | status | triggered_by |
| --- | --- | --- | --- | --- | --- |
| FAIL-0001 | Model Training Run | provenance-metadata | lake-partition-q3 | failed | manual |
| FAIL-0002 | Pipeline Summer Ingest | Data lake partition write | replication-stream | running | schedule |
| FAIL-0003 | Batch Window Night | Telemetry Shard Alpha | Model Training Run | complete | manual |
| FAIL-0004 | storage-tier-cold | batch-ingest-main | Lab reagent distribution | failed | api |
| FAIL-0005 | tenant-quota-gold | metric-rollup-daily | ETL workflow sprint | running | api |

Hostname provides the physical or logical grounding for output facets, tying abstract data products to the infrastructure that produces them. Output facets such as `User Event Stream`, `Raw JSON Logs`, and `PostgreSQL Snapshot` are emitted to specific nodes—`node-a01` and `node-b14` in the observed dataset. This mapping is critical for capacity planning, compliance reporting, and incident response: when a `PostgreSQL Snapshot` on `node-a01` is flagged for retention policy violations, the hostname allows operators to isolate the affected infrastructure and apply remediation at the correct tier. In regulated environments, knowing which hostname produced which output facet is often a regulatory requirement, as data residency and sovereignty rules may dictate where certain data types can reside.

The relationship between subject, target, and role forms the backbone of access control and data lineage within the framework. A subject—represented by an allocation identifier such as `FACE-0001` or `FACE-0007`—is linked to a target, which is an input facet identifier like `FACE-0002` or `FACE-0005`. The role column defines the nature of that link: `owner`, `reviewer`, or `contributor`. An allocation may own its input facet, meaning it is responsible for producing or maintaining it; it may review an input facet, indicating a validation or quality-check relationship; or it may contribute to an input facet, suggesting a partial or shared dependency. This triad enables fine-grained lineage tracking and supports the principle of least privilege, as role assignments determine which teams or individuals can modify, audit, or consume a given allocation-facet pairing.

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |

Triggeredby captures the origin of an allocation, distinguishing between `manual`, `schedule`, and `api` initiations. This field is essential for accountability and change management: a `manual` trigger implies human intervention and should be logged with operator identity and timestamp; a `schedule` trigger indicates an automated, time-based workflow that should be governed by change-control policies; and an `api` trigger signals programmatic initiation, which may require authentication and authorization checks. When an allocation such as `storage-tier-cold` is triggered by `api`, the system can correlate that event with API gateway logs to verify that the call was authorized. Governance frameworks typically mandate that triggeredby be immutable, as it represents a factual record of how the allocation was initiated, not a field subject to later correction.