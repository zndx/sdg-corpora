---
chapter_id: ch_live_verification_traces_requirement_dcd940
topic_id: 33
family: 03_directive_governance
cited_terms: ['verification_traces_requirement', 'constraint_min_one_check', 'opentelemetry_span_subclass']
model: engine-refine
---

Verification identifiers establish the foundational traceability chain across the compliance framework, anchoring every artifact to a stable, machine-readable key. Requirement records carry identifiers such as REQU-0001 through REQU-0004, each associated with a distinct verification activity—Functional Safety Assessment, Type Certification Review, ISO 9001 Compliance Audit, and FAT Factory Acceptance respectively. OpenTelemetry span subclass records follow the same pattern with identifiers SPAN-0001 through SPAN-0004, tied to operational activities including worker.cron.schedule and user-service.login. Constraint records, identified as CHEC-0001 through CHEC-0004, enforce rules such as Unique Index, Latency Limit, Primary Key Rule, and Range Validation. The entity column functions as the foreign-key linkage, binding attribute value rows back to their parent record. For instance, within the requirement domain, entity_id values of REQU-0001 and REQU-0002 appear repeatedly across the value tables, each occurrence denoting a distinct attribute measurement attached to that requirement. Similarly, span subclass values reference entity_id values such as SPAN-0001 and SPAN-0002, preserving the provenance of every metric. This entity-level indirection permits a single requirement or span to accumulate an unbounded set of attributes without schema modification, a design choice that supports evolving compliance regimes.

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | REQU-0004 |
| SPAN-0002 | worker.cron.schedule | REQU-0004 |
| SPAN-0003 | worker.cron.schedule | REQU-0003 |
| SPAN-0004 | user-service.login | REQU-0003 |
| SPAN-0005 | http.server.request | REQU-0005 |
| SPAN-0006 | payment-gateway.process | REQU-0001 |

**t_opentelemetry_span_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPAN-0001 | duration_seconds | xsd:decimal |
| SPAN-0002 | end_time | xsd:dateTime |
| SPAN-0003 | exit_code | xsd:integer |
| SPAN-0004 | host_name | xsd:string |
| SPAN-0005 | log_level | xsd:string |
| SPAN-0006 | phase | xsd:string |
| SPAN-0007 | retry_count | xsd:integer |
| SPAN-0008 | scheduled_at | xsd:dateTime |

**t_opentelemetry_span_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0002 | 2025-05-18T08:27:19 |
| SPAN-0002 | SPAN-0001 | SPAN-0008 | 2024-03-17T19:20:30 |
| SPAN-0003 | SPAN-0001 | SPAN-0009 | 2025-03-13T03:16:10 |
| SPAN-0004 | SPAN-0002 | SPAN-0002 | 2023-06-13T01:08:11 |
| SPAN-0005 | SPAN-0002 | SPAN-0008 | 2023-09-29T11:45:54 |
| SPAN-0006 | SPAN-0002 | SPAN-0009 | 2024-06-14T17:52:28 |
| SPAN-0007 | SPAN-0003 | SPAN-0002 | 2024-09-28T19:19:51 |
| SPAN-0008 | SPAN-0003 | SPAN-0008 | 2024-09-01T02:28:08 |

**t_opentelemetry_span_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0001 | 2414.42 |
| SPAN-0002 | SPAN-0002 | SPAN-0001 | 5931.72 |
| SPAN-0003 | SPAN-0003 | SPAN-0001 | 930.67 |
| SPAN-0004 | SPAN-0004 | SPAN-0001 | 6374.61 |
| SPAN-0005 | SPAN-0005 | SPAN-0001 | 857.91 |
| SPAN-0006 | SPAN-0006 | SPAN-0001 | 5761.32 |

**t_opentelemetry_span_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0003 | 345 |
| SPAN-0002 | SPAN-0001 | SPAN-0007 | 35 |
| SPAN-0003 | SPAN-0002 | SPAN-0003 | 179 |
| SPAN-0004 | SPAN-0002 | SPAN-0007 | 164 |
| SPAN-0005 | SPAN-0003 | SPAN-0003 | 571 |
| SPAN-0006 | SPAN-0003 | SPAN-0007 | 189 |
| SPAN-0007 | SPAN-0004 | SPAN-0003 | 122 |
| SPAN-0008 | SPAN-0004 | SPAN-0007 | 93 |

**t_opentelemetry_span_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0004 | edge-03 |
| SPAN-0002 | SPAN-0001 | SPAN-0005 | Log Level 02 |
| SPAN-0003 | SPAN-0001 | SPAN-0006 | closeout |
| SPAN-0004 | SPAN-0001 | SPAN-0010 | running |
| SPAN-0005 | SPAN-0001 | SPAN-0011 | Triggered By 05 |
| SPAN-0006 | SPAN-0002 | SPAN-0004 | ingest-21 |
| SPAN-0007 | SPAN-0002 | SPAN-0005 | Log Level 07 |
| SPAN-0008 | SPAN-0002 | SPAN-0006 | review |

The attribute model itself is governed by two orthogonal dimensions: the attribute name and its declared type. Across both the requirement and span subclass domains, the attribute schema is uniform—duration_seconds, end_time, exit_code, and host_name—each paired with a precise XML Schema datatype: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This type discipline is not merely declarative; it dictates the physical storage layout. Decimal-valued attributes such as duration_seconds are persisted in a dedicated value table, where entries like 5386.82, 3098.08, 4624.20, and 6273.82 appear for requirement records, while span subclass records hold corresponding measurements of 2414.42, 5931.72, 930.67, and 6374.61. Integer-valued attributes, notably exit_code, occupy their own value table with entries such as 954, 329, 641, and 69 for requirements, and 345, 35, 179, and 164 for spans. DateTime attributes like end_time are stored in a separate table, carrying timestamps including 2025-01-18T10:03:30, 2023-06-09T08:44:28, 2025-02-02T23:23:29, and 2024-03-08T07:44:16 for requirements, alongside span subclass timestamps such as 2025-05-18T08:27:19 and 2024-03-17T19:20:30. String-valued attributes, including host_name and misc fields, reside in a varchar value table, holding values like gw-12, Log Level 02, execution, complete, edge-03, closeout, and running. The attr_id column in each value table serves as the foreign key into the attribute definition table, ensuring that every stored value can be resolved to its name and type with certainty.

Effective date and scope together define the temporal and organizational boundaries within which a constraint applies. The effective_date column records the date on which a constraint becomes operative, with values ranging from 2023-05-11 through 2025-03-18. The Range Validation constraint (CHEC-0004) took effect earliest, on 2023-05-11, while the Primary Key Rule (CHEC-0003) carries the most recent effective date of 2025-03-18, indicating a planned or recently activated governance requirement. The scope column classifies the organizational reach of each constraint: team-level constraints apply to a single delivery group, local constraints govern a specific deployment environment, and regional constraints span multiple environments or jurisdictions. The Unique Index and Latency Limit constraints both carry a team scope, whereas the Primary Key Rule is scoped to local and the Range Validation to regional, reflecting a graduated enforcement model where broader constraints carry proportionally greater organizational weight.

The checks column in the constraint table establishes the operational linkage between governance rules and the telemetry infrastructure that validates them. Each constraint references a span subclass identifier—SPAN-0004 for Unique Index, SPAN-0002 for Latency Limit, SPAN-0003 for Primary Key Rule, and SPAN-0001 for Range Validation—thereby binding abstract policy to concrete execution traces. This linkage is reinforced by the span_context column in the span subclass table, which maps individual spans back to their originating requirement: SPAN-0001 and SPAN-0002 both reference REQU-0004, while SPAN-0003 and SPAN-0004 reference REQU-0003. The result is a closed traceability loop: a requirement defines a verification activity, spans instrument that activity, attributes capture the measurable characteristics of each span, and constraints assert the conditions under which those measurements constitute compliance. The attr column in each value table completes the chain by pointing to the attribute definition, ensuring that every numeric, temporal, or textual datum can be unambiguously classified and evaluated against the applicable constraint.

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | SPAN-0004 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | SPAN-0002 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | SPAN-0003 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | SPAN-0001 | 2023-05-11 | regional |