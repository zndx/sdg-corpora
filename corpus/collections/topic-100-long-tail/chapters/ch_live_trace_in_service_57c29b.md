---
chapter_id: ch_live_trace_in_service_57c29b
topic_id: 100
family: 02_observation_measurement
cited_terms: ['trace_in_service', 'dempster_combinant_first', 'constraint_subclass']
model: engine-refine
---

ATTRIBUTES, their typed values, and the entities to which they attach form the backbone of a structured observability model. Each service instance—identified by a surrogate key such as SERV-0001 through SERV-0004—is associated with a trace descriptor (ci-cd-deploy-run, nightly-data-sync, microservice-call-path, sensor-telemetry-batch) and a parent service reference (FIRS-0002, FIRS-0003, FIRS-0005, FIRS-0006). The attribute schema itself is declared separately: attribute names like duration_seconds, end_time, exit_code, and host_name are paired with an attr_type drawn from the XSD namespace (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string), establishing a type discipline that governs how values are stored and validated downstream.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | FIRS-0006 |
| SERV-0002 | nightly-data-sync | FIRS-0002 |
| SERV-0003 | microservice-call-path | FIRS-0005 |
| SERV-0004 | sensor-telemetry-batch | FIRS-0003 |
| SERV-0005 | nightly-data-sync | FIRS-0002 |
| SERV-0006 | microservice-call-path | FIRS-0003 |

**t_trace_in_service_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SERV-0001 | duration_seconds | xsd:decimal |
| SERV-0002 | end_time | xsd:dateTime |
| SERV-0003 | exit_code | xsd:integer |
| SERV-0004 | host_name | xsd:string |
| SERV-0005 | log_level | xsd:string |
| SERV-0006 | phase | xsd:string |
| SERV-0007 | retry_count | xsd:integer |
| SERV-0008 | scheduled_at | xsd:dateTime |

Typed value storage is partitioned by attr_type into four dedicated value tables, each keyed by an identifier, an entity_id that references the owning service, and an attr_id that resolves to the attribute definition. Decimal-valued attributes such as duration_seconds carry magnitudes ranging from 2082.99 to 5138.88; integer-valued attributes like exit_code and a second numeric attribute hold values between 59 and 744; datetime attributes record timestamps spanning from 2023-02-11T21:39:45 through 2025-04-17T05:33:23; and varchar attributes capture free-form strings including node-b14, Log Level 02, initiation, and failed. This normalization by type ensures that each value column enforces its domain constraint at the storage layer, eliminating the need for runtime type coercion.

**t_trace_in_service_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0002 | 2023-02-11T21:39:45 |
| SERV-0002 | SERV-0001 | SERV-0008 | 2025-04-17T05:33:23 |
| SERV-0003 | SERV-0001 | SERV-0009 | 2024-09-24T02:59:34 |
| SERV-0004 | SERV-0002 | SERV-0002 | 2023-11-01T18:02:16 |
| SERV-0005 | SERV-0002 | SERV-0008 | 2023-07-24T15:59:25 |
| SERV-0006 | SERV-0002 | SERV-0009 | 2023-09-19T06:42:34 |
| SERV-0007 | SERV-0003 | SERV-0002 | 2025-04-22T19:55:46 |
| SERV-0008 | SERV-0003 | SERV-0008 | 2024-12-15T02:05:50 |

**t_trace_in_service_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0001 | 4381.06 |
| SERV-0002 | SERV-0002 | SERV-0001 | 2102.62 |
| SERV-0003 | SERV-0003 | SERV-0001 | 5138.88 |
| SERV-0004 | SERV-0004 | SERV-0001 | 2082.99 |
| SERV-0005 | SERV-0005 | SERV-0001 | 6123.82 |
| SERV-0006 | SERV-0006 | SERV-0001 | 5465.25 |

**t_trace_in_service_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0003 | 744 |
| SERV-0002 | SERV-0001 | SERV-0007 | 59 |
| SERV-0003 | SERV-0002 | SERV-0003 | 247 |
| SERV-0004 | SERV-0002 | SERV-0007 | 232 |
| SERV-0005 | SERV-0003 | SERV-0003 | 916 |
| SERV-0006 | SERV-0003 | SERV-0007 | 56 |
| SERV-0007 | SERV-0004 | SERV-0003 | 376 |
| SERV-0008 | SERV-0004 | SERV-0007 | 417 |

**t_trace_in_service_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0004 | node-b14 |
| SERV-0002 | SERV-0001 | SERV-0005 | Log Level 02 |
| SERV-0003 | SERV-0001 | SERV-0006 | initiation |
| SERV-0004 | SERV-0001 | SERV-0010 | failed |
| SERV-0005 | SERV-0001 | SERV-0011 | Triggered By 05 |
| SERV-0006 | SERV-0002 | SERV-0004 | node-b14 |
| SERV-0007 | SERV-0002 | SERV-0005 | Log Level 07 |
| SERV-0008 | SERV-0002 | SERV-0006 | initiation |

The Dempster-Shafer evidential reasoning layer introduces a second entity taxonomy centered on combinant-first records. Four primary combinants—UncertaintyPropagationPipeline, MultiSourceInferenceEngine, EvidenceCombinationModel, and ProvenanceAggregator—are each linked to a first_combinant source (HistoricalLogArchive, CoreTelemetryFeed, GroundTruthLabels, PrimaryFlightData) through a junction table that encodes the relationship via subject, target, and role columns. The subject column references the Dempster-side entity (FIRS-0001, FIRS-0005), the target column references the first_combinant-side entity (FIRS-0002, FIRS-0004, FIRS-0005, FIRS-0006), and the role column assigns a semantic function—observer, reviewer, or owner—that qualifies the nature of the evidential linkage.

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

Constraint governance is modeled through a subclass table that binds each constraint to the entity it governs, assigns a numeric priority, and specifies a review_cycle_days interval. The constraint column carries human-readable labels (Geofence boundary, Audit log retention, Data retention policy, Encryption standard); the constrains column identifies the target entity type (Database cluster, Compute node, Network interface, Sensor array); priority values of 2 through 4 establish a relative ordering of enforcement strictness; and review_cycle_days—ranging from 185 to 467 days—define the cadence at which each constraint must be re-evaluated. Together, these fields operationalize a compliance lifecycle in which every governed entity is subject to a defined policy, a defined urgency, and a defined review interval.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | Database cluster | 3 | 311 |
| CONS-0002 | Audit log retention | Compute node | 3 | 467 |
| CONS-0003 | Data retention policy | Network interface | 4 | 185 |
| CONS-0004 | Encryption standard | Sensor array | 2 | 391 |