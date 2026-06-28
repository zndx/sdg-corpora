---
chapter_id: ch_live_lift_with_baseline_rate_722a0c
topic_id: 5
family: 02_observation_measurement
cited_terms: ['lift_with_baseline_rate', 'syscall_only_in_kernel_subsystem', 'primary_key_designation']
model: engine-refine
---

Within attribute-value registries, the identifier serves as the immutable anchor for every entity, attribute, and value tuple. Identifiers follow a structured naming convention—`RATE-0001` through `RATE-0010` for lift-rate associations, `DESI-0001` through `DESI-0010` for primary-key designations, and `SUBS-0001` through `SUBS-0004` for kernel subsystem mappings—each functioning as a stable reference point across the entity-attribute-value graph. An entity, such as `RATE-0001`, represents a concrete record whose properties are not stored inline but are instead resolved through a network of attribute references and typed value tables. This separation of structure from content enables heterogeneous data types to coexist under a single conceptual model: the same entity `RATE-0001` carries a decimal confidence of `0.799`, a string dimension kind of `Dimension Kind 01`, and a recorded-at timestamp of `2024-01-14T18:32:00`, each resolved through its own value table keyed by the entity-attribute pair.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | DESI-0005 |
| RATE-0002 | Latency Peak Reduction | DESI-0006 |
| RATE-0003 | Click Through Uplift | DESI-0004 |
| RATE-0004 | Model v2 Accuracy Lift | DESI-0003 |
| RATE-0005 | Latency Peak Reduction | DESI-0001 |
| RATE-0006 | Ad Improvement | DESI-0006 |

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | RATE-0005 |
| DESI-0002 | lab_specimens | RATE-0005 |
| DESI-0003 | manufacturing_batches | RATE-0006 |
| DESI-0004 | asset_inventory | RATE-0004 |
| DESI-0005 | network_traffic_db | RATE-0001 |
| DESI-0006 | manufacturing_batches | RATE-0005 |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

The attribute type governs which value table holds the actual data and determines how the value is interpreted at query time. Three distinct value tables—`val_decimal`, `val_varchar`, and `val_datetime`—partition the value space by schema, ensuring type safety without sacrificing the flexibility of an attribute-value architecture. An attribute named `confidence` carries the type `xsd:decimal` and resolves to numeric values such as `0.799` or `0.522`; an attribute named `dimension_kind` carries the type `xsd:string` and resolves to values like `Encoding 02` or `de`; an attribute named `recorded_at` carries the type `xsd:dateTime` and resolves to ISO 8601 timestamps such as `2023-02-02T03:32:58`. The type declaration is itself a first-class attribute property, stored in the metadata table alongside the attribute name, so that any consumer of the registry can determine the correct value table to consult before attempting resolution.

The issued date provides a temporal anchor for designations and subsystem assignments, enabling audit trails and version-aware queries. In the kernel subsystem registry, each syscall-to-subsystem mapping carries an `issued_date`—`2024-01-17` for the `read` syscall assigned to subsystem `RATE-0005`, `2023-04-09` for the `write` syscall assigned to `RATE-0001`, `2024-01-29` for `openat` also assigned to `RATE-0001`, and `2024-04-20` for `execve` assigned to `RATE-0006`—allowing an operator to reconstruct the state of the mapping at any point in time. Similarly, primary-key designations carry their own recorded-at timestamps: `2024-07-25T13:27:19` for the designation of `hardware_sn` as primary key of `RATE-0005`, `2024-03-16T21:31:41` for `lab_specimens` as primary key of `RATE-0005`, `2023-06-18T02:34:37` for `manufacturing_batches` as primary key of `RATE-0006`, and `2023-02-27T13:30:12` for `asset_inventory` as primary key of `RATE-0004`. These timestamps are themselves stored as attribute values of type `xsd:dateTime` in the dedicated value table, creating a recursive temporal layer where the act of recording a designation is itself a datable event.

Cross-table relationships bind the registry into a coherent referential graph. The `lift` column in the lift-rate table contains human-readable labels—`Conversion Gain`, `Latency Peak Reduction`, `Click Through Uplift`, `Model v2 Accuracy Lift`—while the `baseline_rate` column contains foreign-key references to designations such as `DESI-0005`, `DESI-0006`, `DESI-0004`, and `DESI-0003`, each of which in turn designates a primary key (`hardware_sn`, `lab_specimens`, `manufacturing_batches`, `asset_inventory`) for a target rate (`RATE-0005`, `RATE-0005`, `RATE-0006`, `RATE-0004`). The `in_syscall_subsystem` column similarly references rate identifiers, creating a bridge between the kernel subsystem domain and the lift-rate domain. This interlocking structure means that a single identifier like `RATE-0001` appears as a lift-rate record, as an entity carrying multiple typed attributes, as a baseline-rate target, and as a subsystem assignment for syscalls `write` and `openat`—each appearance governed by the same identifier but resolved through a different table and a different semantic context.

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | read | RATE-0005 | C-07 | 2024-01-17 |
| SUBS-0002 | write | RATE-0001 | B-12 | 2023-04-09 |
| SUBS-0003 | openat | RATE-0001 | E-21 | 2024-01-29 |
| SUBS-0004 | execve | RATE-0006 | E-21 | 2024-04-20 |
| SUBS-0005 | read | RATE-0006 | C-07 | 2025-01-29 |