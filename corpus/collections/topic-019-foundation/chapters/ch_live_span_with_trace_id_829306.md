---
chapter_id: ch_live_span_with_trace_id_829306
topic_id: 19
family: 07_long_tail
cited_terms: ['span_with_trace_id', 'span_within_trace', 'state_basic']
model: engine-refine
---

In distributed observability and operational governance, stable identifiers anchor every assertion about runtime behavior so that evidence can be correlated, audited, and reconciled across systems without ambiguity. An identifier such as TRAC-0001 denotes a single span of work—a payment_process operation—while trace identifiers (for example, TRAC-0002 bound to TRAC-0001, or TRAC-0004 shared by both db-query-orders and http_request) establish the enclosing execution context within which multiple spans cohere as one logical transaction. The identifier is not merely a surrogate key; it is the contractual handle by which downstream analytics, incident response, and compliance review retrieve the same factual record regardless of which collector, store, or reporting pipeline initiated the capture. Where identifiers proliferate without discipline—duplicate keys, orphaned references, or inconsistent cross-linking—governance frameworks lose their evidentiary chain, and operators cannot demonstrate that a reported duration, exit status, or host attribution pertains to the operation under review.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | payment_process | TRAC-0002 |
| TRAC-0002 | queue_consume | TRAC-0001 |
| TRAC-0003 | db-query-orders | TRAC-0004 |
| TRAC-0004 | http_request | TRAC-0004 |
| TRAC-0005 | grpc-payments | TRAC-0003 |
| TRAC-0006 | queue-consume-events | TRAC-0004 |

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | payment_process |
| TRAC-0002 | db-query-orders |
| TRAC-0003 | http-get-users |
| TRAC-0004 | http_request |
| TRAC-0005 | db_query |
| TRAC-0006 | db-query-orders |
| TRAC-0007 | grpc-payments |
| TRAC-0008 | kafka-produce-metrics |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

Attributes and attribute types constitute the typed vocabulary through which entities are described. An attr names what is being asserted—duration_seconds, end_time, exit_code, host_name—while attr_type fixes the interpretive contract under which the assertion must be read: xsd:decimal for elapsed time magnitudes such as 5004.94 or 6162.04 seconds, xsd:dateTime for temporal boundaries like 2024-07-23T07:53:43, xsd:integer for discrete outcomes including exit_code values 485 and 446, and xsd:string for host and operational labels including gw-12 and running. Separating attr from attr_type enforces schema discipline at ingestion: a value stored under the wrong type partition corrupts aggregation, invalidates SLA calculations, and undermines cross-environment comparability. In practice, attribute governance requires that every measurable dimension be registered before production emission, that type assignments remain stable across releases, and that retroactive type changes trigger explicit migration and re-validation rather than silent coercion.

The entity is the object to which attribute values attach; the misc field carries the concrete payload once type and identity are resolved. For span TRAC-0001, entity_id TRAC-0001 may simultaneously carry a decimal duration, a datetime end_time, an integer exit_code, and varchar misc values such as initiation and Log Level 02—each value row distinguished by its attr_id and routed to the type-appropriate store. This entity–attribute–value pattern decouples what is being measured from how it is serialized, enabling heterogeneous observability surfaces—queue_consume, http-get-users, db-query-orders—to share a uniform metadata model while preserving type-safe retrieval. Misc, in this architecture, is deliberately generic: it holds the literal observation without encoding structural semantics in the column name, so that new attributes can be introduced through registry updates rather than physical schema churn. Operational guides treat misc not as an informal catch-all but as the governed value slot whose meaning is always recoverable through the paired attr and attr_type definitions.

Structural relationships among entities are expressed through subject, target, and role, which together specify how one identified span participates within a larger composed operation. In a part_of linkage, the span_id (subject) TRAC-0006 is asserted relative to a part_of_id (target) such as TRAC-0001 or TRAC-0006, with role distinguishing the nature of participation: contributor where the span materially advances checkout-session or data-ingest-job work, observer where http_request or db-query-orders monitoring does not alter outcome but records context. Roles are not decorative labels; they govern dependency graphs, blast-radius analysis, and accountability allocation when a parent flow—auth-flow, api-request, checkout-session—fails or exceeds latency thresholds. Subject–target edges must remain referentially intact: a span within_trace record for payment_process that lacks a valid part_of target cannot be positioned in an end-to-end narrative, and compliance reviewers cannot reconstruct causal order from isolated measurements.

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

State extends the observability model from descriptive telemetry into qualified operational condition, where category, confidence, and uncertainty jointly express how firmly a system condition is known and how it should be weighted in automated or human judgment. Dimension records assign each state_key a state_label and a state_category—State Category 01 through State Category 04—so that fact_state rows can be grouped for policy application, dashboard segmentation, and escalation routing without conflating semantically distinct conditions. The fact layer binds state_key to a measured value (195.86, 143.04, 237.15, 619.50) alongside confidence scores ranging from 0.012 to 0.523 and uncertainty magnitudes from 366.30 to 951.90, encoding the epistemic limits of each assertion. High uncertainty paired with low confidence, as in STAT-0004 at confidence 0.012 and uncertainty 416.12, signals that downstream automations should treat the associated value as provisional—suitable for alerting triage but insufficient for contractual SLA attestation without corroboration. Category, in turn, prevents heterogeneous states from being averaged or thresholded as if they shared the same decision calculus.

Effective governance of this domain requires that identifiers, typed attributes, entity-bound values, relational roles, and probabilistic state assertions remain mutually consistent across the observability lifecycle. Trace membership must align with span identity so that TRAC-0003 and TRAC-0004, both carrying trace_id TRAC-0004, are analyzed as co-occurring evidence rather than independent incidents. Attribute registries must stay synchronized with the partitioned value stores so that an attr_id reference in the integer partition resolves to exit_code rather than an unrelated dimension. Part_of roles must be interpreted alongside span semantics—a db-query-orders observer attached to data-ingest-job contributes diagnostic visibility without ownership of ingest completion. State facts must be read through their category and uncertainty envelopes so that operational guides distinguish measurement from commitment. Taken together, attr, attr_type, category, confidence, entity, identifier, misc, role, state, subject, target, and uncertainty form an integrated evidentiary grammar: identifiers locate the record, entities and attributes define what is said, misc and typed partitions carry what was observed, subject–target–role structures place observations in compositional context, and state with confidence and uncertainty qualifies how decisively those observations may drive compliance conclusions and automated action.

**t_span_with_trace_id_attr**

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

**t_span_with_trace_id_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2024-07-23T07:53:43 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-01-04T12:30:01 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2024-06-08T06:16:51 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2024-09-04T10:45:36 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2024-03-10T17:10:26 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2024-08-27T18:50:31 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2024-05-28T07:14:21 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-12-31T18:14:37 |

**t_span_with_trace_id_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 5004.94 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 6293.97 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 683.54 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 6162.04 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 7049.18 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 6047.18 |

**t_span_with_trace_id_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 485 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 203 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 446 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 417 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 481 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 210 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 137 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 453 |

**t_span_with_trace_id_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | gw-12 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | running |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | gw-12 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |