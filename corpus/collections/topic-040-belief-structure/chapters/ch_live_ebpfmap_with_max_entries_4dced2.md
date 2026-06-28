---
chapter_id: ch_live_ebpfmap_with_max_entries_4dced2
topic_id: 40
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_max_entries', 'claim_not_disconfirmed', 'syscall_basic']
model: engine-refine
---

Within any structured data model, the identifier serves as the immutable anchor for every entity, a stable key that survives the transience of attribute values and the volatility of relationships. In the eBPF map registry, entries such as ENTR-0001 through ENTR-0004 uniquely distinguish map types—devmap, cgroup_storage, queue, and stack_trace—while in the claims ledger, identifiers DISC-0001 through DISC-0004 tag assertions like "redundancy failover successful" and "secondary sensor aligned," and in the syscall inventory, SYSC-0001 through SYSC-0004 enumerate operations including execve, mmap, and stat. The identifier is not merely a row handle; it is the referent that permits cross-table joins, the linchpin that transforms isolated facts into a coherent graph. Without such keys, the attribute-value pairs that follow would float unmoored, and the subject-target relationships that bind entities together would lack directionality.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

The attribute and its type together constitute the schema's vocabulary: attr_name declares what property is being measured or described, while attr_type constrains the domain of permissible values. In the claims dataset, the attribute definition table records confidence as an xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This separation of declaration from instantiation is deliberate. The attribute table states that confidence is numeric and recorded_at is temporal; the value tables then populate those declarations with concrete instances. The decimal value table holds 0.145 and 669.01 against attribute DISC-0001 and DISC-0005 respectively; the varchar table assigns "Dimension Kind 01" and "Encoding 02" to attributes DISC-0002 and DISC-0008; the datetime table timestamps entries with 2023-08-09T14:45:08 and 2024-07-11T23:49:48. Each value table is typed by construction—the column name signals the type, and the attr_id foreign key points back to the attribute definition, ensuring that every misc value is semantically grounded in its declared attr_type.

The entity is the thing to which attributes attach. In the claims model, the entity is the claim itself, identified by DISC-0001, DISC-0002, and so on, and the entity_id column in each value table is the foreign key that binds a misc value to its subject. A single entity may carry multiple attributes: DISC-0001, for instance, has a confidence value of 0.145, a dimension_kind of "Dimension Kind 01," and a recorded_at timestamp of 2023-08-09T14:45:08, each stored in a separate row of its respective value table but unified under the same entity_id. This entity-attribute-value pattern, sometimes called EAV, is a normalization strategy that avoids schema rigidity; new attributes can be introduced by adding rows to the attribute definition table without altering any value table. The trade-off is query complexity, but the gain is flexibility in domains where properties vary widely across entities.

Relationships between entities are expressed through subject-target pairs, each annotated with a role that specifies the nature of the connection. The junction table t_ebpfmap_with_max_entries__max_entries maps ebpfmap_id as the subject to max_entries_id as the target, with role declaring whether the relationship is one of reviewer, owner, or observer. ENTR-0004 (the stack_trace map) appears as the subject linked to ENTR-0002 (a max_entries value of 262144) in the role of reviewer, while ENTR-0001 (devmap) is the subject linked to ENTR-0001 (max_entries 1048576) as owner. The subject is the entity initiating or bearing the relationship; the target is the entity receiving it. Roles add semantic precision: the same pair of entities could participate in multiple relationships with different roles, and a single entity could be subject in one relationship and target in another. This triad—subject, target, role—generalizes the binary foreign key into a typed, directed edge suitable for graph traversal and access control.

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

The misc column is the catch-all for attribute values that do not fit into the structured x and y columns of their parent tables. In t_syscall_basic, the code column carries misc values such as D-33, B-12, and E-21, which are opaque identifiers rather than human-readable descriptions. In the value tables, misc holds the actual data—decimal numbers, strings, and timestamps—that the attr_type declaration promises. The label_text column in t_syscall_basic provides a parallel layer of human-readable annotation: "pre-release note," "nightly summary," and "calibration record" accompany the syscall names and codes, offering a display-level label that is distinct from both the machine-readable code and the syscall name itself. This separation of machine identifiers from human labels is a recurring pattern: identifiers and codes are stable and machine-parsable; label_text is mutable and human-facing; misc values are the actual data payloads.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |

In practice, these concepts form a layered architecture. Identifiers anchor entities; entities carry attributes; attributes are typed; values populate the attribute-value pairs; relationships connect entities through subject-target-role triples; and misc and label_text provide the semantic glue between machine-readable keys and human-readable descriptions. The eBPF map registry demonstrates how entities (map types) relate to numeric constraints (max_entries) through typed relationships; the claims ledger shows how assertions carry multi-typed attributes stored across partitioned value tables; the syscall inventory illustrates how operations are tagged with codes and labels. Together, they form a coherent model where every fact is traceable to an identifier, every value is grounded in an attribute type, and every relationship is explicit in its subject, target, and role.