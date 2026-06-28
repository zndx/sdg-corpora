---
chapter_id: ch_live_column_property_subclass_15a147
topic_id: 4
family: 07_long_tail
cited_terms: ['column_property_subclass', 'column_renamed_from', 'column_tag_at_confidence']
model: engine-refine
---

Attributes serve as the fundamental descriptors that annotate data columns with semantic meaning, quality metadata, and contextual information beyond their raw names. An attribute definition pairs a human-readable name with a strict type constraint, ensuring that every value attached to a column adheres to a predictable schema. For instance, the attribute named confidence carries the type xsd:decimal, which constrains its values to numeric precision suitable for expressing measurement reliability or model certainty. Other attributes such as dimension_kind and method are typed as xsd:string, accommodating free-form labels like Dimension Kind 01 or Encoding 02, while recorded_at uses xsd:dateTime to anchor observations to precise moments in time, such as 2023-02-03T11:52:35 or 2025-03-21T00:09:12. This type discipline is not merely decorative; it governs validation, query optimization, and cross-system interoperability by making the expected shape of data explicit at the metadata layer.

Each attribute is uniquely identified by an identifier that functions as a stable reference point across the entire governance framework. Identifiers such as PROP-0001, FROM-0001, and CONF-0001 appear consistently as primary keys in attribute definitions and as foreign keys in value tables, creating a web of referential integrity that ties metadata to its concrete instantiations. The same identifier can recur across multiple tables to represent the same logical attribute in different contexts. For example, PROP-0001 denotes the attribute confidence within the column_property_subclass domain, while FROM-0001 and CONF-0001 serve analogous roles in the renamed_from and tag_at_confidence domains respectively. This pattern of identifier reuse across domains enables a unified attribute vocabulary while preserving the independence of each governance namespace.

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | iot_gateway |
| PROP-0002 | device_serial | lab_assay |
| PROP-0003 | request_payload | sensor_array |
| PROP-0004 | event_code | clinical_trials |
| PROP-0005 | batch_id | lab_assay |
| PROP-0006 | batch_id | clinical_trials |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | recorded_at |
| FROM-0002 | measurement_timestamp | log_category |
| FROM-0003 | config_version | body_mass_index |
| FROM-0004 | batch_run_id | specimen_number |
| FROM-0005 | event_type | release_tag |
| FROM-0006 | patient_bmi | body_mass_index |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | 0.99 |
| CONF-0002 | audit_log_id | 0.99 |
| CONF-0003 | calibration_date | 0.72 |
| CONF-0004 | instrument_serial | 0.81 |
| CONF-0005 | geospatial_ref | verified |
| CONF-0006 | sample_volume_ml | 0.99 |

Entities represent the specific data columns or schema objects that attributes annotate, and they are themselves identified by stable names that anchor the metadata to the underlying data model. A column such as user_agent might be annotated to indicate it originates from an iot_gateway, while device_serial carries annotations tied to lab_assay contexts, and request_payload is linked to sensor_array provenance. Similarly, the column node_cpu_load was previously known as recorded_at, and measurement_timestamp was formerly log_category, with these renaming histories captured as first-class metadata rather than lost to informal documentation. The entity identifier provides the bridge between abstract attribute definitions and the concrete columns they describe, enabling traceability from a quality metric like a confidence score of 0.99 on instrument_serial back to the column that carries it.

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

Attribute values are materialized in type-specific value tables that separate storage by data type, a design choice that reflects the heterogeneity of metadata values and simplifies type-safe retrieval. Decimal values such as 0.032, 504.02, and 0.502 are stored in the decimal value table, where each row links an entity to a specific attribute and records the numeric measurement. String values like pre-release note and es occupy the varchar value table, capturing textual annotations that range from descriptive notes to language codes. Timestamp values populate the datetime table, recording moments such as 2024-11-24T00:57:54 or 2024-09-15T13:40:19 that mark when observations were made. This separation ensures that type coercion errors are caught at write time and that queries targeting a specific type do not incur unnecessary parsing overhead.

The confidence dimension of attribute governance deserves particular attention, as it quantifies the reliability of automated or manual annotations. Columns such as instrument_serial carry confidence scores of 0.99, indicating near-certain annotation quality, while calibration_date has a lower confidence of 0.72, signaling that the annotation may warrant human review. This confidence metadata enables downstream systems to weight or filter annotations based on their trustworthiness, supporting risk-aware data pipelines where high-stakes decisions rely only on well-validated metadata. The combination of identifier stability, type discipline, entity anchoring, and confidence scoring forms a coherent governance model that treats metadata as a first-class asset rather than an afterthought, ensuring that data columns carry not just their names but a rich, queryable, and auditable description of what they mean, how they were annotated, and how much we can trust those annotations.

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |