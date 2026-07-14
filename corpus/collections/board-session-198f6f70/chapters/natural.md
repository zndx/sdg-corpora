## Municipal Zoning Board Governance: Records, Processes, and Analytical Views

Municipal zoning boards operate at the intersection of land-use policy, legal procedure, and public administration. Each board session functions as a formal hearing where applicants seek relief from existing zoning regulations, board members deliberate and vote, and staff provide technical and legal support. The governance records capture every dimension of this process: when sessions convene, who participates, which zoning cases are on the docket, what relief is requested, and how motions are recorded. Understanding these records requires tracing the flow from an applicant's filing through technical review, board deliberation, and final disposition. The following sections describe the entities, their relationships, and the analytical views that practitioners use to monitor case progress, track participation, and audit decision-making.

## Board Sessions and Governance Structure

The operational heartbeat of the zoning board is the board session, a scheduled meeting where cases are heard and motions are put forward. Each session carries a date, start and end times, a type designation, and a panel assignment that determines which members are convened.

**Table `board_sessions`**

| board_session_id | session_date | start_time | end_time | session_type | panel_designation | location | chairperson_name | is_precedent_setting | zoning_case_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | Briefing | baseline-panel-19 | extended-location-99 | Jennifer Summers | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | Public Hearing | pilot-panel-20 | integrated-location-100 | Michael Oconnell | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | Briefing | extended-panel-21 | seasonal-location-101 | Sean Green | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | Public Hearing | integrated-panel-22 | regional-location-102 | Kimberly Myers | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

A session such as the one recorded on 2022-09-11 (board_session_id 1) was classified as a Briefing under the panel_designation baseline-panel-19, held at extended-location-99, and chaired by Jennifer Summers. That session was not marked as precedent-setting, and it was associated with zoning_case_id 1. By contrast, session 2, held on 2023-02-22, was a Public Hearing under pilot-panel-20, chaired by Michael Oconnell, and flagged as precedent-setting. The session_type field distinguishes between Briefing sessions, which are typically informational or preparatory, and Public Hearing sessions, where formal arguments and votes occur. The is_precedent_setting flag signals whether the session's outcomes may establish interpretive guidance for future cases.

Board members are the individuals who sit on the panel and cast votes. Their records link them to specific sessions and to the motions that arise during those sessions.

**Table `board_members`**

| board_member_id | member_id | full_name | role | is_present | voting_record | board_session_id | board_motion_id |
|---|---|---|---|---|---|---|---|
| 1000 | 10207158 | Theodore Mcgrath | Vice Chair | false | Ayes | 1 | 1 |
| 1001 | 10207158 | Account Name | Regular Member | true | Nays | 2 | 2 |
| 1002 | 25820616 | Saipan International Airport | Alternate Member | false | Absent | 3 | 3 |
| 1003 | 2002007020250 | Norma Fisher | Vice Chair | true | Ayes | 4 | 4 |

Theodore Mcgrath (board_member_id 1000) served as Vice Chair during session 1 but was not present, as indicated by is_present being false; his voting_record shows Ayes, which may reflect a pre-recorded or proxy position. Norma Fisher (board_member_id 1003), also a Vice Chair, was present during session 4 and recorded Ayes on board_motion_id 4. The role field distinguishes Vice Chairs, Regular Members, and Alternate Members, each with potentially different voting privileges. The board_session_id column anchors each member's participation to a specific meeting, while board_motion_id ties their vote to the formal motion under consideration.

Board staff provide the administrative, legal, and technical support necessary for sessions to proceed. Their records are linked to both sessions and the zoning cases being heard.

**Table `board_staffs`**

| board_staff_id | staff_id | full_name | job_title | is_present | board_session_id | zoning_case_id |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Board Administrator | false | 1 | 1 |
| 2 | 3158139 | Account Name | Asst. City Attorney | true | 2 | 2 |
| 3 | 8189502 | Saipan International Airport | Development Code Specialist | false | 3 | 3 |
| 4 | 69438 | Norma Fisher | Chief Engineer | true | 4 | 4 |

Theodore Mcgrath (board_staff_id 1, staff_id 937735) served as Board Administrator during session 1 for zoning_case_id 1 but was not present. Norma Fisher (board_staff_id 4, staff_id 69438), listed as Chief Engineer, was present during session 4 for zoning_case_id 4. The job_title field captures the functional role—Board Administrator, Asst. City Attorney, Development Code Specialist, Chief Engineer—reflecting the multidisciplinary support structure. The is_present flag and the dual linkage to board_session_id and zoning_case_id allow practitioners to reconstruct which staff supported which case during which session.

## Zoning Cases and the Application Pipeline

Zoning cases are the substantive matters before the board. Each case represents a property owner's or entity's request for relief from current zoning regulations, and the case record captures the procedural timeline, property details, and the requested action.

**Table `zoning_cases`**

| id | file_number | application_date | hearing_date | property_address | legal_description | zoning_district | requested_relief | status | applicant_id | representative_id | board_session_id | building_report_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | pilot-property-14 | Composite Protocol | adaptive-zoning-95 | regional-requeste-18 | Pending | 1000 | 1 | 1 | 1000 |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | extended-property-15 | Compact Programme A | distributed-zoning-96 | legacy-requeste-19 | Hearing Scheduled | 1001 | 2 | 2 | 1001 |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | integrated-property-16 | Legacy Standard | baseline-zoning-97 | compact-requeste-20 | Approved | 1002 | 3 | 3 | 1002 |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | seasonal-property-17 | Regional Framework | pilot-zoning-98 | composite-requeste-21 | Denied | 1003 | 4 | 4 | 1003 |

Case FIL-2275 (id 1) was filed on 2022-05-16, with a hearing date of 2025-04-02, concerning pilot-property-14 under the legal description Composite Protocol. The property falls within the adaptive-zoning-95 district, and the requested relief is labeled regional-requeste-18. Its status is Pending, and it is associated with applicant_id 1000, representative_id 1, board_session_id 1, and building_report_id 1000. Case FIL-2281 (id 4), filed on 2025-08-22, has a status of Denied, indicating a final disposition. The status field progresses through values such as Pending, Hearing Scheduled, Approved, and Denied, providing a clear pipeline view of case lifecycle.

Applicants are the parties initiating zoning requests. Their records include contact information and a representation_status that indicates whether they are proceeding pro se or with professional representation.

**Table `applicants`**

| applicant_id | full_name | contact_info | representation_status | zoning_case_id | representative_id |
|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Jorge Luis Borges | Self-Represented | 1 | 1 |
| 1001 | Account Name | Focus Device | Attorney-Represented | 2 | 2 |
| 1002 | Saipan International Airport | Thomas Rivers | Agent-Represented | 3 | 3 |
| 1003 | Norma Fisher | Kimberly Myers | Self-Represented | 4 | 4 |

Applicant 1000, Theodore Mcgrath, is listed as Self-Represented with contact information attributed to Jorge Luis Borges, and is linked to zoning_case_id 1 and representative_id 1. Applicant 1001, Account Name, is Attorney-Represented with contact information listed as Focus Device, tied to zoning_case_id 2 and representative_id 2. The representation_status field—Self-Represented, Attorney-Represented, Agent-Represented—determines procedural requirements such as whether a licensed professional must accompany the filing.

Representatives are the attorneys, agents, or surveyors who act on behalf of applicants. Their records include professional designation and linkage to both the applicant and the board session where they participated.

**Table `representatives`**

| id | representative_id | full_name | profession | applicant_id | board_session_id |
|---|---|---|---|---|---|
| 1 | 2106720 | Theodore Mcgrath | Attorney | 1000 | 1 |
| 2 | 6969429 | Account Name | Agent | 1001 | 2 |
| 3 | developing-talent | Saipan International Airport | Surveyor | 1002 | 3 |
| 4 | 5917300 | Norma Fisher | Engineer | 1003 | 4 |

Representative 2106720, Theodore Mcgrath, is an Attorney representing applicant 1000 and participated in board_session_id 1. Representative developing-talent (id 3), Saipan International Airport, is a Surveyor representing applicant 1002 during board_session_id 3. The profession field—Attorney, Agent, Surveyor, Engineer—reflects the range of professional roles that may appear before the board. The board_session_id column indicates which session the representative attended, enabling practitioners to track professional participation patterns.

## Technical Review and Building Reports

Before a zoning case reaches the board for a hearing, technical assessments are typically prepared. Building reports document the engineering, structural, or compliance analysis of the proposed relief.

**Table `building_reports`**

| id | report_id | report_date | prepared_by | regulation_cited | finding | recommendation | zoning_case_id | board_staff_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | composite-prepared-15 | primary-regulati-64 | seasonal-finding-23 | pilot-recommen-38 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 8189500 | 2025-08-13 | primary-prepared-16 | adaptive-regulati-65 | regional-finding-24 | extended-recommen-39 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | L355 | 2022-01-24 | adaptive-prepared-17 | distributed-regulati-66 | legacy-finding-25 | integrated-recommen-40 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 5844272 | 2023-06-08 | distributed-prepared-18 | baseline-regulati-67 | compact-finding-26 | seasonal-recommen-41 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Building report 1000 is associated with zoning_case_id 1, and building report 1003 with zoning_case_id 4. While the specific content of each report is captured in the full record, the linkage to both the zoning case and the board staff who may have authored or reviewed it provides an audit trail for technical due diligence.

## Motions and Decision Records

Board motions formalize the decisions reached during sessions. Each motion is tied to a specific board session and to the board members who voted on it.

**Table `board_motions`**

| board_motion_id | motion_id | motion_text | proposed_by | seconded_by | outcome | vote_count | board_session_id | board_member_id | seconded_by_member_board_member_id | votes_on_board_member_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | OECD-CORE | pilot-motion-86 | baseline-proposed-73 | integrated-seconded-64 | Passed | 36 | 1 | 1000 | 1000 | 1000 |
| 2 | 69422 | extended-motion-87 | pilot-proposed-74 | seasonal-seconded-65 | Failed | 232 | 2 | 1001 | 1001 | 1001 |
| 3 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | extended-proposed-75 | regional-seconded-66 | Withdrawn | 57 | 3 | 1002 | 1002 | 1002 |
| 4 | 4180962 | seasonal-motion-89 | integrated-proposed-76 | legacy-seconded-67 | Passed | 70 | 4 | 1003 | 1003 | 1003 |

The motion records capture the formal outcome of deliberations. Each motion is associated with a board_session_id, anchoring the decision to the session where it was adopted, and with board_member_id entries that record individual voting positions. The motion_id serves as the primary key for tracking the lifecycle of each decision, from introduction to adoption or rejection.

## Session Participation Tracking

The governance of zoning boards requires precise tracking of who attended which sessions. Two junction tables manage the many-to-many relationships between sessions and participants.

**Table `sessions_members`**

| board_session_id | board_member_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The sessions_members table records which board members were scheduled or confirmed for each session. It bridges board_member_id to board_session_id, allowing the system to distinguish between members who are routinely assigned to a panel and those who attended a specific meeting.

**Table `sessions_staffs`**

| board_session_id | board_staff_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The sessions_staffs table performs the same bridging function for board staff, linking board_staff_id to board_session_id. Together, these tables enable practitioners to reconstruct attendance patterns, verify quorum, and audit the composition of each session's panel.

## Analytical Views for Case Management

The relational structure of the records supports a range of analytical views that answer specific operational questions. Each view joins base tables to produce a consolidated perspective on a particular aspect of the governance process.

The view vw_board_session_board_member_detail answers the question: which board members participated in which sessions, and what were their voting positions? It joins board_sessions with board_members to produce rows such as session 1 (Briefing, chaired by Jennifer Summers) with Theodore Mcgrath listed as Vice Chair, present=false, voting_record=Ayes. This view is essential for verifying attendance and cross-referencing member roles against session outcomes.

**View `vw_board_session_board_member_detail`**

```sql
CREATE VIEW vw_board_session_board_member_detail AS
SELECT a.board_session_id, a.session_date, a.start_time, b.board_member_id AS member_board_member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM board_sessions a
  JOIN sessions_members j ON j.board_session_id = a.board_session_id
  JOIN board_members b ON b.board_member_id = j.board_member_id;
```

| board_session_id | session_date | start_time | member_board_member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 1000 | 10207158 | Theodore Mcgrath |
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 1001 | 10207158 | Account Name |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 1001 | 10207158 | Account Name |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 1002 | 25820616 | Saipan International Airport |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 1002 | 25820616 | Saipan International Airport |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 1003 | 2002007020250 | Norma Fisher |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 1003 | 2002007020250 | Norma Fisher |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 1000 | 10207158 | Theodore Mcgrath |

The view vw_board_session_board_staff_detail answers: which staff supported which sessions, and were they present? A row from this view might show session 2 (Public Hearing, chaired by Michael Oconnell) with Account Name serving as Asst. City Attorney, is_present=true, and linked to zoning_case_id 2. This view supports staffing audits and ensures that required legal or technical support was present at each hearing.

**View `vw_board_session_board_staff_detail`**

```sql
CREATE VIEW vw_board_session_board_staff_detail AS
SELECT a.board_session_id, a.session_date, a.start_time, b.board_staff_id AS staff_board_staff_id, b.staff_id AS staff_staff_id, b.full_name AS staff_full_name
FROM board_sessions a
  JOIN sessions_staffs j ON j.board_session_id = a.board_session_id
  JOIN board_staffs b ON b.board_staff_id = j.board_staff_id;
```

| board_session_id | session_date | start_time | staff_board_staff_id | staff_staff_id | staff_full_name |
|---|---|---|---|---|---|
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 1 | 937735 | Theodore Mcgrath |
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 2 | 3158139 | Account Name |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 2 | 3158139 | Account Name |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 3 | 8189502 | Saipan International Airport |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 3 | 8189502 | Saipan International Airport |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 4 | 69438 | Norma Fisher |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 4 | 69438 | Norma Fisher |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 1 | 937735 | Theodore Mcgrath |

The view vw_board_session_zoning_case answers: which zoning cases were heard during which sessions? It joins board_sessions with zoning_cases, producing rows such as session 3 (Briefing, chaired by Sean Green) associated with zoning_case FIL-2279, status Approved. This view provides a high-level docket map, showing the relationship between session types and case dispositions.

**View `vw_board_session_zoning_case`**

```sql
CREATE VIEW vw_board_session_zoning_case AS
SELECT a.board_session_id, a.session_date, a.start_time, a.end_time, b.id AS case_id, b.file_number AS case_file_number, b.application_date AS case_application_date
FROM board_sessions a JOIN zoning_cases b ON a.zoning_case_id = b.id;
```

| board_session_id | session_date | start_time | end_time | case_id | case_file_number | case_application_date |
|---|---|---|---|---|---|---|
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | FIL-2275 | 2022-05-16 |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | FIL-2277 | 2023-10-27 |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | FIL-2279 | 2024-03-11 |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | FIL-2281 | 2025-08-22 |

The view vw_board_member_board_session answers the inverse question from the member's perspective: for each board member, which sessions did they attend? A row might show board_member_id 1003 (Norma Fisher, Vice Chair) linked to board_session_id 4, a Public Hearing that was precedent-setting. This view is useful for evaluating member engagement and consistency of attendance.

**View `vw_board_member_board_session`**

```sql
CREATE VIEW vw_board_member_board_session AS
SELECT a.board_member_id, a.member_id, a.full_name, a.role, b.board_session_id AS session_board_session_id, b.session_date AS session_session_date, b.start_time AS session_start_time
FROM board_members a JOIN board_sessions b ON a.board_session_id = b.board_session_id;
```

| board_member_id | member_id | full_name | role | session_board_session_id | session_session_date | session_start_time |
|---|---|---|---|---|---|---|
| 1000 | 10207158 | Theodore Mcgrath | Vice Chair | 1 | 2022-09-11 | 2024-03-27T14:42:00 |
| 1001 | 10207158 | Account Name | Regular Member | 2 | 2023-02-22 | 2025-08-11T21:59:00 |
| 1002 | 25820616 | Saipan International Airport | Alternate Member | 3 | 2024-07-06 | 2022-01-22T04:16:00 |
| 1003 | 2002007020250 | Norma Fisher | Vice Chair | 4 | 2025-12-17 | 2023-06-06T11:33:00 |

The view vw_board_member_board_motion answers: which motions did each board member vote on, and what was their position? A row might show board_member_id 1000 (Theodore Mcgrath) linked to board_motion_id 1 with voting_record=Ayes. This view supports individual voting history analysis and is critical for transparency and accountability.

**View `vw_board_member_board_motion`**

```sql
CREATE VIEW vw_board_member_board_motion AS
SELECT a.board_member_id, a.member_id, a.full_name, a.role, b.board_motion_id AS motion_board_motion_id, b.motion_id AS motion_motion_id, b.motion_text AS motion_motion_text
FROM board_members a JOIN board_motions b ON a.board_motion_id = b.board_motion_id;
```

| board_member_id | member_id | full_name | role | motion_board_motion_id | motion_motion_id | motion_motion_text |
|---|---|---|---|---|---|---|
| 1000 | 10207158 | Theodore Mcgrath | Vice Chair | 1 | OECD-CORE | pilot-motion-86 |
| 1001 | 10207158 | Account Name | Regular Member | 2 | 69422 | extended-motion-87 |
| 1002 | 25820616 | Saipan International Airport | Alternate Member | 3 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 |
| 1003 | 2002007020250 | Norma Fisher | Vice Chair | 4 | 4180962 | seasonal-motion-89 |

The view vw_board_staff_board_session answers: for each board staff member, which sessions did they support? A row might show board_staff_id 2 (Account Name, Asst. City Attorney) linked to board_session_id 2, a Public Hearing. This view enables staffing pattern analysis and ensures that specialized roles—such as legal counsel or engineering review—were available when needed.

**View `vw_board_staff_board_session`**

```sql
CREATE VIEW vw_board_staff_board_session AS
SELECT a.board_staff_id, a.staff_id, a.full_name, a.job_title, b.board_session_id AS session_board_session_id, b.session_date AS session_session_date, b.start_time AS session_start_time
FROM board_staffs a JOIN board_sessions b ON a.board_session_id = b.board_session_id;
```

| board_staff_id | staff_id | full_name | job_title | session_board_session_id | session_session_date | session_start_time |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Board Administrator | 1 | 2022-09-11 | 2024-03-27T14:42:00 |
| 2 | 3158139 | Account Name | Asst. City Attorney | 2 | 2023-02-22 | 2025-08-11T21:59:00 |
| 3 | 8189502 | Saipan International Airport | Development Code Specialist | 3 | 2024-07-06 | 2022-01-22T04:16:00 |
| 4 | 69438 | Norma Fisher | Chief Engineer | 4 | 2025-12-17 | 2023-06-06T11:33:00 |

The view vw_board_staff_zoning_case answers: which staff were assigned to which zoning cases? A row might show board_staff_id 3 (Saipan International Airport, Development Code Specialist) linked to zoning_case_id 3. This view supports workload distribution analysis and ensures that technical expertise was matched to case complexity.

**View `vw_board_staff_zoning_case`**

```sql
CREATE VIEW vw_board_staff_zoning_case AS
SELECT a.board_staff_id, a.staff_id, a.full_name, a.job_title, b.id AS case_id, b.file_number AS case_file_number, b.application_date AS case_application_date
FROM board_staffs a JOIN zoning_cases b ON a.zoning_case_id = b.id;
```

| board_staff_id | staff_id | full_name | job_title | case_id | case_file_number | case_application_date |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Board Administrator | 1 | FIL-2275 | 2022-05-16 |
| 2 | 3158139 | Account Name | Asst. City Attorney | 2 | FIL-2277 | 2023-10-27 |
| 3 | 8189502 | Saipan International Airport | Development Code Specialist | 3 | FIL-2279 | 2024-03-11 |
| 4 | 69438 | Norma Fisher | Chief Engineer | 4 | FIL-2281 | 2025-08-22 |

The view vw_zoning_case_applicant answers: which applicant filed which zoning case, and what is their representation status? A row might show zoning_case FIL-2275 with applicant Theodore Mcgrath, representation_status=Self-Represented. This view provides a case-to-applicant mapping that is essential for tracking filing patterns and representation trends.

**View `vw_zoning_case_applicant`**

```sql
CREATE VIEW vw_zoning_case_applicant AS
SELECT a.id, a.file_number, a.application_date, a.hearing_date, b.applicant_id AS applicant_applicant_id, b.full_name AS applicant_full_name, b.contact_info AS applicant_contact_info
FROM zoning_cases a JOIN applicants b ON a.applicant_id = b.applicant_id;
```

| id | file_number | application_date | hearing_date | applicant_applicant_id | applicant_full_name | applicant_contact_info |
|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | 1000 | Theodore Mcgrath | Jorge Luis Borges |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | 1001 | Account Name | Focus Device |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | 1002 | Saipan International Airport | Thomas Rivers |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | 1003 | Norma Fisher | Kimberly Myers |

The view vw_zoning_case_representative answers: which representative is assigned to which zoning case, and what is their profession? A row might show zoning_case FIL-2277 with representative Account Name, profession=Agent. This view supports the tracking of professional representation across the case docket.

**View `vw_zoning_case_representative`**

```sql
CREATE VIEW vw_zoning_case_representative AS
SELECT a.id, a.file_number, a.application_date, a.hearing_date, b.id AS representative_id, b.representative_id AS representative_representative_id, b.full_name AS representative_full_name
FROM zoning_cases a JOIN representatives b ON a.representative_id = b.id;
```

| id | file_number | application_date | hearing_date | representative_id | representative_representative_id | representative_full_name |
|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | 1 | 2106720 | Theodore Mcgrath |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | 2 | 6969429 | Account Name |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | 3 | developing-talent | Saipan International Airport |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | 4 | 5917300 | Norma Fisher |

The view vw_zoning_case_board_session answers: which board session heard which zoning case, and what was the session type? A row might show zoning_case FIL-2279 (status Approved) heard during board_session_id 3, a Briefing session. This view provides a case-centric view of the hearing process.

**View `vw_zoning_case_board_session`**

```sql
CREATE VIEW vw_zoning_case_board_session AS
SELECT a.id, a.file_number, a.application_date, a.hearing_date, b.board_session_id AS session_board_session_id, b.session_date AS session_session_date, b.start_time AS session_start_time
FROM zoning_cases a JOIN board_sessions b ON a.board_session_id = b.board_session_id;
```

| id | file_number | application_date | hearing_date | session_board_session_id | session_session_date | session_start_time |
|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | 1 | 2022-09-11 | 2024-03-27T14:42:00 |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | 2 | 2023-02-22 | 2025-08-11T21:59:00 |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | 3 | 2024-07-06 | 2022-01-22T04:16:00 |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | 4 | 2025-12-17 | 2023-06-06T11:33:00 |

The view vw_zoning_case_building_report answers: which building report is associated with which zoning case? A row might show zoning_case FIL-2281 linked to building_report_id 1003. This view ensures that technical review documentation is traceable to the case it supports.

**View `vw_zoning_case_building_report`**

```sql
CREATE VIEW vw_zoning_case_building_report AS
SELECT a.id, a.file_number, a.application_date, a.hearing_date, b.id AS report_id, b.report_id AS report_report_id, b.report_date AS report_report_date
FROM zoning_cases a JOIN building_reports b ON a.building_report_id = b.id;
```

| id | file_number | application_date | hearing_date | report_id | report_report_id | report_report_date |
|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | 1000 | 1202-0008-S | 2024-03-02 |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | 1001 | 8189500 | 2025-08-13 |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | 1002 | L355 | 2022-01-24 |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | 1003 | 5844272 | 2023-06-08 |

The view vw_applicant_zoning_case answers: for each applicant, which zoning case did they file? A row might show applicant 1001 (Account Name, Attorney-Represented) linked to zoning_case FIL-2277. This view is useful for applicant-level analysis, including repeat filers and representation patterns.

**View `vw_applicant_zoning_case`**

```sql
CREATE VIEW vw_applicant_zoning_case AS
SELECT a.applicant_id, a.full_name, a.contact_info, a.representation_status, b.id AS case_id, b.file_number AS case_file_number, b.application_date AS case_application_date
FROM applicants a JOIN zoning_cases b ON a.zoning_case_id = b.id;
```

| applicant_id | full_name | contact_info | representation_status | case_id | case_file_number | case_application_date |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Jorge Luis Borges | Self-Represented | 1 | FIL-2275 | 2022-05-16 |
| 1001 | Account Name | Focus Device | Attorney-Represented | 2 | FIL-2277 | 2023-10-27 |
| 1002 | Saipan International Airport | Thomas Rivers | Agent-Represented | 3 | FIL-2279 | 2024-03-11 |
| 1003 | Norma Fisher | Kimberly Myers | Self-Represented | 4 | FIL-2281 | 2025-08-22 |

The view vw_applicant_representative answers: which representative is associated with which applicant? A row might show applicant 1002 (Saipan International Airport, Agent-Represented) linked to representative developing-talent, profession=Surveyor. This view supports the analysis of professional-client relationships and representation consistency.

**View `vw_applicant_representative`**

```sql
CREATE VIEW vw_applicant_representative AS
SELECT a.applicant_id, a.full_name, a.contact_info, a.representation_status, b.id AS representative_id, b.representative_id AS representative_representative_id, b.full_name AS representative_full_name
FROM applicants a JOIN representatives b ON a.representative_id = b.id;
```

| applicant_id | full_name | contact_info | representation_status | representative_id | representative_representative_id | representative_full_name |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Jorge Luis Borges | Self-Represented | 1 | 2106720 | Theodore Mcgrath |
| 1001 | Account Name | Focus Device | Attorney-Represented | 2 | 6969429 | Account Name |
| 1002 | Saipan International Airport | Thomas Rivers | Agent-Represented | 3 | developing-talent | Saipan International Airport |
| 1003 | Norma Fisher | Kimberly Myers | Self-Represented | 4 | 5917300 | Norma Fisher |

The view vw_representative_applicant answers the inverse: for each representative, which applicants do they represent? A row might show representative 2106720 (Theodore Mcgrath, Attorney) representing applicant 1000. This view is useful for identifying representative workload and specialization.

**View `vw_representative_applicant`**

```sql
CREATE VIEW vw_representative_applicant AS
SELECT a.id, a.representative_id, a.full_name, a.profession, b.applicant_id AS applicant_applicant_id, b.full_name AS applicant_full_name, b.contact_info AS applicant_contact_info
FROM representatives a JOIN applicants b ON a.applicant_id = b.applicant_id;
```

| id | representative_id | full_name | profession | applicant_applicant_id | applicant_full_name | applicant_contact_info |
|---|---|---|---|---|---|---|
| 1 | 2106720 | Theodore Mcgrath | Attorney | 1000 | Theodore Mcgrath | Jorge Luis Borges |
| 2 | 6969429 | Account Name | Agent | 1001 | Account Name | Focus Device |
| 3 | developing-talent | Saipan International Airport | Surveyor | 1002 | Saipan International Airport | Thomas Rivers |
| 4 | 5917300 | Norma Fisher | Engineer | 1003 | Norma Fisher | Kimberly Myers |

The view vw_representative_board_session answers: which board sessions did each representative attend? A row might show representative 6969429 (Account Name, Agent) attending board_session_id 2, a Public Hearing. This view tracks professional participation in hearings and supports attendance verification.

**View `vw_representative_board_session`**

```sql
CREATE VIEW vw_representative_board_session AS
SELECT a.id, a.representative_id, a.full_name, a.profession, b.board_session_id AS session_board_session_id, b.session_date AS session_session_date, b.start_time AS session_start_time
FROM representatives a JOIN board_sessions b ON a.board_session_id = b.board_session_id;
```

| id | representative_id | full_name | profession | session_board_session_id | session_session_date | session_start_time |
|---|---|---|---|---|---|---|
| 1 | 2106720 | Theodore Mcgrath | Attorney | 1 | 2022-09-11 | 2024-03-27T14:42:00 |
| 2 | 6969429 | Account Name | Agent | 2 | 2023-02-22 | 2025-08-11T21:59:00 |
| 3 | developing-talent | Saipan International Airport | Surveyor | 3 | 2024-07-06 | 2022-01-22T04:16:00 |
| 4 | 5917300 | Norma Fisher | Engineer | 4 | 2025-12-17 | 2023-06-06T11:33:00 |

The view vw_building_report_zoning_case answers: for each building report, which zoning case does it support? A row might show building_report_id 1000 linked to zoning_case FIL-2275. This view provides a report-centric audit trail, ensuring that every technical assessment is tied to a specific case.

**View `vw_building_report_zoning_case`**

```sql
CREATE VIEW vw_building_report_zoning_case AS
SELECT a.id, a.report_id, a.report_date, a.prepared_by, b.id AS case_id, b.file_number AS case_file_number, b.application_date AS case_application_date
FROM building_reports a JOIN zoning_cases b ON a.zoning_case_id = b.id;
```

| id | report_id | report_date | prepared_by | case_id | case_file_number | case_application_date |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | composite-prepared-15 | 1 | FIL-2275 | 2022-05-16 |
| 1001 | 8189500 | 2025-08-13 | primary-prepared-16 | 2 | FIL-2277 | 2023-10-27 |
| 1002 | L355 | 2022-01-24 | adaptive-prepared-17 | 3 | FIL-2279 | 2024-03-11 |
| 1003 | 5844272 | 2023-06-08 | distributed-prepared-18 | 4 | FIL-2281 | 2025-08-22 |

The view vw_building_report_board_staff answers: which board staff authored or reviewed which building report? A row might show building_report_id 1001 linked to board_staff_id 2 (Account Name, Asst. City Attorney). This view supports accountability in technical review and ensures that qualified personnel are associated with each assessment.

**View `vw_building_report_board_staff`**

```sql
CREATE VIEW vw_building_report_board_staff AS
SELECT a.id, a.report_id, a.report_date, a.prepared_by, b.board_staff_id AS staff_board_staff_id, b.staff_id AS staff_staff_id, b.full_name AS staff_full_name
FROM building_reports a JOIN board_staffs b ON a.board_staff_id = b.board_staff_id;
```

| id | report_id | report_date | prepared_by | staff_board_staff_id | staff_staff_id | staff_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | composite-prepared-15 | 1 | 937735 | Theodore Mcgrath |
| 1001 | 8189500 | 2025-08-13 | primary-prepared-16 | 2 | 3158139 | Account Name |
| 1002 | L355 | 2022-01-24 | adaptive-prepared-17 | 3 | 8189502 | Saipan International Airport |
| 1003 | 5844272 | 2023-06-08 | distributed-prepared-18 | 4 | 69438 | Norma Fisher |

The view vw_board_motion_board_session answers: for each board motion, which session adopted it? A row might show board_motion_id 1 linked to board_session_id 1, a Briefing session chaired by Jennifer Summers. This view provides a motion-centric view of the decision-making process.

**View `vw_board_motion_board_session`**

```sql
CREATE VIEW vw_board_motion_board_session AS
SELECT a.board_motion_id, a.motion_id, a.motion_text, a.proposed_by, b.board_session_id AS session_board_session_id, b.session_date AS session_session_date, b.start_time AS session_start_time
FROM board_motions a JOIN board_sessions b ON a.board_session_id = b.board_session_id;
```

| board_motion_id | motion_id | motion_text | proposed_by | session_board_session_id | session_session_date | session_start_time |
|---|---|---|---|---|---|---|
| 1 | OECD-CORE | pilot-motion-86 | baseline-proposed-73 | 1 | 2022-09-11 | 2024-03-27T14:42:00 |
| 2 | 69422 | extended-motion-87 | pilot-proposed-74 | 2 | 2023-02-22 | 2025-08-11T21:59:00 |
| 3 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | extended-proposed-75 | 3 | 2024-07-06 | 2022-01-22T04:16:00 |
| 4 | 4180962 | seasonal-motion-89 | integrated-proposed-76 | 4 | 2025-12-17 | 2023-06-06T11:33:00 |

The view vw_board_motion_board_member answers: for each board motion, which members voted and what was their position? A row might show board_motion_id 2 linked to board_member_id 1001 (Account Name, Regular Member) with voting_record=Nays. This view is the primary tool for analyzing voting patterns, quorum verification, and individual member decision histories.

**View `vw_board_motion_board_member`**

```sql
CREATE VIEW vw_board_motion_board_member AS
SELECT a.board_motion_id, a.motion_id, a.motion_text, a.proposed_by, b.board_member_id AS member_board_member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM board_motions a JOIN board_members b ON a.board_member_id = b.board_member_id;
```

| board_motion_id | motion_id | motion_text | proposed_by | member_board_member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | OECD-CORE | pilot-motion-86 | baseline-proposed-73 | 1000 | 10207158 | Theodore Mcgrath |
| 2 | 69422 | extended-motion-87 | pilot-proposed-74 | 1001 | 10207158 | Account Name |
| 3 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | extended-proposed-75 | 1002 | 25820616 | Saipan International Airport |
| 4 | 4180962 | seasonal-motion-89 | integrated-proposed-76 | 1003 | 2002007020250 | Norma Fisher |

## Closing Synthesis

The zoning board governance system is a tightly interwoven set of records that capture the full lifecycle of a land-use case—from initial filing by an applicant, through technical review by building report authors, to formal hearing before a convened board session, and finally to a recorded motion and vote. The base tables establish the entities: sessions that convene, members and staff who participate, cases that are heard, applicants who file, representatives who advocate, reports that assess, and motions that decide. The junction tables sessions_members and sessions_staffs manage the attendance relationships that are essential for quorum and accountability. The analytical views translate these relational links into operational perspectives: docket maps, attendance audits, voting histories, representation tracking, and technical review traceability. Together, they form a comprehensive record of municipal zoning governance, enabling practitioners to monitor case progress, verify procedural compliance, and understand the patterns of decision-making that shape land-use policy.