---
chapter_id: ch_live_process_produces_ice_3383ce
topic_id: 36
family: 01_foundation
cited_terms: ['process_produces_ice', 'breaking_change_subclass', 'control_equiv_implements_with_owner']
model: engine-refine
---

The foundational layer of the provenance model distinguishes between the processes that generate artifacts and the metadata that describes them. Process definitions such as `ICE-0001` through `ICE-0004` anchor concrete operational activities—Plate freezing, Cryogenic freezing, Spray cooling, and Direct expansion freezing—each assigned a stable identifier that serves as the primary key for downstream references. These identifiers propagate into the attribute schema, where properties like `duration_seconds`, `end_time`, `exit_code`, and `host_name` are declared with their corresponding XML Schema types: `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. The type annotation is not merely documentation; it governs which value store receives the data, ensuring that temporal measurements, numeric durations, and textual labels are persisted in type-safe containers.

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

Value persistence is partitioned by schema type into four dedicated stores, each keyed by a composite of entity identifier, attribute identifier, and a surrogate row identifier. A process instance with entity ID `ICE-0001` may carry a duration of `5646.64` seconds in the decimal store, a termination timestamp of `2024-12-21T05:38:52` in the datetime store, an integer exit code of `140` in the integer store, and a host label of `ingest-21` in the varchar store. The same entity can simultaneously reference multiple attributes—`ICE-0002`, `ICE-0008`, `ICE-0009`, `ICE-0010`—each resolved through the attribute definition table to its declared type and semantic name. This separation of concerns means that a query for all decimal-valued attributes across a set of process instances touches only the decimal value table, while temporal queries remain isolated in the datetime store, reducing join complexity and enabling type-specific indexing strategies.

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

The breaking-change subsystem mirrors this architecture, applying the same entity–attribute–value triad to track schema evolution events. Records such as `CHAN-0001` through `CHAN-0004` describe modifications like Telemetry schema evolution, Provenance graph migration, and OAuth2 token rotation, each associated with attributes including `confidence`, `dimension_kind`, `method`, and `recorded_at`. The attribute types again dictate value placement: confidence scores like `0.203` and `0.645` reside in the decimal store, dimension descriptors such as `Dimension Kind 01` and `Encoding 02` in the varchar store, and timestamps like `2023-07-26T14:07:49` in the datetime store. The structural symmetry between the process and breaking-change domains means that the same query patterns, indexing strategies, and access controls apply uniformly across both, simplifying the operational model.

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

Governance enforcement bridges the two domains through the control implementation table, which maps regulatory and policy controls to the process identifiers they govern. A control such as SOC2 Type II is linked to process `ICE-0004` with an enforcement level of `blocking` and a language designation of `ja`, while the Data Retention Policy targets `ICE-0006` under `mandatory` enforcement in the same language. The PII Masking Rule and NIST AC-2 follow the same pattern, each carrying an enforcement classification—either `blocking` or `mandatory`—and a language code, `ja` or `en`. These enforcement levels determine whether a process execution is permitted to proceed or must be halted, and the language field governs the locale of associated notifications and audit records. The breaking-change records themselves reference these control entities through the `breaking_change_for` column, which points to owner identifiers like `OWNE-0001` through `OWNE-0006`, creating a chain from policy control through implementation process to the specific schema modifications that triggered the change.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | OWNE-0002 |
| CHAN-0002 | Telemetry schema evolution | OWNE-0001 |
| CHAN-0003 | Provenance graph migration | OWNE-0003 |
| CHAN-0004 | OAuth2 token rotation | OWNE-0006 |
| CHAN-0005 | Schema field removal | OWNE-0002 |
| CHAN-0006 | Sensor sampling rate drop | OWNE-0005 |
| CHAN-0007 | Provenance graph migration | OWNE-0005 |
| CHAN-0008 | TLS 1.3 enforcement | OWNE-0005 |

**t_control_equiv_implements_with_owner**

| id | control | implements | enforcement | language |
| --- | --- | --- | --- | --- |
| OWNE-0001 | SOC2 Type II | ICE-0004 | blocking | ja |
| OWNE-0002 | Data Retention Policy | ICE-0006 | mandatory | ja |
| OWNE-0003 | PII Masking Rule | ICE-0006 | blocking | en |
| OWNE-0004 | NIST AC-2 | ICE-0002 | mandatory | ja |
| OWNE-0005 | Encryption Standard | ICE-0006 | blocking | ja |
| OWNE-0006 | SOC2 Type II | ICE-0001 | mandatory | de |