---
chapter_id: ch_live_schemaorg_place_latitude_98b8f5
topic_id: 0
family: 07_long_tail
cited_terms: ['schemaorg_place_latitude', 'mass_function_equiv_frame_and_assignment', 'outlier_detection_with_baseline']
model: engine-refine
---

The architecture of the schema rests upon a disciplined separation between entities, their attributes, and the values those attributes assume, with every object and relationship anchored by a stable identifier. In the fact table for schemaorg records, identifiers such as LATI-0001 through LATI-0004 serve as the primary keys, while a latitude_key column references the corresponding entry in the dimension table for latitude, establishing a foreign-key relationship that ties each fact row to its categorical context. The same dimension table, dim_latitude, carries human-readable labels—Latitude Label 01 through Latitude Label 04—alongside a latitude_category column whose values, Latitude Category 01 through Latitude Category 04, group these entries into classification buckets. The fact table itself also records a size_bytes measure, with values ranging from 114,301,972 to 998,785,819 bytes, and a version column that distinguishes schema revisions across rows, taking values of 3, 4, 5, and 8.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

The mass-function equivalent frame and assignment table introduces a different class of entity, identified by codes such as ASSI-0001 through ASSI-0004, and encodes a three-way relationship: a mass descriptor—corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, or vibration_profile_test—is evaluated over a frame of discernment like terrain_type_catalog, temperature_range, or geographic_zone_map, and is assigned to a target concept such as fault_or_failure, land_or_sea_only, or degraded_state_only. This table is enriched by an attribute definition table that declares the properties of each assignment record. The attr_name column lists property names including confidence, dimension_kind, method, and recorded_at, while the attr_type column specifies their data types using XML Schema datatypes: xsd:decimal, xsd:string, and xsd:dateTime. These attribute definitions are not stored inline with the assignment facts; instead, they are materialized in a separate table and referenced through foreign keys in the value tables that follow.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | terrain_type_catalog | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | temperature_range | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | geographic_zone_map | degraded_state_only |
| ASSI-0004 | vibration_profile_test | temperature_range | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | terrain_type_catalog | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | material_phase_index | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

Value storage is partitioned by type, a design choice that enforces type safety while allowing each attribute to carry heterogeneous data. The datetime value table links an entity_id and an attr_id—both foreign keys referencing the assignment and attribute tables respectively—to a value column that holds ISO 8601 timestamps such as 2025-06-10T14:56:29, 2024-06-25T12:59:02, 2024-03-24T16:20:19, and 2025-03-04T17:25:44. The decimal value table similarly joins entity_id and attr_id to a value column containing numeric measurements like 0.002, 724.48, 469.73, and 0.018. The varchar value table follows the same pattern, storing string values including Dimension Kind 01, Encoding 02, pre-release note, and the language code fr. In each case, the entity_id column acts as the foreign key pointing back to the assignment record, while attr_id points to the attribute definition, ensuring that every value is traceable to both the entity it describes and the property it quantifies.

The outlier-detection subsystem mirrors this entity-attribute-value pattern at a higher level of abstraction. The baseline outlier table holds records identified by BASE-0001 through BASE-0004, each describing an anomaly such as network latency jump, log flood, or sensor drift. The baseline reference table, against, holds records with identifiers and descriptions like expected distribution, nominal profile, and seasonal pattern. These two sets of records are joined by a junction table whose columns are named subject and target—foreign keys referencing the outlier and baseline tables respectively—and a role column that characterizes the nature of the relationship, taking values of observer or reviewer. This three-column structure, with subject pointing to the outlier, target pointing to the baseline, and role describing the linkage, generalizes the entity-relationship model to support many-to-many associations with semantic labels on the edges.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

Across all tables, the recurring pattern is clear: identifiers provide stable, opaque keys that decouple logical relationships from human-readable content; attributes define the properties of entities with explicit type constraints; values are stored in type-specific tables that reference both the entity and the attribute through foreign keys; categories and labels provide human-interpretable groupings; and junction tables with role columns encode the semantics of relationships between entities. The version column in the schemaorg fact table and the size_bytes measure illustrate how temporal and quantitative metadata are layered onto the core entity-attribute-value structure, while the mass-function assignment table demonstrates how domain-specific relationships—linking a measurement to a frame of discernment and a target concept—are modeled as first-class entities with their own attributes and values.