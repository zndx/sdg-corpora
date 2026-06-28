---
chapter_id: ch_live_control_at_severity_e7d488
topic_id: 42
family: 03_directive_governance
cited_terms: ['control_at_severity', 'transformation_equiv_io_intersection', 'two_disjoint_artifacts']
model: engine-refine
---

An attribute is a named property of an entity, and its type constrains the shape and semantics of the values it may hold. In the reference corpus, the attribute registry defines properties such as `checksum`, `created_date`, `identifier`, and `license`, each bound to a formal type: `xsd:string` for opaque identifiers and license strings, `xsd:date` for temporal metadata, and `cco:DesignativeICE` for URN-style designations like `urn:uuid:9f2a`. This separation of attribute definition from value storage is not merely structural—it enforces type discipline across the model. Values are materialized in dedicated value tables keyed by entity and attribute, with the type governing which table receives the row: date values such as `2023-05-13`, `2024-02-28`, `2024-03-29`, and `2023-09-19` reside in the date table, integer values like `36`, `5`, `462`, and `3` in the integer table, and character strings including the checksum `9d2b7a16`, the license `MPL-2.0`, and the region `ap-south-2` in the varchar table. The entity itself is identified by a stable key—`ARTI-0001` through `ARTI-0004`—that anchors all value rows and permits an entity to carry multiple attributes of different types without ambiguity.

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Cardinality notes formalize the multiplicity constraints that govern how entities relate to one another through subject–target pairs. In the transformation–dataset intersection model, each row in the output dataset junction table carries a cardinality note—`Cardinality Note 01` through `Cardinality Note 04`—that documents whether a transformation produces a single output, a fan-out, or a many-to-many mapping. The subject column (`transformation_id`) and the target column (`output_dataset_id`) together define the edge of a directed relationship, while the `role` column—taking values such as `contributor`, `observer`, and `reviewer`—annotates the nature of the edge from the subject's perspective. The same pattern appears in the input dataset junction table, where roles like `owner` and `contributor` distinguish stewardship from participation. Cardinality notes and roles are orthogonal: one describes how many, the other describes what kind.

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

Encoding and language are metadata attributes that travel with data assets and the controls that govern them. The control-to-artifact severity mapping table attaches an `encoding` and a `language` to each control–artifact pairing: a control governing log retention is paired with `latin1` encoding and German (`de`), while the rate-limiting control uses `unicode` and Japanese (`ja`), and the quarterly access-review control uses `unicode` with German. These fields do not describe the control text itself but rather the character repertoire and locale conventions that apply when the associated artifact is rendered, stored, or exchanged. The artifact pairs themselves—`etl-job` with `data-lake`, `config-bundle` with `traffic-router` and `access-policy`, `data-pipeline-v4` with `service-discovery`—are the entities to which such encoding and language constraints are ultimately bound.

**t_control_at_severity**

| id | control | at_severity | encoding | language |
| --- | --- | --- | --- | --- |
| SEVE-0001 | Log retention 90 days | ARTI-0006 | latin1 | de |
| SEVE-0002 | Rate limiting API | ARTI-0006 | unicode | ja |
| SEVE-0003 | Access review quarterly | ARTI-0003 | unicode | de |
| SEVE-0004 | Network segmentation east-west | ARTI-0003 | utf8 | de |
| SEVE-0005 | Network segmentation east-west | ARTI-0004 | latin1 | fr |
| SEVE-0006 | Backup verification daily | ARTI-0001 | latin1 | en |
| SEVE-0007 | PII masking pipeline | ARTI-0002 | unicode | ja |
| SEVE-0008 | Backup verification daily | ARTI-0006 | unicode | de |

Transformations are the operational core of the intersection model. Each transformation—`aggregate_daily_metrics`, `merge_sensor_readings`—is identified by a stable key and linked to its input and output datasets through separate junction tables. Input datasets such as `iot_device_streams`, `weather_station_data`, `user_activity_events`, and `sensor_aggregates_daily` flow into transformations, while outputs like `financial_transactions`, `raw_telemetry_v3`, and `network_traffic_logs` emerge from them. The junction tables do not merely list connections; they assign a `role` to each connection and, for outputs, a `cardinality_note` that captures multiplicity. This design permits a single transformation to have multiple inputs and outputs, each annotated with its own role and cardinality, without collapsing the relationship graph into a flat list.

The identifier space is partitioned by prefix to signal provenance and purpose. Keys beginning with `SEVE-` identify severity mappings between controls and artifacts; `INTE-` keys identify intersection records and their subject–target edges; `ARTI-` keys identify artifacts, attributes, and attribute values. This prefix convention is not enforced by the schema but is a governance convention that appears consistently across the data. It allows an operator to answer, at a glance, whether a given identifier refers to a control severity (`SEVE-0001` through `SEVE-0004`), a transformation intersection (`INTE-0001` through `INTE-0005`), or an artifact-level entity (`ARTI-0001` through `ARTI-0009`). The same discipline applies to values: a checksum value like `9d2b7a16` is a string, a date value like `2024-03-29` is a date, and a numeric value like `462` is an integer, each stored in the table that matches its type.

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |