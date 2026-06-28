---
chapter_id: ch_live_measurement_basic_05ef9d
topic_id: 4
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'opentelemetry_span_subclass', 'human_rights_impact_report']
model: engine-refine
---

In governed observability and compliance systems, every auditable fact must be anchored to a stable identifier that survives schema evolution, system migration, and cross-domain correlation. Identifiers such as MEAS-0001 and SPAN-0003 are not display labels; they are durable keys that allow a measurement record, its attribute values, and downstream telemetry to be joined without ambiguity. When an Air Quality Index observation and a Disk Throughput reading both carry identifiers in the same namespace, auditors can prove lineage—that a reported figure originated from a specific instrumented event rather than from an aggregate guess. The identifier therefore functions as the spine of traceability: without it, attribute values become orphaned miscellany and reports lose their evidential footing.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

An entity is the thing being described—the measurement instance, the span, or the reporting subject—while attributes name the facets that may be asserted about it. Confidence, dimension_kind, method, and recorded_at are not columns on a single wide row; they are named properties whose semantics are declared separately from their values. A Water pH Level measurement and a worker.cron.schedule span each exist as entities (MEAS-0003, SPAN-0002) to which different attribute sets attach. This separation matters in practice because entities accrete properties over time: a span may later gain host_name or exit_code without restructuring the core entity record, and a measurement may accumulate calibration metadata without invalidating earlier submissions.

Attribute type governs how values may be stored, compared, and validated. Declaring attr_type as xsd:decimal, xsd:dateTime, xsd:string, or xsd:integer is a compliance decision, not a formatting preference. A confidence score of 0.231 and a duration_seconds value of 2414.42 belong in decimal-typed stores; recorded_at timestamps such as 2024-05-15T18:00:29 require datetime precision; categorical strings like Dimension Kind 01 or edge-03 require varchar handling; exit codes 345 and 179 require integer integrity. Typed value partitions prevent silent coercion—mixing a calibration record string with a numeric threshold in one undifferentiated field would undermine automated controls. Operations teams rely on attr_type to route ingestion, enforce range checks, and produce reports that aggregate only commensurable quantities.

The misc dimension—here, the concrete value payload—is where abstract metadata meets evidentiary substance. Whether the payload is a pH-related decimal, an encoding label, or a reports_on_label such as Reports On Label 02, misc carries the assertable content that policies ultimately judge. Linking values back through entity_id and attr_id ensures each misc entry is attributable: 0.117 confidence attaches to MEAS-0002 under the confidence attribute definition, not generically to “disk metrics.” In span telemetry, the same discipline applies—host_name edge-03 and status running are varchar misc bound to SPAN-0001—so investigators can reconstruct operational context at span granularity. Misc is therefore not “unstructured leftovers”; it is typed, keyed evidence.

Category and reports on sit at the boundary between raw instrumentation and human-facing governance. The reports_on construct names what a fact or report concerns—linking fact_human rows through reports_on_key to dimension entries classified under reports_on_category (for example, Reports On Category 01 versus Reports On Category 04). That indirection allows the same underlying measurements and spans to be summarized under different reporting lenses without rewriting source data. Event_count then quantifies exposure within each reporting slice: 491 events associated with one reports_on target versus 167 for another signal materially different audit scope and sampling risk. Categories make those slices comparable across time and jurisdiction; without them, event counts would be correct arithmetic on meaningless groupings.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

Finally, cross-domain linkage—such as binding OpenTelemetry spans to measurements through span_context (MEAS-0003 appearing across multiple worker.cron.schedule and user-service.login spans)—shows why identifiers, entities, attributes, and reporting dimensions must interoperate. A compliance review of login latency does not stop at duration_seconds 6374.61; it asks which measurement context the span reports on, whether recorded_at precedes or follows the span’s end_time, and how many human-reportable events fall under the relevant category. Mature operations treat attr and attr_type as schema contracts, entity as the unit of custody, identifier as the join key, misc as typed assertions, category and reports on as the governance vocabulary, and event_count as the scalar that turns traceable atoms into accountable summaries. Together they convert telemetry and measurement streams into evidence a handbook can defend.

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | MEAS-0002 |
| SPAN-0002 | worker.cron.schedule | MEAS-0003 |
| SPAN-0003 | worker.cron.schedule | MEAS-0003 |
| SPAN-0004 | user-service.login | MEAS-0003 |
| SPAN-0005 | http.server.request | MEAS-0001 |
| SPAN-0006 | payment-gateway.process | MEAS-0001 |

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

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |