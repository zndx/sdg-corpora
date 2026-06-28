---
chapter_id: ch_live_verification_targets_artifact_14a691
topic_id: 105
family: 03_directive_governance
cited_terms: ['verification_targets_artifact', 'allocation_completed_at', 'annotation_classifies_class']
model: engine-refine
---

In any governance framework, the identifier serves as the immutable anchor for every entity under management—whether it denotes a verification target such as ARTI-0001, an allocation record like COMP-0001, or an annotation entry designated CLAS-0001. These identifiers are not arbitrary; they establish referential integrity across the entire data fabric, enabling downstream systems to resolve relationships without ambiguity. A compliance review cycle tagged ARTI-0001, for instance, can be traced through its associated artifact targets—Sensor calibration matrix, Source code branch—while a data-lake-partition allocation COMP-0001 carries its own temporal provenance, completed at 2023-10-25T22:48:55Z. The identifier is the first principle of traceability, and without it, no classification, no confidence assessment, and no accountability mechanism can function.

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

Classification operates through a two-tier structure: the classifies dimension assigns a categorical label to each entity, while the classifies_key in the fact table binds that classification to a measurable observation. The dim_classifies table provides the taxonomy—Classifies Category 01 through Classifies Category 04, each paired with a human-readable label such as Classifies Label 01—while the fact_annotation table records which classification applies to which observation, as when CLAS-0001 maps to classifies_key CLAS-0001 or CLAS-0006. This separation of taxonomy from instance is deliberate: it permits the category hierarchy to evolve independently of the annotations that reference it, a design choice that matters when regulatory schemas shift or when new classification domains must be introduced without restructuring the fact layer.

Confidence and uncertainty quantify the epistemic state of each annotation, and together they form the basis for risk-weighted decision-making. The confidence field in fact_annotation takes values between zero and one—0.845 for CLAS-0001, 0.236 for CLAS-0002—indicating the degree of assurance that the classification is correct. The uncertainty field, measured in absolute units, provides the complementary metric: 690.59 for CLAS-0001, 22.02 for CLAS-0004. These are not redundant; confidence expresses probabilistic certainty while uncertainty captures the magnitude of potential deviation. An annotation with confidence 0.845 and uncertainty 690.59 signals high confidence in the classification label but substantial absolute variance in the associated value (979.94), whereas an annotation with confidence 0.303 and uncertainty 22.02 reflects low confidence but tight variance around a smaller value (284.47). Governance frameworks must treat these dimensions orthogonally, as a high-confidence classification with high uncertainty may warrant different remediation than a low-confidence classification with low uncertainty.

The subject-target-role triad governs how entities relate to one another across the verification and allocation domains. In the verification artifact junction table, the subject (verification_id) points to the originating verification—ARTI-0002, ARTI-0004, ARTI-0005—while the target (targets_artifact_id) identifies the artifact being verified, such as ARTI-0002 or ARTI-0001. The role column assigns the nature of the relationship: reviewer, owner, contributor. The same pattern appears in the allocation-completion junction, where allocation_id COMP-0005 relates to completed_at_id COMP-0003 with the role observer, and allocation_id COMP-00001 relates to completed_at_id COMP-0002 with the role contributor. This tripartite structure is essential because it captures not merely that two entities are connected, but how they are connected—whether the subject exercises oversight (reviewer), bears responsibility (owner), or participates in execution (contributor). The role is not metadata; it is a governance directive encoded as data.

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

The misc column in fact_annotation—holding values such as 979.94, 370.63, 360.27, 284.47—serves as the quantitative payload of each annotation, the value against which confidence and uncertainty are calibrated. In the dimension table, misc appears as the classifies_label, providing the human-readable name for each category. This dual use of misc reflects a common pattern in dimensional modeling: the same column family carries both machine-readable identifiers and human-readable descriptors, and in the fact table, it carries the measured quantity that the classification acts upon. The value is not the classification itself; it is what the classification describes. A compliance review cycle (verification ARTI-0001) may annotate a sensor calibration matrix (target ARTI-0002) with a value of 979.94, a confidence of 0.845, and an uncertainty of 690.59—each element of the record serving a distinct governance function, and each element traceable back to its identifier.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |