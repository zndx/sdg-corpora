---
chapter_id: ch_live_requirement_satisfies_5a44c4
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_satisfies', 'column_type_changed_from', 'control_with_classification_tier']
model: engine-refine
---

Governance frameworks rely on a structured attribute model to describe, classify, and prioritize controls and requirements across an organization. At the foundation, each record carries an identifier—a unique key such as SATI-0001 or TIER-0003—that anchors the entity, the real-world object or concept being described. An entity might represent a control like "Input sanitization" or "Role based access," or a requirement such as "Encryption Standard AES-256" or "ISO 27001 Annex A." The entity is then characterized by a set of attributes, each with a name and a declared type. Attribute names like effective_date, enforcement, mandatory, and priority are bound to strict data types—xsd:date, xsd:string, xsd:boolean, xsd:integer—which enforce schema discipline and ensure that values stored against them are semantically consistent. This separation of attribute definition from value storage allows the same attribute schema to be reused across many entities without duplication.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

The classification of attributes extends beyond their data type into categorical groupings that support filtering, reporting, and auditability. A dimension table for type changes, for instance, assigns each type-change record a label and a category—Type Changed From Category 01 through 04—enabling downstream systems to group and reason about historical modifications. Similarly, the satisfaction of requirements is governed by a priority field and a scope field that together determine urgency and applicability. The requirement "Encryption Standard AES-256" is satisfied by the "FIPS 140-2 Module" at priority 1 and regional scope, signaling that this is a high-urgency, broadly applicable control. By contrast, "Audit Trail Mandate" satisfied by "Data Masking Engine" carries priority 5 at team scope, indicating a lower-priority, narrowly scoped mapping. These two fields allow governance teams to triate remediation efforts and allocate resources proportionally to risk exposure.

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |

When entities carry typed attributes, values are stored in dedicated value tables keyed by both the entity and the attribute. A boolean attribute such as mandatory might resolve to true for entity TIER-0002 and false for TIER-0001, while a date attribute like effective_date records values such as 2023-02-10 or 2024-01-29 for the same entity. Integer attributes capture quantitative measures—values like 715 or 86 for entity TIER-0001 against attribute TIER-0005—and varchar attributes hold free-form text such as "audit excerpt" or "Encoding 01." This normalized value-store pattern ensures that each attribute type is handled by the appropriate storage and validation logic, while the entity_id and attr_id foreign keys maintain referential integrity across the model.

Data quality and change tracking introduce two additional dimensions: confidence and uncertainty. In the fact table that records column type changes, each observation carries a confidence score—0.164, 0.068, 0.107, 0.354—and a corresponding uncertainty metric—560.21, 744.10, 984.09, 404.01. These paired values quantify the reliability of the underlying measurement or inference, allowing auditors and data stewards to flag low-confidence observations for manual review. The type_changed_from field itself traces the lineage of a change, linking back to a prior state identifier such as FROM-0006 or FROM-0003, thereby preserving an auditable trail of how data definitions evolved over time. Together, confidence, uncertainty, and type_changed_from form a lightweight provenance layer that complements the static attribute model with dynamic quality signals.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |