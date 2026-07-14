The chapter has been written to `/tmp/harness_semantic_2azgn_sq/chapter_ontology_schema.md`.

**Summary of deliverables:**

| Metric | Value |
|---|---|
| Word count | 1,737 (target: 1,500–2,500) |
| TABLE payload blocks | 9 / 9 present |
| VIEW payload blocks | 16 / 16 present |

**Structure:**

1. **Opening paragraph** — frames the domain as a public-sector statistical agency collecting population, demographic, health, and educational data across geographic jurisdictions.

2. **`## The Core Entity Types`** — describes all 8 base tables (`CensusRecord`, `GeographicRegion`, `DemographicStatistic`, `PopulationGroup`, `HealthSurvey`, `HealthIndicator`, `EducationalEnrollment`, `TeacherCount`) with their columns, representative values, and foreign-key relationships.

3. **`## Junction Tables and Many-to-Many Relationships`** — explains the 3 junction tables (`CensusRecordDemographicStatistic`, `HealthSurveyHealthIndicator`, `GeographicRegionPopulationGroup`) and their role in resolving many-to-many associations.

4. **`## Foreign-Key Topology`** — documents the hub-and-spoke FK graph centered on `GeographicRegion`, listing all 11 foreign-key edges.

5. **`## Views: Materialized Joins as Domain Facts`** — 16 subsections (one per view), each explaining what analytical question the join answers and citing 2–3 concrete row values as evidence.

6. **`## Synthesis`** — closes by summarizing the three-axis separation (spatial, temporal, thematic) and the trade-off between update atomicity and query convenience.

## Data appendix

**Table `CensusRecord`**

| id | censusYear | totalPopulation | region | dataStatus | recordIdentifier | regionId |
|---|---|---|---|---|---|---|
| 1 | 41 | 38 | distributed-region-12 | preliminary | REC-2395 | 1 |
| 2 | 49 | 3041 | baseline-region-13 | final | REC-2402 | 2 |
| 3 | 57 | 25476 | pilot-region-14 | preliminary | REC-2409 | 3 |
| 4 | 65 | 20 | extended-region-15 | final | REC-2416 | 4 |

**Table `DemographicStatistic`**

| statisticId | statisticType | value | unit | year | region | recordId | groupId |
|---|---|---|---|---|---|---|---|
| 1 | primary-statisti-52 | 19.95 | distributed-unit-18 | 12 | distributed-region-12 | 1 | 1 |
| 2 | adaptive-statisti-53 | 21.90 | baseline-unit-19 | 21 | baseline-region-13 | 2 | 2 |
| 3 | distributed-statisti-54 | 23.85 | pilot-unit-20 | 30 | pilot-region-14 | 3 | 3 |
| 4 | baseline-statisti-55 | 25.80 | extended-unit-21 | 39 | extended-region-15 | 4 | 4 |

**Table `PopulationGroup`**

| id | groupName | ageRangeStart | ageRangeEnd | totalCount | percentageOfTotal | regionId | indicatorId |
|---|---|---|---|---|---|---|---|
| 1 | Baseline Corridor D | 34 | 19 | 57 | 13.45 | 1 | 100 |
| 2 | Distributed Series | 37 | 26 | 7 | 16.90 | 2 | 101 |
| 3 | Adaptive Assessment | 40 | 33 | 6 | 20.35 | 3 | 102 |
| 4 | Primary Survey A | 43 | 40 | 0 | 23.80 | 4 | 103 |

**Table `HealthIndicator`**

| id | indicatorName | percentage | year | region | dataSource | groupId | surveyId |
|---|---|---|---|---|---|---|---|
| 100 | Compact Survey | 5.70 | 12 | distributed-region-12 | pilot-data-38 | 1 | 1 |
| 101 | Legacy Corridor | 10.40 | 21 | baseline-region-13 | extended-data-39 | 2 | 2 |
| 102 | Regional Series A | 15.10 | 30 | pilot-region-14 | integrated-data-40 | 3 | 3 |
| 103 | Seasonal Assessment | 19.80 | 39 | extended-region-15 | seasonal-data-41 | 4 | 4 |

**Table `HealthSurvey`**

| id | surveyName | surveyYear | issuingBody | sampleSize | status | regionId |
|---|---|---|---|---|---|---|
| 1 | Composite Protocol | 9 | baseline-issuing-13 | 31 | completed | 1 |
| 2 | Compact Programme A | 15 | pilot-issuing-14 | 38 | ongoing | 2 |
| 3 | Legacy Standard | 21 | extended-issuing-15 | 45 | completed | 3 |
| 4 | Regional Framework | 27 | integrated-issuing-16 | 52 | ongoing | 4 |

**Table `GeographicRegion`**

| id | regionName | regionCode | populationDensity | areaSqKm | administrativeLevel | surveyId |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | 1562837 | 15.70 | 15.45 | extended-administ-33 | 1 |
| 2 | Adaptive Survey D | 6564391 | 19.40 | 17.90 | integrated-administ-34 | 2 |
| 3 | Primary Corridor | 778560 | 23.10 | 20.35 | seasonal-administ-35 | 3 |
| 4 | Composite Series | 8667ec1da10c4a0293d91388b49bc77c | 26.80 | 22.80 | regional-administ-36 | 4 |

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
