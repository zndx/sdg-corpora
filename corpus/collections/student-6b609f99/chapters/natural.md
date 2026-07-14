## Supporting Learners with Complex Needs: Records, Relationships, and Operational Workflows

Educational institutions that serve students with special educational needs and health requirements must coordinate across multiple domains: academic provision, clinical care, risk management, and staff development. Every decision about a learner's placement, support plan, or safety protocol rests on a chain of linked records. This chapter describes the data structures that capture those decisions, the relationships that bind them together, and the joined views that practitioners consult when answering operational questions.

The domain centers on five core entities. Students carry their demographic and diagnostic information alongside references to their care plans, educational needs, and risk assessments. Special educational needs define the categories and severity of support a student requires. Education and health care plans formalize the legal and funding arrangements for that support. Admission applications document the procedural journey from inquiry to enrollment. Health and safety risk assessments capture the protective measures put in place for each learner. Staff training modules ensure that the personnel delivering support have completed the required preparation. Together, these records form a coherent picture of each student's situation.

**Table `students`**

| student_id | date_of_birth | age | primary_diagnosis | ehcp_reference | enrollment_status | education_health_care_plan_id | special_educational_need_id | health_safety_risk_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2025-04-02 | 35 | extended-primary-27 | seasonal-ehcp-47 | pending | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2022-09-13 | 40 | integrated-primary-28 | regional-ehcp-48 | active | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 2023-02-24 | 45 | seasonal-primary-29 | legacy-ehcp-49 | withdrawn | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2024-07-08 | 50 | regional-primary-30 | compact-ehcp-50 | waiting_list | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The students table is the anchor of the domain. Each row represents a learner identified by a numeric `student_id`. The `date_of_birth` and `age` fields provide demographic context, while `primary_diagnosis` records the clinical categorization — values such as `extended-primary-27`, `integrated-primary-28`, `seasonal-primary-29`, and `regional-primary-30` appear across the four learners in the dataset. The `ehcp_reference` column holds a human-readable reference to the associated care plan, for example `seasonal-ehcp-47` or `regional-ehcp-48`. The `enrollment_status` field tracks the learner's current standing: `pending`, `active`, `withdrawn`, and `waiting_list` are the four states observed. Foreign keys `education_health_care_plan_id`, `special_educational_need_id`, and `health_safety_risk_assessment_id` link each student to their respective support records. Timestamps `created_at` and `updated_at` record when the profile was first opened and last modified, with entries spanning from early January through late April 2025.

**Table `special_educational_needs`**

| special_educational_need_id | need_code | need_name | severity_level | is_primary | requires_specialized_therapy | student_id | staff_training_module_id |
|---|---|---|---|---|---|---|---|
| 1 | account_pymes_2405 | Integrated Cluster A | mild | true | true | 1000 | 1 |
| 2 | 1250214 | Extended Review | moderate | false | false | 1001 | 2 |
| 3 | 937719 | Pilot Initiative | severe | true | true | 1002 | 3 |
| 4 | 321 | Baseline Model D | complex | false | false | 1003 | 4 |

Special educational needs are catalogued in their own table, each identified by a `special_educational_need_id` and a `need_code`. The `need_name` column provides a descriptive label — `Integrated Cluster A`, `Extended Review`, `Pilot Initiative`, and `Baseline Model D` — while `severity_level` classifies the intensity as `mild`, `moderate`, `severe`, or `complex`. The boolean `is_primary` flag indicates whether this need is the student's principal diagnosis, and `requires_specialized_therapy` signals whether clinical intervention is part of the support package. In the data, needs with IDs 1 and 3 are both primary and require specialized therapy, whereas needs 2 and 4 are secondary and do not. The `student_id` foreign key ties each need to a specific learner, and `staff_training_module_id` links the need to the training that staff must complete to address it.

**Table `education_health_care_plans`**

| id | ehcp_id | issuing_l_e_a | issue_date | review_date | funding_status | legal_status | student_id |
|---|---|---|---|---|---|---|---|
| 1 | Pelanggan | integrated-issuing-58 | 2023-02-01T13:51:00 | 2024-11-03T22:54:00 | approved | active | 1000 |
| 2 | template_impcode_pagata_10 | seasonal-issuing-59 | 2024-07-12T20:08:00 | 2025-04-14T05:11:00 | pending | expired | 1001 |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | regional-issuing-60 | 2025-12-23T03:25:00 | 2022-09-25T12:28:00 | rejected | under_review | 1002 |
| 4 | 24119665 | legacy-issuing-61 | 2022-05-07T10:42:00 | 2023-02-09T19:45:00 | approved | active | 1003 |

Education and health care plans formalize the legal and financial framework for student support. Each plan has an internal `id`, an `ehcp_id` that serves as the external reference, and an `issuing_l_e_a` field identifying the local education authority. The `issue_date` and `review_date` establish the plan's validity window, while `funding_status` — `approved`, `pending`, or `rejected` — determines whether resources are committed. The `legal_status` column tracks the plan's current standing: `active`, `expired`, or `under_review`. In the dataset, plans 1 and 4 are both approved and active, plan 2 is pending with an expired legal status, and plan 3 is rejected and under review. The `student_id` foreign key connects each plan to the learner it serves.

**Table `admission_applications`**

| admission_application_id | application_id | submission_date | application_status | funding_agreement_id | interview_scheduled | oversubscribed | student_id | special_educational_need_id | education_health_care_plan_id | health_safety_risk_assessment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | id_0 | true | true | 1000 | 1 | 1 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 9085258 | false | false | 1001 | 2 | 2 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | accepted | 726034 | true | true | 1002 | 3 | 3 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 726063 | false | false | 1003 | 4 | 4 | 4 |

The admission process is captured through the `admission_applications` table. Each application has a unique `admission_application_id` and an `application_id` that may be numeric or alphanumeric — values such as `505997`, `1250196`, `124`, and `IVC20det40` appear in the records. The `submission_date` records when the application was filed, and `application_status` tracks its progression through `submitted`, `under_review`, `accepted`, and `rejected`. The `funding_agreement_id` links to the financial arrangement, while `interview_scheduled` and `oversubscribed` are boolean flags indicating procedural milestones. Each application references a `student_id`, a `special_educational_need_id`, an `education_health_care_plan_id`, and a `health_safety_risk_assessment_id`, creating a comprehensive snapshot of the learner's profile at the point of admission.

**Table `health_safety_risk_assessments`**

| health_safety_risk_assessment_id | assessment_id | assessment_date | risk_level | mitigation_plan | completed_by | status | student_id | admission_application_id | staff_training_module_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | pilot-mitigati-26 | compact-complete-26 | draft | 1000 | 1 | 1 |
| 2 | 19508914 | 2023-10-21T11:41:00 | medium | extended-mitigati-27 | composite-complete-27 | approved | 1001 | 2 | 2 |
| 3 | 506000 | 2024-03-05T18:58:00 | high | integrated-mitigati-28 | primary-complete-28 | implemented | 1002 | 3 | 3 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | critical | seasonal-mitigati-29 | adaptive-complete-29 | reviewed | 1003 | 4 | 4 |

Health and safety risk assessments document the protective measures for each student. The `health_safety_risk_assessment_id` identifies each assessment, while `assessment_id` provides an external reference — for example, `template_ivacode_pagata_20det40ind` or `1204-0009-M`. The `assessment_date` records when the evaluation was conducted, and `risk_level` classifies the severity as `low`, `medium`, `high`, or `critical`. The `mitigation_plan` field describes the planned interventions, such as `pilot-mitigati-26` or `seasonal-mitigati-29`, and `completed_by` identifies the responsible party, for instance `compact-complete-26` or `adaptive-complete-29`. The `status` column tracks the assessment lifecycle: `draft`, `approved`, `implemented`, and `reviewed`. Each assessment links to a `student_id`, an `admission_application_id`, and a `staff_training_module_id`, ensuring that risk management is coordinated with both the admission process and staff preparation.

**Table `staff_training_modules`**

| id | module_id | module_name | delivery_date | completion_status | target_audience | hours_required | special_educational_need_id | staff_member_id | health_safety_risk_assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 13061773 | Kimberly Myers | 2022-09-10T08:48:00 | scheduled | teachers | 17.20 | 1 | 1 | 1 |
| 2 | template_ivacode_pagata_0 | Brian Hamilton | 2023-02-21T15:05:00 | in_progress | therapists | 20.40 | 2 | 2 | 2 |
| 3 | 3744024 | Elizabeth Woods | 2024-07-05T22:22:00 | completed | support_staff | 23.60 | 3 | 3 | 3 |
| 4 | 727063 | Desiree Cain | 2025-12-16T05:39:00 | mandatory | all | 26.80 | 4 | 4 | 4 |

Staff training modules ensure that personnel have the competencies required to support students with specific needs. Each module has an internal `id`, a `module_id`, and a `module_name` — the dataset includes entries named `Kimberly Myers`, `Brian Hamilton`, `Elizabeth Woods`, and `Desiree Cain`. The `delivery_date` records when the training was scheduled or delivered, and `completion_status` tracks progress through `scheduled`, `in_progress`, `completed`, and `mandatory`. The `target_audience` field specifies who the training is intended for: `teachers`, `therapists`, `support_staff`, or `all`. The `hours_required` column quantifies the time commitment, ranging from 17.20 to 26.80 hours in the data. Each module links to a `special_educational_need_id`, a `staff_member_id`, and a `health_safety_risk_assessment_id`, creating a three-way relationship between the need, the trainer, and the risk context.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | department | is_qualified | employment_status | staff_training_module_id | student_id | health_safety_risk_assessment_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | SEN | false | active | 1 | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | 3158139 | Account Name | therapist | therapy | true | on_leave | 2 | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | 8189502 | Saipan International Airport | support_staff | administration | false | terminated | 3 | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | 69438 | Norma Fisher | executive_headteacher | leadership | true | active | 4 | 1003 | 4 | 2025-04-16 09:14:00 |

Staff members are the individuals who deliver training and support. Each staff member is identified by a `staff_member_id` and linked to the training modules they are responsible for or have completed. The staff table connects to the broader ecosystem through the `staff_training_module_id` foreign key in the training modules table and through the various views that join staff to students, risk assessments, and training records.

The power of the domain's data model lies in its joined views, which synthesize information across tables to answer specific operational questions. Each view represents a particular lens through which practitioners can examine the relationships between students, their needs, their plans, and the support infrastructure around them.

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

The student-education-health-care-plan view answers the question: what care plan is associated with each student, and what is its current status? This join combines the students table with the education_health_care_plans table, producing a consolidated record that shows each student alongside their plan's issuing authority, dates, funding status, and legal status. For student 1000, the view reveals an approved, active plan issued under `integrated-issuing-58`. For student 1002, the view shows a rejected plan that remains under review, signaling that the learner's support arrangement is unresolved.

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

The student-special-educational-need view answers: what is each student's primary need, and how severe is it? By joining students with special_educational_needs, this view surfaces the `need_name`, `severity_level`, and `requires_specialized_therapy` flags alongside the student's diagnosis and enrollment status. Student 1002, for instance, has a `severe` need classified as `Pilot Initiative` that requires specialized therapy, while student 1003 has a `complex` need classified as `Baseline Model D` that does not require specialized therapy.

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

The student-health-safety-risk-assessment view answers: what is the current risk profile for each student? This join links students to their risk assessments, revealing the `risk_level`, `mitigation_plan`, and `status` for each learner. Student 1000 has a `low` risk with a `pilot-mitigati-26` plan in draft status, while student 1003 has a `critical` risk with a `seasonal-mitigati-29` plan that has been reviewed.

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

The special-educational-need-student view reverses the perspective: given a specific need, which students are affected? This join surfaces the `student_id`, `enrollment_status`, and `primary_diagnosis` for every student linked to a particular need. For need ID 1 (`Integrated Cluster A`), the view shows student 1000 with an `extended-primary-27` diagnosis and `pending` enrollment status. This orientation is useful for administrators who need to understand the reach of a particular need category across the student population.

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

The special-educational-need-staff-training-module view answers: which training modules are associated with each special educational need? By joining special_educational_needs with staff_training_modules, this view reveals the `module_name`, `completion_status`, `target_audience`, and `hours_required` for the training linked to each need. Need ID 1 is linked to module `Kimberly Myers`, which is `scheduled` for `teachers` and requires 17.20 hours. Need ID 4 is linked to module `Desiree Cain`, marked as `mandatory` for `all` with 26.80 hours required.

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

The education-health-care-plan-student view answers: which students are covered by each care plan? This join surfaces the `student_id`, `primary_diagnosis`, and `enrollment_status` for every student linked to a particular plan. Plan ID 1 covers student 1000, who has an `extended-primary-27` diagnosis and `pending` enrollment. Plan ID 3 covers student 1002, who is `withdrawn` — a status that may warrant attention given the plan's `rejected` funding status.

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

The admission-application-student view answers: what is the current status of each student's admission, and what are the associated procedural flags? This join combines admission_applications with students, revealing the `application_status`, `submission_date`, `interview_scheduled`, and `oversubscribed` flags alongside the student's enrollment status. Application 1 for student 1000 is `submitted` with both interview and oversubscription flags set to true. Application 4 for student 1003 is `rejected` with both flags false.

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

The admission-application-special-educational-need view answers: what special educational need is associated with each admission application? This join surfaces the `need_name`, `severity_level`, and `requires_specialized_therapy` for the need linked to each application. Application 1 is linked to need ID 1 (`Integrated Cluster A`, `mild`, requires specialized therapy). Application 3 is linked to need ID 3 (`Pilot Initiative`, `severe`, requires specialized therapy).

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

The admission-application-education-health-care-plan view answers: what is the care plan status for each admission application? This join reveals the `issuing_l_e_a`, `funding_status`, and `legal_status` of the plan associated with each application. Application 1 is linked to plan ID 1, which has `approved` funding and `active` legal status. Application 3 is linked to plan ID 3, which has `rejected` funding and `under_review` legal status — a combination that may complicate the admission process.

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

The admission-application-health-safety-risk-assessment view answers: what is the risk profile associated with each admission application? This join surfaces the `risk_level`, `mitigation_plan`, and `status` of the assessment linked to each application. Application 1 has a `low` risk with a `pilot-mitigati-26` plan in `draft` status. Application 4 has a `critical` risk with a `seasonal-mitigati-29` plan in `reviewed` status.

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

The health-safety-risk-assessment-student view answers: which students are covered by each risk assessment? This join surfaces the `student_id`, `primary_diagnosis`, and `enrollment_status` for every student linked to a particular assessment. Assessment ID 1 covers student 1000 with an `extended-primary-27` diagnosis. Assessment ID 3 covers student 1002, who is `withdrawn` — a status that may require the risk assessment to be updated or archived.

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

The health-safety-risk-assessment-admission-application view answers: which admission applications are linked to each risk assessment? This join surfaces the `application_id`, `application_status`, and `submission_date` for each application connected to a particular assessment. Assessment ID 1 is linked to application `505997`, which is `submitted`. Assessment ID 4 is linked to application `IVC20det40`, which is `rejected`.

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

The health-safety-risk-assessment-staff-training-module view answers: which training modules are associated with each risk assessment? This join reveals the `module_name`, `completion_status`, and `target_audience` for the training linked to each assessment. Assessment ID 1 is linked to module `Kimberly Myers`, which is `scheduled` for `teachers`. Assessment ID 4 is linked to module `Desiree Cain`, which is `mandatory` for `all`.

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

The staff-training-module-special-educational-need view answers: which special educational needs are addressed by each training module? This join surfaces the `need_name`, `severity_level`, and `requires_specialized_therapy` for the need linked to each module. Module ID 1 (`Kimberly Myers`) addresses need ID 1 (`Integrated Cluster A`, `mild`, requires specialized therapy). Module ID 4 (`Desiree Cain`) addresses need ID 4 (`Baseline Model D`, `complex`, does not require specialized therapy).

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

The staff-training-module-staff-member view answers: which staff members are responsible for or have completed each training module? This join surfaces the `staff_member_id` alongside the module's `module_name`, `completion_status`, and `target_audience`. Module ID 1 is linked to staff member 1, module ID 2 to staff member 2, and so on, creating a clear mapping between personnel and their training responsibilities.

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

The staff-training-module-health-safety-risk-assessment view answers: which risk assessments are associated with each training module? This join surfaces the `risk_level`, `mitigation_plan`, and `status` of the assessment linked to each module. Module ID 1 is linked to assessment ID 1, which has `low` risk and `draft` status. Module ID 3 is linked to assessment ID 3, which has `high` risk and `implemented` status.

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

The staff-member-staff-training-module view answers: which training modules is each staff member associated with? This join surfaces the `module_name`, `completion_status`, `target_audience`, and `hours_required` for every module linked to a particular staff member. Staff member 1 is associated with module `Kimberly Myers` (17.20 hours, `scheduled`, for `teachers`). Staff member 4 is associated with module `Desiree Cain` (26.80 hours, `mandatory`, for `all`).

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

The staff-member-student view answers: which students are served by each staff member? This join surfaces the `student_id`, `primary_diagnosis`, and `enrollment_status` for every student connected to a particular staff member through the training and assessment chain. Staff member 1 is connected to student 1000, who has an `extended-primary-27` diagnosis and `pending` enrollment status.

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

The staff-member-health-safety-risk-assessment view answers: which risk assessments are overseen by each staff member? This join surfaces the `risk_level`, `mitigation_plan`, and `status` of the assessment linked to each staff member. Staff member 1 oversees assessment ID 1, which has `low` risk and `draft` status. Staff member 4 oversees assessment ID 4, which has `critical` risk and `reviewed` status.

The data model described in this chapter supports a coordinated approach to student support that spans diagnosis, planning, admission, risk management, and staff development. Each table captures a distinct aspect of the support ecosystem, and the foreign keys between them ensure that no decision exists in isolation. The joined views translate these relationships into actionable information, allowing practitioners to answer questions about individual students, the reach of specific needs, the status of care plans, and the readiness of staff. By maintaining accurate records across all five domains and consulting the appropriate views, educational institutions can ensure that every learner receives the support they need, that every risk is assessed and mitigated, and that every staff member is properly trained.