---
chapter_id: ch_live_directive_not_obsolete_c369e5
topic_id: 125
family: 03_directive_governance
cited_terms: ['directive_not_obsolete', 'soc2_trust_criterion', 'policy_min_one_enforcer']
model: engine-refine
---

Within compliance and governance architectures, the identifier serves as the immutable anchor of every directive, criterion, and policy record. Each entry receives a scoped code—OBSO-0001 through OBSO-0004 for directives, CRIT-0001 through CRIT-0004 for SOC 2 trust criteria, and ENFO-0001 through ENFO-0005 for policies and enforcers—that guarantees unambiguous reference across the entire framework. These identifiers are not merely labels; they are the foreign keys that bind attributes to entities, values to attributes, and policies to their enforcement mechanisms. A directive such as the GDPR Compliance Framework (OBSO-0001) or the OWASP Testing Guide v4 (OBSO-0003) is distinguished from the IEEE 802.15.4 Radio Spec (OBSO-0002) solely by its identifier, which in turn determines which attribute values are admissible and which trust criteria reference it.

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | GDPR Compliance Framework | FHIR R4 Interoperability |
| OBSO-0002 | IEEE 802.15.4 Radio Spec | CCPA Consumer Privacy |
| OBSO-0003 | HIPAA Privacy Rule Text | OWASP Application Security Guide |
| OBSO-0004 | OWASP Testing Guide v4 | OGC SensorML Profile |
| OBSO-0005 | HIPAA Security Rule | HL7 FHIR Implementation Guide |
| OBSO-0006 | IEEE 802.11ax Standard | IHE Technical Framework Plus |
| OBSO-0007 | OGC SensorML Profile | OGC SensorML Profile |

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | OBSO-0006 |
| CRIT-0002 | DataVault Inc | OBSO-0005 |
| CRIT-0003 | CloudScale Services | OBSO-0005 |
| CRIT-0004 | HealthSys Networks | OBSO-0002 |
| CRIT-0005 | RetailChain Partners | OBSO-0001 |
| CRIT-0006 | FinTech Global | OBSO-0001 |

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | NIST SP 800-53 Rev5 |
| ENFO-0002 | ISO 27001 Data Handling |
| ENFO-0003 | NIST SP 800-53 Rev5 |
| ENFO-0004 | MITRE ATT&CK Framework |
| ENFO-0005 | GDPR Compliance Framework |
| ENFO-0006 | OGC SensorML Profile |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

The attribute concept captures the definitional properties that govern how each entity is interpreted and enforced. Attribute names such as effective_date, enforcement, mandatory, and priority appear consistently across directive and SOC 2 criterion domains, establishing a shared vocabulary for compliance metadata. Each attribute carries a type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that constrains the shape of permissible values and ensures type safety at the schema level. The mandatory attribute, typed as xsd:boolean, distinguishes between obligations that are compulsory and those that are advisory; the priority attribute, typed as xsd:integer, assigns ordinal significance to competing requirements, with values ranging from 2 to 767 across the SOC 2 trust criteria and from 4 to 703 across directives. This type discipline means that the effective_date for CyberShield Ltd's SOC 2 criterion (CRIT-0001) is recorded as 2025-04-05, while the same attribute for HealthSys Networks (CRIT-0004) carries the earlier date 2023-05-30, reflecting divergent implementation timelines.

Values are materialized in type-specific tables that link an entity to an attribute through a composite foreign key, producing a normalized structure where each cell holds a single scalar value. The boolean value table records whether the mandatory attribute applies to a given entity—true for the HIPAA Privacy Rule Text (OBSO-0003) and for CloudScale Services' SOC 2 criterion (CRIT-0003), but false for all other entries in both domains. The date value table anchors temporal boundaries: the GDPR Compliance Framework became effective on 2024-10-21, whereas the CCPA Consumer Privacy directive (OBSO-0002) took effect earlier, on 2024-03-22. Integer values encode quantitative priorities, with the OWASP Testing Guide v4 assigned a directive priority of 5 and a SOC 2 criterion priority of 4, while the HIPAA Privacy Rule Text carries a directive priority of 4 and a SOC 2 criterion priority of 418. Varchar values capture free-form metadata such as enforcement notes ("Enforcement 02"), intake forms ("intake form"), change rationales ("change rationale"), and language codes ("en"), each tied to its entity and attribute through the same composite key structure.

The entity concept unifies these disparate records under a single abstraction: a directive, a SOC 2 trust criterion, or a policy is an entity, and its identity is resolved through its identifier. Cross-domain relationships emerge when SOC 2 trust criteria reference directives—CloudScale Services' criterion (CRIT-0003) maps to directive OBSO-0005, and HealthSys Networks' criterion (CRIT-0004) maps to OBSO-0002—creating a dependency graph that traces compliance obligations from organizational policy down to specific regulatory requirements. The entity_id column in every value table points back to the originating record, ensuring that the boolean, date, integer, and varchar values for the GDPR Compliance Framework (OBSO-0001) are never conflated with those for the FHIR R4 Interoperability directive, even though both share the same attribute names and types.

**t_directive_not_obsolete_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSO-0001 | effective_date | xsd:date |
| OBSO-0002 | enforcement | xsd:string |
| OBSO-0003 | mandatory | xsd:boolean |
| OBSO-0004 | priority | xsd:integer |
| OBSO-0005 | review_cycle_days | xsd:integer |
| OBSO-0006 | scope | xsd:string |
| OBSO-0007 | encoding | xsd:string |
| OBSO-0008 | label_text | xsd:string |

**t_directive_not_obsolete_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0003 | true |
| OBSO-0002 | OBSO-0002 | OBSO-0003 | false |
| OBSO-0003 | OBSO-0003 | OBSO-0003 | false |
| OBSO-0004 | OBSO-0004 | OBSO-0003 | false |
| OBSO-0005 | OBSO-0005 | OBSO-0003 | true |
| OBSO-0006 | OBSO-0006 | OBSO-0003 | true |
| OBSO-0007 | OBSO-0007 | OBSO-0003 | true |

**t_directive_not_obsolete_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0001 | 2024-10-21 |
| OBSO-0002 | OBSO-0002 | OBSO-0001 | 2024-03-22 |
| OBSO-0003 | OBSO-0003 | OBSO-0001 | 2024-07-16 |
| OBSO-0004 | OBSO-0004 | OBSO-0001 | 2024-10-21 |
| OBSO-0005 | OBSO-0005 | OBSO-0001 | 2023-05-26 |
| OBSO-0006 | OBSO-0006 | OBSO-0001 | 2023-06-12 |
| OBSO-0007 | OBSO-0007 | OBSO-0001 | 2025-06-10 |

**t_directive_not_obsolete_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0004 | 5 |
| OBSO-0002 | OBSO-0001 | OBSO-0005 | 703 |
| OBSO-0003 | OBSO-0002 | OBSO-0004 | 4 |
| OBSO-0004 | OBSO-0002 | OBSO-0005 | 418 |
| OBSO-0005 | OBSO-0003 | OBSO-0004 | 2 |
| OBSO-0006 | OBSO-0003 | OBSO-0005 | 865 |
| OBSO-0007 | OBSO-0004 | OBSO-0004 | 5 |
| OBSO-0008 | OBSO-0004 | OBSO-0005 | 415 |

**t_directive_not_obsolete_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0007 | Encoding 01 |
| OBSO-0002 | OBSO-0001 | OBSO-0002 | Enforcement 02 |
| OBSO-0003 | OBSO-0001 | OBSO-0008 | intake form |
| OBSO-0004 | OBSO-0001 | OBSO-0009 | en |
| OBSO-0005 | OBSO-0001 | OBSO-0006 | Scope 05 |
| OBSO-0006 | OBSO-0002 | OBSO-0007 | Encoding 06 |
| OBSO-0007 | OBSO-0002 | OBSO-0002 | Enforcement 07 |
| OBSO-0008 | OBSO-0002 | OBSO-0008 | nightly summary |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

The role, subject, and target triad governs the enforcement layer, where policies are assigned to organizational units with explicit responsibility semantics. The junction table linking policies to enforcers carries a role column that classifies each relationship as contributor, observer, or owner. The NIST SP 800-53 Rev5 policy (ENFO-0005) is enforced by four distinct entities: the Regulatory Affairs Division (ENFO-0002) acts as contributor, the Data Stewardship Council (ENFO-0003) as contributor, the Privacy Officer (ENFO-0004) as owner, and the Compliance Audit Board (ENFO-0002) as observer. The subject column identifies the policy being enforced, the target column identifies the enforcer, and the role column specifies the nature of the obligation—distinguishing between those who actively shape the policy (contributor), those who monitor its application (observer), and those who bear ultimate accountability (owner). This three-column structure ensures that enforcement is not a binary assignment but a graded distribution of responsibility across the governance hierarchy.

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |