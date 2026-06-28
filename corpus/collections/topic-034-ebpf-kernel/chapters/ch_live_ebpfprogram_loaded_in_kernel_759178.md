---
chapter_id: ch_live_ebpfprogram_loaded_in_kernel_759178
topic_id: 34
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_loaded_in_kernel', 'ebpfmap_subclass', 'annotation_only_about_artifact']
model: engine-refine
---

Metadata in data-intensive environments rests on a layered architecture of identifiers, categorization, integrity verification, and quality assessment. Every artifact receives a stable identifier that serves as its primary key across systems: eBPF programs are distinguished by codes such as KERN-0001 through KERN-0004, while eBPF map subclasses carry identifiers like EBPF-0001 and annotations are keyed by ARTI-0001 through ARTI-0004. These identifiers anchor version tracking, with eBPF programs carrying version stamps of 9, 11, or 12, enabling operators to determine which iteration of a program is deployed and to audit upgrade paths. The identifier itself is a neutral handle; its meaning emerges only when paired with the categorical and contextual metadata that surrounds it.

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | lpm_trie | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | devmap | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | perf_event_array | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | hash_map | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | stack_trace | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | ringbuf | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | hash_map | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | stack_trace | c0ffee42 | abfss://prod/silver |

Categorization and provenance information are stored in dimension tables that enrich the core facts. An eBPF program's loaded_in reference points to a dimension entry that supplies both a human-readable label—Loaded In Label 01, Loaded In Label 02—and a category classification such as Loaded In Category 01 or Loaded In Category 04. This separation of fact from dimension allows the same category to be reused across many programs without duplication. Similarly, annotations carry their own categorical labels and category designations, enabling downstream consumers to filter, aggregate, or route annotations by type without parsing free-form text. The misc column in these dimension tables holds the display label, keeping the operational key distinct from the presentation layer.

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

Integrity and location metadata ensure that artifacts can be verified and retrieved. Each eBPF map subclass carries a checksum—values such as 9d2b7a16, 1a4b6c2d, a3f9c21e, and 7b14de08—that serves as a compact fingerprint for detecting corruption or unauthorized modification. The corresponding uri column records the artifact's storage location across heterogeneous backends: abfss://prod/silver for Azure-based data lakehouses, s3://lake/raw for Amazon S3, and gs://warehouse/gold for Google Cloud Storage. Together, checksum and uri form a minimal provenance pair: the checksum answers whether the data is intact, and the uri answers where to find it.

Annotation records introduce a quality-assessment layer built on confidence and uncertainty. Each annotation fact carries a confidence score—0.845 for ARTI-0001, for instance, indicating a high degree of certainty—paired with an uncertainty value measured on a continuous scale, such as 690.59 for the same record or 22.02 for ARTI-0004. The value column holds the substantive measurement, ranging from 284.47 to 979.94 across the sample, while the annotation_key column links the fact to its corresponding dimension entry for label and category resolution. High-confidence annotations with low uncertainty represent reliable signals suitable for automated decision-making, whereas low-confidence records with high uncertainty warrant human review.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

The size of the underlying artifacts also matters for operational planning. eBPF programs span a wide range, from 113,209,263 bytes for KERN-0003 to 784,335,640 bytes for KERN-0001, a spread that influences memory allocation, load times, and deployment windows. When combined with version and loaded_in metadata, size information enables capacity forecasting and helps operators identify whether a version bump correlates with a significant footprint change. In aggregate, the interplay of identifier, version, category, checksum, uri, confidence, uncertainty, and size creates a complete audit trail: every artifact can be located, verified, classified, and assessed for reliability.

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |