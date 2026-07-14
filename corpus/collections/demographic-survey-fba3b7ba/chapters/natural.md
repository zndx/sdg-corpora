## Regional Development Indicators and Cross-Domain Monitoring

National statistical agencies and international development bodies rely on interconnected data streams to track population dynamics, health outcomes, educational attainment, child welfare, and economic hardship across geographic territories. The monitoring infrastructure described here unifies seven distinct record types—demographic surveys, health and mortality records, education enrollments, child labor statistics, poverty indexes, geographic regions, and statistical bureaus—into a coherent observational framework. Each record type captures a slice of societal conditions, and the geographic region identifier serves as the common axis that aligns these slices into a single territorial profile.

**Table `demographic_surveys`**

| demographic_survey_id | survey_id | survey_year | territory | total_population_count | child_population_count | child_population_percentage | under_five_percentage | five_to_nine_percentage | ten_to_fourteen_percentage | fifteen_to_seventeen_percentage | statistical_bureau_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | 9 | primary-territor-58 | 3.95 | 21.45 | 10.95 | 16.95 | 14.70 | 16.70 | 6.20 | 1 | 1000 | 2025-01-01 00:14:00 |
| 2 | 726059 | 15 | adaptive-territor-59 | 6.90 | 25.90 | 12.90 | 19.90 | 17.40 | 20.40 | 10.40 | 2 | 1001 | 2025-02-06 03:14:00 |
| 3 | 32814 | 21 | distributed-territor-60 | 9.85 | 30.35 | 14.85 | 22.85 | 20.10 | 24.10 | 14.60 | 3 | 1002 | 2025-03-11 06:14:00 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 | baseline-territor-61 | 12.80 | 34.80 | 16.80 | 25.80 | 22.80 | 27.80 | 18.80 | 4 | 1003 | 2025-04-16 09:14:00 |

Demographic surveys form the foundational layer of population intelligence. Each survey entry carries a unique survey identifier, a survey year, and a territory designation such as primary-territor-58 or adaptive-territor-59. The surveys quantify total population counts and child population counts, with the child population percentage providing a quick ratio of dependents to the whole. Age-structure breakdowns are captured through five cohorts: under-five, five-to-nine, ten-to-fourteen, and fifteen-to-seventeen percentages. For instance, survey 21005921 from year 9 reports a total population of 3.95 with a child population of 21.45, yielding a child population percentage of 10.95, while the under-five cohort alone accounts for 16.95 percent of the surveyed population. These surveys are attributed to a statistical bureau via the bureau identifier and anchored to a geographic region through the region identifier, enabling downstream joins that layer health, education, labor, and poverty data onto the same territorial footprint.

**Table `health_mortality_records`**

| record_id | cause_of_death | cause_percentage | male_percentage | female_percentage | age_group | record_year | region | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 10449530 | compact-cause-68 | 11.70 | 19.70 | 9.45 | integrated-age-22 | 17 | distributed-region-12 | 1000 |
| 10445619 | composite-cause-69 | 14.40 | 21.40 | 11.90 | seasonal-age-23 | 23 | baseline-region-13 | 1001 |
| 9568457 | primary-cause-70 | 17.10 | 23.10 | 14.35 | regional-age-24 | 29 | pilot-region-14 | 1002 |
| 20743593 | adaptive-cause-71 | 19.80 | 24.80 | 16.80 | legacy-age-25 | 35 | extended-region-15 | 1003 |

Health and mortality records document cause-of-death classifications alongside demographic disaggregation. Each record specifies a cause of death—compact-cause-68, composite-cause-69, primary-cause-70, adaptive-cause-71—along with the proportion of deaths attributable to that cause, split by male and female percentages. Age group categorizations such as integrated-age-22 and seasonal-age-23 allow analysts to isolate mortality patterns within specific life stages. The record year and the associated geographic region link each mortality observation to a point in time and a place. In the baseline-region-13 record, composite-cause-69 accounts for 14.40 percent of deaths, with male and female percentages at 21.40 and 11.90 respectively, recorded in year 23 for the seasonal-age-23 cohort.

**Table `education_enrollments`**

| id | enrollment_id | academic_year | education_level | total_students | dropout_rate | male_dropout_rate | female_dropout_rate | failure_rate | male_failure_rate | female_failure_rate | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447035 | legacy-academic-43 | pilot-educatio-62 | 11 | 10.45 | 11.45 | 18.45 | 4.45 | 14.45 | 10.70 | 1000 | 1 |
| 1001 | gd_taxc_2121 | compact-academic-44 | extended-educatio-63 | 2791 | 14.90 | 13.90 | 22.90 | 7.90 | 16.90 | 14.40 | 1001 | 2 |
| 1002 | id_30 | composite-academic-45 | integrated-educatio-64 | 14 | 19.35 | 16.35 | 27.35 | 11.35 | 19.35 | 18.10 | 1002 | 3 |
| 1003 | b_VB-EC-0 | primary-academic-46 | seasonal-educatio-65 | 12 | 23.80 | 18.80 | 31.80 | 14.80 | 21.80 | 21.80 | 1003 | 4 |

Education enrollment records track student participation and academic outcomes across education levels and academic years. The enrollment identifier, academic year, and education level—pilot-educatio-62, extended-educatio-63, integrated-educatio-64, seasonal-educatio-65—define the scope of each observation. Total student counts range widely, from 11 students in the pilot-educatio-62 level to 2,791 in the extended-educatio-63 level. Dropout and failure rates are reported overall and disaggregated by gender, revealing disparities that inform policy. In the compact-academic-44 enrollment, the overall dropout rate is 14.90 percent, with male and female dropout rates at 13.90 and 22.90 percent respectively, while failure rates stand at 7.90 overall, 16.90 for males, and 14.40 for females. Each enrollment record is tied to a geographic region and a demographic survey, creating a bridge between educational outcomes and the underlying population structure.

**Table `child_labor_statistics`**

| id | labor_stat_id | stat_year | employment_rate | male_employment_rate | female_employment_rate | school_and_work_rate | average_daily_wage | weekly_working_hours | currency_code | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9246333 | 39 | 21.70 | 15.20 | 16.45 | 6.20 | 25.36 | 4.45 | gd_fp_eu_acc3 | 1000 | 1 |
| 101 | 25a77d4360b649cabf445d6bfef346db | 42 | 24.40 | 18.40 | 20.90 | 10.40 | 12.72 | 8.90 | managing-resources | 1001 | 2 |
| 102 | IVC20det40 | 45 | 27.10 | 21.60 | 25.35 | 14.60 | 25.36 | 13.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1002 | 3 |
| 103 | 3718658437 | 48 | 29.80 | 24.80 | 29.80 | 18.80 | 27.02 | 17.80 | 10445649 | 1003 | 4 |

Child labor statistics capture employment prevalence, gender gaps, and working conditions among youth. The labor statistic identifier, stat year, employment rate, and gender-disaggregated employment rates (male_employment_rate and female_employment_rate) provide a snapshot of child labor intensity. The school_and_work_rate indicates the proportion of children simultaneously engaged in education and employment, while average_daily_wage and weekly_working_hours quantify economic conditions. Currency codes such as gd_fp_eu_acc3 and managing-resources standardize wage reporting across jurisdictions. In stat year 39, the employment rate reaches 21.70 percent overall, with male and female rates at 15.20 and 16.45 percent respectively; the school_and_work_rate is 6.20 percent, the average daily wage is 25.36, and weekly working hours total 4.45. These records are linked to both a geographic region and a demographic survey, anchoring labor conditions to population and territorial contexts.

**Table `poverty_indexes`**

| poverty_index_id | index_year | household_poverty_rate | child_poverty_rate | poor_households_with_children_percent | region | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|
| 4277031 | 19 | 1.95 | 15.45 | 18.45 | distributed-region-12 | 1000 | 1 |
| 1204-0009-M | 25 | 3.90 | 18.90 | 21.90 | baseline-region-13 | 1001 | 2 |
| 618 | 31 | 5.85 | 22.35 | 25.35 | pilot-region-14 | 1002 | 3 |
| 48753450 | 37 | 7.80 | 25.80 | 28.80 | extended-region-15 | 1003 | 4 |

Poverty indexes measure household and child deprivation within defined territories. The index year, household_poverty_rate, child_poverty_rate, and poor_households_with_children_percent provide a multidimensional view of economic hardship. In index year 19, the household poverty rate is 1.95 percent while the child poverty rate is 15.45 percent, and 18.45 percent of poor households include children. By index year 37, the household poverty rate has risen to 7.80 percent, the child poverty rate to 25.80 percent, and the share of poor households with children to 28.80 percent, indicating a widening gap. Each poverty index record is associated with a geographic region and a demographic survey, enabling temporal and territorial comparisons.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | country | demographic_survey_id | record_id | education_enrollment_id | child_labor_statistic_id | poverty_index_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 1 | 10449530 | 1000 | 100 | 4277031 | 2025-01-01 00:14:00 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 2 | 10445619 | 1001 | 101 | 1204-0009-M | 2025-02-06 03:14:00 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 3 | 9568457 | 1002 | 102 | 618 | 2025-03-11 06:14:00 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 4 | 20743593 | 1003 | 103 | 48753450 | 2025-04-16 09:14:00 |

Geographic regions serve as the central organizing entity, consolidating identifiers from all other record types into a single territorial profile. Each region carries a geographic region identifier, a region identifier, a human-readable region name such as Distributed Assessment or Adaptive Survey D, and a country designation like compact-country-26 or composite-country-27. The region record includes foreign key references to the demographic survey, health mortality record, education enrollment, child labor statistic, and poverty index that correspond to that territory. This consolidation means that a single lookup on the geographic region table yields a complete cross-domain snapshot for a given area.

**Table `statistical_bureaus`**

| id | bureau_id | bureau_name | location | contact_phone | contact_email | demographic_survey_id | statistical_bureau_id |
|---|---|---|---|---|---|---|---|
| 1 | 195361 | Integrated Cluster A | extended-location-99 | Joe Tsai | Christopher Wilson | 1 | 1 |
| 2 | 3158162 | Extended Review | integrated-location-100 | Stephanie Collins | Charles Larsen | 2 | 2 |
| 3 | 2106698 | Pilot Initiative | seasonal-location-101 | Tasha Rodriguez | Mary Alvarez | 3 | 3 |
| 4 | L331 | Baseline Model D | regional-location-102 | Walter Pratt | April Snyder | 4 | 4 |

Statistical bureaus represent the institutional bodies responsible for data collection and publication. Each bureau is identified by a unique bureau identifier and a bureau name, with a country designation and a reference to the geographic region it oversees. The bureau records provide the institutional provenance for demographic survey data and serve as a lookup for attributing survey results to their originating agency.

### Joining Demographic Surveys with Statistical Bureaus

**View `v_demographic_survey_statistical_bureau`**

```sql
CREATE VIEW v_demographic_survey_statistical_bureau AS
SELECT a.demographic_survey_id, a.survey_id, a.survey_year, a.territory, b.id AS bureau_id, b.bureau_id AS bureau_bureau_id, b.bureau_name AS bureau_bureau_name
FROM demographic_surveys a JOIN statistical_bureaus b ON a.statistical_bureau_id = b.id;
```

| demographic_survey_id | survey_id | survey_year | territory | bureau_id | bureau_bureau_id | bureau_bureau_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | 9 | primary-territor-58 | 1 | 195361 | Integrated Cluster A |
| 2 | 726059 | 15 | adaptive-territor-59 | 2 | 3158162 | Extended Review |
| 3 | 32814 | 21 | distributed-territor-60 | 3 | 2106698 | Pilot Initiative |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 | baseline-territor-61 | 4 | L331 | Baseline Model D |

This view joins demographic surveys to their originating statistical bureaus, answering the question of which agency produced each survey and under what territorial mandate. The result pairs the survey identifier, survey year, territory, and population metrics with the bureau name and country. For survey 21005921 from year 9 in territory primary-territor-58, the view reveals the bureau responsible for its collection, enabling analysts to trace data quality and methodological consistency across agencies.

### Linking Demographic Surveys to Geographic Regions

**View `v_demographic_survey_geographic_region`**

```sql
CREATE VIEW v_demographic_survey_geographic_region AS
SELECT a.demographic_survey_id, a.survey_id, a.survey_year, a.territory, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM demographic_surveys a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| demographic_survey_id | survey_id | survey_year | territory | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | 9 | primary-territor-58 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | 726059 | 15 | adaptive-territor-59 | 1001 | 4180948 | Adaptive Survey D |
| 3 | 32814 | 21 | distributed-territor-60 | 1002 | 3012829 | Primary Corridor |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 | baseline-territor-61 | 1003 | 778576 | Composite Series |

By connecting demographic surveys to geographic regions, this view answers where each survey was conducted and how the survey's population metrics align with the broader territorial profile. The joined result includes the region name, country, and all survey-level fields. Survey 32814 from year 21 in territory distributed-territor-60 maps to a specific region, allowing direct comparison of the survey's child population percentage of 14.85 against regional benchmarks.

### Associating Health Mortality Records with Geographic Regions

**View `v_health_mortality_record_geographic_region`**

```sql
CREATE VIEW v_health_mortality_record_geographic_region AS
SELECT a.record_id, a.cause_of_death, a.cause_percentage, a.male_percentage, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM health_mortality_records a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| record_id | cause_of_death | cause_percentage | male_percentage | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 10449530 | compact-cause-68 | 11.70 | 19.70 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 10445619 | composite-cause-69 | 14.40 | 21.40 | 1001 | 4180948 | Adaptive Survey D |
| 9568457 | primary-cause-70 | 17.10 | 23.10 | 1002 | 3012829 | Primary Corridor |
| 20743593 | adaptive-cause-71 | 19.80 | 24.80 | 1003 | 778576 | Composite Series |

This view attaches geographic context to mortality observations, answering which region experienced a given cause of death and under what demographic conditions. The joined record combines the cause of death, gender-disaggregated percentages, age group, and record year with the region name and country. The compact-cause-68 observation from distributed-region-12, recorded in year 17 with a cause percentage of 11.70 and male percentage of 19.70, is now directly attributable to its territorial jurisdiction.

### Connecting Education Enrollments to Geographic Regions

**View `v_education_enrollment_geographic_region`**

```sql
CREATE VIEW v_education_enrollment_geographic_region AS
SELECT a.id, a.enrollment_id, a.academic_year, a.education_level, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM education_enrollments a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| id | enrollment_id | academic_year | education_level | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | 4447035 | legacy-academic-43 | pilot-educatio-62 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 1001 | gd_taxc_2121 | compact-academic-44 | extended-educatio-63 | 1001 | 4180948 | Adaptive Survey D |
| 1002 | id_30 | composite-academic-45 | integrated-educatio-64 | 1002 | 3012829 | Primary Corridor |
| 1003 | b_VB-EC-0 | primary-academic-46 | seasonal-educatio-65 | 1003 | 778576 | Composite Series |

Education enrollment records gain territorial meaning when joined to geographic regions. This view answers which region hosts a given enrollment observation and what the educational outcomes look like within that territory. The compact-academic-44 enrollment in extended-educatio-63, with 2,791 total students and a dropout rate of 14.90 percent, is linked to its region, enabling cross-regional comparisons of educational performance.

### Relating Education Enrollments to Demographic Surveys

**View `v_education_enrollment_demographic_survey`**

```sql
CREATE VIEW v_education_enrollment_demographic_survey AS
SELECT a.id, a.enrollment_id, a.academic_year, a.education_level, b.demographic_survey_id AS survey_demographic_survey_id, b.survey_id AS survey_survey_id, b.survey_year AS survey_survey_year
FROM education_enrollments a JOIN demographic_surveys b ON a.demographic_survey_id = b.demographic_survey_id;
```

| id | enrollment_id | academic_year | education_level | survey_demographic_survey_id | survey_survey_id | survey_survey_year |
|---|---|---|---|---|---|---|
| 1000 | 4447035 | legacy-academic-43 | pilot-educatio-62 | 1 | 21005921 | 9 |
| 1001 | gd_taxc_2121 | compact-academic-44 | extended-educatio-63 | 2 | 726059 | 15 |
| 1002 | id_30 | composite-academic-45 | integrated-educatio-64 | 3 | 32814 | 21 |
| 1003 | b_VB-EC-0 | primary-academic-46 | seasonal-educatio-65 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 |

This view bridges educational outcomes with population structure by joining education enrollments to their corresponding demographic surveys. The result answers how enrollment figures and dropout rates relate to the underlying child population proportions. The pilot-educatio-62 enrollment with 11 total students and a dropout rate of 10.45 percent is paired with survey 21005921, which reports a child population percentage of 10.95, allowing analysts to assess whether enrollment levels are commensurate with the child population base.

### Attaching Child Labor Statistics to Geographic Regions

**View `v_child_labor_statistic_geographic_region`**

```sql
CREATE VIEW v_child_labor_statistic_geographic_region AS
SELECT a.id, a.labor_stat_id, a.stat_year, a.employment_rate, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM child_labor_statistics a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| id | labor_stat_id | stat_year | employment_rate | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 100 | 9246333 | 39 | 21.70 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 101 | 25a77d4360b649cabf445d6bfef346db | 42 | 24.40 | 1001 | 4180948 | Adaptive Survey D |
| 102 | IVC20det40 | 45 | 27.10 | 1002 | 3012829 | Primary Corridor |
| 103 | 3718658437 | 48 | 29.80 | 1003 | 778576 | Composite Series |

Child labor statistics gain territorial specificity through this join. The view answers which region experienced a given employment rate and working condition profile. The labor statistic from stat year 42, with an employment rate of 24.40 percent, a school_and_work_rate of 10.40 percent, and an average daily wage of 12.72, is now associated with its region, enabling geographic comparison of child labor intensity.

### Relating Child Labor Statistics to Demographic Surveys

**View `v_child_labor_statistic_demographic_survey`**

```sql
CREATE VIEW v_child_labor_statistic_demographic_survey AS
SELECT a.id, a.labor_stat_id, a.stat_year, a.employment_rate, b.demographic_survey_id AS survey_demographic_survey_id, b.survey_id AS survey_survey_id, b.survey_year AS survey_survey_year
FROM child_labor_statistics a JOIN demographic_surveys b ON a.demographic_survey_id = b.demographic_survey_id;
```

| id | labor_stat_id | stat_year | employment_rate | survey_demographic_survey_id | survey_survey_id | survey_survey_year |
|---|---|---|---|---|---|---|
| 100 | 9246333 | 39 | 21.70 | 1 | 21005921 | 9 |
| 101 | 25a77d4360b649cabf445d6bfef346db | 42 | 24.40 | 2 | 726059 | 15 |
| 102 | IVC20det40 | 45 | 27.10 | 3 | 32814 | 21 |
| 103 | 3718658437 | 48 | 29.80 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 |

This view connects child labor conditions to the demographic surveys that define the child population. The joined result answers whether employment rates correlate with the proportion of children in the surveyed population. The stat year 45 observation with a female employment rate of 25.35 percent and weekly working hours of 13.35 is paired with its demographic survey, providing context for interpreting labor prevalence against population structure.

### Linking Poverty Indexes to Geographic Regions

**View `v_poverty_index_geographic_region`**

```sql
CREATE VIEW v_poverty_index_geographic_region AS
SELECT a.poverty_index_id, a.index_year, a.household_poverty_rate, a.child_poverty_rate, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM poverty_indexes a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| poverty_index_id | index_year | household_poverty_rate | child_poverty_rate | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 4277031 | 19 | 1.95 | 15.45 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 1204-0009-M | 25 | 3.90 | 18.90 | 1001 | 4180948 | Adaptive Survey D |
| 618 | 31 | 5.85 | 22.35 | 1002 | 3012829 | Primary Corridor |
| 48753450 | 37 | 7.80 | 25.80 | 1003 | 778576 | Composite Series |

Poverty indexes gain territorial anchoring through this join. The view answers which region experienced a given household and child poverty rate. The index from year 31, with a household poverty rate of 5.85 percent and a child poverty rate of 22.35 percent, is linked to its region, enabling spatial analysis of economic deprivation patterns.

### Relating Poverty Indexes to Demographic Surveys

**View `v_poverty_index_demographic_survey`**

```sql
CREATE VIEW v_poverty_index_demographic_survey AS
SELECT a.poverty_index_id, a.index_year, a.household_poverty_rate, a.child_poverty_rate, b.demographic_survey_id AS survey_demographic_survey_id, b.survey_id AS survey_survey_id, b.survey_year AS survey_survey_year
FROM poverty_indexes a JOIN demographic_surveys b ON a.demographic_survey_id = b.demographic_survey_id;
```

| poverty_index_id | index_year | household_poverty_rate | child_poverty_rate | survey_demographic_survey_id | survey_survey_id | survey_survey_year |
|---|---|---|---|---|---|---|
| 4277031 | 19 | 1.95 | 15.45 | 1 | 21005921 | 9 |
| 1204-0009-M | 25 | 3.90 | 18.90 | 2 | 726059 | 15 |
| 618 | 31 | 5.85 | 22.35 | 3 | 32814 | 21 |
| 48753450 | 37 | 7.80 | 25.80 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 |

This view connects poverty measurements to the demographic surveys that define the population base. The joined result answers whether child poverty rates align with the child population percentages reported in the survey. The index year 25 observation with a child poverty rate of 18.90 percent and a poor_households_with_children_percent of 21.90 is paired with its demographic survey, providing a basis for assessing whether poverty concentration tracks with child population density.

### Regional Profiles with Demographic Survey Data

**View `v_geographic_region_demographic_survey`**

```sql
CREATE VIEW v_geographic_region_demographic_survey AS
SELECT a.geographic_region_id, a.region_id, a.region_name, a.country, b.demographic_survey_id AS survey_demographic_survey_id, b.survey_id AS survey_survey_id, b.survey_year AS survey_survey_year
FROM geographic_regions a JOIN demographic_surveys b ON a.demographic_survey_id = b.demographic_survey_id;
```

| geographic_region_id | region_id | region_name | country | survey_demographic_survey_id | survey_survey_id | survey_survey_year |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 1 | 21005921 | 9 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 2 | 726059 | 15 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 3 | 32814 | 21 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 |

This view assembles a complete regional profile by joining geographic regions to their corresponding demographic surveys. The result answers what the full population picture looks like for a given region, combining the region name, country, and all survey metrics. The Distributed Assessment region in compact-country-26, linked to survey 21005921, presents a total population of 3.95, a child population of 21.45, and age cohort percentages that sum to the full demographic breakdown.

### Regional Profiles with Health Mortality Data

**View `v_geographic_region_health_mortality_record`**

```sql
CREATE VIEW v_geographic_region_health_mortality_record AS
SELECT a.geographic_region_id, a.region_id, a.region_name, a.country, b.record_id AS record_record_id, b.cause_of_death AS record_cause_of_death, b.cause_percentage AS record_cause_percentage
FROM geographic_regions a JOIN health_mortality_records b ON a.record_id = b.record_id;
```

| geographic_region_id | region_id | region_name | country | record_record_id | record_cause_of_death | record_cause_percentage |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 10449530 | compact-cause-68 | 11.70 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 10445619 | composite-cause-69 | 14.40 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 9568457 | primary-cause-70 | 17.10 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 20743593 | adaptive-cause-71 | 19.80 |

This view creates a territorial health profile by joining geographic regions to their mortality records. The result answers what causes of death, age groups, and gender patterns characterize a region. The distributed-region-12 profile, linked to record 10449530, shows compact-cause-68 at 11.70 percent of deaths, with a male percentage of 19.70 and a female percentage of 9.45, recorded in year 17 for the integrated-age-22 cohort.

### Regional Profiles with Education Enrollment Data

**View `v_geographic_region_education_enrollment`**

```sql
CREATE VIEW v_geographic_region_education_enrollment AS
SELECT a.geographic_region_id, a.region_id, a.region_name, a.country, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.academic_year AS enrollment_academic_year
FROM geographic_regions a JOIN education_enrollments b ON a.education_enrollment_id = b.id;
```

| geographic_region_id | region_id | region_name | country | enrollment_id | enrollment_enrollment_id | enrollment_academic_year |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 1000 | 4447035 | legacy-academic-43 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 1001 | gd_taxc_2121 | compact-academic-44 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 1002 | id_30 | composite-academic-45 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 1003 | b_VB-EC-0 | primary-academic-46 |

This view produces a territorial education profile by joining geographic regions to their enrollment records. The result answers what student counts, dropout rates, and failure rates define a region's educational landscape. The distributed-region-12 profile, linked to enrollment 1000, shows 11 total students in the pilot-educatio-62 level, with a dropout rate of 10.45 percent, male dropout rate of 11.45 percent, and female dropout rate of 18.45 percent.

### Regional Profiles with Child Labor Data

**View `v_geographic_region_child_labor_statistic`**

```sql
CREATE VIEW v_geographic_region_child_labor_statistic AS
SELECT a.geographic_region_id, a.region_id, a.region_name, a.country, b.id AS statistic_id, b.labor_stat_id AS statistic_labor_stat_id, b.stat_year AS statistic_stat_year
FROM geographic_regions a JOIN child_labor_statistics b ON a.child_labor_statistic_id = b.id;
```

| geographic_region_id | region_id | region_name | country | statistic_id | statistic_labor_stat_id | statistic_stat_year |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 100 | 9246333 | 39 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 101 | 25a77d4360b649cabf445d6bfef346db | 42 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 102 | IVC20det40 | 45 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 103 | 3718658437 | 48 |

This view assembles a territorial child labor profile by joining geographic regions to their labor statistics. The result answers what employment rates, school_and_work rates, and wage levels characterize a region's youth labor market. The distributed-region-12 profile, linked to labor statistic 100, shows an employment rate of 21.70 percent, a school_and_work_rate of 6.20 percent, an average daily wage of 25.36, and weekly working hours of 4.45 in stat year 39.

### Regional Profiles with Poverty Index Data

**View `v_geographic_region_poverty_index`**

```sql
CREATE VIEW v_geographic_region_poverty_index AS
SELECT a.geographic_region_id, a.region_id, a.region_name, a.country, b.poverty_index_id AS index_poverty_index_id, b.index_year AS index_index_year, b.household_poverty_rate AS index_household_poverty_rate
FROM geographic_regions a JOIN poverty_indexes b ON a.poverty_index_id = b.poverty_index_id;
```

| geographic_region_id | region_id | region_name | country | index_poverty_index_id | index_index_year | index_household_poverty_rate |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 4277031 | 19 | 1.95 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 1204-0009-M | 25 | 3.90 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 618 | 31 | 5.85 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 48753450 | 37 | 7.80 |

This view creates a territorial poverty profile by joining geographic regions to their poverty indexes. The result answers what household and child deprivation levels define a region's economic conditions. The distributed-region-12 profile, linked to poverty index 4277031, shows a household poverty rate of 1.95 percent, a child poverty rate of 15.45 percent, and a poor_households_with_children_percent of 18.45 in index year 19.

### Survey Attribution to Statistical Bureaus

**View `v_statistical_bureau_demographic_survey`**

```sql
CREATE VIEW v_statistical_bureau_demographic_survey AS
SELECT a.id, a.bureau_id, a.bureau_name, a.location, b.demographic_survey_id AS survey_demographic_survey_id, b.survey_id AS survey_survey_id, b.survey_year AS survey_survey_year
FROM statistical_bureaus a JOIN demographic_surveys b ON a.demographic_survey_id = b.demographic_survey_id;
```

| id | bureau_id | bureau_name | location | survey_demographic_survey_id | survey_survey_id | survey_survey_year |
|---|---|---|---|---|---|---|
| 1 | 195361 | Integrated Cluster A | extended-location-99 | 1 | 21005921 | 9 |
| 2 | 3158162 | Extended Review | integrated-location-100 | 2 | 726059 | 15 |
| 3 | 2106698 | Pilot Initiative | seasonal-location-101 | 3 | 32814 | 21 |
| 4 | L331 | Baseline Model D | regional-location-102 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 |

This view provides institutional provenance for demographic surveys by joining them to their originating statistical bureaus. The result answers which bureau produced each survey and under what country jurisdiction. The survey 21005921 from year 9 is attributed to its bureau, enabling analysts to assess data quality, methodological consistency, and institutional accountability across the survey portfolio.

### Bureau Self-Reference and Consolidation

**View `v_statistical_bureau_statistical_bureau`**

```sql
CREATE VIEW v_statistical_bureau_statistical_bureau AS
SELECT a.id, a.bureau_id, a.bureau_name, a.location, b.id AS bureau_id, b.bureau_id AS bureau_bureau_id, b.bureau_name AS bureau_bureau_name
FROM statistical_bureaus a JOIN statistical_bureaus b ON a.statistical_bureau_id = b.id;
```

| id | bureau_id | bureau_name | location | bureau_id | bureau_bureau_id | bureau_bureau_name |
|---|---|---|---|---|---|---|
| 1 | 195361 | Integrated Cluster A | extended-location-99 | 1 | 195361 | Integrated Cluster A |
| 2 | 3158162 | Extended Review | integrated-location-100 | 2 | 3158162 | Extended Review |
| 3 | 2106698 | Pilot Initiative | seasonal-location-101 | 3 | 2106698 | Pilot Initiative |
| 4 | L331 | Baseline Model D | regional-location-102 | 4 | L331 | Baseline Model D |

This view consolidates statistical bureau records with themselves, producing a stable reference table that can be used for lookups, audits, and institutional reporting. The result preserves all bureau identifiers, names, and country designations, serving as the authoritative registry for the statistical agencies that underpin the entire monitoring framework.

### Synthesis

The seven base tables and twenty-one views described here form a comprehensive monitoring architecture for regional development indicators. Demographic surveys provide the population foundation, health mortality records capture vital events, education enrollments track academic participation, child labor statistics document youth employment conditions, and poverty indexes measure economic deprivation. Geographic regions serve as the central nexus, linking all record types into territorial profiles. Statistical bureaus provide institutional provenance, attributing survey data to their originating agencies. The views enable analysts to answer specific questions— Which bureau produced this survey? What is the full regional profile? How do dropout rates relate to child population proportions?—by joining the appropriate tables. Together, these records and their relationships support evidence-based policy analysis, cross-regional benchmarking, and longitudinal tracking of development outcomes across territories.