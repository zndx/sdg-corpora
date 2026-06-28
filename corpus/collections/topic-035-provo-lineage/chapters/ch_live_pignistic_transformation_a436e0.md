---
chapter_id: ch_live_pignistic_transformation_a436e0
topic_id: 35
family: 07_long_tail
cited_terms: ['pignistic_transformation', 'ontology_class_match', 'dataset_was_generated_by']
model: engine-refine
---

Ontology matching in this framework is anchored by a unique identifier that serves as the immutable reference for every entity, whether it is a pignistic transformation such as TRAN-0001, a dataset lineage record such as GENE-0001, or an ontology class correspondence such as MATC-0001. Each identifier is paired with a matches_ontology_class designation that links the entity to a canonical class within a controlled vocabulary; for instance, MATC-0001 resolves to MATC-0008, while MATC-0002 and MATC-0004 both point to MATC-0002 and MATC-0008 respectively. These class references are further qualified by a category field that partitions ontology classes into distinct groups—Matches Ontology Class Category 01 through 04—enabling downstream consumers to filter or aggregate matches by their semantic grouping. The category thus functions as a coarse-grained classifier, while the identifier provides the fine-grained handle required for precise retrieval and audit.

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

The quality of each ontology match is quantified along two orthogonal axes: confidence and uncertainty. Confidence values are expressed as continuous scores between zero and one, with MATC-0001 attaining 0.796 and MATC-0003 reaching 0.829, indicating strong alignment with the target ontology class, whereas MATC-0002 registers only 0.272, signaling a weak or tentative match. Uncertainty, measured in absolute units, captures the dispersion or noise associated with the match; MATC-0003 exhibits a low uncertainty of 27.88 alongside its high confidence, whereas MATC-0004 carries a substantial uncertainty of 688.77 despite a moderate confidence of 0.584. This dual metric allows governance frameworks to distinguish between matches that are both confident and precise and those that require human review or probabilistic handling.

Beyond the ontology dimension, the system models generative provenance through a tripartite relationship structure comprising subject, target, and role. A dataset such as supply-chain-manifest, satellite-imagery-stack, lab-culture-growth, or genomic-variant-call is linked to its generating artifact—edge-compute-node, telemetry-collector, or ml-training-runner—via a join record that assigns a role to the relationship. In the dataset lineage table, the role field takes values of observer or contributor, distinguishing passive monitoring from active participation in the generation process. Similarly, the pignistic transformation join table assigns the role reviewer or contributor to the linkage between a pignistic entity and its transformed counterpart, establishing an auditable chain of responsibility that can be queried for compliance or reproducibility purposes.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

The misc column serves as a catch-all for descriptive metadata that does not fit into the structured classification or numeric quality dimensions. It carries human-readable labels such as Matches Ontology Class Label 01 through 04, concrete dataset names, and domain-specific descriptors including diagnostic confidence matrix, telemetry belief assignment, anomaly likelihood set, pignistic probability distribution, and transformed belief state. These free-form values provide the contextual scaffolding that makes machine-readable identifiers and scores interpretable to analysts and auditors. Together, the identifier, category, confidence, uncertainty, matches_ontology_class, subject, target, role, and misc fields form a cohesive schema for tracking what entities are, how they relate, how well they match known classes, and who or what is responsible for their existence.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |