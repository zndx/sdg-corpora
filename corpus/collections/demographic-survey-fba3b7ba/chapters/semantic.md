The domain under examination is a national statistical infrastructure: a network of geographic regions, each overseen by a statistical bureau, through which demographic surveys serve as the central organizing fact. Every survey anchors a territory's population profile and, in turn, becomes the pivot around which health, education, child labor, and poverty data are collected and reported. The relational model captures this hierarchy through seven base tables and twenty-one materialized views, each view representing a specific join that reconstructs a domain fact from the normalized tables.

## The Base Tables

The model's backbone is the `demographic_surveys` table, which records population snapshots for individual territories. Each row carries a surrogate primary key `demographic_survey_id`, a business identifier `survey_id` (ranging from short integers like `21005921` to UUIDs such as `b83e028a-8fcd-11eb-924d-9cd76263cbd0`), and a `survey_year` (values 9, 15, 21, 27 in the sample). The `territory` column names the surveyed area — `primary-territor-58`, `adaptive-territor-59`, `distributed-territor-60`, `baseline-territor-61` — while numeric columns quantify the population: `total_population_count` (3.95, 6.90, 9.85, 12.80), `child_population_count` (21.45, 25.90, 30.35, 34.80), and `child_population_percentage` (10.95, 12.90, 14.85, 16.80). Age-band breakdowns follow as `under_five_percentage`, `five_to_nine_percentage`, `ten_to_fourteen_percentage`, and `fifteen_to_seventeen_percentage`. Two foreign keys link each survey to its producing `statistical_bureau_id` (values 1–4) and its `geographic_region_id` (values 1000–1003). A `created_at` timestamp records when the row was inserted.

**Table `demographic_surveys`**

| demographic_survey_id | survey_id | survey_year | territory | total_population_count | child_population_count | child_population_percentage | under_five_percentage | five_to_nine_percentage | ten_to_fourteen_percentage | fifteen_to_seventeen_percentage | statistical_bureau_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | 9 | primary-territor-58 | 3.95 | 21.45 | 10.95 | 16.95 | 14.70 | 16.70 | 6.20 | 1 | 1000 | 2025-01-01 00:14:00 |
| 2 | 726059 | 15 | adaptive-territor-59 | 6.90 | 25.90 | 12.90 | 19.90 | 17.40 | 20.40 | 10.40 | 2 | 1001 | 2025-02-06 03:14:00 |
| 3 | 32814 | 21 | distributed-territor-60 | 9.85 | 30.35 | 14.85 | 22.85 | 20.10 | 24.10 | 14.60 | 3 | 1002 | 2025-03-11 06:14:00 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 27 | baseline-territor-61 | 12.80 | 34.80 | 16.80 | 25.80 | 22.80 | 27.80 | 18.80 | 4 | 1003 | 2025-04-16 09:14:00 |

Health and mortality data live in `health_mortality_records`, keyed by `record_id` (e.g., `10449530`, `10445619`, `9568457`, `20743593`). Each row describes a cause of death — `compact-cause-68`, `composite-cause-69`, `primary-cause-70`, `adaptive-cause-71` — along with `cause_percentage` (11.70, 14.40, 17.10, 19.80), gender-split rates (`male_percentage`, `female_percentage`), an `age_group` label (`integrated-age-22`, `seasonal-age-23`, `regional-age-24`, `legacy-age-25`), a `record_year` (17, 23, 29, 35), and a human-readable `region` name (`distributed-region-12`, `baseline-region-13`, `pilot-region-14`, `extended-region-15`). The `geographic_region_id` column (1000–1003) ties each mortality record to its region.

**Table `health_mortality_records`**

| record_id | cause_of_death | cause_percentage | male_percentage | female_percentage | age_group | record_year | region | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 10449530 | compact-cause-68 | 11.70 | 19.70 | 9.45 | integrated-age-22 | 17 | distributed-region-12 | 1000 |
| 10445619 | composite-cause-69 | 14.40 | 21.40 | 11.90 | seasonal-age-23 | 23 | baseline-region-13 | 1001 |
| 9568457 | primary-cause-70 | 17.10 | 23.10 | 14.35 | regional-age-24 | 29 | pilot-region-14 | 1002 |
| 20743593 | adaptive-cause-71 | 19.80 | 24.80 | 16.80 | legacy-age-25 | 35 | extended-region-15 | 1003 |

Education data is stored in `education_enrollments`, with primary key `id` (1000–1003). The `enrollment_id` column holds identifiers such as `4447035`, `gd_taxc_2121`, `id_30`, and `b_VB-EC-0`. Academic years are labeled descriptively (`legacy-academic-43`, `compact-academic-44`, `composite-academic-45`, `primary-academic-46`), and `education_level` uses analogous labels (`pilot-educatio-62`, `extended-educatio-63`, `integrated-educatio-64`, `seasonal-educatio-65`). Enrollment counts (`total_students`: 11, 2791, 14, 12) and dropout/failure rates — each split into overall, male, and female sub-rates — populate the remaining columns. The table carries two foreign keys: `geographic_region_id` (1000–1003) and `demographic_survey_id` (1–4).

**Table `education_enrollments`**

| id | enrollment_id | academic_year | education_level | total_students | dropout_rate | male_dropout_rate | female_dropout_rate | failure_rate | male_failure_rate | female_failure_rate | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447035 | legacy-academic-43 | pilot-educatio-62 | 11 | 10.45 | 11.45 | 18.45 | 4.45 | 14.45 | 10.70 | 1000 | 1 |
| 1001 | gd_taxc_2121 | compact-academic-44 | extended-educatio-63 | 2791 | 14.90 | 13.90 | 22.90 | 7.90 | 16.90 | 14.40 | 1001 | 2 |
| 1002 | id_30 | composite-academic-45 | integrated-educatio-64 | 14 | 19.35 | 16.35 | 27.35 | 11.35 | 19.35 | 18.10 | 1002 | 3 |
| 1003 | b_VB-EC-0 | primary-academic-46 | seasonal-educatio-65 | 12 | 23.80 | 18.80 | 31.80 | 14.80 | 21.80 | 21.80 | 1003 | 4 |

Child labor statistics occupy `child_labor_statistics`, keyed by `id` (100–103). The `labor_stat_id` column contains identifiers like `9246333`, `25a77d4360b649cabf445d6bfef346db`, `IVC20det40`, and `3718658437`. Year values are 39, 42, 45, 48. Employment rates (`employment_rate`: 21.70, 24.40, 27.10, 29.80) are split by gender (`male_employment_rate`, `female_employment_rate`), alongside `school_and_work_rate` (6.20, 10.40, 14.60, 18.80), `average_daily_wage` (25.36, 12.72, 25.36, 27.02), `weekly_working_hours` (4.45, 8.90, 13.35, 17.80), and a `currency_code` (e.g., `gd_fp_eu_acc3`, `managing-resources`, `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, `10445649`). Foreign keys `geographic_region_id` (1000–1003) and `demographic_survey_id` (1–4) link each labor statistic to its region and survey.

**Table `child_labor_statistics`**

| id | labor_stat_id | stat_year | employment_rate | male_employment_rate | female_employment_rate | school_and_work_rate | average_daily_wage | weekly_working_hours | currency_code | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 9246333 | 39 | 21.70 | 15.20 | 16.45 | 6.20 | 25.36 | 4.45 | gd_fp_eu_acc3 | 1000 | 1 |
| 101 | 25a77d4360b649cabf445d6bfef346db | 42 | 24.40 | 18.40 | 20.90 | 10.40 | 12.72 | 8.90 | managing-resources | 1001 | 2 |
| 102 | IVC20det40 | 45 | 27.10 | 21.60 | 25.35 | 14.60 | 25.36 | 13.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1002 | 3 |
| 103 | 3718658437 | 48 | 29.80 | 24.80 | 29.80 | 18.80 | 27.02 | 17.80 | 10445649 | 1003 | 4 |

Poverty data is captured in `poverty_indexes`, with primary key `poverty_index_id` (values `4277031`, `1204-0009-M`, `618`, `48753450`). The `index_year` column holds 19, 25, 31, 37. Rates for `household_poverty_rate` (1.95, 3.90, 5.85, 7.80), `child_poverty_rate` (15.45, 18.90, 22.35, 25.80), and `poor_households_with_children_percent` (18.45, 21.90, 25.35, 28.80) describe deprivation. The `region` column repeats the human-readable names (`distributed-region-12`, `baseline-region-13`, `pilot-region-14`, `extended-region-15`). Foreign keys `geographic_region_id` (1000–1003) and `demographic_survey_id` (1–4) complete the table.

**Table `poverty_indexes`**

| poverty_index_id | index_year | household_poverty_rate | child_poverty_rate | poor_households_with_children_percent | region | geographic_region_id | demographic_survey_id |
|---|---|---|---|---|---|---|---|
| 4277031 | 19 | 1.95 | 15.45 | 18.45 | distributed-region-12 | 1000 | 1 |
| 1204-0009-M | 25 | 3.90 | 18.90 | 21.90 | baseline-region-13 | 1001 | 2 |
| 618 | 31 | 5.85 | 22.35 | 25.35 | pilot-region-14 | 1002 | 3 |
| 48753450 | 37 | 7.80 | 25.80 | 28.80 | extended-region-15 | 1003 | 4 |

The `geographic_regions` table provides the spatial dimension. Its primary key is `geographic_region_id` (1000–1003). The `region_id` column holds UUIDs or integers (`46d49f56-8fcc-11eb-924d-9cd76263cbd0`, `4180948`, `3012829`, `778576`), while `region_name` gives human labels (`Distributed Assessment`, `Adaptive Survey D`, `Primary Corridor`, `Composite Series`). The `country` column uses synthetic names (`compact-country-26`, `composite-country-27`, `primary-country-28`, `adaptive-country-29`). Notably, this table carries five foreign keys pointing back to the other base tables: `demographic_survey_id` (1–4), `record_id` (10449530, 10445619, 9568457, 20743593), `education_enrollment_id` (1000–1003), `child_labor_statistic_id` (100–103), and `poverty_index_id` (4277031, 1204-0009-M, 618, 48753450). A `created_at` timestamp records insertion time.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | country | demographic_survey_id | record_id | education_enrollment_id | child_labor_statistic_id | poverty_index_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | compact-country-26 | 1 | 10449530 | 1000 | 100 | 4277031 | 2025-01-01 00:14:00 |
| 1001 | 4180948 | Adaptive Survey D | composite-country-27 | 2 | 10445619 | 1001 | 101 | 1204-0009-M | 2025-02-06 03:14:00 |
| 1002 | 3012829 | Primary Corridor | primary-country-28 | 3 | 9568457 | 1002 | 102 | 618 | 2025-03-11 06:14:00 |
| 1003 | 778576 | Composite Series | adaptive-country-29 | 4 | 20743593 | 1003 | 103 | 48753450 | 2025-04-16 09:14:00 |

The `statistical_bureaus` table is the least detailed of the base tables, keyed by `statistical_bureau_id` (1–4). It stores the bureau's name, country, and a `created_at` timestamp.

**Table `statistical_bureaus`**

| id | bureau_id | bureau_name | location | contact_phone | contact_email | demographic_survey_id | statistical_bureau_id |
|---|---|---|---|---|---|---|---|
| 1 | 195361 | Integrated Cluster A | extended-location-99 | Joe Tsai | Christopher Wilson | 1 | 1 |
| 2 | 3158162 | Extended Review | integrated-location-100 | Stephanie Collins | Charles Larsen | 2 | 2 |
| 3 | 2106698 | Pilot Initiative | seasonal-location-101 | Tasha Rodriguez | Mary Alvarez | 3 | 3 |
| 4 | L331 | Baseline Model D | regional-location-102 | Walter Pratt | April Snyder | 4 | 4 |

## Cardinality-Bounded Relationships and Foreign Keys

The schema encodes a many-to-one relationship between every data table and `geographic_regions`: each demographic survey, health record, education enrollment, child labor statistic, and poverty index belongs to exactly one geographic region, while a region may contain many such records. This is expressed through the `geographic_region_id` foreign key present in `demographic_surveys`, `health_mortality_records`, `education_enrollments`, `child_labor_statistics`, and `poverty_indexes`. The `geographic_regions` table itself inverts the relationship by storing a single foreign key back to each of those tables — `demographic_survey_id`, `record_id`, `education_enrollment_id`, `child_labor_statistic_id`, and `poverty_index_id` — creating a bidirectional link that allows queries to traverse from region to its associated records and vice versa.

The `demographic_surveys` table also carries a foreign key `statistical_bureau_id` pointing to `statistical_bureaus`, establishing that each survey is produced by exactly one bureau. Conversely, the `geographic_regions` table stores `demographic_survey_id`, meaning each region is associated with one demographic survey. This creates a circular dependency between `demographic_surveys` and `geographic_regions`: a survey references a region, and a region references a survey. In practice, this circularity is resolved by the `created_at` timestamps — the demographic survey row is inserted first, and the geographic region row is created subsequently, with the region's `demographic_survey_id` pointing back to the already-existing survey.

The `education_enrollments`, `child_labor_statistics`, and `poverty_indexes` tables each carry a `demographic_survey_id` foreign key, meaning each education record, labor statistic, and poverty index is explicitly tied to a specific demographic survey. This allows the model to answer questions such as "what was the dropout rate for the education level associated with survey 1?" or "what was the child poverty rate in the territory covered by survey 3?"

## View-Based Reconstructive Joins

The twenty-one views materialize the joins that reconstruct domain facts from the normalized tables. Each view answers a specific analytical question by combining columns from two or more base tables.

The view `v_demographic_survey_statistical_bureau` joins `demographic_surveys` to `statistical_bureaus` on `statistical_bureau_id`, producing rows that pair each survey's population data with its producing bureau's metadata. A row from this view might show survey `21005921` for territory `primary-territor-58` alongside the bureau that compiled it.

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

The view `v_demographic_survey_geographic_region` joins `demographic_surveys` to `geographic_regions` on `geographic_region_id`, combining survey population figures with the region's name, country, and creation timestamp. A row might display survey `b83e028a-8fcd-11eb-924d-9cd76263cbd0` (year 27, territory `baseline-territor-61`, total population 12.80) alongside region `Composite Series` in country `adaptive-country-29`.

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

The view `v_health_mortality_record_geographic_region` joins `health_mortality_records` to `geographic_regions` on `geographic_region_id`, pairing each cause-of-death record with its region's human-readable name and country. A row might show cause `compact-cause-68` (percentage 11.70, age group `integrated-age-22`, year 17) alongside region `Distributed Assessment` in country `compact-country-26`.

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

The view `v_education_enrollment_geographic_region` joins `education_enrollments` to `geographic_regions` on `geographic_region_id`, combining enrollment statistics with the region's identity. A row might display enrollment `4447035` (academic year `legacy-academic-43`, education level `pilot-educatio-62`, 11 students, dropout rate 10.45) alongside region `Distributed Assessment`.

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

The view `v_education_enrollment_demographic_survey` joins `education_enrollments` to `demographic_surveys` on `demographic_survey_id`, linking education data to the population survey that contextualizes it. A row might show enrollment `gd_taxc_2121` (2791 students, dropout rate 14.90) alongside survey `726059` (territory `adaptive-territor-59`, child population percentage 12.90).

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

The view `v_child_labor_statistic_geographic_region` joins `child_labor_statistics` to `geographic_regions` on `geographic_region_id`, pairing labor data with the region's identity. A row might display labor statistic `9246333` (year 39, employment rate 21.70, school-and-work rate 6.20, average daily wage 25.36) alongside region `Distributed Assessment`.

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

The view `v_child_labor_statistic_demographic_survey` joins `child_labor_statistics` to `demographic_surveys` on `demographic_survey_id`, connecting labor statistics to their population survey. A row might show labor statistic `25a77d4360b649cabf445d6bfef346db` (year 42, employment rate 24.40, weekly working hours 8.90) alongside survey `726059` (territory `adaptive-territor-59`, total population 6.90).

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

The view `v_poverty_index_geographic_region` joins `poverty_indexes` to `geographic_regions` on `geographic_region_id`, combining poverty rates with the region's name and country. A row might display poverty index `4277031` (year 19, household poverty rate 1.95, child poverty rate 15.45) alongside region `Distributed Assessment`.

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

The view `v_poverty_index_demographic_survey` joins `poverty_indexes` to `demographic_surveys` on `demographic_survey_id`, linking poverty data to its population survey. A row might show poverty index `1204-0009-M` (year 25, household poverty rate 3.90, poor households with children 21.90) alongside survey `726059` (territory `adaptive-territor-59`, child population count 25.90).

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

The view `v_geographic_region_demographic_survey` joins `geographic_regions` to `demographic_surveys` on `demographic_survey_id`, inverting the direction of the relationship so that each region row is enriched with its associated survey's population data. A row might display region `Distributed Assessment` (country `compact-country-26`) alongside survey `21005921` (territory `primary-territor-58`, total population 3.95, child population percentage 10.95).

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

The view `v_geographic_region_health_mortality_record` joins `geographic_regions` to `health_mortality_records` on `record_id`, pairing each region with its mortality data. A row might show region `Distributed Assessment` alongside record `10449530` (cause `compact-cause-68`, cause percentage 11.70, age group `integrated-age-22`).

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

The view `v_geographic_region_education_enrollment` joins `geographic_regions` to `education_enrollments` on `education_enrollment_id`, linking each region to its education enrollment data. A row might display region `Distributed Assessment` alongside enrollment `4447035` (academic year `legacy-academic-43`, 11 students, dropout rate 10.45).

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

The view `v_geographic_region_child_labor_statistic` joins `geographic_regions` to `child_labor_statistics` on `child_labor_statistic_id`, connecting each region to its labor statistics. A row might show region `Distributed Assessment` alongside labor statistic `9246333` (year 39, employment rate 21.70, school-and-work rate 6.20).

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

The view `v_geographic_region_poverty_index` joins `geographic_regions` to `poverty_indexes` on `poverty_index_id`, pairing each region with its poverty data. A row might display region `Distributed Assessment` alongside poverty index `4277031` (year 19, household poverty rate 1.95, child poverty rate 15.45).

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

The view `v_statistical_bureau_demographic_survey` joins `statistical_bureaus` to `demographic_surveys` on `statistical_bureau_id`, producing rows that list each bureau alongside the surveys it has produced. A row might show a bureau alongside survey `21005921` (territory `primary-territor-58`, total population 3.95, child population percentage 10.95).

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

The view `v_statistical_bureau_statistical_bureau` is a self-join on `statistical_bureaus`, likely used to compare bureau metadata or to produce a denormalized view where each bureau's columns are duplicated for analytical convenience. A row from this view would contain the bureau's name, country, and creation timestamp repeated across both aliased copies of the table.

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

## Synthesis

The schema models a statistical domain where demographic surveys are the central organizing entity. Each survey anchors a territory's population profile and is produced by a single statistical bureau. Geographic regions provide the spatial container, with each region associated with exactly one survey and one record from each of the four thematic domains — health, education, child labor, and poverty. The foreign keys in `demographic_surveys`, `health_mortality_records`, `education_enrollments`, `child_labor_statistics`, and `poverty_indexes` all point to `geographic_regions`, while the `geographic_regions` table itself carries five foreign keys pointing back to those same tables, creating a bidirectional hub-and-spoke topology. The twenty-one views materialize the joins that reconstruct domain facts: some pair surveys with bureaus or regions, others link thematic data to regions or surveys, and the remaining views invert the relationships so that regions and bureaus become the starting point for queries. Together, the seven base tables and twenty-one views form a normalized yet fully reconstructable model of a national statistical infrastructure.