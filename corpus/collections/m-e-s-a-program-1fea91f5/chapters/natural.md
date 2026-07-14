## Educational Program Ecosystems: Tracking Student Pathways from Outreach to Degree

The landscape of postsecondary preparation and degree completion is defined by a network of interconnected programs, services, courses, and institutions. At the center of this ecosystem are MESA (Mathematics, Engineering, Science Achievement) programs—structured initiatives designed to increase the number of students who successfully transition into and through STEM degree pathways. These programs operate within host institutions, serve targeted student populations, and coordinate with support services, academic courses, and four-year universities to create a continuous pipeline from early engagement to degree conferral. Understanding how each component relates to the others requires examining the data that records every enrollment, service interaction, course enrollment, and degree requirement.

**Table `m_e_s_a_programs`**

| id | program_id | program_name | host_institution | location_building | location_room | contact_phone | contact_fax | transfer_rate | total_students_served | underrepresented_percentage |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | regional-host-24 | compact-location-80 | baseline-location-97 | Joe Tsai | Brian Hamilton | 10.95 | 75 | 3.45 |
| 2 | 2986219 | Pilot Initiative A | legacy-host-25 | composite-location-81 | pilot-location-98 | Stephanie Collins | Sean Green | 13.90 | 4373 | 5.90 |
| 3 | 1186079 | Baseline Model | compact-host-26 | primary-location-82 | extended-location-99 | Tasha Rodriguez | Susan Levy | 16.85 | 67 | 8.35 |
| 4 | 1562855 | Distributed Cluster | composite-host-27 | adaptive-location-83 | integrated-location-100 | Walter Pratt | Tyler Cole | 19.80 | 162 | 10.80 |

MESA programs form the foundational layer of the pipeline. Each program is identified by a unique program identifier and a descriptive name such as Extended Review, Pilot Initiative A, Baseline Model, or Distributed Cluster. Programs are anchored to a host institution—regional-host-24, legacy-host-25, compact-host-26, or composite-host-27—and occupy specific physical locations, recorded as building and room designations like compact-location-80 and baseline-location-97. Contact information for program coordination is captured through named administrators and phone/fax lines. Two quantitative measures characterize each program's reach and demographic composition: the total number of students served, which ranges from 67 students under the Baseline Model to 4,373 under Pilot Initiative A, and the percentage of underrepresented students, which spans from 3.45% to 10.80%. The transfer rate metric, ranging from 10.95 to 19.80, indicates the proportion of participants who advance to four-year institutions.

**Table `student_enrollments`**

| student_enrollment_id | enrollment_id | student_id | major | ethnicity | transfer_status | target_university | enrollment_date | graduation_date | m_e_s_a_program_id | four_year_university_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 4447035 | 392507 | primary-major-94 | primary-ethnicit-28 | pending | distributed-target-48 | 2022-05-11T16:00:00 | 2024-03-15 | 1 | 100 |
| 101 | gd_taxc_2121 | 25388256 | adaptive-major-95 | adaptive-ethnicit-29 | transferred | baseline-target-49 | 2023-10-22T23:17:00 | 2025-08-26 | 2 | 101 |
| 102 | id_30 | id_16 | distributed-major-96 | distributed-ethnicit-30 | incomplete | pilot-target-50 | 2024-03-06T06:34:00 | 2022-01-10 | 3 | 102 |
| 103 | b_VB-EC-0 | gd_taxc_2211 | baseline-major-97 | baseline-ethnicit-31 | pending | extended-target-51 | 2025-08-17T13:51:00 | 2023-06-21 | 4 | 103 |

Student enrollments record individual participation in the pipeline. Each enrollment links a student—identified by a numeric or alphanumeric student ID—to a specific MESA program through a foreign key reference. The enrollment captures the student's declared major, such as primary-major-94 or adaptive-major-95, and their ethnicity category, including primary-ethnicit-28 and adaptive-ethnicit-29. Transfer status indicates the student's current standing: pending, transferred, or incomplete. The enrollment also records the target four-year university, with designations like distributed-target-48 and baseline-target-49, along with the enrollment and graduation dates. For example, enrollment 100 (student 392507, major primary-major-94) is associated with MESA program 1 and targets university 100, with an enrollment date of May 11, 2022, and a projected graduation of March 15, 2024. Enrollment 101 (student 25388256, major adaptive-major-95) is linked to program 2 and university 101, with a transferred status and a graduation date of August 26, 2025.

**Table `support_services`**

| support_service_id | service_id | service_name | service_type | description | frequency | is_mandatory | m_e_s_a_program_id |
|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | workshop | Extended Survey | regional-frequenc-36 | true | 1 |
| 2 | 3990164 | Adaptive Model D | center | Pilot Corridor A | legacy-frequenc-37 | false | 2 |
| 3 | 5844258 | Primary Cluster | opportunity | Baseline Series | compact-frequenc-38 | true | 3 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | activity | Distributed Assessment | composite-frequenc-39 | false | 4 |

Support services represent the auxiliary interventions that MESA programs offer to students. Each service has a unique identifier, a descriptive name such as Distributed Initiative, Adaptive Model D, Primary Cluster, or Composite Review, and a service type—workshop, center, opportunity, or activity. The description field provides additional context, including Extended Survey, Pilot Corridor A, Baseline Series, and Distributed Assessment. Services are delivered at a defined frequency, recorded as regional-frequenc-36, legacy-frequenc-37, compact-frequenc-38, or composite-frequenc-39. A mandatory flag indicates whether participation is required; Distributed Initiative and Primary Cluster are mandatory, while Adaptive Model D and Composite Review are optional. Each service is associated with a MESA program through the program foreign key, establishing which program delivers which service.

**Table `courses`**

| course_id | course_code | course_title | department | is_math_based | prerequisite | credits |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | adaptive-departme-89 | false | seasonal-prerequi-71 | 28 |
| 2 | 4463667 | Distributed Assessment | distributed-departme-90 | true | regional-prerequi-72 | 33 |
| 3 | 24077793 | Adaptive Survey | baseline-departme-91 | false | legacy-prerequi-73 | 38 |
| 4 | 1204-0009-L | Primary Corridor A | pilot-departme-92 | true | compact-prerequi-74 | 43 |

Courses constitute the academic component of the pipeline. Each course is identified by a course code—10238263, 4463667, 24077793, or 1204-0009-L—and a title such as Baseline Series D, Distributed Assessment, Adaptive Survey, or Primary Corridor A. Courses belong to departments identified as adaptive-departme-89, distributed-departme-90, baseline-departme-91, or pilot-departme-92. A boolean flag indicates whether a course is math-based; Distributed Assessment and Primary Corridor A are marked as math-based, while Baseline Series D and Adaptive Survey are not. Prerequisites are recorded as seasonal-prerequi-71, regional-prerequi-72, legacy-prerequi-73, or compact-prerequi-74, and each course carries a credit value ranging from 28 to 43 credits.

**Table `math_based_degrees`**

| id | degree_name | requires_consecutive_math | requires_physics_or_chem_or_bio | target_institution |
|---|---|---|---|---|
| 1 | Extended Review | true | false | integrated-target-82 |
| 2 | Pilot Initiative A | false | true | seasonal-target-83 |
| 3 | Baseline Model | true | false | regional-target-84 |
| 4 | Distributed Cluster | false | true | legacy-target-85 |

Math-based degrees define the academic outcomes that the pipeline targets. Each degree has a name—Extended Review, Pilot Initiative A, Baseline Model, or Distributed Cluster—and specifies two structural requirements: whether it requires consecutive math coursework (Extended Review and Baseline Model require it; Pilot Initiative A and Distributed Cluster do not) and whether it requires physics, chemistry, or biology (Pilot Initiative A and Distributed Cluster require it; Extended Review and Baseline Model do not). The target institution for each degree is recorded as integrated-target-82, seasonal-target-83, regional-target-84, or legacy-target-85.

**Table `four_year_universities`**

| four_year_university_id | university_name | accepts_transfer | location |
|---|---|---|---|
| 100 | Compact Initiative | true | extended-location-99 |
| 101 | Legacy Model | false | integrated-location-100 |
| 102 | Regional Cluster A | true | seasonal-location-101 |
| 103 | Seasonal Review | false | regional-location-102 |

Four-year universities are the terminal institutions in the pipeline. Each university has a unique identifier and a name—Compact Initiative, Legacy Model, Regional Cluster A, or Seasonal Review. An accepts_transfer flag indicates whether the university admits transfer students; Compact Initiative and Regional Cluster A accept transfers, while Legacy Model and Seasonal Review do not. The location field records the university's physical site, including extended-location-99, integrated-location-100, seasonal-location-101, and regional-location-102.

The relational structure between these core entities is mediated by junction tables that capture many-to-many associations. Programs enroll students through the programs_enrollments table, which links program identifiers to enrollment identifiers. Programs deliver services through programs_services, connecting program IDs to service IDs. Programs offer degrees through programs_degrees, establishing which degrees each program prepares students for. Enrollments are associated with courses through enrollments_courses and courses_enrollments, which together record which students take which courses. Services connect to enrollments via services_enrollments, tracking which students receive which services. Courses map to degrees through courses_degrees, indicating which courses fulfill degree requirements. Degrees link to courses via degrees_courses, providing the reverse mapping. Finally, universities connect to enrollments through universities_enrollments, recording which students target which institutions.

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

The programs_enrollments table establishes the primary association between MESA programs and student enrollments. Each row links a program identifier to an enrollment identifier, confirming that a particular student's participation is attributable to a specific program. This table is the backbone of program-level analytics, enabling aggregation of enrollment counts, transfer outcomes, and demographic distributions by program.

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

Programs_services records which support services are offered by which MESA programs. A row in this table indicates that a given program has the capacity to deliver a specific service, whether mandatory or optional. This association is essential for understanding the service portfolio of each program and for tracking service utilization rates.

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

Programs_degrees connects MESA programs to the math-based degrees they prepare students to pursue. Each row indicates that a program's curriculum and advising are aligned with a particular degree's requirements. This linkage supports analysis of how well program offerings match degree prerequisites and target institutional expectations.

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

Enrollments_courses maps student enrollments to the courses they take. Each row records that a specific enrollment is associated with a specific course, enabling the tracking of course participation patterns across programs and majors.

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

Services_enrollments links support services to student enrollments, recording which students receive which services. This table enables the analysis of service utilization by program, major, ethnicity, and transfer status, providing insight into which interventions reach which populations.

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

Courses_degrees associates courses with math-based degrees, indicating which courses fulfill requirements for which degrees. This mapping is critical for curriculum planning and for ensuring that students complete the right sequence of courses to meet degree criteria.

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

Courses_enrollments provides the reverse mapping of enrollments_courses, linking courses to the enrollments of students who take them. Together with enrollments_courses, this table supports bidirectional queries about course participation and enrollment composition.

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

Degrees_courses connects math-based degrees to the courses that satisfy their requirements. This table enables the construction of degree completion pathways and the identification of prerequisite chains that students must follow.

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

Degrees_enrollments links math-based degrees to student enrollments, recording which students are pursuing which degrees. This association supports outcome tracking and the analysis of degree completion rates by program and demographic group.

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

Universities_enrollments connects four-year universities to student enrollments, recording which students target which institutions for transfer. This table is essential for evaluating transfer patterns and for assessing whether universities' admission policies align with the student populations served by MESA programs.

The analytical power of the system emerges through its views, which join these tables to answer specific operational questions.

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

This view joins MESA programs with their associated student enrollments, producing a detailed record that includes the program name, host institution, location, contact information, transfer rate, total students served, underrepresented percentage, and all enrollment-level fields including student ID, major, ethnicity, transfer status, target university, and dates. It answers the question: what is the full profile of each student enrolled in each MESA program? A row from this view might show that student 392507, major primary-major-94, ethnicity primary-ethnicit-28, with pending transfer status, is enrolled in the Extended Review program at regional-host-24, located at compact-location-80, baseline-location-97, with contact Joe Tsai, and targets university 100.

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

This view joins MESA programs with the support services they offer, producing a record that includes all program fields alongside service details: service name, type, description, frequency, mandatory flag, and the program foreign key. It answers: which services does each program provide, and what are their characteristics? A representative row would show that the Extended Review program (program 1) offers the Distributed Initiative service, which is a workshop type, described as Extended Survey, delivered at regional-frequenc-36 frequency, and marked as mandatory.

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

This view joins MESA programs with the math-based degrees they prepare students for, combining program fields with degree attributes including degree name, consecutive math requirement, physics/chemistry/biology requirement, and target institution. It answers: which degrees does each program align with, and what are those degrees' structural requirements? A row might indicate that the Extended Review program aligns with the Extended Review degree, which requires consecutive math but not physics/chemistry/biology, targeting integrated-target-82.

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

This view joins student enrollments with their associated MESA programs, producing a record that includes all enrollment fields alongside program identifiers, names, host institutions, locations, contacts, transfer rates, and demographic statistics. It answers: for each student enrollment, what is the program context? A row would show enrollment 100 (student 392507, major primary-major-94, ethnicity primary-ethnicit-28, pending status, target distributed-target-48, enrolled 2022-05-11, graduating 2024-03-15) within the Extended Review program at regional-host-24, serving 75 students with a 10.95 transfer rate and 3.45% underrepresented population.

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

This view joins student enrollments with the courses their associated students take, combining enrollment fields with course details including course code, title, department, math-based flag, prerequisite, and credits. It answers: what courses is each enrolled student taking? A representative row might link enrollment 100 to course 4463667 (Distributed Assessment, distributed-departme-90, math-based, 33 credits).

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

This view joins student enrollments with their target four-year universities, producing a record that includes all enrollment fields alongside university name, transfer acceptance policy, and location. It answers: which university is each student targeting, and does that university accept transfers? A row would show enrollment 100 targeting Compact Initiative (university 100), which accepts transfers and is located at extended-location-99.

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

This view joins support services with their associated MESA programs, combining service fields with program identifiers, names, host institutions, locations, contacts, and program-level metrics. It answers: which program delivers each service, and what is that program's profile? A row might show the Distributed Initiative service (service 1, workshop type, Extended Survey description, regional-frequenc-36, mandatory) delivered by the Extended Review program at regional-host-24.

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

This view joins support services with student enrollments, producing a record that includes service details alongside enrollment fields and program context. It answers: which students receive which services, and what are their program and enrollment characteristics? A representative row would link the Distributed Initiative service to enrollment 100 (student 392507, major primary-major-94, pending status), showing the service is mandatory and delivered by program 1.

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

This view joins courses with the math-based degrees they serve, combining course fields with degree attributes including degree name, consecutive math requirement, science requirement, and target institution. It answers: which degrees does each course support, and what are those degrees' requirements? A row might show course 4463667 (Distributed Assessment, math-based, 33 credits) supporting the Extended Review degree, which requires consecutive math.

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

This view joins courses with student enrollments, producing a record that includes course details alongside enrollment fields and program context. It answers: which students are enrolled in each course, and what are their program affiliations? A representative row would link course 4463667 to enrollment 100 (student 392507, major primary-major-94, ethnicity primary-ethnicit-28, pending status, target distributed-target-48).

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

This view joins math-based degrees with the courses that fulfill their requirements, combining degree fields with course details including course code, title, department, math-based flag, prerequisite, and credits. It answers: which courses satisfy each degree's requirements? A row might show the Extended Review degree requiring course 4463667 (Distributed Assessment, distributed-departme-90, 33 credits).

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

This view joins math-based degrees with student enrollments, producing a record that includes degree attributes alongside enrollment fields and program context. It answers: which students are pursuing which degrees, and what are their enrollment characteristics? A representative row would link the Extended Review degree to enrollment 100 (student 392507, major primary-major-94, pending status, target distributed-target-48, enrolled 2022-05-11).

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

This view joins four-year universities with student enrollments, combining university fields with enrollment details and program context. It answers: which students target each university, and what are their program and demographic profiles? A row would show Compact Initiative (university 100, accepts transfers, located at extended-location-99) targeting enrollment 100 (student 392507, major primary-major-94, ethnicity primary-ethnicit-28, pending status, enrolled 2022-05-11, graduating 2024-03-15, within program 1).

The data architecture described here supports a comprehensive view of the educational pipeline from initial program engagement through degree completion. By recording every student enrollment, service interaction, course participation, and degree requirement, and by linking these records through well-defined foreign-key relationships, the system enables granular analysis of program effectiveness, service utilization, course sequencing, and transfer outcomes. Practitioners can query the base tables for raw records, use the junction tables to explore associations, and leverage the views to answer specific operational questions about the pipeline's performance. The fictional organizations, people, and institutions in the data serve as placeholders for real-world entities, but the structural relationships and analytical patterns they illustrate are directly applicable to the design and evaluation of actual STEM pipeline programs.