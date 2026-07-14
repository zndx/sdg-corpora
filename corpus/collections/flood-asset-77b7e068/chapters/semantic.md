The chapter has been written to `/tmp/harness_semantic_ze3578ga/chapter_flood_domain_model.md`. It contains:

- **13 payload blocks** (8 base tables + 5 junction tables), each placed on its own line where the prose introduces that table
- **19 view payload blocks**, each placed after the prose section interpreting that view's join
- **Concrete data values** woven throughout: asset names (*Pilot Programme*, *Adaptive Protocol*), condition scores (`10.70`, `21.80`), vulnerability levels (`Low`, `Critical`), sensor types (`SAR`, `LiDAR`), hazard severities (`Catastrophic`, `Severe`), etc.
- **Section structure**: opening frame → 7.1 Core entity tables → 7.2 Junction tables → 7.3 Analytical views (7 subsections by entity type) → 7.4 Synthesis
- **~2,400 words** of prose explaining the materialisation from ontology to relational schema

## Data appendix

**Table `flood_assets`**

| id | asset_id | asset_name | asset_type | construction_year | design_capacity | is_critical | geographic_zone_id | flood_hazard_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7731874 | Pilot Programme | Levee | 14 | 12.45 | false | 1000 | 1000 |
| 2 | 6564392 | Baseline Standard | Embankment | 21 | 14.90 | true | 1001 | 1001 |
| 3 | 5917296 | Distributed Framework A | PumpingStation | 28 | 17.35 | false | 1002 | 1002 |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | SluiceGate | 35 | 19.80 | true | 1003 | 1003 |

**Table `condition_records`**

| record_id | assessment_date | condition_score | vulnerability_level | defect_type | is_verified | flood_asset_id | earth_observation_data_id | measurement_method_id |
|---|---|---|---|---|---|---|---|---|
| 10449530 | 2022-05-10T04:24:00 | 10.70 | Low | Erosion | true | 1 | 100 | 100 |
| 10445619 | 2023-10-21T11:41:00 | 14.40 | Medium | Cracking | false | 2 | 101 | 101 |
| 9568457 | 2024-03-05T18:58:00 | 18.10 | High | VegetationOvergrowth | true | 3 | 102 | 102 |
| 20743593 | 2025-08-16T01:15:00 | 21.80 | Critical | StructuralFailure | false | 4 | 103 | 103 |

**Table `earth_observation_datas`**

| id | data_product_id | acquisition_date | sensor_type | spatial_resolution | coverage_area | data_quality_index | is_copernicus_source | geographic_zone_id | satellite_mission_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | DAT-2737 | 2023-02-07T01:39:00 | SAR | 19.20 | 20.45 | 8.45 | true | 1000 | 1 |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | Optical | 21.40 | 23.90 | 12.90 | false | 1001 | 2 |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | LiDAR | 23.60 | 27.35 | 17.35 | true | 1002 | 3 |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | Thermal | 25.80 | 30.80 | 21.80 | false | 1003 | 4 |

**Table `geographic_zones`**

| id | zone_id | zone_name | zone_type | area_size | population_density | is_coastal | flood_hazard_id | earth_observation_data_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 937724 | Pilot Series | Catchment | 1.52 | 15.70 | false | 1000 | 100 |
| 1001 | 99504 | Baseline Assessment | District | 0.65 | 19.40 | true | 1001 | 101 |
| 1002 | 10207142 | Distributed Survey A | AssetLocation | 0.43012016 | 23.10 | false | 1002 | 102 |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | UrbanArea | 0.6000001 | 26.80 | true | 1003 | 103 |

**Table `flood_hazards`**

| id | hazard_id | event_date | peak_water_level | duration | hazard_severity | cause_type | geographic_zone_id | record_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3012829 | 2025-04-15T15:21:00 | 11.70 | 4.20 | Minor | RiverOverflow | 1000 | 10449530 |
| 1001 | 103167 | 2022-09-26T22:38:00 | 15.40 | 8.40 | Moderate | CoastalSurge | 1001 | 10445619 |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 19.10 | 12.60 | Severe | SurfaceWater | 1002 | 9568457 |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 22.80 | 16.80 | Catastrophic | DrainageFailure | 1003 | 20743593 |

**Table `satellite_missions`**

| id | mission_id | mission_name | operator | launch_year | orbit_type | is_copernicus_mission | geographic_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | ESA | 41 | SunSynchronous | false | 1000 |
| 2 | 82869 | Pilot Protocol A | NASA | 47 | Geostationary | true | 1001 |
| 3 | 8928505 | Baseline Programme | CNES | 53 | Polar | false | 1002 |
| 4 | 4716411 | Distributed Standard | ISRO | 59 | SunSynchronous | true | 1003 |

**Table `measurement_methods`**

| measurement_method_id | method_id | method_name | method_type | accuracy_level | cost_index | is_automated | flood_asset_id |
|---|---|---|---|---|---|---|---|
| 100 | 209228 | Pilot Assessment | VisualInspection | 22.70 | 19.95 | false | 1 |
| 101 | 7441161 | Baseline Survey | RemoteSensing | 27.40 | 14.58 | true | 2 |
| 102 | 89447 | Distributed Corridor A | GeophysicalSurvey | 32.10 | 47.66 | false | 3 |
| 103 | 4180941 | Adaptive Series | StructuralAnalysis | 36.80 | 27.02 | true | 4 |

**Table `assets_records`**

| flood_asset_id | record_id |
|---|---|
| 1 | 10449530 |
| 1 | 10445619 |
| 2 | 10445619 |
| 2 | 9568457 |
| 3 | 9568457 |
| 3 | 20743593 |
| 4 | 20743593 |
| 4 | 10449530 |

**Table `datas_records`**

| earth_observation_data_id | record_id |
|---|---|
| 100 | 10449530 |
| 100 | 10445619 |
| 101 | 10445619 |
| 101 | 9568457 |
| 102 | 9568457 |
| 102 | 20743593 |
| 103 | 20743593 |
| 103 | 10449530 |

**Table `zones_assets`**

| geographic_zone_id | flood_asset_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `hazards_assets`**

| flood_hazard_id | flood_asset_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `missions_datas`**

| satellite_mission_id | earth_observation_data_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `methods_records`**

| measurement_method_id | record_id |
|---|---|
| 100 | 10449530 |
| 100 | 10445619 |
| 101 | 10445619 |
| 101 | 9568457 |
| 102 | 9568457 |
| 102 | 20743593 |
| 103 | 20743593 |
| 103 | 10449530 |

**View `v_flood_asset_condition_record_detail`**

```sql
CREATE VIEW v_flood_asset_condition_record_detail AS
SELECT a.id, a.asset_id, a.asset_name, b.record_id AS record_record_id, b.assessment_date AS record_assessment_date, b.condition_score AS record_condition_score
FROM flood_assets a
  JOIN assets_records j ON j.flood_asset_id = a.id
  JOIN condition_records b ON b.record_id = j.record_id;
```

| id | asset_id | asset_name | record_record_id | record_assessment_date | record_condition_score |
|---|---|---|---|---|---|
| 1 | 7731874 | Pilot Programme | 10449530 | 2022-05-10T04:24:00 | 10.70 |
| 1 | 7731874 | Pilot Programme | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 2 | 6564392 | Baseline Standard | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 2 | 6564392 | Baseline Standard | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 3 | 5917296 | Distributed Framework A | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 3 | 5917296 | Distributed Framework A | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | 10449530 | 2022-05-10T04:24:00 | 10.70 |

**View `v_flood_asset_geographic_zone`**

```sql
CREATE VIEW v_flood_asset_geographic_zone AS
SELECT a.id, a.asset_id, a.asset_name, a.asset_type, b.id AS zone_id, b.zone_id AS zone_zone_id, b.zone_name AS zone_zone_name
FROM flood_assets a JOIN geographic_zones b ON a.geographic_zone_id = b.id;
```

| id | asset_id | asset_name | asset_type | zone_id | zone_zone_id | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | 7731874 | Pilot Programme | Levee | 1000 | 937724 | Pilot Series |
| 2 | 6564392 | Baseline Standard | Embankment | 1001 | 99504 | Baseline Assessment |
| 3 | 5917296 | Distributed Framework A | PumpingStation | 1002 | 10207142 | Distributed Survey A |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | SluiceGate | 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor |

**View `v_flood_asset_flood_hazard`**

```sql
CREATE VIEW v_flood_asset_flood_hazard AS
SELECT a.id, a.asset_id, a.asset_name, a.asset_type, b.id AS hazard_id, b.hazard_id AS hazard_hazard_id, b.event_date AS hazard_event_date
FROM flood_assets a JOIN flood_hazards b ON a.flood_hazard_id = b.id;
```

| id | asset_id | asset_name | asset_type | hazard_id | hazard_hazard_id | hazard_event_date |
|---|---|---|---|---|---|---|
| 1 | 7731874 | Pilot Programme | Levee | 1000 | 3012829 | 2025-04-15T15:21:00 |
| 2 | 6564392 | Baseline Standard | Embankment | 1001 | 103167 | 2022-09-26T22:38:00 |
| 3 | 5917296 | Distributed Framework A | PumpingStation | 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | SluiceGate | 1003 | 3012826 | 2024-07-21T12:12:00 |

**View `v_condition_record_flood_asset`**

```sql
CREATE VIEW v_condition_record_flood_asset AS
SELECT a.record_id, a.assessment_date, a.condition_score, a.vulnerability_level, b.id AS asset_id, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name
FROM condition_records a JOIN flood_assets b ON a.flood_asset_id = b.id;
```

| record_id | assessment_date | condition_score | vulnerability_level | asset_id | asset_asset_id | asset_asset_name |
|---|---|---|---|---|---|---|
| 10449530 | 2022-05-10T04:24:00 | 10.70 | Low | 1 | 7731874 | Pilot Programme |
| 10445619 | 2023-10-21T11:41:00 | 14.40 | Medium | 2 | 6564392 | Baseline Standard |
| 9568457 | 2024-03-05T18:58:00 | 18.10 | High | 3 | 5917296 | Distributed Framework A |
| 20743593 | 2025-08-16T01:15:00 | 21.80 | Critical | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |

**View `v_condition_record_earth_observation_data`**

```sql
CREATE VIEW v_condition_record_earth_observation_data AS
SELECT a.record_id, a.assessment_date, a.condition_score, a.vulnerability_level, b.id AS data_id, b.data_product_id AS data_data_product_id, b.acquisition_date AS data_acquisition_date
FROM condition_records a JOIN earth_observation_datas b ON a.earth_observation_data_id = b.id;
```

| record_id | assessment_date | condition_score | vulnerability_level | data_id | data_data_product_id | data_acquisition_date |
|---|---|---|---|---|---|---|
| 10449530 | 2022-05-10T04:24:00 | 10.70 | Low | 100 | DAT-2737 | 2023-02-07T01:39:00 |
| 10445619 | 2023-10-21T11:41:00 | 14.40 | Medium | 101 | DAT-2740 | 2024-07-18T08:56:00 |
| 9568457 | 2024-03-05T18:58:00 | 18.10 | High | 102 | DAT-2743 | 2025-12-02T15:13:00 |
| 20743593 | 2025-08-16T01:15:00 | 21.80 | Critical | 103 | DAT-2746 | 2022-05-13T22:30:00 |

**View `v_condition_record_measurement_method`**

```sql
CREATE VIEW v_condition_record_measurement_method AS
SELECT a.record_id, a.assessment_date, a.condition_score, a.vulnerability_level, b.measurement_method_id AS method_measurement_method_id, b.method_id AS method_method_id, b.method_name AS method_method_name
FROM condition_records a JOIN measurement_methods b ON a.measurement_method_id = b.measurement_method_id;
```

| record_id | assessment_date | condition_score | vulnerability_level | method_measurement_method_id | method_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 10449530 | 2022-05-10T04:24:00 | 10.70 | Low | 100 | 209228 | Pilot Assessment |
| 10445619 | 2023-10-21T11:41:00 | 14.40 | Medium | 101 | 7441161 | Baseline Survey |
| 9568457 | 2024-03-05T18:58:00 | 18.10 | High | 102 | 89447 | Distributed Corridor A |
| 20743593 | 2025-08-16T01:15:00 | 21.80 | Critical | 103 | 4180941 | Adaptive Series |

**View `v_earth_observation_data_condition_record_detail`**

```sql
CREATE VIEW v_earth_observation_data_condition_record_detail AS
SELECT a.id, a.data_product_id, a.acquisition_date, b.record_id AS record_record_id, b.assessment_date AS record_assessment_date, b.condition_score AS record_condition_score
FROM earth_observation_datas a
  JOIN datas_records j ON j.earth_observation_data_id = a.id
  JOIN condition_records b ON b.record_id = j.record_id;
```

| id | data_product_id | acquisition_date | record_record_id | record_assessment_date | record_condition_score |
|---|---|---|---|---|---|
| 100 | DAT-2737 | 2023-02-07T01:39:00 | 10449530 | 2022-05-10T04:24:00 | 10.70 |
| 100 | DAT-2737 | 2023-02-07T01:39:00 | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | 10449530 | 2022-05-10T04:24:00 | 10.70 |

**View `v_earth_observation_data_geographic_zone`**

```sql
CREATE VIEW v_earth_observation_data_geographic_zone AS
SELECT a.id, a.data_product_id, a.acquisition_date, a.sensor_type, b.id AS zone_id, b.zone_id AS zone_zone_id, b.zone_name AS zone_zone_name
FROM earth_observation_datas a JOIN geographic_zones b ON a.geographic_zone_id = b.id;
```

| id | data_product_id | acquisition_date | sensor_type | zone_id | zone_zone_id | zone_zone_name |
|---|---|---|---|---|---|---|
| 100 | DAT-2737 | 2023-02-07T01:39:00 | SAR | 1000 | 937724 | Pilot Series |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | Optical | 1001 | 99504 | Baseline Assessment |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | LiDAR | 1002 | 10207142 | Distributed Survey A |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | Thermal | 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor |

**View `v_earth_observation_data_satellite_mission`**

```sql
CREATE VIEW v_earth_observation_data_satellite_mission AS
SELECT a.id, a.data_product_id, a.acquisition_date, a.sensor_type, b.id AS mission_id, b.mission_id AS mission_mission_id, b.mission_name AS mission_mission_name
FROM earth_observation_datas a JOIN satellite_missions b ON a.satellite_mission_id = b.id;
```

| id | data_product_id | acquisition_date | sensor_type | mission_id | mission_mission_id | mission_mission_name |
|---|---|---|---|---|---|---|
| 100 | DAT-2737 | 2023-02-07T01:39:00 | SAR | 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | Optical | 2 | 82869 | Pilot Protocol A |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | LiDAR | 3 | 8928505 | Baseline Programme |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | Thermal | 4 | 4716411 | Distributed Standard |

**View `v_geographic_zone_flood_asset_detail`**

```sql
CREATE VIEW v_geographic_zone_flood_asset_detail AS
SELECT a.id, a.zone_id, a.zone_name, b.id AS asset_id, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name
FROM geographic_zones a
  JOIN zones_assets j ON j.geographic_zone_id = a.id
  JOIN flood_assets b ON b.id = j.flood_asset_id;
```

| id | zone_id | zone_name | asset_id | asset_asset_id | asset_asset_name |
|---|---|---|---|---|---|
| 1000 | 937724 | Pilot Series | 1 | 7731874 | Pilot Programme |
| 1000 | 937724 | Pilot Series | 2 | 6564392 | Baseline Standard |
| 1001 | 99504 | Baseline Assessment | 2 | 6564392 | Baseline Standard |
| 1001 | 99504 | Baseline Assessment | 3 | 5917296 | Distributed Framework A |
| 1002 | 10207142 | Distributed Survey A | 3 | 5917296 | Distributed Framework A |
| 1002 | 10207142 | Distributed Survey A | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | 1 | 7731874 | Pilot Programme |

**View `v_geographic_zone_flood_hazard`**

```sql
CREATE VIEW v_geographic_zone_flood_hazard AS
SELECT a.id, a.zone_id, a.zone_name, a.zone_type, b.id AS hazard_id, b.hazard_id AS hazard_hazard_id, b.event_date AS hazard_event_date
FROM geographic_zones a JOIN flood_hazards b ON a.flood_hazard_id = b.id;
```

| id | zone_id | zone_name | zone_type | hazard_id | hazard_hazard_id | hazard_event_date |
|---|---|---|---|---|---|---|
| 1000 | 937724 | Pilot Series | Catchment | 1000 | 3012829 | 2025-04-15T15:21:00 |
| 1001 | 99504 | Baseline Assessment | District | 1001 | 103167 | 2022-09-26T22:38:00 |
| 1002 | 10207142 | Distributed Survey A | AssetLocation | 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | UrbanArea | 1003 | 3012826 | 2024-07-21T12:12:00 |

**View `v_geographic_zone_earth_observation_data`**

```sql
CREATE VIEW v_geographic_zone_earth_observation_data AS
SELECT a.id, a.zone_id, a.zone_name, a.zone_type, b.id AS data_id, b.data_product_id AS data_data_product_id, b.acquisition_date AS data_acquisition_date
FROM geographic_zones a JOIN earth_observation_datas b ON a.earth_observation_data_id = b.id;
```

| id | zone_id | zone_name | zone_type | data_id | data_data_product_id | data_acquisition_date |
|---|---|---|---|---|---|---|
| 1000 | 937724 | Pilot Series | Catchment | 100 | DAT-2737 | 2023-02-07T01:39:00 |
| 1001 | 99504 | Baseline Assessment | District | 101 | DAT-2740 | 2024-07-18T08:56:00 |
| 1002 | 10207142 | Distributed Survey A | AssetLocation | 102 | DAT-2743 | 2025-12-02T15:13:00 |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | UrbanArea | 103 | DAT-2746 | 2022-05-13T22:30:00 |

**View `v_flood_hazard_flood_asset_detail`**

```sql
CREATE VIEW v_flood_hazard_flood_asset_detail AS
SELECT a.id, a.hazard_id, a.event_date, b.id AS asset_id, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name
FROM flood_hazards a
  JOIN hazards_assets j ON j.flood_hazard_id = a.id
  JOIN flood_assets b ON b.id = j.flood_asset_id;
```

| id | hazard_id | event_date | asset_id | asset_asset_id | asset_asset_name |
|---|---|---|---|---|---|
| 1000 | 3012829 | 2025-04-15T15:21:00 | 1 | 7731874 | Pilot Programme |
| 1000 | 3012829 | 2025-04-15T15:21:00 | 2 | 6564392 | Baseline Standard |
| 1001 | 103167 | 2022-09-26T22:38:00 | 2 | 6564392 | Baseline Standard |
| 1001 | 103167 | 2022-09-26T22:38:00 | 3 | 5917296 | Distributed Framework A |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 3 | 5917296 | Distributed Framework A |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 1 | 7731874 | Pilot Programme |

**View `v_flood_hazard_geographic_zone`**

```sql
CREATE VIEW v_flood_hazard_geographic_zone AS
SELECT a.id, a.hazard_id, a.event_date, a.peak_water_level, b.id AS zone_id, b.zone_id AS zone_zone_id, b.zone_name AS zone_zone_name
FROM flood_hazards a JOIN geographic_zones b ON a.geographic_zone_id = b.id;
```

| id | hazard_id | event_date | peak_water_level | zone_id | zone_zone_id | zone_zone_name |
|---|---|---|---|---|---|---|
| 1000 | 3012829 | 2025-04-15T15:21:00 | 11.70 | 1000 | 937724 | Pilot Series |
| 1001 | 103167 | 2022-09-26T22:38:00 | 15.40 | 1001 | 99504 | Baseline Assessment |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 19.10 | 1002 | 10207142 | Distributed Survey A |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 22.80 | 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor |

**View `v_flood_hazard_condition_record`**

```sql
CREATE VIEW v_flood_hazard_condition_record AS
SELECT a.id, a.hazard_id, a.event_date, a.peak_water_level, b.record_id AS record_record_id, b.assessment_date AS record_assessment_date, b.condition_score AS record_condition_score
FROM flood_hazards a JOIN condition_records b ON a.record_id = b.record_id;
```

| id | hazard_id | event_date | peak_water_level | record_record_id | record_assessment_date | record_condition_score |
|---|---|---|---|---|---|---|
| 1000 | 3012829 | 2025-04-15T15:21:00 | 11.70 | 10449530 | 2022-05-10T04:24:00 | 10.70 |
| 1001 | 103167 | 2022-09-26T22:38:00 | 15.40 | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 19.10 | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 22.80 | 20743593 | 2025-08-16T01:15:00 | 21.80 |

**View `v_satellite_mission_earth_observation_data_detail`**

```sql
CREATE VIEW v_satellite_mission_earth_observation_data_detail AS
SELECT a.id, a.mission_id, a.mission_name, b.id AS data_id, b.data_product_id AS data_data_product_id, b.acquisition_date AS data_acquisition_date
FROM satellite_missions a
  JOIN missions_datas j ON j.satellite_mission_id = a.id
  JOIN earth_observation_datas b ON b.id = j.earth_observation_data_id;
```

| id | mission_id | mission_name | data_id | data_data_product_id | data_acquisition_date |
|---|---|---|---|---|---|
| 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 100 | DAT-2737 | 2023-02-07T01:39:00 |
| 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 101 | DAT-2740 | 2024-07-18T08:56:00 |
| 2 | 82869 | Pilot Protocol A | 101 | DAT-2740 | 2024-07-18T08:56:00 |
| 2 | 82869 | Pilot Protocol A | 102 | DAT-2743 | 2025-12-02T15:13:00 |
| 3 | 8928505 | Baseline Programme | 102 | DAT-2743 | 2025-12-02T15:13:00 |
| 3 | 8928505 | Baseline Programme | 103 | DAT-2746 | 2022-05-13T22:30:00 |
| 4 | 4716411 | Distributed Standard | 103 | DAT-2746 | 2022-05-13T22:30:00 |
| 4 | 4716411 | Distributed Standard | 100 | DAT-2737 | 2023-02-07T01:39:00 |

**View `v_satellite_mission_geographic_zone`**

```sql
CREATE VIEW v_satellite_mission_geographic_zone AS
SELECT a.id, a.mission_id, a.mission_name, a.operator, b.id AS zone_id, b.zone_id AS zone_zone_id, b.zone_name AS zone_zone_name
FROM satellite_missions a JOIN geographic_zones b ON a.geographic_zone_id = b.id;
```

| id | mission_id | mission_name | operator | zone_id | zone_zone_id | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | ESA | 1000 | 937724 | Pilot Series |
| 2 | 82869 | Pilot Protocol A | NASA | 1001 | 99504 | Baseline Assessment |
| 3 | 8928505 | Baseline Programme | CNES | 1002 | 10207142 | Distributed Survey A |
| 4 | 4716411 | Distributed Standard | ISRO | 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor |

**View `v_measurement_method_condition_record_detail`**

```sql
CREATE VIEW v_measurement_method_condition_record_detail AS
SELECT a.measurement_method_id, a.method_id, a.method_name, b.record_id AS record_record_id, b.assessment_date AS record_assessment_date, b.condition_score AS record_condition_score
FROM measurement_methods a
  JOIN methods_records j ON j.measurement_method_id = a.measurement_method_id
  JOIN condition_records b ON b.record_id = j.record_id;
```

| measurement_method_id | method_id | method_name | record_record_id | record_assessment_date | record_condition_score |
|---|---|---|---|---|---|
| 100 | 209228 | Pilot Assessment | 10449530 | 2022-05-10T04:24:00 | 10.70 |
| 100 | 209228 | Pilot Assessment | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 101 | 7441161 | Baseline Survey | 10445619 | 2023-10-21T11:41:00 | 14.40 |
| 101 | 7441161 | Baseline Survey | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 102 | 89447 | Distributed Corridor A | 9568457 | 2024-03-05T18:58:00 | 18.10 |
| 102 | 89447 | Distributed Corridor A | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 103 | 4180941 | Adaptive Series | 20743593 | 2025-08-16T01:15:00 | 21.80 |
| 103 | 4180941 | Adaptive Series | 10449530 | 2022-05-10T04:24:00 | 10.70 |

**View `v_measurement_method_flood_asset`**

```sql
CREATE VIEW v_measurement_method_flood_asset AS
SELECT a.measurement_method_id, a.method_id, a.method_name, a.method_type, b.id AS asset_id, b.asset_id AS asset_asset_id, b.asset_name AS asset_asset_name
FROM measurement_methods a JOIN flood_assets b ON a.flood_asset_id = b.id;
```

| measurement_method_id | method_id | method_name | method_type | asset_id | asset_asset_id | asset_asset_name |
|---|---|---|---|---|---|---|
| 100 | 209228 | Pilot Assessment | VisualInspection | 1 | 7731874 | Pilot Programme |
| 101 | 7441161 | Baseline Survey | RemoteSensing | 2 | 6564392 | Baseline Standard |
| 102 | 89447 | Distributed Corridor A | GeophysicalSurvey | 3 | 5917296 | Distributed Framework A |
| 103 | 4180941 | Adaptive Series | StructuralAnalysis | 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol |
