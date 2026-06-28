---
chapter_id: ch_live_descriptive_not_retracted_36a5ea
topic_id: 94
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'annotation_with_confidence', 'aggregation_over_time_window']
model: engine-refine
---

Metadata governance in distributed telemetry and assay systems rests on a disciplined separation between entities, their attributes, and the values those attributes assume. Each entity—identified by a stable key such as RETR-0001 or WIND-0001—represents a discrete artefact in the data lifecycle: a Sensor Drift Note, an Anomaly Flag Sheet, a Metadata Index Card, or an aggregation record like RealTimeClusterLoad and MonthlyThroughputMetric. These identifiers are not merely labels; they anchor a chain of provenance that traces from the original observation through every transformation and annotation applied downstream. The descriptive tables (t_descriptive_not_retracted and t_aggregation_over_time_window) establish the entity catalogue, pairing each identifier with human-readable descriptors and, where applicable, a reference to an over_time_window that situates the entity within a temporal scope—RETR-0006, for instance, serves as the time-window anchor for both RealTimeClusterLoad and AnnualCapacityForecast, while RETR-0005 and RETR-0002 anchor MonthlyThroughputMetric and a second AnnualCapacityForecast respectively.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | RETR-0006 |
| WIND-0002 | MonthlyThroughputMetric | RETR-0005 |
| WIND-0003 | AnnualCapacityForecast | RETR-0006 |
| WIND-0004 | AnnualCapacityForecast | RETR-0002 |
| WIND-0005 | RealTimeClusterLoad | RETR-0003 |
| WIND-0006 | AnnualCapacityForecast | RETR-0004 |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

Attributes and their types form the second pillar of this architecture. The attribute catalogue (t_descriptive_not_retracted_attr and t_aggregation_over_time_window_attr) enumerates the dimensions along which entities are characterized: confidence, dimension_kind, method, and recorded_at recur across both entity families, each bound to a precise XML Schema type—xsd:decimal for numeric confidence scores, xsd:string for categorical descriptors such as Dimension Kind 01 or Encoding 02, and xsd:dateTime for temporal stamps like 2024-02-12T07:34:36 or 2023-08-23T11:54:15. This type discipline is not decorative; it enforces value compatibility at query time and ensures that a decimal value of 0.736 or 0.217 is never conflated with a string value such as intake form or es, nor with a timestamp. The attr_name and attr_type columns together constitute a schema registry that is both extensible and strictly typed, allowing new dimensions to be introduced without retroactively altering existing entity definitions.

Value storage is deliberately decoupled from the attribute catalogue, with separate tables for each data type—t_descriptive_not_retracted_val_datetime, t_descriptive_not_retracted_val_decimal, and t_descriptive_not_retracted_val_varchar, with their aggregation counterparts mirroring the same pattern. This EAV (entity-attribute-value) decomposition means that every value row carries three foreign keys: entity_id, which points back to the artefact being described; attr_id, which resolves to a row in the attribute catalogue; and value, the misc column that holds the actual datum. An entity such as RETR-0001 may thus accumulate a confidence of 0.736 (from t_descriptive_not_retracted_val_decimal, attr_id RETR-0001), a dimension_kind of Dimension Kind 01 (from the varchar table, attr_id RETR-0002), and a recorded_at timestamp of 2024-02-12T07:34:36 (from the datetime table, attr_id RETR-0004), all while remaining a single logical unit. The same pattern holds for aggregation entities: WIND-0001 carries a confidence of 0.781, a dimension_kind of Dimension Kind 01, and a recorded_at of 2023-08-23T11:54:15, alongside numeric measures of 86.18 and 786.35 and a pre-release note in English (en).

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

Annotation and confidence tracking introduce a third relational layer that is distinct from the entity-attribute-value triad. The t_annotation_with_confidence table records provenance annotations—Telemetry Stream US East, Lab Assay Plate 12B—while t_annotation_with_confidence_confidence enumerates the assurance levels attached to those annotations: 95 Percent Confidence, Cross Referenced, Ensemble Agreement, Expert Verified. The join table t_annotation_with_confidence__confidence binds subject (annotation_id) to target (confidence_id) through a role column that specifies the nature of the association. A single annotation such as CONF-0001 may be linked to multiple confidence levels with different roles: CONF-0004 with role contributor, CONF-0005 with role observer, while CONF-0007 connects to CONF-0006 as contributor and CONF-0002 connects to CONF-0001 as reviewer. This subject-target-role construct enables fine-grained provenance: it is not sufficient to know that Lab Assay Plate 12B carries Ensemble Agreement; one must also know whether that agreement was asserted by a contributor, an observer, or a reviewer, as the role determines the weight and auditability of the confidence claim.

The practical consequence of this architecture is that every datum in the system is traceable along three orthogonal axes. The first axis runs from identifier through entity to attribute to value, establishing what was measured and how. The second axis runs from entity through over_time_window, establishing when the measurement was taken or aggregated—2024-08-04T13:26:29, 2024-08-02T08:30:25, 2025-01-21T18:04:20 for descriptive entities; 2023-06-25T19:59:38, 2025-01-03T19:33:06, 2023-03-02T05:31:47 for aggregation entities. The third axis runs from annotation through subject-target-role to confidence, establishing who asserted what and with what level of assurance. Together, these axes form a compliance-ready provenance graph: an auditor can reconstruct the full chain from a decimal value of 0.736 back through its entity (RETR-0001), its attribute (confidence), its annotation (Telemetry Stream US East), and its confidence level (95 Percent Confidence, asserted by a contributor), or from an AnnualCapacityForecast through its time window (RETR-0006) and its recorded_at timestamp (2025-01-03T19:33:06) to the reviewer who validated it.

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |