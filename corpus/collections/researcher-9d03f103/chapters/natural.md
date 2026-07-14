## The Researcher Registry

Research organizations that operate across multiple jurisdictions require systematic tracking of their personnel, the instruments they evaluate, and the data they collect through surveys and interviews. The foundation of such a system is the researcher registry, which captures demographic and professional attributes alongside the geographic and operational contexts in which each individual works.

**Table `researchers`**

| researcher_id | nationality | career_stage | gender | sector | primary_field | geographic_location_id | response_id | telephone_interview_id |
|---|---|---|---|---|---|---|---|---|
| 89419 | composite-national-39 | early-career | compact-gender-62 | public | pilot-primary-20 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 100 |
| 2618557 | primary-national-40 | mid-career | composite-gender-63 | private | extended-primary-21 | 2 | 9736917 | 101 |
| 9736892 | adaptive-national-41 | senior | primary-gender-64 | public | integrated-primary-22 | 3 | 8189493 | 102 |
| 1450639 | distributed-national-42 | early-career | adaptive-gender-65 | private | seasonal-primary-23 | 4 | Invoice | 103 |

Each researcher record carries a unique numeric identifier—researcher_id—that anchors all downstream relationships. The registry distinguishes personnel by nationality classification, career stage, gender categorization, sector affiliation, and primary field of expertise. For example, researcher 89419 is classified as early-career, works in the public sector, and holds a pilot-primary-20 designation, while researcher 2618557 represents a mid-career professional in the private sector with an extended-primary-21 field. The geographic_location_id column links each person to a physical location record, and the response_id and telephone_interview_id columns serve as forward references to the survey and interview data collected from or about that individual.

## Survey Response Records

Survey instruments administered to researchers produce structured response records that capture submission timing, respondent status, aggregate scoring, and completion state.

**Table `survey_responses`**

| response_id | submission_date | respondent_status | total_score | completion_status | researcher_id | policy_instrument_id |
|---|---|---|---|---|---|---|
| ChIJr7cItPtt5kcRM6ry7ecIYgw | 2025-04-24T03:57:00 | based-in-india | 16.45 | complete | 89419 | 1 |
| 9736917 | 2022-09-08T10:14:00 | commuter | 19.90 | partial | 2618557 | 2 |
| 8189493 | 2023-02-19T17:31:00 | future-interested | 23.35 | complete | 9736892 | 3 |
| Invoice | 2024-07-03T00:48:00 | based-in-india | 26.80 | partial | 1450639 | 4 |

The survey_responses table uses response_id as its primary key, with values ranging from alphanumeric identifiers such as ChIJr7cItPtt5kcRM6ry7ecIYgw to numeric codes like 9736917 and even string-based identifiers such as Invoice. Submission dates span from September 2022 through July 2024, reflecting a longitudinal data collection effort. The respondent_status column classifies individuals as based-in-india, commuter, or future-interested, while total_score records a numeric assessment ranging from 16.45 to 26.80 across the sample. Completion_status distinguishes between complete and partial submissions. Each response ties back to a specific researcher via researcher_id and to a policy instrument via policy_instrument_id, establishing the analytical bridge between personnel and the programs they evaluate.

## Telephone Interview Logs

Qualitative data collection through telephone interviews is documented in a dedicated log that records scheduling metadata, duration, and interviewer assignments.

**Table `telephone_interviews`**

| id | interview_id | start_date | end_date | duration_minutes | interviewer_id | researcher_id | geographic_location_id | qualitative_insight_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 134386ba-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 35 | 10238280 | 89419 | 1 | 1 |
| 101 | 46d471de-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 38 | account_pymes_659 | 2618557 | 2 | 2 |
| 102 | 611507 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 41 | 6564396 | 9736892 | 3 | 3 |
| 103 | 4060647 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 44 | 2933459 | 1450639 | 4 | 4 |

The telephone_interviews table uses a composite key structure: the id column (100 through 103) serves as the primary record identifier, while interview_id carries UUID-style identifiers such as 134386ba-9bad-11eb-a8a2-19ed5c03f8d3. Start and end dates define the interview window, with duration_minutes ranging from 35 to 44 minutes in the sample. Interviewer_id values include both numeric identifiers like 10238280 and string-based codes such as account_pymes_659. Each interview links to a researcher through researcher_id, to a geographic location through geographic_location_id, and to a qualitative insight through qualitative_insight_id, creating a three-way join that connects the interview event to its human, spatial, and thematic dimensions.

## Geographic Location Records

Physical and administrative locations where research activities occur are cataloged separately, enabling spatial analysis and regional aggregation.

**Table `geographic_locations`**

| id | location_id | location_name | country_code | region_type | researcher_id | telephone_interview_id |
|---|---|---|---|---|---|---|
| 1 | 778556 | Legacy Review D | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | country | 89419 | 100 |
| 2 | 1250220 | Regional Initiative | lu_tax_code_template_m_I_2 | city | 2618557 | 101 |
| 3 | 14511 | Seasonal Model | default_chart_a_account_57 | province | 9736892 | 102 |
| 4 | 611510 | Integrated Cluster A | 727045 | country | 1450639 | 103 |

The geographic_locations table uses id as its primary key, with location_id providing an additional identifier such as 778556 or 1250220. Location names include Legacy Review D, Regional Initiative, Seasonal Model, and Integrated Cluster A. The country_code column holds values ranging from UUID fragments like 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 to string codes such as lu_tax_code_template_m_I_2. Region_type distinguishes between country, city, and province classifications. Each location record connects to a researcher via researcher_id and to a telephone interview via telephone_interview_id, anchoring spatial context to both personnel and interview events.

## Policy Instrument Catalog

Programs, initiatives, and policy mechanisms under evaluation are documented with their launch dates, operational status, and target populations.

**Table `policy_instruments`**

| id | instrument_id | instrument_name | launch_date | status | target_group | researcher_id | response_id | telephone_interview_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6926365 | Distributed Initiative | 2022-05-17 | proposed | composite-target-81 | 89419 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 100 |
| 2 | account_pymes_691 | Adaptive Model D | 2023-10-01 | launched | primary-target-82 | 2618557 | 9736917 | 101 |
| 3 | 726063 | Primary Cluster | 2024-03-12 | operational | adaptive-target-83 | 9736892 | 8189493 | 102 |
| 4 | 23256422 | Composite Review | 2025-08-23 | proposed | distributed-target-84 | 1450639 | Invoice | 103 |

The policy_instruments table uses id as its primary key, with instrument_id providing secondary identifiers such as 6926365 or account_pymes_691. Instrument names include Distributed Initiative, Adaptive Model D, Primary Cluster, and Composite Review. Launch dates span from May 2022 to August 2025, reflecting a pipeline of programs at various stages of development. The status column records proposed, launched, or operational states, while target_group classifies the intended audience using codes such as composite-target-81 and primary-target-82. Each instrument links to a researcher, a survey response, and a telephone interview, ensuring that every program evaluation can be traced back to the personnel and data collection events that produced it.

## Qualitative Insight Entries

Thematic analysis of interview content is captured in structured insight records that encode sentiment, priority, and narrative summaries.

**Table `qualitative_insights`**

| id | insight_id | theme | sentiment | priority_level | summary_text | telephone_interview_id | policy_instrument_id |
|---|---|---|---|---|---|---|---|
| 1 | 7119788 | baseline-theme-79 | positive | 22 | distributed-summary-24 | 100 | 1 |
| 2 | 1437583 | pilot-theme-80 | negative | 25 | baseline-summary-25 | 101 | 2 |
| 3 | 10782168 | extended-theme-81 | neutral | 28 | pilot-summary-26 | 102 | 3 |
| 4 | 7731881 | integrated-theme-82 | positive | 31 | extended-summary-27 | 103 | 4 |

The qualitative_insights table uses id as its primary key, with insight_id providing identifiers such as 7119788 or 1437583. The theme column records categorical labels like baseline-theme-79, pilot-theme-80, extended-theme-81, and integrated-theme-82. Sentiment values are positive, negative, or neutral, while priority_level assigns a numeric rank ranging from 22 to 31. Summary_text provides a brief narrative descriptor such as distributed-summary-24 or baseline-summary-25. Each insight connects to a telephone interview via telephone_interview_id and to a policy instrument via policy_instrument_id, forming the analytical endpoint that links qualitative findings to both the interview event and the program being evaluated.

## Cross-Referenced Researcher Views

The researcher-centric views consolidate the multi-table relationships into unified records that answer questions about individual researchers and their associated data.

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

This view joins the researcher registry with geographic location records, answering which location is associated with each researcher. For researcher 89419, the join reveals location Legacy Review D classified as a country-level entity, while researcher 2618557 is linked to Regional Initiative at the city level. The view enables spatial profiling of the research workforce, showing how personnel are distributed across administrative boundaries.

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

By linking researchers to their survey responses, this view answers which survey data belongs to each individual and what the response characteristics are. Researcher 89419 submitted a complete response with a total_score of 16.45 on 2025-04-24, while researcher 1450639 submitted a partial response scoring 26.80 on 2024-07-03. The view supports performance analysis across career stages and sectors, revealing that early-career public-sector researchers like 89419 produced lower scores than their private-sector counterparts.

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

This view connects researchers to their telephone interview records, answering when and how long each interview lasted and which interviewer conducted it. Researcher 89419 participated in interview 100 with interviewer 10238280 for 35 minutes, while researcher 1450639 was interviewed for 44 minutes by interviewer 2933459. The view enables scheduling analysis and interviewer workload assessment across the research team.

## Survey Response Perspectives

The survey-centric views reorient the relationships to answer questions about response records and their connections to researchers and policy instruments.

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

This view reverses the researcher-to-survey relationship, answering which researcher produced each response and what their professional attributes are. Response ChIJr7cItPtt5kcRM6ry7ecIYgw was submitted by researcher 89419, an early-career public-sector professional with a pilot-primary-20 field designation. Response Invoice was submitted by researcher 1450639, also early-career but in the private sector with a seasonal-primary-23 field. This perspective supports response-level auditing and demographic analysis of survey participation.

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

By joining survey responses to policy instruments, this view answers which program each response evaluates and what the instrument's characteristics are. Response ChIJr7cItPtt5kcRM6ry7ecIYgw evaluates instrument 6926365, the Distributed Initiative, which is in proposed status with target_group composite-target-81. Response 9736917 evaluates instrument account_pymes_691, the Adaptive Model D, which is launched and targets primary-target-82. This view enables program-level evaluation aggregation and status tracking.

## Telephone Interview Linkages

The telephone interview views connect interview records to researchers, locations, and qualitative insights, enabling comprehensive interview analysis.

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

This view links telephone interviews to the researchers who participated, answering who was interviewed and what their professional profile is. Interview 100 involved researcher 89419, an early-career public-sector professional, while interview 103 involved researcher 1450639, also early-career but in the private sector. The view supports participant profiling and sector-based interview analysis.

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

This view connects telephone interviews to their geographic contexts, answering where each interview took place and what the location classification is. Interview 100 occurred at location 778556 (Legacy Review D), classified as a country-level entity, while interview 101 occurred at location 1250220 (Regional Initiative), classified as a city. The view enables spatial distribution analysis of interview activities.

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

This view links telephone interviews to their associated qualitative insights, answering what thematic findings emerged from each interview. Interview 100 produced insight 7119788 with theme baseline-theme-79, positive sentiment, and priority_level 22. Interview 101 produced insight 1437583 with theme pilot-theme-80, negative sentiment, and priority_level 25. The view enables thematic trend analysis across the interview corpus.

## Geographic Location Associations

The geographic location views reorient the relationships to answer questions about locations and their connections to researchers and interviews.

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

This view reverses the location-to-researcher relationship, answering which researchers are associated with each location. Location 1 (Legacy Review D) is associated with researcher 89419, an early-career public-sector professional, while location 4 (Integrated Cluster A) is associated with researcher 1450639, an early-career private-sector professional. This perspective supports location-level workforce analysis and regional capacity assessment.

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

This view connects geographic locations to their telephone interviews, answering which interviews occurred at each location and what the interview metadata is. Location 1 hosted interview 100, which lasted 35 minutes and was conducted by interviewer 10238280. Location 4 hosted interview 103, which lasted 44 minutes and was conducted by interviewer 2933459. The view enables location-level interview scheduling and resource planning.

## Policy Instrument Connections

The policy instrument views link programs to researchers, survey responses, and telephone interviews, enabling comprehensive program evaluation tracking.

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

This view connects policy instruments to the researchers who evaluated them, answering which researcher assessed each program. Instrument 6926365 (Distributed Initiative) was evaluated by researcher 89419, an early-career public-sector professional. Instrument account_pymes_691 (Adaptive Model D) was evaluated by researcher 2618557, a mid-career private-sector professional. The view supports evaluator assignment tracking and sector-based evaluation coverage analysis.

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

This view links policy instruments to their survey responses, answering which response evaluated each program and what the response characteristics were. Instrument 6926365 received response ChIJr7cItPtt5kcRM6ry7ecIYgw with a total_score of 16.45 and complete status. Instrument 23256422 (Composite Review) received response Invoice with a total_score of 26.80 and partial status. The view enables program-level score aggregation and completion rate analysis.

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

This view connects policy instruments to their telephone interviews, answering which interview discussed each program and what the interview metadata was. Instrument 6926365 was discussed in interview 100, which lasted 35 minutes. Instrument 23256422 was discussed in interview 103, which lasted 44 minutes. The view supports program-level interview coverage analysis and duration-based engagement assessment.

## Qualitative Insight Relationships

The qualitative insight views link thematic findings to telephone interviews and policy instruments, enabling comprehensive thematic analysis.

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

This view connects qualitative insights to their source telephone interviews, answering which interview produced each insight and what the interview metadata was. Insight 7119788 (theme baseline-theme-79, positive sentiment) originated from interview 100, which lasted 35 minutes. Insight 1437583 (theme pilot-theme-80, negative sentiment) originated from interview 101, which lasted 38 minutes. The view enables interview-to-insight traceability and sentiment distribution analysis.

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

This view links qualitative insights to the policy instruments they evaluate, answering which program each insight addresses and what the instrument's characteristics are. Insight 7119788 evaluates instrument 6926365 (Distributed Initiative, proposed status), while insight 1437583 evaluates instrument account_pymes_691 (Adaptive Model D, launched status). The view enables program-level thematic aggregation and sentiment-based program prioritization.

## Closing Synthesis

The data model described in this chapter captures a complete research evaluation ecosystem: researchers are registered with their professional and demographic attributes, surveyed with structured instruments producing scored responses, interviewed via telephone with duration and interviewer metadata, geographically anchored to administrative locations, and evaluated against a catalog of policy instruments whose qualitative findings are recorded as thematic insights. The twenty-one cross-referenced views ensure that every entity can be examined from every relational angle—researcher-centric, response-centric, interview-centric, location-centric, instrument-centric, and insight-centric—supporting both granular auditing and aggregate analytical workflows across the full research lifecycle.