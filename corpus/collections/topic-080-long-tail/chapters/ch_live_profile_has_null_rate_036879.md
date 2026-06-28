---
chapter_id: ch_live_profile_has_null_rate_036879
topic_id: 80
family: 02_observation_measurement
cited_terms: ['profile_has_null_rate', 'kernel_event_with_tid', 'instrument_subclass']
model: engine-refine
---

In distributed telemetry and instrumentation registries, every observable datum is anchored to a stable identifier that survives schema evolution and cross-system reconciliation. Identifiers such as RATE-0001, TID-0001, and INST-0001 serve as the immutable keys by which profiles, kernel events, and physical instruments are referenced across the entire data fabric. A profile identified as RATE-0003 may carry the configuration label QualityGateConfig, while RATE-0004 is associated with ObservationProtocolAlpha; similarly, kernel event TID-0001 is bound to the ZFS on Linux kernel, and instrument INST-0001 denotes an X-Ray Diffractometer Bruker D8. These identifiers are not merely row handles—they are the semantic anchors that permit attribute values, null-rate classifications, and role assignments to be resolved unambiguously regardless of which subsystem is performing the lookup.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | RATE-0001 |
| TID-0002 | Darwin 22.4.0 | RATE-0006 |
| TID-0003 | FreeBSD 13.2 | RATE-0003 |
| TID-0004 | Linux 5.15.0 | RATE-0006 |
| TID-0005 | ZFS on Linux | RATE-0001 |
| TID-0006 | Red Hat 4.18 | RATE-0004 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

Attributes and their typed values form the core measurement vocabulary. Each attribute is declared with a name—duration_seconds, end_time, exit_code, host_name—and a corresponding type drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This type declaration governs how the misc column, which stores the actual value payload, is interpreted. A decimal attribute such as duration_seconds carries values like 5060.73 or 6983.04; a dateTime attribute such as end_time holds timestamps including 2025-02-14T18:33:06 and 2024-07-20T10:27:40; an integer attribute such as exit_code stores codes like 883 and 384; and a string attribute such as host_name accommodates free-form values including gw-12 and running. The separation of attr_name, attr_type, and value into distinct typed tables ensures that each measurement is stored in its native representation, eliminating the coercion errors that plague single-column value stores.

The entity column ties every attribute value back to the specific kernel event or instrument that produced it. Within the decimal value table, entity_id references such as TID-0001 and TID-0002 indicate which event instance owns each duration_seconds reading; within the varchar value table, the same entity_id values link host_name and exit_code measurements to their originating events. This entity-attr-value triad constitutes the fundamental measurement record: an entity produces an attribute of a given type, and the misc column holds the concrete value. The design permits a single entity to carry multiple attributes of different types—TID-0001, for instance, has associated decimal, dateTime, integer, and varchar values—while preserving type safety through table-level segregation.

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

Relationships between profiles and null-rate classifications are mediated through a junction table that encodes both subject and target along with a role qualifier. In this model, profile_id designates the subject of the relationship, null_rate_id designates the target, and role specifies the nature of the association—owner, contributor, or reviewer. Profile RATE-0003 is the subject of a relationship whose target is RATE-0005 and whose role is owner; profile RATE-0007 is linked to target RATE-0002 as a contributor; and profile RATE-0004 appears twice, once as reviewer of target RATE-0006 and once as contributor of target RATE-0001. This tripartite encoding of subject, target, and role enables fine-grained governance: the same profile can hold different responsibilities across different null-rate classifications, and the same null-rate can be associated with multiple profiles in different capacities.

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

Instrument registries extend the same identifier-driven model with temporal and categorical metadata. The created_date column records when each instrument was registered—2023-09-27 for the X-Ray Diffractometer Bruker D8, 2023-08-26 for the Flow Cytometer BD FACSCanto, 2023-03-12 for the Seismometer CMG-3ESP, and 2023-09-07 for the Spectrophotometer XPS-500—providing an audit trail of instrument onboarding. The tags column carries classification labels such as archived, internal, and verified, enabling operational filtering and compliance reporting. Each instrument also declares what it produces_measurement, whether ion intensity, infrared radiation, or ground acceleration, establishing the physical quantity that downstream attribute values will represent. Together, created_date and tags form a lightweight governance layer that sits alongside the richer attribute-value model, allowing operators to reason about instrument provenance and status without traversing the full measurement graph.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | ion intensity | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | infrared radiation | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | ground acceleration | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | ground acceleration | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | voltage waveform | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | ion intensity | 2024-03-26 | archived |