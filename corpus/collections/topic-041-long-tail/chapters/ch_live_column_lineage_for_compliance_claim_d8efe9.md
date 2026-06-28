---
chapter_id: ch_live_column_lineage_for_compliance_claim_d8efe9
topic_id: 41
family: 07_long_tail
cited_terms: ['column_lineage_for_compliance_claim', 'kernelhook_only_kprobe', 'nonbreaking_change_subclass']
model: engine-refine
---

In any rigorous data governance framework, the establishment of a stable nomenclature begins with the precise assignment of an identifier to every distinct column and categorical attribute. These identifiers, such as `CLAI-0001` or `CLAI-0002`, serve as the immutable primary keys that anchor metadata registries, ensuring that a specific column—whether designated by a technical key like `CLAI-0005` or a human-readable label such as `Column Label 01`—can be unambiguously traced across the enterprise architecture. Alongside these unique designations, columns are systematically organized into categories, for instance, `Column Category 01` or `Column Category 04`, which provide the necessary taxonomic structure for bulk classification and policy enforcement. This foundational layer of identification and categorization ensures that every data asset, regardless of its underlying format, possesses a consistent and auditable lineage.

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

Beyond mere identification, the integrity of a data asset is quantified through the dual metrics of confidence and uncertainty, which together form the basis of a risk-aware data quality model. Confidence scores, expressed as decimal values ranging from `0.068` to `0.354`, provide a normalized measure of the reliability or completeness of a specific column's metadata or content. Conversely, uncertainty metrics—measured in absolute units such as `404.01` or `984.09`—capture the variance or potential deviation inherent in the data. For example, a column with a relatively high confidence of `0.354` might still exhibit a low uncertainty of `404.01`, indicating a highly stable and trustworthy data point, whereas a value with `0.068` confidence paired with `744.10` uncertainty signals a critical need for remediation or manual review.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

The practical application of these metrics is observed in the management of operational values and the classification of system modifications. Raw data values, such as `257.80` or `140.18`, are the tangible outputs of these governed columns, while the evolution of the system itself is tracked through specific non-breaking change subclasses. These changes, which include routine maintenance actions like a `Dependency Version Bump` or a `License Header Update`, are carefully distinguished from more significant alterations to maintain system stability. By categorizing these modifications—such as a `Metric Name Addition` or a `Field Nullability Change`—administrators can apply granular governance policies that prevent unintended disruptions while allowing for continuous iterative improvement.

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

At the relational level, governance extends to the definition of subject-target relationships, mediated by explicit roles that dictate access and responsibility. In complex systems, such as those managing kernel hooks or non-breaking change dependencies, an entity (the subject) is linked to a resource or category (the target) through a specific role, such as `owner`, `contributor`, or `reviewer`. For instance, a kernel hook targeting `net_rx_action` might be assigned the role of `owner` by a specific hook kind, establishing clear accountability for system-level events. Similarly, in change management, a non-breaking change identified as `CHAN-0004` might assume the role of `observer` against a target dependency, ensuring that all stakeholders are formally recognized and that the chain of custody for every system interaction is fully documented and enforceable.

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |