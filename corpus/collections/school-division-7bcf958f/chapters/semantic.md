## Domain Modelling and Relational Materialisation

The educational administration domain captures the lifecycle of students enrolled in school divisions, their progression through courses taught by faculty members, and the credentialing pathways that culminate in diplomas. At its core, the model distinguishes between *entities*—school divisions, students, courses, faculty members, diplomas, diploma requirements, and extracurricular activities—and *associations* that bind them in many-to-many or optional relationships. The normalised schema decomposes these concepts into base tables whose primary keys are referenced by foreign keys in both child tables and junction tables. Materialised views then reassemble the normalised facts into domain-level narratives: which students belong to which division, which courses satisfy which diploma requirements, and which faculty members teach which students. Every identifier, from UUIDs like `98a02b9c-8fcd-11eb-924d-9cd76263cbd0` to short codes like `id_16`, is preserved verbatim in the relational layer so that audit trails remain traceable.

### Core Entity Tables

The foundation of the schema consists of seven entity tables, each representing a distinct concept in the educational domain. The `school_divisions` table anchors the organisational hierarchy.

**Table `school_divisions`**

| school_division_id | division_id | division_name | region | established_date | total_enrollment | district_type |
|---|---|---|---|---|---|---|
| 1 | 89512 | Composite Protocol | distributed-region-12 | 2024-03-27 | 382 | public |
| 2 | 10207146 | Compact Programme A | baseline-region-13 | 2025-08-11 | 4 | charter |
| 3 | 212 | Legacy Standard | pilot-region-14 | 2022-01-22 | 496 | magnet |
| 4 | id_14 | Regional Framework | extended-region-15 | 2023-06-06 | 101 | public |

Each row in `school_divisions` is identified by a surrogate `school_division_id` and carries a human-readable `division_id` such as `89512` or `id_14`. The `division_name` column holds labels like "Composite Protocol" and "Compact Programme A", while the `region` column (e.g., `distributed-region-12`, `baseline-region-13`) captures geographic or administrative grouping. The `established_date` records when the division was founded, `total_enrollment` provides a snapshot of headcount, and `district_type` classifies the division as `public`, `charter`, or `magnet`. These attributes are atomic and non-repeating, making the table a clean entity store.

The `students` table records individual learners.

**Table `students`**

| id | student_id | first_name | last_name | date_of_birth | grade_level | enrollment_status | gpa | is_honors_student | school_division_id | diploma_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Stephanie Collins | Paul Allen | 2025-04-02 | 29 | active | 12.45 | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 25388256 | Janice Johnston | Heather Beasley | 2022-09-13 | 33 | graduated | 14.90 | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | id_16 | Upal Saha | Audrey Taylor | 2023-02-24 | 37 | withdrawn | 17.35 | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 2024-07-08 | 41 | pending | 19.80 | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The primary key `id` is a surrogate integer, while `student_id` carries the domain-level identifier (e.g., `392507`, `25388256`, `id_16`, `gd_taxc_2211`). The `first_name` and `last_name` columns store names such as "Stephanie Collins" and "Janice Johnston". The `date_of_birth` column holds dates like `2025-04-02`, and `grade_level` is an integer (29, 33, 37, 41 in the sample). The `enrollment_status` column is an enumerated field with values `active`, `graduated`, `withdrawn`, and `pending`. The `gpa` column stores a numeric grade-point average (12.45, 14.90, 17.35, 19.80), and `is_honors_student` is a boolean flag. Two foreign keys anchor the student to the wider schema: `school_division_id` references `school_divisions(school_division_id)`, and `diploma_id` references `diplomas(id)`. The `created_at` and `updated_at` timestamps provide auditability.

The `courses` table models academic offerings.

**Table `courses`**

| course_id | course_code | course_title | department | credits | is_verified | is_advanced | semester | faculty_member_id | prerequisite_of_course_id | diploma_requirement_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | 7.45 | true | true | fall | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | 11.90 | false | false | spring | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | 16.35 | true | true | year | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | 20.80 | false | false | fall | 4 | 4 | 4 | 2025-04-16 09:14:00 |

Each course has a surrogate `course_id`, a `course_code` (e.g., `10238263`, `4463667`, `24077793`, `1204-0009-L`), and a `course_title` such as "Baseline Series D" and "Distributed Assessment". The `department` column (e.g., `adaptive-departme-89`) groups courses administratively. The `credits` column stores a decimal value (7.45, 11.90, 16.35, 20.80). Boolean flags `is_verified` and `is_advanced` indicate course status, while `semester` holds values like `fall`, `spring`, and `year`. The foreign key `faculty_member_id` references `faculty_members(id)`, and the self-referencing column `prerequisite_of_course_id` creates a prerequisite chain within the same table. The `diploma_requirement_id` column links the course to a specific diploma requirement, and `created_at` provides a timestamp.

The `faculty_members` table stores teaching staff.

**Table `faculty_members`**

| id | faculty_id | first_name | last_name | department | years_of_experience | is_tenured | hire_date | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | adaptive-departme-89 | 7 | false | 2023-06-01 | 2025-01-01 00:14:00 |
| 2 | 605968 | Janice Johnston | Heather Beasley | distributed-departme-90 | 10 | true | 2024-11-12 | 2025-02-06 03:14:00 |
| 3 | 10449508 | Upal Saha | Audrey Taylor | baseline-departme-91 | 13 | false | 2025-04-23 | 2025-03-11 06:14:00 |
| 4 | 2002007020230 | Katherine Snyder | Susan Wagner | pilot-departme-92 | 16 | true | 2022-09-07 | 2025-04-16 09:14:00 |

The surrogate primary key `id` is paired with a domain `faculty_id` (e.g., the UUID `98a02b9c-8fcd-11eb-924d-9cd76263cbd0`). Names like "Stephanie Collins" and "Janice Johnston" are stored in `first_name` and `last_name`. The `department` column mirrors the department values in `courses`. `years_of_experience` is an integer (7, 10, 13, 16), `is_tenured` is a boolean, and `hire_date` records the employment start date.

The `diplomas` table represents credential records awarded to students.

**Table `diplomas`**

| id | diploma_id | issue_date | has_seal | total_credits_earned | is_advanced_studies | student_id |
|---|---|---|---|---|---|---|
| 1 | 505981 | 2023-02-01 | true | 3.95 | true | 1 |
| 2 | 5082983 | 2024-07-12 | false | 5.90 | false | 2 |
| 3 | 4716404 | 2025-12-23 | true | 7.85 | true | 3 |
| 4 | 2638 | 2022-05-07 | false | 9.80 | false | 4 |

Each diploma row has a surrogate `id`, a domain `diploma_id` (e.g., `505981`, `5082983`), and an `issue_date`. The `has_seal` boolean indicates whether the diploma carries an official seal, `total_credits_earned` stores a decimal (3.95, 5.90, 7.85, 9.80), and `is_advanced_studies` marks advanced-program diplomas. The foreign key `student_id` references `students(id)`, establishing the one-to-one or one-to-many relationship between a student and their diploma(s).

The `diploma_requirements` table defines the criteria that must be satisfied for a diploma to be awarded.

**Table `diploma_requirements`**

| id | requirement_id | description | minimum_credits | is_verified | regulation_code | diploma_id |
|---|---|---|---|---|---|---|
| 1 | 778568 | Extended Survey | 17.20 | true | 5917296 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Pilot Corridor A | 20.40 | false | 82874 | 2 |
| 3 | 99901 | Baseline Series | 23.60 | true | 1336197 | 3 |
| 4 | 5917277 | Distributed Assessment | 26.80 | false | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 4 |

Each requirement has a surrogate `id`, a domain `requirement_id` (e.g., `778568`, `lu_tax_code_template_b_VB-EC-0`), and a `description` such as "Extended Survey" and "Pilot Corridor A". The `minimum_credits` column stores the credit threshold (17.20, 20.40, 23.60, 26.80). The `is_verified` boolean and `regulation_code` (e.g., `5917296`, `82874`, `1336197`) provide regulatory context. The foreign key `diploma_id` references `diplomas(id)`, binding each requirement to a specific diploma.

The `extracurricular_activities` table captures non-academic programmes.

**Table `extracurricular_activities`**

| extracurricular_activity_id | activity_id | activity_name | category | is_competitive | season | school_division_id |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | athletics | false | fall | 1 |
| 2 | 4180957 | Compact Standard A | arts | true | winter | 2 |
| 3 | 168545 | Legacy Framework | club | false | spring | 3 |
| 4 | default_chart_a_account_53 | Regional Protocol | service | true | year | 4 |

This table stores activity records that students may participate in alongside their coursework. The structure mirrors the entity-table pattern with a surrogate primary key, domain identifiers, descriptive fields, and audit timestamps.

### Junction and Association Tables

Many-to-many relationships and optional associations are materialised as junction tables. These tables contain only foreign keys (and optionally a timestamp or weight column), forming the relational bridge between entity pairs.

The `divisions_students` table links school divisions to students.

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

This junction table resolves the many-to-many relationship between `school_divisions` and `students`, allowing a student to be associated with multiple divisions and a division to contain multiple students.

The `students_courses` table records student enrolments in courses.

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

Each row in `students_courses` represents a student's enrolment in a specific course, linking `students` to `courses`. This is the primary enrolment junction.

The `students_activities` table records student participation in extracurricular activities.

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

This junction links `students` to `extracurricular_activities`, capturing which students participate in which activities.

The `members_courses` table associates faculty members with the courses they teach.

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

This junction resolves the faculty-to-course assignment, allowing a faculty member to teach multiple courses and a course to be taught by multiple faculty members.

The `members_students` table records the advisor or mentor relationship between faculty members and students.

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

This association table links `faculty_members` to `students`, capturing advisory relationships that are distinct from teaching relationships.

The `diplomas_requirements` table links diplomas to their constituent requirements.

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

While `diploma_requirements` already has a `diploma_id` foreign key, this junction table provides an additional many-to-many layer, allowing a diploma to reference multiple requirements and a requirement to be shared across diplomas.

The `requirements_courses` table maps diploma requirements to the courses that satisfy them.

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

This junction connects `diploma_requirements` to `courses`, establishing which courses count toward which requirements. It complements the direct `diploma_requirement_id` column in the `courses` table by providing an explicit many-to-many mapping.

The `activities_students` table provides an alternative or supplementary link between activities and students.

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

This table mirrors `students_activities` and may serve as a redundant or partitioned representation of the same relationship.

### Materialised Views

The schema includes sixteen materialised views that reassemble normalised data into domain-level narratives. Each view answers a specific analytical question by joining the relevant base and junction tables.

The view `v_school_division_student_detail` presents a comprehensive student roster per division.

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

This view joins `school_divisions` with `students` (through `divisions_students` if applicable) to answer: "Which students are enrolled in which division, and what are their academic profiles?" A row might show that Stephanie Collins (student `392507`) is enrolled in the "Composite Protocol" division (region `distributed-region-12`, type `public`) with a GPA of 12.45 and active status.

The view `v_student_school_division` provides a simplified student-to-division mapping.

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

This view answers: "Which division does each student belong to?" It is a leaner projection of the same relationship, useful for dropdowns and quick lookups.

The view `v_student_course_detail` presents a student's course enrolment with full course metadata.

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

By joining `students`, `students_courses`, and `courses`, this view answers: "Which courses is each student enrolled in, and what are the course details?" A row might show that Janice Johnston (student `25388256`) is enrolled in "Distributed Assessment" (course code `4463667`, 11.90 credits, spring semester).

The view `v_student_extracurricular_activity_detail` presents a student's activity participation.

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

This view joins `students` with `students_activities` and `extracurricular_activities` to answer: "Which extracurricular activities is each student participating in?"

The view `v_student_diploma` presents a student's diploma information.

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

By joining `students` and `diplomas`, this view answers: "What diploma has each student earned, and what are its attributes?" A row might show that Upal Saha (student `id_16`) holds diploma `4716404`, issued on `2025-12-23`, with 7.85 total credits earned and an advanced studies designation.

The view `v_course_faculty_member` presents the faculty member teaching each course.

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

This view joins `courses` with `faculty_members` (through `members_courses` or directly via `faculty_member_id`) to answer: "Which faculty member teaches each course?" A row might show that "Baseline Series D" (course `10238263`) is taught by Stephanie Collins (faculty UUID `98a02b9c-8fcd-11eb-924d-9cd76263cbd0`) from department `adaptive-departme-89`.

The view `v_course_course` presents a course with its prerequisite information.

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

By self-joining `courses` on the `prerequisite_of_course_id` column, this view answers: "Which courses are prerequisites for other courses?" A row might show that course `10238263` (Baseline Series D) is a prerequisite for itself (or another course, depending on the data), revealing the prerequisite chain.

The view `v_course_diploma_requirement` presents the diploma requirement associated with each course.

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

This view joins `courses` with `diploma_requirements` to answer: "Which diploma requirement does each course satisfy?" A row might show that "Adaptive Survey" (course `24077793`) satisfies requirement `99901` (Baseline Series) with a minimum of 23.60 credits.

The view `v_faculty_member_course_detail` presents a faculty member's teaching assignments with full course metadata.

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

By joining `faculty_members` with `members_courses` and `courses`, this view answers: "Which courses does each faculty member teach, and what are the course details?" A row might show that Janice Johnston (faculty `605968`, tenured, 10 years of experience) teaches "Distributed Assessment" (course `4463667`, 11.90 credits).

The view `v_faculty_member_student_detail` presents the students advised by each faculty member.

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

This view joins `faculty_members` with `members_students` and `students` to answer: "Which students are advised by each faculty member?" A row might show that Katherine Snyder (faculty `2002007020230`, 16 years of experience, tenured) advises student `gd_taxc_2211` (Katherine Snyder, pending status, GPA 19.80).

The view `v_diploma_student` presents the student who holds each diploma.

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

By joining `diplomas` with `students`, this view answers: "Which student holds each diploma?" A row might show that diploma `505981` (issued `2023-02-01`, with seal, 3.95 credits, advanced studies) is held by student `392507` (Stephanie Collins).

The view `v_diploma_diploma_requirement_detail` presents the requirements associated with each diploma.

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

This view joins `diplomas` with `diplomas_requirements` and `diploma_requirements` to answer: "Which requirements must be satisfied for each diploma?" A row might show that diploma `505981` requires "Extended Survey" (requirement `778568`) with a minimum of 17.20 credits.

The view `v_diploma_requirement_course_detail` presents the courses that satisfy each diploma requirement.

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

By joining `diploma_requirements` with `requirements_courses` and `courses`, this view answers: "Which courses count toward each diploma requirement?" A row might show that requirement `778568` (Extended Survey, 17.20 minimum credits) is satisfied by course `10238263` (Baseline Series D, 7.45 credits, fall semester).

The view `v_diploma_requirement_diploma` presents the diploma associated with each requirement.

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

This view joins `diploma_requirements` with `diplomas` to answer: "Which diploma does each requirement belong to?" A row might show that requirement `lu_tax_code_template_b_VB-EC-0` (Pilot Corridor A, 20.40 minimum credits) belongs to diploma `5082983`.

The view `v_extracurricular_activity_student_detail` presents the students participating in each activity.

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

By joining `extracurricular_activities` with `students_activities` and `students`, this view answers: "Which students participate in each extracurricular activity?"

The view `v_extracurricular_activity_school_division` presents the school division associated with each extracurricular activity.

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

This view joins `extracurricular_activities` with `school_divisions` (possibly through a junction or direct foreign key) to answer: "Which school division offers each extracurricular activity?"

### Synthesis

The schema follows a disciplined normalisation pattern: seven entity tables store atomic facts about the educational domain, eight junction tables resolve many-to-many relationships, and sixteen materialised views reassemble these normalised facts into domain-level narratives. Every foreign key is explicit and traceable—from `students.school_division_id` to `school_divisions.school_division_id`, from `courses.faculty_member_id` to `faculty_members.id`, from `diplomas.student_id` to `students.id`, and from `diploma_requirements.diploma_id` to `diplomas.id`. The junction tables (`divisions_students`, `students_courses`, `students_activities`, `members_courses`, `members_students`, `diplomas_requirements`, `requirements_courses`, `activities_students`) provide the relational glue that allows the views to reconstruct complex facts: a student's full academic profile, a faculty member's teaching load, a diploma's requirement chain, or an activity's participant roster. The use of both surrogate keys (`id`, `school_division_id`, `course_id`) and domain identifiers (`student_id`, `faculty_id`, `diploma_id`, `requirement_id`) ensures that the schema supports both internal referential integrity and external auditability. Representative values—Stephanie Collins with GPA 12.45 in the "Composite Protocol" division, Janice Johnston's graduated status with diploma `5082983`, the UUID `98a02b9c-8fcd-11eb-924d-9cd76263cbd0` identifying a tenured faculty member, and the regulation code `5917296` governing a diploma requirement—illustrate how the abstract schema maps to concrete domain data.