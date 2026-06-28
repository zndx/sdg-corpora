---
chapter_id: ch_live_schemaorg_product_sku_880332
topic_id: 56
family: 07_long_tail
cited_terms: ['schemaorg_product_sku', 'schemaorg_review_author', 'schemaorg_review_rating']
model: engine-refine
---

Within structured knowledge representation, entities serve as the atomic units of meaning—distinct, addressable things about which assertions are made. A product such as the QuietComfort Ultra Ultra or the MacBook Air M3 constitutes one such entity, each bearing a stable identifier like SKU-0001 or SKU-0004 and a machine-readable SKU code such as SNY-PS5-STD or APL-IP15-256-BLK. Authors and reviewers form a parallel class of entity: James Wilson, Michael Brown, Jane Doe, and Sarah Miller are each assigned identifiers like AUTH-0001 through AUTH-0004 and classified under schema.org types ranging from LocalBusiness to Event. Ratings occupy a third category, where entities such as Ubuntu Linux or the WH-1000XM5 are associated with quantified assessments—3.2 points, 100 percentile, 9.1 rating, 4.0 average—each carrying its own identifier and semantic type. The distinction among entity classes is not merely taxonomic; it determines which attributes are admissible, which value types are permissible, and which relationships can be asserted.

**t_schemaorg_product_sku**

| id | schemaorg | s_k_u |
| --- | --- | --- |
| SKU-0001 | QuietComfort Ultra | SNY-PS5-STD |
| SKU-0002 | The Great Gatsby | KCH-A5-RED |
| SKU-0003 | Star Wars Episode IV | BSQ-QC4-BRN |
| SKU-0004 | MacBook Air M3 | APL-IP15-256-BLK |
| SKU-0005 | Thing | APL-IP15-256-BLK |
| SKU-0006 | Samsung Galaxy S24 | BSQ-QC4-BRN |

**t_schemaorg_product_sku_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SKU-0001 | checksum | xsd:string |
| SKU-0002 | created_date | xsd:date |
| SKU-0003 | identifier | cco:DesignativeICE |
| SKU-0004 | license | xsd:string |
| SKU-0005 | mime_type | xsd:string |
| SKU-0006 | size_bytes | xsd:long |
| SKU-0007 | uri | xsd:string |
| SKU-0008 | version | xsd:integer |

**t_schemaorg_product_sku_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0006 | 222 |
| SKU-0002 | SKU-0001 | SKU-0008 | 9 |
| SKU-0003 | SKU-0002 | SKU-0006 | 488 |
| SKU-0004 | SKU-0002 | SKU-0008 | 10 |
| SKU-0005 | SKU-0003 | SKU-0006 | 413 |
| SKU-0006 | SKU-0003 | SKU-0008 | 5 |
| SKU-0007 | SKU-0004 | SKU-0006 | 223 |
| SKU-0008 | SKU-0004 | SKU-0008 | 4 |

**t_schemaorg_product_sku_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0001 | c0ffee42 |
| SKU-0002 | SKU-0001 | SKU-0003 | ARN:res/41 |
| SKU-0003 | SKU-0001 | SKU-0004 | Apache-2.0 |
| SKU-0004 | SKU-0001 | SKU-0009 | eu-west-3 |
| SKU-0005 | SKU-0001 | SKU-0005 | application/json |
| SKU-0006 | SKU-0001 | SKU-0010 | Name 06 |
| SKU-0007 | SKU-0001 | SKU-0011 | data-engineering |
| SKU-0008 | SKU-0001 | SKU-0012 | Tags 08 |

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Galaxy S24 Ultra | James Wilson |
| AUTH-0002 | Event | Michael Brown |
| AUTH-0003 | Samsung Galaxy S24 | Jane Doe |
| AUTH-0004 | LocalBusiness | Sarah Miller |
| AUTH-0005 | Galaxy S24 Ultra | Jane Doe |
| AUTH-0006 | Review | Robert Chen |

**t_schemaorg_review_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Thing |
| RATI-0002 | Ubuntu Linux |
| RATI-0003 | PlayStation 5 |
| RATI-0004 | WH-1000XM5 |
| RATI-0005 | Honda Civic |
| RATI-0006 | Honda Civic |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

Attributes define the dimensions along which entities are described, and each attribute carries a type that constrains the form of its values. The attribute named checksum accepts values of type xsd:string, as does license, while created_date is typed as xsd:date and identifier as cco:DesignativeICE. This type discipline is enforced at the storage layer through separate value tables keyed by data type: date values such as 2025-05-15, 2023-06-09, 2025-02-16, and 2024-10-26 reside in a dedicated date store; integers like 222, 9, 488, and 10 in an integer store; and character strings such as c0ffee42, ARN:res/41, Apache-2.0, and eu-west-3 in a varchar store. The same pattern applies to author entities, where checksum values like 1a4b6c2d, identifiers such as ref-8842, licenses including CC-BY-4.0, and geographic endpoints like on-prem-dc1 are stored alongside date values (2025-02-16, 2024-11-14, 2023-06-05, 2023-01-18) and integers (103, 12, 471, 5). The separation of value types by column family is not an implementation artifact but a deliberate design choice that preserves type safety while enabling schema flexibility—entities need not declare all attributes upfront, and new attributes can be introduced without altering the entity definition.

The relationship between an entity and its attributes is mediated by a join table that records, for each value assignment, the entity being described, the attribute being assigned, and the resulting value. An entity identified as SKU-0001 may carry the attribute SKU-0001 with value c0ffee42, the attribute SKU-0003 with value ARN:res/41, the attribute SKU-0004 with value Apache-2.0, and the attribute SKU-0009 with value eu-west-3; simultaneously, the same entity may hold integer attributes SKU-0006 and SKU-0008 with values 222 and 9 respectively. The entity SKU-0002, by contrast, carries attributes SKU-0006 and SKU-0008 with values 488 and 10. This many-to-many mapping—entity to attribute to value—constitutes the core of the attribute-value model and is the mechanism by which heterogeneous descriptions are composed from a common set of primitives.

Subject-target relationships, mediated by role, extend the model beyond attribute-value pairs into the realm of inter-entity assertions. A rating entity may be linked to another rating entity through a subject-target pair, where the role field specifies the nature of the connection: reviewer, contributor, or other relationship types. For instance, the rating entity RATI-0004 assumes the role of reviewer when linked to RATI-0001; RATI-0006 plays reviewer in its link to RATI-0007; RATI-0001 assumes the role of contributor when linked to RATI-0004; and RATI-0005 serves as reviewer in its association with RATI-0003. The role column is the semantic glue that transforms a bare graph edge into a typed relationship, enabling queries that distinguish between a reviewer's assessment and a contributor's endorsement. This triad—subject, target, role—mirrors the classic subject-predicate-object structure of RDF triples and provides the foundation for reasoning over complex, multi-hop relationships in product and review data.

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |

The practical significance of this architecture lies in its capacity to represent heterogeneous, evolving data without schema rigidity. A product entity can accumulate attributes over time—checksums for integrity verification, creation dates for provenance, license identifiers for compliance, and geographic endpoints for deployment—without requiring any structural change to the entity definition. Similarly, a review author can carry metadata such as reference codes, checksums, and license information alongside temporal and numeric attributes, all stored in a uniform value store keyed by type. The identifier column provides the stable anchor point for every entity, attribute, and value assignment, ensuring that relationships remain intact even as the underlying data evolves. In governance and compliance contexts, this model supports auditability: every value is traceable to its entity, its attribute, its type, and its role, creating a complete provenance chain from raw data to derived assertion.

**t_schemaorg_product_sku_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0002 | 2025-05-15 |
| SKU-0002 | SKU-0002 | SKU-0002 | 2023-06-09 |
| SKU-0003 | SKU-0003 | SKU-0002 | 2025-02-16 |
| SKU-0004 | SKU-0004 | SKU-0002 | 2024-10-26 |
| SKU-0005 | SKU-0005 | SKU-0002 | 2025-01-20 |
| SKU-0006 | SKU-0006 | SKU-0002 | 2023-04-12 |

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |