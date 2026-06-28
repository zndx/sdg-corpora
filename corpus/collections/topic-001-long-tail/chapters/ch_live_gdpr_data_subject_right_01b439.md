---
chapter_id: ch_live_gdpr_data_subject_right_01b439
topic_id: 1
family: 07_long_tail
cited_terms: ['gdpr_data_subject_right', 'gdpr_lawful_basis', 'hipaa_safeguard_admin']
model: engine-refine
---

In regulatory data management, the identifier serves as the immutable anchor for every entity within a compliance framework. Each record—whether a data subject right such as the Right to Portability under the Australia Privacy Act, a lawful basis like Legitimate interests under the NIS Directive, or a HIPAA safeguard such as Audit Controls under the Privacy Rule—is assigned a unique key, conventionally formatted as a domain prefix followed by a sequential number: RIGH-0001, BASI-0001, ADMI-0001. These identifiers are not arbitrary; they encode both the semantic category of the entity and its position within a controlled enumeration, enabling unambiguous cross-referencing across the entire schema. The entity itself constitutes the primary business object—the right, the basis, the safeguard—alongside its defining metadata, including the originating regulation (GDPR Article 6, California CCPA, the Swiss FADP) and its operational label.

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | NIS Directive | Right to Portability |
| RIGH-0002 | California CCPA | Singapore PDPA |
| RIGH-0003 | Swiss FADP | UK GDPR |
| RIGH-0004 | GDPR Article 6 | Australia Privacy Act |
| RIGH-0005 | Right to Restrict Processing | Switzerland FADP |
| RIGH-0006 | NIS Directive | China PIPL |

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | NIS Directive | Legitimate interests |
| BASI-0002 | California CCPA | Health research |
| BASI-0003 | Right to Restrict Processing | Health research |
| BASI-0004 | California CCPA | Marketing opt-in |
| BASI-0005 | Right to Object | Explicit consent |
| BASI-0006 | Japan APPI | Legitimate interests |

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | Audit Controls |
| ADMI-0002 | Security Rule | Omnibus Modification |
| ADMI-0003 | Transactions Rule | e-Signature Rule |
| ADMI-0004 | Contingency Plan | Security Policy |
| ADMI-0005 | Audit Controls | Access Control |
| ADMI-0006 | Unique ID Rule | Unique ID Rule |
| ADMI-0007 | HITECH Amendment | Incident Response |

Attributes extend the entity model by attaching structured properties to each entity, transforming a flat record into a multi-dimensional compliance object. The attribute definition layer specifies both the name of the property—effective_date, enforcement, mandatory, priority—and its semantic type, drawn from the XSD namespace: xsd:date for temporal values, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric measures. This separation of attribute schema from attribute values is deliberate; it permits the addition of new properties to existing entities without schema migration, and it enforces type discipline at the metadata level. For instance, the mandatory attribute is typed as xsd:boolean, constraining its values to true or false, while priority is typed as xsd:integer, allowing values such as 5, 122, 3, or 392 to express relative urgency or ordering.

The entity-attribute relationship is materialized through a value-resolution mechanism that distributes actual data across type-specific value tables. Each value row carries an entity_id, which references the identifier of the entity to which the attribute belongs, and an attr_id, which references the identifier of the attribute definition. This dual foreign-key structure ensures that every value is traceable to both its owner and its schema. Consider the boolean value table: a row with entity_id ADMI-0001 and attr_id ADMI-0003 stores the value true, indicating that the HIPAA safeguard identified as ADMI-0001—Security Policy under the Contingency Plan—has its mandatory attribute set to true. Conversely, entity_id ADMI-0002 with the same attr_id yields false, signaling that the Security Rule's Omnibus Modification safeguard is not mandatory. The same attr_id pattern recurs across all three domains: RIGH-0003, BASI-0003, and ADMI-0003 all resolve to the mandatory attribute within their respective entity families, enabling consistent interpretation of compliance obligation across regulatory regimes.

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

Date, integer, and string values follow the identical resolution pattern, each stored in its own typed value table to preserve type safety and query efficiency. The date value table records effective dates such as 2025-05-21 for the Right to Portability entity and 2023-01-18 for the Audit Controls safeguard, anchoring each entity to a temporal lifecycle. The integer value table captures quantitative measures—priority scores of 4 and 683 for the Legitimate interests basis, or counts of 309 and 623 for HIPAA safeguards—while the varchar table holds unstructured annotations like Encoding 01, Enforcement 02, change rationale, and intake form. The presence of locale-specific values such as ja and fr within the varchar table further demonstrates how the model accommodates multilingual regulatory documentation without requiring schema changes.

This architecture—identifier as primary key, entity as business object, attribute as extensible property, and value as type-dispatched fact—forms a normalized, polyglot storage pattern that scales across regulatory domains. The repetition of the same attribute schema (effective_date, enforcement, mandatory, priority) across GDPR data subject rights, GDPR lawful bases, and HIPAA safeguards is not redundancy but intentional alignment: it enables comparative analysis, such as determining whether a lawful basis marked mandatory (true) under the NIS Directive carries the same effective_date as a data subject right marked mandatory (false) under the California CCPA. The model's strength lies in its ability to represent heterogeneous compliance data—boolean obligations, temporal deadlines, numeric priorities, free-text rationales—within a single coherent framework, where every value is anchored to an entity by identifier and to a schema by attribute.

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |

**t_gdpr_lawful_basis_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BASI-0001 | effective_date | xsd:date |
| BASI-0002 | enforcement | xsd:string |
| BASI-0003 | mandatory | xsd:boolean |
| BASI-0004 | priority | xsd:integer |
| BASI-0005 | review_cycle_days | xsd:integer |
| BASI-0006 | scope | xsd:string |
| BASI-0007 | encoding | xsd:string |
| BASI-0008 | label_text | xsd:string |

**t_gdpr_lawful_basis_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0003 | false |
| BASI-0002 | BASI-0002 | BASI-0003 | true |
| BASI-0003 | BASI-0003 | BASI-0003 | true |
| BASI-0004 | BASI-0004 | BASI-0003 | false |
| BASI-0005 | BASI-0005 | BASI-0003 | true |
| BASI-0006 | BASI-0006 | BASI-0003 | false |

**t_gdpr_lawful_basis_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0001 | 2023-01-18 |
| BASI-0002 | BASI-0002 | BASI-0001 | 2023-01-24 |
| BASI-0003 | BASI-0003 | BASI-0001 | 2025-03-25 |
| BASI-0004 | BASI-0004 | BASI-0001 | 2023-04-09 |
| BASI-0005 | BASI-0005 | BASI-0001 | 2024-12-12 |
| BASI-0006 | BASI-0006 | BASI-0001 | 2025-03-12 |

**t_gdpr_lawful_basis_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0004 | 4 |
| BASI-0002 | BASI-0001 | BASI-0005 | 683 |
| BASI-0003 | BASI-0002 | BASI-0004 | 4 |
| BASI-0004 | BASI-0002 | BASI-0005 | 470 |
| BASI-0005 | BASI-0003 | BASI-0004 | 2 |
| BASI-0006 | BASI-0003 | BASI-0005 | 535 |
| BASI-0007 | BASI-0004 | BASI-0004 | 1 |
| BASI-0008 | BASI-0004 | BASI-0005 | 87 |

**t_gdpr_lawful_basis_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0007 | Encoding 01 |
| BASI-0002 | BASI-0001 | BASI-0002 | Enforcement 02 |
| BASI-0003 | BASI-0001 | BASI-0008 | intake form |
| BASI-0004 | BASI-0001 | BASI-0009 | ja |
| BASI-0005 | BASI-0001 | BASI-0006 | Scope 05 |
| BASI-0006 | BASI-0002 | BASI-0007 | Encoding 06 |
| BASI-0007 | BASI-0002 | BASI-0002 | Enforcement 07 |
| BASI-0008 | BASI-0002 | BASI-0008 | nightly summary |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |