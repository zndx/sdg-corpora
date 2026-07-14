## Flood Infrastructure Monitoring and Risk Assessment

Modern flood risk management relies on the systematic tracking of hydraulic infrastructure, the continuous assessment of structural conditions, and the integration of satellite-derived environmental observations across defined geographic zones. A flood asset—whether a levee, embankment, pumping station, or sluice gate—serves as the primary unit of accountability. Each asset carries a unique identifier, a construction date, a design capacity expressed in cubic metres per second, and a designation as critical or non-critical. The asset registry also anchors every structure to a geographic zone and a flood hazard profile, creating a three-dimensional view of where protection exists, what it was designed to withstand, and what hazard it is expected to face.

**Table `flood_assets`**

| id | asset_id | asset_name | asset_type | construction_year | design_capacity | is_critical | geographic_zone_id | flood_hazard_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7731874 | Pilot Programme | Levee | 14 | 12.45 | false | 1000 | 1000 |
| 2 | 6564392 | Baseline Standard | Embankment | 21 | 14.90 | true | 1001 | 1001 |
| 3 | 5917296 | Distributed Framework A | PumpingStation | 28 | 17.35 | false | 1002 | 1002 |
| 4 | 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | SluiceGate | 35 | 19.80 | true | 1003 | 1003 |

The asset registry records four representative entries. The Pilot Programme levee (asset ID 7731874), constructed fourteen years before the reference date with a design capacity of 12.45 m³/s, is classified as non-critical and sits within geographic zone 1000 under flood hazard 1000. By contrast, the Baseline Standard embankment (asset ID 6564392), built twenty-one years ago with a higher design capacity of 14.90 m³/s, carries a critical designation and is associated with zone 1001 and hazard 1001. The Distributed Framework A pumping station and the Adaptive Protocol sluice gate follow the same pattern, with design capacities of 17.35 and 19.80 m³/s respectively, and both marked as critical infrastructure.

These assets do not exist in isolation. The junction table that links assets to geographic zones establishes spatial containment, while the junction table that links assets to flood hazards records the expected threat profile. Together they form the backbone of a risk matrix: every asset is simultaneously a physical structure, a spatial entity, and a hazard-exposed element.

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

## Condition Assessment and Defect Tracking

Structural integrity is captured through condition records, each tied to a specific flood asset and dated with an assessment timestamp. A condition record carries a numerical condition score, a categorical vulnerability level ranging from Low to Critical, a defect type, and a verification flag indicating whether the assessment has been independently confirmed. The record also references the earth observation data used during the assessment and the measurement method applied.

**Table `condition_records`**

| record_id | assessment_date | condition_score | vulnerability_level | defect_type | is_verified | flood_asset_id | earth_observation_data_id | measurement_method_id |
|---|---|---|---|---|---|---|---|---|
| 10449530 | 2022-05-10T04:24:00 | 10.70 | Low | Erosion | true | 1 | 100 | 100 |
| 10445619 | 2023-10-21T11:41:00 | 14.40 | Medium | Cracking | false | 2 | 101 | 101 |
| 9568457 | 2024-03-05T18:58:00 | 18.10 | High | VegetationOvergrowth | true | 3 | 102 | 102 |
| 20743593 | 2025-08-16T01:15:00 | 21.80 | Critical | StructuralFailure | false | 4 | 103 | 103 |

The four sample records illustrate a clear progression in degradation. Record 10449530, assessed on 10 May 2022, assigned a condition score of 10.70 to the Pilot Programme levee, classified the vulnerability as Low, and identified Erosion as the defect type; this record is verified. Record 10445619, dated 21 October 2023, scored the Baseline Standard embankment at 14.40 with a Medium vulnerability and Cracking as the defect, but remains unverified. Record 9568457, from 5 March 2024, shows the Distributed Framework A pumping station at a score of 18.10 with High vulnerability and VegetationOvergrowth, and is verified. The most recent entry, 20743593, dated 16 August 2025, assigns the Adaptive Protocol sluice gate a score of 21.80, flags Critical vulnerability and StructuralFailure, and is unverified. The ascending scores and escalating vulnerability categories signal a deterioration trajectory that warrants prioritised intervention.

The measurement methods applied to these assessments are catalogued separately and linked through a junction table, ensuring that the methodology behind each score is traceable and auditable.

**Table `measurement_methods`**

| measurement_method_id | method_id | method_name | method_type | accuracy_level | cost_index | is_automated | flood_asset_id |
|---|---|---|---|---|---|---|---|
| 100 | 209228 | Pilot Assessment | VisualInspection | 22.70 | 19.95 | false | 1 |
| 101 | 7441161 | Baseline Survey | RemoteSensing | 27.40 | 14.58 | true | 2 |
| 102 | 89447 | Distributed Corridor A | GeophysicalSurvey | 32.10 | 47.66 | false | 3 |
| 103 | 4180941 | Adaptive Series | StructuralAnalysis | 36.80 | 27.02 | true | 4 |

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

## Satellite-Derived Environmental Observations

Flood risk monitoring increasingly depends on remote sensing data acquired by satellite missions operating in various orbital configurations. Earth observation data records capture the product identifier, acquisition timestamp, sensor type, spatial resolution, coverage area, and a data quality index. A boolean flag indicates whether the data originates from the Copernicus programme, and each record is associated with a geographic zone and a satellite mission.

**Table `earth_observation_datas`**

| id | data_product_id | acquisition_date | sensor_type | spatial_resolution | coverage_area | data_quality_index | is_copernicus_source | geographic_zone_id | satellite_mission_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | DAT-2737 | 2023-02-07T01:39:00 | SAR | 19.20 | 20.45 | 8.45 | true | 1000 | 1 |
| 101 | DAT-2740 | 2024-07-18T08:56:00 | Optical | 21.40 | 23.90 | 12.90 | false | 1001 | 2 |
| 102 | DAT-2743 | 2025-12-02T15:13:00 | LiDAR | 23.60 | 27.35 | 17.35 | true | 1002 | 3 |
| 103 | DAT-2746 | 2022-05-13T22:30:00 | Thermal | 25.80 | 30.80 | 21.80 | false | 1003 | 4 |

The four sample observation records span sensor technologies from Synthetic Aperture Radar (SAR) to Optical, LiDAR, and Thermal imaging. The SAR-derived product DAT-2737, acquired on 7 February 2023 with a spatial resolution of 19.20 metres and a coverage area of 20.45 square kilometres, carries a data quality index of 8.45 and is sourced from Copernicus. The Optical product DAT-2740, acquired on 18 July 2024, has a coarser resolution of 21.40 metres and a quality index of 12.90, and is not a Copernicus source. The LiDAR product DAT-2743, acquired on 2 December 2025, achieves a resolution of 23.60 metres with a quality index of 17.35 and is Copernicus-sourced. The Thermal product DAT-2746, acquired on 13 May 2022, has the lowest resolution at 25.80 metres and the highest quality index at 21.80, and is not Copernicus-sourced.

These observations are produced by satellite missions operated by space agencies including ESA, NASA, CNES, and ISRO. Each mission is characterised by its name, operator, launch year, orbit type, and Copernicus affiliation.

**Table `satellite_missions`**

| id | mission_id | mission_name | operator | launch_year | orbit_type | is_copernicus_mission | geographic_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | ESA | 41 | SunSynchronous | false | 1000 |
| 2 | 82869 | Pilot Protocol A | NASA | 47 | Geostationary | true | 1001 |
| 3 | 8928505 | Baseline Programme | CNES | 53 | Polar | false | 1002 |
| 4 | 4716411 | Distributed Standard | ISRO | 59 | SunSynchronous | true | 1003 |

Mission 1, the Extended Framework operated by ESA in a Sun-Synchronous orbit since launch year 41, is not a Copernicus mission and is associated with geographic zone 1000. Mission 2, the Pilot Protocol A operated by NASA in a Geostationary orbit since launch year 47, is a Copernicus mission linked to zone 1001. Mission 3, the Baseline Programme operated by CNES in a Polar orbit since launch year 53, is not Copernicus-sourced and relates to zone 1002. Mission 4, the Distributed Standard operated by ISRO in a Sun-Synchronous orbit since launch year 59, is a Copernicus mission associated with zone 1003. The junction table connecting missions to data records ensures that every observation can be traced back to its originating mission.

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

## Geographic Zoning and Spatial Context

Flood risk is inherently spatial. Geographic zones partition the monitored landscape into discrete management areas, each characterised by a zone identifier, a descriptive name, a zone type, an area size, a population density, a coastal designation, and associations with both a flood hazard and an earth observation data record.

**Table `geographic_zones`**

| id | zone_id | zone_name | zone_type | area_size | population_density | is_coastal | flood_hazard_id | earth_observation_data_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 937724 | Pilot Series | Catchment | 1.52 | 15.70 | false | 1000 | 100 |
| 1001 | 99504 | Baseline Assessment | District | 0.65 | 19.40 | true | 1001 | 101 |
| 1002 | 10207142 | Distributed Survey A | AssetLocation | 0.43012016 | 23.10 | false | 1002 | 102 |
| 1003 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Adaptive Corridor | UrbanArea | 0.6000001 | 26.80 | true | 1003 | 103 |

The four sample zones demonstrate the diversity of spatial classifications. Zone 1000, named Pilot Series, is a Catchment-type zone covering 1.52 square kilometres with a population density of 15.70, is not coastal, and is linked to hazard 1000 and observation data 100. Zone 1001, named Baseline Assessment, is a District-type zone with a smaller area of 0.65 square kilometres, a higher population density of 19.40, is designated as coastal, and connects to hazard 1001 and observation data 101. Zone 1002, named Distributed Survey A, is classified as an AssetLocation with an area of 0.43 square kilometres, a population density of 23.10, is not coastal, and links to hazard 1002 and observation data 102. Zone 1003, named Adaptive Corridor, is an UrbanArea covering 0.60 square kilometres with the highest population density at 26.80, is coastal, and connects to hazard 1003 and observation data 103.

The geographic zone serves as the spatial anchor for the entire monitoring framework. Every flood asset, every hazard event, and every earth observation record is ultimately contextualised within one of these zones.

## Flood Hazard Events and Severity Classification

Flood hazards represent the threat dimension of the monitoring system. Each hazard record documents an event date, a peak water level, a duration, a severity classification, and a cause type. The hazard is associated with a geographic zone and a condition record, linking the threat to both a location and a structural assessment.

**Table `flood_hazards`**

| id | hazard_id | event_date | peak_water_level | duration | hazard_severity | cause_type | geographic_zone_id | record_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3012829 | 2025-04-15T15:21:00 | 11.70 | 4.20 | Minor | RiverOverflow | 1000 | 10449530 |
| 1001 | 103167 | 2022-09-26T22:38:00 | 15.40 | 8.40 | Moderate | CoastalSurge | 1001 | 10445619 |
| 1002 | pgc_pyme_551 | 2023-02-10T05:55:00 | 19.10 | 12.60 | Severe | SurfaceWater | 1002 | 9568457 |
| 1003 | 3012826 | 2024-07-21T12:12:00 | 22.80 | 16.80 | Catastrophic | DrainageFailure | 1003 | 20743593 |

The four hazard records show a clear escalation in severity. Hazard 1000, occurring on 15 April 2025, produced a peak water level of 11.70 metres over a duration of 4.20 hours, was classified as Minor, and was caused by RiverOverflow; it is associated with zone 1000 and condition record 10449530. Hazard 1001, on 26 September 2022, reached 15.40 metres over 8.40 hours, was Moderate, caused by CoastalSurge, and links to zone 1001 and condition record 10445619. Hazard 1002, on 10 February 2023, peaked at 19.10 metres over 12.60 hours, was Severe, caused by SurfaceWater, and connects to zone 1002 and condition record 9568457. Hazard 1003, on 21 July 2024, reached 22.80 metres over 16.80 hours, was Catastrophic, caused by DrainageFailure, and links to zone 1003 and condition record 20743593. The progression from Minor to Catastrophic, accompanied by rising water levels and longer durations, underscores the increasing risk profile across the monitored zones.

## Integrated Monitoring Perspectives

The value of the monitoring framework emerges when its components are joined into composite views that answer specific operational questions. Each view synthesises data from multiple base tables to provide a unified perspective on a particular aspect of flood risk management.

The view that details flood asset conditions combines the asset registry with its associated condition records, revealing the structural state of each piece of infrastructure alongside its assessment metadata. Reading the row for the Pilot Programme levee, one sees asset ID 7731874 paired with condition score 10.70, Low vulnerability, and a verified Erosion defect. The row for the Adaptive Protocol sluice gate shows asset ID 990e161e10664c5885182d95dc07e606 with condition score 21.80, Critical vulnerability, and an unverified StructuralFailure defect. This view enables asset managers to prioritise maintenance based on verified condition data.





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

The view that maps flood assets to their geographic zones answers the question of spatial containment: which assets reside in which zones, and what are the characteristics of those zones? The row for the Baseline Standard embankment shows asset ID 6564392 within the Baseline Assessment district (zone 1001), a coastal zone with population density 19.40 and area 0.65 square kilometres. The row for the Distributed Framework A pumping station places asset ID 5917296 in the Distributed Survey A zone (1002), an AssetLocation with population density 23.10.

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

The view that links flood assets to their flood hazards reveals the threat exposure of each structure. The Pilot Programme levee (asset ID 7731874) is exposed to hazard 1000, a Minor RiverOverflow event with peak water level 11.70 metres. The Adaptive Protocol sluice gate (asset ID 990e161e10664c5885182d95dc07e606) faces hazard 1003, a Catastrophic DrainageFailure event with peak water level 22.80 metres. This view is essential for capacity planning: assets with high design capacities facing catastrophic hazards are the highest priority for reinforcement.

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

The reverse perspective—condition records viewed through the lens of their associated flood assets—provides the same information organised from the assessment side. The condition record 10449530 for the Pilot Programme levee shows a verified Low-vulnerability Erosion defect assessed on 10 May 2022. The condition record 20743593 for the Adaptive Protocol sluice gate shows an unverified Critical-vulnerability StructuralFailure defect assessed on 16 August 2025.

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

Condition records can also be examined through their earth observation data linkage. Record 10449530 is associated with observation data 100 (DAT-2737, SAR sensor, Copernicus-sourced), while record 20743593 is associated with observation data 103 (DAT-2746, Thermal sensor, non-Copernicus). This view supports data quality audits by revealing which observation products underpin which assessments.

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

The measurement method perspective on condition records reveals the methodology applied to each assessment. Record 10449530 was assessed using method 100, and record 20743593 used method 103. This linkage ensures methodological consistency and supports the calibration of scoring systems across different assessment campaigns.

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

Earth observation data can be viewed through its condition record associations, revealing which assessments have been informed by which satellite products. Observation data 100 (DAT-2737, SAR, Copernicus) underpins condition record 10449530, while observation data 103 (DAT-2746, Thermal) underpins condition record 20743593. This view is valuable for evaluating the effectiveness of different sensor types in detecting specific defect categories.

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

The geographic zone perspective on earth observation data shows which zones are covered by which observation products. Zone 1000 (Pilot Series, Catchment) is covered by observation data 100, while zone 1003 (Adaptive Corridor, UrbanArea) is covered by observation data 103. This view supports coverage analysis and identifies zones that may require additional satellite monitoring.

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

The satellite mission perspective on earth observation data reveals the provenance of each observation product. Observation data 100 (DAT-2737) originates from mission 1 (Extended Framework, ESA, Sun-Synchronous orbit), while observation data 103 (DAT-2746) originates from mission 4 (Distributed Standard, ISRO, Sun-Synchronous orbit). This view is essential for data governance, ensuring that the quality and calibration of each mission's instruments are properly accounted for in downstream analyses.

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

Geographic zones viewed through their flood asset detail provide a spatial inventory of infrastructure. Zone 1000 contains the Pilot Programme levee, and zone 1001 contains the Baseline Standard embankment. This view supports spatial planning and resource allocation by showing the distribution of critical and non-critical assets across zones.

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

The geographic zone and flood hazard view reveals the threat profile of each zone. Zone 1000 faces hazard 1000 (Minor RiverOverflow), while zone 1003 faces hazard 1003 (Catastrophic DrainageFailure). This view is critical for emergency planning, as it identifies zones where the hazard severity may exceed the protective capacity of existing infrastructure.

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

The geographic zone and earth observation data view shows the monitoring coverage of each zone. Zone 1000 is monitored by observation data 100 (SAR, Copernicus), and zone 1003 is monitored by observation data 103 (Thermal, non-Copernicus). This view supports the evaluation of monitoring adequacy and the identification of data gaps.

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

Flood hazards viewed through their flood asset detail reveal which assets are exposed to which events. Hazard 1000 (Minor RiverOverflow) affects the Pilot Programme levee, while hazard 1003 (Catastrophic DrainageFailure) affects the Adaptive Protocol sluice gate. This view supports risk-based prioritisation of structural upgrades.

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

The flood hazard and geographic zone view provides a spatial context for hazard events. Hazard 1000 (Minor RiverOverflow) occurs in zone 1000 (Pilot Series, Catchment), while hazard 1003 (Catastrophic DrainageFailure) occurs in zone 1003 (Adaptive Corridor, UrbanArea). This view supports the correlation between zone characteristics and hazard severity.

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

The flood hazard and condition record view links threat events to structural assessments. Hazard 1000 is associated with condition record 10449530 (Low vulnerability, Erosion), while hazard 1003 is associated with condition record 20743593 (Critical vulnerability, StructuralFailure). This view enables the evaluation of whether structural conditions are consistent with the severity of past hazard events.

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

Satellite missions viewed through their earth observation data detail reveal the output of each mission. Mission 1 (Extended Framework, ESA) produced observation data 100 (DAT-2737, SAR), while mission 4 (Distributed Standard, ISRO) produced observation data 103 (DAT-2746, Thermal). This view supports mission performance evaluation and the assessment of data product diversity.

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

The satellite mission and geographic zone view shows the spatial coverage of each mission. Mission 1 covers zone 1000, and mission 4 covers zone 1003. This view supports the planning of future mission deployments to ensure adequate spatial coverage of all monitored zones.

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

Measurement methods viewed through their condition record detail reveal the application of each methodology. Method 100 was applied to condition record 10449530, and method 103 was applied to condition record 20743593. This view supports the evaluation of methodological consistency and the identification of opportunities for standardisation.

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

The measurement method and flood asset view links assessment methodologies to the infrastructure they evaluate. Method 100 was used to assess the Pilot Programme levee, and method 103 was used to assess the Adaptive Protocol sluice gate. This view supports the alignment of assessment methods with asset types and criticality levels.

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

## Synthesis

The flood infrastructure monitoring framework integrates five interlocking domains: physical assets, structural conditions, environmental observations, geographic contexts, and hazard events. Each domain is represented by its own set of records, and the junction tables and composite views bind them into a coherent operational picture. The asset registry provides the inventory, the condition records track degradation, the earth observation data supply remote sensing inputs, the geographic zones define spatial boundaries, and the flood hazards document threat events. Together, they enable risk managers to answer questions about asset exposure, assessment quality, monitoring coverage, and prioritisation of interventions. The data values—design capacities ranging from 12.45 to 19.80 m³/s, condition scores from 10.70 to 21.80, peak water levels from 11.70 to 22.80 metres, and hazard severities from Minor to Catastrophic—provide the quantitative basis for decision-making. The satellite missions, operating in Sun-Synchronous, Geostationary, and Polar orbits and operated by agencies including ESA, NASA, CNES, and ISRO, supply the observational foundation. The geographic zones, classified as Catchment, District, AssetLocation, and UrbanArea, provide the spatial framework. This integrated approach ensures that flood risk management is grounded in verifiable data, traceable methodologies, and comprehensive spatial coverage.