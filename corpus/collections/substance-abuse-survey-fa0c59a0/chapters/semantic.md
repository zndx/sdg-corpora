The substance abuse domain captures a multi-layered ecosystem of surveys, clinical forms, treatment facilities, funding streams, coordinating councils, referral events, and patient demographics. At its core, the model distinguishes between the data-collection layer (surveys and forms), the service-delivery layer (facilities and referrals), and the governance layer (funding sources and coordinating councils), with patient demographics bridging clinical and administrative concerns. The relational schema materializes these layers through seven base tables, eight junction tables that resolve many-to-many associations, and fourteen views that reconstruct domain facts from the normalized structure.

## The data-collection layer

Surveys and forms constitute the observational backbone of the domain. The `substance_abuse_surveys` table records each survey instance with a surrogate primary key (`id`), a business-level `survey_id`, the `conducted_date`, a `response_rate` expressed as a percentage, the `total_counties_responded`, the `data_format` (electronic, paper, or hybrid), and a lifecycle `status` (planned, active, complete, or archived). A representative row shows survey `21005921` conducted on 2023-06-03 with an 18.45% response rate across 41 counties in electronic format and a `planned` status; another, `b83e028a-8fcd-11eb-924d-9cd76263cbd0`, was archived after being run in electronic format on 2022-09-09.

**Table `substance_abuse_surveys`**

| id | survey_id | conducted_date | response_rate | total_counties_responded | data_format | status |
|---|---|---|---|---|---|---|
| 100 | 21005921 | 2023-06-03T17:51:00 | 18.45 | 41 | electronic | planned |
| 101 | 726059 | 2024-11-14T00:08:00 | 21.90 | 23 | paper | active |
| 102 | 32814 | 2025-04-25T07:25:00 | 25.35 | 100 | hybrid | complete |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-09-09T14:42:00 | 28.80 | 3 | electronic | archived |

Each survey collects data through one or more standardized forms, captured in `substance_abuse_forms`. This table stores a surrogate `id`, a `form_code` (ranging from short integers like `12616` to template-style identifiers such as `template_impcode_pagata_4det50`), a human-readable `form_name` (e.g., "Primary Framework A", "Compact Programme"), a `prevalence_rate`, a `risk_category` (high, medium, or low), a boolean `is_controlled_substance` flag, and a foreign key `substance_abuse_survey_id` that references the parent survey. Form `12616` ("Primary Framework A") carries a 22.45% prevalence rate, is classified as `high` risk, involves a controlled substance, and belongs to survey `100`. Form `2087755` ("Composite Protocol") has a 25.90% prevalence rate, is `medium` risk, does not involve a controlled substance, and is linked to survey `101`.

**Table `substance_abuse_forms`**

| id | form_code | form_name | prevalence_rate | risk_category | is_controlled_substance | substance_abuse_survey_id |
|---|---|---|---|---|---|---|
| 1 | 12616 | Primary Framework A | 22.45 | high | true | 100 |
| 2 | 2087755 | Composite Protocol | 25.90 | medium | false | 101 |
| 3 | template_impcode_pagata_4det50 | Compact Programme | 29.35 | low | true | 102 |
| 4 | id_9 | Legacy Standard D | 32.80 | high | false | 103 |

The one-to-many relationship between surveys and forms is materialized by the `substance_abuse_survey_id` column in `substance_abuse_forms`. A single survey can therefore accumulate multiple form records, and the junction table `surveys_forms` exists to support many-to-many scenarios where the same form template is reused across surveys or where a survey's form composition is tracked independently of the foreign-key constraint.

## The service-delivery layer

Treatment facilities deliver clinical services and are tracked in `treatment_facilities`. Each row carries a surrogate `id`, a business `facility_id` (numeric identifiers like `69447` or UUIDs such as `ChIJvSxSbfdv5kcRanVzI8RRu20`), a `facility_name` ("Integrated Protocol A", "Extended Programme"), a `facility_type` (outpatient, inpatient, opioid_treatment, specialty_court), a `county_location` (e.g., "regional-county-30", "legacy-county-31"), integer `capacity`, a boolean `accepts_medicaid`, and a foreign key `funding_source_id` pointing to the `funding_sources` table. Facility `69447` ("Integrated Protocol A") is an outpatient center in "regional-county-30" with capacity 32 that does not accept Medicaid and is funded by source `1`. Facility `ChIJvSxSbfdv5kcRanVzI8RRu20` ("Baseline Framework D") is a specialty_court center in "composite-county-33" with capacity 59 that accepts Medicaid and is funded by source `4`.

**Table `treatment_facilities`**

| id | facility_id | facility_name | facility_type | county_location | capacity | accepts_medicaid | funding_source_id |
|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | outpatient | regional-county-30 | 32 | false | 1 |
| 2 | 1040 | Extended Programme | inpatient | legacy-county-31 | 41 | true | 2 |
| 3 | 2986228 | Pilot Standard | opioid_treatment | compact-county-32 | 50 | false | 3 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | specialty_court | composite-county-33 | 59 | true | 4 |

Funding sources are catalogued in `funding_sources`, which stores a surrogate `id`, a business `funding_id`, a `source_name` ("Composite Model", "Compact Cluster A", "Legacy Review", "Regional Initiative"), a `total_amount` (e.g., 112.11, 1,979, 15,418, 12,579), a `currency` code, a `fiscal_year`, and an `allocation_type` (grant, fine, fee, appropriation). The `funding_source_id` foreign key in `treatment_facilities` enforces a many-to-one cardinality: each facility draws from exactly one funding source, while a funding source may support multiple facilities.

**Table `funding_sources`**

| id | funding_id | source_name | total_amount | currency | fiscal_year | allocation_type |
|---|---|---|---|---|---|---|
| 1 | 9568468 | Composite Model | 112.11 | seasonal-currency-71 | 17 | grant |
| 2 | 103191 | Compact Cluster A | 1,979 | regional-currency-72 | 20 | fine |
| 3 | 4180965 | Legacy Review | 15,418 | legacy-currency-73 | 23 | fee |
| 4 | 1152670 | Regional Initiative | 12,579 | compact-currency-74 | 26 | appropriation |

Referral events record the movement of patients into treatment. The `referral_events` table includes a surrogate `id`, a business `referral_id` (numeric or UUID, e.g., `9736917`, `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `referral_date`, a `monthly_volume`, a `source_system` (criminal_justice, healthcare, self_referral, employer), an `outcome_status` (completed, dropped_out, ongoing, failed), a `recidivism_rate`, a foreign key `treatment_facility_id` linking to `treatment_facilities`, a foreign key `demographic_id` linking to `patient_demographics`, and audit timestamps `created_at` and `updated_at`. Referral `9736917` occurred on 2022-05-20 with a monthly volume of 31, originated from the criminal_justice system, resulted in a completed outcome with a 13.70% recidivism rate, was routed to facility `1`, and is associated with demographic `levels`.

**Table `referral_events`**

| id | referral_id | referral_date | monthly_volume | source_system | outcome_status | recidivism_rate | treatment_facility_id | demographic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9736917 | 2022-05-20T04:48:00 | 31 | criminal_justice | completed | 13.70 | 1 | levels | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 34 | healthcare | dropped_out | 15.40 | 2 | 32824 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844263 | 2024-03-15T18:22:00 | 37 | self_referral | ongoing | 17.10 | 3 | coms1 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | group_system | 2025-08-26T01:39:00 | 40 | employer | failed | 18.80 | 4 | id_24 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Patient demographics are stored in `patient_demographics`, which captures individual-level attributes. The table includes a surrogate `id`, a business `demographic_id` (e.g., `levels`, `32824`, `coms1`, `id_24`), and additional demographic attributes. The `demographic_id` is referenced by `referral_events.demographic_id`, establishing a many-to-one relationship where each referral event is tied to a single patient demographic record.

**Table `patient_demographics`**

| demographic_id | primary_race | primary_gender | has_health_insurance | is_veteran | is_pregnant | access_to_care | funding_source_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| levels | African American | Male | true | false | true | full | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 32824 | Caucasian | Female | false | true | false | limited | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| coms1 | Asian | Non-binary | true | false | true | none | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| id_24 | Hispanic | Male | false | true | false | full | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The junction table `demographics_events` supports many-to-many associations between patient demographics and referral events, useful when a single demographic profile is associated with multiple referral events or when the linkage is tracked independently of the foreign-key constraint. Similarly, `demographics_facilities` captures associations between patient demographics and treatment facilities, and `forms_facilities` and `facilities_forms` (dual-named junctions) support many-to-many relationships between forms and facilities.

## The governance layer

Coordinating councils oversee regional coordination and are stored in `coordinating_councils`. This table includes a `coordinating_council_id` (surrogate), a `council_id` (business identifier, e.g., `ae409270-8fcd-11eb-924d-9cd76263cbd0`, `Bjornfant`, `726041`), a `council_name` ("Legacy Standard D", "Regional Framework", "Seasonal Protocol", "Integrated Programme A"), a `county_served` (e.g., "baseline-county-37", "pilot-county-38"), a boolean `has_funding_available`, a `utilization_rate` (4.20, 7.40, 10.60, 13.80), an `established_date`, a foreign key `funding_source_id` referencing `funding_sources`, and a `created_at` timestamp. Council `ae409270-8fcd-11eb-924d-9cd76263cbd0` ("Legacy Standard D") serves "baseline-county-37", has no funding available, a utilization rate of 4.20, was established on 2024-03-27, and is linked to funding source `1`.

**Table `coordinating_councils`**

| coordinating_council_id | council_id | council_name | county_served | has_funding_available | utilization_rate | established_date | funding_source_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Legacy Standard D | baseline-county-37 | false | 4.20 | 2024-03-27 | 1 | 2025-01-01 00:14:00 |
| 2 | Bjornfant | Regional Framework | pilot-county-38 | true | 7.40 | 2025-08-11 | 2 | 2025-02-06 03:14:00 |
| 3 | 726041 | Seasonal Protocol | extended-county-39 | false | 10.60 | 2022-01-22 | 3 | 2025-03-11 06:14:00 |
| 4 | 2a540c6d30d447058e7e4de6c68c2d6d | Integrated Programme A | integrated-county-40 | true | 13.80 | 2023-06-06 | 4 | 2025-04-16 09:14:00 |

The `funding_source_id` foreign key in `coordinating_councils` creates a many-to-one relationship with `funding_sources`: each council draws from one funding source, while a funding source may support multiple councils. The junction tables `sources_facilities` and `sources_councils` provide many-to-many support for facility-to-funding-source and council-to-funding-source associations, respectively. The `councils_facilities` junction table captures the relationship between coordinating councils and treatment facilities, enabling a council to oversee multiple facilities and a facility to be overseen by multiple councils.

## Reconstructing domain facts through views

Views in this schema are materialized joins that reconstruct domain facts from the normalized tables. Each view answers a specific analytical question by combining data from two or more base tables.

The `substance_abuse_survey_substance_abuse_form_detail_view` joins `substance_abuse_surveys` with `substance_abuse_forms` on `substance_abuse_surveys.id = substance_abuse_forms.substance_abuse_survey_id`, answering the question: "Which forms belong to which surveys, and what are their prevalence rates and risk categories?" A row from this view might show survey `21005921` (conducted 2023-06-03, 18.45% response rate) paired with form `12616` ("Primary Framework A", 22.45% prevalence, high risk).

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

The inverse relationship is captured by `substance_abuse_form_substance_abuse_survey_view`, which joins `substance_abuse_forms` back to `substance_abuse_surveys`, answering: "For a given form, which survey collected it and what was the survey's response rate?" A row might show form `2087755` ("Composite Protocol", medium risk) linked to survey `726059` (conducted 2024-11-14, 21.90% response rate).

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

The `substance_abuse_form_treatment_facility_detail_view` joins `substance_abuse_forms` with `treatment_facilities`, answering: "Which treatment facilities use which forms, and what are the facility types and capacities?" A row might show form `template_impcode_pagata_4det50` ("Compact Programme", low risk) associated with facility `2986228` ("Pilot Standard", opioid_treatment, capacity 50).

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

Conversely, `treatment_facility_substance_abuse_form_detail_view` joins `treatment_facilities` with `substance_abuse_forms`, answering: "For a given facility, which forms are deployed there and what are their risk profiles?" A row might show facility `1040` ("Extended Programme", inpatient, accepts Medicaid) paired with form `id_9` ("Legacy Standard D", high risk, not a controlled substance).

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

The `treatment_facility_funding_source_view` joins `treatment_facilities` with `funding_sources` on `treatment_facilities.funding_source_id = funding_sources.id`, answering: "Which funding sources support which treatment facilities, and what are the allocation types and amounts?" A row might show facility `69447` ("Integrated Protocol A", outpatient, capacity 32) funded by source `9568468` ("Composite Model", $112.11, grant allocation, fiscal year 17).

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

The inverse, `funding_source_treatment_facility_detail_view`, joins `funding_sources` with `treatment_facilities`, answering: "For a given funding source, which facilities receive its funds and what are their characteristics?" A row might show funding source `103191` ("Compact Cluster A", $1,979, fine allocation, fiscal year 20) supporting facility `1040` ("Extended Programme", inpatient, capacity 41).

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

The `funding_source_coordinating_council_detail_view` joins `funding_sources` with `coordinating_councils` on `funding_sources.id = coordinating_councils.funding_source_id`, answering: "Which coordinating councils are funded by which sources, and what are their utilization rates?" A row might show funding source `4180965` ("Legacy Review", $15,418, fee allocation, fiscal year 23) supporting council `726041` ("Seasonal Protocol", utilization rate 10.60, established 2022-01-22).

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

The inverse, `coordinating_council_funding_source_view`, joins `coordinating_councils` with `funding_sources`, answering: "For a given council, which funding source supports it and what is the allocation type?" A row might show council `ae409270-8fcd-11eb-924d-9cd76263cbd0` ("Legacy Standard D", serves "baseline-county-37", no funding available) funded by source `9568468` ("Composite Model", grant allocation).

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

The `coordinating_council_treatment_facility_detail_view` joins `coordinating_councils` with `treatment_facilities` through the `councils_facilities` junction table, answering: "Which treatment facilities are overseen by which coordinating councils, and what are their county locations and capacities?" A row might show council `Bjornfant` ("Regional Framework", serves "pilot-county-38", utilization rate 7.40) overseeing facility `2986228` ("Pilot Standard", opioid_treatment, capacity 50).

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

The `referral_event_treatment_facility_view` joins `referral_events` with `treatment_facilities` on `referral_events.treatment_facility_id = treatment_facilities.id`, answering: "Which treatment facilities receive referrals, and what are the referral outcomes and recidivism rates?" A row might show referral `9736917` (from criminal_justice system, completed outcome, 13.70% recidivism) routed to facility `69447` ("Integrated Protocol A", outpatient, capacity 32).

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

The `referral_event_patient_demographic_view` joins `referral_events` with `patient_demographics` on `referral_events.demographic_id = patient_demographics.id`, answering: "Which patient demographics are associated with which referral events, and what are the referral outcomes?" A row might show referral `ChIJkzsYUIBt5kcRM6_JHx26ONk` (from healthcare system, dropped_out outcome, 15.40% recidivism) associated with demographic `32824`.

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

The `patient_demographic_treatment_facility_detail_view` joins `patient_demographics` with `treatment_facilities` through the `demographics_facilities` junction table, answering: "Which treatment facilities serve which patient demographics, and what are the facility types and capacities?" A row might show demographic `coms1` associated with facility `2986228` ("Pilot Standard", opioid_treatment, capacity 50).

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

The `patient_demographic_referral_event_detail_view` joins `patient_demographics` with `referral_events`, answering: "For a given patient demographic, which referral events occurred and what were their outcomes and recidivism rates?" A row might show demographic `id_24` associated with referral `group_system` (from employer system, failed outcome, 18.80% recidivism).

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

The `patient_demographic_funding_source_view` joins `patient_demographics` with `funding_sources` through a path that traverses `referral_events`, `treatment_facilities`, and `funding_sources`, answering: "Which funding sources ultimately support the facilities serving which patient demographics?" A row might show demographic `levels` associated with funding source `1152670` ("Regional Initiative", $12,579, appropriation allocation, fiscal year 26).

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

## Synthesis

The schema models the substance abuse domain as a network of interconnected entities: surveys collect data through forms, facilities deliver treatment funded by financial sources and coordinated by councils, and patients move through the system via referral events. The seven base tables capture the core entities with surrogate primary keys and business identifiers, while foreign keys enforce the cardinality-bounded relationships (one facility per funding source, one survey per form, one demographic per referral). The eight junction tables (`surveys_forms`, `forms_facilities`, `facilities_forms`, `sources_facilities`, `sources_councils`, `councils_facilities`, `demographics_facilities`, `demographics_events`) provide the flexibility to model many-to-many associations that arise when the same form template is deployed across multiple facilities, when a funding source supports both facilities and councils, or when patient demographics are associated with multiple referral events. The fourteen views materialize the analytical joins that reconstruct domain facts—answering questions about form-survey pairings, facility-funding relationships, council oversight, and patient referral outcomes—by combining the normalized tables into flat, query-ready structures. This separation of concerns between the normalized base schema and the denormalized views enables both data integrity through foreign-key constraints and analytical convenience through pre-joined result sets.

## Data appendix

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
