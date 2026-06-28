---
chapter_id: ch_live_schemaorg_creativework_date_cdd1ec
topic_id: 183
family: 07_long_tail
cited_terms: ['schemaorg_creativework_date', 'schemaorg_creativework_publisher', 'schemaorg_event_endtime']
model: engine-refine
---

In any structured data model, the identifier serves as the immutable anchor for every entity, ensuring that each record can be referenced unambiguously across the system. Creative works such as the Proof of Stake Paper or the Sentinel-2 Imagery Index are assigned identifiers like DATE-0001 and DATE-0002, while publisher records such as those for the NIST Cybersecurity Office and the AWS Documentation Team carry identifiers like PUBL-0001 and PUBL-0002. These identifiers are not merely labels; they are the foreign keys that bind disparate tables together, enabling relationships to be expressed without redundancy. The entity concept generalizes this idea: whether the subject is a creative work, a publisher, or a dimensional record, the entity is the real-world object being modeled, and its identifier is the handle by which all other tables refer to it.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Proof of Stake Paper |
| DATE-0002 | Sentinel-2 Imagery Index |
| DATE-0003 | API Gateway Config |
| DATE-0004 | Data Lineage Specification |
| DATE-0005 | Sentinel-2 Imagery Index |
| DATE-0006 | NLP Evaluation Benchmarks |

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | Human Genome Release | NIST Cybersecurity Office |
| PUBL-0002 | LoRaWAN Sensor Spec | AWS Documentation Team |
| PUBL-0003 | Quantum Error Correction | AWS Documentation Team |
| PUBL-0004 | Compliance Audit Log | NIST Cybersecurity Office |
| PUBL-0005 | Sentinel-2 Imagery Index | ISO Technical Committee |
| PUBL-0006 | Data Lineage Specification | AWS Documentation Team |
| PUBL-0007 | Observability Runbook | Elastic Search Team |
| PUBL-0008 | Quantum Error Correction | Apache Software Foundation |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

Attributes and their types form the descriptive layer that gives entities their properties. An attribute name such as checksum, created_date, identifier, or license defines what quality is being captured, while the attribute type—xsd:string, xsd:date, or cco:DesignativeICE—constrains the shape and semantics of the value. Values are stored in type-specific tables so that a date attribute like created_date holds values such as 2023-06-28 or 2024-12-26, an integer attribute might carry 72 or 54, and a string attribute could store 9d2b7a16 or ARN:res/41. This separation of attribute metadata from attribute values allows the schema to remain flexible: new attributes can be introduced without altering the underlying table structure, and each value table handles its own type constraints independently.

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

Relationships between entities are mediated through role-bearing association tables that explicitly name the nature of the connection. In the relationship between creative works and their published dates, a record might designate a schemaorg item as the subject and a date_published item as the target, with the role column specifying whether the connection is one of owner, contributor, or observer. This triad of subject, target, and role makes the semantics of the relationship machine-readable and auditable, rather than leaving it implicit in the table structure. The same pattern applies across the model: every foreign key pair is accompanied by a role that clarifies what the relationship means in domain terms.

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

At the operational level, the model tracks event end times and versioning to support temporal analysis and change management. The fact table records a size_bytes metric—values such as 895265030 or 998785819—alongside a version number like 3, 5, 4, or 8, and links to a dimensional event end time record through an event_end_time_key. The dimension table then provides a human-readable label, such as Event End Time Label 01, and a category classification like Event End Time Category 03. This separation of the numeric key from its descriptive label and category allows the fact table to remain lean and indexable while preserving the contextual information needed for reporting and governance.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |