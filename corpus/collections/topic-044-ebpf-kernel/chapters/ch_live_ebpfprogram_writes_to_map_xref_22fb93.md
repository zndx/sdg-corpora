---
chapter_id: ch_live_ebpfprogram_writes_to_map_xref_22fb93
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map_xref', 'ebpfmap_exactly_one_type', 'state_transitions_to']
model: engine-refine
---

eBPF programs constitute the foundational execution units within the kernel-space instrumentation fabric, each uniquely identified by an alphanumeric identifier such as XREF-0001 through XREF-0005 and classified into discrete categories including Ebpfprogram Category 01 through Ebpfprogram Category 04. The operational footprint of these programs varies substantially, with compiled binary sizes ranging from 113,209,263 bytes for XREF-0003 to 784,335,640 bytes for XREF-0001, reflecting the heterogeneous complexity of the attached probe logic. Versioning is tracked as an integer field—values of 9, 11, and 12 appear across the observed set—enabling traceability through successive compilations and kernel ABI revisions. A self-referential linkage via the ebpfprogram_key column permits the expression of program lineage or dependency, wherein XREF-0001 and XREF-0003 both reference XREF-0001 and XREF-0003 respectively, establishing a directed graph of program provenance that underpins audit and compliance workflows.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

The eBPF map subsystem introduces a second layer of structural classification, enumerating map types such as cgroup_sock_map, tcp_conn_map, perf_event_array, and dns_query_cache, each bound to a concrete storage backend—queue, devmap, hash, or ringbuf. These associations are mediated through a junction table that records, for each map-type pairing, a subject identifier, a target identifier, and a role drawn from the set {observer, owner, contributor, reviewer}. The role attribute encodes the access semantics governing how a given map instance participates in the broader eBPF program lifecycle: an observer may read map contents without mutation, an owner retains exclusive write authority, a contributor appends or updates entries, and a reviewer inspects state for validation purposes. This tripartite relationship—subject, target, role—provides the granular permission model required for multi-tenant kernel instrumentation environments.

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | cgroup_sock_map |
| TYPE-0002 | tcp_conn_map |
| TYPE-0003 | perf_event_array |
| TYPE-0004 | dns_query_cache |
| TYPE-0005 | tcp_conn_map |
| TYPE-0006 | skb_drop_reason_map |
| TYPE-0007 | skb_drop_reason_map |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | queue |
| TYPE-0002 | devmap |
| TYPE-0003 | hash |
| TYPE-0004 | ringbuf |
| TYPE-0005 | queue |
| TYPE-0006 | cgroup_storage |
| TYPE-0007 | lru_hash |
| TYPE-0008 | cpumap |

**t_ebpfmap_exactly_one_type__map_type**

| id | ebpfmap_id | map_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0007 | observer |
| TYPE-0002 | TYPE-0002 | TYPE-0005 | owner |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | contributor |
| TYPE-0004 | TYPE-0001 | TYPE-0005 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0008 | reviewer |
| TYPE-0006 | TYPE-0006 | TYPE-0005 | contributor |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0005 | TYPE-0005 | contributor |

State transitions form the temporal backbone of the monitoring apparatus, with each transition record capturing a directional linkage from a source state to a destination state identified by the transitions_to_key column. The destination identifiers—TRAN-0003, TRAN-0005, TRAN-0006—anchor the transition graph, while the transition records themselves (TRAN-0001 through TRAN-0004) carry two complementary quantitative measures: confidence and uncertainty. Confidence values span a broad range, from a near-zero 0.012 recorded for TRAN-0002 to a comparatively robust 0.523 for TRAN-0004, indicating the degree of assurance that the transition will execute as specified. Uncertainty, expressed as a floating-point magnitude, ranges from 366.30 to 951.90, providing an orthogonal measure of variance or risk associated with the transition's execution environment. A miscellaneous value field—holding scalar quantities such as 195.86, 143.04, 237.15, and 619.50—supplements these metrics with domain-specific observables, such as latency estimates or resource consumption projections.

**fact_state**

| id | transitions_to_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0003 | 0.422 | 951.90 | 195.86 |
| TRAN-0002 | TRAN-0006 | 0.012 | 416.12 | 143.04 |
| TRAN-0003 | TRAN-0006 | 0.075 | 421.79 | 237.15 |
| TRAN-0004 | TRAN-0005 | 0.523 | 366.30 | 619.50 |

The categorical taxonomy applied to transitions mirrors the classification scheme used for eBPF programs, with category identifiers (TRAN-0004, TRAN-0005) linking transition records to descriptive labels like Transitions To Label 01 through Transitions To Label 04 and broader categories such as Transitions To Category 01 through Transitions To Category 04. This parallel structure ensures that both the static program inventory and the dynamic state-transition graph share a common ontological framework, enabling cross-cutting queries that correlate program size, version, and category with the confidence and uncertainty profiles of their associated state transitions. The misc column, appearing in both the eBPF program and transition dimensions, serves as a catch-all for free-form annotations—Ebpfprogram Label 01, Transitions To Label 01—that capture human-readable descriptors without constraining the schema to rigid enumeration. Together, these tables form a coherent evidence base for governance: every program is sized, versioned, and categorized; every map type is role-bound to its consumers; and every state transition is scored for confidence and uncertainty, providing the quantitative substrate required for automated compliance verification and risk assessment.

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| XREF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| XREF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| XREF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| XREF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| XREF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| XREF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| XREF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| XREF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

**dim_transitions_to_category**

| id | category_name |
| --- | --- |
| TRAN-0001 | Category Name 01 |
| TRAN-0002 | Category Name 02 |
| TRAN-0003 | Category Name 03 |
| TRAN-0004 | Category Name 04 |
| TRAN-0005 | Category Name 05 |
| TRAN-0006 | Category Name 06 |
| TRAN-0007 | Category Name 07 |

**dim_transitions_to**

| id | transitions_to_label | transitions_to_category | category_id |
| --- | --- | --- | --- |
| TRAN-0001 | Transitions To Label 01 | Transitions To Category 01 | TRAN-0004 |
| TRAN-0002 | Transitions To Label 02 | Transitions To Category 02 | TRAN-0005 |
| TRAN-0003 | Transitions To Label 03 | Transitions To Category 03 | TRAN-0004 |
| TRAN-0004 | Transitions To Label 04 | Transitions To Category 04 | TRAN-0005 |
| TRAN-0005 | Transitions To Label 05 | Transitions To Category 05 | TRAN-0001 |
| TRAN-0006 | Transitions To Label 06 | Transitions To Category 06 | TRAN-0004 |