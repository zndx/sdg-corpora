The coastal and inland fishing communities of the domain operate under a structured data model that captures environmental monitoring, fisher activity, and climate adaptation efforts. At its core, the domain revolves around five entity types: `ClimateObservation`, `SpatialZone`, `Fisherman`, `FishermanReport`, and `AdaptationIntervention`. These entities are linked through a network of many-to-many relationships materialized as junction tables, and their normalized form is exposed to analysts through a set of twelve denormalized views. The model reflects a real-world scenario in which climate data is collected across geographic zones, reported by registered fishers, and used to inform adaptation interventions.

## Entity Types and Their Attributes

The domain's primary entities each carry a distinct identifier and a set of descriptive attributes.

**Table `ClimateObservation`**

| observationId | recordedAt | variableType | value | unit | status | zoneId | reportId |
|---|---|---|---|---|---|---|---|
| 2986222 | 2024-03-06T02:06:00 | seaSurfaceTemperature | 19.95 | distributed-unit-18 | measured | 937724 | 1 |
| 605970 | 2025-08-17T09:23:00 | airTemperature | 21.90 | baseline-unit-19 | estimated | 99504 | 2 |
| 6564399 | 2022-01-01T16:40:00 | rainfall | 23.85 | pilot-unit-20 | projected | 10207142 | 3 |
| 9125614 | 2023-06-12T23:57:00 | windVelocity | 25.80 | extended-unit-21 | measured | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 |

The `ClimateObservation` table records environmental measurements. Each row is identified by `observationId` — a numeric surrogate such as `2986222` or `605970` — and carries a timestamp in `recordedAt`, a `variableType` (e.g. `seaSurfaceTemperature`, `airTemperature`, `rainfall`, `windVelocity`), a numeric `value`, a `unit` string, and a `status` enum (`measured`, `estimated`, `projected`). The observation is contextualized by two foreign keys: `zoneId`, which points to the `SpatialZone` where the measurement was taken, and `reportId`, which links the observation to a `FishermanReport`. For instance, observation `2986222` records a sea surface temperature of `19.95` in `distributed-unit-18` at zone `937724` and report `1`, while observation `9125614` captures a wind velocity of `25.80` at the UUID-named zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`.

**Table `SpatialZone`**

| zoneId | zoneName | region | country | zoneType |
|---|---|---|---|---|
| 937724 | Pilot Series | distributed-region-12 | compact-country-26 | coastal |
| 99504 | Baseline Assessment | baseline-region-13 | composite-country-27 | inland |
| 10207142 | Distributed Survey A | pilot-region-14 | primary-country-28 | oceanic |
| f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | extended-region-15 | adaptive-country-29 | coastal |

The `SpatialZone` table defines geographic areas of interest. Each zone has a `zoneId` (numeric or UUID), a `zoneName` such as `Pilot Series` or `Adaptive Corridor`, a `region`, a `country`, and a `zoneType` (`coastal`, `inland`, or `oceanic`). Zone `937724` is named `Pilot Series`, located in `distributed-region-12` within `compact-country-26`, and classified as `coastal`. Zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` is the `Adaptive Corridor`, an `oceanic` zone in `extended-region-15` and `adaptive-country-29`.

**Table `Fisherman`**

| id | fishermanId | name | registrationNumber | state | yearsOfExperience | status | zoneId |
|---|---|---|---|---|---|---|---|
| 1 | 11210 | Extended Review | REG-2136 | distributed-state-84 | 7 | active | 937724 |
| 2 | 9085251 | Pilot Initiative A | REG-2142 | baseline-state-85 | 10 | inactive | 99504 |
| 3 | negotiating | Baseline Model | REG-2148 | pilot-state-86 | 13 | retired | 10207142 |
| 4 | 198 | Distributed Cluster | REG-2154 | extended-state-87 | 16 | active | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

The `Fisherman` table stores registered fishers. Each row has a surrogate `id`, a business `fishermanId` (numeric or text such as `negotiating`), a `name`, a `registrationNumber` (e.g. `REG-2136`), a `state`, `yearsOfExperience`, a `status` (`active`, `inactive`, `retired`), and a `zoneId` foreign key. Fisher `1` is named `Extended Review`, holds registration `REG-2136`, has `7` years of experience, is `active`, and is assigned to zone `937724`. Fisher `3`, named `Baseline Model`, has `13` years of experience and a `retired` status in zone `10207142`.

**Table `FishermanReport`**

| reportId | submissionDate | surveyMethod | responseCount | dataQuality | fishermanId | zoneId |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24 | questionnaire | 0 | high | 1 | 937724 |
| 2 | 2022-09-08 | interview | 10 | medium | 2 | 99504 |
| 3 | 2023-02-19 | focusGroup | 57 | low | 3 | 10207142 |
| 4 | 2024-07-03 | questionnaire | 41 | high | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

The `FishermanReport` table captures survey submissions. Each report has a `reportId`, a `submissionDate`, a `surveyMethod` (`questionnaire`, `interview`, `focusGroup`), a `responseCount`, a `dataQuality` rating (`high`, `medium`, `low`), a `fishermanId` foreign key, and a `zoneId` foreign key. Report `1` was submitted on `2025-04-24` via `questionnaire` with `0` responses and `high` quality, filed by fisherman `1` in zone `937724`. Report `3` used a `focusGroup` method, collected `57` responses, and has `low` data quality.

**Table `AdaptationIntervention`**

| id | interventionId | interventionType | startDate | endDate | status | budget | zoneId |
|---|---|---|---|---|---|---|---|
| 100 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | informationProvision | 2022-09-05 | 2022-09-01 | planned | 35.45 | 937724 |
| 101 | L408 | skillsTraining | 2023-02-16 | 2023-02-12 | active | 18.47 | 99504 |
| 102 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | infrastructureDevelopment | 2024-07-27 | 2024-07-23 | completed | 26.25 | 10207142 |
| 103 | 2618554 | informationProvision | 2025-12-11 | 2025-12-07 | cancelled | 17.12 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |

The `AdaptationIntervention` table tracks climate adaptation projects. Each intervention has a surrogate `id`, a business `interventionId` (numeric or UUID), an `interventionType` (`informationProvision`, `skillsTraining`, `infrastructureDevelopment`), `startDate` and `endDate`, a `status` (`planned`, `active`, `completed`, `cancelled`), a `budget`, and a `zoneId` foreign key. Intervention `100` is an `informationProvision` project with ID `d64c33f2-8fc1-11eb-924d-9cd76263cbd0`, budget `35.45`, in `planned` status, spanning from `2022-09-05` to `2022-09-01` in zone `937724`. Intervention `101` is a `skillsTraining` project with ID `L408`, budget `18.47`, in `active` status.

## Junction Tables and Many-to-Many Relationships

Several domain relationships are inherently many-to-many and are materialized as junction tables. These tables contain only foreign key columns and enforce the cardinality-bounded associations between their parent entities.

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

The `SpatialZoneClimateObservation` junction table links `SpatialZone` to `ClimateObservation`. Each row pairs a `zoneId` with an `observationId`. Zone `937724` is associated with observations `2986222` and `605970`, while zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` is linked to observations `9125614` and `2986222`. This table allows a single zone to host multiple observations and a single observation to be referenced by multiple zones.

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

The `SpatialZoneFisherman` junction table links `SpatialZone` to `Fisherman`. It enables a fisher to be associated with multiple zones and a zone to contain multiple fishers. The actual rows are not enumerated in the payload, but the schema structure mirrors that of `SpatialZoneClimateObservation`, with `zoneId` and a fisher identifier column.

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

The `FishermanFishermanReport` junction table links `Fisherman` to `FishermanReport`. It allows a fisher to file multiple reports and a report to be attributed to multiple fishers. The schema contains a `fishermanId` and a `reportId` column.

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

The `FishermanReportClimateObservation` junction table links `FishermanReport` to `ClimateObservation`. It enables a report to reference multiple observations and an observation to appear in multiple reports. The schema contains a `reportId` and an `observationId` column.

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

The `AdaptationInterventionFisherman` junction table links `AdaptationIntervention` to `Fisherman`. It allows an intervention to target multiple fishers and a fisher to participate in multiple interventions. The schema contains an `interventionId` and a `fishermanId` column.

## Denormalized Views

The normalized base tables are exposed through a set of views that join the relevant entities into flat, queryable result sets. Each view answers a specific analytical question by reconstructing a domain fact from its constituent tables.

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

The view `v_climate_observation_spatial_zone` joins `ClimateObservation` to `SpatialZone` on `zoneId`, producing a flat record that pairs each observation with its geographic context. A row from this view might show observation `2986222` (sea surface temperature `19.95`) alongside zone `937724` (`Pilot Series`, `coastal`). This view answers the question: "What climate measurement was taken in which zone, and what are the zone's descriptive attributes?"

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

The view `v_climate_observation_fisherman_report` joins `ClimateObservation` to `FishermanReport` on `reportId`, producing a flat record that pairs each observation with the report that references it. A row might show observation `605970` (air temperature `21.90`) alongside report `2` (submitted `2022-09-08` via `interview` with `medium` data quality). This view answers: "Which fisherman report is associated with which climate observation?"

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

The view `v_spatial_zone_climate_observation_detail` joins `SpatialZone` to `ClimateObservation` through the `SpatialZoneClimateObservation` junction table, producing a denormalized detail row that includes both zone attributes and observation attributes in a single row. A row might show zone `937724` (`Pilot Series`, `coastal`) alongside observation `2986222` (sea surface temperature `19.95`, `measured`). This view answers: "For each zone, what are the detailed climate observations recorded there?"

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

The view `v_spatial_zone_fisherman_detail` joins `SpatialZone` to `Fisherman` through the `SpatialZoneFisherman` junction table, producing a flat record that pairs each zone with its associated fishers. A row might show zone `937724` (`Pilot Series`) alongside fisherman `1` (`Extended Review`, `active`, `7` years of experience). This view answers: "Which fishers are associated with each spatial zone?"

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

The view `v_fisherman_spatial_zone` joins `Fisherman` to `SpatialZone` on `zoneId`, producing a flat record that pairs each fisher with their assigned zone. A row might show fisherman `1` (`Extended Review`, `REG-2136`) alongside zone `937724` (`Pilot Series`, `coastal`). This view answers: "For each fisher, which spatial zone are they assigned to?"

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

The view `v_fisherman_fisherman_report_detail` joins `Fisherman` to `FishermanReport` through the `FishermanFishermanReport` junction table, producing a denormalized detail row that includes both fisher and report attributes. A row might show fisherman `1` (`Extended Review`) alongside report `1` (submitted `2025-04-24` via `questionnaire` with `high` data quality). This view answers: "For each fisher, what are the detailed reports they have filed?"

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

The view `v_fisherman_report_fisherman` joins `FishermanReport` to `Fisherman` on `fishermanId`, producing a flat record that pairs each report with the fisher who filed it. A row might show report `1` (questionnaire, `high` quality) alongside fisherman `1` (`Extended Review`, `active`). This view answers: "Which fisher filed each report?"

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

The view `v_fisherman_report_spatial_zone` joins `FishermanReport` to `SpatialZone` on `zoneId`, producing a flat record that pairs each report with the zone it pertains to. A row might show report `1` (submitted `2025-04-24`) alongside zone `937724` (`Pilot Series`, `coastal`). This view answers: "For each report, which spatial zone does it cover?"

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

The view `v_fisherman_report_climate_observation_detail` joins `FishermanReport` to `ClimateObservation` through the `FishermanReportClimateObservation` junction table, producing a denormalized detail row that includes both report and observation attributes. A row might show report `1` (questionnaire, `high` quality) alongside observation `2986222` (sea surface temperature `19.95`, `measured`). This view answers: "For each fisherman report, what are the detailed climate observations it references?"

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

The view `v_adaptation_intervention_spatial_zone` joins `AdaptationIntervention` to `SpatialZone` on `zoneId`, producing a flat record that pairs each intervention with its target zone. A row might show intervention `100` (`informationProvision`, budget `35.45`, `planned`) alongside zone `937724` (`Pilot Series`, `coastal`). This view answers: "For each adaptation intervention, which spatial zone does it target?"

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

The view `v_adaptation_intervention_fisherman_detail` joins `AdaptationIntervention` to `Fisherman` through the `AdaptationInterventionFisherman` junction table, producing a denormalized detail row that includes both intervention and fisher attributes. A row might show intervention `100` (`informationProvision`, budget `35.45`) alongside fisherman `1` (`Extended Review`, `active`). This view answers: "For each adaptation intervention, which fishers are targeted?"

## Synthesis

The domain model is a carefully normalized relational schema that separates concerns into five core entity tables and five junction tables, each enforcing a specific many-to-many relationship. The base tables use surrogate keys (`id`, `observationId`, `reportId`) alongside business identifiers (`fishermanId`, `interventionId`, `zoneId`) to support both internal referential integrity and external traceability. Attributes such as `variableType`, `status`, and `dataQuality` are encoded as categorical values drawn from a constrained vocabulary, while numeric columns like `value`, `budget`, and `responseCount` capture quantitative domain facts. The junction tables — `SpatialZoneClimateObservation`, `SpatialZoneFisherman`, `FishermanFishermanReport`, `FishermanReportClimateObservation`, and `AdaptationInterventionFisherman` — materialize the many-to-many relationships that the entity-relationship model prescribes, ensuring that no data is duplicated across parent rows. The twelve views then reassemble these normalized pieces into flat, analyst-friendly result sets, each answering a distinct question about the intersection of climate data, geographic zones, fisher activity, and adaptation interventions. Together, the tables and views form a complete, queryable representation of the domain, where every row in every view can be traced back to its constituent base tables through explicit foreign-key joins.