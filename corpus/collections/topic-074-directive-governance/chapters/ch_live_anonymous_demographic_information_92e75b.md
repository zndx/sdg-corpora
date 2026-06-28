---
chapter_id: ch_live_anonymous_demographic_information_92e75b
topic_id: 74
family: 08_derived
cited_terms: ['anonymous_demographic_information', 'ebpfevent_at_kernel_hook_xref', 'descriptive_only_about_artifact']
model: engine-refine
---

The data architecture centers on a structured approach to managing demographic information across varying sensitivity tiers, from fully anonymized aggregates to personally identifiable records. At the core of this framework, demographic attributes such as school_district_enrollment, household_size, geographic_region, and health_survey_responses are classified according to their privacy implications, with some entries carrying no personally identifiable information while others are linked to home_address, full_legal_name, or passport_number. Each record receives a unique identifier—INFO-0001 through INFO-0004 in the observed sample—serving as the anchor point for all downstream attribute associations and value lookups. This tiered classification ensures that data governance policies can be applied consistently, distinguishing between anonymous demographic information and demographic information that may require additional safeguards when combined with personally identifiable information.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |

Attribute metadata is maintained separately from attribute values, enabling a flexible schema where each attribute carries a name and a typed definition. Attributes such as confidence, dimension_kind, method, and recorded_at are declared with their corresponding data types—xsd:decimal, xsd:string, and xsd:dateTime—allowing the system to enforce type safety while supporting heterogeneous value storage. This separation of concerns extends to the value layer, where attributes are resolved against entity identifiers and stored in type-specific value tables. For instance, confidence values appear as decimal measurements like 0.448 and 0.771, temporal attributes such as recorded_at are stored as ISO 8601 timestamps including 2024-08-15T06:37:30 and 2023-10-27T17:02:18, and categorical or textual attributes like dimension_kind hold string values such as Dimension Kind 01 and Encoding 02. The entity_id column in each value table establishes the linkage between an attribute definition and its concrete observation, while attr_id resolves the attribute name and type from the metadata layer.

The same Entity-Attribute-Value pattern is applied to kernel-level event data, where cross-references between eBPF events and kernel hooks are enriched with operational metadata. Attributes such as duration_seconds, end_time, exit_code, and host_name are defined with types including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string, and their values are stored in corresponding type-specific tables. Duration measurements for events like tracepoint_file_open and kprobe_do_execve appear as decimal values ranging from 1550.57 to 6431.54, while temporal attributes capture timestamps such as 2023-05-01T02:25:15 and 2024-11-27T07:20:09. Integer-valued attributes record exit codes and numeric identifiers, and string-valued attributes store host names like node-b14 and categorical labels such as Log Level 02 and execution. This uniform treatment of attribute metadata and typed values across both demographic and system telemetry domains simplifies query patterns and ensures consistent data governance.

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | tracepoint_file_open |
| XREF-0002 | tracepoint_sched_switch |
| XREF-0003 | tracepoint_sched_switch |
| XREF-0004 | kprobe_do_execve |
| XREF-0005 | kretprobe_sys_openat |
| XREF-0006 | tracepoint_file_open |
| XREF-0007 | tracepoint_file_open |

**t_ebpfevent_at_kernel_hook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_at_kernel_hook_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2023-05-01T02:25:15 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2024-11-27T07:20:09 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2025-02-12T09:55:43 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-05-24T23:07:29 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2024-09-21T23:23:59 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2024-03-30T22:13:30 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2023-05-04T20:31:37 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2025-01-21T19:19:05 |

**t_ebpfevent_at_kernel_hook_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 6431.54 |
| XREF-0002 | XREF-0002 | XREF-0001 | 4806.21 |
| XREF-0003 | XREF-0003 | XREF-0001 | 5462.31 |
| XREF-0004 | XREF-0004 | XREF-0001 | 1550.57 |
| XREF-0005 | XREF-0005 | XREF-0001 | 39.90 |
| XREF-0006 | XREF-0006 | XREF-0001 | 2405.95 |
| XREF-0007 | XREF-0007 | XREF-0001 | 1945.32 |

**t_ebpfevent_at_kernel_hook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 571 |
| XREF-0002 | XREF-0001 | XREF-0007 | 284 |
| XREF-0003 | XREF-0002 | XREF-0003 | 60 |
| XREF-0004 | XREF-0002 | XREF-0007 | 436 |
| XREF-0005 | XREF-0003 | XREF-0003 | 3 |
| XREF-0006 | XREF-0003 | XREF-0007 | 8 |
| XREF-0007 | XREF-0004 | XREF-0003 | 922 |
| XREF-0008 | XREF-0004 | XREF-0007 | 55 |

**t_ebpfevent_at_kernel_hook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | node-b14 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | execution |
| XREF-0004 | XREF-0001 | XREF-0010 | pending |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | edge-03 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | review |

Observations within the fact layer are enriched with confidence and uncertainty measures that quantify the reliability of each recorded value. The fact_descriptive table links each observation to an about_key that references a dimension record containing a label and a category, such as About Label 01 mapped to About Category 01. Confidence values—ranging from 0.209 to 0.854 in the observed sample—express the degree of certainty in the associated measurement, while uncertainty values—spanning from 452.69 to 846.52—provide a complementary quantitative assessment of potential deviation. These paired metrics enable downstream consumers to apply threshold-based filtering, weight observations in aggregation pipelines, or flag records requiring manual review. The about_category field further supports classification and filtering, allowing analysts to group observations by semantic category while retaining access to the underlying confidence and uncertainty metadata for quality-aware decision making.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |