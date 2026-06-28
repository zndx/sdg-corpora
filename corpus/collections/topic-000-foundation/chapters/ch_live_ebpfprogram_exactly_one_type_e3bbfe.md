---
chapter_id: ch_live_ebpfprogram_exactly_one_type_e3bbfe
topic_id: 0
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_exactly_one_type', 'trace_with_root_span', 'instrument_emits_signal']
model: engine-refine
---

The foundational architecture of the observability and instrumentation domain rests upon a disciplined use of unique identifiers to anchor every entity and relationship. Each record—whether an eBPF program such as `fentry_do_fork` or `kprobe_sched_switch`, a distributed trace, or a physical instrument like a LiDAR array, seismometer, mass spectrometer, or radiometer—is assigned a stable identifier (e.g., `TYPE-0001`, `SPAN-0001`, `SIGN-0001`) that serves as the primary key across all tables. These identifiers are not arbitrary; they encode the entity class in their prefix and provide a deterministic handle for foreign-key joins. The `fact_trace` table, for instance, uses identifiers such as `SPAN-0001` through `SPAN-0004` to tag individual trace records, while the `dim_root_span` dimension table employs the same identifier scheme to attach categorical metadata to root spans. This uniform identification strategy ensures referential integrity and enables cross-domain correlation between telemetry, instrumentation, and programmatic observability layers.

Root spans constitute the temporal and causal anchors of distributed traces. Each trace record in `fact_trace` carries a `root_span_key` column that references a root span—`SPAN-0002`, `SPAN-0004`, or `SPAN-0005`—thereby establishing a parent-child hierarchy within the trace topology. The `dim_root_span` dimension table enriches these references with two descriptive attributes: a `root_span_label` (stored in the `misc` column), which holds human-readable designations such as `Root Span Label 01` through `Root Span Label 04`, and a `root_span_category` (stored in the `category` column), which assigns classification codes like `Root Span Category 01` through `Root Span Category 04`. The categorical dimension enables aggregation and filtering of traces by operational domain, while the misc label provides an unstructured, human-interpretable name for dashboards and incident reports. Together, category and misc form a dual-axis classification scheme that balances machine-readable grouping with human-readable context.

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

Size metrics and versioning provide the quantitative and temporal dimensions of recorded events. The `fact_trace` table records `size_bytes` values ranging from 70,626,790 bytes (approximately 67 MiB for `SPAN-0003`) to 953,122,943 bytes (approximately 889 MiB for `SPAN-0004`), capturing the payload footprint of each trace. A parallel size column, `sizebytes`, appears in the `t_instrument_emits_signal` table, where it quantifies the data volume emitted by instruments: the LiDAR array produces 193,789,751 bytes of optical pulse data, the seismometer emits 556,171,171 bytes of ultrasonic wave data, the mass spectrometer generates 279,461,908 bytes, and the radiometer outputs 579,891,201 bytes of heartbeat ping data. The `fact_trace` table also carries a `version` column with integer values (4, 8, 12), indicating schema or protocol revisions of the trace records, which is critical for backward compatibility in evolving telemetry pipelines.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Optical pulse | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Ultrasonic wave | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | Ultrasonic wave | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Heartbeat ping | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Data packet | 371526447 | abfss://prod/silver |

The URI attribute in `t_instrument_emits_signal` specifies the data lake destination for each instrument's output, using cloud-native storage paths: `s3://lake/raw` for the LiDAR array, `abfss://prod/silver` for the seismometer, `s3://lake/curated` for the mass spectrometer, and `gs://warehouse/gold` for the radiometer. These URIs encode both the protocol (S3, Azure Blob File System, GCS) and the data maturity tier (raw, silver, curated, gold), reflecting a medallion architecture where data is progressively refined as it flows through the pipeline. The URI thus serves as both a routing directive and a quality signal, enabling automated data contracts and SLA enforcement at the storage layer.

Relationships between eBPF programs and their execution contexts are mediated through a junction table that explicitly models the `subject`, `target`, and `role` of each association. The `t_ebpfprogram_exactly_one_type__program_type` table links an eBPF program identifier (`ebpfprogram_id`, the subject) to a program type identifier (`program_type_id`, the target) and assigns a `role`—either `owner` or `observer`—that defines the nature of the binding. For example, `TYPE-0003` acts as the owner of `TYPE-0005`, while `TYPE-0005` serves as the observer of `TYPE-0004`. This tripartite relationship model (subject → role → target) generalizes beyond eBPF programs to any domain requiring typed, role-aware associations between entities, and it is complemented by the `t_ebpfprogram_exactly_one_type_program_type` table, which maps each program type to its execution mode (e.g., `kprobe` or `socket_filter`), thereby grounding abstract identifiers in concrete runtime semantics.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |