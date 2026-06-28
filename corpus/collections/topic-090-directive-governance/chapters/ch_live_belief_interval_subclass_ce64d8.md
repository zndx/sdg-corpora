---
chapter_id: ch_live_belief_interval_subclass_ce64d8
topic_id: 90
family: 06_belief_structure
cited_terms: ['belief_interval_subclass', 'alert_governed_by_runbook', 'policy_supersedes']
model: engine-refine
---

Within the governance ontology, belief intervals and their lower bounds constitute a formal mechanism for expressing confidence in operational assertions. The `t_belief_interval_subclass` table anchors each interval with a unique identifier—`INTE-0001` through `INTE-0004`—and a descriptive belief such as "Sensor calibration drift" or "Model convergence state." These beliefs are not free-floating claims; each is paired with a quantified lower bound stored in `t_belief_interval_subclass_belief_lower_bound`, where values range from "0.85 probability" and "Three sigma limit" to "ISO ninety eight" and "95 percent threshold." The association between beliefs and their lower bounds is mediated by the junction table `t_belief_interval_subclass__belief_lower_bound`, which carries a `role` attribute distinguishing participants as either "contributor" or "owner." This role distinction is critical: it establishes accountability for the confidence thresholds that underpin risk assessments, ensuring that every lower bound can be traced to a responsible party.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

Alerts governed by runbooks form the operational backbone of incident management. The `t_alert_governed_by_runbook` table enumerates concrete alert conditions—"Data Pipeline Stalled," "API Gateway Timeout," "CPU Utilization Critical," "TLS Certificate Expiry"—each identified by a `RUNB-` prefixed code. These alerts are not monolithic; they are decomposed into typed attributes defined in `t_alert_governed_by_runbook_attr`, where `attr_name` captures properties such as `effective_date`, `enforcement`, `mandatory`, and `priority`, and `attr_type` constrains them to XML Schema types including `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`. This type discipline ensures that attribute values are validated at ingestion, preventing semantic drift across the alert lifecycle.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

The typed attribute values are stored in separate tables according to their schema type, a design that enforces data integrity while supporting extensibility. Boolean attributes such as `mandatory` hold values of `true` or `false` across alert entities, with `t_alert_governed_by_runbook_val_boolean` recording that the `mandatory` flag is `true` for certain alerts and `false` for others. Date attributes like `effective_date` carry concrete values such as `2023-06-14`, `2023-01-20`, `2025-03-21`, and `2025-02-03`, establishing temporal boundaries for when alert rules become active or expire. Integer attributes capture quantitative thresholds—values of `3` and `802` for one alert, `2` and `702` for another—while variable-character attributes store freeform text including "Encoding 01," "Enforcement 02," "pre-release note," and locale codes such as "en." The `entity_id` column in each value table links the attribute value back to its governing alert, and the `attr_id` column resolves to the attribute definition, creating a clean separation between schema and instance data.

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

Policy supersession relationships introduce a temporal and hierarchical dimension to the governance framework. The `t_policy_supersedes` table records which policy—such as "Privacy Impact Assessment," "Incident Response Protocol," or "Data Residency Rule"—replaces a prior runbook or policy, identified by the `supersedes` column referencing codes like `RUNB-0006`, `RUNB-0005`, and `RUNB-0004`. Each supersession record carries a `review_cycle_days` value that dictates the cadence of policy review: `262` days for the Privacy Impact Assessment, `131` days for one Incident Response Protocol entry, `716` days for the Data Residency Rule, and `336` days for a second Incident Response Protocol entry. The `language` column, uniformly set to "es" across all four records, indicates the policy's effective language, ensuring that multilingual governance artifacts are properly categorized and routed to the appropriate review stakeholders.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | RUNB-0006 | 262 | es |
| SUPE-0002 | Incident Response Protocol | RUNB-0005 | 131 | es |
| SUPE-0003 | Data Residency Rule | RUNB-0004 | 716 | es |
| SUPE-0004 | Incident Response Protocol | RUNB-0006 | 336 | es |

The foreign-key architecture of this schema reflects a deliberate separation of concerns. The `t_belief_interval_subclass__belief_lower_bound` table links `belief_id` to `belief_lower_bound_id` through a many-to-many relationship, with the `role` column providing the semantic glue that distinguishes ownership from contribution. In the runbook domain, `t_alert_governed_by_runbook_val_boolean`, `t_alert_governed_by_runbook_val_date`, `t_alert_governed_by_runbook_val_int`, and `t_alert_governed_by_runbook_val_varchar` all reference `entity_id` back to `t_alert_governed_by_runbook` and `attr_id` back to `t_alert_governed_by_runbook_attr`, forming a star schema where the runbook is the central fact and the typed value tables are dimension-specific attributes. The `t_policy_supersedes` table similarly references `policy` and `supersedes` as foreign keys, creating a directed acyclic graph of policy evolution that can be traversed to determine the current authoritative version of any governance artifact.

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |