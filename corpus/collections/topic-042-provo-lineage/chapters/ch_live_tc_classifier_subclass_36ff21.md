---
chapter_id: ch_live_tc_classifier_subclass_36ff21
topic_id: 42
family: 07_long_tail
cited_terms: ['tc_classifier_subclass', 'transformation_equiv_io_intersection', 'provenance_agent_signs_audit']
model: engine-refine
---

The classification and provenance domains are anchored by a pair of fact–dimension hierarchies, each structured to separate measurable event data from descriptive metadata. The fact_classifier table records individual classification events through an identifier such as CLAS-0001 or CLAS-0004, a size_bytes measurement that ranges from 623,892,633 to 883,422,563 bytes, a version number, and a t_c_direction_key that references the dim_t_c_direction dimension. That dimension table supplies the human-readable t_c_direction_label—values like T C Direction Label 01 through T C Direction Label 04—and a t_c_direction_category classification, enabling downstream queries to group classifiers by both label and category without duplicating descriptive text. The provenance domain follows the same pattern: fact_provenance captures execution telemetry with an identifier like AUDI-0001, a provenance_key pointing to dim_provenance, a duration_seconds value that spans from 2,216.74 to 6,949.35 seconds, an exit_code ranging from 256 to 985, and a retry_count that varies from 23 to 410. The dim_provenance table provides the corresponding provenance_label and provenance_category, ensuring that audit records carry consistent categorical context.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

The t_c_direction and provenance dimensions both employ a dual-column labeling strategy that separates a free-form misc label from a structured category. In dim_t_c_direction, the misc column holds values such as T C Direction Label 01, while the category column carries T C Direction Category 01; in dim_provenance, the same pattern appears with Provenance Label 01 and Provenance Category 01. This separation allows reporting layers to filter on the coarse category while displaying the finer-grained label to end users, and it prevents label drift from corrupting category-level aggregations. The identifier columns in both dimension tables—CLAS-0001 through CLAS-0004 for t_c_direction and AUDI-0001 through AUDI-0004 for provenance—serve as stable foreign-key targets for the fact tables, guaranteeing referential integrity across the classification and audit pipelines.

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

Transformation equivalence and I/O intersection tracking introduces a third structural pattern centered on the subject and target roles that govern how transformations relate to their input and output datasets. The core transformation table t_transformation_equiv_io_intersection identifies each transformation with an identifier such as INTE-0001 and a transformation name like aggregate_daily_metrics or merge_sensor_readings. Its input and output datasets are stored in separate lookup tables—t_transformation_equiv_io_intersection_input_dataset and t_transformation_equiv_io_intersection_output_dataset—where the input_dataset column holds values such as iot_device_streams and weather_station_data, and the output_dataset column carries financial_transactions and raw_telemetry_v3. The many-to-many relationships between transformations and datasets are materialized through two junction tables, each of which carries a role column that specifies whether the linked dataset acts as an owner, reviewer, contributor, or observer.

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

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

The junction table t_transformation_equiv_io_intersection__input_dataset maps a transformation_id—referred to as the subject—against an input_dataset_id—the target—while the role column assigns each pairing a function such as owner, reviewer, or contributor. For example, transformation INTE-0005 is linked to input dataset INTE-0007 with the role owner, and to input dataset INTE-0004 with the role reviewer. The symmetric junction table t_transformation_equiv_io_intersection__output_dataset performs the same function for outputs, adding a cardinality_note column that documents multiplicity constraints for each transformation-to-output pairing. In this table, the subject column again references transformation_id, the target column references output_dataset_id, and the cardinality_note takes values like Cardinality Note 01 through Cardinality Note 04, providing a structured place to record whether a transformation produces a single output, a fan-out, or a conditional set.

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

Across all three domains, the identifier columns provide the primary keys that tie every fact to its dimension and every junction row to its parent transformation. The size_bytes column in fact_classifier quantifies the payload associated with each classification event, while duration_seconds, exit_code, and retry_count in fact_provenance capture the temporal and success characteristics of each audit record. Together, these columns form a coherent schema in which measurable quantities live in fact tables, descriptive labels and categories reside in dimension tables, and relationship semantics—expressed through subject, target, role, and cardinality_note—govern the intersections between transformations and their data assets.