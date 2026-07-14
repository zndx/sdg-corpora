# Ontology-Grounded Relational Modelling of the Interview Assessment Domain

The interview assessment domain captures the full lifecycle of hiring: from defining a job role and its required competencies, through designing a hiring process with specific interview questions and assigned interviewers, to recording candidate responses and their ratings. The ontology underlying this domain distinguishes six core entity types—`interview_questions`, `job_roles`, `hiring_processes`, `candidate_responses`, `competencies`, and `interviewers`—each materialised as a base table with a primary key, a set of scalar attributes, and zero or more foreign keys that anchor the entity to its parent context. Many-to-many relationships between these entities are resolved through junction tables, and a suite of views reconstructs denormalised facts by joining the normalised tables back together.

**Table `interview_questions`**

| id | question_id | question_text | category | is_panel_question | is_behavioral | priority_level | role_code | hiring_process_id | candidate_response_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 325448 | composite-question-63 | Behavioral | true | true | 22 | 6969430 | 1000 | 1 |
| 101 | 5006438 | primary-question-64 | Competency-based | false | false | 25 | lu_tax_code_template_m16 | 1001 | 2 |
| 102 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | Technical | true | true | 28 | 3158154 | 1002 | 3 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | Leadership | false | false | 31 | 39800616 | 1003 | 4 |

The `interview_questions` table is the central fact table of the assessment model. Its surrogate primary key `id` (values 100–103) is distinct from the business identifier `question_id`, which carries a richer semantic payload: UUIDs such as `dc0d0562-8fcd-11eb-924d-9cd76263cbd0` for technical questions, structured identifiers like `ChIJEctqrYFt5kcRUrBEPR-XXBE` for distributed questions, and short codes such as `325448` for behavioural items. The column `question_text` stores the actual prompt—`"composite-question-63"`, `"primary-question-64"`, and so on—while `category` classifies the question into one of four buckets: `Behavioral`, `Competency-based`, `Technical`, or `Leadership`. Boolean flags `is_panel_question` and `is_behavioral` constrain the question type to a small discrete domain, and `priority_level` is an integer ranging from 22 to 31 that orders questions by importance. The columns `role_code`, `hiring_process_id`, and `candidate_response_id` are foreign keys that bind each question to a specific job role, a hiring process, and a candidate response respectively, forming a triangular relationship that the junction tables later decompose into proper many-to-many links.

**Table `job_roles`**

| role_code | role_title | department | level | is_leadership_role | required_skills |
|---|---|---|---|---|---|
| 6969430 | Distributed Standard | adaptive-departme-89 | Entry | true | legacy-required-37 |
| lu_tax_code_template_m16 | Adaptive Framework D | distributed-departme-90 | Mid | false | compact-required-38 |
| 3158154 | Primary Protocol | baseline-departme-91 | Senior | true | composite-required-39 |
| 39800616 | Composite Programme | pilot-departme-92 | Executive | false | primary-required-40 |

The `job_roles` table defines the positions being filled. Its primary key `role_code` doubles as a business key and appears as a foreign key in `interview_questions`, `hiring_processes`, and `interviewers`. Role titles such as `"Distributed Standard"`, `"Adaptive Framework D"`, `"Primary Protocol"`, and `"Composite Programme"` are paired with department names like `"adaptive-departme-89"` and `"pilot-departme-92"`. The `level` column enumerates career bands (`Entry`, `Mid`, `Senior`, `Executive`), `is_leadership_role` is a boolean, and `required_skills` stores a textual descriptor of the skill set, for example `"legacy-required-37"` or `"compact-required-38"`.

**Table `hiring_processes`**

| hiring_process_id | process_id | start_date | end_date | status | interview_format | total_candidates | role_code |
|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Planned | Panel | 9 | 6969430 |
| 1001 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Active | One-on-One | 20 | lu_tax_code_template_m16 |
| 1002 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Completed | Virtual | 72 | 3158154 |
| 1003 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Cancelled | In-Person | 37 | 39800616 |

`hiring_processes` captures each recruitment campaign. Its primary key `hiring_process_id` (1000–1003) is a surrogate integer, while `process_id` carries the business identifier, which may be a UUID (`"27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3"`) or a structured code (`"template_ivacode_pagata_art15"`, `"1205-0002-XL"`). Temporal attributes `start_date` and `end_date` record the campaign window; notably, the end date can precede the start date in the sample data, reflecting a planning convention where the planned end is recorded before the actual start. The `status` column enumerates `Planned`, `Active`, `Completed`, and `Cancelled`. `interview_format` constrains the process to one of four formats: `Panel`, `One-on-One`, `Virtual`, or `In-Person`. `total_candidates` is an integer count, and `role_code` is a foreign key to `job_roles`, establishing that each hiring process targets exactly one job role.

**Table `candidate_responses`**

| id | response_id | response_text | uses_s_t_a_r_method | competency_demonstrated | rating_score | submitted_at | interview_question_id | hiring_process_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | adaptive-response-47 | true | regional-competen-24 | 7.20 | 2022-05-08T04:00:00 | 100 | 1000 |
| 2 | 9736917 | distributed-response-48 | false | legacy-competen-25 | 11.40 | 2023-10-19T11:17:00 | 101 | 1001 |
| 3 | 8189493 | baseline-response-49 | true | compact-competen-26 | 15.60 | 2024-03-03T18:34:00 | 102 | 1002 |
| 4 | Invoice | pilot-response-50 | false | composite-competen-27 | 19.80 | 2025-08-14T01:51:00 | 103 | 1003 |

`candidate_responses` records each candidate's answer to an interview question. The surrogate primary key `id` (1–4) is distinct from the business `response_id`, which carries identifiers such as the UUID-like `"ChIJr7cItPtt5kcRM6ry7ecIYgw"` or short codes like `"9736917"`. The `response_text` column holds the answer itself—`"adaptive-response-47"`, `"distributed-response-48"`, `"baseline-response-49"`, and `"pilot-response-50"`—while `uses_s_t_a_r_method` is a boolean indicating whether the candidate employed the STAR technique. `competency_demonstrated` names the competency the response was intended to assess (e.g., `"regional-competen-24"`, `"legacy-competen-25"`), and `rating_score` is a decimal ranging from 7.20 to 19.80. The `submitted_at` timestamp anchors the response in time, and the foreign keys `interview_question_id` and `hiring_process_id` bind the response to its originating question and process.

**Table `competencies`**

| competency_id | competency_name | category | proficiency_level | assessment_criteria |
|---|---|---|---|---|
| 1 | Baseline Standard D | Leadership | Basic | extended-assessme-63 |
| 2 | Distributed Framework | Teamwork | Intermediate | integrated-assessme-64 |
| 3 | Adaptive Protocol | Emotional Intelligence | Advanced | seasonal-assessme-65 |
| 4 | Primary Programme A | Technical | Expert | regional-assessme-66 |

The `competencies` table defines the skills and abilities being evaluated. Its primary key `competency_id` is a small integer (1–4), and `competency_name` stores human-readable labels such as `"Baseline Standard D"`, `"Distributed Framework"`, `"Adaptive Protocol"`, and `"Primary Programme A"`. The `category` column classifies competencies into `Leadership`, `Teamwork`, `Emotional Intelligence`, and `Technical`. `proficiency_level` enumerates `Basic`, `Intermediate`, `Advanced`, and `Expert`, while `assessment_criteria` provides a textual rubric, for example `"extended-assessme-63"` or `"seasonal-assessme-65"`.

**Table `interviewers`**

| id | interviewer_id | interviewer_name | department | role | years_experience | role_code |
|---|---|---|---|---|---|---|
| 1 | 10238280 | Extended Initiative | adaptive-departme-89 | Hiring Manager | 16 | 6969430 |
| 2 | account_pymes_659 | Pilot Model A | distributed-departme-90 | Team Leader | 22 | lu_tax_code_template_m16 |
| 3 | 6564396 | Baseline Cluster | baseline-departme-91 | HR Representative | 28 | 3158154 |
| 4 | 2933459 | Distributed Review | pilot-departme-92 | Executive | 34 | 39800616 |

`interviewers` stores the people who conduct interviews. The surrogate primary key `id` (1–4) is distinct from the business `interviewer_id`, which carries identifiers such as `"10238280"`, `"account_pymes_659"`, `"6564396"`, and `"2933459"`. `interviewer_name` holds names like `"Extended Initiative"`, `"Pilot Model A"`, `"Baseline Cluster"`, and `"Distributed Review"`. The `department` column mirrors the department taxonomy from `job_roles`, `role` enumerates the interviewer's function (`Hiring Manager`, `Team Leader`, `HR Representative`, `Executive`), and `years_experience` is an integer from 16 to 34. The foreign key `role_code` links each interviewer to a job role, indicating which position they are qualified to interview for.

The six base tables above capture the core entities, but the ontology also specifies many-to-many relationships that cannot be expressed through simple foreign keys. These are materialised as junction tables.

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

`roles_questions` resolves the many-to-many relationship between `job_roles` and `interview_questions`. A single job role may require multiple interview questions, and a single question may be relevant to multiple roles. The junction table contains foreign keys to both `job_roles.role_code` and `interview_questions.id`, forming a composite relationship that the view `v_job_role_interview_question_detail` later reconstructs.

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

`roles_competencies` links `job_roles` to `competencies`. Each role may require multiple competencies, and each competency may be required by multiple roles. The foreign keys reference `job_roles.role_code` and `competencies.competency_id`.

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

`processes_questions` connects `hiring_processes` to `interview_questions`. A hiring process uses multiple questions, and a question may appear in multiple processes. Foreign keys reference `hiring_processes.hiring_process_id` and `interview_questions.id`.

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

`processes_interviewers` links `hiring_processes` to `interviewers`. A hiring process may involve multiple interviewers, and an interviewer may participate in multiple processes. Foreign keys reference `hiring_processes.hiring_process_id` and `interviewers.id`.

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

`competencies_questions` associates `competencies` with `interview_questions`. A competency may be assessed through multiple questions, and a question may assess multiple competencies. Foreign keys reference `competencies.competency_id` and `interview_questions.id`.

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

`competencies_roles` is a second junction between `competencies` and `job_roles`, providing an alternative or complementary linkage to `roles_competencies`. Foreign keys reference `competencies.competency_id` and `job_roles.role_code`.

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

`competencies_responses` links `competencies` to `candidate_responses`. A competency may be demonstrated across multiple responses, and a response may demonstrate multiple competencies. Foreign keys reference `competencies.competency_id` and `candidate_responses.id`.

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

`interviewers_processes` is a second junction between `interviewers` and `hiring_processes`, complementing `processes_interviewers`. Foreign keys reference `interviewers.id` and `hiring_processes.hiring_process_id`.

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

`interviewers_questions` connects `interviewers` to `interview_questions`. An interviewer may be assigned to ask multiple questions, and a question may be asked by multiple interviewers. Foreign keys reference `interviewers.id` and `interview_questions.id`.

With the base tables and junction tables in place, the materialised views reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question by pulling together attributes from two or more entities.

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

The view `v_interview_question_job_role` joins `interview_questions` to `job_roles` on `role_code`, answering the question: "Which job roles are associated with which interview questions?" For example, the question `325448` ("composite-question-63", category `Behavioral`, priority 22) is linked to role `6969430` ("Distributed Standard", department `adaptive-departme-89`, level `Entry`). This view materialises the direct question-to-role association without requiring a join through the `roles_questions` junction table.

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

`v_interview_question_hiring_process` joins `interview_questions` to `hiring_processes` on `hiring_process_id`, answering: "Which hiring processes include which interview questions?" The question `5006438` ("primary-question-64", category `Competency-based`, priority 25) is linked to hiring process `1001` (status `Active`, format `One-on-One`, 20 candidates). This view reconstructs the question-process relationship directly from the foreign key in `interview_questions`.

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

`v_interview_question_candidate_response` joins `interview_questions` to `candidate_responses` on `candidate_response_id`, answering: "Which candidate responses are tied to which interview questions?" The question `dc0d0562-8fcd-11eb-924d-9cd76263cbd0` ("adaptive-question-65", category `Technical`, priority 28) is linked to candidate response `3` (response text `"baseline-response-49"`, rating 15.60, submitted `2024-03-03T18:34:00`). This view provides a direct question-to-response mapping.

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

`v_job_role_interview_question_detail` joins `job_roles` to `interview_questions` through the `roles_questions` junction table, answering: "What is the detailed mapping between job roles and their associated interview questions?" This view materialises the full many-to-many relationship, pulling in `role_title`, `department`, `level`, `question_text`, `category`, and `priority_level` into a single denormalised row.

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

`v_job_role_competency_detail` joins `job_roles` to `competencies` through the `roles_competencies` junction table, answering: "What competencies are required by each job role?" The view combines `role_title`, `department`, `level` with `competency_name`, `category`, and `proficiency_level`, providing a complete picture of the skill requirements for each position.

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

`v_hiring_process_job_role` joins `hiring_processes` to `job_roles` on `role_code`, answering: "Which job role does each hiring process target?" Hiring process `1000` (status `Planned`, format `Panel`, 9 candidates) targets role `6969430` ("Distributed Standard", department `adaptive-departme-89`, level `Entry`). This view provides a direct process-to-role association.

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

`v_hiring_process_interview_question_detail` joins `hiring_processes` to `interview_questions` through the `processes_questions` junction table, answering: "What interview questions are used in each hiring process?" This view materialises the full many-to-many relationship, combining process attributes (`process_id`, `start_date`, `end_date`, `status`, `interview_format`, `total_candidates`) with question attributes (`question_text`, `category`, `priority_level`).

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

`v_hiring_process_interviewer_detail` joins `hiring_processes` to `interviewers` through the `processes_interviewers` junction table, answering: "Which interviewers are assigned to each hiring process?" The view combines process details with interviewer attributes (`interviewer_name`, `department`, `role`, `years_experience`), providing a complete roster of interviewers per process.

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

`v_candidate_response_interview_question` joins `candidate_responses` to `interview_questions` on `interview_question_id`, answering: "Which interview question did each candidate response address?" Candidate response `1` (response text `"adaptive-response-47"`, uses STAR `true`, rating 7.20) is linked to interview question `100` (question text `"composite-question-63"`, category `Behavioral`, priority 22). This view provides a direct response-to-question mapping.

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

`v_candidate_response_hiring_process` joins `candidate_responses` to `hiring_processes` on `hiring_process_id`, answering: "Which hiring process did each candidate response belong to?" Candidate response `2` (response text `"distributed-response-48"`, rating 11.40, submitted `2023-10-19T11:17:00`) is linked to hiring process `1001` (status `Active`, format `One-on-One`, 20 candidates). This view reconstructs the process context for each response.

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

`v_competency_interview_question_detail` joins `competencies` to `interview_questions` through the `competencies_questions` junction table, answering: "Which interview questions assess which competencies?" The view combines competency attributes (`competency_name`, `category`, `proficiency_level`) with question attributes (`question_text`, `category`, `priority_level`), providing a complete mapping of assessment coverage.

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

`v_competency_job_role_detail` joins `competencies` to `job_roles` through the `competencies_roles` junction table, answering: "Which job roles require which competencies?" This view materialises the competency-to-role relationship, combining `competency_name`, `category`, `proficiency_level` with `role_title`, `department`, and `level`.

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

`v_competency_candidate_response_detail` joins `competencies` to `candidate_responses` through the `competencies_responses` junction table, answering: "Which competencies were demonstrated in each candidate response?" The view combines competency attributes with response attributes (`response_text`, `uses_s_t_a_r_method`, `rating_score`, `submitted_at`), providing a detailed assessment record.

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

`v_interviewer_hiring_process_detail` joins `interviewers` to `hiring_processes` through the `interviewers_processes` junction table, answering: "Which hiring processes does each interviewer participate in?" The view combines interviewer attributes (`interviewer_name`, `department`, `role`, `years_experience`) with process attributes (`process_id`, `start_date`, `end_date`, `status`, `interview_format`, `total_candidates`).

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

`v_interviewer_job_role` joins `interviewers` to `job_roles` on `role_code`, answering: "Which job roles is each interviewer qualified to interview for?" Interviewer `10238280` ("Extended Initiative", department `adaptive-departme-89`, role `Hiring Manager`, 16 years experience) is qualified for role `6969430` ("Distributed Standard", department `adaptive-departme-89`, level `Entry`). This view provides a direct interviewer-to-role qualification mapping.

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

`v_interviewer_interview_question_detail` joins `interviewers` to `interview_questions` through the `interviewers_questions` junction table, answering: "Which interview questions is each interviewer assigned to ask?" The view combines interviewer attributes with question attributes (`question_text`, `category`, `priority_level`), providing a complete assignment roster.

The relational schema presented here demonstrates a disciplined normalisation of the interview assessment ontology. Six base tables capture the core entities with their scalar attributes and primary keys. Fifteen junction tables resolve the many-to-many relationships that the ontology specifies, ensuring that no transitive dependency violates third normal form. Thirty views then reconstruct the denormalised facts that analysts and application code need, each view answering a specific domain question by joining the appropriate combination of base and junction tables. The result is a schema that is both faithful to the conceptual model and efficient for query, with foreign keys and junction tables providing the structural scaffolding that the views collapse into readable, actionable rows.