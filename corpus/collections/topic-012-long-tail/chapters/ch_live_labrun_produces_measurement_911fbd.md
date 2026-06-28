---
chapter_id: ch_live_labrun_produces_measurement_911fbd
topic_id: 12
family: 02_observation_measurement
cited_terms: ['labrun_produces_measurement', 'process_uses_artifact', 'ringbuf_map_subclass']
model: engine-refine
---

The execution telemetry captured in the laboratory run fact table centers on a unique identifier—MEAS-0001 through MEAS-0004—that anchors each measurement event, while the associated labrun key establishes a referential link to the dimension table where each run is classified under a category such as Labrun Category 01 or Labrun Category 02 and annotated with a human-readable label like Labrun Label 01. This categorical taxonomy serves as the primary grouping mechanism for downstream aggregation and governance reporting, enabling operators to distinguish between measurement types without parsing raw identifiers. The duration_seconds column records wall-clock execution times ranging from 4308.22 seconds for MEAS-0002 to 5155.73 seconds for MEAS-0005, providing a quantitative basis for performance benchmarking and capacity planning across heterogeneous workloads.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |

Exit codes constitute the failure taxonomy for these runs, with values such as 122, 691, 566, and 3 encoding distinct termination conditions that map to specific error classes within the operational framework. These codes are not arbitrary; they follow a structured convention where each integer corresponds to a documented failure mode, allowing automated alerting systems to route incidents to the appropriate remediation playbook. Coupled with the retry_count metric—which registers 265 retries for MEAS-0001, 244 for MEAS-0002, 106 for MEAS-0003, and a comparatively modest 12 for MEAS-0005—the exit code and retry data together form a diagnostic triad that reveals both the severity of failures and the resilience of the retry mechanism. A run that terminates with exit code 122 after 265 retries signals a persistent, non-transient fault, whereas exit code 3 with only 12 retries suggests a recoverable condition that the system successfully navigated.

In the process-artifact mapping table, the concept of retrycount reappears under a different operational context, tracking the number of retry attempts for scheduled processes such as log_shipment, index_rebuild, and trace_sampling. Here the values diverge significantly from the laboratory run domain: ARTI-0001 records 50 retries for a log_shipment process, ARTI-0002 and ARTI-0003 register 207 and 193 retries respectively for index_rebuild operations, and ARTI-0004 logs 487 retries for trace_sampling. The scheduled_at column anchors each process to a precise point in time—2025-02-18T02:41:43 for ARTI-0001, 2024-07-19T11:09:21 for ARTI-0002, 2025-02-01T09:38:01 for ARTI-0003, and 2024-04-29T06:10:14 for ARTI-0004—enabling temporal correlation between retry frequency and time-of-day patterns, maintenance windows, or system load conditions.

**t_process_uses_artifact**

| id | process | retry_count | scheduled_at |
| --- | --- | --- | --- |
| ARTI-0001 | log_shipment | 50 | 2025-02-18T02:41:43 |
| ARTI-0002 | index_rebuild | 207 | 2024-07-19T11:09:21 |
| ARTI-0003 | index_rebuild | 193 | 2025-02-01T09:38:01 |
| ARTI-0004 | trace_sampling | 487 | 2024-04-29T06:10:14 |

The ring buffer subsystem introduces a three-way association model that separates concerns between buffer definitions, configuration specifications, and the roles that govern their interaction. The t_ringbuf_map_subclass table defines individual buffers—metrics capture ring, diagnostic trace buffer, audit log ring, and sensor stream buffer—each identified by a MAP-prefixed identifier. The t_ringbuf_map_subclass_ring_buffer_config table enumerates the configuration parameters that govern buffer behavior, including sync mode spec, compression profile, and buffer depth spec. The junction table t_ringbuf_map_subclass__ring_buffer_config binds these two entities together through a subject column that references the ring buffer identifier and a target column that references the configuration identifier, with a role column assigning one of four access designations—observer, reviewer, contributor, or owner—to each binding. This role-based assignment ensures that governance policies can be enforced at the point of association, distinguishing between entities that merely monitor buffer state (observer), validate configuration integrity (reviewer), modify buffer parameters (contributor), and exercise full administrative control (owner).

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |