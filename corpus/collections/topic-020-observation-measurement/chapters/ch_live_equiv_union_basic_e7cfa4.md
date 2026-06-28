---
chapter_id: ch_live_equiv_union_basic_e7cfa4
topic_id: 20
family: 01_foundation
cited_terms: ['equiv_union_basic', 'measurement_equiv_with_dim_unit', 'belief_interval_equiv_bel_and_pl']
model: engine-refine
---

Attributes constitute the named properties that characterize entities within a formal ontology, each declared with a precise type that governs how values may be assigned. The attribute registry distinguishes between `xsd:decimal` for numeric measures such as confidence scores, `xsd:string` for categorical descriptors like dimension kind or method, and `xsd:dateTime` for temporal stamps recorded at specific moments—`2025-01-05T17:59:26`, for instance, anchors a belief interval to an exact point in time. This type discipline ensures that the same attribute name, whether `confidence` or `recorded_at`, carries a consistent semantic contract across all entities that reference it, and that value tables—separated by type into decimal, datetime, and varchar stores—can be queried without ambiguity.

Identifiers serve as the immutable handles by which every entity, attribute, and relationship is addressed. They follow a structured convention: `UNIO-0001` through `UNIO-0004` designate union-equivalence records, `UNIT-0001` through `UNIT-0004` identify measurement records, and `BEL-0001` through `BEL-0004` mark belief-interval records. These identifiers appear not only as primary keys but also as foreign references—`UNIO-0005` bounds the belief lower limit for `signal_attenuation`, while `UNIO-0001` anchors the plausibility upper bound for `sensor_drift`—creating a web of cross-references that ties the ontology together without relying on human-readable names.

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |
| UNIO-0006 | ingest_pipeline_main | gateway_node_seven | archive_run_three |

**t_measurement_equiv_with_dim_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | packet_loss_rate |
| UNIT-0002 | motor_rpm |
| UNIT-0003 | motor_rpm |
| UNIT-0004 | bandwidth_utilization |
| UNIT-0005 | packet_loss_rate |
| UNIT-0006 | storage_capacity |
| UNIT-0007 | core_temperature |

**t_measurement_equiv_with_dim_unit_dimension**

| id | dimension |
| --- | --- |
| UNIT-0001 | temporal_interval |
| UNIT-0002 | test_phase |
| UNIT-0003 | firmware_version |
| UNIT-0004 | test_phase |
| UNIT-0005 | sampling_rate |
| UNIT-0006 | device_class |

**t_measurement_equiv_with_dim_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | microseconds |
| UNIT-0002 | terabytes |
| UNIT-0003 | milligrams_per_deciliter |
| UNIT-0004 | percent_volume |
| UNIT-0005 | cells_per_microliter |
| UNIT-0006 | microseconds |
| UNIT-0007 | microseconds |
| UNIT-0008 | milligrams_per_deciliter |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | UNIO-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | UNIO-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | UNIO-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | UNIO-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | UNIO-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | UNIO-0001 | extended_telemetry |
| BEL-0007 | data_corruption | UNIO-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | UNIO-0006 | tentative_marker |

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |

Entities are the first-class objects that bear attributes and participate in relationships. A measurement entity such as `packet_loss_rate` or `motor_rpm` exists independently of its units and dimensions, while a belief entity like `thermal_runaway` or `latency_spike` encapsulates an analytical judgment with its own lower and upper bounds. The entity concept is further enriched by value tables that store heterogeneous data—decimal values such as `0.034` or `388.43` for one belief entity, string values like `Dimension Kind 01` or `intake form` for another—each row linking back to its entity through `entity_id` and to its attribute through `attr_id`.

Relationships between entities are expressed through subject-target pairs annotated with roles and cardinality constraints. A junction table connecting measurements to dimensions assigns the role `reviewer` to one pairing and `owner` to another, while the same pattern applied to measurements and units distinguishes `owner` from `reviewer` across four distinct associations. Cardinality notes—`Cardinality Note 01` through `Cardinality Note 04`—provide the operational context for how many units may attach to a given measurement, ensuring that the relationship is not merely declared but bounded by a documented constraint.

**t_measurement_equiv_with_dim_unit__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0002 | UNIT-0001 | reviewer |
| UNIT-0002 | UNIT-0006 | UNIT-0006 | owner |
| UNIT-0003 | UNIT-0001 | UNIT-0002 | observer |
| UNIT-0004 | UNIT-0004 | UNIT-0003 | owner |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | owner |
| UNIT-0006 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0007 | UNIT-0006 | UNIT-0004 | owner |
| UNIT-0008 | UNIT-0001 | UNIT-0006 | reviewer |

**t_measurement_equiv_with_dim_unit__unit**

| id | measurement_id | unit_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | owner | Cardinality Note 01 |
| UNIT-0002 | UNIT-0006 | UNIT-0008 | owner | Cardinality Note 02 |
| UNIT-0003 | UNIT-0004 | UNIT-0003 | reviewer | Cardinality Note 03 |
| UNIT-0004 | UNIT-0002 | UNIT-0007 | reviewer | Cardinality Note 04 |
| UNIT-0005 | UNIT-0002 | UNIT-0008 | contributor | Cardinality Note 05 |
| UNIT-0006 | UNIT-0004 | UNIT-0004 | reviewer | Cardinality Note 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0005 | contributor | Cardinality Note 07 |
| UNIT-0008 | UNIT-0003 | UNIT-0003 | reviewer | Cardinality Note 08 |

The union-equivalence table illustrates how entities can be linked across multiple dimensions simultaneously. A single identifier such as `UNIO-0001` correlates `telemetry_hub_alpha` with `schema_v3_prod` and `governance_log_f`, establishing a tripartite relationship that would require three separate binary relationships to express otherwise. This multi-column structure compresses what would otherwise be a proliferation of junction tables, while preserving the ability to trace any one leg of the equivalence back through the identifier to its source entity.