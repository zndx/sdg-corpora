---
chapter_id: ch_live_observation_governed_by_policy_67e415
topic_id: 123
family: 02_observation_measurement
cited_terms: ['observation_governed_by_policy', 'indoor_air_quality_action_plan', 'nist80053_high_impact']
model: engine-refine
---

Observations of system anomalies are captured as discrete records governed by policy, each identified by a policy-scoped code such as POLI-0001 through POLI-0004. The observations themselves describe concrete operational events: a north vent temperature spike, an ingestion pipeline backpressure, core switch packet loss, and an edge gateway heartbeat timeout. These are not abstract categories but timestamped, host-specific incidents that trigger downstream remediation workflows. The policy linkage establishes a direct chain of accountability—every observed fault is traceable to a governing control, and every control is accountable for a defined set of observable conditions.

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

Attribute metadata for these observations is defined separately from their values, following a schema-on-read pattern that decouples type declarations from data storage. Four attribute names are declared—duration_seconds, end_time, exit_code, and host_name—each bound to an XML Schema datatype: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. The actual values are materialized in four parallel value tables, one per datatype, each keyed by a composite of observation identifier, entity reference, and attribute reference. A duration of 2405.99 seconds, an end time of 2023-03-21T06:17:05, an exit code of 46, and a host name of gw-12 are stored in their respective typed tables, ensuring that type enforcement occurs at the schema level rather than through runtime coercion. This separation permits the same observation entity to carry heterogeneous attributes without requiring a wide, sparse table or nullable columns of mixed type.

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

Indoor air quality action plans operate under an analogous architecture but at the domain of environmental health governance. Plans such as the HVAC Filter Upgrade Protocol, Dust Suppression Procedure, and Air Purifier Deployment Plan are each associated with a specific pollution target—Carbon Monoxide, Asbestos Fibers, Particulate Matter 2.5, or Nitrogen Dioxide—and verified against a health outcome metric, typically Respiratory Infection Incidence or Asthma Symptom Frequency. The plan attributes—effective_date, enforcement, mandatory, and priority—are declared with types xsd:date, xsd:string, xsd:boolean, and xsd:integer, and their values are similarly partitioned into type-specific tables. A plan effective from 2024-08-22 with a priority of 5 and a mandatory flag set to false is stored across four distinct value tables, each enforcing its datatype constraint independently. The enforcement field carries a value of Enforcement 02, and an audit excerpt is recorded as Encoding 01, providing an audit trail that is decoupled from the plan's operational parameters.

**t_indoor_air_quality_action_plan**

| id | indoor_air_quality_action_plan | targets_pollution | verified_by_metric |
| --- | --- | --- | --- |
| PLAN-0001 | HVAC Filter Upgrade Protocol | Carbon Monoxide | Respiratory Infection Incidence |
| PLAN-0002 | HVAC Filter Upgrade Protocol | Asbestos Fibers | Asthma Symptom Frequency |
| PLAN-0003 | Dust Suppression Procedure | Particulate Matter 2.5 | Respiratory Infection Incidence |
| PLAN-0004 | Air Purifier Deployment Plan | Nitrogen Dioxide | Asthma Symptom Frequency |
| PLAN-0005 | HVAC Filter Upgrade Protocol | Particulate Matter 2.5 | FEV1 Improvement Rate |
| PLAN-0006 | Mold Remediation Directive | Formaldehyde | Pulmonary Function Test Delta |
| PLAN-0007 | CO2 Ventilation Schedule | Radon Gas | Sleep Quality Score |

**t_indoor_air_quality_action_plan_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PLAN-0001 | effective_date | xsd:date |
| PLAN-0002 | enforcement | xsd:string |
| PLAN-0003 | mandatory | xsd:boolean |
| PLAN-0004 | priority | xsd:integer |
| PLAN-0005 | review_cycle_days | xsd:integer |
| PLAN-0006 | scope | xsd:string |
| PLAN-0007 | encoding | xsd:string |
| PLAN-0008 | label_text | xsd:string |

**t_indoor_air_quality_action_plan_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0003 | false |
| PLAN-0002 | PLAN-0002 | PLAN-0003 | false |
| PLAN-0003 | PLAN-0003 | PLAN-0003 | true |
| PLAN-0004 | PLAN-0004 | PLAN-0003 | false |
| PLAN-0005 | PLAN-0005 | PLAN-0003 | true |
| PLAN-0006 | PLAN-0006 | PLAN-0003 | false |
| PLAN-0007 | PLAN-0007 | PLAN-0003 | true |

**t_indoor_air_quality_action_plan_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0001 | 2024-08-22 |
| PLAN-0002 | PLAN-0002 | PLAN-0001 | 2025-02-08 |
| PLAN-0003 | PLAN-0003 | PLAN-0001 | 2024-12-25 |
| PLAN-0004 | PLAN-0004 | PLAN-0001 | 2025-01-11 |
| PLAN-0005 | PLAN-0005 | PLAN-0001 | 2023-11-11 |
| PLAN-0006 | PLAN-0006 | PLAN-0001 | 2024-01-21 |
| PLAN-0007 | PLAN-0007 | PLAN-0001 | 2024-08-19 |

**t_indoor_air_quality_action_plan_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0004 | 5 |
| PLAN-0002 | PLAN-0001 | PLAN-0005 | 345 |
| PLAN-0003 | PLAN-0002 | PLAN-0004 | 4 |
| PLAN-0004 | PLAN-0002 | PLAN-0005 | 346 |
| PLAN-0005 | PLAN-0003 | PLAN-0004 | 3 |
| PLAN-0006 | PLAN-0003 | PLAN-0005 | 243 |
| PLAN-0007 | PLAN-0004 | PLAN-0004 | 1 |
| PLAN-0008 | PLAN-0004 | PLAN-0005 | 453 |

**t_indoor_air_quality_action_plan_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0007 | Encoding 01 |
| PLAN-0002 | PLAN-0001 | PLAN-0002 | Enforcement 02 |
| PLAN-0003 | PLAN-0001 | PLAN-0008 | audit excerpt |
| PLAN-0004 | PLAN-0001 | PLAN-0009 | en |
| PLAN-0005 | PLAN-0001 | PLAN-0006 | Scope 05 |
| PLAN-0006 | PLAN-0002 | PLAN-0007 | Encoding 06 |
| PLAN-0007 | PLAN-0002 | PLAN-0002 | Enforcement 07 |
| PLAN-0008 | PLAN-0002 | PLAN-0008 | audit excerpt |

The NIST SP 800-53 high-impact control framework introduces a third governance layer, mapping federal security standards to impact classifications through a role-mediated relationship. Standards including NIST SP 800-171, NIST SP 800-61, Zero Trust Architecture, and NIST SP 800-161 are each assigned an impact level—Moderate, Tier-4, Severity-Medium, or Compliance-Low—and the linkage between a standard and its impact level is mediated by a role column that records whether the standard acts as contributor, reviewer, or observer. The relationship table itself is keyed independently (IMPA-0001 through IMPA-0004) and references both the NIST standard and the impact level by their respective identifiers, enabling a single standard to participate in multiple impact relationships with different roles. For instance, IMPA-0003 appears as both contributor and reviewer across two distinct impact associations, while IMPA-0002 serves as observer against IMPA-0004.

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

Across all three domains—operational observations, indoor air quality plans, and NIST security controls—the same structural pattern recurs: a core entity table defines the primary record, an attribute metadata table declares the schema of associated properties, and a family of typed value tables materializes the data. This normalization strategy ensures type safety, supports schema evolution without DDL migrations, and permits heterogeneous attributes to coexist on the same entity. The foreign-key relationships are explicit and composite: every value row references both the entity it belongs to and the attribute definition it instantiates, creating a graph that can be traversed from observation to policy, from plan to pollution target, or from NIST standard to impact level and its governing role.