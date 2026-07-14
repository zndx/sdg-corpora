# The Hiring and Interview Management Domain

Organizations structure their recruitment efforts around a disciplined framework of job roles, hiring processes, interview questions, competencies, and the people who conduct evaluations. This domain captures every artifact of that framework: the questions asked of candidates, the competencies being assessed, the interviewers who administer them, and the structured processes that bind everything together. Each record carries identifiers that trace a question back to a role, a process, or a candidate's response, enabling organizations to audit their hiring practices at granular detail.

## Core Entities

The foundation of the domain rests on six primary entities. Job roles define the positions an organization seeks to fill, each identified by a `role_code` and described with a `role_title`, `department`, `level`, and metadata such as `is_leadership_role` and `required_skills`. The role `6969430`, titled "Distributed Standard," sits within department `adaptive-departme-89` at the Entry level and is marked as a leadership position, with `legacy-required-37` listed as a required skill. By contrast, `lu_tax_code_template_m16` ("Adaptive Framework D") occupies `distributed-departme-90` at the Mid level and is not a leadership role. The Senior-level role `3158154` ("Primary Protocol") in `baseline-departme-91` carries the `composite-required-39` skill, while the Executive-level `39800616` ("Composite Programme") in `pilot-departme-92` requires `primary-required-40`.

Hiring processes represent the operational containers through which recruitment unfolds. Each process has a `hiring_process_id`, an external `process_id`, a `start_date`, an `end_date`, a `status`, an `interview_format`, a `total_candidates` count, and a `role_code` linking it to the position being filled. Process `1000` (external ID `template_ivacode_pagata_art15`) targets role `6969430`, runs from September 5 to September 1, 2022, is in Planned status, uses a Panel format, and enrolled 9 candidates. Process `1001` (external ID `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`) targets `lu_tax_code_template_m16`, is Active, uses One-on-One interviews, and has 20 candidates. Process `1002` (external ID `57e52fbc-8fcd-11eb-924d-9cd76263cbd0`) targets `3158154`, is Completed, uses Virtual interviews, and enrolled 72 candidates. Process `1003` (external ID `1205-0002-XL`) targets `39800616`, is Cancelled, uses In-Person interviews, and enrolled 37 candidates.

Interview questions are the instruments of evaluation. Each question carries an `id`, a `question_id`, the `question_text`, a `category` (Behavioral, Competency-based, Technical, or Leadership), flags for `is_panel_question` and `is_behavioral`, a `priority_level`, and optional foreign keys to `role_code`, `hiring_process_id`, and `candidate_response_id`. Question `325448` ("composite-question-63") is Behavioral, marked as both a panel and behavioral question, with priority level 22, linked to role `6969430`, process `1000`, and candidate response `1`. Question `5006438` ("primary-question-64") is Competency-based, not a panel or behavioral question, priority 25, linked to role `lu_tax_code_template_m16`, process `1001`, and response `2`. Question `dc0d0562-8fcd-11eb-924d-9cd76263cbd0` ("adaptive-question-65") is Technical, a panel and behavioral question, priority 28, linked to role `3158154`, process `1002`, and response `3`. Question `ChIJEctqrYFt5kcRUrBEPR-XXBE` ("distributed-question-66") is Leadership, not a panel or behavioral question, priority 31, linked to role `39800616`, process `1003`, and response `4`.

**Table `interview_questions`**

| id | question_id | question_text | category | is_panel_question | is_behavioral | priority_level | role_code | hiring_process_id | candidate_response_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 325448 | composite-question-63 | Behavioral | true | true | 22 | 6969430 | 1000 | 1 |
| 101 | 5006438 | primary-question-64 | Competency-based | false | false | 25 | lu_tax_code_template_m16 | 1001 | 2 |
| 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | Technical | true | true | 28 | 3158154 | 1002 | 3 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | Leadership | false | false | 31 | 39800616 | 1003 | 4 |

Candidate responses record how applicants answered interview questions. Each response has an `id`, a `response_id`, the `response_text`, a boolean `uses_s_t_a_r_method`, a `competency_demonstrated`, a `rating_score`, a `submitted_at` timestamp, and foreign keys to `interview_question_id` and `hiring_process_id`. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` ("adaptive-response-47") uses the STAR method, demonstrates `regional-competen-24`, earned a rating of 7.20, was submitted on May 8, 2022, and is tied to question `100` and process `1000`. Response `9736917` ("distributed-response-48") does not use STAR, demonstrates `legacy-competen-25`, earned 11.40, was submitted October 19, 2023, and links to question `101` and process `1001`. Response `8189493` ("baseline-response-49") uses STAR, demonstrates `compact-competen-26`, earned 15.60, was submitted March 3, 2024, and links to question `102` and process `1002`. Response `Invoice` ("pilot-response-50") does not use STAR, demonstrates `composite-competen-27`, earned 19.80, was submitted August 14, 2025, and links to question `103` and process `1003`.

**Table `candidate_responses`**

| id | response_id | response_text | uses_s_t_a_r_method | competency_demonstrated | rating_score | submitted_at | interview_question_id | hiring_process_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 | true | regional-competen-24 | 7.20 | 2022-05-08T04:00:00 | 100 | 1000 |
| 2 | 9736917 | distributed-response-48 | false | legacy-competen-25 | 11.40 | 2023-10-19T11:17:00 | 101 | 1001 |
| 3 | 8189493 | baseline-response-49 | true | compact-competen-26 | 15.60 | 2024-03-03T18:34:00 | 102 | 1002 |
| 4 | Invoice | pilot-response-50 | false | composite-competen-27 | 19.80 | 2025-08-14T01:51:00 | 103 | 1003 |

Competencies define the skills and behaviors being assessed. Each competency has a `competency_id`, a `competency_name`, a `category`, a `proficiency_level`, and an `assessment_criteria`. Competency `1` ("Baseline Standard D") falls under Leadership at the Basic proficiency level with assessment criteria `extended-assessme-63`. Competency `2` ("Distributed Framework") falls under Teamwork at Intermediate proficiency with criteria `integrated-assessme-64`. Competency `3` ("Adaptive Protocol") falls under Emotional Intelligence at Advanced proficiency with criteria `seasonal-assessme-65`. Competency `4` ("Primary Programme A") falls under Technical at Expert proficiency with criteria `regional-assessme-66`.

**Table `competencies`**

| competency_id | competency_name | category | proficiency_level | assessment_criteria |
|---|---|---|---|---|
| 1 | Baseline Standard D | Leadership | Basic | extended-assessme-63 |
| 2 | Distributed Framework | Teamwork | Intermediate | integrated-assessme-64 |
| 3 | Adaptive Protocol | Emotional Intelligence | Advanced | seasonal-assessme-65 |
| 4 | Primary Programme A | Technical | Expert | regional-assessme-66 |

Interviewers are the people conducting evaluations. Each interviewer has an `id`, an `interviewer_id`, an `interviewer_name`, a `department`, a `role` (such as Hiring Manager, Team Leader, HR Representative, or Executive), `years_experience`, and a `role_code` linking them to a job role. Interviewer `10238280` ("Extended Initiative") works in `adaptive-departme-89` as a Hiring Manager with 16 years of experience, assigned to role `6969430`. Interviewer `account_pymes_659` ("Pilot Model A") works in `distributed-departme-90` as a Team Leader with 22 years of experience, assigned to role `lu_tax_code_template_m16`. Interviewer `6564396` ("Baseline Cluster") works in `baseline-departme-91` as an HR Representative with 28 years of experience, assigned to role `3158154`. Interviewer `2933459` ("Distributed Review") works in `pilot-departme-92` as an Executive with 34 years of experience, assigned to role `39800616`.

**Table `interviewers`**

| id | interviewer_id | interviewer_name | department | role | years_experience | role_code |
|---|---|---|---|---|---|---|
| 1 | 10238280 | Extended Initiative | adaptive-departme-89 | Hiring Manager | 16 | 6969430 |
| 2 | account_pymes_659 | Pilot Model A | distributed-departme-90 | Team Leader | 22 | lu_tax_code_template_m16 |
| 3 | 6564396 | Baseline Cluster | baseline-departme-91 | HR Representative | 28 | 3158154 |
| 4 | 2933459 | Distributed Review | pilot-departme-92 | Executive | 34 | 39800616 |

## Relational Structure

The domain's relational structure is built on a network of association tables that connect the core entities. These tables do not introduce new entities; they simply record which questions belong to which roles, which competencies are required by which roles, which questions are used in which processes, and which interviewers are assigned to which processes and questions.

The `roles_questions` table links job roles to the interview questions they employ. The `roles_competencies` table links job roles to the competencies they require. The `processes_questions` table links hiring processes to the interview questions used within them. The `processes_interviewers` table links hiring processes to the interviewers assigned to them. The `competencies_questions` table links competencies to the interview questions that assess them. The `competencies_roles` table links competencies to the job roles that require them. The `competencies_responses` table links competencies to the candidate responses that demonstrate them. The `interviewers_processes` table links interviewers to the hiring processes they participate in. The `interviewers_questions` table links interviewers to the interview questions they administer.

**Table `roles_questions`**

| role_code | interview_question_id |
|---|---|
| 6969430 | 100 |
| 6969430 | 101 |
| lu_tax_code_template_m16 | 101 |
| lu_tax_code_template_m16 | 102 |
| 3158154 | 102 |
| 3158154 | 103 |
| 39800616 | 103 |
| 39800616 | 100 |

**Table `roles_competencies`**

| role_code | competency_id |
|---|---|
| 6969430 | 1 |
| 6969430 | 2 |
| lu_tax_code_template_m16 | 2 |
| lu_tax_code_template_m16 | 3 |
| 3158154 | 3 |
| 3158154 | 4 |
| 39800616 | 4 |
| 39800616 | 1 |

**Table `processes_questions`**

| hiring_process_id | interview_question_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `processes_interviewers`**

| hiring_process_id | interviewer_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `competencies_questions`**

| competency_id | interview_question_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `competencies_roles`**

| competency_id | role_code |
|---|---|
| 1 | 6969430 |
| 1 | lu_tax_code_template_m16 |
| 2 | lu_tax_code_template_m16 |
| 2 | 3158154 |
| 3 | 3158154 |
| 3 | 39800616 |
| 4 | 39800616 |
| 4 | 6969430 |

**Table `competencies_responses`**

| competency_id | candidate_response_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `interviewers_processes`**

| interviewer_id | hiring_process_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `interviewers_questions`**

| interviewer_id | interview_question_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Analytical Views

The domain provides a set of analytical views that join these tables to answer specific operational questions. Each view materializes a particular relationship for reporting and audit purposes.

The view `v_interview_question_job_role` answers which job roles are associated with which interview questions. It joins `interview_questions` to `job_roles` through the `role_code` foreign key, producing rows that pair a question's `question_id` and `question_text` with its `role_title` and `department`. For example, question `325448` ("composite-question-63") appears alongside role `6969430` ("Distributed Standard") in department `adaptive-departme-89`.



The view `v_interview_question_hiring_process` answers which hiring processes include which interview questions. It joins `interview_questions` to `hiring_processes` through the `hiring_process_id` foreign key, pairing a question with the process's `process_id`, `status`, `interview_format`, and `total_candidates`. Question `325448` ("composite-question-63") appears alongside process `1000` (external ID `template_ivacode_pagata_art15`), which is Planned, uses Panel format, and has 9 candidates.



The view `v_interview_question_candidate_response` answers which candidate responses correspond to which interview questions. It joins `interview_questions` to `candidate_responses` through the `candidate_response_id` foreign key, pairing a question with the response's `response_text`, `rating_score`, and `submitted_at`. Question `325448` ("composite-question-63") appears alongside response `ChIJr7cItPtt5kcRM6ry7ecIYgw` ("adaptive-response-47"), which earned a rating of 7.20 and was submitted on May 8, 2022.



The view `v_job_role_interview_question_detail` provides a detailed join of job roles to their interview questions, enriching the question data with the role's `role_title`, `department`, `level`, and `is_leadership_role` flags. This view is useful for auditing whether a role's question set is complete and aligned with its seniority level.



The view `v_job_role_competency_detail` joins job roles to the competencies they require, producing rows that pair a `role_title` with a `competency_name`, `category`, and `proficiency_level`. This view supports competency gap analysis by showing which proficiency levels are expected for each role.



The view `v_hiring_process_job_role` joins hiring processes to the job roles they target, pairing a process's `process_id`, `status`, `interview_format`, and `total_candidates` with the role's `role_title`, `department`, and `level`. Process `1000` (external ID `template_ivacode_pagata_art15`, Planned, Panel, 9 candidates) appears alongside role `6969430` ("Distributed Standard", Entry level, department `adaptive-departme-89`).



The view `v_hiring_process_interview_question_detail` joins hiring processes to the interview questions used within them, enriching the question data with the process's `process_id`, `status`, `interview_format`, and `total_candidates`. This view supports process-level audit trails, showing which questions were deployed in which processes.



The view `v_hiring_process_interviewer_detail` joins hiring processes to the interviewers assigned to them, pairing a process's `process_id`, `status`, and `interview_format` with an interviewer's `interviewer_name`, `department`, `role`, and `years_experience`. This view supports staffing analysis, showing which interviewers are assigned to which processes and their experience levels.



The view `v_candidate_response_interview_question` joins candidate responses to the interview questions they answer, pairing a response's `response_text`, `uses_s_t_a_R_method`, `competency_demonstrated`, `rating_score`, and `submitted_at` with the question's `question_text`, `category`, and `priority_level`. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` ("adaptive-response-47") appears alongside question `325448` ("composite-question-63"), a Behavioral question with priority level 22.



The view `v_candidate_response_hiring_process` joins candidate responses to the hiring processes they belong to, pairing a response's `response_text`, `rating_score`, and `submitted_at` with the process's `process_id`, `status`, `interview_format`, and `total_candidates`. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` ("adaptive-response-47") appears alongside process `1000` (external ID `template_ivacode_pagata_art15`, Planned, Panel format, 9 candidates).



The view `v_competency_interview_question_detail` joins competencies to the interview questions that assess them, pairing a competency's `competency_name`, `category`, and `proficiency_level` with a question's `question_text`, `category`, and `priority_level`. This view supports assessment design reviews, showing which questions map to which competencies.



The view `v_competency_job_role_detail` joins competencies to the job roles that require them, pairing a competency's `competency_name`, `category`, and `proficiency_level` with a role's `role_title`, `department`, and `level`. This view supports role-competency alignment audits, showing whether the right competencies are assigned to the right roles.



The view `v_competency_candidate_response_detail` joins competencies to the candidate responses that demonstrate them, pairing a competency's `competency_name`, `category`, and `proficiency_level` with a response's `response_text`, `rating_score`, and `submitted_at`. This view supports competency-level performance analysis, showing how candidates performed against specific competencies.



The view `v_interviewer_hiring_process_detail` joins interviewers to the hiring processes they participate in, pairing an interviewer's `interviewer_name`, `department`, `role`, and `years_experience` with a process's `process_id`, `status`, `interview_format`, and `total_candidates`. This view supports interviewer workload and experience analysis.



The view `v_interviewer_job_role` joins interviewers to the job roles they are assigned to, pairing an interviewer's `interviewer_name`, `department`, `role`, and `years_experience` with a role's `role_title`, `department`, and `level`. Interviewer `10238280` ("Extended Initiative") appears alongside role `6969430` ("Distributed Standard", Entry level, department `adaptive-departme-89`).



The view `v_interviewer_interview_question_detail` joins interviewers to the interview questions they administer, pairing an interviewer's `interviewer_name`, `department`, `role`, and `years_experience` with a question's `question_text`, `category`, and `priority_level`. This view supports interviewer-question assignment audits, showing which interviewers are responsible for which questions.



## Synthesis

The hiring and interview management domain captures the full lifecycle of recruitment as a network of interrelated records. Job roles define what positions exist and what skills they require. Hiring processes operationalize those roles through structured timelines, formats, and candidate pools. Interview questions serve as the evaluation instruments, each tagged with category, priority, and behavioral attributes. Candidate responses record the outcomes of those evaluations, complete with ratings and competency demonstrations. Competencies define the skills being assessed, and interviewers provide the human element of evaluation. Association tables bind these entities together, and analytical views surface the relationships for reporting and audit. Every identifier, from `325448` to `ChIJr7cItPtt5kcRM6ry7ecIYgw`, traces a path through this network, enabling organizations to understand not just who was hired, but how, why, and against what standards.

## Data appendix

**Table `job_roles`**

| role_code | role_title | department | level | is_leadership_role | required_skills |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | adaptive-departme-89 | Entry | true | legacy-required-37 |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | Mid | false | compact-required-38 |
| 3158154 | Primary Protocol | baseline-departme-91 | Senior | true | composite-required-39 |
| 39800616 | Composite Programme | pilot-departme-92 | Executive | false | primary-required-40 |

**Table `hiring_processes`**

| hiring_process_id | process_id | start_date | end_date | status | interview_format | total_candidates | role_code |
|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Planned | Panel | 9 | 6969430 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Active | One-on-One | 20 | lu_tax_code_template_m16 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Completed | Virtual | 72 | 3158154 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Cancelled | In-Person | 37 | 39800616 |

**View `v_interview_question_job_role`**

```sql
CREATE VIEW v_interview_question_job_role AS
SELECT a.id, a.question_id, a.question_text, a.category, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM interview_questions a JOIN job_roles b ON a.role_code = b.role_code;
```

| id | question_id | question_text | category | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 100 | 325448 | composite-question-63 | Behavioral | 6969430 | Distributed Standard | adaptive-departme-89 |
| 101 | 5006438 | primary-question-64 | Competency-based | lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 |
| 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | Technical | 3158154 | Primary Protocol | baseline-departme-91 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | Leadership | 39800616 | Composite Programme | pilot-departme-92 |

**View `v_interview_question_hiring_process`**

```sql
CREATE VIEW v_interview_question_hiring_process AS
SELECT a.id, a.question_id, a.question_text, a.category, b.hiring_process_id AS process_hiring_process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM interview_questions a JOIN hiring_processes b ON a.hiring_process_id = b.hiring_process_id;
```

| id | question_id | question_text | category | process_hiring_process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| 100 | 325448 | composite-question-63 | Behavioral | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 101 | 5006438 | primary-question-64 | Competency-based | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | Technical | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | Leadership | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |

**View `v_interview_question_candidate_response`**

```sql
CREATE VIEW v_interview_question_candidate_response AS
SELECT a.id, a.question_id, a.question_text, a.category, b.id AS response_id, b.response_id AS response_response_id, b.response_text AS response_response_text
FROM interview_questions a JOIN candidate_responses b ON a.candidate_response_id = b.id;
```

| id | question_id | question_text | category | response_id | response_response_id | response_response_text |
|---|---|---|---|---|---|---|
| 100 | 325448 | composite-question-63 | Behavioral | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 |
| 101 | 5006438 | primary-question-64 | Competency-based | 2 | 9736917 | distributed-response-48 |
| 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | Technical | 3 | 8189493 | baseline-response-49 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | Leadership | 4 | Invoice | pilot-response-50 |

**View `v_job_role_interview_question_detail`**

```sql
CREATE VIEW v_job_role_interview_question_detail AS
SELECT a.role_code, a.role_title, a.department, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM job_roles a
  JOIN roles_questions j ON j.role_code = a.role_code
  JOIN interview_questions b ON b.id = j.interview_question_id;
```

| role_code | role_title | department | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | adaptive-departme-89 | 100 | 325448 | composite-question-63 |
| 6969430 | Distributed Standard | adaptive-departme-89 | 101 | 5006438 | primary-question-64 |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | 101 | 5006438 | primary-question-64 |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3158154 | Primary Protocol | baseline-departme-91 | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3158154 | Primary Protocol | baseline-departme-91 | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 39800616 | Composite Programme | pilot-departme-92 | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 39800616 | Composite Programme | pilot-departme-92 | 100 | 325448 | composite-question-63 |

**View `v_job_role_competency_detail`**

```sql
CREATE VIEW v_job_role_competency_detail AS
SELECT a.role_code, a.role_title, a.department, b.competency_id AS competency_competency_id, b.competency_name AS competency_competency_name, b.category AS competency_category
FROM job_roles a
  JOIN roles_competencies j ON j.role_code = a.role_code
  JOIN competencies b ON b.competency_id = j.competency_id;
```

| role_code | role_title | department | competency_competency_id | competency_competency_name | competency_category |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | adaptive-departme-89 | 1 | Baseline Standard D | Leadership |
| 6969430 | Distributed Standard | adaptive-departme-89 | 2 | Distributed Framework | Teamwork |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | 2 | Distributed Framework | Teamwork |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | 3 | Adaptive Protocol | Emotional Intelligence |
| 3158154 | Primary Protocol | baseline-departme-91 | 3 | Adaptive Protocol | Emotional Intelligence |
| 3158154 | Primary Protocol | baseline-departme-91 | 4 | Primary Programme A | Technical |
| 39800616 | Composite Programme | pilot-departme-92 | 4 | Primary Programme A | Technical |
| 39800616 | Composite Programme | pilot-departme-92 | 1 | Baseline Standard D | Leadership |

**View `v_hiring_process_job_role`**

```sql
CREATE VIEW v_hiring_process_job_role AS
SELECT a.hiring_process_id, a.process_id, a.start_date, a.end_date, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM hiring_processes a JOIN job_roles b ON a.role_code = b.role_code;
```

| hiring_process_id | process_id | start_date | end_date | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 6969430 | Distributed Standard | adaptive-departme-89 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3158154 | Primary Protocol | baseline-departme-91 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 39800616 | Composite Programme | pilot-departme-92 |

**View `v_hiring_process_interview_question_detail`**

```sql
CREATE VIEW v_hiring_process_interview_question_detail AS
SELECT a.hiring_process_id, a.process_id, a.start_date, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM hiring_processes a
  JOIN processes_questions j ON j.hiring_process_id = a.hiring_process_id
  JOIN interview_questions b ON b.id = j.interview_question_id;
```

| hiring_process_id | process_id | start_date | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 100 | 325448 | composite-question-63 |
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 101 | 5006438 | primary-question-64 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 101 | 5006438 | primary-question-64 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 100 | 325448 | composite-question-63 |

**View `v_hiring_process_interviewer_detail`**

```sql
CREATE VIEW v_hiring_process_interviewer_detail AS
SELECT a.hiring_process_id, a.process_id, a.start_date, b.id AS interviewer_id, b.interviewer_id AS interviewer_interviewer_id, b.interviewer_name AS interviewer_interviewer_name
FROM hiring_processes a
  JOIN processes_interviewers j ON j.hiring_process_id = a.hiring_process_id
  JOIN interviewers b ON b.id = j.interviewer_id;
```

| hiring_process_id | process_id | start_date | interviewer_id | interviewer_interviewer_id | interviewer_interviewer_name |
|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 1 | 10238280 | Extended Initiative |
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2 | account_pymes_659 | Pilot Model A |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2 | account_pymes_659 | Pilot Model A |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 3 | 6564396 | Baseline Cluster |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 3 | 6564396 | Baseline Cluster |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 4 | 2933459 | Distributed Review |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 4 | 2933459 | Distributed Review |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 1 | 10238280 | Extended Initiative |

**View `v_candidate_response_interview_question`**

```sql
CREATE VIEW v_candidate_response_interview_question AS
SELECT a.id, a.response_id, a.response_text, a.uses_s_t_a_r_method, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM candidate_responses a JOIN interview_questions b ON a.interview_question_id = b.id;
```

| id | response_id | response_text | uses_s_t_a_r_method | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 | true | 100 | 325448 | composite-question-63 |
| 2 | 9736917 | distributed-response-48 | false | 101 | 5006438 | primary-question-64 |
| 3 | 8189493 | baseline-response-49 | true | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 4 | Invoice | pilot-response-50 | false | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |

**View `v_candidate_response_hiring_process`**

```sql
CREATE VIEW v_candidate_response_hiring_process AS
SELECT a.id, a.response_id, a.response_text, a.uses_s_t_a_r_method, b.hiring_process_id AS process_hiring_process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM candidate_responses a JOIN hiring_processes b ON a.hiring_process_id = b.hiring_process_id;
```

| id | response_id | response_text | uses_s_t_a_r_method | process_hiring_process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 | true | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 2 | 9736917 | distributed-response-48 | false | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 3 | 8189493 | baseline-response-49 | true | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 4 | Invoice | pilot-response-50 | false | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |

**View `v_competency_interview_question_detail`**

```sql
CREATE VIEW v_competency_interview_question_detail AS
SELECT a.competency_id, a.competency_name, a.category, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM competencies a
  JOIN competencies_questions j ON j.competency_id = a.competency_id
  JOIN interview_questions b ON b.id = j.interview_question_id;
```

| competency_id | competency_name | category | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | Leadership | 100 | 325448 | composite-question-63 |
| 1 | Baseline Standard D | Leadership | 101 | 5006438 | primary-question-64 |
| 2 | Distributed Framework | Teamwork | 101 | 5006438 | primary-question-64 |
| 2 | Distributed Framework | Teamwork | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | Adaptive Protocol | Emotional Intelligence | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | Adaptive Protocol | Emotional Intelligence | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | Primary Programme A | Technical | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | Primary Programme A | Technical | 100 | 325448 | composite-question-63 |

**View `v_competency_job_role_detail`**

```sql
CREATE VIEW v_competency_job_role_detail AS
SELECT a.competency_id, a.competency_name, a.category, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM competencies a
  JOIN competencies_roles j ON j.competency_id = a.competency_id
  JOIN job_roles b ON b.role_code = j.role_code;
```

| competency_id | competency_name | category | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | Leadership | 6969430 | Distributed Standard | adaptive-departme-89 |
| 1 | Baseline Standard D | Leadership | lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 |
| 2 | Distributed Framework | Teamwork | lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 |
| 2 | Distributed Framework | Teamwork | 3158154 | Primary Protocol | baseline-departme-91 |
| 3 | Adaptive Protocol | Emotional Intelligence | 3158154 | Primary Protocol | baseline-departme-91 |
| 3 | Adaptive Protocol | Emotional Intelligence | 39800616 | Composite Programme | pilot-departme-92 |
| 4 | Primary Programme A | Technical | 39800616 | Composite Programme | pilot-departme-92 |
| 4 | Primary Programme A | Technical | 6969430 | Distributed Standard | adaptive-departme-89 |

**View `v_competency_candidate_response_detail`**

```sql
CREATE VIEW v_competency_candidate_response_detail AS
SELECT a.competency_id, a.competency_name, a.category, b.id AS response_id, b.response_id AS response_response_id, b.response_text AS response_response_text
FROM competencies a
  JOIN competencies_responses j ON j.competency_id = a.competency_id
  JOIN candidate_responses b ON b.id = j.candidate_response_id;
```

| competency_id | competency_name | category | response_id | response_response_id | response_response_text |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | Leadership | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 |
| 1 | Baseline Standard D | Leadership | 2 | 9736917 | distributed-response-48 |
| 2 | Distributed Framework | Teamwork | 2 | 9736917 | distributed-response-48 |
| 2 | Distributed Framework | Teamwork | 3 | 8189493 | baseline-response-49 |
| 3 | Adaptive Protocol | Emotional Intelligence | 3 | 8189493 | baseline-response-49 |
| 3 | Adaptive Protocol | Emotional Intelligence | 4 | Invoice | pilot-response-50 |
| 4 | Primary Programme A | Technical | 4 | Invoice | pilot-response-50 |
| 4 | Primary Programme A | Technical | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 |

**View `v_interviewer_hiring_process_detail`**

```sql
CREATE VIEW v_interviewer_hiring_process_detail AS
SELECT a.id, a.interviewer_id, a.interviewer_name, b.hiring_process_id AS process_hiring_process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM interviewers a
  JOIN interviewers_processes j ON j.interviewer_id = a.id
  JOIN hiring_processes b ON b.hiring_process_id = j.hiring_process_id;
```

| id | interviewer_id | interviewer_name | process_hiring_process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|
| 1 | 10238280 | Extended Initiative | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 1 | 10238280 | Extended Initiative | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 2 | account_pymes_659 | Pilot Model A | 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 2 | account_pymes_659 | Pilot Model A | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 3 | 6564396 | Baseline Cluster | 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 3 | 6564396 | Baseline Cluster | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |
| 4 | 2933459 | Distributed Review | 1003 | 1205-0002-XL | 2025-12-11T17:15:00 |
| 4 | 2933459 | Distributed Review | 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |

**View `v_interviewer_job_role`**

```sql
CREATE VIEW v_interviewer_job_role AS
SELECT a.id, a.interviewer_id, a.interviewer_name, a.department, b.role_code AS role_role_code, b.role_title AS role_role_title, b.department AS role_department
FROM interviewers a JOIN job_roles b ON a.role_code = b.role_code;
```

| id | interviewer_id | interviewer_name | department | role_role_code | role_role_title | role_department |
|---|---|---|---|---|---|---|
| 1 | 10238280 | Extended Initiative | adaptive-departme-89 | 6969430 | Distributed Standard | adaptive-departme-89 |
| 2 | account_pymes_659 | Pilot Model A | distributed-departme-90 | lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 |
| 3 | 6564396 | Baseline Cluster | baseline-departme-91 | 3158154 | Primary Protocol | baseline-departme-91 |
| 4 | 2933459 | Distributed Review | pilot-departme-92 | 39800616 | Composite Programme | pilot-departme-92 |

**View `v_interviewer_interview_question_detail`**

```sql
CREATE VIEW v_interviewer_interview_question_detail AS
SELECT a.id, a.interviewer_id, a.interviewer_name, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM interviewers a
  JOIN interviewers_questions j ON j.interviewer_id = a.id
  JOIN interview_questions b ON b.id = j.interview_question_id;
```

| id | interviewer_id | interviewer_name | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 1 | 10238280 | Extended Initiative | 100 | 325448 | composite-question-63 |
| 1 | 10238280 | Extended Initiative | 101 | 5006438 | primary-question-64 |
| 2 | account_pymes_659 | Pilot Model A | 101 | 5006438 | primary-question-64 |
| 2 | account_pymes_659 | Pilot Model A | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | 6564396 | Baseline Cluster | 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | 6564396 | Baseline Cluster | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | 2933459 | Distributed Review | 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | 2933459 | Distributed Review | 100 | 325448 | composite-question-63 |
