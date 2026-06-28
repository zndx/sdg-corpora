---
chapter_id: ch_live_measurement_with_unit_1dfa75
topic_id: 65
family: 02_observation_measurement
cited_terms: ['measurement_with_unit', 'constraint_check_subclass', 'ebpf_event_writes_to_map']
model: engine-refine
---

Measurement ontologies in data governance infrastructures are typically decomposed across a tripartite schema that separates the semantic entity from its unit of measure and the administrative relationship binding them. The `t_measurement_with_unit` table anchors the conceptual layer, storing measurement definitions such as Blood pressure, Ozone concentration, Seismic magnitude, and Network latency under opaque identifiers like UNIT-0001 through UNIT-0004. The `t_measurement_with_unit_unit` table provides the complementary unit registry, where milligrams per deciliter, Richter scale, milliseconds, and beats per minute are each keyed by the same identifier namespace. These two entities are reconciled through the junction table `t_measurement_with_unit__unit`, which materializes the association with a composite key and introduces a role column that distinguishes administrative positions—owner, reviewer, and observer—within the measurement lifecycle. The cross-references are explicit: a row in the junction table carries measurement_id pointing to `t_measurement_with_unit` and unit_id pointing to `t_measurement_with_unit_unit`, so that UNIT-0004 in the measurement dimension is paired with UNIT-0001 from the unit dimension under the role of owner, while UNIT-0008 maps to UNIT-0005 as reviewer. This separation of concerns permits a single measurement concept to be expressed in multiple units and a single unit to serve multiple measurements, with the role column encoding governance semantics that determine who may authorize changes.

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

Constraint validation is modeled as a parallel dimensional structure in `t_constraint_check_subclass`, where each constraint is identified by a code such as CHEC-0001 through CHEC-0004 and described by a human-readable label—Null field rejection, Anomaly detection threshold, Header presence check—alongside the enforcement mechanism, which ranges from Great Expectations validator to Schema registry linter to Audit log parser. Two boolean and integer columns govern execution policy: mandatory, which flags constraints as true or false to distinguish hard requirements from advisory checks, and priority, an ordinal ranking from 1 through 5 that determines evaluation order. The constraint Null field rejection appears twice in the dataset, once with priority 1 and mandatory true and once with priority 5 and mandatory true, suggesting that the same logical rule can be instantiated at different evaluation stages or applied to different data domains with distinct urgency levels. The constraint Anomaly detection threshold carries priority 4 and mandatory true, while Header presence check carries priority 1 but mandatory false, illustrating that low priority does not necessarily imply optional enforcement and that the two columns encode orthogonal dimensions of policy.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | Great Expectations validator | true | 1 |
| CHEC-0002 | Null field rejection | Schema registry linter | true | 5 |
| CHEC-0003 | Anomaly detection threshold | Great Expectations validator | true | 4 |
| CHEC-0004 | Header presence check | Audit log parser | false | 1 |
| CHEC-0005 | Batch size limit | Prometheus alertmanager | false | 4 |

Observability data for eBPF programs is captured in the fact table `fact_ebpf`, which records execution telemetry keyed by identifiers MAP-0001 through MAP-0004 and linked to map metadata through the writes_to_map_key column. This column functions as a foreign key into `dim_writes_to_map`, a dimension table that assigns human-readable labels such as Writes To Map Label 01 through Writes To Map Label 04 and categorical classifications like Writes To Map Category 01 through Writes To Map Category 04 to each map. The fact table itself carries three quantitative attributes: duration_seconds, which spans from 4285.04 to 6511.30 across the observed records; exit_code, an integer ranging from 224 to 948 that encodes termination status; and retry_count, which varies from 25 to 439 and reflects the number of recovery attempts before final resolution. The mapping is direct—MAP-0001 in the fact table references MAP-0001 in the dimension table, MAP-0002 references MAP-0002, and so on—ensuring that every execution event can be contextualized by its associated map label and category.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

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

The structural design across all six tables follows a star-schema logic in which the fact table `fact_ebpf` sits at the center of a queryable graph, flanked by the dimensional lookup `dim_writes_to_map` and connected indirectly to the measurement ontology through the constraint validation framework. The constraint table does not reference the eBPF fact table directly, but the shared identifier namespace and the presence of priority and mandatory columns suggest that constraint evaluations are applied to measurement data before or during eBPF program execution, with the exit_code and retry_count columns in the fact table serving as downstream indicators of whether constraints were satisfied. The junction table `t_measurement_with_unit__unit` introduces an additional layer of indirection, where the role column—taking values of owner, reviewer, and observer—adds a governance axis to the measurement-unit pairing that is absent from the flat dimension tables. This multi-layered decomposition, while increasing join complexity, enables fine-grained access control, independent evolution of measurement definitions and unit catalogs, and the ability to reassign roles without modifying the underlying measurement or unit records.