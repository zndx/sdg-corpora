---
chapter_id: ch_live_syscall_max_one_return_b0a9c3
topic_id: 106
family: 04_ebpf_kernel
cited_terms: ['syscall_max_one_return', 'ebpfmap_with_key_type', 'lineage_edge_via_transformation']
model: engine-refine
---

The architecture of a governed data fabric rests upon a disciplined vocabulary of metadata primitives, each serving a distinct ontological function within the broader schema. At the foundation lies the identifier, a stable, globally scoped key that anchors every entity across the system—RETU-0001, TYPE-0001, TRAN-0001—ensuring that references remain unambiguous regardless of the table or context in which they appear. This identifier is not merely a surrogate; it is the linchpin of referential integrity, enabling foreign-key relationships to traverse table boundaries with deterministic precision. Where the identifier provides identity, the type attribute supplies classification, distinguishing between structural categories such as the key type keys that populate the eBPF map fact table (TYPE-0005, TYPE-0006, TYPE-0002) and the return types that characterize syscall outcomes (process_id, error_code, pointer_addr, memory_size). The type dimension is further refined through a categorical hierarchy: the key type category column partitions types into ordered groups (Key Type Category 01 through Key Type Category 04), while the misc column—bearing labels such as Key Type Label 01—offers a human-readable alias that bridges machine semantics and operator comprehension.

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

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

The relationship between entities is mediated through a junction construct that couples a subject to a target under an explicitly declared role. In the syscall-to-return-type mapping, the subject column references a syscall identifier (RETU-0005, RETU-0001, RETU-0004, RETU-0008), the target column references a return type identifier (RETU-0003, RETU-0007, RETU-0004, RETU-0006), and the role column assigns a functional posture—observer, contributor, owner, or reviewer—to the linkage. This triad (subject, target, role) transforms a simple many-to-many association into a semantically rich graph edge, enabling downstream systems to reason not only about which syscall returns which type, but about the nature of that dependency. An observer role implies passive consumption of data; an owner role asserts authoritative control; a contributor role denotes active modification; and a reviewer role signals a governance checkpoint. The same structural pattern recurs across domains, from syscall return type mappings to lineage transformation edges, establishing a uniform vocabulary for relationship semantics.

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

Quantitative attributes introduce materiality into the schema, grounding abstract relationships in measurable reality. The size_bytes column in the eBPF map fact table records concrete resource footprints—208,979,093 bytes for one map, 354,373,995 for another—enabling capacity planning, cost attribution, and performance modeling. These values are not static; they are versioned. The version column (3, 6, 12, 5) tracks the evolution of each map definition, allowing auditors to reconstruct historical states and trace changes across releases. Versioning, in conjunction with the type and category dimensions, creates a temporal axis along which the schema can be queried for state-at-a-point-in-time, a capability essential for compliance reporting and incident investigation.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

The final layer of the metadata architecture addresses epistemic quality: the confidence and uncertainty attributes that quantify the reliability of lineage edges. In the transformation lineage table, confidence values (0.439, 0.111, 0.554, 0.532) express the degree of assurance that a given transformation—Genomic Variant Catalog, Clinical Trial Registry, Financial Risk Pipeline—correctly connects a source lineage to its downstream artifact. Paired with uncertainty metrics (766.93, 650.52, 878.86, 350.43), these values form a risk profile for each data flow, enabling operators to prioritize validation efforts on the most fragile links. A confidence of 0.111 coupled with an uncertainty of 650.52, as seen in the Patient Cohort Extraction edge, signals a transformation that demands immediate scrutiny, whereas a confidence of 0.554 with uncertainty of 878.86 in the Timezone Normalization edge suggests a different risk calculus—one where high variance is tolerated because the transformation is well-understood. Together, confidence and uncertainty transform lineage from a static diagram into a dynamic risk model, allowing governance frameworks to allocate attention proportionally to the fragility of data dependencies.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |