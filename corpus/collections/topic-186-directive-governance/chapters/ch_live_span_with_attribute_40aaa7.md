---
chapter_id: ch_live_span_with_attribute_40aaa7
topic_id: 186
family: 07_long_tail
cited_terms: ['span_with_attribute', 'column_value_distribution', 'trace_has_resource']
model: engine-refine
---

Span attributes serve as the primary mechanism for annotating distributed operations with structured, queryable metadata. Each attribute is identified by a unique key—such as ATTR-0001 through ATTR-0004—and classified into a category that governs its semantic meaning, ranging from Span Attribute Category 01 to Span Attribute Category 04. These categories enable systematic organization of telemetry data, allowing downstream systems to apply category-specific processing, filtering, or alerting logic. The attributes themselves are not merely labels; they carry typed values that reflect the state and behavior of the operations they describe. For instance, a span annotated with key ATTR-0002 may record a duration of 410.92 seconds and an exit code of 893, while another span keyed by ATTR-0004 might show a duration of 3549.11 seconds with an exit code of 599 and a retry count of 428. The exit code captures the termination status of the operation, and the retry count quantifies how many times the system attempted to complete it before reaching that final state.

The typed value system underpinning span attributes ensures that every annotation is stored in a format appropriate to its semantics. Attributes are declared with explicit types—xsd:decimal for numeric measurements like duration_seconds (6459.38, 3107.88, 4594.49, 2602.26), xsd:dateTime for temporal markers such as 2024-06-04T06:37:56 or 2024-12-02T12:01:14, xsd:integer for whole-number counters including exit codes and retry counts (866, 141, 185, 294), and xsd:string for free-form identifiers like host names (node-b14) or status labels (closeout, running). This type discipline prevents semantic drift and guarantees that comparisons, aggregations, and threshold checks operate on correctly typed data. An attribute such as duration_seconds, typed as xsd:decimal, can be summed across spans to compute total processing time, while an attribute like exit_code, typed as xsd:integer, supports exact-match lookups for specific failure modes.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

Trace-resource associations form the operational context in which these attributes are evaluated. A trace—identified by names such as batch-etl-nightly, lab-assay-protocol-2b, or governance-audit-cycle-9—represents a logical unit of work that may be associated with one or more resources. Each association carries its own set of attributes, and the entity field links a specific attribute value to a particular trace-resource pair. For example, the trace lab-assay-protocol-2b appears in multiple associations (RESO-0002 and RESO-0003), each with distinct resource bindings (DIST-0005 and DIST-0001 respectively) and distinct attribute values. The entity identifier acts as the join key that binds a typed value back to its originating context, ensuring that a duration of 4594.49 recorded under entity RESO-0003 can be unambiguously traced to the governance-audit-cycle-9 trace and its associated resource.

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | DIST-0005 |
| RESO-0002 | lab-assay-protocol-2b | DIST-0005 |
| RESO-0003 | governance-audit-cycle-9 | DIST-0005 |
| RESO-0004 | lab-assay-protocol-2b | DIST-0001 |
| RESO-0005 | ml-training-run-aurora | DIST-0001 |
| RESO-0006 | governance-audit-cycle-9 | DIST-0005 |
| RESO-0007 | lab-assay-protocol-2b | DIST-0006 |
| RESO-0008 | api-gateway-chain-alpha | DIST-0001 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

The role field introduces a governance layer that defines the function of each component within the value distribution ecosystem. In the mapping between columns and their statistical distributions, roles such as contributor and reviewer distinguish between entities that supply raw data and those that validate or audit it. The column request_count, for instance, is associated with a pareto_shape distribution and has contributor and reviewer roles assigned across different distribution mappings, while device_serial is linked to a uniform_range distribution with a contributor role. This role-based separation of concerns ensures that data lineage is auditable: a contributor populates the distribution parameters, and a reviewer confirms their appropriateness, creating a chain of accountability that is essential for compliance frameworks governing data quality and regulatory reporting.

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

Together, these constructs—span attributes with their typed values, trace-resource associations with entity bindings, and role-based governance mappings—form a cohesive observability and compliance infrastructure. The identifier field provides the unique key that threads through every layer, from the span-level metric (ATTR-0001) to the trace-resource association (RESO-0001) to the distribution mapping (DIST-0001). The misc field captures free-form metadata such as Span Attribute Label 01 through 04, providing human-readable descriptions that complement the structured categorization. Duration seconds and retry counts quantify operational performance, exit codes capture termination semantics, and the combination of all these fields enables precise root-cause analysis, SLA monitoring, and regulatory audit trails.

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |