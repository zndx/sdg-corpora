The admissions pipeline for a primary-school programme is a multi-stage evaluation process. A student submits an `AdmissionApplication` that carries a `status` such as `pending`, `under_review`, `admitted`, or `waiting_list`, along with a `totalScore` and a `rank`. The application is anchored to a `Student` record, an `AcademicRecord` summarising term-level performance, an `InterviewScore` capturing the panel's assessment, and a set of `ActivityEvidence` entries documenting extracurricular achievements. Each of these entities is normalised into its own base table, and a collection of materialised views re-assembles the fragments into domain-level facts. The following chapter explains the modelling decisions, the normalised schema, and how every view reconstructs a coherent picture from the underlying tables.

**Table `AdmissionApplication`**

| applicationId | academicYear | submissionDate | status | totalScore | rank | interviewDate | interviewResult | studentId | recordId | scoreId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | pending | 16.45 | 16 | 2025-08-23T19:57:00 | passed | 100 | 10449530 | 100 |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | under_review | 19.90 | 20 | 2022-01-07T02:14:00 | failed | 101 | 10445619 | 101 |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | admitted | 23.35 | 24 | 2023-06-18T09:31:00 | pending | 102 | 9568457 | 102 |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | waiting_list | 26.80 | 28 | 2024-11-02T16:48:00 | passed | 103 | 20743593 | 103 |

The `AdmissionApplication` table is the central fact table of the pipeline. Its primary key, `applicationId`, is an auto-incrementing integer that uniquely identifies each submission. The `academicYear` column stores a string identifier for the intake cycle — values such as `legacy-academic-43` or `compact-academic-44` — while `submissionDate` and `interviewDate` are ISO-8601 timestamps that record when the application was filed and when the interview was scheduled. The `status` column is an enumerated state machine with values `pending`, `under_review`, `admitted`, and `waiting_list`. The `totalScore` and `rank` columns capture the composite evaluation metric and the applicant's standing within the cohort. The `interviewResult` column records the panel's verdict as `passed`, `failed`, or `pending`. Three foreign keys — `studentId`, `recordId`, and `scoreId` — link the application to the `Student`, `AcademicRecord`, and `InterviewScore` tables respectively, enforcing referential integrity between the application and its constituent evaluation artefacts.

**Table `Student`**

| id | studentId | fullName | dateOfBirth | currentGradeLevel | schoolNumber | documentId |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | 2025-04-02 | P.5 | SCH-2281 | 100 |
| 101 | 25388256 | Account Name | 2022-09-13 | P.6 | SCH-2284 | 101 |
| 102 | id_16 | Saipan International Airport | 2023-02-24 | P.5 | SCH-2287 | 102 |
| 103 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | P.6 | SCH-2290 | 103 |

The `Student` table stores the applicant's demographic and institutional identity. Its surrogate primary key `id` is an integer that coincides with the `studentId` foreign key in `AdmissionApplication`, creating a one-to-one correspondence between a student record and an application row. The `fullName` column holds the applicant's name — for example, `Theodore Mcgrath` or `Norma Fisher` — while `dateOfBirth` and `currentGradeLevel` (values such as `P.5` or `P.6`) capture age and year-group information. The `schoolNumber` column, with values like `SCH-2281`, identifies the applicant's current school. A foreign key `documentId` points to the `IdentityDocument` table, establishing a one-to-one relationship between a student and their identity documentation.

**Table `AcademicRecord`**

| recordId | gradeLevel | term | conductScore | academicScore | overallWeightedScore | applicationId |
|---|---|---|---|---|---|---|
| 10449530 | P.5 | first_term | 12.70 | 19.70 | 19.70 | 1 |
| 10445619 | P.6 | full_year | 14.40 | 24.40 | 24.40 | 2 |
| 9568457 | P.5 | first_term | 16.10 | 29.10 | 29.10 | 3 |
| 20743593 | P.6 | full_year | 17.80 | 33.80 | 33.80 | 4 |

The `AcademicRecord` table aggregates a student's scholastic performance for a given term. Its primary key `recordId` is a large integer — for instance, `10449530` — that is referenced by `AdmissionApplication.recordId`. The `gradeLevel` and `term` columns describe the academic period, with `term` taking values such as `first_term` or `full_year`. The `conductScore`, `academicScore`, and `overallWeightedScore` columns store numeric evaluations of the student's behaviour, subject performance, and a composite weighted metric. The foreign key `applicationId` links each academic record back to its parent `AdmissionApplication`, ensuring that every record belongs to exactly one application.

**Table `SubjectGrade`**

| id | subjectName | grade | score | term | recordId |
|---|---|---|---|---|---|
| 1 | Chinese | A+ | 31 | P.5 | 10449530 |
| 2 | English | A | 37 | P.6_first_term | 10445619 |
| 3 | Maths | A- | 43 | P.5 | 9568457 |
| 4 | Chinese | B+ | 49 | P.6_first_term | 20743593 |

The `SubjectGrade` table decomposes the `AcademicRecord` into individual subject-level results. Its primary key `id` is an auto-incrementing integer, while `subjectName` stores the discipline — `Chinese`, `English`, or `Maths` — and `grade` holds the letter-grade classification such as `A+`, `A`, `A-`, or `B+`. The `score` column records a numeric score (e.g., `31`, `37`, `43`, `49`), and `term` captures the grading period. The foreign key `recordId` references `AcademicRecord.recordId`, creating a one-to-many relationship: a single academic record can contain multiple subject grades.

**Table `InterviewScore`**

| scoreId | appearanceAndPoliteness | manner | totalInterviewScore | weighting | applicationId |
|---|---|---|---|---|---|
| 100 | 22 | 17 | 17.20 | 6.45 | 1 |
| 101 | 32 | 25 | 20.40 | 8.90 | 2 |
| 102 | 42 | 33 | 23.60 | 11.35 | 3 |
| 103 | 52 | 41 | 26.80 | 13.80 | 4 |

The `InterviewScore` table captures the structured evaluation from the admissions panel interview. Its primary key `scoreId` is an integer that matches the `scoreId` foreign key in `AdmissionApplication`. The `appearanceAndPoliteness` and `manner` columns store numeric sub-scores for the interviewee's presentation and conduct, while `totalInterviewScore` and `weighting` hold the composite interview score and its contribution weight to the overall application total. The foreign key `applicationId` links each interview score to its parent application, enforcing a one-to-one relationship.

**Table `ActivityEvidence`**

| evidenceId | activityName | activityType | achievementLevel | awardedScore | isTopFive | applicationId |
|---|---|---|---|---|---|---|
| 1 | Composite Programme | in_school | championship | 17 | false | 1 |
| 2 | Compact Standard A | out_of_school | first_runner_up | 21 | true | 2 |
| 3 | Legacy Framework | in_school | second_runner_up | 25 | false | 3 |
| 4 | Regional Protocol | out_of_school | excellent | 29 | true | 4 |

The `ActivityEvidence` table documents the applicant's extracurricular achievements. Its primary key `evidenceId` is an auto-incrementing integer. The `activityName` column stores the programme or event name — for example, `Composite Programme`, `Compact Standard A`, `Legacy Framework`, or `Regional Protocol`. The `activityType` column classifies the activity as `in_school` or `out_of_school`, while `achievementLevel` records the competitive standing with values such as `championship`, `first_runner_up`, `second_runner_up`, or `excellent`. The `awardedScore` column holds a numeric score (e.g., `17`, `21`, `25`, `29`), and `isTopFive` is a boolean flag indicating whether the achievement places the applicant in the top five. The foreign key `applicationId` links each activity evidence entry to its parent application, supporting a one-to-many relationship where a single application can have multiple activity entries.

**Table `IdentityDocument`**

| id | documentId | documentType | issueDate | expiryDate | verificationStatus | studentId |
|---|---|---|---|---|---|---|
| 100 | IVC10I | ID_card | 2023-02-01 | 2023-10-24 | verified | 100 |
| 101 | 605943 | birth_certificate | 2024-07-12 | 2024-03-08 | pending | 101 |
| 102 | 10449525 | ID_card | 2025-12-23 | 2025-08-19 | rejected | 102 |
| 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | birth_certificate | 2022-05-07 | 2022-01-03 | verified | 103 |

The `IdentityDocument` table stores the applicant's identity documentation. Its primary key `documentId` is an integer referenced by `Student.documentId`. The table captures the document type, issuing authority, document number, and expiry date, providing a one-to-one linkage between a student and their verified identity record.

**Table `AdmissionApplicationActivityEvidence`**

| applicationId | evidenceId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `AdmissionApplicationActivityEvidence` table is a junction table that resolves the many-to-many relationship between `AdmissionApplication` and `ActivityEvidence`. It contains foreign keys `applicationId` and `evidenceId`, allowing a single application to be associated with multiple activity evidence entries and, in principle, allowing an activity evidence entry to be referenced by multiple applications. This normalisation avoids data duplication and supports flexible evidence attribution.

**Table `StudentAdmissionApplication`**

| studentId | applicationId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `StudentAdmissionApplication` table is a junction table that resolves the many-to-many relationship between `Student` and `AdmissionApplication`. It contains foreign keys `studentId` and `applicationId`, enabling a single student to submit multiple applications across different academic years or programmes, and supporting the tracking of application history per student.

**Table `AcademicRecordSubjectGrade`**

| recordId | gradeId |
|---|---|
| 10449530 | 1 |
| 10449530 | 2 |
| 10445619 | 2 |
| 10445619 | 3 |
| 9568457 | 3 |
| 9568457 | 4 |
| 20743593 | 4 |
| 20743593 | 1 |

The `AcademicRecordSubjectGrade` table is a junction table that resolves the many-to-many relationship between `AcademicRecord` and `SubjectGrade`. It contains foreign keys `recordId` and `subjectGradeId`, providing an explicit linkage layer between academic records and their constituent subject grades. While the `SubjectGrade` table already carries a `recordId` foreign key, this junction table offers an additional normalisation layer that can support audit trails, versioning, or multi-tenant record associations.

The base tables above form a star-like schema centred on `AdmissionApplication`, with satellite tables for `Student`, `AcademicRecord`, `InterviewScore`, and `ActivityEvidence`, and junction tables for resolving many-to-many relationships. The following views materialise the most common join patterns, each answering a specific domain question by reconstructing a coherent fact from the normalised tables.

**View `v_admission_application_student`**

```sql
CREATE VIEW v_admission_application_student AS
SELECT a.applicationId, a.academicYear, a.submissionDate, a.status, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM AdmissionApplication a JOIN Student b ON a.studentId = b.id;
```

| applicationId | academicYear | submissionDate | status | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | pending | 100 | 392507 | Theodore Mcgrath |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | under_review | 101 | 25388256 | Account Name |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | admitted | 102 | id_16 | Saipan International Airport |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | waiting_list | 103 | gd_taxc_2211 | Norma Fisher |

The view `v_admission_application_student` joins `AdmissionApplication` with `Student` on the `studentId` foreign key, producing a single row per application that combines the applicant's evaluation metrics with their demographic profile. For example, the row for `applicationId` 1 shows `Theodore Mcgrath` (student `392507`) in grade `P.5` at school `SCH-2281`, with an application `status` of `pending`, a `totalScore` of `16.45`, and a `rank` of `16`. This view answers the question: "What is the full profile of each applicant, combining their scores with their personal and school information?"

**View `v_admission_application_academic_record`**

```sql
CREATE VIEW v_admission_application_academic_record AS
SELECT a.applicationId, a.academicYear, a.submissionDate, a.status, b.recordId AS record_recordId, b.gradeLevel AS record_gradeLevel, b.term AS record_term
FROM AdmissionApplication a JOIN AcademicRecord b ON a.recordId = b.recordId;
```

| applicationId | academicYear | submissionDate | status | record_recordId | record_gradeLevel | record_term |
|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | pending | 10449530 | P.5 | first_term |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | under_review | 10445619 | P.6 | full_year |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | admitted | 9568457 | P.5 | first_term |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | waiting_list | 20743593 | P.6 | full_year |

The view `v_admission_application_academic_record` joins `AdmissionApplication` with `AcademicRecord` on the `recordId` foreign key, producing a row that pairs each application with its corresponding academic performance summary. For `applicationId` 3, the view shows the applicant with `recordId` `9568457` in grade `P.5` during the `first_term`, with a `conductScore` of `16.10`, an `academicScore` of `29.10`, and an `overallWeightedScore` of `29.10`. This view answers: "How did each applicant perform academically in the term associated with their application?"

**View `v_admission_application_interview_score`**

```sql
CREATE VIEW v_admission_application_interview_score AS
SELECT a.applicationId, a.academicYear, a.submissionDate, a.status, b.scoreId AS score_scoreId, b.appearanceAndPoliteness AS score_appearanceAndPoliteness, b.manner AS score_manner
FROM AdmissionApplication a JOIN InterviewScore b ON a.scoreId = b.scoreId;
```

| applicationId | academicYear | submissionDate | status | score_scoreId | score_appearanceAndPoliteness | score_manner |
|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | pending | 100 | 22 | 17 |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | under_review | 101 | 32 | 25 |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | admitted | 102 | 42 | 33 |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | waiting_list | 103 | 52 | 41 |

The view `v_admission_application_interview_score` joins `AdmissionApplication` with `InterviewScore` on the `scoreId` foreign key, producing a row that combines the application-level status with the detailed interview evaluation. For `applicationId` 2, the view shows an `interviewResult` of `failed`, a `totalInterviewScore` of `20.40`, with sub-scores of `32` for `appearanceAndPoliteness` and `25` for `manner`, and a `weighting` of `8.90`. This view answers: "What was the panel's detailed assessment for each applicant, and how does it relate to the application's outcome?"

**View `v_admission_application_activity_evidence_detail`**

```sql
CREATE VIEW v_admission_application_activity_evidence_detail AS
SELECT a.applicationId, a.academicYear, a.submissionDate, b.evidenceId AS evidence_evidenceId, b.activityName AS evidence_activityName, b.activityType AS evidence_activityType
FROM AdmissionApplication a
  JOIN AdmissionApplicationActivityEvidence j ON j.applicationId = a.applicationId
  JOIN ActivityEvidence b ON b.evidenceId = j.evidenceId;
```

| applicationId | academicYear | submissionDate | evidence_evidenceId | evidence_activityName | evidence_activityType |
|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | 1 | Composite Programme | in_school |
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | 2 | Compact Standard A | out_of_school |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | 2 | Compact Standard A | out_of_school |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | 3 | Legacy Framework | in_school |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | 3 | Legacy Framework | in_school |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | 4 | Regional Protocol | out_of_school |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | 4 | Regional Protocol | out_of_school |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | 1 | Composite Programme | in_school |

The view `v_admission_application_activity_evidence_detail` joins `AdmissionApplication` with `ActivityEvidence` on the `applicationId` foreign key, producing one row per activity evidence entry per application. For `applicationId` 4, the view shows the activity `Regional Protocol` of type `out_of_school` with an `achievementLevel` of `excellent`, an `awardedScore` of `29`, and `isTopFive` set to `true`. This view answers: "What extracurricular achievements did each applicant submit, and how do they contribute to the application's evaluation?"

**View `v_student_admission_application_detail`**

```sql
CREATE VIEW v_student_admission_application_detail AS
SELECT a.id, a.studentId, a.fullName, b.applicationId AS application_applicationId, b.academicYear AS application_academicYear, b.submissionDate AS application_submissionDate
FROM Student a
  JOIN StudentAdmissionApplication j ON j.studentId = a.id
  JOIN AdmissionApplication b ON b.applicationId = j.applicationId;
```

| id | studentId | fullName | application_applicationId | application_academicYear | application_submissionDate |
|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | 1 | legacy-academic-43 | 2025-04-24T03:57:00 |
| 100 | 392507 | Theodore Mcgrath | 2 | compact-academic-44 | 2022-09-08T10:14:00 |
| 101 | 25388256 | Account Name | 2 | compact-academic-44 | 2022-09-08T10:14:00 |
| 101 | 25388256 | Account Name | 3 | composite-academic-45 | 2023-02-19T17:31:00 |
| 102 | id_16 | Saipan International Airport | 3 | composite-academic-45 | 2023-02-19T17:31:00 |
| 102 | id_16 | Saipan International Airport | 4 | primary-academic-46 | 2024-07-03T00:48:00 |
| 103 | gd_taxc_2211 | Norma Fisher | 4 | primary-academic-46 | 2024-07-03T00:48:00 |
| 103 | gd_taxc_2211 | Norma Fisher | 1 | legacy-academic-43 | 2025-04-24T03:57:00 |

The view `v_student_admission_application_detail` joins `Student` with `AdmissionApplication` on the `studentId` foreign key, producing a row that combines the student's personal information with their application-level metrics. For `studentId` 101, the view shows `Account Name` in grade `P.6` at school `SCH-2284`, with an application `status` of `under_review`, a `totalScore` of `19.90`, and a `rank` of `20`. This view answers: "What is the complete application history for each student, combining their identity with their evaluation results?"

**View `v_student_identity_document`**

```sql
CREATE VIEW v_student_identity_document AS
SELECT a.id, a.studentId, a.fullName, a.dateOfBirth, b.id AS document_id, b.documentId AS document_documentId, b.documentType AS document_documentType
FROM Student a JOIN IdentityDocument b ON a.documentId = b.id;
```

| id | studentId | fullName | dateOfBirth | document_id | document_documentId | document_documentType |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | 2025-04-02 | 100 | IVC10I | ID_card |
| 101 | 25388256 | Account Name | 2022-09-13 | 101 | 605943 | birth_certificate |
| 102 | id_16 | Saipan International Airport | 2023-02-24 | 102 | 10449525 | ID_card |
| 103 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | birth_certificate |

The view `v_student_identity_document` joins `Student` with `IdentityDocument` on the `documentId` foreign key, producing a row that pairs each student with their verified identity documentation. For `studentId` 100, the view shows `Theodore Mcgrath` linked to `documentId` `100`. This view answers: "Which identity document is associated with each student, enabling verification of applicant identity?"

**View `v_academic_record_admission_application`**

```sql
CREATE VIEW v_academic_record_admission_application AS
SELECT a.recordId, a.gradeLevel, a.term, a.conductScore, b.applicationId AS application_applicationId, b.academicYear AS application_academicYear, b.submissionDate AS application_submissionDate
FROM AcademicRecord a JOIN AdmissionApplication b ON a.applicationId = b.applicationId;
```

| recordId | gradeLevel | term | conductScore | application_applicationId | application_academicYear | application_submissionDate |
|---|---|---|---|---|---|---|
| 10449530 | P.5 | first_term | 12.70 | 1 | legacy-academic-43 | 2025-04-24T03:57:00 |
| 10445619 | P.6 | full_year | 14.40 | 2 | compact-academic-44 | 2022-09-08T10:14:00 |
| 9568457 | P.5 | first_term | 16.10 | 3 | composite-academic-45 | 2023-02-19T17:31:00 |
| 20743593 | P.6 | full_year | 17.80 | 4 | primary-academic-46 | 2024-07-03T00:48:00 |

The view `v_academic_record_admission_application` joins `AcademicRecord` with `AdmissionApplication` on the `applicationId` foreign key, producing a row that pairs each academic record with its parent application's metadata. For `recordId` `20743593`, the view shows the application with `status` `waiting_list`, a `totalScore` of `26.80`, and a `rank` of `28`. This view answers: "Which application does each academic record belong to, and what is the application's current standing?"

**View `v_academic_record_subject_grade_detail`**

```sql
CREATE VIEW v_academic_record_subject_grade_detail AS
SELECT a.recordId, a.gradeLevel, a.term, b.id AS grade_id, b.subjectName AS grade_subjectName, b.grade AS grade_grade
FROM AcademicRecord a
  JOIN AcademicRecordSubjectGrade j ON j.recordId = a.recordId
  JOIN SubjectGrade b ON b.id = j.gradeId;
```

| recordId | gradeLevel | term | grade_id | grade_subjectName | grade_grade |
|---|---|---|---|---|---|
| 10449530 | P.5 | first_term | 1 | Chinese | A+ |
| 10449530 | P.5 | first_term | 2 | English | A |
| 10445619 | P.6 | full_year | 2 | English | A |
| 10445619 | P.6 | full_year | 3 | Maths | A- |
| 9568457 | P.5 | first_term | 3 | Maths | A- |
| 9568457 | P.5 | first_term | 4 | Chinese | B+ |
| 20743593 | P.6 | full_year | 4 | Chinese | B+ |
| 20743593 | P.6 | full_year | 1 | Chinese | A+ |

The view `v_academic_record_subject_grade_detail` joins `AcademicRecord` with `SubjectGrade` on the `recordId` foreign key, producing one row per subject grade per academic record. For `recordId` `10449530`, the view shows the subject `Chinese` with a `grade` of `A+` and a `score` of `31`. This view answers: "What are the individual subject-level results for each academic record?"

**View `v_subject_grade_academic_record`**

```sql
CREATE VIEW v_subject_grade_academic_record AS
SELECT a.id, a.subjectName, a.grade, a.score, b.recordId AS record_recordId, b.gradeLevel AS record_gradeLevel, b.term AS record_term
FROM SubjectGrade a JOIN AcademicRecord b ON a.recordId = b.recordId;
```

| id | subjectName | grade | score | record_recordId | record_gradeLevel | record_term |
|---|---|---|---|---|---|---|
| 1 | Chinese | A+ | 31 | 10449530 | P.5 | first_term |
| 2 | English | A | 37 | 10445619 | P.6 | full_year |
| 3 | Maths | A- | 43 | 9568457 | P.5 | first_term |
| 4 | Chinese | B+ | 49 | 20743593 | P.6 | full_year |

The view `v_subject_grade_academic_record` joins `SubjectGrade` with `AcademicRecord` on the `recordId` foreign key, producing a row that pairs each subject grade with its parent academic record's summary metrics. For `subjectGrade` with `id` 3, the view shows the subject `Maths` with a `grade` of `A-` and a `score` of `43`, linked to `recordId` `9568457` which has an `overallWeightedScore` of `29.10`. This view answers: "How does each individual subject grade relate to the overall academic performance summary?"

**View `v_interview_score_admission_application`**

```sql
CREATE VIEW v_interview_score_admission_application AS
SELECT a.scoreId, a.appearanceAndPoliteness, a.manner, a.totalInterviewScore, b.applicationId AS application_applicationId, b.academicYear AS application_academicYear, b.submissionDate AS application_submissionDate
FROM InterviewScore a JOIN AdmissionApplication b ON a.applicationId = b.applicationId;
```

| scoreId | appearanceAndPoliteness | manner | totalInterviewScore | application_applicationId | application_academicYear | application_submissionDate |
|---|---|---|---|---|---|---|
| 100 | 22 | 17 | 17.20 | 1 | legacy-academic-43 | 2025-04-24T03:57:00 |
| 101 | 32 | 25 | 20.40 | 2 | compact-academic-44 | 2022-09-08T10:14:00 |
| 102 | 42 | 33 | 23.60 | 3 | composite-academic-45 | 2023-02-19T17:31:00 |
| 103 | 52 | 41 | 26.80 | 4 | primary-academic-46 | 2024-07-03T00:48:00 |

The view `v_interview_score_admission_application` joins `InterviewScore` with `AdmissionApplication` on the `applicationId` foreign key, producing a row that pairs each interview score with its parent application's metadata. For `scoreId` 103, the view shows a `totalInterviewScore` of `26.80` with a `weighting` of `13.80`, linked to `applicationId` 4 which has a `status` of `waiting_list` and a `totalScore` of `26.80`. This view answers: "What is the interview evaluation for each application, and how does it relate to the application's overall standing?"

**View `v_activity_evidence_admission_application`**

```sql
CREATE VIEW v_activity_evidence_admission_application AS
SELECT a.evidenceId, a.activityName, a.activityType, a.achievementLevel, b.applicationId AS application_applicationId, b.academicYear AS application_academicYear, b.submissionDate AS application_submissionDate
FROM ActivityEvidence a JOIN AdmissionApplication b ON a.applicationId = b.applicationId;
```

| evidenceId | activityName | activityType | achievementLevel | application_applicationId | application_academicYear | application_submissionDate |
|---|---|---|---|---|---|---|
| 1 | Composite Programme | in_school | championship | 1 | legacy-academic-43 | 2025-04-24T03:57:00 |
| 2 | Compact Standard A | out_of_school | first_runner_up | 2 | compact-academic-44 | 2022-09-08T10:14:00 |
| 3 | Legacy Framework | in_school | second_runner_up | 3 | composite-academic-45 | 2023-02-19T17:31:00 |
| 4 | Regional Protocol | out_of_school | excellent | 4 | primary-academic-46 | 2024-07-03T00:48:00 |

The view `v_activity_evidence_admission_application` joins `ActivityEvidence` with `AdmissionApplication` on the `applicationId` foreign key, producing a row that pairs each activity evidence entry with its parent application's metadata. For `evidenceId` 2, the view shows the activity `Compact Standard A` of type `out_of_school` with an `achievementLevel` of `first_runner_up` and an `awardedScore` of `21`, linked to `applicationId` 2 which has a `status` of `under_review` and a `totalScore` of `19.90`. This view answers: "Which application is each extracurricular achievement associated with, and what is the application's current status?"

**View `v_identity_document_student`**

```sql
CREATE VIEW v_identity_document_student AS
SELECT a.id, a.documentId, a.documentType, a.issueDate, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM IdentityDocument a JOIN Student b ON a.studentId = b.id;
```

| id | documentId | documentType | issueDate | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 100 | IVC10I | ID_card | 2023-02-01 | 100 | 392507 | Theodore Mcgrath |
| 101 | 605943 | birth_certificate | 2024-07-12 | 101 | 25388256 | Account Name |
| 102 | 10449525 | ID_card | 2025-12-23 | 102 | id_16 | Saipan International Airport |
| 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | birth_certificate | 2022-05-07 | 103 | gd_taxc_2211 | Norma Fisher |

The view `v_identity_document_student` joins `IdentityDocument` with `Student` on the `documentId` foreign key, producing a row that pairs each identity document with its associated student's personal information. For `documentId` 101, the view shows the student `Account Name` in grade `P.6` at school `SCH-2284`. This view answers: "Which student is associated with each identity document, enabling traceability from document to applicant?"

The normalised schema above decomposes the admissions domain into seven core entity types — `Student`, `AdmissionApplication`, `AcademicRecord`, `SubjectGrade`, `InterviewScore`, `ActivityEvidence`, and `IdentityDocument` — linked by foreign keys that enforce one-to-one or one-to-many relationships, and three junction tables (`AdmissionApplicationActivityEvidence`, `StudentAdmissionApplication`, `AcademicRecordSubjectGrade`) that resolve many-to-many associations. The twelve materialised views re-assemble these fragments into domain-level facts: demographic profiles (`v_admission_application_student`, `v_student_admission_application_detail`), academic summaries (`v_admission_application_academic_record`, `v_academic_record_subject_grade_detail`, `v_subject_grade_academic_record`), interview evaluations (`v_admission_application_interview_score`, `v_interview_score_admission_application`), extracurricular evidence (`v_admission_application_activity_evidence_detail`, `v_activity_evidence_admission_application`), and identity verification (`v_student_identity_document`, `v_identity_document_student`). Each view answers a specific analytical question by joining the appropriate tables, allowing downstream consumers to query the admissions pipeline without manually constructing join paths. The design balances normalisation — minimising redundancy and update anomalies — with query convenience, ensuring that the most common domain facts are available as single-table reads through the view layer.