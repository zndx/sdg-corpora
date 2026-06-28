---
chapter_id: ch_live_ebpfprogram_min_one_hook_fc4b89
topic_id: 97
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_min_one_hook', 'evidence_refutes_claim', 'schemaorg_event_starttime']
model: engine-refine
---

In the architecture of structured observability, identifiers serve as the immutable anchors of every record, whether they manifest as the sequential codes HOOK-0001 through HOOK-0004 within the eBPF program registry or the STAR-0001 through STAR-0004 designations assigned to schema event records. These identifiers are not arbitrary; they establish referential integrity across fact and dimension tables, enabling precise joins between measurement data and their descriptive metadata. The evidence refutation table employs a parallel convention with CLAI-0001 through CLAI-0004, each entry anchoring a specific claim challenge—such as the assertion that uptime exceeds 99.9 percent, which is contested by evidence ranging from benchmark result v2.1 to audit report FY2023. The consistency of this identifier scheme across disparate domains ensures that any analyst tracing a performance anomaly from raw measurement to its categorical provenance encounters a stable key at every hop.

The attaches-to-hook relationship constitutes a critical linkage between eBPF programs and the kernel hooks they instrument, a relationship captured through the foreign key attaches_to_hook_key in the fact table and resolved through the dimension table dim_attaches_to_hook. An eBPF program identified as HOOK-0001, occupying 784,335,640 bytes at version 12, attaches to the hook designated HOOK-0006, while its sibling HOOK-0002—641,704,069 bytes at version 9—attaches to the identical hook, suggesting shared instrumentation targets across program variants. The dimension table enriches this relationship with human-readable labels such as Attaches To Hook Label 01 and categorical classifications like Attaches To Hook Category 01, providing the semantic context necessary for governance reviews and capacity planning. The misc column within this dimension table stores the label text, while the category column classifies the hook type, together forming a two-axis metadata structure that supports both operational queries and compliance reporting.

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

Event start time records follow an analogous dimensional pattern, where the fact_schemaorg table references dim_event_start_time through the event_start_time_key column. The program STAR-0001, measuring 895,265,030 bytes at version 3, points to event STAR-0005, whereas STAR-0003 and STAR-0004 both reference event STAR-0001, indicating that multiple schema records may share a common temporal origin point. The dimension table provides event_start_time_label entries such as Event Start Time Label 01 alongside event_start_time_category classifications like Event Start Time Category 01, maintaining the same dual-axis metadata convention. The size_bytes column, present in both fact tables, quantifies the storage footprint of each record—values spanning from 113,209,263 bytes for the smallest eBPF program (HOOK-0003 at version 11) to 998,785,819 bytes for the largest schema event record (STAR-0004 at version 8)—enabling storage governance and cost attribution.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

The method column within the evidence refutation table introduces a procedural dimension absent from the measurement fact tables, classifying how each claim challenge was conducted. Manual methods appear alongside hybrid and automated approaches, with the manual process associated with the calibration record that refutes the uptime claim, while hybrid methods underpin both the audit excerpt and the pre-release note. The label_text column—distinct from the misc-stored labels in dimension tables—carries domain-specific annotations such as calibration record, audit excerpt, intake form, and pre-release note, each providing contextual provenance for the evidence item. The version column, present in both fact tables, tracks revision states of the underlying records: eBPF programs range from version 9 to version 12, while schema event records span versions 3 through 8, with version 12 representing the most mature program iteration at HOOK-0001 and HOOK-0004.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | Uptime exceeds 99.9% | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | Uptime exceeds 99.9% | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | Carbon neutral supply chain | automated | intake form |
| CLAI-0004 | Data lineage snapshot | Uptime exceeds 99.9% | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | GDPR Article 17 compliant | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | Chemical purity meets ISO | automated | change rationale |
| CLAI-0007 | Incident summary Aug | Uptime exceeds 99.9% | inferred | intake form |

Together, these constructs—identifiers, foreign keys, labels, categories, methods, and versioned measurements—form a coherent dimensional model that supports both operational monitoring and compliance verification. The separation of mutable measurements (size_bytes, version) from stable descriptors (category, label) enables independent evolution of metadata without disrupting analytical queries. The evidence refutation table, while structurally distinct from the star-schema fact-dimension pairs, adheres to the same principles of keyed identification and methodological transparency, ensuring that every claim challenge can be traced to its source evidence, its classification, and the process by which it was evaluated.