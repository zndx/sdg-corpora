---
chapter_id: ch_live_syscall_max_one_return_014dab
topic_id: 0
family: 04_ebpf_kernel
cited_terms: ['syscall_max_one_return', 'column_tag_at_confidence', 'profiling_only_targets_datasets']
model: engine-refine
---

The identifier serves as the immutable anchor across all data domains, a stable reference that survives schema evolution and cross-table joins. In the syscall registry, identifiers such as RETU-0001 through RETU-0004 uniquely distinguish individual system calls—socket, write, read, and fstat—while the confidence and profiling domains deploy parallel numbering schemes (CONF-0001, DATA-0001) to avoid collision across unrelated entity sets. This partitioning is deliberate: each namespace carries its own semantic universe, and the identifier's sole responsibility is to guarantee uniqueness within that universe, not to encode meaning. The prefix RETU, CONF, and DATA are organizational markers, not semantic descriptors, and the numeric suffix is a sequential handle with no inherent relationship to the entity's properties.

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | DATA-0006 |
| CONF-0002 | audit_log_id | DATA-0002 |
| CONF-0003 | calibration_date | DATA-0003 |
| CONF-0004 | instrument_serial | DATA-0005 |
| CONF-0005 | geospatial_ref | DATA-0001 |
| CONF-0006 | sample_volume_ml | DATA-0002 |

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

An attribute defines a named dimension of observation, and its type constrains the shape of the value that may populate it. The attribute registry pairs names such as confidence, dimension_kind, method, and recorded_at with XML Schema types—xsd:decimal, xsd:string, xsd:dateTime—establishing a contract between the property and its permissible value space. In the profiling domain, attributes like duration_seconds, end_time, exit_code, and host_name follow the same pattern, with types including xsd:integer alongside the decimal and string variants. The type declaration is not a suggestion; it governs validation at write time and determines the storage table (val_decimal, val_varchar, val_datetime, val_int) that will hold the actual value. This separation of attribute definition from value storage enables a single entity to carry heterogeneous properties without requiring a monolithic row schema.

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

The entity is the bearer of attributes, the thing that is observed, measured, or classified. It is referenced by entity_id in the value tables, where each row represents a single attribute assignment: a specific entity receives a specific attribute a specific value. Entity CONF-0001, for instance, carries a confidence value of 0.375, a dimension_kind of "Dimension Kind 01", an encoding label of "Encoding 02", and a recorded_at timestamp of 2024-04-09T22:04:24, each stored in its type-appropriate value table and linked back to the entity through the entity_id foreign key. Entity DATA-0001 aggregates a duration of 30.48 seconds, an exit code of 255, a host name of "gw-12", and a log level of "Log Level 02", demonstrating that entities can accumulate properties across multiple value tables without structural coupling. The entity itself is a thin concept—a set of attribute-value assignments—rather than a materialized object.

The value, stored in the misc column of the typed value tables, is the terminal datum: the actual observation. Decimal values such as 0.375, 699.80, and 906.58 occupy the decimal store; string values like "Dimension Kind 01", "fr", "closeout", and "failed" reside in the varchar store; timestamps including 2024-04-09T22:04:24 and 2025-02-03T06:32:48 are held in the datetime store; and integer values such as 255, 337, 67, and 59 fill the integer store. The misc designation reflects the heterogeneity of the column's content across the value tables—each table is homogeneous in type, but the collective value space spans decimals, strings, datetimes, and integers, unified only by their shared role as the terminal carrier of attribute data.

Subject and target, mediated by role, express the relational layer that sits atop the attribute-value foundation. In the syscall return-type mapping, a subject (syscall_id) is linked to a target (return_type_id) through a role that specifies the nature of the association. The role values—observer, contributor, owner, reviewer—define the semantic relationship between the two entities: a syscall may observe a return type, contribute to it, own it, or review it, and the same pair of identifiers can participate in multiple relationships with different roles. The subject is the active party in the relationship, the entity from which the association originates; the target is the passive party, the entity toward which the association is directed. This subject-target-role triad enables a single entity to play multiple roles across different relationships without requiring denormalization or redundant columns.

**t_syscall_max_one_return**

| id | syscall |
| --- | --- |
| RETU-0001 | socket |
| RETU-0002 | write |
| RETU-0003 | read |
| RETU-0004 | fstat |
| RETU-0005 | execve |
| RETU-0006 | execve |
| RETU-0007 | read |
| RETU-0008 | execve |

**t_syscall_max_one_return_return_type**

| id | return_type |
| --- | --- |
| RETU-0001 | process_id |
| RETU-0002 | error_code |
| RETU-0003 | pointer_addr |
| RETU-0004 | memory_size |
| RETU-0005 | pointer_addr |
| RETU-0006 | stat_struct |
| RETU-0007 | process_id |

**t_syscall_max_one_return__return_type**

| id | syscall_id | return_type_id | role |
| --- | --- | --- | --- |
| RETU-0001 | RETU-0005 | RETU-0003 | observer |
| RETU-0002 | RETU-0001 | RETU-0007 | contributor |
| RETU-0003 | RETU-0004 | RETU-0004 | owner |
| RETU-0004 | RETU-0008 | RETU-0006 | reviewer |
| RETU-0005 | RETU-0006 | RETU-0007 | owner |
| RETU-0006 | RETU-0006 | RETU-0007 | owner |
| RETU-0007 | RETU-0007 | RETU-0002 | contributor |
| RETU-0008 | RETU-0003 | RETU-0005 | reviewer |

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |