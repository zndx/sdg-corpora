---
chapter_id: ch_live_claim_subclass_38f6b7
topic_id: 10
family: 06_belief_structure
cited_terms: ['claim_subclass', 'state_of_system_block', 'ebpfprogram_only_attached_to_kprobe']
model: engine-refine
---

The integrity of any operational tracking system depends upon a coherent identification architecture capable of spanning heterogeneous evidence types. Identifiers serve as the primary keys binding claims, states, and programmatic artifacts into a unified reference frame. Within the claims subsystem, identifiers such as CLAI-0001, CLAI-0002, CLAI-0003, and CLAI-0004 anchor assertions ranging from "Lab centrifuge unit-7" to "QC sample failed" to "Packet loss SLA breach" and "Authentication microservice." State records employ a parallel scheme—BLOC-0001 through BLOC-0004—linking confidence and uncertainty measurements to their corresponding dimensional categories. eBPF program attachments carry their own identifier namespace (KPRO-0001 through KPRO-0004) alongside cross-domain references including ARN:res/41, doi:10.1109/x, and ref-8842, ensuring that kernel-level programmatic evidence can be traced to authoritative sources. The coexistence of these identifier families within a single governance framework demands that each namespace remain distinct yet mutually resolvable, preventing ambiguity when a single operational event generates claims, state updates, and programmatic artifacts simultaneously.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BLOC-0001 | BLOC-0001 | 0.422 | 951.90 | 195.86 |
| BLOC-0002 | BLOC-0004 | 0.012 | 416.12 | 143.04 |
| BLOC-0003 | BLOC-0005 | 0.075 | 421.79 | 237.15 |
| BLOC-0004 | BLOC-0003 | 0.523 | 366.30 | 619.50 |

**dim_state_category**

| id | category_name |
| --- | --- |
| BLOC-0001 | Category Name 01 |
| BLOC-0002 | Category Name 02 |
| BLOC-0003 | Category Name 03 |
| BLOC-0004 | Category Name 04 |
| BLOC-0005 | Category Name 05 |
| BLOC-0006 | Category Name 06 |

The method by which a claim is derived—whether automated, hybrid, or inferred—establishes the evidentiary chain of custody and directly informs downstream confidence assessments. An automated claim carries the highest procedural assurance, having been generated through deterministic system instrumentation without human intervention. Hybrid methods, as observed in claims such as "QC sample failed" and "Packet loss SLA breach," indicate that both machine-generated signals and human review contributed to the final assertion. Inferred claims, exemplified by "Authentication microservice," represent conclusions drawn from indirect evidence or statistical correlation rather than direct observation. Each methodological classification is accompanied by a labeltext that documents the provenance of the supporting material: audit excerpts, intake forms, pre-release notes, and calibration records. These labeltexts function as the documentary substrate against which methodological claims can be independently verified, creating a two-layer audit trail wherein both the derivation process and the source material are simultaneously accessible.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | Packet loss SLA breach | automated | audit excerpt |
| CLAI-0002 | QC sample failed | Kafka cluster node-3 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | IoT temperature sensor-42 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | API gateway prod | inferred | calibration record |

State management introduces a quantitative dimension to operational tracking through paired confidence and uncertainty metrics that together characterize the reliability of any given observation. Confidence values—ranging from 0.012 for BLOC-0002 to 0.523 for BLOC-0003—represent the system's degree of belief in the accuracy of a state assertion, while uncertainty values—spanning from 366.30 for BLOC-0003 to 951.90 for BLOC-0001—quantify the associated margin of error. The inverse relationship between these measures is not absolute; BLOC-0001 exhibits a moderate confidence of 0.422 alongside the highest uncertainty of 951.90, suggesting that confidence and uncertainty capture orthogonal aspects of evidentiary quality. The misc column provides supplementary numeric context, with values such as 195.86, 143.04, 237.15, and 619.50 that may represent derived statistics, measurement residuals, or auxiliary indicators. State categories—designated as Category Name 01 through Category Name 04—organize these quantitative assessments into semantic groupings, while state labels (State Label 01 through State Label 04) and state categories (State Category 01 through State Category 04) provide human-readable classification layers that bridge the gap between machine-readable metrics and operational decision-making.

**dim_state**

| id | state_label | state_category | category_id |
| --- | --- | --- | --- |
| BLOC-0001 | State Label 01 | State Category 01 | BLOC-0001 |
| BLOC-0002 | State Label 02 | State Category 02 | BLOC-0003 |
| BLOC-0003 | State Label 03 | State Category 03 | BLOC-0004 |
| BLOC-0004 | State Label 04 | State Category 04 | BLOC-0003 |
| BLOC-0005 | State Label 05 | State Category 05 | BLOC-0006 |
| BLOC-0006 | State Label 06 | State Category 06 | BLOC-0006 |
| BLOC-0007 | State Label 07 | State Category 07 | BLOC-0002 |
| BLOC-0008 | State Label 08 | State Category 08 | BLOC-0003 |

Checksums provide the cryptographic integrity mechanism for programmatic artifacts, ensuring that eBPF programs attached to kernel hooks have not been altered since their initial registration. The checksums 7b14de08, 9d2b7a16, and 5e8f3c91 serve as compact fingerprints for programs such as xdp_drop_all, tracepoint_sched_switch, tc_egress_rate, and flow_dissector_match, each of which attaches to a specific kernel hook—xdp, kretprobe, tc_ingress, or sk_msg. Notably, the programs tracepoint_sched_switch and tc_egress_rate share the identical checksum 9d2b7a16, which may indicate code reuse, compilation from a common source, or a deliberate design pattern in the eBPF program library. This checksum-based verification is essential in security-sensitive environments where unauthorized modification of kernel-level programs could compromise system integrity, and it operates independently of the claim and state tracking infrastructure while remaining accessible to the same governance framework through shared identifier resolution.

**t_ebpfprogram_only_attached_to_kprobe**

| id | ebpfprogram | attaches_to_hook | checksum | identifier |
| --- | --- | --- | --- | --- |
| KPRO-0001 | xdp_drop_all | xdp | 7b14de08 | ARN:res/41 |
| KPRO-0002 | tracepoint_sched_switch | kretprobe | 9d2b7a16 | doi:10.1109/x |
| KPRO-0003 | tc_egress_rate | tc_ingress | 9d2b7a16 | ref-8842 |
| KPRO-0004 | flow_dissector_match | sk_msg | 5e8f3c91 | doi:10.1109/x |
| KPRO-0005 | tc_ingress_filter | tc_ingress | 7b14de08 | oid:1.3.6.1 |
| KPRO-0006 | tracepoint_sched_switch | flow_dissector | 5e8f3c91 | ARN:res/41 |