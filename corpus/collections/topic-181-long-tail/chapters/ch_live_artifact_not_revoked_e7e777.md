---
chapter_id: ch_live_artifact_not_revoked_e7e777
topic_id: 181
family: 07_long_tail
cited_terms: ['artifact_not_revoked', 'settlement_financing_activity', 'constraint_only_constrains']
model: engine-refine
---

Artifact governance in this framework rests on a core entity model where each artifact—identified by a unique code such as `REVO-0001` through `REVO-0004`—represents a tracked resource like `audit-log-sept`, `compliance-report-x`, `schema-def-current`, or `dataset-sanitized`. Each artifact is associated with a secondary artifact, for instance `backup-manifest-9` or `inference-pipeline-3`, establishing a lineage or dependency relationship that supports traceability. The attribute system decouples metadata from the artifact itself: attribute definitions such as `checksum`, `created_date`, `identifier`, and `license` are declared with their corresponding types—`xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string`—allowing the schema to evolve without restructuring the core entity table. Values for these attributes are stored in type-specific value tables, ensuring data integrity at the storage layer. A checksum might appear as the hexadecimal string `c0ffee42`, a creation date as `2024-01-18` or `2023-09-26`, a license as `Apache-2.0`, and an operational reference such as `rack-7` or `ref-8842`, each routed to the appropriate value table based on its declared type. Integer-valued attributes capture quantitative metadata—values like `140` or `115` for one attribute and `2` for another—while the entity-attribute relationship is maintained through foreign keys that link each value back to both its owning entity and its defining attribute.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

Settlement financing activities operate within a parallel but structurally analogous governance model. Activities such as `T-PLUS-ONE-CLEAR`, `INTERBANK-SETTLE`, `CASH-SETTLE-99`, and `SEC-SETTLE-8812` are each assigned to a financial institution—`HSBC Holdings`, `Goldman Sachs`, or `Deutsche Bank AG`—and tied to a settlement project that defines the intended benefit, such as the `SWIFT GPI Rollout`, `Regional Clearing Hub`, or `Cross-Border Rail` initiative. This tripartite linkage between activity, funding institution, and project outcome enables auditability of capital flows and ensures that every settlement operation can be traced to both its source of funds and its designated beneficiary program. The pattern mirrors the artifact model: a core entity table provides the primary identifiers and relationships, while the attribute-value separation allows for extensible metadata without schema modification.

**t_settlement_financing_activity**

| id | settlement_financing_activity | funds | benefits |
| --- | --- | --- | --- |
| ACTI-0001 | T-PLUS-ONE-CLEAR | HSBC Holdings | SWIFT GPI Rollout |
| ACTI-0002 | INTERBANK-SETTLE | Goldman Sachs | Regional Clearing Hub |
| ACTI-0003 | CASH-SETTLE-99 | Deutsche Bank AG | SWIFT GPI Rollout |
| ACTI-0004 | SEC-SETTLE-8812 | Deutsche Bank AG | Cross-Border Rail |
| ACTI-0005 | CASH-SETTLE-99 | Deutsche Bank AG | Cross-Border Rail |

Constraints form a third governance layer, enforcing operational and compliance rules across the system. A constraint such as `log_level_filter`, `checksum_algorithm`, or `data_retention_policy` applies to one or more target components—`query_engine`, `network_interface`, or `telemetry_streams`—and carries its own set of typed attributes. The constraint attributes include `effective_date` (typed as `xsd:date`), `enforcement` (`xsd:string`), `mandatory` (`xsd:boolean`), and `priority` (`xsd:integer`), each stored in dedicated value tables. Boolean enforcement flags take values of `true` or `false`, effective dates range from `2023-06-09` to `2025-06-06`, and integer priorities span from `1` to `996`, with additional string-valued attributes capturing operational details such as `Encoding 01`, `Enforcement 02`, `intake form`, or `ja`. This separation of constraint definitions from their parameter values allows the same constraint to be reconfigured across different environments or time periods without altering the constraint's structural identity.

The unified design across all three domains—artifacts, settlement activities, and constraints—follows an entity-attribute-value (EAV) pattern that prioritizes flexibility and type safety. By routing attribute values into type-specific tables (`val_date`, `val_int`, `val_varchar`, `val_boolean`), the system enforces schema-level constraints on data types while preserving the ability to add new attributes without DDL changes. Foreign keys from value tables back to both the entity and the attribute definition create a navigable graph: any value can be traced to its source entity, its defining attribute, and the attribute's declared type. This structure supports complex queries across heterogeneous metadata—such as retrieving all artifacts created after a certain date, all constraints with mandatory enforcement active in a given period, or all settlement activities funded by a particular institution—while maintaining referential integrity through the identifier columns that anchor each table.

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |