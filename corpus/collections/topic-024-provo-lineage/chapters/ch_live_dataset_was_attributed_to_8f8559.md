---
chapter_id: ch_live_dataset_was_attributed_to_8f8559
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'attribute_set_supports_outlier_claim', 'black_belt_certification_requirement']
model: engine-refine
---

Attributes constitute the fundamental unit of data description within the governance framework, each identified by a stable key and classified according to a formal type system that distinguishes between xsd:decimal, xsd:string, and xsd:dateTime representations. The attribute schema is instantiated through requirements such as ProvenanceTrackingBB and LabQualityControlBB, which serve as the organizational anchors for attribute definitions. Within these requirements, attributes like confidence, dimension_kind, method, and recorded_at are declared with their respective types, establishing a typed vocabulary that constrains how values may be assigned. The decimal-typed attributes accommodate numeric measurements ranging from 0.026 to 807.42, while string-typed attributes capture categorical descriptors such as Dimension Kind 01 and Encoding 02, and datetime attributes record temporal markers like 2025-05-17T18:36:12 and 2024-10-05T03:41:40. This type-disaggregated value storage—separate tables for decimal, varchar, and datetime values—ensures type safety at query time while preserving the semantic integrity of each attribute class.

The certification requirement framework extends beyond simple attribute declaration by embedding attributes within a structured validation hierarchy. Each requirement, identified by keys such as REQU-0001 through REQU-0004, may reference multiple attributes across its typed value tables, and the same attribute definition can appear in multiple requirements, enabling cross-requirement attribute reuse. For instance, the recorded_at attribute (REQU-0004) is referenced across all four requirement entities, establishing a common temporal anchor point, while confidence (REQU-0001) appears in both REQU-0001 and REQU-0002, suggesting shared measurement semantics across different certification contexts. The entity column in each value table explicitly ties individual values back to their parent requirement, creating a clear lineage from typed value through attribute definition to the certification requirement that mandates its presence.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |

Outlier claim validation operates through a parallel attribute-support architecture that links specific attributes to the systems and services that substantiate them. Attributes such as source system ID, validation rule, geolocation accuracy, and sensor calibration are associated with supporting infrastructure components including API gateway, PostgreSQL instance, and Ontology registry. The relationship between attributes and their supports is mediated through a junction table that assigns each pairing a role—either contributor or owner—thereby distinguishing between systems that provide data versus those that exercise authoritative control. This role-based attribution model, exemplified by entries where CLAI-0001 and CLAI-0003 are linked as owner while CLAI-0002 and CLAI-0005 appear as contributor, enables fine-grained accountability in the validation chain.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

Dataset provenance is tracked through the fact_dataset table, which records individual datasets by identifier (ATTR-0001 through ATTR-0004) along with their size in bytes—ranging from 31,504,133 to 676,110,880—and version numbers (2, 5, and 10). Each dataset is attributed to a specific entity via the was_attributed_to_key column, which references the dim_was_attributed_to dimension table. This dimension table provides the human-readable label and categorical classification for each attribution, with labels such as Was Attributed To Label 01 through 04 and corresponding categories from Was Attributed To Category 01 through 04. The foreign-key relationship between fact_dataset.was_attributed_to_key and dim_was_attributed_to.id ensures that every dataset carries a complete provenance trail, linking quantitative metadata (size, version) to qualitative attribution metadata (label, category) in a single referential chain.

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