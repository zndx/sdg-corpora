## Student Records and Enrollment Tracking

The administrative infrastructure of a school district rests on a foundation of accurate student records. Each learner is assigned a unique identifier and tracked through key demographic and enrollment milestones. The core student table captures the essential attributes that determine placement, eligibility, and program participation.

**Table `students`**

| student_id | date_of_birth | grade_level | age | current_address | date_entered9th_grade | is_eligible | residence_id | school_id | athletic_history_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | integrated-current-64 | 2024-11-11 | true | 100 | 1 | 1000 |
| 25388256 | 2022-09-13 | 33 | 40 | seasonal-current-65 | 2025-04-22 | false | 101 | 2 | 1001 |
| id_16 | 2023-02-24 | 37 | 45 | regional-current-66 | 2022-09-06 | true | 102 | 3 | 1002 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | legacy-current-67 | 2023-02-17 | false | 103 | 4 | 1003 |

Consider the record for student 392507, born on 2025-04-02, currently at grade level 29 with an age of 35. This student entered ninth grade on 2024-11-11 and holds an active eligibility status. Their current address is catalogued as integrated-current-64, and they are linked to residence 100, school 1, and athletic history 1000. In contrast, student 25388256, born 2022-09-13 at grade level 33 and age 40, entered ninth grade more recently on 2025-04-22 and carries an inactive eligibility flag. Their address is seasonal-current-65, with associations to residence 101, school 2, and athletic history 1001. The identifier id_16 represents a student born 2023-02-24 at grade level 37 and age 45, who entered ninth grade on 2022-09-06 and maintains eligibility, residing at regional-current-66 under residence 102, school 3, and athletic history 1002. The final record, gd_taxc_2211, was born 2024-07-08, is at grade level 41 and age 50, entered ninth grade on 2023-02-17, and holds an inactive eligibility status, living at legacy-current-67 under residence 103, school 4, and athletic history 1003.

The residence_id, school_id, and athletic_history_id columns serve as foreign keys that anchor each student to their household, educational institution, and athletic participation record. These relationships enable the district to answer complex queries about enrollment patterns, eligibility distributions, and program access across the student population.

## Residence and Household Management

Student placement and district assignment depend heavily on where a student lives. The residences table maintains a detailed registry of household locations, tracking move-in dates, duration of occupancy, school district affiliation, and primary residence status.

**Table `residences`**

| residence_id | address | date_moved_in | duration_months | school_district | is_primary_residence | student_id | guardian_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | extended-school-45 | false | 392507 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | integrated-school-46 | true | 25388256 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | seasonal-school-47 | false | id_16 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | extended-address-75 | 2022-09-05 | 74 | regional-school-48 | true | gd_taxc_2211 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Residence 100, located at distributed-address-72, was occupied starting 2023-06-26, with a duration of 44 months. It falls under the extended-school-45 district and is not designated as a primary residence. This residence is linked to student 392507 and guardian 1000, with creation recorded on 2025-01-01 and last update on 2025-01-02. Residence 101 at baseline-address-73 has a longer occupancy of 54 months, beginning 2024-11-10, within the integrated-school-46 district, and is marked as a primary residence. It connects to student 25388256 and guardian 1001, created 2025-02-06 and updated 2025-02-09. Residence 102, pilot-address-74, shows the longest recorded duration at 64 months since 2025-04-21, under seasonal-school-47, not a primary residence, associated with student id_16 and guardian 1002, created 2025-03-11 and updated 2025-03-16. Residence 103 at extended-address-75 has a 74-month duration, occupied since 2022-09-05, in the regional-school-48 district, designated as a primary residence, linked to student gd_taxc_2211 and guardian 1003, created 2025-04-16 and updated 2025-04-23.

The is_primary_residence flag distinguishes between a student's main household and secondary or temporary living arrangements. The duration_months field provides a measure of residential stability, which can inform eligibility determinations and program placement decisions. The school_district column directly ties each residence to an administrative zone, enabling the district to verify enrollment boundaries.

## Guardian and Contact Information

Every student record requires an associated guardian for communication, consent, and emergency purposes. The guardians table stores contact details, relationship classifications, and parental status for each household contact.

**Table `guardians`**

| guardian_id | full_name | relationship | telephone | is_parent | residence_id | student_id |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | true | 100 | 392507 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | false | 101 | 25388256 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | true | 102 | id_16 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | false | 103 | gd_taxc_2211 |

Guardian 1000, Theodore Mcgrath, is listed with the relationship baseline-relation-67 and telephone adaptive-telephon-23. This guardian is confirmed as a parent (is_parent is true) and is linked to residence 100 and student 392507. Guardian 1001, recorded as Account Name, carries the relationship designation pilot-relation-68 and telephone distributed-telephon-24. This contact is not a parent (is_parent is false) and connects to residence 101 and student 25388256. Guardian 1002, identified as Saipan International Airport, has the relationship extended-relation-69 and telephone baseline-telephon-25, is a parent (is_parent is true), and is associated with residence 102 and student id_16. Guardian 1003, Norma Fisher, holds the relationship integrated-relation-70 and telephone pilot-telephon-26, is not a parent (is_parent is false), and links to residence 103 and student gd_taxc_2211.

The relationship field provides a categorical description of the guardian's connection to the student, while the telephone column ensures that the district can reach the appropriate adult for notifications and approvals. The is_parent flag distinguishes biological or legal parents from other guardians, which can be relevant for consent workflows and legal documentation.

## School Assignment and District Records

Each student is enrolled at a specific school, which determines the educational program, faculty assignments, and extracurricular opportunities available. The schools table maintains the institutional registry with details about school type, district affiliation, and enrollment policies.

**Table `schools`**

| id | school_name | school_type | district | has_open_enrollment | student_id | athletic_history_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | true | 392507 | 1000 |
| 2 | Integrated Framework | private | seasonal-district-41 | false | 25388256 | 1001 |
| 3 | Extended Protocol D | parochial | regional-district-42 | true | id_16 | 1002 |
| 4 | Pilot Programme | public | legacy-district-43 | false | gd_taxc_2211 | 1003 |

School 1, named Seasonal Standard, operates as a public institution within the integrated-district-40 and permits open enrollment (has_open_enrollment is true). It is associated with student 392507 and athletic history 1000. School 2, Integrated Framework, is a private school in the seasonal-district-41 district that does not allow open enrollment (has_open_enrollment is false), serving student 25388256 with athletic history 1001. School 3, Extended Protocol D, functions as a parochial school under regional-district-42 with open enrollment enabled, linked to student id_16 and athletic history 1002. School 4, Pilot Programme, is a public institution in the legacy-district-43 district without open enrollment, connected to student gd_taxc_2211 and athletic history 1003.

The school_type column categorizes institutions as public, private, or parochial, which affects funding sources, admission criteria, and regulatory oversight. The has_open_enrollment flag indicates whether students from outside the traditional attendance zone may enroll, a critical factor for transfer waiver processing and cross-district placements.

## Athletic Participation and Eligibility

Student athletic programs require tracking of season participation, practice completion, and eligibility status. The athletic_histories table records each student's involvement in interscholastic sports, providing the data needed to verify compliance with participation requirements.

**Table `athletic_histories`**

| athletic_history_id | season | year | sport | level | practices_completed | is_eligible | student_id | school_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | Varsity | 34 | true | 392507 | 1 |
| 1001 | Winter | 21 | extended-sport-93 | JV | 43 | false | 25388256 | 2 |
| 1002 | Spring | 30 | integrated-sport-94 | Varsity | 52 | true | id_16 | 3 |
| 1003 | Fall | 39 | seasonal-sport-95 | JV | 61 | false | gd_taxc_2211 | 4 |

Athletic history 1000 covers the Fall season of year 12, involving pilot-sport-92 at the Varsity level. The student completed 34 practices and holds an active eligibility status (is_eligible is true). This record belongs to student 392507 at school 1. Athletic history 1001 documents Winter season participation in year 21 for extended-sport-93 at the JV level, with 43 practices completed but an inactive eligibility flag (is_eligible is false), associated with student 25388256 at school 2. Athletic history 1002 records Spring season involvement in year 30 for integrated-sport-94 at the Varsity level, with 52 practices completed and active eligibility (is_eligible is true), linked to student id_16 at school 3. Athletic history 1003 captures Fall season participation in year 39 for seasonal-sport-95 at the JV level, with 61 practices completed but inactive eligibility (is_eligible is false), connected to student gd_taxc_2211 at school 4.

The season and year fields together identify the specific athletic term, while the sport and level columns describe the competitive tier. The practices_completed count provides a quantitative measure of participation, and the is_eligible flag determines whether the student may compete. These records feed directly into eligibility verification workflows and athletic department reporting.

## Transfer Waiver Processing

When a student seeks to enroll outside their assigned school or district, the district processes transfer waivers. The transfer_waivers table maintains a registry of these requests, including the waiver type, approval details, and usage restrictions.

**Table `transfer_waivers`**

| id | waiver_type | approval_date | approved_by | is_one_time_only | student_id | school_id |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | false | 392507 | 1 |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | true | 25388256 | 2 |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | false | id_16 | 3 |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | true | gd_taxc_2211 | 4 |

Waiver 1 is a ForeignExchange type, approved on 2023-10-10 by regional-approved-54, and is not restricted to a single use (is_one_time_only is false). It applies to student 392507 at school 1. Waiver 2, an AgeOfMajority type, was approved on 2024-03-21 by legacy-approved-55 and is marked as one-time-only (is_one_time_only is true), covering student 25388256 at school 2. Waiver 3 is a WardOfCourt type, approved 2025-08-05 by compact-approved-56, not one-time-only, for student id_16 at school 3. Waiver 4, a SchoolClosure type, was approved on 2022-01-16 by composite-approved-57 and is one-time-only, associated with student gd_taxc_2211 at school 4.

The waiver_type column categorizes the basis for the transfer request, which determines the required documentation and approval authority. The approval_date and approved_by fields provide an audit trail for compliance purposes. The is_one_time_only flag indicates whether the waiver grants a permanent enrollment change or a temporary exception, which affects how the district manages the student's long-term placement.

## Cross-Reference Views and Joined Queries

The district's operational reporting relies on joined views that combine data from multiple tables to answer specific administrative questions. Each view presents a particular relationship as a flat result set, enabling analysts and administrators to query complex associations without writing explicit join logic.

The view v_student_residence answers the question of which residence is associated with each student. It joins the students table to the residences table on the residence_id foreign key. For example, the row for student 392507 shows residence 100 at distributed-address-72, occupied for 44 months under the extended-school-45 district, with a non-primary designation. The row for student gd_taxc_2211 reveals residence 103 at extended-address-75, with a 74-month duration, in the regional-school-48 district, marked as a primary residence.

**View `v_student_residence`**

```sql
CREATE VIEW v_student_residence AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.residence_id AS residence_residence_id, b.address AS residence_address, b.date_moved_in AS residence_date_moved_in
FROM students a JOIN residences b ON a.residence_id = b.residence_id;
```

| student_id | date_of_birth | grade_level | age | residence_residence_id | residence_address | residence_date_moved_in |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 100 | distributed-address-72 | 2023-06-26 |
| 25388256 | 2022-09-13 | 33 | 40 | 101 | baseline-address-73 | 2024-11-10 |
| id_16 | 2023-02-24 | 37 | 45 | 102 | pilot-address-74 | 2025-04-21 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 103 | extended-address-75 | 2022-09-05 |

The view v_student_school links each student to their assigned school, answering which institution serves each learner. It joins students to schools on the school_id key. Student 392507 is enrolled at Seasonal Standard (school 1), a public school in integrated-district-40 with open enrollment enabled. Student 25388256 attends Integrated Framework (school 2), a private school in seasonal-district-41 without open enrollment.

**View `v_student_school`**

```sql
CREATE VIEW v_student_school AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM students a JOIN schools b ON a.school_id = b.id;
```

| student_id | date_of_birth | grade_level | age | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 1 | Seasonal Standard | public |
| 25388256 | 2022-09-13 | 33 | 40 | 2 | Integrated Framework | private |
| id_16 | 2023-02-24 | 37 | 45 | 3 | Extended Protocol D | parochial |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 4 | Pilot Programme | public |

The view v_student_athletic_history connects students to their athletic participation records, answering which sport and season each student has been involved in. It joins students to athletic_histories on the athletic_history_id. Student 392507 participated in pilot-sport-92 at the Varsity level during the Fall season of year 12, completing 34 practices with active eligibility. Student id_16 competed in integrated-sport-94 at the Varsity level during the Spring season of year 30, with 52 practices completed and active eligibility.

**View `v_student_athletic_history`**

```sql
CREATE VIEW v_student_athletic_history AS
SELECT a.student_id, a.date_of_birth, a.grade_level, a.age, b.athletic_history_id AS history_athletic_history_id, b.season AS history_season, b.year AS history_year
FROM students a JOIN athletic_histories b ON a.athletic_history_id = b.athletic_history_id;
```

| student_id | date_of_birth | grade_level | age | history_athletic_history_id | history_season | history_year |
|---|---|---|---|---|---|---|
| 392507 | 2025-04-02 | 29 | 35 | 1000 | Fall | 12 |
| 25388256 | 2022-09-13 | 33 | 40 | 1001 | Winter | 21 |
| id_16 | 2023-02-24 | 37 | 45 | 1002 | Spring | 30 |
| gd_taxc_2211 | 2024-07-08 | 41 | 50 | 1003 | Fall | 39 |

The view v_residence_student inverts the perspective, answering which student lives at a given residence. It joins residences to students on the student_id foreign key. Residence 100 at distributed-address-72 is linked to student 392507, who is at grade level 29 and holds an eligibility status of true. Residence 101 at baseline-address-73 connects to student 25388256 at grade level 33 with an eligibility status of false.

**View `v_residence_student`**

```sql
CREATE VIEW v_residence_student AS
SELECT a.residence_id, a.address, a.date_moved_in, a.duration_months, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM residences a JOIN students b ON a.student_id = b.student_id;
```

| residence_id | address | date_moved_in | duration_months | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | 392507 | 2025-04-02 | 29 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | 25388256 | 2022-09-13 | 33 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | id_16 | 2023-02-24 | 37 |
| 103 | extended-address-75 | 2022-09-05 | 74 | gd_taxc_2211 | 2024-07-08 | 41 |

The view v_residence_guardian answers which guardian is associated with a given residence. It joins residences to guardians on the guardian_id key. Residence 100 is linked to guardian Theodore Mcgrath (guardian 1000), a parent with telephone adaptive-telephon-23. Residence 103 connects to guardian Norma Fisher (guardian 1003), who is not a parent and uses telephone pilot-telephon-26.

**View `v_residence_guardian`**

```sql
CREATE VIEW v_residence_guardian AS
SELECT a.residence_id, a.address, a.date_moved_in, a.duration_months, b.guardian_id AS guardian_guardian_id, b.full_name AS guardian_full_name, b.relationship AS guardian_relationship
FROM residences a JOIN guardians b ON a.guardian_id = b.guardian_id;
```

| residence_id | address | date_moved_in | duration_months | guardian_guardian_id | guardian_full_name | guardian_relationship |
|---|---|---|---|---|---|---|
| 100 | distributed-address-72 | 2023-06-26 | 44 | 1000 | Theodore Mcgrath | baseline-relation-67 |
| 101 | baseline-address-73 | 2024-11-10 | 54 | 1001 | Account Name | pilot-relation-68 |
| 102 | pilot-address-74 | 2025-04-21 | 64 | 1002 | Saipan International Airport | extended-relation-69 |
| 103 | extended-address-75 | 2022-09-05 | 74 | 1003 | Norma Fisher | integrated-relation-70 |

The view v_guardian_residence inverts the guardian-to-residence relationship, answering which residence each guardian is assigned to. It joins guardians to residences on the residence_id key. Guardian Theodore Mcgrath (1000) is assigned to residence 100 at distributed-address-72, with a 44-month duration under extended-school-45. Guardian Norma Fisher (1003) is assigned to residence 103 at extended-address-75, with a 74-month duration under regional-school-48.

**View `v_guardian_residence`**

```sql
CREATE VIEW v_guardian_residence AS
SELECT a.guardian_id, a.full_name, a.relationship, a.telephone, b.residence_id AS residence_residence_id, b.address AS residence_address, b.date_moved_in AS residence_date_moved_in
FROM guardians a JOIN residences b ON a.residence_id = b.residence_id;
```

| guardian_id | full_name | relationship | telephone | residence_residence_id | residence_address | residence_date_moved_in |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | 100 | distributed-address-72 | 2023-06-26 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | 101 | baseline-address-73 | 2024-11-10 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | 102 | pilot-address-74 | 2025-04-21 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | 103 | extended-address-75 | 2022-09-05 |

The view v_guardian_student links guardians to their associated students, answering which student each guardian is responsible for. It joins guardians to students on the student_id key. Guardian Theodore Mcgrath (1000) is responsible for student 392507, who is at grade level 29 with an active eligibility status. Guardian Account Name (1001) is responsible for student 25388256, at grade level 33 with an inactive eligibility status.

**View `v_guardian_student`**

```sql
CREATE VIEW v_guardian_student AS
SELECT a.guardian_id, a.full_name, a.relationship, a.telephone, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM guardians a JOIN students b ON a.student_id = b.student_id;
```

| guardian_id | full_name | relationship | telephone | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | baseline-relation-67 | adaptive-telephon-23 | 392507 | 2025-04-02 | 29 |
| 1001 | Account Name | pilot-relation-68 | distributed-telephon-24 | 25388256 | 2022-09-13 | 33 |
| 1002 | Saipan International Airport | extended-relation-69 | baseline-telephon-25 | id_16 | 2023-02-24 | 37 |
| 1003 | Norma Fisher | integrated-relation-70 | pilot-telephon-26 | gd_taxc_2211 | 2024-07-08 | 41 |

The view v_school_student answers which students are enrolled at a given school. It joins schools to students on the school_id key. School 1, Seasonal Standard, serves student 392507, who resides at integrated-current-64 and entered ninth grade on 2024-11-11. School 3, Extended Protocol D, serves student id_16, who resides at regional-current-66 and entered ninth grade on 2022-09-06.

**View `v_school_student`**

```sql
CREATE VIEW v_school_student AS
SELECT a.id, a.school_name, a.school_type, a.district, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM schools a JOIN students b ON a.student_id = b.student_id;
```

| id | school_name | school_type | district | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | 392507 | 2025-04-02 | 29 |
| 2 | Integrated Framework | private | seasonal-district-41 | 25388256 | 2022-09-13 | 33 |
| 3 | Extended Protocol D | parochial | regional-district-42 | id_16 | 2023-02-24 | 37 |
| 4 | Pilot Programme | public | legacy-district-43 | gd_taxc_2211 | 2024-07-08 | 41 |

The view v_school_athletic_history links schools to the athletic participation records of their enrolled students, answering which athletic histories are associated with each school. It joins schools to athletic_histories on the school_id key. School 1 (Seasonal Standard) is associated with athletic history 1000, covering pilot-sport-92 at the Varsity level during the Fall season of year 12. School 4 (Pilot Programme) is associated with athletic history 1003, covering seasonal-sport-95 at the JV level during the Fall season of year 39.

**View `v_school_athletic_history`**

```sql
CREATE VIEW v_school_athletic_history AS
SELECT a.id, a.school_name, a.school_type, a.district, b.athletic_history_id AS history_athletic_history_id, b.season AS history_season, b.year AS history_year
FROM schools a JOIN athletic_histories b ON a.athletic_history_id = b.athletic_history_id;
```

| id | school_name | school_type | district | history_athletic_history_id | history_season | history_year |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | public | integrated-district-40 | 1000 | Fall | 12 |
| 2 | Integrated Framework | private | seasonal-district-41 | 1001 | Winter | 21 |
| 3 | Extended Protocol D | parochial | regional-district-42 | 1002 | Spring | 30 |
| 4 | Pilot Programme | public | legacy-district-43 | 1003 | Fall | 39 |

The view v_athletic_history_student answers which student is associated with a given athletic participation record. It joins athletic_histories to students on the student_id key. Athletic history 1000, documenting Fall season Varsity participation in pilot-sport-92, is linked to student 392507, who is at grade level 29. Athletic history 1002, documenting Spring season Varsity participation in integrated-sport-94, is linked to student id_16, who is at grade level 37.

**View `v_athletic_history_student`**

```sql
CREATE VIEW v_athletic_history_student AS
SELECT a.athletic_history_id, a.season, a.year, a.sport, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM athletic_histories a JOIN students b ON a.student_id = b.student_id;
```

| athletic_history_id | season | year | sport | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | 392507 | 2025-04-02 | 29 |
| 1001 | Winter | 21 | extended-sport-93 | 25388256 | 2022-09-13 | 33 |
| 1002 | Spring | 30 | integrated-sport-94 | id_16 | 2023-02-24 | 37 |
| 1003 | Fall | 39 | seasonal-sport-95 | gd_taxc_2211 | 2024-07-08 | 41 |

The view v_athletic_history_school links athletic participation records to the schools of the enrolled students, answering which school each athletic history belongs to. It joins athletic_histories to schools on the school_id key. Athletic history 1000 is associated with school 1, Seasonal Standard, a public institution in integrated-district-40. Athletic history 1001 is associated with school 2, Integrated Framework, a private institution in seasonal-district-41.

**View `v_athletic_history_school`**

```sql
CREATE VIEW v_athletic_history_school AS
SELECT a.athletic_history_id, a.season, a.year, a.sport, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM athletic_histories a JOIN schools b ON a.school_id = b.id;
```

| athletic_history_id | season | year | sport | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 1000 | Fall | 12 | pilot-sport-92 | 1 | Seasonal Standard | public |
| 1001 | Winter | 21 | extended-sport-93 | 2 | Integrated Framework | private |
| 1002 | Spring | 30 | integrated-sport-94 | 3 | Extended Protocol D | parochial |
| 1003 | Fall | 39 | seasonal-sport-95 | 4 | Pilot Programme | public |

The view v_transfer_waiver_student answers which student each transfer waiver applies to. It joins transfer_waivers to students on the student_id key. Waiver 1, a ForeignExchange type approved on 2023-10-10, applies to student 392507, who is at grade level 29 with an active eligibility status. Waiver 3, a WardOfCourt type approved on 2025-08-05, applies to student id_16, who is at grade level 37 with an active eligibility status.

**View `v_transfer_waiver_student`**

```sql
CREATE VIEW v_transfer_waiver_student AS
SELECT a.id, a.waiver_type, a.approval_date, a.approved_by, b.student_id AS student_student_id, b.date_of_birth AS student_date_of_birth, b.grade_level AS student_grade_level
FROM transfer_waivers a JOIN students b ON a.student_id = b.student_id;
```

| id | waiver_type | approval_date | approved_by | student_student_id | student_date_of_birth | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | 392507 | 2025-04-02 | 29 |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | 25388256 | 2022-09-13 | 33 |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | id_16 | 2023-02-24 | 37 |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | gd_taxc_2211 | 2024-07-08 | 41 |

The view v_transfer_waiver_school answers which school each transfer waiver is intended for. It joins transfer_waivers to schools on the school_id key. Waiver 1 (ForeignExchange) is directed at school 1, Seasonal Standard, a public school in integrated-district-40. Waiver 2 (AgeOfMajority) is directed at school 2, Integrated Framework, a private school in seasonal-district-41.

**View `v_transfer_waiver_school`**

```sql
CREATE VIEW v_transfer_waiver_school AS
SELECT a.id, a.waiver_type, a.approval_date, a.approved_by, b.id AS school_id, b.school_name AS school_school_name, b.school_type AS school_school_type
FROM transfer_waivers a JOIN schools b ON a.school_id = b.id;
```

| id | waiver_type | approval_date | approved_by | school_id | school_school_name | school_school_type |
|---|---|---|---|---|---|---|
| 1 | ForeignExchange | 2023-10-10 | regional-approved-54 | 1 | Seasonal Standard | public |
| 2 | AgeOfMajority | 2024-03-21 | legacy-approved-55 | 2 | Integrated Framework | private |
| 3 | WardOfCourt | 2025-08-05 | compact-approved-56 | 3 | Extended Protocol D | parochial |
| 4 | SchoolClosure | 2022-01-16 | composite-approved-57 | 4 | Pilot Programme | public |

## Closing Synthesis

The student enrollment ecosystem comprises six interconnected record types: students, residences, guardians, schools, athletic histories, and transfer waivers. Each table captures a distinct dimension of the enrollment lifecycle, from demographic identification and household location to institutional assignment and extracurricular participation. The foreign-key relationships between these tables form a network of associations that the district queries through twelve specialized views, each designed to answer a specific administrative question.

The data reveals a population of four students distributed across four schools and four residences, with corresponding athletic participation records and transfer waiver documentation. Eligibility status varies across the population, with students 392507 and id_16 holding active eligibility in both general and athletic contexts, while students 25388256 and gd_taxc_2211 carry inactive flags. Residence durations range from 44 to 74 months, and school types span public, private, and parochial categories, with open enrollment policies split evenly across the four institutions.

Together, these records and their joined representations provide the structural foundation for enrollment management, eligibility verification, athletic program administration, and transfer processing within the district.