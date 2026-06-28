---
chapter_id: ch_live_trace_basic_540f4e
topic_id: 186
family: 02_observation_measurement
cited_terms: ['trace_basic', 'schemaorg_creativework_author', 'opentelemetry_span_subclass']
model: engine-refine
---

In governed observability and provenance systems, the five primitives—identifier, entity, attr, attr_type, and misc—form the contract through which heterogeneous runtime and documentary evidence becomes queryable, auditable, and interoperable. An identifier is not merely a surrogate key; it is the durable handle by which a record participates in cross-table lineage. When trace TRAC-0001 is referenced as the subject of a decimal measurement, as the anchor for multiple varchar facts on the same host, or as the author attribution behind AUTH-0001 in a Schema.org creative-work graph, the same opaque token (TRAC-0001) must resolve unambiguously everywhere it appears. That stability matters because compliance workflows depend on join integrity: an auditor tracing load-balancer-routing behavior must be able to follow TRAC-0001 from its observed span context through attribute definitions to concrete values without reinterpretation. Identifiers therefore carry governance weight—they are assigned once, never overloaded, and treated as immutable references even when display names or operational labels change.

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | SPAN-0001 |
| TRAC-0002 | frontend-render-loop | SPAN-0001 |
| TRAC-0003 | message-broker-poll | SPAN-0002 |
| TRAC-0004 | worker-task-execution | SPAN-0003 |
| TRAC-0005 | cache-hit-miss-run | SPAN-0004 |
| TRAC-0006 | message-broker-poll | SPAN-0005 |

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

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | TRAC-0006 |
| AUTH-0002 | Provenance_Trace_Report | TRAC-0005 |
| AUTH-0003 | API_Reference_Guide | TRAC-0006 |
| AUTH-0004 | Provenance_Trace_Report | TRAC-0004 |
| AUTH-0005 | Sensor_Network_Spec | TRAC-0006 |
| AUTH-0006 | Catalog_Metadata_Index | TRAC-0005 |
| AUTH-0007 | Telemetry_Config_Spec | TRAC-0003 |
| AUTH-0008 | Catalog_Metadata_Index | TRAC-0005 |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | TRAC-0004 |
| SPAN-0002 | worker.cron.schedule | TRAC-0004 |
| SPAN-0003 | worker.cron.schedule | TRAC-0003 |
| SPAN-0004 | user-service.login | TRAC-0003 |
| SPAN-0005 | http.server.request | TRAC-0005 |
| SPAN-0006 | payment-gateway.process | TRAC-0001 |

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

An entity is the thing being described, distinct from the rows that describe it. In practice, entity_id on a value record answers the question “of what object is this fact true?” rather than “what row is this?” A single trace such as TRAC-0001 may accumulate many attribute bindings: duration_seconds recorded as 1505.64, end_time as 2023-04-16T02:44:01, exit_code as 376, and host_name as node-b14, each stored as a separate value tuple but all scoped to the same entity. The same pattern holds for OpenTelemetry span entities (SPAN-0001 through SPAN-0004) and for documentary entities (AUTH-0001 through AUTH-0004). Entity-centric modeling is what allows operational telemetry and bibliographic metadata to share a common ingestion grammar: worker.cron.schedule spans and Provenance_Trace_Report authorship records both decompose into attribute slots hung off a stable entity reference, which is why governance frameworks treat entity_id as the primary subject of retention, access control, and redaction policy.

An attr names the semantic slot; attr_type declares the interpretive rules for whatever occupies that slot. Attribute catalogs such as duration_seconds, end_time, exit_code, and host_name recur across trace and span domains because they represent comparable observability dimensions, while documentary attrs—checksum, created_date, identifier, license—encode publication and integrity metadata under Schema.org creative-work semantics. The type annotation is not decorative: xsd:decimal routes measurements like 5061.29 and 2414.42 into decimal stores where aggregation and threshold alerting are valid; xsd:dateTime constrains temporal facts such as 2025-05-18T08:27:19 to ordered, timezone-aware comparison; xsd:integer isolates discrete outcomes like exit_code 88 from floating-point durations; xsd:string and xsd:date capture lexical and calendrical forms respectively. When a catalog declares cco:DesignativeICE for an identifier attribute, it signals that the value is not free text but a designative identifier in a controlled naming scheme—illustrated by gid://svc/77 on AUTH-0003—requiring validation distinct from ordinary strings like GPL-3.0 or on-prem-dc1. Attr and attr_type together are the schema layer that prevents misc values from being read out of context: without them, 314 could be a port, an exit code, or an arbitrary counter.

Misc is the stored assertion—the literal value materialized after entity, attribute, and type have been resolved. Despite the name, misc is the most operationally consequential primitive because it is what investigators, SLO dashboards, and export pipelines actually consume. A misc value is always typed indirectly: 4957.42 is meaningful only when entity_id TRAC-0003 and attr_id TRAC-0001 jointly establish that it is duration_seconds for message-broker-poll, not a checksum or license string. The separation of misc from attr_type is what enables physical partitioning by storage shape—datetime, decimal, integer, and varchar tables—without fragmenting the logical fact model. That separation also supports compliance controls: datetime partitions can enforce temporal retention windows, varchar partitions can apply PII scrubbing rules to values like edge-03 or Log Level 02, and integer partitions can gate access to exit_code fields that may encode security-sensitive process outcomes. Values ranging from initiation and complete on TRAC-0001 to closeout and running on SPAN-0001 show that misc carries both machine metrics and human-readable state labels within the same framework, distinguished only by their attribute binding.

Identifiers, entities, attrs, attr_types, and misc values interoperate through reference edges that turn isolated tuples into evidentiary chains. Trace TRAC-0004 (worker-task-execution) links forward to span observations and backward from span_context on SPAN-0001 and SPAN-0002, while also appearing as the author behind AUTH-0004’s Provenance_Trace_Report—demonstrating how one entity identifier can sit at the intersection of runtime telemetry and documentary provenance. Attribute identity (attr_id tokens such as TRAC-0002, SPAN-0008, or AUTH-0002) provides a second join key so that identically named attrs across domains remain disambiguated in storage while still comparable at the semantic layer. Operational guides should require that every misc write path validate three invariants before commit: entity_id must resolve to a live entity, attr_id must map to a declared attr_name and attr_type pair, and the misc payload must parse under that type. Failure at any step produces orphan facts or type pollution—decimal durations written into varchar columns, or timestamps attached to the wrong entity—which undermines the audit trail that the model is designed to preserve.

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

For practitioners, the practical payoff of this decomposition is policy portability across domains that otherwise share little surface syntax. The same governance checklist—stable identifiers, entity-scoped facts, cataloged attrs with explicit types, and misc stored in type-appropriate partitions—applies whether the subject is a load-balancer-routing trace, a user-service.login span, or an API_Reference_Guide authorship record. Cross-domain attribute reuse (duration_seconds as xsd:decimal everywhere) lowers training cost and enables unified analytics, while domain-specific attrs (license, checksum, cco:DesignativeICE identifier) extend the catalog without breaking the value-ingestion pattern. Mature implementations treat attr catalogs as versioned controlled vocabularies, entity registries as authoritative identity sources, and misc stores as append-friendly evidence logs keyed for reconstruction: given entity_id and attr_id, an auditor can always recover what was asserted, under what type contract, and—via identifier chains—how that assertion connects to neighboring spans, traces, and published works. That reconstructability, not table layout, is the operational definition of compliance-ready observability data.