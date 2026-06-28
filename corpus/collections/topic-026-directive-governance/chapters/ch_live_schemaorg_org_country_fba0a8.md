---
chapter_id: ch_live_schemaorg_org_country_fba0a8
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_org_country', 'evidence_for_audit', 'policy_subclass']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the structural backbone of any system that must track heterogeneous data across domains while preserving type safety and referential integrity. An entity represents a distinct real-world object or concept—such as a corporate entity identified by a schemaorg name like `tesla-inc` or `oracle-corp` registered in a particular country, an audit evidence record labeled `AuditTrail_20231015` or `ChainOfCustody_Batch44`, or a governance policy such as the `Telemetry Privacy Standard` governing `Data Lakes`. Each entity receives a stable, machine-readable identifier—`COUN-0001`, `AUDI-0001`, `POLI-0001`—that serves as the anchor for all subsequent attribute-value associations. These identifiers are not merely labels; they are the foreign keys that bind typed attribute values back to their parent entities, ensuring that every piece of metadata can be traced to its source.

**t_schemaorg_org_country**

| id | schemaorg | country |
| --- | --- | --- |
| COUN-0001 | tesla-inc | South Korea |
| COUN-0002 | oracle-corp | Australia |
| COUN-0003 | apple-inc | India |
| COUN-0004 | adobe-systems | United Kingdom |
| COUN-0005 | apple-inc | Japan |
| COUN-0006 | spotify-ab | France |
| COUN-0007 | salesforce-inc | Australia |

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

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

Attribute types define the semantic shape of the data that can be attached to an entity. Rather than storing all values as generic strings, the system distinguishes between `xsd:string` for free-form text, `xsd:date` and `xsd:dateTime` for temporal data, `xsd:integer` and `xsd:decimal` for numeric measures, `xsd:boolean` for binary flags, and domain-specific types such as `cco:DesignativeICE` for designative identifiers. This type discipline is declared once per attribute definition and then enforced at the value layer. For instance, the attribute `created_date` is typed as `xsd:date`, which constrains its values to calendar dates like `2023-05-13` or `2024-09-06`; the attribute `confidence` is typed as `xsd:decimal`, restricting its values to precise measures such as `0.978` or `0.546`; and the attribute `mandatory` is typed as `xsd:boolean`, accepting only `true` or `false`. By separating attribute definitions from their values, the system can validate data at ingestion and guarantee that a date field never receives a string, or that a boolean never receives an integer.

The value tables implement this type discipline through a vertical partitioning strategy: each attribute type has its own dedicated value table, and every row in a value table carries three foreign keys—the entity identifier, the attribute identifier, and the typed value itself. This design means that the entity `COUN-0001` (associated with `tesla-inc` in `South Korea`) can simultaneously hold a checksum value of `5e8f3c91` in the varchar value table, a `created_date` of `2023-05-13` in the date value table, and an integer measure of `22` in the integer value table, with each value independently queryable and type-safe. Similarly, the audit evidence record `AUDI-0001` carries a confidence score of `0.978` in the decimal value table, a recorded timestamp of `2024-10-15T21:07:57` in the datetime value table, and a dimension kind of `Dimension Kind 01` in the varchar value table. The same pattern applies to policy entities: `POLI-0001` (the `Telemetry Privacy Standard`) has an effective date of `2023-01-31`, a priority integer of `1`, a mandatory flag of `false`, and a string value of `Encoding 01`, each stored in its respective typed value table.

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |

This architecture yields several operational advantages. First, it enables fine-grained access control and auditing: an auditor can query the datetime value table to reconstruct the full temporal provenance of evidence records, retrieving timestamps such as `2024-11-22T11:38:19` or `2023-06-03T22:32:06` without touching unrelated string or numeric attributes. Second, it supports schema evolution without migration: adding a new attribute type requires only a new value table and a corresponding entry in the attribute definition table, leaving existing data untouched. Third, it simplifies data validation because each value table enforces a single type constraint at the database level. The attribute definition tables—such as those listing `checksum`, `created_date`, `identifier`, and `license` for country entities, or `confidence`, `dimension_kind`, `method`, and `recorded_at` for audit evidence—serve as the canonical registry of what metadata is permissible, while the value tables hold the actual instances. Together, these three layers—entities, attribute definitions, and typed values—constitute a flexible yet rigorous metadata framework that scales across domains without sacrificing type safety or traceability.