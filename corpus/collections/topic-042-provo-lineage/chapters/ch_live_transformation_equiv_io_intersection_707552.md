---
chapter_id: ch_live_transformation_equiv_io_intersection_707552
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_equiv_io_intersection', 'training_partnership_development', 'schemaorg_event_starttime']
model: engine-refine
---

The transformation equivalence framework establishes a rigorous mapping between data processing operations and their associated input and output datasets, anchored by unique identifiers such as INTE-0001 through INTE-0004. Each transformation record—whether designated as aggregate_daily_metrics or merge_sensor_readings—serves as a node in a bipartite graph structure that connects upstream data sources to downstream consumers. Input datasets including iot_device_streams, weather_station_data, user_activity_events, and sensor_aggregates_daily are linked to transformations through a dedicated junction table that encodes governance roles: owner, reviewer, and contributor. This role-based attribution ensures that data lineage is not merely a technical artifact but a governed relationship, where the same transformation may reference multiple input datasets with distinct accountability assignments—for instance, transformation INTE-0005 appears with both an owner role on input dataset INTE-0007 and a reviewer role on input dataset INTE-0004, reflecting the multi-stakeholder nature of data processing pipelines.

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

The output side of the equivalence model mirrors this structure with equal precision. Transformations produce output datasets such as financial_transactions, weather_station_data, raw_telemetry_v3, and network_traffic_logs, each connected through a junction table that introduces the cardinality_note attribute alongside role assignments of contributor and observer. Cardinality notes—labeled Cardinality Note 01 through Cardinality Note 04—provide explicit documentation of multiplicity constraints between transformations and their outputs, a critical governance mechanism for data contracts and SLA enforcement. The separation of the cardinality metadata into the junction table rather than the core transformation record reflects a deliberate normalization choice: cardinality is a property of the relationship, not the transformation itself, and may vary depending on which output dataset is being considered. This design permits a single transformation like aggregate_daily_metrics to carry different cardinality constraints when producing financial_transactions versus when producing weather_station_data.

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

Beyond the transformation equivalence domain, the training partnership development table introduces an organizational dimension to the data model, capturing collaborative arrangements between the enterprise and external educational institutions. Records such as DEVE-0001 through DEVE-0004 encode partnership programs including Advanced Analytics Cohort, Machine Learning Track, Biostatistics Collaboration, and Engineering Mentorship Program, each associated with a participating entity identified by the has_participant column. These participants range from formal institutional bodies such as the Industry Liaison Office and Clinical Preceptor Team to individual contributors like Elena Rostova and Research Associate Kim, indicating that the partnership model accommodates both institutional and personal affiliations. This dual granularity supports both contractual governance at the organizational level and operational accountability at the individual level within the same data structure.

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

The schema.org fact table and its associated event start time dimension form a star schema pattern that supports analytical querying of event metadata. The fact table, identified by keys STAR-0001 through STAR-0004, records event_start_time_key values that reference the dimension table, alongside size_bytes measurements ranging from 114,301,972 bytes to 998,785,819 bytes and version numbers spanning 3 through 8. The dimension table provides two descriptive attributes for each event start time: a label (Event Start Time Label 01 through Event Start Time Label 04) and a category (Event Start Time Category 01 through Event Start Time Category 04). These categorical labels serve as the category attribute referenced in the glossary, functioning as classification keys that enable aggregation and filtering of event records by temporal grouping. The size_bytes column, classified as a measure attribute, quantifies the data volume associated with each event record, while the version column tracks schema evolution across successive iterations of the event data.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |