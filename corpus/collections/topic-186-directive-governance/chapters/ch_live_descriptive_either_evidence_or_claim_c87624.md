---
chapter_id: ch_live_descriptive_either_evidence_or_claim_c87624
topic_id: 186
family: 07_long_tail
cited_terms: ['descriptive_either_evidence_or_claim', 'ebpf_event_at_hook', 'column_tag_from_annotator']
model: engine-refine
---

The identifier column serves as the unique key for every record across the schema, following a consistent naming convention that encodes the source domain. Claims carry identifiers prefixed with CLAI (for example, CLAI-0001 through CLAI-0004), eBPF events use HOOK (such as HOOK-0001 through HOOK-0004), and annotator tags are labeled with ANNO (ANNO-0001 through ANNO-0004). This prefix-based scheme allows a single query to distinguish between fundamentally different entity types while preserving a uniform primary-key interface. The descriptive column of the claim table illustrates what these identifiers point to: a pipeline run log, a compliance audit trail, a network latency trace, and so on. Similarly, the ebpf column in the hook table names kernel-level probes like oom_kill_recorder, tcp_connect_monitor, and kprobe__do_fork, while the column column in the annotator table references data fields such as ingestion_latency, compliance_flag, and api_version.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_ebpf_event_at_hook**

| id | ebpf | at_hook |
| --- | --- | --- |
| HOOK-0001 | oom_kill_recorder | CLAI-0001 |
| HOOK-0002 | tcp_connect_monitor | CLAI-0004 |
| HOOK-0003 | socket_bind_observer | CLAI-0001 |
| HOOK-0004 | kprobe__do_fork | CLAI-0004 |
| HOOK-0005 | xdp_drop_counter | CLAI-0003 |
| HOOK-0006 | disk_io_latency | CLAI-0004 |
| HOOK-0007 | xdp_drop_counter | CLAI-0002 |
| HOOK-0008 | tcp_connect_monitor | CLAI-0001 |

**t_ebpf_event_at_hook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HOOK-0001 | duration_seconds | xsd:decimal |
| HOOK-0002 | end_time | xsd:dateTime |
| HOOK-0003 | exit_code | xsd:integer |
| HOOK-0004 | host_name | xsd:string |
| HOOK-0005 | log_level | xsd:string |
| HOOK-0006 | phase | xsd:string |
| HOOK-0007 | retry_count | xsd:integer |
| HOOK-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_at_hook_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0002 | 2025-04-15T06:28:34 |
| HOOK-0002 | HOOK-0001 | HOOK-0008 | 2023-07-01T04:43:47 |
| HOOK-0003 | HOOK-0001 | HOOK-0009 | 2024-07-23T09:28:11 |
| HOOK-0004 | HOOK-0002 | HOOK-0002 | 2024-10-19T19:53:20 |
| HOOK-0005 | HOOK-0002 | HOOK-0008 | 2024-09-07T20:44:31 |
| HOOK-0006 | HOOK-0002 | HOOK-0009 | 2024-01-06T00:55:45 |
| HOOK-0007 | HOOK-0003 | HOOK-0002 | 2023-07-31T02:59:19 |
| HOOK-0008 | HOOK-0003 | HOOK-0008 | 2024-12-05T20:30:51 |

**t_ebpf_event_at_hook_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0001 | 289.81 |
| HOOK-0002 | HOOK-0002 | HOOK-0001 | 3531.53 |
| HOOK-0003 | HOOK-0003 | HOOK-0001 | 3907.51 |
| HOOK-0004 | HOOK-0004 | HOOK-0001 | 3791.90 |
| HOOK-0005 | HOOK-0005 | HOOK-0001 | 2276.70 |
| HOOK-0006 | HOOK-0006 | HOOK-0001 | 4707.83 |
| HOOK-0007 | HOOK-0007 | HOOK-0001 | 5960.02 |
| HOOK-0008 | HOOK-0008 | HOOK-0001 | 1500.90 |

**t_ebpf_event_at_hook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0003 | 245 |
| HOOK-0002 | HOOK-0001 | HOOK-0007 | 83 |
| HOOK-0003 | HOOK-0002 | HOOK-0003 | 157 |
| HOOK-0004 | HOOK-0002 | HOOK-0007 | 346 |
| HOOK-0005 | HOOK-0003 | HOOK-0003 | 820 |
| HOOK-0006 | HOOK-0003 | HOOK-0007 | 382 |
| HOOK-0007 | HOOK-0004 | HOOK-0003 | 364 |
| HOOK-0008 | HOOK-0004 | HOOK-0007 | 482 |

**t_ebpf_event_at_hook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0004 | gw-12 |
| HOOK-0002 | HOOK-0001 | HOOK-0005 | Log Level 02 |
| HOOK-0003 | HOOK-0001 | HOOK-0006 | closeout |
| HOOK-0004 | HOOK-0001 | HOOK-0010 | running |
| HOOK-0005 | HOOK-0001 | HOOK-0011 | Triggered By 05 |
| HOOK-0006 | HOOK-0002 | HOOK-0004 | node-b14 |
| HOOK-0007 | HOOK-0002 | HOOK-0005 | Log Level 07 |
| HOOK-0008 | HOOK-0002 | HOOK-0006 | initiation |

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | HOOK-0008 |
| ANNO-0002 | compliance_flag | HOOK-0004 |
| ANNO-0003 | api_version | HOOK-0007 |
| ANNO-0004 | api_version | HOOK-0006 |
| ANNO-0005 | compliance_flag | HOOK-0008 |
| ANNO-0006 | event_timestamp | HOOK-0001 |

**t_column_tag_from_annotator_attr**

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

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

An attribute definition bridges the gap between an entity and the values it carries. The attr_name column specifies what is being measured or described—confidence, dimension_kind, method, recorded_at for claims; duration_seconds, end_time, exit_code, host_name for eBPF hooks; and the same set of attribute names for annotator tags. The attr_type column assigns an XML Schema datatype to each attribute, constraining the shape of permissible values. Types include xsd:decimal for numeric measurements, xsd:string for free-form text, xsd:dateTime for timestamps, and xsd:integer for whole-number codes. This type discipline ensures that downstream consumers can interpret values correctly without inspecting the raw data.

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

The entity column in the value tables establishes the many-to-one relationship between individual attribute values and their parent records. A single entity can accumulate multiple attributes, each stored in its own row. For instance, entity CLAI-0001 carries a confidence value of 0.015, a dimension_kind of Dimension Kind 01, an encoding label of Encoding 02, and a change rationale of change rationale, each linked through its respective attr_id. The same pattern holds for eBPF hooks: entity HOOK-0001 records a duration_seconds of 289.81, a host_name of gw-12, an exit_code of 245, and an end_time of 2025-04-15T06:28:34. This structure allows entities to be polymorphic—different entities expose different attribute sets—while maintaining a uniform storage model.

Value storage is partitioned by type into dedicated tables, each holding the misc column where the actual data lives. Decimal values such as 0.015, 195.73, 289.81, and 3531.53 reside in the decimal value table, enabling precise numeric comparisons and aggregations. DateTime values like 2023-12-14T23:50:57, 2024-02-16T02:04:00, and 2025-04-15T06:28:34 occupy the datetime table, supporting temporal queries and audit timelines. String values—including Dimension Kind 01, Encoding 02, nightly summary, es, closeout, and running—are stored in the varchar table, preserving human-readable metadata. Integer values such as 245, 83, 157, and 346 are kept in the integer table, representing discrete codes like exit statuses. This type-partitioned design avoids the pitfalls of a single generic value column while keeping the schema navigable.

The attr_id column in each value table completes the linkage by pointing back to the attribute definition, forming a three-way join between entity, attribute, and value. In the claim domain, attr_id CLAI-0004 appears repeatedly across the datetime value table, indicating that the recorded_at attribute is shared by multiple claim entities. In the eBPF domain, attr_id HOOK-0001 maps to duration_seconds and is populated for every hook entity, suggesting a mandatory timing metric. The annotator domain mirrors this structure: attr_id ANNO-0004 (recorded_at) is uniformly present, while attr_id ANNO-0001 (confidence) carries decimal values of 0.302 and 0.049 across different annotator records. This relational chain—entity_id to attr_id to value—provides a complete, queryable provenance trail for every data point.