---
chapter_id: ch_live_column_tag_from_annotator_c15a9b
topic_id: 21
family: 07_long_tail
cited_terms: ['column_tag_from_annotator', 'column_tag_subclass', 'column_type_changed_from']
model: engine-refine
---

Column-level provenance in the annotation framework is captured through a bifurcated tagging architecture that distinguishes between annotator-derived metadata and structural subclass classifications. Each tag record, identified by a composite key such as `ANNO-0001` or `TAG-0001`, anchors a set of attributes whose semantics are governed by their declared type. The attribute namespace — encompassing fields like `confidence`, `dimension_kind`, `method`, and `recorded_at` — is typed against an XSD schema, yielding values of type `xsd:decimal`, `xsd:string`, and `xsd:dateTime` respectively. This type discipline is enforced uniformly across both annotator and subclass domains: the `t_column_tag_from_annotator_attr` table and its counterpart `t_column_tag_subclass_attr` each declare the same four attribute names with identical type bindings, ensuring that a confidence score recorded by a `lab_technician` against the column `ingestion_latency` (identifier `ANNO-0001`) is structurally indistinguishable from a confidence score attached to a subclass tag such as `TAG-0001`, which annotates the column `user_id` as belonging to the `instrument_measurement` category.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | lab_technician |
| ANNO-0002 | compliance_flag | lab_technician |
| ANNO-0003 | api_version | auto_classifier |
| ANNO-0004 | api_version | compliance_officer |
| ANNO-0005 | compliance_flag | governance_board |
| ANNO-0006 | event_timestamp | ml_inference_engine |

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | instrument_measurement |
| TAG-0002 | log_level | clinical_subject |
| TAG-0003 | patient_id | clinical_subject |
| TAG-0004 | sensor_reading | geographic_zone |
| TAG-0005 | throughput_mb | geographic_zone |
| TAG-0006 | sensor_reading | bandwidth_utilization |
| TAG-0007 | region_code | coordinate_latitude |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

Attribute values are materialized in type-specialized value tables, each keyed by a record identifier and linked to its parent tag through an `entity_id` column that references the tag's own identifier. Decimal-valued attributes — for instance, the confidence measure `0.302` associated with tag `ANNO-0001` or the magnitude `639.96` linked to tag `ANNO-0005` — reside in `t_column_tag_from_annotator_val_decimal`, while string-valued attributes such as `Dimension Kind 01`, `Encoding 02`, and `nightly summary` are stored in `t_column_tag_from_annotator_val_varchar`. Temporal attributes, exemplified by the timestamp `2025-01-07T23:20:10` recorded against tag `ANNO-0001` for the attribute `recorded_at`, are persisted in `t_column_tag_from_annotator_val_datetime`. The subclass domain mirrors this partitioning precisely: decimal values like `0.376` and `922.76` populate `t_column_tag_subclass_val_decimal`, string values including `intake form` and `en` occupy `t_column_tag_subclass_val_varchar`, and datetime values such as `2023-08-03T19:45:29` and `2025-03-24T11:46:10` are held in the subclass datetime table. This normalization by value type eliminates schema drift and permits type-safe querying across the full provenance graph.

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

The provenance framework further records the lineage of column type mutations through a fact table that associates each column identifier with a `type_changed_from` reference, a `confidence` score, and an `uncertainty` metric. The `dim_type_changed_from` dimension table provides the categorical context for these mutations, assigning each change a label — `Type Changed From Label 01` through `Type Changed From Label 04` — and a corresponding category — `Type Changed From Category 01` through `Type Changed From Category 04`. A concrete instance is the record `FROM-0001`, which links to the dimension entry `FROM-0006` via `type_changed_from_key`, carries a confidence of `0.164`, and exhibits an uncertainty of `560.21` against a miscellaneous value of `257.80`. The variance across records is substantial: `FROM-0002` registers a confidence of `0.068` with uncertainty `744.10`, while `FROM-0004` achieves the highest confidence of `0.354` with the lowest uncertainty of `404.01`. These metrics collectively quantify the reliability of type-change detection, enabling downstream governance policies to filter or escalate mutations based on configurable confidence and uncertainty thresholds.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |