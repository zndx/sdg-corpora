The domain under examination is a student support and safeguarding ecosystem in which learners with special educational needs are enrolled, assessed, and monitored across a lifecycle that spans admission, care planning, risk management, and staff training. Each student arrives with a diagnosis, a care plan, a risk assessment, and a set of educational needs; each need may require staff to complete training modules; and each risk assessment may be tied to an admission application and a training module. The relational schema captures these relationships through seven base tables whose columns encode both entity attributes and foreign-key pointers, and through twenty-one views that materialize the most common join patterns as queryable facts.

## Entity Types and Their Columns

The `students` table is the central entity. Its primary key is `student_id`, a numeric identifier such as `1000` or `1003`. Each student record carries demographic and administrative attributes: `date_of_birth` (e.g. `2025-04-02`), `age` (e.g. `35`), `primary_diagnosis` (e.g. `extended-primary-27`), `ehcp_reference` (e.g. `seasonal-ehcp-47`), and `enrollment_status` which takes one of four values — `pending`, `active`, `withdrawn`, or `waiting_list`. Audit timestamps `created_at` and `updated_at` record when the row was inserted and last modified. Three foreign-key columns — `education_health_care_plan_id`, `special_educational_need_id`, and `health_safety_risk_assessment_id` — bind each student to exactly one care plan, one educational need, and one risk assessment respectively.

**Table `students`**

| student_id | date_of_birth | age | primary_diagnosis | ehcp_reference | enrollment_status | education_health_care_plan_id | special_educational_need_id | health_safety_risk_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2025-04-02 | 35 | extended-primary-27 | seasonal-ehcp-47 | pending | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2022-09-13 | 40 | integrated-primary-28 | regional-ehcp-48 | active | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 2023-02-24 | 45 | seasonal-primary-29 | legacy-ehcp-49 | withdrawn | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2024-07-08 | 50 | regional-primary-30 | compact-ehcp-50 | waiting_list | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `special_educational_needs` table stores the needs themselves. Its primary key is `special_educational_need_id`. The columns `need_code` (e.g. `account_pymes_2405`), `need_name` (e.g. `Integrated Cluster A`), `severity_level` (one of `mild`, `moderate`, `severe`, `complex`), `is_primary` (a boolean), and `requires_specialized_therapy` (a boolean) describe the nature of the need. The foreign key `student_id` links the need back to the student it belongs to, while `staff_training_module_id` points to the training module associated with that need.

**Table `special_educational_needs`**

| special_educational_need_id | need_code | need_name | severity_level | is_primary | requires_specialized_therapy | student_id | staff_training_module_id |
|---|---|---|---|---|---|---|---|
| 1 | account_pymes_2405 | Integrated Cluster A | mild | true | true | 1000 | 1 |
| 2 | 1250214 | Extended Review | moderate | false | false | 1001 | 2 |
| 3 | 937719 | Pilot Initiative | severe | true | true | 1002 | 3 |
| 4 | 321 | Baseline Model D | complex | false | false | 1003 | 4 |

The `education_health_care_plans` table holds care plan records. Its primary key is `id`. The column `ehcp_id` carries a human-readable reference such as `Pelanggan` or `template_impcode_pagata_10`. The issuing authority is recorded in `issuing_l_e_a` (e.g. `integrated-issuing-58`), with `issue_date` and `review_date` as ISO timestamps. `funding_status` takes values like `approved`, `pending`, or `rejected`, and `legal_status` takes `active`, `expired`, or `under_review`. The foreign key `student_id` ties the plan to the student it serves.

**Table `education_health_care_plans`**

| id | ehcp_id | issuing_l_e_a | issue_date | review_date | funding_status | legal_status | student_id |
|---|---|---|---|---|---|---|---|
| 1 | Pelanggan | integrated-issuing-58 | 2023-02-01T13:51:00 | 2024-11-03T22:54:00 | approved | active | 1000 |
| 2 | template_impcode_pagata_10 | seasonal-issuing-59 | 2024-07-12T20:08:00 | 2025-04-14T05:11:00 | pending | expired | 1001 |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | regional-issuing-60 | 2025-12-23T03:25:00 | 2022-09-25T12:28:00 | rejected | under_review | 1002 |
| 4 | 24119665 | legacy-issuing-61 | 2022-05-07T10:42:00 | 2023-02-09T19:45:00 | approved | active | 1003 |

The `admission_applications` table captures each student's admission event. Its primary key is `admission_application_id`. The column `application_id` carries identifiers such as `505997` or `IVC20det40`. `submission_date` records when the application was submitted, and `application_status` takes one of four values: `submitted`, `under_review`, `accepted`, or `rejected`. Boolean columns `interview_scheduled` and `oversubscribed` indicate logistical flags, while `funding_agreement_id` (e.g. `id_0`) references a funding agreement. Four foreign-key columns — `student_id`, `special_educational_need_id`, `education_health_care_plan_id`, and `health_safety_risk_assessment_id` — bind the application to the student, their need, their care plan, and their risk assessment.

**Table `admission_applications`**

| admission_application_id | application_id | submission_date | application_status | funding_agreement_id | interview_scheduled | oversubscribed | student_id | special_educational_need_id | education_health_care_plan_id | health_safety_risk_assessment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | id_0 | true | true | 1000 | 1 | 1 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 9085258 | false | false | 1001 | 2 | 2 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 726034 | true | true | 1002 | 3 | 3 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 726063 | false | false | 1003 | 4 | 4 | 4 |

The `health_safety_risk_assessments` table stores risk assessment records. Its primary key is `health_safety_risk_assessment_id`. The column `assessment_id` carries identifiers such as `template_ivacode_pagata_20det40ind`. `assessment_date` is an ISO timestamp, and `risk_level` takes one of four values: `low`, `medium`, `high`, or `critical`. The `mitigation_plan` column (e.g. `pilot-mitigati-26`) and `completed_by` column (e.g. `compact-complete-26`) describe the mitigation strategy and the person who completed it. `status` takes values such as `draft`, `approved`, `implemented`, or `reviewed`. Foreign keys `student_id`, `admission_application_id`, and `staff_training_module_id` link the assessment to the student, the admission application, and the training module.

**Table `health_safety_risk_assessments`**

| health_safety_risk_assessment_id | assessment_id | assessment_date | risk_level | mitigation_plan | completed_by | status | student_id | admission_application_id | staff_training_module_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | pilot-mitigati-26 | compact-complete-26 | draft | 1000 | 1 | 1 |
| 2 | 19508914 | 2023-10-21T11:41:00 | medium | extended-mitigati-27 | composite-complete-27 | approved | 1001 | 2 | 2 |
| 3 | 506000 | 2024-03-05T18:58:00 | high | integrated-mitigati-28 | primary-complete-28 | implemented | 1002 | 3 | 3 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | critical | seasonal-mitigati-29 | adaptive-complete-29 | reviewed | 1003 | 4 | 4 |

The `staff_training_modules` table records training modules. Its primary key is `id`. The column `module_id` carries identifiers such as `13061773`, and `module_name` carries names like `Kimberly Myers`. `delivery_date` is an ISO timestamp, and `completion_status` takes values such as `scheduled`, `in_progress`, `completed`, or `mandatory`. `target_audience` (e.g. `teachers`, `therapists`, `support_staff`, or `all`) and `hours_required` (e.g. `17.20`) describe the module's scope. Foreign keys `special_educational_need_id`, `staff_member_id`, and `health_safety_risk_assessment_id` bind the module to the need it addresses, the staff member assigned, and the risk assessment it supports.

**Table `staff_training_modules`**

| id | module_id | module_name | delivery_date | completion_status | target_audience | hours_required | special_educational_need_id | staff_member_id | health_safety_risk_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 13061773 | Kimberly Myers | 2022-09-10T08:48:00 | scheduled | teachers | 17.20 | 1 | 1 | 1 |
| 2 | template_ivacode_pagata_0 | Brian Hamilton | 2023-02-21T15:05:00 | in_progress | therapists | 20.40 | 2 | 2 | 2 |
| 3 | 3744024 | Elizabeth Woods | 2024-07-05T22:22:00 | completed | support_staff | 23.60 | 3 | 3 | 3 |
| 4 | 727063 | Desiree Cain | 2025-12-16T05:39:00 | mandatory | all | 26.80 | 4 | 4 | 4 |

The `staff_members` table stores staff records. Its primary key is `staff_member_id`. The column `staff_id` carries identifiers such as `SM001`, and `staff_name` carries names like `Jane Smith`. `role` (e.g. `special_needs_coordinator`), `department` (e.g. `student_services`), and `hire_date` describe the staff member's profile. `employment_status` takes values such as `active`, `on_leave`, or `terminated`, and `specialization` (e.g. `autism_spectrum_disorder`) records their area of expertise.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | department | is_qualified | employment_status | staff_training_module_id | student_id | health_safety_risk_assessment_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | SEN | false | active | 1 | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | 3158139 | Account Name | therapist | therapy | true | on_leave | 2 | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | 8189502 | Saipan International Airport | support_staff | administration | false | terminated | 3 | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | 69438 | Norma Fisher | executive_headteacher | leadership | true | active | 4 | 1003 | 4 | 2025-04-16 09:14:00 |

## Foreign-Key Relationships and Cardinality

The schema enforces a one-to-one relationship between each student and their care plan, need, and risk assessment through the foreign-key columns in `students`. Student `1000` references care plan `1`, need `1`, and risk assessment `1`; student `1003` references care plan `4`, need `4`, and risk assessment `4`. The `special_educational_needs` table also carries a `student_id` foreign key, creating a second pointer from need to student — for example, need `1` (code `account_pymes_2405`, name `Integrated Cluster A`, severity `mild`) points back to student `1000`.

The `admission_applications` table is the most heavily connected entity. Each application row references all four other base entities: student `1000`'s application (id `505997`, status `submitted`) references need `1`, care plan `1`, and risk assessment `1`. The boolean flags `interview_scheduled` and `oversubscribed` provide additional context — application `505997` has both set to `true`, while application `1250196` (student `1001`, status `under_review`) has both set to `false`.

The `health_safety_risk_assessments` table links back to `admission_applications` and `staff_training_modules`. Risk assessment `1` (risk level `low`, status `draft`, mitigation plan `pilot-mitigati-26`) is associated with admission application `1` and training module `1`. The `staff_training_modules` table, in turn, links to `special_educational_needs`, `staff_members`, and `health_safety_risk_assessments`. Training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required) is associated with special educational need `1`, staff member `1`, and health safety risk assessment `1`.

## Views as Reconstructed Domain Facts

Each view materializes a specific join across the base tables, answering a concrete question about the domain.

The `student_education_health_care_plan_view` joins `students` to `education_health_care_plans` on `education_health_care_plan_id`, answering which care plan belongs to which student. Reading row 1: student `1000` (diagnosis `extended-primary-27`, status `pending`) is linked to care plan `1` (issuing authority `Pelanggan`, funding status `approved`, legal status `active`).

**View `student_education_health_care_plan_view`**

```sql
CREATE VIEW student_education_health_care_plan_view AS
SELECT a.student_id, a.date_of_birth, a.age, a.primary_diagnosis, b.id AS plan_id, b.ehcp_id AS plan_ehcp_id, b.issuing_l_e_a AS plan_issuing_l_e_a
FROM students a JOIN education_health_care_plans b ON a.education_health_care_plan_id = b.id;
```

| student_id | date_of_birth | age | primary_diagnosis | plan_id | plan_ehcp_id | plan_issuing_l_e_a |
|---|---|---|---|---|---|---|
| 1000 | 2025-04-02 | 35 | extended-primary-27 | 1 | Pelanggan | integrated-issuing-58 |
| 1001 | 2022-09-13 | 40 | integrated-primary-28 | 2 | template_impcode_pagata_10 | seasonal-issuing-59 |
| 1002 | 2023-02-24 | 45 | seasonal-primary-29 | 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | regional-issuing-60 |
| 1003 | 2024-07-08 | 50 | regional-primary-30 | 4 | 24119665 | legacy-issuing-61 |

The `student_special_educational_need_view` joins `students` to `special_educational_needs` on `special_educational_need_id`, answering which educational need is assigned to which student. Row 1 shows student `1000` linked to need `1` (code `account_pymes_2405`, name `Integrated Cluster A`, severity `mild`, primary `true`, requiring specialized therapy `true`).

**View `student_special_educational_need_view`**

```sql
CREATE VIEW student_special_educational_need_view AS
SELECT a.student_id, a.date_of_birth, a.age, a.primary_diagnosis, b.special_educational_need_id AS need_special_educational_need_id, b.need_code AS need_need_code, b.need_name AS need_need_name
FROM students a JOIN special_educational_needs b ON a.special_educational_need_id = b.special_educational_need_id;
```

| student_id | date_of_birth | age | primary_diagnosis | need_special_educational_need_id | need_need_code | need_need_name |
|---|---|---|---|---|---|---|
| 1000 | 2025-04-02 | 35 | extended-primary-27 | 1 | account_pymes_2405 | Integrated Cluster A |
| 1001 | 2022-09-13 | 40 | integrated-primary-28 | 2 | 1250214 | Extended Review |
| 1002 | 2023-02-24 | 45 | seasonal-primary-29 | 3 | 937719 | Pilot Initiative |
| 1003 | 2024-07-08 | 50 | regional-primary-30 | 4 | 321 | Baseline Model D |

The `student_health_safety_risk_assessment_view` joins `students` to `health_safety_risk_assessments` on `health_safety_risk_assessment_id`, answering which risk assessment applies to which student. Row 1 shows student `1000` linked to assessment `1` (risk level `low`, status `draft`, mitigation plan `pilot-mitigati-26`).

**View `student_health_safety_risk_assessment_view`**

```sql
CREATE VIEW student_health_safety_risk_assessment_view AS
SELECT a.student_id, a.date_of_birth, a.age, a.primary_diagnosis, b.health_safety_risk_assessment_id AS assessment_health_safety_risk_assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM students a JOIN health_safety_risk_assessments b ON a.health_safety_risk_assessment_id = b.health_safety_risk_assessment_id;
```

| student_id | date_of_birth | age | primary_diagnosis | assessment_health_safety_risk_assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1000 | 2025-04-02 | 35 | extended-primary-27 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 1001 | 2022-09-13 | 40 | integrated-primary-28 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 1002 | 2023-02-24 | 45 | seasonal-primary-29 | 3 | 506000 | 2024-03-05T18:58:00 |
| 1003 | 2024-07-08 | 50 | regional-primary-30 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

The `special_educational_need_student_view` performs the reverse join, answering which students are associated with a given special educational need. Row 1 shows need `1` (name `Integrated Cluster A`, severity `mild`) linked to student `1000` (diagnosis `extended-primary-27`, enrollment status `pending`).

**View `special_educational_need_student_view`**

```sql
CREATE VIEW special_educational_need_student_view AS
SELECT a.special_educational_need_id, a.need_code, a.need_name, a.severity_level, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.age AS student_age
FROM special_educational_needs a JOIN students b ON a.student_id = b.student_id;
```

| special_educational_need_id | need_code | need_name | severity_level | student_student_id | student_date_of_birth | student_age |
|---|---|---|---|---|---|---|
| 1 | account_pymes_2405 | Integrated Cluster A | mild | 1000 | 2025-04-02 | 35 |
| 2 | 1250214 | Extended Review | moderate | 1001 | 2022-09-13 | 40 |
| 3 | 937719 | Pilot Initiative | severe | 1002 | 2023-02-24 | 45 |
| 4 | 321 | Baseline Model D | complex | 1003 | 2024-07-08 | 50 |

The `special_educational_need_staff_training_module_view` joins `special_educational_needs` to `staff_training_modules` on `staff_training_module_id`, answering which training modules are associated with a given educational need. Row 1 shows need `1` (name `Integrated Cluster A`, severity `mild`) linked to training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required, completion status `scheduled`).

**View `special_educational_need_staff_training_module_view`**

```sql
CREATE VIEW special_educational_need_staff_training_module_view AS
SELECT a.special_educational_need_id, a.need_code, a.need_name, a.severity_level, b.id AS module_id, b.module_id AS module_module_id, b.module_name AS module_module_name
FROM special_educational_needs a JOIN staff_training_modules b ON a.staff_training_module_id = b.id;
```

| special_educational_need_id | need_code | need_name | severity_level | module_id | module_module_id | module_module_name |
|---|---|---|---|---|---|---|
| 1 | account_pymes_2405 | Integrated Cluster A | mild | 1 | 13061773 | Kimberly Myers |
| 2 | 1250214 | Extended Review | moderate | 2 | template_ivacode_pagata_0 | Brian Hamilton |
| 3 | 937719 | Pilot Initiative | severe | 3 | 3744024 | Elizabeth Woods |
| 4 | 321 | Baseline Model D | complex | 4 | 727063 | Desiree Cain |

The `education_health_care_plan_student_view` joins `education_health_care_plans` to `students` on `student_id`, answering which students are covered by a given care plan. Row 1 shows care plan `1` (issuing authority `Pelanggan`, funding status `approved`, legal status `active`) linked to student `1000` (diagnosis `extended-primary-27`, enrollment status `pending`).

**View `education_health_care_plan_student_view`**

```sql
CREATE VIEW education_health_care_plan_student_view AS
SELECT a.id, a.ehcp_id, a.issuing_l_e_a, a.issue_date, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.age AS student_age
FROM education_health_care_plans a JOIN students b ON a.student_id = b.student_id;
```

| id | ehcp_id | issuing_l_e_a | issue_date | student_student_id | student_date_of_birth | student_age |
|---|---|---|---|---|---|---|
| 1 | Pelanggan | integrated-issuing-58 | 2023-02-01T13:51:00 | 1000 | 2025-04-02 | 35 |
| 2 | template_impcode_pagata_10 | seasonal-issuing-59 | 2024-07-12T20:08:00 | 1001 | 2022-09-13 | 40 |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | regional-issuing-60 | 2025-12-23T03:25:00 | 1002 | 2023-02-24 | 45 |
| 4 | 24119665 | legacy-issuing-61 | 2022-05-07T10:42:00 | 1003 | 2024-07-08 | 50 |

The `admission_application_student_view` joins `admission_applications` to `students` on `student_id`, answering which students have submitted which admission applications. Row 1 shows application `505997` (status `submitted`, interview scheduled `true`, oversubscribed `true`) linked to student `1000` (diagnosis `extended-primary-27`, enrollment status `pending`).

**View `admission_application_student_view`**

```sql
CREATE VIEW admission_application_student_view AS
SELECT a.admission_application_id, a.application_id, a.submission_date, a.application_status, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.age AS student_age
FROM admission_applications a JOIN students b ON a.student_id = b.student_id;
```

| admission_application_id | application_id | submission_date | application_status | student_student_id | student_date_of_birth | student_age |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1000 | 2025-04-02 | 35 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 1001 | 2022-09-13 | 40 |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 1002 | 2023-02-24 | 45 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 1003 | 2024-07-08 | 50 |

The `admission_application_special_educational_need_view` joins `admission_applications` to `special_educational_needs` on `special_educational_need_id`, answering which educational needs are referenced in which admission applications. Row 1 shows application `505997` (status `submitted`) linked to need `1` (name `Integrated Cluster A`, severity `mild`, primary `true`).

**View `admission_application_special_educational_need_view`**

```sql
CREATE VIEW admission_application_special_educational_need_view AS
SELECT a.admission_application_id, a.application_id, a.submission_date, a.application_status, b.special_educational_need_id AS need_special_educational_need_id, b.need_code AS need_need_code, b.need_name AS need_need_name
FROM admission_applications a JOIN special_educational_needs b ON a.special_educational_need_id = b.special_educational_need_id;
```

| admission_application_id | application_id | submission_date | application_status | need_special_educational_need_id | need_need_code | need_need_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | account_pymes_2405 | Integrated Cluster A |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | 1250214 | Extended Review |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 3 | 937719 | Pilot Initiative |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | 321 | Baseline Model D |

The `admission_application_education_health_care_plan_view` joins `admission_applications` to `education_health_care_plans` on `education_health_care_plan_id`, answering which care plans are referenced in which admission applications. Row 1 shows application `505997` (status `submitted`) linked to care plan `1` (issuing authority `Pelanggan`, funding status `approved`, legal status `active`).

**View `admission_application_education_health_care_plan_view`**

```sql
CREATE VIEW admission_application_education_health_care_plan_view AS
SELECT a.admission_application_id, a.application_id, a.submission_date, a.application_status, b.id AS plan_id, b.ehcp_id AS plan_ehcp_id, b.issuing_l_e_a AS plan_issuing_l_e_a
FROM admission_applications a JOIN education_health_care_plans b ON a.education_health_care_plan_id = b.id;
```

| admission_application_id | application_id | submission_date | application_status | plan_id | plan_ehcp_id | plan_issuing_l_e_a |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | Pelanggan | integrated-issuing-58 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | template_impcode_pagata_10 | seasonal-issuing-59 |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | regional-issuing-60 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | 24119665 | legacy-issuing-61 |

The `admission_application_health_safety_risk_assessment_view` joins `admission_applications` to `health_safety_risk_assessments` on `health_safety_risk_assessment_id`, answering which risk assessments are referenced in which admission applications. Row 1 shows application `505997` (status `submitted`) linked to assessment `1` (risk level `low`, status `draft`, mitigation plan `pilot-mitigati-26`).

**View `admission_application_health_safety_risk_assessment_view`**

```sql
CREATE VIEW admission_application_health_safety_risk_assessment_view AS
SELECT a.admission_application_id, a.application_id, a.submission_date, a.application_status, b.health_safety_risk_assessment_id AS assessment_health_safety_risk_assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM admission_applications a JOIN health_safety_risk_assessments b ON a.health_safety_risk_assessment_id = b.health_safety_risk_assessment_id;
```

| admission_application_id | application_id | submission_date | application_status | assessment_health_safety_risk_assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | 19508914 | 2023-10-21T11:41:00 |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 3 | 506000 | 2024-03-05T18:58:00 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

The `health_safety_risk_assessment_student_view` joins `health_safety_risk_assessments` to `students` on `student_id`, answering which students are covered by a given risk assessment. Row 1 shows assessment `1` (risk level `low`, status `draft`) linked to student `1000` (diagnosis `extended-primary-27`, enrollment status `pending`).

**View `health_safety_risk_assessment_student_view`**

```sql
CREATE VIEW health_safety_risk_assessment_student_view AS
SELECT a.health_safety_risk_assessment_id, a.assessment_id, a.assessment_date, a.risk_level, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.age AS student_age
FROM health_safety_risk_assessments a JOIN students b ON a.student_id = b.student_id;
```

| health_safety_risk_assessment_id | assessment_id | assessment_date | risk_level | student_student_id | student_date_of_birth | student_age |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | 1000 | 2025-04-02 | 35 |
| 2 | 19508914 | 2023-10-21T11:41:00 | medium | 1001 | 2022-09-13 | 40 |
| 3 | 506000 | 2024-03-05T18:58:00 | high | 1002 | 2023-02-24 | 45 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | critical | 1003 | 2024-07-08 | 50 |

The `health_safety_risk_assessment_admission_application_view` joins `health_safety_risk_assessments` to `admission_applications` on `admission_application_id`, answering which admission applications are associated with a given risk assessment. Row 1 shows assessment `1` (risk level `low`, status `draft`) linked to application `505997` (status `submitted`, interview scheduled `true`).

**View `health_safety_risk_assessment_admission_application_view`**

```sql
CREATE VIEW health_safety_risk_assessment_admission_application_view AS
SELECT a.health_safety_risk_assessment_id, a.assessment_id, a.assessment_date, a.risk_level, b.admission_application_id AS application_admission_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM health_safety_risk_assessments a JOIN admission_applications b ON a.admission_application_id = b.admission_application_id;
```

| health_safety_risk_assessment_id | assessment_id | assessment_date | risk_level | application_admission_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | 1 | 505997 | 2025-04-24T03:57:00 |
| 2 | 19508914 | 2023-10-21T11:41:00 | medium | 2 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 506000 | 2024-03-05T18:58:00 | high | 3 | 124 | 2023-02-19T17:31:00 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | critical | 4 | IVC20det40 | 2024-07-03T00:48:00 |

The `health_safety_risk_assessment_staff_training_module_view` joins `health_safety_risk_assessments` to `staff_training_modules` on `staff_training_module_id`, answering which training modules are associated with a given risk assessment. Row 1 shows assessment `1` (risk level `low`, status `draft`) linked to training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required).

**View `health_safety_risk_assessment_staff_training_module_view`**

```sql
CREATE VIEW health_safety_risk_assessment_staff_training_module_view AS
SELECT a.health_safety_risk_assessment_id, a.assessment_id, a.assessment_date, a.risk_level, b.id AS module_id, b.module_id AS module_module_id, b.module_name AS module_module_name
FROM health_safety_risk_assessments a JOIN staff_training_modules b ON a.staff_training_module_id = b.id;
```

| health_safety_risk_assessment_id | assessment_id | assessment_date | risk_level | module_id | module_module_id | module_module_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | 1 | 13061773 | Kimberly Myers |
| 2 | 19508914 | 2023-10-21T11:41:00 | medium | 2 | template_ivacode_pagata_0 | Brian Hamilton |
| 3 | 506000 | 2024-03-05T18:58:00 | high | 3 | 3744024 | Elizabeth Woods |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | critical | 4 | 727063 | Desiree Cain |

The `staff_training_module_special_educational_need_view` joins `staff_training_modules` to `special_educational_needs` on `special_educational_need_id`, answering which educational needs are addressed by a given training module. Row 1 shows training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required) linked to need `1` (name `Integrated Cluster A`, severity `mild`, primary `true`).

**View `staff_training_module_special_educational_need_view`**

```sql
CREATE VIEW staff_training_module_special_educational_need_view AS
SELECT a.id, a.module_id, a.module_name, a.delivery_date, b.special_educational_need_id AS need_special_educational_need_id, b.need_code AS need_need_code, b.need_name AS need_need_name
FROM staff_training_modules a JOIN special_educational_needs b ON a.special_educational_need_id = b.special_educational_need_id;
```

| id | module_id | module_name | delivery_date | need_special_educational_need_id | need_need_code | need_need_name |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Kimberly Myers | 2022-09-10T08:48:00 | 1 | account_pymes_2405 | Integrated Cluster A |
| 2 | template_ivacode_pagata_0 | Brian Hamilton | 2023-02-21T15:05:00 | 2 | 1250214 | Extended Review |
| 3 | 3744024 | Elizabeth Woods | 2024-07-05T22:22:00 | 3 | 937719 | Pilot Initiative |
| 4 | 727063 | Desiree Cain | 2025-12-16T05:39:00 | 4 | 321 | Baseline Model D |

The `staff_training_module_staff_member_view` joins `staff_training_modules` to `staff_members` on `staff_member_id`, answering which staff members are assigned to a given training module. Row 1 shows training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required) linked to staff member `1` (name `Jane Smith`, role `special_needs_coordinator`, department `student_services`).

**View `staff_training_module_staff_member_view`**

```sql
CREATE VIEW staff_training_module_staff_member_view AS
SELECT a.id, a.module_id, a.module_name, a.delivery_date, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM staff_training_modules a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| id | module_id | module_name | delivery_date | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Kimberly Myers | 2022-09-10T08:48:00 | 1 | 937735 | Theodore Mcgrath |
| 2 | template_ivacode_pagata_0 | Brian Hamilton | 2023-02-21T15:05:00 | 2 | 3158139 | Account Name |
| 3 | 3744024 | Elizabeth Woods | 2024-07-05T22:22:00 | 3 | 8189502 | Saipan International Airport |
| 4 | 727063 | Desiree Cain | 2025-12-16T05:39:00 | 4 | 69438 | Norma Fisher |

The `staff_training_module_health_safety_risk_assessment_view` joins `staff_training_modules` to `health_safety_risk_assessments` on `health_safety_risk_assessment_id`, answering which risk assessments are supported by a given training module. Row 1 shows training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required) linked to assessment `1` (risk level `low`, status `draft`, mitigation plan `pilot-mitigati-26`).

**View `staff_training_module_health_safety_risk_assessment_view`**

```sql
CREATE VIEW staff_training_module_health_safety_risk_assessment_view AS
SELECT a.id, a.module_id, a.module_name, a.delivery_date, b.health_safety_risk_assessment_id AS assessment_health_safety_risk_assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM staff_training_modules a JOIN health_safety_risk_assessments b ON a.health_safety_risk_assessment_id = b.health_safety_risk_assessment_id;
```

| id | module_id | module_name | delivery_date | assessment_health_safety_risk_assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Kimberly Myers | 2022-09-10T08:48:00 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 2 | template_ivacode_pagata_0 | Brian Hamilton | 2023-02-21T15:05:00 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 3 | 3744024 | Elizabeth Woods | 2024-07-05T22:22:00 | 3 | 506000 | 2024-03-05T18:58:00 |
| 4 | 727063 | Desiree Cain | 2025-12-16T05:39:00 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

The `staff_member_staff_training_module_view` joins `staff_members` to `staff_training_modules` on `id`, answering which training modules a given staff member is assigned to. Row 1 shows staff member `1` (name `Jane Smith`, role `special_needs_coordinator`, department `student_services`) linked to training module `1` (name `Kimberly Myers`, target audience `teachers`, `17.20` hours required, completion status `scheduled`).

**View `staff_member_staff_training_module_view`**

```sql
CREATE VIEW staff_member_staff_training_module_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.id AS module_id, b.module_id AS module_module_id, b.module_name AS module_module_name
FROM staff_members a JOIN staff_training_modules b ON a.staff_training_module_id = b.id;
```

| staff_member_id | staff_id | full_name | role | module_id | module_module_id | module_module_name |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | 1 | 13061773 | Kimberly Myers |
| 2 | 3158139 | Account Name | therapist | 2 | template_ivacode_pagata_0 | Brian Hamilton |
| 3 | 8189502 | Saipan International Airport | support_staff | 3 | 3744024 | Elizabeth Woods |
| 4 | 69438 | Norma Fisher | executive_headteacher | 4 | 727063 | Desiree Cain |

The `staff_member_student_view` joins `staff_members` to `students` on `student_id`, answering which students are associated with a given staff member. Row 1 shows staff member `1` (name `Jane Smith`, role `special_needs_coordinator`, department `student_services`) linked to student `1000` (diagnosis `extended-primary-27`, enrollment status `pending`).

**View `staff_member_student_view`**

```sql
CREATE VIEW staff_member_student_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.age AS student_age
FROM staff_members a JOIN students b ON a.student_id = b.student_id;
```

| staff_member_id | staff_id | full_name | role | student_student_id | student_date_of_birth | student_age |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | 1000 | 2025-04-02 | 35 |
| 2 | 3158139 | Account Name | therapist | 1001 | 2022-09-13 | 40 |
| 3 | 8189502 | Saipan International Airport | support_staff | 1002 | 2023-02-24 | 45 |
| 4 | 69438 | Norma Fisher | executive_headteacher | 1003 | 2024-07-08 | 50 |

The `staff_member_health_safety_risk_assessment_view` joins `staff_members` to `health_safety_risk_assessments` on `health_safety_risk_assessment_id`, answering which risk assessments a given staff member has completed. Row 1 shows staff member `1` (name `Jane Smith`, role `special_needs_coordinator`, department `student_services`) linked to assessment `1` (risk level `low`, status `draft`, completed by `compact-complete-26`).

**View `staff_member_health_safety_risk_assessment_view`**

```sql
CREATE VIEW staff_member_health_safety_risk_assessment_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.health_safety_risk_assessment_id AS assessment_health_safety_risk_assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM staff_members a JOIN health_safety_risk_assessments b ON a.health_safety_risk_assessment_id = b.health_safety_risk_assessment_id;
```

| staff_member_id | staff_id | full_name | role | assessment_health_safety_risk_assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 2 | 3158139 | Account Name | therapist | 2 | 19508914 | 2023-10-21T11:41:00 |
| 3 | 8189502 | Saipan International Airport | support_staff | 3 | 506000 | 2024-03-05T18:58:00 |
| 4 | 69438 | Norma Fisher | executive_headteacher | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

## Synthesis

The schema models a student support ecosystem through seven base tables whose columns encode both entity attributes and foreign-key pointers. The `students` table anchors the model with demographic and administrative data, while `special_educational_needs`, `education_health_care_plans`, `admission_applications`, `health_safety_risk_assessments`, `staff_training_modules`, and `staff_members` capture the supporting entities. Foreign-key relationships bind each student to exactly one care plan, one educational need, and one risk assessment, while the `admission_applications` table serves as a hub connecting all four supporting entities to the student. The twenty-one views materialize the most common join patterns as queryable facts, each answering a specific question about the domain — from which care plan belongs to which student, to which training modules are associated with a given risk assessment. The result is a normalized schema that faithfully represents the domain's entity types, attributes, and cardinality-bounded relationships, with views providing convenient access to the most frequently queried combinations of data.