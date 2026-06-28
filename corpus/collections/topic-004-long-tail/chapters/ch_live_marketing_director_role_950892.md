---
chapter_id: ch_live_marketing_director_role_950892
topic_id: 4
family: 08_derived
cited_terms: ['marketing_director_role', 'profile_over_time_window', 'trace_basic']
model: engine-refine
---

An identifier is the immutable key that anchors every record in a governed data model, ensuring that each entity can be referenced unambiguously across fact and dimension tables. In the marketing domain, identifiers such as ROLE-0001 through ROLE-0004 uniquely distinguish individual role holders, while WIND-0001 through WIND-0004 serve the same purpose for time-windowed profile observations. Trace records follow the same convention, with TRAC-0001 through TRAC-0004 identifying distinct operational events. These identifiers are not merely labels; they are the join keys that bind fact tables to their descriptive dimensions, enabling consistent aggregation and filtering across the entire analytical layer.

**fact_profile**

| id | over_time_window_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WIND-0001 | WIND-0005 | 0.299 | 284.36 | 728.94 |
| WIND-0002 | WIND-0007 | 0.994 | 557.92 | 380.57 |
| WIND-0003 | WIND-0004 | 0.773 | 622.09 | 607.36 |
| WIND-0004 | WIND-0007 | 0.226 | 488.10 | 448.09 |

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | monitoring-ingester |
| TRAC-0002 | frontend-render-loop | on-prem-rack-12 |
| TRAC-0003 | message-broker-poll | eu-west-2-staging |
| TRAC-0004 | worker-task-execution | sensor-array-7 |
| TRAC-0005 | cache-hit-miss-run | monitoring-ingester |
| TRAC-0006 | message-broker-poll | lab-bench-4a |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

An attribute is a named property that describes a measurable or categorical characteristic of an entity, and its type constrains the kind of value it can hold. In the trace data model, attributes such as duration_seconds, end_time, exit_code, and host_name are declared with explicit types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—ensuring that downstream consumers apply correct parsing, validation, and arithmetic operations. This type discipline is critical: a duration of 1505.64 seconds is treated as a numeric measure suitable for averaging, while a value like node-b14 or the string complete is handled as free-form text. The separation of attribute definitions from their values allows the schema to evolve independently; new attributes can be introduced without altering the structure of the value tables that store them.

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

A category provides a classification layer that groups entities or attributes into meaningful buckets for reporting and access control. Role holders are classified under categories such as Role Holder Category 01 through 04, and realized activities carry their own classification scheme—Realized In Activity Category 01 through 04. Time windows are similarly categorized, with entries like Over Time Window Category 01 and Over Time Window Category 02, and these categories are further refined through a dedicated dimension table that maps each category identifier to a human-readable name such as Category Name 01. Categories enable roll-up queries, dashboard filters, and policy rules that apply uniformly across all members of a group, regardless of the underlying identifier.

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

**dim_over_time_window_category**

| id | category_name |
| --- | --- |
| WIND-0001 | Category Name 01 |
| WIND-0002 | Category Name 02 |
| WIND-0003 | Category Name 03 |
| WIND-0004 | Category Name 04 |
| WIND-0005 | Category Name 05 |
| WIND-0006 | Category Name 06 |
| WIND-0007 | Category Name 07 |
| WIND-0008 | Category Name 08 |

**dim_over_time_window**

| id | over_time_window_label | over_time_window_category | category_id |
| --- | --- | --- | --- |
| WIND-0001 | Over Time Window Label 01 | Over Time Window Category 01 | WIND-0008 |
| WIND-0002 | Over Time Window Label 02 | Over Time Window Category 02 | WIND-0004 |
| WIND-0003 | Over Time Window Label 03 | Over Time Window Category 03 | WIND-0008 |
| WIND-0004 | Over Time Window Label 04 | Over Time Window Category 04 | WIND-0004 |
| WIND-0005 | Over Time Window Label 05 | Over Time Window Category 05 | WIND-0005 |
| WIND-0006 | Over Time Window Label 06 | Over Time Window Category 06 | WIND-0002 |
| WIND-0007 | Over Time Window Label 07 | Over Time Window Category 07 | WIND-0006 |

Confidence and uncertainty quantify the reliability of a measured or estimated value, and together they form a risk-aware reporting framework. In the profile fact table, each observation carries a confidence score ranging from 0.226 to 0.994 alongside an uncertainty magnitude expressed as an absolute value—284.36, 557.92, 622.09, or 488.10. A confidence of 0.994 paired with an uncertainty of 557.92 signals a high-certainty measurement with a wide absolute range, while a confidence of 0.226 with an uncertainty of 488.10 indicates a low-confidence estimate whose absolute error is still substantial. These paired metrics allow downstream consumers to weight results appropriately, flag entries that fall below a trust threshold, and communicate the degree of certainty to stakeholders who rely on the data for decision-making.

An entity is the real-world object or concept that a fact record describes, and it is linked to its attributes through foreign keys. In the trace value tables, the entity_id column references the primary key of the trace record, while the attr_id column references the attribute definition, creating a flexible entity-attribute-value structure that supports an arbitrary number of attributes per entity. For example, trace TRAC-0001 has a duration_seconds value of 1505.64, an end_time of 2023-04-16T02:44:01, an exit_code of 376, and a host_name of node-b14, each stored in its appropriately typed value table. This design avoids the rigidity of a fixed-column schema and allows new attributes to be added without schema migrations.

An event count captures the frequency of occurrences within a fact record, serving as a basic aggregation primitive. In the marketing fact table, event counts of 18, 204, 421, and 153 represent the number of marketing events attributed to specific role-holder and activity combinations. A realized-in-activity key ties each fact row to a particular operational activity, while a role-holder key identifies the person or system responsible. The over-time-window key in the profile fact table similarly anchors observations to a temporal bucket, enabling time-series analysis and trend detection. Together, these keys and counts form the backbone of a dimensional model that supports both drill-down investigation and high-level summary reporting.

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