## Modelling Coastal Fishery Domains as a Normalised Relational Schema

Coastal fishery management demands the integration of survey logistics, geographic jurisdiction, human demographics, environmental monitoring, and policy interventions into a single coherent data model. The domain is captured by five core entity types—fishery surveys, coastal zones, fishermen populations, environmental variables, and adaptation interventions—linked through four junction tables that resolve many-to-many associations. Each entity type materialises as a relational table whose columns encode both intrinsic attributes and foreign-key references to the other entities. Views then reassemble the normalised facts into domain-specific perspectives, each answering a distinct analytical question.

**Table `fishery_surveys`**

| fishery_survey_id | survey_identifier | sampling_method | total_respondents | start_date | end_date | status | coastal_zone_id | fishermen_population_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | SUR-2722 | distributed-sampling-66 | 14 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1000 | 2025-01-01 00:14:00 |
| 101 | SUR-2723 | baseline-sampling-67 | 62 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 101 | 1001 | 2025-02-06 03:14:00 |
| 102 | SUR-2724 | pilot-sampling-68 | 5 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 1002 | 2025-03-11 06:14:00 |
| 103 | SUR-2725 | extended-sampling-69 | 47 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | archived | 103 | 1003 | 2025-04-16 09:14:00 |

The `fishery_surveys` table anchors the operational timeline of data collection. Each row represents a discrete survey event identified by a surrogate `fishery_survey_id` and a human-readable `survey_identifier` such as `SUR-2722`. The `sampling_method` column classifies the approach—values like `distributed-sampling-66`, `baseline-sampling-67`, `pilot-sampling-68`, and `extended-sampling-69`—while `total_respondents` records the sample size, ranging from 5 to 62 in the observed data. Temporal scope is captured by `start_date` and `end_date`, and `status` constrains the lifecycle to `planned`, `active`, `completed`, or `archived`. Two foreign keys, `coastal_zone_id` and `fishermen_population_id`, bind each survey to a specific geographic jurisdiction and the target demographic, respectively. The `created_at` timestamp provides an audit trail. Survey 100, for instance, is a planned distributed-sampling effort targeting 14 respondents in coastal zone 100 among fishermen population 1000.

**Table `coastal_zones`**

| id | zone_identifier | zone_name | state_jurisdiction | latitude | longitude | flood_vulnerability_index |
|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | Kelantan | 13.95 | 21.20 | 14.95 |
| 101 | ZON-2263 | Baseline Assessment | Terengganu | 17.90 | 25.40 | 18.90 |
| 102 | ZON-2268 | Distributed Survey A | Pahang | 21.85 | 29.60 | 22.85 |
| 103 | ZON-2273 | Adaptive Corridor | East Johor | 25.80 | 33.80 | 26.80 |

Geographic context is stored in `coastal_zones`, where each row describes a jurisdictional area. The surrogate `id` is paired with `zone_identifier` (e.g. `ZON-2258`) and a descriptive `zone_name` such as `Pilot Series` or `Adaptive Corridor`. The `state_jurisdiction` column records the governing state—Kelantan, Terengganu, Pahang, or East Johor in the sample. Spatial positioning is captured by `latitude` and `longitude`, while `flood_vulnerability_index` quantifies climate risk on a continuous scale, with observed values ranging from 14.95 to 26.80. This table has no outgoing foreign keys; it is referenced by other tables to establish geographic provenance.

**Table `fishermen_populations`**

| fishermen_population_id | population_identifier | registered_count | primary_gear_type | average_vessel_size | adaptation_readiness | coastal_zone_id | fishery_survey_id |
|---|---|---|---|---|---|---|---|
| 1000 | POP-2555 | 7 | integrated-primary-94 | 0.74 | low | 100 | 100 |
| 1001 | POP-2556 | 26 | seasonal-primary-95 | 1.33 | moderate | 101 | 101 |
| 1002 | POP-2557 | 39 | regional-primary-96 | 0.6 | high | 102 | 102 |
| 1003 | POP-2558 | 6 | legacy-primary-97 | 0.6 | low | 103 | 103 |

The `fishermen_populations` table profiles the human subjects of interest. Each population is identified by `fishermen_population_id` and `population_identifier` (e.g. `POP-2555`). The `registered_count` column holds integer values from 6 to 39, while `primary_gear_type` encodes fishing equipment categories such as `integrated-primary-94` or `seasonal-primary-95`. The `average_vessel_size` is a decimal measure (0.60 to 1.33), and `adaptation_readiness` is a categorical attribute with values `low`, `moderate`, or `high`. Foreign keys `coastal_zone_id` and `fishery_survey_id` link each population record to its geographic home and the survey that sampled it. Population 1000, for example, comprises 7 registered fishers using integrated-primary-94 gear with low adaptation readiness, situated in coastal zone 100 and surveyed under survey 100.

**Table `environmental_variables`**

| environmental_variable_id | variable_identifier | variable_name | measurement_unit | trend_direction | impact_severity | observation_period | coastal_zone_id | fishery_survey_id | fishermen_population_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | VAR-2153 | Extended Framework | extended-measurem-87 | increasing | low | extended-observat-93 | 100 | 100 | 1000 |
| 2 | VAR-2155 | Pilot Protocol A | integrated-measurem-88 | decreasing | moderate | integrated-observat-94 | 101 | 101 | 1001 |
| 3 | VAR-2157 | Baseline Programme | seasonal-measurem-89 | stable | high | seasonal-observat-95 | 102 | 102 | 1002 |
| 4 | VAR-2159 | Distributed Standard | regional-measurem-90 | volatile | critical | regional-observat-96 | 103 | 103 | 1003 |

Environmental monitoring data is stored in `environmental_variables`. Each variable is identified by `environmental_variable_id` and `variable_identifier` (e.g. `VAR-2153`), with a `variable_name` such as `Extended Framework` or `Distributed Standard`. The `measurement_unit` and `observation_period` columns describe the methodology, using codes like `extended-measurem-87` and `regional-observat-96`. The `trend_direction` column captures temporal dynamics with values `increasing`, `decreasing`, `stable`, or `volatile`, while `impact_severity` classifies risk as `low`, `moderate`, `high`, or `critical`. Three foreign keys—`coastal_zone_id`, `fishery_survey_id`, and `fishermen_population_id`—tie each environmental observation to its geographic, operational, and demographic context. Variable 4, for instance, is a regional-measurem-90 observation with volatile trend and critical impact severity, recorded in coastal zone 103 during survey 103 among population 1003.

**Table `adaptation_interventions`**

| adaptation_intervention_id | intervention_identifier | intervention_type | target_audience | implementation_date | status | budget_allocated | fishermen_population_id | coastal_zone_id |
|---|---|---|---|---|---|---|---|---|
| 1 | INT-2732 | information provision | legacy-target-25 | 2024-11-14 | proposed | 89.53 | 1000 | 100 |
| 2 | INT-2733 | skills training | compact-target-26 | 2025-04-25 | implemented | 4.48 | 1001 | 101 |
| 3 | INT-2734 | infrastructure upgrade | composite-target-27 | 2022-09-09 | evaluated | 442.51 | 1002 | 102 |
| 4 | INT-2735 | policy reform | primary-target-28 | 2023-02-20 | discontinued | 12.36 | 1003 | 103 |

Policy and programmatic responses are captured in `adaptation_interventions`. Each intervention is identified by `adaptation_intervention_id` and `intervention_identifier` (e.g. `INT-2732`). The `intervention_type` column distinguishes strategies such as `information provision`, `skills training`, `infrastructure upgrade`, and `policy reform`. The `target_audience` column encodes the intended recipients (e.g. `legacy-target-25`), while `implementation_date` and `status` track execution. Status values include `proposed`, `implemented`, `evaluated`, and `discontinued`. The `budget_allocated` column records financial commitment as a decimal (4.48 to 442.51). Foreign keys `fishermen_population_id` and `coastal_zone_id` associate each intervention with its target demographic and geographic scope. Intervention 3, an infrastructure upgrade targeting population 1002 in coastal zone 102, carries a budget of 442.51 and has been evaluated.

The five core tables above are supplemented by four junction tables that resolve many-to-many relationships not directly expressible through simple foreign keys.

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

The `surveys_variables` junction table links `fishery_surveys` to `environmental_variables`. Each row pairs a `fishery_survey_id` with an `environmental_variable_id`, indicating that a particular survey collected data on a specific environmental variable. Survey 100, for example, is associated with environmental variables 1 and 2, while survey 103 is linked to variables 4 and 1. This table enables a survey to encompass multiple environmental measurements and an environmental variable to be observed across multiple surveys.

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

The `zones_populations` junction table connects `coastal_zones` to `fishermen_populations`, allowing a single coastal zone to contain multiple distinct fishermen populations and a population to be tracked across zones. Although the core `fishermen_populations` table already carries a `coastal_zone_id` foreign key, this junction table provides an explicit many-to-many resolution for cases where populations are not uniquely bound to a single zone.

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

The `zones_variables` junction table links `coastal_zones` to `environmental_variables`, enabling a geographic zone to be associated with multiple environmental monitoring variables and a variable to be observed across multiple zones. This decouples the environmental variable's zone provenance from its survey-level association.

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

The `populations_variables` junction table connects `fishermen_populations` to `environmental_variables`, allowing a demographic group to be linked to multiple environmental observations and an environmental variable to be tracked across multiple populations. This provides a cross-tabulation of human and environmental dimensions.

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

The `interventions_variables` junction table links `adaptation_interventions` to `environmental_variables`, enabling an intervention to be associated with multiple environmental targets and an environmental variable to be addressed by multiple interventions. This supports the analysis of which environmental challenges are being targeted by which policy responses.

With the base schema established, the following views materialise domain-specific perspectives by joining the normalised tables. Each view answers a distinct analytical question by reconstructing a fact from the distributed columns.

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

The view `v_fishery_survey_coastal_zone` joins `fishery_surveys` with `coastal_zones` on `coastal_zone_id`, reconstructing the geographic provenance of each survey. It answers the question: "Which coastal jurisdiction does each survey operate in, and what is that zone's vulnerability profile?" Survey 100 (`SUR-2722`) is conducted in the `Pilot Series` zone in Kelantan, which has a flood vulnerability index of 14.95. Survey 103 (`SUR-2725`) operates in the `Adaptive Corridor` zone in East Johor, with a higher vulnerability index of 26.80. This view enables planners to assess whether survey effort is concentrated in high-risk zones.

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

The view `v_fishery_survey_fishermen_population` joins `fishery_surveys` with `fishermen_populations` on `fishermen_population_id`, answering: "Which fishermen population is each survey targeting, and what are their demographic characteristics?" Survey 100 targets population 1000 (`POP-2555`), which has 7 registered fishers using `integrated-primary-94` gear with low adaptation readiness. Survey 102 targets population 1002 (`POP-2557`), with 39 registered fishers, `regional-primary-96` gear, and high adaptation readiness. This view supports the analysis of survey coverage across populations with varying preparedness levels.

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

The view `v_fishery_survey_environmental_variable_detail` joins `fishery_surveys` with `environmental_variables` through the `surveys_variables` junction table, answering: "Which environmental variables were measured during each survey, and what are their characteristics?" Survey 100 is associated with variable 1 (`Extended Framework`, `increasing` trend, `low` severity) and variable 2 (`Pilot Protocol A`, `decreasing` trend, `moderate` severity). Survey 103 is linked to variable 4 (`Distributed Standard`, `volatile` trend, `critical` severity) and variable 1. This view reveals the environmental monitoring scope of each survey and highlights whether high-severity variables are being tracked.

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

The view `v_coastal_zone_fishermen_population_detail` joins `coastal_zones` with `fishermen_populations` through the `zones_populations` junction table, answering: "Which fishermen populations are associated with each coastal zone, and what are their characteristics?" This view reconstructs the demographic composition of each jurisdiction, enabling comparisons of registered counts, gear types, and adaptation readiness across zones. For instance, it would show that coastal zone 100 (`Pilot Series`, Kelantan) is associated with population 1000 (`POP-2555`), which has low adaptation readiness and a registered count of 7.

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

The view `v_coastal_zone_environmental_variable_detail` joins `coastal_zones` with `environmental_variables` through the `zones_variables` junction table, answering: "Which environmental variables are monitored within each coastal zone?" This view maps the environmental monitoring landscape to geographic jurisdictions. Coastal zone 103 (`Adaptive Corridor`, East Johor) would be associated with variable 4 (`Distributed Standard`), which has a volatile trend and critical impact severity, indicating that high-risk environmental factors are being tracked in this jurisdiction.

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

The view `v_fishermen_population_coastal_zone` joins `fishermen_populations` with `coastal_zones` on `coastal_zone_id`, answering: "Which coastal zone does each fishermen population belong to, and what is that zone's profile?" This is the inverse of `v_fishery_survey_coastal_zone` but at the population level. Population 1000 (`POP-2555`) belongs to coastal zone 100 (`Pilot Series`, Kelantan, latitude 13.95, longitude 21.20, flood vulnerability index 14.95). Population 1003 (`POP-2558`) belongs to coastal zone 103 (`Adaptive Corridor`, East Johor, latitude 25.80, longitude 33.80, flood vulnerability index 26.80). This view supports demographic analysis stratified by geographic vulnerability.

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

The view `v_fishermen_population_fishery_survey` joins `fishermen_populations` with `fishery_surveys` on `fishery_survey_id`, answering: "Which survey sampled each fishermen population, and what are the survey's operational details?" Population 1000 (`POP-2555`) was sampled by survey 100 (`SUR-2722`), a planned distributed-sampling effort with 14 respondents running from 2022-09-05 to 2022-09-01. Population 1002 (`POP-2557`) was sampled by survey 102 (`SUR-2724`), a completed pilot-sampling effort with 5 respondents. This view enables the assessment of survey coverage and methodology across populations.

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

The view `v_fishermen_population_environmental_variable_detail` joins `fishermen_populations` with `environmental_variables` through the `populations_variables` junction table, answering: "Which environmental variables are associated with each fishermen population?" This view cross-tabulates human and environmental dimensions. Population 1000 (`POP-2555`) would be linked to variable 1 (`Extended Framework`, `increasing` trend, `low` severity), while population 1003 (`POP-2558`) would be linked to variable 4 (`Distributed Standard`, `volatile` trend, `critical` severity). This supports the analysis of whether populations with different adaptation readiness levels are exposed to different environmental risk profiles.

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

The view `v_environmental_variable_coastal_zone` joins `environmental_variables` with `coastal_zones` on `coastal_zone_id`, answering: "Which coastal zone is each environmental variable associated with, and what is that zone's profile?" Variable 1 (`Extended Framework`) is associated with coastal zone 100 (`Pilot Series`, Kelantan, flood vulnerability index 14.95). Variable 4 (`Distributed Standard`) is associated with coastal zone 103 (`Adaptive Corridor`, East Johor, flood vulnerability index 26.80). This view enables the assessment of whether high-vulnerability zones are being monitored with high-severity environmental variables.

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

The view `v_environmental_variable_fishery_survey` joins `environmental_variables` with `fishery_surveys` on `fishery_survey_id`, answering: "Which survey is each environmental variable associated with, and what are the survey's details?" Variable 1 (`Extended Framework`) is associated with survey 100 (`SUR-2722`, distributed-sampling-66, 14 respondents). Variable 4 (`Distributed Standard`) is associated with survey 103 (`SUR-2725`, extended-sampling-69, 47 respondents). This view supports the analysis of whether certain survey methodologies are more likely to track specific environmental variables.

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

The view `v_environmental_variable_fishermen_population` joins `environmental_variables` with `fishermen_populations` on `fishermen_population_id`, answering: "Which fishermen population is each environmental variable associated with, and what are their characteristics?" Variable 1 (`Extended Framework`, `increasing` trend, `low` severity) is associated with population 1000 (`POP-2555`, registered count 7, low adaptation readiness). Variable 4 (`Distributed Standard`, `volatile` trend, `critical` severity) is associated with population 1003 (`POP-2558`, registered count 6, low adaptation readiness). This view reveals whether populations with similar adaptation readiness levels are exposed to different environmental risk profiles.

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

The view `v_adaptation_intervention_fishermen_population` joins `adaptation_interventions` with `fishermen_populations` on `fishermen_population_id`, answering: "Which adaptation interventions target each fishermen population, and what are their characteristics?" Intervention 1 (`INT-2732`, information provision) targets population 1000 (`POP-2555`), with a budget of 89.53 and proposed status. Intervention 3 (`INT-2734`, infrastructure upgrade) targets population 1002 (`POP-2557`), with a budget of 442.51 and evaluated status. This view supports the analysis of intervention allocation across populations with varying adaptation readiness levels.

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

The view `v_adaptation_intervention_environmental_variable_detail` joins `adaptation_interventions` with `environmental_variables` through the `interventions_variables` junction table, answering: "Which environmental variables are targeted by each adaptation intervention?" This view maps policy responses to environmental challenges. An infrastructure upgrade intervention (INT-2734) targeting population 1002 in coastal zone 102 would be associated with variable 3 (`Baseline Programme`, `stable` trend, `high` severity), indicating that high-severity environmental factors are being addressed by substantial interventions.

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

The view `v_adaptation_intervention_coastal_zone` joins `adaptation_interventions` with `coastal_zones` on `coastal_zone_id`, answering: "Which coastal zone is each adaptation intervention implemented in, and what is that zone's profile?" Intervention 1 (`INT-2732`, information provision) is implemented in coastal zone 100 (`Pilot Series`, Kelantan, flood vulnerability index 14.95). Intervention 4 (`INT-2735`, policy reform) is implemented in coastal zone 103 (`Adaptive Corridor`, East Johor, flood vulnerability index 26.80). This view enables the assessment of whether intervention types and budgets are aligned with zone vulnerability levels.

The schema presented here demonstrates a disciplined approach to normalising a complex coastal fishery domain. Five core entity tables capture the essential concepts—surveys, zones, populations, environmental variables, and interventions—each with attributes that reflect domain-specific semantics and foreign keys that encode binary associations. Four junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys, ensuring that the model remains in third normal form while preserving all domain facts. The fourteen views then materialise domain-specific perspectives by joining the normalised tables, each answering a distinct analytical question about the relationships between entities. This architecture supports both operational queries (e.g., "What surveys are planned in high-vulnerability zones?") and analytical queries (e.g., "Are populations with low adaptation readiness exposed to critical-severity environmental variables?") without requiring ad-hoc joins at query time. The result is a schema that is both structurally sound and semantically rich, faithfully representing the coastal fishery management domain while enabling efficient data access and analysis.