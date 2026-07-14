## Academic Laboratory Operations and Resource Management

University research laboratories function as complex ecosystems where faculty expertise, teaching assistants, enrolled students, and physical materials converge around structured learning activities. Each laboratory session requires careful coordination: a faculty member designs and oversees the work, teaching assistants provide hands-on guidance, students participate and develop practical skills, and specialized materials are allocated from storage to support the exercises. The records in this system capture every dimension of that coordination, from the high-level course catalog down to the individual lab activity and the specific materials consumed during it.

**Table `lab_activities`**

| lab_activity_id | activity_id | title | description | duration_minutes | difficulty_level | status | faculty_member_id | lab_material_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8843761 | Compact Initiative | Extended Survey | 35 | integrated-difficul-76 | draft | 1 | 1 |
| 2 | 4180957 | Legacy Model | Pilot Corridor A | 38 | seasonal-difficul-77 | active | 2 | 2 |
| 3 | 168545 | Regional Cluster A | Baseline Series | 41 | regional-difficul-78 | archived | 3 | 3 |
| 4 | default_chart_a_account_53 | Seasonal Review | Distributed Assessment | 44 | legacy-difficul-79 | draft | 4 | 4 |

Laboratory activities form the operational core of the system. Each activity carries a unique identifier, a descriptive title such as "Compact Initiative" or "Legacy Model," and a narrative description like "Extended Survey" or "Pilot Corridor A." The duration of each session is measured in minutes, ranging from 35 to 44 minutes across the recorded entries, while the difficulty level encodes a categorical label such as "integrated-difficul-76" or "seasonal-difficul-77." Activities progress through a lifecycle tracked by a status field that takes values of "draft," "active," or "archived." Every activity is assigned to a specific faculty member and draws upon a designated lab material, establishing the two primary resource dependencies that anchor the rest of the data model.

**Table `faculty_members`**

| id | faculty_id | first_name | last_name | department | email | years_of_service | teaching_assistant_ta_id |
|---|---|---|---|---|---|---|---|
| 1 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Stephanie Collins | Paul Allen | adaptive-departme-89 | seasonal-email-11 | 30 | 325457 |
| 2 | 605968 | Janice Johnston | Heather Beasley | distributed-departme-90 | regional-email-12 | 40 | 6564383 |
| 3 | 10449508 | Upal Saha | Audrey Taylor | baseline-departme-91 | legacy-email-13 | 50 | eff2bcea-8fcb-11eb-924d-9cd76263cbd0 |
| 4 | 2002007020230 | Katherine Snyder | Susan Wagner | pilot-departme-92 | compact-email-14 | 60 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |

Faculty members serve as the principal architects and supervisors of laboratory work. The faculty roster includes individuals such as Stephanie Collins (recorded under the name Paul Allen in the first name field), who belongs to the adaptive-departme-89 department and has accumulated 30 years of service, and Katherine Snyder (Susan Wagner), who works in pilot-departme-92 with 60 years of service. Each faculty record carries a unique faculty identifier, an email address drawn from patterns like "seasonal-email-11" and "compact-email-14," and a reference to a teaching assistant assigned to support their instructional load. The teaching assistant linkage, stored in the `teaching_assistant_ta_id` column, creates a direct supervisory relationship that the system tracks for workload distribution and accountability.

**Table `students`**

| student_id | first_name | last_name | major | enrollment_status | course_id |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | primary-major-94 | active | 1000 |
| 2 | Janice Johnston | Heather Beasley | adaptive-major-95 | inactive | 1001 |
| 3 | Upal Saha | Audrey Taylor | distributed-major-96 | graduated | 1002 |
| 4 | Katherine Snyder | Susan Wagner | baseline-major-97 | active | 1003 |

Students are the participants who engage with laboratory activities within the context of their academic programs. The student records capture full names, academic majors such as "primary-major-94" and "baseline-major-97," and enrollment statuses that include "active," "inactive," and "graduated." Each student is associated with a specific course through the `course_id` field, which ties their laboratory participation to the broader curriculum. The enrollment status provides a quick indicator of whether a student is currently engaged in coursework, has completed their program, or has temporarily paused their studies.

**Table `teaching_assistants`**

| ta_id | first_name | last_name | assigned_course | hours_per_week | faculty_member_id |
|---|---|---|---|---|---|
| 325457 | Stephanie Collins | Paul Allen | compact-assigned-50 | 44 | 1 |
| 6564383 | Janice Johnston | Heather Beasley | composite-assigned-51 | 51 | 2 |
| eff2bcea-8fcb-11eb-924d-9cd76263cbd0 | Upal Saha | Audrey Taylor | primary-assigned-52 | 58 | 3 |
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | adaptive-assigned-53 | 65 | 4 |

Teaching assistants bridge the gap between faculty oversight and student engagement. The TA roster includes individuals like Stephanie Collins (Paul Allen), who is assigned to "compact-assigned-50" and works 44 hours per week, and Katherine Snyder (Susan Wagner), who supports "adaptive-assigned-53" for 65 hours weekly. Each teaching assistant record specifies an assigned course, a weekly hour commitment ranging from 44 to 65 hours, and a faculty member identifier that establishes the supervisory chain. The `faculty_member_id` column directly links each TA to the faculty member they assist, ensuring that instructional responsibility remains traceable through the organizational hierarchy.

**Table `courses`**

| id | course_code | course_name | credits | semester | department | faculty_member_id |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Legacy Protocol D | 28 | compact-semester-74 | adaptive-departme-89 | 1 |
| 1001 | 4463667 | Regional Programme | 33 | composite-semester-75 | distributed-departme-90 | 2 |
| 1002 | 24077793 | Seasonal Standard | 38 | primary-semester-76 | baseline-departme-91 | 3 |
| 1003 | 1204-0009-L | Integrated Framework A | 43 | adaptive-semester-77 | pilot-departme-92 | 4 |

Courses provide the academic framework within which laboratory activities are scheduled and students are enrolled. The course catalog includes entries such as "Legacy Protocol D" (course code 10238263) with 28 credits in the adaptive-departme-89 department, and "Integrated Framework A" (code 1204-0009-L) carrying 43 credits in pilot-departme-92. Each course is associated with a specific semester designation like "compact-semester-74" or "adaptive-semester-77," and is overseen by a faculty member identified through the `faculty_member_id` column. The course structure determines which students enroll, which faculty members teach, and which laboratory activities are scheduled as part of the curriculum.

**Table `lab_materials`**

| id | material_id | name | quantity | unit | storage_location | lab_activity_id |
|---|---|---|---|---|---|---|
| 1 | 2839521 | Extended Review | 3.95 | distributed-unit-18 | distributed-storage-48 | 1 |
| 2 | 937739 | Pilot Initiative A | 6.90 | baseline-unit-19 | baseline-storage-49 | 2 |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Model | 9.85 | pilot-unit-20 | pilot-storage-50 | 3 |
| 4 | 7021001070070 | Distributed Cluster | 12.80 | extended-unit-21 | extended-storage-51 | 4 |

Physical resources required for laboratory work are cataloged as lab materials, each with a name, quantity, unit of measure, and storage location. The materials database includes items such as "Extended Review" (material 2839521) with a quantity of 3.95 in distributed-unit-18, stored at distributed-storage-48, and "Distributed Cluster" (material 7021001070070) with a quantity of 12.80 in extended-unit-21, held at extended-storage-51. Every material record references a specific lab activity through the `lab_activity_id` column, establishing which exercises draw upon which physical resources. This linkage enables inventory planning and ensures that materials are available before activities commence.

The system employs several junction tables to manage the many-to-many relationships that arise when students, faculty, and courses interact with laboratory activities. The `activities_students` table records which students participate in which activities, while `members_activities` tracks faculty involvement across multiple exercises. The `students_activities` table provides an additional layer of student-activity association, and `assistants_students` documents the relationships between teaching assistants and the students they support. The `courses_activities` table connects courses to the laboratory activities that form part of their curriculum, ensuring that activity scheduling aligns with course requirements.

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

The `activities_students` junction table captures the direct participation of students in laboratory activities. Each row represents a single enrollment instance, linking a student to a specific activity and enabling the system to track attendance, completion, and performance across the full set of exercises offered within a course or department.

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

The `members_activities` table documents the involvement of faculty members in laboratory activities beyond their primary assignment. This allows faculty to be associated with multiple activities, reflecting collaborative supervision, cross-departmental teaching, or the oversight of activities that span several courses.

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

The `students_activities` table provides a secondary record of student participation in laboratory activities. This redundancy supports different reporting perspectives and ensures that student engagement data remains accessible even when the primary participation records are being updated or audited.

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

The `assistants_students` table establishes the relationships between teaching assistants and the students they mentor or supervise. This linkage is essential for tracking which TAs are responsible for which students during laboratory sessions, supporting workload balancing and ensuring that every student has an identifiable point of contact for hands-on guidance.

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

The `courses_activities` table connects courses to the laboratory activities that constitute their practical component. This relationship ensures that the scheduling of lab activities aligns with course calendars, that materials are procured in advance of the relevant course sessions, and that student enrollment in a course automatically implies eligibility for the associated laboratory work.

The system's views synthesize these base tables into readable reports that answer specific operational questions. Each view joins the relevant tables to present a unified picture of the relationships between people, activities, materials, and courses.

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

The `v_lab_activity_faculty_member` view answers the question of which faculty member is responsible for each laboratory activity. It joins `lab_activities` with `faculty_members` on the faculty identifier, producing rows that pair activity titles with faculty names and departments. For example, the view would show that activity 1, "Compact Initiative," is overseen by Stephanie Collins (Paul Allen) of the adaptive-departme-89 department, while activity 2, "Legacy Model," falls under Janice Johnston (Heather Beasley) in the distributed-departme-90 department. This view supports scheduling queries and helps administrators verify that each activity has an assigned supervisor.

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

The `v_lab_activity_student_detail` view reveals which students are participating in each laboratory activity by joining the activity records with student enrollment data. A row in this view might show that a student majoring in primary-major-94 is enrolled in activity "Compact Initiative" while holding an active enrollment status. This view is essential for tracking participation rates, identifying students who may need additional support, and generating attendance reports for individual sessions.

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

The `v_lab_activity_lab_material` view connects each laboratory activity to the physical materials it requires. By joining `lab_activities` with `lab_materials`, the view produces rows that pair activity titles with material names, quantities, and storage locations. For instance, activity 1 ("Compact Initiative") is linked to material 1 ("Extended Review") with a quantity of 3.95 units stored at distributed-storage-48. This view supports inventory management by making it immediately clear which materials must be prepared for each upcoming activity.

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

The `v_faculty_member_lab_activity_detail` view presents a faculty-centric perspective, listing all laboratory activities overseen by each faculty member along with their details. A row might show that Katherine Snyder (Susan Wagner) of the pilot-departme-92 department supervises activity 4, "Seasonal Review," which has a duration of 44 minutes and carries a legacy-difficul-79 difficulty rating. This view helps faculty members track their full instructional load and enables department heads to balance activity assignments across the faculty roster.

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

The `v_faculty_member_teaching_assistant` view maps the supervisory relationships between faculty members and their assigned teaching assistants. Each row pairs a faculty member with the TA they oversee, including the TA's assigned course and weekly hour commitment. For example, the view would show that faculty member 1 (Stephanie Collins, Paul Allen) is supported by teaching assistant 325457 (also Stephanie Collins, Paul Allen), who is assigned to compact-assigned-50 and works 44 hours per week. This view is critical for workload analysis and ensures that every faculty member's instructional support is documented.

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

The `v_student_course` view answers the fundamental question of which students are enrolled in which courses. By joining `students` with `courses`, the view produces rows that pair student names and majors with course codes, names, and credit values. A representative row might show that a student majoring in adaptive-major-95 is enrolled in course 1001, "Regional Programme," which carries 33 credits. This view supports enrollment reporting, prerequisite checking, and the generation of class rosters for individual courses.

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

The `v_student_lab_activity_detail` view provides a comprehensive picture of each student's laboratory engagement by joining student records with their associated activity details. A row in this view might display that a student with active enrollment status is participating in an activity titled "Regional Cluster A" with a duration of 41 minutes and a regional-difficul-78 difficulty level. This view supports academic advising by revealing the breadth and difficulty of a student's laboratory experience.

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

The `v_teaching_assistant_faculty_member` view presents the teaching assistant perspective, listing each TA alongside the faculty member they support. Each row includes the TA's assigned course, weekly hours, and the faculty member's department and years of service. For example, the view would show that teaching assistant eff2bcea-8fcb-11eb-924d-9cd76263cbd0 (Upal Saha, Audrey Taylor), assigned to primary-assigned-52 for 58 hours per week, supports faculty member 3 (Upal Saha, Audrey Taylor) of the baseline-departme-91 department, who has 50 years of service. This view is useful for evaluating TA workload distribution and ensuring adequate faculty supervision.

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

The `v_teaching_assistant_student_detail` view connects teaching assistants to the students they support, combining TA assignment information with student enrollment and major data. A row might show that a teaching assistant working 65 hours per week on adaptive-assigned-53 is supporting a student majoring in baseline-major-97 who holds active enrollment status. This view helps identify which students receive TA support and enables the analysis of TA-to-student ratios across courses and departments.

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

The `v_course_lab_activity_detail` view reveals the relationship between courses and their associated laboratory activities. By joining course records with activity data, the view produces rows that pair course names and credit values with activity titles, durations, and difficulty levels. For instance, the view might show that course 1000, "Legacy Protocol D" (28 credits), is associated with activity 1, "Compact Initiative," which runs for 35 minutes at an integrated-difficul-76 difficulty level. This view supports curriculum planning by making the practical components of each course visible.

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

The `v_course_faculty_member` view answers the question of which faculty member teaches each course. It joins `courses` with `faculty_members` to produce rows that pair course codes and names with faculty names, departments, and years of service. A representative row would show that course 1003, "Integrated Framework A" (43 credits), is taught by faculty member 4 (Katherine Snyder, Susan Wagner) of the pilot-departme-92 department, who has 60 years of service. This view supports scheduling, faculty workload tracking, and the generation of course catalogs with instructor information.

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

The `v_lab_material_lab_activity` view provides a material-centric perspective, listing each lab material alongside the activity it supports. Each row includes the material name, quantity, unit, storage location, and the associated activity title and status. For example, the view would show that material 3, "Baseline Model" (quantity 9.85, pilot-unit-20, stored at pilot-storage-50), is used for activity 3, "Regional Cluster A," which currently has an archived status. This view is essential for inventory management, material procurement, and ensuring that storage allocations align with current and upcoming laboratory needs.

The interlocking structure of these tables and views creates a coherent operational picture of academic laboratory management. Faculty members design and supervise activities, teaching assistants provide hands-on support, students participate within the framework of their courses, and physical materials are allocated to enable the work. The junction tables capture the many-to-many relationships that arise when people and resources cross traditional boundaries, while the views synthesize the raw records into actionable reports. Together, they form a complete record of who does what, with whom, using which materials, and within which academic context — a system designed to keep complex laboratory operations running smoothly.