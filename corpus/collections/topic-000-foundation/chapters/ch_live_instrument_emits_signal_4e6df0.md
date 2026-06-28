---
chapter_id: ch_live_instrument_emits_signal_4e6df0
topic_id: 0
family: 01_foundation
cited_terms: ['instrument_emits_signal', 'attribute_set_max_attrs', 'column_pair_subject']
model: engine-refine
---

The governance of sensor telemetry and analytical metadata rests on a disciplined separation between the physical instruments that generate data, the attribute definitions that describe it, and the storage locations that house it. Each instrument—whether a LiDAR array, a seismometer, a mass spectrometer, or a radiometer—is assigned a unique identifier such as SIGN-0001 through SIGN-0004, and is catalogued alongside the signal it emits, from optical pulses to ultrasonic waves to heartbeat pings. The data footprint of each instrument is quantified in bytes: the radiometer alone accounts for 579,891,201 bytes, while the seismometer registers 556,171,171 bytes. These storage footprints are not abstract figures; they are anchored to concrete data lake locations, each instrument's output routed to a distinct URI—s3://lake/raw, abfss://prod/silver, s3://lake/curated, or gs://warehouse/gold—reflecting a tiered architecture where raw ingestion, silver-layer refinement, curated consumption, and gold-standard archival are distinguished by their storage domain and access pattern.

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Optical pulse | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Ultrasonic wave | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | Ultrasonic wave | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Heartbeat ping | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Data packet | 371526447 | abfss://prod/silver |

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

Within this architecture, attributes serve as the semantic layer that annotates both instruments and the data they produce. An attribute is a named property—confidence, dimension_kind, method, recorded_at—each bound to a precise type drawn from the XML Schema definition space: xsd:decimal for numeric precision, xsd:string for categorical or textual labels, and xsd:dateTime for temporal anchoring. The attribute set itself is identified by a code such as ATTR-0001, and the set's constituent attributes are enumerated separately, creating a two-level hierarchy where the set defines the container and the attribute definitions specify the schema. This separation allows the same attribute type to be reused across multiple sets without duplication of type metadata, and it permits the attribute definitions to evolve independently of the values they describe.

Attribute values are stored in type-specialized tables, each keyed by a composite of identifier, entity, and attribute reference. A decimal value such as 0.687 or 125.69 is recorded in the decimal store alongside its entity identifier (ATTR-0001) and its attribute reference (ATTR-0001 or ATTR-0005), while a string value like Dimension Kind 01 or Encoding 02 resides in the varchar store with the same structural keys. Temporal values—2024-07-05T18:39:47, 2024-04-21T13:05:05, 2023-05-25T09:01:45—are persisted in the datetime table, always referencing the recorded_at attribute (ATTR-0004) as their semantic target. The misc column, a generic value field, absorbs whatever type-specific content is appropriate to its host table, and its name signals its role as a catch-all that avoids the need for a single polymorphic column. This normalization by type is not merely a design preference; it enforces type safety at query time and permits each value store to be optimized for its data distribution.

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

The column-pair subject tables mirror this structure for relationships between columns rather than between instruments and attributes. A subject such as SUBJ-0001 maps a column (log_level) to a subject column (ATTR-0004), establishing a semantic linkage that is itself annotated with attributes—confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, recorded_at as xsd:dateTime. Values for these subject-level attributes follow the same type-specialized pattern: decimal values like 0.167 and 866.89, string values like Dimension Kind 01 and audit excerpt, and datetime values such as 2023-03-08T01:00:53 and 2025-01-28T08:00:28. The parallelism between the instrument-attribute and column-pair-subject domains is intentional; it allows the governance framework to treat relationships between data elements with the same rigor applied to the elements themselves, ensuring that provenance, confidence, and methodological context are tracked at every level of the data lineage.

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | ATTR-0004 |
| SUBJ-0002 | batch_token | ATTR-0005 |
| SUBJ-0003 | transaction_id | ATTR-0005 |
| SUBJ-0004 | timestamp_utc | ATTR-0004 |
| SUBJ-0005 | patient_id | ATTR-0001 |
| SUBJ-0006 | transaction_id | ATTR-0001 |
| SUBJ-0007 | batch_token | ATTR-0003 |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |