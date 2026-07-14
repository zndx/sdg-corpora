## Indoor Air Quality Management: Monitoring, Sources, and Policy

Indoor air quality (IAQ) management is a multidisciplinary practice that spans environmental science, public health, building engineering, and regulatory governance. The domain revolves around a simple but critical question: what airborne contaminants occupy the spaces where people live, work, and receive care, and what measures exist to control them? Practitioners track pollutant concentrations across diverse indoor environments, attribute those pollutants to identifiable sources, assess which population groups bear the greatest risk, and deploy policy instruments administered by government departments to enforce standards. The records in this system capture every layer of that workflow — from raw sensor readings to the institutional frameworks that govern mitigation.

**Table `indoor_air_quality_measurements`**

| id | measurement_id | timestamp | pollutant_concentration | unit_of_measure | measurement_method | sensor_calibration_date | indoor_environment_id | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | composite-unit-69 | baseline-measurem-25 | 2024-11-22 | 1 | 100 |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | primary-unit-70 | pilot-measurem-26 | 2025-04-06 | 2 | 101 |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | adaptive-unit-71 | extended-measurem-27 | 2022-09-17 | 3 | 102 |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | distributed-unit-72 | integrated-measurem-28 | 2023-02-01 | 4 | 103 |

The foundation of any IAQ program is the measurement record. Each entry in the `indoor_air_quality_measurements` table captures a single observation of pollutant concentration within a defined indoor environment and against a specific pollutant. The `measurement_id` serves as the unique external identifier for the observation, while the `timestamp` anchors it to a precise moment — for example, measurement 2618580 was recorded on 2024-07-08 at 18:18 UTC. The `pollutant_concentration` field holds the numeric reading, such as 18.95 for the first record or 27.80 for the fourth, and the `unit_of_measure` describes the scale, ranging from `composite-unit-69` to `distributed-unit-72`. The `measurement_method` documents how the reading was obtained — baseline, pilot, extended, or integrated — and `sensor_calibration_date` records when the instrument was last calibrated, ensuring traceability. Each measurement is linked to its `indoor_environment_id` and `indoor_pollutant_id`, forming the bridge between raw data and the physical spaces and contaminants being studied.

**Table `indoor_environments`**

| indoor_environment_id | environment_id | environment_type | building_age | ventilation_rate | occupancy_level | last_inspection_date | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|
| 1 | 726050 | home | 23 | 10.45 | 28 | 2025-04-12 | 100 |
| 2 | 1996940 | school | 31 | 13.90 | 36 | 2022-09-23 | 101 |
| 3 | 2986218 | healthcare_facility | 39 | 17.35 | 44 | 2023-02-07 | 102 |
| 4 | 8350020 | office | 47 | 20.80 | 52 | 2024-07-18 | 103 |

Indoor environments are the physical contexts in which measurements take place. The `indoor_environments` table catalogs each space with an `indoor_environment_id`, an external `environment_id`, and a descriptive `environment_type` that distinguishes between homes, schools, healthcare facilities, and offices. The first environment, a home with external ID 726050, is 23 years old and maintains a ventilation rate of 10.45 with an occupancy level of 28. The second, a school (external ID 1996940), is 31 years old with a higher ventilation rate of 13.90 and occupancy of 36. The third environment is a healthcare facility (external ID 2986218), 39 years old, with a ventilation rate of 17.35 and occupancy of 44. The fourth is an office (external ID 8350020), the oldest at 47 years, with the highest ventilation rate of 20.80 and occupancy of 52. The `last_inspection_date` records the most recent regulatory or operational inspection, and `indoor_pollutant_id` links the environment to the primary pollutant of concern within it.

**Table `indoor_pollutants`**

| id | pollutant_id | pollutant_name | source_type | toxicity_level | regulatory_limit | health_impact_category | source_id | vulnerable_population_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | low | 7.95 | respiratory | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 1 | 2025-01-01 00:14:00 |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | moderate | 9.90 | cognitive | 7021001070050 | 2 | 2025-02-06 03:14:00 |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | high | 11.85 | developmental | achat | 3 | 2025-03-11 06:14:00 |
| 103 | 3717632 | Baseline Corridor D | damp_mould | critical | 13.80 | cardiovascular | template_impcode_pagata_10det50 | 4 | 2025-04-16 09:14:00 |

At the center of the domain are the indoor pollutants themselves. The `indoor_pollutants` table defines each contaminant with an `id`, an external `pollutant_id`, a `pollutant_name`, and a `source_type` that categorizes its origin — whether building materials, fossil fuel appliances, cleaning products, or damp mould. The first pollutant, Integrated Series A (external ID 2087746), originates from building materials, carries a low toxicity level, and has a regulatory limit of 7.95. Its health impact is classified as respiratory. The second, Extended Assessment (external ID 129), stems from fossil fuel appliances with moderate toxicity and a limit of 9.90, affecting cognitive function. The third, Pilot Survey (external ID 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3), derives from cleaning products, carries high toxicity with a limit of 11.85, and impacts developmental health. The fourth, Baseline Corridor D (external ID 3717632), is associated with damp mould, has critical toxicity, a limit of 13.80, and affects cardiovascular health. Each pollutant record also stores a `source_id` and `vulnerable_population_id`, linking it to its origin and the groups most at risk.

**Table `pollutant_sources`**

| source_id | source_name | source_category | emission_rate | installation_date | maintenance_status | indoor_environment_id | indoor_pollutant_id |
|---|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 2022-01-10 | operational | 1 | 100 |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 2023-06-21 | needs_repair | 2 | 101 |
| achat | Legacy Review | building_material | 21.10 | 2024-11-05 | decommissioned | 3 | 102 |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 2025-04-16 | operational | 4 | 103 |

Every pollutant traces back to a physical or chemical source, documented in the `pollutant_sources` table. The first source, Composite Model (external ID 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0), is categorized as a cooking appliance with an emission rate of 11.70, installed on 2022-01-10, and currently operational. The second, Compact Cluster A (external ID 7021001070050), is a heating appliance with a higher emission rate of 16.40, installed on 2023-06-21, and flagged as needing repair. The third, Legacy Review (external ID achat), is a building material with an emission rate of 21.10, installed on 2024-11-05, and already decommissioned. The fourth, Regional Initiative (external ID template_impcode_pagata_10det50), is a cleaning product with the highest emission rate of 25.80, installed on 2025-04-16, and operational. Each source is tied to a specific indoor environment and indoor pollutant, completing the chain from origin to exposure.

**Table `vulnerable_populations`**

| id | population_group_id | group_type | prevalence_rate | risk_factor | health_outcome | indoor_pollutant_id | indoor_environment_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | greater_exposure | asthma | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | worse_underlying_health | cognitive_impairment | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | 10449506 | pregnant_women | 29.35 | least_empowerment | developmental_defects | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 3744013 | lower_socioeconomic | 32.80 | greater_exposure | premature_death | 103 | 4 | 2025-04-16 09:14:00 |

Public health analysis requires understanding which groups face disproportionate risk. The `vulnerable_populations` table identifies population groups by `id`, an external `population_group_id`, and a `group_type` such as children, older people, pregnant women, or those from lower socioeconomic backgrounds. The first group, children (external ID 9085255), has a prevalence rate of 22.45 percent and faces greater exposure, with asthma as the primary health outcome. The second, older people (external ID 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0), has a prevalence of 25.90 percent and worse underlying health, leading to cognitive impairment. The third, pregnant women (external ID 10449506), has a prevalence of 29.35 percent and the least empowerment, with developmental defects as the outcome. The fourth, lower socioeconomic groups (external ID 3744013), has the highest prevalence at 32.80 percent and greater exposure, with premature death as the outcome. Each record links to a specific indoor pollutant and indoor environment, grounding the risk assessment in measurable conditions.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | instrument_type | issuing_authority | effective_date | enforcement_level | indoor_pollutant_id | indoor_environment_id | department_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | extended-issuing-33 | 2023-02-14 | mandatory | 100 | 1 | 2087755 |
| 2 | account_pymes_691 | Adaptive Model D | guidance | integrated-issuing-34 | 2024-07-25 | voluntary | 101 | 2 | 790483 |
| 3 | 726063 | Primary Cluster | licensing_scheme | seasonal-issuing-35 | 2025-12-09 | penalty_based | 102 | 3 | 505978 |
| 4 | 23256422 | Composite Review | action_plan | regional-issuing-36 | 2022-05-20 | mandatory | 103 | 4 | id_6 |

The regulatory framework is captured in the `policy_instruments` table, which records each policy tool by `id`, an external `instrument_id`, and an `instrument_name`. The first instrument, Distributed Initiative (external ID 6926365), is a regulation issued by extended-issuing-33, effective from 2023-02-14, with mandatory enforcement. The second, Adaptive Model D (external ID account_pymes_691), is guidance issued by integrated-issuing-34, effective from 2024-07-25, with voluntary enforcement. The third, Primary Cluster (external ID 726063), is a licensing scheme issued by seasonal-issuing-35, effective from 2025-12-09, with penalty-based enforcement. The fourth, Composite Review (external ID 23256422), is an action plan issued by regional-issuing-36, effective from 2022-05-20, with mandatory enforcement. Each instrument targets a specific indoor pollutant and indoor environment and is administered by a government department identified by `department_id`.

**Table `government_departments`**

| department_id | department_name | department_code | responsibility_area | ministerial_lead | established_date | policy_instrument_id | coordinates_with_department_id |
|---|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | legacy-minister-37 | 2024-03-27 | 1 | 2087755 |
| 790483 | Distributed Protocol | 10449510 | health | compact-minister-38 | 2025-08-11 | 2 | 790483 |
| 505978 | Adaptive Programme | 2002007020080 | housing | composite-minister-39 | 2022-01-22 | 3 | 505978 |
| id_6 | Primary Standard A | drafting-skills | education | primary-minister-40 | 2023-06-06 | 4 | id_6 |

Government departments are the institutional actors responsible for policy implementation. The `government_departments` table stores each department's `id`, an external `department_id`, a `department_name`, and a `jurisdiction_type` that defines its scope — whether national, regional, or local. The first department, with external ID 2087755, operates at the national level. The second, with external ID 790483, operates regionally. The third, with external ID 505978, operates locally. The fourth, with external ID id_6, operates at the national level. Departments may also have parent-child relationships, enabling a hierarchical view of governance structures.

### Measurement-to-Environment and Measurement-to-Pollutant Views

The joined view `indoor_air_quality_measurement_indoor_environment_view` answers the question: what pollutant concentration was recorded in which specific indoor environment, and under what conditions? Reading the first row, measurement 2618580 recorded a concentration of 18.95 in the home environment (external ID 726050), which is 23 years old with a ventilation rate of 10.45. The fourth row shows measurement 392481 recorded 27.80 in the office (external ID 8350020), the oldest and most ventilated space at 47 years with a rate of 20.80. This join enables practitioners to correlate environmental characteristics — age, ventilation, occupancy — with measured concentrations.

The `indoor_air_quality_measurement_indoor_pollutant_view` links each measurement to the pollutant it quantified. The first row pairs measurement 2618580 with Integrated Series A (external ID 2087746), a low-toxicity respiratory pollutant from building materials with a regulatory limit of 7.95. The fourth row pairs measurement 392481 with Baseline Corridor D (external ID 3717632), a critical-toxicity cardiovascular pollutant from damp mould with a limit of 13.80. This view is essential for determining whether concentrations exceed regulatory thresholds.

### Environment-Pollutant and Source-Pollutant Relationships

The `indoor_environment_indoor_pollutant_view` reveals which pollutant is the primary concern within each environment. The first row associates the home (external ID 726050) with Integrated Series A, while the third row links the healthcare facility (external ID 2986218) with Pilot Survey, a high-toxicity developmental pollutant from cleaning products. This mapping guides targeted monitoring and remediation efforts.

The `indoor_pollutant_pollutant_source_view` traces each pollutant back to its source. The first row connects Integrated Series A to the Composite Model cooking appliance (external ID 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0), which has an emission rate of 11.70 and is operational. The third row connects Pilot Survey to the Legacy Review building material (external ID achat), which has an emission rate of 21.10 and is decommissioned. Understanding source characteristics is critical for designing effective mitigation strategies.

The `pollutant_source_indoor_pollutant_view` provides the inverse perspective: for each source, which pollutant does it produce? The second row shows Compact Cluster A (external ID 7021001070050), a heating appliance needing repair with an emission rate of 16.40, produces Extended Assessment, a moderate-toxicity cognitive pollutant. This view supports source prioritization based on emission intensity and operational status.

The `pollutant_source_indoor_environment_view` maps sources directly to the environments they inhabit. The first row places the Composite Model cooking appliance within the home (external ID 726050), while the fourth row places the Regional Initiative cleaning product within the office (external ID 8350020). This spatial mapping is vital for targeted interventions.

### Vulnerable Population and Pollutant Intersections

The `indoor_pollutant_vulnerable_population_view` identifies which pollutant poses the greatest risk to which group. The first row links Integrated Series A to children (external ID 9085255), who face a 22.45 percent prevalence rate and the health outcome of asthma. The fourth row links Baseline Corridor D to lower socioeconomic groups (external ID 3744013), who face a 32.80 percent prevalence rate and the outcome of premature death. This view is central to equity-focused public health planning.

The `vulnerable_population_indoor_pollutant_view` presents the same relationship from the population side. The second row shows older people (external ID 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0) are exposed to Extended Assessment, a moderate-toxicity pollutant with a cognitive health impact. The third row shows pregnant women (external ID 10449506) are exposed to Pilot Survey, a high-toxicity pollutant with developmental consequences.

The `vulnerable_population_indoor_environment_view` connects population groups to the environments where they are most at risk. The first row places children in the home (external ID 726050), while the third row places pregnant women in the healthcare facility (external ID 2986218). This view supports environmental policy that protects the most vulnerable in their daily settings.

### Policy Instruments and Their Targets

The `policy_instrument_indoor_pollutant_view` reveals which pollutants are regulated by which instruments. The first row shows Distributed Initiative (external ID 6926365), a mandatory regulation, targets Integrated Series A. The third row shows Primary Cluster (external ID 726063), a penalty-based licensing scheme, targets Pilot Survey. This view clarifies the regulatory landscape for each contaminant.

The `policy_instrument_indoor_environment_view` maps instruments to the environments they govern. The second row shows Adaptive Model D (external ID account_pymes_691), a voluntary guidance document, applies to the school (external ID 1996940). The fourth row shows Composite Review (external ID 23256422), a mandatory action plan, applies to the office (external ID 8350020). This enables practitioners to identify which rules apply to specific spaces.

The `policy_instrument_government_department_view` identifies which department administers each instrument. The first row links Distributed Initiative to department 2087755, while the third row links Primary Cluster to department 505978. This view is essential for accountability and inter-agency coordination.

The `government_department_policy_instrument_view` presents the inverse: for each department, which instruments does it oversee? The first row shows department 2087755 administers Distributed Initiative, a mandatory regulation. The second row shows department 790483 administers Adaptive Model D, a voluntary guidance document. This view supports organizational oversight and resource allocation.

The `government_department_government_department_view` captures the hierarchical relationships between departments. It reveals which departments operate under which parent organizations, enabling a complete picture of the governance structure. This is particularly important for understanding jurisdictional boundaries and inter-departmental collaboration.

### Synthesis

The indoor air quality domain is a tightly coupled system of measurement, environment, pollutant, source, population, and policy records. Each measurement anchors a concentration to a specific time, space, and contaminant. Each environment provides the physical context — age, ventilation, occupancy — that shapes exposure. Each pollutant carries toxicity and regulatory information that determines acceptable levels. Each source quantifies the emission intensity and operational status that drives pollutant presence. Each vulnerable population identifies the groups most at risk and the health outcomes they face. Each policy instrument and government department establishes the regulatory framework that governs mitigation. Together, these records form a comprehensive picture of indoor air quality management, enabling practitioners to monitor conditions, attribute risks, and enforce standards with precision.

## Data appendix

**View `indoor_air_quality_measurement_indoor_environment_view`**

```sql
CREATE VIEW indoor_air_quality_measurement_indoor_environment_view AS
SELECT a.id, a.measurement_id, a.timestamp, a.pollutant_concentration, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM indoor_air_quality_measurements a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | measurement_id | timestamp | pollutant_concentration | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | 1 | 726050 | home |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | 2 | 1996940 | school |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | 3 | 2986218 | healthcare_facility |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | 4 | 8350020 | office |

**View `indoor_air_quality_measurement_indoor_pollutant_view`**

```sql
CREATE VIEW indoor_air_quality_measurement_indoor_pollutant_view AS
SELECT a.id, a.measurement_id, a.timestamp, a.pollutant_concentration, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM indoor_air_quality_measurements a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | measurement_id | timestamp | pollutant_concentration | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 2618580 | 2024-07-08T18:18:00 | 18.95 | 100 | 2087746 | Integrated Series A |
| 2 | 1450664 | 2025-12-19T01:35:00 | 21.90 | 101 | 129 | Extended Assessment |
| 3 | 8843762 | 2022-05-03T08:52:00 | 24.85 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 392481 | 2023-10-14T15:09:00 | 27.80 | 103 | 3717632 | Baseline Corridor D |

**View `indoor_environment_indoor_pollutant_view`**

```sql
CREATE VIEW indoor_environment_indoor_pollutant_view AS
SELECT a.indoor_environment_id, a.environment_id, a.environment_type, a.building_age, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM indoor_environments a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| indoor_environment_id | environment_id | environment_type | building_age | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 726050 | home | 23 | 100 | 2087746 | Integrated Series A |
| 2 | 1996940 | school | 31 | 101 | 129 | Extended Assessment |
| 3 | 2986218 | healthcare_facility | 39 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 8350020 | office | 47 | 103 | 3717632 | Baseline Corridor D |

**View `indoor_pollutant_pollutant_source_view`**

```sql
CREATE VIEW indoor_pollutant_pollutant_source_view AS
SELECT a.id, a.pollutant_id, a.pollutant_name, a.source_type, b.source_id AS source_source_id, b.source_name AS source_source_name, b.source_category AS source_source_category
FROM indoor_pollutants a JOIN pollutant_sources b ON a.source_id = b.source_id;
```

| id | pollutant_id | pollutant_name | source_type | source_source_id | source_source_name | source_source_category |
|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | 7021001070050 | Compact Cluster A | heating_appliance |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | achat | Legacy Review | building_material |
| 103 | 3717632 | Baseline Corridor D | damp_mould | template_impcode_pagata_10det50 | Regional Initiative | cleaning_product |

**View `indoor_pollutant_vulnerable_population_view`**

```sql
CREATE VIEW indoor_pollutant_vulnerable_population_view AS
SELECT a.id, a.pollutant_id, a.pollutant_name, a.source_type, b.id AS population_id, b.population_group_id AS population_population_group_id, b.group_type AS population_group_type
FROM indoor_pollutants a JOIN vulnerable_populations b ON a.vulnerable_population_id = b.id;
```

| id | pollutant_id | pollutant_name | source_type | population_id | population_population_group_id | population_group_type |
|---|---|---|---|---|---|---|
| 100 | 2087746 | Integrated Series A | building_materials | 1 | 9085255 | children |
| 101 | 129 | Extended Assessment | fossil_fuel_appliances | 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people |
| 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cleaning_products | 3 | 10449506 | pregnant_women |
| 103 | 3717632 | Baseline Corridor D | damp_mould | 4 | 3744013 | lower_socioeconomic |

**View `pollutant_source_indoor_environment_view`**

```sql
CREATE VIEW pollutant_source_indoor_environment_view AS
SELECT a.source_id, a.source_name, a.source_category, a.emission_rate, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM pollutant_sources a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| source_id | source_name | source_category | emission_rate | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 1 | 726050 | home |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 2 | 1996940 | school |
| achat | Legacy Review | building_material | 21.10 | 3 | 2986218 | healthcare_facility |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 4 | 8350020 | office |

**View `pollutant_source_indoor_pollutant_view`**

```sql
CREATE VIEW pollutant_source_indoor_pollutant_view AS
SELECT a.source_id, a.source_name, a.source_category, a.emission_rate, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM pollutant_sources a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| source_id | source_name | source_category | emission_rate | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | Composite Model | cooking_appliance | 11.70 | 100 | 2087746 | Integrated Series A |
| 7021001070050 | Compact Cluster A | heating_appliance | 16.40 | 101 | 129 | Extended Assessment |
| achat | Legacy Review | building_material | 21.10 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| template_impcode_pagata_10det50 | Regional Initiative | cleaning_product | 25.80 | 103 | 3717632 | Baseline Corridor D |

**View `vulnerable_population_indoor_pollutant_view`**

```sql
CREATE VIEW vulnerable_population_indoor_pollutant_view AS
SELECT a.id, a.population_group_id, a.group_type, a.prevalence_rate, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM vulnerable_populations a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | population_group_id | group_type | prevalence_rate | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | 100 | 2087746 | Integrated Series A |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | 101 | 129 | Extended Assessment |
| 3 | 10449506 | pregnant_women | 29.35 | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 3744013 | lower_socioeconomic | 32.80 | 103 | 3717632 | Baseline Corridor D |

**View `vulnerable_population_indoor_environment_view`**

```sql
CREATE VIEW vulnerable_population_indoor_environment_view AS
SELECT a.id, a.population_group_id, a.group_type, a.prevalence_rate, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM vulnerable_populations a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | population_group_id | group_type | prevalence_rate | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 9085255 | children | 22.45 | 1 | 726050 | home |
| 2 | 9bb4ab06-8fcc-11eb-924d-9cd76263cbd0 | older_people | 25.90 | 2 | 1996940 | school |
| 3 | 10449506 | pregnant_women | 29.35 | 3 | 2986218 | healthcare_facility |
| 4 | 3744013 | lower_socioeconomic | 32.80 | 4 | 8350020 | office |

**View `policy_instrument_indoor_pollutant_view`**

```sql
CREATE VIEW policy_instrument_indoor_pollutant_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.id AS pollutant_id, b.pollutant_id AS pollutant_pollutant_id, b.pollutant_name AS pollutant_pollutant_name
FROM policy_instruments a JOIN indoor_pollutants b ON a.indoor_pollutant_id = b.id;
```

| id | instrument_id | instrument_name | instrument_type | pollutant_id | pollutant_pollutant_id | pollutant_pollutant_name |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 100 | 2087746 | Integrated Series A |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 101 | 129 | Extended Assessment |
| 3 | 726063 | Primary Cluster | licensing_scheme | 102 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |
| 4 | 23256422 | Composite Review | action_plan | 103 | 3717632 | Baseline Corridor D |

**View `policy_instrument_indoor_environment_view`**

```sql
CREATE VIEW policy_instrument_indoor_environment_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.indoor_environment_id AS environment_indoor_environment_id, b.environment_id AS environment_environment_id, b.environment_type AS environment_environment_type
FROM policy_instruments a JOIN indoor_environments b ON a.indoor_environment_id = b.indoor_environment_id;
```

| id | instrument_id | instrument_name | instrument_type | environment_indoor_environment_id | environment_environment_id | environment_environment_type |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 1 | 726050 | home |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 2 | 1996940 | school |
| 3 | 726063 | Primary Cluster | licensing_scheme | 3 | 2986218 | healthcare_facility |
| 4 | 23256422 | Composite Review | action_plan | 4 | 8350020 | office |

**View `policy_instrument_government_department_view`**

```sql
CREATE VIEW policy_instrument_government_department_view AS
SELECT a.id, a.instrument_id, a.instrument_name, a.instrument_type, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM policy_instruments a JOIN government_departments b ON a.department_id = b.department_id;
```

| id | instrument_id | instrument_name | instrument_type | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | regulation | 2087755 | Baseline Framework D | 605962 |
| 2 | account_pymes_691 | Adaptive Model D | guidance | 790483 | Distributed Protocol | 10449510 |
| 3 | 726063 | Primary Cluster | licensing_scheme | 505978 | Adaptive Programme | 2002007020080 |
| 4 | 23256422 | Composite Review | action_plan | id_6 | Primary Standard A | drafting-skills |

**View `government_department_policy_instrument_view`**

```sql
CREATE VIEW government_department_policy_instrument_view AS
SELECT a.department_id, a.department_name, a.department_code, a.responsibility_area, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.instrument_name AS instrument_instrument_name
FROM government_departments a JOIN policy_instruments b ON a.policy_instrument_id = b.id;
```

| department_id | department_name | department_code | responsibility_area | instrument_id | instrument_instrument_id | instrument_instrument_name |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | 1 | 6926365 | Distributed Initiative |
| 790483 | Distributed Protocol | 10449510 | health | 2 | account_pymes_691 | Adaptive Model D |
| 505978 | Adaptive Programme | 2002007020080 | housing | 3 | 726063 | Primary Cluster |
| id_6 | Primary Standard A | drafting-skills | education | 4 | 23256422 | Composite Review |

**View `government_department_government_department_view`**

```sql
CREATE VIEW government_department_government_department_view AS
SELECT a.department_id, a.department_name, a.department_code, a.responsibility_area, b.department_id AS department_department_id, b.department_name AS department_department_name, b.department_code AS department_department_code
FROM government_departments a JOIN government_departments b ON a.coordinates_with_department_id = b.department_id;
```

| department_id | department_name | department_code | responsibility_area | department_department_id | department_department_name | department_department_code |
|---|---|---|---|---|---|---|
| 2087755 | Baseline Framework D | 605962 | air_quality | 2087755 | Baseline Framework D | 605962 |
| 790483 | Distributed Protocol | 10449510 | health | 790483 | Distributed Protocol | 10449510 |
| 505978 | Adaptive Programme | 2002007020080 | housing | 505978 | Adaptive Programme | 2002007020080 |
| id_6 | Primary Standard A | drafting-skills | education | id_6 | Primary Standard A | drafting-skills |
