The domain under examination captures the landscape of policy research as conducted by a distributed cohort of researchers, each contributing through multiple channels—structured surveys, semi-structured telephone interviews, and qualitative thematic analysis—while being situated within geographic and policy-instrument contexts. The relational model normalizes these overlapping relationships into six base tables, each anchored by a surrogate primary key, and exposes the domain facts through twenty denormalized views that rejoin the normalized fragments into analytically useful perspectives. Every table and view name is quoted in backticks throughout this chapter.

## Base Tables

The anchor of the model is the `researchers` table, which profiles each individual contributor along demographic and professional dimensions. Its primary key is `researcher_id`, a numeric identifier such as `89419`, `2618557`, `9736892`, and `1450639`. The remaining columns capture `nationality` (e.g., `composite-national-39`, `primary-national-40`), `career_stage` (`early-career`, `mid-career`, `senior`), `gender` (`compact-gender-62`, `composite-gender-63`), `sector` (`public` or `private`), and `primary_field` (e.g., `pilot-primary-20`, `extended-primary-21`). Three foreign-key columns—`geographic_location_id`, `response_id`, and `telephone_interview_id`—tie each researcher to their location record, survey response, and telephone interview, respectively. The `geographic_location_id` values are `1` through `4`; `response_id` references the `response_id` in `survey_responses` (such as `ChIJr7cItPtt5kcRM6ry7ecIYgw` or `Invoice`); and `telephone_interview_id` references the `id` in `telephone_interviews` (values `100`–`103`).

**Table `researchers`**

| researcher_id | nationality | career_stage | gender | sector | primary_field | geographic_location_id | response_id | telephone_interview_id |
|---|---|---|---|---|---|---|---|---|
| 89419 | composite-national-39 | early-career | compact-gender-62 | public | pilot-primary-20 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 100 |
| 2618557 | primary-national-40 | mid-career | composite-gender-63 | private | extended-primary-21 | 2 | 9736917 | 101 |
| 9736892 | adaptive-national-41 | senior | primary-gender-64 | public | integrated-primary-22 | 3 | 8189493 | 102 |
| 1450639 | distributed-national-42 | early-career | adaptive-gender-65 | private | seasonal-primary-23 | 4 | Invoice | 103 |

The `survey_responses` table records each researcher's completed survey. Its primary key is `response_id`, a string identifier drawn from a Google Places-style encoding (e.g., `ChIJr7cItPtt5kcRM6ry7ecIYgw`, `9736917`, `8189493`, `Invoice`). The columns `submission_date` (e.g., `2025-04-24T03:57:00`), `respondent_status` (`based-in-india`, `commuter`, `future-interested`), `total_score` (a floating-point measure ranging from `16.45` to `26.80`), and `completion_status` (`complete` or `partial`) describe the survey event itself. The foreign key `researcher_id` links back to `researchers`, and `policy_instrument_id` links forward to `policy_instruments`, with values `1` through `4`.

**Table `survey_responses`**

| response_id | submission_date | respondent_status | total_score | completion_status | researcher_id | policy_instrument_id |
|---|---|---|---|---|---|---|
| ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india | 16.45 | complete | 89419 | 1 |
| 9736917 | 2022-09-08T10:14:00 | commuter | 19.90 | partial | 2618557 | 2 |
| 8189493 | 2023-02-19T17:31:00 | future-interested | 23.35 | complete | 9736892 | 3 |
| Invoice | 2024-07-03T00:48:00 | based-in-india | 26.80 | partial | 1450639 | 4 |

The `telephone_interviews` table captures the logistics and metadata of each semi-structured interview. Its primary key is `id`, a small integer (`100`–`103`). The column `interview_id` holds a UUID such as `134386ba-9bad-11eb-a8a2-19ed5c03f8d3` or `46d471de-8fcc-11eb-924d-9cd76263cbd0`. The `start_date` and `end_date` columns record the interview window (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), while `duration_minutes` captures the elapsed time (`35`, `38`, `41`, `44`). The `interviewer_id` column identifies the interviewer (e.g., `10238280`, `account_pymes_659`), and the foreign keys `researcher_id`, `geographic_location_id`, and `qualitative_insight_id` connect the interview to the researcher, their location, and the associated qualitative insight, respectively.

**Table `telephone_interviews`**

| id | interview_id | start_date | end_date | duration_minutes | interviewer_id | researcher_id | geographic_location_id | qualitative_insight_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 35 | 10238280 | 89419 | 1 | 1 |
| 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 38 | account_pymes_659 | 2618557 | 2 | 2 |
| 102 | 611507 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 41 | 6564396 | 9736892 | 3 | 3 |
| 103 | 4060647 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 44 | 2933459 | 1450639 | 4 | 4 |

The `geographic_locations` table models the spatial context of each researcher and interview. Its primary key is `id` (`1`–`4`). The `location_id` column holds a numeric code such as `778556` or `1250220`, while `location_name` provides a human-readable label (`Legacy Review D`, `Regional Initiative`, `Seasonal Model`, `Integrated Cluster A`). The `country_code` column stores a string identifier (e.g., `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`), and `region_type` classifies the geography as `country`, `city`, or `province`. Foreign keys `researcher_id` and `telephone_interview_id` link the location back to the researcher and the interview.

**Table `geographic_locations`**

| id | location_id | location_name | country_code | region_type | researcher_id | telephone_interview_id |
|---|---|---|---|---|---|---|
| 1 | 778556 | Legacy Review D | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | country | 89419 | 100 |
| 2 | 1250220 | Regional Initiative | lu_tax_code_template_m_I_2 | city | 2618557 | 101 |
| 3 | 14511 | Seasonal Model | default_chart_a_account_57 | province | 9736892 | 102 |
| 4 | 611510 | Integrated Cluster A | 727045 | country | 1450639 | 103 |

The `policy_instruments` table catalogs the policy initiatives under study. Its primary key is `id` (`1`–`4`). The `instrument_id` column holds a string identifier such as `6926365` or `account_pymes_691`, and `instrument_name` provides the label (`Distributed Initiative`, `Adaptive Model D`, `Primary Cluster`, `Composite Review`). The `launch_date` (e.g., `2022-05-17`), `status` (`proposed`, `launched`, `operational`), and `target_group` (e.g., `composite-target-81`) describe the policy's lifecycle. Foreign keys `researcher_id`, `response_id`, and `telephone_interview_id` tie each instrument to the researcher, their survey response, and the associated telephone interview.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | launch_date | status | target_group | researcher_id | response_id | telephone_interview_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | 2022-05-17 | proposed | composite-target-81 | 89419 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 100 |
| 2 | account_pymes_691 | Adaptive Model D | 2023-10-01 | launched | primary-target-82 | 2618557 | 9736917 | 101 |
| 3 | 726063 | Primary Cluster | 2024-03-12 | operational | adaptive-target-83 | 9736892 | 8189493 | 102 |
| 4 | 23256422 | Composite Review | 2025-08-23 | proposed | distributed-target-84 | 1450639 | Invoice | 103 |

The `qualitative_insights` table stores thematic summaries derived from the telephone interviews. Its primary key is `id` (`1`–`4`). The `insight_id` column holds a numeric code (`7119788`, `1437583`, `10782168`, `7731881`), while `theme` identifies the analytical theme (`baseline-theme-79`, `pilot-theme-80`, `extended-theme-81`, `integrated-theme-82`). The `sentiment` column records the qualitative assessment (`positive`, `negative`, `neutral`), and `priority_level` is a numeric rank (`22`, `25`, `28`, `31`). The `summary_text` column contains the thematic summary string (`distributed-summary-24`, `baseline-summary-25`, etc.). Foreign keys `telephone_interview_id` and `policy_instrument_id` link each insight to its source interview and the policy instrument under evaluation.

**Table `qualitative_insights`**

| id | insight_id | theme | sentiment | priority_level | summary_text | telephone_interview_id | policy_instrument_id |
|---|---|---|---|---|---|---|---|
| 1 | 7119788 | baseline-theme-79 | positive | 22 | distributed-summary-24 | 100 | 1 |
| 2 | 1437583 | pilot-theme-80 | negative | 25 | baseline-summary-25 | 101 | 2 |
| 3 | 10782168 | extended-theme-81 | neutral | 28 | pilot-summary-26 | 102 | 3 |
| 4 | 7731881 | integrated-theme-82 | positive | 31 | extended-summary-27 | 103 | 4 |

## Views

Each view materializes a specific join across the normalized base tables, answering a distinct analytical question by reconstructing a domain fact from its constituent fragments.

The view `vw_researcher_geographic_location` joins `researchers` to `geographic_locations` on `researchers.geographic_location_id = geographic_locations.id`. It answers the question: *Which geographic context is associated with each researcher?* Reading the row for `researcher_id = 89419`, the view yields `location_name = Legacy Review D` and `region_type = country`, confirming that this early-career, public-sector researcher is situated in a country-level region. The row for `researcher_id = 2618557` shows `location_name = Regional Initiative` with `region_type = city`, illustrating the model's capacity to distinguish sub-national geographies.

**View `vw_researcher_geographic_location`**

```sql
CREATE VIEW vw_researcher_geographic_location AS
SELECT a.researcher_id, a.nationality, a.career_stage, a.gender, b.id AS location_id, b.location_id AS location_location_id, b.location_name AS location_location_name
FROM researchers a JOIN geographic_locations b ON a.geographic_location_id = b.id;
```

| researcher_id | nationality | career_stage | gender | location_id | location_location_id | location_location_name |
|---|---|---|---|---|---|---|
| 89419 | composite-national-39 | early-career | compact-gender-62 | 1 | 778556 | Legacy Review D |
| 2618557 | primary-national-40 | mid-career | composite-gender-63 | 2 | 1250220 | Regional Initiative |
| 9736892 | adaptive-national-41 | senior | primary-gender-64 | 3 | 14511 | Seasonal Model |
| 1450639 | distributed-national-42 | early-career | adaptive-gender-65 | 4 | 611510 | Integrated Cluster A |

The view `vw_researcher_survey_response` joins `researchers` to `survey_responses` on `researchers.response_id = survey_responses.response_id`. It answers: *Which survey response belongs to each researcher?* For `researcher_id = 89419`, the view returns `response_id = ChIJr7cItPtt5kcRM6ry7ecIYgw`, `total_score = 16.45`, and `completion_status = complete`, indicating a fully completed survey with a relatively low aggregate score. The row for `researcher_id = 1450639` shows `response_id = Invoice`, `total_score = 26.80`, and `completion_status = partial`, demonstrating that the highest-scoring response in the dataset is incomplete.

**View `vw_researcher_survey_response`**

```sql
CREATE VIEW vw_researcher_survey_response AS
SELECT a.researcher_id, a.nationality, a.career_stage, a.gender, b.response_id AS response_response_id, b.submission_date AS response_submission_date, b.respondent_status AS response_respondent_status
FROM researchers a JOIN survey_responses b ON a.response_id = b.response_id;
```

| researcher_id | nationality | career_stage | gender | response_response_id | response_submission_date | response_respondent_status |
|---|---|---|---|---|---|---|
| 89419 | composite-national-39 | early-career | compact-gender-62 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india |
| 2618557 | primary-national-40 | mid-career | composite-gender-63 | 9736917 | 2022-09-08T10:14:00 | commuter |
| 9736892 | adaptive-national-41 | senior | primary-gender-64 | 8189493 | 2023-02-19T17:31:00 | future-interested |
| 1450639 | distributed-national-42 | early-career | adaptive-gender-65 | Invoice | 2024-07-03T00:48:00 | based-in-india |

The view `vw_researcher_telephone_interview` joins `researchers` to `telephone_interviews` on `researchers.telephone_interview_id = telephone_interviews.id`. It answers: *Which telephone interview is linked to each researcher?* For `researcher_id = 89419`, the view yields `interview_id = 134386ba-9bad-11eb-a8a2-19ed5c03f8d3`, `duration_minutes = 35`, and `interviewer_id = 10238280`. The row for `researcher_id = 1450639` shows `duration_minutes = 44`, the longest interview in the dataset, suggesting a deeper engagement with the most senior researcher in the sample.

**View `vw_researcher_telephone_interview`**

```sql
CREATE VIEW vw_researcher_telephone_interview AS
SELECT a.researcher_id, a.nationality, a.career_stage, a.gender, b.id AS interview_id, b.interview_id AS interview_interview_id, b.start_date AS interview_start_date
FROM researchers a JOIN telephone_interviews b ON a.telephone_interview_id = b.id;
```

| researcher_id | nationality | career_stage | gender | interview_id | interview_interview_id | interview_start_date |
|---|---|---|---|---|---|---|
| 89419 | composite-national-39 | early-career | compact-gender-62 | 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 |
| 2618557 | primary-national-40 | mid-career | composite-gender-63 | 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 |
| 9736892 | adaptive-national-41 | senior | primary-gender-64 | 102 | 611507 | 2024-07-27T10:58:00 |
| 1450639 | distributed-national-42 | early-career | adaptive-gender-65 | 103 | 4060647 | 2025-12-11T17:15:00 |

The view `vw_survey_response_researcher` performs the inverse join of `vw_researcher_survey_response`, joining `survey_responses` to `researchers` on `survey_responses.researcher_id = researchers.researcher_id`. It answers: *Which researcher submitted each survey response?* For `response_id = ChIJr7cItPtt5kcRM6ry7ecIYgw`, the view returns `researcher_id = 89419`, `nationality = composite-national-39`, and `sector = public`. The row for `response_id = Invoice` links to `researcher_id = 1450639`, `career_stage = early-career`, and `sector = private`, revealing that the private-sector early-career researcher produced the highest-scoring partial response.

**View `vw_survey_response_researcher`**

```sql
CREATE VIEW vw_survey_response_researcher AS
SELECT a.response_id, a.submission_date, a.respondent_status, a.total_score, b.researcher_id AS researcher_researcher_id, b.nationality AS researcher_nationality, b.career_stage AS researcher_career_stage
FROM survey_responses a JOIN researchers b ON a.researcher_id = b.researcher_id;
```

| response_id | submission_date | respondent_status | total_score | researcher_researcher_id | researcher_nationality | researcher_career_stage |
|---|---|---|---|---|---|---|
| ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india | 16.45 | 89419 | composite-national-39 | early-career |
| 9736917 | 2022-09-08T10:14:00 | commuter | 19.90 | 2618557 | primary-national-40 | mid-career |
| 8189493 | 2023-02-19T17:31:00 | future-interested | 23.35 | 9736892 | adaptive-national-41 | senior |
| Invoice | 2024-07-03T00:48:00 | based-in-india | 26.80 | 1450639 | distributed-national-42 | early-career |

The view `vw_survey_response_policy_instrument` joins `survey_responses` to `policy_instruments` on `survey_responses.policy_instrument_id = policy_instruments.id`. It answers: *Which policy instrument is associated with each survey response?* For `response_id = ChIJr7cItPtt5kcRM6ry7ecIYgw`, the view yields `instrument_name = Distributed Initiative`, `launch_date = 2022-05-17`, and `status = proposed`. The row for `response_id = 9736917` links to `instrument_name = Adaptive Model D` with `status = launched`, showing that the survey was administered after the policy had moved from proposal to launch.

**View `vw_survey_response_policy_instrument`**

```sql
CREATE VIEW vw_survey_response_policy_instrument AS
SELECT a.response_id, a.submission_date, a.respondent_status, a.total_score, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.instrument_name AS instrument_instrument_name
FROM survey_responses a JOIN policy_instruments b ON a.policy_instrument_id = b.id;
```

| response_id | submission_date | respondent_status | total_score | instrument_id | instrument_instrument_id | instrument_instrument_name |
|---|---|---|---|---|---|---|
| ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india | 16.45 | 1 | 6926365 | Distributed Initiative |
| 9736917 | 2022-09-08T10:14:00 | commuter | 19.90 | 2 | account_pymes_691 | Adaptive Model D |
| 8189493 | 2023-02-19T17:31:00 | future-interested | 23.35 | 3 | 726063 | Primary Cluster |
| Invoice | 2024-07-03T00:48:00 | based-in-india | 26.80 | 4 | 23256422 | Composite Review |

The view `vw_telephone_interview_researcher` joins `telephone_interviews` to `researchers` on `telephone_interviews.researcher_id = researchers.researcher_id`. It answers: *Which researcher was interviewed in each telephone interview?* For `id = 100`, the view returns `researcher_id = 89419`, `nationality = composite-national-39`, and `primary_field = pilot-primary-20`. The row for `id = 103` links to `researcher_id = 1450639`, `career_stage = early-career`, and `primary_field = seasonal-primary-23`, confirming that the most recent interview (dated `2025-12-11`) involved an early-career researcher in the seasonal-primary field.

**View `vw_telephone_interview_researcher`**

```sql
CREATE VIEW vw_telephone_interview_researcher AS
SELECT a.id, a.interview_id, a.start_date, a.end_date, b.researcher_id AS researcher_researcher_id, b.nationality AS researcher_nationality, b.career_stage AS researcher_career_stage
FROM telephone_interviews a JOIN researchers b ON a.researcher_id = b.researcher_id;
```

| id | interview_id | start_date | end_date | researcher_researcher_id | researcher_nationality | researcher_career_stage |
|---|---|---|---|---|---|---|
| 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 89419 | composite-national-39 | early-career |
| 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2618557 | primary-national-40 | mid-career |
| 102 | 611507 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 9736892 | adaptive-national-41 | senior |
| 103 | 4060647 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1450639 | distributed-national-42 | early-career |

The view `vw_telephone_interview_geographic_location` joins `telephone_interviews` to `geographic_locations` on `telephone_interviews.geographic_location_id = geographic_locations.id`. It answers: *Which geographic location was the setting for each telephone interview?* For `id = 100`, the view yields `location_name = Legacy Review D`, `country_code = 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`, and `region_type = country`. The row for `id = 101` shows `location_name = Regional Initiative` with `region_type = city`, indicating that the second interview took place in an urban setting.

**View `vw_telephone_interview_geographic_location`**

```sql
CREATE VIEW vw_telephone_interview_geographic_location AS
SELECT a.id, a.interview_id, a.start_date, a.end_date, b.id AS location_id, b.location_id AS location_location_id, b.location_name AS location_location_name
FROM telephone_interviews a JOIN geographic_locations b ON a.geographic_location_id = b.id;
```

| id | interview_id | start_date | end_date | location_id | location_location_id | location_location_name |
|---|---|---|---|---|---|---|
| 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 778556 | Legacy Review D |
| 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1250220 | Regional Initiative |
| 102 | 611507 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 14511 | Seasonal Model |
| 103 | 4060647 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 611510 | Integrated Cluster A |

The view `vw_telephone_interview_qualitative_insight` joins `telephone_interviews` to `qualitative_insights` on `telephone_interviews.qualitative_insight_id = qualitative_insights.id`. It answers: *Which qualitative insight was derived from each telephone interview?* For `id = 100`, the view returns `theme = baseline-theme-79`, `sentiment = positive`, and `priority_level = 22`. The row for `id = 101` shows `theme = pilot-theme-80` with `sentiment = negative`, demonstrating that the model captures both the thematic classification and the affective valence of each interview's qualitative output.

**View `vw_telephone_interview_qualitative_insight`**

```sql
CREATE VIEW vw_telephone_interview_qualitative_insight AS
SELECT a.id, a.interview_id, a.start_date, a.end_date, b.id AS insight_id, b.insight_id AS insight_insight_id, b.theme AS insight_theme
FROM telephone_interviews a JOIN qualitative_insights b ON a.qualitative_insight_id = b.id;
```

| id | interview_id | start_date | end_date | insight_id | insight_insight_id | insight_theme |
|---|---|---|---|---|---|---|
| 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 7119788 | baseline-theme-79 |
| 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1437583 | pilot-theme-80 |
| 102 | 611507 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 10782168 | extended-theme-81 |
| 103 | 4060647 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 7731881 | integrated-theme-82 |

The view `vw_geographic_location_researcher` performs the inverse join of `vw_researcher_geographic_location`, joining `geographic_locations` to `researchers` on `geographic_locations.researcher_id = researchers.researcher_id`. It answers: *Which researchers are associated with each geographic location?* For `id = 1`, the view yields `researcher_id = 89419`, `nationality = composite-national-39`, and `sector = public`. The row for `id = 4` links to `researcher_id = 1450639`, `career_stage = early-career`, and `sector = private`, showing that the country-level location `Integrated Cluster A` is associated with a private-sector early-career researcher.

**View `vw_geographic_location_researcher`**

```sql
CREATE VIEW vw_geographic_location_researcher AS
SELECT a.id, a.location_id, a.location_name, a.country_code, b.researcher_id AS researcher_researcher_id, b.nationality AS researcher_nationality, b.career_stage AS researcher_career_stage
FROM geographic_locations a JOIN researchers b ON a.researcher_id = b.researcher_id;
```

| id | location_id | location_name | country_code | researcher_researcher_id | researcher_nationality | researcher_career_stage |
|---|---|---|---|---|---|---|
| 1 | 778556 | Legacy Review D | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 89419 | composite-national-39 | early-career |
| 2 | 1250220 | Regional Initiative | lu_tax_code_template_m_I_2 | 2618557 | primary-national-40 | mid-career |
| 3 | 14511 | Seasonal Model | default_chart_a_account_57 | 9736892 | adaptive-national-41 | senior |
| 4 | 611510 | Integrated Cluster A | 727045 | 1450639 | distributed-national-42 | early-career |

The view `vw_geographic_location_telephone_interview` joins `geographic_locations` to `telephone_interviews` on `geographic_locations.telephone_interview_id = telephone_interviews.id`. It answers: *Which telephone interview was conducted in each geographic location?* For `id = 1`, the view returns `telephone_interview_id = 100`, `duration_minutes = 35`, and `interviewer_id = 10238280`. The row for `id = 3` links to `telephone_interview_id = 102`, `duration_minutes = 41`, and `interviewer_id = 6564396`, confirming that the province-level location `Seasonal Model` hosted an interview of moderate length.

**View `vw_geographic_location_telephone_interview`**

```sql
CREATE VIEW vw_geographic_location_telephone_interview AS
SELECT a.id, a.location_id, a.location_name, a.country_code, b.id AS interview_id, b.interview_id AS interview_interview_id, b.start_date AS interview_start_date
FROM geographic_locations a JOIN telephone_interviews b ON a.telephone_interview_id = b.id;
```

| id | location_id | location_name | country_code | interview_id | interview_interview_id | interview_start_date |
|---|---|---|---|---|---|---|
| 1 | 778556 | Legacy Review D | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 |
| 2 | 1250220 | Regional Initiative | lu_tax_code_template_m_I_2 | 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 |
| 3 | 14511 | Seasonal Model | default_chart_a_account_57 | 102 | 611507 | 2024-07-27T10:58:00 |
| 4 | 611510 | Integrated Cluster A | 727045 | 103 | 4060647 | 2025-12-11T17:15:00 |

The view `vw_policy_instrument_researcher` joins `policy_instruments` to `researchers` on `policy_instruments.researcher_id = researchers.researcher_id`. It answers: *Which researcher is associated with each policy instrument?* For `id = 1`, the view yields `researcher_id = 89419`, `nationality = composite-national-39`, and `primary_field = pilot-primary-20`. The row for `id = 4` links to `researcher_id = 1450639`, `career_stage = early-career`, and `primary_field = seasonal-primary-23`, showing that the most recently launched instrument (`Composite Review`, `2025-08-23`) is associated with an early-career researcher in the seasonal-primary field.

**View `vw_policy_instrument_researcher`**

```sql
CREATE VIEW vw_policy_instrument_researcher AS
SELECT a.id, a.instrument_id, a.instrument_name, a.launch_date, b.researcher_id AS researcher_researcher_id, b.nationality AS researcher_nationality, b.career_stage AS researcher_career_stage
FROM policy_instruments a JOIN researchers b ON a.researcher_id = b.researcher_id;
```

| id | instrument_id | instrument_name | launch_date | researcher_researcher_id | researcher_nationality | researcher_career_stage |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | 2022-05-17 | 89419 | composite-national-39 | early-career |
| 2 | account_pymes_691 | Adaptive Model D | 2023-10-01 | 2618557 | primary-national-40 | mid-career |
| 3 | 726063 | Primary Cluster | 2024-03-12 | 9736892 | adaptive-national-41 | senior |
| 4 | 23256422 | Composite Review | 2025-08-23 | 1450639 | distributed-national-42 | early-career |

The view `vw_policy_instrument_survey_response` joins `policy_instruments` to `survey_responses` on `policy_instruments.response_id = survey_responses.response_id`. It answers: *Which survey response is linked to each policy instrument?* For `id = 1`, the view returns `response_id = ChIJr7cItPtt5kcRM6ry7ecIYgw`, `total_score = 16.45`, and `completion_status = complete`. The row for `id = 4` links to `response_id = Invoice`, `total_score = 26.80`, and `completion_status = partial`, indicating that the most recently proposed policy instrument is associated with the highest-scoring but incomplete survey.

**View `vw_policy_instrument_survey_response`**

```sql
CREATE VIEW vw_policy_instrument_survey_response AS
SELECT a.id, a.instrument_id, a.instrument_name, a.launch_date, b.response_id AS response_response_id, b.submission_date AS response_submission_date, b.respondent_status AS response_respondent_status
FROM policy_instruments a JOIN survey_responses b ON a.response_id = b.response_id;
```

| id | instrument_id | instrument_name | launch_date | response_response_id | response_submission_date | response_respondent_status |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | 2022-05-17 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india |
| 2 | account_pymes_691 | Adaptive Model D | 2023-10-01 | 9736917 | 2022-09-08T10:14:00 | commuter |
| 3 | 726063 | Primary Cluster | 2024-03-12 | 8189493 | 2023-02-19T17:31:00 | future-interested |
| 4 | 23256422 | Composite Review | 2025-08-23 | Invoice | 2024-07-03T00:48:00 | based-in-india |

The view `vw_policy_instrument_telephone_interview` joins `policy_instruments` to `telephone_interviews` on `policy_instruments.telephone_interview_id = telephone_interviews.id`. It answers: *Which telephone interview is associated with each policy instrument?* For `id = 1`, the view yields `telephone_interview_id = 100`, `duration_minutes = 35`, and `interviewer_id = 10238280`. The row for `id = 3` links to `telephone_interview_id = 102`, `duration_minutes = 41`, and `interviewer_id = 6564396`, showing that the operational policy instrument `Primary Cluster` was discussed in a 41-minute interview.

**View `vw_policy_instrument_telephone_interview`**

```sql
CREATE VIEW vw_policy_instrument_telephone_interview AS
SELECT a.id, a.instrument_id, a.instrument_name, a.launch_date, b.id AS interview_id, b.interview_id AS interview_interview_id, b.start_date AS interview_start_date
FROM policy_instruments a JOIN telephone_interviews b ON a.telephone_interview_id = b.id;
```

| id | instrument_id | instrument_name | launch_date | interview_id | interview_interview_id | interview_start_date |
|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | 2022-05-17 | 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 |
| 2 | account_pymes_691 | Adaptive Model D | 2023-10-01 | 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 |
| 3 | 726063 | Primary Cluster | 2024-03-12 | 102 | 611507 | 2024-07-27T10:58:00 |
| 4 | 23256422 | Composite Review | 2025-08-23 | 103 | 4060647 | 2025-12-11T17:15:00 |

The view `vw_qualitative_insight_telephone_interview` joins `qualitative_insights` to `telephone_interviews` on `qualitative_insights.telephone_interview_id = telephone_interviews.id`. It answers: *Which telephone interview produced each qualitative insight?* For `id = 1`, the view returns `telephone_interview_id = 100`, `duration_minutes = 35`, and `start_date = 2022-09-05T20:24:00`. The row for `id = 4` links to `telephone_interview_id = 103`, `duration_minutes = 44`, and `start_date = 2025-12-11T17:15:00`, confirming that the most recent interview generated the insight with the highest priority level (`31`).

**View `vw_qualitative_insight_telephone_interview`**

```sql
CREATE VIEW vw_qualitative_insight_telephone_interview AS
SELECT a.id, a.insight_id, a.theme, a.sentiment, b.id AS interview_id, b.interview_id AS interview_interview_id, b.start_date AS interview_start_date
FROM qualitative_insights a JOIN telephone_interviews b ON a.telephone_interview_id = b.id;
```

| id | insight_id | theme | sentiment | interview_id | interview_interview_id | interview_start_date |
|---|---|---|---|---|---|---|
| 1 | 7119788 | baseline-theme-79 | positive | 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 |
| 2 | 1437583 | pilot-theme-80 | negative | 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 |
| 3 | 10782168 | extended-theme-81 | neutral | 102 | 611507 | 2024-07-27T10:58:00 |
| 4 | 7731881 | integrated-theme-82 | positive | 103 | 4060647 | 2025-12-11T17:15:00 |

The view `vw_qualitative_insight_policy_instrument` joins `qualitative_insights` to `policy_instruments` on `qualitative_insights.policy_instrument_id = policy_instruments.id`. It answers: *Which policy instrument is evaluated by each qualitative insight?* For `id = 1`, the view yields `instrument_name = Distributed Initiative`, `launch_date = 2022-05-17`, and `status = proposed`. The row for `id = 3` links to `instrument_name = Primary Cluster`, `status = operational`, and `target_group = adaptive-target-83`, showing that the qualitative insight with neutral sentiment (`extended-theme-81`) was generated in the context of an operational policy targeting the adaptive group.

**View `vw_qualitative_insight_policy_instrument`**

```sql
CREATE VIEW vw_qualitative_insight_policy_instrument AS
SELECT a.id, a.insight_id, a.theme, a.sentiment, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.instrument_name AS instrument_instrument_name
FROM qualitative_insights a JOIN policy_instruments b ON a.policy_instrument_id = b.id;
```

| id | insight_id | theme | sentiment | instrument_id | instrument_instrument_id | instrument_instrument_name |
|---|---|---|---|---|---|---|
| 1 | 7119788 | baseline-theme-79 | positive | 1 | 6926365 | Distributed Initiative |
| 2 | 1437583 | pilot-theme-80 | negative | 2 | account_pymes_691 | Adaptive Model D |
| 3 | 10782168 | extended-theme-81 | neutral | 3 | 726063 | Primary Cluster |
| 4 | 7731881 | integrated-theme-82 | positive | 4 | 23256422 | Composite Review |

## Synthesis

The model organizes policy research data into six normalized base tables, each anchored by a surrogate primary key and connected through foreign-key columns that enforce referential integrity across the researcher, survey, interview, geographic, policy, and qualitative-insight dimensions. The twenty views rejoin these fragments along every pairwise axis, enabling analysts to query the data from whichever entity-centric perspective is most convenient—whether that is "which geographic location is associated with each researcher" (`vw_researcher_geographic_location`), "which survey response was submitted by each researcher" (`vw_researcher_survey_response`), or "which qualitative insight was derived from each telephone interview" (`vw_telephone_interview_qualitative_insight`). The concrete values in the data—`researcher_id = 89419` with `total_score = 16.45` and `completion_status = complete`, `response_id = Invoice` with `total_score = 26.80` and `completion_status = partial`, `telephone_interview_id = 103` with `duration_minutes = 44` and `priority_level = 31`—serve as evidence that the model faithfully preserves the domain's multi-faceted relationships while remaining structurally sound for both analytical querying and constraint-based validation.