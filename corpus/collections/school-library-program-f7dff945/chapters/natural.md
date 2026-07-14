## The School Library Program Ecosystem

School library programs operate as structured learning environments where teacher librarians curate information resources, align instruction to literacy standards, and assess student progress through defined metrics. Each program functions as an autonomous unit with its own operational profile—funding levels, collection sizes, service hours, and status designations that reflect its current capacity and institutional standing. Within these units, staff members manage resource inventories, students engage with materials across proficiency levels, and assessment records capture the outcomes of instructional interventions. The architecture of this domain rests on seven core entity types: programs, teacher librarians, information resources, students, information literacy standards, assessment metrics, and assessment records. Cross-cutting relationship tables bind these entities into a coherent operational graph, while a suite of detail views provides pre-joined perspectives for reporting and analysis.

**Table `school_library_programs`**

| id | program_id | name | established_date | last_review_date | funding_level | operational_status | collection_size | service_hours |
|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2024-03-27 | 2022-09-03 | 9.95 | active | 28 | 47 |
| 101 | 2986219 | Pilot Initiative A | 2025-08-11 | 2023-02-14 | 13.90 | under_review | 33 | 56 |
| 102 | 1186079 | Baseline Model | 2022-01-22 | 2024-07-25 | 17.85 | suspended | 38 | 65 |
| 103 | 1562855 | Distributed Cluster | 2023-06-06 | 2025-12-09 | 21.80 | defunded | 43 | 74 |

A school library program is the central organizing unit of the domain. Each program carries a unique `program_id`—for example, `103176` for the program named "Extended Review"—alongside an `established_date` and a `last_review_date` that track its lifecycle. The `funding_level` field holds a numeric value such as `9.95` or `21.80`, indicating the program's current financial allocation. The `operational_status` column classifies programs into one of four states: `active`, `under_review`, `suspended`, or `defunded`. The "Extended Review" program (id `100`) is currently `active` with a collection size of `28` items and `47` service hours per cycle. By contrast, the "Distributed Cluster" program (id `103`, `program_id` `1562855`) carries a `defunded` status, a collection of `43` items, and `74` service hours. The `collection_size` and `service_hours` fields provide quantitative snapshots of each program's resource footprint and availability window.

**Table `teacher_librarians`**

| teacher_librarian_id | employee_id | full_name | certification_level | years_of_experience | employment_status | specialization | hire_date | school_library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | seasonal-certific-59 | 7 | full_time | legacy-speciali-13 | 2023-06-01 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Tasha Rodriguez | Account Name | regional-certific-60 | 10 | part_time | compact-speciali-14 | 2024-11-12 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | legacy-certific-61 | 13 | contract | composite-speciali-15 | 2025-04-23 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Peter Mcdowell | Norma Fisher | compact-certific-62 | 16 | vacant | primary-speciali-16 | 2022-09-07 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Teacher librarians are the personnel who staff these programs. The `teacher_librarians` table records each librarian's `employee_id`, `full_name`, `certification_level`, `years_of_experience`, `employment_status`, `specialization`, `hire_date`, and the `school_library_program_id` to which they are assigned. Norma Fisher (`employee_id` `1`) holds a `seasonal-certific-59` certification, has `7` years of experience, and is employed `full_time` with a `legacy-speciali-13` specialization. She was hired on `2023-06-01` and is assigned to program `100`. Tasha Rodriguez (`employee_id` `2`) carries a `regional-certific-60` certification, `10` years of experience, and a `part_time` status with `compact-speciali-14` specialization, assigned to program `101`. Theodore Mcgrath (`employee_id` `3`) is on `contract` status with `13` years of experience and `composite-speciali-15` specialization, linked to program `102`. Peter Mcdowell (`employee_id` `4`) holds a `compact-certific-62` certification, `16` years of experience, and a `vacant` employment status with `primary-speciali-16` specialization, assigned to program `103`. The `created_at` and `updated_at` timestamps record when each librarian's profile was first entered and last modified.

**Table `information_resources`**

| resource_id | title | format_type | acquisition_date | condition_status | curriculum_alignment | access_restriction | last_cataloged_date | school_library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | print_book | 2023-02-07 | new | primary-curricul-40 | false | 2023-06-10 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2106708 | Legacy Model | electronic_database | 2024-07-18 | good | adaptive-curricul-41 | true | 2024-11-21 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4180945 | Regional Cluster A | multimedia | 2025-12-02 | worn | distributed-curricul-42 | false | 2025-04-05 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10238270 | Seasonal Review | periodical | 2022-05-13 | obsolete | baseline-curricul-43 | true | 2022-09-16 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Information resources represent the materials managed within each program. Each resource has a `resource_id`, a `title`, a `format_type` (such as `print_book`, `electronic_database`, `multimedia`, or `periodical`), an `acquisition_date`, a `condition_status` (`new`, `good`, `worn`, or `obsolete`), a `curriculum_alignment` code, an `access_restriction` flag, and a `last_cataloged_date`. Resource `1167`, titled "Compact Initiative," is a `print_book` acquired on `2023-02-07` in `new` condition, aligned to `primary-curricul-40`, with no access restriction, and last cataloged on `2023-06-10`. It is assigned to program `100`. Resource `2106708`, "Legacy Model," is an `electronic_database` in `good` condition, aligned to `adaptive-curricul-41`, with access restricted (`true`), assigned to program `101`. Resource `4180945`, "Regional Cluster A," is a `multimedia` item in `worn` condition, aligned to `distributed-curricul-42`, unrestricted, assigned to program `102`. Resource `10238270`, "Seasonal Review," is a `periodical` in `obsolete` condition, aligned to `baseline-curricul-43`, restricted, assigned to program `103`.

**Table `students`**

| student_id | full_name | grade_level | enrollment_date | literacy_proficiency | attendance_rate | special_needs_flag |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | 29 | 2022-05-11 | beginner | 15.95 | true |
| 25388256 | Account Name | 33 | 2023-10-22 | developing | 18.90 | false |
| id_16 | Saipan International Airport | 37 | 2024-03-06 | proficient | 21.85 | true |
| gd_taxc_2211 | Norma Fisher | 41 | 2025-08-17 | advanced | 24.80 | false |

Students are the primary beneficiaries of library program services. The `students` table records each student's `student_id`, `full_name`, `grade_level`, `enrollment_date`, `literacy_proficiency` (`beginner`, `developing`, `proficient`, or `advanced`), `attendance_rate`, and a `special_needs_flag`. Student `392507`, named "Theodore Mcgrath," is at grade level `29`, enrolled since `2022-05-11`, classified as `beginner` in literacy proficiency, with an attendance rate of `15.95` and a `special_needs_flag` of `true`. Student `25388256`, "Account Name," is at grade level `33`, enrolled since `2023-10-22`, at `developing` proficiency, with an attendance rate of `18.90` and no special needs designation. Student `id_16`, "Saipan International Airport," is at grade level `37`, enrolled since `2024-03-06`, classified as `proficient`, with an attendance rate of `21.85` and special needs enabled. Student `gd_taxc_2211`, "Norma Fisher," is at grade level `41`, enrolled since `2025-08-17`, at `advanced` proficiency, with an attendance rate of `24.80` and no special needs flag.

**Table `information_literacy_standards`**

| id | standard_id | standard_code | description | effective_date | review_cycle | compliance_level | target_grade_level | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7119764 | L459 | Extended Survey | 2023-02-14 | 40 | non_compliant | integrated-target-34 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 9125617 | account_pymes_596 | Pilot Corridor A | 2024-07-25 | 43 | partial | seasonal-target-35 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 338526 | 9125613 | Baseline Series | 2025-12-09 | 46 | full | regional-target-36 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 3717623 | 8189504 | Distributed Assessment | 2022-05-20 | 49 | exemplary | legacy-target-37 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Information literacy standards define the instructional benchmarks against which student progress is measured. Each standard carries an `id`, a `standard_id`, a `standard_code`, a `description`, an `effective_date`, a `review_cycle` (expressed as a numeric interval), a `compliance_level` (`non_compliant`, `partial`, `full`, or `exemplary`), and a `target_grade_level` code. Standard `1000` (code `L459`, description "Extended Survey") became effective on `2023-02-14`, has a `review_cycle` of `40`, is `non_compliant`, and targets `integrated-target-34`. Standard `1001` (code `account_pymes_596`, description "Pilot Corridor A") is effective from `2024-07-25`, has a `review_cycle` of `43`, is `partial`, and targets `seasonal-target-35`. Standard `1002` (code `9125613`, description "Baseline Series") is effective from `2025-12-09`, has a `review_cycle` of `46`, is `full`, and targets `regional-target-36`. Standard `1003` (code `8189504`, description "Distributed Assessment") is effective from `2022-05-20`, has a `review_cycle` of `49`, is `exemplary`, and targets `legacy-target-37`.

**Table `assessment_metrics`**

| metric_id | metric_name | measurement_type | administered_date | score_threshold | result_status | rater_id | information_literacy_standard_id | teacher_librarian_id | assessment_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 2024-03-24 | 22.45 | pending | 392492 | 1000 | 1 | 1 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 2025-08-08 | 26.90 | completed | df2e1a52-8fcc-11eb-924d-9cd76263cbd0 | 1001 | 2 | 2 |
| 2986226 | Compact Framework | observational | 2022-01-19 | 31.35 | failed | 24921600 | 1002 | 3 | 3 |
| 2002007020010 | Legacy Protocol D | survey | 2023-06-03 | 35.80 | exceeded | sga | 1003 | 4 | 4 |

Assessment metrics operationalize the standards into measurable instruments. Each metric has a `metric_id`, a `metric_name`, a `measurement_type` (`quantitative`, `qualitative`, `observational`, or `survey`), an `administered_date`, a `score_threshold`, a `result_status` (`pending`, `completed`, `failed`, or `exceeded`), a `rater_id`, and foreign keys linking it to an `information_literacy_standard_id`, a `teacher_librarian_id`, and an `assessment_record_id`. Metric `3744010`, "Primary Programme A," is `quantitative`, administered on `2024-03-24`, with a `score_threshold` of `22.45`, a `pending` result, rater `392492`, linked to standard `1000`, librarian `1`, and assessment record `1`. Metric `136630a8-8fcc-11eb-924d-9cd76263cbd0`, "Composite Standard," is `qualitative`, administered on `2025-08-08`, with a threshold of `26.90`, `completed` status, rater `df2e1a52-8fcc-11eb-924d-9cd76263cbd0`, linked to standard `1001`, librarian `2`, and record `2`. Metric `2986226`, "Compact Framework," is `observational`, administered on `2022-01-19`, threshold `31.35`, `failed` status, rater `24921600`, linked to standard `1002`, librarian `3`, and record `3`. Metric `2002007020010`, "Legacy Protocol D," is a `survey`, administered on `2023-06-03`, threshold `35.80`, `exceeded` status, rater `sga`, linked to standard `1003`, librarian `4`, and record `4`.

**Table `assessment_records`**

| id | record_id | assessment_date | raw_score | normalized_score | feedback_notes | review_status | data_integrity_check | metric_id | student_id | school_library_program_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2022-05-10 | 5.45 | 10.20 | regional-feedback-90 | draft | true | 3744010 | 392507 | 100 |
| 2 | 10445619 | 2023-10-21 | 9.90 | 12.40 | legacy-feedback-91 | submitted | false | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 25388256 | 101 |
| 3 | 9568457 | 2024-03-05 | 14.35 | 14.60 | compact-feedback-92 | approved | true | 2986226 | id_16 | 102 |
| 4 | 20743593 | 2025-08-16 | 18.80 | 16.80 | composite-feedback-93 | archived | false | 2002007020010 | gd_taxc_2211 | 103 |

Assessment records serve as the container for individual assessment events. Each record ties a specific metric to a particular student and program, capturing the outcome of a single measurement instance. The records form the bridge between the abstract metrics defined in the standards and the concrete student populations served by each program.

The relational structure of the domain extends beyond these base tables through a set of junction tables that model many-to-many associations. The `programs_librarians` table links programs to their assigned teacher librarians, enabling a single program to be staffed by multiple librarians and a librarian to serve across programs. The `programs_students` table records which students are enrolled in or served by which programs. The `programs_standards` table associates programs with the literacy standards they are expected to address.

**Table `programs_librarians`**

| school_library_program_id | teacher_librarian_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `programs_students`**

| school_library_program_id | student_id |
|---|---|
| 100 | 392507 |
| 100 | 25388256 |
| 101 | 25388256 |
| 101 | id_16 |
| 102 | id_16 |
| 102 | gd_taxc_2211 |
| 103 | gd_taxc_2211 |
| 103 | 392507 |
**Table `programs_standards`**

| school_library_program_id | information_literacy_standard_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

Resource-to-staff and resource-to-student relationships are captured in `librarians_resources` and `resources_students`. The former records which teacher librarians are responsible for managing which information resources, while the latter documents which students have accessed or been assigned which resources. The `students_programs` and `students_librarians` tables provide additional cross-referencing: the former reinforces the program-student enrollment relationship from the student side, and the latter links students directly to the librarians who serve them.

**Table `librarians_resources`**

| teacher_librarian_id | resource_id |
|---|---|
| 1 | 1167 |
| 1 | 2106708 |
| 2 | 2106708 |
| 2 | 4180945 |
| 3 | 4180945 |
| 3 | 10238270 |
| 4 | 10238270 |
| 4 | 1167 |
**Table `resources_students`**

| resource_id | student_id |
|---|---|
| 1167 | 392507 |
| 1167 | 25388256 |
| 2106708 | 25388256 |
| 2106708 | id_16 |
| 4180945 | id_16 |
| 4180945 | gd_taxc_2211 |
| 10238270 | gd_taxc_2211 |
| 10238270 | 392507 |
**Table `students_programs`**

| student_id | school_library_program_id |
|---|---|
| 392507 | 100 |
| 392507 | 101 |
| 25388256 | 101 |
| 25388256 | 102 |
| id_16 | 102 |
| id_16 | 103 |
| gd_taxc_2211 | 103 |
| gd_taxc_2211 | 100 |
**Table `students_resources`**

| student_id | resource_id |
|---|---|
| 392507 | 1167 |
| 392507 | 2106708 |
| 25388256 | 2106708 |
| 25388256 | 4180945 |
| id_16 | 4180945 |
| id_16 | 10238270 |
| gd_taxc_2211 | 10238270 |
| gd_taxc_2211 | 1167 |
**Table `students_librarians`**

| student_id | teacher_librarian_id |
|---|---|
| 392507 | 1 |
| 392507 | 2 |
| 25388256 | 2 |
| 25388256 | 3 |
| id_16 | 3 |
| id_16 | 4 |
| gd_taxc_2211 | 4 |
| gd_taxc_2211 | 1 |

Standards are further connected to programs through `standards_programs`, which explicitly records which literacy standards apply to which programs. The `standards_metrics` table binds assessment metrics to the standards they measure, ensuring that every metric can be traced back to its governing standard. The `metrics_students` table records which students were assessed by which metrics, completing the chain from standard through metric to student outcome.

**Table `standards_programs`**

| information_literacy_standard_id | school_library_program_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |
**Table `standards_metrics`**

| information_literacy_standard_id | metric_id |
|---|---|
| 1000 | 3744010 |
| 1000 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 2986226 |
| 1002 | 2986226 |
| 1002 | 2002007020010 |
| 1003 | 2002007020010 |
| 1003 | 3744010 |
**Table `metrics_students`**

| metric_id | student_id |
|---|---|
| 3744010 | 392507 |
| 3744010 | 25388256 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 25388256 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | id_16 |
| 2986226 | id_16 |
| 2986226 | gd_taxc_2211 |
| 2002007020010 | gd_taxc_2211 |
| 2002007020010 | 392507 |

These junction tables collectively enable a wide range of analytical queries. By joining programs with their assigned librarians, resources, students, and standards, the domain supports comprehensive reporting on program capacity, staffing adequacy, resource utilization, and standards coverage.

The view layer provides pre-joined result sets that answer specific operational questions. Each view combines data from multiple base and junction tables to present a coherent picture of a particular facet of the library program ecosystem.

**View `school_library_program_teacher_librarian_detail_view`**

```sql
CREATE VIEW school_library_program_teacher_librarian_detail_view AS
SELECT a.id, a.program_id, a.name, b.teacher_librarian_id AS librarian_teacher_librarian_id, b.employee_id AS librarian_employee_id, b.full_name AS librarian_full_name
FROM school_library_programs a
  JOIN programs_librarians j ON j.school_library_program_id = a.id
  JOIN teacher_librarians b ON b.teacher_librarian_id = j.teacher_librarian_id;
```

| id | program_id | name | librarian_teacher_librarian_id | librarian_employee_id | librarian_full_name |
|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 1 | Norma Fisher | Theodore Mcgrath |
| 100 | 103176 | Extended Review | 2 | Tasha Rodriguez | Account Name |
| 101 | 2986219 | Pilot Initiative A | 2 | Tasha Rodriguez | Account Name |
| 101 | 2986219 | Pilot Initiative A | 3 | Theodore Mcgrath | Saipan International Airport |
| 102 | 1186079 | Baseline Model | 3 | Theodore Mcgrath | Saipan International Airport |
| 102 | 1186079 | Baseline Model | 4 | Peter Mcdowell | Norma Fisher |
| 103 | 1562855 | Distributed Cluster | 4 | Peter Mcdowell | Norma Fisher |
| 103 | 1562855 | Distributed Cluster | 1 | Norma Fisher | Theodore Mcgrath |

The school library program–teacher librarian detail view answers the question of which librarian is assigned to which program and under what conditions. A row from this view might show program `100` ("Extended Review") paired with teacher librarian `1` (Norma Fisher, `full_time`, `7` years experience, `seasonal-certific-59`). Another row could pair program `103` ("Distributed Cluster") with librarian `4` (Peter Mcdowell, `vacant`, `16` years experience, `compact-certific-62`). This view is essential for staffing audits and workload distribution analysis.

**View `school_library_program_student_detail_view`**

```sql
CREATE VIEW school_library_program_student_detail_view AS
SELECT a.id, a.program_id, a.name, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM school_library_programs a
  JOIN programs_students j ON j.school_library_program_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | program_id | name | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 392507 | Theodore Mcgrath | 29 |
| 100 | 103176 | Extended Review | 25388256 | Account Name | 33 |
| 101 | 2986219 | Pilot Initiative A | 25388256 | Account Name | 33 |
| 101 | 2986219 | Pilot Initiative A | id_16 | Saipan International Airport | 37 |
| 102 | 1186079 | Baseline Model | id_16 | Saipan International Airport | 37 |
| 102 | 1186079 | Baseline Model | gd_taxc_2211 | Norma Fisher | 41 |
| 103 | 1562855 | Distributed Cluster | gd_taxc_2211 | Norma Fisher | 41 |
| 103 | 1562855 | Distributed Cluster | 392507 | Theodore Mcgrath | 29 |

The school library program–student detail view reveals which students are associated with which programs. A representative row might link program `100` to student `392507` (Theodore Mcgrath, grade `29`, `beginner` proficiency, attendance rate `15.95`, special needs `true`). Another row could connect program `103` to student `gd_taxc_2211` (Norma Fisher, grade `41`, `advanced` proficiency, attendance rate `24.80`, special needs `false`). This view supports enrollment tracking and demographic analysis.

**View `school_library_program_information_literacy_standard_detail_view`**

```sql
CREATE VIEW school_library_program_information_literacy_standard_detail_view AS
SELECT a.id, a.program_id, a.name, b.id AS standard_id, b.standard_id AS standard_standard_id, b.standard_code AS standard_standard_code
FROM school_library_programs a
  JOIN programs_standards j ON j.school_library_program_id = a.id
  JOIN information_literacy_standards b ON b.id = j.information_literacy_standard_id;
```

| id | program_id | name | standard_id | standard_standard_id | standard_standard_code |
|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 1000 | 7119764 | L459 |
| 100 | 103176 | Extended Review | 1001 | 9125617 | account_pymes_596 |
| 101 | 2986219 | Pilot Initiative A | 1001 | 9125617 | account_pymes_596 |
| 101 | 2986219 | Pilot Initiative A | 1002 | 338526 | 9125613 |
| 102 | 1186079 | Baseline Model | 1002 | 338526 | 9125613 |
| 102 | 1186079 | Baseline Model | 1003 | 3717623 | 8189504 |
| 103 | 1562855 | Distributed Cluster | 1003 | 3717623 | 8189504 |
| 103 | 1562855 | Distributed Cluster | 1000 | 7119764 | L459 |

This view maps programs to the literacy standards they are expected to address. A row might show program `100` aligned with standard `1000` (code `L459`, "Extended Survey", `non_compliant`, review cycle `40`). Another row could pair program `103` with standard `1003` (code `8189504`, "Distributed Assessment", `exemplary`, review cycle `49`). This view is critical for compliance monitoring and standards coverage assessment.

**View `teacher_librarian_school_library_program_view`**

```sql
CREATE VIEW teacher_librarian_school_library_program_view AS
SELECT a.teacher_librarian_id, a.employee_id, a.full_name, a.certification_level, b.id AS program_id, b.program_id AS program_program_id, b.name AS program_name
FROM teacher_librarians a JOIN school_library_programs b ON a.school_library_program_id = b.id;
```

| teacher_librarian_id | employee_id | full_name | certification_level | program_id | program_program_id | program_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | seasonal-certific-59 | 100 | 103176 | Extended Review |
| 2 | Tasha Rodriguez | Account Name | regional-certific-60 | 101 | 2986219 | Pilot Initiative A |
| 3 | Theodore Mcgrath | Saipan International Airport | legacy-certific-61 | 102 | 1186079 | Baseline Model |
| 4 | Peter Mcdowell | Norma Fisher | compact-certific-62 | 103 | 1562855 | Distributed Cluster |

The teacher librarian–program view presents the reverse perspective of the program–librarian relationship, listing each librarian alongside all programs they serve. A row might show librarian `1` (Norma Fisher) serving program `100` ("Extended Review", `active`, funding `9.95`, collection `28`). Another row could show librarian `3` (Theodore Mcgrath) serving program `102` ("Baseline Model", `suspended`, funding `17.85`, collection `38"). This view supports librarian workload and program assignment analysis.

**View `teacher_librarian_information_resource_detail_view`**

```sql
CREATE VIEW teacher_librarian_information_resource_detail_view AS
SELECT a.teacher_librarian_id, a.employee_id, a.full_name, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format_type AS resource_format_type
FROM teacher_librarians a
  JOIN librarians_resources j ON j.teacher_librarian_id = a.teacher_librarian_id
  JOIN information_resources b ON b.resource_id = j.resource_id;
```

| teacher_librarian_id | employee_id | full_name | resource_resource_id | resource_title | resource_format_type |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | 1167 | Compact Initiative | print_book |
| 1 | Norma Fisher | Theodore Mcgrath | 2106708 | Legacy Model | electronic_database |
| 2 | Tasha Rodriguez | Account Name | 2106708 | Legacy Model | electronic_database |
| 2 | Tasha Rodriguez | Account Name | 4180945 | Regional Cluster A | multimedia |
| 3 | Theodore Mcgrath | Saipan International Airport | 4180945 | Regional Cluster A | multimedia |
| 3 | Theodore Mcgrath | Saipan International Airport | 10238270 | Seasonal Review | periodical |
| 4 | Peter Mcdowell | Norma Fisher | 10238270 | Seasonal Review | periodical |
| 4 | Peter Mcdowell | Norma Fisher | 1167 | Compact Initiative | print_book |

This view connects teacher librarians to the information resources they manage. A row might pair librarian `1` (Norma Fisher) with resource `1167` ("Compact Initiative", `print_book`, `new` condition, acquired `2023-02-07`). Another row could link librarian `2` (Tasha Rodriguez) with resource `2106708` ("Legacy Model", `electronic_database`, `good` condition, acquired `2024-07-18`). This view is useful for resource management accountability and collection oversight.

**View `information_resource_school_library_program_view`**

```sql
CREATE VIEW information_resource_school_library_program_view AS
SELECT a.resource_id, a.title, a.format_type, a.acquisition_date, b.id AS program_id, b.program_id AS program_program_id, b.name AS program_name
FROM information_resources a JOIN school_library_programs b ON a.school_library_program_id = b.id;
```

| resource_id | title | format_type | acquisition_date | program_id | program_program_id | program_name |
|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | print_book | 2023-02-07 | 100 | 103176 | Extended Review |
| 2106708 | Legacy Model | electronic_database | 2024-07-18 | 101 | 2986219 | Pilot Initiative A |
| 4180945 | Regional Cluster A | multimedia | 2025-12-02 | 102 | 1186079 | Baseline Model |
| 10238270 | Seasonal Review | periodical | 2022-05-13 | 103 | 1562855 | Distributed Cluster |

The information resource–program view shows which resources belong to which programs. A row might display resource `1167` ("Compact Initiative") assigned to program `100` ("Extended Review", `active`, `47` service hours). Another row could show resource `10238270` ("Seasonal Review") assigned to program `103` ("Distributed Cluster", `defunded`, `74` service hours). This view supports inventory management and resource allocation decisions.

**View `information_resource_student_detail_view`**

```sql
CREATE VIEW information_resource_student_detail_view AS
SELECT a.resource_id, a.title, a.format_type, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM information_resources a
  JOIN resources_students j ON j.resource_id = a.resource_id
  JOIN students b ON b.student_id = j.student_id;
```

| resource_id | title | format_type | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 1167 | Compact Initiative | print_book | 392507 | Theodore Mcgrath | 29 |
| 1167 | Compact Initiative | print_book | 25388256 | Account Name | 33 |
| 2106708 | Legacy Model | electronic_database | 25388256 | Account Name | 33 |
| 2106708 | Legacy Model | electronic_database | id_16 | Saipan International Airport | 37 |
| 4180945 | Regional Cluster A | multimedia | id_16 | Saipan International Airport | 37 |
| 4180945 | Regional Cluster A | multimedia | gd_taxc_2211 | Norma Fisher | 41 |
| 10238270 | Seasonal Review | periodical | gd_taxc_2211 | Norma Fisher | 41 |
| 10238270 | Seasonal Review | periodical | 392507 | Theodore Mcgrath | 29 |

This view links information resources to the students who have accessed them. A row might connect resource `1167` ("Compact Initiative") to student `392507` (Theodore Mcgrath, `beginner` proficiency). Another row could link resource `2106708` ("Legacy Model") to student `25388256` (Account Name, `developing` proficiency). This view enables resource utilization tracking and student engagement analysis.

**View `student_school_library_program_detail_view`**

```sql
CREATE VIEW student_school_library_program_detail_view AS
SELECT a.student_id, a.full_name, a.grade_level, b.id AS program_id, b.program_id AS program_program_id, b.name AS program_name
FROM students a
  JOIN students_programs j ON j.student_id = a.student_id
  JOIN school_library_programs b ON b.id = j.school_library_program_id;
```

| student_id | full_name | grade_level | program_id | program_program_id | program_name |
|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | 29 | 100 | 103176 | Extended Review |
| 392507 | Theodore Mcgrath | 29 | 101 | 2986219 | Pilot Initiative A |
| 25388256 | Account Name | 33 | 101 | 2986219 | Pilot Initiative A |
| 25388256 | Account Name | 33 | 102 | 1186079 | Baseline Model |
| id_16 | Saipan International Airport | 37 | 102 | 1186079 | Baseline Model |
| id_16 | Saipan International Airport | 37 | 103 | 1562855 | Distributed Cluster |
| gd_taxc_2211 | Norma Fisher | 41 | 103 | 1562855 | Distributed Cluster |
| gd_taxc_2211 | Norma Fisher | 41 | 100 | 103176 | Extended Review |

The student–program detail view presents each student alongside the programs they participate in. A row might show student `392507` (Theodore Mcgrath, grade `29`, `beginner`, attendance `15.95`) enrolled in program `100` ("Extended Review", `active`, funding `9.95`). Another row could pair student `gd_taxc_2211` (Norma Fisher, grade `41`, `advanced`, attendance `24.80`) with program `103` ("Distributed Cluster", `defunded`, funding `21.80`). This view supports student progress tracking across programs.

**View `student_information_resource_detail_view`**

```sql
CREATE VIEW student_information_resource_detail_view AS
SELECT a.student_id, a.full_name, a.grade_level, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format_type AS resource_format_type
FROM students a
  JOIN students_resources j ON j.student_id = a.student_id
  JOIN information_resources b ON b.resource_id = j.resource_id;
```

| student_id | full_name | grade_level | resource_resource_id | resource_title | resource_format_type |
|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | 29 | 1167 | Compact Initiative | print_book |
| 392507 | Theodore Mcgrath | 29 | 2106708 | Legacy Model | electronic_database |
| 25388256 | Account Name | 33 | 2106708 | Legacy Model | electronic_database |
| 25388256 | Account Name | 33 | 4180945 | Regional Cluster A | multimedia |
| id_16 | Saipan International Airport | 37 | 4180945 | Regional Cluster A | multimedia |
| id_16 | Saipan International Airport | 37 | 10238270 | Seasonal Review | periodical |
| gd_taxc_2211 | Norma Fisher | 41 | 10238270 | Seasonal Review | periodical |
| gd_taxc_2211 | Norma Fisher | 41 | 1167 | Compact Initiative | print_book |

This view connects students directly to the information resources they use. A row might link student `392507` (Theodore Mcgrath, `beginner`) to resource `1167` ("Compact Initiative", `print_book`, `new`). Another row could connect student `id_16` (Saipan International Airport, `proficient`) to resource `4180945` ("Regional Cluster A", `multimedia`, `worn`). This view is valuable for understanding resource accessibility across proficiency levels.

**View `student_teacher_librarian_detail_view`**

```sql
CREATE VIEW student_teacher_librarian_detail_view AS
SELECT a.student_id, a.full_name, a.grade_level, b.teacher_librarian_id AS librarian_teacher_librarian_id, b.employee_id AS librarian_employee_id, b.full_name AS librarian_full_name
FROM students a
  JOIN students_librarians j ON j.student_id = a.student_id
  JOIN teacher_librarians b ON b.teacher_librarian_id = j.teacher_librarian_id;
```

| student_id | full_name | grade_level | librarian_teacher_librarian_id | librarian_employee_id | librarian_full_name |
|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | 29 | 1 | Norma Fisher | Theodore Mcgrath |
| 392507 | Theodore Mcgrath | 29 | 2 | Tasha Rodriguez | Account Name |
| 25388256 | Account Name | 33 | 2 | Tasha Rodriguez | Account Name |
| 25388256 | Account Name | 33 | 3 | Theodore Mcgrath | Saipan International Airport |
| id_16 | Saipan International Airport | 37 | 3 | Theodore Mcgrath | Saipan International Airport |
| id_16 | Saipan International Airport | 37 | 4 | Peter Mcdowell | Norma Fisher |
| gd_taxc_2211 | Norma Fisher | 41 | 4 | Peter Mcdowell | Norma Fisher |
| gd_taxc_2211 | Norma Fisher | 41 | 1 | Norma Fisher | Theodore Mcgrath |

The student–teacher librarian detail view reveals which librarians serve which students. A row might show student `392507` (Theodore Mcgrath, `beginner`, special needs `true`) served by librarian `1` (Norma Fisher, `full_time`, `7` years experience). Another row could pair student `25388256` (Account Name, `developing`, special needs `false`) with librarian `2` (Tasha Rodriguez, `part_time`, `10` years experience). This view supports student–librarian matching and service delivery analysis.

**View `information_literacy_standard_school_library_program_detail_view`**

```sql
CREATE VIEW information_literacy_standard_school_library_program_detail_view AS
SELECT a.id, a.standard_id, a.standard_code, b.id AS program_id, b.program_id AS program_program_id, b.name AS program_name
FROM information_literacy_standards a
  JOIN standards_programs j ON j.information_literacy_standard_id = a.id
  JOIN school_library_programs b ON b.id = j.school_library_program_id;
```

| id | standard_id | standard_code | program_id | program_program_id | program_name |
|---|---|---|---|---|---|
| 1000 | 7119764 | L459 | 100 | 103176 | Extended Review |
| 1000 | 7119764 | L459 | 101 | 2986219 | Pilot Initiative A |
| 1001 | 9125617 | account_pymes_596 | 101 | 2986219 | Pilot Initiative A |
| 1001 | 9125617 | account_pymes_596 | 102 | 1186079 | Baseline Model |
| 1002 | 338526 | 9125613 | 102 | 1186079 | Baseline Model |
| 1002 | 338526 | 9125613 | 103 | 1562855 | Distributed Cluster |
| 1003 | 3717623 | 8189504 | 103 | 1562855 | Distributed Cluster |
| 1003 | 3717623 | 8189504 | 100 | 103176 | Extended Review |

This view presents each literacy standard alongside the programs it governs. A row might show standard `1000` (code `L459`, "Extended Survey", `non_compliant`, review cycle `40`) applied to program `100` ("Extended Review", `active`). Another row could link standard `1003` (code `8189504`, "Distributed Assessment", `exemplary`, review cycle `49`) to program `103` ("Distributed Cluster", `defunded`). This view is essential for standards compliance auditing.

**View `information_literacy_standard_assessment_metric_detail_view`**

```sql
CREATE VIEW information_literacy_standard_assessment_metric_detail_view AS
SELECT a.id, a.standard_id, a.standard_code, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name, b.measurement_type AS metric_measurement_type
FROM information_literacy_standards a
  JOIN standards_metrics j ON j.information_literacy_standard_id = a.id
  JOIN assessment_metrics b ON b.metric_id = j.metric_id;
```

| id | standard_id | standard_code | metric_metric_id | metric_metric_name | metric_measurement_type |
|---|---|---|---|---|---|
| 1000 | 7119764 | L459 | 3744010 | Primary Programme A | quantitative |
| 1000 | 7119764 | L459 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative |
| 1001 | 9125617 | account_pymes_596 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative |
| 1001 | 9125617 | account_pymes_596 | 2986226 | Compact Framework | observational |
| 1002 | 338526 | 9125613 | 2986226 | Compact Framework | observational |
| 1002 | 338526 | 9125613 | 2002007020010 | Legacy Protocol D | survey |
| 1003 | 3717623 | 8189504 | 2002007020010 | Legacy Protocol D | survey |
| 1003 | 3717623 | 8189504 | 3744010 | Primary Programme A | quantitative |

The standard–metric detail view maps each literacy standard to the assessment metrics that measure it. A row might connect standard `1000` ("Extended Survey") to metric `3744010` ("Primary Programme A", `quantitative`, administered `2024-03-24`, threshold `22.45`, `pending`). Another row could link standard `1003` ("Distributed Assessment") to metric `2002007020010` ("Legacy Protocol D", `survey`, administered `2023-06-03`, threshold `35.80`, `exceeded`). This view supports assessment design validation and metric-to-standard traceability.

**View `assessment_metric_student_detail_view`**

```sql
CREATE VIEW assessment_metric_student_detail_view AS
SELECT a.metric_id, a.metric_name, a.measurement_type, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM assessment_metrics a
  JOIN metrics_students j ON j.metric_id = a.metric_id
  JOIN students b ON b.student_id = j.student_id;
```

| metric_id | metric_name | measurement_type | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 392507 | Theodore Mcgrath | 29 |
| 3744010 | Primary Programme A | quantitative | 25388256 | Account Name | 33 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 25388256 | Account Name | 33 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | id_16 | Saipan International Airport | 37 |
| 2986226 | Compact Framework | observational | id_16 | Saipan International Airport | 37 |
| 2986226 | Compact Framework | observational | gd_taxc_2211 | Norma Fisher | 41 |
| 2002007020010 | Legacy Protocol D | survey | gd_taxc_2211 | Norma Fisher | 41 |
| 2002007020010 | Legacy Protocol D | survey | 392507 | Theodore Mcgrath | 29 |

This view links assessment metrics to the students who were assessed. A row might show metric `3744010` ("Primary Programme A", `quantitative`, threshold `22.45`) assessed against student `392507` (Theodore Mcgrath, `beginner`, attendance `15.95`). Another row could connect metric `2002007020010` ("Legacy Protocol D", `survey`, threshold `35.80`) to student `gd_taxc_2211` (Norma Fisher, `advanced`, attendance `24.80`). This view enables outcome analysis and student performance tracking.

**View `assessment_metric_information_literacy_standard_view`**

```sql
CREATE VIEW assessment_metric_information_literacy_standard_view AS
SELECT a.metric_id, a.metric_name, a.measurement_type, a.administered_date, b.id AS standard_id, b.standard_id AS standard_standard_id, b.standard_code AS standard_standard_code
FROM assessment_metrics a JOIN information_literacy_standards b ON a.information_literacy_standard_id = b.id;
```

| metric_id | metric_name | measurement_type | administered_date | standard_id | standard_standard_id | standard_standard_code |
|---|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 2024-03-24 | 1000 | 7119764 | L459 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 2025-08-08 | 1001 | 9125617 | account_pymes_596 |
| 2986226 | Compact Framework | observational | 2022-01-19 | 1002 | 338526 | 9125613 |
| 2002007020010 | Legacy Protocol D | survey | 2023-06-03 | 1003 | 3717623 | 8189504 |

The metric–standard view presents each assessment metric alongside the standard it measures. A row might display metric `136630a8-8fcc-11eb-924d-9cd76263cbd0` ("Composite Standard", `qualitative`, `completed`) measuring standard `1001` (code `account_pymes_596`, "Pilot Corridor A", `partial`). Another row could show metric `2986226` ("Compact Framework", `observational`, `failed`) measuring standard `1002` (code `9125613`, "Baseline Series", `full"). This view supports metric effectiveness evaluation.

**View `assessment_metric_teacher_librarian_view`**

```sql
CREATE VIEW assessment_metric_teacher_librarian_view AS
SELECT a.metric_id, a.metric_name, a.measurement_type, a.administered_date, b.teacher_librarian_id AS librarian_teacher_librarian_id, b.employee_id AS librarian_employee_id, b.full_name AS librarian_full_name
FROM assessment_metrics a JOIN teacher_librarians b ON a.teacher_librarian_id = b.teacher_librarian_id;
```

| metric_id | metric_name | measurement_type | administered_date | librarian_teacher_librarian_id | librarian_employee_id | librarian_full_name |
|---|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 2024-03-24 | 1 | Norma Fisher | Theodore Mcgrath |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 2025-08-08 | 2 | Tasha Rodriguez | Account Name |
| 2986226 | Compact Framework | observational | 2022-01-19 | 3 | Theodore Mcgrath | Saipan International Airport |
| 2002007020010 | Legacy Protocol D | survey | 2023-06-03 | 4 | Peter Mcdowell | Norma Fisher |

This view connects assessment metrics to the teacher librarians who administered them. A row might link metric `3744010` ("Primary Programme A", `pending`) to librarian `1` (Norma Fisher, `full_time`, `seasonal-certific-59`). Another row could connect metric `2986226` ("Compact Framework", `failed") to librarian `3` (Theodore Mcgrath, `contract`, `legacy-certific-61`). This view is useful for rater performance analysis and assessment administration oversight.

**View `assessment_metric_assessment_record_view`**

```sql
CREATE VIEW assessment_metric_assessment_record_view AS
SELECT a.metric_id, a.metric_name, a.measurement_type, a.administered_date, b.id AS record_id, b.record_id AS record_record_id, b.assessment_date AS record_assessment_date
FROM assessment_metrics a JOIN assessment_records b ON a.assessment_record_id = b.id;
```

| metric_id | metric_name | measurement_type | administered_date | record_id | record_record_id | record_assessment_date |
|---|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 2024-03-24 | 1 | 10449530 | 2022-05-10 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 2025-08-08 | 2 | 10445619 | 2023-10-21 |
| 2986226 | Compact Framework | observational | 2022-01-19 | 3 | 9568457 | 2024-03-05 |
| 2002007020010 | Legacy Protocol D | survey | 2023-06-03 | 4 | 20743593 | 2025-08-16 |

The metric–record view presents each assessment metric alongside the assessment record that contains it. A row might show metric `3744010` ("Primary Programme A", `quantitative`, threshold `22.45`) within assessment record `1`. Another row could link metric `2002007020010` ("Legacy Protocol D", `survey`, `exceeded`) to assessment record `4`. This view supports assessment record completeness and integrity checks.

**View `assessment_record_assessment_metric_view`**

```sql
CREATE VIEW assessment_record_assessment_metric_view AS
SELECT a.id, a.record_id, a.assessment_date, a.raw_score, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name, b.measurement_type AS metric_measurement_type
FROM assessment_records a JOIN assessment_metrics b ON a.metric_id = b.metric_id;
```

| id | record_id | assessment_date | raw_score | metric_metric_id | metric_metric_name | metric_measurement_type |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2022-05-10 | 5.45 | 3744010 | Primary Programme A | quantitative |
| 2 | 10445619 | 2023-10-21 | 9.90 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative |
| 3 | 9568457 | 2024-03-05 | 14.35 | 2986226 | Compact Framework | observational |
| 4 | 20743593 | 2025-08-16 | 18.80 | 2002007020010 | Legacy Protocol D | survey |

This view presents each assessment record alongside the metrics it contains. A row might display assessment record `1` containing metric `3744010` ("Primary Programme A", `pending`, administered `2024-03-24`). Another row could show assessment record `3` containing metric `298630a8-8fcc-11eb-924d-9cd76263cbd0` ("Compact Framework", `failed`, administered `2022-01-19"). This view is essential for assessment record review and outcome aggregation.

**View `assessment_record_student_view`**

```sql
CREATE VIEW assessment_record_student_view AS
SELECT a.id, a.record_id, a.assessment_date, a.raw_score, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM assessment_records a JOIN students b ON a.student_id = b.student_id;
```

| id | record_id | assessment_date | raw_score | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2022-05-10 | 5.45 | 392507 | Theodore Mcgrath | 29 |
| 2 | 10445619 | 2023-10-21 | 9.90 | 25388256 | Account Name | 33 |
| 3 | 9568457 | 2024-03-05 | 14.35 | id_16 | Saipan International Airport | 37 |
| 4 | 20743593 | 2025-08-16 | 18.80 | gd_taxc_2211 | Norma Fisher | 41 |

The record–student view links assessment records to the students they document. A row might connect assessment record `1` to student `392507` (Theodore Mcgrath, `beginner`, special needs `true`). Another row could link assessment record `4` to student `gd_taxc_2211` (Norma Fisher, `advanced`, special needs `false`). This view supports individual student assessment history and longitudinal progress tracking.

**View `assessment_record_school_library_program_view`**

```sql
CREATE VIEW assessment_record_school_library_program_view AS
SELECT a.id, a.record_id, a.assessment_date, a.raw_score, b.id AS program_id, b.program_id AS program_program_id, b.name AS program_name
FROM assessment_records a JOIN school_library_programs b ON a.school_library_program_id = b.id;
```

| id | record_id | assessment_date | raw_score | program_id | program_program_id | program_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2022-05-10 | 5.45 | 100 | 103176 | Extended Review |
| 2 | 10445619 | 2023-10-21 | 9.90 | 101 | 2986219 | Pilot Initiative A |
| 3 | 9568457 | 2024-03-05 | 14.35 | 102 | 1186079 | Baseline Model |
| 4 | 20743593 | 2025-08-16 | 18.80 | 103 | 1562855 | Distributed Cluster |

This view connects assessment records to the programs under which they were conducted. A row might show assessment record `1` conducted under program `100` ("Extended Review", `active`, funding `9.95`). Another row could link assessment record `3` to program `102` ("Baseline Model", `suspended`, funding `17.85`). This view enables program-level assessment aggregation and outcome benchmarking.

The school library program domain integrates seven entity types through a network of direct assignments and many-to-many relationships. Programs serve as the operational anchor, each staffed by teacher librarians, equipped with information resources, and serving students whose progress is measured against literacy standards through defined assessment metrics. The junction tables ensure that no relationship is lost to a single directional association, while the view layer provides ready-made analytical perspectives for practitioners who need to understand staffing, resource allocation, standards compliance, or student outcomes. Together, these structures form a coherent operational model that supports both day-to-day management and strategic planning across the library program ecosystem.