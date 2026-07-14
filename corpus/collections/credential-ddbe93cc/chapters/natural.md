## The Architecture of Academic Credentialing

Educational institutions manage a complex lifecycle of student progression, from initial enrollment through program completion and credential issuance. At the heart of this lifecycle lies a structured system of records that track who the students are, what programs they pursue, whether they meet graduation requirements, and how exceptions are handled when standard rules do not apply. The domain revolves around four core entities—students, programs of study, credentials, and parchments—supplemented by eligibility checks and exception records that capture the nuanced decisions made along the way. Understanding how these records interlock is essential for anyone auditing academic outcomes, managing compliance, or designing reporting systems.

## Core Records: Students and Programs

The foundation of the system begins with the student roster and the catalog of available programs. Each student carries a unique identifier, a full name, an enrollment status, and a set of academic and financial indicators that determine their standing.

**Table `students`**

| student_id | full_name | enrollment_status | start_date | residency_percentage | financial_obligations_met | ggpa | credential_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Active | 2022-09-05 | 6.70 | true | 10.95 | 1 |
| 2 | Account Name | Graduated | 2023-02-16 | 11.40 | false | 14.90 | 2 |
| 3 | Saipan International Airport | Withdrawn | 2024-07-27 | 16.10 | true | 18.85 | 3 |
| 4 | Norma Fisher | Auditing | 2025-12-11 | 20.80 | false | 22.80 | 4 |

The `students` table captures the essential profile of each learner. Theodore Mcgrath (student 1) is currently active, having enrolled on 2022-09-05, with a residency percentage of 6.70 and a GGPA of 10.95. His financial obligations are marked as met. Account Name (student 2) has graduated, enrolled on 2023-02-16, carries a residency percentage of 11.40, and notably has unmet financial obligations. Saipan International Airport (student 3) is in a withdrawn state, enrolled on 2024-07-27, with a residency percentage of 16.10 and a GGPA of 18.85. Norma Fisher (student 4) is auditing, enrolled on 2025-12-11, with a residency percentage of 20.80 and unmet financial obligations. Each student is also linked to a credential through the `credential_id` column, establishing the first bridge between the learner and their academic output.

**Table `program_of_studies`**

| id | program_code | program_name | approval_authority | standard_length | completion_deadline_multiplier | is_apprentice_program | current_version |
|---|---|---|---|---|---|---|---|
| 100 | 191 | Extended Review | Ministry | 22 | 15.45 | true | baseline-current-91 |
| 101 | 1186082 | Pilot Initiative A | Board | 31 | 19.90 | false | pilot-current-92 |
| 102 | 3990187 | Baseline Model | Ministry | 40 | 24.35 | true | extended-current-93 |
| 103 | flexible-thinking | Distributed Cluster | Board | 49 | 28.80 | false | integrated-current-94 |

Programs of study are catalogued independently of individual students. Each program has a code, a name, an approval authority (either Ministry or Board), a standard length measured in some unit of time, a completion deadline multiplier, and a flag indicating whether it is an apprentice program. Program 100, coded 191 and named Extended Review, is approved by the Ministry, has a standard length of 22, a completion deadline multiplier of 15.45, and is designated as an apprentice program. Program 101, coded 1186082 and named Pilot Initiative A, is Board-approved, has a standard length of 31, a multiplier of 19.90, and is not an apprentice program. Program 102, coded 3990187 and named Baseline Model, is Ministry-approved with a standard length of 40, a multiplier of 24.35, and is an apprentice program. Program 103, coded flexible-thinking and named Distributed Cluster, is Board-approved with a standard length of 49, a multiplier of 28.80, and is not an apprentice program. Each program also carries a current version identifier, such as baseline-current-91 or pilot-current-92, which tracks the active iteration of the curriculum.

## Credentials and Parchments

Once a student completes a program, the institution issues a credential and a corresponding parchment. These two records serve distinct purposes: the credential records the formal award, while the parchment records the physical or digital document delivered to the graduate.

**Table `credentials`**

| credential_id | credential_type | program_name | issuing_institution | issue_date | status | honours_notation | student_id | program_of_study_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Degree | Extended Review | distributed-issuing-96 | 2023-02-01T13:51:00 | Issued | true | 1 | 100 |
| 2 | Diploma | Pilot Initiative A | baseline-issuing-97 | 2024-07-12T20:08:00 | Revoked | false | 2 | 101 |
| 3 | Certificate | Baseline Model | pilot-issuing-98 | 2025-12-23T03:25:00 | Pending | true | 3 | 102 |
| 4 | Degree | Distributed Cluster | extended-issuing-99 | 2022-05-07T10:42:00 | Issued | false | 4 | 103 |

The `credentials` table stores the award itself. Credential 1 is a Degree of type Extended Review, issued by distributed-issuing-96 on 2023-02-01, with status Issued and honours_notation set to true. It is associated with student 1 and program 100. Credential 2 is a Diploma of type Pilot Initiative A, issued by baseline-issuing-97 on 2024-07-12, with status Revoked and honours_notation false, linked to student 2 and program 101. Credential 3 is a Certificate of type Baseline Model, issued by pilot-issuing-98 on 2025-12-23, with status Pending and honours_notation true, linked to student 3 and program 102. Credential 4 is a Degree of type Distributed Cluster, issued by extended-issuing-99 on 2022-05-07, with status Issued and honours_notation false, linked to student 4 and program 103. The issuing institution, issue date, and status fields together form the authoritative record of what was awarded and when.

**Table `parchments`**

| parchment_id | issue_date | graduate_name | program_name_at_graduation | honours_notation | is_reissued | revocation_reason | student_id | credential_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-01T13:51:00 | Distributed Review | distributed-program-78 | true | false | legacy-revocati-49 | 1 | 1 |
| 2 | 2024-07-12T20:08:00 | Adaptive Initiative D | baseline-program-79 | false | true | compact-revocati-50 | 2 | 2 |
| 3 | 2025-12-23T03:25:00 | Primary Model | pilot-program-80 | true | false | composite-revocati-51 | 3 | 3 |
| 4 | 2022-05-07T10:42:00 | Composite Cluster | extended-program-81 | false | true | primary-revocati-52 | 4 | 4 |

The `parchments` table records the document issued to the graduate. Parchment 1 was issued on 2023-02-01 to Distributed Review for the distributed-program-78 program, with honours_notation true, not reissued, and a revocation reason of legacy-revocati-49. It is tied to student 1 and credential 1. Parchment 2 was issued on 2024-07-12 to Adaptive Initiative D for the baseline-program-79 program, with honours_notation false, marked as reissued, and a revocation reason of compact-revocati-50, linked to student 2 and credential 2. Parchment 3 was issued on 2025-12-23 to Primary Model for the pilot-program-80 program, with honours_notation true, not reissued, and a revocation reason of composite-revocati-51, linked to student 3 and credential 3. Parchment 4 was issued on 2022-05-07 to Composite Cluster for the extended-program-81 program, with honours_notation false, marked as reissued, and a revocation reason of primary-revocati-52, linked to student 4 and credential 4. The is_reissued flag and revocation_reason fields capture the document's lifecycle state, including whether it was replaced or invalidated.

## Eligibility and Exceptions

Before a credential can be formally issued, the institution runs a graduation eligibility check against a set of criteria. When a student does not meet one or more criteria, an exception record may be filed to document the deviation and its approval status.

**Table `graduation_eligibility_checks`**

| id | check_id | check_date | eligibility_status | ggpa_met | residency_met | financial_obligations_met | completion_deadline_met | student_id | program_of_study_id | parchment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 611510 | 2025-08-21T07:57:00 | Eligible | true | true | true | false | 1 | 100 | 1 |
| 2 | 974935 | 2022-01-05T14:14:00 | Ineligible | false | false | false | true | 2 | 101 | 2 |
| 3 | 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-16T21:31:00 | PendingReview | true | true | true | false | 3 | 102 | 3 |
| 4 | b_VB-EC-12 | 2024-11-27T04:48:00 | Eligible | false | false | false | true | 4 | 103 | 4 |

The `graduation_eligibility_checks` table records the outcome of each eligibility assessment. Check 611510, dated 2025-08-21, found student 1 in program 100 to be Eligible: the GGPA was met, residency was met, financial obligations were met, but the completion deadline was not met. Check 974935, dated 2022-01-05, found student 2 in program 101 to be Ineligible: none of the four criteria were met. Check 9fff03be-9bac-11eb-a8a2-19ed5c03f8d3, dated 2023-06-16, found student 3 in program 102 in PendingReview status: GGPA, residency, and financial obligations were met, but the completion deadline was not. Check b_VB-EC-12, dated 2024-11-27, found student 4 in program 103 to be Eligible despite none of the four criteria being met—a result that suggests an overriding decision or exception. Each check is linked to a specific student, program, and parchment, anchoring the eligibility decision to the relevant records.

**Table `exception_records`**

| id | exception_id | exception_date | nature_of_exception | alignment_confirmation | risk_description | approval_status | student_id | program_of_study_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087741 | 2024-07-03T18:30:00 | regional-nature-24 | true | Regional Corridor | Approved | 1 | 100 |
| 2 | 974938 | 2025-12-14T01:47:00 | legacy-nature-25 | false | Seasonal Series D | Pending | 2 | 101 |
| 3 | 7731874 | 2022-05-25T08:04:00 | compact-nature-26 | true | Integrated Assessment | Rejected | 3 | 102 |
| 4 | 8843762 | 2023-10-09T15:21:00 | composite-nature-27 | false | Extended Survey | Approved | 4 | 103 |

The `exception_records` table captures formal deviations from standard requirements. Exception 2087741, dated 2024-07-03, concerns student 1 in program 100, with a nature of regional-nature-24, an alignment confirmation of true, a risk description of Regional Corridor, and an approval status of Approved. Exception 974938, dated 2025-12-14, concerns student 2 in program 101, with a nature of legacy-nature-25, an alignment confirmation of false, a risk description of Seasonal Series D, and a status of Pending. Exception 7731874, dated 2022-05-25, concerns student 3 in program 102, with a nature of compact-nature-26, an alignment confirmation of true, a risk description of Integrated Assessment, and a status of Rejected. Exception 8843762, dated 2023-10-09, concerns student 4 in program 103, with a nature of composite-nature-27, an alignment confirmation of false, a risk description of Extended Survey, and a status of Approved. The alignment_confirmation field indicates whether the exception aligns with broader policy, while the approval_status records the final administrative decision.

## Linking Tables: Students, Studies, and Credentials

The domain includes two linking tables that mediate the many-to-many relationships between students, studies, and credentials. These tables ensure that the system can track complex enrollment patterns where a student may participate in multiple studies and a study may produce multiple credentials.

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

The `students_studies` table records which students are enrolled in which studies, forming the enrollment backbone of the system.

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

The `studies_credentials` table records which credentials are produced by which studies, forming the output backbone. Together, these two tables create a chain: a student participates in a study, and that study produces a credential. This chain allows the institution to trace outcomes back through the study layer rather than relying solely on direct student-to-credential links.

## View-Based Reporting

The system provides a set of views that join the base tables into readable reports. Each view answers a specific operational question by combining records from multiple tables.

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

The `v_credential_student` view joins credentials with their associated students, answering the question of which student holds which credential and in what status. Reading the first row, Theodore Mcgrath holds credential 1, a Degree of type Extended Review issued by distributed-issuing-96 on 2023-02-01 with status Issued and honours_notation true. The second row shows Account Name holding credential 2, a Diploma of type Pilot Initiative A issued by baseline-issuing-97 on 2024-07-12 with status Revoked and honours_notation false. This view is the primary reference for verifying credential ownership and status.

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

The `v_credential_program_of_study` view joins credentials with their associated programs of study, answering the question of which program produced which credential. The first row links credential 1 (Degree, Extended Review) to program 100 (code 191, Extended Review, Ministry-approved, standard length 22, apprentice program). The second row links credential 2 (Diploma, Pilot Initiative A) to program 101 (code 1186082, Pilot Initiative A, Board-approved, standard length 31, non-apprentice). This view is essential for auditing the alignment between credential types and program structures.

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

The `v_student_program_of_study_detail` view joins students with their programs of study, answering the question of which student is enrolled in which program and what the program's parameters are. The first row shows Theodore Mcgrath enrolled in program 100 (Extended Review, Ministry, standard length 22, multiplier 15.45, apprentice). The second row shows Account Name enrolled in program 101 (Pilot Initiative A, Board, standard length 31, multiplier 19.90, non-apprentice). This view supports enrollment audits and program-level reporting.

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

The `v_student_credential` view joins students directly with their credentials, answering the question of which student holds which credential with full credential details. The first row shows Theodore Mcgrath holding credential 1 (Degree, Extended Review, distributed-issuing-96, issued 2023-02-01, Issued, honours true). The second row shows Account Name holding credential 2 (Diploma, Pilot Initiative A, baseline-issuing-97, issued 2024-07-12, Revoked, honours false). This view is the most direct reference for credential verification.

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

The `v_program_of_study_credential_detail` view joins programs of study with their credentials, answering the question of which programs have produced which credentials. The first row links program 100 (Extended Review, Ministry, standard length 22, apprentice) to credential 1 (Degree, Extended Review, distributed-issuing-96, issued 2023-02-01, Issued). The second row links program 101 (Pilot Initiative A, Board, standard length 31, non-apprentice) to credential 2 (Diploma, Pilot Initiative A, baseline-issuing-97, issued 2024-07-12, Revoked). This view supports program-level outcome analysis.

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

The `v_parchment_student` view joins parchments with their associated students, answering the question of which student received which parchment and under what conditions. The first row shows Theodore Mcgrath receiving parchment 1 (issued 2023-02-01, Distributed Review, distributed-program-78, honours true, not reissued, revocation reason legacy-revocati-49). The second row shows Account Name receiving parchment 2 (issued 2024-07-12, Adaptive Initiative D, baseline-program-79, honours false, reissued, revocation reason compact-revocati-50). This view is critical for document tracking and revocation audits.

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

The `v_parchment_credential` view joins parchments with their associated credentials, answering the question of which parchment corresponds to which credential. The first row links parchment 1 (Distributed Review, distributed-program-78, honours true, not reissued) to credential 1 (Degree, Extended Review, distributed-issuing-96, issued 2023-02-01, Issued). The second row links parchment 2 (Adaptive Initiative D, baseline-program-79, honours false, reissued) to credential 2 (Diploma, Pilot Initiative A, baseline-issuing-97, issued 2024-07-12, Revoked). This view is essential for reconciling document issuance with credential status.

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

The `v_graduation_eligibility_check_student` view joins eligibility checks with their associated students, answering the question of which student passed which eligibility check and what the results were. The first row shows student 1 (Theodore Mcgrath) passing check 611510 on 2025-08-21 with status Eligible, meeting GGPA, residency, and financial obligations but not the completion deadline. The second row shows student 2 (Account Name) failing check 974935 on 2022-01-05 with status Ineligible, meeting none of the four criteria. This view supports student-level eligibility tracking.

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

The `v_graduation_eligibility_check_program_of_study` view joins eligibility checks with their associated programs of study, answering the question of which programs have produced which eligibility outcomes. The first row links check 611510 (Eligible) to program 100 (Extended Review, Ministry, standard length 22, apprentice). The second row links check 974935 (Ineligible) to program 101 (Pilot Initiative A, Board, standard length 31, non-apprentice). This view supports program-level compliance analysis.

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

The `v_graduation_eligibility_check_parchment` view joins eligibility checks with their associated parchments, answering the question of which parchment issuance was preceded by which eligibility outcome. The first row links check 611510 (Eligible) to parchment 1 (Distributed Review, issued 2023-02-01, honours true). The second row links check 974935 (Ineligible) to parchment 2 (Adaptive Initiative D, issued 2024-07-12, honours false). This view is critical for ensuring that only eligible students receive parchments.

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

The `v_exception_record_student` view joins exception records with their associated students, answering the question of which students have filed exceptions and what the outcomes were. The first row shows student 1 with exception 2087741 (regional-nature-24, alignment confirmed, risk: Regional Corridor, Approved). The second row shows student 2 with exception 974938 (legacy-nature-25, alignment not confirmed, risk: Seasonal Series D, Pending). This view supports exception tracking and approval workflow monitoring.

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

The `v_exception_record_program_of_study` view joins exception records with their associated programs of study, answering the question of which programs have generated exceptions and what the nature of those exceptions is. The first row links exception 2087741 (Approved, regional-nature-24) to program 100 (Extended Review, Ministry, standard length 22, apprentice). The second row links exception 974938 (Pending, legacy-nature-25) to program 101 (Pilot Initiative A, Board, standard length 31, non-apprentice). This view supports program-level exception analysis and risk assessment.

## Synthesis

The domain of academic credentialing is built on a network of interlocking records that track students through their programs, assess their eligibility for graduation, issue credentials and parchments, and document any exceptions to standard rules. The base tables capture the raw facts: who the students are, what programs exist, what credentials and parchments have been issued, what eligibility checks have been run, and what exceptions have been filed. The linking tables mediate the relationships between students, studies, and credentials, enabling complex enrollment and outcome patterns. The views combine these records into readable reports that answer specific operational questions—verifying credential ownership, auditing program outcomes, tracking eligibility, and monitoring exceptions. Together, these records form a coherent system for managing the full lifecycle of academic achievement, from enrollment through graduation and beyond.