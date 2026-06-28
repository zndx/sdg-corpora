---
chapter_id: ch_live_outlier_claim_supported_by_lift_827b67
topic_id: 86
family: 02_observation_measurement
cited_terms: ['outlier_claim_supported_by_lift', 'outlier_claim_with_attribute_set', 'outlier_detection_basic']
model: engine-refine
---

Outlier detection and attribution in distributed systems demands a rigorous evidentiary chain, wherein each anomalous observation is not merely catalogued but substantiated through structured claims and their supporting artefacts. An outlier event—whether manifesting as a pipeline_stall, a disk_io_stall, a latency_spike, or a sensor_drift_spike—constitutes the primary anomaly signal, yet its analytical value derives entirely from the provenance and attribute sets that corroborate it. The identifier column serves as the immutable key through which each claim is tracked across the evidence graph; identifiers such as LIFT-0001, LIFT-0002, LIFT-0003, and LIFT-0004 anchor distinct outlier claims, while the supported_by column records the nature of the backing evidence, whether a provenance_chain_hash establishing an immutable audit trail or a baseline_variance_report quantifying deviation from expected behaviour. This separation of claim from support is not merely organisational—it enforces a clear distinction between what was observed and what validates that observation, a distinction critical to any system requiring reproducible incident analysis.

**t_outlier_claim_supported_by_lift**

| id | outlier |
| --- | --- |
| LIFT-0001 | pipeline_stall |
| LIFT-0002 | disk_io_stall |
| LIFT-0003 | latency_spike |
| LIFT-0004 | sensor_drift_spike |
| LIFT-0005 | packet_loss_surge |
| LIFT-0006 | sensor_drift_spike |
| LIFT-0007 | calibration_drift |

**t_outlier_claim_supported_by_lift_supported_by**

| id | supported_by |
| --- | --- |
| LIFT-0001 | provenance_chain_hash |
| LIFT-0002 | baseline_variance_report |
| LIFT-0003 | baseline_variance_report |
| LIFT-0004 | provenance_chain_hash |
| LIFT-0005 | validation_rule_match |
| LIFT-0006 | audit_trail_entry |
| LIFT-0007 | anomaly_detection_score |
| LIFT-0008 | historical_trend_chart |

**t_outlier_claim_supported_by_lift__supported_by**

| id | outlier_id | supported_by_id | role |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0005 | LIFT-0007 | observer |
| LIFT-0002 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0003 | LIFT-0007 | LIFT-0005 | contributor |
| LIFT-0004 | LIFT-0007 | LIFT-0006 | reviewer |
| LIFT-0005 | LIFT-0007 | LIFT-0008 | reviewer |
| LIFT-0006 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0007 | LIFT-0003 | LIFT-0006 | contributor |
| LIFT-0008 | LIFT-0001 | LIFT-0001 | observer |

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

**t_outlier_claim_supported_by_lift__attribute_set**

| id | outlier_id | attribute_set_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| LIFT-0001 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 01 |
| LIFT-0002 | LIFT-0007 | LIFT-0001 | contributor | Cardinality Note 02 |
| LIFT-0003 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 03 |
| LIFT-0004 | LIFT-0001 | LIFT-0001 | reviewer | Cardinality Note 04 |
| LIFT-0005 | LIFT-0006 | LIFT-0004 | contributor | Cardinality Note 05 |
| LIFT-0006 | LIFT-0001 | LIFT-0001 | owner | Cardinality Note 06 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | observer | Cardinality Note 07 |
| LIFT-0008 | LIFT-0005 | LIFT-0004 | contributor | Cardinality Note 08 |

The relational architecture governing these claims introduces a layer of semantic precision through role-annotated associations. A many-to-many relationship between outlier claims and their supporting evidence is mediated by a junction table that assigns each linkage a role—observer, reviewer, or contributor—thereby encoding not only that a piece of evidence supports a claim, but the capacity in which it does so. An observer role might indicate that a provenance_chain_hash was passively recorded during normal telemetry collection, whereas a reviewer role suggests active human or automated validation. Similarly, the association between outlier claims and attribute sets—quantitative descriptors such as frequency_range_limit, error_rate_percent, confidence_level_95, and deviation_sigma_count—is governed by a parallel junction table that carries both a role designation and a cardinality_note. The cardinality_note field, exemplified by entries such as Cardinality Note 01 through Cardinality Note 04, provides metadata about the multiplicity constraints of the association, ensuring that downstream consumers of the data understand whether an attribute set is mandatory, optional, or bounded in its application. This dual annotation—role and cardinality—transforms a simple foreign-key relationship into a semantically rich assertion about the nature and strength of evidentiary support.

A parallel evidentiary structure operates under the SET namespace, where outlier claims encompass different anomaly modalities including checksum_mismatch, sensor_drift, flow_rate_anomaly, and log_flooding. These claims are similarly supported by attribute sets—tolerance_ranges, baseline_values, and calibration_constants—and linked through role-annotated junction tables. The presence of two distinct evidentiary frameworks (LIFT and SET) reflects a domain design in which different classes of anomalies are governed by different attribute taxonomies and support mechanisms, yet both adhere to the same relational pattern of claim, support, and semantic annotation. The role column in both frameworks consistently distinguishes between owner, contributor, and reviewer designations, establishing a uniform vocabulary for evidentiary responsibility across all anomaly types.

Beyond the claim and support structures, the operational telemetry of outlier events is captured in a fact table that records the temporal and behavioural characteristics of each detected anomaly. The duration_seconds column quantifies how long an outlier persisted—values such as 3360.34 seconds, 6466.78 seconds, 5282.09 seconds, and 1182.39 seconds provide a direct measure of event severity and system impact. The exit_code column, with values ranging from 4 to 760, encodes the termination condition or error classification of the affected process, while the retry_count column—spanning from 101 to 308 in the observed data—captures the system's resilience behaviour, indicating how many recovery attempts were made before the event was resolved or escalated. These three columns together form a compact operational triad: duration tells how long the system was degraded, exit tells why it stopped, and retry tells how hard the system tried to recover.

The dimensional layer completes the evidentiary model by attaching human-readable labels and categorical classifications to each detected outlier. The misc column, populated with entries such as Outlier Label 01 through Outlier Label 04, provides a free-text or semi-structured annotation field for additional context that does not fit within the rigid claim-support-attribute schema. The category column, with values like Outlier Category 01 through Outlier Category 04, provides a coarse-grained taxonomy for grouping outliers by their fundamental nature—whether they stem from hardware degradation, software defects, environmental factors, or configuration errors. This categorical labelling enables aggregation and trend analysis across the full population of detected anomalies, while the misc field preserves the granularity needed for detailed post-incident review. Together, the identifier, outlier, duration_seconds, exit_code, retry_count, misc, and category columns form a complete operational record that bridges the gap between raw telemetry and actionable incident intelligence.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | sensor_drift |
| SET-0003 | flow_rate_anomaly |
| SET-0004 | log_flooding |
| SET-0005 | checksum_mismatch |
| SET-0006 | flow_rate_anomaly |
| SET-0007 | log_flooding |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |