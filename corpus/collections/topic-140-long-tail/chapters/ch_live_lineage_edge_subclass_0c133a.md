---
chapter_id: ch_live_lineage_edge_subclass_0c133a
topic_id: 140
family: 05_provo_lineage
cited_terms: ['lineage_edge_subclass', 'lineage_edge_to_target', 'lineage_edge_via_transformation']
model: engine-refine
---

Data lineage in governed environments rests upon a tripartite evidentiary structure: identifiers anchor each relationship, confidence and uncertainty quantify the reliability of inferred connections, and label text, unit, and value attributes supply the semantic and quantitative context necessary for downstream consumption. The edge subclass table assigns opaque identifiers such as EDGE-0001 through EDGE-0004 to individual lineage edges, each of which records a source-to-destination relationship—for instance, the sensor calibration log originating from the PostgreSQL raw database (EDGE-0001) versus the feature vector set sourced from the GCS raw zone (EDGE-0002). These identifiers are not merely cataloguing conveniences; they serve as the immutable join keys that permit cross-referencing between the edge subclass, the transformation path, and the target assignment tables, ensuring that every assertion about data provenance can be traced to a single, unambiguous record.

**t_lineage_edge_subclass**

| id | lineage | from_source | confidence | label_text |
| --- | --- | --- | --- | --- |
| EDGE-0001 | SensorCalibrationLog | PostgreSQLRawDB | 0.584 | intake form |
| EDGE-0002 | feature_vector_set | GCSRawZone | 0.101 | calibration record |
| EDGE-0003 | JSON Schema Validation | RESTAPIGateway | 0.280 | intake form |
| EDGE-0004 | sensor_calibration_log | S3ArchivalBucket | 1.000 | calibration record |
| EDGE-0005 | JSON Schema Validation | RedisCacheStore | 0.544 | audit excerpt |
| EDGE-0006 | Supply Chain Manifest | OracleERPSystem | 0.796 | calibration record |
| EDGE-0007 | PatientAdmissionRecord | RedisCacheStore | 0.907 | change rationale |
| EDGE-0008 | quality_validation_suite | KafkaEventsStream | 0.508 | audit excerpt |

**t_lineage_edge_to_target**

| id | lineage | to_target | unit | value |
| --- | --- | --- | --- | --- |
| TARG-0001 | FinancialLedgerSync | executive_dashboard | nm | 555.98 |
| TARG-0002 | Schema Migration | feature_store_table | ratio | 967.34 |
| TARG-0003 | FinancialLedgerSync | executive_dashboard | count | 771.21 |
| TARG-0004 | Clinical Trial Registry | risk_prediction_model | kg | 171.35 |
| TARG-0005 | Kafka Stream Filter | analytics_warehouse | count | 934.12 |
| TARG-0006 | Sensor Telemetry Archive | backup_snapshot | count | 626.71 |

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | compliance_audit_log | NetworkTrafficDump | 0.439 | 766.93 |
| TRAN-0002 | Clinical Trial Registry | experiment_run | 0.111 | 650.52 |
| TRAN-0003 | Sensor Telemetry Archive | Genomic Variant Catalog | 0.554 | 878.86 |
| TRAN-0004 | compliance_audit_log | NetworkTrafficDump | 0.532 | 350.43 |
| TRAN-0005 | NetworkTrafficDump | Patient Cohort Extraction | 0.034 | 365.80 |
| TRAN-0006 | Patient Cohort Extraction | Patient Cohort Extraction | 0.440 | 497.03 |

Confidence scores and uncertainty measures operate as complementary quantifiers of relational trust. In the edge subclass table, confidence values span a wide range: the sensor calibration log derived from the S3 archival bucket carries a confidence of 1.000, indicating near-certainty in the inferred lineage, whereas the feature vector set from the GCS raw zone registers a confidence of merely 0.101, signalling that the connection is tenuous or derived from weak evidence. The transformation path table mirrors this pattern, with the Clinical Trial Registry passing through the experiment_run transformation yielding a confidence of 0.111 and a corresponding uncertainty of 650.52, while the Sensor Telemetry Archive traversing the Genomic Variant Catalog achieves a confidence of 0.554 alongside an uncertainty of 878.86. The inverse relationship between confidence and uncertainty is not strictly monotonic—TRAN-0004, for example, records a confidence of 0.532 with an uncertainty of only 350.43, suggesting that the uncertainty metric captures variance or noise in the transformation process rather than serving as a simple complement to confidence.

Label text and unit attributes ground these abstract relationships in domain-specific semantics. The edge subclass table distinguishes between intake forms and calibration records as label texts, with the former appearing for both the SensorCalibrationLog (EDGE-0001) and the JSON Schema Validation (EDGE-0003), and the latter for the feature vector set (EDGE-0002) and the sensor calibration log (EDGE-0004). This categorical labelling enables auditors to filter lineage edges by document type without inspecting the underlying data payloads. The target assignment table introduces units—nanometres (nm), ratio, count, and kilograms (kg)—that qualify the numeric values associated with each edge-to-target mapping. The Financial Ledger Sync, for instance, feeds the executive dashboard with a value of 555.98 in nanometres (TARG-0001) and, in a separate mapping, a count of 771.21 (TARG-0003), while the Clinical Trial Registry contributes 171.35 kg to the risk prediction model (TARG-0004). The presence of heterogeneous units across otherwise identical lineage paths—such as the dual Financial Ledger Sync entries targeting the same executive dashboard with different units—underscores the necessity of explicit unit annotation for correct data interpretation.

The value column in the target assignment table provides the quantitative payload that accompanies each lineage assertion. Values such as 967.34 (a ratio, TARG-0002) for the Schema Migration flowing into the feature store table, or 771.21 (a count, TARG-0003) for the Financial Ledger Sync targeting the executive dashboard, represent measured or derived quantities that downstream consumers must reconcile with their own expectations. When combined with the unit field, these values form complete assertions: a ratio of 967.34 is semantically distinct from a count of 771.21, even though both originate from lineage paths that may share overlapping source systems. The misc column, carrying these numeric values, thus functions as the bridge between abstract provenance metadata and the concrete data elements that operational systems depend upon for decision-making.

Together, these six attributes—identifier, confidence, label text, unit, uncertainty, and value—constitute a minimal but sufficient evidentiary framework for data lineage governance. The identifier ensures traceability, confidence and uncertainty quantify epistemic assurance, label text provides categorical context, and unit and value supply the quantitative substance of each lineage claim. In practice, an auditor reviewing the Clinical Trial Registry's dual presence—appearing with a confidence of 0.111 in the transformation table (TRAN-0002) and with a value of 171.35 kg in the target table (TARG-0004)—can reconstruct a complete picture: the lineage path is uncertain, the transformation through the experiment_run introduces significant noise (uncertainty 650.52), yet the resulting contribution to the risk prediction model is a precisely measured 171.35 kg. Such granularity enables compliance teams to distinguish between relationships that are well-established and those that warrant further investigation, forming the backbone of any defensible data governance programme.