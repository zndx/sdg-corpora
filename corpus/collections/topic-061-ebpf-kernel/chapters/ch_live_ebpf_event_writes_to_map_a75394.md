---
chapter_id: ch_live_ebpf_event_writes_to_map_a75394
topic_id: 61
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'measurement_with_unit', 'subclass_disjoint_from_artifact']
model: engine-refine
---

Operational telemetry for extended Berkeley Packet Filter map writes rests on a small set of correlated attributes whose joint interpretation determines whether a deployment satisfies retention, attribution, and failure-handling obligations. The identifier anchors every downstream join: MAP-0001 through MAP-0004 denote distinct write targets in the fact layer, each keyed for reconciliation against dimensional metadata and for audit replay when exit codes or retry counts fall outside approved envelopes. Without a stable identifier, duration and exit evidence cannot be attributed to a governed map class, and cross-table lineage from measurement subjects to artifact disjointness rules collapses into undifferentiated event streams.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |

The writes-to-map reference is the operational target of each recorded invocation, and it is the field that most directly couples runtime behavior to the classification plane. Fact rows bind MAP-0001 to MAP-0002, MAP-0002 to MAP-0004, MAP-0003 to MAP-0001, and MAP-0004 to MAP-0006, illustrating that the identifier on the fact row and the writes-to-map key need not coincide: governance must treat the latter as the authoritative map endpoint even when dimensional coverage is incomplete, as with MAP-0006, which appears in execution evidence but lacks a corresponding row in the writes-to-map dimension. Category and misc attributes supply the human-legible and policy-sortable layer atop that endpoint. Writes To Map Category 01 through 04 partition targets for control selection—rate limits, approval workflows, and escalation thresholds—while Writes To Map Label 01 through 04 carry the miscellaneous display and routing metadata auditors expect when exit codes must be explained to non-engineering stakeholders.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Duration in seconds and exit code together form the primary service-level and compliance signal for map-write programs. Observed durations of 5223.15, 6511.30, 6092.75, and 4285.04 seconds show that nominally similar map targets can diverge by more than fifty percent in wall-clock cost, a spread that capacity planners and control owners must normalize against category before declaring drift. Exit codes 224, 266, 948, and 381 are not interchangeable success markers; in governed environments they are mapped to remediation playbooks, and their co-occurrence with elevated retry counts—439 and 201 on some paths versus 25 and 33 on others—distinguishes systemic pressure from isolated fault. Retry count therefore functions as a resilience counterweight to exit: a high count with a non-zero exit, as on the MAP-0001 lineage, typically triggers mandatory backoff review, whereas a moderate exit with low retries may be closed as a single-shot anomaly if duration remains within the category baseline.

Subject, target, and role extend the same evidentiary discipline into measurement governance, where observability quantities must be bound to units under explicit accountability. The measurement catalog registers Blood pressure, Ozone concentration, Seismic magnitude, and Network latency as first-class subjects; the unit registry supplies beats per minute, milligrams per deciliter, Richter scale, and milliseconds as targets. The bridging relation assigns role owner, reviewer, or observer to each subject–target pair, so Network latency may be owned under one unit binding while Ozone concentration and Seismic magnitude are reviewed under Richter and milligram-per-deciliter targets respectively. Mismatches between bridge identifiers and catalog keys—measurement references such as UNIT-0008 and UNIT-0005 that do not resolve in the base measurement table—are themselves compliance findings: they indicate stale ownership rows or unauthorized unit substitution before any ebpf map write is accepted as evidentiary input.

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |

Artifact disjointness closes the loop by preventing category collapse across incompatible telemetry and assay constructs. Declared disjoint classes lab-assay-protocol, sensor-telemetry-stream, and telemetry-metadata-index specify which artifact subclasses may not share map namespaces or measurement roles without explicit waiver. Duplicate indexing of telemetry-metadata-index across ARTI-0003 and ARTI-0004 shows that disjointness is a constraint on class extension, not on identifier uniqueness: two artifacts may remain distinct by identifier while still inheriting the same prohibition against co-mingling with lab-assay-protocol streams. Practitioners should therefore evaluate every writes-to-map operation through a stacked filter—identifier resolution, category and misc labeling, duration and exit thresholds, retry policy, subject–target–role attestation, and disjoint artifact class—so that a single MAP-0004 invocation at 4285.04 seconds with exit 381 and thirty-three retries is read not as an isolated integer set but as a governed decision record whose meaning is fixed only when all planes align.