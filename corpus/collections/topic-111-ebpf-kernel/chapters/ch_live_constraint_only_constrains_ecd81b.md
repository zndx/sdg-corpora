---
chapter_id: ch_live_constraint_only_constrains_ecd81b
topic_id: 111
family: 01_foundation
cited_terms: ['constraint_only_constrains', 'existential_with_has_part', 'ebpfprogram_basic']
model: engine-refine
---

Constraint governance in distributed systems is modelled through a bipartite mapping between named policies and the subsystems they regulate. The constraint catalogue enumerates rules such as `log_level_filter`, `checksum_algorithm`, and `data_retention_policy`, each of which constrains a specific target component: the query engine, the network interface, or telemetry streams. A single policy may apply to multiple targets simultaneously, as the `data_retention_policy` constrains both `telemetry_streams` entries independently, while distinct policies like `log_level_filter` and `checksum_algorithm` each govern a single component—`query_engine` and `network_interface`, respectively. This one-to-many and many-to-many structure ensures that every constraint can be traced to its operational scope without ambiguity.

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

Each constraint carries a set of typed attributes that refine its behaviour. The attribute registry defines four property names—`effective_date`, `enforcement`, `mandatory`, and `priority`—each bound to an XML Schema datatype: `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`. Values for these attributes are materialised in separate value tables keyed by the constraint identifier and the attribute identifier, forming a vertical normalisation that avoids null columns across heterogeneous types. Boolean attributes resolve to `true` or `false` across all four constraint instances for the `mandatory` property; date attributes carry concrete calendar values such as `2023-09-12`, `2025-06-06`, `2023-06-09`, and `2024-12-03`; integer attributes encode numeric priorities like `4`, `996`, `1`, and `40`; and string attributes hold free-form descriptors including `Encoding 01`, `Enforcement 02`, `intake form`, and `ja`. This separation of concerns by type permits type-safe validation at query time while keeping the attribute schema extensible.

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

System composition is captured through an existential part-whole relation that decomposes complex subsystems into their constituent elements. A `BatchIngestionPipeline` is composed of a `FirewallRule`; a `GlobalMetadataCatalog` contains a `StorageVolume`; an `AuditLogArchive` includes a `WorkerProcess`; and a `CoreControlSubsystem` incorporates a `TemperatureProbe`. These mappings are identified by a unique part identifier and express a directed dependency: the existence of the composite entity presupposes the presence of its parts. This decomposition supports impact analysis, where a change to a leaf component such as a `TemperatureProbe` can be traced upward to the `CoreControlSubsystem` and, through the constraint graph, to any policy that governs it.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

eBPF programs are tracked in a star-schema arrangement comprising a fact table and a dimension table. The fact table records each program instance by its key, its binary size in bytes, and its version number. Program sizes span a wide range—from `113,209,263` bytes for one instance to `784,335,640` bytes for another—reflecting the variability of kernel-space instrumentation payloads. Versions are integer identifiers such as `9`, `11`, and `12`, enabling version-aware policy enforcement and rollback procedures. The dimension table supplies human-readable labels (`Ebpfprogram Label 01` through `Ebpfprogram Label 04`) and categorical groupings (`Ebpfprogram Category 01` through `Ebpfprogram Category 04`) that are independent of the fact table's numeric identifiers, allowing program metadata to evolve without altering the underlying fact records.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |