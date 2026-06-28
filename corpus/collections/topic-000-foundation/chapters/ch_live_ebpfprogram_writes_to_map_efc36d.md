---
chapter_id: ch_live_ebpfprogram_writes_to_map_efc36d
topic_id: 0
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map', 'profiling_only_targets_datasets', 'control_at_severity']
model: engine-refine
---

In governed telemetry and compliance systems, stable identifiers anchor every cross-table reference and prevent semantic drift when facts are joined to dimensions or when profiling runs are replayed across audit cycles. Programs such as MAP-0001 through MAP-0004 carry opaque but durable keys that survive relabeling, reclassification, and version churn; the same convention extends to profiling targets (DATA-0001–DATA-0004) and severity controls (SEVE-0001–SEVE-0004), so that a cardinality sweep executed against DATA-0002 remains attributable to that dataset even if downstream consumers rename the underlying collection. Identifier discipline is not merely naming hygiene: it is the contract that permits foreign-key integrity between executable artifacts and the map surfaces they populate, and between entity records and the attribute-level measurements extracted from them.

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

The writes_to_map relationship expresses where compiled instrumentation deposits its observations. An eBPF program keyed MAP-0001 may declare writes_to_map_key MAP-0003, while MAP-0004 writes back to MAP-0001, establishing a directed graph of producer-to-sink bindings rather than a flat inventory of binaries. Dimension rows resolve those keys into human-legible miscellany—here, labels such as Writes To Map Label 03—and into category taxonomies (Writes To Map Category 03) that partition map endpoints for policy routing, retention tiers, or access scopes. Category therefore operationalizes identifier-level facts: MAP-0003 is simultaneously a join target, a labeled artifact, and a member of a controlled class whose meaning auditors can evaluate without inspecting bytecode.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Physical and lifecycle metadata—size_bytes and version—complement logical bindings. Program footprints ranging from 113209263 bytes (MAP-0003) to 784335640 bytes (MAP-0001) inform capacity planning, transfer budgets, and integrity baselines; version integers (9 for MAP-0002, 12 for MAP-0001 and MAP-0004) record generational state independent of the map key, so that a version-11 build writing to MAP-0003 can be distinguished from an earlier lineage even when the sink identifier is unchanged. Together, writes_to_map, size_bytes, and version answer three audit questions: where data lands, how much machinery is involved, and which build produced the trace.

Entity–attribute–value profiling treats each dataset as an entity whose measurable properties are declared separately from their stored observations. Entity identifiers (DATA-0001, DATA-0002, …) denote the profiling subject; attr names—duration_seconds, end_time, exit_code, host_name—name the inspected column or signal; attr_type assignments (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) fix the interpretive grammar before values are ingested. Typed value stores then hold misc observations under those contracts: decimal durations of 30.48 s and 6189.13 s for DATA-0001 and DATA-0002, integer exit codes 255 and 337, varchar host tokens gw-12 and failed, and ISO-8601 timestamps including 2024-10-18T20:19:23. Splitting values by attr_type enforces encoding-safe storage and allows profilers—null rate analysis on DATA-0001, hash integrity check on DATA-0004—to target the correct physical representation without coercing heterogeneous types into a single column.

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

Encoding and language govern how control text and operational misc values are serialized and localized at the point of enforcement. Severity records pair control statements (Log retention 90 days, Network segmentation east-west) with at_severity gradations (Low, Elevated, Medium) while specifying character encodings—latin1 for SEVE-0001, unicode for SEVE-0002 and SEVE-0003, utf8 for SEVE-0004—and language tags de and ja that determine lexicon, collation, and reviewer locale. A control rendered in german (de) under utf8 is not interchangeable with the same semantic control encoded in latin1: byte-level representation, parser tolerance, and evidentiary hash stability all depend on declared encoding. Language further constrains human-facing misc fields—labels, log-level strings such as Log Level 02, disposition tokens like closeout—so that cross-border audits can prove the operative wording seen by operators matches the governed artifact on record.

Taken together, these constructs form a layered evidence model: identifiers and entities establish who and what; attr and attr_type specify which properties and under what type system; category, writes_to_map, size_bytes, and version situate artifacts in policy and infrastructure context; encoding and language fix the representational substrate for misc values and controls; and typed value tables materialize the measurements profilers consume. A reviewer tracing MAP-0002 (641704069 bytes, version 9, writing to MAP-0005) through its map label and category, then through DATA-0002’s cardinality profiling and its xsd:decimal duration_seconds observation of 6189.13, reconstructs a complete chain from executable intent to measured outcome—precisely the traceability compliance frameworks require when map writes, dataset quality, and severity controls must be demonstrated as coherent, typed, and locale-faithful rather than anecdotal.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

**t_control_at_severity**

| id | control | at_severity | encoding | language |
| --- | --- | --- | --- | --- |
| SEVE-0001 | Log retention 90 days | Low | latin1 | de |
| SEVE-0002 | Rate limiting API | Low | unicode | ja |
| SEVE-0003 | Access review quarterly | Elevated | unicode | de |
| SEVE-0004 | Network segmentation east-west | Medium | utf8 | de |
| SEVE-0005 | Network segmentation east-west | Negligible | latin1 | fr |
| SEVE-0006 | Backup verification daily | Elevated | latin1 | en |
| SEVE-0007 | PII masking pipeline | Critical Risk | unicode | ja |
| SEVE-0008 | Backup verification daily | Low | unicode | de |