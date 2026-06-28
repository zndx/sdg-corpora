---
chapter_id: ch_live_labrun_basic_2a7ac0
topic_id: 67
family: 02_observation_measurement
cited_terms: ['labrun_basic', 'uretprobe_subclass', 'schemaorg_org_country']
model: engine-refine
---

In laboratory execution registries, the `t_labrun_basic` table anchors each run with a stable identifier—`LABR-0001` through `LABR-0004`—and a human-readable label such as `Microplate_Scan_9A`, `MassSpec_Triplicate`, `ELISA_Screen_4B`, and `PCR_Amplification`. These identifiers serve as the primary key for all downstream attribute and value tables, ensuring that every measurement, timestamp, and metadata field can be traced back to a single execution event. The `labrun` column provides the operational context, while the `id` column guarantees referential integrity across the entire attribute-value model.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

The attribute schema is defined in `t_labrun_basic_attr`, which maps each attribute name to its semantic type. For instance, `duration_seconds` is typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. This separation of schema from data allows the system to enforce type safety at query time while keeping the attribute definitions decoupled from the value storage. The `attr_name` and `attr_type` columns together form a lightweight ontology that governs how values are interpreted, validated, and displayed.

Value storage is split across four type-specific tables—`t_labrun_basic_val_datetime`, `t_labrun_basic_val_decimal`, `t_labrun_basic_val_int`, and `t_labrun_basic_val_varchar`—each keyed by a surrogate `id` and linked to its entity via `entity_id` and to its attribute definition via `attr_id`. A decimal value such as `1438.98` or `6523.97` lives in the decimal table, a timestamp like `2025-01-01T00:58:28` in the datetime table, an integer such as `918` or `57` in the int table, and a string like `edge-03` or `Log Level 02` in the varchar table. This normalization prevents type coercion errors and allows each value table to be indexed and partitioned according to its access patterns.

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

The same attribute-value pattern repeats for uretprobe subclasses and schema.org organization-country mappings. In `t_uretprobe_subclass`, identifiers like `URET-0001` through `URET-0004` anchor probes such as `pthread_create_ret` and `qt_delete_ret`, each attached to a return hook via `attaches_to_return_hook` (e.g., `LABR-0004`, `LABR-0002`). The attribute definitions in `t_uretprobe_subclass_attr` include fields like `checksum`, `created_date`, `identifier`, and `license`, typed as `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively. Values are stored in `t_uretprobe_subclass_val_date` (e.g., `2024-10-13`), `t_uretprobe_subclass_val_int` (e.g., `365`, `12`), and `t_uretprobe_subclass_val_varchar` (e.g., `9d2b7a16`, `ARN:res/41`, `CC-BY-4.0`, `us-east-1`).

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | LABR-0004 |
| URET-0002 | pthread_create_ret | LABR-0002 |
| URET-0003 | qt_delete_ret | LABR-0001 |
| URET-0004 | ssl_read_ret | LABR-0006 |
| URET-0005 | libc_malloc_ret | LABR-0001 |
| URET-0006 | pthread_create_ret | LABR-0003 |
| URET-0007 | pthread_create_ret | LABR-0006 |

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

Similarly, the `t_schemaorg_org_country` table links organization identifiers such as `tesla-inc`, `oracle-corp`, `apple-inc`, and `adobe-systems` to country codes like `LABR-0001`, `LABR-0002`, `LABR-0008`, and `LABR-0005`. Its attribute schema mirrors the uretprobe pattern, with `t_schemaorg_org_country_attr` defining `checksum`, `created_date`, `identifier`, and `license`. Values are stored in `t_schemaorg_org_country_val_date` (e.g., `2023-05-13`, `2024-09-06`), `t_schemaorg_org_country_val_int` (e.g., `22`, `3`, `233`, `6`), and `t_schemaorg_org_country_val_varchar` (e.g., `5e8f3c91`, `doi:10.1109/x`, `proprietary`, `zone-b`). This consistent structure across domains enables uniform querying, auditing, and compliance reporting regardless of the underlying entity type.

**t_schemaorg_org_country**

| id | schemaorg | country |
| --- | --- | --- |
| COUN-0001 | tesla-inc | LABR-0001 |
| COUN-0002 | oracle-corp | LABR-0002 |
| COUN-0003 | apple-inc | LABR-0008 |
| COUN-0004 | adobe-systems | LABR-0005 |
| COUN-0005 | apple-inc | LABR-0006 |
| COUN-0006 | spotify-ab | LABR-0004 |
| COUN-0007 | salesforce-inc | LABR-0008 |

**t_schemaorg_org_country_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | checksum | xsd:string |
| COUN-0002 | created_date | xsd:date |
| COUN-0003 | identifier | cco:DesignativeICE |
| COUN-0004 | license | xsd:string |
| COUN-0005 | mime_type | xsd:string |
| COUN-0006 | size_bytes | xsd:long |
| COUN-0007 | uri | xsd:string |
| COUN-0008 | version | xsd:integer |

**t_schemaorg_org_country_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | 2023-05-13 |
| COUN-0002 | COUN-0002 | COUN-0002 | 2024-09-06 |
| COUN-0003 | COUN-0003 | COUN-0002 | 2025-06-05 |
| COUN-0004 | COUN-0004 | COUN-0002 | 2023-10-10 |
| COUN-0005 | COUN-0005 | COUN-0002 | 2025-03-25 |
| COUN-0006 | COUN-0006 | COUN-0002 | 2023-04-28 |
| COUN-0007 | COUN-0007 | COUN-0002 | 2023-03-22 |

**t_schemaorg_org_country_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0006 | 22 |
| COUN-0002 | COUN-0001 | COUN-0008 | 3 |
| COUN-0003 | COUN-0002 | COUN-0006 | 233 |
| COUN-0004 | COUN-0002 | COUN-0008 | 6 |
| COUN-0005 | COUN-0003 | COUN-0006 | 206 |
| COUN-0006 | COUN-0003 | COUN-0008 | 4 |
| COUN-0007 | COUN-0004 | COUN-0006 | 347 |
| COUN-0008 | COUN-0004 | COUN-0008 | 3 |

**t_schemaorg_org_country_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 5e8f3c91 |
| COUN-0002 | COUN-0001 | COUN-0003 | doi:10.1109/x |
| COUN-0003 | COUN-0001 | COUN-0004 | proprietary |
| COUN-0004 | COUN-0001 | COUN-0009 | zone-b |
| COUN-0005 | COUN-0001 | COUN-0005 | text/plain |
| COUN-0006 | COUN-0001 | COUN-0010 | Name 06 |
| COUN-0007 | COUN-0001 | COUN-0011 | analytics |
| COUN-0008 | COUN-0001 | COUN-0012 | Tags 08 |