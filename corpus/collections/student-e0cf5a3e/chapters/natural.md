## Student Conduct Administration: Records, Processes, and Cross-Functional Relationships

Campus conduct administration operates as a structured ecosystem of policy enforcement, student accountability, and administrative oversight. At its core, the system tracks individual students through a lifecycle that begins with enrollment and may progress through policy acknowledgments, behavioral interventions, formal hearings, and ultimately resolution or termination. Each student carries a portfolio of records—codes of conduct they have accepted, interim suspensions imposed during investigations, no-contact directives issued to protect community members, and participation in student activities governed by institutional policies. These records do not exist in isolation; they are cross-referenced through a network of junction tables and analytical views that allow administrators to trace the full context of any conduct matter. The following chapter documents the entities, their relationships, and the operational workflows that connect them.

**Table `students`**

| student_id | first_name | last_name | email_address | enrollment_status | enrollment_year | code_of_conduct_id | interim_suspension_id | no_contact_directive_id | student_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 392507 | Stephanie Collins | Paul Allen | primary-email-70 | active | 12 | 1 | 1 | 1000 | 1 |
| 25388256 | Janice Johnston | Heather Beasley | adaptive-email-71 | suspended | 16 | 2 | 2 | 1001 | 2 |
| id_16 | Upal Saha | Audrey Taylor | distributed-email-72 | terminated | 20 | 3 | 3 | 1002 | 3 |
| gd_taxc_2211 | Katherine Snyder | Susan Wagner | baseline-email-73 | graduated | 24 | 4 | 4 | 1003 | 4 |

The `students` table serves as the central registry for all individuals subject to conduct administration. Each row represents a student with a unique identifier, name, and contact information, alongside their current enrollment status and year of enrollment. The enrollment status field captures the student's standing within the institution, ranging from active enrollment through graduated status, with intermediate states such as suspended or terminated reflecting conduct-related outcomes. The table also carries foreign-key references to the student's current code of conduct, interim suspension, no-contact directive, and student activity records, establishing the primary linkage to the conduct subsystem. For example, student 392507, Stephanie Collins Paul Allen, holds active enrollment status from year 12 and is associated with code of conduct record 1, interim suspension 1, no-contact directive 1000, and student activity 1. In contrast, student id_16, Upal Saha Audrey Taylor, has a terminated status from year 20, indicating a concluded conduct matter that resulted in the student's departure from the institution.

**Table `code_of_conducts`**

| id | document_id | title | effective_date | version_number | approval_date | issuing_body | interim_suspension_id | no_contact_directive_id | student_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IVC10I | Compact Initiative | 2023-02-14 | VER-2245 | 2023-10-10 | baseline-issuing-13 | 1 | 1000 | 1 |
| 2 | 605943 | Legacy Model | 2024-07-25 | VER-2249 | 2024-03-21 | pilot-issuing-14 | 2 | 1001 | 2 |
| 3 | 10449525 | Regional Cluster A | 2025-12-09 | VER-2253 | 2025-08-05 | extended-issuing-15 | 3 | 1002 | 3 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2022-05-20 | VER-2257 | 2022-01-16 | integrated-issuing-16 | 4 | 1003 | 4 |

The `code_of_conducts` table stores the institutional policy documents that govern student behavior. Each record represents a distinct version of a conduct policy, identified by a document identifier, title, and version number. The effective date marks when the policy became operative, while the approval date records when the issuing body formally authorized it. The issuing_body field identifies the administrative entity responsible for the policy—values such as baseline-issuing-13, pilot-issuing-14, extended-issuing-15, and integrated-issuing-16 reflect different organizational units or programmatic scopes. Each code of conduct record also carries references to the interim suspension, no-contact directive, and student activity it is associated with, creating a direct policy-to-action linkage. The Compact Initiative (document IVC10I, version VER-2245) became effective on 2023-02-14 and was approved by baseline-issuing-13 on 2023-10-10, while the Seasonal Review (document 5f93a090-8fcd-11eb-924d-9cd76263cbd0, version VER-2257) dates back to an effective date of 2022-05-20 under integrated-issuing-16.

**Table `interim_suspensions`**

| id | suspension_id | imposition_date | hearing_date | issuing_authority | reason | status | student_id | hearing_id | dean_of_students_staff_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | b2b10e52-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26T10:42:00 | 2025-04-02T15:33:00 | extended-issuing-33 | distributed-reason-66 | active | 392507 | 1 | 100 |
| 2 | 937730 | 2025-04-10T17:59:00 | 2022-09-13T22:50:00 | integrated-issuing-34 | baseline-reason-67 | resolved | 25388256 | 2 | 101 |
| 3 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2022-09-21T00:16:00 | 2023-02-24T05:07:00 | seasonal-issuing-35 | pilot-reason-68 | overturned | id_16 | 3 | 102 |
| 4 | 990e161e10664c5885182d95dc07e606 | 2023-02-05T07:33:00 | 2024-07-08T12:24:00 | regional-issuing-36 | extended-reason-69 | active | gd_taxc_2211 | 4 | 103 |

Interim suspensions represent the most immediate form of conduct intervention, typically imposed pending the outcome of a formal hearing. The `interim_suspensions` table records each suspension with a unique suspension identifier, the date it was imposed, and the date scheduled for the associated hearing. The issuing_authority field identifies the administrative body that authorized the suspension, with values such as extended-issuing-33, integrated-issuing-34, seasonal-issuing-35, and regional-issuing-36. The reason field provides a categorical description of the basis for the suspension—distributed-reason-66, baseline-reason-67, pilot-reason-68, and extended-reason-69 in the current dataset. The status field tracks the current disposition of the suspension, with values including active, resolved, and overturned. Each suspension is linked to a specific student, a hearing record, and a dean of students staff member who oversaw the imposition. Suspension b2b10e52-8fcd-11eb-924d-9cd76263cbd0 was imposed on 2024-11-26 with a hearing scheduled for 2025-04-02, remains active, and was issued by extended-issuing-33 under the oversight of dean staff member 100.

**Table `no_contact_directives`**

| id | directive_id | issue_date | issuing_office | contact_type | status | dean_of_students_staff_id |
|---|---|---|---|---|---|---|
| 1000 | 69431 | 2023-02-01T13:51:00 | integrated-issuing-46 | verbal | active | 100 |
| 1001 | 76a22c6ecc114448872b4c7cb5d4d087 | 2024-07-12T20:08:00 | seasonal-issuing-47 | written | lifted | 101 |
| 1002 | 12388 | 2025-12-23T03:25:00 | regional-issuing-48 | third-party | expired | 102 |
| 1003 | 329 | 2022-05-07T10:42:00 | legacy-issuing-49 | all | active | 103 |

No-contact directives are administrative orders that prohibit specified forms of communication between students, typically issued to prevent harassment, retaliation, or further conflict. The `no_contact_directives` table captures each directive with a unique identifier, the date it was issued, and the issuing office. The contact_type field specifies the scope of the prohibition—verbal, written, third-party, or all—while the status field indicates whether the directive is currently active, has been lifted, or has expired. Each directive is overseen by a dean of students staff member. Directive 69431, issued on 2023-02-01 by integrated-issuing-46, restricts verbal contact and remains active under dean staff member 100. Directive 76a22c6ecc114448872b4c7cb5d4d087, issued on 2024-07-12 by seasonal-issuing-47, restricted written contact and has since been lifted under dean staff member 101.

**Table `student_activities`**

| id | activity_id | activity_name | category | status | governing_policy | code_of_conduct_id | dean_of_students_staff_id |
|---|---|---|---|---|---|---|---|
| 1 | 8843761 | Composite Programme | residential | active | baseline-governin-67 | 1 | 100 |
| 2 | 4180957 | Compact Standard A | greek | terminated | pilot-governin-68 | 2 | 101 |
| 3 | 168545 | Legacy Framework | club | suspended | extended-governin-69 | 3 | 102 |
| 4 | default_chart_a_account_53 | Regional Protocol | other | active | integrated-governin-70 | 4 | 103 |

Student activities encompass the extracurricular, residential, and organizational programs in which students participate, each governed by institutional policy. The `student_activities` table records each activity with a unique identifier, an activity identifier, a descriptive name, and a category such as residential, greek, club, or other. The status field reflects the current operational state of the activity—active, terminated, or suspended—while the governing_policy field identifies the policy framework under which the activity operates. Each activity is linked to a code of conduct and overseen by a dean of students staff member. The Composite Programme (activity 8843761) falls under the residential category, operates under baseline-governin-67, and is overseen by dean staff member 100. The Compact Standard A (activity 4180957) is categorized as greek, has a terminated status, and is governed by pilot-governin-68 under dean staff member 101.

**Table `hearings`**

| id | hearing_id | scheduled_date | status | outcome | interim_suspension_id | campus_hearing_board_id |
|---|---|---|---|---|---|---|
| 1 | account_pymes_255 | 2024-11-27T22:18:00 | scheduled | legacy-outcome-85 | 1 | 1 |
| 2 | 2106694 | 2025-04-11T05:35:00 | completed | compact-outcome-86 | 2 | 2 |
| 3 | 5917272 | 2022-09-22T12:52:00 | cancelled | composite-outcome-87 | 3 | 3 |
| 4 | 2106696 | 2023-02-06T19:09:00 | scheduled | primary-outcome-88 | 4 | 4 |

Formal hearings constitute the adjudicative mechanism through which conduct matters are resolved. The `hearings` table records each hearing with a unique identifier, the scheduled date, the current status, and the outcome. The status field captures whether a hearing is scheduled, completed, or cancelled, while the outcome field records the result—values such as legacy-outcome-85, compact-outcome-86, composite-outcome-87, and primary-outcome-88 in the current data. Each hearing is associated with an interim suspension and a campus hearing board that conducted the proceeding. Hearing account_pymes_255 was scheduled for 2024-11-27, remains in scheduled status, and carries the outcome legacy-outcome-85 under campus hearing board 1. Hearing 2106694, scheduled for 2025-04-11, has been completed with the outcome compact-outcome-86 under campus hearing board 2.

**Table `campus_hearing_boards`**

| campus_hearing_board_id | board_id | board_name | established_date |
|---|---|---|---|
| 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | 2024-03-27 |
| 2 | 168553 | Legacy Assessment | 2025-08-11 |
| 3 | 5006454 | Regional Survey A | 2022-01-22 |
| 4 | 1437585 | Seasonal Corridor | 2023-06-06 |

Campus hearing boards are the organizational bodies responsible for conducting formal hearings. Each board is identified by a unique ID and serves as the adjudicative authority for one or more hearings. The boards function as the institutional mechanism for impartial review of conduct matters, and their association with specific hearings is recorded in the hearings table.

**Table `dean_of_students_staffs`**

| id | staff_id | role_title | department |
|---|---|---|---|
| 100 | 937735 | Distributed Standard | adaptive-departme-89 |
| 101 | 3158139 | Adaptive Framework D | distributed-departme-90 |
| 102 | 8189502 | Primary Protocol | baseline-departme-91 |
| 103 | 69438 | Composite Programme | pilot-departme-92 |

The dean of students staff represents the administrative personnel who oversee conduct operations across multiple dimensions. Deans issue interim suspensions, authorize no-contact directives, and supervise student activities. Each staff member is identified by a unique ID and is associated with specific conduct actions through junction tables that link them to suspensions, directives, and activities. Staff member 100, for example, is associated with suspension 1, directive 1000, and activity 1, reflecting a comprehensive oversight role across the full spectrum of conduct interventions.

The conduct system employs a set of junction tables to manage the many-to-many relationships between students and conduct records, between hearing boards and hearings, and between staff and conduct actions. These tables ensure that the relational integrity of the system is maintained while allowing for the flexibility required in real-world conduct administration.

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

The `conducts_students` table links students to their code of conduct records, establishing which policy document governs each student's behavior. This relationship ensures that every student is explicitly associated with a specific version of the conduct code.

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

The `directives_students` table connects students to their no-contact directives, documenting which individuals are subject to each directive and under what conditions. This linkage is critical for enforcing contact restrictions and tracking compliance.

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

The `activities_students` table associates students with their student activities, recording participation in extracurricular programs and the policies that govern them. This relationship supports both activity administration and conduct oversight.

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

The `hearings_students` table links students to their formal hearings, documenting which individuals are subject to adjudicative proceedings and providing a direct audit trail from student to hearing outcome.

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

The `boards_hearings` table connects campus hearing boards to the hearings they conduct, establishing which organizational body is responsible for each adjudicative proceeding. This relationship ensures that every hearing is assigned to a specific board.

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

The `boards_students` table links hearing boards to students, documenting which boards have jurisdiction over which students' conduct matters. This relationship supports the assignment of hearing panels and the tracking of board workload.

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

The `staffs_suspensions` table connects dean of students staff members to the interim suspensions they have issued, providing an audit trail of administrative decisions and enabling accountability for suspension actions.

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

The `staffs_directives` table links dean of students staff members to the no-contact directives they have authorized, documenting which administrator approved each contact restriction.

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

The `staffs_activities` table associates dean of students staff members with the student activities they oversee, establishing supervisory responsibility for extracurricular programs and their conduct implications.

The conduct administration system provides a suite of analytical views that join these base tables into comprehensive perspectives, enabling administrators to answer complex operational questions with a single query. Each view is designed to answer a specific question by joining the relevant entities and presenting the resulting data in a coherent, actionable format.

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

The view `v_student_code_of_conduct` joins the students table with the code_of_conducts table to present each student alongside their governing policy document. This view answers the question: which conduct policy applies to each student? For student 392507, the view reveals that the Compact Initiative (IVC10I, version VER-2245) issued by baseline-issuing-13 is the applicable policy.

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

The view `v_student_interim_suspension` joins students with interim_suspensions to present each student alongside their current suspension status. This view answers: which students are currently subject to interim suspension? Student 25388256, Janice Johnston Heather Beasley, appears in this view with suspension 937730, which has a resolved status and was issued by integrated-issuing-34.

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

The view `v_student_no_contact_directive` joins students with no_contact_directives to present each student alongside their active contact restrictions. This view answers: which students are subject to no-contact orders? Student id_16, Upal Saha Audrey Taylor, is associated with directive 12388, which restricts third-party contact and has an expired status under dean staff member 102.

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

The view `v_student_student_activity` joins students with student_activities to present each student alongside their extracurricular participation. This view answers: which students are involved in which activities? Student gd_taxc_2211, Katherine Snyder Susan Wagner, participates in activity default_chart_a_account_53, the Regional Protocol, which falls under the other category and has an active status.

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

The view `v_code_of_conduct_student_detail` inverts the perspective, joining code_of_conducts with students to show which students are governed by each policy document. This view answers: which students fall under the authority of a given conduct code? For the Legacy Model (document 605943, version VER-2249), the view reveals that student 25388256 is the governed individual.

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

The view `v_code_of_conduct_interim_suspension` joins code_of_conducts with interim_suspensions to show which suspensions are associated with each policy document. This view answers: which conduct codes have triggered interim suspensions? The Regional Cluster A policy (document 10449525, version VER-2253) is linked to suspension ChIJt4hBkzhu5kcRJJDUNqGUpso, which has an overturned status.

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

The view `v_code_of_conduct_no_contact_directive` joins code_of_conducts with no_contact_directives to show which contact restrictions are associated with each policy document. This view answers: which conduct codes have resulted in no-contact directives? The Seasonal Review policy (document 5f93a090-8fcd-11eb-924d-9cd76263cbd0) is linked to directive 329, which restricts all forms of contact and remains active.

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

The view `v_code_of_conduct_student_activity` joins code_of_conducts with student_activities to show which activities are governed by each policy document. This view answers: which conduct codes oversee which student programs? The Compact Initiative policy (document IVC10I) governs activity 8843761, the Composite Programme.

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

The view `v_interim_suspension_student` joins interim_suspensions with students to present each suspension alongside the affected student's full details. This view answers: which student is affected by each interim suspension? Suspension b2b10e52-8fcd-11eb-924d-9cd76263cbd0 affects student 392507, Stephanie Collins Paul Allen, who holds active enrollment status.

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

The view `v_interim_suspension_hearing` joins interim_suspensions with hearings to show the adjudicative proceeding associated with each suspension. This view answers: which hearing is scheduled for each suspension? Suspension 937730 is linked to hearing 2106694, which has been completed with outcome compact-outcome-86.

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

The view `v_interim_suspension_dean_of_students_staff` joins interim_suspensions with dean_of_students_staffs to show which administrator oversaw each suspension. This view answers: which dean authorized each interim suspension? Suspension ChIJt4hBkzhu5kcRJJDUNqGUpso was overseen by dean staff member 102.

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

The view `v_no_contact_directive_student_detail` joins no_contact_directives with students to present each directive alongside the affected student's information. This view answers: which student is subject to each no-contact directive? Directive 76a22c6ecc114448872b4c7cb5d4d087, which restricts written contact and has been lifted, is associated with student 25388256.

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

The view `v_no_contact_directive_dean_of_students_staff` joins no_contact_directives with dean_of_students_staffs to show which administrator authorized each directive. This view answers: which dean issued each no-contact order? Directive 69431, restricting verbal contact, was authorized by dean staff member 100.

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

The view `v_student_activity_student_detail` joins student_activities with students to present each activity alongside the participating student's information. This view answers: which student participates in each activity? Activity 4180957, the Compact Standard A, is participated in by student 25388256.

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

The view `v_student_activity_code_of_conduct` joins student_activities with code_of_conducts to show which policy governs each activity. This view answers: which conduct code applies to each student activity? The Legacy Framework activity (168545) is governed by the Regional Cluster A policy (document 10449525).

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

The view `v_student_activity_dean_of_students_staff` joins student_activities with dean_of_students_staffs to show which administrator oversees each activity. This view answers: which dean supervises each student program? Activity default_chart_a_account_53, the Regional Protocol, is overseen by dean staff member 103.

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

The view `v_hearing_interim_suspension` joins hearings with interim_suspensions to show which suspension triggered each hearing. This view answers: which suspension is being adjudicated at each hearing? Hearing 5917272, which was cancelled with outcome composite-outcome-87, is associated with suspension ChIJt4hBkzhu5kcRJJDUNqGUpso.

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

The view `v_hearing_campus_hearing_board` joins hearings with campus_hearing_boards to show which board conducted each hearing. This view answers: which hearing board is responsible for each proceeding? Hearing 2106696, scheduled for 2023-02-06 with outcome primary-outcome-88, was conducted by campus hearing board 4.

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

The view `v_hearing_student_detail` joins hearings with students to present each hearing alongside the affected student's information. This view answers: which student is subject to each hearing? Hearing account_pymes_255, scheduled for 2024-11-27, involves student 392507, Stephanie Collins Paul Allen.

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

The view `v_campus_hearing_board_hearing_detail` joins campus_hearing_boards with hearings to show which hearings each board has conducted. This view answers: which hearings has each hearing board adjudicated? Campus hearing board 2 has conducted hearing 2106694, which was completed with outcome compact-outcome-86.

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

The view `v_campus_hearing_board_student_detail` joins campus_hearing_boards with students to show which students fall under each board's jurisdiction. This view answers: which students are subject to each hearing board? Campus hearing board 3 has jurisdiction over student id_16, Upal Saha Audrey Taylor.

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

The view `v_dean_of_students_staff_interim_suspension_detail` joins dean_of_students_staffs with interim_suspensions to show which suspensions each dean has overseen. This view answers: which interim suspensions has each dean authorized? Dean staff member 103 has overseen suspension 990e161e10664c5885182d95dc07e606, which remains active and was issued by regional-issuing-36.

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

The view `v_dean_of_students_staff_no_contact_directive_detail` joins dean_of_students_staffs with no_contact_directives to show which directives each dean has authorized. This view answers: which no-contact orders has each dean issued? Dean staff member 101 authorized directive 76a22c6ecc114448872b4c7cb5d4d087, which restricted written contact and has been lifted.

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

The view `v_dean_of_students_staff_student_activity_detail` joins dean_of_students_staffs with student_activities to show which activities each dean oversees. This view answers: which student programs fall under each dean's supervision? Dean staff member 102 oversees activity 168545, the Legacy Framework, which is categorized as a club activity with suspended status.

The conduct administration system described in this chapter represents a comprehensive framework for managing student behavior, policy compliance, and institutional accountability. The interconnection between students, policy documents, suspensions, directives, activities, hearings, hearing boards, and administrative staff creates a web of relationships that supports both operational efficiency and regulatory compliance. Each entity carries its own set of attributes and lifecycle states, while the junction tables and analytical views provide the mechanisms for cross-referencing and reporting. The data values documented throughout this chapter—student identifiers such as 392507 and id_16, policy documents like IVC10I and 605943, suspension records including b2b10e52-8fcd-11eb-924d-9cd76263cbd0, and the various issuing authorities and outcomes—illustrate the depth and specificity of the records maintained by the system. For practitioners, understanding these relationships is essential for conducting audits, generating reports, resolving disputes, and ensuring that every conduct matter is properly documented, properly adjudicated, and properly closed.