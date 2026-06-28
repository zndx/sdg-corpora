---
chapter_id: ch_live_schemaorg_person_email_25b28f
topic_id: 92
family: 07_long_tail
cited_terms: ['schemaorg_person_email', 'classification_assigns_tier', 'histogram_metric_subclass']
model: engine-refine
---

Operational data management relies upon a disciplined taxonomy of identifiers, categories, and metadata attributes that together enable traceability, governance, and lifecycle control across heterogeneous data assets. Identifiers such as EMAI-0001, EMAI-0002, and METR-0001 serve as the immutable anchors of each record, ensuring that every fact—whether a schemaorg entry, an email classification, or a metric histogram—can be unambiguously located and correlated across dimensional lookups. These identifiers are not merely labels; they are the join keys that bind operational facts to their descriptive dimensions, allowing an email record identified as EMAI-0004 to be enriched with its human-readable label, Email Label 04, and its assigned category, Email Category 04, without duplicating descriptive content within the fact table itself.

**dim_email**

| id | email_label | email_category |
| --- | --- | --- |
| EMAI-0001 | Email Label 01 | Email Category 01 |
| EMAI-0002 | Email Label 02 | Email Category 02 |
| EMAI-0003 | Email Label 03 | Email Category 03 |
| EMAI-0004 | Email Label 04 | Email Category 04 |
| EMAI-0005 | Email Label 05 | Email Category 05 |
| EMAI-0006 | Email Label 06 | Email Category 06 |

**t_classification_assigns_tier**

| id | classification | assigns_tier | log_level | retry_count |
| --- | --- | --- | --- | --- |
| TIER-0001 | Governance Registry | Sandbox Tier | info | 379 |
| TIER-0002 | Security Baseline | Internal Distribution | error | 176 |
| TIER-0003 | Data Classification Scheme | Restricted Access | debug | 195 |
| TIER-0004 | Data Lineage Map | Restricted Access | debug | 460 |
| TIER-0005 | Metadata Schema | Sandbox Tier | critical | 23 |

The categorization layer introduces semantic structure through fields such as email_category and metric_kind_category, which partition assets into meaningful groups like Email Category 01 through Email Category 04 and Metric Kind Category 01 through Metric Kind Category 04. These categories are not arbitrary; they reflect organizational policy decisions about how data should be classified, routed, and governed. A similar classification scheme appears in the tier assignment table, where records such as TIER-0001 carry a classification of Governance Registry and are assigned to the Sandbox Tier, while TIER-0003, classified under Data Classification Scheme, receives the more restrictive Restricted Access tier. The progression from Sandbox Tier to Internal Distribution to Restricted Access illustrates a graduated access model, where the category of the asset directly determines the stringency of its controls.

Size in bytes and version number constitute the two primary quantitative attributes that track the physical and logical state of data assets over time. In the schemaorg fact table, email records exhibit substantial variation in storage footprint, with EMAI-0004 consuming 998,785,819 bytes while EMAI-0002 occupies only 114,301,972 bytes—a nearly ninefold difference that has direct implications for capacity planning and archival strategy. The version attribute, ranging from 3 to 8 across the schemaorg records and from 3 to 9 in the histogram fact table, provides a lightweight but effective mechanism for detecting stale data and enforcing update discipline. When a metric histogram record identified as METR-0002 carries version 9, it signals that this particular metric kind has undergone more revision cycles than its peer METR-0001, which remains at version 3, suggesting divergent rates of change across metric types.

**fact_schemaorg**

| id | email_key | size_bytes | version |
| --- | --- | --- | --- |
| EMAI-0001 | EMAI-0004 | 895265030 | 3 |
| EMAI-0002 | EMAI-0002 | 114301972 | 5 |
| EMAI-0003 | EMAI-0005 | 338701831 | 4 |
| EMAI-0004 | EMAI-0005 | 998785819 | 8 |

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

The misc dimension—manifested as email_label and metric_kind_label—provides the human-readable interface to otherwise opaque identifiers. Labels such as Email Label 01, Email Label 02, and Metric Kind Label 03 through Metric Kind Label 04 serve as the bridge between machine-readable identifiers and the operational staff who must interpret, audit, and manage these assets. This separation of machine keys from human labels is a deliberate architectural choice that permits labels to change without breaking referential integrity, while the underlying identifiers remain stable across organizational transitions and system migrations.

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

Operational resilience is captured through the log_level and retry_count attributes in the tier assignment table, which together form a lightweight observability and fault-recovery model. Log levels—info, error, and debug—provide a coarse-grained signal of system state, with debug entries appearing for records TIER-0003 and TIER-0004, both of which are classified under Restricted Access, suggesting that higher-security tiers generate more verbose diagnostic output. The retry_count values, ranging from 176 for TIER-0002 (Security Baseline, Internal Distribution) to 460 for TIER-0004 (Data Lineage Map, Restricted Access), quantify the operational friction associated with each tier; the elevated retry count for the Restricted Access tier with a Data Lineage Map classification indicates that complex lineage operations under strict access controls incur significantly more transient failures than simpler internal distribution tasks. These metrics are not diagnostic in isolation but become actionable when correlated with log level and classification, enabling operators to distinguish between expected retries in debug-mode operations and genuine failures requiring intervention.