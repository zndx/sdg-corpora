---
chapter_id: ch_live_belief_function_for_fd1db9
topic_id: 181
family: 07_long_tail
cited_terms: ['belief_function_for', 'column_property_subclass', 'process_either_started_or_completed']
model: engine-refine
---

In governance and compliance architectures, the ability to attach structured metadata to any entity—whether a process, a data column, or a belief assertion—requires a disciplined separation between what an entity is, what properties it carries, and what values those properties hold. The system achieves this through a tripartite decomposition: entities are identified by stable identifiers such as `FUNC-0001` or `COMP-0001`; attributes are declared independently with a name and a type, for instance `confidence` typed as `xsd:decimal` or `end_time` typed as `xsd:dateTime`; and values are stored in type-specific value tables that reference both the entity and the attribute. This separation ensures that adding a new property never requires a schema migration, and that type safety is enforced at query time by routing lookups through the appropriate value table—`t_column_property_subclass_val_decimal` for numeric measures, `t_column_property_subclass_val_datetime` for timestamps, and `t_column_property_subclass_val_varchar` for free-form text.

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | iot_gateway |
| PROP-0002 | device_serial | lab_assay |
| PROP-0003 | request_payload | sensor_array |
| PROP-0004 | event_code | clinical_trials |
| PROP-0005 | batch_id | lab_assay |
| PROP-0006 | batch_id | clinical_trials |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

**t_process_either_started_or_completed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMP-0001 | duration_seconds | xsd:decimal |
| COMP-0002 | end_time | xsd:dateTime |
| COMP-0003 | exit_code | xsd:integer |
| COMP-0004 | host_name | xsd:string |
| COMP-0005 | log_level | xsd:string |
| COMP-0006 | phase | xsd:string |
| COMP-0007 | retry_count | xsd:integer |
| COMP-0008 | scheduled_at | xsd:dateTime |

**t_process_either_started_or_completed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0002 | 2023-09-15T18:52:08 |
| COMP-0002 | COMP-0001 | COMP-0008 | 2024-08-13T16:34:41 |
| COMP-0003 | COMP-0001 | COMP-0009 | 2025-03-15T23:53:33 |
| COMP-0004 | COMP-0002 | COMP-0002 | 2025-06-15T09:08:30 |
| COMP-0005 | COMP-0002 | COMP-0008 | 2025-01-13T18:32:01 |
| COMP-0006 | COMP-0002 | COMP-0009 | 2023-05-31T03:15:32 |
| COMP-0007 | COMP-0003 | COMP-0002 | 2024-08-17T22:03:21 |
| COMP-0008 | COMP-0003 | COMP-0008 | 2023-03-17T02:37:48 |

**t_process_either_started_or_completed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0001 | 992.92 |
| COMP-0002 | COMP-0002 | COMP-0001 | 6910.53 |
| COMP-0003 | COMP-0003 | COMP-0001 | 4781.54 |
| COMP-0004 | COMP-0004 | COMP-0001 | 3156.19 |
| COMP-0005 | COMP-0005 | COMP-0001 | 593.89 |
| COMP-0006 | COMP-0006 | COMP-0001 | 5472.77 |

**t_process_either_started_or_completed_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0003 | 522 |
| COMP-0002 | COMP-0001 | COMP-0007 | 9 |
| COMP-0003 | COMP-0002 | COMP-0003 | 153 |
| COMP-0004 | COMP-0002 | COMP-0007 | 96 |
| COMP-0005 | COMP-0003 | COMP-0003 | 508 |
| COMP-0006 | COMP-0003 | COMP-0007 | 474 |
| COMP-0007 | COMP-0004 | COMP-0003 | 5 |
| COMP-0008 | COMP-0004 | COMP-0007 | 25 |

**t_process_either_started_or_completed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0004 | node-a01 |
| COMP-0002 | COMP-0001 | COMP-0005 | Log Level 02 |
| COMP-0003 | COMP-0001 | COMP-0006 | initiation |
| COMP-0004 | COMP-0001 | COMP-0010 | running |
| COMP-0005 | COMP-0001 | COMP-0011 | Triggered By 05 |
| COMP-0006 | COMP-0002 | COMP-0004 | ingest-21 |
| COMP-0007 | COMP-0002 | COMP-0005 | Log Level 07 |
| COMP-0008 | COMP-0002 | COMP-0006 | review |

The attribute definition layer is where the schema of metadata itself lives. In the column property domain, `t_column_property_subclass_attr` declares attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XML Schema type like `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. Similarly, the process domain defines attributes including `duration_seconds`, `exit_code`, `host_name`, and `end_time` with corresponding types `xsd:decimal`, `xsd:integer`, `xsd:string`, and `xsd:dateTime`. These definitions are not tied to any single entity; rather, they form a shared vocabulary that any entity can draw from. A column annotated as `iot_gateway` can carry a `confidence` value of `0.502`, while a process such as `Microtome sectioning` can carry a `duration_seconds` of `992.92` and an `exit_code` of `522`. The same attribute name may appear across domains, but its meaning is contextualized by the entity it annotates and the type declared in the attribute definition.

Value storage follows a vertical partitioning strategy: each attribute type has its own value table, and every row in a value table is a triple of entity identifier, attribute identifier, and the value itself. For example, the datetime attribute `recorded_at` (attribute identifier `PROP-0004`) is populated across entities `PROP-0001` through `PROP-0004` with values ranging from `2023-02-03T11:52:35` to `2024-11-24T00:57:54`. The decimal attribute `confidence` (identifier `PROP-0001`) appears on entity `PROP-0001` with a value of `0.032` and on entity `PROP-0002` with a value of `0.502`, while the varchar attribute `dimension_kind` (identifier `PROP-0002`) carries the value `Dimension Kind 01` on entity `PROP-0001`. This design means that querying for all decimal-valued attributes of a given entity is a single-table scan, and that type coercion is implicit in the table choice.

Beyond simple attribute-value pairs, the system models relationships between entities through a subject-target-role pattern. The association table `t_belief_function_for__belief_for_claim` links belief functions to belief-for-claim entities by storing a `belief_id` as the subject, a `belief_for_claim_id` as the target, and a `role` that describes the nature of the link. A belief function identified as `FUNC-0001` (whose belief text is "Data quality baseline") may serve as the `owner` of a belief-for-claim identified as `FUNC-0007` (whose claim text is "API response latency"), while a different belief function `FUNC-0006` may act as an `observer` of claim `FUNC-0005`. The role column—taking values such as `owner`, `observer`, and `contributor`—provides the semantic glue that turns a bare foreign-key pair into a governed relationship, enabling audit trails that answer not just which entities are connected but in what capacity.

The practical effect of this architecture is a metadata layer that is simultaneously rigid and extensible. Identifiers provide referential integrity across all tables; attributes and their types define a controlled vocabulary; value tables enforce type discipline without schema changes; and the subject-target-role association pattern captures the governance semantics of how entities relate to one another. When a process like `Reactor startup sequence` (identifier `COMP-0003`) is recorded with a `duration_seconds` of `4781.54`, a `host_name` of `node-a01`, and an `end_time` of `2025-03-15T23:53:33`, the system has captured a complete, queryable, and auditable fact. When a belief function asserts that "Data quality score below baseline" is linked to the claim "Compute node availability compromised" in the capacity of `owner`, the system has captured a governance decision. Both are expressed through the same underlying primitives—entity, attribute, value, and role—making the entire metadata fabric uniform, traceable, and compliant by design.

**t_belief_function_for**

| id | belief |
| --- | --- |
| FUNC-0001 | Data quality baseline |
| FUNC-0002 | Data quality score below baseline |
| FUNC-0003 | Data quality baseline |
| FUNC-0004 | Storage volume capacity critical |
| FUNC-0005 | Model convergence failure observed |
| FUNC-0006 | Storage volume utilization |

**t_belief_function_for_belief_for_claim**

| id | belief_for_claim |
| --- | --- |
| FUNC-0001 | API response latency |
| FUNC-0002 | Compute node availability compromised |
| FUNC-0003 | Data pipeline throughput |
| FUNC-0004 | Authentication service unresponsive |
| FUNC-0005 | Network topology state |
| FUNC-0006 | Data pipeline throughput degraded |
| FUNC-0007 | Compliance audit status |

**t_belief_function_for__belief_for_claim**

| id | belief_id | belief_for_claim_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0007 | owner |
| FUNC-0002 | FUNC-0006 | FUNC-0005 | observer |
| FUNC-0003 | FUNC-0004 | FUNC-0001 | owner |
| FUNC-0004 | FUNC-0005 | FUNC-0003 | contributor |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | observer |
| FUNC-0006 | FUNC-0005 | FUNC-0007 | owner |
| FUNC-0007 | FUNC-0006 | FUNC-0007 | reviewer |
| FUNC-0008 | FUNC-0004 | FUNC-0007 | owner |