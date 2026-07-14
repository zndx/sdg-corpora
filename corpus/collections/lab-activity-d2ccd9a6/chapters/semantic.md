## Ontology-Grounded Relational Modelling of the Laboratory Activity Domain

The laboratory activity management domain captures the operational fabric of an academic institution where teaching, research, and student engagement intersect. At its core, the domain revolves around structured learning events—lab activities—each anchored to a faculty member, enriched with physical or digital materials, and delivered through formal courses to enrolled students. Teaching assistants serve as the connective tissue between faculty and learners, providing instructional support while remaining accountable to their supervising professor. The ontology underlying this domain distinguishes six primary entity types: `lab_activities`, `faculty_members`, `students`, `teaching_assistants`, `courses`, and `lab_materials`. These entities are linked through a network of cardinality-bounded relationships that the relational schema materializes as foreign keys, junction tables, and derived views. The following sections walk through the schema layer by layer, showing how each domain concept becomes a table, how relationships are encoded, and how views reconstruct the multidimensional facts that stakeholders need to answer operational questions.

The central entity in the domain is the lab activity itself, representing a discrete instructional event with measurable properties.

**Table `lab_activities`**

| lab_activity_id | activity_id | title | description | duration_minutes | difficulty_level | status | faculty_member_id | lab_material_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8843761 | Compact Initiative | Extended Survey | 35 | integrated-difficul-76 | draft | 1 | 1 |
| 2 | 4180957 | Legacy Model | Pilot Corridor A | 38 | seasonal-difficul-77 | active | 2 | 2 |
| 3 | 168545 | Regional Cluster A | Baseline Series | 41 | regional-difficul-78 | archived | 3 | 3 |
| 4 | default_chart_a_account_53 | Seasonal Review | Distributed Assessment | 44 | legacy-difficul-79 | draft | 4 | 4 |

The `lab_activities` table stores each activity as a row identified by a surrogate `lab_activity_id` and a business-level `activity_id` that carries semantic meaning—values such as `8843761` and `4180957` for numeric identifiers, or `default_chart_a_account_53` for string-based identifiers. The `title` column holds human-readable labels like "Compact Initiative" and "Legacy Model," while `description` provides extended context such as "Extended Survey" and "Pilot Corridor A." The `duration_minutes` column quantifies the time investment required, ranging from 35 to 44 minutes across the sample. The `difficulty_level` column encodes a domain-specific taxonomy with values like `integrated-difficul-76` and `seasonal-difficul-77`, and the `status` column tracks the lifecycle state of the activity with values `draft`, `active`, and `archived`. Two foreign keys anchor the activity to its human and material context: `faculty_member_id` references the responsible professor, and `lab_material_id` references the associated resource package. In the sample data, activity 1 ("Compact Initiative") is assigned to faculty member 1 and linked to lab material 1, while activity 4 ("Seasonal Review") carries the string-based activity identifier and is tied to faculty member 4 and material 4.

Faculty members form the second core entity, representing the instructional staff who design and oversee lab activities.

**Table `faculty_members`**

| id | faculty_id | first_name | last_name | department | email | years_of_service | teaching_assistant_ta_id |
|---|---|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | adaptive-departme-89 | seasonal-email-11 | 30 | 325457 |
| 2 | 605968 | Janice Johnston | Heather Beasley | distributed-departme-90 | regional-email-12 | 40 | 6564383 |
| 3 | 10449508 | Upal Saha | Audrey Taylor | baseline-departme-91 | legacy-email-13 | 50 | eff2bcea-8fcb-11eb-924d-9cd76263cbd0 |
| 4 | 2002007020230 | Katherine Snyder | Susan Wagner | pilot-departme-92 | compact-email-14 | 60 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |

The `faculty_members` table uses a surrogate `id` column as the primary key, with values 1 through 4 in the sample. Each row also carries a `faculty_id` column containing UUID-style identifiers such as `98a02b9c-8fcd-11eb-924d-9cd76263cbd0` and `605968`, which serve as the stable business key for the person. The `first_name` and `last_name` columns store the individual's name; for instance, row 1 records "Stephanie Collins" and "Paul Allen," while row 3 records "Upal Saha" and "Audrey Taylor." The `department` column assigns each faculty member to an organizational unit with values like `adaptive-departme-89`, `distributed-departme-90`, `baseline-departme-91`, and `pilot-departme-92`. The `email` column holds contact addresses such as `seasonal-email-11` and `regional-email-12`. The `years_of_service` column quantifies institutional tenure, ranging from 30 to 60 years in the sample. A notable structural feature is the `teaching_assistant_ta_id` column, which creates a direct link from a faculty member to their assigned teaching assistant—row 1 links faculty member 1 to TA `325457`, while row 3 links faculty member 3 to TA `eff2bcea-8fcb-11eb-924d-9cd76263cbd0`. This column effectively encodes a one-to-one or one-to-few relationship between faculty and their support staff.

Students constitute the third primary entity, representing the learners who participate in lab activities and courses.

**Table `students`**

| student_id | first_name | last_name | major | enrollment_status | course_id |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | primary-major-94 | active | 1000 |
| 2 | Janice Johnston | Heather Beasley | adaptive-major-95 | inactive | 1001 |
| 3 | Upal Saha | Audrey Taylor | distributed-major-96 | graduated | 1002 |
| 4 | Katherine Snyder | Susan Wagner | baseline-major-97 | active | 1003 |

The `students` table uses `student_id` as its primary key, with integer values 1 through 4 in the sample. Each row stores the student's `first_name` and `last_name`—for example, row 1 records "Stephanie Collins" and "Paul Allen," mirroring the naming pattern seen in the faculty table, which reflects the fictional nature of the dataset. The `major` column captures the student's field of study with values such as `primary-major-94`, `adaptive-major-95`, `distributed-major-96`, and `baseline-major-97`. The `enrollment_status` column tracks the student's current standing with values `active`, `inactive`, and `graduated`; row 1 and row 4 show `active` students, row 2 shows an `inactive` student, and row 3 shows a `graduated` student. The `course_id` column is a foreign key linking the student to their enrolled course, with values 1000 through 1003 in the sample. This column establishes a many-to-one relationship between students and courses, meaning each student is associated with exactly one course in this model.

Teaching assistants form the fourth entity, bridging the gap between faculty instruction and student learning.

**Table `teaching_assistants`**

| ta_id | first_name | last_name | assigned_course | hours_per_week | faculty_member_id |
|---|---|---|---|---|---|
| 325457 | Stephanie Collins | Paul Allen | compact-assigned-50 | 44 | 1 |
| 6564383 | Janice Johnston | Heather Beasley | composite-assigned-51 | 51 | 2 |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor | primary-assigned-52 | 58 | 3 |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | adaptive-assigned-53 | 65 | 4 |

The `teaching_assistants` table uses `ta_id` as its primary key, with a mix of integer and UUID-style identifiers in the sample: `325457`, `6564383`, `eff2bcea-8fcb-11eb-924d-9cd76263cbd0`, and `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`. The `first_name` and `last_name` columns store the TA's name, with values such as "Stephanie Collins" / "Paul Allen" and "Janice Johnston" / "Heather Beasley." The `assigned_course` column records the course the TA supports, with values like `compact-assigned-50`, `composite-assigned-51`, `primary-assigned-52`, and `adaptive-assigned-53`. The `hours_per_week` column quantifies the TA's workload, ranging from 44 to 65 hours in the sample. The `faculty_member_id` column is a foreign key pointing to the supervising faculty member, creating a many-to-one relationship where multiple TAs can report to a single faculty member. In the sample, TA `325457` reports to faculty member 1, TA `6564383` reports to faculty member 2, and so on, forming a clear supervisory chain.

Courses represent the formal instructional containers through which lab activities are delivered.

**Table `courses`**

| id | course_code | course_name | credits | semester | department | faculty_member_id |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Legacy Protocol D | 28 | compact-semester-74 | adaptive-departme-89 | 1 |
| 1001 | 4463667 | Regional Programme | 33 | composite-semester-75 | distributed-departme-90 | 2 |
| 1002 | 24077793 | Seasonal Standard | 38 | primary-semester-76 | baseline-departme-91 | 3 |
| 1003 | 1204-0009-L | Integrated Framework A | 43 | adaptive-semester-77 | pilot-departme-92 | 4 |

The `courses` table uses `id` as its primary key, with values 1000 through 1003 in the sample. The `course_code` column holds alphanumeric identifiers such as `10238263`, `4463667`, `24077793`, and `1204-0009-L`. The `course_name` column provides descriptive titles like "Legacy Protocol D," "Regional Programme," "Seasonal Standard," and "Integrated Framework A." The `credits` column quantifies the academic weight of the course, ranging from 28 to 43 credits. The `semester` column identifies the offering period with values such as `compact-semester-74`, `composite-semester-75`, `primary-semester-76`, and `adaptive-semester-77`. The `department` column links the course to an organizational unit, with values matching those in the `faculty_members` table (`adaptive-departme-89`, `distributed-departme-90`, etc.), establishing a departmental alignment between courses and faculty. The `faculty_member_id` column is a foreign key pointing to the instructor responsible for the course, creating a direct link between the course and its teaching lead.

Lab materials represent the physical or digital resources consumed or referenced during lab activities.

**Table `lab_materials`**

| id | material_id | name | quantity | unit | storage_location | lab_activity_id |
|---|---|---|---|---|---|---|
| 1 | 2839521 | Extended Review | 3.95 | distributed-unit-18 | distributed-storage-48 | 1 |
| 2 | 937739 | Pilot Initiative A | 6.90 | baseline-unit-19 | baseline-storage-49 | 2 |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Model | 9.85 | pilot-unit-20 | pilot-storage-50 | 3 |
| 4 | 7021001070070 | Distributed Cluster | 12.80 | extended-unit-21 | extended-storage-51 | 4 |

The `lab_materials` table uses `id` as its primary key, with integer values 1 through 4 in the sample. Each row also carries a `material_id` column containing business identifiers such as `2839521`, `937739`, `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`, and `7021001070070`. The `name` column stores the material's title, with values like "Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster." The `quantity` column records the amount available, ranging from 3.95 to 12.80 in the sample. The `unit` column specifies the measurement unit with values such as `distributed-unit-18`, `baseline-unit-19`, `pilot-unit-20`, and `extended-unit-21`. The `storage_location` column indicates where the material is kept, with values like `distributed-storage-48`, `baseline-storage-49`, `pilot-storage-50`, and `extended-storage-51`. The `lab_activity_id` column is a foreign key linking the material to the lab activity it supports, establishing a one-to-many relationship where a single lab activity can reference multiple materials.

Beyond the six core entities, the schema employs five junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. These tables serve as the relational manifestation of the ontology's associative entities.

**Table `activities_students`**

| lab_activity_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `activities_students` table resolves the many-to-many relationship between lab activities and students, allowing any student to participate in multiple activities and any activity to involve multiple students. Its structure captures the enrollment fact as a pair of foreign keys referencing `lab_activities` and `students`.

**Table `members_activities`**

| faculty_member_id | lab_activity_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `members_activities` table resolves the many-to-many relationship between faculty members and lab activities, enabling a faculty member to oversee multiple activities and an activity to be co-supervised by multiple faculty members. Its foreign keys reference `faculty_members` and `lab_activities`.

**Table `students_activities`**

| student_id | lab_activity_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `students_activities` table provides an alternative or complementary junction between students and lab activities, potentially capturing a different dimension of participation—such as voluntary engagement versus formal enrollment. Its structure mirrors `activities_students` with foreign keys to `students` and `lab_activities`.

**Table `assistants_students`**

| teaching_assistant_ta_id | student_id |
|---|---|
| 325457 | 1 |
| 325457 | 2 |
| 6564383 | 2 |
| 6564383 | 3 |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | 3 |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | 4 |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 |

The `assistants_students` table resolves the many-to-many relationship between teaching assistants and students, allowing a TA to support multiple students and a student to receive support from multiple TAs. Its foreign keys reference `teaching_assistants` and `students`.

**Table `courses_activities`**

| course_id | lab_activity_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `courses_activities` table resolves the many-to-many relationship between courses and lab activities, enabling a course to include multiple lab activities and an activity to be shared across courses. Its foreign keys reference `courses` and `lab_activities`.

With the base tables and junction tables established, the schema provides twelve derived views that materialize common analytical queries by joining the normalized tables. Each view answers a specific domain question by reconstructing a multidimensional fact from the relational fragments.

**View `v_lab_activity_faculty_member`**

```sql
CREATE VIEW v_lab_activity_faculty_member AS
SELECT a.lab_activity_id, a.activity_id, a.title, a.description, b.id AS member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM lab_activities a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| lab_activity_id | activity_id | title | description | member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Compact Initiative | Extended Survey | 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 2 | 4180957 | Legacy Model | Pilot Corridor A | 2 | 605968 | Janice Johnston |
| 3 | 168545 | Regional Cluster A | Baseline Series | 3 | 10449508 | Upal Saha |
| 4 | default_chart_a_account_53 | Seasonal Review | Distributed Assessment | 4 | 2002007020230 | Katherine Snyder |

The view `v_lab_activity_faculty_member` joins `lab_activities` with `faculty_members` to answer the question: "Which faculty member is responsible for each lab activity?" The join matches `lab_activities.faculty_member_id` to `faculty_members.id`, producing rows that combine activity metadata with instructor details. For instance, the row corresponding to activity 1 ("Compact Initiative") would surface faculty member 1's name ("Stephanie Collins"), department (`adaptive-departme-89`), and years of service (30), giving an operational manager a single-row summary of who runs which activity and their institutional seniority.

**View `v_lab_activity_student_detail`**

```sql
CREATE VIEW v_lab_activity_student_detail AS
SELECT a.lab_activity_id, a.activity_id, a.title, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM lab_activities a
  JOIN activities_students j ON j.lab_activity_id = a.lab_activity_id
  JOIN students b ON b.student_id = j.student_id;
```

| lab_activity_id | activity_id | title | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1 | 8843761 | Compact Initiative | 1 | Stephanie Collins | Paul Allen |
| 1 | 8843761 | Compact Initiative | 2 | Janice Johnston | Heather Beasley |
| 2 | 4180957 | Legacy Model | 2 | Janice Johnston | Heather Beasley |
| 2 | 4180957 | Legacy Model | 3 | Upal Saha | Audrey Taylor |
| 3 | 168545 | Regional Cluster A | 3 | Upal Saha | Audrey Taylor |
| 3 | 168545 | Regional Cluster A | 4 | Katherine Snyder | Susan Wagner |
| 4 | default_chart_a_account_53 | Seasonal Review | 4 | Katherine Snyder | Susan Wagner |
| 4 | default_chart_a_account_53 | Seasonal Review | 1 | Stephanie Collins | Paul Allen |

The view `v_lab_activity_student_detail` joins `lab_activities` with `students` through the `activities_students` junction table to answer: "Which students participate in which lab activities?" By traversing the many-to-many path, the view produces rows that pair activity titles with student names and majors. A sample row might show activity 2 ("Legacy Model") alongside student 2 ("Janice Johnston") with major `adaptive-major-95`, enabling program coordinators to audit participation patterns across departments and majors.

**View `v_lab_activity_lab_material`**

```sql
CREATE VIEW v_lab_activity_lab_material AS
SELECT a.lab_activity_id, a.activity_id, a.title, a.description, b.id AS material_id, b.material_id AS material_material_id, b.name AS material_name
FROM lab_activities a JOIN lab_materials b ON a.lab_material_id = b.id;
```

| lab_activity_id | activity_id | title | description | material_id | material_material_id | material_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Compact Initiative | Extended Survey | 1 | 2839521 | Extended Review |
| 2 | 4180957 | Legacy Model | Pilot Corridor A | 2 | 937739 | Pilot Initiative A |
| 3 | 168545 | Regional Cluster A | Baseline Series | 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Model |
| 4 | default_chart_a_account_53 | Seasonal Review | Distributed Assessment | 4 | 7021001070070 | Distributed Cluster |

The view `v_lab_activity_lab_material` joins `lab_activities` with `lab_materials` on `lab_activity_id` to answer: "What materials are allocated to each lab activity?" The result combines activity metadata with material inventory details. For example, activity 3 ("Regional Cluster A") would be paired with material 3 ("Baseline Model"), quantity 9.85, unit `pilot-unit-20`, and storage location `pilot-storage-50`, giving logistics staff a consolidated view of resource allocation per activity.

**View `v_faculty_member_lab_activity_detail`**

```sql
CREATE VIEW v_faculty_member_lab_activity_detail AS
SELECT a.id, a.faculty_id, a.first_name, b.lab_activity_id AS activity_lab_activity_id, b.activity_id AS activity_activity_id, b.title AS activity_title
FROM faculty_members a
  JOIN members_activities j ON j.faculty_member_id = a.id
  JOIN lab_activities b ON b.lab_activity_id = j.lab_activity_id;
```

| id | faculty_id | first_name | activity_lab_activity_id | activity_activity_id | activity_title |
|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 1 | 8843761 | Compact Initiative |
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | 2 | 4180957 | Legacy Model |
| 2 | 605968 | Janice Johnston | 2 | 4180957 | Legacy Model |
| 2 | 605968 | Janice Johnston | 3 | 168545 | Regional Cluster A |
| 3 | 10449508 | Upal Saha | 3 | 168545 | Regional Cluster A |
| 3 | 10449508 | Upal Saha | 4 | default_chart_a_account_53 | Seasonal Review |
| 4 | 2002007020230 | Katherine Snyder | 4 | default_chart_a_account_53 | Seasonal Review |
| 4 | 2002007020230 | Katherine Snyder | 1 | 8843761 | Compact Initiative |

The view `v_faculty_member_lab_activity_detail` joins `faculty_members` with `lab_activities` to answer: "What lab activities does each faculty member oversee?" This is the inverse of `v_lab_activity_faculty_member` and is useful for workload analysis. A sample row would pair faculty member 3 ("Upal Saha", department `baseline-departme-91`, 50 years of service) with activity 3 ("Regional Cluster A", duration 41 minutes, status `archived`), enabling department heads to assess teaching loads and activity portfolios by instructor.

**View `v_faculty_member_teaching_assistant`**

```sql
CREATE VIEW v_faculty_member_teaching_assistant AS
SELECT a.id, a.faculty_id, a.first_name, a.last_name, b.ta_id AS assistant_ta_id, b.first_name AS assistant_first_name, b.last_name AS assistant_last_name
FROM faculty_members a JOIN teaching_assistants b ON a.teaching_assistant_ta_id = b.ta_id;
```

| id | faculty_id | first_name | last_name | assistant_ta_id | assistant_first_name | assistant_last_name |
|---|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | 325457 | Stephanie Collins | Paul Allen |
| 2 | 605968 | Janice Johnston | Heather Beasley | 6564383 | Janice Johnston | Heather Beasley |
| 3 | 10449508 | Upal Saha | Audrey Taylor | eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor |
| 4 | 2002007020230 | Katherine Snyder | Susan Wagner | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner |

The view `v_faculty_member_teaching_assistant` joins `faculty_members` with `teaching_assistants` to answer: "Which teaching assistant is assigned to each faculty member?" This view materializes the supervisory chain directly. A sample row would pair faculty member 1 ("Stephanie Collins", 30 years of service) with TA `325457` ("Stephanie Collins", assigned to `compact-assigned-50`, 44 hours per week), providing a clear picture of the support structure beneath each professor.

**View `v_student_course`**

```sql
CREATE VIEW v_student_course AS
SELECT a.student_id, a.first_name, a.last_name, a.major, b.id AS course_id, b.course_code AS course_course_code, b.course_name AS course_course_name
FROM students a JOIN courses b ON a.course_id = b.id;
```

| student_id | first_name | last_name | major | course_id | course_course_code | course_course_name |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | primary-major-94 | 1000 | 10238263 | Legacy Protocol D |
| 2 | Janice Johnston | Heather Beasley | adaptive-major-95 | 1001 | 4463667 | Regional Programme |
| 3 | Upal Saha | Audrey Taylor | distributed-major-96 | 1002 | 24077793 | Seasonal Standard |
| 4 | Katherine Snyder | Susan Wagner | baseline-major-97 | 1003 | 1204-0009-L | Integrated Framework A |

The view `v_student_course` joins `students` with `courses` on `course_id` to answer: "Which course is each student enrolled in?" This view consolidates student demographics with course metadata. A sample row would pair student 1 ("Stephanie Collins", major `primary-major-94`, status `active`) with course 1000 ("Legacy Protocol D", 28 credits, semester `compact-semester-74`, department `adaptive-departme-89`), giving registrars a unified enrollment snapshot.

**View `v_student_lab_activity_detail`**

```sql
CREATE VIEW v_student_lab_activity_detail AS
SELECT a.student_id, a.first_name, a.last_name, b.lab_activity_id AS activity_lab_activity_id, b.activity_id AS activity_activity_id, b.title AS activity_title
FROM students a
  JOIN students_activities j ON j.student_id = a.student_id
  JOIN lab_activities b ON b.lab_activity_id = j.lab_activity_id;
```

| student_id | first_name | last_name | activity_lab_activity_id | activity_activity_id | activity_title |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 1 | 8843761 | Compact Initiative |
| 1 | Stephanie Collins | Paul Allen | 2 | 4180957 | Legacy Model |
| 2 | Janice Johnston | Heather Beasley | 2 | 4180957 | Legacy Model |
| 2 | Janice Johnston | Heather Beasley | 3 | 168545 | Regional Cluster A |
| 3 | Upal Saha | Audrey Taylor | 3 | 168545 | Regional Cluster A |
| 3 | Upal Saha | Audrey Taylor | 4 | default_chart_a_account_53 | Seasonal Review |
| 4 | Katherine Snyder | Susan Wagner | 4 | default_chart_a_account_53 | Seasonal Review |
| 4 | Katherine Snyder | Susan Wagner | 1 | 8843761 | Compact Initiative |

The view `v_student_lab_activity_detail` joins `students` with `lab_activities` through the `students_activities` junction table to answer: "Which lab activities has each student engaged with?" This view provides a student-centric participation record. A sample row might pair student 4 ("Katherine Snyder", major `baseline-major-97`, status `active`) with activity 4 ("Seasonal Review", duration 44 minutes, status `draft`), enabling academic advisors to track student engagement across the curriculum.

**View `v_teaching_assistant_faculty_member`**

```sql
CREATE VIEW v_teaching_assistant_faculty_member AS
SELECT a.ta_id, a.first_name, a.last_name, a.assigned_course, b.id AS member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM teaching_assistants a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| ta_id | first_name | last_name | assigned_course | member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|---|
| 325457 | Stephanie Collins | Paul Allen | compact-assigned-50 | 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 6564383 | Janice Johnston | Heather Beasley | composite-assigned-51 | 2 | 605968 | Janice Johnston |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor | primary-assigned-52 | 3 | 10449508 | Upal Saha |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | adaptive-assigned-53 | 4 | 2002007020230 | Katherine Snyder |

The view `v_teaching_assistant_faculty_member` joins `teaching_assistants` with `faculty_members` to answer: "Which faculty member supervises each teaching assistant?" This is the inverse of `v_faculty_member_teaching_assistant` and is useful for TA management. A sample row would pair TA `6564383` ("Janice Johnston", assigned to `composite-assigned-51`, 51 hours per week) with faculty member 2 ("Janice Johnston", department `distributed-departme-90`, 40 years of service), clarifying the reporting hierarchy.

**View `v_teaching_assistant_student_detail`**

```sql
CREATE VIEW v_teaching_assistant_student_detail AS
SELECT a.ta_id, a.first_name, a.last_name, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM teaching_assistants a
  JOIN assistants_students j ON j.teaching_assistant_ta_id = a.ta_id
  JOIN students b ON b.student_id = j.student_id;
```

| ta_id | first_name | last_name | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 325457 | Stephanie Collins | Paul Allen | 1 | Stephanie Collins | Paul Allen |
| 325457 | Stephanie Collins | Paul Allen | 2 | Janice Johnston | Heather Beasley |
| 6564383 | Janice Johnston | Heather Beasley | 2 | Janice Johnston | Heather Beasley |
| 6564383 | Janice Johnston | Heather Beasley | 3 | Upal Saha | Audrey Taylor |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor | 3 | Upal Saha | Audrey Taylor |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor | 4 | Katherine Snyder | Susan Wagner |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 4 | Katherine Snyder | Susan Wagner |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 1 | Stephanie Collins | Paul Allen |

The view `v_teaching_assistant_student_detail` joins `teaching_assistants` with `students` through the `assistants_students` junction table to answer: "Which students does each teaching assistant support?" This view reveals the TA-student support network. A sample row might pair TA `eff2bcea-8fcb-11eb-924d-9cd76263cbd0` ("Upal Saha", 58 hours per week) with student 3 ("Upal Saha", major `distributed-major-96`, status `graduated`), giving program coordinators visibility into TA workload distribution across the student body.

**View `v_course_lab_activity_detail`**

```sql
CREATE VIEW v_course_lab_activity_detail AS
SELECT a.id, a.course_code, a.course_name, b.lab_activity_id AS activity_lab_activity_id, b.activity_id AS activity_activity_id, b.title AS activity_title
FROM courses a
  JOIN courses_activities j ON j.course_id = a.id
  JOIN lab_activities b ON b.lab_activity_id = j.lab_activity_id;
```

| id | course_code | course_name | activity_lab_activity_id | activity_activity_id | activity_title |
|---|---|---|---|---|---|
| 1000 | 10238263 | Legacy Protocol D | 1 | 8843761 | Compact Initiative |
| 1000 | 10238263 | Legacy Protocol D | 2 | 4180957 | Legacy Model |
| 1001 | 4463667 | Regional Programme | 2 | 4180957 | Legacy Model |
| 1001 | 4463667 | Regional Programme | 3 | 168545 | Regional Cluster A |
| 1002 | 24077793 | Seasonal Standard | 3 | 168545 | Regional Cluster A |
| 1002 | 24077793 | Seasonal Standard | 4 | default_chart_a_account_53 | Seasonal Review |
| 1003 | 1204-0009-L | Integrated Framework A | 4 | default_chart_a_account_53 | Seasonal Review |
| 1003 | 1204-0009-L | Integrated Framework A | 1 | 8843761 | Compact Initiative |

The view `v_course_lab_activity_detail` joins `courses` with `lab_activities` through the `courses_activities` junction table to answer: "Which lab activities are included in each course?" This view maps the instructional curriculum. A sample row would pair course 1001 ("Regional Programme", 33 credits, semester `composite-semester-75`) with activity 2 ("Legacy Model", duration 38 minutes, difficulty `seasonal-difficul-77`), enabling curriculum designers to verify that lab activities align with course objectives.

**View `v_course_faculty_member`**

```sql
CREATE VIEW v_course_faculty_member AS
SELECT a.id, a.course_code, a.course_name, a.credits, b.id AS member_id, b.faculty_id AS member_faculty_id, b.first_name AS member_first_name
FROM courses a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| id | course_code | course_name | credits | member_id | member_faculty_id | member_first_name |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Legacy Protocol D | 28 | 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins |
| 1001 | 4463667 | Regional Programme | 33 | 2 | 605968 | Janice Johnston |
| 1002 | 24077793 | Seasonal Standard | 38 | 3 | 10449508 | Upal Saha |
| 1003 | 1204-0009-L | Integrated Framework A | 43 | 4 | 2002007020230 | Katherine Snyder |

The view `v_course_faculty_member` joins `courses` with `faculty_members` to answer: "Which faculty member teaches each course?" This view consolidates course and instructor information. A sample row would pair course 1002 ("Seasonal Standard", 38 credits, department `baseline-departme-91`) with faculty member 3 ("Upal Saha", department `baseline-departme-91`, 50 years of service), providing a clean instructor-course assignment table for scheduling and reporting.

**View `v_lab_material_lab_activity`**

```sql
CREATE VIEW v_lab_material_lab_activity AS
SELECT a.id, a.material_id, a.name, a.quantity, b.lab_activity_id AS activity_lab_activity_id, b.activity_id AS activity_activity_id, b.title AS activity_title
FROM lab_materials a JOIN lab_activities b ON a.lab_activity_id = b.lab_activity_id;
```

| id | material_id | name | quantity | activity_lab_activity_id | activity_activity_id | activity_title |
|---|---|---|---|---|---|---|
| 1 | 2839521 | Extended Review | 3.95 | 1 | 8843761 | Compact Initiative |
| 2 | 937739 | Pilot Initiative A | 6.90 | 2 | 4180957 | Legacy Model |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Model | 9.85 | 3 | 168545 | Regional Cluster A |
| 4 | 7021001070070 | Distributed Cluster | 12.80 | 4 | default_chart_a_account_53 | Seasonal Review |

The view `v_lab_material_lab_activity` joins `lab_materials` with `lab_activities` to answer: "Which lab activity consumes or references each material?" This is the inverse of `v_lab_activity_lab_material` and is useful for inventory management. A sample row would pair material 4 ("Distributed Cluster", quantity 12.80, storage `extended-storage-51`) with activity 4 ("Seasonal Review", duration 44 minutes, status `draft`), giving logistics coordinators a material-to-activity traceability map.

The schema as a whole demonstrates a disciplined application of normalization principles grounded in the domain ontology. The six base tables capture the core entity types with their atomic attributes, while the five junction tables resolve the many-to-many relationships that the ontology identifies as associative. The twelve views then reconstruct the multidimensional facts that stakeholders actually need—linking activities to instructors, students to courses, TAs to students, and materials to activities—without requiring ad-hoc joins at query time. This architecture ensures that the relational model remains both faithful to the conceptual domain and practical for operational use, with each view serving as a materialized answer to a specific question the domain raises.