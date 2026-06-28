---
chapter_id: ch_live_labrun_min_one_sample_d24745
topic_id: 67
family: 02_observation_measurement
cited_terms: ['labrun_min_one_sample', 'descriptive_not_retracted', 'vehicle_equipment_specification']
model: engine-refine
---

Laboratory sample records are anchored by a core entity table that binds each sample identifier—SAMP-0001 through SAMP-0004—to a specific laboratory run such as SEQ-EXP-99, PROTOCOL-V3, or CEL-SEQR-112, and to an originating input sample drawn from the descriptive registry (RETR-0001 through RETR-0006). This anchoring table establishes the minimal one-sample-per-run invariant; every laboratory execution is guaranteed at least one associated sample, and the linkage to input samples creates a traceable provenance chain back to the source material. The descriptive registry itself, `t_descriptive_not_retracted`, holds metadata artifacts such as Sensor Drift Note, Anomaly Flag Sheet, and Metadata Index Card, each paired with a secondary descriptor like Calibration Reference Sheet or Anomaly Classification Code. These records are not ephemeral annotations but persistent descriptive artifacts that remain unretracted, forming the authoritative provenance layer against which laboratory runs are validated.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RETR-0003 |
| SAMP-0002 | PROTOCOL-V3 | RETR-0006 |
| SAMP-0003 | CEL-SEQR-112 | RETR-0005 |
| SAMP-0004 | CEL-SEQR-112 | RETR-0001 |
| SAMP-0005 | PCR-CYCLE-44 | RETR-0003 |
| SAMP-0006 | METAB-ASSAY-Q2 | RETR-0003 |

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

Attribute definitions for both sample and descriptive entities are captured in a parallel schema: `t_labrun_min_one_sample_attr` and `t_descriptive_not_retracted_attr` each enumerate attribute names alongside their XSD-typed semantics. For laboratory samples, attributes include duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. For descriptive records, the attribute set comprises confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). This separation of attribute schema from attribute values enables type-safe storage and query optimization, as each value type is materialized in its own table. The datetime values table stores timestamps such as 2024-08-01T16:02:07 and 2024-02-12T19:03:44; the decimal values table holds numeric measurements like 2021.10, 4946.17, and 0.736; the integer values table captures exit codes and counts including 230, 435, and 670; and the varchar values table preserves free-form strings such as edge-03, Log Level 02, closeout, and complete. Each value row is resolved through a composite foreign key: entity_id points to the owning sample or descriptive record, and attr_id references the corresponding attribute definition, ensuring that every stored value is both type-correct and semantically grounded.

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

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

The vehicle equipment specification domain follows a parallel but structurally distinct pattern, modeling the relationship between equipment specifications, vehicle classes, and mandated components through a set of junction tables that encode role semantics and cardinality constraints. The core specification table, `t_vehicle_equipment_specification`, enumerates equipment profiles such as CAT 320 Excavator, Emergency Response, Scania R500, and Medium Duty. A direct mapping table, `t_vehicle_equipment_specification_applies_to_vehicle_class`, associates each specification with applicable vehicle classes including Tesla Model Y, Daf XF105, Toyota Hilux, and Light Utility Vehicle. The normalized junction table `t_vehicle_equipment_specification__applies_to_vehicle_class` introduces a role dimension—contributor, owner, or reviewer—allowing the same specification-to-class relationship to be expressed with different organizational responsibilities depending on context. For instance, specification SPEC-0002 appears with role owner when linked to class SPEC-0005, and with role reviewer when linked to class SPEC-0001, reflecting the same equipment specification playing different governance roles across vehicle class memberships.

**t_vehicle_equipment_specification_applies_to_vehicle_class**

| id | applies_to_vehicle_class |
| --- | --- |
| SPEC-0001 | Tesla Model Y |
| SPEC-0002 | Daf XF105 |
| SPEC-0003 | Toyota Hilux |
| SPEC-0004 | Light Utility Vehicle |
| SPEC-0005 | Ford F-150 |
| SPEC-0006 | Hybrid Electric |

**t_vehicle_equipment_specification__applies_to_vehicle_class**

| id | vehicle_id | applies_to_vehicle_class_id | role |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0005 | SPEC-0001 | contributor |
| SPEC-0002 | SPEC-0002 | SPEC-0005 | owner |
| SPEC-0003 | SPEC-0006 | SPEC-0004 | owner |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | reviewer |
| SPEC-0005 | SPEC-0001 | SPEC-0004 | reviewer |
| SPEC-0006 | SPEC-0006 | SPEC-0005 | contributor |
| SPEC-0007 | SPEC-0003 | SPEC-0003 | contributor |
| SPEC-0008 | SPEC-0001 | SPEC-0005 | owner |

Component mandates are modeled through a symmetric pair of tables: `t_vehicle_equipment_specification_mandates_component` lists the required components—Auxiliary Power Unit, Engine Block Heater, Adaptive Cruise Control, Electronic Stability Control—while `t_vehicle_equipment_specification__mandates_component` resolves the many-to-many relationship with both a role attribute (observer, contributor) and a cardinality_note field (Cardinality Note 01 through Cardinality Note 04). This dual-layer design permits the system to express not only which components a specification requires but also the nature of the specification's relationship to each component and the multiplicity constraints governing the association. The cardinality notes, though abstractly labeled, serve as placeholders for formal multiplicity declarations that would be expanded in a complete data dictionary. Across all three domains—laboratory samples, descriptive records, and vehicle equipment specifications—the common architectural pattern is clear: a core entity table provides the primary key and business-level identifiers, an attribute definition table establishes the schema with typed semantics, and type-dispatched value tables store the actual data, all connected through foreign-key relationships that enforce referential integrity and enable precise, type-safe queries.

**t_vehicle_equipment_specification**

| id | vehicle_equipment_specification |
| --- | --- |
| SPEC-0001 | CAT 320 Excavator |
| SPEC-0002 | Emergency Response |
| SPEC-0003 | Scania R500 |
| SPEC-0004 | Medium Duty |
| SPEC-0005 | Volvo FH16 |
| SPEC-0006 | Mercedes Sprinter |

**t_vehicle_equipment_specification_mandates_component**

| id | mandates_component |
| --- | --- |
| SPEC-0001 | Auxiliary Power Unit |
| SPEC-0002 | Engine Block Heater |
| SPEC-0003 | Adaptive Cruise Control |
| SPEC-0004 | Electronic Stability Control |
| SPEC-0005 | Backup Camera |
| SPEC-0006 | Adaptive Cruise Control |

**t_vehicle_equipment_specification__mandates_component**

| id | vehicle_id | mandates_component_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SPEC-0001 | SPEC-0004 | SPEC-0003 | observer | Cardinality Note 01 |
| SPEC-0002 | SPEC-0003 | SPEC-0002 | contributor | Cardinality Note 02 |
| SPEC-0003 | SPEC-0006 | SPEC-0001 | contributor | Cardinality Note 03 |
| SPEC-0004 | SPEC-0006 | SPEC-0006 | observer | Cardinality Note 04 |
| SPEC-0005 | SPEC-0006 | SPEC-0006 | owner | Cardinality Note 05 |
| SPEC-0006 | SPEC-0005 | SPEC-0004 | observer | Cardinality Note 06 |
| SPEC-0007 | SPEC-0002 | SPEC-0005 | contributor | Cardinality Note 07 |
| SPEC-0008 | SPEC-0005 | SPEC-0004 | owner | Cardinality Note 08 |