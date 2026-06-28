---
chapter_id: ch_live_alert_triggered_by_a36b0d
topic_id: 1
family: 07_long_tail
cited_terms: ['alert_triggered_by', 'nist80053_high_impact', 'control_only_addresses_threat_class']
model: engine-refine
---

Within the compliance monitoring architecture, alert events are captured as discrete records bearing unique identifiers such as TRIG-0001 through TRIG-0004, each carrying a duration measured in seconds—values ranging from 1,138.76 to 3,285.79—and an exit code that signals the termination state of the triggered condition, with observed codes including 322, 442, 118, and 676. The number of retry attempts associated with each alert spans from 209 to 453, reflecting the system's tolerance for transient failures before final resolution. These alert records are linked to a dimension table keyed on the same identifier namespace, where each entry carries a human-readable label—Triggered By Metric Label 01 through 04—and a categorical classification such as Triggered By Metric Category 01 through 04, enabling downstream aggregation and reporting by metric type.

**fact_alert**

| id | triggered_by_metric_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRIG-0001 | TRIG-0001 | 3135.98 | 322 | 248 |
| TRIG-0002 | TRIG-0005 | 1138.76 | 442 | 263 |
| TRIG-0003 | TRIG-0005 | 3285.79 | 118 | 453 |
| TRIG-0004 | TRIG-0004 | 1959.41 | 676 | 209 |
| TRIG-0005 | TRIG-0001 | 5812.08 | 4 | 119 |

**dim_triggered_by_metric**

| id | triggered_by_metric_label | triggered_by_metric_category |
| --- | --- | --- |
| TRIG-0001 | Triggered By Metric Label 01 | Triggered By Metric Category 01 |
| TRIG-0002 | Triggered By Metric Label 02 | Triggered By Metric Category 02 |
| TRIG-0003 | Triggered By Metric Label 03 | Triggered By Metric Category 03 |
| TRIG-0004 | Triggered By Metric Label 04 | Triggered By Metric Category 04 |
| TRIG-0005 | Triggered By Metric Label 05 | Triggered By Metric Category 05 |
| TRIG-0006 | Triggered By Metric Label 06 | Triggered By Metric Category 06 |
| TRIG-0007 | Triggered By Metric Label 07 | Triggered By Metric Category 07 |

The governance layer is anchored by a set of NIST SP 800-53 high-impact controls, identified by codes like IMPA-0001 through IMPA-0004, each mapped to a specific NIST publication: NIST SP 800-171, NIST SP 800-61, Zero Trust Architecture, and NIST SP 800-161. These controls are further classified by impact level—Moderate, Tier-4, Severity-Medium, and Compliance-Low—establishing a severity taxonomy that informs risk posture assessment. A junction table mediates the many-to-many relationship between NIST controls and impact levels, assigning a role to each linkage: contributor, reviewer, or observer. For instance, IMPA-0003 appears as a subject in two distinct role assignments, acting as both a contributor and a reviewer against the same target impact level IMPA-0003, while IMPA-0002 assumes the observer role against target IMPA-0004. This role-based assignment model ensures clear accountability across control-impact pairings.

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

Threat mitigation is expressed through a control registry that enumerates specific security mechanisms—Multi-Factor Authentication, Incident Response Plan, and Access Review Policy—each mapped to the threat classes they address, identified by codes such as IMPA-0001, IMPA-0002, IMPA-0004, and IMPA-0005. The attributes of these controls are defined in a schema table that specifies both the attribute name and its data type: effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This type discipline is enforced through a family of value tables, each dedicated to a single attribute type. Boolean values—true and false—are stored in the boolean value table, where entity THRE-0001 and THRE-0004 both resolve to true for attribute THRE-0003, while THRE-0002 and THRE-0003 resolve to false. Date values span from 2023-01-13 to 2025-01-04, with entity THRE-0001 carrying effective_date 2024-12-09 and entity THRE-0003 carrying 2025-01-04. Integer priorities range from 5 to 926, with entity THRE-0002 recording a priority of 926 for attribute THRE-0005, and string-valued attributes such as Encoding 01, Enforcement 02, and change rationale populate the varchar value table, providing the free-text annotations necessary for operational context.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | IMPA-0004 |
| THRE-0002 | Incident Response Plan | IMPA-0001 |
| THRE-0003 | Incident Response Plan | IMPA-0002 |
| THRE-0004 | Access Review Policy | IMPA-0005 |
| THRE-0005 | Backup Retention Schedule | IMPA-0001 |
| THRE-0006 | Backup Retention Schedule | IMPA-0003 |
| THRE-0007 | Access Review Policy | IMPA-0002 |
| THRE-0008 | Incident Response Plan | IMPA-0005 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |