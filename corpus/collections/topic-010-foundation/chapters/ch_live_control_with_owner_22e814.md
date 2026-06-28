---
chapter_id: ch_live_control_with_owner_22e814
topic_id: 10
family: 03_directive_governance
cited_terms: ['control_with_owner', 'ebpfmap_basic', 'syscall_governed_by_directive']
model: engine-refine
---

Governance and operational traceability depend upon a rigorous separation between the objects being regulated and the metadata that describes their compliance posture. Each regulated artifact is assigned a unique identifier that serves as the immutable anchor for all subsequent policy mappings, whether the subject is a vendor risk assessment, a data retention policy, or a system call governed by a specific directive. These identifiers resolve to discrete entities that function as the primary recipients of attribute assignments, ensuring that every compliance requirement can be traced to a concrete operational target. The attr itself constitutes the named dimension of evaluation—such as effective date, enforcement mechanism, mandatory status, or priority level—while the attr type dictates the structural constraints under which the corresponding value must be stored. By decoupling the definition of an attr from its instantiation, the framework permits heterogeneous compliance artifacts to share a uniform evaluation schema without sacrificing domain-specific precision.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | mmap |
| DIRE-0002 | connect |
| DIRE-0003 | epoll_wait |
| DIRE-0004 | listen |
| DIRE-0005 | socket |
| DIRE-0006 | bind |

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

The instantiation of attributes across entities relies on a typed value repository that preserves data integrity through strict schema enforcement. Boolean indicators, for instance, capture binary compliance states such as mandatory enforcement flags, which resolve to definitive true or false determinations for each assigned entity. Temporal attributes are bound to date formats, recording effective implementation windows that span from mid-2023 through mid-2025, thereby establishing clear audit horizons for regulatory review. Numeric attributes accommodate quantitative thresholds, ranging from low-priority indices to substantial port assignments or memory limits, while textual attributes store descriptive metadata such as enforcement directives, change rationales, or locale codes. This typed value architecture ensures that every misc value is validated against its declared attr type before ingestion, preventing type coercion errors and maintaining the analytical integrity required for downstream compliance reporting.

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

Beyond policy metadata, the framework extends this attribute-entity model to low-level system artifacts, particularly ebpfmap structures, which require precise tracking of memory footprint, revision state, and categorical classification. Each ebpfmap is distinguished by a unique identifier and linked to a canonical key that references its operational configuration, while its size bytes quantifies the exact memory allocation required for runtime execution—values routinely exceeding two hundred megabytes for complex tracing structures. The version field records the iterative revision of the map definition, enabling operators to correlate structural changes with kernel compatibility matrices and deployment rollouts. Concurrently, a category dimension groups these maps into functional taxonomies, allowing security teams to filter, audit, and enforce resource limits across entire classes of ebpfmap programs rather than inspecting individual instances in isolation.

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

The convergence of these constructs establishes a unified governance substrate where high-level policy directives and low-level system telemetry share a common relational vocabulary. Identifiers provide the navigational backbone, entities serve as the assignment targets, and attributes supply the evaluative dimensions, all bound together by typed value constraints that guarantee analytical consistency. When a directive governing a specific syscall such as mmap or connect is evaluated, the system cross-references its effective date, enforcement posture, and priority index against the corresponding entity records, producing a deterministic compliance posture. Similarly, ebpfmap revisions are tracked alongside their memory consumption and categorical assignments, ensuring that resource escalation does not outpace policy boundaries. This integrated architecture transforms fragmented operational data into a coherent, queryable compliance fabric, where every attr, type, category, and versioned artifact contributes to a verifiable chain of accountability.

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