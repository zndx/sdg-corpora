---
chapter_id: ch_live_policy_basic_115177
topic_id: 186
family: 03_directive_governance
cited_terms: ['policy_basic', 'nist80053_high_impact', 'ganglion_cyst_tissue_origin']
model: engine-refine
---

Policy governance in this framework rests on a normalized entity-attribute-value architecture that separates the definition of policy objects from the storage of their typed properties. The core policy registry—identified by handles such as POLI-0001 through POLI-0004—holds the canonical policy names, including the Privacy Compliance Policy, Access Control Policy, Acceptable Use Policy, and Security Baseline Policy. Each policy entity is then enriched through a dedicated attribute catalogue that declares property names and their corresponding XML Schema types: effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This separation ensures that adding a new attribute to a policy does not require schema migration on the entity table itself, and it enforces type discipline at the point of value insertion.

Attribute values are materialized across four type-specific value tables, each keyed by a composite of the policy entity identifier and the attribute identifier. Boolean attributes such as mandatory resolve to true or false, as seen when POLI-0002 carries a mandatory flag of true while POLI-0001, POLI-0003, and POLI-0004 are all false. Date attributes like effective_date anchor policies to specific calendar dates—2023-08-24 for POLI-0002, 2025-01-30 for POLI-0003, 2025-05-22 for POLI-0001, and 2025-06-16 for POLI-0004. Integer attributes capture numeric properties such as priority levels, where POLI-0001 holds values of 2 and 409 across two distinct attributes, and POLI-0002 holds 3 and 74. String attributes accommodate free-form and coded values alike, ranging from "Encoding 01" and "Enforcement 02" to "calibration record" and the locale code "en". This type-disaggregated design allows the system to enforce schema-level constraints per column while keeping the entity model flat and extensible.

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Privacy Compliance Policy |
| POLI-0002 | Access Control Policy |
| POLI-0003 | Acceptable Use Policy |
| POLI-0004 | Security Baseline Policy |
| POLI-0005 | Data Sharing Policy |
| POLI-0006 | Data Retention Policy |
| POLI-0007 | Security Baseline Policy |

**t_policy_basic_attr**

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

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

The same relational discipline extends to regulatory standards and their classification. A second entity set captures high-impact NIST publications and frameworks—NIST SP 800-171, NIST SP 800-61, Zero Trust Architecture, and NIST SP 800-161—each assigned a unique identifier from IMPA-0001 through IMPA-0004. These standards are then associated with impact levels such as Moderate, Tier-4, Severity-Medium, and Compliance-Low through a ternary junction table that records not only which standard maps to which level but also the nature of that mapping via a role column. In practice, IMPA-0006 is linked to IMPA-0002 with the role contributor, IMPA-0003 appears twice—once as contributor to IMPA-0003 and once as reviewer of IMPA-0003—and IMPA-0002 is linked to IMPA-0004 as observer. The role column thus encodes the semantic relationship between standard and impact classification, enabling queries that distinguish, for example, which standards actively contribute to a given impact tier versus those that merely observe it.

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

A parallel anatomical ontology follows the identical pattern, this time modeling ganglion cyst tissue origins and their connective tissue relationships. The origin catalogue lists four anatomical sites—sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment—each identified by ORIG-0001 through ORIG-0004. A companion table enumerates the connective tissue structures these origins belong to, including periosteal layer, joint capsule, deep fascia, and fibrous adventitia. The many-to-many relationship between origins and structures is captured in a junction table that again employs a role column to distinguish ownership from review and contribution: ORIG-0007 is linked to ORIG-0001 as reviewer and to ORIG-0005 as owner, while ORIG-0002 is linked to ORIG-0006 as owner. This role-bearing junction pattern is the structural linchpin across all three domains, providing a uniform mechanism for expressing directional, semantically rich relationships without proliferating dedicated relationship tables for each pair of entity types.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

The practical implication of this architecture is that governance, regulatory compliance, and anatomical classification all share a single relational vocabulary. Entities carry identifiers; attributes declare names and types; values are stored in type-appropriate tables keyed to entity-attribute pairs; and relationships between entities are mediated by junction tables that carry a role to specify the nature of the association. This uniformity simplifies both query construction and access control, since permissions can be applied at the entity level and inherited through the attribute and relationship layers without requiring domain-specific logic. It also supports incremental expansion: a new policy attribute, a new NIST standard, or a new anatomical origin can be introduced by inserting a single row into the appropriate catalogue table, with values and relationships materialized in the corresponding value or junction tables.