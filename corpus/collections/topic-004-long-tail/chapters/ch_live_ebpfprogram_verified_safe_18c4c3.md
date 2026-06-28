---
chapter_id: ch_live_ebpfprogram_verified_safe_18c4c3
topic_id: 4
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_verified_safe', 'mass_function_with_normalization', 'ebpfprogram_min_one_hook']
model: engine-refine
---

Kernel observability and metrology programs enter compliance registries as governed artifacts whose lineage must be recoverable under audit. Each artifact carries a stable identifier—SAFE-0001 through SAFE-0004 for verified eBPF programs, NORM-0001 through NORM-0004 for mass-normalization records, HOOK-0001 through HOOK-0004 for hook-deployment facts—that functions not as display text but as the durable join key across verification chains, dimensional facts, and attachment topology. Identifier discipline matters because governance decisions propagate by reference: when tc_police_ingress (SAFE-0004) is re-certified, every downstream fact that cites HOOK-0004 or the program’s verification edge must resolve to the same primary key or the audit trail fractures.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

Subject–target semantics formalize directed relationships whose meaning is incomplete without an explicit role. In the verification lattice, ebpfprogram_id acts as subject and verified_safe_by_id as target, so that SAFE-0004→SAFE-0002 records Kani_bpf as contributor while SAFE-0002→SAFE-0003 assigns Kani_bpf owner over sock_ops_connect; the role qualifier (contributor, reviewer, owner) is what converts a bare foreign-key pair into an accountable assignment rather than an anonymous association. The same pattern governs metrological entities: entity_id binds each normalization record to its subject mass—Rotor-Assembly-M, Batch-7721, Core-Segment-12, Dust-Collection-1—while attr_id points at the attribute definition that types the assertion, preserving separation between the thing measured and the predicate applied to it.

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

Attributes and attribute types establish the contract under which miscellaneous values may be admitted into evidence. Declaring confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime prevents category error at ingestion: 0.715 and 0.608 land in decimal stores, Dimension Kind 01 and Encoding 02 in varchar stores, and timestamps such as 2024-12-04T17:58:43 in datetime stores, each misc value validated against its attr_type before it can support a compliance claim. Without that typing layer, a normalization constant like 0.982-scaling could not be distinguished from a nominal label or a temporal anchor, and cross-domain queries would conflate quantities with encodings.

Hook attachment and category classification situate executable artifacts inside the kernel’s interception graph. The attaches_to_hook reference—HOOK-0006 for the largest deployments at 784335640 and 641704069 bytes, HOOK-0001 and HOOK-0002 for smaller programs at 113209263 and 161013093 bytes—records where a program is permitted to bind, while the category dimension (Attaches To Hook Category 01 through 04) groups attachment points for policy templates, capacity planning, and scope review. Size_bytes and version (12, 9, 11, 12 across the sampled facts) supply the operational metrics auditors expect alongside placement: footprint thresholds, loader compatibility, and change control all depend on knowing not only that perf_event_trace attaches at a classified hook, but at which revision and under what byte budget.

In practice, these constructs interlock so that a single compliance narrative can be reconstructed from normalized parts. An eBPF program identifier links to verification subjects and targets annotated by role, to hook facts carrying version and size_bytes, and—by parallel registry design—to entity-scoped attributes whose typed misc values timestamp and qualify mass functions tied to normalization constants such as Offset-0.02 or 0.982-scaling. Reviewers therefore work from identifiers outward: confirm attr_type conformance, validate subject–target–role edges, verify attaches_to_hook and category alignment, and only then treat version and size_bytes as release gates. That compositional discipline is what allows heterogeneous evidence—formal methods (Z3_solver), toolchain attestation (libbpf), and dimensional metrology—to coexist in one framework without collapsing distinct categories of claim into undifferentiated text.

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |