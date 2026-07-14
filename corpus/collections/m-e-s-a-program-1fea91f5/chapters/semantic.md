## Chapter 7 — From Ontology to Relational Schema: The MESA Program Domain

The MESA (Mathematics, Engineering, Science Achievement) program domain captures the ecosystem of academic support initiatives, student pathways, and institutional partnerships that connect underrepresented students to STEM careers. At the conceptual level, the domain revolves around six core entity types: MESA programs, student enrollments, support services, courses, math-based degrees, and four-year universities. Each entity carries its own set of attributes, and the relationships between them — many-to-many in the real world — are materialized as junction tables in the relational schema. This chapter walks through the ontology, the normalization decisions, and the view layer that reconstructs domain facts from the normalized tables.

### The MESA Programs Entity

The anchor of the domain is the MESA program itself, stored in `m_e_s_a_programs`. Each row represents a distinct program instance with a surrogate primary key `id`, a business identifier `program_id`, and a human-readable `program_name`. Additional attributes capture the host institution (`host_institution`), physical location (`location_building`, `location_room`), and contact details (`contact_phone`, `contact_fax`). The table also stores aggregate statistics: `transfer_rate` (a decimal such as 10.95 or 19.80), `total_students_served` (an integer like 75 or 4373), and `underrepresented_percentage` (a decimal ranging from 3.45 to 10.80).

**Table `m_e_s_a_programs`**

| id | program_id | program_name | host_institution | location_building | location_room | contact_phone | contact_fax | transfer_rate | total_students_served | underrepresented_percentage |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | regional-host-24 | compact-location-80 | baseline-location-97 | Joe Tsai | Brian Hamilton | 10.95 | 75 | 3.45 |
| 2 | 2986219 | Pilot Initiative A | legacy-host-25 | composite-location-81 | pilot-location-98 | Stephanie Collins | Sean Green | 13.90 | 4373 | 5.90 |
| 3 | 1186079 | Baseline Model | compact-host-26 | primary-location-82 | extended-location-99 | Tasha Rodriguez | Susan Levy | 16.85 | 67 | 8.35 |
| 4 | 1562855 | Distributed Cluster | composite-host-27 | adaptive-location-83 | integrated-location-100 | Walter Pratt | Tyler Cole | 19.80 | 162 | 10.80 |

Consider the first row: program `103176` named "Extended Review" is hosted at `regional-host-24` in building `compact-location-80`, room `baseline-location-97`. Its contact is Joe Tsai (phone) and Brian Hamilton (fax), with a transfer rate of 10.95, 75 students served, and 3.45% underrepresented enrollment. The fourth row, program `1562855` ("Distributed Cluster"), serves 162 students with a transfer rate of 19.80 and 10.80% underrepresented representation. These programs are the parent entities to which enrollments, services, and degrees are linked.

### Student Enrollments and the University Link

Student enrollment records live in `student_enrollments`. Each row is identified by `student_enrollment_id` and carries a secondary `enrollment_id` (which can be numeric, such as `4447035`, or string-based, such as `gd_taxc_2121`). The `student_id` column (e.g., `392507` or `25388256`) identifies the individual student. Demographic and academic attributes include `major` (e.g., `primary-major-94`), `ethnicity` (e.g., `primary-ethnicit-28`), and `transfer_status` (one of `pending`, `transferred`, or `incomplete`). Temporal data is captured in `enrollment_date` and `graduation_date` as ISO-8601 timestamps.

**Table `student_enrollments`**

| student_enrollment_id | enrollment_id | student_id | major | ethnicity | transfer_status | target_university | enrollment_date | graduation_date | m_e_s_a_program_id | four_year_university_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 4447035 | 392507 | primary-major-94 | primary-ethnicit-28 | pending | distributed-target-48 | 2022-05-11T16:00:00 | 2024-03-15 | 1 | 100 |
| 101 | gd_taxc_2121 | 25388256 | adaptive-major-95 | adaptive-ethnicit-29 | transferred | baseline-target-49 | 2023-10-22T23:17:00 | 2025-08-26 | 2 | 101 |
| 102 | id_30 | id_16 | distributed-major-96 | distributed-ethnicit-30 | incomplete | pilot-target-50 | 2024-03-06T06:34:00 | 2022-01-10 | 3 | 102 |
| 103 | b_VB-EC-0 | gd_taxc_2211 | baseline-major-97 | baseline-ethnicit-31 | pending | extended-target-51 | 2025-08-17T13:51:00 | 2023-06-21 | 4 | 103 |

The enrollment table also holds two foreign keys: `m_e_s_a_program_id` links the enrollment to its parent MESA program, and `four_year_university_id` links it to the target four-year university. Row 100, for example, belongs to MESA program `1` and targets university `100`. Row 101 (`enrollment_id` = `gd_taxc_2121`) is associated with program `2` and university `101`, with a transfer status of `transferred`.

The target universities are cataloged in `four_year_universities`, a simple lookup table with `four_year_university_id` as primary key, `university_name`, a boolean `accepts_transfer`, and a `location` column. University `100` ("Compact Initiative") accepts transfers and is located at `extended-location-99`; university `101` ("Legacy Model") does not accept transfers and is at `integrated-location-100`.

### Support Services, Courses, and Degrees

Support services are stored in `support_services`. Each service has a `support_service_id`, a `service_id`, a `service_name`, a `service_type` (e.g., `workshop`, `center`, `opportunity`, `activity`), a `description`, a `frequency` (e.g., `regional-frequenc-36`), a boolean `is_mandatory`, and a foreign key `m_e_s_a_program_id` linking it to the offering program.

**Table `support_services`**

| support_service_id | service_id | service_name | service_type | description | frequency | is_mandatory | m_e_s_a_program_id |
|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | workshop | Extended Survey | regional-frequenc-36 | true | 1 |
| 2 | 3990164 | Adaptive Model D | center | Pilot Corridor A | legacy-frequenc-37 | false | 2 |
| 3 | 5844258 | Primary Cluster | opportunity | Baseline Series | compact-frequenc-38 | true | 3 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | activity | Distributed Assessment | composite-frequenc-39 | false | 4 |

The first service, `1996925` ("Distributed Initiative"), is a `workshop` type, mandatory, associated with MESA program `1`. The fourth service, `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` ("Composite Review"), is an `activity` type, non-mandatory, linked to program `4`.

Courses are cataloged in `courses`. Each course has a `course_id`, a `course_code` (e.g., `10238263` or `1204-0009-L`), a `course_title`, a `department` (e.g., `adaptive-departme-89`), a boolean `is_math_based`, a `prerequisite` (e.g., `seasonal-prerequi-71`), and `credits` (ranging from 28 to 43).

**Table `courses`**

| course_id | course_code | course_title | department | is_math_based | prerequisite | credits |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | false | seasonal-prerequi-71 | 28 |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | true | regional-prerequi-72 | 33 |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | false | legacy-prerequi-73 | 38 |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | true | compact-prerequi-74 | 43 |

Course `4463667` ("Distributed Assessment") is marked as math-based and carries 33 credits. Course `1204-0009-L` ("Primary Corridor A") is also math-based with 43 credits.

Math-based degrees are stored in `math_based_degrees`, with `id` as primary key, `degree_name`, boolean flags `requires_consecutive_math` and `requires_physics_or_chem_or_bio`, and a `target_institution`.

**Table `math_based_degrees`**

| id | degree_name | requires_consecutive_math | requires_physics_or_chem_or_bio | target_institution |
|---|---|---|---|---|
| 1 | Extended Review | true | false | integrated-target-82 |
| 2 | Pilot Initiative A | false | true | seasonal-target-83 |
| 3 | Baseline Model | true | false | regional-target-84 |
| 4 | Distributed Cluster | false | true | legacy-target-85 |

Degree `1` ("Extended Review") requires consecutive math but not a physical science, targeting `integrated-target-82`. Degree `2` ("Pilot Initiative A") does not require consecutive math but does require a physical science, targeting `seasonal-target-83`.

### Junction Tables: Materializing Many-to-Many Relationships

The domain's many-to-many relationships are resolved through dedicated junction tables. Each junction table contains two foreign key columns that reference the primary keys of the participating entities, forming a composite key that enforces referential integrity.

The `programs_enrollments` table links MESA programs to student enrollments. The `programs_services` table links programs to support services. The `programs_degrees` table links programs to math-based degrees.

**Table `programs_enrollments`**

| m_e_s_a_program_id | student_enrollment_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `programs_services`**

| m_e_s_a_program_id | support_service_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `programs_degrees`**

| m_e_s_a_program_id | math_based_degree_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Enrollment-centric junctions include `enrollments_courses` (linking enrollments to courses), `services_enrollments` (linking services to enrollments), and `universities_enrollments` (linking four-year universities to enrollments).

**Table `enrollments_courses`**

| student_enrollment_id | course_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `services_enrollments`**

| support_service_id | student_enrollment_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `universities_enrollments`**

| four_year_university_id | student_enrollment_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

Degree-centric junctions include `courses_degrees` (linking courses to degrees), `degrees_courses` (linking degrees to courses), and `degrees_enrollments` (linking degrees to enrollments).

**Table `courses_degrees`**

| course_id | math_based_degree_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `degrees_courses`**

| math_based_degree_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `degrees_enrollments`**

| math_based_degree_id | student_enrollment_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

These junction tables are the structural glue of the schema. They allow any entity to participate in multiple relationships without denormalization. For instance, a single MESA program can be associated with many enrollments, many services, and many degrees — each relationship captured as a separate row in its respective junction table.

### View Layer: Reconstructing Domain Facts

The view layer sits atop the normalized base tables and junction tables, performing the joins that reconstruct the domain facts analysts and stakeholders need to query. Each view answers a specific analytical question by joining the relevant entities and presenting a denormalized, flat result set.

#### Program-Centric Detail Views

The view `vw_m_e_s_a_program_student_enrollment_detail` joins `m_e_s_a_programs` to `student_enrollments` (via the `programs_enrollments` junction) to answer: "Which students are enrolled in which MESA programs, and what are their demographic and temporal details?" The result presents program attributes alongside enrollment attributes in a single row per enrollment.

**View `vw_m_e_s_a_program_student_enrollment_detail`**

```sql
CREATE VIEW vw_m_e_s_a_program_student_enrollment_detail AS
SELECT a.id, a.program_id, a.program_name, b.student_enrollment_id AS enrollment_student_enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.student_id AS enrollment_student_id
FROM m_e_s_a_programs a
  JOIN programs_enrollments j ON j.m_e_s_a_program_id = a.id
  JOIN student_enrollments b ON b.student_enrollment_id = j.student_enrollment_id;
```

| id | program_id | program_name | enrollment_student_enrollment_id | enrollment_enrollment_id | enrollment_student_id |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 100 | 4447035 | 392507 |
| 1 | 103176 | Extended Review | 101 | gd_taxc_2121 | 25388256 |
| 2 | 2986219 | Pilot Initiative A | 101 | gd_taxc_2121 | 25388256 |
| 2 | 2986219 | Pilot Initiative A | 102 | id_30 | id_16 |
| 3 | 1186079 | Baseline Model | 102 | id_30 | id_16 |
| 3 | 1186079 | Baseline Model | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | 1562855 | Distributed Cluster | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | 1562855 | Distributed Cluster | 100 | 4447035 | 392507 |

Similarly, `vw_m_e_s_a_program_support_service_detail` joins `m_e_s_a_programs` to `support_services` (via `programs_services`) to answer: "What support services does each MESA program offer?" The view presents program and service attributes side by side.

**View `vw_m_e_s_a_program_support_service_detail`**

```sql
CREATE VIEW vw_m_e_s_a_program_support_service_detail AS
SELECT a.id, a.program_id, a.program_name, b.support_service_id AS service_support_service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM m_e_s_a_programs a
  JOIN programs_services j ON j.m_e_s_a_program_id = a.id
  JOIN support_services b ON b.support_service_id = j.support_service_id;
```

| id | program_id | program_name | service_support_service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 1 | 1996925 | Distributed Initiative |
| 1 | 103176 | Extended Review | 2 | 3990164 | Adaptive Model D |
| 2 | 2986219 | Pilot Initiative A | 2 | 3990164 | Adaptive Model D |
| 2 | 2986219 | Pilot Initiative A | 3 | 5844258 | Primary Cluster |
| 3 | 1186079 | Baseline Model | 3 | 5844258 | Primary Cluster |
| 3 | 1186079 | Baseline Model | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 4 | 1562855 | Distributed Cluster | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |
| 4 | 1562855 | Distributed Cluster | 1 | 1996925 | Distributed Initiative |

The view `vw_m_e_s_a_program_math_based_degree_detail` joins `m_e_s_a_programs` to `math_based_degrees` (via `programs_degrees`) to answer: "Which math-based degrees are associated with each MESA program, and what are their requirements?"

**View `vw_m_e_s_a_program_math_based_degree_detail`**

```sql
CREATE VIEW vw_m_e_s_a_program_math_based_degree_detail AS
SELECT a.id, a.program_id, a.program_name, b.id AS degree_id, b.degree_name AS degree_degree_name, b.requires_consecutive_math AS degree_requires_consecutive_math
FROM m_e_s_a_programs a
  JOIN programs_degrees j ON j.m_e_s_a_program_id = a.id
  JOIN math_based_degrees b ON b.id = j.math_based_degree_id;
```

| id | program_id | program_name | degree_id | degree_degree_name | degree_requires_consecutive_math |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 1 | Extended Review | true |
| 1 | 103176 | Extended Review | 2 | Pilot Initiative A | false |
| 2 | 2986219 | Pilot Initiative A | 2 | Pilot Initiative A | false |
| 2 | 2986219 | Pilot Initiative A | 3 | Baseline Model | true |
| 3 | 1186079 | Baseline Model | 3 | Baseline Model | true |
| 3 | 1186079 | Baseline Model | 4 | Distributed Cluster | false |
| 4 | 1562855 | Distributed Cluster | 4 | Distributed Cluster | false |
| 4 | 1562855 | Distributed Cluster | 1 | Extended Review | true |

#### Enrollment-Centric Detail Views

The view `vw_student_enrollment_m_e_s_a_program` joins `student_enrollments` to `m_e_s_a_programs` to answer: "Which MESA program is each student enrollment associated with?" This is the inverse of the program-centric view, presenting enrollment details alongside the parent program name.

**View `vw_student_enrollment_m_e_s_a_program`**

```sql
CREATE VIEW vw_student_enrollment_m_e_s_a_program AS
SELECT a.student_enrollment_id, a.enrollment_id, a.student_id, a.major, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM student_enrollments a JOIN m_e_s_a_programs b ON a.m_e_s_a_program_id = b.id;
```

| student_enrollment_id | enrollment_id | student_id | major | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 4447035 | 392507 | primary-major-94 | 1 | 103176 | Extended Review |
| 101 | gd_taxc_2121 | 25388256 | adaptive-major-95 | 2 | 2986219 | Pilot Initiative A |
| 102 | id_30 | id_16 | distributed-major-96 | 3 | 1186079 | Baseline Model |
| 103 | b_VB-EC-0 | gd_taxc_2211 | baseline-major-97 | 4 | 1562855 | Distributed Cluster |

The view `vw_student_enrollment_course_detail` joins `student_enrollments` to `courses` (via `enrollments_courses` or `courses_enrollments`) to answer: "Which courses is each student enrollment associated with?" It presents enrollment attributes alongside course attributes including `course_code`, `is_math_based`, and `credits`.

**View `vw_student_enrollment_course_detail`**

```sql
CREATE VIEW vw_student_enrollment_course_detail AS
SELECT a.student_enrollment_id, a.enrollment_id, a.student_id, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM student_enrollments a
  JOIN enrollments_courses j ON j.student_enrollment_id = a.student_enrollment_id
  JOIN courses b ON b.course_id = j.course_id;
```

| student_enrollment_id | enrollment_id | student_id | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|
| 100 | 4447035 | 392507 | 1 | 10238263 | Baseline Series D |
| 100 | 4447035 | 392507 | 2 | 4463667 | Distributed Assessment |
| 101 | gd_taxc_2121 | 25388256 | 2 | 4463667 | Distributed Assessment |
| 101 | gd_taxc_2121 | 25388256 | 3 | 24077793 | Adaptive Survey |
| 102 | id_30 | id_16 | 3 | 24077793 | Adaptive Survey |
| 102 | id_30 | id_16 | 4 | 1204-0009-L | Primary Corridor A |
| 103 | b_VB-EC-0 | gd_taxc_2211 | 4 | 1204-0009-L | Primary Corridor A |
| 103 | b_VB-EC-0 | gd_taxc_2211 | 1 | 10238263 | Baseline Series D |

The view `vw_student_enrollment_four_year_university` joins `student_enrollments` to `four_year_universities` to answer: "Which four-year university is each student enrollment targeting?" It presents the university name, transfer acceptance status, and location alongside enrollment details.

**View `vw_student_enrollment_four_year_university`**

```sql
CREATE VIEW vw_student_enrollment_four_year_university AS
SELECT a.student_enrollment_id, a.enrollment_id, a.student_id, a.major, b.four_year_university_id AS university_four_year_university_id, b.university_name AS university_university_name, b.accepts_transfer AS university_accepts_transfer
FROM student_enrollments a JOIN four_year_universities b ON a.four_year_university_id = b.four_year_university_id;
```

| student_enrollment_id | enrollment_id | student_id | major | university_four_year_university_id | university_university_name | university_accepts_transfer |
|---|---|---|---|---|---|---|
| 100 | 4447035 | 392507 | primary-major-94 | 100 | Compact Initiative | true |
| 101 | gd_taxc_2121 | 25388256 | adaptive-major-95 | 101 | Legacy Model | false |
| 102 | id_30 | id_16 | distributed-major-96 | 102 | Regional Cluster A | true |
| 103 | b_VB-EC-0 | gd_taxc_2211 | baseline-major-97 | 103 | Seasonal Review | false |

#### Service-Centric Detail Views

The view `vw_support_service_m_e_s_a_program` joins `support_services` to `m_e_s_a_programs` to answer: "Which MESA program offers each support service?" This is the inverse of the program-centric service view, presenting service details alongside the parent program name.

**View `vw_support_service_m_e_s_a_program`**

```sql
CREATE VIEW vw_support_service_m_e_s_a_program AS
SELECT a.support_service_id, a.service_id, a.service_name, a.service_type, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM support_services a JOIN m_e_s_a_programs b ON a.m_e_s_a_program_id = b.id;
```

| support_service_id | service_id | service_name | service_type | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | workshop | 1 | 103176 | Extended Review |
| 2 | 3990164 | Adaptive Model D | center | 2 | 2986219 | Pilot Initiative A |
| 3 | 5844258 | Primary Cluster | opportunity | 3 | 1186079 | Baseline Model |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | activity | 4 | 1562855 | Distributed Cluster |

The view `vw_support_service_student_enrollment_detail` joins `support_services` to `student_enrollments` (via `services_enrollments`) to answer: "Which student enrollments are associated with each support service?" It presents service attributes alongside enrollment attributes.

**View `vw_support_service_student_enrollment_detail`**

```sql
CREATE VIEW vw_support_service_student_enrollment_detail AS
SELECT a.support_service_id, a.service_id, a.service_name, b.student_enrollment_id AS enrollment_student_enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.student_id AS enrollment_student_id
FROM support_services a
  JOIN services_enrollments j ON j.support_service_id = a.support_service_id
  JOIN student_enrollments b ON b.student_enrollment_id = j.student_enrollment_id;
```

| support_service_id | service_id | service_name | enrollment_student_enrollment_id | enrollment_enrollment_id | enrollment_student_id |
|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | 100 | 4447035 | 392507 |
| 1 | 1996925 | Distributed Initiative | 101 | gd_taxc_2121 | 25388256 |
| 2 | 3990164 | Adaptive Model D | 101 | gd_taxc_2121 | 25388256 |
| 2 | 3990164 | Adaptive Model D | 102 | id_30 | id_16 |
| 3 | 5844258 | Primary Cluster | 102 | id_30 | id_16 |
| 3 | 5844258 | Primary Cluster | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 100 | 4447035 | 392507 |

#### Course-Centric Detail Views

The view `vw_course_math_based_degree_detail` joins `courses` to `math_based_degrees` (via `courses_degrees` or `degrees_courses`) to answer: "Which math-based degrees include each course?" It presents course attributes alongside degree requirements.

**View `vw_course_math_based_degree_detail`**

```sql
CREATE VIEW vw_course_math_based_degree_detail AS
SELECT a.course_id, a.course_code, a.course_title, b.id AS degree_id, b.degree_name AS degree_degree_name, b.requires_consecutive_math AS degree_requires_consecutive_math
FROM courses a
  JOIN courses_degrees j ON j.course_id = a.course_id
  JOIN math_based_degrees b ON b.id = j.math_based_degree_id;
```

| course_id | course_code | course_title | degree_id | degree_degree_name | degree_requires_consecutive_math |
|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 1 | Extended Review | true |
| 1 | 10238263 | Baseline Series D | 2 | Pilot Initiative A | false |
| 2 | 4463667 | Distributed Assessment | 2 | Pilot Initiative A | false |
| 2 | 4463667 | Distributed Assessment | 3 | Baseline Model | true |
| 3 | 24077793 | Adaptive Survey | 3 | Baseline Model | true |
| 3 | 24077793 | Adaptive Survey | 4 | Distributed Cluster | false |
| 4 | 1204-0009-L | Primary Corridor A | 4 | Distributed Cluster | false |
| 4 | 1204-0009-L | Primary Corridor A | 1 | Extended Review | true |

The view `vw_course_student_enrollment_detail` joins `courses` to `student_enrollments` (via `courses_enrollments` or `enrollments_courses`) to answer: "Which student enrollments are associated with each course?" It presents course attributes alongside enrollment details.

**View `vw_course_student_enrollment_detail`**

```sql
CREATE VIEW vw_course_student_enrollment_detail AS
SELECT a.course_id, a.course_code, a.course_title, b.student_enrollment_id AS enrollment_student_enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.student_id AS enrollment_student_id
FROM courses a
  JOIN courses_enrollments j ON j.course_id = a.course_id
  JOIN student_enrollments b ON b.student_enrollment_id = j.student_enrollment_id;
```

| course_id | course_code | course_title | enrollment_student_enrollment_id | enrollment_enrollment_id | enrollment_student_id |
|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 100 | 4447035 | 392507 |
| 1 | 10238263 | Baseline Series D | 101 | gd_taxc_2121 | 25388256 |
| 2 | 4463667 | Distributed Assessment | 101 | gd_taxc_2121 | 25388256 |
| 2 | 4463667 | Distributed Assessment | 102 | id_30 | id_16 |
| 3 | 24077793 | Adaptive Survey | 102 | id_30 | id_16 |
| 3 | 24077793 | Adaptive Survey | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | 1204-0009-L | Primary Corridor A | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | 1204-0009-L | Primary Corridor A | 100 | 4447035 | 392507 |

#### Degree-Centric Detail Views

The view `vw_math_based_degree_course_detail` joins `math_based_degrees` to `courses` (via `degrees_courses` or `courses_degrees`) to answer: "Which courses are part of each math-based degree?" It presents degree attributes alongside course attributes.

**View `vw_math_based_degree_course_detail`**

```sql
CREATE VIEW vw_math_based_degree_course_detail AS
SELECT a.id, a.degree_name, a.requires_consecutive_math, b.course_id AS course_course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM math_based_degrees a
  JOIN degrees_courses j ON j.math_based_degree_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | degree_name | requires_consecutive_math | course_course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|
| 1 | Extended Review | true | 1 | 10238263 | Baseline Series D |
| 1 | Extended Review | true | 2 | 4463667 | Distributed Assessment |
| 2 | Pilot Initiative A | false | 2 | 4463667 | Distributed Assessment |
| 2 | Pilot Initiative A | false | 3 | 24077793 | Adaptive Survey |
| 3 | Baseline Model | true | 3 | 24077793 | Adaptive Survey |
| 3 | Baseline Model | true | 4 | 1204-0009-L | Primary Corridor A |
| 4 | Distributed Cluster | false | 4 | 1204-0009-L | Primary Corridor A |
| 4 | Distributed Cluster | false | 1 | 10238263 | Baseline Series D |

The view `vw_math_based_degree_student_enrollment_detail` joins `math_based_degrees` to `student_enrollments` (via `degrees_enrollments`) to answer: "Which student enrollments are associated with each math-based degree?" It presents degree attributes alongside enrollment details.

**View `vw_math_based_degree_student_enrollment_detail`**

```sql
CREATE VIEW vw_math_based_degree_student_enrollment_detail AS
SELECT a.id, a.degree_name, a.requires_consecutive_math, b.student_enrollment_id AS enrollment_student_enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.student_id AS enrollment_student_id
FROM math_based_degrees a
  JOIN degrees_enrollments j ON j.math_based_degree_id = a.id
  JOIN student_enrollments b ON b.student_enrollment_id = j.student_enrollment_id;
```

| id | degree_name | requires_consecutive_math | enrollment_student_enrollment_id | enrollment_enrollment_id | enrollment_student_id |
|---|---|---|---|---|---|
| 1 | Extended Review | true | 100 | 4447035 | 392507 |
| 1 | Extended Review | true | 101 | gd_taxc_2121 | 25388256 |
| 2 | Pilot Initiative A | false | 101 | gd_taxc_2121 | 25388256 |
| 2 | Pilot Initiative A | false | 102 | id_30 | id_16 |
| 3 | Baseline Model | true | 102 | id_30 | id_16 |
| 3 | Baseline Model | true | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | Distributed Cluster | false | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 4 | Distributed Cluster | false | 100 | 4447035 | 392507 |

#### University-Centric Detail Views

The view `vw_four_year_university_student_enrollment_detail` joins `four_year_universities` to `student_enrollments` (via `universities_enrollments`) to answer: "Which student enrollments target each four-year university?" It presents university attributes (name, transfer acceptance, location) alongside enrollment details.

**View `vw_four_year_university_student_enrollment_detail`**

```sql
CREATE VIEW vw_four_year_university_student_enrollment_detail AS
SELECT a.four_year_university_id, a.university_name, a.accepts_transfer, b.student_enrollment_id AS enrollment_student_enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.student_id AS enrollment_student_id
FROM four_year_universities a
  JOIN universities_enrollments j ON j.four_year_university_id = a.four_year_university_id
  JOIN student_enrollments b ON b.student_enrollment_id = j.student_enrollment_id;
```

| four_year_university_id | university_name | accepts_transfer | enrollment_student_enrollment_id | enrollment_enrollment_id | enrollment_student_id |
|---|---|---|---|---|---|
| 100 | Compact Initiative | true | 100 | 4447035 | 392507 |
| 100 | Compact Initiative | true | 101 | gd_taxc_2121 | 25388256 |
| 101 | Legacy Model | false | 101 | gd_taxc_2121 | 25388256 |
| 101 | Legacy Model | false | 102 | id_30 | id_16 |
| 102 | Regional Cluster A | true | 102 | id_30 | id_16 |
| 102 | Regional Cluster A | true | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 103 | Seasonal Review | false | 103 | b_VB-EC-0 | gd_taxc_2211 |
| 103 | Seasonal Review | false | 100 | 4447035 | 392507 |

### Synthesis

The MESA program domain schema follows a clean normalization pattern: six base entity tables capture the core concepts, ten junction tables resolve the many-to-many relationships between them, and thirteen views reconstruct the domain facts needed for analysis. Each view performs a targeted join that answers a specific question — from "which students are in which programs" to "which courses belong to which degrees" — by pulling data from the normalized tables and presenting it in a flat, queryable format. The foreign keys in the junction tables enforce referential integrity, ensuring that every relationship row references valid entities. The result is a schema that is both structurally sound and analytically accessible, allowing stakeholders to query the domain from multiple perspectives without sacrificing data integrity.

## Data appendix

**Table `four_year_universities`**

| four_year_university_id | university_name | accepts_transfer | location |
|---|---|---|---|
| 100 | Compact Initiative | true | extended-location-99 |
| 101 | Legacy Model | false | integrated-location-100 |
| 102 | Regional Cluster A | true | seasonal-location-101 |
| 103 | Seasonal Review | false | regional-location-102 |

**Table `courses_enrollments`**

| course_id | student_enrollment_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
