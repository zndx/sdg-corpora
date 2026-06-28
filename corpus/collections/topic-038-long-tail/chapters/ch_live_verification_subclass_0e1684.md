---
chapter_id: ch_live_verification_subclass_0e1684
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'span_with_attribute', 'measurement_with_method']
model: engine-refine
---

Verification subclasses constitute the foundational classification layer for audit and compliance activities, each identified by a stable surrogate key such as VERI-0001 through VERI-0004 and assigned a descriptive designation—Compliance renewal verification, GDPR data flow review, Security posture assessment—that determines the scope and regulatory context of the underlying assessment. These subclasses serve as the primary entity to which heterogeneous telemetry attributes are bound, enabling a single verification record to carry temporal, numeric, and categorical metadata without requiring a rigid schema. The attribute taxonomy is itself parameterized: each attribute definition carries a name and an XML Schema datatype constraint, so that duration_seconds is governed by xsd:decimal, end_time by xsd:dateTime, exit_code by xsd:integer, and host_name by xsd:string, thereby enforcing type discipline at the schema level before any value is materialized.

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

Value materialization occurs through a family of type-specific fact tables that link attribute definitions back to their parent verification subclass via the entity_id foreign key, preserving referential integrity while allowing sparse attribute coverage. A single verification such as VERI-0001 may simultaneously reference a decimal measurement of 5469.69, a timestamp of 2024-10-23T14:58:17, an integer exit code of 616, and a string-valued host identifier of node-a01, each stored in its respective typed repository. The integer-valued attributes capture discrete operational signals—exit codes of 616 and 105 for VERI-0001, 713 and 29 for VERI-0002—while the varchar repository carries free-form descriptors such as Log Level 02, review, and running, enabling human-readable state annotations alongside machine-parsable numerics. This separation of concerns by datatype eliminates null proliferation and permits optimized storage and query paths for each value class.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

Span-level telemetry is captured in a parallel fact structure that records the duration_seconds, exit_code, and retry_count of individual execution spans, each keyed to a span_attribute_key that references a dimensional catalog of attribute metadata. The duration_seconds column quantifies wall-clock elapsed time with decimal precision—4963.54, 410.92, 3549.11, and 1972.36 seconds across the observed spans—while exit_code and retry_count encode discrete operational outcomes and recovery attempts, with retry counts ranging from 29 to 494 and exit codes from 91 to 893. The span_attribute_key column functions as a join handle to the span attribute dimension, where each attribute is assigned a human-readable label such as Span Attribute Label 01 and a categorical classification like Span Attribute Category 01, enabling downstream aggregation and filtering by semantic group rather than by opaque identifier.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |

Measurement records introduce a third analytical axis, coupling a measured value with an associated confidence score and an uncertainty bound, both of which are essential for risk-weighted decision making. The confidence column carries a unit-interval probability estimate—0.496, 0.945, 0.506, 0.307—indicating the degree of assurance in the corresponding measurement value, which itself spans from 64.10 to 878.99 in magnitude. The uncertainty column quantifies the absolute error envelope in the same units as the measurement, ranging from 120.70 to 364.07, and is joined to the measurement fact via the via_method_key, which in turn references a dimension table that assigns each measurement method a label and a category for provenance tracking. This triad of value, confidence, and uncertainty forms the basis for threshold-based alerting, where a measurement of 878.99 with confidence 0.506 and uncertainty 120.70 demands different operational treatment than a measurement of 660.64 with confidence 0.945 and uncertainty 279.24, despite their comparable magnitudes.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |