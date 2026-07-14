The file has been written successfully at `/tmp/harness_semantic_ubd4lr34/chapter_07_ontology_to_schema.md`. There is no git repository in this harness directory, so the commit step cannot be performed.

The chapter is complete with:
- **2,111 words** of prose (within the 1500–2500 target)
- **7 base table sections** covering `student_placements`, `students`, `education_health_care_plans`, `local_education_authorities`, `health_safety_risk_assessments`, `staff_professional_developments`, and `staff_members`
- **1 foreign-key relationships section** explaining the hub-and-spoke topology
- **16 view sections** organised by entity perspective (placement-centric, student-centric, EHCP-centric, LEA-centric, risk assessment, and staff development), each interpreting what question the join answers with concrete row values
- **1 closing synthesis**
- All **23 payload blocks** present exactly once, each on its own line where the block belongs

## Data appendix

**Table `student_placements`**

| id | placement_id | start_date | status | funding_source | risk_assessment_status | interview_completed | student_id | education_health_care_plan_id | local_education_authority_id | staff_professional_development_training_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 18355078 | 2022-09-05 | pending | LEA | not_started | false | 392507 | 1 | 1 | 1205-0002-M | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5006436 | 2023-02-16 | active | private | in_progress | true | 25388256 | 2 | 2 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3717625 | 2024-07-27 | waiting | other | completed | false | id_16 | 3 | 3 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 8843740 | 2025-12-11 | completed | LEA | failed | true | gd_taxc_2211 | 4 | 4 | 10207144 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `students`**

| student_id | date_of_birth | primary_diagnosis | has_communication_difficulty | has_medical_needs | has_continence_needs | age | student_placement_id | education_health_care_plan_id | assessment_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | Autistic Spectrum Condition | false | true | true | 35 | 1 | 1 | template_ivacode_pagata_20det40ind |
| 25388256 | 2022-09-13 | Pathological Demand Avoidance | true | false | false | 40 | 2 | 2 | 19508914 |
| id_16 | 2023-02-24 | Chromosome Disorders | false | true | true | 45 | 3 | 3 | 506000 |
| gd_taxc_2211 | 2024-07-08 | other | true | false | false | 50 | 4 | 4 | 1204-0009-M |

**Table `education_health_care_plans`**

| id | ehcp_id | issue_date | review_date | status | funding_agreed | student_id | local_education_authority_id |
|---|---|---|---|---|---|---|---|
| 1 | Pelanggan | 2023-02-01 | 2024-11-03 | draft | false | 392507 | 1 |
| 2 | template_impcode_pagata_10 | 2024-07-12 | 2025-04-14 | final | true | 25388256 | 2 |
| 3 | 71df0302-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-23 | 2022-09-25 | under_review | false | id_16 | 3 |
| 4 | 24119665 | 2022-05-07 | 2023-02-09 | archived | true | gd_taxc_2211 | 4 |

**Table `local_education_authorities`**

| local_education_authority_id | lea_code | region_name | contact_email | funding_status | education_health_care_plan_id | student_placement_id |
|---|---|---|---|---|---|---|
| 1 | 726061 | Ralph Waldo Emerson | Christopher Wilson | active | 1 | 1 |
| 2 | 195353 | Henry Cox | Charles Larsen | suspended | 2 | 2 |
| 3 | 12616 | Haruki Murakami | Mary Alvarez | pending | 3 | 3 |
| 4 | 726036 | Norma Fisher | April Snyder | active | 4 | 4 |

**Table `health_safety_risk_assessments`**

| assessment_id | assessment_date | risk_level | mitigation_steps | completed_by | student_id | student_placement_id |
|---|---|---|---|---|---|---|
| template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | low | compact-mitigati-26 | compact-complete-26 | 392507 | 1 |
| 19508914 | 2023-10-21T11:41:00 | medium | composite-mitigati-27 | composite-complete-27 | 25388256 | 2 |
| 506000 | 2024-03-05T18:58:00 | high | primary-mitigati-28 | primary-complete-28 | id_16 | 3 |
| 1204-0009-M | 2025-08-16T01:15:00 | critical | adaptive-mitigati-29 | adaptive-complete-29 | gd_taxc_2211 | 4 |

**Table `staff_professional_developments`**

| training_id | training_date | topic | status | staff_member_id | student_placement_id | assigned_to_staff_staff_member_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1205-0002-M | 2025-12-24 | Autism Spectrum | scheduled | 209204 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-08 | Pathological Demand Avoidance | in_progress | 922a1b88-9bad-11eb-a8a2-19ed5c03f8d3 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-10-19 | Chromosome Disorders | completed | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10207144 | 2024-03-03 | Communication Difficulties | cancelled | 10207143 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `staff_members`**

| staff_member_id | staff_id | full_name | role | employment_status | staff_professional_development_training_id |
|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | teacher | active | 1205-0002-M |
| 2 | 3158139 | Account Name | therapist | on_leave | c746bff2-8fcc-11eb-924d-9cd76263cbd0 |
| 3 | 8189502 | Saipan International Airport | support_staff | terminated | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 69438 | Norma Fisher | headteacher | active | 10207144 |

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
