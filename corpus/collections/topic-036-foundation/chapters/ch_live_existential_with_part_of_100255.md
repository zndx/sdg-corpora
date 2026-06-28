---
chapter_id: ch_live_existential_with_part_of_100255
topic_id: 36
family: 01_foundation
cited_terms: ['existential_with_part_of', 'transformation_with_input_dataset', 'process_produces_ice']
model: engine-refine
---

In governed operational telemetry, an identifier is the durable handle by which every recordable fact remains traceable across time, system boundaries, and audit scope. Identifiers such as PART-0001, DATA-0003, and ICE-0002 are not merely surrogate keys; they anchor lineage so that a regional_telemetry_gateway may be asserted as part_of a geo_redundant_backup, a feature-extraction job over network traffic capture may be correlated with its execution history, and a Cryogenic freezing run may be revisited years later without ambiguity. Where compliance frameworks require demonstrable provenance, the identifier is the first contract: without it, duration, retry behavior, attribute values, and organizational placement collapse into undifferentiated log noise.

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

The entity is the governed object to which facts attach. In process-execution monitoring, ICE-0001 denotes a concrete invocation of Plate freezing—not the abstract process type, but the instantiated run whose observability payload must be retained. Entities participate in relational assertions (existential/part_of linkages among infrastructure components) and in attribute binding (each measured property is scoped to exactly one entity_id). This separation matters in practice because governance policies rarely regulate “a transformation” in the abstract; they regulate identifiable executions, identifiable components, and the evidentiary chain connecting them.

Attributes name what is being measured or declared about an entity, while attr_type constrains how that declaration may be interpreted, validated, and compared. A duration_seconds attribute typed as xsd:decimal admits fractional elapsed time suitable for aggregation and threshold alerting; end_time as xsd:dateTime demands ISO-8601 instant semantics such as 2024-12-21T05:38:52; exit_code as xsd:integer supports discrete outcome taxonomy; host_name as xsd:string carries operational context like ingest-21 or running. Typed attribute registries prevent category errors that undermine audits—treating a timestamp as a number, or coercing an exit code into free text—and they determine which value store receives each observation.

The misc field, in typed value persistence, holds the literal observation once entity and attr have fixed the subject and predicate. Decimal stores record duration_seconds magnitudes (5646.64 for one Plate freezing execution, 6078.60 for Cryogenic freezing); datetime stores capture termination instants spanning 2023-05-16T09:39:52 through 2024-12-21T05:38:52; integer stores encode exit_code and related counters (140, 235, 217, 99); varchar stores retain host_name and stateful descriptors such as Log Level 02 and initiation. Partitioning values by attr_type is an operational necessity: enforcement of format, indexing strategy, and retention classification all follow from type, and mixed-type columns would erode the evidential weight of each reading.

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

durationseconds and retrycount are complementary operational metrics whose joint interpretation supports reliability and performance governance. Transformation workloads expose duration_seconds at the job grain—log aggregation over patient vitals at 7022.59 seconds versus data masking over financial trade records at 722.03 seconds—while process executions expose duration_seconds again as a typed attribute on entity records, enabling cross-domain reconciliation between pipeline SLAs and host-level run telemetry. retry_count quantifies resilience expenditure: values of 337, 418, 276, and 352 across ETL and extraction workloads signal environments where transient failure is routine rather than exceptional, and where compliance reporting must distinguish successful eventual completion from chronic instability. Elevated retries paired with long durations often indicate upstream data-quality or capacity constraints that identifier-level drill-down is meant to expose.

**t_transformation_with_input_dataset**

| id | transformation | input_dataset | duration_seconds | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | log aggregation | patient vitals | 7022.59 | 337 |
| DATA-0002 | feature extraction | network traffic capture | 3575.88 | 418 |
| DATA-0003 | data masking | financial trade records | 722.03 | 276 |
| DATA-0004 | ETL pipeline | genomic sequencing reads | 6380.45 | 352 |
| DATA-0005 | metadata enrichment | raw sensor logs | 5901.31 | 65 |
| DATA-0006 | ETL pipeline | genomic sequencing reads | 1979.98 | 431 |
| DATA-0007 | ETL pipeline | field survey records | 6357.24 | 452 |

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

Taken together, identifier, entity, attr, attr_type, misc, durationseconds, and retrycount form a layered evidence model suitable for handbook-grade operational governance. Identifiers stitch topology (alpha_compute_cluster within audit_logging_system), workload execution (DATA-0004’s ETL pipeline over genomic sequencing reads), and per-run observability (Spray cooling and Direct expansion freezing under the ICE namespace). Attribute typing ensures each misc value is admissible evidence; duration and retry metrics supply the quantitative spine for SLA attestation and incident reconstruction. Mature practice treats these elements not as incidental schema labels but as the minimum vocabulary for answering, with evidentiary rigor, what ran, on what, for how long, with what outcome, and under which organizational placement.