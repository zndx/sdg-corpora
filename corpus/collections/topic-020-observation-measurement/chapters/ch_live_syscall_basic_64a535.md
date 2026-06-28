---
chapter_id: ch_live_syscall_basic_64a535
topic_id: 20
family: 04_ebpf_kernel
cited_terms: ['syscall_basic', 'syscall_equiv_in_subsystem', 'syscall_governed_by_directive']
model: engine-refine
---

Operational registries rely on a disciplined separation of identity, typing, and value resolution to maintain auditability across distributed compliance frameworks. The identifier column serves as the immutable handle for every directive, subsystem, and syscall record, ensuring that references such as SYSC-0001, DIRE-0001, and SUBS-0001 remain stable across cross-referencing tables. These handles are supplemented by labeltext, which attaches human-readable operational context without altering the underlying schema; entries like pre-release note, nightly summary, and calibration record provide immediate situational awareness while the machine-readable identifier preserves referential integrity. This dual-layer addressing prevents ambiguity when the same syscall, such as clone or execve, appears across multiple governance contexts or subsystem mappings.

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | open | D-33 | pre-release note |
| SYSC-0002 | execve | B-12 | nightly summary |
| SYSC-0003 | clone | E-21 | calibration record |
| SYSC-0004 | epoll_wait | E-21 | pre-release note |
| SYSC-0005 | epoll_wait | B-12 | audit excerpt |
| SYSC-0006 | mmap | C-07 | pre-release note |
| SYSC-0007 | open | C-07 | audit excerpt |
| SYSC-0008 | read | B-12 | calibration record |

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | clone |
| DIRE-0002 | write |
| DIRE-0003 | futex |
| DIRE-0004 | fork |
| DIRE-0005 | socket |
| DIRE-0006 | listen |

Governance metadata is structured through the attr and attr type columns, which enforce schema discipline while permitting heterogeneous value storage. Directives such as DIRE-0001 through DIRE-0004 carry attribute definitions including effective_date, enforcement, mandatory, and priority, each bound to a strict attr type like xsd:date, xsd:string, xsd:boolean, or xsd:integer. Rather than embedding these values directly into the directive record, the framework routes them through a misc column distributed across type-specific value tables. This design isolates type validation from data entry, allowing concrete values such as 2023-07-14, true, false, 4, 80, 443, Encoding 01, or audit excerpt to be attached to the appropriate attribute without schema migration or denormalization.

The entity column functions as the resolution key that binds abstract attribute definitions to instantiated governance rules. By referencing both the directive identifier and the attribute identifier, entity_id anchors each misc value to a precise compliance posture. For instance, the boolean true or the integer 443 is not stored as a generic field but is explicitly tied to entity records like DIRE-0001 or DIRE-0002, ensuring that every value assignment can be traced back to its originating directive and attribute definition. This binding mechanism guarantees that compliance checks operate against a deterministic set of parameters, eliminating drift between the attribute schema and the values actually enforced in production.

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

Cross-system relationships are formalized through the subject, target, and role columns, which structure accountability without embedding permissions directly into primary entities. The junction table mapping subsystems to syscalls uses subject to denote the originating operation and target to denote the receiving subsystem, creating a directional dependency graph. Each link is qualified by role, assigning governance postures such as reviewer, owner, or observer to specific subject-target pairs. This triad ensures that data flow and oversight responsibilities are explicitly declared at the relationship level, allowing the same syscall or subsystem to participate in multiple governance configurations with distinct accountability assignments.

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

Together, these primitives form a resilient compliance architecture where identity, typing, value resolution, and relational mapping operate as coordinated layers. The identifier and labeltext columns maintain unambiguous addressing and operational context; attr and attr type enforce structural discipline; entity resolves abstract definitions to concrete values; and subject, target, and role govern cross-system dependencies. By decoupling these concerns, the framework ensures that directives remain independently versionable, attribute values can evolve without schema disruption, and accountability is explicitly encoded in the relationships themselves. This separation of concerns yields an auditable, extensible system capable of tracking complex governance rules across evolving operational environments.

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