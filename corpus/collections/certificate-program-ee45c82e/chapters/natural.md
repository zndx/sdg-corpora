## The Architecture of Certification Admissions

Certification bodies operate within a structured admissions ecosystem where prospective candidates navigate a sequence of program selections, requirement fulfillments, credential issuances, and proficiency assessments. At the core of this ecosystem lies a network of interlocking records: certificate programs define the educational pathways available, each program carrying its own set of admission requirements that candidates must satisfy. Those requirements branch into distinct categories—some mandatory, others optional—and may reference external credentials, English proficiency examinations, or composite evaluations. Applicants move through this landscape by submitting applications, accumulating test scores, and presenting credentials that demonstrate their readiness. The system tracks every interaction with precision, linking candidates to programs, programs to requirements, requirements to credentials and tests, and tests to the scores applicants earn. Understanding this architecture requires examining each component in turn, observing how the records interlock, and interpreting the joined views that surface the relationships practitioners rely on daily.

**Table `certificate_programs`**

| id | program_id | program_name | delivery_mode | effective_date | minimum_g_p_a | word_limit | credential_id |
|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | integrated-delivery-22 | 2023-02-14 | 17.20 | 4 | 168538 |
| 1001 | 2986219 | Pilot Initiative A | seasonal-delivery-23 | 2024-07-25 | 20.40 | 7 | default_chart_a_tax_10 |
| 1002 | 1186079 | Baseline Model | regional-delivery-24 | 2025-12-09 | 23.60 | 10 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 1003 | 1562855 | Distributed Cluster | legacy-delivery-25 | 2022-05-20 | 26.80 | 13 | 2002007020220 |

Certificate programs form the foundational layer of the admissions landscape. Each program carries a unique identifier, a descriptive name, and operational parameters that govern its delivery and academic standards. The program named *Extended Review* (identifier 1000) operates under an integrated delivery mode with an effective date of February 2023 and sets its minimum GPA threshold at 17.20, while the *Pilot Initiative A* program (identifier 1001) follows a seasonal delivery model effective July 2024 with a higher GPA floor of 20.40. The *Baseline Model* (identifier 1002) uses regional delivery starting December 2025 and requires a GPA of 23.60, and the *Distributed Cluster* program (identifier 1003) runs on a legacy delivery schedule from May 2022 with the highest GPA bar at 26.80. Word limits vary across programs—ranging from 4 to 13—reflecting the scope of deliverables expected from enrolled candidates. Each program is also associated with a credential identifier, establishing a direct link between the program and the credential that successful completion yields.

**Table `admission_requirements`**

| id | requirement_id | requirement_type | description | is_mandatory | valid_from | certificate_program_id | admission_requirement_id |
|---|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | true | 2025-12-17 | 1000 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | false | 2022-05-01 | 1001 | 2 |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | true | 2023-10-12 | 1002 | 3 |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | false | 2024-03-23 | 1003 | 4 |

Every certificate program is accompanied by a set of admission requirements that candidates must address before enrollment. These requirements are categorized by type—composite, primary, adaptive, and distributed—and each carries a description, a mandatory flag, and a validity window. The requirement tied to the *Extended Review* program (identifier 1, requirement ID 778568) is labeled *Extended Survey*, marked as mandatory, and valid from December 2025 onward. In contrast, the *Pilot Corridor A* requirement (identifier 2, requirement ID `lu_tax_code_template_b_VB-EC-0`) is non-mandatory and valid from May 2022. The *Baseline Series* (identifier 3, requirement ID 99901) is mandatory with a validity starting October 2023, while the *Distributed Assessment* (identifier 4, requirement ID 5917277) is optional and valid from March 2024. The self-referencing `admission_requirement_id` column indicates that some requirements may depend on or reference other requirements within the same table, creating a layered structure of prerequisites.

**Table `programs_requirements`**

| certificate_program_id | admission_requirement_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `applicants_requirements`**

| applicant_id | admission_requirement_id |
|---|---|
| Retur | 1 |
| Retur | 2 |
| 8387528 | 2 |
| 8387528 | 3 |
| 3355769 | 3 |
| 3355769 | 4 |
| id_25 | 4 |
| id_25 | 1 |

The linkage between programs and their requirements is mediated through junction records that explicitly associate a program with a specific requirement. These junction records ensure that the relationship is traceable and auditable, capturing not just which requirement applies to which program, but also the context in which the association was established. Similarly, applicants are connected to requirements through their own junction table, which records which requirements each candidate has been evaluated against or has satisfied. This dual-layered association—programs to requirements, and applicants to requirements—creates a matrix that practitioners query to determine eligibility, track progress, and identify gaps in a candidate's application profile.

**Table `credentials`**

| credential_id | credential_type | issuing_institution | issue_date | status | admission_requirement_id |
|---|---|---|---|---|---|
| 168538 | distributed-credenti-60 | distributed-issuing-96 | 2023-02-01 | regional-status-84 | 1 |
| default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 | 2024-07-12 | legacy-status-85 | 2 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 | 2025-12-23 | compact-status-86 | 3 |
| 2002007020220 | extended-credenti-63 | extended-issuing-99 | 2022-05-07 | composite-status-87 | 4 |

Credentials represent the formal attestations issued within the admissions framework. Each credential carries a type, an issuing institution, an issue date, a status, and a reference to the admission requirement it fulfills. The credential with ID `168538` is of type *distributed-credenti-60*, issued by *distributed-issuing-96* on February 1, 2023, and holds a regional status; it satisfies admission requirement 1. The credential `default_chart_a_tax_10` (type *baseline-credenti-61*) was issued by *baseline-issuing-97* on July 12, 2024, carries a legacy status, and addresses requirement 2. The credential `ChIJIbRFlPtt5kcR5kM81XdpSfI` (type *pilot-credenti-62*) originates from *pilot-issuing-98*, dated December 23, 2025, with a compact status, linked to requirement 3. Finally, `2002007020220` (type *extended-credenti-63*) was issued by *extended-issuing-99* on May 7, 2022, holds a composite status, and fulfills requirement 4. The status values—ranging from regional to legacy to compact to composite—reflect the varied operational contexts in which credentials exist.

**Table `applicants_credentials`**

| applicant_id | credential_id |
|---|---|
| Retur | 168538 |
| Retur | default_chart_a_tax_10 |
| 8387528 | default_chart_a_tax_10 |
| 8387528 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 3355769 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 3355769 | 2002007020220 |
| id_25 | 2002007020220 |
| id_25 | 168538 |

The relationship between applicants and credentials is captured in a dedicated junction table, recording which candidate has presented or been awarded which credential. This table is essential for auditing credential validity, tracking which credentials have been submitted as part of an application, and verifying that the credential's issuing institution and status align with the admission requirement it is intended to satisfy.

**Table `english_proficiency_tests`**

| id | test_id | test_name | min_score | test_format | admission_requirement_id | test_score_id |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | legacy-test-19 | 1 | 1000 |
| 2 | 7119774 | Regional Survey | 26 | compact-test-20 | 2 | 1001 |
| 3 | 7441144 | Seasonal Corridor | 31 | composite-test-21 | 3 | 1002 |
| 4 | 8350010 | Integrated Series A | 36 | primary-test-22 | 4 | 1003 |

English proficiency testing constitutes a parallel track within the admissions process. Each test record specifies a test name, a minimum score threshold, a test format, and the admission requirement it serves. The *Legacy Assessment D* (identifier 1, test ID 2106696) requires a minimum score of 21, uses a legacy test format, and is associated with admission requirement 1. The *Regional Survey* (identifier 2, test ID 7119774) sets the bar at 26 points, employs a compact format, and maps to requirement 2. The *Seasonal Corridor* test (identifier 3, test ID 7441144) demands a minimum of 31 under a composite format for requirement 3, while the *Integrated Series A* (identifier 4, test ID 8350010) requires 36 points using a primary format for requirement 4. Each test also references a test score, indicating that the test definition and the actual score record are distinct entities.

**Table `test_scores`**

| id | score_id | score_value | test_date | valid_until | english_proficiency_test_id | applicant_id |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | 2023-06-09 | 1 | Retur |
| 1001 | 10449532 | 16 | 2025-04-24 | 2024-11-20 | 2 | 8387528 |
| 1002 | 4985159 | 21 | 2022-09-08 | 2025-04-04 | 3 | 3355769 |
| 1003 | 195363 | 26 | 2023-02-19 | 2022-09-15 | 4 | id_25 |

Test scores are the concrete measurements produced when applicants complete English proficiency examinations. Each score record contains a score value, a test date, a validity expiration date, a reference to the English proficiency test taken, and the applicant who earned the score. The score with ID 1000 (score ID `a854635a-9bad-11eb-a8a2-19ed5c03f8d3`) records a value of 11, was taken on November 13, 2024, and expired on June 9, 2023—indicating a retroactive or system-generated entry. Score 1001 (value 16, dated April 24, 2025, valid until November 20, 2024) corresponds to test 2. Score 1002 (value 21, dated September 8, 2022, valid until April 4, 2025) belongs to test 3, and score 1003 (value 26, dated February 19, 2023, valid until September 15, 2022) is linked to test 4. The validity windows and score values are critical for determining whether a candidate's proficiency evidence remains current and sufficient.

**Table `applicants`**

| applicant_id | full_name | nationality | application_status | submission_date |
|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | primary-applicat-16 | 2025-04-24 |
| 8387528 | Account Name | primary-national-40 | adaptive-applicat-17 | 2022-09-08 |
| 3355769 | Saipan International Airport | adaptive-national-41 | distributed-applicat-18 | 2023-02-19 |
| id_25 | Norma Fisher | distributed-national-42 | baseline-applicat-19 | 2024-07-03 |

Applicants are the central actors in the admissions process. Each applicant record stores a unique identifier, a full name, a nationality classification, an application status, and a submission date. The applicant *Theodore Mcgrath* (ID `Retur`) holds a composite nationality classification, has a primary application status, and submitted on April 24, 2025. The applicant recorded as *Account Name* (ID `8387528`) carries a primary nationality, an adaptive application status, and submitted on September 8, 2022. *Saipan International Airport* (ID `3355769`) is classified with an adaptive nationality, a distributed application status, and submitted on February 19, 2023. *Norma Fisher* (ID `id_25`) has a distributed nationality, a baseline application status, and submitted on July 3, 2024. These applicant records serve as the anchor point for all downstream relationships—linking to test scores, credentials, and the admission requirements they must satisfy.

**View `certificate_program_admission_requirement_detail_view`**

```sql
CREATE VIEW certificate_program_admission_requirement_detail_view AS
SELECT a.id, a.program_id, a.program_name, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM certificate_programs a
  JOIN programs_requirements j ON j.certificate_program_id = a.id
  JOIN admission_requirements b ON b.id = j.admission_requirement_id;
```

| id | program_id | program_name | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 1 | 778568 | composite-requirem-93 |
| 1000 | 103176 | Extended Review | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 1001 | 2986219 | Pilot Initiative A | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 1001 | 2986219 | Pilot Initiative A | 3 | 99901 | adaptive-requirem-95 |
| 1002 | 1186079 | Baseline Model | 3 | 99901 | adaptive-requirem-95 |
| 1002 | 1186079 | Baseline Model | 4 | 5917277 | distributed-requirem-96 |
| 1003 | 1562855 | Distributed Cluster | 4 | 5917277 | distributed-requirem-96 |
| 1003 | 1562855 | Distributed Cluster | 1 | 778568 | composite-requirem-93 |

The view `certificate_program_admission_requirement_detail_view` answers the question: which admission requirements apply to each certificate program, and what are their characteristics? By joining certificate programs with their associated admission requirements, this view surfaces rows such as the *Extended Review* program paired with its mandatory *Extended Survey* requirement, valid from December 2025, and the *Pilot Initiative A* program paired with the non-mandatory *Pilot Corridor A* requirement. Practitioners use this view to audit program-requirement alignment, verify that mandatory requirements are properly flagged, and confirm that validity dates are current.

**View `certificate_program_credential_view`**

```sql
CREATE VIEW certificate_program_credential_view AS
SELECT a.id, a.program_id, a.program_name, a.delivery_mode, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.issuing_institution AS credential_issuing_institution
FROM certificate_programs a JOIN credentials b ON a.credential_id = b.credential_id;
```

| id | program_id | program_name | delivery_mode | credential_credential_id | credential_credential_type | credential_issuing_institution |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | integrated-delivery-22 | 168538 | distributed-credenti-60 | distributed-issuing-96 |
| 1001 | 2986219 | Pilot Initiative A | seasonal-delivery-23 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 1002 | 1186079 | Baseline Model | regional-delivery-24 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 1003 | 1562855 | Distributed Cluster | legacy-delivery-25 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |

The `certificate_program_credential_view` joins certificate programs with their associated credentials, answering: which credential is tied to each program? A representative row shows the *Extended Review* program linked to the distributed credential `168538`, issued by *distributed-issuing-96*. Another row connects *Pilot Initiative A* to the baseline credential `default_chart_a_tax_10`. This view is essential for understanding the credential pathway of each program and for verifying that the credential's issuing institution and status are appropriate for the program's delivery mode and academic level.

**View `admission_requirement_certificate_program_view`**

```sql
CREATE VIEW admission_requirement_certificate_program_view AS
SELECT a.id, a.requirement_id, a.requirement_type, a.description, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM admission_requirements a JOIN certificate_programs b ON a.certificate_program_id = b.id;
```

| id | requirement_id | requirement_type | description | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | 1000 | 103176 | Extended Review |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | 1001 | 2986219 | Pilot Initiative A |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | 1002 | 1186079 | Baseline Model |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | 1003 | 1562855 | Distributed Cluster |

The `admission_requirement_certificate_program_view` reverses the perspective, answering: which certificate program does each admission requirement belong to? This inverted join is useful when an auditor starts from a requirement and needs to trace it back to the program it serves. For instance, the *Extended Survey* requirement (ID 1) resolves to the *Extended Review* program, while the *Distributed Assessment* requirement (ID 4) maps to the *Distributed Cluster* program. This view supports requirement-centric queries, such as identifying all programs that share a particular requirement type or checking whether a requirement's mandatory status is consistent across programs.

**View `admission_requirement_admission_requirement_view`**

```sql
CREATE VIEW admission_requirement_admission_requirement_view AS
SELECT a.id, a.requirement_id, a.requirement_type, a.description, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM admission_requirements a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| id | requirement_id | requirement_type | description | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | 1 | 778568 | composite-requirem-93 |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | 3 | 99901 | adaptive-requirem-95 |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | 4 | 5917277 | distributed-requirem-96 |

The `admission_requirement_admission_requirement_view` captures self-referential relationships within the admission requirements table, answering: does this requirement depend on or reference another requirement? Since the `admission_requirement_id` column can point to another row in the same table, this view surfaces those dependencies. For example, if requirement 2 references requirement 2 as its own parent, the view would show that self-link. Practitioners use this to understand prerequisite chains and to ensure that requirement hierarchies are correctly constructed.

**View `credential_admission_requirement_view`**

```sql
CREATE VIEW credential_admission_requirement_view AS
SELECT a.credential_id, a.credential_type, a.issuing_institution, a.issue_date, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM credentials a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| credential_id | credential_type | issuing_institution | issue_date | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 168538 | distributed-credenti-60 | distributed-issuing-96 | 2023-02-01 | 1 | 778568 | composite-requirem-93 |
| default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 | 2024-07-12 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 | 2025-12-23 | 3 | 99901 | adaptive-requirem-95 |
| 2002007020220 | extended-credenti-63 | extended-issuing-99 | 2022-05-07 | 4 | 5917277 | distributed-requirem-96 |

The `credential_admission_requirement_view` joins credentials with their corresponding admission requirements, answering: which requirement does each credential satisfy? A concrete row shows the distributed credential `168538` (issued by *distributed-issuing-96*, status *regional-status-84*) satisfying admission requirement 1 (*Extended Survey*). Another row links the extended credential `2002007020220` (status *composite-status-87*) to requirement 4 (*Distributed Assessment*). This view is critical for credential validation, ensuring that the credential presented by an applicant matches the requirement it is intended to fulfill.

**View `english_proficiency_test_admission_requirement_view`**

```sql
CREATE VIEW english_proficiency_test_admission_requirement_view AS
SELECT a.id, a.test_id, a.test_name, a.min_score, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM english_proficiency_tests a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| id | test_id | test_name | min_score | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | 1 | 778568 | composite-requirem-93 |
| 2 | 7119774 | Regional Survey | 26 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 3 | 7441144 | Seasonal Corridor | 31 | 3 | 99901 | adaptive-requirem-95 |
| 4 | 8350010 | Integrated Series A | 36 | 4 | 5917277 | distributed-requirem-96 |

The `english_proficiency_test_admission_requirement_view` connects English proficiency tests to the admission requirements they serve, answering: which test is associated with which requirement? The *Legacy Assessment D* test (minimum score 21) is linked to requirement 1, while the *Integrated Series A* test (minimum score 36) serves requirement 4. This view allows practitioners to verify that the correct test format and minimum score threshold are assigned to each requirement, and to identify any mismatches between test difficulty and requirement rigor.

**View `english_proficiency_test_test_score_view`**

```sql
CREATE VIEW english_proficiency_test_test_score_view AS
SELECT a.id, a.test_id, a.test_name, a.min_score, b.id AS score_id, b.score_id AS score_score_id, b.score_value AS score_score_value
FROM english_proficiency_tests a JOIN test_scores b ON a.test_score_id = b.id;
```

| id | test_id | test_name | min_score | score_id | score_score_id | score_score_value |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 |
| 2 | 7119774 | Regional Survey | 26 | 1001 | 10449532 | 16 |
| 3 | 7441144 | Seasonal Corridor | 31 | 1002 | 4985159 | 21 |
| 4 | 8350010 | Integrated Series A | 36 | 1003 | 195363 | 26 |

The `english_proficiency_test_test_score_view` joins English proficiency tests with their corresponding test scores, answering: what score was earned for each test? A representative row shows the *Legacy Assessment D* test (test ID 2106696) associated with score ID `a854635a-9bad-11eb-a8a2-19ed5c03f8d3`, which has a value of 11. The *Regional Survey* test links to score 1001 with a value of 16. This view is used to compare actual scores against the minimum thresholds defined in the test records, determining whether a candidate has met the proficiency bar.

**View `test_score_english_proficiency_test_view`**

```sql
CREATE VIEW test_score_english_proficiency_test_view AS
SELECT a.id, a.score_id, a.score_value, a.test_date, b.id AS test_id, b.test_id AS test_test_id, b.test_name AS test_test_name
FROM test_scores a JOIN english_proficiency_tests b ON a.english_proficiency_test_id = b.id;
```

| id | score_id | score_value | test_date | test_id | test_test_id | test_test_name |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | 1 | 2106696 | Legacy Assessment D |
| 1001 | 10449532 | 16 | 2025-04-24 | 2 | 7119774 | Regional Survey |
| 1002 | 4985159 | 21 | 2022-09-08 | 3 | 7441144 | Seasonal Corridor |
| 1003 | 195363 | 26 | 2023-02-19 | 4 | 8350010 | Integrated Series A |

The `test_score_english_proficiency_test_view` inverts the previous relationship, answering: which English proficiency test produced this score? From the score side, score 1000 (value 11, dated November 13, 2024) resolves to the *Legacy Assessment D* test, and score 1003 (value 26, dated February 19, 2023) resolves to the *Integrated Series A* test. This perspective is useful when reviewing a candidate's score history and needing to identify the specific test taken, its format, and its minimum score requirement.

**View `test_score_applicant_view`**

```sql
CREATE VIEW test_score_applicant_view AS
SELECT a.id, a.score_id, a.score_value, a.test_date, b.applicant_id AS applicant_applicant_id, b.full_name AS applicant_full_name, b.nationality AS applicant_nationality
FROM test_scores a JOIN applicants b ON a.applicant_id = b.applicant_id;
```

| id | score_id | score_value | test_date | applicant_applicant_id | applicant_full_name | applicant_nationality |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | Retur | Theodore Mcgrath | composite-national-39 |
| 1001 | 10449532 | 16 | 2025-04-24 | 8387528 | Account Name | primary-national-40 |
| 1002 | 4985159 | 21 | 2022-09-08 | 3355769 | Saipan International Airport | adaptive-national-41 |
| 1003 | 195363 | 26 | 2023-02-19 | id_25 | Norma Fisher | distributed-national-42 |

The `test_score_applicant_view` joins test scores with the applicants who earned them, answering: which applicant achieved which score? The score with value 11 (ID 1000) belongs to applicant *Theodore Mcgrath* (ID `Retur`), while the score with value 26 (ID 1003) belongs to *Norma Fisher* (ID `id_25`). This view is fundamental for applicant profiling, enabling practitioners to assess a candidate's English proficiency performance, check score validity, and determine whether the score meets the minimum threshold for their target program's requirement.

**View `applicant_admission_requirement_detail_view`**

```sql
CREATE VIEW applicant_admission_requirement_detail_view AS
SELECT a.applicant_id, a.full_name, a.nationality, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM applicants a
  JOIN applicants_requirements j ON j.applicant_id = a.applicant_id
  JOIN admission_requirements b ON b.id = j.admission_requirement_id;
```

| applicant_id | full_name | nationality | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | 1 | 778568 | composite-requirem-93 |
| Retur | Theodore Mcgrath | composite-national-39 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 8387528 | Account Name | primary-national-40 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 8387528 | Account Name | primary-national-40 | 3 | 99901 | adaptive-requirem-95 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 3 | 99901 | adaptive-requirem-95 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 4 | 5917277 | distributed-requirem-96 |
| id_25 | Norma Fisher | distributed-national-42 | 4 | 5917277 | distributed-requirem-96 |
| id_25 | Norma Fisher | distributed-national-42 | 1 | 778568 | composite-requirem-93 |

The `applicant_admission_requirement_detail_view` answers the comprehensive question: which admission requirements has each applicant been evaluated against, and what are the details of those requirements? By joining applicants with their associated requirements through the junction table, this view surfaces rows such as applicant *Theodore Mcgrath* linked to the mandatory *Extended Survey* requirement, or *Norma Fisher* linked to the optional *Distributed Assessment* requirement. Practitioners rely on this view to track application progress, identify unmet requirements, and generate eligibility reports.

**View `applicant_credential_detail_view`**

```sql
CREATE VIEW applicant_credential_detail_view AS
SELECT a.applicant_id, a.full_name, a.nationality, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.issuing_institution AS credential_issuing_institution
FROM applicants a
  JOIN applicants_credentials j ON j.applicant_id = a.applicant_id
  JOIN credentials b ON b.credential_id = j.credential_id;
```

| applicant_id | full_name | nationality | credential_credential_id | credential_credential_type | credential_issuing_institution |
|---|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | 168538 | distributed-credenti-60 | distributed-issuing-96 |
| Retur | Theodore Mcgrath | composite-national-39 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 8387528 | Account Name | primary-national-40 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 8387528 | Account Name | primary-national-40 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 3355769 | Saipan International Airport | adaptive-national-41 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |
| id_25 | Norma Fisher | distributed-national-42 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |
| id_25 | Norma Fisher | distributed-national-42 | 168538 | distributed-credenti-60 | distributed-issuing-96 |

The `applicant_credential_detail_view` joins applicants with the credentials they have presented, answering: which credentials has each applicant submitted, and what are the credential details? A representative row might show *Theodore Mcgrath* linked to the distributed credential `168538` issued by *distributed-issuing-96*, or *Norma Fisher* linked to the extended credential `2002007020220`. This view is essential for credential verification workflows, allowing practitioners to confirm that the credentials presented by an applicant are valid, properly issued, and aligned with the admission requirements they are intended to satisfy.

## Synthesis

The certification admissions ecosystem is a tightly coupled network of programs, requirements, credentials, tests, scores, and applicants. Each entity serves a distinct function: programs define the educational pathways, requirements establish the criteria for entry, credentials provide formal attestations, tests measure proficiency, scores record performance, and applicants are the candidates navigating the system. The junction tables and views bind these entities together, enabling practitioners to trace relationships from any starting point—whether beginning with a program and working outward to its requirements and credentials, or starting with an applicant and tracing their scores, credentials, and requirement fulfillment. The data values embedded throughout these records—the GPA thresholds, the validity dates, the score values, the issuing institutions—provide the operational detail that makes the system actionable. Together, they form a coherent framework for managing certification admissions with precision, transparency, and auditability.