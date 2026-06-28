---
chapter_id: ch_live_aggregation_aggregates_measurement_53309f
topic_id: 39
family: 02_observation_measurement
cited_terms: ['aggregation_aggregates_measurement', 'national_dataset_augmentation_process', 'indoor_air_quality_action_plan']
model: engine-refine
---

Environmental monitoring infrastructures rely on a layered architecture for aggregating, classifying, and certifying measurement data before it informs public health policy. At the foundation, aggregate records carry a unique identifier, a parent aggregation key that links them to related measurements, and a confidence score that quantifies the reliability of the underlying computation. A measurement labeled MEAS-0001, for instance, carries a confidence of 0.857 and an uncertainty of 811.48 against a value of 835.01, whereas MEAS-0004 registers a confidence of just 0.024 with an uncertainty of 527.80 on a value of 996.14—illustrating how the system explicitly distinguishes robust estimates from those warranting caution. These aggregates are organized through a category dimension that assigns each measurement a label and a categorical classification, such as "Aggregates Label 01" under "Aggregates Category 01," with cross-references to a separate category table that stores the canonical category name. The category_id column in the aggregate dimension points to entries like MEAS-0002 or MEAS-0003, enabling hierarchical grouping and roll-up operations across measurement sets.

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |

National datasets are enriched through augmentation processes that integrate external observation sources into existing geospatial and statistical baselines. A process identified as PROC-0001, for example, applies the DGIWGBase methodology to incorporate CopernicusLand observations and augment the SentinelCoreLoad dataset. Other augmentation workflows follow similar patterns: NRCANMap pulls from CMEMSDataCube to enhance GADMAdminLevels, while TerrainDataMerge combines GLO30Coverage with CensusMapAlign. The EuroStatSync process, designated PROC-0004, ingests CopernicusCrisis data to update the LandCoverSync baseline. This modular design ensures that national datasets remain current by systematically ingesting satellite-derived and statistical observations from authoritative sources, with each augmentation step traceable to its input source and target dataset.

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |

Indoor air quality action plans represent the policy layer where aggregated environmental data translates into enforceable interventions. Each plan targets a specific pollutant and is verified against a health outcome metric that measures its effectiveness. The HVAC Filter Upgrade Protocol, appearing under both PLAN-0001 and PLAN-0002, targets Carbon Monoxide and Asbestos Fibers respectively, with its impact assessed through Respiratory Infection Incidence and Asthma Symptom Frequency metrics. Similarly, the Dust Suppression Procedure (PLAN-0003) addresses Particulate Matter 2.5, while the Air Purifier Deployment Plan (PLAN-0004) focuses on Nitrogen Dioxide, both also tracked against Asthma Symptom Frequency. This structure ensures that every intervention is tied to a measurable health outcome, creating accountability loops between environmental controls and population health indicators.

**t_indoor_air_quality_action_plan**

| id | indoor_air_quality_action_plan | targets_pollution | verified_by_metric |
| --- | --- | --- | --- |
| PLAN-0001 | HVAC Filter Upgrade Protocol | Carbon Monoxide | Respiratory Infection Incidence |
| PLAN-0002 | HVAC Filter Upgrade Protocol | Asbestos Fibers | Asthma Symptom Frequency |
| PLAN-0003 | Dust Suppression Procedure | Particulate Matter 2.5 | Respiratory Infection Incidence |
| PLAN-0004 | Air Purifier Deployment Plan | Nitrogen Dioxide | Asthma Symptom Frequency |
| PLAN-0005 | HVAC Filter Upgrade Protocol | Particulate Matter 2.5 | FEV1 Improvement Rate |
| PLAN-0006 | Mold Remediation Directive | Formaldehyde | Pulmonary Function Test Delta |
| PLAN-0007 | CO2 Ventilation Schedule | Radon Gas | Sleep Quality Score |

**t_indoor_air_quality_action_plan_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PLAN-0001 | effective_date | xsd:date |
| PLAN-0002 | enforcement | xsd:string |
| PLAN-0003 | mandatory | xsd:boolean |
| PLAN-0004 | priority | xsd:integer |
| PLAN-0005 | review_cycle_days | xsd:integer |
| PLAN-0006 | scope | xsd:string |
| PLAN-0007 | encoding | xsd:string |
| PLAN-0008 | label_text | xsd:string |

**t_indoor_air_quality_action_plan_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0004 | 5 |
| PLAN-0002 | PLAN-0001 | PLAN-0005 | 345 |
| PLAN-0003 | PLAN-0002 | PLAN-0004 | 4 |
| PLAN-0004 | PLAN-0002 | PLAN-0005 | 346 |
| PLAN-0005 | PLAN-0003 | PLAN-0004 | 3 |
| PLAN-0006 | PLAN-0003 | PLAN-0005 | 243 |
| PLAN-0007 | PLAN-0004 | PLAN-0004 | 1 |
| PLAN-0008 | PLAN-0004 | PLAN-0005 | 453 |

**t_indoor_air_quality_action_plan_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0007 | Encoding 01 |
| PLAN-0002 | PLAN-0001 | PLAN-0002 | Enforcement 02 |
| PLAN-0003 | PLAN-0001 | PLAN-0008 | audit excerpt |
| PLAN-0004 | PLAN-0001 | PLAN-0009 | en |
| PLAN-0005 | PLAN-0001 | PLAN-0006 | Scope 05 |
| PLAN-0006 | PLAN-0002 | PLAN-0007 | Encoding 06 |
| PLAN-0007 | PLAN-0002 | PLAN-0002 | Enforcement 07 |
| PLAN-0008 | PLAN-0002 | PLAN-0008 | audit excerpt |

The attribute-value model for action plans provides a flexible schema for capturing plan-specific metadata without requiring rigid table structures. Attribute definitions—such as effective_date, enforcement, mandatory, and priority—are registered in a central attribute catalog with their corresponding data types: xsd:date, xsd:string, xsd:boolean, and xsd:integer. Actual values are stored in type-specific tables that reference both the plan entity and the attribute definition. For the mandatory attribute, PLAN-0003 evaluates to true while PLAN-0001, PLAN-0002, and PLAN-0004 all evaluate to false. Effective dates span from 2024-08-22 through 2025-02-08, reflecting staggered implementation schedules. Priority values range from 4 to 346, and string attributes capture enforcement descriptors such as "Encoding 01" and "Enforcement 02." This entity-attribute-value pattern, partitioned by data type, allows the system to accommodate diverse plan requirements while maintaining type safety and query efficiency.

**t_indoor_air_quality_action_plan_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0003 | false |
| PLAN-0002 | PLAN-0002 | PLAN-0003 | false |
| PLAN-0003 | PLAN-0003 | PLAN-0003 | true |
| PLAN-0004 | PLAN-0004 | PLAN-0003 | false |
| PLAN-0005 | PLAN-0005 | PLAN-0003 | true |
| PLAN-0006 | PLAN-0006 | PLAN-0003 | false |
| PLAN-0007 | PLAN-0007 | PLAN-0003 | true |

**t_indoor_air_quality_action_plan_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0001 | 2024-08-22 |
| PLAN-0002 | PLAN-0002 | PLAN-0001 | 2025-02-08 |
| PLAN-0003 | PLAN-0003 | PLAN-0001 | 2024-12-25 |
| PLAN-0004 | PLAN-0004 | PLAN-0001 | 2025-01-11 |
| PLAN-0005 | PLAN-0005 | PLAN-0001 | 2023-11-11 |
| PLAN-0006 | PLAN-0006 | PLAN-0001 | 2024-01-21 |
| PLAN-0007 | PLAN-0007 | PLAN-0001 | 2024-08-19 |