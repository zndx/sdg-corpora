---
chapter_id: ch_live_syscall_at_security_tier_7b848e
topic_id: 138
family: 04_ebpf_kernel
cited_terms: ['syscall_at_security_tier', 'state_observed_at_time', 'pignistic_transformation']
model: engine-refine
---

Security tier classification serves as the primary axis for organizing and auditing system call activity across monitored environments. Each tier is assigned a unique identifier—`TIER-0001` through `TIER-0004` in the reference corpus—and is further characterized by a human-readable label such as *At Security Tier Label 01* and a categorical grouping like *At Security Tier Category 01*. The dimension table `dim_at_security_tier` anchors these descriptors, while the fact table `fact_syscall` links individual syscall records to their corresponding tier via the foreign key `at_security_tier_key`. This linkage enables aggregation of event counts per tier; for instance, `TIER-0004` accounts for 382 events, whereas `TIER-0002` records only 52, revealing a distribution that may reflect differing exposure levels or monitoring granularity across security boundaries. The `event_count` column thus functions as a quantitative proxy for activity volume, supporting capacity planning and anomaly detection at the tier level.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

State observations are captured as time-bound records in `t_state_observed_at_time`, where each observation carries an identifier such as `TIME-0001` and a discrete state value—`offline`, `calibrated`, or `idle`—alongside a temporal reference (`observed_at`) that points to a transformation record like `TRAN-0001`. The attribute metadata table `t_state_observed_at_time_attr` defines the schema for observation properties, assigning each attribute a name (e.g., *confidence*, *dimension_kind*, *method*, *recorded_at*) and a type from the XSD namespace: `xsd:decimal` for numeric measures, `xsd:string` for categorical descriptors, and `xsd:dateTime` for temporal stamps. This type discipline is enforced through three value tables—`t_state_observed_at_time_val_decimal`, `t_state_observed_at_time_val_varchar`, and `t_state_observed_at_time_val_datetime`—each storing values for a specific type. A single entity, identified by `entity_id`, may thus carry heterogeneous attributes: `TIME-0001` holds a decimal confidence of 0.673, a string dimension kind of *Dimension Kind 01*, and a recorded-at timestamp of `2023-08-28T00:49:09`, all resolved through the shared `attr_id` foreign key to the attribute definition table.

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | TRAN-0001 |
| TIME-0002 | calibrated | TRAN-0007 |
| TIME-0003 | idle | TRAN-0008 |
| TIME-0004 | calibrated | TRAN-0005 |
| TIME-0005 | idle | TRAN-0003 |
| TIME-0006 | draining | TRAN-0006 |
| TIME-0007 | idle | TRAN-0001 |
| TIME-0008 | locked | TRAN-0003 |

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

The pignistic transformation subsystem models belief-state transformations used in evidence reasoning and diagnostic inference. The table `t_pignistic_transformation` stores transformation inputs—identified by keys such as `TRAN-0001` and described by values like *diagnostic confidence matrix* or *telemetry belief assignment*—while `t_pignistic_transformation_pignistic_transform` holds the corresponding outputs, including *pignistic probability distribution* and *transformed belief state*. The junction table `t_pignistic_transformation__pignistic_transform` binds these two entities through a subject-target relationship: the `pignistic_id` column (subject) references the input transformation, and the `pignistic_transform_id` column (target) references the output transformation. A `role` column on this junction table assigns a functional designation to each link, with values such as *reviewer* and *contributor* indicating whether the subject transformation reviews the target or contributes to its derivation. For example, `TRAN-0008` assumes the role of *reviewer* over `TRAN-0005`, while `TRAN-0005` serves as a *contributor* to `TRAN-0002`, establishing a directed graph of transformation dependencies that can be traversed for provenance tracking and auditability.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |