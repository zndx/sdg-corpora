## The Assessment Standards Domain

The educational administration domain under examination centres on the governance of academic courses through assessment standards, scheduled assessment events, and the teachers who deliver them. An assessment standard is a formal specification—identified by a code such as `STA-2752`—that prescribes the method of assessment, the number of opportunities offered to students, and the credit weight of the qualification. Courses, identified by codes like `10238263` or `1204-0009-L`, are the containers into which standards are assembled; a single course may carry multiple standards, and each standard may be instantiated in one or more assessment events. Teachers, such as `Theodore Mcgrath` or `Account Name`, are assigned to courses, while qualifications such as `NCEA Level 2` or `Scholarship` define the credential outcomes available to students completing a course. The relational model captures these entities and their relationships through a set of base tables and a suite of denormalised views that reconstruct the domain facts required for reporting.

**Table `assessment_standards`**

| id | standard_number | version | level | credits | literacy_or_numeracy_requirement | full_title | method_of_assessment | assessment_opportunities_offered | course_id | assessment_event_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | STA-2752 | 21 | 21 | 28 | L1 Lit | Extended Review | Assignment | 12 | 100 | 1 |
| 2 | STA-2757 | 31 | 31 | 33 | L1 Num | Pilot Initiative A | Exam | 23 | 101 | 2 |
| 3 | STA-2762 | 41 | 41 | 38 | None | Baseline Model | External | 34 | 102 | 3 |
| 4 | STA-2767 | 51 | 51 | 43 | L1 Lit | Distributed Cluster | Internal | 45 | 103 | 4 |

The `assessment_standards` table is the primary entity for the standards domain. Each row represents a distinct assessment standard, uniquely identified by the surrogate key `id`. The business identifier is `standard_number`, which carries human-readable codes such as `STA-2752` and `STA-2767`. The `version` and `level` columns track the iteration and academic level of the standard; for instance, standard `STA-2752` has both version and level set to `21`, while `STA-2767` carries version and level values of `51`. The `credits` column records the credit weight of the standard, ranging from `28` credits for `STA-2752` to `43` credits for `STA-2767`. The `literacy_or_numeracy_requirement` column constrains the standard to a literacy or numeracy level, with values such as `L1 Lit`, `L1 Num`, or `None`. The `full_title` column provides a descriptive name—`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`—while `method_of_assessment` specifies how the standard is assessed, taking values like `Assignment`, `Exam`, `External`, or `Internal`. The `assessment_opportunities_offered` column is an integer indicating how many assessment attempts a student is permitted, with values ranging from `12` to `45`. The columns `course_id` and `assessment_event_id` serve as foreign keys linking the standard to its parent course and its associated assessment event, respectively.

**Table `courses`**

| course_id | course_code | year_level | subject_area | total_credits | endorsable_status | teacher_name | description | teacher_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 10238263 | 13 | compact-subject-80 | 6 | false | Compact Framework | Extended Survey | 1 |
| 101 | 4463667 | 20 | composite-subject-81 | 28 | true | Legacy Protocol | Pilot Corridor A | 2 |
| 102 | 24077793 | 27 | primary-subject-82 | 7 | false | Regional Programme A | Baseline Series | 3 |
| 103 | 1204-0009-L | 34 | adaptive-subject-83 | 4 | true | Seasonal Standard | Distributed Assessment | 4 |

The `courses` table defines the academic courses that bundle assessment standards together. Each course is identified by `course_id`, a surrogate key, and carries a business-facing `course_code` such as `10238263`, `4463667`, `24077793`, or `1204-0009-L`. The `year_level` column indicates the academic year level of the course, with values spanning `13` through `34`. The `subject_area` column classifies the course into a subject domain, using labels like `compact-subject-80`, `composite-subject-81`, `primary-subject-82`, and `adaptive-subject-83`. The `total_credits` column records the aggregate credit weight of the course, ranging from `4` to `28` credits. The `endorsable_status` column is a boolean flag indicating whether the course is eligible for endorsement; courses `101` and `103` are marked `true`, while courses `100` and `102` are `false`. The `teacher_name` column provides a human-readable name for the assigned teacher—`Compact Framework`, `Legacy Protocol`, `Regional Programme A`, `Seasonal Standard`—while the `description` column offers a longer textual description. The `teacher_id` column is a foreign key pointing to the `teachers` table.

**Table `assessment_events`**

| id | event_date | method | status | opportunity_number | assessment_standard_id | course_id |
|---|---|---|---|---|---|---|
| 1 | 2025-04-15 | Assignment | scheduled | 21 | 1 | 100 |
| 2 | 2022-09-26 | Exam | completed | 26 | 2 | 101 |
| 3 | 2023-02-10 | Assignment | pending | 31 | 3 | 102 |
| 4 | 2024-07-21 | Exam | scheduled | 36 | 4 | 103 |

The `assessment_events` table captures individual assessment instances scheduled under a standard. Each event is identified by `id` and carries an `event_date` in ISO format, such as `2025-04-15`, `2022-09-26`, `2023-02-10`, and `2024-07-21`. The `method` column mirrors the assessment method from the standard (e.g., `Assignment`, `Exam`), while the `status` column tracks the lifecycle state of the event, taking values of `scheduled`, `completed`, or `pending`. The `opportunity_number` column is an integer indicating the sequence of the opportunity, with values ranging from `21` to `36`. The `assessment_standard_id` column is a foreign key linking the event to its parent standard, and the `course_id` column links the event to the course in which it is delivered.

**Table `teachers`**

| teacher_id | full_name | employee_id | department | signature_status | course_id |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | adaptive-departme-89 | false | 100 |
| 2 | Account Name | Tasha Rodriguez | distributed-departme-90 | true | 101 |
| 3 | Saipan International Airport | Theodore Mcgrath | baseline-departme-91 | false | 102 |
| 4 | Norma Fisher | Peter Mcdowell | pilot-departme-92 | true | 103 |

The `teachers` table stores the personnel who deliver courses. Each teacher is identified by `teacher_id` and carries a `full_name` such as `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. The `employee_id` column provides an internal employee identifier, with values like `Norma Fisher`, `Tasha Rodriguez`, `Peter Mcdowell`, and `Theodore Mcgrath`. The `department` column classifies the teacher into a departmental unit, using labels such as `adaptive-departme-89`, `distributed-departme-90`, `baseline-departme-91`, and `pilot-departme-92`. The `signature_status` column is a boolean indicating whether the teacher has completed their signature requirements; teachers `2` and `4` are marked `true`, while teachers `1` and `3` are `false`. The `course_id` column is a foreign key linking the teacher to the course they deliver.

**Table `qualifications`**

| id | qualification_name | issuing_body | credits_required | endorsement_eligible | course_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | NCEA Level 2 | baseline-issuing-13 | 35 | true | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | University Entrance | pilot-issuing-14 | 39 | false | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Scholarship | extended-issuing-15 | 43 | true | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | NCEA Level 2 | integrated-issuing-16 | 47 | false | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `qualifications` table defines the credential outcomes available to students. Each qualification is identified by `id` and carries a `qualification_name` such as `NCEA Level 2`, `University Entrance`, and `Scholarship`. The `issuing_body` column names the organisation that issues the qualification, with values like `baseline-issuing-13`, `pilot-issuing-14`, `extended-issuing-15`, and `integrated-issuing-16`. The `credits_required` column records the credit threshold for the qualification, ranging from `35` to `47`. The `endorsement_eligible` column is a boolean indicating whether the qualification supports endorsement; qualifications `1000` and `1002` are `true`, while `1001` and `1003` are `false`. The `course_id` column is a foreign key linking the qualification to the course it serves. The `created_at` and `updated_at` columns record the timestamps of the qualification's creation and last modification, respectively.

**Table `courses_standards`**

| course_id | assessment_standard_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `courses_standards` table is a junction table that resolves the many-to-many relationship between `courses` and `assessment_standards`. It contains two columns: `course_id` and `assessment_standard_id`. The data shows that course `100` is associated with standards `1` and `2`; course `101` with standards `2` and `3`; course `102` with standards `3` and `4`; and course `103` with standards `4` and `1`. This structure allows any course to carry any number of standards and any standard to be shared across multiple courses, reflecting the flexible composition of academic programmes.

The foreign-key relationships in the schema form a coherent graph. The `assessment_standards` table references `courses` via `course_id` and `assessment_events` via `assessment_event_id`. The `assessment_events` table references both `assessment_standards` (via `assessment_standard_id`) and `courses` (via `course_id`). The `teachers` table references `courses` via `teacher_id` (in `courses`) and `course_id` (in `teachers`). The `qualifications` table references `courses` via `course_id`. The junction table `courses_standards` references both `courses` and `assessment_standards` via their respective surrogate keys. Together, these relationships encode the domain fact that courses are composed of standards, standards are instantiated in assessment events, teachers deliver courses, and qualifications define the credential outcomes of courses.

**View `vw_assessment_standard_course`**

```sql
CREATE VIEW vw_assessment_standard_course AS
SELECT a.id, a.standard_number, a.version, a.level, b.course_id AS course_course_id, b.course_code AS course_course_code, b.year_level AS course_year_level
FROM assessment_standards a JOIN courses b ON a.course_id = b.course_id;
```

| id | standard_number | version | level | course_course_id | course_course_code | course_year_level |
|---|---|---|---|---|---|---|
| 1 | STA-2752 | 21 | 21 | 100 | 10238263 | 13 |
| 2 | STA-2757 | 31 | 31 | 101 | 4463667 | 20 |
| 3 | STA-2762 | 41 | 41 | 102 | 24077793 | 27 |
| 4 | STA-2767 | 51 | 51 | 103 | 1204-0009-L | 34 |

The view `vw_assessment_standard_course` joins `assessment_standards` with `courses` to present each standard alongside the course to which it belongs. This view answers the question: "Which course is each assessment standard associated with?" Reading the first row, standard `STA-2752` (id `1`) is associated with course `10238263`, a year-level `13` course in the `compact-subject-80` area. The second row shows standard `STA-2757` (id `2`) linked to course `4463667`, a year-level `20` course in `composite-subject-81`. This view is useful for auditing which standards are embedded in which courses and for verifying that the credit weights and endorsement statuses align.

**View `vw_assessment_standard_assessment_event`**

```sql
CREATE VIEW vw_assessment_standard_assessment_event AS
SELECT a.id, a.standard_number, a.version, a.level, b.id AS event_id, b.event_date AS event_event_date, b.method AS event_method
FROM assessment_standards a JOIN assessment_events b ON a.assessment_event_id = b.id;
```

| id | standard_number | version | level | event_id | event_event_date | event_method |
|---|---|---|---|---|---|---|
| 1 | STA-2752 | 21 | 21 | 1 | 2025-04-15 | Assignment |
| 2 | STA-2757 | 31 | 31 | 2 | 2022-09-26 | Exam |
| 3 | STA-2762 | 41 | 41 | 3 | 2023-02-10 | Assignment |
| 4 | STA-2767 | 51 | 51 | 4 | 2024-07-21 | Exam |

The view `vw_assessment_standard_assessment_event` joins `assessment_standards` with `assessment_events` to present each standard alongside its scheduled assessment event. This view answers the question: "For each standard, what is the associated assessment event and its status?" The first row shows standard `STA-2752` (id `1`) linked to assessment event `1`, which is scheduled for `2025-04-15` using the `Assignment` method and has a `scheduled` status. The second row shows standard `STA-2757` (id `2`) linked to event `2`, which took place on `2022-09-26` using the `Exam` method and has a `completed` status. This view is essential for tracking the lifecycle of assessment events against their parent standards.

**View `vw_course_assessment_standard_detail`**

```sql
CREATE VIEW vw_course_assessment_standard_detail AS
SELECT a.course_id, a.course_code, a.year_level, b.id AS standard_id, b.standard_number AS standard_standard_number, b.version AS standard_version
FROM courses a
  JOIN courses_standards j ON j.course_id = a.course_id
  JOIN assessment_standards b ON b.id = j.assessment_standard_id;
```

| course_id | course_code | year_level | standard_id | standard_standard_number | standard_version |
|---|---|---|---|---|---|
| 100 | 10238263 | 13 | 1 | STA-2752 | 21 |
| 100 | 10238263 | 13 | 2 | STA-2757 | 31 |
| 101 | 4463667 | 20 | 2 | STA-2757 | 31 |
| 101 | 4463667 | 20 | 3 | STA-2762 | 41 |
| 102 | 24077793 | 27 | 3 | STA-2762 | 41 |
| 102 | 24077793 | 27 | 4 | STA-2767 | 51 |
| 103 | 1204-0009-L | 34 | 4 | STA-2767 | 51 |
| 103 | 1204-0009-L | 34 | 1 | STA-2752 | 21 |

The view `vw_course_assessment_standard_detail` joins `courses` with `courses_standards` and `assessment_standards` to present a detailed view of each standard as it appears within a course. This view answers the question: "What standards does a course carry, and what are their full specifications?" The first row shows course `10238263` (id `100`) carrying standard `STA-2752` (id `1`), which has `28` credits, an `L1 Lit` literacy requirement, and uses the `Assignment` method. The second row shows the same course carrying standard `STA-2757` (id `2`), which has `33` credits, an `L1 Num` requirement, and uses the `Exam` method. This view is particularly valuable for curriculum planners who need to see the full composition of a course's standards in a single row.

**View `vw_course_teacher`**

```sql
CREATE VIEW vw_course_teacher AS
SELECT a.course_id, a.course_code, a.year_level, a.subject_area, b.teacher_id AS teacher_teacher_id, b.full_name AS teacher_full_name, b.employee_id AS teacher_employee_id
FROM courses a JOIN teachers b ON a.teacher_id = b.teacher_id;
```

| course_id | course_code | year_level | subject_area | teacher_teacher_id | teacher_full_name | teacher_employee_id |
|---|---|---|---|---|---|---|
| 100 | 10238263 | 13 | compact-subject-80 | 1 | Theodore Mcgrath | Norma Fisher |
| 101 | 4463667 | 20 | composite-subject-81 | 2 | Account Name | Tasha Rodriguez |
| 102 | 24077793 | 27 | primary-subject-82 | 3 | Saipan International Airport | Theodore Mcgrath |
| 103 | 1204-0009-L | 34 | adaptive-subject-83 | 4 | Norma Fisher | Peter Mcdowell |

The view `vw_course_teacher` joins `courses` with `teachers` to present each course alongside its assigned teacher. This view answers the question: "Which teacher is responsible for each course?" The first row shows course `10238263` (id `100`) assigned to teacher `Theodore Mcgrath` (id `1`), who works in the `adaptive-departme-89` department and has a `false` signature status. The second row shows course `4463667` (id `101`) assigned to `Account Name` (id `2`), who works in `distributed-departme-90` and has a `true` signature status. This view supports staffing audits and departmental workload analysis.

**View `vw_assessment_event_assessment_standard`**

```sql
CREATE VIEW vw_assessment_event_assessment_standard AS
SELECT a.id, a.event_date, a.method, a.status, b.id AS standard_id, b.standard_number AS standard_standard_number, b.version AS standard_version
FROM assessment_events a JOIN assessment_standards b ON a.assessment_standard_id = b.id;
```

| id | event_date | method | status | standard_id | standard_standard_number | standard_version |
|---|---|---|---|---|---|---|
| 1 | 2025-04-15 | Assignment | scheduled | 1 | STA-2752 | 21 |
| 2 | 2022-09-26 | Exam | completed | 2 | STA-2757 | 31 |
| 3 | 2023-02-10 | Assignment | pending | 3 | STA-2762 | 41 |
| 4 | 2024-07-21 | Exam | scheduled | 4 | STA-2767 | 51 |

The view `vw_assessment_event_assessment_standard` joins `assessment_events` with `assessment_standards` to present each assessment event alongside its parent standard. This view answers the question: "What standard is each assessment event delivering?" The first row shows event `1`, scheduled for `2025-04-15` with method `Assignment` and status `scheduled`, delivering standard `STA-2752` (id `1`), which has `28` credits and an `L1 Lit` requirement. The second row shows event `2`, which occurred on `2022-09-26` with method `Exam` and status `completed`, delivering standard `STA-2757` (id `2`), which has `33` credits and an `L1 Num` requirement. This view is useful for compliance reporting, ensuring that the method and status of each event are consistent with the standard it implements.

**View `vw_assessment_event_course`**

```sql
CREATE VIEW vw_assessment_event_course AS
SELECT a.id, a.event_date, a.method, a.status, b.course_id AS course_course_id, b.course_code AS course_course_code, b.year_level AS course_year_level
FROM assessment_events a JOIN courses b ON a.course_id = b.course_id;
```

| id | event_date | method | status | course_course_id | course_course_code | course_year_level |
|---|---|---|---|---|---|---|
| 1 | 2025-04-15 | Assignment | scheduled | 100 | 10238263 | 13 |
| 2 | 2022-09-26 | Exam | completed | 101 | 4463667 | 20 |
| 3 | 2023-02-10 | Assignment | pending | 102 | 24077793 | 27 |
| 4 | 2024-07-21 | Exam | scheduled | 103 | 1204-0009-L | 34 |

The view `vw_assessment_event_course` joins `assessment_events` with `courses` to present each assessment event alongside the course in which it is delivered. This view answers the question: "In which course is each assessment event taking place?" The first row shows event `1` (method `Assignment`, status `scheduled`, date `2025-04-15`) occurring within course `10238263`, a year-level `13` course in `compact-subject-80` with `6` total credits and a `false` endorsable status. The second row shows event `2` (method `Exam`, status `completed`, date `2022-09-26`) occurring within course `4463667`, a year-level `20` course in `composite-subject-81` with `28` total credits and a `true` endorsable status. This view is essential for scheduling and resource allocation, as it ties assessment events directly to their host courses.

**View `vw_teacher_course`**

```sql
CREATE VIEW vw_teacher_course AS
SELECT a.teacher_id, a.full_name, a.employee_id, a.department, b.course_id AS course_course_id, b.course_code AS course_course_code, b.year_level AS course_year_level
FROM teachers a JOIN courses b ON a.course_id = b.course_id;
```

| teacher_id | full_name | employee_id | department | course_course_id | course_course_code | course_year_level |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Norma Fisher | adaptive-departme-89 | 100 | 10238263 | 13 |
| 2 | Account Name | Tasha Rodriguez | distributed-departme-90 | 101 | 4463667 | 20 |
| 3 | Saipan International Airport | Theodore Mcgrath | baseline-departme-91 | 102 | 24077793 | 27 |
| 4 | Norma Fisher | Peter Mcdowell | pilot-departme-92 | 103 | 1204-0009-L | 34 |

The view `vw_teacher_course` joins `teachers` with `courses` to present each teacher alongside the course they deliver. This view answers the question: "What course does each teacher teach?" The first row shows teacher `Theodore Mcgrath` (id `1`, employee `Norma Fisher`) delivering course `10238263`, a year-level `13` course in `compact-subject-80`. The second row shows `Account Name` (id `2`, employee `Tasha Rodriguez`) delivering course `4463667`, a year-level `20` course in `composite-subject-81`. This view supports workload distribution analysis and departmental staffing reports.

**View `vw_qualification_course`**

```sql
CREATE VIEW vw_qualification_course AS
SELECT a.id, a.qualification_name, a.issuing_body, a.credits_required, b.course_id AS course_course_id, b.course_code AS course_course_code, b.year_level AS course_year_level
FROM qualifications a JOIN courses b ON a.course_id = b.course_id;
```

| id | qualification_name | issuing_body | credits_required | course_course_id | course_course_code | course_year_level |
|---|---|---|---|---|---|---|
| 1000 | NCEA Level 2 | baseline-issuing-13 | 35 | 100 | 10238263 | 13 |
| 1001 | University Entrance | pilot-issuing-14 | 39 | 101 | 4463667 | 20 |
| 1002 | Scholarship | extended-issuing-15 | 43 | 102 | 24077793 | 27 |
| 1003 | NCEA Level 2 | integrated-issuing-16 | 47 | 103 | 1204-0009-L | 34 |

The view `vw_qualification_course` joins `qualifications` with `courses` to present each qualification alongside the course it serves. This view answers the question: "What qualifications are available for each course?" The first row shows qualification `NCEA Level 2` (id `1000`), issued by `baseline-issuing-13` with `35` credits required and `true` endorsement eligibility, available for course `10238263`. The second row shows `University Entrance` (id `1001`), issued by `pilot-issuing-14` with `39` credits required and `false` endorsement eligibility, available for course `4463667`. The third row shows `Scholarship` (id `1002`), issued by `extended-issuing-15` with `43` credits required and `true` endorsement eligibility, available for course `24077793`. This view is critical for student guidance, as it maps the credential pathways available within each course.

The relational model described above demonstrates a disciplined approach to normalising the educational administration domain. The base tables capture each entity type in its own structure, with foreign keys encoding the relationships between them. The junction table `courses_standards` resolves the many-to-many relationship between courses and standards, ensuring that the schema remains flexible and extensible. The views then reconstruct the domain facts required for reporting by joining the normalised tables back together. Each view answers a specific question about the domain, presenting the joined result as a flat table that can be consumed by reporting tools, dashboards, or analytical queries. The model balances the principles of data normalisation with the practical needs of the domain, providing a solid foundation for both transactional operations and analytical reporting.