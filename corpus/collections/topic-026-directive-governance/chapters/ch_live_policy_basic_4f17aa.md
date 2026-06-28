---
chapter_id: ch_live_policy_basic_4f17aa
topic_id: 26
family: 03_directive_governance
cited_terms: ['policy_basic', 'policy_classification_tier', 'policy_constrains_only_artifact']
model: engine-refine
---

Policies serve as the foundational governance artifacts, each assigned a unique identifier such as POLI-0001 through POLI-0004 to distinguish instruments like the Medical Privacy Directive, Corporate Data Privacy Policy, ISO-27001, and NIST-800-53. These identifiers anchor every downstream relationship, enabling precise reference across classification mappings, attribute assignments, and enforcement records. The identifier is not merely a label but the primary key that ties together the policy's definitional properties, its classification tier, and the roles assigned to those who manage or interact with it.

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Medical Privacy Directive |
| POLI-0002 | Corporate Data Privacy Policy |
| POLI-0003 | ISO-27001 |
| POLI-0004 | NIST-800-53 |
| POLI-0005 | Basel-III |
| POLI-0006 | ISO 27001 Framework |
| POLI-0007 | Employee Code of Conduct |

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

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | FISMA |
| TIER-0002 | Open Source License Policy |
| TIER-0003 | FDA-21-CFR-11 |
| TIER-0004 | Backup Recovery Policy |
| TIER-0005 | GDPR |
| TIER-0006 | Security Baseline Policy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | Access Control Policy | mandatory | team |
| ARTI-0002 | Environmental EPA Emissions Standard | blocking | global |
| ARTI-0003 | Environmental EPA Emissions Standard | mandatory | local |
| ARTI-0004 | ISO 27001 Framework | mandatory | global |
| ARTI-0005 | National Cybersecurity Strategy | deprecated | team |
| ARTI-0006 | PCI-DSS | deprecated | regional |
| ARTI-0007 | PCI-DSS | advisory | regional |

Attributes define the measurable and categorical properties of each policy, with attribute names such as effective_date, enforcement, mandatory, and priority establishing the dimensions along which policies are evaluated and compared. Each attribute carries a type constraint—xsd:date for temporal values like 2025-05-22 or 2023-08-24, xsd:boolean for binary flags such as true or false, xsd:integer for numeric measures like 2, 409, 3, and 74, and xsd:string for free-form text including calibration record, en, Encoding 01, and Enforcement 02. This type discipline ensures that attribute values remain semantically consistent across the policy registry, preventing misinterpretation when compliance officers query whether a policy is mandatory or when they compare priority rankings across competing directives.

Enforcement mechanisms determine how strictly a policy is applied in practice, with values ranging from mandatory to blocking depending on the artifact's nature. An Access Control Policy may carry mandatory enforcement at the team scope, while an Environmental EPA Emissions Standard might be enforced as blocking at the global level or mandatory at the local level. The scope dimension—team, local, or global—establishes the organizational reach of the enforcement action, ensuring that compliance obligations are neither over-applied nor under-applied relative to the policy's intended domain.

Classification tiers provide a structured hierarchy for organizing policies by sensitivity and regulatory weight. Tiers such as Tier 3 Critical, Restricted Access, and Level 2 Sensitive correspond to specific policy domains including FISMA, FDA-21-CFR-11, Open Source License Policy, and Backup Recovery Policy. The relationship between a policy and its classification tier is mediated through a role assignment—owner, observer, contributor, or reviewer—that defines the nature of each stakeholder's engagement with the policy. A policy may have multiple role assignments across different tiers, reflecting the multi-layered governance structure that characterizes mature compliance programs.

The entity-target-role triad forms the backbone of policy governance relationships. An entity represents a specific policy instance, a target represents a classification tier or artifact, and the role specifies the capacity in which the entity interacts with the target. This structure allows a single policy to assume different responsibilities across the governance landscape—for example, serving as an owner in one classification context while acting as an observer in another. The misc column captures supplementary metadata such as calibration records or encoding designations that do not fit neatly into the typed attribute schema but remain essential for operational traceability.

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