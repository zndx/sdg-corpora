---
chapter_id: ch_live_measurement_observed_at_ce3c1f
topic_id: 161
family: 02_observation_measurement
cited_terms: ['measurement_observed_at', 'measurement_of_artifact', 'measurement_produced_by_run']
model: engine-refine
---

September 11, 2007

Measurement records are anchored by an identifier—`RUN-0001`, `OBSE-0001`, `ARTI-0001`—a stable key that persists across every facet of the record, from the raw value to its provenance metadata. A measurement itself, whether `disk IOPS`, `yield_stress_test`, `ph_bulk_sample_7`, or `network latency`, denotes the specific quantity under observation; it is the subject of inquiry, not the container for it. Each measurement is classified under a category—`Measurement Category 01` through `Measurement Category 04`—which serves as the primary axis for aggregation and reporting, and is itself referenced by a foreign key (`category_id`) that links the measurement dimension to the category dimension. This categorical linkage is not merely organizational: it determines which quality attributes are applicable, which validation rules apply, and which downstream consumers are authorized to access the data.

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | disk IOPS | Monitoring Station Bravo |
| OBSE-0002 | throughput_bench_10 | Observatory Dome 2 |
| OBSE-0003 | CPU utilization | Lab Bench 7B |
| OBSE-0004 | ph_bulk_sample_7 | Weather Mast Delta |
| OBSE-0005 | pH level | Telemetry Gateway Alpha |
| OBSE-0006 | latency_p99_ms | Calibration Rack 9 |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | yield_stress_test |
| ARTI-0002 | voltage drop |
| ARTI-0003 | yield_stress_test |
| ARTI-0004 | network latency |
| ARTI-0005 | packet loss |
| ARTI-0006 | ambient_temp_22C |

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |

Attributes—abbreviated `attr` in the schema—describe the measurement beyond its value. An attribute has a name (`confidence`, `dimension_kind`, `method`, `recorded_at`) and a type (`xsd:decimal`, `xsd:string`, `xsd:dateTime`) that governs how its value is stored and validated. The type system enforces discipline: confidence scores are decimal values such as `0.528` or `0.670`, recorded timestamps are ISO-8601 datetimes like `2023-12-12T12:05:13`, and categorical descriptors such as `Dimension Kind 01` or `Encoding 02` are stored as strings. The attribute definitions are themselves keyed by identifier (`OBSE-0001`, `ARTI-0005`, `OBSE-0007`), and each measurement instance references its attributes through an `entity_id` that points back to the measurement row and an `attr_id` that resolves to the attribute definition. This three-way join—measurement, attribute definition, attribute value—ensures that every piece of metadata is traceable to both its source and its schema.

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Confidence and uncertainty are the twin quality indicators that accompany every measurement. Confidence, expressed as a decimal between zero and one, quantifies the analyst's degree of belief in the measurement's accuracy; values such as `0.945` signal high assurance, while `0.307` indicates substantial doubt. Uncertainty, expressed as an absolute magnitude—`306.26`, `279.24`, `120.70`, `364.07`—represents the estimated error band around the reported value. Together, they form a quality envelope: a measurement of `660.64` with confidence `0.945` and uncertainty `279.24` is treated differently from a measurement of `64.10` with confidence `0.307` and uncertainty `364.07`, even though both are numerically valid. Downstream consumers use these fields to weight measurements in aggregations, to flag records for review, and to determine whether a measurement meets the threshold for regulatory or operational decision-making.

The value of a measurement—stored in the `value` column of the fact table—represents the actual observation: `353.34`, `878.99`, `64.10`. This value is not standalone; it is always accompanied by its confidence, its uncertainty, and its categorical classification. The fact table (`fact_measurement`) serves as the central grain of the warehouse, with each row representing a single measurement event identified by `id` and linked to its measurement definition via `measurement_key`. The measurement dimension (`dim_measurement`) provides the human-readable label (`Measurement Label 01` through `Measurement Label 04`) and resolves the category relationship, while the category dimension (`dim_measurement_category`) provides the category name (`Category Name 01` through `Category Name 04`) as the display-level grouping. This star schema design ensures that queries can join from the fact table to any dimension without ambiguity, and that the same measurement definition can appear across multiple categories without duplication.

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |