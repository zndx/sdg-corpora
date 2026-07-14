## Coastal Fishery Monitoring and Adaptation Assessment

Coastal communities across Southeast Asia face compounding pressures from environmental change, shifting fish stocks, and evolving regulatory frameworks. Systematic monitoring of these systems requires coordinated data collection across multiple dimensions: the geographic zones where fishing occurs, the populations of fishers operating within them, the environmental conditions shaping their livelihoods, and the adaptation strategies deployed in response. This chapter documents the architecture of a monitoring framework that links fishery surveys, coastal zone assessments, fisher population profiles, environmental measurements, and adaptation interventions into a unified reference structure. The framework supports longitudinal tracking of vulnerability, readiness, and intervention effectiveness across heterogeneous coastal jurisdictions.

**Table `fishery_surveys`**

| fishery_survey_id | survey_identifier | sampling_method | total_respondents | start_date | end_date | status | coastal_zone_id | fishermen_population_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | SUR-2722 | distributed-sampling-66 | 14 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1000 | 2025-01-01 00:14:00 |
| 101 | SUR-2723 | baseline-sampling-67 | 62 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 101 | 1001 | 2025-02-06 03:14:00 |
| 102 | SUR-2724 | pilot-sampling-68 | 5 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 1002 | 2025-03-11 06:14:00 |
| 103 | SUR-2725 | extended-sampling-69 | 47 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | archived | 103 | 1003 | 2025-04-16 09:14:00 |

Fishery surveys constitute the primary data collection instrument in the monitoring framework. Each survey is identified by a unique survey identifier such as SUR-2722 or SUR-2723 and is classified by its sampling methodology. The recorded methods—distributed-sampling-66, baseline-sampling-67, pilot-sampling-68, and extended-sampling-69—reflect distinct operational protocols tailored to the scope and maturity of each assessment cycle. Survey records capture the total number of respondents engaged, ranging from a minimal pilot of five participants in SUR-2724 to a comprehensive baseline effort of 62 respondents in SUR-2723. Temporal boundaries are defined by start and end dates, and each survey carries a lifecycle status: planned, active, completed, or archived. Survey 100 (SUR-2722) remains in the planned state with a target of fourteen respondents, while survey 102 (SUR-2724) has progressed to completed status following its pilot deployment. Every survey is anchored to a specific coastal zone and a corresponding fisher population, establishing the geographic and demographic context for the data collected.

**Table `coastal_zones`**

| id | zone_identifier | zone_name | state_jurisdiction | latitude | longitude | flood_vulnerability_index |
|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | Kelantan | 13.95 | 21.20 | 14.95 |
| 101 | ZON-2263 | Baseline Assessment | Terengganu | 17.90 | 25.40 | 18.90 |
| 102 | ZON-2268 | Distributed Survey A | Pahang | 21.85 | 29.60 | 22.85 |
| 103 | ZON-2273 | Adaptive Corridor | East Johor | 25.80 | 33.80 | 26.80 |

Coastal zones define the spatial units within which monitoring activities are situated. Each zone is assigned a zone identifier—ZON-2258 through ZON-2273—and a descriptive zone name that reflects its assessment role, such as Pilot Series, Baseline Assessment, Distributed Survey A, or Adaptive Corridor. Zones are georeferenced by latitude and longitude coordinates, with the recorded positions spanning from 13.95°N to 25.80°N latitude and 21.20°E to 33.80°E longitude. Jurisdictional authority is recorded as a state designation; the documented zones fall under Kelantan, Terengganu, Pahang, and East Johor. A critical metric for each zone is the flood vulnerability index, which quantifies exposure to coastal flooding hazards. The index values range from 14.95 in the Pilot Series zone (Kelantan) to 26.80 in the Adaptive Corridor zone (East Johor), indicating a gradient of increasing vulnerability across the monitored region. These zones serve as the spatial anchor for all downstream survey, population, and environmental records.

**Table `fishermen_populations`**

| fishermen_population_id | population_identifier | registered_count | primary_gear_type | average_vessel_size | adaptation_readiness | coastal_zone_id | fishery_survey_id |
|---|---|---|---|---|---|---|---|
| 1000 | POP-2555 | 7 | integrated-primary-94 | 0.74 | low | 100 | 100 |
| 1001 | POP-2556 | 26 | seasonal-primary-95 | 1.33 | moderate | 101 | 101 |
| 1002 | POP-2557 | 39 | regional-primary-96 | 0.6 | high | 102 | 102 |
| 1003 | POP-2558 | 6 | legacy-primary-97 | 0.6 | low | 103 | 103 |

Fishermen populations represent the human communities whose livelihoods depend on coastal resources. Each population record carries a population identifier—POP-2555 through POP-2558—and documents the registered count of fishers, which varies from six individuals in POP-2558 to thirty-nine in POP-2557. The primary gear type used by each community is classified into categories such as integrated-primary-94, seasonal-primary-95, regional-primary-96, and legacy-primary-97, reflecting distinct fishing practices and technological profiles. Average vessel size, measured as a continuous value, ranges from 0.60 to 1.33, indicating variation in fleet capacity across communities. Adaptation readiness is assessed categorically as low, moderate, or high; POP-2557 in the Pahang jurisdiction exhibits high readiness, while POP-2555 and POP-2558 are classified as low. Each population record is linked to both a coastal zone and a fishery survey, ensuring that demographic and operational data are traceable to their geographic and methodological origins.

**Table `environmental_variables`**

| environmental_variable_id | variable_identifier | variable_name | measurement_unit | trend_direction | impact_severity | observation_period | coastal_zone_id | fishery_survey_id | fishermen_population_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | VAR-2153 | Extended Framework | extended-measurem-87 | increasing | low | extended-observat-93 | 100 | 100 | 1000 |
| 2 | VAR-2155 | Pilot Protocol A | integrated-measurem-88 | decreasing | moderate | integrated-observat-94 | 101 | 101 | 1001 |
| 3 | VAR-2157 | Baseline Programme | seasonal-measurem-89 | stable | high | seasonal-observat-95 | 102 | 102 | 1002 |
| 4 | VAR-2159 | Distributed Standard | regional-measurem-90 | volatile | critical | regional-observat-96 | 103 | 103 | 1003 |

Environmental variables capture the biophysical conditions that influence fishery productivity and community resilience. Each variable is identified by a variable identifier such as VAR-2153 or VAR-2159 and assigned a variable name like Extended Framework, Pilot Protocol A, Baseline Programme, or Distributed Standard. Measurements are recorded in standardized units—extended-measurem-87, integrated-measurem-88, seasonal-measurem-89, and regional-measurem-90—corresponding to the monitoring protocol in use. The trend direction of each variable is classified as increasing, decreasing, stable, or volatile, with the Distributed Standard (VAR-2159) exhibiting a volatile trajectory. Impact severity ranges from low for the Extended Framework to critical for the Distributed Standard, signaling the potential magnitude of environmental change on coastal systems. Observation periods are categorized as extended-observat-93, integrated-observat-94, seasonal-observat-95, or regional-observat-96. Every environmental variable record is associated with a coastal zone, a fishery survey, and a fishermen population, creating a multi-dimensional linkage that situates biophysical measurements within their operational and geographic context.

**Table `adaptation_interventions`**

| adaptation_intervention_id | intervention_identifier | intervention_type | target_audience | implementation_date | status | budget_allocated | fishermen_population_id | coastal_zone_id |
|---|---|---|---|---|---|---|---|---|
| 1 | INT-2732 | information provision | legacy-target-25 | 2024-11-14 | proposed | 89.53 | 1000 | 100 |
| 2 | INT-2733 | skills training | compact-target-26 | 2025-04-25 | implemented | 4.48 | 1001 | 101 |
| 3 | INT-2734 | infrastructure upgrade | composite-target-27 | 2022-09-09 | evaluated | 442.51 | 1002 | 102 |
| 4 | INT-2735 | policy reform | primary-target-28 | 2023-02-20 | discontinued | 12.36 | 1003 | 103 |

Adaptation interventions represent the structured actions deployed to enhance community resilience and address identified vulnerabilities. Each intervention carries an intervention identifier—INT-2732 through INT-2735—and is classified by its intervention type, which includes information provision, skills training, infrastructure upgrade, and policy reform. Target audiences are specified using identifiers such as legacy-target-25, compact-target-26, composite-target-27, and primary-target-28, denoting the intended beneficiary groups. Implementation dates span from 2022-09-09 for the infrastructure upgrade (INT-2734) to 2025-04-25 for the skills training program (INT-2733). The status of each intervention reflects its lifecycle stage: proposed, implemented, evaluated, or discontinued. Budget allocations vary substantially, from 4.48 units for the skills training to 442.51 units for the infrastructure upgrade, indicating the resource intensity of different intervention modalities. Each intervention is linked to a specific fishermen population and coastal zone, ensuring that adaptation efforts are traceable to the communities and locations they serve.

**Table `surveys_variables`**

| fishery_survey_id | environmental_variable_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The relationship between fishery surveys and environmental variables is mediated through the surveys_variables association table, which records which environmental measurements were collected as part of each survey. Survey 100 is associated with environmental variables 1 and 4, while survey 101 links to variables 2 and 3. Survey 102 connects to variables 3 and 4, and survey 103 associates with variables 4 and 1. This many-to-many structure allows surveys to encompass multiple environmental dimensions and enables individual variables to be assessed across different survey contexts, supporting cross-survey comparison and longitudinal trend analysis.

**Table `zones_populations`**

| coastal_zone_id | fishermen_population_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The zones_populations table establishes the mapping between coastal zones and the fishermen populations operating within them. Each coastal zone may contain one or more registered fisher populations, and each population is assigned to a single zone. This association ensures that demographic data are geographically bounded and that zone-level vulnerability metrics can be aggregated across the populations they contain.

**Table `zones_variables`**

| coastal_zone_id | environmental_variable_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The zones_variables table links coastal zones to environmental variables, recording which biophysical measurements are relevant to each geographic area. This association supports zone-level environmental profiling and enables the aggregation of variable-level data to assess the overall environmental risk profile of a given coastal zone.

**Table `populations_variables`**

| fishermen_population_id | environmental_variable_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The populations_variables table connects fishermen populations to environmental variables, documenting which biophysical conditions directly affect each community. This linkage is essential for understanding the exposure of specific fisher groups to environmental stressors and for targeting adaptation interventions to the populations most affected by particular environmental trends.

**Table `interventions_variables`**

| adaptation_intervention_id | environmental_variable_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The interventions_variables table associates adaptation interventions with environmental variables, recording which biophysical conditions each intervention is designed to address. This association enables the evaluation of whether intervention types are appropriately matched to the severity and direction of environmental trends, supporting evidence-based allocation of adaptation resources.

**View `v_fishery_survey_coastal_zone`**

```sql
CREATE VIEW v_fishery_survey_coastal_zone AS
SELECT a.fishery_survey_id, a.survey_identifier, a.sampling_method, a.total_respondents, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM fishery_surveys a JOIN coastal_zones b ON a.coastal_zone_id = b.id;
```

| fishery_survey_id | survey_identifier | sampling_method | total_respondents | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 100 | SUR-2722 | distributed-sampling-66 | 14 | 100 | ZON-2258 | Pilot Series |
| 101 | SUR-2723 | baseline-sampling-67 | 62 | 101 | ZON-2263 | Baseline Assessment |
| 102 | SUR-2724 | pilot-sampling-68 | 5 | 102 | ZON-2268 | Distributed Survey A |
| 103 | SUR-2725 | extended-sampling-69 | 47 | 103 | ZON-2273 | Adaptive Corridor |

This view joins fishery surveys with their corresponding coastal zones, answering the question of which geographic jurisdiction each survey operates within and what the baseline vulnerability profile of that zone is. For example, survey SUR-2722 (fishery_survey_id 100) is conducted within the Pilot Series zone (coastal_zone_id 100) in Kelantan, a zone with a flood vulnerability index of 14.95. Survey SUR-2725 (fishery_survey_id 103) operates in the Adaptive Corridor zone (coastal_zone_id 103) in East Johor, where the flood vulnerability index reaches 26.80. The view enables analysts to assess whether survey intensity or methodology correlates with zone-level vulnerability, revealing that the highest-vulnerability zone has an archived survey, suggesting either completed assessment or data archival.

**View `v_fishery_survey_fishermen_population`**

```sql
CREATE VIEW v_fishery_survey_fishermen_population AS
SELECT a.fishery_survey_id, a.survey_identifier, a.sampling_method, a.total_respondents, b.fishermen_population_id AS population_fishermen_population_id, b.population_identifier AS population_population_identifier, b.registered_count AS population_registered_count
FROM fishery_surveys a JOIN fishermen_populations b ON a.fishermen_population_id = b.fishermen_population_id;
```

| fishery_survey_id | survey_identifier | sampling_method | total_respondents | population_fishermen_population_id | population_population_identifier | population_registered_count |
|---|---|---|---|---|---|---|
| 100 | SUR-2722 | distributed-sampling-66 | 14 | 1000 | POP-2555 | 7 |
| 101 | SUR-2723 | baseline-sampling-67 | 62 | 1001 | POP-2556 | 26 |
| 102 | SUR-2724 | pilot-sampling-68 | 5 | 1002 | POP-2557 | 39 |
| 103 | SUR-2725 | extended-sampling-69 | 47 | 1003 | POP-2558 | 6 |

This view links fishery surveys to the fishermen populations they engage, answering how many registered fishers are involved in each survey and what their operational characteristics are. Survey SUR-2723 (fishery_survey_id 101) engages population POP-2556 (fishermen_population_id 1001), which has twenty-six registered fishers using seasonal-primary-95 gear with an average vessel size of 1.33 and moderate adaptation readiness. Survey SUR-2724 (fishery_survey_id 102) engages population POP-2557 (fishermen_population_id 1002), comprising thirty-nine registered fishers with regional-primary-96 gear, an average vessel size of 0.60, and high adaptation readiness. The view reveals that survey respondent counts do not necessarily scale with population size; the pilot survey engaged only five respondents from a population of thirty-nine, indicating a targeted sampling approach.

**View `v_fishery_survey_environmental_variable_detail`**

```sql
CREATE VIEW v_fishery_survey_environmental_variable_detail AS
SELECT a.fishery_survey_id, a.survey_identifier, a.sampling_method, b.environmental_variable_id AS variable_environmental_variable_id, b.variable_identifier AS variable_variable_identifier, b.variable_name AS variable_variable_name
FROM fishery_surveys a
  JOIN surveys_variables j ON j.fishery_survey_id = a.fishery_survey_id
  JOIN environmental_variables b ON b.environmental_variable_id = j.environmental_variable_id;
```

| fishery_survey_id | survey_identifier | sampling_method | variable_environmental_variable_id | variable_variable_identifier | variable_variable_name |
|---|---|---|---|---|---|
| 100 | SUR-2722 | distributed-sampling-66 | 1 | VAR-2153 | Extended Framework |
| 100 | SUR-2722 | distributed-sampling-66 | 2 | VAR-2155 | Pilot Protocol A |
| 101 | SUR-2723 | baseline-sampling-67 | 2 | VAR-2155 | Pilot Protocol A |
| 101 | SUR-2723 | baseline-sampling-67 | 3 | VAR-2157 | Baseline Programme |
| 102 | SUR-2724 | pilot-sampling-68 | 3 | VAR-2157 | Baseline Programme |
| 102 | SUR-2724 | pilot-sampling-68 | 4 | VAR-2159 | Distributed Standard |
| 103 | SUR-2725 | extended-sampling-69 | 4 | VAR-2159 | Distributed Standard |
| 103 | SUR-2725 | extended-sampling-69 | 1 | VAR-2153 | Extended Framework |

This view connects fishery surveys to the environmental variables measured during each survey, answering which biophysical conditions were assessed and what their observed trends and severity levels are. Survey SUR-2722 (fishery_survey_id 100) is associated with the Extended Framework variable (environmental_variable_id 1), which shows an increasing trend with low impact severity, and the Distributed Standard variable (environmental_variable_id 4), which exhibits a volatile trend with critical impact severity. Survey SUR-2724 (fishery_survey_id 102) is linked to the Baseline Programme variable (environmental_variable_id 3), showing a stable trend with high impact severity. The view highlights the coexistence of low-severity and critical-severity variables within the same survey context, underscoring the complexity of environmental risk assessment.

**View `v_coastal_zone_fishermen_population_detail`**

```sql
CREATE VIEW v_coastal_zone_fishermen_population_detail AS
SELECT a.id, a.zone_identifier, a.zone_name, b.fishermen_population_id AS population_fishermen_population_id, b.population_identifier AS population_population_identifier, b.registered_count AS population_registered_count
FROM coastal_zones a
  JOIN zones_populations j ON j.coastal_zone_id = a.id
  JOIN fishermen_populations b ON b.fishermen_population_id = j.fishermen_population_id;
```

| id | zone_identifier | zone_name | population_fishermen_population_id | population_population_identifier | population_registered_count |
|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | 1000 | POP-2555 | 7 |
| 100 | ZON-2258 | Pilot Series | 1001 | POP-2556 | 26 |
| 101 | ZON-2263 | Baseline Assessment | 1001 | POP-2556 | 26 |
| 101 | ZON-2263 | Baseline Assessment | 1002 | POP-2557 | 39 |
| 102 | ZON-2268 | Distributed Survey A | 1002 | POP-2557 | 39 |
| 102 | ZON-2268 | Distributed Survey A | 1003 | POP-2558 | 6 |
| 103 | ZON-2273 | Adaptive Corridor | 1003 | POP-2558 | 6 |
| 103 | ZON-2273 | Adaptive Corridor | 1000 | POP-2555 | 7 |

This view joins coastal zones with the fishermen populations they contain, answering which communities operate within each zone and what their adaptation readiness levels are. The Pilot Series zone (coastal_zone_id 100) in Kelantan contains population POP-2555 (fishermen_population_id 1000), which has seven registered fishers, uses integrated-primary-94 gear, and exhibits low adaptation readiness. The Baseline Assessment zone (coastal_zone_id 101) in Terengganu contains population POP-2556 (fishermen_population_id 1001), with twenty-six registered fishers, seasonal-primary-95 gear, and moderate adaptation readiness. The view reveals an inverse relationship between registered population size and adaptation readiness in the first two zones, with the larger population showing higher readiness.

**View `v_coastal_zone_environmental_variable_detail`**

```sql
CREATE VIEW v_coastal_zone_environmental_variable_detail AS
SELECT a.id, a.zone_identifier, a.zone_name, b.environmental_variable_id AS variable_environmental_variable_id, b.variable_identifier AS variable_variable_identifier, b.variable_name AS variable_variable_name
FROM coastal_zones a
  JOIN zones_variables j ON j.coastal_zone_id = a.id
  JOIN environmental_variables b ON b.environmental_variable_id = j.environmental_variable_id;
```

| id | zone_identifier | zone_name | variable_environmental_variable_id | variable_variable_identifier | variable_variable_name |
|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | 1 | VAR-2153 | Extended Framework |
| 100 | ZON-2258 | Pilot Series | 2 | VAR-2155 | Pilot Protocol A |
| 101 | ZON-2263 | Baseline Assessment | 2 | VAR-2155 | Pilot Protocol A |
| 101 | ZON-2263 | Baseline Assessment | 3 | VAR-2157 | Baseline Programme |
| 102 | ZON-2268 | Distributed Survey A | 3 | VAR-2157 | Baseline Programme |
| 102 | ZON-2268 | Distributed Survey A | 4 | VAR-2159 | Distributed Standard |
| 103 | ZON-2273 | Adaptive Corridor | 4 | VAR-2159 | Distributed Standard |
| 103 | ZON-2273 | Adaptive Corridor | 1 | VAR-2153 | Extended Framework |

This view links coastal zones to the environmental variables monitored within them, answering which biophysical conditions are tracked in each zone and what their severity profiles are. The Pilot Series zone (coastal_zone_id 100) is associated with the Extended Framework variable (environmental_variable_id 1), characterized by an increasing trend and low impact severity. The Adaptive Corridor zone (coastal_zone_id 103) is associated with the Distributed Standard variable (environmental_variable_id 4), which shows a volatile trend and critical impact severity. The view enables zone-level environmental risk profiling, revealing that the zone with the highest flood vulnerability index also hosts the variable with the highest impact severity.

**View `v_fishermen_population_coastal_zone`**

```sql
CREATE VIEW v_fishermen_population_coastal_zone AS
SELECT a.fishermen_population_id, a.population_identifier, a.registered_count, a.primary_gear_type, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM fishermen_populations a JOIN coastal_zones b ON a.coastal_zone_id = b.id;
```

| fishermen_population_id | population_identifier | registered_count | primary_gear_type | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1000 | POP-2555 | 7 | integrated-primary-94 | 100 | ZON-2258 | Pilot Series |
| 1001 | POP-2556 | 26 | seasonal-primary-95 | 101 | ZON-2263 | Baseline Assessment |
| 1002 | POP-2557 | 39 | regional-primary-96 | 102 | ZON-2268 | Distributed Survey A |
| 1003 | POP-2558 | 6 | legacy-primary-97 | 103 | ZON-2273 | Adaptive Corridor |

This view reverses the spatial perspective by joining fishermen populations with their parent coastal zones, answering which jurisdictional authority governs each population and what the zone's vulnerability index is. Population POP-2555 (fishermen_population_id 1000) operates under the Kelantan jurisdiction within the Pilot Series zone, which has a flood vulnerability index of 14.95. Population POP-2558 (fishermen_population_id 1003) operates under East Johor within the Adaptive Corridor zone, where the flood vulnerability index reaches 26.80. The view supports jurisdiction-level aggregation of population metrics and facilitates cross-jurisdictional comparison of vulnerability and readiness.

**View `v_fishermen_population_fishery_survey`**

```sql
CREATE VIEW v_fishermen_population_fishery_survey AS
SELECT a.fishermen_population_id, a.population_identifier, a.registered_count, a.primary_gear_type, b.fishery_survey_id AS survey_fishery_survey_id, b.survey_identifier AS survey_survey_identifier, b.sampling_method AS survey_sampling_method
FROM fishermen_populations a JOIN fishery_surveys b ON a.fishery_survey_id = b.fishery_survey_id;
```

| fishermen_population_id | population_identifier | registered_count | primary_gear_type | survey_fishery_survey_id | survey_survey_identifier | survey_sampling_method |
|---|---|---|---|---|---|---|
| 1000 | POP-2555 | 7 | integrated-primary-94 | 100 | SUR-2722 | distributed-sampling-66 |
| 1001 | POP-2556 | 26 | seasonal-primary-95 | 101 | SUR-2723 | baseline-sampling-67 |
| 1002 | POP-2557 | 39 | regional-primary-96 | 102 | SUR-2724 | pilot-sampling-68 |
| 1003 | POP-2558 | 6 | legacy-primary-97 | 103 | SUR-2725 | extended-sampling-69 |

This view connects fishermen populations to the fishery surveys that engage them, answering which survey methodology and respondent count applies to each population. Population POP-2555 (fishermen_population_id 1000) is engaged by survey SUR-2722 (fishery_survey_id 100), which uses distributed-sampling-66 methodology and targets fourteen respondents. Population POP-2557 (fishermen_population_id 1002) is engaged by survey SUR-2724 (fishery_survey_id 102), which uses pilot-sampling-68 methodology and targets five respondents. The view enables population-level assessment of survey engagement intensity and methodological consistency across the monitoring program.

**View `v_fishermen_population_environmental_variable_detail`**

```sql
CREATE VIEW v_fishermen_population_environmental_variable_detail AS
SELECT a.fishermen_population_id, a.population_identifier, a.registered_count, b.environmental_variable_id AS variable_environmental_variable_id, b.variable_identifier AS variable_variable_identifier, b.variable_name AS variable_variable_name
FROM fishermen_populations a
  JOIN populations_variables j ON j.fishermen_population_id = a.fishermen_population_id
  JOIN environmental_variables b ON b.environmental_variable_id = j.environmental_variable_id;
```

| fishermen_population_id | population_identifier | registered_count | variable_environmental_variable_id | variable_variable_identifier | variable_variable_name |
|---|---|---|---|---|---|
| 1000 | POP-2555 | 7 | 1 | VAR-2153 | Extended Framework |
| 1000 | POP-2555 | 7 | 2 | VAR-2155 | Pilot Protocol A |
| 1001 | POP-2556 | 26 | 2 | VAR-2155 | Pilot Protocol A |
| 1001 | POP-2556 | 26 | 3 | VAR-2157 | Baseline Programme |
| 1002 | POP-2557 | 39 | 3 | VAR-2157 | Baseline Programme |
| 1002 | POP-2557 | 39 | 4 | VAR-2159 | Distributed Standard |
| 1003 | POP-2558 | 6 | 4 | VAR-2159 | Distributed Standard |
| 1003 | POP-2558 | 6 | 1 | VAR-2153 | Extended Framework |

This view links fishermen populations to the environmental variables that affect them, answering which biophysical conditions each community is exposed to and what the trend and severity characteristics are. Population POP-2555 (fishermen_population_id 1000) is exposed to the Extended Framework variable (environmental_variable_id 1), which has an increasing trend and low impact severity. Population POP-2558 (fishermen_population_id 1003) is exposed to the Distributed Standard variable (environmental_variable_id 4), which exhibits a volatile trend and critical impact severity. The view supports targeted risk communication by identifying which populations face the most severe environmental conditions.

**View `v_environmental_variable_coastal_zone`**

```sql
CREATE VIEW v_environmental_variable_coastal_zone AS
SELECT a.environmental_variable_id, a.variable_identifier, a.variable_name, a.measurement_unit, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM environmental_variables a JOIN coastal_zones b ON a.coastal_zone_id = b.id;
```

| environmental_variable_id | variable_identifier | variable_name | measurement_unit | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | VAR-2153 | Extended Framework | extended-measurem-87 | 100 | ZON-2258 | Pilot Series |
| 2 | VAR-2155 | Pilot Protocol A | integrated-measurem-88 | 101 | ZON-2263 | Baseline Assessment |
| 3 | VAR-2157 | Baseline Programme | seasonal-measurem-89 | 102 | ZON-2268 | Distributed Survey A |
| 4 | VAR-2159 | Distributed Standard | regional-measurem-90 | 103 | ZON-2273 | Adaptive Corridor |

This view joins environmental variables with their parent coastal zones, answering which geographic area each variable monitors and what the zone's vulnerability index is. The Extended Framework variable (environmental_variable_id 1) is monitored within the Pilot Series zone (coastal_zone_id 100), which has a flood vulnerability index of 14.95. The Distributed Standard variable (environmental_variable_id 4) is monitored within the Adaptive Corridor zone (coastal_zone_id 103), where the flood vulnerability index reaches 26.80. The view enables environmental variable-level assessment of the vulnerability context in which measurements are taken, supporting interpretation of whether high-severity variables cluster in high-vulnerability zones.

**View `v_environmental_variable_fishery_survey`**

```sql
CREATE VIEW v_environmental_variable_fishery_survey AS
SELECT a.environmental_variable_id, a.variable_identifier, a.variable_name, a.measurement_unit, b.fishery_survey_id AS survey_fishery_survey_id, b.survey_identifier AS survey_survey_identifier, b.sampling_method AS survey_sampling_method
FROM environmental_variables a JOIN fishery_surveys b ON a.fishery_survey_id = b.fishery_survey_id;
```

| environmental_variable_id | variable_identifier | variable_name | measurement_unit | survey_fishery_survey_id | survey_survey_identifier | survey_sampling_method |
|---|---|---|---|---|---|---|
| 1 | VAR-2153 | Extended Framework | extended-measurem-87 | 100 | SUR-2722 | distributed-sampling-66 |
| 2 | VAR-2155 | Pilot Protocol A | integrated-measurem-88 | 101 | SUR-2723 | baseline-sampling-67 |
| 3 | VAR-2157 | Baseline Programme | seasonal-measurem-89 | 102 | SUR-2724 | pilot-sampling-68 |
| 4 | VAR-2159 | Distributed Standard | regional-measurem-90 | 103 | SUR-2725 | extended-sampling-69 |

This view connects environmental variables to the fishery surveys that collected them, answering which survey methodology and respondent count is associated with each environmental measurement. The Extended Framework variable (environmental_variable_id 1) was collected during survey SUR-2722 (fishery_survey_id 100), which used distributed-sampling-66 methodology and engaged fourteen respondents. The Baseline Programme variable (environmental_variable_id 3) was collected during survey SUR-2723 (fishery_survey_id 101), which used baseline-sampling-67 methodology and engaged sixty-two respondents. The view supports methodological evaluation of environmental data quality by correlating survey design with variable assessment.

**View `v_environmental_variable_fishermen_population`**

```sql
CREATE VIEW v_environmental_variable_fishermen_population AS
SELECT a.environmental_variable_id, a.variable_identifier, a.variable_name, a.measurement_unit, b.fishermen_population_id AS population_fishermen_population_id, b.population_identifier AS population_population_identifier, b.registered_count AS population_registered_count
FROM environmental_variables a JOIN fishermen_populations b ON a.fishermen_population_id = b.fishermen_population_id;
```

| environmental_variable_id | variable_identifier | variable_name | measurement_unit | population_fishermen_population_id | population_population_identifier | population_registered_count |
|---|---|---|---|---|---|---|
| 1 | VAR-2153 | Extended Framework | extended-measurem-87 | 1000 | POP-2555 | 7 |
| 2 | VAR-2155 | Pilot Protocol A | integrated-measurem-88 | 1001 | POP-2556 | 26 |
| 3 | VAR-2157 | Baseline Programme | seasonal-measurem-89 | 1002 | POP-2557 | 39 |
| 4 | VAR-2159 | Distributed Standard | regional-measurem-90 | 1003 | POP-2558 | 6 |

This view links environmental variables to the fishermen populations they affect, answering which community is exposed to each biophysical condition and what the population's adaptation readiness is. The Extended Framework variable (environmental_variable_id 1) affects population POP-2555 (fishermen_population_id 1000), which has low adaptation readiness and seven registered fishers. The Baseline Programme variable (environmental_variable_id 3) affects population POP-2557 (fishermen_population_id 1002), which has high adaptation readiness and thirty-nine registered fishers. The view reveals a potential mismatch between exposure and readiness: the population with the highest readiness faces a variable with high impact severity, while the lowest-readiness population faces a variable with low impact severity.

**View `v_adaptation_intervention_fishermen_population`**

```sql
CREATE VIEW v_adaptation_intervention_fishermen_population AS
SELECT a.adaptation_intervention_id, a.intervention_identifier, a.intervention_type, a.target_audience, b.fishermen_population_id AS population_fishermen_population_id, b.population_identifier AS population_population_identifier, b.registered_count AS population_registered_count
FROM adaptation_interventions a JOIN fishermen_populations b ON a.fishermen_population_id = b.fishermen_population_id;
```

| adaptation_intervention_id | intervention_identifier | intervention_type | target_audience | population_fishermen_population_id | population_population_identifier | population_registered_count |
|---|---|---|---|---|---|---|
| 1 | INT-2732 | information provision | legacy-target-25 | 1000 | POP-2555 | 7 |
| 2 | INT-2733 | skills training | compact-target-26 | 1001 | POP-2556 | 26 |
| 3 | INT-2734 | infrastructure upgrade | composite-target-27 | 1002 | POP-2557 | 39 |
| 4 | INT-2735 | policy reform | primary-target-28 | 1003 | POP-2558 | 6 |

This view joins adaptation interventions with the fishermen populations they target, answering which community receives each intervention and what the intervention's type, budget, and status are. Population POP-2555 (fishermen_population_id 1000) receives the information provision intervention (INT-2732), which is proposed, targets legacy-target-25, and has a budget allocation of 89.53 units. Population POP-2557 (fishermen_population_id 1002) receives the infrastructure upgrade intervention (INT-2734), which has been evaluated, targets composite-target-27, and carries the largest budget allocation of 442.51 units. The view enables assessment of whether intervention types and resource levels are appropriately matched to population characteristics such as adaptation readiness and registered size.

**View `v_adaptation_intervention_environmental_variable_detail`**

```sql
CREATE VIEW v_adaptation_intervention_environmental_variable_detail AS
SELECT a.adaptation_intervention_id, a.intervention_identifier, a.intervention_type, b.environmental_variable_id AS variable_environmental_variable_id, b.variable_identifier AS variable_variable_identifier, b.variable_name AS variable_variable_name
FROM adaptation_interventions a
  JOIN interventions_variables j ON j.adaptation_intervention_id = a.adaptation_intervention_id
  JOIN environmental_variables b ON b.environmental_variable_id = j.environmental_variable_id;
```

| adaptation_intervention_id | intervention_identifier | intervention_type | variable_environmental_variable_id | variable_variable_identifier | variable_variable_name |
|---|---|---|---|---|---|
| 1 | INT-2732 | information provision | 1 | VAR-2153 | Extended Framework |
| 1 | INT-2732 | information provision | 2 | VAR-2155 | Pilot Protocol A |
| 2 | INT-2733 | skills training | 2 | VAR-2155 | Pilot Protocol A |
| 2 | INT-2733 | skills training | 3 | VAR-2157 | Baseline Programme |
| 3 | INT-2734 | infrastructure upgrade | 3 | VAR-2157 | Baseline Programme |
| 3 | INT-2734 | infrastructure upgrade | 4 | VAR-2159 | Distributed Standard |
| 4 | INT-2735 | policy reform | 4 | VAR-2159 | Distributed Standard |
| 4 | INT-2735 | policy reform | 1 | VAR-2153 | Extended Framework |

This view links adaptation interventions to the environmental variables they address, answering which biophysical conditions each intervention is designed to mitigate and what the variable's trend and severity are. The information provision intervention (INT-2732) targets the Extended Framework variable (environmental_variable_id 1), which has an increasing trend and low impact severity. The skills training intervention (INT-2733) targets the Pilot Protocol A variable (environmental_variable_id 2), which has a decreasing trend and moderate impact severity. The view supports evaluation of whether intervention modalities are suited to the nature of the environmental challenge—for instance, whether information provision is appropriate for low-severity trends and whether infrastructure upgrades are reserved for high-severity conditions.

**View `v_adaptation_intervention_coastal_zone`**

```sql
CREATE VIEW v_adaptation_intervention_coastal_zone AS
SELECT a.adaptation_intervention_id, a.intervention_identifier, a.intervention_type, a.target_audience, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM adaptation_interventions a JOIN coastal_zones b ON a.coastal_zone_id = b.id;
```

| adaptation_intervention_id | intervention_identifier | intervention_type | target_audience | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | INT-2732 | information provision | legacy-target-25 | 100 | ZON-2258 | Pilot Series |
| 2 | INT-2733 | skills training | compact-target-26 | 101 | ZON-2263 | Baseline Assessment |
| 3 | INT-2734 | infrastructure upgrade | composite-target-27 | 102 | ZON-2268 | Distributed Survey A |
| 4 | INT-2735 | policy reform | primary-target-28 | 103 | ZON-2273 | Adaptive Corridor |

This view connects adaptation interventions to their parent coastal zones, answering which jurisdiction and vulnerability context each intervention operates within. The information provision intervention (INT-2732) operates in the Pilot Series zone (coastal_zone_id 100) in Kelantan, where the flood vulnerability index is 14.95. The infrastructure upgrade intervention (INT-2734) operates in the Distributed Survey A zone (coastal_zone_id 102) in Pahang, where the flood vulnerability index reaches 22.85. The view enables jurisdiction-level assessment of adaptation investment and facilitates comparison of intervention deployment across zones with different vulnerability profiles.

The monitoring framework described here integrates five core data domains—surveys, zones, populations, environmental variables, and adaptation interventions—into a coherent reference structure that supports multi-dimensional analysis of coastal fishery systems. The base tables capture the fundamental entities and their attributes, while the association tables encode the relational structure that links surveys to variables, zones to populations, and interventions to their targets. The derived views provide pre-joined perspectives that answer specific operational questions, from identifying which populations face the most severe environmental conditions to evaluating whether intervention budgets are proportionate to vulnerability levels. Together, these components form a data architecture that enables practitioners to trace the full chain of evidence from environmental observation through survey methodology to community-level adaptation outcomes, supporting evidence-based decision-making in coastal resource management.