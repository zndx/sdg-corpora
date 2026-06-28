---
chapter_id: ch_live_subclass_basic_902d20
topic_id: 186
family: 01_foundation
cited_terms: ['subclass_basic', 'uretprobe_subclass', 'trace_with_attributes']
model: engine-refine
---

In governed telemetry and instrumentation catalogs, an **identifier** is the durable handle that lets auditors, operators, and downstream systems refer to the same logical object across time, joins, and policy checks without ambiguity. Identifiers are not display labels or inferred names; they are issued keys that survive renaming, redeployment, and cross-domain linkage. A subclass record keyed as `TSUB-0001` remains `TSUB-0001` whether its subject is described as an ISO 8601 timestamp or later reclassified in narrative documentation, and a uretprobe subclass such as `URET-0003` remains addressable even when its hook attachment or attribute set evolves. The same discipline applies at the observability layer: trace-with-attributes records like `ATTR-0004` (`telemetry-flow-alpha`) and `ATTR-0001` anchor compliance queries—“which probe attaches here?”, “which license applies?”, “what was the exit code?”—to stable keys rather than to volatile strings in log lines.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | ATTR-0004 |
| URET-0002 | pthread_create_ret | ATTR-0004 |
| URET-0003 | qt_delete_ret | ATTR-0001 |
| URET-0004 | ssl_read_ret | ATTR-0006 |
| URET-0005 | libc_malloc_ret | ATTR-0005 |
| URET-0006 | pthread_create_ret | ATTR-0005 |
| URET-0007 | pthread_create_ret | ATTR-0004 |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

An **entity** is the thing those identifiers name: the operational object that carries meaning in the field. Entities sit at the center of attribution. A uretprobe subclass entity (`URET-0001` through `URET-0004`) represents a concrete return-hook probe definition—`pthread_create_ret`, `qt_delete_ret`, `ssl_read_ret`—and declares which trace hook it attaches to, such as `ATTR-0004` for multiple pthread variants or `ATTR-0001` for `ssl_read_ret`. Trace entities (`ATTR-0001`–`ATTR-0004`) represent bounded execution contexts—`batch-exec-094`, `session-gamma-9`, `gateway-span-55`—whose runtime facts must be recorded, validated, and retained. Governance treats the entity as the unit of accountability: retention, licensing, lineage, and hook compatibility are evaluated per entity, not per free-floating value.

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

An **attr** (attribute) is a named, schema-bound property declared for a class of entities. Attributes separate *what may be said* from *what was said*. For uretprobe subclasses, declared attributes include `checksum`, `created_date`, `identifier`, and `license`; for traces, `duration_seconds`, `end_time`, `exit_code`, and `host_name`. Declaring attributes in advance enforces completeness rules (certain probes must publish a license), supports differential reporting (compare `created_date` across `URET-0001`–`URET-0004`), and prevents ad hoc key proliferation that would make audits non-repeatable. In practice, attribute identifiers such as `URET-0002` for `created_date` or `ATTR-0001` for `duration_seconds` act as the join key between metadata and stored facts, so policy can target “all date-valued creation stamps” or “all duration measurements” without scraping heterogeneous payloads.

**Attr type** constrains each attribute’s semantics and storage path. Types such as `xsd:string`, `xsd:date`, `xsd:dateTime`, `xsd:integer`, and `xsd:decimal` align validation, comparison, and export with interoperable lexical rules; domain-specific types like `cco:DesignativeICE` signal identifiers meant for designative interchange, not casual text. Type governs where values land: dates (`2024-10-13`, `2023-10-28`) reside in date-valued stores keyed by `entity_id` and `attr_id`; integers (`365`, `12`, `45`) and decimals (`1085.14`, `3252.57`) in numeric stores; strings and designative tokens (`9d2b7a16`, `ARN:res/41`, `CC-BY-4.0`, `gw-12`) in varchar stores; timestamps (`2024-07-09T10:21:53`, `2023-03-03T12:52:58`) in datetime stores. That separation is operational policy embodied in schema: comparing `exit_code` as `xsd:integer` avoids lexicographic errors, and treating `license` as `xsd:string` while `identifier` uses `cco:DesignativeICE` encodes distinct compliance checks—copyright assertion versus canonical resource naming.

**Misc**, in this framework, denotes the materialized attribute value—the fact recorded for a specific entity-attribute pair. Misc is deliberately typed miscellany: the same governance slot can hold a checksum fragment, a jurisdiction tag (`us-east-1`), a lifecycle marker (`superseded`), or a log-level label (`Log Level 02`), because the attribute declaration and attr type, not the column name, define interpretive duty. Multiple misc rows per entity are normal and expected: `URET-0001` may simultaneously carry varchar misc (`9d2b7a16` under `checksum`, `CC-BY-4.0` under `license`), integer misc (`365`, `12`), and a shared `created_date` pattern across siblings keyed to `URET-0002`. Trace misc exhibits the same multiplicity—`ATTR-0001` accumulates decimal duration, integer exit codes, varchar host names, and datetime boundaries—so operational guides should treat misc as evidentiary payload located by `(entity_id, attr_id)` rather than as an authoritative record label.

Together, identifier, entity, attr, attr_type, and misc implement a separation of concerns that compliance and operations depend on. Identifiers stabilize reference; entities define what is governed; attrs declare which questions may be answered; attr types enforce how answers are validated and stored; misc holds the answers themselves. Hook attachment (`URET-0001`/`URET-0002` → `ATTR-0004`), licensing (`CC-BY-4.0` on `URET-0001`), and trace duration (`1085.14` seconds on `ATTR-0001`) become auditable claims because each value is typed, named, and bound to a keyed entity. Mature practice therefore treats empty or mistyped misc as a control failure, not a missing column; treats attr_type drift as a breaking change; and treats identifier reuse or collision as a lineage defect. That is why these five constructs matter in practice: they turn heterogeneous telemetry and instrumentation metadata into a repeatable evidentiary grammar suitable for handbook-level governance.