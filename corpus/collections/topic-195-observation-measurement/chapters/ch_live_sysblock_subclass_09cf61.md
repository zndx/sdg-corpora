---
chapter_id: ch_live_sysblock_subclass_09cf61
topic_id: 195
family: 01_foundation
cited_terms: ['sysblock_subclass', 'ebpf_event_basic', 'transformation_associated_with_agent']
model: engine-refine
---

An identifier anchors every record to a stable, machine-readable key that survives renaming, migration, and cross-referencing. Within the system-block domain, identifiers such as SYSB-0001 through SYSB-0004 designate distinct components — the Telemetry Hub Unit, the Governance Registry Core, the Stream Processor Node, and the Lab Instrument Controller — each of which may contain subordinate parts like a Memory Controller Die or a Network Interface Card. In the event-tracking domain, identifiers EVEN-0001 through EVEN-0004 tag discrete observations, including network_drop_tracker, dns_query_log, netsec_monitor, and disk_iops_counter. Transformation records carry identifiers AGEN-0001 through AGEN-0004, naming operations such as Archive Export Run, Feature Engineering Job, Model Retraining Cycle, and Sensor Calibration Pass. The identifier column is the sole key in its table; it is never nullable, never duplicated, and serves as the universal handle by which all downstream value tables and association tables resolve their references.

**t_sysblock_subclass**

| id | sysblock | has_part |
| --- | --- | --- |
| SYSB-0001 | Telemetry Hub Unit | Memory Controller Die |
| SYSB-0002 | Governance Registry Core | Network Interface Card |
| SYSB-0003 | Stream Processor Node | Network Interface Card |
| SYSB-0004 | Lab Instrument Controller | Network Interface Card |
| SYSB-0005 | Stream Processor Node | SFP Transceiver Module |
| SYSB-0006 | Telemetry Hub Unit | SFP Transceiver Module |

**t_ebpf_event_basic**

| id | ebpf |
| --- | --- |
| EVEN-0001 | network_drop_tracker |
| EVEN-0002 | dns_query_log |
| EVEN-0003 | netsec_monitor |
| EVEN-0004 | disk_iops_counter |
| EVEN-0005 | memory_leak_detector |
| EVEN-0006 | process_spawn_alert |
| EVEN-0007 | syscall_tracer |
| EVEN-0008 | network_drop_tracker |

An entity is the real-world or logical object that an identifier points to, and it is the entity that accumulates attributes over its lifecycle. The entity is not a column but a conceptual node in a graph: it is the Telemetry Hub Unit that possesses a checksum, the network_drop_tracker event that has a duration, the Feature Engineering Job that is associated with a Docker Container. The entity_id column in every value table — whether val_date, val_int, val_varchar, val_datetime, or val_decimal — is a foreign key back to the entity's identifier, and it is through this linkage that an entity becomes observable. A single entity may appear in multiple value tables simultaneously; SYSB-0001, for instance, carries a string value a3f9c21e in the varchar table, a date value 2024-02-28 in the date table, and integer values 221 and 12 in the int table, each row describing a different attribute of the same underlying entity.

**t_sysblock_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0002 | 2024-02-28 |
| SYSB-0002 | SYSB-0002 | SYSB-0002 | 2023-05-14 |
| SYSB-0003 | SYSB-0003 | SYSB-0002 | 2025-03-07 |
| SYSB-0004 | SYSB-0004 | SYSB-0002 | 2025-03-22 |
| SYSB-0005 | SYSB-0005 | SYSB-0002 | 2025-05-04 |
| SYSB-0006 | SYSB-0006 | SYSB-0002 | 2024-11-29 |

**t_sysblock_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0006 | 221 |
| SYSB-0002 | SYSB-0001 | SYSB-0008 | 12 |
| SYSB-0003 | SYSB-0002 | SYSB-0006 | 94 |
| SYSB-0004 | SYSB-0002 | SYSB-0008 | 3 |
| SYSB-0005 | SYSB-0003 | SYSB-0006 | 114 |
| SYSB-0006 | SYSB-0003 | SYSB-0008 | 9 |
| SYSB-0007 | SYSB-0004 | SYSB-0006 | 176 |
| SYSB-0008 | SYSB-0004 | SYSB-0008 | 10 |

**t_sysblock_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0001 | a3f9c21e |
| SYSB-0002 | SYSB-0001 | SYSB-0003 | oid:1.3.6.1 |
| SYSB-0003 | SYSB-0001 | SYSB-0004 | MIT |
| SYSB-0004 | SYSB-0001 | SYSB-0009 | zone-b |
| SYSB-0005 | SYSB-0001 | SYSB-0005 | application/xml |
| SYSB-0006 | SYSB-0001 | SYSB-0010 | Name 06 |
| SYSB-0007 | SYSB-0001 | SYSB-0011 | analytics |
| SYSB-0008 | SYSB-0001 | SYSB-0012 | Tags 08 |

**t_ebpf_event_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-02-22T10:41:40 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2025-04-20T21:58:53 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2024-07-05T03:32:46 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-01-15T01:37:56 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2024-11-30T06:10:00 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2023-10-12T13:43:33 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2025-05-19T17:11:08 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-12-23T02:27:40 |

**t_ebpf_event_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2084.55 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 3586.50 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2389.78 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 1708.37 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 4904.40 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 2045.89 |
| EVEN-0007 | EVEN-0007 | EVEN-0001 | 4164.85 |
| EVEN-0008 | EVEN-0008 | EVEN-0001 | 4492.01 |

**t_ebpf_event_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 615 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 227 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 918 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 103 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 872 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 453 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 370 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 219 |

**t_ebpf_event_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | gw-12 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | execution |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | failed |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | edge-03 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | review |

An attribute — abbreviated attr in the schema — is a named property of an entity, and its attr_type declares the XML Schema or custom datatype that constrains its values. The attribute definition table decouples the name from the value: checksum is declared as xsd:string, created_date as xsd:date, identifier as cco:DesignativeICE, and license as xsd:string within the system-block namespace; duration_seconds is xsd:decimal, end_time is xsd:dateTime, exit_code is xsd:integer, and host_name is xsd:string within the event namespace. This separation allows the value tables to be homogeneous — each stores only one datatype — while the attribute table provides the semantic label and type constraint that give those values meaning. The attr_id column in every value table is a foreign key into the attribute definition table, and together with entity_id it forms a composite reference that uniquely identifies which attribute of which entity is being recorded.

**t_sysblock_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSB-0001 | checksum | xsd:string |
| SYSB-0002 | created_date | xsd:date |
| SYSB-0003 | identifier | cco:DesignativeICE |
| SYSB-0004 | license | xsd:string |
| SYSB-0005 | mime_type | xsd:string |
| SYSB-0006 | size_bytes | xsd:long |
| SYSB-0007 | uri | xsd:string |
| SYSB-0008 | version | xsd:integer |

**t_ebpf_event_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

The misc column is the value carrier in every type-specific value table. It holds heterogeneous data — dates such as 2024-02-28, 2023-05-14, 2025-03-07, and 2025-03-22; integers such as 221, 12, 94, and 3; decimal measurements such as 2084.55, 3586.50, 2389.78, and 1708.37; and free-form strings such as a3f9c21e, oid:1.3.6.1, MIT, zone-b, gw-12, Log Level 02, execution, and failed — all within a single column whose type is determined by the table it resides in. The misc column is the only place where actual data values appear; it is the leaf of the entity-attribute-value triad, and its content is always interpretable only in conjunction with the entity_id and attr_id that reference it. This design avoids the need for wide tables with dozens of nullable columns, at the cost of requiring a join across three tables to reconstruct a single attribute value.

A role describes the capacity in which a subject participates in a relationship with a target. In the transformation-agent association table, the role column takes values such as contributor, reviewer, and observer, and it qualifies the link between a transformation (the subject, stored in transformation_id) and an agent or pipeline (the target, stored in was_associated_with_id). The same transformation AGEN-0006 may be linked to AGEN-0001 with the role contributor, while AGEN-0007 is linked to the same target with the role reviewer, and AGEN-0003 is linked to AGEN-0002 with the role observer. The subject-target-role triad is a general pattern: the subject is the entity initiating or owning the relationship, the target is the entity on the receiving end, and the role is the semantic label that disambiguates multiple relationships between the same pair. This structure supports many-to-many associations without requiring denormalization, and it allows the same target — such as Senior Data Engineer or GitHub CI Pipeline — to participate in multiple relationships with different roles across different transformations.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |