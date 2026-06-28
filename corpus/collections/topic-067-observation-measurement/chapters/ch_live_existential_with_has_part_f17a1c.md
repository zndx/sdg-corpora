---
chapter_id: ch_live_existential_with_has_part_f17a1c
topic_id: 67
family: 01_foundation
cited_terms: ['existential_with_has_part', 'vehicle_equipment_specification', 'labrun_basic']
model: engine-refine
---

The foundational ontology distinguishes between the *entity* as the primary instance of a domain object and the *identifier* as its immutable reference key, such as `LABR-0001` for a laboratory run or `PART-0001` for a system component. Attributes (*attr*) are decoupled from instances to allow flexible typing; the *attr type* enforces schema conformance through standardized datatypes like `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. For instance, the attribute `duration_seconds` is bound to `xsd:decimal`, yielding a value of `1438.98`, whereas `end_time` adheres to `xsd:dateTime` and records `2025-01-01T00:58:28`. The actual data payload resides in the *misc* column, which captures heterogeneous values ranging from numeric results like `918` for `exit_code` to string descriptors such as `edge-03` for `host_name` or `complete` for execution status.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

Within the vehicle compliance framework, the *vehicleequipmentspecification* serves as the governing artifact that dictates operational requirements, exemplified by specifications such as `CAT 320 Excavator`, `Scania R500`, `Emergency Response`, and `Medium Duty`. These specifications are not abstract; they are explicitly scoped to a *motorvehicleclass*, thereby linking equipment mandates to specific vehicle archetypes like the `Tesla Model Y`, `Daf XF105`, `Toyota Hilux`, or the generic `Light Utility Vehicle`. Furthermore, the framework enforces hardware compliance through the *vehiclecomponent* entity, which enumerates mandatory subsystems including the `Auxiliary Power Unit`, `Engine Block Heater`, `Adaptive Cruise Control`, and `Electronic Stability Control`. The integrity of this domain relies on the precise mapping between a specification and its requisite components, ensuring that every mandated part is traceable to a specific equipment profile.

**t_vehicle_equipment_specification**

| id | vehicle_equipment_specification |
| --- | --- |
| SPEC-0001 | CAT 320 Excavator |
| SPEC-0002 | Emergency Response |
| SPEC-0003 | Scania R500 |
| SPEC-0004 | Medium Duty |
| SPEC-0005 | Volvo FH16 |
| SPEC-0006 | Mercedes Sprinter |

**t_vehicle_equipment_specification_applies_to_vehicle_class**

| id | applies_to_vehicle_class |
| --- | --- |
| SPEC-0001 | Tesla Model Y |
| SPEC-0002 | Daf XF105 |
| SPEC-0003 | Toyota Hilux |
| SPEC-0004 | Light Utility Vehicle |
| SPEC-0005 | Ford F-150 |
| SPEC-0006 | Hybrid Electric |

**t_vehicle_equipment_specification_mandates_component**

| id | mandates_component |
| --- | --- |
| SPEC-0001 | Auxiliary Power Unit |
| SPEC-0002 | Engine Block Heater |
| SPEC-0003 | Adaptive Cruise Control |
| SPEC-0004 | Electronic Stability Control |
| SPEC-0005 | Backup Camera |
| SPEC-0006 | Adaptive Cruise Control |

Relational integrity is maintained through explicit association tables that define the *subject* as the originating entity and the *target* as the destination of the relationship. These associations are qualified by a *role*, which characterizes the nature of the interaction; for example, a vehicle equipment specification may assume the role of `owner` or `contributor` when applied to a vehicle class, or act as an `observer` when referencing a mandated component. The *cardinality note* provides additional constraints on these relationships, with entries such as `Cardinality Note 01` through `Cardinality Note 04` specifying multiplicity rules that govern whether a subject must relate to one or multiple targets. This tripartite structure of subject, target, and role ensures that the provenance and context of every linkage are preserved, preventing ambiguous associations within the governance model.

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

The system further supports compositional hierarchies through the *existential* and *has_part* relationship, allowing complex entities to be decomposed into constituent elements. A system such as the `BatchIngestionPipeline` may be defined as the *existential* entity composed of parts like the `FirewallRule`, `StorageVolume`, `WorkerProcess`, or `TemperatureProbe`. This meronymic structure mirrors the compliance requirements, where a high-level *vehicleequipmentspecification* mandates specific *vehiclecomponent*s, and a laboratory *entity* aggregates multiple typed *attr* values. By unifying these relational patterns—typed attributes, qualified roles, cardinality constraints, and part-whole hierarchies—the framework provides a rigorous mechanism for modeling both the static structure of domain objects and the dynamic constraints of their interactions.