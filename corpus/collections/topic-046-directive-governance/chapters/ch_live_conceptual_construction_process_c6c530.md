---
chapter_id: ch_live_conceptual_construction_process_c6c530
topic_id: 46
family: 08_derived
cited_terms: ['conceptual_construction_process', 'control_min_one_owner', 'annotation_only_about_artifact']
model: engine-refine
---

In knowledge governance frameworks, the transformation of raw inputs into structured, machine-actionable knowledge proceeds through defined conceptual construction processes. Each process takes a subject concept—such as a Raw Data Dictionary, Unstructured Log Streams, Raw Metadata Catalog, or Raw Sensor Readings—and applies a specific transformation to yield a constructed predicate. The process identified as PROC-0001, for instance, applies a HierarchicalEdge transformation to a Raw Data Dictionary, producing a CrossReferenceLink as its output predicate. Similarly, PROC-0003 performs Semantic Enrichment on a Raw Metadata Catalog to generate a Data Model Refinement predicate, while PROC-0004 executes CausalDependency analysis on Raw Sensor Readings to derive a Schema Derivation predicate. These processes form the backbone of knowledge extraction pipelines, ensuring that every constructed relationship carries a traceable provenance from its source material.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |

Governance controls are parameterized through a flexible attribute system that decouples metadata definitions from their concrete values. The control catalog—encompassing directives such as Rate Limit Threshold, Encryption At Rest, RBAC Assignment Policy, and Backup Retention Directive—carries a schema of attributes defined by name and type. Attribute definitions like effective_date (typed as xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer) establish the structural contract for how each control instance is described. This separation of attribute schema from attribute values enables controls to be extended without schema migration, supporting both temporal tracking through date-valued effective dates (ranging from 2023-01-26 to 2025-01-07 across instances) and quantitative thresholds expressed as integers (such as a priority value of 245 or a threshold of 705). Boolean flags like mandatory indicate whether enforcement is compulsory, while string-valued attributes capture free-form descriptors such as "Encoding 01" or "audit excerpt."

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

Annotation quality is tracked through a dual-metric system of confidence and uncertainty that quantifies the reliability of each annotation instance. The fact_annotation table records per-annotation confidence scores—numerical values between 0 and 1, such as 0.845 for ARTI-0001 or 0.236 for ARTI-0002—alongside corresponding uncertainty magnitudes measured on a continuous scale, ranging from 22.02 for ARTI-0004 up to 690.59 for ARTI-0001. These paired metrics allow downstream consumers to weight annotations appropriately: a high-confidence annotation with low uncertainty (ARTI-0004, with confidence 0.303 and uncertainty 22.02) may still be more actionable than a seemingly higher-confidence annotation burdened by extreme uncertainty (ARTI-0001, confidence 0.845 but uncertainty 690.59). The numeric value associated with each annotation—such as 979.94 or 284.47—represents the measured or derived quantity that the annotation qualifies.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

Annotations are further classified through dimensional metadata that assigns each instance a human-readable label and a categorical grouping. The dim_annotation dimension links to annotation facts via shared identifiers, providing labels like "Annotation Label 01" and categories such as "Annotation Category 01" through "Annotation Category 04." This categorical layer enables aggregation and filtering of annotations by domain, purpose, or confidence tier, supporting governance workflows that require different review standards for different annotation types. The entity-identifier relationship—where each annotation fact references its corresponding dimension record—ensures that classification metadata remains consistent and independently manageable from the quantitative quality signals recorded in the fact table.

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |