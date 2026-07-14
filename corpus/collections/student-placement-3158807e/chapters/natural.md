## The Architecture of Student Placement and Support

Educational institutions and local authorities manage a complex ecosystem of student records, care plans, risk assessments, and staff development activities. At the center of this ecosystem sits the student placement—a structured record that binds a learner to a care plan, an overseeing authority, and a set of professional development interventions. Each placement carries a lifecycle: it begins with a start date, moves through statuses such as pending, active, waiting, or completed, and is accompanied by funding arrangements, risk assessments, and interview records. The data that supports this domain is organized into seven base tables and sixteen derived views, each serving a distinct operational purpose. Understanding how these records interlock is essential for practitioners who coordinate care, track compliance, and report on outcomes.

**Table `student_placements`**

| id | placement_id | start_date | status | funding_source | risk_assessment_status | interview_completed | student_id | education_health_care_plan_id | local_education_authority_id | staff_professional_development_training_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | LEA | not_started | false | 392507 | 1 | 1 | 1205-0002-M | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5006436 | 2023-02-16 | active | private | in_progress | true | 25388256 | 2 | 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3717625 | 2024-07-27 | waiting | other | completed | false | id_16 | 3 | 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 8843740 | 2025-12-11 | completed | LEA | failed | true | gd_taxc_2211 | 4 | 4 | 10207144 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The student_placements table is the operational hub of the domain. Each row represents a single placement event, identified by a unique placement_id such as 18355078 or 5006436. The start_date field anchors the placement in time—placement 18355078 began on 2022-09-05, while placement 8843740 is scheduled for 2025-12-11. The status column tracks the current phase of the placement, with values ranging from pending and active to waiting and completed. Funding_source distinguishes between LEA-funded, private, and other arrangements; for instance, placement 18355078 is LEA-funded, whereas placement 5006436 carries private funding. The risk_assessment_status field records whether the associated health and safety review has not_started, is in_progress, has been completed, or has failed. Interview_completed is a boolean flag indicating whether the intake interview has been conducted. Foreign keys student_id, education_health_care_plan_id, local_education_authority_id, and staff_professional_development_training_id link the placement to its supporting records. Timestamps created_at and updated_at provide an audit trail; placement 18355078 was created on 2025-01-01 and last updated on 2025-01-02.

**Table `students`**

| student_id | date_of_birth | primary_diagnosis | has_communication_difficulty | has_medical_needs | has_continence_needs | age | student_placement_id | education_health_care_plan_id | assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | Autistic Spectrum Condition | false | true | true | 35 | 1 | 1 | template_ivacode_pagata_20det40ind |
| 25388256 | 2022-09-13 | Pathological Demand Avoidance | true | false | false | 40 | 2 | 2 | 19508914 |
| id_16 | 2023-02-24 | Chromosome Disorders | false | true | true | 45 | 3 | 3 | 506000 |
| gd_taxc_2211 | 2024-07-08 | other | true | false | false | 50 | 4 | 4 | 1204-0009-M |

Students are the primary subjects of the placement system. The students table stores demographic and diagnostic information alongside care-related flags. Each student carries a student_id—392507, 25388256, id_16, and gd_taxc_2211 are representative identifiers. The date_of_birth field records the student's birth date, while primary_diagnosis captures the clinical classification: Autistic Spectrum Condition, Pathological Demand Avoidance, Chromosome Disorders, or other. Boolean flags has_communication_difficulty, has_medical_needs, and has_continence_needs indicate specific support requirements. For example, student 392507 has medical needs and continence needs but no communication difficulty, whereas student 25388256 has a communication difficulty but no medical or continence needs. The age field provides a computed or recorded age value, ranging from 35 to 50 in the sample data. The student_placement_id, education_health_care_plan_id, and assessment_id columns create direct links to the placement, care plan, and risk assessment records respectively.

**Table `education_health_care_plans`**

| id | ehcp_id | issue_date | review_date | status | funding_agreed | student_id | local_education_authority_id |
|---|---|---|---|---|---|---|---|
| 1 | Pelanggan | 2023-02-01 | 2024-11-03 | draft | false | 392507 | 1 |
| 2 | template_impcode_pagata_10 | 2024-07-12 | 2025-04-14 | final | true | 25388256 | 2 |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 | 2022-09-25 | under_review | false | id_16 | 3 |
| 4 | 24119665 | 2022-05-07 | 2023-02-09 | archived | true | gd_taxc_2211 | 4 |

Education, health, and care plans formalize the support framework for each student. The education_health_care_plans table records the plan's identifier (id), an external ehcp_id such as Pelanggan or template_impcode_pagata_10, and the issue_date and review_date that define the plan's validity window. The status field tracks the plan's progression through draft, final, under_review, and archived states. Funding_agreed is a boolean indicating whether financial arrangements have been confirmed; plan 2 (template_impcode_pagata_10) has funding_agreed set to true, while plan 1 (Pelanggan) remains at false. The student_id and local_education_authority_id columns tie each plan to its beneficiary and the overseeing authority.

**Table `local_education_authorities`**

| local_education_authority_id | lea_code | region_name | contact_email | funding_status | education_health_care_plan_id | student_placement_id |
|---|---|---|---|---|---|---|
| 1 | 726061 | Ralph Waldo Emerson | Christopher Wilson | active | 1 | 1 |
| 2 | 195353 | Henry Cox | Charles Larsen | suspended | 2 | 2 |
| 3 | 12616 | Haruki Murakami | Mary Alvarez | pending | 3 | 3 |
| 4 | 726036 | Norma Fisher | April Snyder | active | 4 | 4 |

Local education authorities provide the governance and funding structure for placements. The local_education_authorities table contains the local_education_authority_id, a lea_code such as 726061 or 195353, and the region_name, which in this dataset uses personal names like Ralph Waldo Emerson, Henry Cox, Haruki Murakami, and Norma Fisher. The contact_email field stores the authority's point of contact—Christopher Wilson, Charles Larsen, Mary Alvarez, and April Snyder are the listed contacts. The funding_status column indicates whether the authority's funding is active, suspended, or pending; authority 2 (Henry Cox) has a suspended status, while authorities 1, 3, and 4 are active or pending. The education_health_care_plan_id and student_placement_id columns create outbound links to the plans and placements overseen by each authority.

**Table `health_safety_risk_assessments`**

| assessment_id | assessment_date | risk_level | mitigation_steps | completed_by | student_id | student_placement_id |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | compact-mitigati-26 | compact-complete-26 | 392507 | 1 |
| 19508914 | 2023-10-21T11:41:00 | medium | composite-mitigati-27 | composite-complete-27 | 25388256 | 2 |
| 506000 | 2024-03-05T18:58:00 | high | primary-mitigati-28 | primary-complete-28 | id_16 | 3 |
| 1204-0009-M | 2025-08-16T01:15:00 | critical | adaptive-mitigati-29 | adaptive-complete-29 | gd_taxc_2211 | 4 |

Health and safety risk assessments ensure that each placement environment is evaluated for potential hazards. The health_safety_risk_assessments table records the assessment_id, assessment_date, and a risk_level classification of low, medium, high, or critical. Mitigation steps are documented in the mitigation_steps and completed_by fields; for example, assessment template_ivacode_pagata_20det40ind (risk_level: low) lists compact-mitigati-26 as the mitigation step and compact-complete-26 as the completion action. The student_id and student_placement_id columns link the assessment to the relevant student and placement. The sample data shows a progression of risk levels: low for student 392507, medium for student 25388256, high for student id_16, and critical for student gd_taxc_2211.

**Table `staff_professional_developments`**

| training_id | training_date | topic | status | staff_member_id | student_placement_id | assigned_to_staff_staff_member_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1205-0002-M | 2025-12-24 | Autism Spectrum | scheduled | 209204 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance | in_progress | 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders | completed | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10207144 | 2024-03-03 | Communication Difficulties | cancelled | 10207143 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Staff professional development records track the training interventions associated with each placement. The staff_professional_developments table includes the training_id, training_date, and topic—topics include Autism Spectrum, Pathological Demand Avoidance, Chromosome Disorders, and Communication Difficulties. The status field records whether a training session is scheduled, in_progress, completed, or cancelled; training 1205-0002-M is scheduled, c746bff2-8fcc-11eb-924d-9cd76263cbd0 is in_progress, 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 is completed, and 10207144 is cancelled. The staff_member_id and assigned_to_staff_staff_member_id columns identify the staff member receiving the training and the staff member to whom it is assigned. The student_placement_id column links the training to its associated placement. Timestamps created_at and updated_at provide an audit trail for each training record.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | employment_status | staff_professional_development_training_id |
|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | active | 1205-0002-M |
| 2 | 3158139 | Account Name | therapist | on_leave | c746bff2-8fcc-11eb-924d-9cd76263cbd0 |
| 3 | 8189502 | Saipan International Airport | support_staff | terminated | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 69438 | Norma Fisher | headteacher | active | 10207144 |

The staff_members table stores the roster of personnel involved in the placement and training ecosystem. Each staff member is identified by a staff_member_id, and the table supports the assignment of professional development sessions through the staff_professional_developments table. Staff members serve dual roles: they are both recipients of training (staff_member_id) and assignees of training sessions (assigned_to_staff_staff_member_id), creating a bidirectional relationship that supports accountability and tracking.

## Cross-Referenced Views and Operational Reporting

The base tables are connected through a set of derived views that answer specific operational questions by joining records across entities. Each view serves a distinct reporting or analytical purpose, surfacing the relationships that underpin day-to-day coordination.

**View `student_placement_student_view`**

```sql
CREATE VIEW student_placement_student_view AS
SELECT a.id, a.placement_id, a.start_date, a.status, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.primary_diagnosis AS student_primary_diagnosis
FROM student_placements a JOIN students b ON a.student_id = b.student_id;
```

| id | placement_id | start_date | status | student_student_id | student_date_of_birth | student_primary_diagnosis |
|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | 392507 | 2025-04-02 | Autistic Spectrum Condition |
| 2 | 5006436 | 2023-02-16 | active | 25388256 | 2022-09-13 | Pathological Demand Avoidance |
| 3 | 3717625 | 2024-07-27 | waiting | id_16 | 2023-02-24 | Chromosome Disorders |
| 4 | 8843740 | 2025-12-11 | completed | gd_taxc_2211 | 2024-07-08 | other |

The student_placement_student_view joins student_placements with students to present a complete picture of each placement alongside the learner's diagnostic and support profile. This view answers the question: what are the characteristics of the student associated with a given placement? For placement 18355078, the view reveals student 392507, whose primary_diagnosis is Autistic Spectrum Condition, who has medical needs and continence needs, and whose placement is currently pending with LEA funding and a not_started risk_assessment_status. For placement 8843740, the view shows student gd_taxc_2211, diagnosed with other, who has a communication difficulty, whose placement is completed with LEA funding and a failed risk_assessment_status.

**View `student_placement_education_health_care_plan_view`**

```sql
CREATE VIEW student_placement_education_health_care_plan_view AS
SELECT a.id, a.placement_id, a.start_date, a.status, b.id AS plan_id, b.ehcp_id AS plan_ehcp_id, b.issue_date AS plan_issue_date
FROM student_placements a JOIN education_health_care_plans b ON a.education_health_care_plan_id = b.id;
```

| id | placement_id | start_date | status | plan_id | plan_ehcp_id | plan_issue_date |
|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | 1 | Pelanggan | 2023-02-01 |
| 2 | 5006436 | 2023-02-16 | active | 2 | template_impcode_pagata_10 | 2024-07-12 |
| 3 | 3717625 | 2024-07-27 | waiting | 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 |
| 4 | 8843740 | 2025-12-11 | completed | 4 | 24119665 | 2022-05-07 |

This view links student_placements to education_health_care_plans, answering: which care plan is associated with each placement, and what is its status? Placement 18355078 is linked to plan 1 (ehcp_id: Pelanggan), which is in draft status with funding_agreed set to false. Placement 5006436 is linked to plan 2 (ehcp_id: template_impcode_pagata_10), which is in final status with funding_agreed set to true. This view is essential for coordinators who need to verify that care plans are finalized and funded before placements proceed.

**View `student_placement_local_education_authority_view`**

```sql
CREATE VIEW student_placement_local_education_authority_view AS
SELECT a.id, a.placement_id, a.start_date, a.status, b.local_education_authority_id AS authority_local_education_authority_id, b.lea_code AS authority_lea_code, b.region_name AS authority_region_name
FROM student_placements a JOIN local_education_authorities b ON a.local_education_authority_id = b.local_education_authority_id;
```

| id | placement_id | start_date | status | authority_local_education_authority_id | authority_lea_code | authority_region_name |
|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | 1 | 726061 | Ralph Waldo Emerson |
| 2 | 5006436 | 2023-02-16 | active | 2 | 195353 | Henry Cox |
| 3 | 3717625 | 2024-07-27 | waiting | 3 | 12616 | Haruki Murakami |
| 4 | 8843740 | 2025-12-11 | completed | 4 | 726036 | Norma Fisher |

The student_placement_local_education_authority_view connects placements to their overseeing authorities. It answers: which local education authority is responsible for a given placement, and what is that authority's funding status? Placement 18355078 is overseen by authority 1 (lea_code: 726061, region_name: Ralph Waldo Emerson, contact: Christopher Wilson), which has an active funding_status. Placement 5006436 is overseen by authority 2 (lea_code: 195353, region_name: Henry Cox, contact: Charles Larsen), which has a suspended funding_status—a detail that may require attention if funding disruptions affect the placement.

**View `student_placement_staff_professional_development_view`**

```sql
CREATE VIEW student_placement_staff_professional_development_view AS
SELECT a.id, a.placement_id, a.start_date, a.status, b.training_id AS development_training_id, b.training_date AS development_training_date, b.topic AS development_topic
FROM student_placements a JOIN staff_professional_developments b ON a.staff_professional_development_training_id = b.training_id;
```

| id | placement_id | start_date | status | development_training_id | development_training_date | development_topic |
|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | 1205-0002-M | 2025-12-24 | Autism Spectrum |
| 2 | 5006436 | 2023-02-16 | active | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance |
| 3 | 3717625 | 2024-07-27 | waiting | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders |
| 4 | 8843740 | 2025-12-11 | completed | 10207144 | 2024-03-03 | Communication Difficulties |

This view joins student_placements with staff_professional_developments to surface the training activities associated with each placement. It answers: what professional development sessions are linked to a placement, and what is their status? Placement 18355078 has training 1205-0002-M scheduled on 2025-12-24, covering Autism Spectrum. Placement 5006436 has training c746bff2-8fcc-11eb-924d-9cd76263cbd0 in_progress, covering Pathological Demand Avoidance. Placement 3717625 has training 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 completed, covering Chromosome Disorders. Placement 8843740 has training 10207144 cancelled, covering Communication Difficulties. This view enables managers to track training completion rates and identify placements where training has been cancelled or is overdue.

**View `student_student_placement_view`**

```sql
CREATE VIEW student_student_placement_view AS
SELECT a.student_id, a.date_of_birth, a.primary_diagnosis, a.has_communication_difficulty, b.id AS placement_id, b.placement_id AS placement_placement_id, b.start_date AS placement_start_date
FROM students a JOIN student_placements b ON a.student_placement_id = b.id;
```

| student_id | date_of_birth | primary_diagnosis | has_communication_difficulty | placement_id | placement_placement_id | placement_start_date |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | Autistic Spectrum Condition | false | 1 | 18355078 | 2022-09-05 |
| 25388256 | 2022-09-13 | Pathological Demand Avoidance | true | 2 | 5006436 | 2023-02-16 |
| id_16 | 2023-02-24 | Chromosome Disorders | false | 3 | 3717625 | 2024-07-27 |
| gd_taxc_2211 | 2024-07-08 | other | true | 4 | 8843740 | 2025-12-11 |

The student_student_placement_view reverses the perspective, starting from the student and surfacing their associated placement. It answers: what placement is a given student enrolled in, and what is the status of that placement? Student 392507 is enrolled in placement 18355078, which is pending. Student 25388256 is enrolled in placement 5006436, which is active. Student id_16 is enrolled in placement 3717625, which is waiting. Student gd_taxc_2211 is enrolled in placement 8843740, which is completed. This view is useful for student-facing reports and for verifying that each student has an active or completed placement record.

**View `student_education_health_care_plan_view`**

```sql
CREATE VIEW student_education_health_care_plan_view AS
SELECT a.student_id, a.date_of_birth, a.primary_diagnosis, a.has_communication_difficulty, b.id AS plan_id, b.ehcp_id AS plan_ehcp_id, b.issue_date AS plan_issue_date
FROM students a JOIN education_health_care_plans b ON a.education_health_care_plan_id = b.id;
```

| student_id | date_of_birth | primary_diagnosis | has_communication_difficulty | plan_id | plan_ehcp_id | plan_issue_date |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | Autistic Spectrum Condition | false | 1 | Pelanggan | 2023-02-01 |
| 25388256 | 2022-09-13 | Pathological Demand Avoidance | true | 2 | template_impcode_pagata_10 | 2024-07-12 |
| id_16 | 2023-02-24 | Chromosome Disorders | false | 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 |
| gd_taxc_2211 | 2024-07-08 | other | true | 4 | 24119665 | 2022-05-07 |

This view connects students directly to their education, health, and care plans. It answers: which care plan is assigned to a given student, and what is the plan's status and funding state? Student 392507 is linked to plan 1 (Pelanggan), which is in draft status with funding_agreed set to false. Student 25388256 is linked to plan 2 (template_impcode_pagata_10), which is final with funding_agreed set to true. Student id_16 is linked to plan 3 (71df0302-9bad-11eb-a8a2-19ed5c03f8d3), which is under_review with funding_agreed set to false. Student gd_taxc_2211 is linked to plan 4 (24119665), which is archived with funding_agreed set to true. This view supports compliance checks, ensuring that students have care plans that are current and funded.

**View `student_health_safety_risk_assessment_view`**

```sql
CREATE VIEW student_health_safety_risk_assessment_view AS
SELECT a.student_id, a.date_of_birth, a.primary_diagnosis, a.has_communication_difficulty, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date, b.risk_level AS assessment_risk_level
FROM students a JOIN health_safety_risk_assessments b ON a.assessment_id = b.assessment_id;
```

| student_id | date_of_birth | primary_diagnosis | has_communication_difficulty | assessment_assessment_id | assessment_assessment_date | assessment_risk_level |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | Autistic Spectrum Condition | false | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low |
| 25388256 | 2022-09-13 | Pathological Demand Avoidance | true | 19508914 | 2023-10-21T11:41:00 | medium |
| id_16 | 2023-02-24 | Chromosome Disorders | false | 506000 | 2024-03-05T18:58:00 | high |
| gd_taxc_2211 | 2024-07-08 | other | true | 1204-0009-M | 2025-08-16T01:15:00 | critical |

The student_health_safety_risk_assessment_view joins students with their risk assessments. It answers: what is the risk level and mitigation status for a given student? Student 392507 has assessment template_ivacode_pagata_20det40ind with risk_level low, mitigation_steps compact-mitigati-26, and completed_by compact-complete-26. Student 25388256 has assessment 19508914 with risk_level medium, mitigation_steps composite-mitigati-27, and completed_by composite-complete-27. Student id_16 has assessment 506000 with risk_level high, mitigation_steps primary-mitigati-28, and completed_by primary-complete-28. Student gd_taxc_2211 has assessment 1204-0009-M with risk_level critical, mitigation_steps adaptive-mitigati-29, and completed_by adaptive-complete-29. This view is critical for safety officers who need to identify students with elevated or critical risk levels and verify that mitigation steps have been completed.

**View `education_health_care_plan_student_view`**

```sql
CREATE VIEW education_health_care_plan_student_view AS
SELECT a.id, a.ehcp_id, a.issue_date, a.review_date, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.primary_diagnosis AS student_primary_diagnosis
FROM education_health_care_plans a JOIN students b ON a.student_id = b.student_id;
```

| id | ehcp_id | issue_date | review_date | student_student_id | student_date_of_birth | student_primary_diagnosis |
|---|---|---|---|---|---|---|
| 1 | Pelanggan | 2023-02-01 | 2024-11-03 | 392507 | 2025-04-02 | Autistic Spectrum Condition |
| 2 | template_impcode_pagata_10 | 2024-07-12 | 2025-04-14 | 25388256 | 2022-09-13 | Pathological Demand Avoidance |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 | 2022-09-25 | id_16 | 2023-02-24 | Chromosome Disorders |
| 4 | 24119665 | 2022-05-07 | 2023-02-09 | gd_taxc_2211 | 2024-07-08 | other |

This view reverses the student-care plan relationship, starting from the plan and surfacing the associated student. It answers: which student is assigned to a given care plan? Plan 1 (Pelanggan) is assigned to student 392507, who has a primary_diagnosis of Autistic Spectrum Condition. Plan 2 (template_impcode_pagata_10) is assigned to student 25388256, who has a primary_diagnosis of Pathological Demand Avoidance. Plan 3 (71df0302-9bad-11eb-a8a2-19ed5c03f8d3) is assigned to student id_16, who has a primary_diagnosis of Chromosome Disorders. Plan 4 (24119665) is assigned to student gd_taxc_2211, who has a primary_diagnosis of other. This view supports plan-level reporting and ensures that each care plan has an assigned student.

**View `education_health_care_plan_local_education_authority_view`**

```sql
CREATE VIEW education_health_care_plan_local_education_authority_view AS
SELECT a.id, a.ehcp_id, a.issue_date, a.review_date, b.local_education_authority_id AS authority_local_education_authority_id, b.lea_code AS authority_lea_code, b.region_name AS authority_region_name
FROM education_health_care_plans a JOIN local_education_authorities b ON a.local_education_authority_id = b.local_education_authority_id;
```

| id | ehcp_id | issue_date | review_date | authority_local_education_authority_id | authority_lea_code | authority_region_name |
|---|---|---|---|---|---|---|
| 1 | Pelanggan | 2023-02-01 | 2024-11-03 | 1 | 726061 | Ralph Waldo Emerson |
| 2 | template_impcode_pagata_10 | 2024-07-12 | 2025-04-14 | 2 | 195353 | Henry Cox |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 | 2022-09-25 | 3 | 12616 | Haruki Murakami |
| 4 | 24119665 | 2022-05-07 | 2023-02-09 | 4 | 726036 | Norma Fisher |

This view links education_health_care_plans to their overseeing local education authorities. It answers: which authority is responsible for a given care plan, and what is that authority's funding status? Plan 1 is overseen by authority 1 (lea_code: 726061, region_name: Ralph Waldo Emerson, contact: Christopher Wilson), which has an active funding_status. Plan 2 is overseen by authority 2 (lea_code: 195353, region_name: Henry Cox, contact: Charles Larsen), which has a suspended funding_status. Plan 3 is overseen by authority 3 (lea_code: 12616, region_name: Haruki Murakami, contact: Mary Alvarez), which has a pending funding_status. Plan 4 is overseen by authority 4 (lea_code: 726036, region_name: Norma Fisher, contact: April Snyder), which has an active funding_status. This view is essential for authorities tracking their portfolio of care plans and for identifying plans overseen by authorities with suspended or pending funding.

**View `local_education_authority_education_health_care_plan_view`**

```sql
CREATE VIEW local_education_authority_education_health_care_plan_view AS
SELECT a.local_education_authority_id, a.lea_code, a.region_name, a.contact_email, b.id AS plan_id, b.ehcp_id AS plan_ehcp_id, b.issue_date AS plan_issue_date
FROM local_education_authorities a JOIN education_health_care_plans b ON a.education_health_care_plan_id = b.id;
```

| local_education_authority_id | lea_code | region_name | contact_email | plan_id | plan_ehcp_id | plan_issue_date |
|---|---|---|---|---|---|---|
| 1 | 726061 | Ralph Waldo Emerson | Christopher Wilson | 1 | Pelanggan | 2023-02-01 |
| 2 | 195353 | Henry Cox | Charles Larsen | 2 | template_impcode_pagata_10 | 2024-07-12 |
| 3 | 12616 | Haruki Murakami | Mary Alvarez | 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 |
| 4 | 726036 | Norma Fisher | April Snyder | 4 | 24119665 | 2022-05-07 |

This view reverses the authority-plan relationship, starting from the authority and surfacing the care plans it oversees. It answers: which care plans are managed by a given local education authority? Authority 1 (Ralph Waldo Emerson) manages plan 1 (Pelanggan), which is in draft status with funding_agreed set to false. Authority 2 (Henry Cox) manages plan 2 (template_impcode_pagata_10), which is final with funding_agreed set to true. Authority 3 (Haruki Murakami) manages plan 3 (71df0302-9bad-11eb-a8a2-19ed5c03f8d3), which is under_review with funding_agreed set to false. Authority 4 (Norma Fisher) manages plan 4 (24119665), which is archived with funding_agreed set to true. This view supports authority-level reporting and helps coordinators understand the distribution of care plans across regions.

**View `local_education_authority_student_placement_view`**

```sql
CREATE VIEW local_education_authority_student_placement_view AS
SELECT a.local_education_authority_id, a.lea_code, a.region_name, a.contact_email, b.id AS placement_id, b.placement_id AS placement_placement_id, b.start_date AS placement_start_date
FROM local_education_authorities a JOIN student_placements b ON a.student_placement_id = b.id;
```

| local_education_authority_id | lea_code | region_name | contact_email | placement_id | placement_placement_id | placement_start_date |
|---|---|---|---|---|---|---|
| 1 | 726061 | Ralph Waldo Emerson | Christopher Wilson | 1 | 18355078 | 2022-09-05 |
| 2 | 195353 | Henry Cox | Charles Larsen | 2 | 5006436 | 2023-02-16 |
| 3 | 12616 | Haruki Murakami | Mary Alvarez | 3 | 3717625 | 2024-07-27 |
| 4 | 726036 | Norma Fisher | April Snyder | 4 | 8843740 | 2025-12-11 |

This view connects local education authorities to the student placements they oversee. It answers: which placements are managed by a given authority, and what is the status of each placement? Authority 1 (Ralph Waldo Emerson) oversees placement 18355078, which is pending with LEA funding and a not_started risk_assessment_status. Authority 2 (Henry Cox) oversees placement 5006436, which is active with private funding and an in_progress risk_assessment_status. Authority 3 (Haruki Murakami) oversees placement 3717625, which is waiting with other funding and a completed risk_assessment_status. Authority 4 (Norma Fisher) oversees placement 8843740, which is completed with LEA funding and a failed risk_assessment_status. This view is valuable for authorities monitoring their placement portfolios and identifying placements that require attention due to risk assessment failures or pending statuses.

**View `health_safety_risk_assessment_student_view`**

```sql
CREATE VIEW health_safety_risk_assessment_student_view AS
SELECT a.assessment_id, a.assessment_date, a.risk_level, a.mitigation_steps, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.primary_diagnosis AS student_primary_diagnosis
FROM health_safety_risk_assessments a JOIN students b ON a.student_id = b.student_id;
```

| assessment_id | assessment_date | risk_level | mitigation_steps | student_student_id | student_date_of_birth | student_primary_diagnosis |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | compact-mitigati-26 | 392507 | 2025-04-02 | Autistic Spectrum Condition |
| 19508914 | 2023-10-21T11:41:00 | medium | composite-mitigati-27 | 25388256 | 2022-09-13 | Pathological Demand Avoidance |
| 506000 | 2024-03-05T18:58:00 | high | primary-mitigati-28 | id_16 | 2023-02-24 | Chromosome Disorders |
| 1204-0009-M | 2025-08-16T01:15:00 | critical | adaptive-mitigati-29 | gd_taxc_2211 | 2024-07-08 | other |

This view links health and safety risk assessments to their associated students. It answers: which student is associated with a given risk assessment, and what is the student's diagnostic profile? Assessment template_ivacode_pagata_20det40ind is associated with student 392507, who has a primary_diagnosis of Autistic Spectrum Condition and a risk_level of low. Assessment 19508914 is associated with student 25388256, who has a primary_diagnosis of Pathological Demand Avoidance and a risk_level of medium. Assessment 506000 is associated with student id_16, who has a primary_diagnosis of Chromosome Disorders and a risk_level of high. Assessment 1204-0009-M is associated with student gd_taxc_2211, who has a primary_diagnosis of other and a risk_level of critical. This view supports clinical and safety reporting by combining diagnostic information with risk classifications.

**View `health_safety_risk_assessment_student_placement_view`**

```sql
CREATE VIEW health_safety_risk_assessment_student_placement_view AS
SELECT a.assessment_id, a.assessment_date, a.risk_level, a.mitigation_steps, b.id AS placement_id, b.placement_id AS placement_placement_id, b.start_date AS placement_start_date
FROM health_safety_risk_assessments a JOIN student_placements b ON a.student_placement_id = b.id;
```

| assessment_id | assessment_date | risk_level | mitigation_steps | placement_id | placement_placement_id | placement_start_date |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | compact-mitigati-26 | 1 | 18355078 | 2022-09-05 |
| 19508914 | 2023-10-21T11:41:00 | medium | composite-mitigati-27 | 2 | 5006436 | 2023-02-16 |
| 506000 | 2024-03-05T18:58:00 | high | primary-mitigati-28 | 3 | 3717625 | 2024-07-27 |
| 1204-0009-M | 2025-08-16T01:15:00 | critical | adaptive-mitigati-29 | 4 | 8843740 | 2025-12-11 |

This view connects risk assessments to their associated student placements. It answers: which placement is associated with a given risk assessment, and what is the placement's status and funding arrangement? Assessment template_ivacode_pagata_20det40ind is linked to placement 18355078, which is pending with LEA funding. Assessment 19508914 is linked to placement 5006436, which is active with private funding. Assessment 506000 is linked to placement 3717625, which is waiting with other funding. Assessment 1204-0009-M is linked to placement 8843740, which is completed with LEA funding. This view is essential for safety coordinators who need to correlate risk assessment outcomes with placement statuses and funding sources.

**View `staff_professional_development_student_placement_view`**

```sql
CREATE VIEW staff_professional_development_student_placement_view AS
SELECT a.training_id, a.training_date, a.topic, a.status, b.id AS placement_id, b.placement_id AS placement_placement_id, b.start_date AS placement_start_date
FROM staff_professional_developments a JOIN student_placements b ON a.student_placement_id = b.id;
```

| training_id | training_date | topic | status | placement_id | placement_placement_id | placement_start_date |
|---|---|---|---|---|---|---|
| 1205-0002-M | 2025-12-24 | Autism Spectrum | scheduled | 1 | 18355078 | 2022-09-05 |
| c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance | in_progress | 2 | 5006436 | 2023-02-16 |
| 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders | completed | 3 | 3717625 | 2024-07-27 |
| 10207144 | 2024-03-03 | Communication Difficulties | cancelled | 4 | 8843740 | 2025-12-11 |

This view links staff professional development sessions to their associated student placements. It answers: which placement is associated with a given training session, and what is the placement's status? Training 1205-0002-M (Autism Spectrum, scheduled) is linked to placement 18355078, which is pending. Training c746bff2-8fcc-11eb-924d-9cd76263cbd0 (Pathological Demand Avoidance, in_progress) is linked to placement 5006436, which is active. Training 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 (Chromosome Disorders, completed) is linked to placement 3717625, which is waiting. Training 10207144 (Communication Difficulties, cancelled) is linked to placement 8843740, which is completed. This view enables training coordinators to verify that professional development sessions are aligned with active placements and to identify sessions that have been cancelled.

**View `staff_professional_development_staff_member_view`**

```sql
CREATE VIEW staff_professional_development_staff_member_view AS
SELECT a.training_id, a.training_date, a.topic, a.status, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM staff_professional_developments a JOIN staff_members b ON a.assigned_to_staff_staff_member_id = b.staff_member_id;
```

| training_id | training_date | topic | status | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1205-0002-M | 2025-12-24 | Autism Spectrum | scheduled | 1 | 937735 | Theodore Mcgrath |
| c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance | in_progress | 2 | 3158139 | Account Name |
| 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders | completed | 3 | 8189502 | Saipan International Airport |
| 10207144 | 2024-03-03 | Communication Difficulties | cancelled | 4 | 69438 | Norma Fisher |

This view connects staff professional development sessions to the staff members involved. It answers: which staff member is associated with a given training session, and what is the session's topic and status? Training 1205-0002-M (Autism Spectrum, scheduled) is associated with staff member 209204. Training c746bff2-8fcc-11eb-924d-9cd76263cbd0 (Pathological Demand Avoidance, in_progress) is associated with staff member 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3. Training 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 (Chromosome Disorders, completed) is associated with staff member ba649482-8fbb-11eb-924d-9cd76263cbd0. Training 10207144 (Communication Difficulties, cancelled) is associated with staff member 10207143. This view supports staff development tracking and ensures that training assignments are properly documented.

**View `staff_member_staff_professional_development_view`**

```sql
CREATE VIEW staff_member_staff_professional_development_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.role, b.training_id AS development_training_id, b.training_date AS development_training_date, b.topic AS development_topic
FROM staff_members a JOIN staff_professional_developments b ON a.staff_professional_development_training_id = b.training_id;
```

| staff_member_id | staff_id | full_name | role | development_training_id | development_training_date | development_topic |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | 1205-0002-M | 2025-12-24 | Autism Spectrum |
| 2 | 3158139 | Account Name | therapist | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance |
| 3 | 8189502 | Saipan International Airport | support_staff | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders |
| 4 | 69438 | Norma Fisher | headteacher | 10207144 | 2024-03-03 | Communication Difficulties |

This view reverses the staff-training relationship, starting from the staff member and surfacing their associated professional development sessions. It answers: which training sessions is a given staff member involved in, and what is the status of each session? Staff member 209204 is involved in training 1205-0002-M (Autism Spectrum, scheduled). Staff member 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3 is involved in training c746bff2-8fcc-11eb-924d-9cd76263cbd0 (Pathological Demand Avoidance, in_progress). Staff member ba649482-8fbb-11eb-924d-9cd76263cbd0 is involved in training 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 (Chromosome Disorders, completed). Staff member 10207143 is involved in training 10207144 (Communication Difficulties, cancelled). This view is useful for staff development managers who need to track individual staff members' training progress and identify sessions that require follow-up.

## Closing Synthesis

The student placement and support domain is structured around a central placement record that binds together a student, a care plan, an overseeing authority, a risk assessment, and a professional development intervention. The seven base tables capture the raw records: students carry diagnostic and support flags; care plans define the formal support framework with issue and review dates; local education authorities provide governance and funding oversight; risk assessments document safety evaluations with risk levels and mitigation steps; and staff professional development records track training sessions linked to placements. The sixteen derived views reassemble these records from multiple perspectives, answering questions that span student-centric, placement-centric, authority-centric, and staff-centric reporting needs. Together, the tables and views form a coherent operational dataset that supports coordination, compliance, and accountability across the placement lifecycle.