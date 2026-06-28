---
chapter_id: ch_live_marketing_director_role_2938bc
topic_id: 183
family: 08_derived
cited_terms: ['marketing_director_role', 'subclass_to_independent_continuant', 'observation_precedes_other']
model: engine-refine
---

An identifier serves as the immutable primary key that anchors every record across the data model, enabling precise cross-referencing between fact tables and their associated dimensions. In the marketing domain, identifiers such as ROLE-0001 through ROLE-0004 uniquely distinguish individual records within the fact table, while in the infrastructure observability layer, identifiers like CONT-0001 and OTHE-0001 serve the same anchoring function for independent continuants and temporal observation relationships respectively. An entity represents a concrete instance or observable phenomenon within the modeled domain—whether that is a physical or logical asset such as a Firewall Appliance 7 or a Server Rack 14A, or a transient event relationship such as a server_disk_full observation preceding a firmware_update_init. The entity concept bridges the abstract schema structure with the actual objects and events being tracked, and each entity is referenced by foreign keys in value tables that store its attribute data.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

Attributes and their types form the extensible property system that allows entities to carry descriptive metadata without requiring schema modifications for every new property. An attribute is defined by its name—location, name, owner, tags in the infrastructure domain, or duration_seconds, end_time, exit_code, host_name in the observation domain—and its type, which constrains the kind of value it can hold. Attribute types follow a typed schema convention: xsd:string accommodates free-form text such as on-prem-dc1 or node-a01, xsd:decimal captures numeric measurements like 1684.40 or 6255.67, xsd:dateTime records temporal points such as 2023-06-01T02:07:24, xsd:integer stores whole numbers like 701 or 352, and domain-specific types such as cco:Person identify specialized entity references. This typed attribute system is materialized through separate value tables keyed by entity and attribute, ensuring that each entity can carry multiple heterogeneous properties while preserving type safety at query time.

Categories provide the classification layer that groups entities and role holders into meaningful organizational buckets, enabling aggregation and filtering at a semantic level. A role holder—identified by keys such as ROLE-0001 through ROLE-0004 and labeled as Role Holder Label 01 through Role Holder Label 04—is classified into a category such as Role Holder Category 01 or Role Holder Category 02, which determines its functional classification within the governance framework. Similarly, realized-in-activity records carry their own categorical labels—Realized In Activity Category 01 through Realized In Activity Category 04—that describe the nature of the activity in which a role is exercised. These categories function as the primary dimension for reporting and compliance analysis, allowing auditors and operators to slice data by organizational function, activity type, or responsibility domain without relying on raw identifier strings.

**dim_role_holder**

| id | role_holder_label | role_holder_category |
| --- | --- | --- |
| ROLE-0001 | Role Holder Label 01 | Role Holder Category 01 |
| ROLE-0002 | Role Holder Label 02 | Role Holder Category 02 |
| ROLE-0003 | Role Holder Label 03 | Role Holder Category 03 |
| ROLE-0004 | Role Holder Label 04 | Role Holder Category 04 |
| ROLE-0005 | Role Holder Label 05 | Role Holder Category 05 |
| ROLE-0006 | Role Holder Label 06 | Role Holder Category 06 |

**dim_realized_in_activity**

| id | realized_in_activity_label | realized_in_activity_category |
| --- | --- | --- |
| ROLE-0001 | Realized In Activity Label 01 | Realized In Activity Category 01 |
| ROLE-0002 | Realized In Activity Label 02 | Realized In Activity Category 02 |
| ROLE-0003 | Realized In Activity Label 03 | Realized In Activity Category 03 |
| ROLE-0004 | Realized In Activity Label 04 | Realized In Activity Category 04 |
| ROLE-0005 | Realized In Activity Label 05 | Realized In Activity Category 05 |
| ROLE-0006 | Realized In Activity Label 06 | Realized In Activity Category 06 |

The realized-in-activity relationship captures the operational linkage between a role holder and the activity through which that role is exercised, forming the core of the fact table's analytical dimension. Each fact record connects a role holder key—such as ROLE-0002 or ROLE-0005—to a realized-in-activity key like ROLE-0001 or ROLE-0006, establishing the contextual frame for the measured event count. The event count itself is the quantitative measure that records how many discrete events occurred within that role-activity pairing, with values ranging from 18 for a single occurrence to 421 for a high-frequency activity. This structure supports granular compliance reporting: an auditor can trace from a specific event count back through the realized-in-activity dimension to understand which activity generated the volume, and through the role holder dimension to determine which organizational unit was responsible.

**fact_marketing**

| id | role_holder_key | realized_in_activity_key | event_count |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0002 | 18 |
| ROLE-0002 | ROLE-0005 | ROLE-0006 | 204 |
| ROLE-0003 | ROLE-0001 | ROLE-0006 | 421 |
| ROLE-0004 | ROLE-0003 | ROLE-0001 | 153 |
| ROLE-0005 | ROLE-0006 | ROLE-0003 | 434 |
| ROLE-0006 | ROLE-0003 | ROLE-0004 | 256 |
| ROLE-0007 | ROLE-0005 | ROLE-0005 | 457 |

The observation-precedes-other pattern extends the model into temporal reasoning, capturing causal and sequential relationships between observable events. An observation such as server_disk_full or packet_drop_event is recorded as preceding another event like firmware_update_init, system_boot_sequence, or power_stabilization, creating a directed graph of event dependencies. Each observation relationship carries its own set of typed attributes—duration_seconds measured as 601.58 or 5555.66, exit_code values like 884 or 291, host_name identifiers such as node-a01, and status indicators like execution or pending—allowing the temporal relationship to be enriched with operational context. This pattern supports root-cause analysis and compliance auditing by preserving the chronological and causal structure of incident response workflows, where understanding what preceded what is as important as counting how many times it occurred.

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |