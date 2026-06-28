---
chapter_id: ch_live_program_with_entry_exactly_one_eefcab
topic_id: 10
family: 01_foundation
cited_terms: ['program_with_entry_exactly_one', 'column_nullability_state', 'ebpfmap_basic']
model: engine-refine
---

ATTRIBUTES, their typed values, and the categorical taxonomies that organize them constitute the foundational metadata layer for data quality governance and system observability. An attribute—whether designated as confidence, dimension_kind, method, or recorded_at—carries a precise type constraint drawn from the XML Schema Definition namespace: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal anchors. This type discipline ensures that every value assigned to an attribute conforms to its declared schema, preventing type coercion errors at ingestion time. The nullability state of a column—REQUIRED, NOT_NULL, or OPTIONAL—further constrains whether an attribute must be populated, may be absent, or must hold a non-null value, thereby establishing enforceable data quality boundaries. For instance, the timestamp_utc column carries a REQUIRED nullability state, while latency_ms is governed by a NOT_NULL constraint, and the system permits OPTIONAL columns where data may be legitimately sparse.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | REQUIRED |
| STAT-0002 | checksum_sha256 | REQUIRED |
| STAT-0003 | latency_ms | NOT_NULL |
| STAT-0004 | timestamp_utc | OPTIONAL |
| STAT-0005 | timestamp_utc | PROVISIONAL |
| STAT-0006 | checksum_sha256 | NULLABLE |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

The entity-attribute-value model decomposes complex metadata into a normalized triad: an entity identifier, an attribute reference, and a typed value stored in a type-specific fact table. Entity STAT-0001, for example, carries a decimal confidence value of 0.294 alongside a secondary decimal measurement of 568.73, while the same entity is associated with varchar attributes encoding Dimension Kind 01, Encoding 02, intake form, and the locale code fr. Temporal attributes resolve to ISO 8601 timestamps—2024-12-29T19:38:29, 2023-05-04T12:31:25, 2023-11-12T04:10:53, 2024-08-13T21:58:19—each anchored to a specific entity-attribute pair through the attr_id foreign key. This decomposition permits heterogeneous value types to coexist without schema mutation, as decimal, varchar, and datetime values are materialized in separate fact tables keyed by the same entity_id and attr_id columns.

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

The eBPF map dimension and fact tables provide a parallel taxonomy for kernel-level observability data, where each map is identified by a composite key such as EBPF-0001 through EBPF-0005 and classified into a category—Ebpfmap Category 01 through Ebpfmap Category 04—alongside a human-readable label. The fact table records the physical footprint of each map in bytes: EBPF-0001 occupies 354,373,995 bytes, EBPF-0002 spans 208,979,093 bytes, EBPF-0002's counterpart EBPF-0005 measures 156,714,508 bytes, and EBPF-0003 consumes 31,105,012 bytes. These size measurements, coupled with version identifiers ranging from 3 through 12, enable capacity planning and regression analysis across kernel subsystem evolutions. The ebpfmap_key column in the fact table references the dimension table's primary key, establishing a star-schema relationship that separates categorical metadata from quantitative measurements.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Programmatic entities follow a similar identification and versioning discipline. The program inventory_sync, associated with the entry point api_gateway and the main.py module, is tracked under the identifier ARN:res/41 across versions 12 and 3, suggesting concurrent deployments or canary releases. The nightly_etl pipeline, also keyed to ARN:res/41 and api_gateway, carries version 8, while health_check resolves to a distinct identifier, ref-8842, with entry point cron_trigger and version 11. These version numbers—12, 3, 8, 11—serve as immutable snapshots of program state, enabling audit trails and rollback procedures. The identifier field, whether an Amazon Resource Name such as ARN:res/41 or a short-form reference like ref-8842, provides a globally unique handle that persists across environment boundaries, while the entry_point column documents the invocation mechanism, whether through an API gateway, a Python module, or a cron-triggered scheduler.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |