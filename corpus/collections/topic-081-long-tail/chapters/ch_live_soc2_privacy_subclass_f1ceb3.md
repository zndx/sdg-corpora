---
chapter_id: ch_live_soc2_privacy_subclass_f1ceb3
topic_id: 81
family: 07_long_tail
cited_terms: ['soc2_privacy_subclass', 'mental_health_education_program', 'entity_match_link']
model: engine-refine
---

In governance and compliance frameworks, every artifact must be uniquely identifiable and precisely described so that auditors, operators, and automated systems can trace accountability from policy to execution. An identifier serves as the immutable key—such as `PRIV-0001` for a SOC2 privacy subclass or `PROG-0001` for a mental health education program—ensuring that each entity can be referenced unambiguously across systems. An entity represents the thing being governed: a SOC2 control statement like `SOC1-TypeII`, a mental health education program such as the `Youth Wellness Initiative`, or a lab instrument identified by serial number `SN-4491`. These entities span domains ranging from information security to public health, yet they share a common structural requirement: they must be linkable, attribute-rich, and role-bound within a broader compliance ecosystem.

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
| PRIV-0001 | incidentResponse |
| PRIV-0002 | incidentResponse |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | dataRetention |
| PRIV-0005 | encryptionStandards |
| PRIV-0006 | securityCriteria |

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

Attributes provide the descriptive and quantitative properties that make entities auditable. An attribute—identified by names such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—captures a specific characteristic of an entity match or relationship. Each attribute carries a type that constrains its permissible values: `xsd:decimal` for numeric measures like a confidence score of `0.249` or a dimension measurement of `448.20`, `xsd:string` for categorical labels such as `Dimension Kind 01` or `Encoding 02`, and `xsd:dateTime` for temporal stamps like `2025-02-02T03:38:54`. This typed attribute model ensures data integrity at the schema level, preventing type mismatches and enabling consistent validation across heterogeneous data sources. The separation of attribute definitions from their values—where datetime, decimal, and varchar values are stored in dedicated value tables—reflects a normalized design that supports efficient querying and type-safe storage.

Relationships between entities are expressed through junction structures that encode not just connectivity but also the nature of the connection. A subject-target-role pattern captures how one entity relates to another: for instance, a SOC2 privacy subclass acts as a `contributor` or `owner` to a SOC2 domain such as `incidentResponse` or `dataRetention`. In the mental health education domain, a program like `Sources of Strength` delivers a `Recognizing Depression Workshop` to a specific `youthdemographic`—here, `Athlete Communities`. The target demographic designation ensures that educational content is appropriately scoped, while the educational presentation itself—whether a `Coping Skills Session` or an `Emotional Intelligence Talk`—serves as the delivery mechanism through which the program's objectives are realized. This tripartite structure (program, presentation, demographic) mirrors the broader compliance pattern of linking a governing entity to an action and a recipient.

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

Entity matching and linkage extend the framework beyond simple relationships into the realm of data reconciliation. When a lab instrument with serial number `SN-4491` is linked to a reference standard `RS-004`, or when a dataset version `v4.2.1` is matched against a validation suite `VS-605`, the system records not only the match but also its metadata: the confidence of the match, the method used to establish it, and the timestamp of the recording. These match links—identified as `LINK-0001`, `LINK-0002`, and so on—become first-class entities in their own right, capable of carrying their own attributes and values. This recursive capability allows the framework to govern not just individual artifacts but the relationships between them, creating a meta-governance layer that tracks the provenance and quality of entity associations.

The misc category accommodates unstructured or semi-structured values that do not fit neatly into typed attribute slots, such as an `audit excerpt` or an encoding identifier like `es`. These freeform values complement the rigorously typed attributes, providing flexibility where precision is less critical than traceability. Together, the typed attributes, the misc values, the role-bound relationships, and the entity match links form a cohesive data model that supports end-to-end compliance: from the identification of a governing policy through its execution against a target demographic, to the recording of match confidence and the audit trail of every decision made along the way.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |