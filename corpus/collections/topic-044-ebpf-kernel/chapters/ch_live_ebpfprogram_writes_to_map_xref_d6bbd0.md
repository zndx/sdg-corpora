---
chapter_id: ch_live_ebpfprogram_writes_to_map_xref_d6bbd0
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map_xref', 'kernel_anomaly_supports_claim', 'requirement_subclass']
model: engine-refine
---

In systems that track software artifacts and their operational characteristics, a disciplined taxonomy of identifiers, categories, and confidence measures provides the scaffolding for auditability and reproducibility. Each artifact is anchored by a unique identifier—XREF-0001, CLAI-0001, REQU-0001—that serves as the immutable key across fact and dimension tables, ensuring that measurements, classifications, and requirements can be correlated without ambiguity. The identifier functions as the primary join point: it links a factual observation to its categorical label, its version lineage, and its governing scope, thereby collapsing what would otherwise be a fragmented evidence trail into a single retrievable entity.

eBPF programs represent one class of tracked artifact, each recorded with a size in bytes and a version number that together define its footprint and evolutionary state. The program identified as XREF-0001 occupies 784,335,640 bytes and carries version 12, while XREF-0003, a smaller program at 113,209,263 bytes, is recorded at version 11. The same ebpfprogram_key—XREF-0003—appears across multiple fact rows, indicating that a single program can accumulate distinct measurements or snapshots over time. Dimensional metadata attaches a human-readable label and a category to each identifier: Ebpfprogram Label 01 maps to Ebpfprogram Category 01, Ebpfprogram Label 02 to Category 02, and so forth through Label 04 and Category 04. This separation of measured facts from descriptive labels enables independent updates to classification taxonomies without altering the underlying measurements.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

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

Kernel observations follow an analogous structure but introduce a probabilistic layer: each kernel fact carries a confidence score and an uncertainty value alongside a measured quantity. The kernel record CLAI-0001 reports a confidence of 0.772 with an uncertainty of 402.55 and a value of 40.61, whereas CLAI-0004 achieves a confidence of 0.943 with an uncertainty of 437.87 and a value of 235.95. The lowest confidence—0.004—appears in CLAI-0003, whose uncertainty of 157.11 and value of 830.48 suggest a measurement that is both imprecise and extreme relative to the cohort. The kernel_key field permits multiple fact rows to reference the same kernel (CLAI-0002 appears in CLAI-0001, CLAI-0002, and CLAI-0004), mirroring the eBPF pattern of accumulating temporal or contextual snapshots. Dimensional tables assign each kernel a label and category—Kernel Label 01 through 04 paired with Kernel Category 01 through 04—preserving the same fact-dimension separation.

Requirements introduce a governance dimension, binding each identifier to a named requirement, a specifying framework, a scope of applicability, and a language. The requirement Event Deduplication Protocol specifies the SOC2 Compliance Framework and applies at the local scope in German (de), while Data Retention Policy—appearing twice under REQU-0002 and REQU-0003—specifies Backup Storage Volume at the team scope in Spanish (es) and the SOC2 Compliance Framework at the local scope in French (fr). Metadata Tagging Mandate (REQU-0004) specifies the Real Time Alerting Engine at the global scope in Japanese (ja). The scope field—local, team, global—defines the organizational reach of each requirement, and the language field records the authoritative linguistic variant, ensuring that compliance obligations are traceable to a single, unambiguous specification.

**t_requirement_subclass**

| id | requirement | specifies | scope | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | Event Deduplication Protocol | SOC2 Compliance Framework | local | de |
| REQU-0002 | Data Retention Policy | Backup Storage Volume | team | es |
| REQU-0003 | Data Retention Policy | SOC2 Compliance Framework | local | fr |
| REQU-0004 | Metadata Tagging Mandate | Real Time Alerting Engine | global | ja |

The interplay of these structures—identifiers as join keys, categories as classification anchors, confidence and uncertainty as quality indicators, size and version as state descriptors, scope and language as governance parameters—forms a coherent evidence model. An auditor can trace from a requirement at a given scope and language, through the kernel or eBPF program it governs, to the factual measurements that support or contradict compliance, with confidence and uncertainty quantifying the reliability of each link. The taxonomy is extensible: new categories, labels, and requirements can be introduced without restructuring the fact tables, and version numbers on eBPF programs provide a temporal axis for tracking artifact evolution. This design ensures that every claim in the system is grounded in a measurable fact, classified within a known category, and bounded by a defined scope and language.

**fact_kernel**

| id | kernel_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0002 | 0.772 | 402.55 | 40.61 |
| CLAI-0002 | CLAI-0005 | 0.607 | 449.10 | 348.13 |
| CLAI-0003 | CLAI-0002 | 0.004 | 157.11 | 830.48 |
| CLAI-0004 | CLAI-0002 | 0.943 | 437.87 | 235.95 |
| CLAI-0005 | CLAI-0003 | 0.101 | 474.03 | 682.21 |
| CLAI-0006 | CLAI-0003 | 0.671 | 334.23 | 633.25 |
| CLAI-0007 | CLAI-0006 | 0.159 | 653.45 | 469.91 |
| CLAI-0008 | CLAI-0004 | 0.545 | 224.87 | 822.30 |

**dim_kernel**

| id | kernel_label | kernel_category |
| --- | --- | --- |
| CLAI-0001 | Kernel Label 01 | Kernel Category 01 |
| CLAI-0002 | Kernel Label 02 | Kernel Category 02 |
| CLAI-0003 | Kernel Label 03 | Kernel Category 03 |
| CLAI-0004 | Kernel Label 04 | Kernel Category 04 |
| CLAI-0005 | Kernel Label 05 | Kernel Category 05 |
| CLAI-0006 | Kernel Label 06 | Kernel Category 06 |