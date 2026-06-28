---
chapter_id: ch_live_flood_defence_condition_characterisation_3e3e06
topic_id: 97
family: 08_derived
cited_terms: ['flood_defence_condition_characterisation', 'claim_refuted_by_evidence', 'lineage_edge_via_transformation']
model: engine-refine
---

In evidence-based governance frameworks, every assertion is anchored to a persistent identifier that enables traceability across heterogeneous data sources. Claims such as "Carbon emissions peaked," "Patient dosage exceeds limit," "Supply chain disruption," and "Firmware update breaks encryption" are each assigned unique identifiers (EVID-0001 through EVID-0004) and subsequently refuted by distinct forms of counterevidence. The refutation relationship is mediated through a structured linkage that designates a subject—the originating claim—and a target—the refuting evidence—while a role attribute (observer or reviewer) specifies the functional capacity in which the evidence bears upon the claim. For instance, the claim EVID-0001 is refuted by evidence EVID-0003 in a reviewer capacity, whereas EVID-0006 and EVID-0007 both reference EVID-0004 under an observer role, with the refuting evidence itself taking the form of a Compliance checklist v2.1 or a Satellite imagery timestamp depending on the domain context.

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |

Within the domain of flood defence infrastructure assessment, condition characterisations serve as the primary mechanism for translating raw earth observation data into actionable engineering judgments. A flood defence condition characterisation—whether an ExpertReviewPanel assessment, GroundTruthSampling protocol, CrossSensorCalibration exercise, or an UncertaintyPropagated evaluation—establishes the methodological lens through which satellite-derived measurements are interpreted. The earth observation data underpinning these characterisations includes CopernicusDEM digital elevation models, Sentinel1GRD synthetic aperture radar imagery, and LiDARBathymetry surveys, each contributing distinct spatial and radiometric properties to the assessment. Validation processes such as HistoricalBaselineMatch, GroundTruthSampling, and the SeineBreach2016 event analysis provide the empirical grounding necessary to confirm that characterisations align with observed reality.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |

Data lineage tracking introduces two complementary quantitative dimensions—confidence and uncertainty—that together quantify the reliability of transformation processes connecting upstream data sources to downstream outputs. A lineage edge records the specific transformation (e.g., Genomic Variant Catalog, Clinical Trial Registry, Financial Risk Pipeline) through which a lineage such as Inventory Reconciliation, Patient Cohort Extraction, or Timezone Normalization is realized, while assigning a confidence score and an uncertainty magnitude to the resulting linkage. Confidence values range from 0.111 for a Patient Cohort Extraction via Clinical Trial Registry to 0.554 for Timezone Normalization through a Financial Risk Pipeline, with corresponding uncertainty measures spanning from 350.43 to 878.86. These paired metrics enable governance bodies to weight evidence appropriately when adjudicating between competing claims or when propagating assessments across analytical pipelines.

The integration of these components—persistent identifiers, role-mediated refutation relationships, earth observation–driven condition characterisations, and confidence-uncertainty quantified lineage edges—constitutes a coherent architecture for evidence governance. By explicitly encoding how claims are challenged, how observational data is characterised and validated, and how transformations introduce quantifiable uncertainty, the framework supports auditable decision-making across regulatory, engineering, and scientific domains. The SeineBreach2016 validation process, for example, does not merely confirm a single characterisation but participates in a broader evidentiary network where observer and reviewer roles, confidence thresholds, and uncertainty bounds collectively determine whether a claim withstands scrutiny.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |