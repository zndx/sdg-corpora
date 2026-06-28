---
chapter_id: ch_live_nist80053_high_impact_30f37d
topic_id: 80
family: 07_long_tail
cited_terms: ['nist80053_high_impact', 'lineage_edge_describes_column_flow', 'profiling_basic']
model: engine-refine
---

Data governance frameworks for high-impact systems rest on a structured taxonomy of identifiers, categories, and role-based relationships that together establish accountability across compliance domains. Each NIST standard reference—whether NIST SP 800-171 for protected critical infrastructure data, NIST SP 800-61 for incident response, Zero Trust Architecture principles, or NIST SP 800-161 for supply-chain risk—receives a unique identifier such as IMPA-0001 through IMPA-0004, and is classified by an impact level ranging from Moderate and Severity-Medium to Tier-4 and Compliance-Low. These classifications are not merely administrative; they determine the rigor of controls applied and the severity of non-compliance consequences. The relationships between standards and impact levels are mediated through role assignments—contributor, reviewer, observer—that define who is responsible for each mapping, ensuring that governance decisions are traceable to named actors. A standard like IMPA-0003 may appear in multiple relationships, serving as both a subject referenced by IMPA-0006 and a target linked to impact level IMPA-0003, with the role field capturing whether the entity acts as contributor or reviewer in each context.

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

Column-level lineage tracking introduces a parallel layer of governance focused on data movement and transformation. Each lineage fact carries an identifier such as FLOW-0001 through FLOW-0004 and records which column flow it describes—FLOW-0004, FLOW-0005, or FLOW-0006—creating a directed graph of data dependencies. The confidence metric attached to each lineage claim, ranging from 0.071 for the least certain mapping to 0.779 for the most reliable, provides a quantitative measure of trustworthiness that operators can use to prioritize remediation. High-confidence lineage assertions, such as the 0.779 value associated with FLOW-0004, indicate well-documented and verified data paths, while low-confidence values like 0.071 flag areas requiring investigation. These confidence scores are complemented by uncertainty measurements—612.22, 133.03, 76.69, and 708.23 in the observed data—that quantify the margin of error in lineage claims, and by misc values such as 903.86 or 259.55 that capture supplementary metadata relevant to audit and compliance reporting. The dimension table for column flow provides categorical labels—Describes Column Flow Category 01 through 04—that group lineage facts into logical families, enabling aggregated analysis across related data paths.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

Profiling metrics capture the operational characteristics of data processing activities, providing visibility into execution performance and reliability. Each profiling record, identified as PROF-0001 through PROF-0004, is associated with a profiling key such as PROF-0003 or PROF-0006, and carries a duration in seconds that reflects the time cost of the operation—values ranging from 1113.38 seconds for the fastest execution to 6716.87 seconds for the longest. Exit codes, including 725, 809, 348, and 827, encode the termination status of each profiling run, enabling operators to distinguish between successful completions and failures that require intervention. Retry counts—209, 186, 303, and 264 in the observed dataset—reveal the frequency with which operations must be reattempted before reaching a terminal state, serving as an indicator of system stability and data quality. A profiling run with 303 retries and a duration of 2546.61 seconds suggests significant operational friction, whereas a run with 186 retries completing in 1113.38 seconds indicates comparatively smoother execution.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

The categorical structure underlying profiling data provides an additional dimension of classification. Each profiling record is associated with a category identifier—PROF-0001, PROF-0005, PROF-0007, or PROF-0008—and a profiling category label such as Profiling Category 01 through 04, which groups operations into functional families for aggregated analysis. The category dimension table further refines this classification with category names like Category Name 01 through 04, enabling cross-referencing between operational metrics and business-domain groupings. This multi-layered categorization—spanning profiling labels, profiling categories, and category identifiers—ensures that performance data can be analyzed at the appropriate level of granularity, from individual execution records to broad functional domains.

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

Together, these structures form an integrated governance fabric in which identifiers provide uniqueness, categories enable aggregation, confidence and uncertainty quantify reliability, lineage maps data dependencies, profiling captures operational behavior, and roles assign accountability. The interplay between these elements allows organizations to trace a compliance requirement from its NIST standard reference through its impact classification, to the data flows it governs, to the profiling metrics that verify operational adherence, and finally to the individuals—contributors, reviewers, observers—who are responsible for each link in the chain.