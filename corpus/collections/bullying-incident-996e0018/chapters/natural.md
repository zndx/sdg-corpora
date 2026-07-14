# Incident Management in Educational Settings

Schools and educational institutions operate within a complex ecosystem where student safety, staff accountability, parental engagement, and external oversight intersect. When bullying incidents occur, the response must be systematic, traceable, and coordinated across multiple stakeholders. This chapter examines the data architecture that supports such incident management — the records that capture who was involved, what happened, how the institution responded, and which external bodies were notified. The domain encompasses six core entities: the incidents themselves, the students affected, the staff members who manage and report them, the parents or guardians responsible for follow-up, the support services deployed to address harm, and the external authorities engaged when situations escalate beyond the school's capacity.

**Table `bullying_incidents`**

| bullying_incident_id | incident_id | date_reported | severity_level | incident_type | status | location | description | staff_member_id | authority_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | 2023-06-04T17:39:00 | Less Serious | Physical Harm | Reported | extended-location-99 | Extended Survey | 1 | 974930 |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | Serious | Harassment | Under Investigation | integrated-location-100 | Pilot Corridor A | 2 | 5917289 |
| 3 | 2933483 | 2025-04-26T07:13:00 | Repetitive | Verbal Insults | Resolved | seasonal-location-101 | Baseline Series | 3 | 8843762 |
| 4 | 2986243 | 2022-09-10T14:30:00 | Less Serious | Cyberbullying | Escalated to Police | regional-location-102 | Distributed Assessment | 4 | 2087738 |

The `bullying_incidents` table serves as the central record of every reported event. Each row captures a unique incident through its `bullying_incident_id`, alongside an `incident_id` that links to a broader case management system. The `date_reported` field timestamps when the institution became aware of the event — for example, incident 1 was reported on 2023-06-04 at 17:39, while incident 4 dates back to 2022-09-10. The `severity_level` column classifies the gravity of the event, ranging from "Less Serious" to "Serious" to "Repetitive." Incident types span physical harm, harassment, verbal insults, and cyberbullying. The `status` field tracks the investigation lifecycle: Reported, Under Investigation, Resolved, or Escalated to Police. Location data uses descriptive identifiers such as `extended-location-99` or `regional-location-102`, and the `description` column provides narrative context — "Pilot Corridor A" for incident 2, "Baseline Series" for incident 3. Each incident is assigned to a `staff_member_id` for ownership and an `authority_id` for external coordination.

**Table `students`**

| student_id | full_name | grade_level | enrollment_status | date_of_birth | guardian_contact_id | bullying_incident_id | involved_in_incident_as_perpetrator_bullying_incident_id | service_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | 29 | Active | 2025-04-02 | Karen Keller | 1 | 1 | 1996925 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Account Name | 33 | Suspended | 2022-09-13 | Stephanie Lawrence | 2 | 2 | 3990164 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Saipan International Airport | 37 | Expelled | 2023-02-24 | Walter Pratt | 3 | 3 | 5844258 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Norma Fisher | 41 | Graduated | 2024-07-08 | Julian Brown | 4 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Students are the primary subjects of incident records. The `students` table stores each learner's `full_name`, `grade_level`, and `enrollment_status`, which can be Active, Suspended, Expelled, or Graduated. The `date_of_birth` field anchors the student's age context, while `guardian_contact_id` links to the parent or guardian responsible for communication. Crucially, the `bullying_incident_id` column directly associates a student with a specific incident, and the `involved_in_incident_as_perpetrator_bullying_incident_id` column distinguishes whether the student was the target or the perpetrator. The `service_id` column connects the student to support services, and `created_at` / `updated_at` timestamps track record maintenance. Student 1000, Theodore Mcgrath, holds Active status in grade level 29, while student 1003, Norma Fisher, has a Graduated status in grade level 41.

**Table `staff_members`**

| id | staff_id | full_name | role | employment_status | department | cybersafety_trained | bullying_incident_id | student_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Teacher | Active | adaptive-departme-89 | true | 1 | 1000 |
| 2 | 3158139 | Account Name | Principal | On Leave | distributed-departme-90 | false | 2 | 1001 |
| 3 | 8189502 | Saipan International Airport | Welfare Officer | Terminated | baseline-departme-91 | true | 3 | 1002 |
| 4 | 69438 | Norma Fisher | Counsellor | Active | pilot-departme-92 | false | 4 | 1003 |

Staff members are the institutional actors who manage incidents, deliver support, and maintain oversight. The `staff_members` table records each employee's `staff_id`, `full_name`, and `role`, which includes positions such as Teacher, Principal, Welfare Officer, and Counsellor. The `employment_status` field indicates whether a staff member is Active, On Leave, or Terminated. The `department` column assigns staff to organizational units like `adaptive-departme-89` or `pilot-departme-92`. A critical field is `cybersafety_trained`, a boolean flag indicating whether the staff member has completed digital safety training — staff member 1 (Theodore Mcgrath, Teacher) is trained, while staff member 2 (Account Name, Principal) is not. The `bullying_incident_id` and `student_id` columns create direct associations between staff, incidents, and students.

**Table `parents`**

| id | parent_id | full_name | contact_number | email_address | relationship_to_student | bullying_incident_id | participates_in_conciliation_bullying_incident_id |
|---|---|---|---|---|---|---|---|
| 1 | 4793462 | Theodore Mcgrath | Peter Mcdowell | primary-email-70 | Mother | 1 | 1 |
| 2 | gd_acc_120000 | Account Name | Sophia Meyer | adaptive-email-71 | Father | 2 | 2 |
| 3 | 9568439 | Saipan International Airport | Carol Gaines | distributed-email-72 | Guardian | 3 | 3 |
| 4 | BJBBB | Norma Fisher | April Snyder | baseline-email-73 | Other | 4 | 4 |

Parents and guardians form the bridge between the school and the student's home environment. The `parents` table captures each parent's `parent_id`, `full_name`, `contact_number`, and `email_address`. The `relationship_to_student` field specifies the nature of the relationship — Mother, Father, Guardian, or Other. The `bullying_incident_id` links the parent to a specific incident, and `participates_in_conciliation_bullying_incident_id` tracks whether the parent is engaged in the resolution process. Parent 1 (Theodore Mcgrath, listed as Mother) is associated with incident 1, while parent 4 (Norma Fisher, listed as Other) is connected to incident 4.

**Table `support_services`**

| service_id | service_type | provider_name | start_date | end_date | status | staff_member_id | bullying_incident_id |
|---|---|---|---|---|---|---|---|
| 1996925 | Counseling | Primary Initiative A | 2022-09-05 | 2022-09-01 | Scheduled | 1 | 1 |
| 3990164 | Welfare Coordination | Composite Model | 2023-02-16 | 2023-02-12 | In Progress | 2 | 2 |
| 5844258 | Conflict Resolution | Compact Cluster | 2024-07-27 | 2024-07-23 | Completed | 3 | 3 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 2025-12-11 | 2025-12-07 | Cancelled | 4 | 4 |

Support services represent the institutional response to bullying incidents. The `support_services` table documents each service through its `service_id`, `service_type` (such as Counseling, Welfare Coordination, Conflict Resolution, or Bystander Training), and `provider_name` (e.g., Primary Initiative A, Composite Model, Compact Cluster, Legacy Review D). The `start_date` and `end_date` fields define the service period, while `status` tracks progress through Scheduled, In Progress, Completed, or Cancelled states. Each service is assigned to a `staff_member_id` for delivery and a `bullying_incident_id` for case linkage. Service 1996925 (Counseling) was Scheduled with a start date of 2022-09-05, while service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Bystander Training) was Cancelled with a start date of 2025-12-11.

**Table `external_authorities`**

| authority_id | authority_name | contact_person | contact_number | authority_type | bullying_incident_id | staff_member_id |
|---|---|---|---|---|---|---|
| 974930 | Sean Green | Alyssa Chung | Peter Mcdowell | Police | 1 | 1 |
| 5917289 | Elizabeth Woods | Brianna Mejia | Sophia Meyer | Student Critical Incident Advisory Unit | 2 | 2 |
| 8843762 | Kimberly Smith | Eric Schultz | Carol Gaines | Emergency and Security Management Unit | 3 | 3 |
| 2087738 | Kimberly Smith | Peter Montgomery | April Snyder | Police | 4 | 4 |

When incidents escalate beyond the school's internal capacity, external authorities are engaged. The `external_authorities` table records each organization's `authority_id`, `authority_name`, `contact_person`, and `contact_number`. The `authority_type` field categorizes the body — Police, Student Critical Incident Advisory Unit, or Emergency and Security Management Unit. Each authority is linked to a `bullying_incident_id` and a `staff_member_id` for internal coordination. Authority 974930 (Sean Green, Police) is associated with incident 1, while authority 5917289 (Elizabeth Woods, Student Critical Incident Advisory Unit) handles incident 2.

Beyond these six base tables, the data model includes four junction tables that manage many-to-many relationships. The `incidents_students` table resolves the relationship between incidents and students, allowing a single incident to involve multiple students and a student to be involved in multiple incidents. The `students_parents` and `parents_students` tables similarly resolve the student-parent relationship from both directions, supporting cases where a student has multiple guardians or a parent is responsible for multiple children. The `services_students` table connects support services to the students who receive them, enabling a service to be delivered to multiple students and a student to receive multiple services over time.

## Incident and Student Detail

**View `vw_bullying_incident_student_detail`**

```sql
CREATE VIEW vw_bullying_incident_student_detail AS
SELECT a.bullying_incident_id, a.incident_id, a.date_reported, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM bullying_incidents a
  JOIN incidents_students j ON j.bullying_incident_id = a.bullying_incident_id
  JOIN students b ON b.student_id = j.student_id;
```

| bullying_incident_id | incident_id | date_reported | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 1 | 1336174 | 2023-06-04T17:39:00 | 1000 | Theodore Mcgrath | 29 |
| 1 | 1336174 | 2023-06-04T17:39:00 | 1001 | Account Name | 33 |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | 1001 | Account Name | 33 |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | 1002 | Saipan International Airport | 37 |
| 3 | 2933483 | 2025-04-26T07:13:00 | 1002 | Saipan International Airport | 37 |
| 3 | 2933483 | 2025-04-26T07:13:00 | 1003 | Norma Fisher | 41 |
| 4 | 2986243 | 2022-09-10T14:30:00 | 1003 | Norma Fisher | 41 |
| 4 | 2986243 | 2022-09-10T14:30:00 | 1000 | Theodore Mcgrath | 29 |

This view answers the question: "What are the full details of a bullying incident, including the student(s) involved?" By joining `bullying_incidents` with `students`, the view produces a comprehensive record that pairs incident metadata with student information. For incident 1, the view reveals that Theodore Mcgrath (student 1000, Active status, grade level 29) was involved in a Less Serious Physical Harm incident reported on 2023-06-04 at extended-location-99. For incident 4, Norma Fisher (student 1003, Graduated status, grade level 41) was involved in a Less Serious Cyberbullying incident that was Escalated to Police.

**View `vw_bullying_incident_staff_member`**

```sql
CREATE VIEW vw_bullying_incident_staff_member AS
SELECT a.bullying_incident_id, a.incident_id, a.date_reported, a.severity_level, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM bullying_incidents a JOIN staff_members b ON a.staff_member_id = b.id;
```

| bullying_incident_id | incident_id | date_reported | severity_level | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 1336174 | 2023-06-04T17:39:00 | Less Serious | 1 | 937735 | Theodore Mcgrath |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | Serious | 2 | 3158139 | Account Name |
| 3 | 2933483 | 2025-04-26T07:13:00 | Repetitive | 3 | 8189502 | Saipan International Airport |
| 4 | 2986243 | 2022-09-10T14:30:00 | Less Serious | 4 | 69438 | Norma Fisher |

This view answers: "Which staff member is responsible for managing a given bullying incident?" The join between `bullying_incidents` and `staff_members` surfaces the staff member's role, department, and training status alongside the incident details. Incident 1 is managed by staff member 1 (Theodore Mcgrath, Teacher, Active, adaptive-departme-89, cybersafety_trained = true). Incident 2 is managed by staff member 2 (Account Name, Principal, On Leave, distributed-departme-90, cybersafety_trained = false), which raises a notable operational concern: a Principal on leave without cybersafety training is assigned to a Serious Harassment incident.

**View `vw_bullying_incident_external_authority`**

```sql
CREATE VIEW vw_bullying_incident_external_authority AS
SELECT a.bullying_incident_id, a.incident_id, a.date_reported, a.severity_level, b.authority_id AS authority_authority_id, b.authority_name AS authority_authority_name, b.contact_person AS authority_contact_person
FROM bullying_incidents a JOIN external_authorities b ON a.authority_id = b.authority_id;
```

| bullying_incident_id | incident_id | date_reported | severity_level | authority_authority_id | authority_authority_name | authority_contact_person |
|---|---|---|---|---|---|---|
| 1 | 1336174 | 2023-06-04T17:39:00 | Less Serious | 974930 | Sean Green | Alyssa Chung |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | Serious | 5917289 | Elizabeth Woods | Brianna Mejia |
| 3 | 2933483 | 2025-04-26T07:13:00 | Repetitive | 8843762 | Kimberly Smith | Eric Schultz |
| 4 | 2986243 | 2022-09-10T14:30:00 | Less Serious | 2087738 | Kimberly Smith | Peter Montgomery |

This view answers: "Which external authority is engaged for each bullying incident?" Joining `bullying_incidents` with `external_authorities` provides the authority's name, type, and contact details alongside the incident record. Incident 1 involves authority 974930 (Sean Green, Police), while incident 2 involves authority 5917289 (Elizabeth Woods, Student Critical Incident Advisory Unit). Incident 3 is handled by authority 8843762 (Kimberly Smith, Emergency and Security Management Unit), and incident 4 also involves a Police authority (authority 2087738, Kimberly Smith).

## Student-Centric Views

**View `vw_student_parent_detail`**

```sql
CREATE VIEW vw_student_parent_detail AS
SELECT a.student_id, a.full_name, a.grade_level, b.id AS parent_id, b.parent_id AS parent_parent_id, b.full_name AS parent_full_name
FROM students a
  JOIN students_parents j ON j.student_id = a.student_id
  JOIN parents b ON b.id = j.parent_id;
```

| student_id | full_name | grade_level | parent_id | parent_parent_id | parent_full_name |
|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | 29 | 1 | 4793462 | Theodore Mcgrath |
| 1000 | Theodore Mcgrath | 29 | 2 | gd_acc_120000 | Account Name |
| 1001 | Account Name | 33 | 2 | gd_acc_120000 | Account Name |
| 1001 | Account Name | 33 | 3 | 9568439 | Saipan International Airport |
| 1002 | Saipan International Airport | 37 | 3 | 9568439 | Saipan International Airport |
| 1002 | Saipan International Airport | 37 | 4 | BJBBB | Norma Fisher |
| 1003 | Norma Fisher | 41 | 4 | BJBBB | Norma Fisher |
| 1003 | Norma Fisher | 41 | 1 | 4793462 | Theodore Mcgrath |

This view answers: "Who is the parent or guardian of a given student, and what is their relationship?" The join between `students` and `parents` surfaces the guardian's contact information and relationship classification. Student 1000 (Theodore Mcgrath) has parent 1 (Theodore Mcgrath, Mother, contact: Peter Mcdowell). Student 1001 (Account Name) has parent 2 (Account Name, Father, contact: Sophia Meyer).

**View `vw_student_bullying_incident`**

```sql
CREATE VIEW vw_student_bullying_incident AS
SELECT a.student_id, a.full_name, a.grade_level, a.enrollment_status, b.bullying_incident_id AS incident_bullying_incident_id, b.incident_id AS incident_incident_id, b.date_reported AS incident_date_reported
FROM students a JOIN bullying_incidents b ON a.bullying_incident_id = b.bullying_incident_id;
```

| student_id | full_name | grade_level | enrollment_status | incident_bullying_incident_id | incident_incident_id | incident_date_reported |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | 29 | Active | 1 | 1336174 | 2023-06-04T17:39:00 |
| 1001 | Account Name | 33 | Suspended | 2 | state_uk_4 | 2024-11-15T00:56:00 |
| 1002 | Saipan International Airport | 37 | Expelled | 3 | 2933483 | 2025-04-26T07:13:00 |
| 1003 | Norma Fisher | 41 | Graduated | 4 | 2986243 | 2022-09-10T14:30:00 |

This view answers: "What bullying incidents has a specific student been involved in?" By joining `students` with `bullying_incidents`, the view provides a student's incident history with full context. Student 1000 (Theodore Mcgrath, Active) was involved in incident 1 (Less Serious, Physical Harm, Reported). Student 1002 (Saipan International Airport, Expelled) was involved in incident 3 (Repetitive, Verbal Insults, Resolved).

**View `vw_student_support_service`**

```sql
CREATE VIEW vw_student_support_service AS
SELECT a.student_id, a.full_name, a.grade_level, a.enrollment_status, b.service_id AS service_service_id, b.service_type AS service_service_type, b.provider_name AS service_provider_name
FROM students a JOIN support_services b ON a.service_id = b.service_id;
```

| student_id | full_name | grade_level | enrollment_status | service_service_id | service_service_type | service_provider_name |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | 29 | Active | 1996925 | Counseling | Primary Initiative A |
| 1001 | Account Name | 33 | Suspended | 3990164 | Welfare Coordination | Composite Model |
| 1002 | Saipan International Airport | 37 | Expelled | 5844258 | Conflict Resolution | Compact Cluster |
| 1003 | Norma Fisher | 41 | Graduated | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D |

This view answers: "What support services has a student received?" The join between `students` and `support_services` links each student to their assigned interventions. Student 1000 (Theodore Mcgrath) is assigned service 1996925 (Counseling, Primary Initiative A, Scheduled). Student 1001 (Account Name) is assigned service 3990164 (Welfare Coordination, Composite Model, In Progress). Student 1003 (Norma Fisher) is assigned service e29bafe2-8fd1-11eb-924d-9cd76263cbd0 (Bystander Training, Legacy Review D, Cancelled).

## Staff-Centric Views

**View `vw_staff_member_bullying_incident`**

```sql
CREATE VIEW vw_staff_member_bullying_incident AS
SELECT a.id, a.staff_id, a.full_name, a.role, b.bullying_incident_id AS incident_bullying_incident_id, b.incident_id AS incident_incident_id, b.date_reported AS incident_date_reported
FROM staff_members a JOIN bullying_incidents b ON a.bullying_incident_id = b.bullying_incident_id;
```

| id | staff_id | full_name | role | incident_bullying_incident_id | incident_incident_id | incident_date_reported |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Teacher | 1 | 1336174 | 2023-06-04T17:39:00 |
| 2 | 3158139 | Account Name | Principal | 2 | state_uk_4 | 2024-11-15T00:56:00 |
| 3 | 8189502 | Saipan International Airport | Welfare Officer | 3 | 2933483 | 2025-04-26T07:13:00 |
| 4 | 69438 | Norma Fisher | Counsellor | 4 | 2986243 | 2022-09-10T14:30:00 |

This view answers: "Which bullying incidents is a staff member managing?" The join between `staff_members` and `bullying_incidents` surfaces the incidents assigned to each staff member. Staff member 1 (Theodore Mcgrath, Teacher, Active, cybersafety_trained = true) manages incident 1 (Less Serious, Physical Harm). Staff member 4 (Norma Fisher, Counsellor, Active, cybersafety_trained = false) manages incident 4 (Less Serious, Cyberbullying, Escalated to Police).

**View `vw_staff_member_student`**

```sql
CREATE VIEW vw_staff_member_student AS
SELECT a.id, a.staff_id, a.full_name, a.role, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM staff_members a JOIN students b ON a.student_id = b.student_id;
```

| id | staff_id | full_name | role | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Teacher | 1000 | Theodore Mcgrath | 29 |
| 2 | 3158139 | Account Name | Principal | 1001 | Account Name | 33 |
| 3 | 8189502 | Saipan International Airport | Welfare Officer | 1002 | Saipan International Airport | 37 |
| 4 | 69438 | Norma Fisher | Counsellor | 1003 | Norma Fisher | 41 |

This view answers: "Which students is a staff member responsible for or associated with?" The join between `staff_members` and `students` reveals the student-staff relationship. Staff member 1 (Theodore Mcgrath, Teacher) is associated with student 1000 (Theodore Mcgrath). Staff member 3 (Saipan International Airport, Welfare Officer, Terminated) is associated with student 1002 (Saipan International Airport).

## Parent-Centric Views

**View `vw_parent_student_detail`**

```sql
CREATE VIEW vw_parent_student_detail AS
SELECT a.id, a.parent_id, a.full_name, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM parents a
  JOIN parents_students j ON j.parent_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | parent_id | full_name | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 1 | 4793462 | Theodore Mcgrath | 1000 | Theodore Mcgrath | 29 |
| 1 | 4793462 | Theodore Mcgrath | 1001 | Account Name | 33 |
| 2 | gd_acc_120000 | Account Name | 1001 | Account Name | 33 |
| 2 | gd_acc_120000 | Account Name | 1002 | Saipan International Airport | 37 |
| 3 | 9568439 | Saipan International Airport | 1002 | Saipan International Airport | 37 |
| 3 | 9568439 | Saipan International Airport | 1003 | Norma Fisher | 41 |
| 4 | BJBBB | Norma Fisher | 1003 | Norma Fisher | 41 |
| 4 | BJBBB | Norma Fisher | 1000 | Theodore Mcgrath | 29 |

This view answers: "Which student(s) is a parent responsible for?" The join between `parents` and `students` surfaces the parent-student linkage with full contact and relationship details. Parent 1 (Theodore Mcgrath, Mother) is linked to student 1000 (Theodore Mcgrath, Active, grade level 29). Parent 3 (Saipan International Airport, Guardian) is linked to student 1002 (Saipan International Airport, Expelled, grade level 37).

**View `vw_parent_bullying_incident`**

```sql
CREATE VIEW vw_parent_bullying_incident AS
SELECT a.id, a.parent_id, a.full_name, a.contact_number, b.bullying_incident_id AS incident_bullying_incident_id, b.incident_id AS incident_incident_id, b.date_reported AS incident_date_reported
FROM parents a JOIN bullying_incidents b ON a.bullying_incident_id = b.bullying_incident_id;
```

| id | parent_id | full_name | contact_number | incident_bullying_incident_id | incident_incident_id | incident_date_reported |
|---|---|---|---|---|---|---|
| 1 | 4793462 | Theodore Mcgrath | Peter Mcdowell | 1 | 1336174 | 2023-06-04T17:39:00 |
| 2 | gd_acc_120000 | Account Name | Sophia Meyer | 2 | state_uk_4 | 2024-11-15T00:56:00 |
| 3 | 9568439 | Saipan International Airport | Carol Gaines | 3 | 2933483 | 2025-04-26T07:13:00 |
| 4 | BJBBB | Norma Fisher | April Snyder | 4 | 2986243 | 2022-09-10T14:30:00 |

This view answers: "Which bullying incidents involve a specific parent's child?" The join between `parents` and `bullying_incidents` connects parents to the incidents affecting their children. Parent 1 (Theodore Mcgrath, Mother) is connected to incident 1 (Less Serious, Physical Harm, Reported). Parent 4 (Norma Fisher, Other) is connected to incident 4 (Less Serious, Cyberbullying, Escalated to Police).

## Support Service Views

**View `vw_support_service_student_detail`**

```sql
CREATE VIEW vw_support_service_student_detail AS
SELECT a.service_id, a.service_type, a.provider_name, b.student_id AS student_student_id, b.full_name AS student_full_name, b.grade_level AS student_grade_level
FROM support_services a
  JOIN services_students j ON j.service_id = a.service_id
  JOIN students b ON b.student_id = j.student_id;
```

| service_id | service_type | provider_name | student_student_id | student_full_name | student_grade_level |
|---|---|---|---|---|---|
| 1996925 | Counseling | Primary Initiative A | 1000 | Theodore Mcgrath | 29 |
| 1996925 | Counseling | Primary Initiative A | 1001 | Account Name | 33 |
| 3990164 | Welfare Coordination | Composite Model | 1001 | Account Name | 33 |
| 3990164 | Welfare Coordination | Composite Model | 1002 | Saipan International Airport | 37 |
| 5844258 | Conflict Resolution | Compact Cluster | 1002 | Saipan International Airport | 37 |
| 5844258 | Conflict Resolution | Compact Cluster | 1003 | Norma Fisher | 41 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 1003 | Norma Fisher | 41 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 1000 | Theodore Mcgrath | 29 |

This view answers: "Which students are receiving a specific support service?" The join between `support_services` and `students` reveals the student recipients of each intervention. Service 1996925 (Counseling, Primary Initiative A, Scheduled) is provided to student 1000 (Theodore Mcgrath, Active). Service 3990164 (Welfare Coordination, Composite Model, In Progress) is provided to student 1001 (Account Name, Suspended).

**View `vw_support_service_staff_member`**

```sql
CREATE VIEW vw_support_service_staff_member AS
SELECT a.service_id, a.service_type, a.provider_name, a.start_date, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM support_services a JOIN staff_members b ON a.staff_member_id = b.id;
```

| service_id | service_type | provider_name | start_date | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 1996925 | Counseling | Primary Initiative A | 2022-09-05 | 1 | 937735 | Theodore Mcgrath |
| 3990164 | Welfare Coordination | Composite Model | 2023-02-16 | 2 | 3158139 | Account Name |
| 5844258 | Conflict Resolution | Compact Cluster | 2024-07-27 | 3 | 8189502 | Saipan International Airport |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 2025-12-11 | 4 | 69438 | Norma Fisher |

This view answers: "Which staff member is delivering a specific support service?" The join between `support_services` and `staff_members` surfaces the staff-service relationship. Service 1996925 (Counseling) is delivered by staff member 1 (Theodore Mcgrath, Teacher, Active, cybersafety_trained = true). Service 3990164 (Welfare Coordination) is delivered by staff member 2 (Account Name, Principal, On Leave, cybersafety_trained = false).

**View `vw_support_service_bullying_incident`**

```sql
CREATE VIEW vw_support_service_bullying_incident AS
SELECT a.service_id, a.service_type, a.provider_name, a.start_date, b.bullying_incident_id AS incident_bullying_incident_id, b.incident_id AS incident_incident_id, b.date_reported AS incident_date_reported
FROM support_services a JOIN bullying_incidents b ON a.bullying_incident_id = b.bullying_incident_id;
```

| service_id | service_type | provider_name | start_date | incident_bullying_incident_id | incident_incident_id | incident_date_reported |
|---|---|---|---|---|---|---|
| 1996925 | Counseling | Primary Initiative A | 2022-09-05 | 1 | 1336174 | 2023-06-04T17:39:00 |
| 3990164 | Welfare Coordination | Composite Model | 2023-02-16 | 2 | state_uk_4 | 2024-11-15T00:56:00 |
| 5844258 | Conflict Resolution | Compact Cluster | 2024-07-27 | 3 | 2933483 | 2025-04-26T07:13:00 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 2025-12-11 | 4 | 2986243 | 2022-09-10T14:30:00 |

This view answers: "Which bullying incident prompted a specific support service?" The join between `support_services` and `bullying_incidents` links services back to their originating incidents. Service 1996925 (Counseling) was triggered by incident 1 (Less Serious, Physical Harm, Reported). Service 5844258 (Conflict Resolution, Compact Cluster, Completed) was triggered by incident 3 (Repetitive, Verbal Insults, Resolved).

## External Authority Views

**View `vw_external_authority_bullying_incident`**

```sql
CREATE VIEW vw_external_authority_bullying_incident AS
SELECT a.authority_id, a.authority_name, a.contact_person, a.contact_number, b.bullying_incident_id AS incident_bullying_incident_id, b.incident_id AS incident_incident_id, b.date_reported AS incident_date_reported
FROM external_authorities a JOIN bullying_incidents b ON a.bullying_incident_id = b.bullying_incident_id;
```

| authority_id | authority_name | contact_person | contact_number | incident_bullying_incident_id | incident_incident_id | incident_date_reported |
|---|---|---|---|---|---|---|
| 974930 | Sean Green | Alyssa Chung | Peter Mcdowell | 1 | 1336174 | 2023-06-04T17:39:00 |
| 5917289 | Elizabeth Woods | Brianna Mejia | Sophia Meyer | 2 | state_uk_4 | 2024-11-15T00:56:00 |
| 8843762 | Kimberly Smith | Eric Schultz | Carol Gaines | 3 | 2933483 | 2025-04-26T07:13:00 |
| 2087738 | Kimberly Smith | Peter Montgomery | April Snyder | 4 | 2986243 | 2022-09-10T14:30:00 |

This view answers: "Which bullying incident is an external authority handling?" The join between `external_authorities` and `bullying_incidents` connects authorities to their assigned cases. Authority 974930 (Sean Green, Police) is handling incident 1 (Less Serious, Physical Harm, Reported). Authority 5917289 (Elizabeth Woods, Student Critical Incident Advisory Unit) is handling incident 2 (Serious, Harassment, Under Investigation).

**View `vw_external_authority_staff_member`**

```sql
CREATE VIEW vw_external_authority_staff_member AS
SELECT a.authority_id, a.authority_name, a.contact_person, a.contact_number, b.id AS member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM external_authorities a JOIN staff_members b ON a.staff_member_id = b.id;
```

| authority_id | authority_name | contact_person | contact_number | member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 974930 | Sean Green | Alyssa Chung | Peter Mcdowell | 1 | 937735 | Theodore Mcgrath |
| 5917289 | Elizabeth Woods | Brianna Mejia | Sophia Meyer | 2 | 3158139 | Account Name |
| 8843762 | Kimberly Smith | Eric Schultz | Carol Gaines | 3 | 8189502 | Saipan International Airport |
| 2087738 | Kimberly Smith | Peter Montgomery | April Snyder | 4 | 69438 | Norma Fisher |

This view answers: "Which staff member is coordinating with a specific external authority?" The join between `external_authorities` and `staff_members` surfaces the internal-external coordination link. Authority 974930 (Sean Green, Police) is coordinated by staff member 1 (Theodore Mcgrath, Teacher). Authority 8843762 (Kimberly Smith, Emergency and Security Management Unit) is coordinated by staff member 3 (Saipan International Airport, Welfare Officer, Terminated).

## Synthesis

The data architecture described here supports a complete lifecycle of bullying incident management — from initial reporting through investigation, intervention, and external coordination. The six base tables capture the essential entities: incidents, students, staff, parents, services, and authorities. The four junction tables resolve the many-to-many relationships that naturally arise when a single incident involves multiple students, when a student has multiple guardians, or when a service is delivered to multiple students. The twenty views provide targeted lenses into the data, each answering a specific operational question that a school administrator, counselor, or compliance officer might need to address. Together, they form a coherent record-keeping system that ensures every bullying incident is documented, assigned, investigated, and followed up with appropriate support and, when necessary, external engagement.

## Data appendix

**Table `incidents_students`**

| bullying_incident_id | student_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `students_parents`**

| student_id | parent_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `parents_students`**

| parent_id | student_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `services_students`**

| service_id | student_id |
|---|---|
| 1996925 | 1000 |
| 1996925 | 1001 |
| 3990164 | 1001 |
| 3990164 | 1002 |
| 5844258 | 1002 |
| 5844258 | 1003 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1003 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 1000 |
