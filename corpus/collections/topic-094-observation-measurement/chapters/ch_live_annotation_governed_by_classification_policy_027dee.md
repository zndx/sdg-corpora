---
chapter_id: ch_live_annotation_governed_by_classification_policy_027dee
topic_id: 94
family: 02_observation_measurement
cited_terms: ['annotation_governed_by_classification_policy', 'annotation_only_about_artifact', 'annotation_with_confidence']
model: engine-refine
---

Annotation systems in operational environments rest upon a layered architecture of identifiers, categories, confidence scores, and uncertainty metrics, each serving a distinct governance function. At the foundation, every annotation receives a unique identifier—POLI-0001, ARTI-0003, CONF-0002—that anchors it within the data fabric and enables unambiguous cross-referencing across fact and dimension tables. These identifiers are not arbitrary; they encode provenance, with POLI- prefixed keys denoting policy-level annotations and ARTI- prefixed keys indicating artifact-level annotations, while CONF- prefixed keys signal confidence-specific records. The identifier column thus functions as the primary key through which all downstream relationships are resolved, ensuring that an annotation's metadata, its quantitative assessments, and its role assignments can be traced to a single authoritative record.

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

The classification of annotations into categories provides the semantic scaffolding upon which governance policies are built. Dimension tables assign each annotation to a category—Annotation Category 01 through Annotation Category 04—while simultaneously maintaining human-readable labels such as Annotation Label 01 or Annotation Label 04. This separation between machine-consumable category codes and human-readable labels reflects a deliberate design choice: automated systems operate on the categorical taxonomy for filtering, aggregation, and policy enforcement, while analysts and auditors reference the label column for interpretability. The annotation itself, stored as a key such as ARTI-0005 or ARTI-0001, represents the substantive entity being annotated—whether a telemetry stream, a laboratory assay plate, or another operational artifact—and is linked to its categorical context through the identifier relationship.

Confidence and uncertainty form the quantitative backbone of annotation quality assessment, operating as complementary measures that together characterize the reliability of each annotation. Confidence values, expressed as continuous scores between zero and one, range from 0.236 for lower-confidence annotations to 0.845 for those with substantial evidentiary support. These scores are not isolated; they are paired with uncertainty metrics that quantify the magnitude of doubt, with values such as 690.59 and 593.98 indicating high uncertainty alongside lower confidence, while values like 22.02 and 104.01 correspond to higher confidence scores of 0.303 and 0.271 respectively. The inverse relationship between confidence and uncertainty is not strictly monotonic, reflecting the multidimensional nature of evidence quality: an annotation may carry moderate confidence yet low uncertainty if the underlying data is consistent but limited in scope.

The confidence assessment framework extends beyond scalar scores to include categorical confidence designations that capture the methodological basis of each confidence determination. Records such as CONF-0001 through CONF-0004 link specific annotations—Telemetry Stream US East, Lab Assay Plate 12B—to confidence types including 95 Percent Confidence, Cross Referenced, Ensemble Agreement, and Expert Verified. This categorical layer provides transparency into how confidence was derived: whether through statistical thresholds, independent corroboration, aggregation of multiple sources, or domain expert judgment. The junction table that connects annotations to confidence designations introduces the role dimension, specifying whether an entity acted as contributor, observer, or reviewer in the confidence assessment process.

Role assignments within the confidence-annotation relationship table establish accountability and traceability for each confidence determination. The subject column identifies the annotation being assessed, the target column identifies the confidence designation applied, and the role column specifies the function of the linking entity—whether it contributed evidence, observed the assessment, or reviewed the final determination. For instance, CONF-0001 appears as both a subject (linking to annotation CONF-0007) with a contributor role and as a target (linked from annotation CONF-0001) with a reviewer role, demonstrating that the same identifier can occupy different relational positions depending on context. This multiplicity of roles ensures that the provenance chain for each annotation's confidence assessment is fully documented, enabling auditors to reconstruct not only what confidence was assigned but who was responsible for it and in what capacity.

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |

Ancillary metadata columns—labeled misc in the schema—capture supplementary quantitative values such as 979.94, 370.63, 360.27, and 284.47 that do not fit neatly into the primary confidence-uncertainty framework but remain relevant for downstream analysis. These values may represent derived scores, normalization factors, or domain-specific metrics that complement the core annotation attributes. Together, the identifier, annotation, category, confidence, uncertainty, role, subject, target, and misc columns form a comprehensive annotation governance model that balances machine-readability with human interpretability, quantitative rigor with qualitative transparency, and granular traceability with operational scalability.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

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