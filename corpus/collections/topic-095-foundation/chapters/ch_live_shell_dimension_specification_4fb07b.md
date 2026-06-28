---
chapter_id: ch_live_shell_dimension_specification_4fb07b
topic_id: 95
family: 08_derived
cited_terms: ['shell_dimension_specification', 'soc2_availability_subclass', 'soc2_confidentiality_subclass']
model: engine-refine
---

Within SOC2 compliance frameworks, control assertions are organized through a dimensional model that separates domain classification from the measurable attributes that govern their assessment. The fact table for SOC2 controls anchors each control to a domain—such as Financial Controls, Availability Criteria, or Network Infrastructure—while assigning a priority level and a review cycle measured in days. A control with priority 1 might carry a review cycle of 890 days, whereas a priority 5 control could be reviewed every 372 days, reflecting the inverse relationship between control criticality and assessment frequency. The domain dimension itself carries a label and a category, enabling aggregation of controls by functional area and supporting reporting across the four SOC2 trust service criteria.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

Each control assertion is enriched through an attribute-value architecture that decouples metadata from the control records themselves. Attributes such as confidence, dimension_kind, method, and recorded_at are defined with their corresponding data types—xsd:decimal for numerical confidence scores, xsd:string for categorical descriptors like Dimension Kind 01 or Encoding 02, and xsd:dateTime for temporal markers such as 2024-08-09T04:20:11. This separation allows the same attribute schema to be reused across different control subclasses. For availability-related assertions, attributes include effective_date, enforcement, mandatory, and priority, with types spanning xsd:date, xsd:string, xsd:boolean, and xsd:integer. The boolean attribute mandatory, for instance, distinguishes controls that are compulsory from those that are advisory, with values of true and false recorded against entity identifiers like AVAI-0001 and AVAI-0003.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | Financial Controls |
| AVAI-0002 | SOC 2 Privacy Assessment | Financial Controls |
| AVAI-0003 | SOC 2 Type I Assessment | Availability Criteria |
| AVAI-0004 | SOC 1 Financial Audit | Network Infrastructure |
| AVAI-0005 | SOC 2 Type I Assessment | Security Criteria |
| AVAI-0006 | SOC 1 Type I Report | Confidentiality Criteria |
| AVAI-0007 | SOC 2 Privacy Assessment | Privacy Criteria |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

The entity identifier serves as the bridge between attribute definitions and their concrete values, enabling a star-schema pattern where a single entity can carry multiple attributes of different types. A shell dimension specification identified as SPEC-0001 might hold a decimal confidence value of 0.130, a string dimension kind of Dimension Kind 01, and a recorded_at timestamp of 2024-08-09T04:20:11, each stored in its respective typed value table. Similarly, an availability subclass entity AVAI-0001 carries an effective_date of 2024-07-01, a priority integer of 5, and a review cycle of 378 days, with the enforcement attribute recorded as Encoding 01. This typed value decomposition—separating decimal, integer, boolean, date, and varchar values into distinct tables—preserves type safety while supporting an extensible attribute model that accommodates new control metadata without schema migration.

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

The classification of controls into domains and categories provides the analytical backbone for SOC2 compliance reporting. A control identified as CONF-0001 links to a domain category through its for_s_o_c2_domain_key, enabling roll-up of priority and review cycle metrics across groups such as Financial Controls or Network Infrastructure. The priority field, stored as an integer, orders controls within a domain for remediation sequencing, while the review_cycle_days field quantifies the assessment cadence—values ranging from 372 to 890 days reflect the varying rigor applied to different control classes. This structure ensures that auditors can trace any control assertion back to its domain classification, its assigned priority, and the attributes that define its evaluation criteria, creating an auditable chain from high-level domain categories down to individual attribute values.