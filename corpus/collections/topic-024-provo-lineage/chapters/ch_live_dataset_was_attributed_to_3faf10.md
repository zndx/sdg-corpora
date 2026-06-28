---
chapter_id: ch_live_dataset_was_attributed_to_3faf10
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'policy_only_governs_artifacts', 'professional_expertise_domain']
model: engine-refine
---

Professional expertise domains constitute the foundational classification layer, each domain identified by a surrogate key such as DOMA-0001 through DOMA-0004 and associated with a practitioner role—Cybersecurity Auditor, Forensic Accountant, Clinical Psychologist—alongside the industry sector it covers, ranging from Manufacturing Operations to Commercial Real Estate to Public Infrastructure, and the service type it delivers, whether Asset Valuation, Regulatory Compliance, or Contract Drafting. This domain taxonomy is not merely descriptive; it anchors a multi-typed attribute system that captures quantitative, temporal, and categorical evidence about each domain. Attributes are declared in a dedicated registry where each attr_name—confidence, dimension_kind, method, recorded_at—is paired with an attr_type drawn from the XML Schema namespace, yielding types such as xsd:decimal, xsd:string, and xsd:dateTime. The type designation dictates which value table receives the data, enforcing a disciplined separation of concerns: decimal values like 0.863 or 628.37 populate the decimal store, timestamped observations such as 2024-07-30T07:07:17 or 2024-12-04T20:31:19 reside in the datetime store, and free-form entries like Dimension Kind 01, Encoding 02, calibration record, or ja are held in the varchar store. Each value record is resolved through a composite foreign key—entity_id referencing the domain and attr_id referencing the attribute—ensuring that every measurement, date, or label is traceable to both the domain it characterizes and the attribute definition it fulfills.

**t_professional_expertise_domain**

| id | professional_expertise_domain | covers_sector | provides_service_type |
| --- | --- | --- | --- |
| DOMA-0001 | Cybersecurity Auditor | Manufacturing Operations | Asset Valuation |
| DOMA-0002 | Cybersecurity Auditor | Commercial Real Estate | Regulatory Compliance |
| DOMA-0003 | Forensic Accountant | Public Infrastructure | Contract Drafting |
| DOMA-0004 | Clinical Psychologist | Public Infrastructure | Asset Valuation |
| DOMA-0005 | Data Architect | Healthcare Delivery | Regulatory Compliance |
| DOMA-0006 | Data Architect | Manufacturing Operations | Clinical Diagnosis |
| DOMA-0007 | Forensic Accountant | Manufacturing Operations | Network Penetration Testing |
| DOMA-0008 | Structural Engineer | Financial Services | Asset Valuation |

**t_professional_expertise_domain_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DOMA-0001 | confidence | xsd:decimal |
| DOMA-0002 | dimension_kind | xsd:string |
| DOMA-0003 | method | xsd:string |
| DOMA-0004 | recorded_at | xsd:dateTime |
| DOMA-0005 | uncertainty | xsd:decimal |
| DOMA-0006 | unit | xsd:string |
| DOMA-0007 | value | xsd:decimal |
| DOMA-0008 | encoding | xsd:string |

**t_professional_expertise_domain_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0004 | 2024-07-30T07:07:17 |
| DOMA-0002 | DOMA-0002 | DOMA-0004 | 2024-12-04T20:31:19 |
| DOMA-0003 | DOMA-0003 | DOMA-0004 | 2024-05-12T06:41:36 |
| DOMA-0004 | DOMA-0004 | DOMA-0004 | 2024-07-23T14:51:29 |
| DOMA-0005 | DOMA-0005 | DOMA-0004 | 2023-05-19T17:35:21 |
| DOMA-0006 | DOMA-0006 | DOMA-0004 | 2023-07-26T00:07:35 |
| DOMA-0007 | DOMA-0007 | DOMA-0004 | 2023-03-21T08:57:17 |
| DOMA-0008 | DOMA-0008 | DOMA-0004 | 2023-06-16T10:20:06 |

**t_professional_expertise_domain_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0001 | 0.863 |
| DOMA-0002 | DOMA-0001 | DOMA-0005 | 628.37 |
| DOMA-0003 | DOMA-0001 | DOMA-0007 | 315.52 |
| DOMA-0004 | DOMA-0002 | DOMA-0001 | 0.147 |
| DOMA-0005 | DOMA-0002 | DOMA-0005 | 438.62 |
| DOMA-0006 | DOMA-0002 | DOMA-0007 | 381.17 |
| DOMA-0007 | DOMA-0003 | DOMA-0001 | 0.471 |
| DOMA-0008 | DOMA-0003 | DOMA-0005 | 940.55 |

**t_professional_expertise_domain_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0002 | Dimension Kind 01 |
| DOMA-0002 | DOMA-0001 | DOMA-0008 | Encoding 02 |
| DOMA-0003 | DOMA-0001 | DOMA-0009 | calibration record |
| DOMA-0004 | DOMA-0001 | DOMA-0010 | ja |
| DOMA-0005 | DOMA-0001 | DOMA-0003 | manual |
| DOMA-0006 | DOMA-0001 | DOMA-0006 | mg/L |
| DOMA-0007 | DOMA-0002 | DOMA-0002 | Dimension Kind 07 |
| DOMA-0008 | DOMA-0002 | DOMA-0008 | Encoding 08 |

Governance over these domains and their associated artifacts is mediated through a policy enforcement framework that assigns each artifact a policy designation, an enforcement posture, and a priority ranking. Artifacts governed by policies such as Data Retention Policy, Access Control Policy, Privacy Compliance Policy, or Immutable Audit Policy are subject to enforcement mechanisms ranging from blocking to advisory to deprecated, with priority levels spanning from 1 to 5, where a lower numeric value signals greater urgency. An artifact under Privacy Compliance Policy with enforcement set to deprecated and priority 1 represents the highest-priority, least-active governance constraint, whereas an artifact under Access Control Policy with advisory enforcement and priority 4 reflects a lower-urgency, non-coercive directive. This triad of policy, enforcement, and priority establishes a hierarchical control surface that determines how domain artifacts are managed, audited, and constrained in operational contexts.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Dataset provenance and attribution are captured through a fact table that records each dataset's identifier, its attribution linkage, its size in bytes, and its version number. Dataset identifiers such as ATTR-0001 through ATTR-0004 are associated with attribution keys—ATTR-0004, ATTR-0003, ATTR-0006—that resolve to a dimension table containing the human-readable label and the categorical classification for each attribution target. Labels such as Was Attributed To Label 01 through Was Attributed To Label 04 are paired with categories like Was Attributed To Category 01 through Was Attributed To Category 04, providing a structured taxonomy for understanding which entity or process a dataset is attributed to. The size_bytes column records the storage footprint of each dataset, with values ranging from 31,504,133 bytes for ATTR-0003 to 676,110,880 bytes for ATTR-0004, while the version column tracks revision state, with values of 2, 5, and 10 indicating different maturity levels across the dataset population.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

The interplay between these structures forms a coherent governance architecture: professional expertise domains define what is being measured, attribute definitions specify how measurements are typed and stored, value tables hold the actual observations resolved by domain and attribute keys, policy tables constrain how artifacts derived from or associated with these domains are enforced, and dataset attribution tables record the lineage and provenance of the data itself. The foreign-key relationships—entity_id and attr_id in each value table pointing to their respective domain and attribute registries, was_attributed_to_key in the fact table pointing to the attribution dimension—create a navigable graph where any value can be traced to its domain, its attribute definition, its type, and its governance context. This design supports auditability, type safety, and policy enforcement across a heterogeneous data landscape where decimal confidence scores, datetime stamps, and free-form labels coexist under a unified classification and control framework.