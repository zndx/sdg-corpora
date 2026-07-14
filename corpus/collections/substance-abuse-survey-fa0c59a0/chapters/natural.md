## Substance Abuse Treatment Coordination: Data Architecture and Operational Relationships

State and regional health agencies manage substance abuse treatment through a network of coordinated entities: survey instruments that capture population-level prevalence, treatment facilities delivering care, funding streams allocating resources, coordinating councils governing service areas, and referral events linking individuals to programs. The data model underlying this ecosystem records every operational artifact—from the initial survey design through final referral outcomes—enabling administrators to trace how funding reaches facilities, how councils oversee service delivery, and how patient demographics inform referral patterns. This chapter documents the core tables and their joined views, showing how raw records combine into actionable intelligence.

At the foundation of the system are the survey and form tables, which capture the instruments used to measure substance abuse prevalence across jurisdictions.

**Table `substance_abuse_surveys`**

| id | survey_id | conducted_date | response_rate | total_counties_responded | data_format | status |
|---|---|---|---|---|---|---|
| 100 | 21005921 | 2023-06-03T17:51:00 | 18.45 | 41 | electronic | planned |
| 101 | 726059 | 2024-11-14T00:08:00 | 21.90 | 23 | paper | active |
| 102 | 32814 | 2025-04-25T07:25:00 | 25.35 | 100 | hybrid | complete |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-09-09T14:42:00 | 28.80 | 3 | electronic | archived |

Each survey record represents a data collection initiative conducted across counties. The `survey_id` serves as the external identifier, while `conducted_date` timestamps when the collection occurred. Response rates vary considerably: Survey `21005921` achieved only 18.45% response across 41 counties, whereas Survey `32814` reached 25.35% across all 100 counties. The `data_format` column distinguishes between electronic, paper, and hybrid collection methods, and `status` tracks the lifecycle stage—planned, active, complete, or archived. Survey `b83e028a-8fcd-11eb-924d-9cd76263cbd0`, conducted in September 2022, has been archived after reaching completion.

**Table `substance_abuse_forms`**

| id | form_code | form_name | prevalence_rate | risk_category | is_controlled_substance | substance_abuse_survey_id |
|---|---|---|---|---|---|---|
| 1 | 12616 | Primary Framework A | 22.45 | high | true | 100 |
| 2 | 2087755 | Composite Protocol | 25.90 | medium | false | 101 |
| 3 | template_impcode_pagata_4det50 | Compact Programme | 29.35 | low | true | 102 |
| 4 | id_9 | Legacy Standard D | 32.80 | high | false | 103 |

Forms are the structured instruments deployed within surveys. Each form carries a `form_code`—ranging from numeric codes like `12616` to template identifiers like `template_impcode_pagata_4det50`—and a human-readable `form_name` such as "Primary Framework A" or "Compact Programme." The `prevalence_rate` records the measured prevalence for that instrument, spanning from 22.45% to 32.80%. The `risk_category` classifies each form as high, medium, or low risk, while `is_controlled_substance` flags whether the form addresses controlled substances. Every form is linked to its parent survey via `substance_abuse_survey_id`, establishing the hierarchical relationship between survey and instrument.

**Table `treatment_facilities`**

| id | facility_id | facility_name | facility_type | county_location | capacity | accepts_medicaid | funding_source_id |
|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | outpatient | regional-county-30 | 32 | false | 1 |
| 2 | 1040 | Extended Programme | inpatient | legacy-county-31 | 41 | true | 2 |
| 3 | 2986228 | Pilot Standard | opioid_treatment | compact-county-32 | 50 | false | 3 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | specialty_court | composite-county-33 | 59 | true | 4 |

Treatment facilities represent the operational backbone of service delivery. The `facility_id` provides a unique external identifier—some numeric like `69447`, others UUID-style like `ChIJvSxSbfdv5kcRanVzI8RRu20`. Facility names such as "Integrated Protocol A" and "Extended Programme" identify the program, while `facility_type` categorizes the care model: outpatient, inpatient, opioid_treatment, or specialty_court. Each facility operates within a `county_location` (e.g., "regional-county-30") and has a defined `capacity` ranging from 32 to 59 beds. The `accepts_medicaid` boolean indicates whether the facility participates in Medicaid, and `funding_source_id` links the facility to its primary financial backer.

**Table `funding_sources`**

| id | funding_id | source_name | total_amount | currency | fiscal_year | allocation_type |
|---|---|---|---|---|---|---|
| 1 | 9568468 | Composite Model | 112.11 | seasonal-currency-71 | 17 | grant |
| 2 | 103191 | Compact Cluster A | 1,979 | regional-currency-72 | 20 | fine |
| 3 | 4180965 | Legacy Review | 15,418 | legacy-currency-73 | 23 | fee |
| 4 | 1152670 | Regional Initiative | 12,579 | compact-currency-74 | 26 | appropriation |

Funding sources provide the financial infrastructure supporting treatment operations. Each source carries a `funding_id` (e.g., `9568468` or `103191`), a `source_name` like "Composite Model" or "Compact Cluster A," and a `total_amount` ranging from $112.11 to $15,418. The `currency` field uses domain-specific currency codes such as "seasonal-currency-71" and "regional-currency-72," while `fiscal_year` identifies the budget cycle (years 17 through 26 in the current dataset). The `allocation_type` distinguishes between grant, fine, fee, and appropriation mechanisms.

**Table `coordinating_councils`**

| coordinating_council_id | council_id | council_name | county_served | has_funding_available | utilization_rate | established_date | funding_source_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | baseline-county-37 | false | 4.20 | 2024-03-27 | 1 | 2025-01-01 00:14:00 |
| 2 | Bjornfant | Regional Framework | pilot-county-38 | true | 7.40 | 2025-08-11 | 2 | 2025-02-06 03:14:00 |
| 3 | 726041 | Seasonal Protocol | extended-county-39 | false | 10.60 | 2022-01-22 | 3 | 2025-03-11 06:14:00 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | integrated-county-40 | true | 13.80 | 2023-06-06 | 4 | 2025-04-16 09:14:00 |

Coordinating councils govern service delivery across geographic areas. Each council has a `council_id` (UUID-style identifiers like `ae409270-8fcd-11eb-924d-9cd76263cbd0` or names like "Bjornfant"), a `council_name` such as "Legacy Standard D" or "Regional Framework," and a `county_served` designation. The `has_funding_available` flag indicates resource availability, while `utilization_rate` measures how intensively the council's services are used—ranging from 4.20 to 13.80. The `established_date` records when the council was formed, and `funding_source_id` links the council to its financial support.

**Table `referral_events`**

| id | referral_id | referral_date | monthly_volume | source_system | outcome_status | recidivism_rate | treatment_facility_id | demographic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9736917 | 2022-05-20T04:48:00 | 31 | criminal_justice | completed | 13.70 | 1 | levels | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 34 | healthcare | dropped_out | 15.40 | 2 | 32824 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844263 | 2024-03-15T18:22:00 | 37 | self_referral | ongoing | 17.10 | 3 | coms1 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | group_system | 2025-08-26T01:39:00 | 40 | employer | failed | 18.80 | 4 | id_24 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Referral events document the pathway from assessment to treatment placement. Each event carries a `referral_id` (numeric like `9736917` or UUID-style like `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `referral_date`, and a `monthly_volume` indicating the number of referrals in that period (31 through 40 in the current data). The `source_system` identifies the originating channel—criminal_justice, healthcare, self_referral, or employer—while `outcome_status` tracks the result: completed, dropped_out, ongoing, or failed. The `recidivism_rate` measures re-offending among referred individuals, ranging from 13.70% to 18.80%. Each referral links to a `treatment_facility_id` and a `demographic_id`, connecting the event to both the receiving facility and the patient's demographic profile.

**Table `patient_demographics`**

| demographic_id | primary_race | primary_gender | has_health_insurance | is_veteran | is_pregnant | access_to_care | funding_source_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| levels | African American | Male | true | false | true | full | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 32824 | Caucasian | Female | false | true | false | limited | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| coms1 | Asian | Non-binary | true | false | true | none | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| id_24 | Hispanic | Male | false | true | false | full | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Patient demographics capture the characteristics of individuals entering the treatment system. Demographic identifiers range from simple labels like "levels" to structured codes like "32824," "coms1," and "id_24." These identifiers link to referral events and treatment facilities, enabling analysis of how patient characteristics correlate with outcomes.

The relational model extends beyond base tables through junction tables that establish many-to-many relationships between entities.

**Table `surveys_forms`**

| substance_abuse_survey_id | substance_abuse_form_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The surveys_forms junction table links surveys to the forms they contain, enabling a single survey to deploy multiple instruments and a form to be reused across surveys.

**Table `forms_facilities`**

| substance_abuse_form_id | treatment_facility_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Forms_facilities connects assessment instruments to treatment facilities, indicating which forms each facility utilizes in its intake and assessment processes.

**Table `facilities_forms`**

| treatment_facility_id | substance_abuse_form_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Facilities_forms provides an alternative linkage perspective, mapping facilities to the forms they employ for patient evaluation and treatment planning.

**Table `sources_facilities`**

| funding_source_id | treatment_facility_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Sources_facilities establishes the financial relationships between funding sources and treatment facilities, documenting which facilities receive support from which funding streams.

**Table `sources_councils`**

| funding_source_id | coordinating_council_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Sources_councils links funding sources to coordinating councils, showing how financial resources flow from funding mechanisms to governance bodies.

**Table `councils_facilities`**

| coordinating_council_id | treatment_facility_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Councils_facilities connects coordinating councils to treatment facilities, defining the oversight and service-area relationships between governance bodies and care providers.

**Table `demographics_facilities`**

| demographic_id | treatment_facility_id |
|---|---|
| levels | 1 |
| levels | 2 |
| 32824 | 2 |
| 32824 | 3 |
| coms1 | 3 |
| coms1 | 4 |
| id_24 | 4 |
| id_24 | 1 |

Demographics_facilities links patient demographic profiles to treatment facilities, enabling analysis of which facilities serve which patient populations.

**Table `demographics_events`**

| demographic_id | referral_event_id |
|---|---|
| levels | 1000 |
| levels | 1001 |
| 32824 | 1001 |
| 32824 | 1002 |
| coms1 | 1002 |
| coms1 | 1003 |
| id_24 | 1003 |
| id_24 | 1000 |

Demographics_events connects patient demographics to referral events, providing the bridge between patient characteristics and their referral pathways.

The views in this system synthesize base tables and junction records into analytical perspectives that answer specific operational questions. Each view joins related tables to produce a unified record that administrators can query directly.

**View `substance_abuse_survey_substance_abuse_form_detail_view`**

```sql
CREATE VIEW substance_abuse_survey_substance_abuse_form_detail_view AS
SELECT a.id, a.survey_id, a.conducted_date, b.id AS form_id, b.form_code AS form_form_code, b.form_name AS form_form_name
FROM substance_abuse_surveys a
  JOIN surveys_forms j ON j.substance_abuse_survey_id = a.id
  JOIN substance_abuse_forms b ON b.id = j.substance_abuse_form_id;
```

| id | survey_id | conducted_date | form_id | form_form_code | form_form_name |
|---|---|---|---|---|---|
| 100 | 21005921 | 2023-06-03T17:51:00 | 1 | 12616 | Primary Framework A |
| 100 | 21005921 | 2023-06-03T17:51:00 | 2 | 2087755 | Composite Protocol |
| 101 | 726059 | 2024-11-14T00:08:00 | 2 | 2087755 | Composite Protocol |
| 101 | 726059 | 2024-11-14T00:08:00 | 3 | template_impcode_pagata_4det50 | Compact Programme |
| 102 | 32814 | 2025-04-25T07:25:00 | 3 | template_impcode_pagata_4det50 | Compact Programme |
| 102 | 32814 | 2025-04-25T07:25:00 | 4 | id_9 | Legacy Standard D |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-09-09T14:42:00 | 4 | id_9 | Legacy Standard D |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-09-09T14:42:00 | 1 | 12616 | Primary Framework A |

This view joins surveys with their associated forms, answering the question: "Which forms were deployed within each survey?" A row from this view might show Survey `21005921` (conducted 2023-06-03, 18.45% response rate) paired with form `12616` ("Primary Framework A," prevalence rate 22.45%, high risk category). This join enables administrators to audit which instruments were active during each survey period and compare prevalence rates across instruments within the same survey.

**View `substance_abuse_form_substance_abuse_survey_view`**

```sql
CREATE VIEW substance_abuse_form_substance_abuse_survey_view AS
SELECT a.id, a.form_code, a.form_name, a.prevalence_rate, b.id AS survey_id, b.survey_id AS survey_survey_id, b.conducted_date AS survey_conducted_date
FROM substance_abuse_forms a JOIN substance_abuse_surveys b ON a.substance_abuse_survey_id = b.id;
```

| id | form_code | form_name | prevalence_rate | survey_id | survey_survey_id | survey_conducted_date |
|---|---|---|---|---|---|---|
| 1 | 12616 | Primary Framework A | 22.45 | 100 | 21005921 | 2023-06-03T17:51:00 |
| 2 | 2087755 | Composite Protocol | 25.90 | 101 | 726059 | 2024-11-14T00:08:00 |
| 3 | template_impcode_pagata_4det50 | Compact Programme | 29.35 | 102 | 32814 | 2025-04-25T07:25:00 |
| 4 | id_9 | Legacy Standard D | 32.80 | 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-09-09T14:42:00 |

The inverse perspective, this view joins forms back to their parent surveys, answering: "Which survey did each form belong to?" A representative row links form `2087755` ("Composite Protocol," medium risk) to Survey `726059` (conducted 2024-11-14, 21.90% response rate, paper format). This view supports form-level reporting, allowing analysts to trace any instrument back to its originating survey and assess whether form-level prevalence rates correlate with survey-level response rates.

**View `substance_abuse_form_treatment_facility_detail_view`**

```sql
CREATE VIEW substance_abuse_form_treatment_facility_detail_view AS
SELECT a.id, a.form_code, a.form_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM substance_abuse_forms a
  JOIN forms_facilities j ON j.substance_abuse_form_id = a.id
  JOIN treatment_facilities b ON b.id = j.treatment_facility_id;
```

| id | form_code | form_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | 12616 | Primary Framework A | 1 | 69447 | Integrated Protocol A |
| 1 | 12616 | Primary Framework A | 2 | 1040 | Extended Programme |
| 2 | 2087755 | Composite Protocol | 2 | 1040 | Extended Programme |
| 2 | 2087755 | Composite Protocol | 3 | 2986228 | Pilot Standard |
| 3 | template_impcode_pagata_4det50 | Compact Programme | 3 | 2986228 | Pilot Standard |
| 3 | template_impcode_pagata_4det50 | Compact Programme | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | id_9 | Legacy Standard D | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | id_9 | Legacy Standard D | 1 | 69447 | Integrated Protocol A |

This view connects forms to treatment facilities, answering: "Which facilities use which assessment forms?" A row might pair form `template_impcode_pagata_4det50` ("Compact Programme," low risk, controlled substance) with facility `2986228` ("Pilot Standard," opioid_treatment type, capacity 50). This join supports compliance auditing, ensuring that facilities handling controlled substances deploy the appropriate high-risk or controlled-substance forms.

**View `treatment_facility_substance_abuse_form_detail_view`**

```sql
CREATE VIEW treatment_facility_substance_abuse_form_detail_view AS
SELECT a.id, a.facility_id, a.facility_name, b.id AS form_id, b.form_code AS form_form_code, b.form_name AS form_form_name
FROM treatment_facilities a
  JOIN facilities_forms j ON j.treatment_facility_id = a.id
  JOIN substance_abuse_forms b ON b.id = j.substance_abuse_form_id;
```

| id | facility_id | facility_name | form_id | form_form_code | form_form_name |
|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | 1 | 12616 | Primary Framework A |
| 1 | 69447 | Integrated Protocol A | 2 | 2087755 | Composite Protocol |
| 2 | 1040 | Extended Programme | 2 | 2087755 | Composite Protocol |
| 2 | 1040 | Extended Programme | 3 | template_impcode_pagata_4det50 | Compact Programme |
| 3 | 2986228 | Pilot Standard | 3 | template_impcode_pagata_4det50 | Compact Programme |
| 3 | 2986228 | Pilot Standard | 4 | id_9 | Legacy Standard D |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 4 | id_9 | Legacy Standard D |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | 1 | 12616 | Primary Framework A |

The reverse linkage, this view presents facilities alongside their associated forms, answering: "What forms does each facility employ?" A row could show facility `ChIJvSxSbfdv5kcRanVzI8RRu20` ("Baseline Framework D," specialty_court, accepts_medicaid) linked to form `id_9` ("Legacy Standard D," high risk, not controlled substance). This perspective helps facility managers verify that their form inventory matches their service type and regulatory requirements.

**View `treatment_facility_funding_source_view`**

```sql
CREATE VIEW treatment_facility_funding_source_view AS
SELECT a.id, a.facility_id, a.facility_name, a.facility_type, b.id AS source_id, b.funding_id AS source_funding_id, b.source_name AS source_source_name
FROM treatment_facilities a JOIN funding_sources b ON a.funding_source_id = b.id;
```

| id | facility_id | facility_name | facility_type | source_id | source_funding_id | source_source_name |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | outpatient | 1 | 9568468 | Composite Model |
| 2 | 1040 | Extended Programme | inpatient | 2 | 103191 | Compact Cluster A |
| 3 | 2986228 | Pilot Standard | opioid_treatment | 3 | 4180965 | Legacy Review |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | specialty_court | 4 | 1152670 | Regional Initiative |

This view joins treatment facilities with their funding sources, answering: "How is each facility financially supported?" A representative row links facility `69447` ("Integrated Protocol A," outpatient, capacity 32) to funding source `9568468` ("Composite Model," $112.11 total amount, grant allocation). Another row connects facility `1040` ("Extended Programme," inpatient, accepts_medicaid) to source `103191` ("Compact Cluster A," $1,979, fine allocation). This view is essential for financial reconciliation, enabling administrators to verify that every facility has an active funding relationship and to compare funding amounts across facility types.

**View `funding_source_treatment_facility_detail_view`**

```sql
CREATE VIEW funding_source_treatment_facility_detail_view AS
SELECT a.id, a.funding_id, a.source_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM funding_sources a
  JOIN sources_facilities j ON j.funding_source_id = a.id
  JOIN treatment_facilities b ON b.id = j.treatment_facility_id;
```

| id | funding_id | source_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | 9568468 | Composite Model | 1 | 69447 | Integrated Protocol A |
| 1 | 9568468 | Composite Model | 2 | 1040 | Extended Programme |
| 2 | 103191 | Compact Cluster A | 2 | 1040 | Extended Programme |
| 2 | 103191 | Compact Cluster A | 3 | 2986228 | Pilot Standard |
| 3 | 4180965 | Legacy Review | 3 | 2986228 | Pilot Standard |
| 3 | 4180965 | Legacy Review | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | 1152670 | Regional Initiative | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | 1152670 | Regional Initiative | 1 | 69447 | Integrated Protocol A |

The inverse of the previous view, this perspective presents funding sources alongside the facilities they support, answering: "Which facilities does each funding source support?" A row might show source `4180965` ("Legacy Review," $15,418, fee allocation, fiscal year 23) linked to facility `2986228` ("Pilot Standard," opioid_treatment). This view supports budget planning by showing the reach of each funding source across the facility network.

**View `funding_source_coordinating_council_detail_view`**

```sql
CREATE VIEW funding_source_coordinating_council_detail_view AS
SELECT a.id, a.funding_id, a.source_name, b.coordinating_council_id AS council_coordinating_council_id, b.council_id AS council_council_id, b.council_name AS council_council_name
FROM funding_sources a
  JOIN sources_councils j ON j.funding_source_id = a.id
  JOIN coordinating_councils b ON b.coordinating_council_id = j.coordinating_council_id;
```

| id | funding_id | source_name | council_coordinating_council_id | council_council_id | council_council_name |
|---|---|---|---|---|---|
| 1 | 9568468 | Composite Model | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |
| 1 | 9568468 | Composite Model | 2 | Bjornfant | Regional Framework |
| 2 | 103191 | Compact Cluster A | 2 | Bjornfant | Regional Framework |
| 2 | 103191 | Compact Cluster A | 3 | 726041 | Seasonal Protocol |
| 3 | 4180965 | Legacy Review | 3 | 726041 | Seasonal Protocol |
| 3 | 4180965 | Legacy Review | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 4 | 1152670 | Regional Initiative | 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A |
| 4 | 1152670 | Regional Initiative | 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D |

This view connects funding sources to coordinating councils, answering: "Which councils are supported by which funding streams?" A row could link source `103191` ("Compact Cluster A," $1,979, fine allocation) to council `Bjornfant` ("Regional Framework," pilot-county-38, utilization rate 7.40, has funding available). This join is critical for governance oversight, ensuring that councils have adequate financial backing to fulfill their coordination responsibilities.

**View `coordinating_council_funding_source_view`**

```sql
CREATE VIEW coordinating_council_funding_source_view AS
SELECT a.coordinating_council_id, a.council_id, a.council_name, a.county_served, b.id AS source_id, b.funding_id AS source_funding_id, b.source_name AS source_source_name
FROM coordinating_councils a JOIN funding_sources b ON a.funding_source_id = b.id;
```

| coordinating_council_id | council_id | council_name | county_served | source_id | source_funding_id | source_source_name |
|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | baseline-county-37 | 1 | 9568468 | Composite Model |
| 2 | Bjornfant | Regional Framework | pilot-county-38 | 2 | 103191 | Compact Cluster A |
| 3 | 726041 | Seasonal Protocol | extended-county-39 | 3 | 4180965 | Legacy Review |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | integrated-county-40 | 4 | 1152670 | Regional Initiative |

The reverse perspective, this view presents councils alongside their funding sources, answering: "What financial resources does each council draw upon?" A row might show council `ae409270-8fcd-11eb-924d-9cd76263cbd0` ("Legacy Standard D," baseline-county-37, utilization rate 4.20, no funding available) linked to source `9568468` ("Composite Model," grant allocation). This view helps identify councils with funding gaps—those marked as having no funding available despite active utilization rates.

**View `coordinating_council_treatment_facility_detail_view`**

```sql
CREATE VIEW coordinating_council_treatment_facility_detail_view AS
SELECT a.coordinating_council_id, a.council_id, a.council_name, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM coordinating_councils a
  JOIN councils_facilities j ON j.coordinating_council_id = a.coordinating_council_id
  JOIN treatment_facilities b ON b.id = j.treatment_facility_id;
```

| coordinating_council_id | council_id | council_name | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | 1 | 69447 | Integrated Protocol A |
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | 2 | 1040 | Extended Programme |
| 2 | Bjornfant | Regional Framework | 2 | 1040 | Extended Programme |
| 2 | Bjornfant | Regional Framework | 3 | 2986228 | Pilot Standard |
| 3 | 726041 | Seasonal Protocol | 3 | 2986228 | Pilot Standard |
| 3 | 726041 | Seasonal Protocol | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | 1 | 69447 | Integrated Protocol A |

This view links coordinating councils to treatment facilities, answering: "Which facilities fall under which council's jurisdiction?" A representative row connects council `726041` ("Seasonal Protocol," extended-county-39, utilization rate 10.60) to facility `1040` ("Extended Programme," inpatient, capacity 41). Another row links council `2a540c6d30d447058e7e4de6c68c2d6d` ("Integrated Programme A," integrated-county-40) to facility `ChIJvSxSbfdv5kcRanVzI8RRu20` ("Baseline Framework D," specialty_court). This view supports service-area planning, enabling administrators to verify that facility coverage aligns with council boundaries and to identify facilities operating outside their designated council's jurisdiction.

**View `referral_event_treatment_facility_view`**

```sql
CREATE VIEW referral_event_treatment_facility_view AS
SELECT a.id, a.referral_id, a.referral_date, a.monthly_volume, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM referral_events a JOIN treatment_facilities b ON a.treatment_facility_id = b.id;
```

| id | referral_id | referral_date | monthly_volume | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 1000 | 9736917 | 2022-05-20T04:48:00 | 31 | 1 | 69447 | Integrated Protocol A |
| 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 34 | 2 | 1040 | Extended Programme |
| 1002 | 5844263 | 2024-03-15T18:22:00 | 37 | 3 | 2986228 | Pilot Standard |
| 1003 | group_system | 2025-08-26T01:39:00 | 40 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

This view joins referral events with their receiving treatment facilities, answering: "Which facility received each referral, and what was the outcome?" A row might show referral `9736917` (from criminal_justice source, 31 monthly volume, outcome completed, recidivism rate 13.70%) linked to facility `69447` ("Integrated Protocol A," outpatient). Another row connects referral `ChIJkzsYUIBt5kcRM6_JHx26ONk` (healthcare source, 34 volume, dropped_out, 15.40% recidivism) to facility `1040` ("Extended Programme," inpatient). This view is central to outcome analysis, enabling comparison of recidivism rates across facilities and source systems.

**View `referral_event_patient_demographic_view`**

```sql
CREATE VIEW referral_event_patient_demographic_view AS
SELECT a.id, a.referral_id, a.referral_date, a.monthly_volume, b.demographic_id AS demographic_demographic_id, b.primary_race AS demographic_primary_race, b.primary_gender AS demographic_primary_gender
FROM referral_events a JOIN patient_demographics b ON a.demographic_id = b.demographic_id;
```

| id | referral_id | referral_date | monthly_volume | demographic_demographic_id | demographic_primary_race | demographic_primary_gender |
|---|---|---|---|---|---|---|
| 1000 | 9736917 | 2022-05-20T04:48:00 | 31 | levels | African American | Male |
| 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 34 | 32824 | Caucasian | Female |
| 1002 | 5844263 | 2024-03-15T18:22:00 | 37 | coms1 | Asian | Non-binary |
| 1003 | group_system | 2025-08-26T01:39:00 | 40 | id_24 | Hispanic | Male |

This view connects referral events to patient demographics, answering: "What are the demographic characteristics of referred individuals?" A row could link referral `5844263` (self_referral source, 37 volume, ongoing outcome, 17.10% recidivism) to demographic `coms1`. Another row connects referral `group_system` (employer source, 40 volume, failed outcome, 18.80% recidivism) to demographic `id_24`. This join supports demographic analysis, revealing whether certain source systems or outcomes correlate with specific patient populations.

**View `patient_demographic_treatment_facility_detail_view`**

```sql
CREATE VIEW patient_demographic_treatment_facility_detail_view AS
SELECT a.demographic_id, a.primary_race, a.primary_gender, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM patient_demographics a
  JOIN demographics_facilities j ON j.demographic_id = a.demographic_id
  JOIN treatment_facilities b ON b.id = j.treatment_facility_id;
```

| demographic_id | primary_race | primary_gender | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| levels | African American | Male | 1 | 69447 | Integrated Protocol A |
| levels | African American | Male | 2 | 1040 | Extended Programme |
| 32824 | Caucasian | Female | 2 | 1040 | Extended Programme |
| 32824 | Caucasian | Female | 3 | 2986228 | Pilot Standard |
| coms1 | Asian | Non-binary | 3 | 2986228 | Pilot Standard |
| coms1 | Asian | Non-binary | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| id_24 | Hispanic | Male | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| id_24 | Hispanic | Male | 1 | 69447 | Integrated Protocol A |

This view links patient demographics to treatment facilities, answering: "Which facilities serve which patient populations?" A row might connect demographic `levels` to facility `69447` ("Integrated Protocol A," outpatient, capacity 32). This view enables capacity planning by showing the demographic composition of each facility's patient base, helping administrators identify whether facilities are appropriately matched to the populations they serve.

**View `patient_demographic_referral_event_detail_view`**

```sql
CREATE VIEW patient_demographic_referral_event_detail_view AS
SELECT a.demographic_id, a.primary_race, a.primary_gender, b.id AS event_id, b.referral_id AS event_referral_id, b.referral_date AS event_referral_date
FROM patient_demographics a
  JOIN demographics_events j ON j.demographic_id = a.demographic_id
  JOIN referral_events b ON b.id = j.referral_event_id;
```

| demographic_id | primary_race | primary_gender | event_id | event_referral_id | event_referral_date |
|---|---|---|---|---|---|
| levels | African American | Male | 1000 | 9736917 | 2022-05-20T04:48:00 |
| levels | African American | Male | 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 |
| 32824 | Caucasian | Female | 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 |
| 32824 | Caucasian | Female | 1002 | 5844263 | 2024-03-15T18:22:00 |
| coms1 | Asian | Non-binary | 1002 | 5844263 | 2024-03-15T18:22:00 |
| coms1 | Asian | Non-binary | 1003 | group_system | 2025-08-26T01:39:00 |
| id_24 | Hispanic | Male | 1003 | group_system | 2025-08-26T01:39:00 |
| id_24 | Hispanic | Male | 1000 | 9736917 | 2022-05-20T04:48:00 |

The reverse perspective, this view presents demographics alongside their associated referral events, answering: "What referral pathways did each demographic group follow?" A row could show demographic `32824` linked to referral `ChIJkzsYUIBt5kcRM6_JHx26ONk` (healthcare source, dropped_out outcome, 15.40% recidivism). This view supports pathway analysis, revealing whether certain demographic groups experience higher dropout rates or recidivism, which can inform targeted intervention strategies.

**View `patient_demographic_funding_source_view`**

```sql
CREATE VIEW patient_demographic_funding_source_view AS
SELECT a.demographic_id, a.primary_race, a.primary_gender, a.has_health_insurance, b.id AS source_id, b.funding_id AS source_funding_id, b.source_name AS source_source_name
FROM patient_demographics a JOIN funding_sources b ON a.funding_source_id = b.id;
```

| demographic_id | primary_race | primary_gender | has_health_insurance | source_id | source_funding_id | source_source_name |
|---|---|---|---|---|---|---|
| levels | African American | Male | true | 1 | 9568468 | Composite Model |
| 32824 | Caucasian | Female | false | 2 | 103191 | Compact Cluster A |
| coms1 | Asian | Non-binary | true | 3 | 4180965 | Legacy Review |
| id_24 | Hispanic | Male | false | 4 | 1152670 | Regional Initiative |

This final view connects patient demographics to funding sources, answering: "Which funding streams support the treatment of specific patient populations?" A row might link demographic `coms1` to funding source `4180965` ("Legacy Review," $15,418, fee allocation). This view provides the most comprehensive analytical perspective, enabling administrators to trace the full chain from patient demographics through referral events to the funding sources that support their treatment. It answers the critical question of whether funding allocations align with the demographic needs of the population served.

The substance abuse treatment coordination ecosystem operates through interconnected layers of data: surveys capture population-level metrics, forms standardize assessment instruments, facilities deliver care, funding sources provide resources, coordinating councils govern service areas, and referral events link individuals to treatment. The junction tables and views described above transform these discrete records into analytical perspectives that support financial reconciliation, compliance auditing, outcome analysis, and capacity planning. By maintaining clear relationships between every entity—from the initial survey design through the final referral outcome—the data model enables administrators to trace the complete lifecycle of substance abuse treatment coordination, ensuring that resources reach the facilities and populations that need them most.