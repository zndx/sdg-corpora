## Domain Modelling and Relational Materialisation

The workplace analytics domain captures a network of organisational assessments, awards, and cultural diagnostics. At its core, the model revolves around `organizations` — the central entity that accumulates awards, undergoes health assessments, commissions employee feedback surveys, and maintains partnerships. Each of these facets is normalised into its own table, and the foreign keys between them encode the cardinality-bounded relationships that the domain requires. The following sections walk through the entity types, their attributes, and the materialised schema that results from the normalisation process.

### Base Tables and Entity Types

The `organizations` table anchors the entire schema. Each row represents a distinct organisation, identified by a surrogate `id` (an integer such as `1000` or `1003`) and a business-facing `org_id` (a UUID or string like `790471` or `m16`). The `org_name` column carries human-readable labels — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — while `founding_year` stores numeric values like `43`, `48`, `53`, and `58`. The `headquarters_location` column holds categorical codes such as `composite-headquar-63` and `distributed-headquar-66`. Boolean flags like `is_b_corp` (true for `Extended Review` and `Baseline Model`, false for the others) and categorical columns like `membership_level` (`pilot-membersh-32`, `extended-membersh-33`, etc.) and `industry_sector` (referencing `seasonal-industry-35`, `regional-industry-36`, and so on) round out the organisation's profile.

**Table `organizations`**

| id | org_id | org_name | founding_year | headquarters_location | industry_sector | membership_level | is_b_corp | workplace_award_id | employee_feedback_survey_id | health_id | partner_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | composite-headquar-63 | seasonal-industry-35 | pilot-membersh-32 | true | 1 | 1 | 3990171 | 1 |
| 1001 | 1717 | Pilot Initiative A | 48 | primary-headquar-64 | regional-industry-36 | extended-membersh-33 | false | 2 | 2 | 101 | 2 |
| 1002 | 69437 | Baseline Model | 53 | adaptive-headquar-65 | legacy-industry-37 | integrated-membersh-34 | true | 3 | 3 | select | 3 |
| 1003 | m16 | Distributed Cluster | 58 | distributed-headquar-66 | compact-industry-38 | seasonal-membersh-35 | false | 4 | 4 | 778569 | 4 |

The `workplace_awards` table records accolades bestowed upon organisations. Each award row carries a surrogate `workplace_award_id` (1 through 4 in the sample), a business `award_id` (a UUID like `e02275d4-8fd1-11eb-924d-9cd76263cbd0` or a numeric code like `3012811`), an `award_year` (values `36`, `43`, `50`, `57`), and a `rank` (16, 20, 24, 28). The `category` column encodes award types such as `compact-category-92` and `adaptive-category-95`. The `issuing_organization` column names the awarding body — `Alphabet Inc Class A`, `ITT Industries`, `Switch Card Services Ltd.`, `Buypass AS` — while `survey_methodology` records the evaluation approach (`pilot-survey-14`, `extended-survey-15`, `integrated-survey-16`, `seasonal-survey-17`). A boolean `is_repeat_winner` flag distinguishes repeat recipients, and the foreign keys `organization_id` and `employee_feedback_survey_id` tie each award to its recipient organisation and the associated survey.

**Table `workplace_awards`**

| workplace_award_id | award_id | award_year | rank | category | issuing_organization | survey_methodology | is_repeat_winner | organization_id | employee_feedback_survey_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | compact-category-92 | Alphabet Inc Class A | pilot-survey-14 | false | 1000 | 1 |
| 2 | 3012811 | 43 | 20 | composite-category-93 | ITT Industries | extended-survey-15 | true | 1001 | 2 |
| 3 | 15493350 | 50 | 24 | primary-category-94 | Switch Card Services Ltd. | integrated-survey-16 | false | 1002 | 3 |
| 4 | state_uk_17 | 57 | 28 | adaptive-category-95 | Buypass AS | seasonal-survey-17 | true | 1003 | 4 |

The `employee_feedback_surveys` table captures survey events. Each row has a surrogate `employee_feedback_survey_id` (1–4), a business `survey_id` (UUIDs like `21005921` or `b83e028a-8fcd-11eb-924d-9cd76263cbd0`), and an `administered_by` column with codes such as `legacy-administ-49` and `compact-administ-50`. The `number_of_employees` and `number_of_organizations` columns store integer counts (20, 30, 40, 50 and 22, 28, 34, 40 respectively). The `measurement_aspects` column holds categorical codes like `compact-measurem-62` and `adaptive-measurem-65`. The `survey_date` column records timestamps such as `2024-07-23T18:30:00` and `2025-12-07T01:47:00`, while `response_rate` stores decimal values (18.45, 21.90, 25.35, 28.80). Foreign keys `organization_id` and `workplace_award_id` link each survey to its parent organisation and any associated award.

**Table `employee_feedback_surveys`**

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | number_of_organizations | measurement_aspects | survey_date | response_rate | organization_id | workplace_award_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 22 | compact-measurem-62 | 2024-07-23T18:30:00 | 18.45 | 1000 | 1 |
| 2 | 726059 | compact-administ-50 | 30 | 28 | composite-measurem-63 | 2025-12-07T01:47:00 | 21.90 | 1001 | 2 |
| 3 | 32814 | composite-administ-51 | 40 | 34 | primary-measurem-64 | 2022-05-18T08:04:00 | 25.35 | 1002 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 40 | adaptive-measurem-65 | 2023-10-02T15:21:00 | 28.80 | 1003 | 4 |

The `workplace_culture_dimensions` table stores the cultural metrics measured within each survey. Each row has a surrogate `id` (1–4), a business `dimension_id` (integers like `5917277` or `16346068`), a `dimension_name` (`Seasonal Corridor`, `Integrated Series`, `Extended Assessment D`, `Pilot Survey`), and a `description` (`Extended Survey`, `Pilot Corridor A`, `Baseline Series`, `Distributed Assessment`). The `measurement_scale` column carries codes such as `pilot-measurem-38` and `seasonal-measurem-41`. A boolean `is_core_metric` flag (true for `Seasonal Corridor` and `Extended Assessment D`, false for the others) marks essential dimensions. The foreign keys `employee_feedback_survey_id` and `health_id` connect each dimension to its parent survey and to an organisational health record.

**Table `workplace_culture_dimensions`**

| id | dimension_id | dimension_name | description | measurement_scale | is_core_metric | employee_feedback_survey_id | health_id |
|---|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | pilot-measurem-38 | true | 1 | 3990171 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | extended-measurem-39 | false | 2 | 101 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | integrated-measurem-40 | true | 3 | select |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | seasonal-measurem-41 | false | 4 | 778569 |

The `organizational_healths` table records health assessments. Each row has a surrogate `health_id` (values `3990171`, `101`, `select`, `778569`), an `organization_id` referencing the assessed organisation (1000–1003), a `health_score` (15.20, 18.40, 21.60, 24.80), and an `assessment_date` (timestamps like `2022-05-10T04:24:00` and `2025-08-16T01:15:00`). The `health_status` column holds categorical codes (`integrated-health-94`, `seasonal-health-95`, `regional-health-96`, `legacy-health-97`), while `improvement_areas` stores codes such as `extended-improvem-93` and `regional-improvem-96`. The `assessed_for_organization_id` column provides a second reference to the target organisation, and `workplace_award_id` links the health record to an award. Timestamps `created_at` and `updated_at` track the lifecycle of each assessment.

**Table `organizational_healths`**

| health_id | organization_id | health_score | assessment_date | health_status | improvement_areas | assessed_for_organization_id | workplace_award_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | integrated-health-94 | extended-improvem-93 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | seasonal-health-95 | integrated-improvem-94 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | regional-health-96 | seasonal-improvem-95 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | legacy-health-97 | regional-improvem-96 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `partner_organizations` table models inter-organisational partnerships. Each row has a surrogate `partner_organization_id` (1–4), a business `partner_id` (integers like `69420` or a string `b_VB-EC-12`), a `partner_name` (`Composite Review`, `Compact Initiative A`, `Legacy Model`, `Regional Cluster`), and a `partnership_type` (`primary-partners-40`, `adaptive-partners-41`, `distributed-partners-42`, `baseline-partners-43`). The `membership_level` column mirrors the organisation-level codes, and `start_date` records when the partnership began (dates from `2022-09-05` through `2025-12-11`). Foreign keys `organization_id` and `industry_sector_id` tie each partner record to its parent organisation and its industry classification.

**Table `partner_organizations`**

| partner_organization_id | partner_id | partner_name | partnership_type | membership_level | start_date | organization_id | industry_sector_id |
|---|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | pilot-membersh-32 | 2022-09-05 | 1000 | 1 |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | extended-membersh-33 | 2023-02-16 | 1001 | 2 |
| 3 | 195367 | Legacy Model | distributed-partners-42 | integrated-membersh-34 | 2024-07-27 | 1002 | 3 |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | seasonal-membersh-35 | 2025-12-11 | 1003 | 4 |

The remaining base tables — `industry_sectors`, `surveys_dimensions`, and `healths_dimensions` — serve as lookup and classification tables. They provide controlled vocabularies for the categorical columns found across the fact tables, ensuring referential integrity and enabling consistent reporting.

### View-Based Reconstructive Joins

The materialised views reassemble the normalised tables into domain-level facts. Each view performs a specific join that answers a concrete analytical question.

The view `vw_workplace_award_organization` joins `workplace_awards` to `organizations` on `organization_id`, reconstructing the fact of which organisation received which award. A row from this view would show, for example, that the organisation `Extended Review` (id `1000`) received the award issued by `Alphabet Inc Class A` in year `36` with rank `16`.

**View `vw_workplace_award_organization`**

```sql
CREATE VIEW vw_workplace_award_organization AS
SELECT a.workplace_award_id, a.award_id, a.award_year, a.rank, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM workplace_awards a JOIN organizations b ON a.organization_id = b.id;
```

| workplace_award_id | award_id | award_year | rank | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | 1000 | 790471 | Extended Review |
| 2 | 3012811 | 43 | 20 | 1001 | 1717 | Pilot Initiative A |
| 3 | 15493350 | 50 | 24 | 1002 | 69437 | Baseline Model |
| 4 | state_uk_17 | 57 | 28 | 1003 | m16 | Distributed Cluster |

The view `vw_workplace_award_employee_feedback_survey` joins `workplace_awards` to `employee_feedback_surveys` on `employee_feedback_survey_id`, answering which survey is associated with which award. The sample data shows that award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` is linked to survey `21005921`, which was administered by `legacy-administ-49` and had a response rate of `18.45`.

**View `vw_workplace_award_employee_feedback_survey`**

```sql
CREATE VIEW vw_workplace_award_employee_feedback_survey AS
SELECT a.workplace_award_id, a.award_id, a.award_year, a.rank, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM workplace_awards a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| workplace_award_id | award_id | award_year | rank | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 | 16 | 1 | 21005921 | legacy-administ-49 |
| 2 | 3012811 | 43 | 20 | 2 | 726059 | compact-administ-50 |
| 3 | 15493350 | 50 | 24 | 3 | 32814 | composite-administ-51 |
| 4 | state_uk_17 | 57 | 28 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

The view `vw_employee_feedback_survey_workplace_culture_dimension_detail` joins `employee_feedback_surveys` to `workplace_culture_dimensions` on `employee_feedback_survey_id`, revealing the cultural dimensions measured within each survey. For survey id `21005921` (administered by `legacy-administ-49`), the view would surface the dimension `Seasonal Corridor` (id `5917277`), which is flagged as a core metric and uses the `pilot-measurem-38` scale.

**View `vw_employee_feedback_survey_workplace_culture_dimension_detail`**

```sql
CREATE VIEW vw_employee_feedback_survey_workplace_culture_dimension_detail AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, b.id AS dimension_id, b.dimension_id AS dimension_dimension_id, b.dimension_name AS dimension_dimension_name
FROM employee_feedback_surveys a
  JOIN surveys_dimensions j ON j.employee_feedback_survey_id = a.employee_feedback_survey_id
  JOIN workplace_culture_dimensions b ON b.id = j.workplace_culture_dimension_id;
```

| employee_feedback_survey_id | survey_id | administered_by | dimension_id | dimension_dimension_id | dimension_dimension_name |
|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 1 | 5917277 | Seasonal Corridor |
| 1 | 21005921 | legacy-administ-49 | 2 | 4277009 | Integrated Series |
| 2 | 726059 | compact-administ-50 | 2 | 4277009 | Integrated Series |
| 2 | 726059 | compact-administ-50 | 3 | 8928522 | Extended Assessment D |
| 3 | 32814 | composite-administ-51 | 3 | 8928522 | Extended Assessment D |
| 3 | 32814 | composite-administ-51 | 4 | 16346068 | Pilot Survey |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 4 | 16346068 | Pilot Survey |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 1 | 5917277 | Seasonal Corridor |

The view `vw_employee_feedback_survey_organization` joins `employee_feedback_surveys` to `organizations` on `organization_id`, answering which organisation commissioned which survey. The row for survey id `21005921` would show it was commissioned by `Extended Review` (id `1000`), which is a B-corp headquartered at `composite-headquar-63`.

**View `vw_employee_feedback_survey_organization`**

```sql
CREATE VIEW vw_employee_feedback_survey_organization AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, a.number_of_employees, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM employee_feedback_surveys a JOIN organizations b ON a.organization_id = b.id;
```

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 1000 | 790471 | Extended Review |
| 2 | 726059 | compact-administ-50 | 30 | 1001 | 1717 | Pilot Initiative A |
| 3 | 32814 | composite-administ-51 | 40 | 1002 | 69437 | Baseline Model |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 1003 | m16 | Distributed Cluster |

The view `vw_employee_feedback_survey_workplace_award` joins `employee_feedback_surveys` to `workplace_awards` on `workplace_award_id`, reconstructing the award-survey linkage from the survey side. Survey id `21005921` is linked to award `e02275d4-8fd1-11eb-924d-9cd76263cbd0`, which has rank `16` and category `compact-category-92`.

**View `vw_employee_feedback_survey_workplace_award`**

```sql
CREATE VIEW vw_employee_feedback_survey_workplace_award AS
SELECT a.employee_feedback_survey_id, a.survey_id, a.administered_by, a.number_of_employees, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM employee_feedback_surveys a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| employee_feedback_survey_id | survey_id | administered_by | number_of_employees | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 1 | 21005921 | legacy-administ-49 | 20 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 2 | 726059 | compact-administ-50 | 30 | 2 | 3012811 | 43 |
| 3 | 32814 | composite-administ-51 | 40 | 3 | 15493350 | 50 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 | 50 | 4 | state_uk_17 | 57 |

The view `vw_workplace_culture_dimension_employee_feedback_survey` joins `workplace_culture_dimensions` to `employee_feedback_surveys` on `employee_feedback_survey_id`, presenting the survey context for each cultural dimension. The dimension `Integrated Series` (id `4277009`) from survey id `726059` (administered by `compact-administ-50`, with `30` employees and a response rate of `21.90`) would appear in this view.

**View `vw_workplace_culture_dimension_employee_feedback_survey`**

```sql
CREATE VIEW vw_workplace_culture_dimension_employee_feedback_survey AS
SELECT a.id, a.dimension_id, a.dimension_name, a.description, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM workplace_culture_dimensions a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| id | dimension_id | dimension_name | description | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | 1 | 21005921 | legacy-administ-49 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | 2 | 726059 | compact-administ-50 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | 3 | 32814 | composite-administ-51 |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

The view `vw_workplace_culture_dimension_organizational_health` joins `workplace_culture_dimensions` to `organizational_healths` on `health_id`, connecting cultural metrics to their corresponding health assessments. The dimension `Seasonal Corridor` (id `5917277`) is linked to health record `3990171`, which has a health score of `15.20` and status `integrated-health-94`.

**View `vw_workplace_culture_dimension_organizational_health`**

```sql
CREATE VIEW vw_workplace_culture_dimension_organizational_health AS
SELECT a.id, a.dimension_id, a.dimension_name, a.description, b.health_id AS health_health_id, b.organization_id AS health_organization_id, b.health_score AS health_health_score
FROM workplace_culture_dimensions a JOIN organizational_healths b ON a.health_id = b.health_id;
```

| id | dimension_id | dimension_name | description | health_health_id | health_organization_id | health_health_score |
|---|---|---|---|---|---|---|
| 1 | 5917277 | Seasonal Corridor | Extended Survey | 3990171 | Shell Oil | 15.20 |
| 2 | 4277009 | Integrated Series | Pilot Corridor A | 101 | GlobalPlatform Inc. | 18.40 |
| 3 | 8928522 | Extended Assessment D | Baseline Series | select | Whatsapp Inc. | 21.60 |
| 4 | 16346068 | Pilot Survey | Distributed Assessment | 778569 | American Institutes for Research | 24.80 |

The view `vw_organizational_health_organization` joins `organizational_healths` to `organizations` on `organization_id`, answering which organisation received which health assessment. Health record `3990171` (score `15.20`, status `integrated-health-94`) was assessed for organisation `Extended Review` (id `1000`).

**View `vw_organizational_health_organization`**

```sql
CREATE VIEW vw_organizational_health_organization AS
SELECT a.health_id, a.organization_id, a.health_score, a.assessment_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM organizational_healths a JOIN organizations b ON a.assessed_for_organization_id = b.id;
```

| health_id | organization_id | health_score | assessment_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | 1000 | 790471 | Extended Review |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | 1001 | 1717 | Pilot Initiative A |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | 1002 | 69437 | Baseline Model |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | 1003 | m16 | Distributed Cluster |

The view `vw_organizational_health_workplace_culture_dimension_detail` joins `organizational_healths` to `workplace_culture_dimensions` on `health_id`, revealing the cultural dimensions measured alongside each health assessment. Health record `3990171` is associated with the dimension `Seasonal Corridor` (id `5917277`), which is a core metric using the `pilot-measurem-38` scale.

**View `vw_organizational_health_workplace_culture_dimension_detail`**

```sql
CREATE VIEW vw_organizational_health_workplace_culture_dimension_detail AS
SELECT a.health_id, a.organization_id, a.health_score, b.id AS dimension_id, b.dimension_id AS dimension_dimension_id, b.dimension_name AS dimension_dimension_name
FROM organizational_healths a
  JOIN healths_dimensions j ON j.health_id = a.health_id
  JOIN workplace_culture_dimensions b ON b.id = j.workplace_culture_dimension_id;
```

| health_id | organization_id | health_score | dimension_id | dimension_dimension_id | dimension_dimension_name |
|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 1 | 5917277 | Seasonal Corridor |
| 3990171 | Shell Oil | 15.20 | 2 | 4277009 | Integrated Series |
| 101 | GlobalPlatform Inc. | 18.40 | 2 | 4277009 | Integrated Series |
| 101 | GlobalPlatform Inc. | 18.40 | 3 | 8928522 | Extended Assessment D |
| select | Whatsapp Inc. | 21.60 | 3 | 8928522 | Extended Assessment D |
| select | Whatsapp Inc. | 21.60 | 4 | 16346068 | Pilot Survey |
| 778569 | American Institutes for Research | 24.80 | 4 | 16346068 | Pilot Survey |
| 778569 | American Institutes for Research | 24.80 | 1 | 5917277 | Seasonal Corridor |

The view `vw_organizational_health_workplace_award` joins `organizational_healths` to `workplace_awards` on `workplace_award_id`, connecting health assessments to their associated awards. Health record `3990171` is linked to award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` (rank `16`, category `compact-category-92`).

**View `vw_organizational_health_workplace_award`**

```sql
CREATE VIEW vw_organizational_health_workplace_award AS
SELECT a.health_id, a.organization_id, a.health_score, a.assessment_date, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM organizational_healths a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| health_id | organization_id | health_score | assessment_date | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 3990171 | Shell Oil | 15.20 | 2022-05-10T04:24:00 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 101 | GlobalPlatform Inc. | 18.40 | 2023-10-21T11:41:00 | 2 | 3012811 | 43 |
| select | Whatsapp Inc. | 21.60 | 2024-03-05T18:58:00 | 3 | 15493350 | 50 |
| 778569 | American Institutes for Research | 24.80 | 2025-08-16T01:15:00 | 4 | state_uk_17 | 57 |

The view `vw_organization_workplace_award` joins `organizations` to `workplace_awards` on `workplace_award_id`, answering which awards each organisation has received. Organisation `Extended Review` (id `1000`) received award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` in year `36` with rank `16`.

**View `vw_organization_workplace_award`**

```sql
CREATE VIEW vw_organization_workplace_award AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.workplace_award_id AS award_workplace_award_id, b.award_id AS award_award_id, b.award_year AS award_award_year
FROM organizations a JOIN workplace_awards b ON a.workplace_award_id = b.workplace_award_id;
```

| id | org_id | org_name | founding_year | award_workplace_award_id | award_award_id | award_award_year |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | 36 |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 3012811 | 43 |
| 1002 | 69437 | Baseline Model | 53 | 3 | 15493350 | 50 |
| 1003 | m16 | Distributed Cluster | 58 | 4 | state_uk_17 | 57 |

The view `vw_organization_employee_feedback_survey` joins `organizations` to `employee_feedback_surveys` on `employee_feedback_survey_id`, showing which surveys each organisation has commissioned. Organisation `Extended Review` (id `1000`) commissioned survey `21005921`, which had `20` employees, a response rate of `18.45`, and was conducted on `2024-07-23T18:30:00`.

**View `vw_organization_employee_feedback_survey`**

```sql
CREATE VIEW vw_organization_employee_feedback_survey AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.employee_feedback_survey_id AS survey_employee_feedback_survey_id, b.survey_id AS survey_survey_id, b.administered_by AS survey_administered_by
FROM organizations a JOIN employee_feedback_surveys b ON a.employee_feedback_survey_id = b.employee_feedback_survey_id;
```

| id | org_id | org_name | founding_year | survey_employee_feedback_survey_id | survey_survey_id | survey_administered_by |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | 21005921 | legacy-administ-49 |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 726059 | compact-administ-50 |
| 1002 | 69437 | Baseline Model | 53 | 3 | 32814 | composite-administ-51 |
| 1003 | m16 | Distributed Cluster | 58 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | primary-administ-52 |

The view `vw_organization_organizational_health` joins `organizations` to `organizational_healths` on `organization_id`, presenting the health assessments for each organisation. Organisation `Extended Review` (id `1000`) has health record `3990171` with a score of `15.20`, assessed on `2022-05-10T04:24:00` with status `integrated-health-94`.

**View `vw_organization_organizational_health`**

```sql
CREATE VIEW vw_organization_organizational_health AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.health_id AS health_health_id, b.organization_id AS health_organization_id, b.health_score AS health_health_score
FROM organizations a JOIN organizational_healths b ON a.health_id = b.health_id;
```

| id | org_id | org_name | founding_year | health_health_id | health_organization_id | health_health_score |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 3990171 | Shell Oil | 15.20 |
| 1001 | 1717 | Pilot Initiative A | 48 | 101 | GlobalPlatform Inc. | 18.40 |
| 1002 | 69437 | Baseline Model | 53 | select | Whatsapp Inc. | 21.60 |
| 1003 | m16 | Distributed Cluster | 58 | 778569 | American Institutes for Research | 24.80 |

The view `vw_organization_partner_organization` joins `organizations` to `partner_organizations` on `organization_id`, revealing the partnerships of each organisation. Organisation `Extended Review` (id `1000`) has partner `Composite Review` (id `69420`), a `primary-partners-40` type partnership that began on `2022-09-05`.

**View `vw_organization_partner_organization`**

```sql
CREATE VIEW vw_organization_partner_organization AS
SELECT a.id, a.org_id, a.org_name, a.founding_year, b.partner_organization_id AS organization_partner_organization_id, b.partner_id AS organization_partner_id, b.partner_name AS organization_partner_name
FROM organizations a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| id | org_id | org_name | founding_year | organization_partner_organization_id | organization_partner_id | organization_partner_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 43 | 1 | 69420 | Composite Review |
| 1001 | 1717 | Pilot Initiative A | 48 | 2 | 9085260 | Compact Initiative A |
| 1002 | 69437 | Baseline Model | 53 | 3 | 195367 | Legacy Model |
| 1003 | m16 | Distributed Cluster | 58 | 4 | b_VB-EC-12 | Regional Cluster |

The view `vw_partner_organization_organization` joins `partner_organizations` to `organizations` on `organization_id`, presenting the partner perspective — which parent organisation each partner belongs to. Partner `Composite Review` (id `69420`) belongs to organisation `Extended Review` (id `1000`).

**View `vw_partner_organization_organization`**

```sql
CREATE VIEW vw_partner_organization_organization AS
SELECT a.partner_organization_id, a.partner_id, a.partner_name, a.partnership_type, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM partner_organizations a JOIN organizations b ON a.organization_id = b.id;
```

| partner_organization_id | partner_id | partner_name | partnership_type | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | 1000 | 790471 | Extended Review |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | 1001 | 1717 | Pilot Initiative A |
| 3 | 195367 | Legacy Model | distributed-partners-42 | 1002 | 69437 | Baseline Model |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | 1003 | m16 | Distributed Cluster |

The view `vw_partner_organization_industry_sector` joins `partner_organizations` to `industry_sectors` on `industry_sector_id`, showing the industry classification of each partnership. Partner `Composite Review` (id `69420`) is classified under industry sector `1`, corresponding to the parent organisation's `seasonal-industry-35` classification.

**View `vw_partner_organization_industry_sector`**

```sql
CREATE VIEW vw_partner_organization_industry_sector AS
SELECT a.partner_organization_id, a.partner_id, a.partner_name, a.partnership_type, b.industry_sector_id AS sector_industry_sector_id, b.sector_id AS sector_sector_id, b.sector_name AS sector_sector_name
FROM partner_organizations a JOIN industry_sectors b ON a.industry_sector_id = b.industry_sector_id;
```

| partner_organization_id | partner_id | partner_name | partnership_type | sector_industry_sector_id | sector_sector_id | sector_sector_name |
|---|---|---|---|---|---|---|
| 1 | 69420 | Composite Review | primary-partners-40 | 1 | 7119771 | Distributed Survey |
| 2 | 9085260 | Compact Initiative A | adaptive-partners-41 | 2 | 726049 | Adaptive Corridor D |
| 3 | 195367 | Legacy Model | distributed-partners-42 | 3 | 103175 | Primary Series |
| 4 | b_VB-EC-12 | Regional Cluster | baseline-partners-43 | 4 | 9125631 | Composite Assessment |

The view `vw_industry_sector_organization` joins `industry_sectors` to `organizations` on `industry_sector`, answering which organisations operate within each industry sector. Organisation `Extended Review` (id `1000`) operates in `seasonal-industry-35`.

**View `vw_industry_sector_organization`**

```sql
CREATE VIEW vw_industry_sector_organization AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.description, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM industry_sectors a JOIN organizations b ON a.organization_id = b.id;
```

| industry_sector_id | sector_id | sector_name | description | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | 1000 | 790471 | Extended Review |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | 1001 | 1717 | Pilot Initiative A |
| 3 | 103175 | Primary Series | Baseline Series | 1002 | 69437 | Baseline Model |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | 1003 | m16 | Distributed Cluster |

The view `vw_industry_sector_partner_organization` joins `industry_sectors` to `partner_organizations` on `industry_sector_id`, showing which partners belong to each industry sector. Partner `Composite Review` (id `69420`) is classified under industry sector `1`.

**View `vw_industry_sector_partner_organization`**

```sql
CREATE VIEW vw_industry_sector_partner_organization AS
SELECT a.industry_sector_id, a.sector_id, a.sector_name, a.description, b.partner_organization_id AS organization_partner_organization_id, b.partner_id AS organization_partner_id, b.partner_name AS organization_partner_name
FROM industry_sectors a JOIN partner_organizations b ON a.partner_organization_id = b.partner_organization_id;
```

| industry_sector_id | sector_id | sector_name | description | organization_partner_organization_id | organization_partner_id | organization_partner_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | 1 | 69420 | Composite Review |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | 2 | 9085260 | Compact Initiative A |
| 3 | 103175 | Primary Series | Baseline Series | 3 | 195367 | Legacy Model |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | 4 | b_VB-EC-12 | Regional Cluster |

### Synthesis

The schema models the workplace analytics domain as a hub-and-spoke architecture centred on `organizations`. The four fact tables — `workplace_awards`, `employee_feedback_surveys`, `workplace_culture_dimensions`, and `organizational_healths` — each attach to `organizations` through foreign keys, while cross-linking to one another where the domain semantics require (for instance, awards link to surveys, and culture dimensions link to both surveys and health records). The `partner_organizations` table extends the model to capture inter-organisational relationships, with its own link to `industry_sectors` for classification. The views materialise the most common analytical joins, allowing downstream consumers to reconstruct domain facts — such as "which awards did organisation `Extended Review` receive?" or "what cultural dimensions were measured in the survey with response rate `18.45`?" — without writing explicit join logic. This normalised design preserves data integrity through foreign key constraints while the views provide a denormalised, query-friendly surface for reporting and analysis.

## Data appendix

**Table `industry_sectors`**

| industry_sector_id | sector_id | sector_name | description | is_public_sector | organization_id | partner_organization_id |
|---|---|---|---|---|---|---|
| 1 | 7119771 | Distributed Survey | Extended Survey | true | 1000 | 1 |
| 2 | 726049 | Adaptive Corridor D | Pilot Corridor A | false | 1001 | 2 |
| 3 | 103175 | Primary Series | Baseline Series | true | 1002 | 3 |
| 4 | 9125631 | Composite Assessment | Distributed Assessment | false | 1003 | 4 |

**Table `surveys_dimensions`**

| employee_feedback_survey_id | workplace_culture_dimension_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `healths_dimensions`**

| health_id | workplace_culture_dimension_id |
|---|---|
| 3990171 | 1 |
| 3990171 | 2 |
| 101 | 2 |
| 101 | 3 |
| select | 3 |
| select | 4 |
| 778569 | 4 |
| 778569 | 1 |
