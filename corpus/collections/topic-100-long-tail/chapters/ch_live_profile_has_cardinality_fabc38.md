---
chapter_id: ch_live_profile_has_cardinality_fabc38
topic_id: 100
family: 02_observation_measurement
cited_terms: ['profile_has_cardinality', 'schemaorg_place_address', 'outlier_claim_supported_by_lift']
model: engine-refine
---

CARDINALITY, CONFIDENCE, AND UNCERTAINTY METRICS

The fact_profile table anchors a measurement framework in which each record carries an identifier (CARD-0001 through CARD-0004), a cardinality_key that references a dimension in dim_cardinality, and three quantitative attributes: confidence, uncertainty, and value. Confidence scores span a wide range—0.226 for CARD-0004 up to 0.994 for CARD-0002—indicating that not all cardinality assessments carry equal evidentiary weight. Uncertainty values, measured in the hundreds (284.36 for CARD-0001, 622.09 for CARD-0003), quantify the dispersion or margin of error surrounding each cardinality estimate. The value column, classified as miscellaneous data, holds the point estimates themselves (728.94, 380.57, 607.36, 448.09), which are the operational figures derived from the cardinality assessment. Together, these fields form a structured record of how certain a cardinality judgment is, how much it might vary, and what the best estimate is.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

DIMENSIONAL CATEGORIZATION AND LABELING

The dim_cardinality dimension table provides the categorical scaffolding for cardinality records. Each cardinality identifier (CARD-0001 through CARD-0004) is associated with a cardinality_label (Cardinality Label 01 through Cardinality Label 04) and a cardinality_category (Cardinality Category 01 through Cardinality Category 04). The category field serves as a classification bucket, enabling aggregation and filtering of cardinality records by type. The label provides a human-readable descriptor. The cardinality_key in fact_profile acts as a foreign key into this dimension, linking each measurement record to its categorical context. This separation of measurement from classification follows a star-schema pattern, allowing cardinality values to be analyzed independently of their categorical grouping.

SUBJECT-TARGET RELATIONSHIPS AND ROLE ASSIGNMENT

Junction tables implement many-to-many relationships between entities, using subject and target columns to denote the direction of the relationship. In t_schemaorg_place_address__postal_address, the schemaorg_id column (subject) references t_schemaorg_place_address, while the postal_address_id column (target) references t_schemaorg_place_address_postal_address. A single schemaorg entity such as ADDR-0001 (CERN Main Campus) can relate to multiple postal addresses (ADDR-0003, ADDR-0006), and a single postal address can be associated with multiple schemaorg entities. The role column assigns a functional designation to each relationship instance—contributor appears in three of four rows, while reviewer appears once—indicating the capacity in which the subject entity engages with the target. Similar subject-target-role patterns appear in t_outlier_claim_supported_by_lift__supported_by, where outlier_id (subject) links to supported_by_id (target) with roles of observer and contributor and reviewer, and in t_outlier_claim_supported_by_lift__attribute_set, where outlier_id (subject) links to attribute_set_id (target) with roles of owner and reviewer.

**t_schemaorg_place_address**

| id | schemaorg |
| --- | --- |
| ADDR-0001 | CERN Main Campus |
| ADDR-0002 | Smithsonian Institution |
| ADDR-0003 | Royal Society |
| ADDR-0004 | UN Secretariat |
| ADDR-0005 | Royal Society |
| ADDR-0006 | RAND Corporation |
| ADDR-0007 | CERN Main Campus |

**t_schemaorg_place_address_postal_address**

| id | postal_address |
| --- | --- |
| ADDR-0001 | 700 1st Ave |
| ADDR-0002 | 350 Fifth Ave |
| ADDR-0003 | 2875 Broadway |
| ADDR-0004 | 1000 Independence Ave |
| ADDR-0005 | 1 Infinite Loop |
| ADDR-0006 | 1000 Independence Ave |

**t_schemaorg_place_address__postal_address**

| id | schemaorg_id | postal_address_id | role |
| --- | --- | --- | --- |
| ADDR-0001 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0002 | ADDR-0004 | ADDR-0001 | contributor |
| ADDR-0003 | ADDR-0001 | ADDR-0006 | reviewer |
| ADDR-0004 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0005 | ADDR-0002 | ADDR-0005 | observer |
| ADDR-0006 | ADDR-0004 | ADDR-0005 | contributor |
| ADDR-0007 | ADDR-0004 | ADDR-0003 | owner |
| ADDR-0008 | ADDR-0003 | ADDR-0001 | observer |

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

CARDINALITY NOTES AND ATTRIBUTE ASSOCIATIONS

The cardinality_note field appears in the junction table t_outlier_claim_supported_by_lift__attribute_set, where it annotates the relationship between outlier claims and their associated attribute sets. Each cardinality note (Cardinality Note 01 through Cardinality Note 04) provides additional metadata about the cardinality constraints or characteristics of a particular subject-target pairing. The attribute sets themselves—frequency_range_limit, error_rate_percent, confidence_level_95, deviation_sigma_count—represent measurable properties that qualify or constrain the outlier claims. The cardinality_note thus serves as a bridge between the structural relationship (which attributes belong to which outlier) and the quantitative properties (how many, with what constraints) of that association. This pattern of annotating relationships with cardinality metadata enables fine-grained control over how entities can be associated, supporting data integrity constraints at the application level.