---
chapter_id: ch_live_transformation_min_one_output_25f1c3
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_min_one_output', 'observation_precedes_other', 'transformation_equiv_io_intersection']
model: engine-refine
---

In governed data pipelines and operational telemetry, every assertion must be anchored to a durable reference point before it can be audited, compared, or replayed. The identifier fulfills that anchoring function: a stable, system-assigned key that survives renaming of human-readable labels and permits the same logical object to appear across multiple registries without ambiguity. When a transformation such as deduplicate_patient_ids is registered as OUTP-0001, that code becomes the canonical handle by which downstream link rows, dataset bindings, and compliance queries resolve the same record regardless of how the transformation is described in runbooks or dashboards. Identifiers are therefore not decorative metadata; they are the substrate on which subject–target graphs, attribute bindings, and cardinality annotations are mechanically joined.

Relationships in this model are never expressed as loose textual associations but as directed links between a subject and a target, each link carrying its own identifier and, where governance requires it, an explicit role. The subject denotes the entity that initiates or owns the association—typically the transformation or observation record—while the target denotes the entity acted upon or produced, such as an output_dataset_id bound to masked PII archive or an input_dataset_id bound to raw_telemetry_v3. Roles qualify the nature of participation rather than the existence of the link: the same transformation OUTP-0006 may relate to multiple output datasets through distinct junction rows in which one participant is designated reviewer and others contributor or observer, signalling differentiated accountability without duplicating the underlying transformation definition. On the input side, batch windowing linked to INTE-0005 shows owner and reviewer roles applied to the same transformation class of object, establishing that role is a property of the edge, not of the node.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | deduplicate_patient_ids |
| OUTP-0002 | feature engineering |
| OUTP-0003 | aggregate_daily_metrics |
| OUTP-0004 | data normalization |
| OUTP-0005 | sensor calibration |
| OUTP-0006 | transform_csv_to_parquet |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | user_activity_events |
| OUTP-0002 | windowed telemetry buffer |
| OUTP-0003 | weather_station_features |
| OUTP-0004 | masked PII archive |
| OUTP-0005 | raw_telemetry_v3 |
| OUTP-0006 | deduplicated user profiles |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_transformation_equiv_io_intersection__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0007 | owner |
| INTE-0002 | INTE-0005 | INTE-0004 | reviewer |
| INTE-0003 | INTE-0003 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0006 | contributor |
| INTE-0005 | INTE-0004 | INTE-0004 | owner |
| INTE-0006 | INTE-0003 | INTE-0001 | contributor |
| INTE-0007 | INTE-0004 | INTE-0002 | observer |
| INTE-0008 | INTE-0004 | INTE-0007 | reviewer |

Cardinality note extends this edge-centric discipline into quantitative and structural constraints that prose descriptions alone cannot enforce. Where a transformation emits or consumes datasets under policies that permit one-to-one, one-to-many, or bounded many-to-many patterns, the cardinality note records the applicable rule at the binding site—Cardinality Note 01 through Cardinality Note 04 in the equivalence-and-intersection registry—so that validators, orchestration planners, and auditors can detect when a proposed wiring violates declared limits before execution. A note attached to the link between resample_telemetry_stream and clinical_trials_normalized is evaluated at the relationship grain, not merely at the transformation grain, because cardinality is fundamentally a statement about how many targets a given subject may legitimately hold, or conversely how many subjects may share a target, under the intersection semantics of equivalent inputs and outputs.

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | batch windowing |
| INTE-0002 | batch windowing |
| INTE-0003 | filter_null_records |
| INTE-0004 | resample_telemetry_stream |
| INTE-0005 | normalize_timestamps |
| INTE-0006 | record deduplication |

**t_transformation_equiv_io_intersection_input_dataset**

| id | input_dataset |
| --- | --- |
| INTE-0001 | raw_telemetry_v3 |
| INTE-0002 | curated events table |
| INTE-0003 | deduplicated user profiles |
| INTE-0004 | network_traffic_logs |
| INTE-0005 | raw_telemetry_v3 |
| INTE-0006 | sensor_aggregates_daily |
| INTE-0007 | aggregated metrics store |

**t_transformation_equiv_io_intersection_output_dataset**

| id | output_dataset |
| --- | --- |
| INTE-0001 | weather_station_data |
| INTE-0002 | masked PII archive |
| INTE-0003 | clinical_trials_raw |
| INTE-0004 | clinical_trials_normalized |
| INTE-0005 | app_clickstream |
| INTE-0006 | user_activity_metrics |

**t_transformation_equiv_io_intersection__output_dataset**

| id | transformation_id | output_dataset_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0006 | contributor | Cardinality Note 01 |
| INTE-0002 | INTE-0001 | INTE-0005 | observer | Cardinality Note 02 |
| INTE-0003 | INTE-0002 | INTE-0001 | observer | Cardinality Note 03 |
| INTE-0004 | INTE-0003 | INTE-0003 | reviewer | Cardinality Note 04 |
| INTE-0005 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 05 |
| INTE-0006 | INTE-0002 | INTE-0006 | contributor | Cardinality Note 06 |
| INTE-0007 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 07 |
| INTE-0008 | INTE-0006 | INTE-0006 | owner | Cardinality Note 08 |

Observable facts about the world—whether a server_disk_full observation precedes firmware_update_init or packet_drop_event precedes power_stabilization—gain evidentiary weight only when they can be decomposed into typed attribute assertions tied to identifiable entities. The entity is the instance carrying state: OTHE-0001 as a precedence record, OTHE-0002 as another, each eligible to accumulate multiple attr bindings over time. An attr is the named dimension along which the instance is described—duration_seconds, end_time, exit_code, host_name—while attr_type declares the interpretive contract under which values must be stored and compared, here aligned to XSD primitives (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string). Separation of attr from attr_type is deliberate: the name expresses domain meaning, the type expresses validation, indexing, and physical placement rules, so that a single logical attribute cannot silently change its comparability or storage class without a governed type migration.

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |

The misc designation marks the payload that satisfies an attr under its declared attr_type, materialized in type-specialized value stores rather than a single undifferentiated column. Decimal durations such as 1684.40 and 6255.67 attach to OTHE-0001 through attr_id OTHE-0001; timestamps including 2023-06-01T02:07:24 and 2024-03-08T22:48:06 bind through datetime-valued rows; integers 701 and 352 and strings node-a01 and pending populate their respective tables under the same entity-and-attr pairing keys. This pattern prevents category errors at ingestion: a host_name cannot be written into the decimal store without breaking the join path from entity through attr to attr_type. Multiple values on one entity illustrate multi-attribute completeness—OTHE-0001 simultaneously carries duration, end_time, exit_code, and host_name—while repeated attr_ids across entities (OTHE-0001 referencing OTHE-0001 for duration_seconds in several rows) show that attribute definitions are shared dictionaries, not per-row ad hoc labels.

Taken together, identifier, subject, target, role, cardinality note, entity, attr, attr_type, and misc form a layered evidence model in which graph structure, quantitative constraint, and typed fact are independently governable yet jointly queryable. Transformation governance answers who touched which dataset under what capacity; cardinality notes answer how many such attachments are permitted; entity-centric attribute bindings answer what was true, when, in what measure, and under which host or execution context. A reviewer examining aggregate_daily_metrics need not infer lineage from logs alone because OUTP-0002’s link to windowed telemetry buffer is explicit, typed, and role-qualified; an incident analyst tracing server_disk_full need not normalize timestamps by convention because end_time is already xsd:dateTime and stored as an ISO-8601 instant. The architecture trades superficial simplicity for audit-grade composability: each label in the vocabulary names a distinct obligation in the chain of proof, and each populated value in the evidence set exists only where that obligation has been satisfied.