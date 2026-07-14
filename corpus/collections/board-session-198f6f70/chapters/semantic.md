## Ontology-Grounded Relational Modelling of Zoning Board Governance

The domain under examination captures the administrative lifecycle of a municipal zoning board — an entity that convenes formal sessions, adjudicates land-use applications, and records the decisions of its members and staff. At the conceptual level, the ontology distinguishes several entity types: sessions (temporal governance events), board members and board staff (actors with distinct roles), zoning cases (the substantive applications under review), applicants and their representatives (parties to those applications), building reports (technical assessments), and board motions (formal decisions). Each entity type materialises as a base table whose columns encode attributes and foreign-key relationships that preserve referential integrity across the normalised schema. The following sections trace how the ontology's classes, properties, and cardinality constraints become columns, keys, junction tables, and derived views.

**Table `board_sessions`**

| board_session_id | session_date | start_time | end_time | session_type | panel_designation | location | chairperson_name | is_precedent_setting | zoning_case_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2022-09-11 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | Briefing | baseline-panel-19 | extended-location-99 | Jennifer Summers | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2023-02-22 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | Public Hearing | pilot-panel-20 | integrated-location-100 | Michael Oconnell | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2024-07-06 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | Briefing | extended-panel-21 | seasonal-location-101 | Sean Green | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2025-12-17 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | Public Hearing | integrated-panel-22 | regional-location-102 | Kimberly Myers | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `board_sessions` table anchors the temporal dimension of the domain. Its primary key, `board_session_id`, uniquely identifies each governance event, while `session_date` records the calendar date on which the session occurred — for instance, session 1 took place on 2022-09-11. The `start_time` and `end_time` columns capture the precise temporal boundaries of the session; session 2, for example, began at 2025-08-11T21:59:00 and concluded at 2024-07-10T20:44:00. The `session_type` column distinguishes between `Briefing` and `Public Hearing` sessions, and `panel_designation` assigns a panel identifier such as `baseline-panel-19` or `pilot-panel-20`. The `location` column records where the session was held — `extended-location-99`, `integrated-location-100`, and so on. The `chairperson_name` column names the presiding officer, with entries like Jennifer Summers, Michael Oconnell, Sean Green, and Kimberly Myers. The boolean `is_precedent_setting` flag indicates whether the session established a binding precedent, and `zoning_case_id` serves as a foreign key linking the session to a specific zoning case, thereby embedding the case within the session's temporal context. Audit columns `created_at` and `updated_at` record the lifecycle timestamps of the session record itself.

**Table `board_members`**

| board_member_id | member_id | full_name | role | is_present | voting_record | board_session_id | board_motion_id |
|---|---|---|---|---|---|---|---|
| 1000 | 10207158 | Theodore Mcgrath | Vice Chair | false | Ayes | 1 | 1 |
| 1001 | 10207158 | Account Name | Regular Member | true | Nays | 2 | 2 |
| 1002 | 25820616 | Saipan International Airport | Alternate Member | false | Absent | 3 | 3 |
| 1003 | 2002007020250 | Norma Fisher | Vice Chair | true | Ayes | 4 | 4 |

The `board_members` table models the individuals who serve on the zoning board. Its primary key `board_member_id` provides a stable surrogate identifier, while `member_id` carries the person's internal identifier — for example, Theodore Mcgrath is identified as 10207158. The `full_name` column stores the person's name, and `role` classifies their position as `Vice Chair`, `Regular Member`, or `Alternate Member`. The boolean `is_present` records attendance, and `voting_record` captures the member's vote as `Ayes`, `Nays`, or `Absent`. The foreign key `board_session_id` links each membership record to the session in which the member participated, and `board_motion_id` links the record to a specific motion. This dual foreign-key structure means that a single board member can appear in multiple sessions and cast votes on multiple motions, with each row representing a distinct participation event.

**Table `board_staffs`**

| board_staff_id | staff_id | full_name | job_title | is_present | board_session_id | zoning_case_id |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Board Administrator | false | 1 | 1 |
| 2 | 3158139 | Account Name | Asst. City Attorney | true | 2 | 2 |
| 3 | 8189502 | Saipan International Airport | Development Code Specialist | false | 3 | 3 |
| 4 | 69438 | Norma Fisher | Chief Engineer | true | 4 | 4 |

The `board_staffs` table captures the non-voting personnel who support board operations. Its primary key `board_staff_id` distinguishes individual staff records, while `staff_id` carries the internal identifier (e.g., 937735 for Theodore Mcgrath in a staff capacity). The `full_name` and `job_title` columns record the person's name and role, with titles such as `Board Administrator`, `Asst. City Attorney`, `Development Code Specialist`, and `Chief Engineer`. The `is_present` boolean tracks attendance, and the foreign key `board_session_id` links the staff member to the session they supported. The `zoning_case_id` foreign key further ties the staff member's participation to a specific zoning case, reflecting the domain fact that staff often assist with particular applications rather than sessions in the abstract.

**Table `zoning_cases`**

| id | file_number | application_date | hearing_date | property_address | legal_description | zoning_district | requested_relief | status | applicant_id | representative_id | board_session_id | building_report_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | FIL-2275 | 2022-05-16 | 2025-04-02 | pilot-property-14 | Composite Protocol | adaptive-zoning-95 | regional-requeste-18 | Pending | 1000 | 1 | 1 | 1000 |
| 2 | FIL-2277 | 2023-10-27 | 2022-09-13 | extended-property-15 | Compact Programme A | distributed-zoning-96 | legacy-requeste-19 | Hearing Scheduled | 1001 | 2 | 2 | 1001 |
| 3 | FIL-2279 | 2024-03-11 | 2023-02-24 | integrated-property-16 | Legacy Standard | baseline-zoning-97 | compact-requeste-20 | Approved | 1002 | 3 | 3 | 1002 |
| 4 | FIL-2281 | 2025-08-22 | 2024-07-08 | seasonal-property-17 | Regional Framework | pilot-zoning-98 | composite-requeste-21 | Denied | 1003 | 4 | 4 | 1003 |

The `zoning_cases` table is the central entity of the domain, representing individual land-use applications. Its primary key `id` uniquely identifies each case, while `file_number` (e.g., `FIL-2275`, `FIL-2277`) provides the administrative filing reference. The `application_date` and `hearing_date` columns record when the application was submitted and when it was heard. The `property_address` column identifies the affected property — `pilot-property-14`, `extended-property-15`, `integrated-property-16`, `seasonal-property-17` — and `legal_description` provides the formal legal description such as `Composite Protocol` or `Compact Programme A`. The `zoning_district` column classifies the applicable zoning district (e.g., `adaptive-zoning-95`, `distributed-zoning-96`), and `requested_relief` records the type of relief sought. The `status` column tracks the case lifecycle with values like `Pending`, `Hearing Scheduled`, `Approved`, and `Denied`. Foreign keys `applicant_id`, `representative_id`, `board_session_id`, and `building_report_id` link the case to its applicant, representative, the session at which it was heard, and the associated building report, respectively.

**Table `applicants`**

| applicant_id | full_name | contact_info | representation_status | zoning_case_id | representative_id |
|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | Jorge Luis Borges | Self-Represented | 1 | 1 |
| 1001 | Account Name | Focus Device | Attorney-Represented | 2 | 2 |
| 1002 | Saipan International Airport | Thomas Rivers | Agent-Represented | 3 | 3 |
| 1003 | Norma Fisher | Kimberly Myers | Self-Represented | 4 | 4 |

The `applicants` table models the parties who submit zoning applications. Its primary key `applicant_id` identifies each applicant, while `full_name` stores their name. The `contact_info` column holds contact details — for instance, Jorge Luis Borges, Focus Device, Thomas Rivers, and Kimberly Myers appear as contact entries. The `representation_status` column classifies how the applicant is represented: `Self-Represented`, `Attorney-Represented`, or `Agent-Represented`. The foreign key `zoning_case_id` links the applicant to the case they filed, and `representative_id` links to their legal or agent representative.

**Table `representatives`**

| id | representative_id | full_name | profession | applicant_id | board_session_id |
|---|---|---|---|---|---|
| 1 | 2106720 | Theodore Mcgrath | Attorney | 1000 | 1 |
| 2 | 6969429 | Account Name | Agent | 1001 | 2 |
| 3 | developing-talent | Saipan International Airport | Surveyor | 1002 | 3 |
| 4 | 5917300 | Norma Fisher | Engineer | 1003 | 4 |

The `representatives` table captures the attorneys, agents, and surveyors who represent applicants. Its primary key `id` distinguishes representative records, while `representative_id` carries the person's internal identifier. The `full_name` column stores the name, and `profession` classifies the type of representation — `Attorney`, `Agent`, `Surveyor`, or `Engineer`. The foreign key `applicant_id` links the representative to the applicant they serve, and `board_session_id` links the representative to the session at which they participated.

**Table `building_reports`**

| id | report_id | report_date | prepared_by | regulation_cited | finding | recommendation | zoning_case_id | board_staff_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2024-03-02 | composite-prepared-15 | primary-regulati-64 | seasonal-finding-23 | pilot-recommen-38 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 8189500 | 2025-08-13 | primary-prepared-16 | adaptive-regulati-65 | regional-finding-24 | extended-recommen-39 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | L355 | 2022-01-24 | adaptive-prepared-17 | distributed-regulati-66 | legacy-finding-25 | integrated-recommen-40 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 5844272 | 2023-06-08 | distributed-prepared-18 | baseline-regulati-67 | compact-finding-26 | seasonal-recommen-41 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `building_reports` table stores technical assessments associated with zoning cases. Its primary key `building_report_id` identifies each report, and the foreign key `zoning_case_id` links the report to the case it assesses. This table materialises the ontology relationship between building reports and zoning cases as a one-to-many or one-to-one association, depending on whether multiple reports can be filed per case.

**Table `board_motions`**

| board_motion_id | motion_id | motion_text | proposed_by | seconded_by | outcome | vote_count | board_session_id | board_member_id | seconded_by_member_board_member_id | votes_on_board_member_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | OECD-CORE | pilot-motion-86 | baseline-proposed-73 | integrated-seconded-64 | Passed | 36 | 1 | 1000 | 1000 | 1000 |
| 2 | 69422 | extended-motion-87 | pilot-proposed-74 | seasonal-seconded-65 | Failed | 232 | 2 | 1001 | 1001 | 1001 |
| 3 | ChIJr7cItPtt5kcRM6ry7ecIYgw | integrated-motion-88 | extended-proposed-75 | regional-seconded-66 | Withdrawn | 57 | 3 | 1002 | 1002 | 1002 |
| 4 | 4180962 | seasonal-motion-89 | integrated-proposed-76 | legacy-seconded-67 | Passed | 70 | 4 | 1003 | 1003 | 1003 |

The `board_motions` table records formal decisions made during board sessions. Its primary key `board_motion_id` identifies each motion, and the foreign key `board_session_id` links the motion to the session in which it was adopted. This table, together with the `board_motion_id` column in `board_members`, enables the reconstruction of which members voted on which motions.

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

The `sessions_members` table is a junction table that materialises the many-to-many relationship between board sessions and board members. It resolves the domain fact that any board member may participate in any session, and any session may involve multiple members. The table's composite key (typically formed from `board_session_id` and `board_member_id`) enforces referential integrity by referencing the primary keys of both `board_sessions` and `board_members`. This normalisation avoids repeating member data across session rows and allows the ontology's participation relationship to be queried independently of attendance or voting records.

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

The `sessions_staffs` table is the analogous junction table for the relationship between board sessions and board staff. It resolves the many-to-many association between sessions and staff members, ensuring that the domain fact — any staff member may support any session — is captured without data duplication. Its composite key references `board_sessions` and `board_staffs`, providing a clean normalised representation of staff participation.

With the base tables and junction tables established, the schema supports a rich set of derived views that reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question by assembling relevant columns from multiple tables into a denormalised result set.

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

This view reconstructs the full detail of each board member's participation in a session. By joining `board_sessions` with `board_members` on `board_session_id`, it produces rows that combine session metadata (date, type, panel designation, location, chairperson) with member-level data (name, role, attendance, voting record). Reading the row for session 1, the view would show Jennifer Summers as chairperson of a `Briefing` session on 2022-09-11, with Theodore Mcgrath (Vice Chair) marked as not present and having voted `Ayes`. This view answers the question: "What was the composition and outcome of each session from the perspective of its board members?"

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

Analogous to the member detail view, this view joins `board_sessions` with `board_staffs` on `board_session_id` to present each staff member's participation alongside session metadata. For session 2, the view would show Michael Oconnell as chairperson of a `Public Hearing`, with Account Name (Asst. City Attorney) marked as present. This view answers: "Which staff supported each session, and in what capacity?"

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

This view joins `board_sessions` with `zoning_cases` on `board_session_id` to present each zoning case alongside the session at which it was heard. For case 1 (filed as `FIL-2275`, status `Pending`), the view would show it was heard during session 1, a `Briefing` chaired by Jennifer Summers. This view answers: "Which zoning cases were addressed in which sessions, and what were their statuses?"

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

This view joins `board_members` with `board_sessions` on `board_session_id` to present each member's session participation. It answers the question: "Which sessions did each board member attend, and what were the session characteristics?" For board member 1000 (Theodore Mcgrath, Vice Chair), the view would show participation in session 1, a `Briefing` on 2022-09-11.

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

This view joins `board_members` with `board_motions` on `board_motion_id` to present each member's voting record on specific motions. For board member 1000, the view would show a vote on motion 1 with a record of `Ayes`. This view answers: "How did each board member vote on each motion?"

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

This view joins `board_staffs` with `board_sessions` on `board_session_id` to present each staff member's session assignments. For board staff 2 (Account Name, Asst. City Attorney), the view would show participation in session 2, a `Public Hearing` chaired by Michael Oconnell. This view answers: "Which sessions did each staff member support?"

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

This view joins `board_staffs` with `zoning_cases` on `zoning_case_id` to present each staff member's case assignments. For board staff 1 (Theodore Mcgrath, Board Administrator), the view would show involvement with case 1 (`FIL-2275`, status `Pending`). This view answers: "Which zoning cases did each staff member assist with?"

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

This view joins `zoning_cases` with `applicants` on `applicant_id` to present each zoning case alongside its applicant. For case 1, the view would show applicant Theodore Mcgrath with contact info Jorge Luis Borges and representation status `Self-Represented`. This view answers: "Who applied for each zoning case, and how were they represented?"

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

This view joins `zoning_cases` with `representatives` on `representative_id` to present each zoning case alongside its representative. For case 1, the view would show representative Theodore Mcgrath (Attorney). This view answers: "Which representative was assigned to each zoning case?"

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

This view joins `zoning_cases` with `board_sessions` on `board_session_id` to present each zoning case alongside the session at which it was heard. For case 3 (`FIL-2279`, status `Approved`), the view would show it was heard during session 3, a `Briefing` chaired by Sean Green. This view answers: "When and where was each zoning case heard?"

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

This view joins `zoning_cases` with `building_reports` on `building_report_id` to present each zoning case alongside its associated building report. For case 1, the view would link the case to building report 1000. This view answers: "Which building report is associated with each zoning case?"

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

This view joins `applicants` with `zoning_cases` on `zoning_case_id` to present each applicant alongside the case they filed. For applicant 1000 (Theodore Mcgrath), the view would show case 1 (`FIL-2275`, status `Pending`). This view answers: "Which case did each applicant file?"

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

This view joins `applicants` with `representatives` on `representative_id` to present each applicant alongside their representative. For applicant 1000, the view would show representative 1 (Theodore Mcgrath, Attorney). This view answers: "Which representative serves each applicant?"

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

This view joins `representatives` with `applicants` on `applicant_id` to present each representative alongside the applicant they serve. For representative 1 (Theodore Mcgrath, Attorney), the view would show applicant 1000 (Theodore Mcgrath, Self-Represented). This view answers: "Which applicant does each representative serve?"

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

This view joins `representatives` with `board_sessions` on `board_session_id` to present each representative alongside the session at which they participated. For representative 1, the view would show participation in session 1, a `Briefing` on 2022-09-11. This view answers: "At which sessions did each representative participate?"

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

This view joins `building_reports` with `zoning_cases` on `zoning_case_id` to present each building report alongside the case it assesses. For building report 1000, the view would show case 1 (`FIL-2275`, property `pilot-property-14`). This view answers: "Which zoning case does each building report assess?"

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

This view joins `building_reports` with `board_staffs` on `board_staff_id` to present each building report alongside the staff member associated with it. For building report 1000, the view would show board staff 4 (Norma Fisher, Chief Engineer). This view answers: "Which staff member is associated with each building report?"

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

This view joins `board_motions` with `board_sessions` on `board_session_id` to present each motion alongside the session in which it was adopted. For motion 1, the view would show it was adopted during session 1, a `Briefing` chaired by Jennifer Summers. This view answers: "In which session was each motion adopted?"

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

This view joins `board_motions` with `board_members` on `board_motion_id` to present each motion alongside the members who voted on it. For motion 1, the view would show board member 1000 (Theodore Mcgrath, Vice Chair) with a voting record of `Ayes`. This view answers: "Which board members voted on each motion, and how did they vote?"

The materialisation of this ontology into a relational schema demonstrates a disciplined application of normalisation principles. Each entity type becomes a table with a primary key and attribute columns; each binary relationship becomes either a foreign key (when the cardinality is one-to-many) or a junction table (when the cardinality is many-to-many). The junction tables `sessions_members` and `sessions_staffs` resolve the many-to-many relationships between sessions and actors, while the foreign keys embedded in `board_members`, `board_staffs`, `zoning_cases`, `applicants`, `representatives`, `building_reports`, and `board_motions` encode the one-to-many associations. The derived views then reconstruct the domain facts by joining these normalised tables, each view answering a specific analytical question by assembling the relevant columns into a denormalised result set. The representative values — Theodore Mcgrath appearing as both a board member and a board staff, Jennifer Summers chairing session 1, case `FIL-2275` pending at `pilot-property-14` — are not incidental; they are the concrete instantiations of the ontology's classes and relationships, materialised as rows in the relational schema.