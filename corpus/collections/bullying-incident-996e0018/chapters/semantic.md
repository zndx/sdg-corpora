The school safeguarding ecosystem revolves around a single operational event: a bullying incident. Every record in the database exists to answer one question—what happened, who was involved, what response was triggered, and which external bodies were notified. The domain model captures students, staff members, parents, support services, and external authorities as first-class entity types, each with its own attribute set, and ties them together through foreign-key relationships and junction tables that encode many-to-many participation. The materialized relational schema normalizes these entities into six base tables and four junction tables, while a suite of twenty-four views reconstructs the domain facts by joining the normalized tables back together.

## Entity Types and Their Attributes

The core of the model is the `bullying_incidents` table, which anchors every fact in the system. Each row represents a single reported incident and carries a surrogate primary key `bullying_incident_id` alongside a business-level `incident_id` that may originate from an external reporting system. The `date_reported` column timestamps the event; the `severity_level` column classifies it as `Less Serious`, `Serious`, `Repetitive`, or similar; `incident_type` distinguishes `Physical Harm`, `Harassment`, `Verbal Insults`, and `Cyberbullying`; `status` tracks the lifecycle from `Reported` through `Under Investigation` and `Escalated to Police` to `Resolved`; `location` and `description` provide contextual metadata. A row such as `bullying_incident_id = 1` with `incident_id = 1336174`, `severity_level = Less Serious`, `incident_type = Physical Harm`, `status = Reported`, and `location = extended-location-99` illustrates the full attribute set.

**Table `bullying_incidents`**

| bullying_incident_id | incident_id | date_reported | severity_level | incident_type | status | location | description | staff_member_id | authority_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | 2023-06-04T17:39:00 | Less Serious | Physical Harm | Reported | extended-location-99 | Extended Survey | 1 | 974930 |
| 2 | state_uk_4 | 2024-11-15T00:56:00 | Serious | Harassment | Under Investigation | integrated-location-100 | Pilot Corridor A | 2 | 5917289 |
| 3 | 2933483 | 2025-04-26T07:13:00 | Repetitive | Verbal Insults | Resolved | seasonal-location-101 | Baseline Series | 3 | 8843762 |
| 4 | 2986243 | 2022-09-10T14:30:00 | Less Serious | Cyberbullying | Escalated to Police | regional-location-102 | Distributed Assessment | 4 | 2087738 |

Students are captured in the `students` table, keyed by `student_id`. Each student record stores `full_name` (e.g., `Theodore Mcgrath`), `grade_level` (an integer such as `29`), `enrollment_status` (`Active`, `Suspended`, `Expelled`, `Graduated`), `date_of_birth`, a `guardian_contact_id` referencing a parent, a `bullying_incident_id` linking the student to a specific incident, a `service_id` pointing to a support service, and audit timestamps `created_at` and `updated_at`. The column `involved_in_incident_as_perpetrator_bullying_incident_id` is a self-referencing foreign key that allows a student to be flagged as a perpetrator in a separate incident from the one they are a victim in.

**Table `students`**

| student_id | full_name | grade_level | enrollment_status | date_of_birth | guardian_contact_id | bullying_incident_id | involved_in_incident_as_perpetrator_bullying_incident_id | service_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | 29 | Active | 2025-04-02 | Karen Keller | 1 | 1 | 1996925 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Account Name | 33 | Suspended | 2022-09-13 | Stephanie Lawrence | 2 | 2 | 3990164 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Saipan International Airport | 37 | Expelled | 2023-02-24 | Walter Pratt | 3 | 3 | 5844258 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Norma Fisher | 41 | Graduated | 2024-07-08 | Julian Brown | 4 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Staff members occupy the `staff_members` table, which uses a dual-key scheme: a surrogate `id` and a business `staff_id`. Attributes include `full_name`, `role` (`Teacher`, `Principal`, `Welfare Officer`, `Counsellor`), `employment_status` (`Active`, `On Leave`, `Terminated`), `department` (e.g., `adaptive-departme-89`), a boolean `cybersafety_trained`, and foreign keys `bullying_incident_id` and `student_id` that tie the staff member to a specific incident and a specific student, respectively.

**Table `staff_members`**

| id | staff_id | full_name | role | employment_status | department | cybersafety_trained | bullying_incident_id | student_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Teacher | Active | adaptive-departme-89 | true | 1 | 1000 |
| 2 | 3158139 | Account Name | Principal | On Leave | distributed-departme-90 | false | 2 | 1001 |
| 3 | 8189502 | Saipan International Airport | Welfare Officer | Terminated | baseline-departme-91 | true | 3 | 1002 |
| 4 | 69438 | Norma Fisher | Counsellor | Active | pilot-departme-92 | false | 4 | 1003 |

Parents are stored in the `parents` table with surrogate `id` and business `parent_id` keys. The `full_name` column holds the parent's name, `contact_number` and `email_address` provide reachability, `relationship_to_student` records whether the parent is a `Mother`, `Father`, `Guardian`, or `Other`, and two foreign-key columns—`bullying_incident_id` and `participates_in_conciliation_bullying_incident_id`—link the parent to incidents, the latter specifically indicating involvement in a conciliation process.

**Table `parents`**

| id | parent_id | full_name | contact_number | email_address | relationship_to_student | bullying_incident_id | participates_in_conciliation_bullying_incident_id |
|---|---|---|---|---|---|---|---|
| 1 | 4793462 | Theodore Mcgrath | Peter Mcdowell | primary-email-70 | Mother | 1 | 1 |
| 2 | gd_acc_120000 | Account Name | Sophia Meyer | adaptive-email-71 | Father | 2 | 2 |
| 3 | 9568439 | Saipan International Airport | Carol Gaines | distributed-email-72 | Guardian | 3 | 3 |
| 4 | BJBBB | Norma Fisher | April Snyder | baseline-email-73 | Other | 4 | 4 |

Support services are modeled in `support_services`, keyed by `service_id`. Each row describes a `service_type` (`Counseling`, `Welfare Coordination`, `Conflict Resolution`, `Bystander Training`), a `provider_name` (e.g., `Primary Initiative A`, `Composite Model`), a `start_date` and `end_date`, a `status` (`Scheduled`, `In Progress`, `Completed`, `Cancelled`), and foreign keys `staff_member_id` and `bullying_incident_id` that assign a staff member to deliver the service in the context of a particular incident.

**Table `support_services`**

| service_id | service_type | provider_name | start_date | end_date | status | staff_member_id | bullying_incident_id |
|---|---|---|---|---|---|---|---|
| 1996925 | Counseling | Primary Initiative A | 2022-09-05 | 2022-09-01 | Scheduled | 1 | 1 |
| 3990164 | Welfare Coordination | Composite Model | 2023-02-16 | 2023-02-12 | In Progress | 2 | 2 |
| 5844258 | Conflict Resolution | Compact Cluster | 2024-07-27 | 2024-07-23 | Completed | 3 | 3 |
| e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Bystander Training | Legacy Review D | 2025-12-11 | 2025-12-07 | Cancelled | 4 | 4 |

External authorities are captured in `external_authorities`, keyed by `authority_id`. Columns include `authority_name` (e.g., `Sean Green`, `Elizabeth Woods`), `contact_person`, `contact_number`, `authority_type` (`Police`, `Student Critical Incident Advisory Unit`, `Emergency and Security Management Unit`), and foreign keys `bullying_incident_id` and `staff_member_id` that associate the authority with a specific incident and the staff member who made the referral.

**Table `external_authorities`**

| authority_id | authority_name | contact_person | contact_number | authority_type | bullying_incident_id | staff_member_id |
|---|---|---|---|---|---|---|
| 974930 | Sean Green | Alyssa Chung | Peter Mcdowell | Police | 1 | 1 |
| 5917289 | Elizabeth Woods | Brianna Mejia | Sophia Meyer | Student Critical Incident Advisory Unit | 2 | 2 |
| 8843762 | Kimberly Smith | Eric Schultz | Carol Gaines | Emergency and Security Management Unit | 3 | 3 |
| 2087738 | Kimberly Smith | Peter Montgomery | April Snyder | Police | 4 | 4 |

## Cardinality-Bounded Relationships and Junction Tables

Not all relationships in this domain are one-to-many. A single bullying incident can involve multiple students, and a single student can be involved in multiple incidents. Similarly, a parent may have multiple children enrolled in the school, and a support service may be delivered to multiple students. These many-to-many relationships are resolved through junction tables, each of which carries a composite foreign key pair that enforces referential integrity on both sides.

The `incidents_students` junction table links `bullying_incidents` to `students`. Each row contains an `incident_id` and a `student_id`, forming a many-to-many bridge that allows the system to record that student `1000` (Theodore Mcgrath) participated in incident `1336174` without duplicating incident or student data.

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

The `students_parents` junction table connects `students` to `parents`. A row with `student_id = 1000` and `parent_id = 4793462` (Theodore Mcgrath's parent) indicates that Karen Keller is a guardian of Theodore Mcgrath. This table supports the realistic scenario where a student has multiple parents or guardians on file.

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

The `parents_students` junction table is the inverse of `students_parents`, providing the same many-to-many linkage from the parent's perspective. Each row pairs a `parent_id` with a `student_id`, enabling queries that start from a parent and enumerate all their enrolled children.

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

The `services_students` junction table links `support_services` to `students`. A row associating `service_id = 1996925` (Counseling, provider `Primary Initiative A`) with `student_id = 1000` records that Theodore Mcgrath received counseling services. This table allows a single service engagement to be shared across multiple students and a single student to receive multiple services.

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

## Foreign-Key Chains and Normalization

The relational schema achieves third normal form by ensuring that each non-key attribute depends only on the primary key of its table. The `bullying_incidents` table holds no repeating groups: severity, type, status, and location are atomic values. Foreign keys in `students`, `staff_members`, `parents`, `support_services`, and `external_authorities` reference the primary keys of the incident table, creating a star-like dependency where every entity type can be traced back to the incident that triggered it.

The `staff_members` table's `bullying_incident_id` column is a foreign key into `bullying_incidents.bullying_incident_id`, meaning each staff member record is associated with exactly one incident. Similarly, `students.bullying_incident_id` references the same column, and `support_services.bullying_incident_id` does the same. The `external_authorities.bullying_incident_id` column completes this pattern: every authority engagement is tied to a specific incident.

The `support_services` table's `staff_member_id` column references `staff_members.id`, creating a chain: a service is delivered by a staff member, who is assigned to an incident. The `external_authorities` table's `staff_member_id` column similarly references `staff_members.id`, allowing the system to record which staff member made the external referral.

## View-Based Reconstruction of Domain Facts

The normalized tables store facts in isolation; the views reassemble them into domain-meaningful records. Each view performs a join across two or more base tables to answer a specific question about the relationship between entity types.

The view `vw_bullying_incident_student_detail` joins `bullying_incidents` to `students` on `bullying_incident_id`, producing a row that answers "which student was involved in which incident, and what were the incident's details?" A row from this view might show `bullying_incident_id = 1`, `incident_id = 1336174`, `student_id = 1000`, `full_name = Theodore Mcgrath`, `severity_level = Less Serious`, and `enrollment_status = Active`. This view is the primary lens through which a school administrator reviews incident-student pairings.

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

The view `vw_bullying_incident_staff_member` joins `bullying_incidents` to `staff_members` on `bullying_incident_id`, answering "which staff member was assigned to which incident?" A row might display `bullying_incident_id = 1`, `incident_id = 1336174`, `staff_id = 937735`, `full_name = Theodore Mcgrath`, `role = Teacher`, and `cybersafety_trained = true`. This view supports staffing audits and training compliance checks.

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

The view `vw_bullying_incident_external_authority` joins `bullying_incidents` to `external_authorities` on `bullying_incident_id`, answering "which external authority was notified for which incident?" A row might show `bullying_incident_id = 1`, `incident_id = 1336174`, `authority_id = 974930`, `authority_name = Sean Green`, `authority_type = Police`, and `contact_person = Alyssa Chung`. This view is essential for regulatory reporting and tracking external engagement patterns.

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

The view `vw_student_parent_detail` joins `students` to `parents` through the `students_parents` junction table, answering "which parent is associated with which student?" A row might display `student_id = 1000`, `full_name = Theodore Mcgrath`, `parent_id = 4793462`, `parent_full_name = Theodore Mcgrath`, `relationship_to_student = Mother`, and `email_address = primary-email-70`. This view supports parent communication workflows and guardian verification.

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

The view `vw_student_bullying_incident` joins `students` to `bullying_incidents` on `bullying_incident_id`, answering "which incidents has this student been involved in?" A row might show `student_id = 1000`, `full_name = Theodore Mcgrath`, `bullying_incident_id = 1`, `incident_id = 1336174`, `incident_type = Physical Harm`, and `status = Reported`. This view enables a student-centric incident history.

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

The view `vw_student_support_service` joins `students` to `support_services` through the `services_students` junction table, answering "which support services has this student received?" A row might display `student_id = 1000`, `full_name = Theodore Mcgrath`, `service_id = 1996925`, `service_type = Counseling`, `provider_name = Primary Initiative A`, and `status = Scheduled`. This view supports service utilization tracking and intervention effectiveness analysis.

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

The view `vw_staff_member_bullying_incident` joins `staff_members` to `bullying_incidents` on `bullying_incident_id`, answering "which incidents has this staff member been involved in?" A row might show `staff_id = 937735`, `full_name = Theodore Mcgrath`, `role = Teacher`, `bullying_incident_id = 1`, `incident_id = 1336174`, and `incident_type = Physical Harm`. This view supports workload distribution and incident response accountability.

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

The view `vw_staff_member_student` joins `staff_members` to `students` on `student_id`, answering "which students is this staff member responsible for or assigned to?" A row might display `staff_id = 937735`, `full_name = Theodore Mcgrath`, `role = Teacher`, `student_id = 1000`, `student_full_name = Theodore Mcgrath`, and `enrollment_status = Active`. This view supports pastoral care mapping and departmental rosters.

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

The view `vw_parent_student_detail` joins `parents` to `students` through the `parents_students` junction table, answering "which students does this parent have enrolled?" A row might show `parent_id = 4793462`, `parent_full_name = Theodore Mcgrath`, `student_id = 1000`, `student_full_name = Theodore Mcgrath`, `grade_level = 29`, and `relationship_to_student = Mother`. This view is the parent-facing counterpart to `vw_student_parent_detail`.

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

The view `vw_parent_bullying_incident` joins `parents` to `bullying_incidents` on `bullying_incident_id`, answering "which incidents involve this parent's child?" A row might display `parent_id = 4793462`, `parent_full_name = Theodore Mcgrath`, `bullying_incident_id = 1`, `incident_id = 1336174`, `incident_type = Physical Harm`, and `participates_in_conciliation_bullying_incident_id = 1`. This view supports parent notification workflows and conciliation tracking.

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

The view `vw_support_service_student_detail` joins `support_services` to `students` through the `services_students` junction table, answering "which students are receiving this support service?" A row might show `service_id = 1996925`, `service_type = Counseling`, `provider_name = Primary Initiative A`, `student_id = 1000`, `student_full_name = Theodore Mcgrath`, and `enrollment_status = Active`. This view supports service capacity planning and student outcome tracking.

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

The view `vw_support_service_staff_member` joins `support_services` to `staff_members` on `staff_member_id`, answering "which staff member is delivering this support service?" A row might display `service_id = 1996925`, `service_type = Counseling`, `staff_id = 937735`, `staff_full_name = Theodore Mcgrath`, `role = Teacher`, and `cybersafety_trained = true`. This view supports staff workload management and service delivery accountability.

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

The view `vw_support_service_bullying_incident` joins `support_services` to `bullying_incidents` on `bullying_incident_id`, answering "which support services were triggered by which incidents?" A row might show `service_id = 1996925`, `service_type = Counseling`, `bullying_incident_id = 1`, `incident_id = 1336174`, `incident_type = Physical Harm`, and `status = Reported`. This view supports intervention effectiveness analysis by linking service delivery to incident characteristics.

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

The view `vw_external_authority_bullying_incident` joins `external_authorities` to `bullying_incidents` on `bullying_incident_id`, answering "which external authorities were engaged for which incidents?" A row might display `authority_id = 974930`, `authority_name = Sean Green`, `authority_type = Police`, `bullying_incident_id = 1`, `incident_id = 1336174`, and `incident_type = Physical Harm`. This view supports regulatory compliance reporting and external engagement analytics.

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

The view `vw_external_authority_staff_member` joins `external_authorities` to `staff_members` on `staff_member_id`, answering "which staff member made the external authority referral?" A row might show `authority_id = 974930`, `authority_name = Sean Green`, `staff_id = 937735`, `staff_full_name = Theodore Mcgrath`, `role = Teacher`, and `department = adaptive-departme-89`. This view supports referral accountability and staff training evaluation.

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

## Closing Synthesis

The relational schema for the school safeguarding domain achieves normalization by separating students, staff, parents, services, and authorities into distinct tables, each keyed by its own identifier and enriched with domain-specific attributes. Foreign keys in `students`, `staff_members`, `parents`, `support_services`, and `external_authorities` all reference `bullying_incidents`, creating a star topology where every entity type is anchored to the incident that triggered its creation. Many-to-many relationships—incident-student participation, student-parent guardianship, and service-student enrollment—are resolved through the junction tables `incidents_students`, `students_parents`, `parents_students`, and `services_students`, each carrying a composite foreign key pair that preserves referential integrity without data duplication. The twenty-four views then reconstruct the domain facts by joining these normalized tables, each view answering a specific operational question: which student was in which incident, which staff member handled which incident, which parent is associated with which student, which service was delivered to which student, and which external authority was notified for which incident. The result is a schema that is both normalized for update consistency and richly joinable for analytical reporting, with every row value—from `incident_id = 1336174` to `service_type = Counseling`—traceable to a single source of truth.