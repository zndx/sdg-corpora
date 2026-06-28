---
chapter_id: ch_live_log_with_resource_attribute_d7eb3a
topic_id: 183
family: 07_long_tail
cited_terms: ['log_with_resource_attribute', 'allocation_basic', 'instrument_subclass']
model: engine-refine
---

Allocation and resource attribute management form the backbone of operational telemetry, where fact tables record granular events and dimension tables provide the contextual taxonomy that makes those events interpretable. Each fact record carries a unique identifier—such as `ATTR-0001` for a resource attribute log entry or `ALLO-0001` for an allocation event—that serves as the anchor for all downstream analysis. These identifiers are not arbitrary; they follow a structured naming convention that encodes the entity type, enabling rapid classification and cross-referencing across the data model. The fact tables themselves capture the measurable aspects of operations: allocation records track how long a resource was held (`duration_seconds` values like `6322.19` or `7031.31`), whether the operation completed successfully (`exit_code` values ranging from `141` to `988`), and how many times the system retried before reaching a final state (`retry_count` values spanning from `32` to `415`). Resource attribute logs, by contrast, measure the volume of data associated with each attribute, with `size_bytes` figures such as `913386183` and `303816232` reflecting the scale of individual attribute instances.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

**fact_allocation**

| id | allocation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ALLO-0001 | ALLO-0002 | 6322.19 | 604 | 49 |
| ALLO-0002 | ALLO-0003 | 1151.17 | 457 | 282 |
| ALLO-0003 | ALLO-0003 | 4950.80 | 988 | 415 |
| ALLO-0004 | ALLO-0003 | 7031.31 | 141 | 32 |
| ALLO-0005 | ALLO-0001 | 3728.13 | 271 | 498 |
| ALLO-0006 | ALLO-0005 | 4892.58 | 91 | 385 |
| ALLO-0007 | ALLO-0002 | 586.50 | 781 | 414 |
| ALLO-0008 | ALLO-0004 | 850.51 | 189 | 222 |

The dimension tables provide the semantic layer that transforms raw identifiers into actionable categories. Every resource attribute and allocation record is enriched through a foreign-key join to its corresponding dimension, where `resource_attribute_label` and `allocation_label` columns supply human-readable names—`Resource Attribute Label 01` or `Allocation Label 03`—while `resource_attribute_category` and `allocation_category` columns assign each entity to a classification such as `Resource Attribute Category 01` or `Allocation Category 03`. This separation of concerns between fact and dimension is critical for governance: operational metrics can be aggregated, filtered, and pivoted by category without altering the underlying event data, and label changes propagate automatically to all associated fact records. The `misc` columns in the dimension tables hold these descriptive labels, while the `category` columns hold the classification keys that drive reporting hierarchies and access controls.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

**dim_allocation**

| id | allocation_label | allocation_category |
| --- | --- | --- |
| ALLO-0001 | Allocation Label 01 | Allocation Category 01 |
| ALLO-0002 | Allocation Label 02 | Allocation Category 02 |
| ALLO-0003 | Allocation Label 03 | Allocation Category 03 |
| ALLO-0004 | Allocation Label 04 | Allocation Category 04 |
| ALLO-0005 | Allocation Label 05 | Allocation Category 05 |
| ALLO-0006 | Allocation Label 06 | Allocation Category 06 |

Versioning and lifecycle tracking add temporal discipline to both resource attributes and instruments. The `version` column in the resource attribute fact table—holding integer values like `2`, `6`, and `7`—enables audit trails and rollback capabilities, ensuring that any given measurement can be traced back to the exact state of the attribute at the time it was recorded. Instruments, tracked in the `t_instrument_subclass` table, carry a `created_date` field that anchors each device to its introduction into the operational environment; dates such as `2023-03-12` for a Seismometer CMG-3ESP or `2023-09-27` for an X-Ray Diffractometer Bruker D8 establish the temporal baseline for all measurements produced by that instrument. The `tags` column—containing values like `archived`, `internal`, and `verified`—provides a lightweight metadata mechanism for marking instruments by their operational status or compliance posture, allowing queries to filter on verification state or exclude archived devices from active reporting.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | ion intensity | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | infrared radiation | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | ground acceleration | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | ground acceleration | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | voltage waveform | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | ion intensity | 2024-03-26 | archived |

The relationship between instruments and their outputs is captured through the `produces_measurement` column, which documents the physical quantity each device measures—`ion intensity` for the X-Ray Diffractometer, `infrared radiation` for the Flow Cytometer, and `ground acceleration` for both the Seismometer and the Spectrophotometer. This creates a clear lineage from instrument to measurement type, which can then be correlated with allocation and resource attribute data to determine which resources were consumed during specific measurement activities. The `exit` codes in the allocation fact table—values like `604`, `457`, and `988`—serve as the operational signal that an allocation event has concluded, and when combined with `retry_count` data, they reveal patterns of resource contention or transient failures that warrant investigation. An allocation with a `retry_count` of `415` and an `exit_code` of `988` tells a different story than one with `32` retries and an `exit_code` of `141`, even if their `duration_seconds` are comparable, because the former suggests systemic instability rather than a simple timeout.