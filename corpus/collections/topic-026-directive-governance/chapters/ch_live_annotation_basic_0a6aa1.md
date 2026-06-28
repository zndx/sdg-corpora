---
chapter_id: ch_live_annotation_basic_0a6aa1
topic_id: 26
family: 02_observation_measurement
cited_terms: ['annotation_basic', 'annotation_classifies_artifact', 'annotation_classifies_class']
model: engine-refine
---

Unique identifiers serve as the immutable anchor points for every annotation and classification record within the governance framework, ensuring traceability across audit trails and compliance workflows. Each identifier—such as ANNO-0001 or ARTI-0001—uniquely resolves to a specific entity, which represents the target artifact, condition, or process under review. By decoupling the primary key from the descriptive content, the system maintains referential integrity even as annotations evolve from API deprecation warnings to GDPR compliance markers. This separation allows downstream systems to reliably join classification facts to their originating entities without duplicating metadata or introducing drift, establishing a single source of truth for regulatory tracking.

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | API deprecation warning |
| ANNO-0002 | Experimental condition override |
| ANNO-0003 | GDPR Compliant |
| ANNO-0004 | Compliance audit marker |
| ANNO-0005 | API deprecation warning |
| ANNO-0006 | Audit Trail |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Compliance Verified |
| ARTI-0002 | Audit Trail |
| ARTI-0003 | Experimental condition override |
| ARTI-0004 | Internal Use Only |
| ARTI-0005 | Dataset quality flag |
| ARTI-0006 | Telemetry schema update |

The attr definitions and their associated attr type specifications establish the schema discipline required for auditable metadata management. Rather than storing unstructured notes, the framework enforces strict typing through attribute names like confidence, dimension_kind, method, and recorded_at, each bound to precise formats such as xsd:decimal, xsd:string, and xsd:dateTime. This attr type enforcement guarantees that temporal stamps, categorical labels, and numerical metrics are parsed, validated, and indexed consistently. When an entity is evaluated, the attr type dictates how the value is stored and queried, preventing type coercion errors and ensuring that compliance checks operate against standardized data representations rather than ambiguous text fields.

The classifies dimension and its associated category assignments provide the taxonomic structure that organizes annotations into actionable governance groups. Each classifies key links an annotation to a broader classification label and assigns it to a specific category, enabling bulk policy enforcement and regulatory mapping. For instance, grouping records under Classifies Category 01 or Classifies Category 02 allows auditors to filter compliance artifacts by regulatory domain rather than searching individual annotations. This hierarchical categorization transforms isolated metadata entries into a coherent classification matrix, supporting automated routing, role-based access controls, and standardized reporting across distributed systems.

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

Quantitative risk assessment relies on the paired metrics of confidence and uncertainty to calibrate decision thresholds and audit rigor. Confidence scores, expressed as normalized decimals like 0.845 or 0.236, indicate the system’s certainty that an annotation accurately reflects the underlying state, while uncertainty values—such as 690.59 or 22.02—capture the variance or margin of error surrounding that assessment. In high-stakes compliance environments, these dual metrics prevent overreliance on single-point estimates; a record with high confidence but elevated uncertainty triggers secondary review, whereas low-confidence annotations with minimal uncertainty may be deprioritized. Together, they form a risk-weighted scoring mechanism that aligns automated classification with human oversight protocols.

Heterogeneous metadata is captured through a flexible miscellaneous value repository that accommodates diverse data modalities without compromising structural integrity. The misc value field serves as the unified container for temporal, numerical, and textual payloads, storing everything from ISO 8601 timestamps like 2023-10-01T01:18:56 to locale identifiers such as fr, document classifications like pre-release note, and encoded dimension strings like Dimension Kind 01. By normalizing these disparate values into a single value-resolution mechanism linked to their respective attribute definitions, the framework supports multi-language annotations, versioned records, and cross-domain metadata aggregation. This design ensures that compliance artifacts remain richly contextualized while remaining queryable, auditable, and resilient to schema evolution.

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |