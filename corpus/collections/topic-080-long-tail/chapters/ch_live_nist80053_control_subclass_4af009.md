---
chapter_id: ch_live_nist80053_control_subclass_4af009
topic_id: 80
family: 07_long_tail
cited_terms: ['nist80053_control_subclass', 'annotation_only_about_artifact', 'lineage_edge_describes_column_flow']
model: engine-refine
---

Control identifiers establish the foundational addressing scheme for all governance artifacts, with each entity assigned a unique key such as CONT-0001 through CONT-0004 that serves as the immutable anchor for every subsequent attribute assignment and annotation linkage. These identifiers reference specific regulatory frameworks—NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207—each paired with a control designation such as AC-3, CM-3, SI-4, or SA-4, thereby situating the entity within a recognized compliance taxonomy. The identifier column functions as the primary key across all subclass tables, ensuring referential integrity when attributes are resolved to their corresponding entities and when multi-valued properties are stored in type-specialized value tables.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AC-3 |
| CONT-0002 | NIST SP 800-171 | CM-3 |
| CONT-0003 | NIST CSF 2.0 | SI-4 |
| CONT-0004 | NIST SP 800-207 | SA-4 |
| CONT-0005 | FIPS 140-3 | SR-1 |
| CONT-0006 | NIST SP 800-171 | AU-6 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

Attributes define the dimensional space in which control properties are expressed, with each attribute declared by name and constrained to a specific XML Schema Definition type. The attribute registry includes effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer, establishing a strict type discipline that governs how values are validated and stored. This separation of attribute metadata from attribute values enables the system to support heterogeneous data types within a unified schema: boolean attributes such as mandatory resolve to true or false across entity instances, date attributes such as effective_date carry values like 2023-01-02 or 2025-03-12, integer attributes such as priority hold magnitudes ranging from 3 to 776, and string attributes such as enforcement accommodate free-form content including Encoding 01, Enforcement 02, calibration record, and es. The entity_id column in each value table binds the typed value back to its originating control identifier, while the attr_id column disambiguates which attribute definition governs the interpretation of the stored value.

Annotations provide a parallel layer of metadata that attaches assessed properties to entities with quantified reliability. Each annotation record carries an identifier such as ARTI-0001 through ARTI-0004, references an annotation_key that links to a parent entity, and reports a confidence score alongside an uncertainty measure. Confidence values span a wide dynamic range—from 0.845 indicating strong assessor agreement down to 0.236 reflecting substantial disagreement—while uncertainty values, expressed as continuous measures such as 690.59, 593.98, 104.01, and 22.02, capture the magnitude of residual ambiguity. Associated numeric values like 979.94, 370.63, 360.27, and 284.47 represent the underlying assessment metrics from which confidence and uncertainty are derived. Annotations are further classified through a dimension table that assigns each an annotation_label and an annotation_category, enabling aggregation and filtering by semantic grouping.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

Column flow lineage records document the provenance of data transformations with the same rigor applied to annotations, linking each flow fact to a describes_column_flow_key that identifies the transformation step, and reporting confidence and uncertainty metrics in parallel. Confidence values for column flows—0.645, 0.071, 0.404, and 0.779—reflect varying degrees of assessor certainty about the correctness of the documented data lineage, while uncertainty values such as 612.22, 133.03, 76.69, and 708.23 quantify the associated risk. The value column in lineage facts, holding measures like 903.86, 832.18, 862.00, and 259.55, provides the quantitative basis for these reliability assessments. A corresponding dimension table assigns each flow a descriptive label and a category, supporting hierarchical organization of lineage information. The structural parallelism between annotation and lineage tables—both employing fact-dimension separation, both carrying confidence and uncertainty alongside a numeric value—ensures that all metadata layers are governed by a consistent quality framework.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |