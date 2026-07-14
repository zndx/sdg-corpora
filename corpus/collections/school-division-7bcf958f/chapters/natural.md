## Educational Program Administration and Credential Tracking

Educational institutions manage complex webs of relationships between divisions, students, courses, faculty, and credentialing requirements. At the operational level, every student belongs to a school division, enrolls in courses taught by faculty members, and works toward a diploma that satisfies a set of defined requirements. Extracurricular activities provide an additional layer of engagement. The records captured in this system document each of these entities and the connections between them, enabling administrators to track enrollment, academic progress, and credential compliance across the institution.

**Table `school_divisions`**

| school_division_id | division_id | division_name | region | established_date | total_enrollment | district_type |
|---|---|---|---|---|---|---|
| 1 | 89512 | Composite Protocol | distributed-region-12 | 2024-03-27 | 382 | public |
| 2 | 10207146 | Compact Programme A | baseline-region-13 | 2025-08-11 | 4 | charter |
| 3 | 212 | Legacy Standard | pilot-region-14 | 2022-01-22 | 496 | magnet |
| 4 | id_14 | Regional Framework | extended-region-15 | 2023-06-06 | 101 | public |

School divisions form the organizational backbone of the institution. Each division carries a unique identifier, a descriptive name, and a regional classification. The Composite Protocol division (ID 89512) operates in distributed-region-12 as a public institution established in March 2024, with a total enrollment of 382 students. Compact Programme A (ID 10207146) is a charter division in baseline-region-13, established more recently in August 2025, with a modest enrollment of only four students. Legacy Standard (ID 212) is a magnet division in pilot-region-14, dating back to January 2022, serving 496 students. Regional Framework (ID id_14) is a public division in extended-region-15, established in June 2023, with 101 students. The district_type field distinguishes public, charter, and magnet classifications, while total_enrollment provides a snapshot of each division's size.

**Table `students`**

| id | student_id | first_name | last_name | date_of_birth | grade_level | enrollment_status | gpa | is_honors_student | school_division_id | diploma_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 2025-04-02 | 29 | active | 12.45 | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2022-09-13 | 33 | graduated | 14.90 | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 2023-02-24 | 37 | withdrawn | 17.35 | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 2024-07-08 | 41 | pending | 19.80 | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Students are the central actors in the academic ecosystem. Each student record captures personal identifiers, academic standing, and institutional affiliations. Stephanie Collins (student ID 392507) is an active student in grade level 29, enrolled in school division 1, pursuing diploma 1, with a GPA of 12.45 and honors status. Janice Johnston (student ID 25388256) has graduated from division 2, holding diploma 2, with a GPA of 14.90. Upal Saha (student ID id_16) is currently withdrawn from division 3, holding diploma 3, with a GPA of 17.35 and honors designation. Katherine Snyder (student ID gd_taxc_2211) has pending enrollment in division 4, pursuing diploma 4, with a GPA of 19.80. The enrollment_status field tracks whether a student is active, graduated, withdrawn, or pending, while the is_honors_student flag identifies high-achieving individuals.

**Table `courses`**

| course_id | course_code | course_title | department | credits | is_verified | is_advanced | semester | faculty_member_id | prerequisite_of_course_id | diploma_requirement_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | 7.45 | true | true | fall | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | 11.90 | false | false | spring | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | 16.35 | true | true | year | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | 20.80 | false | false | fall | 4 | 4 | 4 | 2025-04-16 09:14:00 |

Courses represent the structured academic units through which students acquire knowledge. Each course is assigned a code, a title, and a department, along with credit value and verification status. The Baseline Series D (course code 10238263) is a 7.45-credit course in the adaptive-departme-89 department, offered in the fall semester, marked as both verified and advanced. Distributed Assessment (4463667) carries 11.90 credits in distributed-departme-90, offered in spring, and is neither verified nor advanced. Adaptive Survey (24077793) is a 16.35-credit course in baseline-departme-91, offered year-round, verified and advanced. Primary Corridor A (1204-0009-L) is a 20.80-credit pilot-departme-92 course offered in fall, with neither verification nor advanced status. The is_verified flag indicates whether the course content has undergone formal review, while is_advanced signals whether the material is at an advanced level.

**Table `faculty_members`**

| id | faculty_id | first_name | last_name | department | years_of_experience | is_tenured | hire_date | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | adaptive-departme-89 | 7 | false | 2023-06-01 | 2025-01-01 00:14:00 |
| 2 | 605968 | Janice Johnston | Heather Beasley | distributed-departme-90 | 10 | true | 2024-11-12 | 2025-02-06 03:14:00 |
| 3 | 10449508 | Upal Saha | Audrey Taylor | baseline-departme-91 | 13 | false | 2025-04-23 | 2025-03-11 06:14:00 |
| 4 | 2002007020230 | Katherine Snyder | Susan Wagner | pilot-departme-92 | 16 | true | 2022-09-07 | 2025-04-16 09:14:00 |

Faculty members deliver instruction and provide academic oversight. Each faculty record includes a unique identifier, department assignment, experience level, and tenure status. Stephanie Collins (faculty ID 98a02b9c-8fcd-11eb-924d-9cd76263cbd0) works in adaptive-departme-89 with seven years of experience and is not tenured, having been hired in June 2023. Janice Johnston (faculty ID 605968) is in distributed-departme-90, with ten years of experience and tenured status, hired in November 2024. Upal Saha (faculty ID 10449508) serves baseline-departme-91 with thirteen years of experience, not tenured, hired in April 2025. Katherine Snyder (faculty ID 2002007020230) is in pilot-departme-92, with sixteen years of experience and tenured status, hired in September 2022. The years_of_experience field quantifies professional tenure, while is_tenured distinguishes permanent from non-permanent appointments.

**Table `diplomas`**

| id | diploma_id | issue_date | has_seal | total_credits_earned | is_advanced_studies | student_id |
|---|---|---|---|---|---|---|
| 1 | 505981 | 2023-02-01 | true | 3.95 | true | 1 |
| 2 | 5082983 | 2024-07-12 | false | 5.90 | false | 2 |
| 3 | 4716404 | 2025-12-23 | true | 7.85 | true | 3 |
| 4 | 2638 | 2022-05-07 | false | 9.80 | false | 4 |

Diplomas document the credentialing outcomes for students. Each diploma record links to a student and captures the issue date, seal status, total credits earned, and advanced studies designation. Diploma 505981 was issued to student 1 on February 1, 2023, carries a seal, records 3.95 total credits earned, and is designated as advanced studies. Diploma 5082983 was issued to student 2 on July 12, 2024, has no seal, records 5.90 credits, and is not advanced studies. Diploma 4716404 was issued to student 3 on December 23, 2025, carries a seal, records 7.85 credits, and is advanced studies. Diploma 2638 was issued to student 4 on May 7, 2022, has no seal, records 9.80 credits, and is not advanced studies. The has_seal field indicates formal recognition, while is_advanced_studies marks whether the diploma reflects advanced-level work.

**Table `diploma_requirements`**

| id | requirement_id | description | minimum_credits | is_verified | regulation_code | diploma_id |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 17.20 | true | 5917296 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 20.40 | false | 82874 | 2 |
| 3 | 99901 | Baseline Series | 23.60 | true | 1336197 | 3 |
| 4 | 5917277 | Distributed Assessment | 26.80 | false | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 4 |

Diploma requirements define the academic criteria that must be satisfied for credential issuance. Each requirement specifies a description, minimum credit threshold, verification status, and a regulation code. Requirement 778568, titled Extended Survey, mandates 17.20 minimum credits, is verified, and is governed by regulation code 5917296, attached to diploma 1. Requirement lu_tax_code_template_b_VB-EC-0, titled Pilot Corridor A, requires 20.40 minimum credits, is not verified, and is governed by regulation code 82874, attached to diploma 2. Requirement 99901, titled Baseline Series, requires 23.60 minimum credits, is verified, and is governed by regulation code 1336197, attached to diploma 3. Requirement 5917277, titled Distributed Assessment, requires 26.80 minimum credits, is not verified, and is governed by regulation code 57e54d62-8fcd-11eb-924d-9cd76263cbd0, attached to diploma 4.

**Table `extracurricular_activities`**

| extracurricular_activity_id | activity_id | activity_name | category | is_competitive | season | school_division_id |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | athletics | false | fall | 1 |
| 2 | 4180957 | Compact Standard A | arts | true | winter | 2 |
| 3 | 168545 | Legacy Framework | club | false | spring | 3 |
| 4 | default_chart_a_account_53 | Regional Protocol | service | true | year | 4 |

Extracurricular activities extend student engagement beyond the classroom. These records capture activity identifiers, names, descriptions, and the school divisions to which they belong. Activities provide structured opportunities for participation that complement academic work.

The relational structure of the institution is completed by the association tables that link entities together. Students are assigned to divisions through the divisions_students table, which maps individual students to their respective school divisions. Course enrollments are recorded in students_courses, connecting students to the courses they take. Students participate in extracurricular activities through the students_activities table, which logs their involvement. Faculty members teach courses via the members_courses table, and faculty-student mentoring or advising relationships are captured in members_students. The diplomas_requirements table links diploma records to their constituent requirements, while requirements_courses maps diploma requirements to the courses that satisfy them. Finally, activities_students records the participation of students in extracurricular activities, providing a complete picture of student engagement.

**Table `divisions_students`**

| school_division_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `students_courses`**

| student_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `students_activities`**

| student_id | extracurricular_activity_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `members_courses`**

| faculty_member_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `members_students`**

| faculty_member_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `diplomas_requirements`**

| diploma_id | diploma_requirement_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `requirements_courses`**

| diploma_requirement_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `activities_students`**

| extracurricular_activity_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The views in this system synthesize data from multiple tables to answer specific operational questions. Each view joins relevant records to present a consolidated perspective on a particular aspect of the educational program.

**View `v_school_division_student_detail`**

```sql
CREATE VIEW v_school_division_student_detail AS
SELECT a.school_division_id, a.division_id, a.division_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM school_divisions a
  JOIN divisions_students j ON j.school_division_id = a.school_division_id
  JOIN students b ON b.id = j.student_id;
```

| school_division_id | division_id | division_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 89512 | Composite Protocol | 1 | 392507 | Stephanie Collins |
| 1 | 89512 | Composite Protocol | 2 | 25388256 | Janice Johnston |
| 2 | 10207146 | Compact Programme A | 2 | 25388256 | Janice Johnston |
| 2 | 10207146 | Compact Programme A | 3 | id_16 | Upal Saha |
| 3 | 212 | Legacy Standard | 3 | id_16 | Upal Saha |
| 3 | 212 | Legacy Standard | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | id_14 | Regional Framework | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | id_14 | Regional Framework | 1 | 392507 | Stephanie Collins |

This view answers the question of which students belong to which school divisions, presenting division-level context alongside individual student records. It enables administrators to see enrollment distribution across divisions and to track student-level information within the divisional framework.

**View `v_student_school_division`**

```sql
CREATE VIEW v_student_school_division AS
SELECT a.id, a.student_id, a.first_name, a.last_name, b.school_division_id AS division_school_division_id, b.division_id AS division_division_id, b.division_name AS division_division_name
FROM students a JOIN school_divisions b ON a.school_division_id = b.school_division_id;
```

| id | student_id | first_name | last_name | division_school_division_id | division_division_id | division_division_name |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 1 | 89512 | Composite Protocol |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2 | 10207146 | Compact Programme A |
| 3 | id_16 | Upal Saha | Audrey Taylor | 3 | 212 | Legacy Standard |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 4 | id_14 | Regional Framework |

This view provides the inverse perspective, showing each student's assigned school division. It is useful for verifying that every student has a valid division assignment and for generating reports grouped by division.

**View `v_student_course_detail`**

```sql
CREATE VIEW v_student_course_detail AS
SELECT a.id, a.student_id, a.first_name, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM students a
  JOIN students_courses j ON j.student_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | student_id | first_name | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | 1 | 10238263 | Baseline Series D |
| 1 | 392507 | Stephanie Collins | 2 | 4463667 | Distributed Assessment |
| 2 | 25388256 | Janice Johnston | 2 | 4463667 | Distributed Assessment |
| 2 | 25388256 | Janice Johnston | 3 | 24077793 | Adaptive Survey |
| 3 | id_16 | Upal Saha | 3 | 24077793 | Adaptive Survey |
| 3 | id_16 | Upal Saha | 4 | 1204-0009-L | Primary Corridor A |
| 4 | gd_taxc_2211 | Katherine Snyder | 4 | 1204-0009-L | Primary Corridor A |
| 4 | gd_taxc_2211 | Katherine Snyder | 1 | 10238263 | Baseline Series D |

This view links students to their enrolled courses, revealing the academic load and course selection patterns of individual students. It supports registration audits, prerequisite validation, and academic advising by presenting student-course pairings with full course metadata.

**View `v_student_extracurricular_activity_detail`**

```sql
CREATE VIEW v_student_extracurricular_activity_detail AS
SELECT a.id, a.student_id, a.first_name, b.extracurricular_activity_id AS activity_extracurricular_activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM students a
  JOIN students_activities j ON j.student_id = a.id
  JOIN extracurricular_activities b ON b.extracurricular_activity_id = j.extracurricular_activity_id;
```

| id | student_id | first_name | activity_extracurricular_activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | 1 | 8843761 | Composite Programme |
| 1 | 392507 | Stephanie Collins | 2 | 4180957 | Compact Standard A |
| 2 | 25388256 | Janice Johnston | 2 | 4180957 | Compact Standard A |
| 2 | 25388256 | Janice Johnston | 3 | 168545 | Legacy Framework |
| 3 | id_16 | Upal Saha | 3 | 168545 | Legacy Framework |
| 3 | id_16 | Upal Saha | 4 | default_chart_a_account_53 | Regional Protocol |
| 4 | gd_taxc_2211 | Katherine Snyder | 4 | default_chart_a_account_53 | Regional Protocol |
| 4 | gd_taxc_2211 | Katherine Snyder | 1 | 8843761 | Composite Programme |

This view connects students to their extracurricular activities, documenting participation beyond the classroom. It supports engagement tracking, activity-based reporting, and the identification of students involved in multiple programs.

**View `v_student_diploma`**

```sql
CREATE VIEW v_student_diploma AS
SELECT a.id, a.student_id, a.first_name, a.last_name, b.id AS diploma_id, b.diploma_id AS diploma_diploma_id, b.issue_date AS diploma_issue_date
FROM students a JOIN diplomas b ON a.diploma_id = b.id;
```

| id | student_id | first_name | last_name | diploma_id | diploma_diploma_id | diploma_issue_date |
|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 1 | 505981 | 2023-02-01 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2 | 5082983 | 2024-07-12 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 3 | 4716404 | 2025-12-23 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 4 | 2638 | 2022-05-07 |

This view ties students to their diploma records, providing a clear view of credentialing status. It answers questions about which students have earned diplomas, when those diplomas were issued, and whether they carry seals or advanced studies designations.

**View `v_course_faculty_member`**

```sql
CREATE VIEW v_course_faculty_member AS
SELECT a.course_id, a.course_code, a.course_title, a.department, b.id AS member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM courses a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| course_id | course_code | course_title | department | member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | 2 | 605968 | Janice Johnston |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | 3 | 10449508 | Upal Saha |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | 4 | 2002007020230 | Katherine Snyder |

This view reveals which faculty members are assigned to which courses, supporting workload analysis, departmental staffing reviews, and the identification of faculty-course pairings. It confirms that every course has an assigned instructor.

**View `v_course_course`**

```sql
CREATE VIEW v_course_course AS
SELECT a.course_id, a.course_code, a.course_title, a.department, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM courses a JOIN courses b ON a.prerequisite_of_course_id = b.course_id;
```

| course_id | course_code | course_title | department | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | 1 | 10238263 | Baseline Series D |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | 2 | 4463667 | Distributed Assessment |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | 3 | 24077793 | Adaptive Survey |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | 4 | 1204-0009-L | Primary Corridor A |

This view presents courses alongside their prerequisite relationships, enabling administrators to verify that prerequisite chains are properly defined and to identify courses that serve as prerequisites for others.

**View `v_course_diploma_requirement`**

```sql
CREATE VIEW v_course_diploma_requirement AS
SELECT a.course_id, a.course_code, a.course_title, a.department, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.description AS requirement_description
FROM courses a JOIN diploma_requirements b ON a.diploma_requirement_id = b.id;
```

| course_id | course_code | course_title | department | requirement_id | requirement_requirement_id | requirement_description |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | 1 | 778568 | Extended Survey |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | 3 | 99901 | Baseline Series |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | 4 | 5917277 | Distributed Assessment |

This view connects courses to the diploma requirements they satisfy, supporting curriculum mapping and ensuring that course offerings align with credentialing criteria. It answers which courses contribute to meeting specific diploma requirements.

**View `v_faculty_member_course_detail`**

```sql
CREATE VIEW v_faculty_member_course_detail AS
SELECT a.id, a.faculty_id, a.first_name, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM faculty_members a
  JOIN members_courses j ON j.faculty_member_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | faculty_id | first_name | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1 | 10238263 | Baseline Series D |
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 2 | 4463667 | Distributed Assessment |
| 2 | 605968 | Janice Johnston | 2 | 4463667 | Distributed Assessment |
| 2 | 605968 | Janice Johnston | 3 | 24077793 | Adaptive Survey |
| 3 | 10449508 | Upal Saha | 3 | 24077793 | Adaptive Survey |
| 3 | 10449508 | Upal Saha | 4 | 1204-0009-L | Primary Corridor A |
| 4 | 2002007020230 | Katherine Snyder | 4 | 1204-0009-L | Primary Corridor A |
| 4 | 2002007020230 | Katherine Snyder | 1 | 10238263 | Baseline Series D |

This view provides a comprehensive look at each faculty member's teaching assignments, combining faculty information with course details. It supports workload balancing, departmental planning, and the identification of faculty who teach across multiple courses.

**View `v_faculty_member_student_detail`**

```sql
CREATE VIEW v_faculty_member_student_detail AS
SELECT a.id, a.faculty_id, a.first_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM faculty_members a
  JOIN members_students j ON j.faculty_member_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | faculty_id | first_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1 | 392507 | Stephanie Collins |
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 2 | 25388256 | Janice Johnston |
| 2 | 605968 | Janice Johnston | 2 | 25388256 | Janice Johnston |
| 2 | 605968 | Janice Johnston | 3 | id_16 | Upal Saha |
| 3 | 10449508 | Upal Saha | 3 | id_16 | Upal Saha |
| 3 | 10449508 | Upal Saha | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2002007020230 | Katherine Snyder | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2002007020230 | Katherine Snyder | 1 | 392507 | Stephanie Collins |

This view links faculty members to students, capturing advising relationships or mentoring connections. It enables administrators to track faculty-student pairings and ensure that students have appropriate faculty support.

**View `v_diploma_student`**

```sql
CREATE VIEW v_diploma_student AS
SELECT a.id, a.diploma_id, a.issue_date, a.has_seal, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM diplomas a JOIN students b ON a.student_id = b.id;
```

| id | diploma_id | issue_date | has_seal | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|---|
| 1 | 505981 | 2023-02-01 | true | 1 | 392507 | Stephanie Collins |
| 2 | 5082983 | 2024-07-12 | false | 2 | 25388256 | Janice Johnston |
| 3 | 4716404 | 2025-12-23 | true | 3 | id_16 | Upal Saha |
| 4 | 2638 | 2022-05-07 | false | 4 | gd_taxc_2211 | Katherine Snyder |

This view presents diploma records alongside their associated students, providing a clear mapping of credential issuance. It supports transcript generation, verification of credentialing outcomes, and reporting on diploma distribution.

**View `v_diploma_diploma_requirement_detail`**

```sql
CREATE VIEW v_diploma_diploma_requirement_detail AS
SELECT a.id, a.diploma_id, a.issue_date, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.description AS requirement_description
FROM diplomas a
  JOIN diplomas_requirements j ON j.diploma_id = a.id
  JOIN diploma_requirements b ON b.id = j.diploma_requirement_id;
```

| id | diploma_id | issue_date | requirement_id | requirement_requirement_id | requirement_description |
|---|---|---|---|---|---|
| 1 | 505981 | 2023-02-01 | 1 | 778568 | Extended Survey |
| 1 | 505981 | 2023-02-01 | 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A |
| 2 | 5082983 | 2024-07-12 | 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A |
| 2 | 5082983 | 2024-07-12 | 3 | 99901 | Baseline Series |
| 3 | 4716404 | 2025-12-23 | 3 | 99901 | Baseline Series |
| 3 | 4716404 | 2025-12-23 | 4 | 5917277 | Distributed Assessment |
| 4 | 2638 | 2022-05-07 | 4 | 5917277 | Distributed Assessment |
| 4 | 2638 | 2022-05-07 | 1 | 778568 | Extended Survey |

This view connects diplomas to their constituent requirements, enabling administrators to verify that all required criteria have been met for each diploma. It supports compliance auditing and the identification of any unmet requirements.

**View `v_diploma_requirement_course_detail`**

```sql
CREATE VIEW v_diploma_requirement_course_detail AS
SELECT a.id, a.requirement_id, a.description, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM diploma_requirements a
  JOIN requirements_courses j ON j.diploma_requirement_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | requirement_id | description | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 1 | 10238263 | Baseline Series D |
| 1 | 778568 | Extended Survey | 2 | 4463667 | Distributed Assessment |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 2 | 4463667 | Distributed Assessment |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 3 | 24077793 | Adaptive Survey |
| 3 | 99901 | Baseline Series | 3 | 24077793 | Adaptive Survey |
| 3 | 99901 | Baseline Series | 4 | 1204-0009-L | Primary Corridor A |
| 4 | 5917277 | Distributed Assessment | 4 | 1204-0009-L | Primary Corridor A |
| 4 | 5917277 | Distributed Assessment | 1 | 10238263 | Baseline Series D |

This view maps diploma requirements to the courses that satisfy them, supporting curriculum alignment analysis. It answers which courses fulfill specific requirement thresholds and helps ensure that course offerings adequately cover all required areas.

**View `v_diploma_requirement_diploma`**

```sql
CREATE VIEW v_diploma_requirement_diploma AS
SELECT a.id, a.requirement_id, a.description, a.minimum_credits, b.id AS diploma_id, b.diploma_id AS diploma_diploma_id, b.issue_date AS diploma_issue_date
FROM diploma_requirements a JOIN diplomas b ON a.diploma_id = b.id;
```

| id | requirement_id | description | minimum_credits | diploma_id | diploma_diploma_id | diploma_issue_date |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 17.20 | 1 | 505981 | 2023-02-01 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 20.40 | 2 | 5082983 | 2024-07-12 |
| 3 | 99901 | Baseline Series | 23.60 | 3 | 4716404 | 2025-12-23 |
| 4 | 5917277 | Distributed Assessment | 26.80 | 4 | 2638 | 2022-05-07 |

This view presents diploma requirements alongside their parent diplomas, providing a clear view of the credentialing framework. It supports the review of requirement structures and the identification of requirements that apply to multiple diplomas.

**View `v_extracurricular_activity_student_detail`**

```sql
CREATE VIEW v_extracurricular_activity_student_detail AS
SELECT a.extracurricular_activity_id, a.activity_id, a.activity_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM extracurricular_activities a
  JOIN activities_students j ON j.extracurricular_activity_id = a.extracurricular_activity_id
  JOIN students b ON b.id = j.student_id;
```

| extracurricular_activity_id | activity_id | activity_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | 1 | 392507 | Stephanie Collins |
| 1 | 8843761 | Composite Programme | 2 | 25388256 | Janice Johnston |
| 2 | 4180957 | Compact Standard A | 2 | 25388256 | Janice Johnston |
| 2 | 4180957 | Compact Standard A | 3 | id_16 | Upal Saha |
| 3 | 168545 | Legacy Framework | 3 | id_16 | Upal Saha |
| 3 | 168545 | Legacy Framework | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | default_chart_a_account_53 | Regional Protocol | 4 | gd_taxc_2211 | Katherine Snyder |
| 4 | default_chart_a_account_53 | Regional Protocol | 1 | 392507 | Stephanie Collins |

This view connects extracurricular activities to participating students, documenting the breadth of student engagement. It supports activity-based reporting, participation analysis, and the identification of high-engagement students.

**View `v_extracurricular_activity_school_division`**

```sql
CREATE VIEW v_extracurricular_activity_school_division AS
SELECT a.extracurricular_activity_id, a.activity_id, a.activity_name, a.category, b.school_division_id AS division_school_division_id, b.division_id AS division_division_id, b.division_name AS division_division_name
FROM extracurricular_activities a JOIN school_divisions b ON a.school_division_id = b.school_division_id;
```

| extracurricular_activity_id | activity_id | activity_name | category | division_school_division_id | division_division_id | division_division_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | athletics | 1 | 89512 | Composite Protocol |
| 2 | 4180957 | Compact Standard A | arts | 2 | 10207146 | Compact Programme A |
| 3 | 168545 | Legacy Framework | club | 3 | 212 | Legacy Standard |
| 4 | default_chart_a_account_53 | Regional Protocol | service | 4 | id_14 | Regional Framework |

This view links extracurricular activities to their host school divisions, enabling administrators to track which divisions offer which activities and to analyze activity distribution across the institution.

The educational program administration system captures a comprehensive picture of institutional operations. School divisions provide the organizational structure, students populate the academic programs, courses deliver the curriculum, faculty members provide instruction, and diplomas certify completion. Diploma requirements establish the criteria for credentialing, while extracurricular activities enrich the student experience. The association tables and views weave these entities into a coherent operational framework, enabling administrators to track enrollment, monitor academic progress, verify credential compliance, and support student success across the institution.