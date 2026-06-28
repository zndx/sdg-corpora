---
chapter_id: ch_live_annotation_governed_by_classification_policy_5f374e
topic_id: 56
family: 02_observation_measurement
cited_terms: ['annotation_governed_by_classification_policy', 'program_with_entry_exactly_one', 'schemaorg_review_author']
model: engine-refine
---

The annotation framework operates through a dual-table architecture that separates quantitative measurement from categorical classification. The fact_annotation table records each annotation instance with a unique identifier—POLI-0001 through POLI-0004—alongside an annotation_key that references the source annotation, a confidence score, an uncertainty metric, and a numeric value. Confidence values span a wide range, from 0.845 for POLI-0001 down to 0.236 for POLI-0002, reflecting the varying degrees of certainty attached to each measurement. Uncertainty values, expressed as continuous floats such as 690.59 and 22.02, provide an orthogonal measure of dispersion that complements the confidence scores rather than duplicating them. The dim_annotation table enriches these records with human-readable labels—Annotation Label 01 through Annotation Label 04—and assigns each to a category, with categories ranging from Annotation Category 01 to Annotation Category 04, thereby enabling downstream filtering and aggregation by semantic group.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

Attribute definitions form a parallel schema that governs the structure of entity properties independently of their stored values. The t_schemaorg_review_author_attr table declares attributes by name—checksum, created_date, identifier, license—and assigns each an attr_type drawn from a namespace-aware type vocabulary. Types include xsd:string for textual data, xsd:date for temporal values, and cco:DesignativeICE for designative identifiers, establishing a typed contract that constrains what values may be assigned to each attribute. This separation of attribute schema from attribute values mirrors the distinction between fact_annotation and dim_annotation: one layer defines the structure, the other populates it.

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | James Wilson |
| AUTH-0002 | LocalBusiness | Michael Brown |
| AUTH-0003 | SoftwareApplication | Jane Doe |
| AUTH-0004 | Event | Sarah Miller |
| AUTH-0005 | Place | Jane Doe |
| AUTH-0006 | SoftwareApplication | Robert Chen |

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

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

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

Entity instances serve as the anchor points to which attribute values are bound, and the entity_id column appears consistently across the three value tables to enforce referential integrity. The t_schemaorg_review_author table maps entity identifiers—AUTH-0001 through AUTH-0004—to their schema.org type (Person, LocalBusiness, SoftwareApplication, Event) and to a review_author name (James Wilson, Michael Brown, Jane Doe, Sarah Miller), establishing the entity's identity and classification before any attribute values are attached. Each value table then stores the actual data: t_schemaorg_review_author_val_date holds temporal values such as 2025-02-16 and 2023-01-18; t_schemaorg_review_author_val_int stores integer measures like 103 and 5; and t_schemaorg_review_author_val_varchar captures free-form strings including the hash 1a4b6c2d, the reference ref-8842, the license identifier CC-BY-4.0, and the location tag on-prem-dc1. The attr_id column in each value table links back to the attribute definition, ensuring that every value conforms to its declared type.

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

Identifier and version management extend beyond the annotation and entity domains into programmatic resources. The t_program_with_entry_exactly_one table tracks software programs—inventory_sync, nightly_etl, health_check—alongside their entry points (api_gateway, main.py, cron_trigger) and assigns each a version number (12, 3, 8, 11). Resource identifiers such as ARN:res/41 and ref-8842 appear here and recur in the varchar value table, demonstrating how identifiers are shared across domains to maintain traceability. The version column provides a simple numeric revision counter that, while not versioned as a semantic version string, serves as an operational checkpoint for tracking program evolution. Together, these tables illustrate a governance model in which every measurable quantity, every attribute, and every entity is uniquely addressable, typed, and versioned, with confidence and uncertainty metrics providing the quantitative scaffolding necessary for audit and compliance review.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |