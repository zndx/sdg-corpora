---
chapter_id: ch_live_dataset_snapshot_subclass_af7bbc
topic_id: 17
family: 07_long_tail
cited_terms: ['dataset_snapshot_subclass', 'dataset_subclass', 'dataset_under_audit']
model: engine-refine
---

Attributes, their types, categories, and the entities they describe form the backbone of any data governance framework, providing the semantic scaffolding that transforms raw datasets into auditable, traceable assets. An attribute is a named property of an entity, and its type constrains the domain of permissible values. In the audit registry, attribute definitions such as `duration_seconds` typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string` establish a strict schema that governs how downstream value tables are populated. The type discipline is enforced through physical separation: decimal values like `1678.44`, `5254.25`, `582.65`, and `741.84` reside in a dedicated decimal store; integer values such as `966`, `22`, `222`, and `333` in an integer partition; datetime stamps including `2025-02-12T00:42:30`, `2024-03-05T07:28:41`, and `2024-05-20T18:48:03` in a temporal table; and string literals like `node-a01`, `execution`, and `running` in a variable-character store. This type-partitioned architecture ensures that each attribute value is validated at ingestion against its declared XSD type, preventing type coercion errors and enabling precise query optimization across heterogeneous data domains.

**t_dataset_under_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_dataset_under_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2025-02-12T00:42:30 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-05T07:28:41 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-05-20T18:48:03 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-01-27T02:28:31 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2023-01-08T19:31:43 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2023-02-20T22:50:34 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-12-18T21:18:14 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-04-14T04:31:20 |

**t_dataset_under_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 1678.44 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 5254.25 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 582.65 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 741.84 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 6993.92 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 111.23 |

**t_dataset_under_audit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 966 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 22 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 222 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 333 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 372 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 83 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 123 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 109 |

**t_dataset_under_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | gw-12 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | review |

Entities serve as the primary keys that bind attributes to their values, creating a normalized star schema where the audit entity table anchors a constellation of value tables. Each audit record—identified by keys such as `AUDI-0001` and `AUDI-0002`—functions as an entity that can carry multiple attributes of different types. The entity identifier `AUDI-0001`, for instance, is associated with the decimal value `1678.44` via attribute `AUDI-0001`, the datetime `2025-02-12T00:42:30` via attribute `AUDI-0002`, the integer `966` via attribute `AUDI-0003`, and the string `node-a01` via attribute `AUDI-0004`. This many-to-many relationship between entities and attributes, mediated through the value tables, allows a single entity to accumulate a rich, heterogeneous profile without requiring a monolithic row structure. The design supports extensibility: new attributes can be defined in the audit attribute table and populated in their corresponding value tables without schema migration of the entity table itself.

Identifiers and categories provide the organizational taxonomy that makes large-scale data governance tractable. Every dataset, snapshot, and audit record carries a unique identifier—`SNAP-0001` through `SNAP-0004` for snapshots, `DATA-0001` through `DATA-0004` for dataset subclasses, and `AUDI-0001` through `AUDI-0004` for audit records—enabling unambiguous reference across the entire data catalog. Snapshots are further classified by category, with labels such as `Snapshot Of Category 01` through `Snapshot Of Category 04` and corresponding display labels like `Snapshot Of Label 01` through `Snapshot Of Label 04`, providing a human-readable classification layer atop the machine-resolvable identifiers. This dual-layer identification—machine keys for referential integrity and human-readable labels for operational clarity—is essential in environments where datasets span multiple domains, from `customer_transactions_2023` and `financial_ledger_q4` to `genomic_variant_calls` and `satellite_imagery_band4`.

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

**t_dataset_subclass**

| id | dataset | column | location | name |
| --- | --- | --- | --- | --- |
| DATA-0001 | customer_transactions_2023 | latency_ms | eu-west-3 | IoT Device Inventory |
| DATA-0002 | financial_ledger_q4 | sensor_id | rack-7 | Supply Chain Manifest |
| DATA-0003 | genomic_variant_calls | patient_id | rack-7 | Genomic Variant Registry |
| DATA-0004 | financial_ledger_q4 | device_mac | us-east-1 | Geo Spatial Raster Map |
| DATA-0005 | compliance_audit_log | geo_lat | us-east-1 | Supply Chain Manifest |
| DATA-0006 | iot_device_registry | temperature_c | rack-7 | IoT Device Inventory |
| DATA-0007 | patient_vitals_2023 | temperature_c | on-prem-dc1 | Financial Ledger Q1 |
| DATA-0008 | genomic_variant_calls | patient_id | eu-west-3 | Clinical Vitals Archive |

**t_dataset_under_audit**

| id | dataset |
| --- | --- |
| AUDI-0001 | genomics_variant_call |
| AUDI-0002 | supply_chain_logs |
| AUDI-0003 | satellite_imagery_band4 |
| AUDI-0004 | iot_sensor_readings |
| AUDI-0005 | supply_chain_manifest |
| AUDI-0006 | patient_vitals_2023 |

Location metadata and size constraints operationalize the physical governance of data assets. Dataset subclasses carry location attributes such as `eu-west-3` and `rack-7`, anchoring logical datasets to their physical or logical deployment targets. The dataset `genomic_variant_calls` and `financial_ledger_q4` both reside at `rack-7`, indicating that co-location is determined by operational requirements rather than dataset identity. Size metadata, expressed in bytes, provides capacity planning and cost attribution: snapshot `SNAP-0004` occupies `676110880` bytes, `SNAP-0002` consumes `501391865` bytes, `SNAP-0001` holds `350697080` bytes, and `SNAP-0003` is comparatively compact at `31504133` bytes. These size figures, combined with version numbers such as `10`, `5`, and `2`, enable precise tracking of data growth and change history.

The snapshot lineage mechanism, implemented through a foreign-key relationship between the fact dataset table and the snapshot dimension table, establishes a parent-child hierarchy that supports data provenance and version control. The `snapshot_of_key` column in the fact dataset table references the identifier in the snapshot dimension table, creating a directed acyclic graph of snapshot dependencies. Snapshot `SNAP-0004` is a snapshot of `SNAP-0003`, which in turn is a snapshot of `SNAP-0002`, forming a lineage chain that can be traversed to reconstruct the evolution of any data asset. This lineage, combined with the version numbers and size metadata, provides a complete audit trail: any stakeholder can determine not only what a dataset contains at a given version, but also its size, its position in the snapshot hierarchy, and its categorical classification.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |