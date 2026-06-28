---
chapter_id: ch_live_ebpf_program_governed_by_directive_8bb960
topic_id: 23
family: 07_long_tail
cited_terms: ['ebpf_program_governed_by_directive', 'audit_targets_data_artifact', 'evidence_observed_by_process']
model: engine-refine
---

Directive governance of eBPF programs is structured through a three-tier attribute-value architecture that separates entity definition from type-specific data storage. The governing directive table assigns programmatic identifiers such as DIRE-0001 through DIRE-0004 to eBPF programs including tracepoint_sched, xdp_fwd, and tc_egress, establishing the authoritative linkage between policy instruments and their technical targets. Attribute definitions for these directives—encompassing effective_date, enforcement, mandatory, and priority—are catalogued with their corresponding XML Schema types: xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type declaration is not merely descriptive; it governs the routing of values into dedicated storage tables, ensuring that boolean attributes such as mandatory resolve to the value_boolean table where entries for DIRE-0001 carry a value of false while DIRE-0002 through DIRE-0004 are all set to true. Date attributes funnel into the value_date table, where effective_date values for the same directive set span from 2024-06-04 through 2025-03-23, reflecting staggered implementation timelines. Integer attributes such as priority are stored in the value_int table, where values like 5 and 280 for entity DIRE-0001 contrast with 3 and 996 for DIRE-0002, suggesting a heterogeneous priority landscape across directives.

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

The audit artifact domain mirrors this normalized pattern with its own entity-attribute-value decomposition. Audit targets including Cloud-Bucket-Encryption, SOC2-Q3-2023, API-Auth-Token-Rotation, and Vendor-Access-Assessment are each assigned unique identifiers ARTI-0001 through ARTI-0004, and their attributes—duration_seconds, end_time, exit_code, and host_name—are typed as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. The value tables enforce type discipline: decimal values for duration_seconds range from 460.93 to 4764.85 across the four artifacts, datetime values for end_time cluster around late 2023 through mid-2025 with entries such as 2024-12-01T01:08:20 and 2025-04-11T08:34:59, and integer values for exit_code include 102, 288, 803, and 1. String-valued attributes capture host_name entries like node-a01 alongside operational states such as execution and running, and metadata values including Log Level 02.

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | Cloud-Bucket-Encryption |
| ARTI-0002 | SOC2-Q3-2023 |
| ARTI-0003 | API-Auth-Token-Rotation |
| ARTI-0004 | Vendor-Access-Assessment |
| ARTI-0005 | Cloud-Bucket-Encryption |
| ARTI-0006 | Model-Pipeline-Validation |

**t_audit_targets_data_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2024-12-01T01:08:20 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2025-04-11T08:34:59 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2024-01-10T01:48:17 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2023-12-13T07:58:05 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2024-04-04T16:02:49 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-03-02T22:50:55 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2025-03-24T22:59:49 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2024-12-31T14:33:38 |

**t_audit_targets_data_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 4704.44 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2823.51 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 460.93 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 4764.85 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 3458.42 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 1214.20 |

**t_audit_targets_data_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 102 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 288 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 803 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 1 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 425 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 187 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 75 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 345 |

**t_audit_targets_data_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | execution |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | running |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | node-a01 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | closeout |

The evidence observation table departs from the strict type-dispatch pattern by embedding both a value column and a language column within a single structure. Evidence records identified as PROC-0001 through PROC-0004 reference observations such as voltage_dip_trace, ph_sensor_record, and vibration_anomaly_log, each associated with a numeric measurement—573.25, 273.64, 199.51, and 512.26—and a language code drawn from the set en, es, de, fr. This design accommodates multilingual provenance directly at the point of observation, avoiding the indirection of a separate language lookup table while preserving the ability to trace which linguistic context produced each recorded value.

Across all three domains, the foreign-key relationships form a consistent navigational topology. In the directive and artifact value tables, the composite primary key pairs entity_id with attr_id, where entity_id references the identifier column of the parent entity table and attr_id references the identifier column of the corresponding attribute table. This dual-key structure permits a single attribute definition—such as the mandatory attribute under DIRE-0003—to be instantiated across multiple entities, each carrying its own boolean value. The attr_id column in the value tables thus serves as a bridge from the type-specific value store back to the attribute catalog, while entity_id anchors the value to its governing entity. The evidence table simplifies this by using a single-column primary key on id, with evidence and value columns functioning as the observational payload and language providing the provenance context.

**t_evidence_observed_by_process**

| id | evidence | value | language |
| --- | --- | --- | --- |
| PROC-0001 | voltage_dip_trace | 573.25 | en |
| PROC-0002 | ph_sensor_record | 273.64 | es |
| PROC-0003 | vibration_anomaly_log | 199.51 | de |
| PROC-0004 | ph_sensor_record | 512.26 | fr |
| PROC-0005 | voltage_dip_trace | 950.53 | es |

The practical implication of this architecture is that compliance queries must traverse multiple joins to reconstruct a complete attribute profile for any given entity. Retrieving the full directive specification for DIRE-0001 requires joining the directive table to its attribute definitions, then separately joining each type-specific value table on the composite entity_id and attr_id key. The resulting dataset reveals that DIRE-0001 governs tracepoint_sched, carries an effective_date of 2024-06-04, has mandatory set to false, and holds priority values of 5 and 280 across two distinct attribute entries. Similarly, the SOC2-Q3-2023 artifact (ARTI-0002) is associated with a duration of 2823.51 seconds, an exit_code of 803, and an end_time of 2024-01-10T01:48:17. This separation of concerns—entity identity, attribute schema, and typed values—enables schema evolution without structural migration, as new attribute types can be accommodated by adding value tables rather than altering existing entity definitions.