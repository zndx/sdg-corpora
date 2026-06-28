---
chapter_id: ch_live_plausibility_function_for_27a930
topic_id: 186
family: 07_long_tail
cited_terms: ['plausibility_function_for', 'control_under_framework', 'span_within_trace']
model: engine-refine
---

In data governance and compliance architectures, the distinction between an identifier and an entity is foundational to how relationships are modeled and queried. An identifier serves as a stable, unique key assigned to a record—`FUNC-0001`, `FRAM-0001`, `TRAC-0001`—and functions as the anchor point for all downstream references. An entity, by contrast, is the referent: the actual thing being described, whether it is a plausibility function, a control under a framework, or a trace span. The entity column in value tables always points back to an identifier, establishing a foreign-key link that binds attribute values to the records they describe. For instance, the decimal value `0.286` and the string `Dimension Kind 01` are both entities tied to the identifier `FUNC-0001`, confirming that these values belong to the same plausibility function whose plausibility classification is `firmware_version_mismatch` and which is associated with claim `TRAC-0008`.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | TRAC-0008 |
| FUNC-0002 | disputed_rating | TRAC-0001 |
| FUNC-0003 | weak_indication | TRAC-0005 |
| FUNC-0004 | model_convergence_failure | TRAC-0004 |
| FUNC-0005 | network_latency_spike | TRAC-0004 |
| FUNC-0006 | authentication_token_expired | TRAC-0007 |
| FUNC-0007 | packet_loss_rate_high | TRAC-0006 |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | FUNC-0003 |
| FRAM-0002 | Threat detection | FUNC-0005 |
| FRAM-0003 | Session timeout | FUNC-0006 |
| FRAM-0004 | Configuration baseline | FUNC-0007 |
| FRAM-0005 | Vulnerability scan | FUNC-0005 |
| FRAM-0006 | Access review | FUNC-0005 |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

Attributes and their types form the schema layer that gives meaning to raw values. An attribute is a named property—`confidence`, `dimension_kind`, `method`, `recorded_at`, `effective_date`, `enforcement`, `mandatory`, `priority`—and its type constrains the kind of value it can hold. Types such as `xsd:decimal`, `xsd:string`, `xsd:dateTime`, `xsd:date`, `xsd:boolean`, and `xsd:integer` enforce data discipline at the schema level. This separation of attribute definition from attribute value is deliberate: it allows the system to store heterogeneous values in type-specific tables while maintaining a single, unified definition of what each attribute means. The attribute `recorded_at` with type `xsd:dateTime` receives values like `2023-05-06T07:18:55` and `2025-06-06T01:40:51`, whereas the boolean attribute `mandatory` with type `xsd:boolean` receives only `true` or `false`. The type system ensures that a decimal value such as `84.30` or `878.30` is never confused with a string like `Encoding 02` or a language tag like `en`.

The concept of misc captures the actual data values themselves—the concrete observations, measurements, and annotations that populate the attribute-value pairs. These values are the evidence layer: they are what auditors and analysts examine when assessing compliance posture. A trace span identified as `lambda-process-image` might carry a recorded timestamp of `2023-05-06T07:18:55`, while a control such as `Network firewall` under framework `FUNC-0003` carries an effective date of `2024-07-12` and a priority integer of `3`. The misc values are not merely stored; they are typed, attributed, and linked to entities, creating a chain of traceability from raw observation to governance conclusion. When a plausibility function is classified as `model_convergence_failure` and linked to claim `TRAC-0004`, the misc values attached to that function provide the quantitative and qualitative evidence supporting that classification.

Subject, target, and role describe the relational fabric that connects discrete records into a coherent graph. In the span-within-trace relationship, a span acts as the subject and a containing trace acts as the target, with the role column specifying the nature of the connection. The span `TRAC-0002` (which corresponds to the operation `http-get-users`) appears as a subject with role `observer` in its relationship to the target `TRAC-0006`. Similarly, `TRAC-0003` (`auth-validate-token`) also assumes the role of observer relative to the same target. By contrast, `TRAC-0006` and `TRAC-0007` both carry the role `contributor`, indicating a different kind of participation in the relationship. This triad—subject, target, role—allows the same pair of records to participate in multiple relationships with different semantic meanings, supporting nuanced modeling of how trace spans contribute to or observe broader workflows such as `data-ingest-job`, `auth-flow`, `checkout-session`, and `api-request`.

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |