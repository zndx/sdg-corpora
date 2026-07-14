## Climate Monitoring and Spatial Zones in Fisheries Management

Coastal and inland fishing communities operate within defined geographic zones where environmental conditions directly shape livelihoods, catch patterns, and long-term viability. The records in this system capture a structured picture of those zones, the climate observations collected within them, the fishermen who work them, the reports those fishermen submit, and the adaptation interventions designed to support them. Each entity is tracked with identifiers, timestamps, and status flags that together form a coherent operational ledger. The following sections walk through the domain's core entities, the relationships that bind them, and the analytical views that synthesize the data for decision-making.

**Table `ClimateObservation`**

| observationId | recordedAt | variableType | value | unit | status | zoneId | reportId |
|---|---|---|---|---|---|---|---|
| 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature | 19.95 | distributed-unit-18 | measured | 937724 | 1 |
| 605970 | 2025-08-17T09:23:00 | airTemperature | 21.90 | baseline-unit-19 | estimated | 99504 | 2 |
| 6564399 | 2022-01-01T16:40:00 | rainfall | 23.85 | pilot-unit-20 | projected | 10207142 | 3 |
| 9125614 | 2023-06-12T23:57:00 | windVelocity | 25.80 | extended-unit-21 | measured | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 |

Climate observations form the environmental backbone of the system. Each record captures a single measurement event identified by `observationId`, timestamped in `recordedAt`, and classified by `variableType`. The variable types observed include `seaSurfaceTemperature`, `airTemperature`, `rainfall`, and `windVelocity` — the primary drivers of marine and freshwater ecosystems. The `value` column holds the numeric reading, while `unit` indicates the measurement convention, such as `distributed-unit-18` or `baseline-unit-19`. The `status` field distinguishes between `measured` (directly observed), `estimated` (derived or interpolated), and `projected` (forecast-based) readings.

Every observation is anchored to a spatial context through `zoneId` and, where applicable, a `reportId` linking it to a fisherman's survey. Consider observation `2986222`, recorded on `2024-03-06T02:06:00` with a sea surface temperature of `19.95` in `distributed-unit-18`, marked as `measured` and associated with zone `937724` and report `1`. By contrast, observation `6564399` — a rainfall reading of `23.85` in `pilot-unit-20` — carries a `projected` status, indicating it originates from a forecast model rather than direct instrumentation. These status distinctions matter when downstream analyses weight the reliability of environmental inputs.

**Table `SpatialZone`**

| zoneId | zoneName | region | country | zoneType |
|---|---|---|---|---|
| 937724 | Pilot Series | distributed-region-12 | compact-country-26 | coastal |
| 99504 | Baseline Assessment | baseline-region-13 | composite-country-27 | inland |
| 10207142 | Distributed Survey A | pilot-region-14 | primary-country-28 | oceanic |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | adaptive-country-29 | coastal |

Spatial zones define the geographic and administrative boundaries within which climate observations, fishermen, and interventions are organized. The `zoneId` serves as the primary key, while `zoneName` provides a human-readable label such as `Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, and `Adaptive Corridor`. Each zone is classified by `zoneType` — `coastal`, `inland`, or `oceanic` — and situated within a `region` and `country`, both of which use coded identifiers like `distributed-region-12` and `compact-country-26`.

The zone typology is operationally significant. Coastal zones like `Pilot Series` (`937724`) and `Adaptive Corridor` (`f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`) share environmental characteristics that influence both fishing practices and the types of climate variables monitored. Inland zones such as `Baseline Assessment` (`99504`) and oceanic zones like `Distributed Survey A` (`10207142`) present different monitoring challenges, reflected in the distribution of observation types and the interventions deployed within them.

**Table `Fisherman`**

| id | fishermanId | name | registrationNumber | state | yearsOfExperience | status | zoneId |
|---|---|---|---|---|---|---|---|
| 1 | 11210 | Extended Review | REG-2136 | distributed-state-84 | 7 | active | 937724 |
| 2 | 9085251 | Pilot Initiative A | REG-2142 | baseline-state-85 | 10 | inactive | 99504 |
| 3 | negotiating | Baseline Model | REG-2148 | pilot-state-86 | 13 | retired | 10207142 |
| 4 | 198 | Distributed Cluster | REG-2154 | extended-state-87 | 16 | active | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

Fishermen are the human actors at the center of this domain. Each record carries a system `id`, a `fishermanId` for external identification, a `name`, and a `registrationNumber` such as `REG-2136` or `REG-2142`. The `state` field encodes the administrative jurisdiction — `distributed-state-84`, `baseline-state-85`, and so on — while `yearsOfExperience` quantifies the fisherman's tenure, ranging from `7` to `16` years in the sample data. The `status` column tracks whether a fisherman is `active`, `inactive`, or `retired`.

The `zoneId` column links each fisherman to their operational zone. Fisherman `11210` (named `Extended Review`, registration `REG-2136`) is an `active` fisherman with `7` years of experience operating in zone `937724`. By contrast, fisherman `9085251` (`Pilot Initiative A`, `REG-2142`) is marked `inactive` with `10` years of experience in zone `99504`. These status and experience dimensions are critical for understanding workforce composition and for targeting adaptation interventions.

**Table `FishermanReport`**

| reportId | submissionDate | surveyMethod | responseCount | dataQuality | fishermanId | zoneId |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24 | questionnaire | 0 | high | 1 | 937724 |
| 2 | 2022-09-08 | interview | 10 | medium | 2 | 99504 |
| 3 | 2023-02-19 | focusGroup | 57 | low | 3 | 10207142 |
| 4 | 2024-07-03 | questionnaire | 41 | high | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

Fishermen submit structured reports that document survey activities and observations. Each report is identified by `reportId`, timestamped by `submissionDate`, and classified by `surveyMethod` — `questionnaire`, `interview`, or `focusGroup`. The `responseCount` records how many survey responses were collected, ranging from `0` to `57` in the sample. The `dataQuality` field assesses the report's reliability as `high`, `medium`, or `low`.

Reports are linked to both a `fishermanId` and a `zoneId`, establishing a clear chain of accountability. Report `1`, submitted on `2025-04-24` via `questionnaire` with `0` responses and `high` data quality, was filed by fisherman `1` in zone `937724`. Report `3`, a `focusGroup` submission with `57` responses but `low` data quality, was filed by fisherman `3` in zone `10207142`. The tension between high response counts and lower data quality flags is a recurring operational concern that the system's views help surface.

**Table `AdaptationIntervention`**

| id | interventionId | interventionType | startDate | endDate | status | budget | zoneId |
|---|---|---|---|---|---|---|---|
| 100 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | informationProvision | 2022-09-05 | 2022-09-01 | planned | 35.45 | 937724 |
| 101 | L408 | skillsTraining | 2023-02-16 | 2023-02-12 | active | 18.47 | 99504 |
| 102 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | infrastructureDevelopment | 2024-07-27 | 2024-07-23 | completed | 26.25 | 10207142 |
| 103 | 2618554 | informationProvision | 2025-12-11 | 2025-12-07 | cancelled | 17.12 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

Adaptation interventions represent the programmatic response to climate and livelihood challenges. Each intervention has a system `id`, an `interventionId` for external tracking, an `interventionType` — `informationProvision`, `skillsTraining`, or `infrastructureDevelopment` — and a date range defined by `startDate` and `endDate`. The `status` field tracks the intervention's lifecycle as `planned`, `active`, `completed`, or `cancelled`. The `budget` column records the financial allocation, with values such as `35.45` and `18.47` in the sample data.

Interventions are tied to specific zones via `zoneId`. Intervention `100` (`d64c33f2-8fc1-11eb-924d-9cd76263cbd0`), an `informationProvision` activity with a budget of `35.45`, is `planned` for zone `937724`. Intervention `102` (`eff2857c-8fcb-11eb-924d-9cd76263cbd0`), an `infrastructureDevelopment` project with a budget of `26.25`, has reached `completed` status in zone `10207142`. The variety of intervention types and statuses reflects a portfolio approach to adaptation, with different tools deployed across zones and lifecycle stages.

## Relational Linkages

The domain's entities are connected through junction tables that capture many-to-many relationships. These linkages are essential for understanding which observations belong to which zones, which fishermen operate in which zones, and which interventions target which populations.

**Table `SpatialZoneClimateObservation`**

| zoneId | observationId |
|---|---|
| 937724 | 2986222 |
| 937724 | 605970 |
| 99504 | 605970 |
| 99504 | 6564399 |
| 10207142 | 6564399 |
| 10207142 | 9125614 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 9125614 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2986222 |

The `SpatialZoneClimateObservation` table links climate observations to spatial zones. Each row pairs a `zoneId` with an `observationId`, allowing a single observation to be associated with multiple zones and a single zone to accumulate multiple observations. Zone `937724` is linked to observations `2986222` and `605970`, while zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` is linked to `9125614` and `2986222`. This many-to-many structure supports overlapping monitoring areas and cross-zone environmental analysis.

**Table `SpatialZoneFisherman`**

| zoneId | fishermanId |
|---|---|
| 937724 | 1 |
| 937724 | 2 |
| 99504 | 2 |
| 99504 | 3 |
| 10207142 | 3 |
| 10207142 | 4 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1 |

The `SpatialZoneFisherman` table establishes the relationship between fishermen and the zones they operate in. A fisherman may be associated with multiple zones over time, and a zone may encompass multiple fishermen. This linkage is foundational for understanding workforce distribution and for targeting interventions at the right geographic scale.

**Table `FishermanFishermanReport`**

| fishermanId | reportId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `FishermanFishermanReport` table connects fishermen to their submitted reports. This explicit linkage, separate from the `fishermanId` column in `FishermanReport`, supports scenarios where a fisherman may submit multiple reports or where report attribution requires additional context. It ensures that the chain from fisherman to report to observation is fully traceable.

**Table `FishermanReportClimateObservation`**

| reportId | observationId |
|---|---|
| 1 | 2986222 |
| 1 | 605970 |
| 2 | 605970 |
| 2 | 6564399 |
| 3 | 6564399 |
| 3 | 9125614 |
| 4 | 9125614 |
| 4 | 2986222 |

The `FishermanReportClimateObservation` table links climate observations to the reports under which they were collected. This creates a direct bridge between survey activities and environmental data, enabling analysts to trace which observations were gathered as part of which fisherman's survey effort. It is the key table for understanding the provenance of climate data in the system.

**Table `AdaptationInterventionFisherman`**

| interventionId | fishermanId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `AdaptationInterventionFisherman` table connects adaptation interventions to the fishermen they are designed to support. This linkage allows program managers to track which interventions reach which fishers, enabling impact assessment and resource allocation analysis. It complements the zone-level linkage in `AdaptationIntervention` by adding a human dimension to the programmatic record.

## View-Based Analysis

The system provides a suite of analytical views that join the base tables into interpretable summaries. Each view answers a specific operational question by combining entities across their relationships.

**View `v_climate_observation_spatial_zone`**

```sql
CREATE VIEW v_climate_observation_spatial_zone AS
SELECT a.observationId, a.recordedAt, a.variableType, a.value, b.zoneId AS zone_zoneId, b.zoneName AS zone_zoneName, b.region AS zone_region
FROM ClimateObservation a JOIN SpatialZone b ON a.zoneId = b.zoneId;
```

| observationId | recordedAt | variableType | value | zone_zoneId | zone_zoneName | zone_region |
|---|---|---|---|---|---|---|
| 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature | 19.95 | 937724 | Pilot Series | distributed-region-12 |
| 605970 | 2025-08-17T09:23:00 | airTemperature | 21.90 | 99504 | Baseline Assessment | baseline-region-13 |
| 6564399 | 2022-01-01T16:40:00 | rainfall | 23.85 | 10207142 | Distributed Survey A | pilot-region-14 |
| 9125614 | 2023-06-12T23:57:00 | windVelocity | 25.80 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 |

This view joins climate observations with their spatial zones, answering the question: "What environmental conditions have been recorded in each zone?" A row from this view might show observation `2986222` (sea surface temperature of `19.95`, `measured` status) alongside zone `937724` (`Pilot Series`, `coastal` type). This pairing allows analysts to assess whether coastal zones are adequately monitored across variable types and to compare measurement statuses between zone categories.

**View `v_climate_observation_fisherman_report`**

```sql
CREATE VIEW v_climate_observation_fisherman_report AS
SELECT a.observationId, a.recordedAt, a.variableType, a.value, b.reportId AS report_reportId, b.submissionDate AS report_submissionDate, b.surveyMethod AS report_surveyMethod
FROM ClimateObservation a JOIN FishermanReport b ON a.reportId = b.reportId;
```

| observationId | recordedAt | variableType | value | report_reportId | report_submissionDate | report_surveyMethod |
|---|---|---|---|---|---|---|
| 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature | 19.95 | 1 | 2025-04-24 | questionnaire |
| 605970 | 2025-08-17T09:23:00 | airTemperature | 21.90 | 2 | 2022-09-08 | interview |
| 6564399 | 2022-01-01T16:40:00 | rainfall | 23.85 | 3 | 2023-02-19 | focusGroup |
| 9125614 | 2023-06-12T23:57:00 | windVelocity | 25.80 | 4 | 2024-07-03 | questionnaire |

By linking observations to fisherman reports, this view answers: "Which observations were collected as part of which survey effort?" A representative row could pair observation `605970` (air temperature of `21.90`, `estimated` status) with report `2` (submitted `2022-09-08` via `interview` with `10` responses and `medium` data quality). This view is essential for evaluating the relationship between survey methodology and the quality or type of environmental data produced.

**View `v_spatial_zone_climate_observation_detail`**

```sql
CREATE VIEW v_spatial_zone_climate_observation_detail AS
SELECT a.zoneId, a.zoneName, a.region, b.observationId AS observation_observationId, b.recordedAt AS observation_recordedAt, b.variableType AS observation_variableType
FROM SpatialZone a
  JOIN SpatialZoneClimateObservation j ON j.zoneId = a.zoneId
  JOIN ClimateObservation b ON b.observationId = j.observationId;
```

| zoneId | zoneName | region | observation_observationId | observation_recordedAt | observation_variableType |
|---|---|---|---|---|---|
| 937724 | Pilot Series | distributed-region-12 | 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature |
| 937724 | Pilot Series | distributed-region-12 | 605970 | 2025-08-17T09:23:00 | airTemperature |
| 99504 | Baseline Assessment | baseline-region-13 | 605970 | 2025-08-17T09:23:00 | airTemperature |
| 99504 | Baseline Assessment | baseline-region-13 | 6564399 | 2022-01-01T16:40:00 | rainfall |
| 10207142 | Distributed Survey A | pilot-region-14 | 6564399 | 2022-01-01T16:40:00 | rainfall |
| 10207142 | Distributed Survey A | pilot-region-14 | 9125614 | 2023-06-12T23:57:00 | windVelocity |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | 9125614 | 2023-06-12T23:57:00 | windVelocity |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature |

This view enriches the zone-observation linkage with full zone metadata and observation details. It answers: "What is the complete environmental profile of each zone?" A row might display zone `10207142` (`Distributed Survey A`, `oceanic`, in `pilot-region-14`) alongside observation `6564399` (rainfall of `23.85`, `projected`). The detail-level join supports zone-level environmental profiling and helps identify zones that may need additional monitoring coverage.

**View `v_spatial_zone_fisherman_detail`**

```sql
CREATE VIEW v_spatial_zone_fisherman_detail AS
SELECT a.zoneId, a.zoneName, a.region, b.id AS fisherman_id, b.fishermanId AS fisherman_fishermanId, b.name AS fisherman_name
FROM SpatialZone a
  JOIN SpatialZoneFisherman j ON j.zoneId = a.zoneId
  JOIN Fisherman b ON b.id = j.fishermanId;
```

| zoneId | zoneName | region | fisherman_id | fisherman_fishermanId | fisherman_name |
|---|---|---|---|---|---|
| 937724 | Pilot Series | distributed-region-12 | 1 | 11210 | Extended Review |
| 937724 | Pilot Series | distributed-region-12 | 2 | 9085251 | Pilot Initiative A |
| 99504 | Baseline Assessment | baseline-region-13 | 2 | 9085251 | Pilot Initiative A |
| 99504 | Baseline Assessment | baseline-region-13 | 3 | negotiating | Baseline Model |
| 10207142 | Distributed Survey A | pilot-region-14 | 3 | negotiating | Baseline Model |
| 10207142 | Distributed Survey A | pilot-region-14 | 4 | 198 | Distributed Cluster |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | 4 | 198 | Distributed Cluster |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | 1 | 11210 | Extended Review |

This view joins spatial zones with the fishermen operating within them, answering: "Which fishermen are deployed in each zone, and what is their profile?" A row could show zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` (`Adaptive Corridor`, `coastal`) alongside fisherman `198` (`Distributed Cluster`, `REG-2154`, `active`, `16` years of experience). This view is critical for workforce mapping and for ensuring that zone-level interventions are matched to the right fisher populations.

**View `v_fisherman_spatial_zone`**

```sql
CREATE VIEW v_fisherman_spatial_zone AS
SELECT a.id, a.fishermanId, a.name, a.registrationNumber, b.zoneId AS zone_zoneId, b.zoneName AS zone_zoneName, b.region AS zone_region
FROM Fisherman a JOIN SpatialZone b ON a.zoneId = b.zoneId;
```

| id | fishermanId | name | registrationNumber | zone_zoneId | zone_zoneName | zone_region |
|---|---|---|---|---|---|---|
| 1 | 11210 | Extended Review | REG-2136 | 937724 | Pilot Series | distributed-region-12 |
| 2 | 9085251 | Pilot Initiative A | REG-2142 | 99504 | Baseline Assessment | baseline-region-13 |
| 3 | negotiating | Baseline Model | REG-2148 | 10207142 | Distributed Survey A | pilot-region-14 |
| 4 | 198 | Distributed Cluster | REG-2154 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 |

This view presents the fisherman-to-zone relationship from the fisherman's perspective, answering: "In which zone does each fisherman operate?" A row might pair fisherman `11210` (`Extended Review`, `active`, `7` years) with zone `937724` (`Pilot Series`, `coastal`). This view supports fisherman-level analysis, such as identifying experienced fishermen in specific zone types or tracking the distribution of active versus inactive fishers across zones.

**View `v_fisherman_fisherman_report_detail`**

```sql
CREATE VIEW v_fisherman_fisherman_report_detail AS
SELECT a.id, a.fishermanId, a.name, b.reportId AS report_reportId, b.submissionDate AS report_submissionDate, b.surveyMethod AS report_surveyMethod
FROM Fisherman a
  JOIN FishermanFishermanReport j ON j.fishermanId = a.id
  JOIN FishermanReport b ON b.reportId = j.reportId;
```

| id | fishermanId | name | report_reportId | report_submissionDate | report_surveyMethod |
|---|---|---|---|---|---|
| 1 | 11210 | Extended Review | 1 | 2025-04-24 | questionnaire |
| 1 | 11210 | Extended Review | 2 | 2022-09-08 | interview |
| 2 | 9085251 | Pilot Initiative A | 2 | 2022-09-08 | interview |
| 2 | 9085251 | Pilot Initiative A | 3 | 2023-02-19 | focusGroup |
| 3 | negotiating | Baseline Model | 3 | 2023-02-19 | focusGroup |
| 3 | negotiating | Baseline Model | 4 | 2024-07-03 | questionnaire |
| 4 | 198 | Distributed Cluster | 4 | 2024-07-03 | questionnaire |
| 4 | 198 | Distributed Cluster | 1 | 2025-04-24 | questionnaire |

This view connects fishermen to their reports with full detail on both entities, answering: "What reports has each fisherman submitted, and what are the characteristics of those reports?" A row could display fisherman `9085251` (`Pilot Initiative A`, `inactive`, `10` years) alongside report `2` (`interview`, `10` responses, `medium` data quality). This view is valuable for assessing reporting patterns, identifying fishers who may need support to improve data quality, and understanding the relationship between fisherman status and reporting activity.

**View `v_fisherman_report_fisherman`**

```sql
CREATE VIEW v_fisherman_report_fisherman AS
SELECT a.reportId, a.submissionDate, a.surveyMethod, a.responseCount, b.id AS fisherman_id, b.fishermanId AS fisherman_fishermanId, b.name AS fisherman_name
FROM FishermanReport a JOIN Fisherman b ON a.fishermanId = b.id;
```

| reportId | submissionDate | surveyMethod | responseCount | fisherman_id | fisherman_fishermanId | fisherman_name |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24 | questionnaire | 0 | 1 | 11210 | Extended Review |
| 2 | 2022-09-08 | interview | 10 | 2 | 9085251 | Pilot Initiative A |
| 3 | 2023-02-19 | focusGroup | 57 | 3 | negotiating | Baseline Model |
| 4 | 2024-07-03 | questionnaire | 41 | 4 | 198 | Distributed Cluster |

This view presents the report-to-fisherman linkage, answering: "Which fisherman submitted each report?" A row might show report `3` (`focusGroup`, `57` responses, `low` data quality) linked to fisherman `negotiating` (`Baseline Model`, `REG-2148`, `retired`, `13` years). This perspective is useful for auditing report attribution and for understanding whether retired or inactive fishermen continue to submit reports.

**View `v_fisherman_report_spatial_zone`**

```sql
CREATE VIEW v_fisherman_report_spatial_zone AS
SELECT a.reportId, a.submissionDate, a.surveyMethod, a.responseCount, b.zoneId AS zone_zoneId, b.zoneName AS zone_zoneName, b.region AS zone_region
FROM FishermanReport a JOIN SpatialZone b ON a.zoneId = b.zoneId;
```

| reportId | submissionDate | surveyMethod | responseCount | zone_zoneId | zone_zoneName | zone_region |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24 | questionnaire | 0 | 937724 | Pilot Series | distributed-region-12 |
| 2 | 2022-09-08 | interview | 10 | 99504 | Baseline Assessment | baseline-region-13 |
| 3 | 2023-02-19 | focusGroup | 57 | 10207142 | Distributed Survey A | pilot-region-14 |
| 4 | 2024-07-03 | questionnaire | 41 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 |

This view joins fisherman reports with their associated zones, answering: "In which zone was each report submitted?" A row could pair report `4` (`questionnaire`, `41` responses, `high` data quality) with zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` (`Adaptive Corridor`, `coastal`). This view supports geographic analysis of reporting activity, helping managers identify zones with strong reporting coverage versus those that may be under-surveyed.

**View `v_fisherman_report_climate_observation_detail`**

```sql
CREATE VIEW v_fisherman_report_climate_observation_detail AS
SELECT a.reportId, a.submissionDate, a.surveyMethod, b.observationId AS observation_observationId, b.recordedAt AS observation_recordedAt, b.variableType AS observation_variableType
FROM FishermanReport a
  JOIN FishermanReportClimateObservation j ON j.reportId = a.reportId
  JOIN ClimateObservation b ON b.observationId = j.observationId;
```

| reportId | submissionDate | surveyMethod | observation_observationId | observation_recordedAt | observation_variableType |
|---|---|---|---|---|---|
| 1 | 2025-04-24 | questionnaire | 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature |
| 1 | 2025-04-24 | questionnaire | 605970 | 2025-08-17T09:23:00 | airTemperature |
| 2 | 2022-09-08 | interview | 605970 | 2025-08-17T09:23:00 | airTemperature |
| 2 | 2022-09-08 | interview | 6564399 | 2022-01-01T16:40:00 | rainfall |
| 3 | 2023-02-19 | focusGroup | 6564399 | 2022-01-01T16:40:00 | rainfall |
| 3 | 2023-02-19 | focusGroup | 9125614 | 2023-06-12T23:57:00 | windVelocity |
| 4 | 2024-07-03 | questionnaire | 9125614 | 2023-06-12T23:57:00 | windVelocity |
| 4 | 2024-07-03 | questionnaire | 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature |

This view creates a comprehensive chain from fisherman through report to climate observation, answering: "What observations are linked to each fisherman's survey reports?" A row might connect fisherman `1` (`Extended Review`, `active`) to report `1` (`questionnaire`, `high` quality) to observation `2986222` (sea surface temperature, `19.95`, `measured`). This end-to-end view is the most granular analytical tool in the system, enabling full provenance tracing from fisher to environmental data point.

**View `v_adaptation_intervention_spatial_zone`**

```sql
CREATE VIEW v_adaptation_intervention_spatial_zone AS
SELECT a.id, a.interventionId, a.interventionType, a.startDate, b.zoneId AS zone_zoneId, b.zoneName AS zone_zoneName, b.region AS zone_region
FROM AdaptationIntervention a JOIN SpatialZone b ON a.zoneId = b.zoneId;
```

| id | interventionId | interventionType | startDate | zone_zoneId | zone_zoneName | zone_region |
|---|---|---|---|---|---|---|
| 100 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | informationProvision | 2022-09-05 | 937724 | Pilot Series | distributed-region-12 |
| 101 | L408 | skillsTraining | 2023-02-16 | 99504 | Baseline Assessment | baseline-region-13 |
| 102 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | infrastructureDevelopment | 2024-07-27 | 10207142 | Distributed Survey A | pilot-region-14 |
| 103 | 2618554 | informationProvision | 2025-12-11 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 |

This view links adaptation interventions to their target zones, answering: "Which interventions are deployed in each zone?" A row could display intervention `100` (`informationProvision`, `planned`, budget `35.45`) alongside zone `937724` (`Pilot Series`, `coastal`). This view supports program-level analysis, such as comparing intervention types across zone categories or assessing budget distribution relative to zone characteristics.

**View `v_adaptation_intervention_fisherman_detail`**

```sql
CREATE VIEW v_adaptation_intervention_fisherman_detail AS
SELECT a.id, a.interventionId, a.interventionType, b.id AS fisherman_id, b.fishermanId AS fisherman_fishermanId, b.name AS fisherman_name
FROM AdaptationIntervention a
  JOIN AdaptationInterventionFisherman j ON j.interventionId = a.id
  JOIN Fisherman b ON b.id = j.fishermanId;
```

| id | interventionId | interventionType | fisherman_id | fisherman_fishermanId | fisherman_name |
|---|---|---|---|---|---|
| 100 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | informationProvision | 1 | 11210 | Extended Review |
| 100 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | informationProvision | 2 | 9085251 | Pilot Initiative A |
| 101 | L408 | skillsTraining | 2 | 9085251 | Pilot Initiative A |
| 101 | L408 | skillsTraining | 3 | negotiating | Baseline Model |
| 102 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | infrastructureDevelopment | 3 | negotiating | Baseline Model |
| 102 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | infrastructureDevelopment | 4 | 198 | Distributed Cluster |
| 103 | 2618554 | informationProvision | 4 | 198 | Distributed Cluster |
| 103 | 2618554 | informationProvision | 1 | 11210 | Extended Review |

This view connects adaptation interventions to the fishermen they target, with full detail on both entities, answering: "Which fishermen are the intended beneficiaries of each intervention?" A row might show intervention `101` (`skillsTraining`, `active`, budget `18.47`) linked to a fisherman in zone `99504` (`Baseline Assessment`, `inland`). This view is essential for evaluating intervention reach, ensuring that programmatic resources are directed toward the right fisher populations, and assessing the alignment between intervention types and fisher needs.

## Synthesis

The domain captured by these records describes a structured approach to monitoring climate conditions, documenting fisher activity, and deploying adaptation programs across defined spatial zones. Climate observations provide the environmental signal, spatial zones provide the geographic framework, fishermen provide the human dimension and data collection capacity, reports document survey activities, and adaptation interventions represent the programmatic response. The junction tables bind these entities into a coherent relational structure, while the analytical views synthesize the data into actionable formats. Together, they form an operational infrastructure that supports evidence-based management of fisheries in the face of climate variability.