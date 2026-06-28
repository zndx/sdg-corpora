---
chapter_id: ch_live_syscall_governed_by_directive_fecd26
topic_id: 61
family: 07_long_tail
cited_terms: ['syscall_governed_by_directive', 'syscall_only_in_kernel_subsystem', 'subclass_disjoint_from_artifact']
model: engine-refine
---

In governance architectures that regulate system-call behavior through directive-based policy, the foundational data model rests upon a disciplined separation of identifier, attribute, attribute type, entity, and issued date. Each directive receives a stable identifier—DIRE-0001 through DIRE-0004 in the syscall governance registry—serving as the immutable anchor across all attribute-value associations. The attribute itself, catalogued under names such as effective_date, enforcement, mandatory, and priority, carries a declared type that constrains the shape of permissible values: xsd:date for temporal constraints, xsd:string for free-form annotations, xsd:boolean for binary mandates, and xsd:integer for numeric thresholds. This type discipline is not decorative; it enforces schema-level invariants that prevent semantic drift when attribute values are stored in dedicated value tables, each partitioned by type to guarantee that a date column never absorbs a boolean and vice versa.

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | connect |
| DIRE-0002 | clone |
| DIRE-0003 | ioctl |
| DIRE-0004 | poll |
| DIRE-0005 | munmap |
| DIRE-0006 | fork |

**t_syscall_governed_by_directive_attr**

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

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_syscall_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2023-07-14 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-29 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2024-05-27 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-04-25 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-30 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-07-29 |

**t_syscall_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 4 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 80 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 4 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 443 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 564 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 613 |

**t_syscall_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | fr |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

The entity column functions as the foreign-key bridge between a directive's metadata and its concrete value assignments. Within the boolean value store, for instance, entity_id references such as DIRE-0001 and DIRE-0002 tie specific attribute instances to their governing directive, while attr_id points back to the attribute definition—DIRE-0003, which corresponds to the mandatory attribute, receives values of true, false, true, and true across four distinct entity bindings. Similarly, the date value table anchors entity_id references like DIRE-0001 through DIRE-0004 to attr_id DIRE-0001 (effective_date), producing issued dates of 2023-07-14, 2025-03-29, 2024-05-27, and 2024-04-25. These temporal markers are not mere timestamps; they encode the lifecycle of policy applicability, allowing auditors to reconstruct when a directive's effective_date was set and whether subsequent amendments altered the enforcement window.

Integer-valued attributes follow the same relational pattern but serve a different operational purpose. The integer value table binds entity_id DIRE-0001 to attr_id DIRE-0004 with value 4 and to attr_id DIRE-0005 with value 80, while entity_id DIRE-0002 maps to the same attribute pair with values 4 and 443. The numeric values—4, 80, 443—suggest port numbers, retry counts, or threshold parameters, and their storage in a dedicated integer partition ensures that arithmetic comparisons remain type-safe during policy evaluation. The varchar value table, meanwhile, accommodates unstructured annotations: Encoding 01, Enforcement 02, audit excerpt, and fr appear as free-text values attached to attributes DIRE-0007, DIRE-0002, DIRE-0008, and DIRE-0009 respectively, all anchored to entity_id DIRE-0001. These misc values provide the flexibility needed for human-readable policy notes, locale codes, and encoding specifications that resist rigid typing.

Beyond directive-level attributes, the governance model extends into subsystem classification, where the issued_date column assumes a parallel but distinct role. The kernel subsystem registry assigns identifiers SUBS-0001 through SUBS-0004 to syscall-to-subsystem mappings—epoll_wait to namespaces, clone to inotify, openat to fsnotify, write to vDSO—each accompanied by a code (C-07, B-12, E-21) and an issued_date (2024-01-17, 2023-04-09, 2024-01-29, 2024-04-20). Here, issued_date marks the promulgation of a subsystem classification rule rather than a directive's effective date, and the distinction matters: one governs when a policy takes effect, the other when a classification was formally issued. The code column, containing values like E-21 and B-12, introduces a secondary classification layer that may reference external standards or internal severity taxonomies.

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | epoll_wait | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | clone | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | openat | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | write | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | munmap | inotify | C-07 | 2025-01-29 |

Finally, the disjointness registry introduces a constraint mechanism that operates at the artifact taxonomy level rather than the directive level. Identifiers ARTI-0001 through ARTI-0004 each declare a disjoint relationship—lab-assay-protocol, sensor-telemetry-stream, telemetry-metadata-index—ensuring that certain artifact subclasses cannot coexist within the same entity. This disjoint-from-artifact constraint complements the attribute-value model by enforcing mutual exclusivity at the classification boundary, preventing semantic collisions between artifact categories that might otherwise share attribute names but carry incompatible semantics. Together, the identifier-driven directive model, the type-partitioned attribute store, the issued_date lifecycle markers, and the disjointness constraints form a cohesive governance fabric where every value is traceable to its source, its type, and its temporal context.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |