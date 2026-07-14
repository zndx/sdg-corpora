## The Admissions Pipeline: From Application to Decision

Every academic year, institutions manage a complex flow of student admission applications, each carrying a distinct profile of academic achievement, extracurricular involvement, interview performance, and verified identity. The admissions process is not a single event but a structured pipeline: applications arrive, are scored across multiple dimensions, and are ranked against a cohort of peers before a final decision is rendered. Understanding how each piece of data fits into this pipeline — and how records interlock across tables — is essential for anyone responsible for processing, auditing, or optimizing admissions operations.

At the center of the pipeline sits the admission application, a record that aggregates scores from academic transcripts, interview evaluations, and extracurricular evidence into a single composite figure. Each application is assigned a unique identifier, tied to an academic year, and tracked through a lifecycle of statuses ranging from initial submission through pending review, admission, waiting list placement, or rejection.

**Table `AdmissionApplication`**

| applicationId | academicYear | submissionDate | status | totalScore | rank | interviewDate | interviewResult | studentId | recordId | scoreId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | legacy-academic-43 | 2025-04-24T03:57:00 | pending | 16.45 | 16 | 2025-08-23T19:57:00 | passed | 100 | 10449530 | 100 |
| 2 | compact-academic-44 | 2022-09-08T10:14:00 | under_review | 19.90 | 20 | 2022-01-07T02:14:00 | failed | 101 | 10445619 | 101 |
| 3 | composite-academic-45 | 2023-02-19T17:31:00 | admitted | 23.35 | 24 | 2023-06-18T09:31:00 | pending | 102 | 9568457 | 102 |
| 4 | primary-academic-46 | 2024-07-03T00:48:00 | waiting_list | 26.80 | 28 | 2024-11-02T16:48:00 | passed | 103 | 20743593 | 103 |

Consider application 1, submitted on 2025-04-24 for the legacy-academic-43 year. It carries a total score of 16.45 and holds rank 16 among its cohort. The interview for this applicant occurred on 2025-08-23 and resulted in a passed outcome. Application 3, by contrast, has already reached the admitted status with a total score of 23.35 and rank 24, suggesting that higher scores do not always correlate with earlier admission decisions — the process involves multiple evaluation layers beyond the composite number alone.

The student behind each application is recorded in a separate table, preserving personal identifiers and school affiliation. The student table links to the application through a shared student identifier, ensuring that every score and decision can be traced back to a specific individual.

**Table `Student`**

| id | studentId | fullName | dateOfBirth | currentGradeLevel | schoolNumber | documentId |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | 2025-04-02 | P.5 | SCH-2281 | 100 |
| 101 | 25388256 | Account Name | 2022-09-13 | P.6 | SCH-2284 | 101 |
| 102 | id_16 | Saipan International Airport | 2023-02-24 | P.5 | SCH-2287 | 102 |
| 103 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | P.6 | SCH-2290 | 103 |

Student 100, Theodore Mcgrath, is enrolled at grade level P.5 with school number SCH-2281. Student 101, listed as Account Name, is in P.6 at SCH-2284. The student records also carry a document identifier, which points to the identity verification file on file for each applicant. This separation of personal data from application scoring supports data minimization and role-based access: admissions reviewers see scores and decisions, while administrative staff manage identity documents.

Academic performance is captured in the academic record table, which summarizes a student's conduct and subject-level achievement for a given term. Each record is tied to a specific grade level and term, and carries an overall weighted score that feeds into the application's total.

**Table `AcademicRecord`**

| recordId | gradeLevel | term | conductScore | academicScore | overallWeightedScore | applicationId |
|---|---|---|---|---|---|---|
| 10449530 | P.5 | first_term | 12.70 | 19.70 | 19.70 | 1 |
| 10445619 | P.6 | full_year | 14.40 | 24.40 | 24.40 | 2 |
| 9568457 | P.5 | first_term | 16.10 | 29.10 | 29.10 | 3 |
| 20743593 | P.6 | full_year | 17.80 | 33.80 | 33.80 | 4 |

Record 10449530 corresponds to application 1 and covers the first term of P.5. The conduct score is 12.70, the academic score is 19.70, and the overall weighted score — which is the figure used in the composite calculation — is also 19.70. Record 20743593, linked to application 4, covers a full year at P.6 with a conduct score of 17.80 and an academic score of 33.80, yielding the highest overall weighted score among the four records shown.

The academic record is decomposed into individual subject grades, each carrying a letter grade, a numeric score, and a term designation.

**Table `SubjectGrade`**

| id | subjectName | grade | score | term | recordId |
|---|---|---|---|---|---|
| 1 | Chinese | A+ | 31 | P.5 | 10449530 |
| 2 | English | A | 37 | P.6_first_term | 10445619 |
| 3 | Maths | A- | 43 | P.5 | 9568457 |
| 4 | Chinese | B+ | 49 | P.6_first_term | 20743593 |

Subject grade 1 records a Chinese score of 31 with an A+ grade for the P.5 term, attached to academic record 10449530. Subject grade 4 records a Chinese score of 49 with a B+ grade for the P.6_first_term term, attached to academic record 20743593. The variation in numeric scores and letter grades across subjects and terms provides the granular evidence that admissions committees use when evaluating academic consistency and growth.

Interview performance is scored separately, with distinct dimensions for appearance and politeness, manner, and a total interview score. Each interview score record is linked to an application and carries a weighting factor that determines how much the interview contributes to the application's total score.

**Table `InterviewScore`**

| scoreId | appearanceAndPoliteness | manner | totalInterviewScore | weighting | applicationId |
|---|---|---|---|---|---|
| 100 | 22 | 17 | 17.20 | 6.45 | 1 |
| 101 | 32 | 25 | 20.40 | 8.90 | 2 |
| 102 | 42 | 33 | 23.60 | 11.35 | 3 |
| 103 | 52 | 41 | 26.80 | 13.80 | 4 |

Interview score 100, linked to application 1, shows an appearance and politeness score of 22, a manner score of 17, and a total interview score of 17.20, with a weighting of 6.45. Interview score 103, linked to application 4, shows substantially higher values: appearance and politeness of 52, manner of 41, a total interview score of 26.80, and a weighting of 13.80. The weighting factor varies across applicants, reflecting different evaluation rubrics or institutional policies applied at the time of the interview.

Extracurricular involvement is documented through activity evidence records, each describing an activity name, type, achievement level, and awarded score. A boolean flag indicates whether the activity placed the applicant in the top five of its category.

**Table `ActivityEvidence`**

| evidenceId | activityName | activityType | achievementLevel | awardedScore | isTopFive | applicationId |
|---|---|---|---|---|---|---|
| 1 | Composite Programme | in_school | championship | 17 | false | 1 |
| 2 | Compact Standard A | out_of_school | first_runner_up | 21 | true | 2 |
| 3 | Legacy Framework | in_school | second_runner_up | 25 | false | 3 |
| 4 | Regional Protocol | out_of_school | excellent | 29 | true | 4 |

Activity evidence 1 describes the Composite Programme, an in-school activity at the championship level, earning 17 awarded points but not placing in the top five. Activity evidence 2 describes the Compact Standard A, an out-of-school activity at the first runner-up level, earning 21 points and flagged as top five. Activity evidence 4 describes the Regional Protocol, an out-of-school activity at the excellent level, earning 29 points and also flagged as top five. The activity type distinction — in-school versus out-of-school — allows the admissions office to weight community engagement differently from school-based participation.

Identity verification is maintained in a dedicated table, linking each student to their official document.

**Table `IdentityDocument`**

| id | documentId | documentType | issueDate | expiryDate | verificationStatus | studentId |
|---|---|---|---|---|---|---|
| 100 | IVC10I | ID_card | 2023-02-01 | 2023-10-24 | verified | 100 |
| 101 | 605943 | birth_certificate | 2024-07-12 | 2024-03-08 | pending | 101 |
| 102 | 10449525 | ID_card | 2025-12-23 | 2025-08-19 | rejected | 102 |
| 103 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | birth_certificate | 2022-05-07 | 2022-01-03 | verified | 103 |

The identity document table stores the verified identity file for each student, referenced by the document identifier in the student record. This separation ensures that sensitive identity data is managed independently from academic and scoring data.

The relationship between applications and activities is mediated through a linking table, which records which activities were submitted as evidence for which application.

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

Similarly, the relationship between students and applications is captured in a linking table, allowing a single student to be associated with multiple application records across different academic years or programs.

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

The relationship between academic records and subject grades is captured in a linking table, which maps each subject grade to its parent academic record.

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

## Interpreting Joined Results

The power of the admissions data model lies in its joined views, which bring together records from multiple tables to answer specific operational questions. Each view represents a particular lens through which the admissions office reviews, audits, or reports on the pipeline.

The view joining admission applications with student records answers the question: who applied, and what is their personal profile? Reading row 1 of this view reveals that application 1 belongs to Theodore Mcgrath, a P.5 student at SCH-2281, with a total score of 16.45 and a pending status. Row 3 shows that application 3 belongs to Saipan International Airport, a P.5 student at SCH-2287, with a total score of 23.35 and an admitted status. This view is the primary tool for admissions counselors preparing for applicant meetings.

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

The view joining admission applications with academic records answers: what was the applicant's academic standing at the time of application? Row 1 shows that application 1 is linked to academic record 10449530, a P.5 first-term record with an overall weighted score of 19.70. Row 4 shows that application 4 is linked to academic record 20743593, a P.6 full-year record with an overall weighted score of 33.80. This view enables the office to compare academic trajectories across applicants and to identify records that may need further review.

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

The view joining admission applications with interview scores answers: how did the applicant perform in the interview, and how heavily was that performance weighted? Row 1 shows that application 1 received an interview total score of 17.20 with a weighting of 6.45. Row 3 shows that application 3 received an interview total score of 23.60 with a weighting of 11.35. This view is essential for auditing the fairness of interview weightings across the applicant pool.

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

The view joining admission applications with activity evidence details answers: what extracurricular activities did the applicant submit, and how were they scored? Row 1 shows that application 1 submitted the Composite Programme, an in-school championship-level activity earning 17 points. Row 4 shows that application 4 submitted the Regional Protocol, an out-of-school excellent-level activity earning 29 points and flagged as top five. This view supports the evaluation of holistic achievement beyond academics.

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

The view joining students with their admission applications answers: what applications has this student submitted, and what are the outcomes? Row 1 shows that student 100 (Theodore Mcgrath) has application 1, submitted on 2025-04-24, with a total score of 16.45 and a pending status. Row 2 shows that student 101 (Account Name) has application 2, submitted on 2022-09-08, with a total score of 19.90 and an under_review status. This view is used for longitudinal tracking of applicants across years.

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

The view joining students with their identity documents answers: which student has which verified identity file on record? Row 1 shows that student 100 (Theodore Mcgrath) has identity document 100 on file. Row 4 shows that student 103 (Norma Fisher) has identity document 103 on file. This view is critical for compliance audits and document verification workflows.

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

The view joining academic records with admission applications answers: which application is supported by which academic record? Row 1 shows that academic record 10449530 supports application 1. Row 3 shows that academic record 9568457 supports application 3. This view is used to ensure that every application has a corresponding academic record and to detect orphaned records.

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

The view joining academic records with subject grade details answers: what subjects and grades comprise a given academic record? Row 1 shows that academic record 10449530 includes a Chinese grade of A+ with a score of 31. Row 4 shows that academic record 20743593 includes a Chinese grade of B+ with a score of 49. This view provides the granular breakdown needed for academic counseling and appeals.

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

The view joining subject grades with their parent academic records answers: which academic record does each subject grade belong to? Row 1 shows that subject grade 1 (Chinese, A+, score 31) belongs to academic record 10449530. Row 3 shows that subject grade 3 (Maths, A-, score 43) belongs to academic record 9568457. This view is used for data integrity checks and for reconstructing full transcripts from individual grade entries.

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

The view joining interview scores with their parent admission applications answers: which application does each interview score belong to? Row 1 shows that interview score 100 (total 17.20, weighting 6.45) belongs to application 1. Row 4 shows that interview score 103 (total 26.80, weighting 13.80) belongs to application 4. This view supports the reconciliation of interview scores with application totals.

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

The view joining activity evidence with their parent admission applications answers: which application does each activity evidence record belong to? Row 1 shows that activity evidence 1 (Composite Programme, championship, 17 points) belongs to application 1. Row 4 shows that activity evidence 4 (Regional Protocol, excellent, 29 points) belongs to application 4. This view is used to verify that all submitted activities are properly attributed to the correct application.

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

The view joining identity documents with their parent students answers: which student does each identity document belong to? Row 1 shows that identity document 100 belongs to student 100 (Theodore Mcgrath). Row 3 shows that identity document 102 belongs to student 102 (Saipan International Airport). This view is the primary tool for identity verification audits and document lifecycle management.

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

## Synthesis

The admissions data model is built on a foundation of clearly separated concerns: personal identity, academic performance, interview evaluation, extracurricular evidence, and application-level aggregation. Each concern is captured in its own table, and the relationships between them are expressed through explicit foreign-key links and join views. This separation allows different teams — admissions counselors, compliance officers, data analysts — to access the data they need without exposing unrelated information.

The composite score that determines an applicant's rank is not a single measurement but a weighted sum of academic, interview, and activity components, each drawn from a different table and each carrying its own granularity. Application 4, with a total score of 26.80 and rank 28, illustrates how a strong interview score of 26.80 and a high academic record score of 33.80 combine to produce a competitive profile. Application 1, with a total score of 16.45 and rank 16, demonstrates that a lower composite does not necessarily reflect poor performance across all dimensions — it may reflect a different balance of strengths.

The views provide the operational interface to this data, each answering a specific question that arises during the admissions lifecycle. From the counselor's perspective, the student-application view is the starting point for every applicant interaction. From the auditor's perspective, the identity-document-student view is the starting point for every compliance check. From the analyst's perspective, the academic-record-subject-grade view is the starting point for every trend analysis.

Together, these tables and views form a coherent, auditable record of the admissions process — one that supports transparency, fairness, and continuous improvement in how institutions evaluate and admit students.