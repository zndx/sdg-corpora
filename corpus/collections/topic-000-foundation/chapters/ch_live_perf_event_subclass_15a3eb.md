---
chapter_id: ch_live_perf_event_subclass_15a3eb
topic_id: 0
family: 07_long_tail
cited_terms: ['perf_event_subclass', 'annotation_basic', 'profiling_only_targets_datasets']
model: engine-refine
---

An identifier is the durable handle by which a governed record is addressed, reconciled, and cited across operational stores without ambiguity of reference. In performance-event subclass registries, designators of the form EVEN-0001 through EVEN-0004 denote distinct monitored phenomena—thread_contention for EVEN-0001, disk_io_ops for EVEN-0002 and EVEN-0003, network_bytes for EVEN-0004—each bound in turn to annotation contexts such as ANNO-0004 (Model versioning record), ANNO-0007, ANNO-0003, and ANNO-0002. The same identifier namespace extends to annotation records (ANNO-0001–ANNO-0004) and profiling targets (DATA-0001–DATA-0004), so that lineage queries, audit trails, and cross-domain joins resolve on stable keys rather than on display labels or transient runtime names. Where an identifier column is marked as key, it functions as the authoritative surrogate for the entity within its scope; elsewhere, as in value-store rows, identifier and entity_id may diverge in role while sharing syntactic form, preserving referential discipline without collapsing the distinction between “this row” and “the thing described.”

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | ANNO-0004 |
| EVEN-0002 | disk_io_ops | ANNO-0007 |
| EVEN-0003 | disk_io_ops | ANNO-0003 |
| EVEN-0004 | network_bytes | ANNO-0002 |
| EVEN-0005 | network_bytes | ANNO-0002 |
| EVEN-0006 | jvm_heap_used | ANNO-0005 |

The entity is the subject of assertion: the performance subclass, annotation, or dataset profile to which attributes attach and from which typed values are read. Entity_id in a value partition always points outward to that subject—EVEN-0001 carrying checksum 9d2b7a16, license MPL-2.0, and deployment context ap-south-2; ANNO-0001 carrying confidence 0.902, dimension_kind “Dimension Kind 01,” and method “Encoding 02”; DATA-0001 accumulating duration_seconds 30.48, exit_code 255, and host_name gw-12 across separate assertion rows. A single entity may therefore sponsor many value rows distinguished by attr_id, and conversely one attribute definition may populate values for multiple entities, as when attr_id EVEN-0002 (created_date) records 2024-03-08, 2023-08-29, 2025-04-08, and 2024-10-09 for EVEN-0001 through EVEN-0004 respectively. Entity-centric modeling matters for compliance because obligations attach to identifiable objects—an annotation, a profiling run, a monitored event class—not to anonymous table rows; governance rules, retention schedules, and evidentiary chains are evaluated per entity_id.

Attr names the semantic slot within an entity’s attribute schema: the human-meaningful field whose interpretation auditors and integrators must share. For performance-event subclasses, the declared slots include checksum, created_date, identifier, and license; for basic annotations, confidence, dimension_kind, method, and recorded_at; for profiling-only dataset targets, duration_seconds, end_time, exit_code, and host_name. Each attr receives its own identifier in the attribute-definition layer (e.g., ANNO-0001 for confidence, DATA-0001 for duration_seconds), which value stores reference through attr_id so that the misc payload is unambiguously typed to a named claim. Separating attr from misc prevents conflation of “what is being said” with “what was observed”: license and checksum are both strings in storage, yet attr preserves their distinct regulatory meaning—provenance fingerprint versus entitlement—so that policy engines need not infer intent from value shape alone.

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | Lab sample preservation log |
| ANNO-0002 | Dataset quality flag |
| ANNO-0003 | Observation confidence score |
| ANNO-0004 | Model versioning record |
| ANNO-0005 | Lab sample preservation log |
| ANNO-0006 | Temperature sensor calibration |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

Attr_type supplies the interpretive contract under which attr may be populated and validated. Standard XML Schema datatypes dominate the corpus—xsd:string for license and host_name, xsd:date for created_date, xsd:dateTime for recorded_at and end_time, xsd:decimal for confidence and duration_seconds, xsd:integer for exit_code—establishing lexical formats, comparison semantics, and acceptable ranges. Domain-specific types appear where generic primitives would erase governance nuance: cco:DesignativeICE on the identifier attr signals that values such as oid:1.3.6.1 are not arbitrary text but designative identifiers within an interchange-controlled enumeration. Attr_type therefore gates physical placement: date-valued misc lands in val_date partitions, integers in val_int, variable-length text in val_varchar, instants in val_datetime, and fixed-scale numerics in val_decimal. Enforcement at ingest—rejecting 2024-03-08 for an xsd:decimal slot or 0.902 for xsd:date—keeps heterogeneous observability and metadata domains interoperable without a single wide table that would sacrifice type safety.

Misc is the carried value: the concrete assertion stored once entity, attr, and attr_type have fixed the interpretive frame. In varchar partitions misc may hold checksum digests (9d2b7a16), OID designators (oid:1.3.6.1), license tokens (MPL-2.0), locale codes (fr), operational host labels (gw-12), or terminal states (failed); in date and datetime partitions, calendar dates and UTC-stamped instants such as 2023-10-01T01:18:56; in decimal and integer partitions, measurements and counters including confidence 0.818 on ANNO-0002, cardinality-adjacent magnitudes 146.86 and 292.49, run durations from 30.48 s to 6189.13 s, and exit codes 255 and 337. Misc is deliberately generic in column name because its semantics are fully determined by the triple (entity_id, attr_id, attr_type); the same column label across val_* families denotes “payload here,” while the table suffix encodes the storage discipline implied by attr_type. For evidence and audit, misc rows are the attestations; identifiers and entities supply who and what, attr supplies which claim, attr_type supplies how to read it, and misc supplies the fact under dispute or review.

Taken together, the five constructs implement a typed entity–attribute–value pattern suited to multi-domain compliance registries where event taxonomy, annotation metadata, and dataset profiling coexist without schema collision. Performance subclasses link to annotations through foreign identifier chains (EVEN-0001 → ANNO-0004), while parallel value stores let each domain grow attribute vocabularies independently—EVEN-0006 and EVEN-0008 integers alongside ANNO-0004 datetimes and DATA-0003 integers—yet remain queryable under common governance primitives. Operational practice treats attr_type as the non-negotiable validation surface, entity_id as the scope of obligation, attr_id as the named predicate, identifier as the join key across layers, and misc as the evidential content whose integrity checks (checksum), temporal bounds (created_date, recorded_at, end_time), and outcome signals (exit_code, failed) support demonstrable conformance. Systems that respect this separation scale attribute diversity without fragmenting auditability: new attrs and types extend the registry, new misc rows extend the factual record, and identifiers preserve continuity from classification through annotation to profiling evidence.