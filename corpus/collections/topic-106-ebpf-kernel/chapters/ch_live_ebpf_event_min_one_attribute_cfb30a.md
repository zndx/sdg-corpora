---
chapter_id: ch_live_ebpf_event_min_one_attribute_cfb30a
topic_id: 106
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'allocation_at_run_id', 'column_property_subclass']
model: engine-refine
---

An attribute-value architecture decomposes heterogeneous metadata into a normalized schema where each attribute carries a declared type, each entity carries a set of typed values, and the linkage between them is mediated by explicit foreign-key relationships. In the event-tracking subsystem, identifiers such as `ATTR-0001` through `ATTR-0004` serve as stable keys into the attribute catalogue, where each key maps to a concrete eBPF event classification—`perf_event_sample`, `xdp_rx_drop`, `tc_ingress_filter`—and to a schema definition comprising an attribute name and an XML Schema datatype. The attribute `duration_seconds` is typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`; this type declaration is not merely documentation but a structural constraint that governs which value table may hold a given attribute's data. The separation of value storage by type—`val_decimal`, `val_datetime`, `val_int`, `val_varchar`—ensures that queries on `duration_seconds` resolve to numeric predicates on `2938.76`, `3337.03`, `6550.82`, `5328.03`, while temporal lookups on `end_time` resolve to ISO-8601 literals such as `2024-05-05T15:51:23` or `2023-02-23T16:05:24`, and string attributes like `host_name` resolve to values such as `node-b14`.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

The entity column in each value table is the foreign key that binds a concrete data point to its attribute definition; it is the relational glue that transforms a schema catalogue into an extensible property store. An entity identifier such as `ATTR-0001` may appear across multiple value tables, each time paired with a different `attr_id` to express a distinct property of the same underlying entity. The `attr_id` column, in turn, references the attribute catalogue and determines the datatype of the `value` column in which the datum is stored. This three-way linkage—entity to attribute, attribute to type, type to value table—creates a query path that is uniform in structure but polymorphic in execution: the same entity identifier can yield a decimal, a datetime, an integer, and a string, each drawn from a different table, each constrained by the attribute's declared type. The design supports open-ended extension without schema migration; adding a new attribute requires only an insertion into the attribute catalogue and the creation of a corresponding row in the appropriate value table.

A parallel structure governs the allocation-to-run-identifier relationship, where identifiers such as `RUN-0001` through `RUN-0004` serve as stable keys into the allocation catalogue, mapping to operational designations like `batch-etl-override`, `model-training-v3`, `data-sync-nightly`, and `ml-inference-run`. The run identifiers—`exec-token-4491`, `job-context-99a`, `tx-id-7721b`, `run-7a2b4c1d`—are stored in a separate catalogue and linked to allocations through a junction table that introduces the concept of role. In this junction table, the `allocation_id` column functions as the subject of the relationship, the `at_run_identifier_id` column functions as the target, and the `role` column—taking values such as `observer` or `reviewer`—qualifies the nature of the association. This subject-target-role triplet is a standard pattern in access-control and provenance models: it encodes not merely that an allocation is associated with a run identifier, but that it plays a specific functional role in that association. The same allocation identifier may appear with different roles across different run identifiers, and the same run identifier may be associated with multiple allocations, each under a distinct role.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | batch-etl-override |
| RUN-0002 | model-training-v3 |
| RUN-0003 | data-sync-nightly |
| RUN-0004 | ml-inference-run |
| RUN-0005 | ml-inference-run |
| RUN-0006 | batch-etl-override |
| RUN-0007 | ml-inference-run |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | exec-token-4491 |
| RUN-0002 | job-context-99a |
| RUN-0003 | tx-id-7721b |
| RUN-0004 | run-7a2b4c1d |
| RUN-0005 | run-hash-66d |
| RUN-0006 | epoch-tag-8812 |
| RUN-0007 | pipeline-run-zeta |
| RUN-0008 | job-context-99a |

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |

The column-property subclass structure extends the attribute-value pattern to a domain where database columns themselves are treated as first-class entities with properties. The `column` column identifies a source column—`user_agent`, `device_serial`, `request_payload`, `event_code`—while the `annotates_property_of` column references an attribute identifier, establishing that the column carries metadata about that attribute. The attribute catalogue for this subclass defines properties such as `confidence` (typed `xsd:decimal`), `dimension_kind` (typed `xsd:string`), `method` (typed `xsd:string`), and `recorded_at` (typed `xsd:dateTime`), each of which is stored in the corresponding value table. Decimal values for `confidence` include `0.032` and `0.502`; datetime values for `recorded_at` include `2023-02-03T11:52:35` and `2024-11-24T00:57:54`; string values for `dimension_kind` include `Dimension Kind 01` and `Encoding 02`. The same entity-attr-value linkage pattern applies: the entity identifier in each value table references the column-property subclass record, and the `attr_id` references the attribute definition, ensuring that every datum is traceable to both its source column and its semantic definition.

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | ATTR-0003 |
| PROP-0002 | device_serial | ATTR-0002 |
| PROP-0003 | request_payload | ATTR-0003 |
| PROP-0004 | event_code | ATTR-0006 |
| PROP-0005 | batch_id | ATTR-0006 |
| PROP-0006 | batch_id | ATTR-0002 |

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

Across all three subsystems—the eBPF event attributes, the allocation-run identifiers, and the column-property subclass—the same relational primitives recur: a stable identifier anchors each catalogue entry, a type declaration constrains value storage, an entity column binds data points to their definitions, and a junction table with subject, target, and role columns encodes qualified associations. The `misc` column in each value table is the carrier of the actual datum, its meaning determined entirely by the type of the attribute it is paired with. This uniformity of structure across heterogeneous domains is the defining characteristic of the architecture: it allows a single query engine to navigate from entity to attribute to value regardless of whether the underlying data represents network packet drops, job allocation roles, or column-level confidence scores. The foreign-key relationships between entity and attr, between subject and target, and between column and annotates_property_of form a graph that is navigable in both directions, supporting both property-based lookups and relationship-based traversals within a single relational model.

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

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