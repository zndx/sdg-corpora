## The Architecture of Population Intelligence

Public administration and epidemiological research depend on a coherent framework for capturing, relating, and interrogating population data across geographic boundaries and time. The system described here organizes census records, demographic statistics, population groupings, health indicators, health surveys, geographic regions, and educational metrics into a unified relational structure. Each table stores a distinct class of observation, and the foreign-key relationships between them enable analysts to trace a single statistic back to its originating census, its associated population group, the geographic region it describes, and the health survey that contextualizes it. The following sections walk through the domain's entities, their interconnections, and the analytical views that synthesize them into actionable intelligence.

**Table `CensusRecord`**

| id | censusYear | totalPopulation | region | dataStatus | recordIdentifier | regionId |
|---|---|---|---|---|---|---|
| 1 | 41 | 38 | distributed-region-12 | preliminary | REC-2395 | 1 |
| 2 | 49 | 3041 | baseline-region-13 | final | REC-2402 | 2 |
| 3 | 57 | 25476 | pilot-region-14 | preliminary | REC-2409 | 3 |
| 4 | 65 | 20 | extended-region-15 | final | REC-2416 | 4 |

The CensusRecord table forms the backbone of the system, anchoring every other dataset to a specific year, population count, and geographic scope. Each row represents a discrete census snapshot identified by a unique record identifier such as REC-2395 or REC-2416. The censusYear column encodes the survey year as a compact integer—values like 41, 49, 57, and 65 appear across the four sample rows—while totalPopulation records the headcount for that period, ranging from a modest 20 in the extended-region-15 entry to a substantial 25,476 in the pilot-region-14 entry. The dataStatus field distinguishes between preliminary and final records, with REC-2395 and REC-2409 marked preliminary and REC-2402 and REC-2416 marked final, signaling the maturity of each dataset. The region column provides a human-readable label for the area covered, and regionId ties the record to its canonical entry in the GeographicRegion table.

**Table `GeographicRegion`**

| id | regionName | regionCode | populationDensity | areaSqKm | administrativeLevel | surveyId |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | 1562837 | 15.70 | 15.45 | extended-administ-33 | 1 |
| 2 | Adaptive Survey D | 6564391 | 19.40 | 17.90 | integrated-administ-34 | 2 |
| 3 | Primary Corridor | 778560 | 23.10 | 20.35 | seasonal-administ-35 | 3 |
| 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c | 26.80 | 22.80 | regional-administ-36 | 4 |

GeographicRegion defines the spatial units within which all population and health observations are made. Each region carries a descriptive name—Distributed Assessment, Adaptive Survey D, Primary Corridor, and Composite Series—alongside a regionCode that serves as a machine-readable key. The sample data shows regionCodes ranging from numeric identifiers like 1562837 and 6564391 to a longer hexadecimal string, 8667ec1da10c4a0293d91388b49bc77c, for the Composite Series region. Population density is captured in populationDensity, with values from 15.70 in the Distributed Assessment to 26.80 in the Composite Series, while areaSqKm records the land area in square kilometers, spanning 15.45 to 22.80. The administrativeLevel column classifies each region by its governance tier, using labels such as extended-administ-33 and regional-administ-36. A surveyId column links each geographic region to a specific HealthSurvey, establishing the first bridge between spatial and health data.

**Table `DemographicStatistic`**

| statisticId | statisticType | value | unit | year | region | recordId | groupId |
|---|---|---|---|---|---|---|---|
| 1 | primary-statisti-52 | 19.95 | distributed-unit-18 | 12 | distributed-region-12 | 1 | 1 |
| 2 | adaptive-statisti-53 | 21.90 | baseline-unit-19 | 21 | baseline-region-13 | 2 | 2 |
| 3 | distributed-statisti-54 | 23.85 | pilot-unit-20 | 30 | pilot-region-14 | 3 | 3 |
| 4 | baseline-statisti-55 | 25.80 | extended-unit-21 | 39 | extended-region-15 | 4 | 4 |

DemographicStatistic stores quantitative measurements derived from census observations. Each row is identified by a statisticId and classified by statisticType, with values like primary-statisti-52, adaptive-statisti-53, distributed-statisti-54, and baseline-statisti-55 appearing in the sample data. The value column holds the numeric measurement—19.95, 21.90, 23.85, and 25.80 in the four rows—while unit provides the measurement scale, such as distributed-unit-18 or baseline-unit-19. The year column records when the statistic was computed, with values 12, 21, 30, and 39, and region repeats the geographic label for quick reference. Crucially, recordId and groupId create foreign-key links: recordId points to the CensusRecord from which the statistic was derived, and groupId points to the PopulationGroup to which the statistic pertains.

**Table `PopulationGroup`**

| id | groupName | ageRangeStart | ageRangeEnd | totalCount | percentageOfTotal | regionId | indicatorId |
|---|---|---|---|---|---|---|---|
| 1 | Baseline Corridor D | 34 | 19 | 57 | 13.45 | 1 | 100 |
| 2 | Distributed Series | 37 | 26 | 7 | 16.90 | 2 | 101 |
| 3 | Adaptive Assessment | 40 | 33 | 6 | 20.35 | 3 | 102 |
| 4 | Primary Survey A | 43 | 40 | 0 | 23.80 | 4 | 103 |

PopulationGroup segments the total population into meaningful subgroups for granular analysis. Each group has a descriptive name—Baseline Corridor D, Distributed Series, Adaptive Assessment, and Primary Survey A—along with an age range defined by ageRangeStart and ageRangeEnd. The sample data shows age ranges such as 34 to 19 for Baseline Corridor D and 43 to 40 for Primary Survey A, reflecting the specific cohort definitions used in each region. totalCount records the number of individuals in the group, ranging from 57 in Baseline Corridor D down to 0 in Primary Survey A, while percentageOfTotal expresses the group's share of the overall population, from 13.45 percent to 23.80 percent. The regionId column ties the group to its GeographicRegion, and indicatorId links it to a HealthIndicator, creating a direct path from demographic segmentation to health outcomes.

**Table `HealthIndicator`**

| id | indicatorName | percentage | year | region | dataSource | groupId | surveyId |
|---|---|---|---|---|---|---|---|
| 100 | Compact Survey | 5.70 | 12 | distributed-region-12 | pilot-data-38 | 1 | 1 |
| 101 | Legacy Corridor | 10.40 | 21 | baseline-region-13 | extended-data-39 | 2 | 2 |
| 102 | Regional Series A | 15.10 | 30 | pilot-region-14 | integrated-data-40 | 3 | 3 |
| 103 | Seasonal Assessment | 19.80 | 39 | extended-region-15 | seasonal-data-41 | 4 | 4 |

HealthIndicator captures health-related metrics associated with specific population groups and surveys. The indicatorName column provides a label for each metric—Compact Survey, Legacy Corridor, Regional Series A, and Seasonal Assessment in the sample data. The percentage column holds the measured value, ranging from 5.70 for Compact Survey to 19.80 for Seasonal Assessment. The year column records the observation year, with values 12, 21, 30, and 39, and region provides the geographic context. The dataSource column identifies where the data originated, using labels such as pilot-data-38, extended-data-39, integrated-data-40, and seasonal-data-41. The groupId column links the indicator to its PopulationGroup, and surveyId links it to its HealthSurvey, enabling analysts to trace a health metric back through both the population segment and the survey instrument that produced it.

**Table `HealthSurvey`**

| id | surveyName | surveyYear | issuingBody | sampleSize | status | regionId |
|---|---|---|---|---|---|---|
| 1 | Composite Protocol | 9 | baseline-issuing-13 | 31 | completed | 1 |
| 2 | Compact Programme A | 15 | pilot-issuing-14 | 38 | ongoing | 2 |
| 3 | Legacy Standard | 21 | extended-issuing-15 | 45 | completed | 3 |
| 4 | Regional Framework | 27 | integrated-issuing-16 | 52 | ongoing | 4 |

HealthSurvey documents the survey instruments and studies that generate health data. Each survey has a surveyName—Composite Protocol, Compact Programme A, Legacy Standard, and Regional Framework—along with a surveyYear indicating when the survey was conducted, with values 9, 15, 21, and 27. The issuingBody column names the organization responsible, using identifiers like baseline-issuing-13 and integrated-issuing-16. sampleSize records the number of participants, ranging from 31 in the Composite Protocol to 52 in the Regional Framework. The status column indicates whether the survey is completed or ongoing, with Composite Protocol and Legacy Standard marked completed and Compact Programme A and Regional Framework marked ongoing. The regionId column ties each survey to its GeographicRegion, ensuring that health data is always anchored to a spatial unit.

**Table `EducationalEnrollment`**

| enrollmentId | academicYear | totalStudents | femalePercentage | region | schoolStage | regionId | countId |
|---|---|---|---|---|---|---|---|
| 100 | legacy-academic-43 | 11 | 9.45 | distributed-region-12 | primary | 1 | 1 |
| 101 | compact-academic-44 | 2791 | 11.90 | baseline-region-13 | secondary | 2 | 2 |
| 102 | composite-academic-45 | 14 | 14.35 | pilot-region-14 | basic | 3 | 3 |
| 103 | primary-academic-46 | 12 | 16.80 | extended-region-15 | primary | 4 | 4 |

**Table `TeacherCount`**

| countId | academicYear | totalTeachers | malePercentage | femalePercentage | region | regionId | enrollmentId |
|---|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 46 | 19.70 | 9.45 | distributed-region-12 | 1 | 100 |
| 2 | compact-academic-44 | 21 | 21.40 | 11.90 | baseline-region-13 | 2 | 101 |
| 3 | composite-academic-45 | 1 | 23.10 | 14.35 | pilot-region-14 | 3 | 102 |
| 4 | primary-academic-46 | 43 | 24.80 | 16.80 | extended-region-15 | 4 | 103 |

The EducationalEnrollment and TeacherCount tables extend the domain into the education sector, providing parallel demographic and resource metrics that can be analyzed alongside health and census data. While the specific row values for these tables follow the same relational patterns as the other entities, their presence in the schema signals that the system supports cross-sector analysis, enabling comparisons between educational access, teacher availability, and health outcomes within the same geographic regions.

**Table `CensusRecordDemographicStatistic`**

| recordId | statisticId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The CensusRecordDemographicStatistic junction table resolves the many-to-many relationship between census records and demographic statistics. In practice, a single census record may give rise to multiple demographic statistics, and a statistic may be referenced across multiple census records. This table stores the pairing keys that link CensusRecord.id to DemographicStatistic.statisticId, ensuring that every statistic can be traced back to its census origin and vice versa.

**Table `HealthSurveyHealthIndicator`**

| surveyId | indicatorId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Similarly, the HealthSurveyHealthIndicator junction table connects health surveys to the health indicators they produce. A single survey may generate multiple health indicators, and an indicator may be measured across multiple surveys. This table stores the surveyId and indicatorId pairings that enable analysts to reconstruct which indicators were measured under which survey conditions.

**Table `GeographicRegionPopulationGroup`**

| regionId | groupId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The GeographicRegionPopulationGroup junction table links geographic regions to the population groups they contain. A region may encompass multiple population groups, and a population group may be defined across multiple regions. This table stores the regionId and groupId pairings that support spatial queries about population composition.

## Analytical Views and Their Interpretations

The system provides a suite of views that join these base tables into analytical constructs, each answering a specific class of question about the data.

**View `v_census_record_geographic_region`**

```sql
CREATE VIEW v_census_record_geographic_region AS
SELECT a.id, a.censusYear, a.totalPopulation, a.region, b.id AS region_id, b.regionName AS region_regionName, b.regionCode AS region_regionCode
FROM CensusRecord a JOIN GeographicRegion b ON a.regionId = b.id;
```

| id | censusYear | totalPopulation | region | region_id | region_regionName | region_regionCode |
|---|---|---|---|---|---|---|
| 1 | 41 | 38 | distributed-region-12 | 1 | Distributed Assessment | 1562837 |
| 2 | 49 | 3041 | baseline-region-13 | 2 | Adaptive Survey D | 6564391 |
| 3 | 57 | 25476 | pilot-region-14 | 3 | Primary Corridor | 778560 |
| 4 | 65 | 20 | extended-region-15 | 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c |

This view joins CensusRecord with GeographicRegion on regionId, producing a unified record that combines census-level observations with their geographic context. A row from this view might show REC-2395 from censusYear 41 with a totalPopulation of 38, alongside the Distributed Assessment region's populationDensity of 15.70 and areaSqKm of 15.45. This join answers the question of how census observations map to their spatial units, enabling analysts to correlate population counts with geographic characteristics.

**View `v_census_record_demographic_statistic_detail`**

```sql
CREATE VIEW v_census_record_demographic_statistic_detail AS
SELECT a.id, a.censusYear, a.totalPopulation, b.statisticId AS statistic_statisticId, b.statisticType AS statistic_statisticType, b.value AS statistic_value
FROM CensusRecord a
  JOIN CensusRecordDemographicStatistic j ON j.recordId = a.id
  JOIN DemographicStatistic b ON b.statisticId = j.statisticId;
```

| id | censusYear | totalPopulation | statistic_statisticId | statistic_statisticType | statistic_value |
|---|---|---|---|---|---|
| 1 | 41 | 38 | 1 | primary-statisti-52 | 19.95 |
| 1 | 41 | 38 | 2 | adaptive-statisti-53 | 21.90 |
| 2 | 49 | 3041 | 2 | adaptive-statisti-53 | 21.90 |
| 2 | 49 | 3041 | 3 | distributed-statisti-54 | 23.85 |
| 3 | 57 | 25476 | 3 | distributed-statisti-54 | 23.85 |
| 3 | 57 | 25476 | 4 | baseline-statisti-55 | 25.80 |
| 4 | 65 | 20 | 4 | baseline-statisti-55 | 25.80 |
| 4 | 65 | 20 | 1 | primary-statisti-52 | 19.95 |

By joining CensusRecord with CensusRecordDemographicStatistic and DemographicStatistic, this view produces a detailed record that links a census snapshot to its derived statistics. A representative row might pair REC-2402 (censusYear 49, totalPopulation 3041) with the adaptive-statisti-53 statistic valued at 21.90 in baseline-unit-19. This view answers the question of which statistics were derived from which census records, providing a traceable audit path from raw census data to computed metrics.

**View `v_demographic_statistic_census_record`**

```sql
CREATE VIEW v_demographic_statistic_census_record AS
SELECT a.statisticId, a.statisticType, a.value, a.unit, b.id AS record_id, b.censusYear AS record_censusYear, b.totalPopulation AS record_totalPopulation
FROM DemographicStatistic a JOIN CensusRecord b ON a.recordId = b.id;
```

| statisticId | statisticType | value | unit | record_id | record_censusYear | record_totalPopulation |
|---|---|---|---|---|---|---|
| 1 | primary-statisti-52 | 19.95 | distributed-unit-18 | 1 | 41 | 38 |
| 2 | adaptive-statisti-53 | 21.90 | baseline-unit-19 | 2 | 49 | 3041 |
| 3 | distributed-statisti-54 | 23.85 | pilot-unit-20 | 3 | 57 | 25476 |
| 4 | baseline-statisti-55 | 25.80 | extended-unit-21 | 4 | 65 | 20 |

This view reverses the perspective of the previous join, presenting DemographicStatistic alongside its originating CensusRecord. A row might show the distributed-statisti-54 statistic (value 23.85, year 30) linked to REC-2409 (censusYear 57, totalPopulation 25476). This view is useful when the analyst starts with a statistic and needs to understand the census context from which it was derived.

**View `v_demographic_statistic_population_group`**

```sql
CREATE VIEW v_demographic_statistic_population_group AS
SELECT a.statisticId, a.statisticType, a.value, a.unit, b.id AS group_id, b.groupName AS group_groupName, b.ageRangeStart AS group_ageRangeStart
FROM DemographicStatistic a JOIN PopulationGroup b ON a.groupId = b.id;
```

| statisticId | statisticType | value | unit | group_id | group_groupName | group_ageRangeStart |
|---|---|---|---|---|---|---|
| 1 | primary-statisti-52 | 19.95 | distributed-unit-18 | 1 | Baseline Corridor D | 34 |
| 2 | adaptive-statisti-53 | 21.90 | baseline-unit-19 | 2 | Distributed Series | 37 |
| 3 | distributed-statisti-54 | 23.85 | pilot-unit-20 | 3 | Adaptive Assessment | 40 |
| 4 | baseline-statisti-55 | 25.80 | extended-unit-21 | 4 | Primary Survey A | 43 |

Joining DemographicStatistic with GeographicRegionPopulationGroup and PopulationGroup, this view connects statistics to the population groups they describe. A row might pair the baseline-statisti-55 statistic (value 25.80) with the Primary Survey A group (age range 43 to 40, totalCount 0, percentageOfTotal 23.80). This view answers the question of which population segments are associated with which demographic measurements.

**View `v_population_group_geographic_region`**

```sql
CREATE VIEW v_population_group_geographic_region AS
SELECT a.id, a.groupName, a.ageRangeStart, a.ageRangeEnd, b.id AS region_id, b.regionName AS region_regionName, b.regionCode AS region_regionCode
FROM PopulationGroup a JOIN GeographicRegion b ON a.regionId = b.id;
```

| id | groupName | ageRangeStart | ageRangeEnd | region_id | region_regionName | region_regionCode |
|---|---|---|---|---|---|---|
| 1 | Baseline Corridor D | 34 | 19 | 1 | Distributed Assessment | 1562837 |
| 2 | Distributed Series | 37 | 26 | 2 | Adaptive Survey D | 6564391 |
| 3 | Adaptive Assessment | 40 | 33 | 3 | Primary Corridor | 778560 |
| 4 | Primary Survey A | 43 | 40 | 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c |

This view joins PopulationGroup with GeographicRegionPopulationGroup and GeographicRegion, producing a spatially aware view of population segments. A row might show the Baseline Corridor D group (totalCount 57, percentageOfTotal 13.45) linked to the Distributed Assessment region (populationDensity 15.70, areaSqKm 15.45). This view answers the question of where each population group is located and what the geographic characteristics of that location are.

**View `v_population_group_health_indicator`**

```sql
CREATE VIEW v_population_group_health_indicator AS
SELECT a.id, a.groupName, a.ageRangeStart, a.ageRangeEnd, b.id AS indicator_id, b.indicatorName AS indicator_indicatorName, b.percentage AS indicator_percentage
FROM PopulationGroup a JOIN HealthIndicator b ON a.indicatorId = b.id;
```

| id | groupName | ageRangeStart | ageRangeEnd | indicator_id | indicator_indicatorName | indicator_percentage |
|---|---|---|---|---|---|---|
| 1 | Baseline Corridor D | 34 | 19 | 100 | Compact Survey | 5.70 |
| 2 | Distributed Series | 37 | 26 | 101 | Legacy Corridor | 10.40 |
| 3 | Adaptive Assessment | 40 | 33 | 102 | Regional Series A | 15.10 |
| 4 | Primary Survey A | 43 | 40 | 103 | Seasonal Assessment | 19.80 |

By joining PopulationGroup with HealthIndicator through the indicatorId foreign key, this view connects demographic segments to their associated health metrics. A row might pair the Distributed Series group (totalCount 7, percentageOfTotal 16.90) with the Legacy Corridor health indicator (percentage 10.40, year 21). This view answers the question of which health outcomes are associated with which population segments.

**View `v_health_indicator_population_group`**

```sql
CREATE VIEW v_health_indicator_population_group AS
SELECT a.id, a.indicatorName, a.percentage, a.year, b.id AS group_id, b.groupName AS group_groupName, b.ageRangeStart AS group_ageRangeStart
FROM HealthIndicator a JOIN PopulationGroup b ON a.groupId = b.id;
```

| id | indicatorName | percentage | year | group_id | group_groupName | group_ageRangeStart |
|---|---|---|---|---|---|---|
| 100 | Compact Survey | 5.70 | 12 | 1 | Baseline Corridor D | 34 |
| 101 | Legacy Corridor | 10.40 | 21 | 2 | Distributed Series | 37 |
| 102 | Regional Series A | 15.10 | 30 | 3 | Adaptive Assessment | 40 |
| 103 | Seasonal Assessment | 19.80 | 39 | 4 | Primary Survey A | 43 |

This view reverses the perspective, presenting HealthIndicator alongside its associated PopulationGroup. A row might show the Compact Survey indicator (percentage 5.70, dataSource pilot-data-38) linked to the Baseline Corridor D group (age range 34 to 19, totalCount 57). This view is useful when the analyst starts with a health metric and needs to understand the population segment it describes.

**View `v_health_indicator_health_survey`**

```sql
CREATE VIEW v_health_indicator_health_survey AS
SELECT a.id, a.indicatorName, a.percentage, a.year, b.id AS survey_id, b.surveyName AS survey_surveyName, b.surveyYear AS survey_surveyYear
FROM HealthIndicator a JOIN HealthSurvey b ON a.surveyId = b.id;
```

| id | indicatorName | percentage | year | survey_id | survey_surveyName | survey_surveyYear |
|---|---|---|---|---|---|---|
| 100 | Compact Survey | 5.70 | 12 | 1 | Composite Protocol | 9 |
| 101 | Legacy Corridor | 10.40 | 21 | 2 | Compact Programme A | 15 |
| 102 | Regional Series A | 15.10 | 30 | 3 | Legacy Standard | 21 |
| 103 | Seasonal Assessment | 19.80 | 39 | 4 | Regional Framework | 27 |

Joining HealthIndicator with HealthSurveyHealthIndicator and HealthSurvey, this view connects health metrics to the surveys that produced them. A row might pair the Regional Series A indicator (percentage 15.10, year 30) with the Legacy Standard survey (surveyYear 21, sampleSize 45, status completed). This view answers the question of which survey instruments generated which health indicators.

**View `v_health_survey_geographic_region`**

```sql
CREATE VIEW v_health_survey_geographic_region AS
SELECT a.id, a.surveyName, a.surveyYear, a.issuingBody, b.id AS region_id, b.regionName AS region_regionName, b.regionCode AS region_regionCode
FROM HealthSurvey a JOIN GeographicRegion b ON a.regionId = b.id;
```

| id | surveyName | surveyYear | issuingBody | region_id | region_regionName | region_regionCode |
|---|---|---|---|---|---|---|
| 1 | Composite Protocol | 9 | baseline-issuing-13 | 1 | Distributed Assessment | 1562837 |
| 2 | Compact Programme A | 15 | pilot-issuing-14 | 2 | Adaptive Survey D | 6564391 |
| 3 | Legacy Standard | 21 | extended-issuing-15 | 3 | Primary Corridor | 778560 |
| 4 | Regional Framework | 27 | integrated-issuing-16 | 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c |

This view joins HealthSurvey with GeographicRegion on regionId, producing a spatially aware view of survey data. A row might show the Compact Programme A survey (surveyYear 15, issuingBody pilot-issuing-14, sampleSize 38, status ongoing) linked to the Adaptive Survey D region (populationDensity 19.40, areaSqKm 17.90). This view answers the question of which surveys were conducted in which geographic areas.

**View `v_health_survey_health_indicator_detail`**

```sql
CREATE VIEW v_health_survey_health_indicator_detail AS
SELECT a.id, a.surveyName, a.surveyYear, b.id AS indicator_id, b.indicatorName AS indicator_indicatorName, b.percentage AS indicator_percentage
FROM HealthSurvey a
  JOIN HealthSurveyHealthIndicator j ON j.surveyId = a.id
  JOIN HealthIndicator b ON b.id = j.indicatorId;
```

| id | surveyName | surveyYear | indicator_id | indicator_indicatorName | indicator_percentage |
|---|---|---|---|---|---|
| 1 | Composite Protocol | 9 | 100 | Compact Survey | 5.70 |
| 1 | Composite Protocol | 9 | 101 | Legacy Corridor | 10.40 |
| 2 | Compact Programme A | 15 | 101 | Legacy Corridor | 10.40 |
| 2 | Compact Programme A | 15 | 102 | Regional Series A | 15.10 |
| 3 | Legacy Standard | 21 | 102 | Regional Series A | 15.10 |
| 3 | Legacy Standard | 21 | 103 | Seasonal Assessment | 19.80 |
| 4 | Regional Framework | 27 | 103 | Seasonal Assessment | 19.80 |
| 4 | Regional Framework | 27 | 100 | Compact Survey | 5.70 |

By joining HealthSurvey with HealthSurveyHealthIndicator and HealthIndicator, this view produces a detailed record that links a survey to its generated health indicators. A row might pair the Regional Framework survey (surveyYear 27, sampleSize 52) with the Seasonal Assessment indicator (percentage 19.80, dataSource seasonal-data-41). This view answers the question of which specific indicators were measured under which survey conditions.

**View `v_geographic_region_population_group_detail`**

```sql
CREATE VIEW v_geographic_region_population_group_detail AS
SELECT a.id, a.regionName, a.regionCode, b.id AS group_id, b.groupName AS group_groupName, b.ageRangeStart AS group_ageRangeStart
FROM GeographicRegion a
  JOIN GeographicRegionPopulationGroup j ON j.regionId = a.id
  JOIN PopulationGroup b ON b.id = j.groupId;
```

| id | regionName | regionCode | group_id | group_groupName | group_ageRangeStart |
|---|---|---|---|---|---|
| 1 | Distributed Assessment | 1562837 | 1 | Baseline Corridor D | 34 |
| 1 | Distributed Assessment | 1562837 | 2 | Distributed Series | 37 |
| 2 | Adaptive Survey D | 6564391 | 2 | Distributed Series | 37 |
| 2 | Adaptive Survey D | 6564391 | 3 | Adaptive Assessment | 40 |
| 3 | Primary Corridor | 778560 | 3 | Adaptive Assessment | 40 |
| 3 | Primary Corridor | 778560 | 4 | Primary Survey A | 43 |
| 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c | 4 | Primary Survey A | 43 |
| 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c | 1 | Baseline Corridor D | 34 |

Joining GeographicRegion with GeographicRegionPopulationGroup and PopulationGroup, this view produces a detailed record that links a geographic region to its constituent population groups. A row might show the Composite Series region (regionCode 8667ec1da10c4a0293d91388b49bc77c, populationDensity 26.80) linked to the Primary Survey A group (totalCount 0, percentageOfTotal 23.80). This view answers the question of which population groups exist within each geographic region.

**View `v_geographic_region_health_survey`**

```sql
CREATE VIEW v_geographic_region_health_survey AS
SELECT a.id, a.regionName, a.regionCode, a.populationDensity, b.id AS survey_id, b.surveyName AS survey_surveyName, b.surveyYear AS survey_surveyYear
FROM GeographicRegion a JOIN HealthSurvey b ON a.surveyId = b.id;
```

| id | regionName | regionCode | populationDensity | survey_id | survey_surveyName | survey_surveyYear |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | 1562837 | 15.70 | 1 | Composite Protocol | 9 |
| 2 | Adaptive Survey D | 6564391 | 19.40 | 2 | Compact Programme A | 15 |
| 3 | Primary Corridor | 778560 | 23.10 | 3 | Legacy Standard | 21 |
| 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c | 26.80 | 4 | Regional Framework | 27 |

This view joins GeographicRegion with HealthSurvey on regionId, producing a spatially aware view of survey data. A row might show the Primary Corridor region (populationDensity 23.10, areaSqKm 20.35) linked to the Legacy Standard survey (surveyYear 21, sampleSize 45, status completed). This view answers the question of which surveys were conducted in which geographic areas.

**View `v_educational_enrollment_geographic_region`**

```sql
CREATE VIEW v_educational_enrollment_geographic_region AS
SELECT a.enrollmentId, a.academicYear, a.totalStudents, a.femalePercentage, b.id AS region_id, b.regionName AS region_regionName, b.regionCode AS region_regionCode
FROM EducationalEnrollment a JOIN GeographicRegion b ON a.regionId = b.id;
```

| enrollmentId | academicYear | totalStudents | femalePercentage | region_id | region_regionName | region_regionCode |
|---|---|---|---|---|---|---|
| 100 | legacy-academic-43 | 11 | 9.45 | 1 | Distributed Assessment | 1562837 |
| 101 | compact-academic-44 | 2791 | 11.90 | 2 | Adaptive Survey D | 6564391 |
| 102 | composite-academic-45 | 14 | 14.35 | 3 | Primary Corridor | 778560 |
| 103 | primary-academic-46 | 12 | 16.80 | 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c |

This view joins EducationalEnrollment with GeographicRegion, producing a spatially aware view of educational enrollment data. This view answers the question of how educational enrollment figures distribute across geographic regions, enabling analysts to correlate educational access with population density and area.

**View `v_educational_enrollment_teacher_count`**

```sql
CREATE VIEW v_educational_enrollment_teacher_count AS
SELECT a.enrollmentId, a.academicYear, a.totalStudents, a.femalePercentage, b.countId AS count_countId, b.academicYear AS count_academicYear, b.totalTeachers AS count_totalTeachers
FROM EducationalEnrollment a JOIN TeacherCount b ON a.countId = b.countId;
```

| enrollmentId | academicYear | totalStudents | femalePercentage | count_countId | count_academicYear | count_totalTeachers |
|---|---|---|---|---|---|---|
| 100 | legacy-academic-43 | 11 | 9.45 | 1 | legacy-academic-43 | 46 |
| 101 | compact-academic-44 | 2791 | 11.90 | 2 | compact-academic-44 | 21 |
| 102 | composite-academic-45 | 14 | 14.35 | 3 | composite-academic-45 | 1 |
| 103 | primary-academic-46 | 12 | 16.80 | 4 | primary-academic-46 | 43 |

Joining EducationalEnrollment with TeacherCount, this view connects enrollment figures to teacher availability. This view answers the question of the relationship between student enrollment and teacher resources, enabling analysts to assess teacher-to-student ratios and resource allocation.

**View `v_teacher_count_geographic_region`**

```sql
CREATE VIEW v_teacher_count_geographic_region AS
SELECT a.countId, a.academicYear, a.totalTeachers, a.malePercentage, b.id AS region_id, b.regionName AS region_regionName, b.regionCode AS region_regionCode
FROM TeacherCount a JOIN GeographicRegion b ON a.regionId = b.id;
```

| countId | academicYear | totalTeachers | malePercentage | region_id | region_regionName | region_regionCode |
|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 46 | 19.70 | 1 | Distributed Assessment | 1562837 |
| 2 | compact-academic-44 | 21 | 21.40 | 2 | Adaptive Survey D | 6564391 |
| 3 | composite-academic-45 | 1 | 23.10 | 3 | Primary Corridor | 778560 |
| 4 | primary-academic-46 | 43 | 24.80 | 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c |

This view joins TeacherCount with GeographicRegion, producing a spatially aware view of teacher distribution. This view answers the question of how teaching resources are distributed across geographic regions, enabling analysts to correlate teacher availability with population density and area.

**View `v_teacher_count_educational_enrollment`**

```sql
CREATE VIEW v_teacher_count_educational_enrollment AS
SELECT a.countId, a.academicYear, a.totalTeachers, a.malePercentage, b.enrollmentId AS enrollment_enrollmentId, b.academicYear AS enrollment_academicYear, b.totalStudents AS enrollment_totalStudents
FROM TeacherCount a JOIN EducationalEnrollment b ON a.enrollmentId = b.enrollmentId;
```

| countId | academicYear | totalTeachers | malePercentage | enrollment_enrollmentId | enrollment_academicYear | enrollment_totalStudents |
|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 46 | 19.70 | 100 | legacy-academic-43 | 11 |
| 2 | compact-academic-44 | 21 | 21.40 | 101 | compact-academic-44 | 2791 |
| 3 | composite-academic-45 | 1 | 23.10 | 102 | composite-academic-45 | 14 |
| 4 | primary-academic-46 | 43 | 24.80 | 103 | primary-academic-46 | 12 |

This view reverses the perspective of the previous join, presenting TeacherCount alongside its associated EducationalEnrollment. This view is useful when the analyst starts with teacher availability and needs to understand the enrollment context.

## Synthesis

The relational structure described here supports a comprehensive framework for population intelligence. Census records anchor the system to specific years and population counts, while demographic statistics provide computed metrics derived from those records. Population groups segment the total population into analyzable cohorts, health indicators capture health outcomes associated with those cohorts, and health surveys document the instruments that produced the health data. Geographic regions provide the spatial framework within which all observations are made, and the junction tables between CensusRecord, DemographicStatistic, HealthSurvey, HealthIndicator, and GeographicRegionPopulationGroup enable flexible many-to-many relationships that reflect the complexity of real-world data. The educational enrollment and teacher count tables extend the domain into the education sector, enabling cross-sector analysis. Together, these tables and their associated views form a coherent system for capturing, relating, and interrogating population data across geographic boundaries and time, supporting the analytical needs of public administration and epidemiological research.