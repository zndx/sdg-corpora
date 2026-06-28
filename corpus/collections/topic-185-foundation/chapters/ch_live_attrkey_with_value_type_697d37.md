---
chapter_id: ch_live_attrkey_with_value_type_697d37
topic_id: 185
family: 01_foundation
cited_terms: ['attrkey_with_value_type', 'entity_type_belongs_to', 'control_min_one_owner']
model: engine-refine
---

Attribute keys serve as the canonical identifiers for metadata fields across the system, each bound to a specific value type, a checksum algorithm, and a classification code. The attribute key `config_hash` is associated with value type `OWNE-0002` and secured by the `md5` algorithm, while `data_quality_flag` and `event_type` both reference `OWNE-0003` and `OWNE-0005` respectively, each employing `sha256` for integrity verification. The `timestamp_utc` key maps to `OWNE-0001` and uses `md5` as its checksum mechanism. These mappings are further annotated with codes such as `A-01`, `C-07`, and `E-21`, which provide an additional layer of categorization for governance and audit purposes. The pairing of a checksum algorithm with each attribute key ensures that any modification to stored values can be detected through cryptographic comparison, a requirement for compliance frameworks that mandate data integrity controls.

**t_attrkey_with_value_type**

| id | attrkey | value_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | config_hash | OWNE-0002 | md5 | C-07 |
| TYPE-0002 | data_quality_flag | OWNE-0003 | sha256 | A-01 |
| TYPE-0003 | event_type | OWNE-0005 | sha256 | A-01 |
| TYPE-0004 | timestamp_utc | OWNE-0001 | md5 | E-21 |
| TYPE-0005 | batch_number | OWNE-0002 | md5 | E-21 |
| TYPE-0006 | timestamp_utc | OWNE-0007 | sha1 | E-21 |
| TYPE-0007 | device_mac | OWNE-0002 | md5 | C-07 |
| TYPE-0008 | firmware_version | OWNE-0005 | blake2b | B-12 |

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | OWNE-0002 |
| BELO-0002 | sensor_node_47 | OWNE-0007 |
| BELO-0003 | governance_policy_fin | OWNE-0004 |
| BELO-0004 | sensor_node_47 | OWNE-0004 |
| BELO-0005 | edge_gateway_12 | OWNE-0001 |
| BELO-0006 | edge_gateway_12 | OWNE-0004 |
| BELO-0007 | ml_feature_store_prod | OWNE-0001 |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |

Entity classification operates through a separate but parallel mechanism, where physical and logical resources are assigned to entity types using the same `OWNE`-prefixed namespace. Devices such as `edge_gateway_12` and `sensor_node_47` are registered under entity types `OWNE-0002` and `OWNE-0007`, while the governance policy `governance_policy_fin` is classified under `OWNE-0004`. Notably, `sensor_node_47` appears under two distinct entity types—`OWNE-0007` and `OWNE-0004`—indicating that entities may participate in multiple classification hierarchies simultaneously. This many-to-many relationship between entities and types enables flexible organizational structures where a single device or policy can be evaluated against different governance criteria depending on context.

The attribute schema for each entity type is defined independently, specifying the names and XML Schema types of the properties that apply to that classification. For entity type attributes, the system defines `confidence` as an `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as an `xsd:dateTime`. Similarly, control definitions such as `Rate Limit Threshold`, `Encryption At Rest`, `RBAC Assignment Policy`, and `Backup Retention Directive` each carry their own attribute set: `effective_date` typed as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. The separation of attribute definitions from their stored values allows the schema to evolve independently of the data, supporting versioned policy updates without requiring structural migrations.

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

Actual attribute values are persisted in type-specific value tables, each keyed to an entity and an attribute definition. Decimal attributes store floating-point measurements such as `0.703`, `525.54`, `691.11`, and `0.351`, representing confidence scores or dimensional readings from sensor infrastructure. String attributes capture categorical and descriptive data including `Dimension Kind 01`, `Encoding 02`, `nightly summary`, and locale codes like `es` and `de`. Boolean attributes encode enforcement posture, with values of `true` and `false` indicating whether controls such as `RBAC Assignment Policy` are mandatory. Date attributes record policy effective dates ranging from `2023-01-26` through `2025-01-07`, while integer attributes store priority levels and numeric thresholds such as `5`, `245`, `1`, and `705`. Timestamp attributes capture precise event times in ISO 8601 format, with values like `2025-04-30T12:57:36` and `2023-11-10T02:05:22` providing an auditable chronology of data collection and policy application.