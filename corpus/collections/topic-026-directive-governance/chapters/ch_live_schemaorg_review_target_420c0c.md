---
chapter_id: ch_live_schemaorg_review_target_420c0c
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_review_target', 'gauge_metric_subclass', 'policy_only_governs_artifacts']
model: engine-refine
---

Governance frameworks rely on precise classification and enforcement mechanisms to ensure that policies are applied consistently across an organization's technology landscape. Policy artifacts are assigned enforcement modes that dictate their operational impact: a Data Retention Policy may carry a blocking enforcement posture, requiring immediate compliance before any action proceeds, while an Access Control Policy might operate in advisory mode, flagging deviations without halting execution. The same framework can accommodate deprecated policies alongside active ones, and each policy is ranked by priority—values ranging from 1 for the most critical directives to 5 for lower-urgency guidelines—ensuring that when conflicts arise, the system resolves them deterministically. An Immutable Audit Policy, for instance, might sit at priority 5, reflecting its role as a supplementary control rather than a primary gate.

At the heart of this classification system are identifiers, which serve as the immutable keys that bind every entity across the governance fabric. Whether tracking a target entity such as TARG-0001 or a metric record like METR-0001, these identifiers provide the referential integrity necessary for cross-referencing policies, metrics, and artifacts. The subject and target relationship between entities is captured through association records that explicitly name which schemaorg entity—such as a SoftwareApplication or a Person—acts as the subject, and which reviews_item entity—such as a GraphQLEndpoint or AzureBlobStorage—serves as the target. Each association is further qualified by a role, designating whether the subject holds an owner or contributor relationship to the target, thereby establishing clear lines of accountability and responsibility.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |

Metric measurement within the framework is organized through a dimensioned taxonomy that separates the categorical identity of a metric from its operational instance. The metric kind dimension provides both a human-readable label, such as Metric Kind Label 01, and a category classification, like Metric Kind Category 01, enabling analysts to group and filter metrics by their functional purpose. Each metric kind is then instantiated in fact tables where individual gauge records carry a size in bytes—values such as 944,581,501 or 182,468,524 reflecting the scale of the measured resource—and a version number that tracks the evolution of the measurement over time. Versions range from 4 to 11 across observed records, indicating that metrics are versioned to support historical analysis and to distinguish between different measurement methodologies or data collection periods.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

The interplay between these elements creates a governance model where policies govern artifacts, metrics measure compliance posture, and relationships define ownership. A PostgreSQLTable might be the target of a reviews_item association, owned by a Service entity classified under schemaorg, while simultaneously being subject to an Immutable Audit Policy operating in advisory mode at priority 5. The size of the underlying data—measured in hundreds of millions of bytes—feeds into gauge metrics that are themselves categorized and versioned, allowing auditors to trace not only what is governed but how the measurement of governance has evolved. This layered structure ensures that every policy decision, metric observation, and ownership assignment is traceable to a specific identifier, a defined role, and a documented enforcement posture.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |