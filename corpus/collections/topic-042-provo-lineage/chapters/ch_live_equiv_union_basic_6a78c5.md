---
chapter_id: ch_live_equiv_union_basic_6a78c5
topic_id: 42
family: 01_foundation
cited_terms: ['equiv_union_basic', 'transformation_equiv_io_intersection', 'plausibility_function_for']
model: engine-refine
---

An identifier serves as the stable, machine-readable key that anchors every entity within a relational structure, enabling unambiguous reference across disparate tables and relationship junctions. Identifiers follow a consistent prefix-and-sequence convention—UNIO-0001 through UNIO-0004 for equivalence union records, INTE-0001 through INTE-0004 for transformation intersection records, and FUNC-0001 through FUNC-0004 for plausibility function records—each functioning as a surrogate primary key that decouples logical identity from mutable business attributes. An entity, in turn, is a single row or record within a table, uniquely identified by its identifier and carrying a set of attribute values that describe a concrete object or relationship instance. The entity FUNC-0001, for example, represents a plausibility function whose attributes include a confidence score of 0.286, a dimension kind labeled Dimension Kind 01, and a recorded_at timestamp of 2023-05-06T07:18:55, each value stored in a type-specialized value table and linked back to the entity through a foreign-key reference.

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | temperature_threshold_exceeded |
| FUNC-0002 | disputed_rating | weak_indication |
| FUNC-0003 | weak_indication | disk_io_saturation |
| FUNC-0004 | model_convergence_failure | packet_loss_rate_high |
| FUNC-0005 | network_latency_spike | divergent_metric |
| FUNC-0006 | authentication_token_expired | high_confidence |
| FUNC-0007 | packet_loss_rate_high | model_convergence_failure |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

Attributes and their types form the descriptive backbone of every entity, specifying both the semantic property being captured and the data domain to which its value must conform. The attribute dimension_kind carries the type xsd:string, the attribute method is likewise xsd:string, the attribute confidence is typed as xsd:decimal, and the attribute recorded_at is constrained to xsd:dateTime. This type discipline ensures that values such as 0.286, 84.30, or 878.30 are stored and validated against the correct numeric schema, while temporal values like 2023-03-14T16:18:20 or 2025-06-06T01:40:51 are validated against ISO 8601 datetime constraints. The attr_type column in the attribute registry table acts as a schema-level contract, guaranteeing that the misc values populated in the value tables—whether decimal, datetime, or varchar—remain semantically coherent across the entire dataset.

Relationships between entities are mediated through junction tables that encode a subject-to-target linkage, each association annotated with a role that clarifies the nature of the connection. In the transformation-to-input-dataset junction, the subject column (transformation_id) references the driving entity—such as INTE-0005—while the target column (input_dataset_id) points to the dependent entity, and the role column assigns a functional designation like owner, reviewer, or contributor to the relationship itself. This three-part structure—subject, target, role—allows a single transformation entity such as aggregate_daily_metrics to participate in multiple distinct relationships with the same input_dataset entity under different roles, or to link to entirely different datasets like iot_device_streams and weather_station_data with distinct role assignments. The same pattern applies to the transformation-to-output-dataset junction, where roles such as contributor, observer, and reviewer qualify how a transformation like merge_sensor_readings produces outputs like raw_telemetry_v3 or financial_transactions.

Cardinality notes provide supplementary metadata about the multiplicity constraints governing a relationship, capturing operational or business rules that cannot be expressed through the foreign-key structure alone. Each association in the output-dataset junction carries a cardinality_note—Cardinality Note 01 through Cardinality Note 04—that documents the expected multiplicity or constraint on that particular subject-to-target link. These notes function as a parallel documentation layer, allowing the relational model to remain structurally simple while preserving the nuanced cardinality semantics required for data governance and pipeline orchestration.

The equivalence union table demonstrates how identifiers can also serve as cross-references between conceptually related entities that reside in separate attribute columns. A single record identified as UNIO-0001 binds together three distinct entities—telemetry_hub_alpha in the equiv column, schema_v3_prod in the equiv_2 column, and governance_log_f in the equiv_3 column—establishing a tripartite equivalence relationship that would otherwise require multiple binary relationship tables. Similarly, the transformation intersection tables decompose a many-to-many relationship between transformations and datasets into normalized components: the transformation registry (with entries like aggregate_daily_metrics and merge_sensor_readings), the input-dataset registry (with entries like user_activity_events and sensor_aggregates_daily), and the output-dataset registry (with entries like network_traffic_logs), each independently addressable by identifier and independently linked through the junction tables that carry the role and cardinality metadata.

**t_transformation_equiv_io_intersection_input_dataset**

| id | input_dataset |
| --- | --- |
| INTE-0001 | iot_device_streams |
| INTE-0002 | weather_station_data |
| INTE-0003 | user_activity_events |
| INTE-0004 | sensor_aggregates_daily |
| INTE-0005 | financial_transactions |
| INTE-0006 | lab_sample_analyzed |
| INTE-0007 | financial_transactions |

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

**t_transformation_equiv_io_intersection_output_dataset**

| id | output_dataset |
| --- | --- |
| INTE-0001 | financial_transactions |
| INTE-0002 | weather_station_data |
| INTE-0003 | raw_telemetry_v3 |
| INTE-0004 | network_traffic_logs |
| INTE-0005 | raw_telemetry_v3 |
| INTE-0006 | network_traffic_parsed |

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