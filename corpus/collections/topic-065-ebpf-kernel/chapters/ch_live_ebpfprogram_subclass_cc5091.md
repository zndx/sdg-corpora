---
chapter_id: ch_live_ebpfprogram_subclass_cc5091
topic_id: 65
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_subclass', 'pdsa_improvement_model', 'artifact_with_universal']
model: engine-refine
---

Within infrastructure observability frameworks, eBPF programs are organized as reusable subclasses that attach to specific kernel or network hooks. An eBPF program subclass such as `kprobe_tcp_connect` or `tracepoint_sched_switch` is catalogued under a unique identifier—`EBPF-0001` through `EBPF-0004` in the reference data—and each subclass declares the hook it targets, whether that is `cgroup/sock_create`, `xdp/eth0`, `netfilter/ingress`, or `sk_skb/stream_parser`. The attachment relationship itself is materialized in a separate junction table that records not only which program connects to which hook but also the functional role of that connection, such as `reviewer` or `observer`. This separation of concerns allows the same program subclass to attach to multiple hooks and the same hook to serve multiple programs, with the junction table capturing the precise pairing and its governance context.

**t_ebpfprogram_subclass**

| id | ebpfprogram |
| --- | --- |
| EBPF-0001 | kprobe_tcp_connect |
| EBPF-0002 | kprobe_tcp_connect |
| EBPF-0003 | kprobe_tcp_connect |
| EBPF-0004 | tracepoint_sched_switch |
| EBPF-0005 | sockops_monitor |
| EBPF-0006 | cgroup_sock_bind |

**t_ebpfprogram_subclass_attaches_to_hook**

| id | attaches_to_hook |
| --- | --- |
| EBPF-0001 | cgroup/sock_create |
| EBPF-0002 | xdp/eth0 |
| EBPF-0003 | netfilter/ingress |
| EBPF-0004 | sk_skb/stream_parser |
| EBPF-0005 | tracepoint/sched/sched_switch |
| EBPF-0006 | cgroup/sock_create |

In clinical quality improvement, the PDSA (Plan-Do-Study-Act) improvement model serves as the central organizing construct. Each model is identified by a code such as `MODE-0001` through `MODE-0004` and carries a descriptive label—`Opioid-Taper-Init`, `Insulin-Protocol-Opt`, `Sepsis-Protocol-V2`, `Bedside-Handoff-Rev`—that signals its clinical domain. A PDSA model is designed to improve specific clinical care standards, which in the reference data include `Wound-Care-Standard` and `Hand-Hygiene-Protocol`. The relationship between a model and the care standard it targets is not a simple one-to-one mapping; rather, a junction table records each pairing along with a role designation (`reviewer`, `contributor`, or `owner`) that clarifies accountability for that particular linkage. This design supports the reality that a single improvement model may target multiple care standards, and conversely, a care standard may be addressed by several distinct models.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

Beyond improving care standards, PDSA models are explicitly tied to measurable patient outcomes. The reference data documents outcomes such as `Pain-Management-Score`, `Complication-Rate`, `Adverse-Event-Frequency`, and `Functional-Recovery-Time` as the targets of optimization efforts. A dedicated junction table connects PDSA models to these outcomes, again capturing a role (`reviewer`, `owner`, `contributor`) and a cardinality note—`Cardinality Note 01` through `Cardinality Note 04`—that documents the nature of the relationship, such as whether the link is one-to-one, one-to-many, or constrained by regulatory or operational requirements. The cardinality notes serve as a governance mechanism, ensuring that the scope and multiplicity of each model-to-outcome linkage are explicitly recorded and auditable.

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |

Across both infrastructure and clinical domains, the junction tables follow a consistent structural pattern: a surrogate identifier, a subject column referencing the originating entity (the eBPF program subclass or the PDSA model), a target column referencing the dependent entity (the hook, the care standard, or the outcome), and a role column that encodes the governance relationship. This pattern extends to artifact management, where universal artifacts such as `Audit_Reporter`, `Feature_Vector_Store`, `Schema_Definition`, and `Container_Image_Release` are linked to related resources like `GPU_Compute_Pool`, `Metadata_Registry`, and `Compliance_Audit_Log`. Each artifact record carries a creation timestamp—`2024-12-09`, `2024-11-04`, `2024-10-11`, `2024-10-15`—and a deployment location, such as `us-east-1` or `on-prem-dc1`, providing the temporal and geographic context necessary for compliance auditing and incident response.

**t_ebpfprogram_subclass__attaches_to_hook**

| id | ebpfprogram_id | attaches_to_hook_id | role |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0005 | EBPF-0003 | reviewer |
| EBPF-0002 | EBPF-0006 | EBPF-0006 | reviewer |
| EBPF-0003 | EBPF-0001 | EBPF-0001 | reviewer |
| EBPF-0004 | EBPF-0003 | EBPF-0002 | observer |
| EBPF-0005 | EBPF-0005 | EBPF-0004 | contributor |
| EBPF-0006 | EBPF-0002 | EBPF-0005 | observer |
| EBPF-0007 | EBPF-0005 | EBPF-0003 | owner |
| EBPF-0008 | EBPF-0001 | EBPF-0005 | contributor |

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

The deliberate separation of entity definitions from their relationships enables flexible, auditable governance. In the eBPF domain, a program subclass can be evaluated for attachment to a hook by a `reviewer` without altering the underlying program definition. In the clinical domain, a PDSA model can be reassigned from `contributor` to `owner` status on a particular outcome linkage without modifying the model itself. The cardinality notes embedded in the optimization junction table further ensure that the structural constraints of these relationships—how many outcomes a model can target, whether a care standard can be improved by multiple models—are documented at the point of linkage rather than buried in schema-level constraints. This approach supports dynamic reconfiguration of relationships while maintaining a complete audit trail of who established each connection, in what capacity, and under what cardinality assumptions.