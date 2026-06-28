---
chapter_id: ch_live_constraint_basic_3f95e6
topic_id: 19
family: 03_directive_governance
cited_terms: ['constraint_basic', 'subclass_to_descriptive_ice', 'flood_defence_condition_characterisation']
model: engine-refine
---

Flood defence condition characterisation constitutes the governed practice by which asset condition is inferred, documented, and made auditable within operational and compliance regimes. Each characterisation method—whether ExpertReviewPanel, GroundTruthSampling, CrossSensorCalibration, or UncertaintyPropagated—represents a distinct epistemic pathway through which structural integrity, hydraulic performance, or residual risk is assessed and recorded. These methods do not operate in isolation; they are bound to identifiable records, referenced throughout handbooks and operational guides by stable identifiers such as CHAR-0001 through CHAR-0004, so that citations, amendments, and cross-references remain unambiguous across versions and jurisdictions. The identifier serves as the anchor of traceability: it permits auditors, engineers, and data stewards to locate the precise characterisation rule, its evidentiary basis, and its validation history without conflating method with outcome or conflating one asset class with another.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |

Earth observation data supplies the observational substrate on which many characterisations rest. CopernicusDEM furnishes terrain and elevation context suitable for panel-based expert review; Sentinel1GRD contributes all-weather radar backscatter amenable to ground-truth sampling protocols; LiDARBathymetry supports cross-sensor calibration and uncertainty propagation where submerged or near-shore geometry must be resolved at fine resolution. The involvement of a given observation product in a characterisation is not incidental metadata but a governance-relevant declaration: it establishes which remote-sensing lineage, spatial resolution, and temporal refresh assumptions attach to the resulting condition statement. Where CHAR-0003 and CHAR-0004 both employ LiDARBathymetry yet diverge in characterisation method—CrossSensorCalibration versus UncertaintyPropagated—the shared data source underscores that identical inputs may yield formally distinct condition narratives depending on the analytical frame and the validation process applied.

Validation processes close the loop between observation, inference, and defensible reporting. HistoricalBaselineMatch anchors expert-led review against long-run reference conditions; GroundTruthSampling pairs remote inference with in situ verification; event-specific processes such as SeineBreach2016 supply empirical breach or overtopping cases against which calibrated or uncertainty-aware models may be stress-tested. A validation process is therefore not a generic quality check but a named, reproducible procedure whose selection is co-registered with the characterisation method and the earth observation product. When GroundTruthSampling appears both as a characterisation modality (CHAR-0002) and as the validation process for that same record, the registry makes explicit that method and validation are sometimes conjoined—a design choice that reduces ambiguity in audit trails where field campaigns and satellite acquisitions must be temporally aligned.

Parallel constraint registries govern how data and metadata enter, persist, and exit the characterisation workflow. Constraints such as ENCRYPTION_AES256, UNIQUE_EMAIL, PACKET_SIZE_MAX_1500, and MAX_LENGTH_255 are issued under identifiers CONS-0001 through CONS-0004 and carry enforcement classifications that determine operational consequence: blocking constraints halt progression until compliance is demonstrated, whereas mandatory constraints compel adherence without necessarily interrupting downstream steps in identical fashion. PACKET_SIZE_MAX_1500, enforced as mandatory rather than blocking, illustrates that not all non-negotiable rules impose the same transactional semantics; governance frameworks must therefore treat enforcement as a first-class attribute, not an implied severity. Each constraint is further associated with label text—nightly summary, intake form, pre-release note—that situates the rule within the documentary lifecycle: the intake form becomes the locus where uniqueness and packet-size requirements are attested at submission, while pre-release notes surface length limits before publication of condition assessments.

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

Label text and language together mediate between machine-enforceable rules and the human-readable surfaces on which compliance is performed. In the descriptive information-classification registry, schema_version_patch and annotation_layer_b both resolve to the intake form label in English and German respectively, signalling that subclass descriptors are presented to operators through locale-appropriate forms without altering the underlying semantic binding. metadata_registry appears under calibration record in German and under audit excerpt in English, demonstrating that a single descriptive anchor may surface in different documentary contexts depending on language and procedural role. This pattern matters for multinational flood-risk programmes where calibration provenance must be legible to field technicians in one jurisdiction and audit-ready to regulators in another; label text is not decorative copy but the governed interface through which identifiers, constraints, and characterisation metadata become actionable.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |

Operational integrity emerges when identifiers, enforcement, label text, language, earth observation lineage, characterisation method, and validation process are maintained as a coherent, evidence-anchored graph rather than as disconnected tables. An auditor tracing CHAR-0003 can follow LiDARBathymetry through CrossSensorCalibration to the SeineBreach2016 validation anchor, while simultaneously verifying that intake-form constraints on packet size and email uniqueness were blocking or mandatory at the point of data capture, and that German-language calibration records correctly referenced metadata_registry. The handbook does not substitute for statutory obligation or asset-owner duty of care; it specifies how named artefacts interoperate so that condition characterisations derived from earth observation remain defensible, locale-consistent, and enforceable across the full chain from submission to release.