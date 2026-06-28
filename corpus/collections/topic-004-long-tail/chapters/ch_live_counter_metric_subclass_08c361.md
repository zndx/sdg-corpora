---
chapter_id: ch_live_counter_metric_subclass_08c361
topic_id: 4
family: 07_long_tail
cited_terms: ['counter_metric_subclass', 'measurement_subclass', 'evidence_observed_by_process']
model: engine-refine
---

In operational measurement frameworks, the ability to track, classify, and version metrics is foundational to governance and auditability. The fact table `fact_counter` serves as the central ledger for metric instances, each identified by a unique key such as `METR-0001` or `METR-0004`. Every entry records the metric's current version number—ranging from version 5 for `METR-0004` to version 12 for `METR-0001`—alongside the cumulative `size_bytes` consumed by that metric's data, which in practice spans hundreds of megabytes, as seen with `977102405` bytes for `METR-0001` and `422660739` bytes for `METR-0004`. The `metric_kind_key` column links each counter record to its classification in the dimension table `dim_metric_kind`, enabling a clean separation between measured quantities and their semantic labels. Within `dim_metric_kind`, each identifier such as `METR-0001` carries a human-readable `metric_kind_label` like "Metric Kind Label 01" and a `metric_kind_category` such as "Metric Kind Category 01," providing the taxonomy through which metrics are organized, filtered, and reported across the organization.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

Measurement semantics extend beyond simple counters into structured subclasses that capture the physical or operational phenomena being observed. The table `t_measurement_subclass` enumerates these phenomena, with entries like "Heart rate," "Seismic magnitude," and "Soil moisture" representing distinct measurement domains. Each subclass is identified by a key such as `MEAS-0001` or `MEAS-0003`, and the same identifier may appear multiple times across related records—for instance, "Soil moisture" is associated with both `MEAS-0003` and `MEAS-0004`, suggesting that a single measurement concept can be instantiated under different dimensional configurations. This design supports the reuse of measurement definitions while allowing each instantiation to carry its own dimensional context.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

The dimensional structure of measurements is captured through `t_measurement_subclass_dimension`, which maps physical or analytical dimensions to measurement subclasses. Dimensions such as "Electric current," "Power," "Energy," and "Mass" are each assigned an identifier like `MEAS-0001` through `MEAS-0004`. The associative table `t_measurement_subclass__dimension` then binds measurement subclasses to their applicable dimensions, forming a many-to-many relationship that reflects the complexity of real-world measurement models. Each binding carries a `role` attribute—either "owner" or "reviewer"—that specifies the nature of the dimension's involvement. For example, the measurement identified by `MEAS-0004` is linked to dimension `MEAS-0003` with the role "owner," while the same measurement is also associated with dimension `MEAS-0005` under the same role, whereas `MEAS-0005` is linked to dimension `MEAS-0001` with the role "reviewer." This role distinction enables fine-grained governance over which dimensions are authoritative versus which serve a supervisory or validation function.

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Evidence collection and observation logging complete the measurement lifecycle by recording actual sensor readings and their contextual metadata. The table `t_evidence_observed_by_process` stores individual observations, each identified by a process key such as `PROC-0001` or `PROC-0004`. The `evidence` column describes the type of observation captured—examples include `voltage_dip_trace`, `ph_sensor_record`, and `vibration_anomaly_log`—while the `value` column holds the numeric measurement, such as `573.25` for the voltage dip trace or `199.51` for the vibration anomaly log. The `language` column records the locale of the observation in ISO two-letter codes, with values like `en`, `es`, `de`, and `fr` reflecting the multilingual nature of distributed operations. This evidence table provides the raw material for metric computation and audit trails, linking concrete sensor data to the structured metric taxonomy defined in the counter and dimension tables.

**t_evidence_observed_by_process**

| id | evidence | value | language |
| --- | --- | --- | --- |
| PROC-0001 | voltage_dip_trace | 573.25 | en |
| PROC-0002 | ph_sensor_record | 273.64 | es |
| PROC-0003 | vibration_anomaly_log | 199.51 | de |
| PROC-0004 | ph_sensor_record | 512.26 | fr |
| PROC-0005 | voltage_dip_trace | 950.53 | es |