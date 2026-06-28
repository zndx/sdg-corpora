---
chapter_id: ch_live_soc2_privacy_subclass_0a9e76
topic_id: 34
family: 07_long_tail
cited_terms: ['soc2_privacy_subclass', 'soc2_processing_integrity', 'soc2_security_subclass']
model: engine-refine
---

In compliance data models, every record is anchored by an **identifier**—a unique key that distinguishes one entity from another. Identifiers follow domain-specific prefixes that immediately signal the classification: `PRIV-0001` denotes a privacy subclass, `INTE-0001` a processing integrity record, and `SECU-0001` a security subclass. The **entity** is the thing being described or governed—the actual compliance artifact such as a control statement, a service domain, or a security classification. For instance, the privacy subclass entity `PRIV-0001` carries the control statement `SOC1-Control-Statement` and maps to the domain `transaction processing`, while `SECU-0003` represents the `SOC2-Fintech` security classification applied to `transaction processing`. These entities serve as the primary subjects and targets of relationships, forming the backbone of the compliance graph.

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | transaction processing |
| PRIV-0002 | Payment Gateways |
| PRIV-0003 | file transfer service |
| PRIV-0004 | Microservice Mesh |
| PRIV-0005 | Database Clusters |
| PRIV-0006 | Database Clusters |

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | encryptionStandards |
| INTE-0002 | Identity Providers |
| INTE-0003 | auditLogging |
| INTE-0004 | Identity Providers |
| INTE-0005 | payment gateway |
| INTE-0006 | dataRetention |

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | availabilityCriteria |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | transaction processing |
| SECU-0004 | SOC2-IdentityProvider | privacyFramework |
| SECU-0005 | SOC2-SaaS | API Ecosystems |
| SECU-0006 | SOC2-TypeII | securityCriteria |
| SECU-0007 | SOC2-SaaS | inventory management |

Attributes and their types define the properties that can be measured, enforced, or tracked on each entity. An **attr** (attribute) is a named characteristic—such as `effective_date`, `enforcement`, `mandatory`, or `priority`—and an **attr type** specifies the data format: `xsd:date` for calendar dates, `xsd:string` for free text, `xsd:boolean` for binary flags, and `xsd:integer` for numeric values. This separation of attribute definition from attribute value enables a flexible schema where different entity types carry different properties. A security subclass entity might have an `effective_date` of `2023-08-15` and a `mandatory` flag set to `true`, while another entity carries a `priority` value of `5` or a text value like `Encoding 01`. The **misc** column holds these actual values, stored in type-specific tables keyed by the entity and attribute identifiers, ensuring type safety without requiring a monolithic value column.

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

Relationships between entities are expressed through **subject** and **target** pairs, linked by a **role** that describes the nature of the connection. In the mapping tables, `soc_id` acts as the subject—the originating entity—and `for_s_o_c2_domain_id` as the target—the destination entity being related to. The role column then qualifies the relationship: `owner` indicates primary responsibility, `contributor` signals active participation, `reviewer` denotes oversight authority, and `observer` marks a passive monitoring relationship. For example, the privacy subclass `PRIV-0003` (which carries the control statement `SOC2-Processing-Integrity`) is linked to the domain `PRIV-0003` with the role `owner`, while `PRIV-0002` connects to `PRIV-0006` as a `contributor`. Similarly, in the processing integrity domain, `INTE-0006` appears as the subject in two relationships—one with role `owner` and another with role `reviewer`—demonstrating that a single entity can hold multiple roles across different connections.

This architecture—where identifiers anchor entities, attributes define measurable properties, values are stored by type, and relationships are role-qualified—provides a structured yet extensible foundation for compliance governance. It allows auditors and operators to trace which control statements apply to which service domains, which entities are responsible for which compliance obligations, and what attributes govern the enforcement of those obligations. The separation of attribute definitions from their values, combined with the subject-role-target relationship pattern, supports complex compliance scenarios where a single entity may own one domain, contribute to another, and be reviewed by a third.