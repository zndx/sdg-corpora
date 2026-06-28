---
chapter_id: ch_live_outlier_claim_supported_by_lift_75d612
topic_id: 186
family: 02_observation_measurement
cited_terms: ['outlier_claim_supported_by_lift', 'control_implements', 'gauge_metric_subclass']
model: engine-refine
---

Outlier claims in the evidence model are anchored by stable identifiers such as `LIFT-0001` through `LIFT-0004`, each representing a distinct anomaly event—`flow_rate_anomaly`, `voltage_sag_incident`, `seismic_tremor_signal`, or `packet_loss_surge`. These identifiers serve as the primary key for the claim table and propagate through every downstream relationship, ensuring that each outlier can be traced unambiguously across supporting evidence, attribute associations, and cross-references. The identifier convention (`LIFT-` prefix with zero-padded sequencing) provides a human-readable namespace while remaining machine-parsable, a design choice that supports both auditability and programmatic joins.

**t_outlier_claim_supported_by_lift**

| id | outlier |
| --- | --- |
| LIFT-0001 | flow_rate_anomaly |
| LIFT-0002 | voltage_sag_incident |
| LIFT-0003 | seismic_tremor_signal |
| LIFT-0004 | packet_loss_surge |
| LIFT-0005 | pH_deviation_alert |
| LIFT-0006 | network_latency_burst |
| LIFT-0007 | thermal_runaway_event |

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

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

Supporting evidence for each outlier claim is captured through a many-to-many association between outlier records and their backing artifacts. An outlier such as `LIFT-0001` may be supported by a `provenance_chain_hash`, while `LIFT-0002` and `LIFT-0003` both reference a `baseline_variance_report`, demonstrating that multiple claims can share the same evidentiary basis. The junction table governing this relationship introduces a `role` attribute—values like `observer`, `reviewer`, and `contributor`—which semantically qualifies how each supporting artifact participates in the claim. This role dimension is critical: it distinguishes between an artifact that passively corroborates a finding and one that actively shapes its derivation, enabling downstream governance queries that filter evidence by its functional contribution.

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

Attribute sets attach quantitative and qualitative metadata to outlier claims, with entries such as `frequency_range_limit`, `error_rate_percent`, `confidence_level_95`, and `deviation_sigma_count`. The association between outliers and attribute sets is itself a many-to-many relationship governed by a junction table that carries both a `role` and a `cardinality_note`. The `role` here—`owner`, `contributor`, or `reviewer`—specifies the attribute set's relationship to the claim, while the `cardinality_note` (e.g., `Cardinality Note 01` through `Cardinality Note 04`) documents constraints on how many attribute sets may be associated with a given outlier. These cardinality notes are essential for data quality enforcement: they encode business rules about whether an outlier must have exactly one attribute set, may have multiple, or must have at least one, and they are validated at ingestion time to prevent orphaned or over-attached claims.

The control-implementation matrix maps governance controls to the technical mechanisms that realize them. A control such as `Change Advisory Board` or `Data Retention Schedule` is linked to an implementation artifact like `Automated Backup Scripts`, `Database Audit Trails`, or `Patch Deployment Pipeline`. Each linkage carries a `priority` value (ranging from 1 to 5, where 1 denotes highest priority) and a `scope` dimension (`regional`, `global`, or `team`). For instance, the `Access Review Cycle` control is assigned priority 1 with `team` scope, indicating it is the most urgent control and applies at the team level, whereas `Data Retention Schedule` appears twice with priority 3 but different implementations and scopes, illustrating that a single control can be realized through multiple mechanisms across different organizational boundaries.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | Automated Backup Scripts | 5 | regional |
| IMPL-0002 | Data Retention Schedule | Automated Backup Scripts | 3 | global |
| IMPL-0003 | Access Review Cycle | Database Audit Trails | 1 | team |
| IMPL-0004 | Data Retention Schedule | Patch Deployment Pipeline | 3 | team |
| IMPL-0005 | GDPR Data Minimization | Container Image Scanning | 1 | global |
| IMPL-0006 | Incident Response Protocol | Network Firewall Rules | 1 | global |
| IMPL-0007 | NIST SP 800-53 | Container Image Scanning | 2 | local |

Metric data is organized through a fact-dimension star schema. The fact table, `fact_gauge`, records measurements identified by keys such as `METR-0001` through `METR-0004`, each associated with a `metric_kind_key` that references the dimension table `dim_metric_kind`. The fact table also stores `size_bytes`—values like 944,581,501 and 15,628,556—representing the volume of data captured by each metric, and a `version` number (4 through 11) that tracks schema or collection methodology changes over time. The dimension table provides the human-readable `metric_kind_label` and `metric_kind_category` for each kind, enabling aggregation and filtering by classification. This separation of measured facts from their categorical metadata supports efficient analytical queries while preserving the ability to reclassify metric kinds without modifying historical measurements.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |