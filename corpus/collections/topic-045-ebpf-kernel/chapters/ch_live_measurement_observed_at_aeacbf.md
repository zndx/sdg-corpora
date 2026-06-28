---
chapter_id: ch_live_measurement_observed_at_aeacbf
topic_id: 45
family: 02_observation_measurement
cited_terms: ['measurement_observed_at', 'schemaorg_creativework_author', 'ebpfmap_only_one_value_type']
model: engine-refine
---

The attribute registry establishes a formal taxonomy of metadata properties, each identified by a unique key and classified by a machine-readable type. Within the measurement observation domain, attributes such as *confidence*, *dimension_kind*, *method*, and *recorded_at* are defined with corresponding type annotations—`xsd:decimal`, `xsd:string`, and `xsd:dateTime`—that govern how values are stored, validated, and queried. This separation of attribute schema from value storage enables type-safe serialization: decimal-valued attributes like confidence are persisted in a dedicated decimal value table, string-valued attributes such as *dimension_kind* and *method* reside in a variable-character table, and temporal attributes like *recorded_at* are stored in a datetime table. The same pattern recurs in the schema.org creative work domain, where attributes including *checksum*, *created_date*, *identifier*, and *license* are typed as `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively, each routed to a type-specific value store.

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

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Entity-attribute relationships are mediated through a normalized value table per type, where each row binds an entity identifier to an attribute identifier and a concrete value. In the measurement observation context, entity `OBSE-0001` carries a confidence value of `0.528` and a dimension kind of `Dimension Kind 01`, while entity `OBSE-0002` records a confidence of `0.215`. Temporal values are anchored to the same entity-attribute pairs: `OBSE-0001` was recorded at `2023-12-12T12:05:13`, `OBSE-0002` at `2024-12-09T20:37:11`, `OBSE-0003` at `2023-09-12T00:10:32`, and `OBSE-0004` at `2024-08-27T19:17:19`. The schema.org creative work domain mirrors this structure: entity `AUTH-0001` holds a checksum of `7b14de08`, an identifier of `gid://svc/77`, a license of `GPL-3.0`, and a created date of `2023-12-01`, while entity `AUTH-0002` carries a checksum of `on-prem-dc1` and a created date of `2024-12-04`. Integer-valued attributes further extend the value table pattern, with `AUTH-0001` storing integer values of `363` and `12`, and `AUTH-0002` storing `393` and `3`.

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

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

The measurement observation records themselves serve as the primary entities to which attributes are affixed. Each observation—identified by keys such as `OBSE-0001` through `OBSE-0004`—represents a distinct telemetry event: a temperature gradient, a packet loss measurement, a wind shear reading, or a network latency sample. These observations are linked to authorship records through the `observed_at` column, which references author identifiers including `AUTH-0005`, `AUTH-0003`, `AUTH-0007`, and `AUTH-0001`. The authorship linkage is further elaborated in the creative work author table, where documents such as `API_Reference_Guide` and `Provenance_Trace_Report` are associated with author entities `OBSE-0006`, `OBSE-0005`, `OBSE-0004`, and `OBSE-0006`, establishing a provenance chain between the measurement event and its documented attribution.

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | AUTH-0005 |
| OBSE-0002 | packet loss | AUTH-0003 |
| OBSE-0003 | wind shear | AUTH-0007 |
| OBSE-0004 | network latency | AUTH-0001 |
| OBSE-0005 | pH level | AUTH-0007 |
| OBSE-0006 | pH level | AUTH-0004 |

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | OBSE-0006 |
| AUTH-0002 | Provenance_Trace_Report | OBSE-0005 |
| AUTH-0003 | API_Reference_Guide | OBSE-0006 |
| AUTH-0004 | Provenance_Trace_Report | OBSE-0004 |
| AUTH-0005 | Sensor_Network_Spec | OBSE-0006 |
| AUTH-0006 | Catalog_Metadata_Index | OBSE-0005 |
| AUTH-0007 | Telemetry_Config_Spec | OBSE-0003 |
| AUTH-0008 | Catalog_Metadata_Index | OBSE-0005 |

At the analytical layer, the fact table `fact_ebpfmap` aggregates system-level metrics keyed by a type map reference, with columns for `size_bytes` and `version` providing quantitative and categorical dimensions. The `value_type_map_key` column references the dimension table `dim_value_type_map`, which supplies human-readable labels such as `Value Type Map Label 01` through `Value Type Map Label 04` and categorical classifications including `Value Type Map Category 01` through `Value Type Map Category 04`. This fact-dimension pairing supports roll-up and drill-down queries: a fact record with `size_bytes` of `208979093` and `version` `3` maps to type map `TYPE-0002`, while another record with `size_bytes` of `354373995` and `version` `5` maps to `TYPE-0003`. The type map dimension thus provides a stable categorization axis across which byte-level and version-level facts can be aggregated, partitioned, and compared.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |