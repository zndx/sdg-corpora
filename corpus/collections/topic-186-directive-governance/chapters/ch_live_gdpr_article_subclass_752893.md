---
chapter_id: ch_live_gdpr_article_subclass_752893
topic_id: 186
family: 07_long_tail
cited_terms: ['gdpr_article_subclass', 'control_min_one_owner', 'agent_with_role']
model: engine-refine
---

Within governance frameworks that track regulatory alignment and agent behavior, the data model distinguishes between dimensional classification and factual measurement. The agent role dimension assigns each role a human-readable label and a categorical classification, enabling organizations to group agents by function—whether for auditing, access control, or compliance reporting. The corresponding fact table records measurable properties of each agent instance, including version identifiers and storage footprint in bytes. An agent may reference a role definition while carrying its own version number and size metrics, allowing the same logical role to be instantiated across multiple deployments with distinct operational characteristics. For instance, one agent instance might carry version 7 and occupy approximately 211 megabytes, while another referencing the same role definition runs version 12 at a fraction of that footprint, reflecting iterative updates or environment-specific configurations.

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

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

Regulatory alignment is captured through a subclassification of data protection articles that maps identifiers to specific legal frameworks. The same subclass identifier can appear across multiple regulatory regimes—Brazilian LGPD and Canadian PIPEDA both reference identifiers ARTI-0001 and ARTI-0003, respectively—indicating that certain compliance obligations span jurisdictions. These subclasses are further linked to concrete article references, such as Article 9 of the GDPR, the Australian Privacy Act, or the Japanese APPI, creating a traceable chain from abstract regulatory concept to enforceable provision. The linkage between subclass and article is not merely associative; it carries a role designation that describes the nature of the relationship. An identifier may act as an observer, a contributor, or an owner in its connection to a given article, with the observer role appearing in mappings where ARTI-0005 and ARTI-0007 relate to the same article reference, while the owner role designates direct accountability, as seen when ARTI-0004 is designated as the owner of ARTI-0006.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

Control definitions form the operational backbone of compliance enforcement, with each control assigned a descriptive identifier and a human-readable directive name. Controls such as "Rate Limit Threshold," "Encryption At Rest," "RBAC Assignment Policy," and "Backup Retention Directive" represent the specific mechanisms through which organizational policies are codified. These controls are not monolithic; they decompose into typed attributes that capture the parameters governing their application. Attribute definitions specify both a name—such as effective_date, enforcement, mandatory, or priority—and an XSD type that constrains the shape of permissible values. This type discipline ensures that date attributes receive properly formatted dates, boolean attributes receive true or false, integer attributes receive numeric values, and string attributes receive text, preventing type mismatches at the data layer.

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

The separation of attribute definitions from their concrete values enables flexible, multi-valued control specifications. Each control can carry multiple attribute instances, and each attribute instance can hold values of different types stored in dedicated value tables. A single control might have its mandatory flag set to true in one instance and false in another, reflecting different enforcement contexts. Effective dates are stored in a dedicated date table, with values ranging from 2023-12-25 through 2025-01-07, capturing the temporal dimension of when controls become active. Integer attributes store numeric thresholds—values such as 5, 245, 1, and 705 represent varying severity levels or capacity limits. String attributes hold descriptive metadata, including values like "audit excerpt" and "Encoding 01," which provide contextual information about control application. This multi-table value architecture ensures type safety while supporting the rich, heterogeneous data that real-world compliance controls require.