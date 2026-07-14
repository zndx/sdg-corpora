The school library ecosystem is a multi-dimensional domain where programs, people, resources, standards, and assessments interlock. A school library program is the central organizing entity: it has a `program_id` such as `103176` for the "Extended Review" program, a `name`, an `established_date` like `2024-03-27`, a `last_review_date`, a `funding_level` (e.g. `9.95`), an `operational_status` (`active`, `under_review`, `suspended`, `defunded`), a `collection_size` (e.g. `28`), and `service_hours` (e.g. `47`). Teacher librarians staff these programs; each librarian record carries a `teacher_librarian_id`, an `employee_id`, a `full_name` (such as "Norma Fisher" or "Account Name"), a `certification_level` (`seasonal-certific-59`, `regional-certific-60`, `legacy-certific-61`, `compact-certific-62`), `years_of_experience` (ranging from `7` to `16`), an `employment_status` (`full_time`, `part_time`, `contract`, `vacant`), a `specialization` (`legacy-speciali-13`, `compact-speciali-14`, `composite-speciali-15`, `primary-speciali-16`), a `hire_date`, and a foreign key `school_library_program_id` that anchors the librarian to exactly one program. Information resources — the library's collection — are cataloged with a `resource_id`, a `title` ("Compact Initiative", "Legacy Model", "Regional Cluster A", "Seasonal Review"), a `format_type` (`print_book`, `electronic_database`, `multimedia`, `periodical`), an `acquisition_date`, a `condition_status` (`new`, `good`, `worn`, `obsolete`), a `curriculum_alignment` (`primary-curricul-40`, `adaptive-curricul-41`, `distributed-curricul-42`, `baseline-curricul-43`), an `access_restriction` flag, a `last_cataloged_date`, and a `school_library_program_id` foreign key. Students are enrolled with a `student_id` (`392507`, `25388256`, `id_16`, `gd_taxc_2211`), a `full_name`, a `grade_level` (`29`, `33`, `37`, `41`), an `enrollment_date`, a `literacy_proficiency` (`beginner`, `developing`, `proficient`, `advanced`), an `attendance_rate` (`15.95` to `24.80`), and a `special_needs_flag`.

Information literacy standards define the learning benchmarks. Each standard has an `id`, a `standard_id` (`7119764`, `9125617`, `338526`, `3717623`), a `standard_code` (`L459`, `account_pymes_596`, `9125613`, `8189504`), a `description` ("Extended Survey", "Pilot Corridor A", "Baseline Series", "Distributed Assessment"), an `effective_date`, a `review_cycle` (`40`–`49`), a `compliance_level` (`non_compliant`, `partial`, `full`, `exemplary`), and a `target_grade_level` (`integrated-target-34` through `legacy-target-37`). Assessment metrics record the actual evaluations performed against those standards. A metric carries a `metric_id` (`3744010`, `136630a8-8fcc-11eb-924d-9cd76263cbd0`, `2986226`, `2002007020010`), a `metric_name` ("Primary Programme A", "Composite Standard", "Compact Framework", "Legacy Protocol D"), a `measurement_type` (`quantitative`, `qualitative`, `observational`, `survey`), an `administered_date`, a `score_threshold` (`22.45` to `35.80`), a `result_status` (`pending`, `completed`, `failed`, `exceeded`), a `rater_id`, and foreign keys `information_literacy_standard_id`, `teacher_librarian_id`, and `assessment_record_id` that tie the metric to a standard, a librarian, and a record.

**Table `school_library_programs`**

| id | program_id | name | established_date | last_review_date | funding_level | operational_status | collection_size | service_hours |
|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2024-03-27 | 2022-09-03 | 9.95 | active | 28 | 47 |
| 101 | 2986219 | Pilot Initiative A | 2025-08-11 | 2023-02-14 | 13.90 | under_review | 33 | 56 |
| 102 | 1186079 | Baseline Model | 2022-01-22 | 2024-07-25 | 17.85 | suspended | 38 | 65 |
| 103 | 1562855 | Distributed Cluster | 2023-06-06 | 2025-12-09 | 21.80 | defunded | 43 | 74 |

The `school_library_programs` table is the anchor of the schema. Its primary key is the surrogate `id` column, while `program_id` serves as the business identifier. The `funding_level` column stores a numeric value representing budget allocation, and `operational_status` is a categorical column whose domain includes `active`, `under_review`, `suspended`, and `defunded`. The `collection_size` and `service_hours` columns are integer attributes that quantify the program's scope. Four rows illustrate the range: program `103176` ("Extended Review") is `active` with a funding level of `9.95` and `28` items in its collection; program `2986219` ("Pilot Initiative A") is `under_review` with funding `13.90` and `33` items; program `1186079` ("Baseline Model") is `suspended` with funding `17.85` and `38` items; and program `1562855` ("Distributed Cluster") is `defunded` with funding `21.80` and `43` items.

**Table `teacher_librarians`**

| teacher_librarian_id | employee_id | full_name | certification_level | years_of_experience | employment_status | specialization | hire_date | school_library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | seasonal-certific-59 | 7 | full_time | legacy-speciali-13 | 2023-06-01 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Tasha Rodriguez | Account Name | regional-certific-60 | 10 | part_time | compact-speciali-14 | 2024-11-12 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | legacy-certific-61 | 13 | contract | composite-speciali-15 | 2025-04-23 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Peter Mcdowell | Norma Fisher | compact-certific-62 | 16 | vacant | primary-speciali-16 | 2022-09-07 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `teacher_librarians` table models the people who run library programs. Its primary key is `teacher_librarian_id`. The column `school_library_program_id` is a foreign key referencing `school_library_programs.id`, enforcing a many-to-one relationship: many librarians can be associated with a single program, but each librarian record points to exactly one program. The `certification_level` column uses coded values such as `seasonal-certific-59` and `compact-certific-62`. The `employment_status` column takes values `full_time`, `part_time`, `contract`, and `vacant`. The `specialization` column uses codes like `legacy-speciali-13` and `primary-speciali-16`. Timestamps `created_at` and `updated_at` track record lifecycle. Row `1` ("Norma Fisher") is a `full_time` librarian with `7` years of experience, certified at level `seasonal-certific-59`, specializing in `legacy-speciali-13`, hired on `2023-06-01`, and assigned to program `100`.

**Table `information_resources`**

| resource_id | title | format_type | acquisition_date | condition_status | curriculum_alignment | access_restriction | last_cataloged_date | school_library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | print_book | 2023-02-07 | new | primary-curricul-40 | false | 2023-06-10 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2106708 | Legacy Model | electronic_database | 2024-07-18 | good | adaptive-curricul-41 | true | 2024-11-21 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4180945 | Regional Cluster A | multimedia | 2025-12-02 | worn | distributed-curricul-42 | false | 2025-04-05 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10238270 | Seasonal Review | periodical | 2022-05-13 | obsolete | baseline-curricul-43 | true | 2022-09-16 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Information resources are cataloged in `information_resources`. The primary key is `resource_id`. The foreign key `school_library_program_id` links each resource to the program that owns it. The `format_type` column enumerates `print_book`, `electronic_database`, `multimedia`, and `periodical`. The `condition_status` column uses `new`, `good`, `worn`, and `obsolete`. The `curriculum_alignment` column stores codes such as `primary-curricul-40` and `baseline-curricul-43`. The `access_restriction` column is a boolean flag. Resource `1167` ("Compact Initiative") is a `print_book` in `new` condition, aligned to `primary-curricul-40`, with no access restriction, owned by program `100`. Resource `2106708` ("Legacy Model") is an `electronic_database` in `good` condition, aligned to `adaptive-curricul-41`, with access restricted, owned by program `101`.

**Table `students`**

| student_id | full_name | grade_level | enrollment_date | literacy_proficiency | attendance_rate | special_needs_flag |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | 29 | 2022-05-11 | beginner | 15.95 | true |
| 25388256 | Account Name | 33 | 2023-10-22 | developing | 18.90 | false |
| id_16 | Saipan International Airport | 37 | 2024-03-06 | proficient | 21.85 | true |
| gd_taxc_2211 | Norma Fisher | 41 | 2025-08-17 | advanced | 24.80 | false |

The `students` table stores learner records. Its primary key is `student_id`. The `literacy_proficiency` column is categorical with values `beginner`, `developing`, `proficient`, and `advanced`. The `attendance_rate` is a numeric column. The `special_needs_flag` is a boolean. Student `392507` ("Theodore Mcgrath") is in grade `29`, enrolled since `2022-05-11`, at `beginner` proficiency with an attendance rate of `15.95`, and has special needs flagged as `true`. Student `gd_taxc_2211` ("Norma Fisher") is in grade `41`, enrolled since `2025-08-17`, at `advanced` proficiency with attendance `24.80`, and no special needs.

**Table `information_literacy_standards`**

| id | standard_id | standard_code | description | effective_date | review_cycle | compliance_level | target_grade_level | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 7119764 | L459 | Extended Survey | 2023-02-14 | 40 | non_compliant | integrated-target-34 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 9125617 | account_pymes_596 | Pilot Corridor A | 2024-07-25 | 43 | partial | seasonal-target-35 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 338526 | 9125613 | Baseline Series | 2025-12-09 | 46 | full | regional-target-36 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 3717623 | 8189504 | Distributed Assessment | 2022-05-20 | 49 | exemplary | legacy-target-37 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `information_literacy_standards` table defines the learning benchmarks. Its primary key is `id`. The `standard_id` column is a business identifier (e.g. `7119764`). The `standard_code` column stores short codes like `L459` and `account_pymes_596`. The `compliance_level` column takes values `non_compliant`, `partial`, `full`, and `exemplary`. The `review_cycle` column is an integer representing the number of months between reviews. Standard `1000` with code `L459` ("Extended Survey") has a `non_compliant` compliance level, a `40`-month review cycle, and targets `integrated-target-34`.

**Table `assessment_metrics`**

| metric_id | metric_name | measurement_type | administered_date | score_threshold | result_status | rater_id | information_literacy_standard_id | teacher_librarian_id | assessment_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 3744010 | Primary Programme A | quantitative | 2024-03-24 | 22.45 | pending | 392492 | 1000 | 1 | 1 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Standard | qualitative | 2025-08-08 | 26.90 | completed | df2e1a52-8fcc-11eb-924d-9cd76263cbd0 | 1001 | 2 | 2 |
| 2986226 | Compact Framework | observational | 2022-01-19 | 31.35 | failed | 24921600 | 1002 | 3 | 3 |
| 2002007020010 | Legacy Protocol D | survey | 2023-06-03 | 35.80 | exceeded | sga | 1003 | 4 | 4 |

The `assessment_metrics` table records evaluation events. Its primary key is `metric_id`. The `measurement_type` column enumerates `quantitative`, `qualitative`, `observational`, and `survey`. The `result_status` column takes values `pending`, `completed`, `failed`, and `exceeded`. The `score_threshold` is a numeric column. Foreign keys `information_literacy_standard_id`, `teacher_librarian_id`, and `assessment_record_id` link each metric to a standard, a librarian, and a record respectively. Metric `3744010` ("Primary Programme A") is a `quantitative` measurement administered on `2024-03-24` with a threshold of `22.45`, status `pending`, and is associated with standard `1000`, librarian `1`, and record `1`.

**Table `assessment_records`**

| id | record_id | assessment_date | raw_score | normalized_score | feedback_notes | review_status | data_integrity_check | metric_id | student_id | school_library_program_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2022-05-10 | 5.45 | 10.20 | regional-feedback-90 | draft | true | 3744010 | 392507 | 100 |
| 2 | 10445619 | 2023-10-21 | 9.90 | 12.40 | legacy-feedback-91 | submitted | false | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 25388256 | 101 |
| 3 | 9568457 | 2024-03-05 | 14.35 | 14.60 | compact-feedback-92 | approved | true | 2986226 | id_16 | 102 |
| 4 | 20743593 | 2025-08-16 | 18.80 | 16.80 | composite-feedback-93 | archived | false | 2002007020010 | gd_taxc_2211 | 103 |

The `assessment_records` table captures the container records for assessment events. While the data sample does not show explicit rows, the schema design positions this table as the parent of `assessment_metrics` via the `assessment_record_id` foreign key in the metrics table. Each record aggregates one or more metrics against a standard.

The schema then uses a rich set of junction tables to model many-to-many relationships that cannot be expressed through simple foreign keys. The `programs_librarians` junction table links `school_library_programs` to `teacher_librarians`, allowing a program to have multiple librarians and a librarian to serve multiple programs. The `programs_students` and `students_programs` tables both model the program–student enrollment relationship from complementary perspectives. The `programs_standards` and `standards_programs` tables link library programs to the literacy standards they address. The `librarians_resources` table connects teacher librarians to the information resources they manage. The `resources_students` and `students_resources` tables model student access to resources. The `students_librarians` table captures student–librarian interactions. The `standards_metrics` table links literacy standards to the assessment metrics that measure compliance. The `metrics_students` table connects assessment metrics to the students who were assessed.

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

The `programs_librarians` junction table resolves the many-to-many relationship between `school_library_programs` and `teacher_librarians`. It contains foreign keys referencing both parent tables, enabling a single program like `103176` ("Extended Review") to be staffed by multiple librarians, and a librarian like "Norma Fisher" (`teacher_librarian_id = 1`) to serve across multiple programs.

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

The `programs_students` junction table links `school_library_programs` to `students`. It captures which students are enrolled in which programs. A student such as `392507` ("Theodore Mcgrath") may appear in multiple rows, each referencing a different program.

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

The `programs_standards` junction table connects `school_library_programs` to `information_literacy_standards`. It expresses which standards a program is designed to address. Program `103176` ("Extended Review") might be linked to standard `1000` ("Extended Survey", code `L459`).

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

The `librarians_resources` junction table links `teacher_librarians` to `information_resources`. It models the assignment of resources to the librarians who manage them. Librarian `1` ("Norma Fisher") might be assigned resource `1167` ("Compact Initiative").

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

The `resources_students` junction table connects `information_resources` to `students`. It records which students have accessed or are assigned which resources. Student `392507` might be linked to resource `1167`.

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

The `students_programs` junction table provides the reverse perspective of `programs_students`, linking `students` to `school_library_programs`. It serves the same many-to-many relationship but from the student's side, enabling queries that start from a student and traverse to their programs.

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

The `students_resources` junction table provides the reverse perspective of `resources_students`, linking `students` to `information_resources`. It enables queries that start from a student and enumerate the resources they have interacted with.

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

The `students_librarians` junction table links `students` to `teacher_librarians`. It captures the advisory or instructional relationships between students and librarians. Student `392507` ("Theodore Mcgrath") might be associated with librarian `1` ("Norma Fisher").

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

The `standards_programs` junction table provides the reverse perspective of `programs_standards`, linking `information_literacy_standards` to `school_library_programs`. It enables queries that start from a standard and enumerate the programs that address it.

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

The `standards_metrics` junction table links `information_literacy_standards` to `assessment_metrics`. It expresses which metrics are used to evaluate compliance with a given standard. Standard `1000` ("Extended Survey") might be associated with metric `3744010` ("Primary Programme A").

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

The `metrics_students` junction table connects `assessment_metrics` to `students`. It records which students were assessed by which metrics. Metric `3744010` might be linked to student `392507`.

The view layer materializes the normalized schema into denormalized result sets that answer specific domain questions. Each view performs a controlled set of joins across the base and junction tables to reconstruct a coherent fact from the domain.

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

This view joins `school_library_programs` with `teacher_librarians` (through `programs_librarians` if needed) to answer: "Which librarians staff which programs?" Reading the row for program `103176` ("Extended Review") and librarian `1` ("Norma Fisher"), the view presents the program's `funding_level` of `9.95` alongside the librarian's `certification_level` of `seasonal-certific-59` and `years_of_experience` of `7`.

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

This view joins `school_library_programs` with `students` (through `programs_students` or `students_programs`) to answer: "Which students are enrolled in which programs?" The row for program `103176` and student `392507` ("Theodore Mcgrath") shows the program's `collection_size` of `28` alongside the student's `literacy_proficiency` of `beginner` and `attendance_rate` of `15.95`.

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

This view joins `school_library_programs` with `information_literacy_standards` (through `programs_standards` or `standards_programs`) to answer: "Which standards does each program address?" The row for program `103176` and standard `1000` ("Extended Survey", code `L459`) presents the program's `operational_status` of `active` alongside the standard's `compliance_level` of `non_compliant` and `review_cycle` of `40`.

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

This view joins `teacher_librarians` with `school_library_programs` to answer: "Which program does each librarian belong to?" The row for librarian `1` ("Norma Fisher") shows the program `103176` ("Extended Review") with `service_hours` of `47` and `established_date` of `2024-03-27`.

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

This view joins `teacher_librarians` with `information_resources` (through `librarians_resources`) to answer: "Which resources does each librarian manage?" The row for librarian `1` ("Norma Fisher") and resource `1167` ("Compact Initiative") presents the librarian's `specialization` of `legacy-speciali-13` alongside the resource's `format_type` of `print_book` and `condition_status` of `new`.

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

This view joins `information_resources` with `school_library_programs` to answer: "Which program owns each resource?" The row for resource `1167` ("Compact Initiative") shows program `103176` ("Extended Review") with `funding_level` of `9.95` and the resource's `curriculum_alignment` of `primary-curricul-40`.

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

This view joins `information_resources` with `students` (through `resources_students` or `students_resources`) to answer: "Which students access which resources?" The row for resource `1167` ("Compact Initiative") and student `392507` ("Theodore Mcgrath") presents the resource's `access_restriction` of `false` alongside the student's `grade_level` of `29`.

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

This view joins `students` with `school_library_programs` (through `programs_students` or `students_programs`) to answer: "Which programs is each student enrolled in?" The row for student `392507` ("Theodore Mcgrath") and program `103176` ("Extended Review") shows the student's `special_needs_flag` of `true` alongside the program's `collection_size` of `28`.

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

This view joins `students` with `information_resources` (through `students_resources` or `resources_students`) to answer: "Which resources has each student interacted with?" The row for student `392507` ("Theodore Mcgrath") and resource `1167` ("Compact Initiative") presents the student's `literacy_proficiency` of `beginner` alongside the resource's `title` and `format_type` of `print_book`.

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

This view joins `students` with `teacher_librarians` (through `students_librarians`) to answer: "Which librarian advises each student?" The row for student `392507` ("Theodore Mcgrath") and librarian `1` ("Norma Fisher") shows the student's `attendance_rate` of `15.95` alongside the librarian's `employment_status` of `full_time`.

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

This view joins `information_literacy_standards` with `school_library_programs` (through `standards_programs` or `programs_standards`) to answer: "Which programs address each standard?" The row for standard `1000` ("Extended Survey", code `L459`) and program `103176` ("Extended Review") presents the standard's `target_grade_level` of `integrated-target-34` alongside the program's `operational_status` of `active`.

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

This view joins `information_literacy_standards` with `assessment_metrics` (through `standards_metrics`) to answer: "Which metrics evaluate each standard?" The row for standard `1000` ("Extended Survey") and metric `3744010` ("Primary Programme A") shows the standard's `compliance_level` of `non_compliant` alongside the metric's `measurement_type` of `quantitative` and `result_status` of `pending`.

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

This view joins `assessment_metrics` with `students` (through `metrics_students`) to answer: "Which students were assessed by each metric?" The row for metric `3744010` ("Primary Programme A") and student `392507` ("Theodore Mcgrath") presents the metric's `score_threshold` of `22.45` alongside the student's `literacy_proficiency` of `beginner`.

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

This view joins `assessment_metrics` with `information_literacy_standards` to answer: "Which standard does each metric measure?" The row for metric `3744010` ("Primary Programme A") and standard `1000` ("Extended Survey", code `L459`) shows the metric's `administered_date` of `2024-03-24` alongside the standard's `effective_date` of `2023-02-14`.

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

This view joins `assessment_metrics` with `teacher_librarians` to answer: "Which librarian administered each metric?" The row for metric `3744010` ("Primary Programme A") and librarian `1` ("Norma Fisher") presents the metric's `rater_id` of `392492` alongside the librarian's `years_of_experience` of `7`.

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

This view joins `assessment_metrics` with `assessment_records` to answer: "Which record contains each metric?" The row for metric `3744010` ("Primary Programme A") and record `1` shows the metric's `result_status` of `pending` alongside the record's metadata.

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

This view joins `assessment_records` with `assessment_metrics` to answer: "Which metrics belong to each record?" The row for record `1` and metric `3744010` ("Primary Programme A") presents the record's identifier alongside the metric's `metric_name` and `score_threshold` of `22.45`.

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

This view joins `assessment_records` with `students` (through `assessment_metrics` and `metrics_students`) to answer: "Which students were assessed in each record?" The row for record `1` and student `392507` ("Theodore Mcgrath") shows the student's `grade_level` of `29` alongside the record's assessment context.

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

This view joins `assessment_records` with `school_library_programs` (through `assessment_metrics`, `teacher_librarians`, and the program–librarian link) to answer: "Which program was assessed in each record?" The row for record `1` and program `103176` ("Extended Review") presents the program's `funding_level` of `9.95` alongside the record's assessment context.

The schema design follows a disciplined normalization strategy: the five core entity tables (`school_library_programs`, `teacher_librarians`, `information_resources`, `students`, `information_literacy_standards`) store atomic facts with surrogate primary keys and natural attributes. The `assessment_metrics` table sits at the intersection of standards, librarians, and records, carrying three foreign keys that anchor it to its context. The `assessment_records` table provides an aggregation container for metrics. The junction tables (`programs_librarians`, `programs_students`, `programs_standards`, `librarians_resources`, `resources_students`, `students_programs`, `students_resources`, `students_librarians`, `standards_programs`, `standards_metrics`, `metrics_students`) resolve the many-to-many relationships that the core entities participate in, ensuring that no redundant data is stored and that referential integrity is maintained through explicit foreign key constraints. The twenty views then materialize the most common analytical queries as virtual tables, each performing a precise join path that reconstructs a domain fact — for example, the `school_library_program_teacher_librarian_detail_view` joins programs to librarians to answer staffing questions, while the `assessment_metric_student_detail_view` joins metrics to students to answer assessment outcomes. Together, the base tables, junction tables, and views form a complete, queryable model of the school library domain, where every row in every view can be traced back through its join path to the normalized source tables.