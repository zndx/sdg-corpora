---
chapter_id: ch_live_ebpfmap_pinned_at_path_29d1e1
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'ebpfmap_subclass', 'ebpfmap_used_by_program']
model: engine-refine
---

The governance of eBPF map artifacts demands a multi-dimensional taxonomy that reconciles operational provenance with data stewardship obligations. Each map instance receives a unique identifier—PATH-0001 through PATH-0004 for pinned instances, EBPF-0001 through EBPF-0004 for subclass classifications, and PROG-0001 through PROG-0004 for program-level usage records—establishing a persistent handle across the lifecycle. These identifiers anchor a relational structure wherein the same logical map, such as `lpm_trie` or `perf_event_map`, may appear under different naming contexts: as a pinned resource at `/sys/fs/bpf/netfilter_flow` or as a subclass entry with checksum `7b14de08` stored in `gs://warehouse/gold`. The identifier thus functions not merely as a primary key but as a cross-referential nexus, enabling auditors to trace a single map from its filesystem residence through its type classification, storage URI, and consuming programs without ambiguity.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | xdp_stats_map | /run/bpf/sockops | sre | pii |
| PATH-0002 | lru_percpu_hash | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | cgroup_storage_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | lpm_trie | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | xdp_stats_map | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | dev_map_eth | /sys/fs/bpf/xdp_ingress | platform-team | verified |

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sockmap | lpm_trie | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | task_storage | devmap | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | perf_event_map | perf_event_array | a3f9c21e | s3://lake/raw |
| EBPF-0004 | perf_event_map | hash_map | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | cpumap | stack_trace | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | sockhash_map | ringbuf | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | ringbuf_output | hash_map | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | task_storage | stack_trace | c0ffee42 | abfss://prod/silver |

Ownership and classification operate as the first line of accountability. The `owner` column assigns stewardship to teams such as `sre` or `data-engineering`, creating an unambiguous chain of responsibility for maps like `xdp_stats_map` and `lru_percpu_hash`, both tagged `pii` and owned by `sre` and `data-engineering` respectively. These ownership assignments intersect with tag-based metadata—`pii`, `internal`, `verified`—that encodes data sensitivity and compliance posture. A map pinned at `/sys/fs/bpf/cilium_flow` carries the `pii` tag, signaling that its contents traverse personally identifiable information and thereby invoking stricter access controls and retention policies. The `category` and `misc` dimensions, drawn from the program classification dimension, further segment maps by operational context: `Used By Program Category 01` through `04` and corresponding labels provide a secondary taxonomy that supports reporting, cost allocation, and regulatory mapping independent of the technical map type.

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

Integrity verification and data lineage are captured through the `checksum` and `uri` fields, which together form a verifiable provenance chain. The checksum—values such as `9d2b7a16`, `1a4b6c2d`, `a3f9c21e`, and `7b14de08`—serves as a cryptographic fingerprint of the map's serialized state at a point in time, enabling change detection and tamper verification. The `uri` field records the persistent storage location across heterogeneous backends: `abfss://prod/silver` for Azure-based data lakehouse tiers, `s3://lake/raw` for S3 raw zones, and `gs://warehouse/gold` for GCS curated layers. This dual encoding of integrity and location means that any audit of map state can simultaneously verify that the content at `s3://lake/raw` matches the expected checksum `a3f9c21e` and confirm that the storage tier aligns with data classification policies.

Programmatic consumption introduces a second axis of tracking, captured through the `used_by_program` relationship and its associated metadata. The fact table records which program identifiers—`PROG-0005`, `PROG-0004`, `PROG-0002`—consume each map, creating a dependency graph that reveals blast radius in the event of a map modification or decommission. The `size_bytes` column quantifies the footprint of each map instance, ranging from 31,105,012 bytes for one instance to 354,373,995 bytes for another, figures that directly inform capacity planning and cost attribution. The `version` column—values 3, 6, 12, and 5—tracks the evolution of map schemas or configurations over time, enabling rollback decisions and compatibility assessments. Together, these fields transform what might be a simple usage log into a structured dependency matrix that supports impact analysis, capacity forecasting, and change management.

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

The practical effect of this multi-table structure is that governance decisions can be made at any level of abstraction without requiring schema traversal. An SRE investigating a `pii`-tagged map pinned at `/run/bpf/sockops` can immediately determine ownership, verify its checksum against the subclass record, inspect its storage URI for compliance with data residency requirements, and enumerate consuming programs with their associated sizes and versions. Conversely, a data engineer reviewing the `data-engineering`-owned `lru_percpu_hash` map can assess its classification category, confirm its `internal` tag aligns with retention policies, and validate that its version number reflects the expected deployment stage. The relational design ensures that no single attribute—whether identifier, checksum, owner, or category—operates in isolation; each gains meaning through its connections to the others, forming a coherent governance fabric that scales with the complexity of the eBPF ecosystem.