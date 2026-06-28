---
chapter_id: ch_live_transformation_ends_at_94fcdb
topic_id: 186
family: 05_provo_lineage
cited_terms: ['transformation_ends_at', 'outlier_claim_supported_by_lift', 'frame_refinement']
model: engine-refine
---

In distributed data pipelines and governance frameworks, every event and relationship must be precisely catalogued to enable auditability, debugging, and compliance. A unique identifier serves as the immutable anchor for each record—whether it is ENDS-0001 for a completed ETL pipeline run or LIFT-0001 for an outlier claim supported by lift metrics. These identifiers follow a consistent naming convention that encodes the entity type, allowing systems and operators to quickly distinguish between transformation lifecycle records, outlier evidence chains, and frame refinement relationships without ambiguity. When a telemetry normalization pass (ENDS-0003) or a schema migration script (ENDS-0004) completes, the identifier ties together all associated metadata into a single retrievable unit.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |

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

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

The severity and resilience of pipeline operations are captured through log level and retry count fields. Log levels classify the outcome of a transformation with values such as info, warning, or critical—indicating that a feature engineering routine (ENDS-0002) reached a critical state, while a schema migration script (ENDS-0004) completed with a warning. Retry counts quantify the operational effort expended before reaching a terminal state, with values ranging from 210 retries for an ETL pipeline run to 446 for a schema migration, reflecting the varying degrees of instability encountered across different workload types. These metrics are essential for capacity planning, SLA compliance, and post-incident analysis.

When entities relate to one another—such as an outlier claim being supported by evidence or a frame refinement referencing a parent frame—the relationship is expressed through a subject-target pair. The subject column identifies the originating entity in the relationship (for example, outlier_id LIFT-0002 or frame_id REFI-0003), while the target column identifies the entity being referenced (such as supported_by_id LIFT-0007 or refines_frame_id REFI-0006). This directional pairing enables the construction of graph-like structures over relational data, allowing systems to trace provenance chains, validate baseline variance reports, and navigate from a packet_loss_surge outlier to its supporting evidence.

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

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

The role field annotates each subject-target relationship with a semantic label that describes the nature of the connection. In outlier evidence chains, a role of observer indicates that an entity witnessed or recorded an event without actively shaping it, whereas a reviewer role signifies that the entity evaluated or validated the claim. A contributor role denotes active participation in producing the evidence, and an owner role establishes responsibility or custodianship. These same role values appear across different relationship types—observer, reviewer, contributor, and owner all appear in both outlier-to-evidence mappings and frame-to-frame refinement links—demonstrating a unified vocabulary for describing entity relationships regardless of domain.

Cardinality notes provide additional metadata about the constraints and multiplicity of a relationship, documenting whether a subject can relate to one or many targets and vice versa. Values such as Cardinality Note 01 through Cardinality Note 04 accompany attribute set assignments, indicating that an outlier like LIFT-0002 may be associated with specific measurement attributes such as frequency_range_limit or error_rate_percent under defined multiplicity rules. These notes are critical for data integrity enforcement, query optimization, and schema evolution, as they communicate the expected structure of relationships to both human operators and automated validation systems.

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