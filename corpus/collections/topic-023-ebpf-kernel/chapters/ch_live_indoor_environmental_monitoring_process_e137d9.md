---
chapter_id: ch_live_indoor_environmental_monitoring_process_e137d9
topic_id: 23
family: 08_derived
cited_terms: ['indoor_environmental_monitoring_process', 'annotation_assigned_by', 'ebpf_program_governed_by_directive']
model: engine-refine
---

The indoor environmental monitoring process serves as the operational nexus of a governance framework that binds physical spaces to standardized measurement protocols. Each process—identified by a structured code such as PROC-0001 through PROC-0004—encapsulates a discrete monitoring initiative, whether it be the Library Climate Calibration, the Office Floor CO2 Mapping, the Server Hall Alpha campaign, or the Cafeteria Zone C assessment. The process entity carries two critical foreign-key relationships: it monitors an indoor environment, which may be a Server Hall Alpha, a West Wing HVAC Survey, an ICU Wing South, or a Dormitory Radon Campaign, and it employs a monitoring protocol drawn from a registry that includes the Chemical Storage Vault, the Cafeteria Ventilation Test, the Cleanroom Particulate Sweep, and the Office Floor CO2 Mapping. This tripartite linkage—process, environment, protocol—establishes a traceable chain of custody from the physical space under surveillance through the procedural methodology applied to it, ensuring that every measurement event can be audited back to both the location and the technique.

**t_indoor_environmental_monitoring_process**

| id | indoor_environmental_monitoring_process | monitors_indoor_environment | uses_monitoring_protocol |
| --- | --- | --- | --- |
| PROC-0001 | Library Climate Calibration | Server Hall Alpha | Chemical Storage Vault |
| PROC-0002 | Office Floor CO2 Mapping | West Wing HVAC Survey | Cafeteria Ventilation Test |
| PROC-0003 | Server Hall Alpha | ICU Wing South | Cleanroom Particulate Sweep |
| PROC-0004 | Cafeteria Zone C | Dormitory Radon Campaign | Office Floor CO2 Mapping |

Governance of these monitoring activities is mediated through a directive layer that assigns responsibility and enforces compliance standards. Annotations such as compliance_audit, telemetry_ingestion, and provenance_trace are dispatched by directive entities—DIRE-0005 and DIRE-0006 among those observed—and each annotation carries a set of typed attributes that quantify its characteristics. The attribute schema is defined in a dedicated metadata table where attr_name and attr_type pairs establish the vocabulary: confidence is stored as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This separation of attribute definition from attribute value enables schema evolution without structural migration, as new attribute types can be introduced by registering them in the attr table before any values are populated.

The value storage architecture employs a type-dispatched entity-attribute-value pattern that distributes typed data across specialized tables. Decimal-valued attributes such as confidence resolve to values like 0.167, 0.404, 103.53, and 863.30, each anchored to an entity identifier and an attribute identifier through a composite foreign key. String-valued attributes carry content such as "Dimension Kind 01," "Encoding 02," "calibration record," and "de," while datetime attributes record timestamps ranging from 2023-06-05T19:53:01 through 2025-05-21T21:38:03, establishing a temporal provenance for each annotation. The entity_id column in each value table references the primary key of the annotation entity, and the attr_id column references the corresponding attribute definition, creating a two-hop join path that reconstructs the full attribute-value pair for any given entity.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | DIRE-0005 |
| ASSI-0002 | telemetry_ingestion | DIRE-0006 |
| ASSI-0003 | provenance_trace | DIRE-0005 |
| ASSI-0004 | provenance_trace | DIRE-0006 |
| ASSI-0005 | source_system_sync | DIRE-0004 |
| ASSI-0006 | source_system_sync | DIRE-0004 |

**t_annotation_assigned_by_attr**

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

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

A parallel governance structure governs eBPF programs through a directive framework that mirrors the annotation system's architecture. The t_ebpf_program_governed_by_directive table links directive entities to specific eBPF programs—tracepoint_sched, xdp_fwd, tc_egress—each governed by a set of typed attributes including effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). Boolean attributes encode enforcement posture with values of true and false, date attributes record effective dates such as 2024-06-04, 2024-06-12, 2025-01-20, and 2025-03-23, and integer attributes capture priority levels ranging from 3 to 996. String-valued attributes carry enforcement classifications like "Enforcement 02" and audit excerpts, while additional attributes record encoding schemes such as "Encoding 01" and locale designators like "en."

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

The foreign-key topology across these tables forms a directed acyclic graph in which entities flow from high-level processes down to typed attribute values. The indoor_environmental_monitoring_process table anchors the physical monitoring domain, while the annotation and directive tables anchor the governance domain; both domains share the same attribute-value decomposition pattern, enabling a unified query interface for compliance reporting. An auditor tracing a measurement from the Server Hall Alpha environment would follow the monitors_indoor_environment foreign key to the process entity, then join through the assigned_by relationship to the governing directive, then traverse the attribute definitions and their typed value tables to reconstruct the full provenance chain. This architecture ensures that every data point—whether a CO2 reading, a confidence score, or an enforcement date—carries with it a complete, queryable lineage from the physical space it describes to the policy that mandated its collection.