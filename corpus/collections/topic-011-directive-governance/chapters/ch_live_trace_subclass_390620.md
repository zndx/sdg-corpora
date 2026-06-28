---
chapter_id: ch_live_trace_subclass_390620
topic_id: 11
family: 02_observation_measurement
cited_terms: ['trace_subclass', 'requirement_has_priority', 'insertion_loss_specification']
model: engine-refine
---

Trace identifiers serve as the primary keys for operational telemetry, anchoring each recorded execution to a unique reference such as TRAC-0001 through TRAC-0004. Within each trace, the spans_key column establishes the lineage of individual span segments, linking back to parent span definitions catalogued in the dimension tables. The dim_spans table associates each span with a human-readable label—Spans Label 01, Spans Label 02, and so forth—while simultaneously classifying it under a spans_category such as Spans Category 01 through Spans Category 04. These categories are further refined through the dim_spans_category table, where each identifier maps to a category_name like Category Name 01 through Category Name 04, enabling hierarchical aggregation of trace data by functional domain. The category_id column in dim_spans provides the foreign-key bridge to this classification layer, ensuring that every span carries its categorical context at the point of measurement.

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

Duration and exit semantics form the core quantitative dimensions of the fact_trace table. The duration_seconds column records elapsed time in fractional seconds, with observed values ranging from 1874.27 seconds for TRAC-0001 to 3940.66 seconds for TRAC-0003, reflecting the wide variance in execution lifetimes across different trace instances. The exit_code column captures the terminal status of each trace, with values such as 491, 900, 420, and 60 indicating distinct completion states that may correspond to application-level error codes or protocol-level termination signals. The retry_count column quantifies the number of re-attempts made during trace execution, with figures of 399, 179, 396, and 459 revealing substantial retry activity that directly impacts both duration and resource consumption. Together, these columns provide a complete picture of trace lifecycle: how long an operation persisted, how many times it was retried, and what final state it reached.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

The attribute-value architecture underlying requirement specifications and insertion loss specifications follows a normalized pattern that separates schema from instance data. The t_requirement_has_priority table defines requirements such as Latency threshold, Backup interval, Throughput minimum, and Audit log frequency, each assigned a priority level of Trivial, Medium, or Critical. The t_requirement_has_priority_attr table declares the attribute schema for these requirements, specifying attr_name values like effective_date, enforcement, mandatory, and priority alongside their corresponding attr_type values—xsd:date, xsd:string, xsd:boolean, and xsd:integer—which enforce type discipline at the schema level. Instance values are stored in dedicated type-specific tables: t_requirement_has_priority_val_boolean holds boolean assignments such as false across multiple entities, t_requirement_has_priority_val_date stores date values including 2023-09-07 and 2024-08-03, t_requirement_has_priority_val_int captures integer measurements like 3, 56, 2, and 806, and t_requirement_has_priority_val_varchar accommodates free-text values such as Encoding 01, Enforcement 02, intake form, and ja. The entity_id column in each value table serves as the foreign key linking attribute instances back to their parent requirement, while attr_id references the specific attribute definition.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | Trivial |
| PRIO-0002 | Backup interval | Medium |
| PRIO-0003 | Throughput minimum | Critical |
| PRIO-0004 | Audit log frequency | Critical |
| PRIO-0005 | Throughput minimum | Minor |
| PRIO-0006 | Encryption standard | Trivial |
| PRIO-0007 | Throughput minimum | Major |
| PRIO-0008 | Fault tolerance level | Essential |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

**t_insertion_loss_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | intake form |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | fr |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | ratio |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

The insertion loss specification domain mirrors this attribute-value pattern but applies it to physical-layer technical parameters. The t_insertion_loss_specification table defines specifications including Connector-Loss-Baseline, Filter-Insertion-Depth, and Transceiver-Margin-Spec, each identified by a SPEC- prefixed identifier. The t_insertion_loss_specification_attr table declares attributes such as confidence, dimension_kind, method, and recorded_at, with attr_type values of xsd:decimal, xsd:string, and xsd:dateTime establishing the expected data format for each. Decimal values are stored in t_insertion_loss_specification_val_decimal, where measurements like 0.131, 129.10, 470.08, and 0.111 represent precise loss or margin figures. DateTime values in t_insertion_loss_specification_val_datetime record timestamps such as 2024-12-28T03:34:41 and 2023-07-30T00:55:27, providing temporal provenance for each specification entry. String values in t_insertion_loss_specification_val_varchar include Dimension Kind 01, Encoding 02, intake form, and fr, capturing descriptive metadata that does not fit numeric or temporal types. This separation of attribute definitions from their typed values enables flexible schema evolution without requiring structural changes to the underlying storage layer.

**t_insertion_loss_specification**

| id | insertion_loss_specification |
| --- | --- |
| SPEC-0001 | Connector-Loss-Baseline |
| SPEC-0002 | Connector-Loss-Baseline |
| SPEC-0003 | Filter-Insertion-Depth |
| SPEC-0004 | Transceiver-Margin-Spec |
| SPEC-0005 | Antenna-Feed-Loss |
| SPEC-0006 | Optic-Coupler-Loss |

**t_insertion_loss_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_insertion_loss_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-12-28T03:34:41 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-07-30T00:55:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-10-08T23:01:51 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2024-02-08T16:58:47 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-02-29T05:58:20 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-21T07:18:41 |

**t_insertion_loss_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.131 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 129.10 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 470.08 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.111 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 499.91 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 156.27 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.125 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 625.08 |