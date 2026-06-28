---
chapter_id: ch_live_soc2_processing_integrity_ae39d8
topic_id: 81
family: 07_long_tail
cited_terms: ['soc2_processing_integrity', 'entity_match_link', 'artifact_not_deprecated']
model: engine-refine
---

In governance frameworks, particularly those addressing SOC2 processing integrity, systems must rigorously track the relationships between organizational entities and their operational domains. Each entity, such as Quantum Retail Group or GlobalPay Systems, is assigned a unique identifier (e.g., INTE-0001) to ensure unambiguous reference across the data model. These entities are mapped to specific operational domains—like user provisioning or customer onboarding—through a structured relationship that defines a subject and a target. Within this relationship, a role is explicitly assigned to dictate responsibility and access; for instance, a specific entity might act as the owner of a customer onboarding process, while another serves as a reviewer or an observer. This triad of subject, target, and role establishes a clear audit trail of accountability.

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
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

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

Beyond basic organizational mapping, the framework supports sophisticated entity matching, where distinct objects are linked based on their characteristics. An entity, such as a lab instrument (SN-4491) or a dataset (v4.2.1), can be matched against a reference standard (RS-004) or a validation suite (VS-605). To quantify and describe these matches, the system employs attributes (`attr`) that capture specific metadata about the relationship. Each attribute is strictly typed (`attr_type`) to ensure data integrity; for example, a `confidence` metric might be stored as an `xsd:decimal`, while a `method` or `dimension_kind` is preserved as an `xsd:string`, and a `recorded_at` timestamp is maintained as an `xsd:dateTime`.

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

The actual data populating these attributes is stored as miscellaneous values (`misc`), allowing for flexible yet structured data entry depending on the attribute's type. For decimal attributes, values like 0.249 or 448.20 might represent precision metrics or confidence scores, whereas string attributes hold descriptive text such as "Dimension Kind 01" or "Encoding 02". Temporal attributes capture exact moments of recording, such as 2025-02-02T03:38:54, ensuring that the history of an entity match is fully traceable. This separation of attribute definitions from their concrete values allows the system to scale and adapt to new matching criteria without altering the underlying schema.

At the core of the data architecture lies the management of artifacts—discrete units of data or code that are versioned and categorized for lifecycle management. Each artifact is identified by a unique key and associated with a specific category (e.g., Artifact Category 01) to facilitate classification and retrieval. The physical footprint of these artifacts is tracked via `size_bytes`, with records showing sizes ranging from tens of megabytes, such as 42978804 bytes, to nearly a gigabyte, like 996080316 bytes. Furthermore, every artifact is assigned a `version` number (e.g., version 5 or 10), enabling the system to track iterations, manage deprecations, and ensure that downstream processes are always referencing the correct iteration of a given artifact.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |