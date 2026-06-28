---
chapter_id: ch_live_column_version_subclass_651630
topic_id: 1
family: 07_long_tail
cited_terms: ['column_version_subclass', 'trace_has_resource', 'control_only_addresses_threat_class']
model: engine-refine
---

Attributes, their types, and the entities to which they attach constitute the fundamental units of structured metadata in governed data ecosystems. An attribute is a named property—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—that describes a characteristic of a domain entity. Each attribute carries a declared type, drawn from the XML Schema definition language: `xsd:decimal` for numeric measures like `0.648` or `428.43`, `xsd:string` for categorical labels such as `Dimension Kind 01` or `intake form`, `xsd:dateTime` for temporal stamps like `2024-04-09T04:38:55`, `xsd:boolean` for binary flags, `xsd:date` for calendar dates including `2024-12-09` and `2025-01-04`, and `xsd:integer` for whole-number values ranging from `5` to `99`. The type declaration is not merely a convenience; it enforces value constraints at ingestion, enabling downstream systems to reason about data quality without inspecting individual records.

Entities serve as the anchor points to which attributes bind. In the column-versioning domain, entities are identified by codes such as `VERS-0001` through `VERS-0004`, each representing a specific column version that maps to underlying data fields like `timestamp_utc`, `operator_code`, or `humidity_pct` and is itself versioned under resource identifiers like `RESO-0001` or `RESO-0006`. In the trace-resource domain, entities carry identifiers such as `RESO-0001` through `RESO-0004`, linking execution traces—`batch-etl-nightly`, `lab-assay-protocol-2b`, `governance-audit-cycle-9`—to their target resources. In the control-threat domain, entities are tagged `THRE-0001` through `THRE-0004`, associating governance controls like `Multi-Factor Authentication`, `Incident Response Plan`, and `Access Review Policy` with the risk classes they mitigate. Across all three domains, the entity identifier functions as the stable key that unifies attribute definitions with their concrete values, regardless of the attribute's data type.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | RESO-0001 |
| VERS-0002 | operator_code | RESO-0006 |
| VERS-0003 | timestamp_utc | RESO-0004 |
| VERS-0004 | humidity_pct | RESO-0002 |
| VERS-0005 | sample_volume_ml | RESO-0003 |
| VERS-0006 | ph_level | RESO-0003 |

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | VERS-0005 |
| RESO-0002 | lab-assay-protocol-2b | VERS-0006 |
| RESO-0003 | governance-audit-cycle-9 | VERS-0005 |
| RESO-0004 | lab-assay-protocol-2b | VERS-0002 |
| RESO-0005 | ml-training-run-aurora | VERS-0006 |
| RESO-0006 | governance-audit-cycle-9 | VERS-0006 |
| RESO-0007 | lab-assay-protocol-2b | VERS-0002 |
| RESO-0008 | api-gateway-chain-alpha | VERS-0005 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | VERS-0004 |
| THRE-0002 | Incident Response Plan | VERS-0001 |
| THRE-0003 | Incident Response Plan | VERS-0002 |
| THRE-0004 | Access Review Policy | VERS-0005 |
| THRE-0005 | Backup Retention Schedule | VERS-0001 |
| THRE-0006 | Backup Retention Schedule | VERS-0003 |
| THRE-0007 | Access Review Policy | VERS-0002 |
| THRE-0008 | Incident Response Plan | VERS-0005 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

The separation of attribute definitions from their values is a deliberate architectural choice that supports schema evolution without data migration. Attribute metadata—name and type—resides in dedicated definition tables, while actual values are stored in type-specific value tables. A single entity such as `VERS-0001` may carry a decimal value of `0.648` for attribute `VERS-0001`, a datetime value of `2024-04-09T04:38:55` for attribute `VERS-0004`, and a varchar value of `Dimension Kind 01` for attribute `VERS-0002`, each stored in its respective value table and linked through the entity and attribute identifiers. This normalization eliminates type heterogeneity within a single table, simplifies indexing strategies, and allows the system to enforce type-specific validation rules at write time. The same pattern applies to trace resources, where `RESO-0001` holds a decimal duration of `6459.38`, an integer exit code of `866`, a datetime end time of `2024-06-04T06:37:56`, and a varchar host name of `node-b14`, each in its own value table.

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |

Identifier namespaces provide the final layer of structural discipline. The `VERS-` prefix designates column-version entities, `RESO-` designates trace-resource entities, and `THRE-` designates control-threat entities, ensuring that cross-domain joins remain unambiguous. Within each namespace, identifiers are sequential and stable, enabling referential integrity across the definition and value tables. The `RESO-` prefixed resource identifiers also appear as version references in the column-versioning domain—`RESO-0001` through `RESO-0006`—demonstrating that the same identifier space can serve dual purposes when the semantic context is clear. This disciplined use of namespaces, combined with the attribute-value separation, produces a metadata model that is both extensible and auditable, supporting the governance requirements of systems where data lineage, control effectiveness, and operational traceability are non-negotiable.