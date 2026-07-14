## Ontology-Grounded Relational Modelling of the Academic Credential Domain

The academic credential domain captures the lifecycle of a student's journey through a program of study, the credentials earned along the way, and the administrative checks that govern graduation eligibility. At its core, the domain revolves around four principal entity types: students, programs of study, credentials, and parchments. These are augmented by two administrative tables—graduation eligibility checks and exception records—that record policy decisions and deviations. The relational schema materialises this ontology through a combination of normalised base tables, junction tables for many-to-many associations, and a suite of views that reconstruct domain facts by joining the normalised pieces back together.

**Table `credentials`**

| credential_id | credential_type | program_name | issuing_institution | issue_date | status | honours_notation | student_id | program_of_study_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Degree | Extended Review | distributed-issuing-96 | 2023-02-01T13:51:00 | Issued | true | 1 | 100 |
| 2 | Diploma | Pilot Initiative A | baseline-issuing-97 | 2024-07-12T20:08:00 | Revoked | false | 2 | 101 |
| 3 | Certificate | Baseline Model | pilot-issuing-98 | 2025-12-23T03:25:00 | Pending | true | 3 | 102 |
| 4 | Degree | Distributed Cluster | extended-issuing-99 | 2022-05-07T10:42:00 | Issued | false | 4 | 103 |

The `credentials` table is the central artefact table. Each row represents a credential issued to a student within a particular program of study. The primary key is `credential_id`, a surrogate integer. The `credential_type` column classifies the credential as a `Degree`, `Diploma`, or `Certificate`—as seen in the first row where credential 1 is a `Degree` of type `Extended Review` issued by `distributed-issuing-96` on `2023-02-01`. The `status` column tracks the credential's lifecycle state (`Issued`, `Revoked`, `Pending`), and `honours_notation` is a boolean flag. Two foreign keys anchor the credential to its stakeholders: `student_id` references `students.student_id`, and `program_of_study_id` references `program_of_studies.id`. This dual foreign-key design means each credential is a fact about a specific student pursuing a specific program.

**Table `students`**

| student_id | full_name | enrollment_status | start_date | residency_percentage | financial_obligations_met | ggpa | credential_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Active | 2022-09-05 | 6.70 | true | 10.95 | 1 |
| 2 | Account Name | Graduated | 2023-02-16 | 11.40 | false | 14.90 | 2 |
| 3 | Saipan International Airport | Withdrawn | 2024-07-27 | 16.10 | true | 18.85 | 3 |
| 4 | Norma Fisher | Auditing | 2025-12-11 | 20.80 | false | 22.80 | 4 |

The `students` table holds the person-level master data. Its primary key is `student_id`. Columns such as `full_name`, `enrollment_status` (`Active`, `Graduated`, `Withdrawn`, `Auditing`), `start_date`, `residency_percentage`, `financial_obligations_met`, and `ggpa` describe the student's academic and financial standing. The `ggpa` values range from `10.95` (Theodore Mcgrath) to `22.80` (Norma Fisher), reflecting a grading scale that is institution-specific. A foreign key `credential_id` links each student to their most recent or primary credential, creating a one-to-one or one-to-few relationship depending on whether a student holds multiple credentials. In the data, student 1 (Theodore Mcgrath) is linked to credential 1, and student 2 (Account Name) to credential 2.

**Table `program_of_studies`**

| id | program_code | program_name | approval_authority | standard_length | completion_deadline_multiplier | is_apprentice_program | current_version |
|---|---|---|---|---|---|---|---|
| 100 | 191 | Extended Review | Ministry | 22 | 15.45 | true | baseline-current-91 |
| 101 | 1186082 | Pilot Initiative A | Board | 31 | 19.90 | false | pilot-current-92 |
| 102 | 3990187 | Baseline Model | Ministry | 40 | 24.35 | true | extended-current-93 |
| 103 | flexible-thinking | Distributed Cluster | Board | 49 | 28.80 | false | integrated-current-94 |

The `program_of_studies` table defines the academic programs themselves. Its primary key is `id`. The `program_code` (e.g., `191`, `1186082`, `flexible-thinking`) and `program_name` (e.g., `Extended Review`, `Pilot Initiative A`) identify the program. Administrative metadata includes `approval_authority` (`Ministry` or `Board`), `standard_length` (in months or credits), `completion_deadline_multiplier`, `is_apprentice_program` (a boolean), and `current_version` (a version string such as `baseline-current-91`). This table is a pure reference entity with no foreign keys of its own; it is referenced by `credentials`, `students_studies`, `graduation_eligibility_checks`, and `exception_records`.

**Table `parchments`**

| parchment_id | issue_date | graduate_name | program_name_at_graduation | honours_notation | is_reissued | revocation_reason | student_id | credential_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-01T13:51:00 | Distributed Review | distributed-program-78 | true | false | legacy-revocati-49 | 1 | 1 |
| 2 | 2024-07-12T20:08:00 | Adaptive Initiative D | baseline-program-79 | false | true | compact-revocati-50 | 2 | 2 |
| 3 | 2025-12-23T03:25:00 | Primary Model | pilot-program-80 | true | false | composite-revocati-51 | 3 | 3 |
| 4 | 2022-05-07T10:42:00 | Composite Cluster | extended-program-81 | false | true | primary-revocati-52 | 4 | 4 |

The `parchments` table records the physical or digital diploma issued upon graduation. Its primary key is `parchment_id`. Columns include `issue_date`, `graduate_name`, `program_name_at_graduation`, `honours_notation`, `is_reissued`, and `revocation_reason`. The `revocation_reason` column contains values like `legacy-revocati-49` and `compact-revocati-50`, indicating why a reissued or revoked parchment was generated. Two foreign keys, `student_id` and `credential_id`, tie each parchment to the student and the credential it represents. For example, parchment 1 was issued to student 1 for credential 1, with the graduate name `Distributed Review` and a `true` honours notation.

**Table `graduation_eligibility_checks`**

| id | check_id | check_date | eligibility_status | ggpa_met | residency_met | financial_obligations_met | completion_deadline_met | student_id | program_of_study_id | parchment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 611510 | 2025-08-21T07:57:00 | Eligible | true | true | true | false | 1 | 100 | 1 |
| 2 | 974935 | 2022-01-05T14:14:00 | Ineligible | false | false | false | true | 2 | 101 | 2 |
| 3 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | PendingReview | true | true | true | false | 3 | 102 | 3 |
| 4 | b_VB-EC-12 | 2024-11-27T04:48:00 | Eligible | false | false | false | true | 4 | 103 | 4 |

The `graduation_eligibility_checks` table is an audit log of eligibility determinations. Its primary key is `id`. The `check_id` column (e.g., `611510`, `974935`, `9fff03be-9bac-11eb-a8a2-19ed5c03f8d3`) provides a human-readable or UUID-based identifier for the check instance. The `check_date` records when the eligibility was assessed. The `eligibility_status` column takes values such as `Eligible`, `Ineligible`, and `PendingReview`. Boolean columns `ggpa_met`, `residency_met`, `financial_obligations_met`, and `completion_deadline_met` record the outcome of each eligibility criterion. Three foreign keys anchor the check: `student_id` to `students`, `program_of_study_id` to `program_of_studies`, and `parchment_id` to `parchments`. This triple foreign-key design means each eligibility check is a fact about a specific student, in a specific program, associated with a specific parchment.

**Table `exception_records`**

| id | exception_id | exception_date | nature_of_exception | alignment_confirmation | risk_description | approval_status | student_id | program_of_study_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087741 | 2024-07-03T18:30:00 | regional-nature-24 | true | Regional Corridor | Approved | 1 | 100 |
| 2 | 974938 | 2025-12-14T01:47:00 | legacy-nature-25 | false | Seasonal Series D | Pending | 2 | 101 |
| 3 | 7731874 | 2022-05-25T08:04:00 | compact-nature-26 | true | Integrated Assessment | Rejected | 3 | 102 |
| 4 | 8843762 | 2023-10-09T15:21:00 | composite-nature-27 | false | Extended Survey | Approved | 4 | 103 |

The `exception_records` table captures policy exceptions or waivers. Its primary key is `id`. The `exception_id` (e.g., `2087741`, `974938`) identifies the exception instance. The `exception_date` records when the exception was logged. The `nature_of_exception` column contains coded values like `regional-nature-24` and `legacy-nature-25`. The `alignment_confirmation` boolean indicates whether the exception was aligned with policy, and `risk_description` provides a free-text rationale (e.g., `Regional Corridor`, `Seasonal Series D`). The `approval_status` column takes values `Approved`, `Pending`, or `Rejected`. Two foreign keys, `student_id` and `program_of_study_id`, tie each exception to the student and program involved.

**Table `students_studies`**

| student_id | program_of_study_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `students_studies` table is a junction (associative) table that resolves a many-to-many relationship between students and programs of study. It contains two foreign keys: `student_id` referencing `students.student_id` and `program_of_study_id` referencing `program_of_studies.id`. Each row asserts that a particular student is enrolled in or has completed a particular program. This table enables a student to be associated with multiple programs and a program to have multiple students, without duplicating student or program data.

**Table `studies_credentials`**

| program_of_study_id | credential_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `studies_credentials` table is another junction table, resolving the many-to-many relationship between programs of study and credentials. It contains `credential_id` referencing `credentials.credential_id` and `program_of_study_id` referencing `program_of_studies.id`. This allows a single credential type or instance to be associated with multiple programs, and a single program to produce multiple credential types.

With the base tables defined, the view layer reconstructs domain facts by joining these normalised tables. Each view answers a specific analytical question by denormalising the relevant entities into a single flat result set.

**View `v_credential_student`**

```sql
CREATE VIEW v_credential_student AS
SELECT a.credential_id, a.credential_type, a.program_name, a.issuing_institution, b.student_id AS student_student_id, b.full_name AS student_full_name, b.enrollment_status AS student_enrollment_status
FROM credentials a JOIN students b ON a.student_id = b.student_id;
```

| credential_id | credential_type | program_name | issuing_institution | student_student_id | student_full_name | student_enrollment_status |
|---|---|---|---|---|---|---|
| 1 | Degree | Extended Review | distributed-issuing-96 | 1 | Theodore Mcgrath | Active |
| 2 | Diploma | Pilot Initiative A | baseline-issuing-97 | 2 | Account Name | Graduated |
| 3 | Certificate | Baseline Model | pilot-issuing-98 | 3 | Saipan International Airport | Withdrawn |
| 4 | Degree | Distributed Cluster | extended-issuing-99 | 4 | Norma Fisher | Auditing |

The view `v_credential_student` joins `credentials` to `students` on `credentials.student_id = students.student_id`. It answers the question: "What credential does each student hold, and what are the student's details?" For example, the first row would show credential 1 (a `Degree` of type `Extended Review`, status `Issued`) alongside student 1 (Theodore Mcgrath, `Active`, `ggpa` 10.95). This view is useful for credential auditing at the student level.

**View `v_credential_program_of_study`**

```sql
CREATE VIEW v_credential_program_of_study AS
SELECT a.credential_id, a.credential_type, a.program_name, a.issuing_institution, b.id AS study_id, b.program_code AS study_program_code, b.program_name AS study_program_name
FROM credentials a JOIN program_of_studies b ON a.program_of_study_id = b.id;
```

| credential_id | credential_type | program_name | issuing_institution | study_id | study_program_code | study_program_name |
|---|---|---|---|---|---|---|
| 1 | Degree | Extended Review | distributed-issuing-96 | 100 | 191 | Extended Review |
| 2 | Diploma | Pilot Initiative A | baseline-issuing-97 | 101 | 1186082 | Pilot Initiative A |
| 3 | Certificate | Baseline Model | pilot-issuing-98 | 102 | 3990187 | Baseline Model |
| 4 | Degree | Distributed Cluster | extended-issuing-99 | 103 | flexible-thinking | Distributed Cluster |

The view `v_credential_program_of_study` joins `credentials` to `program_of_studies` on `credentials.program_of_study_id = program_of_studies.id`. It answers: "Which credentials are associated with which programs of study?" The first row would show credential 1 linked to program 100 (`Extended Review`, `Ministry` approval, `standard_length` 22). This view supports program-level credential analysis.

**View `v_student_program_of_study_detail`**

```sql
CREATE VIEW v_student_program_of_study_detail AS
SELECT a.student_id, a.full_name, a.enrollment_status, b.id AS study_id, b.program_code AS study_program_code, b.program_name AS study_program_name
FROM students a
  JOIN students_studies j ON j.student_id = a.student_id
  JOIN program_of_studies b ON b.id = j.program_of_study_id;
```

| student_id | full_name | enrollment_status | study_id | study_program_code | study_program_name |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Active | 100 | 191 | Extended Review |
| 1 | Theodore Mcgrath | Active | 101 | 1186082 | Pilot Initiative A |
| 2 | Account Name | Graduated | 101 | 1186082 | Pilot Initiative A |
| 2 | Account Name | Graduated | 102 | 3990187 | Baseline Model |
| 3 | Saipan International Airport | Withdrawn | 102 | 3990187 | Baseline Model |
| 3 | Saipan International Airport | Withdrawn | 103 | flexible-thinking | Distributed Cluster |
| 4 | Norma Fisher | Auditing | 103 | flexible-thinking | Distributed Cluster |
| 4 | Norma Fisher | Auditing | 100 | 191 | Extended Review |

The view `v_student_program_of_study_detail` joins `students` to `program_of_studies` via the `students_studies` junction table. It answers: "Which students are enrolled in which programs, and what are the program's administrative details?" A row would show student 1 (Theodore Mcgrath) enrolled in program 100 (`Extended Review`, `is_apprentice_program` true). This view is essential for enrollment reporting.

**View `v_student_credential`**

```sql
CREATE VIEW v_student_credential AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.start_date, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.program_name AS credential_program_name
FROM students a JOIN credentials b ON a.credential_id = b.credential_id;
```

| student_id | full_name | enrollment_status | start_date | credential_credential_id | credential_credential_type | credential_program_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Active | 2022-09-05 | 1 | Degree | Extended Review |
| 2 | Account Name | Graduated | 2023-02-16 | 2 | Diploma | Pilot Initiative A |
| 3 | Saipan International Airport | Withdrawn | 2024-07-27 | 3 | Certificate | Baseline Model |
| 4 | Norma Fisher | Auditing | 2025-12-11 | 4 | Degree | Distributed Cluster |

The view `v_student_credential` joins `students` to `credentials` on `students.credential_id = credentials.credential_id`. It answers: "What is the credential status of each student?" The first row would show student 1 (Theodore Mcgrath, `Active`) with credential 1 (status `Issued`, honours `true`). This view supports student-credential status dashboards.

**View `v_program_of_study_credential_detail`**

```sql
CREATE VIEW v_program_of_study_credential_detail AS
SELECT a.id, a.program_code, a.program_name, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.program_name AS credential_program_name
FROM program_of_studies a
  JOIN studies_credentials j ON j.program_of_study_id = a.id
  JOIN credentials b ON b.credential_id = j.credential_id;
```

| id | program_code | program_name | credential_credential_id | credential_credential_type | credential_program_name |
|---|---|---|---|---|---|
| 100 | 191 | Extended Review | 1 | Degree | Extended Review |
| 100 | 191 | Extended Review | 2 | Diploma | Pilot Initiative A |
| 101 | 1186082 | Pilot Initiative A | 2 | Diploma | Pilot Initiative A |
| 101 | 1186082 | Pilot Initiative A | 3 | Certificate | Baseline Model |
| 102 | 3990187 | Baseline Model | 3 | Certificate | Baseline Model |
| 102 | 3990187 | Baseline Model | 4 | Degree | Distributed Cluster |
| 103 | flexible-thinking | Distributed Cluster | 4 | Degree | Distributed Cluster |
| 103 | flexible-thinking | Distributed Cluster | 1 | Degree | Extended Review |

The view `v_program_of_study_credential_detail` joins `program_of_studies` to `credentials` on `program_of_studies.id = credentials.program_of_study_id`. It answers: "What credentials have been issued under each program of study?" The first row would show program 100 (`Extended Review`) with credential 1 (type `Degree`, status `Issued`). This view supports program completion analytics.

**View `v_parchment_student`**

```sql
CREATE VIEW v_parchment_student AS
SELECT a.parchment_id, a.issue_date, a.graduate_name, a.program_name_at_graduation, b.student_id AS student_student_id, b.full_name AS student_full_name, b.enrollment_status AS student_enrollment_status
FROM parchments a JOIN students b ON a.student_id = b.student_id;
```

| parchment_id | issue_date | graduate_name | program_name_at_graduation | student_student_id | student_full_name | student_enrollment_status |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01T13:51:00 | Distributed Review | distributed-program-78 | 1 | Theodore Mcgrath | Active |
| 2 | 2024-07-12T20:08:00 | Adaptive Initiative D | baseline-program-79 | 2 | Account Name | Graduated |
| 3 | 2025-12-23T03:25:00 | Primary Model | pilot-program-80 | 3 | Saipan International Airport | Withdrawn |
| 4 | 2022-05-07T10:42:00 | Composite Cluster | extended-program-81 | 4 | Norma Fisher | Auditing |

The view `v_parchment_student` joins `parchments` to `students` on `parchments.student_id = students.student_id`. It answers: "Which student received which parchment, and what are the student's current details?" The first row would show parchment 1 (issued `2023-02-01`, graduate name `Distributed Review`, honours `true`) for student 1 (Theodore Mcgrath, `Active`). This view is useful for transcript and diploma verification.

**View `v_parchment_credential`**

```sql
CREATE VIEW v_parchment_credential AS
SELECT a.parchment_id, a.issue_date, a.graduate_name, a.program_name_at_graduation, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.program_name AS credential_program_name
FROM parchments a JOIN credentials b ON a.credential_id = b.credential_id;
```

| parchment_id | issue_date | graduate_name | program_name_at_graduation | credential_credential_id | credential_credential_type | credential_program_name |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01T13:51:00 | Distributed Review | distributed-program-78 | 1 | Degree | Extended Review |
| 2 | 2024-07-12T20:08:00 | Adaptive Initiative D | baseline-program-79 | 2 | Diploma | Pilot Initiative A |
| 3 | 2025-12-23T03:25:00 | Primary Model | pilot-program-80 | 3 | Certificate | Baseline Model |
| 4 | 2022-05-07T10:42:00 | Composite Cluster | extended-program-81 | 4 | Degree | Distributed Cluster |

The view `v_parchment_credential` joins `parchments` to `credentials` on `parchments.credential_id = credentials.credential_id`. It answers: "Which credential does each parchment represent, and what is the credential's status?" The first row would show parchment 1 linked to credential 1 (type `Degree`, status `Issued`, honours `true`). This view supports credential-parchment reconciliation.

**View `v_graduation_eligibility_check_student`**

```sql
CREATE VIEW v_graduation_eligibility_check_student AS
SELECT a.id, a.check_id, a.check_date, a.eligibility_status, b.student_id AS student_student_id, b.full_name AS student_full_name, b.enrollment_status AS student_enrollment_status
FROM graduation_eligibility_checks a JOIN students b ON a.student_id = b.student_id;
```

| id | check_id | check_date | eligibility_status | student_student_id | student_full_name | student_enrollment_status |
|---|---|---|---|---|---|---|
| 1 | 611510 | 2025-08-21T07:57:00 | Eligible | 1 | Theodore Mcgrath | Active |
| 2 | 974935 | 2022-01-05T14:14:00 | Ineligible | 2 | Account Name | Graduated |
| 3 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | PendingReview | 3 | Saipan International Airport | Withdrawn |
| 4 | b_VB-EC-12 | 2024-11-27T04:48:00 | Eligible | 4 | Norma Fisher | Auditing |

The view `v_graduation_eligibility_check_student` joins `graduation_eligibility_checks` to `students` on `graduation_eligibility_checks.student_id = students.student_id`. It answers: "What is the graduation eligibility status of each student?" The first row would show check 1 (check_id `611510`, status `Eligible`, `ggpa_met` true, `residency_met` true, `financial_obligations_met` true, `completion_deadline_met` false) for student 1 (Theodore Mcgrath, `ggpa` 10.95). This view is critical for graduation planning.

**View `v_graduation_eligibility_check_program_of_study`**

```sql
CREATE VIEW v_graduation_eligibility_check_program_of_study AS
SELECT a.id, a.check_id, a.check_date, a.eligibility_status, b.id AS study_id, b.program_code AS study_program_code, b.program_name AS study_program_name
FROM graduation_eligibility_checks a JOIN program_of_studies b ON a.program_of_study_id = b.id;
```

| id | check_id | check_date | eligibility_status | study_id | study_program_code | study_program_name |
|---|---|---|---|---|---|---|
| 1 | 611510 | 2025-08-21T07:57:00 | Eligible | 100 | 191 | Extended Review |
| 2 | 974935 | 2022-01-05T14:14:00 | Ineligible | 101 | 1186082 | Pilot Initiative A |
| 3 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | PendingReview | 102 | 3990187 | Baseline Model |
| 4 | b_VB-EC-12 | 2024-11-27T04:48:00 | Eligible | 103 | flexible-thinking | Distributed Cluster |

The view `v_graduation_eligibility_check_program_of_study` joins `graduation_eligibility_checks` to `program_of_studies` on `graduation_eligibility_checks.program_of_study_id = program_of_studies.id`. It answers: "What are the eligibility outcomes for students within each program?" The first row would show check 1 (status `Eligible`) for program 100 (`Extended Review`, `Ministry` approval). This view supports program-level graduation rate analysis.

**View `v_graduation_eligibility_check_parchment`**

```sql
CREATE VIEW v_graduation_eligibility_check_parchment AS
SELECT a.id, a.check_id, a.check_date, a.eligibility_status, b.parchment_id AS parchment_parchment_id, b.issue_date AS parchment_issue_date, b.graduate_name AS parchment_graduate_name
FROM graduation_eligibility_checks a JOIN parchments b ON a.parchment_id = b.parchment_id;
```

| id | check_id | check_date | eligibility_status | parchment_parchment_id | parchment_issue_date | parchment_graduate_name |
|---|---|---|---|---|---|---|
| 1 | 611510 | 2025-08-21T07:57:00 | Eligible | 1 | 2023-02-01T13:51:00 | Distributed Review |
| 2 | 974935 | 2022-01-05T14:14:00 | Ineligible | 2 | 2024-07-12T20:08:00 | Adaptive Initiative D |
| 3 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | PendingReview | 3 | 2025-12-23T03:25:00 | Primary Model |
| 4 | b_VB-EC-12 | 2024-11-27T04:48:00 | Eligible | 4 | 2022-05-07T10:42:00 | Composite Cluster |

The view `v_graduation_eligibility_check_parchment` joins `graduation_eligibility_checks` to `parchments` on `graduation_eligibility_checks.parchment_id = parchments.parchment_id`. It answers: "Which parchment is associated with which eligibility check, and what was the check outcome?" The first row would show check 1 (status `Eligible`) for parchment 1 (issued `2023-02-01`, graduate name `Distributed Review`). This view supports parchment issuance governance.

**View `v_exception_record_student`**

```sql
CREATE VIEW v_exception_record_student AS
SELECT a.id, a.exception_id, a.exception_date, a.nature_of_exception, b.student_id AS student_student_id, b.full_name AS student_full_name, b.enrollment_status AS student_enrollment_status
FROM exception_records a JOIN students b ON a.student_id = b.student_id;
```

| id | exception_id | exception_date | nature_of_exception | student_student_id | student_full_name | student_enrollment_status |
|---|---|---|---|---|---|---|
| 1 | 2087741 | 2024-07-03T18:30:00 | regional-nature-24 | 1 | Theodore Mcgrath | Active |
| 2 | 974938 | 2025-12-14T01:47:00 | legacy-nature-25 | 2 | Account Name | Graduated |
| 3 | 7731874 | 2022-05-25T08:04:00 | compact-nature-26 | 3 | Saipan International Airport | Withdrawn |
| 4 | 8843762 | 2023-10-09T15:21:00 | composite-nature-27 | 4 | Norma Fisher | Auditing |

The view `v_exception_record_student` joins `exception_records` to `students` on `exception_records.student_id = students.student_id`. It answers: "What exceptions have been recorded for each student?" The first row would show exception 1 (exception_id `2087741`, nature `regional-nature-24`, status `Approved`, risk `Regional Corridor`) for student 1 (Theodore Mcgrath). This view supports exception tracking and audit trails.

**View `v_exception_record_program_of_study`**

```sql
CREATE VIEW v_exception_record_program_of_study AS
SELECT a.id, a.exception_id, a.exception_date, a.nature_of_exception, b.id AS study_id, b.program_code AS study_program_code, b.program_name AS study_program_name
FROM exception_records a JOIN program_of_studies b ON a.program_of_study_id = b.id;
```

| id | exception_id | exception_date | nature_of_exception | study_id | study_program_code | study_program_name |
|---|---|---|---|---|---|---|
| 1 | 2087741 | 2024-07-03T18:30:00 | regional-nature-24 | 100 | 191 | Extended Review |
| 2 | 974938 | 2025-12-14T01:47:00 | legacy-nature-25 | 101 | 1186082 | Pilot Initiative A |
| 3 | 7731874 | 2022-05-25T08:04:00 | compact-nature-26 | 102 | 3990187 | Baseline Model |
| 4 | 8843762 | 2023-10-09T15:21:00 | composite-nature-27 | 103 | flexible-thinking | Distributed Cluster |

The view `v_exception_record_program_of_study` joins `exception_records` to `program_of_studies` on `exception_records.program_of_study_id = program_of_studies.id`. It answers: "What exceptions have been recorded for each program of study?" The first row would show exception 1 (status `Approved`, nature `regional-nature-24`) for program 100 (`Extended Review`, `Ministry` approval). This view supports program-level exception analytics.

The schema design follows a disciplined normalisation strategy. Core entities—students, programs of study, credentials, and parchments—are stored in their own tables with surrogate primary keys. Foreign keys in `credentials`, `parchments`, `graduation_eligibility_checks`, and `exception_records` create referential integrity back to these entities. The junction tables `students_studies` and `studies_credentials` resolve many-to-many relationships without introducing redundancy. The view layer then denormalises these tables on demand, answering specific analytical questions by joining the relevant entities. For instance, `v_graduation_eligibility_check_student` joins the eligibility check table to the students table, producing a flat result that shows each student's eligibility status alongside their personal details. This separation of concerns—normalised storage for data integrity, denormalised views for analytical clarity—is a hallmark of well-designed academic information systems. The domain model faithfully captures the ontology of student-program-credential relationships, with administrative checks and exceptions providing the governance layer that ensures graduation decisions are auditable and policy-compliant.