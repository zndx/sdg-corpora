---
chapter_id: ch_live_perf_buffer_map_subclass_bfc1d2
topic_id: 65
family: 07_long_tail
cited_terms: ['perf_buffer_map_subclass', 'syscall_only_in_kernel_subsystem', 'constraint_with_predicate']
model: engine-refine
---

Performance buffer mappings are identified by unique identifiers such as MAP-0001 through MAP-0004, each representing a distinct configuration binding a specific performance workload—cassandra-perf, netperf-tcp, iperf3-stream, or tpch-10gb—to a constraint predicate like PRED-0004 or PRED-0007. These identifiers serve as the primary key across the mapping hierarchy, anchoring every attribute assignment and value record to a single, traceable entity. The entity itself is the concrete instantiation of a mapping configuration, referenced by entity_id in value tables, and may carry multiple attribute-value pairs that describe its properties. For instance, entity MAP-0001 is associated with integer values 60 and 11 under attributes MAP-0006 and MAP-0008, while simultaneously holding string-valued attributes including the identifier a3f9c21e, the resource reference gid://svc/77, the license CC-BY-4.0, and the regional endpoint ap-south-2.

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | PRED-0004 |
| MAP-0002 | netperf-tcp | PRED-0007 |
| MAP-0003 | iperf3-stream | PRED-0006 |
| MAP-0004 | tpch-10gb | PRED-0001 |
| MAP-0005 | spec-jbb2015 | PRED-0007 |
| MAP-0006 | pgbench-default | PRED-0007 |
| MAP-0007 | spark-stress | PRED-0006 |

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

Attributes are declared in a schema registry where each attr_name—such as checksum, created_date, identifier, or license—is paired with an attr_type that constrains its permissible values to a formal datatype namespace. The type system distinguishes between xsd:string for free-form text, xsd:date for temporal values, and cco:DesignativeICE for designative identifiers, ensuring that every value inserted into the misc column of a value table conforms to its declared type. Date-valued attributes store issueddate entries such as 2023-01-21, 2023-09-17, 2023-07-22, and 2024-09-18, while integer-valued attributes hold numeric misc values like 123 or 12. This typed attribute model decouples the definition of what properties exist from the storage of their actual values, enabling schema evolution without restructuring the value tables themselves.

Constraints with predicates introduce a second layer of governance, where a constraint such as Log retention mandate, Quality assurance protocol, Authentication requirement, or Max latency threshold is decomposed into one or more predicates—authRequirement, unitSpecification, checksumValidation—that express the specific conditions to be satisfied. The relationship between constraint and predicate is mediated by a role, which classifies the predicate's function within the constraint as owner, observer, or contributor. In the observed data, the constraint PRED-0003 (Authentication requirement) is linked to predicate PRED-0001 with the role owner, while PRED-0004 (Max latency threshold) connects to predicate PRED-0001 as contributor. The subject column identifies the constraint side of the relationship, and the target column identifies the predicate side, forming a directed edge that captures both the semantic linkage and the functional role of the predicate within its parent constraint.

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

Syscall subsystem mappings operate under a parallel identification scheme, using identifiers such as SUBS-0001 through SUBS-0004 to record which system calls—read, write, openat, execve—are confined to particular kernel subsystems including namespaces, inotify, fsnotify, and vDSO. Each mapping carries a code (C-07, B-12, E-21) and an issued_date (2024-01-17, 2023-04-09, 2024-01-29, 2024-04-20) that documents when the restriction was formally established. These issueddate values provide an audit trail for policy changes, allowing operators to reconstruct the state of syscall confinement at any point in time. The misc column in this context holds the classification code, while the constraint predicate tables reference similar issueddate semantics through their own temporal records, ensuring that all governance artifacts carry a verifiable timestamp of origin.

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | read | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | write | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | openat | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | execve | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | read | inotify | C-07 | 2025-01-29 |