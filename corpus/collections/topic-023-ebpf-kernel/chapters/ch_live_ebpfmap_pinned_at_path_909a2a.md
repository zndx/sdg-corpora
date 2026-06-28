---
chapter_id: ch_live_ebpfmap_pinned_at_path_909a2a
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'gdpr_data_subject_right', 'lineage_edge_via_transformation']
model: engine-refine
---

Every structured data asset requires a stable addressing convention to anchor its provenance and govern its lifecycle. Within this framework, the identifier serves as the immutable primary key that uniquely addresses each record across heterogeneous registries, whether designating a pinned eBPF map such as `PATH-0001` or codifying a regulatory entitlement like `RIGH-0001`. These identifiers do not merely label; they establish the referential backbone that permits cross-table resolution. An entity, in turn, denotes the specific instance or operational object to which metadata and constraints are bound. When a lineage edge is instantiated—such as the transformation linking `Inventory Reconciliation` to `Genomic Variant Catalog`—the entity identifier anchors that relationship, ensuring that downstream audits can trace exactly which data subject right or pipeline stage is under examination.

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | Right to Withdraw Consent | Right to Withdraw Consent |
| RIGH-0002 | California CCPA | Right to Erasure |
| RIGH-0003 | Right to Object | Right to Object |
| RIGH-0004 | Right to Lodge Complaint | Switzerland FADP |
| RIGH-0005 | Right to Automated Decisions | California CCPA |
| RIGH-0006 | Right to Withdraw Consent | Right to be Informed |

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |

Once an entity is addressed, its characteristics are formalized through attr definitions and their corresponding attr type contracts. This type discipline decouples semantic meaning from storage format, assigning precise data schemas such as `xsd:date` for temporal markers like `effective_date`, `xsd:boolean` for compliance flags like `mandatory`, and `xsd:integer` for quantitative thresholds like `priority`. Heterogeneous values are subsequently routed to dedicated type-specific repositories, where a single entity may simultaneously carry a temporal constraint (`2025-05-21`), a boolean flag (`true`), and a categorical descriptor (`Encoding 01`). The separation of type domains guarantees that each misc value is parsed, indexed, and enforced according to its native schema, preventing type coercion errors during cross-system reconciliation and preserving data integrity across regulatory boundaries.

Technical attributes alone cannot satisfy operational accountability; stewardship must be explicitly declared. Owner designates the functional group responsible for the lifecycle and maintenance of a given asset, routing operational queries to the appropriate domain—whether `sre` teams managing kernel-level networking maps or `data-engineering` groups overseeing pipeline configurations. Complementing ownership, tags function as lightweight policy classifiers that propagate compliance posture across the dataset. A single pinned path may carry a `pii` designation, signaling mandatory handling controls, while another bears `verified`, indicating successful audit completion. These tags operate independently of ownership, allowing a single entity to satisfy multiple governance vectors simultaneously without introducing schema bloat or rigid inheritance hierarchies.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |

The reliability of data lineage and transformation pipelines is quantified through paired metrics of confidence and uncertainty. Confidence scores, expressed as normalized probabilities ranging from `0.111` to `0.554`, measure the degree of certainty that a given transformation accurately reflects its source-to-destination mapping. Conversely, uncertainty values, measured in absolute variance units such as `766.93` or `350.43`, capture the dispersion or noise inherent in the transformation process. When a pipeline stage like `Timezone Normalization` exhibits a confidence of `0.554` alongside an uncertainty of `878.86`, operators can immediately infer that while the transformation is recognized, its output distribution carries substantial variance. These paired metrics enable risk-weighted routing, allowing downstream consumers to apply stricter validation thresholds to low-confidence, high-uncertainty edges before integrating them into production workloads.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |