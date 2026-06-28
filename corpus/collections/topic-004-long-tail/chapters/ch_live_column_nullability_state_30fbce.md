---
chapter_id: ch_live_column_nullability_state_30fbce
topic_id: 4
family: 07_long_tail
cited_terms: ['column_nullability_state', 'column_pair_object', 'column_pair_subject']
model: engine-refine
---

Data quality attributes serve as the metadata backbone for assessing column-level reliability, where each attribute carries a name and a strict type that governs how its value is interpreted. An attribute such as confidence is typed as an xsd:decimal, while dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. This type discipline ensures that numeric scores, categorical labels, and temporal stamps are handled uniformly across the system. The attribute definitions themselves are identified by unique keys—STAT-0001 through STAT-0004 in the nullability state domain, and SUBJ-0001 through SUBJ-0004 in the column-pair subject domain—providing a stable reference point for every value that follows.

At the heart of the model is the entity, which acts as the anchor tying attribute values to a specific column or column pair under assessment. An entity identifier such as STAT-0001 or SUBJ-0001 groups together all attribute measurements for a single subject, whether that subject is a column like timestamp_utc with a REQUIRED nullability state, or a column pair such as log_level mapped to asset_tag. Attribute values are stored in type-specific value tables: decimal values like 0.294 and 568.73 populate the decimal store, string values like "Dimension Kind 01" and "intake form" reside in the varchar store, and temporal values such as 2024-12-29T19:38:29 and 2023-05-04T12:31:25 are held in the datetime store. This separation by type preserves schema integrity while allowing flexible, heterogeneous metadata to accumulate around each entity.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | REQUIRED |
| STAT-0002 | checksum_sha256 | REQUIRED |
| STAT-0003 | latency_ms | NOT_NULL |
| STAT-0004 | timestamp_utc | OPTIONAL |
| STAT-0005 | timestamp_utc | PROVISIONAL |
| STAT-0006 | checksum_sha256 | NULLABLE |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | asset_tag |
| SUBJ-0002 | batch_token | asset_tag |
| SUBJ-0003 | transaction_id | control_id |
| SUBJ-0004 | timestamp_utc | record_id |
| SUBJ-0005 | patient_id | dataset_uid |
| SUBJ-0006 | transaction_id | dataset_uid |
| SUBJ-0007 | batch_token | record_id |

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

Confidence and uncertainty form the dual metrics that quantify the quality of an object column's assessment. Confidence values—0.164, 0.068, 0.107, and 0.354 across four object columns—represent the model's certainty that a given column meets its quality criteria, with higher values indicating stronger assurance. Uncertainty, measured in the hundreds (560.21, 744.10, 984.09, 404.01), captures the magnitude of residual doubt or variance in the assessment. Together with the raw value associated with each object column (257.80, 571.55, 140.18, 131.27), these metrics enable downstream consumers to weigh the reliability of each column's quality signal before making governance or operational decisions.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

The object column itself is cataloged in a dimension table that assigns each column a human-readable label and a category, such as Object Column Category 01 through 04. This categorization provides a structural lens for aggregating quality metrics across groups of columns that share similar roles or sensitivity levels. The nullability state of a column—whether it is REQUIRED, NOT_NULL, or OPTIONAL—adds another layer of constraint: timestamp_utc appears as REQUIRED in one context and OPTIONAL in another, while checksum_sha256 is REQUIRED and latency_ms is NOT_NULL, reflecting the varying degrees of strictness applied to different data elements.

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

Column-pair subject relationships extend the quality model beyond individual columns to capture associations between columns, such as log_level linked to asset_tag or transaction_id linked to record_id. These pairs carry their own attribute values and confidence scores—0.167 and 0.312 for confidence, 866.89 and 939.39 for uncertainty—enabling the system to assess not only whether individual columns are reliable but also whether the relationships between them hold. The recorded_at timestamps (2023-03-08T01:00:53, 2023-09-25T09:20:34, 2025-01-28T08:00:28, 2023-08-23T03:35:02) provide an audit trail for when each assessment was performed, ensuring that quality evaluations can be traced to a specific point in time and reviewed for staleness.