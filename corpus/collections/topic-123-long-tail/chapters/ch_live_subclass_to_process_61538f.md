---
chapter_id: ch_live_subclass_to_process_61538f
topic_id: 123
family: 01_foundation
cited_terms: ['subclass_to_process', 'aggregation_grouped_by', 'observation_governed_by_policy']
model: engine-refine
---

In governed operational metadata, an identifier is the durable handle by which every recordable object remains addressable across ingestion, audit, and reconciliation. Identifiers are not merely surrogate keys; they encode lineage and class membership through stable prefixes and ordinal suffixes, so that PROC-0001, GROU-0002, and POLI-0004 can be referenced unambiguously when processes are retried, aggregations are recomputed, or policy observations are correlated with downstream remediation. Because the same identifier may appear as the primary key of a definitional row, as an entity reference on a measured fact, or as an attribute reference on a typed value store, governance depends on treating identifiers as typed references rather than interchangeable strings. A duration measurement bound to PROC-0001 and an end-time stamp likewise bound to PROC-0001 are distinct facts precisely because their attribute identifiers differ, even when the entity identifier is shared.

**t_aggregation_grouped_by**

| id | aggregation |
| --- | --- |
| GROU-0001 | cross_department_access_log |
| GROU-0002 | monthly_billing_snapshot |
| GROU-0003 | daily_traffic_rollup |
| GROU-0004 | monthly_billing_snapshot |
| GROU-0005 | monthly_billing_snapshot |
| GROU-0006 | regional_temperature_average |

**t_aggregation_grouped_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GROU-0001 | confidence | xsd:decimal |
| GROU-0002 | dimension_kind | xsd:string |
| GROU-0003 | method | xsd:string |
| GROU-0004 | recorded_at | xsd:dateTime |
| GROU-0005 | uncertainty | xsd:decimal |
| GROU-0006 | unit | xsd:string |
| GROU-0007 | value | xsd:decimal |
| GROU-0008 | encoding | xsd:string |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

An entity is the operational subject to which attributes attach and from which evidentiary values are collected. Entities instantiate the classes that the organization cares to measure and control: executable process subclasses such as incident response and telemetry aggregation; aggregation groupings such as cross_department_access_log and monthly_billing_snapshot; and policy-governed observations including north vent temperature spike and edge gateway heartbeat timeout. The entity identifier anchors interpretation: when entity_id resolves to PROC-0001, a decimal value of 5106.96 denotes elapsed duration for that process execution, whereas the same numeric magnitude attached to POLI-0001 would denote a wholly different observational context. Multiplicity is expected and informative—PROC-0001 may simultaneously carry a duration_seconds reading, multiple end_time records keyed to different attribute identifiers, and varchar miscellany such as worker-07 and closeout—because entities accrete heterogeneous evidence over their lifecycle rather than collapsing into a single wide row.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

**t_aggregation_grouped_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0004 | 2025-01-14T14:41:10 |
| GROU-0002 | GROU-0002 | GROU-0004 | 2023-10-30T01:59:25 |
| GROU-0003 | GROU-0003 | GROU-0004 | 2023-04-12T02:41:30 |
| GROU-0004 | GROU-0004 | GROU-0004 | 2023-12-16T14:56:57 |
| GROU-0005 | GROU-0005 | GROU-0004 | 2023-04-07T15:52:42 |
| GROU-0006 | GROU-0006 | GROU-0004 | 2023-09-07T01:41:33 |

**t_aggregation_grouped_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0001 | 0.676 |
| GROU-0002 | GROU-0001 | GROU-0005 | 770.46 |
| GROU-0003 | GROU-0001 | GROU-0007 | 107.12 |
| GROU-0004 | GROU-0002 | GROU-0001 | 0.437 |
| GROU-0005 | GROU-0002 | GROU-0005 | 595.38 |
| GROU-0006 | GROU-0002 | GROU-0007 | 23.10 |
| GROU-0007 | GROU-0003 | GROU-0001 | 0.551 |
| GROU-0008 | GROU-0003 | GROU-0005 | 567.02 |

**t_aggregation_grouped_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0002 | Dimension Kind 01 |
| GROU-0002 | GROU-0001 | GROU-0008 | Encoding 02 |
| GROU-0003 | GROU-0001 | GROU-0009 | calibration record |
| GROU-0004 | GROU-0001 | GROU-0010 | en |
| GROU-0005 | GROU-0001 | GROU-0003 | manual |
| GROU-0006 | GROU-0001 | GROU-0006 | ms |
| GROU-0007 | GROU-0002 | GROU-0002 | Dimension Kind 07 |
| GROU-0008 | GROU-0002 | GROU-0008 | Encoding 08 |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

An attribute, denoted attr, names the semantic dimension along which an entity is characterized. Attributes are declared independently of any single observation: duration_seconds, end_time, exit_code, and host_name recur across process, aggregation, and policy domains, while aggregation-specific attrs such as confidence, dimension_kind, method, and recorded_at extend the vocabulary where rollup semantics require it. The attribute name is the contract surface for consumers—dashboards, compliance queries, and automated validators all resolve meaning through attr before they inspect value. Attribute identifiers (for example PROC-0003 for exit_code within the process vocabulary, or GROU-0004 for recorded_at within aggregation) allow the same logical attr name to be typed and versioned per subclass without conflating storage partitions; a validator therefore keys on attr_id, not on the bare string exit_code, when selecting which typed value relation to consult.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

Attribute type, attr_type, specifies the interpretive and persistence regime under which a named attribute may legally hold data. In practice the framework maps attrs to XML Schema datatypes—xsd:decimal for durations and confidence scores, xsd:dateTime for temporal bounds and recorded_at stamps, xsd:integer for exit codes and discrete counters, xsd:string for host names, dimension kinds, encodings, and locale markers—so that coercion, comparison, and retention rules are enforced at write time rather than discovered at report time. The attr_type declaration is what justifies physical separation of misc values into parallel stores: decimals such as 6532.76 and 0.676, integers such as 684 and 46, timestamps such as 2024-02-25T00:58:35 and 2025-01-14T14:41:10, and varchar misc including Log Level 02, calibration record, and en each land in the relation whose column typing matches the declared attr_type. When attr_type and misc disagree—an integer exit_code stored as free text, or a confidence score written without decimal precision—the error is classified as a type integrity violation rather than a business-rule exception, which is why attr_type sits adjacent to attr in definitional registries and precedes value acceptance in ingestion pipelines.

Misc designates the stored datum itself—the evidentiary payload that completes the entity–attribute pair. Misc is deliberately typed in storage but semantically open in content: it may be a measured quantity (6219.83 seconds), a boundary event (2023-08-16T19:41:47), a status token (pending, complete), or a dimensional label (Dimension Kind 01). The term misc reflects that, once entity and attr have fixed the meaning, the value may still vary widely in lexical form while remaining governable through attr_type. Operational practice resolves misc by joining identifier triples: each value row carries its own primary identifier, an entity_id selecting the subject, and an attr_id selecting the dimension, with misc holding the literal. Repeated entity_id with divergent attr_id on the same entity—as when PROC-0001 carries end_time values 2024-02-25T00:58:35, 2025-01-11T16:52:13, and 2024-01-24T01:55:59 under distinct attribute keys—signals either multi-episode measurement or supersession, and audit procedures treat those rows as a time-ordered evidentiary series rather than duplicates. Conversely, shared attr_id across entities, such as GROU-0004 recorded_at stamps spanning GROU-0001 through GROU-0004, enables class-wide temporal alignment without normalizing each aggregation definition into a bespoke schema.

Together, identifier, entity, attr, attr_type, and misc form a layered evidentiary grammar suitable for compliance-grade metadata where subclasses proliferate but analytic rigor must not. Identifiers guarantee referential stability; entities supply the real-world or operational referent; attrs declare what may be said about that referent; attr_types constrain how it may be said; and misc records what was in fact said at capture time. Mature governance treats the quintet as inseparable: a misc value absent entity context is inadmissible, an attr without attr_type is unenforceable, and an entity without durable identifier cannot be bound into policy lineage. The recurring parallel structure across process execution, aggregation grouping, and policy-governed observation demonstrates the pattern’s domain neutrality—whether the entity is batch ingestion or core switch packet loss, the same interpretive machinery applies, and auditors can traverse from identifier to misc, and back through attr_type to attr, with the same evidentiary warrant at every layer.