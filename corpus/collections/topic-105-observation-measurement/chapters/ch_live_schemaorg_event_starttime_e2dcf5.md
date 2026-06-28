---
chapter_id: ch_live_schemaorg_event_starttime_e2dcf5
topic_id: 105
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'classification_subclass', 'ebpfevent_via_program_xref']
model: engine-refine
---

The attribute-value architecture employed in this schema separates the definition of metadata from its instantiation, thereby permitting heterogeneous data types to coexist within a single entity model. Each attribute is declared once in the attribute definition table, where it receives a unique identifier and a strict type annotation drawn from the XML Schema Datatypes vocabulary: `xsd:decimal` for numeric measures such as duration, `xsd:dateTime` for temporal markers, `xsd:integer` for discrete codes, and `xsd:string` for free-form labels. The attribute names themselves—`duration_seconds`, `end_time`, `exit_code`, `host_name`—convey semantic intent, while the type column enforces schema-level discipline at query time. An entity, identified by a surrogate key such as `XREF-0001`, may carry any number of these attributes, each resolved through a foreign-key reference to the attribute definition and materialized in one of four value tables depending on the declared type. Thus the duration of a single event instance is stored as the decimal `523.38`, the same entity's exit code appears as the integer `165`, its associated host is recorded as the string `worker-07`, and its end timestamp is captured as `2024-04-10T05:27:34`.

Event start times are modeled as a dedicated dimension, decoupled from the fact records that reference them. The dimension table assigns each start-time entry a stable identifier—`STAR-0001` through `STAR-0004`—alongside a human-readable label such as `Event Start Time Label 01` and a categorical classification like `Event Start Time Category 03`. The fact table, `fact_schemaorg`, holds only the foreign key `event_start_time_key`, pointing back to the dimension to resolve the actual start-time metadata at query time. This normalization eliminates redundancy and ensures that any change to a label or category propagates automatically to all dependent fact rows. The fact table itself carries additional measures: `size_bytes` records the byte-level footprint of the associated artifact—values range from `114301972` bytes (approximately 109 MB) to `998785819` bytes (approximately 952 MB)—and `version` tracks the schema revision, with observed values spanning `3` through `8`.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

Classification records reside in a separate table that maps each classification entry to a risk or compliance framework, an exit code, and a lifecycle status. The classification column carries values such as `OWASP Risk Rating`, `GDPR Data Category`, and `CIS Benchmark`, indicating the regulatory or security standard under which the record is evaluated. The exit code—integer values like `493`, `301`, `581`, and `197`—encodes the outcome of the classification check, while the status column records the current state of the record as `failed`, `pending`, or `complete`. These three fields together form a compact governance snapshot: a GDPR Data Category entry with exit code `301` and status `pending` signals an unresolved compliance action, whereas a CIS Benchmark entry with exit code `197` and status `complete` indicates a closed audit finding.

The event cross-reference table bridges programmatic event names to the entity model, enabling a single event type to be associated with multiple entity instances. Event identifiers such as `DATA_LAKE_SYNC_FAIL`, `TELEMETRY_HEARTBEAT`, and `BATCH_ETL_COMPLETE` serve as the semantic anchor, while the cross-reference keys—`XREF-0001` through `XREF-0004`—provide the stable linkage to the attribute-value store. This indirection permits the same event type to carry different attribute payloads depending on context: a `DATA_LAKE_SYNC_FAIL` event may record a duration of `523.38` seconds and an exit code of `165`, while another instance of the same event type might carry a duration of `5096.06` seconds and an exit code of `480`. The misc column in the value tables captures the actual scalar values—whether decimal, datetime, integer, or string—without imposing a single type constraint on the entity row.

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**t_ebpfevent_via_program_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |

Versioning and status tracking operate at two distinct layers. The `fact_schemaorg` table maintains a `version` column that increments with each schema revision, providing an audit trail for structural changes to the fact model itself. Concurrently, the classification table's `status` column tracks the operational state of individual records, allowing downstream systems to filter on `complete` versus `pending` or `failed` outcomes. Together, these mechanisms ensure that both the schema and the data it describes remain traceable: a fact row with identifier `STAR-0001` and version `3` can be correlated with its associated event start time category, its classification status, and the full set of typed attribute values attached to its entity key, yielding a complete, queryable provenance chain.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |