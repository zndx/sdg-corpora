---
chapter_id: ch_live_column_pair_object_ecd073
topic_id: 186
family: 07_long_tail
cited_terms: ['column_pair_object', 'profile_has_null_rate', 'policy_only_for_high_impact']
model: engine-refine
---

At the foundation of any structured governance framework lies a system for uniquely identifying and classifying the entities under management. Every object column receives a persistent identifier—such as OBJE-0001 or OBJE-0002—that anchors it across all measurement and policy records. These identifiers link to descriptive labels like Object Column Label 01 and categorical groupings such as Object Column Category 01, ensuring that each tracked element can be referenced unambiguously while remaining organized within a broader taxonomy. The identifier serves as the primary key through which all downstream relationships are resolved, whether the column appears in a quality measurement, a policy assignment, or a null-rate profile.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

Once an object column is catalogued, its operational quality is assessed through paired metrics of confidence and uncertainty. Confidence values—ranging from 0.068 for OBJE-0002 to 0.354 for OBJE-0004—quantify the degree of assurance in the column's measured state, while uncertainty figures like 560.21 or 984.09 capture the magnitude of potential deviation. These dual measures allow operators to distinguish between a column that is well-understood and one that demands closer scrutiny. A raw value such as 257.80 or 140.18 gains meaning only when interpreted alongside its confidence and uncertainty bounds, enabling risk-informed decisions about data reliability and remediation urgency.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

Policy enforcement is governed by NIST impact levels, which classify each object column according to the severity of potential harm from data compromise, loss, or unavailability. An impact level identifier such as IMPA-0006 or IMPA-0002 maps to a descriptive label and a category, providing both a human-readable classification and a machine-processable grouping. Each policy record pairs its assigned impact level with a priority ranking—values like 2, 3, or 5—and a review cycle measured in days, where 258 days represents a relatively tight cadence and 950 days a more relaxed interval. This triad of impact level, priority, and review cycle ensures that higher-risk columns receive more frequent and more urgent attention, aligning governance effort with actual exposure.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

The relationships between profiles and null-rate configurations are expressed through a junction structure that assigns roles to each pairing. A profile such as QualityGateConfig or ObservationProtocolAlpha acts as the subject of a relationship, while a null-rate definition like dropRate or absentMetric serves as the target. The role column—taking values such as owner, contributor, or reviewer—specifies the nature of the association, clarifying whether a profile is responsible for, contributes to, or audits the null-rate behavior. This subject-role-target pattern provides a flexible mechanism for expressing complex governance relationships without hardcoding them into the schema, allowing the same null-rate to participate in multiple profiles with different responsibilities.

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

Categories and miscellaneous labels provide the descriptive layer that makes the framework navigable for human operators. Every identifier maps to a category—Object Column Category 01 through 04, or At NIST Impact Level Category 01 through 04—that groups related entities by shared characteristics. Corresponding misc labels such as At NIST Impact Level Label 01 or Object Column Label 04 offer human-readable names for display and reporting. Together, these classification fields transform a network of foreign-key relationships into an organized, searchable taxonomy that supports both automated policy evaluation and manual governance review.

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

**dim_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level_label | at_n_i_s_t_impact_level_category |
| --- | --- | --- |
| IMPA-0001 | At N I S T Impact Level Label 01 | At N I S T Impact Level Category 01 |
| IMPA-0002 | At N I S T Impact Level Label 02 | At N I S T Impact Level Category 02 |
| IMPA-0003 | At N I S T Impact Level Label 03 | At N I S T Impact Level Category 03 |
| IMPA-0004 | At N I S T Impact Level Label 04 | At N I S T Impact Level Category 04 |
| IMPA-0005 | At N I S T Impact Level Label 05 | At N I S T Impact Level Category 05 |
| IMPA-0006 | At N I S T Impact Level Label 06 | At N I S T Impact Level Category 06 |
| IMPA-0007 | At N I S T Impact Level Label 07 | At N I S T Impact Level Category 07 |
| IMPA-0008 | At N I S T Impact Level Label 08 | At N I S T Impact Level Category 08 |