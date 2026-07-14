## The Student Conduct Management Domain

The student conduct management domain captures the lifecycle of behavioral accountability within an academic institution. At its core, the system tracks students who are subject to formal conduct documents, interim disciplinary measures, no-contact directives, and extracurricular activities — each governed by institutional policies and overseen by designated staff. The relational model normalizes these concepts into distinct entity tables, connects them through junction tables that enforce many-to-many cardinality, and materializes domain facts as views that join the normalized pieces back together for reporting.

**Table `students`**

| student_id | first_name | last_name | email_address | enrollment_status | enrollment_year | code_of_conduct_id | interim_suspension_id | no_contact_directive_id | student_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | active | 12 | 1 | 1 | 1000 | 1 |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | suspended | 16 | 2 | 2 | 1001 | 2 |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | terminated | 20 | 3 | 3 | 1002 | 3 |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | graduated | 24 | 4 | 4 | 1003 | 4 |

The `students` table anchors the entire schema. Each row represents a student identified by a surrogate `student_id` — values range from simple integers like `392507` (Stephanie Collins) to UUIDs such as `gd_taxc_2211` (Katherine Snyder). The columns `first_name` and `last_name` store the student's given and family names, while `email_address` holds a contact address (e.g., `primary-email-70`). The `enrollment_status` column classifies the student as `active`, `suspended`, `terminated`, or `graduated`, and `enrollment_year` records the year of matriculation (values `12`, `16`, `20`, `24`). Critically, `students` also carries four denormalized foreign-key columns — `code_of_conduct_id`, `interim_suspension_id`, `no_contact_directive_id`, and `student_activity_id` — that point directly into the corresponding entity tables. These columns provide a convenient denormalized shortcut, but the canonical many-to-many relationships are expressed through dedicated junction tables described later.

**Table `code_of_conducts`**

| id | document_id | title | effective_date | version_number | approval_date | issuing_body | interim_suspension_id | no_contact_directive_id | student_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 2023-02-14 | VER-2245 | 2023-10-10 | baseline-issuing-13 | 1 | 1000 | 1 |
| 2 | 605943 | Legacy Model | 2024-07-25 | VER-2249 | 2024-03-21 | pilot-issuing-14 | 2 | 1001 | 2 |
| 3 | 10449525 | Regional Cluster A | 2025-12-09 | VER-2253 | 2025-08-05 | extended-issuing-15 | 3 | 1002 | 3 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2022-05-20 | VER-2257 | 2022-01-16 | integrated-issuing-16 | 4 | 1003 | 4 |

The `code_of_conducts` table stores the formal policy documents that govern student behavior. Each conduct document has a surrogate `id`, a human-readable `document_id` (such as `IVC10I` or the UUID `5f93a090-8fcd-11eb-924d-9cd76263cbd0`), a `title` like "Compact Initiative" or "Seasonal Review", an `effective_date`, a `version_number` (e.g., `VER-2245`), an `approval_date`, and an `issuing_body` (e.g., `baseline-issuing-13`). The table also carries `interim_suspension_id`, `no_contact_directive_id`, and `student_activity_id` columns that link the conduct document to the specific disciplinary and activity records it governs. A single conduct document can thus be associated with one suspension, one directive, and one activity, forming a tight policy cluster.

**Table `interim_suspensions`**

| id | suspension_id | imposition_date | hearing_date | issuing_authority | reason | status | student_id | hearing_id | dean_of_students_staff_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 | 2025-04-02T15:33:00 | extended-issuing-33 | distributed-reason-66 | active | 392507 | 1 | 100 |
| 2 | 937730 | 2025-04-10T17:59:00 | 2022-09-13T22:50:00 | integrated-issuing-34 | baseline-reason-67 | resolved | 25388256 | 2 | 101 |
| 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 | 2023-02-24T05:07:00 | seasonal-issuing-35 | pilot-reason-68 | overturned | id_16 | 3 | 102 |
| 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 | 2024-07-08T12:24:00 | regional-issuing-36 | extended-reason-69 | active | gd_taxc_2211 | 4 | 103 |

Interim suspensions represent temporary removal of a student from campus pending a formal hearing. The `interim_suspensions` table records each suspension with a surrogate `id`, a business `suspension_id` (often a UUID such as `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`), an `imposition_date`, a `hearing_date`, an `issuing_authority` (e.g., `extended-issuing-33`), a `reason` (e.g., `distributed-reason-66`), a `status` (`active`, `resolved`, `overturned`), and foreign keys to `student_id`, `hearing_id`, and `dean_of_students_staff_id`. The suspension at `id` 1, for instance, was imposed on 2024-11-26 with a hearing scheduled for 2025-04-02, remains `active`, and is linked to student `392507`.

**Table `no_contact_directives`**

| id | directive_id | issue_date | issuing_office | contact_type | status | dean_of_students_staff_id |
|---|---|---|---|---|---|---|
| 1000 | 69431 | 2023-02-01T13:51:00 | integrated-issuing-46 | verbal | active | 100 |
| 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 | seasonal-issuing-47 | written | lifted | 101 |
| 1002 | 12388 | 2025-12-23T03:25:00 | regional-issuing-48 | third-party | expired | 102 |
| 1003 | 329 | 2022-05-07T10:42:00 | legacy-issuing-49 | all | active | 103 |

No-contact directives prohibit a student from contacting another individual. The `no_contact_directives` table stores each directive with a surrogate `id`, a business `directive_id` (e.g., `69431`), an `issue_date`, an `issuing_office` (e.g., `integrated-issuing-46`), a `contact_type` (`verbal`, `written`, `third-party`, `all`), a `status` (`active`, `lifted`, `expired`), and a `dean_of_students_staff_id` pointing to the overseeing staff member. Directive `1000` was issued on 2023-02-01 with `verbal` contact type and remains `active`.

**Table `student_activities`**

| id | activity_id | activity_name | category | status | governing_policy | code_of_conduct_id | dean_of_students_staff_id |
|---|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | residential | active | baseline-governin-67 | 1 | 100 |
| 2 | 4180957 | Compact Standard A | greek | terminated | pilot-governin-68 | 2 | 101 |
| 3 | 168545 | Legacy Framework | club | suspended | extended-governin-69 | 3 | 102 |
| 4 | default_chart_a_account_53 | Regional Protocol | other | active | integrated-governin-70 | 4 | 103 |

The `student_activities` table catalogs extracurricular and residential programs. Each row has a surrogate `id`, a business `activity_id`, an `activity_name` (e.g., "Composite Programme"), a `category` (`residential`, `greek`, `club`, `other`), a `status` (`active`, `terminated`, `suspended`), a `governing_policy` (e.g., `baseline-governin-67`), a `code_of_conduct_id`, and a `dean_of_students_staff_id`. Activity `1` ("Composite Programme") falls under the `residential` category, is `active`, and is governed by policy `baseline-governin-67`.

**Table `hearings`**

| id | hearing_id | scheduled_date | status | outcome | interim_suspension_id | campus_hearing_board_id |
|---|---|---|---|---|---|---|
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | scheduled | legacy-outcome-85 | 1 | 1 |
| 2 | 2106694 | 2025-04-11T05:35:00 | completed | compact-outcome-86 | 2 | 2 |
| 3 | 5917272 | 2022-09-22T12:52:00 | cancelled | composite-outcome-87 | 3 | 3 |
| 4 | 2106696 | 2023-02-06T19:09:00 | scheduled | primary-outcome-88 | 4 | 4 |

Hearings are formal proceedings convened to review interim suspensions. The `hearings` table records each hearing with a surrogate `id`, a business `hearing_id` (e.g., `account_pymes_255`), a `scheduled_date`, a `status` (`scheduled`, `completed`, `cancelled`), an `outcome` (e.g., `legacy-outcome-85`), an `interim_suspension_id`, and a `campus_hearing_board_id`. Hearing `1` was scheduled for 2024-11-27, has status `scheduled`, and is associated with suspension `1` and board `1`.

**Table `campus_hearing_boards`**

| campus_hearing_board_id | board_id | board_name | established_date |
|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-03-27 |
| 2 | 168553 | Legacy Assessment | 2025-08-11 |
| 3 | 5006454 | Regional Survey A | 2022-01-22 |
| 4 | 1437585 | Seasonal Corridor | 2023-06-06 |

Campus hearing boards are the panels that adjudicate hearings. Each board is identified by a surrogate key and a business identifier, and may carry descriptive attributes such as a name or designation. The board records are linked to hearings and students through junction tables.

**Table `dean_of_students_staffs`**

| id | staff_id | role_title | department |
|---|---|---|---|
| 100 | 937735 | Distributed Standard | adaptive-departme-89 |
| 101 | 3158139 | Adaptive Framework D | distributed-departme-90 |
| 102 | 8189502 | Primary Protocol | baseline-departme-91 |
| 103 | 69438 | Composite Programme | pilot-departme-92 |

The dean of students staff table stores the administrative personnel who oversee suspensions, directives, and activities. Each staff member has a surrogate key, a business identifier, and attributes such as name and role. Staff members are linked to disciplinary records through junction tables.

### Many-to-Many Relationships and Junction Tables

The domain's cardinality-bounded relationships are materialized as junction tables. Rather than embedding all foreign keys directly in the entity tables, the schema uses dedicated association tables to support many-to-many cardinality where a single conduct document, suspension, directive, or activity can be associated with multiple students, and vice versa.

**Table `conducts_students`**

| code_of_conduct_id | student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |

The `conducts_students` junction table links `code_of_conducts` to `students`. Each row represents a binding between a conduct document and a student, allowing a single policy to apply across many students and a student to be subject to multiple conduct documents over time.

**Table `directives_students`**

| no_contact_directive_id | student_id |
|---|---|
| 1000 | 392507 |
| 1000 | 25388256 |
| 1001 | 25388256 |
| 1001 | id_16 |
| 1002 | id_16 |
| 1002 | gd_taxc_2211 |
| 1003 | gd_taxc_2211 |
| 1003 | 392507 |

The `directives_students` table links `no_contact_directives` to `students`. A directive prohibiting contact can be enforced against multiple students, and a student can be subject to multiple directives simultaneously.

**Table `activities_students`**

| student_activity_id | student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |

The `activities_students` table links `student_activities` to `students`. A student may participate in multiple activities, and an activity may have multiple participants.

**Table `hearings_students`**

| hearing_id | student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |

The `hearings_students` table links `hearings` to `students`. A hearing may involve multiple students, and a student may be subject to multiple hearings across their enrollment.

**Table `boards_hearings`**

| campus_hearing_board_id | hearing_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `boards_hearings` junction table connects `campus_hearing_boards` to `hearings`. A hearing board may adjudicate multiple hearings, and a hearing may involve multiple board members or sub-panels.

**Table `boards_students`**

| campus_hearing_board_id | student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |

The `boards_students` table links `campus_hearing_boards` to `students`. This captures which students are associated with which hearing boards, potentially reflecting board membership or jurisdictional assignments.

**Table `staffs_suspensions`**

| dean_of_students_staff_id | interim_suspension_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `staffs_suspensions` table links `dean_of_students_staffs` to `interim_suspensions`. A staff member may oversee multiple suspensions, and a suspension may involve multiple staff members in its adjudication.

**Table `staffs_directives`**

| dean_of_students_staff_id | no_contact_directive_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `staffs_directives` table links `dean_of_students_staffs` to `no_contact_directives`. Staff members issue and monitor directives, and a directive may involve multiple overseeing staff.

**Table `staffs_activities`**

| dean_of_students_staff_id | student_activity_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `staffs_activities` table links `dean_of_students_staffs` to `student_activities`. Staff members supervise activities, and an activity may have multiple supervising staff members.

### Denormalized Views as Domain Facts

The views materialize the normalized schema into denormalized result sets that answer specific domain questions. Each view joins the relevant entity and junction tables to reconstruct a coherent fact from the normalized pieces.

**View `v_student_code_of_conduct`**

```sql
CREATE VIEW v_student_code_of_conduct AS
SELECT a.student_id, a.first_name, a.last_name, a.email_address, b.id AS conduct_id, b.document_id AS conduct_document_id, b.title AS conduct_title
FROM students a JOIN code_of_conducts b ON a.code_of_conduct_id = b.id;
```

| student_id | first_name | last_name | email_address | conduct_id | conduct_document_id | conduct_title |
|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | 1 | IVC10I | Compact Initiative |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | 2 | 605943 | Legacy Model |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | 3 | 10449525 | Regional Cluster A |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review |

The view `v_student_code_of_conduct` joins `students` with `code_of_conducts` to answer: "Which conduct document applies to which student?" A row from this view might show student `392507` (Stephanie Collins) linked to conduct document `1` ("Compact Initiative", document ID `IVC10I`, effective 2023-02-14). This view collapses the many-to-many relationship into a flat projection suitable for enrollment verification.

**View `v_student_interim_suspension`**

```sql
CREATE VIEW v_student_interim_suspension AS
SELECT a.student_id, a.first_name, a.last_name, a.email_address, b.id AS suspension_id, b.suspension_id AS suspension_suspension_id, b.imposition_date AS suspension_imposition_date
FROM students a JOIN interim_suspensions b ON a.interim_suspension_id = b.id;
```

| student_id | first_name | last_name | email_address | suspension_id | suspension_suspension_id | suspension_imposition_date |
|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | 2 | 937730 | 2025-04-10T17:59:00 |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 |

The view `v_student_interim_suspension` joins `students` with `interim_suspensions` to answer: "Which students are currently under interim suspension?" A row might show student `392507` linked to suspension `1` (suspension ID `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, imposed 2024-11-26, status `active`, hearing date 2025-04-02). This view is the primary query surface for the registrar's office tracking active disciplinary measures.

**View `v_student_no_contact_directive`**

```sql
CREATE VIEW v_student_no_contact_directive AS
SELECT a.student_id, a.first_name, a.last_name, a.email_address, b.id AS directive_id, b.directive_id AS directive_directive_id, b.issue_date AS directive_issue_date
FROM students a JOIN no_contact_directives b ON a.no_contact_directive_id = b.id;
```

| student_id | first_name | last_name | email_address | directive_id | directive_directive_id | directive_issue_date |
|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | 1000 | 69431 | 2023-02-01T13:51:00 |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | 1002 | 12388 | 2025-12-23T03:25:00 |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | 1003 | 329 | 2022-05-07T10:42:00 |

The view `v_student_no_contact_directive` joins `students` with `no_contact_directives` to answer: "Which students are subject to no-contact directives?" A row might show student `392507` linked to directive `1000` (directive ID `69431`, issued 2023-02-01, contact type `verbal`, status `active`). Campus security uses this view to enforce contact restrictions.

**View `v_student_student_activity`**

```sql
CREATE VIEW v_student_student_activity AS
SELECT a.student_id, a.first_name, a.last_name, a.email_address, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM students a JOIN student_activities b ON a.student_activity_id = b.id;
```

| student_id | first_name | last_name | email_address | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | 1 | 8843761 | Composite Programme |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | 2 | 4180957 | Compact Standard A |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | 3 | 168545 | Legacy Framework |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | 4 | default_chart_a_account_53 | Regional Protocol |

The view `v_student_student_activity` joins `students` with `student_activities` to answer: "Which students participate in which activities?" A row might show student `392507` linked to activity `1` ("Composite Programme", category `residential`, status `active`, governed by `baseline-governin-67`). Residential life offices query this view to manage housing assignments.

**View `v_code_of_conduct_student_detail`**

```sql
CREATE VIEW v_code_of_conduct_student_detail AS
SELECT a.id, a.document_id, a.title, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM code_of_conducts a
  JOIN conducts_students j ON j.code_of_conduct_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | document_id | title | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 392507 | Stephanie Collins | Paul Allen |
| 1 | IVC10I | Compact Initiative | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 605943 | Legacy Model | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 605943 | Legacy Model | id_16 | Upal Saha | Audrey Taylor |
| 3 | 10449525 | Regional Cluster A | id_16 | Upal Saha | Audrey Taylor |
| 3 | 10449525 | Regional Cluster A | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 392507 | Stephanie Collins | Paul Allen |

The view `v_code_of_conduct_student_detail` joins `code_of_conducts` with `students` to answer: "Which students are covered by a given conduct document?" A row might show conduct document `1` ("Compact Initiative", document ID `IVC10I`, version `VER-2245`, issued by `baseline-issuing-13`) covering student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This view supports policy compliance audits.

**View `v_code_of_conduct_interim_suspension`**

```sql
CREATE VIEW v_code_of_conduct_interim_suspension AS
SELECT a.id, a.document_id, a.title, a.effective_date, b.id AS suspension_id, b.suspension_id AS suspension_suspension_id, b.imposition_date AS suspension_imposition_date
FROM code_of_conducts a JOIN interim_suspensions b ON a.interim_suspension_id = b.id;
```

| id | document_id | title | effective_date | suspension_id | suspension_suspension_id | suspension_imposition_date |
|---|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 2023-02-14 | 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 |
| 2 | 605943 | Legacy Model | 2024-07-25 | 2 | 937730 | 2025-04-10T17:59:00 |
| 3 | 10449525 | Regional Cluster A | 2025-12-09 | 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2022-05-20 | 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 |

The view `v_code_of_conduct_interim_suspension` joins `code_of_conducts` with `interim_suspensions` to answer: "Which suspensions are governed by a given conduct document?" A row might show conduct document `1` ("Compact Initiative") linked to suspension `1` (suspension ID `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, imposed 2024-11-26, status `active`, hearing date 2025-04-02). This view helps policy administrators trace the disciplinary impact of each conduct document.

**View `v_code_of_conduct_no_contact_directive`**

```sql
CREATE VIEW v_code_of_conduct_no_contact_directive AS
SELECT a.id, a.document_id, a.title, a.effective_date, b.id AS directive_id, b.directive_id AS directive_directive_id, b.issue_date AS directive_issue_date
FROM code_of_conducts a JOIN no_contact_directives b ON a.no_contact_directive_id = b.id;
```

| id | document_id | title | effective_date | directive_id | directive_directive_id | directive_issue_date |
|---|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 2023-02-14 | 1000 | 69431 | 2023-02-01T13:51:00 |
| 2 | 605943 | Legacy Model | 2024-07-25 | 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 |
| 3 | 10449525 | Regional Cluster A | 2025-12-09 | 1002 | 12388 | 2025-12-23T03:25:00 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2022-05-20 | 1003 | 329 | 2022-05-07T10:42:00 |

The view `v_code_of_conduct_no_contact_directive` joins `code_of_conducts` with `no_contact_directives` to answer: "Which no-contact directives are governed by a given conduct document?" A row might show conduct document `1` ("Compact Initiative") linked to directive `1000` (directive ID `69431`, issued 2023-02-01, contact type `verbal`, status `active`). This view supports the integration of conduct policy with protective orders.

**View `v_code_of_conduct_student_activity`**

```sql
CREATE VIEW v_code_of_conduct_student_activity AS
SELECT a.id, a.document_id, a.title, a.effective_date, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM code_of_conducts a JOIN student_activities b ON a.student_activity_id = b.id;
```

| id | document_id | title | effective_date | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 2023-02-14 | 1 | 8843761 | Composite Programme |
| 2 | 605943 | Legacy Model | 2024-07-25 | 2 | 4180957 | Compact Standard A |
| 3 | 10449525 | Regional Cluster A | 2025-12-09 | 3 | 168545 | Legacy Framework |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2022-05-20 | 4 | default_chart_a_account_53 | Regional Protocol |

The view `v_code_of_conduct_student_activity` joins `code_of_conducts` with `student_activities` to answer: "Which student activities fall under a given conduct document?" A row might show conduct document `1` ("Compact Initiative") linked to activity `1` ("Composite Programme", category `residential`, status `active`, governed by `baseline-governin-67`). This view helps administrators ensure activities comply with the governing conduct policy.

**View `v_interim_suspension_student`**

```sql
CREATE VIEW v_interim_suspension_student AS
SELECT a.id, a.suspension_id, a.imposition_date, a.hearing_date, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM interim_suspensions a JOIN students b ON a.student_id = b.student_id;
```

| id | suspension_id | imposition_date | hearing_date | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|---|
| 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 | 2025-04-02T15:33:00 | 392507 | Stephanie Collins | Paul Allen |
| 2 | 937730 | 2025-04-10T17:59:00 | 2022-09-13T22:50:00 | 25388256 | Janice Johnston | Heather Beasley |
| 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 | 2023-02-24T05:07:00 | id_16 | Upal Saha | Audrey Taylor |
| 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 | 2024-07-08T12:24:00 | gd_taxc_2211 | Katherine Snyder | Susan Wagner |

The view `v_interim_suspension_student` joins `interim_suspensions` with `students` to answer: "Which student is subject to a given interim suspension?" A row might show suspension `1` (suspension ID `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, imposed 2024-11-26, status `active`) linked to student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This is the reverse perspective of `v_student_interim_suspension`, oriented around the suspension record.

**View `v_interim_suspension_hearing`**

```sql
CREATE VIEW v_interim_suspension_hearing AS
SELECT a.id, a.suspension_id, a.imposition_date, a.hearing_date, b.id AS hearing_id, b.hearing_id AS hearing_hearing_id, b.scheduled_date AS hearing_scheduled_date
FROM interim_suspensions a JOIN hearings b ON a.hearing_id = b.id;
```

| id | suspension_id | imposition_date | hearing_date | hearing_id | hearing_hearing_id | hearing_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 | 2025-04-02T15:33:00 | 1 | account_pymes_255 | 2024-11-27T22:18:00 |
| 2 | 937730 | 2025-04-10T17:59:00 | 2022-09-13T22:50:00 | 2 | 2106694 | 2025-04-11T05:35:00 |
| 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 | 2023-02-24T05:07:00 | 3 | 5917272 | 2022-09-22T12:52:00 |
| 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 | 2024-07-08T12:24:00 | 4 | 2106696 | 2023-02-06T19:09:00 |

The view `v_interim_suspension_hearing` joins `interim_suspensions` with `hearings` to answer: "Which hearing is scheduled for a given interim suspension?" A row might show suspension `1` (imposed 2024-11-26, status `active`) linked to hearing `1` (hearing ID `account_pymes_255`, scheduled 2024-11-27, status `scheduled`, outcome `legacy-outcome-85`). This view is essential for scheduling and tracking the hearing pipeline.

**View `v_interim_suspension_dean_of_students_staff`**

```sql
CREATE VIEW v_interim_suspension_dean_of_students_staff AS
SELECT a.id, a.suspension_id, a.imposition_date, a.hearing_date, b.id AS staff_id, b.staff_id AS staff_staff_id, b.role_title AS staff_role_title
FROM interim_suspensions a JOIN dean_of_students_staffs b ON a.dean_of_students_staff_id = b.id;
```

| id | suspension_id | imposition_date | hearing_date | staff_id | staff_staff_id | staff_role_title |
|---|---|---|---|---|---|---|
| 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 | 2025-04-02T15:33:00 | 100 | 937735 | Distributed Standard |
| 2 | 937730 | 2025-04-10T17:59:00 | 2022-09-13T22:50:00 | 101 | 3158139 | Adaptive Framework D |
| 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 | 2023-02-24T05:07:00 | 102 | 8189502 | Primary Protocol |
| 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 | 2024-07-08T12:24:00 | 103 | 69438 | Composite Programme |

The view `v_interim_suspension_dean_of_students_staff` joins `interim_suspensions` with `dean_of_students_staffs` to answer: "Which staff member oversees a given interim suspension?" A row might show suspension `1` (imposed 2024-11-26, status `active`) linked to staff member `100`. This view supports workload distribution and accountability tracking for the dean's office.

**View `v_no_contact_directive_student_detail`**

```sql
CREATE VIEW v_no_contact_directive_student_detail AS
SELECT a.id, a.directive_id, a.issue_date, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM no_contact_directives a
  JOIN directives_students j ON j.no_contact_directive_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | directive_id | issue_date | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1000 | 69431 | 2023-02-01T13:51:00 | 392507 | Stephanie Collins | Paul Allen |
| 1000 | 69431 | 2023-02-01T13:51:00 | 25388256 | Janice Johnston | Heather Beasley |
| 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 | 25388256 | Janice Johnston | Heather Beasley |
| 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 | id_16 | Upal Saha | Audrey Taylor |
| 1002 | 12388 | 2025-12-23T03:25:00 | id_16 | Upal Saha | Audrey Taylor |
| 1002 | 12388 | 2025-12-23T03:25:00 | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 1003 | 329 | 2022-05-07T10:42:00 | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 1003 | 329 | 2022-05-07T10:42:00 | 392507 | Stephanie Collins | Paul Allen |

The view `v_no_contact_directive_student_detail` joins `no_contact_directives` with `students` to answer: "Which student is subject to a given no-contact directive?" A row might show directive `1000` (directive ID `69431`, issued 2023-02-01, contact type `verbal`, status `active`) linked to student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This view supports the enforcement of protective orders.

**View `v_no_contact_directive_dean_of_students_staff`**

```sql
CREATE VIEW v_no_contact_directive_dean_of_students_staff AS
SELECT a.id, a.directive_id, a.issue_date, a.issuing_office, b.id AS staff_id, b.staff_id AS staff_staff_id, b.role_title AS staff_role_title
FROM no_contact_directives a JOIN dean_of_students_staffs b ON a.dean_of_students_staff_id = b.id;
```

| id | directive_id | issue_date | issuing_office | staff_id | staff_staff_id | staff_role_title |
|---|---|---|---|---|---|---|
| 1000 | 69431 | 2023-02-01T13:51:00 | integrated-issuing-46 | 100 | 937735 | Distributed Standard |
| 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 | seasonal-issuing-47 | 101 | 3158139 | Adaptive Framework D |
| 1002 | 12388 | 2025-12-23T03:25:00 | regional-issuing-48 | 102 | 8189502 | Primary Protocol |
| 1003 | 329 | 2022-05-07T10:42:00 | legacy-issuing-49 | 103 | 69438 | Composite Programme |

The view `v_no_contact_directive_dean_of_students_staff` joins `no_contact_directives` with `dean_of_students_staffs` to answer: "Which staff member oversees a given no-contact directive?" A row might show directive `1000` (issued 2023-02-01, contact type `verbal`, status `active`) linked to staff member `100`. This view supports the monitoring of directive compliance.

**View `v_student_activity_student_detail`**

```sql
CREATE VIEW v_student_activity_student_detail AS
SELECT a.id, a.activity_id, a.activity_name, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM student_activities a
  JOIN activities_students j ON j.student_activity_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | activity_id | activity_name | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | 392507 | Stephanie Collins | Paul Allen |
| 1 | 8843761 | Composite Programme | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 4180957 | Compact Standard A | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 4180957 | Compact Standard A | id_16 | Upal Saha | Audrey Taylor |
| 3 | 168545 | Legacy Framework | id_16 | Upal Saha | Audrey Taylor |
| 3 | 168545 | Legacy Framework | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | default_chart_a_account_53 | Regional Protocol | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | default_chart_a_account_53 | Regional Protocol | 392507 | Stephanie Collins | Paul Allen |

The view `v_student_activity_student_detail` joins `student_activities` with `students` to answer: "Which student participates in a given activity?" A row might show activity `1` ("Composite Programme", category `residential`, status `active`, governed by `baseline-governin-67`) linked to student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This view supports activity enrollment reporting.

**View `v_student_activity_code_of_conduct`**

```sql
CREATE VIEW v_student_activity_code_of_conduct AS
SELECT a.id, a.activity_id, a.activity_name, a.category, b.id AS conduct_id, b.document_id AS conduct_document_id, b.title AS conduct_title
FROM student_activities a JOIN code_of_conducts b ON a.code_of_conduct_id = b.id;
```

| id | activity_id | activity_name | category | conduct_id | conduct_document_id | conduct_title |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | residential | 1 | IVC10I | Compact Initiative |
| 2 | 4180957 | Compact Standard A | greek | 2 | 605943 | Legacy Model |
| 3 | 168545 | Legacy Framework | club | 3 | 10449525 | Regional Cluster A |
| 4 | default_chart_a_account_53 | Regional Protocol | other | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review |

The view `v_student_activity_code_of_conduct` joins `student_activities` with `code_of_conducts` to answer: "Which conduct document governs a given student activity?" A row might show activity `1` ("Composite Programme", category `residential`, status `active`) linked to conduct document `1` ("Compact Initiative", document ID `IVC10I`, version `VER-2245`, issued by `baseline-issuing-13`). This view ensures activities comply with the correct policy framework.

**View `v_student_activity_dean_of_students_staff`**

```sql
CREATE VIEW v_student_activity_dean_of_students_staff AS
SELECT a.id, a.activity_id, a.activity_name, a.category, b.id AS staff_id, b.staff_id AS staff_staff_id, b.role_title AS staff_role_title
FROM student_activities a JOIN dean_of_students_staffs b ON a.dean_of_students_staff_id = b.id;
```

| id | activity_id | activity_name | category | staff_id | staff_staff_id | staff_role_title |
|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | residential | 100 | 937735 | Distributed Standard |
| 2 | 4180957 | Compact Standard A | greek | 101 | 3158139 | Adaptive Framework D |
| 3 | 168545 | Legacy Framework | club | 102 | 8189502 | Primary Protocol |
| 4 | default_chart_a_account_53 | Regional Protocol | other | 103 | 69438 | Composite Programme |

The view `v_student_activity_dean_of_students_staff` joins `student_activities` with `dean_of_students_staffs` to answer: "Which staff member oversees a given student activity?" A row might show activity `1` ("Composite Programme", category `residential`, status `active`) linked to staff member `100`. This view supports activity supervision assignments.

**View `v_hearing_interim_suspension`**

```sql
CREATE VIEW v_hearing_interim_suspension AS
SELECT a.id, a.hearing_id, a.scheduled_date, a.status, b.id AS suspension_id, b.suspension_id AS suspension_suspension_id, b.imposition_date AS suspension_imposition_date
FROM hearings a JOIN interim_suspensions b ON a.interim_suspension_id = b.id;
```

| id | hearing_id | scheduled_date | status | suspension_id | suspension_suspension_id | suspension_imposition_date |
|---|---|---|---|---|---|---|
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | scheduled | 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 |
| 2 | 2106694 | 2025-04-11T05:35:00 | completed | 2 | 937730 | 2025-04-10T17:59:00 |
| 3 | 5917272 | 2022-09-22T12:52:00 | cancelled | 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 |
| 4 | 2106696 | 2023-02-06T19:09:00 | scheduled | 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 |

The view `v_hearing_interim_suspension` joins `hearings` with `interim_suspensions` to answer: "Which interim suspension is being reviewed at a given hearing?" A row might show hearing `1` (hearing ID `account_pymes_255`, scheduled 2024-11-27, status `scheduled`, outcome `legacy-outcome-85`) linked to suspension `1` (suspension ID `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, imposed 2024-11-26, status `active`). This view is the primary scheduling interface for hearing coordinators.

**View `v_hearing_campus_hearing_board`**

```sql
CREATE VIEW v_hearing_campus_hearing_board AS
SELECT a.id, a.hearing_id, a.scheduled_date, a.status, b.campus_hearing_board_id AS board_campus_hearing_board_id, b.board_id AS board_board_id, b.board_name AS board_board_name
FROM hearings a JOIN campus_hearing_boards b ON a.campus_hearing_board_id = b.campus_hearing_board_id;
```

| id | hearing_id | scheduled_date | status | board_campus_hearing_board_id | board_board_id | board_board_name |
|---|---|---|---|---|---|---|
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | scheduled | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series |
| 2 | 2106694 | 2025-04-11T05:35:00 | completed | 2 | 168553 | Legacy Assessment |
| 3 | 5917272 | 2022-09-22T12:52:00 | cancelled | 3 | 5006454 | Regional Survey A |
| 4 | 2106696 | 2023-02-06T19:09:00 | scheduled | 4 | 1437585 | Seasonal Corridor |

The view `v_hearing_campus_hearing_board` joins `hearings` with `campus_hearing_boards` to answer: "Which hearing board adjudicates a given hearing?" A row might show hearing `1` (hearing ID `account_pymes_255`, scheduled 2024-11-27, status `scheduled`) linked to board `1`. This view supports board assignment and workload balancing.

**View `v_hearing_student_detail`**

```sql
CREATE VIEW v_hearing_student_detail AS
SELECT a.id, a.hearing_id, a.scheduled_date, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM hearings a
  JOIN hearings_students j ON j.hearing_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | hearing_id | scheduled_date | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | 392507 | Stephanie Collins | Paul Allen |
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 2106694 | 2025-04-11T05:35:00 | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 2106694 | 2025-04-11T05:35:00 | id_16 | Upal Saha | Audrey Taylor |
| 3 | 5917272 | 2022-09-22T12:52:00 | id_16 | Upal Saha | Audrey Taylor |
| 3 | 5917272 | 2022-09-22T12:52:00 | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 2106696 | 2023-02-06T19:09:00 | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 2106696 | 2023-02-06T19:09:00 | 392507 | Stephanie Collins | Paul Allen |

The view `v_hearing_student_detail` joins `hearings` with `students` to answer: "Which student is the subject of a given hearing?" A row might show hearing `1` (hearing ID `account_pymes_255`, scheduled 2024-11-27, status `scheduled`, outcome `legacy-outcome-85`) linked to student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This view supports hearing notification and preparation.

**View `v_campus_hearing_board_hearing_detail`**

```sql
CREATE VIEW v_campus_hearing_board_hearing_detail AS
SELECT a.campus_hearing_board_id, a.board_id, a.board_name, b.id AS hearing_id, b.hearing_id AS hearing_hearing_id, b.scheduled_date AS hearing_scheduled_date
FROM campus_hearing_boards a
  JOIN boards_hearings j ON j.campus_hearing_board_id = a.campus_hearing_board_id
  JOIN hearings b ON b.id = j.hearing_id;
```

| campus_hearing_board_id | board_id | board_name | hearing_id | hearing_hearing_id | hearing_scheduled_date |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 1 | account_pymes_255 | 2024-11-27T22:18:00 |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2 | 2106694 | 2025-04-11T05:35:00 |
| 2 | 168553 | Legacy Assessment | 2 | 2106694 | 2025-04-11T05:35:00 |
| 2 | 168553 | Legacy Assessment | 3 | 5917272 | 2022-09-22T12:52:00 |
| 3 | 5006454 | Regional Survey A | 3 | 5917272 | 2022-09-22T12:52:00 |
| 3 | 5006454 | Regional Survey A | 4 | 2106696 | 2023-02-06T19:09:00 |
| 4 | 1437585 | Seasonal Corridor | 4 | 2106696 | 2023-02-06T19:09:00 |
| 4 | 1437585 | Seasonal Corridor | 1 | account_pymes_255 | 2024-11-27T22:18:00 |

The view `v_campus_hearing_board_hearing_detail` joins `campus_hearing_boards` with `hearings` to answer: "Which hearings are assigned to a given hearing board?" A row might show board `1` linked to hearing `1` (hearing ID `account_pymes_255`, scheduled 2024-11-27, status `scheduled`, outcome `legacy-outcome-85`). This view supports board scheduling and capacity management.

**View `v_campus_hearing_board_student_detail`**

```sql
CREATE VIEW v_campus_hearing_board_student_detail AS
SELECT a.campus_hearing_board_id, a.board_id, a.board_name, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM campus_hearing_boards a
  JOIN boards_students j ON j.campus_hearing_board_id = a.campus_hearing_board_id
  JOIN students b ON b.student_id = j.student_id;
```

| campus_hearing_board_id | board_id | board_name | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 392507 | Stephanie Collins | Paul Allen |
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 168553 | Legacy Assessment | 25388256 | Janice Johnston | Heather Beasley |
| 2 | 168553 | Legacy Assessment | id_16 | Upal Saha | Audrey Taylor |
| 3 | 5006454 | Regional Survey A | id_16 | Upal Saha | Audrey Taylor |
| 3 | 5006454 | Regional Survey A | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 1437585 | Seasonal Corridor | gd_taxc_2211 | Katherine Snyder | Susan Wagner |
| 4 | 1437585 | Seasonal Corridor | 392507 | Stephanie Collins | Paul Allen |

The view `v_campus_hearing_board_student_detail` joins `campus_hearing_boards` with `students` to answer: "Which students are associated with a given hearing board?" A row might show board `1` linked to student `392507` (Stephanie Collins, email `primary-email-70`, enrollment status `active`). This view supports jurisdictional tracking and board composition.

**View `v_dean_of_students_staff_interim_suspension_detail`**

```sql
CREATE VIEW v_dean_of_students_staff_interim_suspension_detail AS
SELECT a.id, a.staff_id, a.role_title, b.id AS suspension_id, b.suspension_id AS suspension_suspension_id, b.imposition_date AS suspension_imposition_date
FROM dean_of_students_staffs a
  JOIN staffs_suspensions j ON j.dean_of_students_staff_id = a.id
  JOIN interim_suspensions b ON b.id = j.interim_suspension_id;
```

| id | staff_id | role_title | suspension_id | suspension_suspension_id | suspension_imposition_date |
|---|---|---|---|---|---|
| 100 | 937735 | Distributed Standard | 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 |
| 100 | 937735 | Distributed Standard | 2 | 937730 | 2025-04-10T17:59:00 |
| 101 | 3158139 | Adaptive Framework D | 2 | 937730 | 2025-04-10T17:59:00 |
| 101 | 3158139 | Adaptive Framework D | 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 |
| 102 | 8189502 | Primary Protocol | 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 |
| 102 | 8189502 | Primary Protocol | 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 |
| 103 | 69438 | Composite Programme | 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 |
| 103 | 69438 | Composite Programme | 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 |

The view `v_dean_of_students_staff_interim_suspension_detail` joins `dean_of_students_staffs` with `interim_suspensions` to answer: "Which interim suspensions are overseen by a given staff member?" A row might show staff member `100` linked to suspension `1` (suspension ID `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, imposed 2024-11-26, status `active`, hearing date 2025-04-02). This view supports dean workload tracking.

**View `v_dean_of_students_staff_no_contact_directive_detail`**

```sql
CREATE VIEW v_dean_of_students_staff_no_contact_directive_detail AS
SELECT a.id, a.staff_id, a.role_title, b.id AS directive_id, b.directive_id AS directive_directive_id, b.issue_date AS directive_issue_date
FROM dean_of_students_staffs a
  JOIN staffs_directives j ON j.dean_of_students_staff_id = a.id
  JOIN no_contact_directives b ON b.id = j.no_contact_directive_id;
```

| id | staff_id | role_title | directive_id | directive_directive_id | directive_issue_date |
|---|---|---|---|---|---|
| 100 | 937735 | Distributed Standard | 1000 | 69431 | 2023-02-01T13:51:00 |
| 100 | 937735 | Distributed Standard | 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 |
| 101 | 3158139 | Adaptive Framework D | 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 |
| 101 | 3158139 | Adaptive Framework D | 1002 | 12388 | 2025-12-23T03:25:00 |
| 102 | 8189502 | Primary Protocol | 1002 | 12388 | 2025-12-23T03:25:00 |
| 102 | 8189502 | Primary Protocol | 1003 | 329 | 2022-05-07T10:42:00 |
| 103 | 69438 | Composite Programme | 1003 | 329 | 2022-05-07T10:42:00 |
| 103 | 69438 | Composite Programme | 1000 | 69431 | 2023-02-01T13:51:00 |

The view `v_dean_of_students_staff_no_contact_directive_detail` joins `dean_of_students_staffs` with `no_contact_directives` to answer: "Which no-contact directives are overseen by a given staff member?" A row might show staff member `100` linked to directive `1000` (directive ID `69431`, issued 2023-02-01, contact type `verbal`, status `active`). This view supports directive monitoring assignments.

**View `v_dean_of_students_staff_student_activity_detail`**

```sql
CREATE VIEW v_dean_of_students_staff_student_activity_detail AS
SELECT a.id, a.staff_id, a.role_title, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM dean_of_students_staffs a
  JOIN staffs_activities j ON j.dean_of_students_staff_id = a.id
  JOIN student_activities b ON b.id = j.student_activity_id;
```

| id | staff_id | role_title | activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|
| 100 | 937735 | Distributed Standard | 1 | 8843761 | Composite Programme |
| 100 | 937735 | Distributed Standard | 2 | 4180957 | Compact Standard A |
| 101 | 3158139 | Adaptive Framework D | 2 | 4180957 | Compact Standard A |
| 101 | 3158139 | Adaptive Framework D | 3 | 168545 | Legacy Framework |
| 102 | 8189502 | Primary Protocol | 3 | 168545 | Legacy Framework |
| 102 | 8189502 | Primary Protocol | 4 | default_chart_a_account_53 | Regional Protocol |
| 103 | 69438 | Composite Programme | 4 | default_chart_a_account_53 | Regional Protocol |
| 103 | 69438 | Composite Programme | 1 | 8843761 | Composite Programme |

The view `v_dean_of_students_staff_student_activity_detail` joins `dean_of_students_staffs` with `student_activities` to answer: "Which student activities are overseen by a given staff member?" A row might show staff member `100` linked to activity `1` ("Composite Programme", category `residential`, status `active`, governed by `baseline-governin-67`). This view supports activity supervision assignments and compliance oversight.

### Synthesis

The student conduct management schema demonstrates a disciplined normalization strategy: entity tables capture distinct concepts (students, conduct documents, suspensions, directives, activities, hearings, boards, staff), junction tables express many-to-many cardinality without denormalizing the entities, and views reconstruct domain facts by joining the normalized pieces. The denormalized foreign-key columns in `students` and `code_of_conducts` provide convenient shortcuts for one-to-one or one-to-few relationships, while the junction tables (`conducts_students`, `directives_students`, `activities_students`, `hearings_students`, `boards_hearings`, `boards_students`, `staffs_suspensions`, `staffs_directives`, `staffs_activities`) preserve full many-to-many expressiveness. Each view answers a specific question — from "which student is under suspension" to "which board adjudicates which hearing" — by joining the appropriate tables and projecting the relevant columns. The result is a schema that is both structurally sound and practically queryable, with representative values like student `392507` (Stephanie Collins), conduct document `IVC10I` ("Compact Initiative"), suspension `b2b10e52-8fcd-11eb-924d-9cd76263cbd0`, and directive `69431` serving as concrete anchors for the abstract relationships.