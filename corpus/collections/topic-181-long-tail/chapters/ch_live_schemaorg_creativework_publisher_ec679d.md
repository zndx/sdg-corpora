---
chapter_id: ch_live_schemaorg_creativework_publisher_ec679d
topic_id: 181
family: 07_long_tail
cited_terms: ['schemaorg_creativework_publisher', 'attribute_set_subclass', 'responsive_optic_nerve_dysfunction']
model: engine-refine
---

Attribute systems in knowledge management rely on a layered architecture where identifiers anchor entities, attributes define their properties, and typed values populate those properties. An identifier serves as the immutable handle for any entity—whether a publisher record like PUBL-0001 for the NIST Cybersecurity Office's API Gateway Config, or a fact record like SET-0001 in the attribute measurement layer. Each entity carries attributes, which are named properties with associated type constraints. The attribute registry defines these properties explicitly: a checksum is typed as xsd:string, a created_date as xsd:date, an identifier as cco:DesignativeICE, and a license as xsd:string. These type declarations enforce schema discipline, ensuring that the string value 9d2b7a16 populates a checksum field, the date 2024-12-26 populates a created_date field, and the string proprietary populates a license field—all without ambiguity about expected formats.

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | NIST Cybersecurity Office |
| PUBL-0002 | API Gateway Config | AWS Documentation Team |
| PUBL-0003 | Cloud Migration Playbook | AWS Documentation Team |
| PUBL-0004 | Cloud Migration Playbook | NIST Cybersecurity Office |
| PUBL-0005 | Incident Postmortem | ISO Technical Committee |
| PUBL-0006 | Telemetry Schema Draft | AWS Documentation Team |
| PUBL-0007 | Firmware Release Notes | Elastic Search Team |
| PUBL-0008 | Cloud Migration Playbook | Apache Software Foundation |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

The value layer materializes attributes through typed value tables that separate concerns by data type. String-valued attributes such as checksums, ARN references like ARN:res/41, license designations, and zone identifiers like zone-b reside in a varchar value store, while date-valued attributes such as 2023-06-28, 2024-12-26, 2025-04-12, and 2023-05-08 occupy a dedicated date store. Integer-valued attributes, including values like 72, 1, 54, and 3, are stored separately in an integer value table. This separation by type enables efficient querying and type-safe validation: the entity PUBL-0001 carries the checksum 9d2b7a16 and the ARN ARN:res/41, while the same entity holds integer values 72 and 1, each linked through the entity_id and attr_id foreign keys that bind values back to their defining attributes.

In the analytical dimension, attributes are organized into categories and labeled for human consumption. The dimension table maps each attribute identifier to a human-readable label—Attribute Label 01 through Attribute Label 04—and assigns each to a category such as Attribute Category 01 through Attribute Category 04. This categorization provides a semantic grouping that supports filtering, aggregation, and governance. The corresponding fact table records measured values for these attributes alongside two critical metadata fields: confidence and uncertainty. Confidence scores range from 0.123 to 0.926, reflecting the degree of assurance in each measurement, while uncertainty values span from 274.08 to 957.49, quantifying the expected variance. A fact record with identifier SET-0001, attribute key SET-0005, confidence of 0.926, uncertainty of 957.49, and value 482.01 illustrates a high-confidence measurement with substantial absolute uncertainty—a common pattern where relative precision is strong but absolute error bounds remain wide.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

The domain extends beyond technical metadata into clinical knowledge representation, where the same structural principles apply to medical conditions. The optic nerve dysfunction table captures responsive patterns such as Focal Response and Diffuse Response, paired with specific etiologies including MT-ND6 Strain, Secondary Atrophy, Nutritional Deficit, and Hereditary Degeneration. The leber optic atrophy column records related manifestations—Hereditary Degeneration, Nutritional Deficit, Bilateral Atrophy, and Focal Atrophy—creating a structured mapping between clinical responses and their underlying pathologies. This parallel structure demonstrates how the attribute-entity-value pattern generalizes across domains: identifiers anchor clinical records, attributes define observable properties, and typed values encode the specific findings, enabling systematic analysis of conditions like optic nerve dysfunction and leber optic atrophy alongside their associated response patterns.

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |