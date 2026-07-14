## The Architecture of Youth Empowerment Summits

Youth empowerment summits represent a structured ecosystem where educational institutions, youth-serving organizations, and individual participants converge around shared developmental themes. Each summit operates as a discrete event with a defined temporal window, a guiding theme, and a measurable attendance footprint. The records track everything from the edition number and summit identifier to the precise start and end timestamps, capturing both the logistical and thematic dimensions of these gatherings. A summit such as SUM-2675, the nineteenth edition, ran from September fifth through September first of 2022 with an attendance of eighteen, anchored by the adaptive-current-71 theme and hosted in partnership with the educational institution identified as 1000 and the youth organization 790471. Larger gatherings like SUM-2681, the forty-first edition, drew 16,791 attendees under the baseline-current-73 banner, demonstrating the scale variation across the program.

**Table `youth_empowerment_summits`**

| youth_empowerment_summit_id | summit_identifier | edition_number | start_date | end_date | total_attendance | current_theme | educational_institution_id | youth_organization_org_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 18 | adaptive-current-71 | 1000 | 790471 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SUM-2678 | 30 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 316 | distributed-current-72 | 1001 | 1717 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SUM-2681 | 41 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 16791 | baseline-current-73 | 1002 | 69437 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SUM-2684 | 52 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 62 | pilot-current-74 | 1003 | m16 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The institutional backbone of each summit comes from educational institutions that serve as primary venues or sponsoring entities. These institutions carry their own internal identifiers alongside human-readable names such as Extended Corridor, Pilot Series A, Baseline Assessment, and Distributed Survey. Each is classified by a school level—ranging from pilot-school-38 to seasonal-school-41—and situated within a city-state pairing like integrated-city-34 in distributed-state-84. A boolean flag, is_safe_space, indicates whether the institution meets particular safety criteria, with institutions 1000 and 1002 reporting true and institutions 1001 and 1003 reporting false. The linkage between an institution and a summit is explicit: institution 1000 is tied to summit 1, institution 1001 to summit 2, and so on through the four-record sequence.

**Table `educational_institutions`**

| educational_institution_id | institution_id | institution_name | city | state | school_level | is_safe_space | youth_empowerment_summit_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 9424913 | Extended Corridor | integrated-city-34 | distributed-state-84 | pilot-school-38 | true | 1 | 2025-01-01 00:14:00 |
| 1001 | 8189481 | Pilot Series A | seasonal-city-35 | baseline-state-85 | extended-school-39 | false | 2 | 2025-02-06 03:14:00 |
| 1002 | 1437604 | Baseline Assessment | regional-city-36 | pilot-state-86 | integrated-school-40 | true | 3 | 2025-03-11 06:14:00 |
| 1003 | 884346 | Distributed Survey | legacy-city-37 | extended-state-87 | seasonal-school-41 | false | 4 | 2025-04-16 09:14:00 |

Youth organizations complement the institutional framework by providing operational capacity and community reach. Each organization is identified by an org_id that may be numeric, such as 790471 or 1717, or alphanumeric, as with m16. Names like Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster describe the entities, while headquarters locations span city-state pairs including seasonal-headquar-83 in compact-headquar-74 and compact-headquar-86 in adaptive-headquar-77. The operating_model field captures the organizational approach—integrated-operatin-64, seasonal-operatin-65, regional-operatin-66, and legacy-operatin-67—and the youth_board_proportion quantifies youth representation on governing boards, ranging from 5.20 for Extended Review up to 17.80 for Distributed Cluster. Every organization is associated with exactly one summit, mirroring the one-to-one summit-institution pairing.

**Table `youth_organizations`**

| org_id | org_name | headquarters_city | headquarters_state | operating_model | youth_board_proportion | youth_empowerment_summit_id |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | seasonal-headquar-83 | compact-headquar-74 | integrated-operatin-64 | 5.20 | 1 |
| 1717 | Pilot Initiative A | regional-headquar-84 | composite-headquar-75 | seasonal-operatin-65 | 9.40 | 2 |
| 69437 | Baseline Model | legacy-headquar-85 | primary-headquar-76 | regional-operatin-66 | 13.60 | 3 |
| m16 | Distributed Cluster | compact-headquar-86 | adaptive-headquar-77 | legacy-operatin-67 | 17.80 | 4 |

Individual participation is recorded through youth participants, each carrying a unique id, a participant_id, and a full_name. Names in the dataset include Theodore Mcgrath, Account Name, Saipan International Airport, and Norma Fisher—each representing a distinct attendee record. The grade_level field uses coded values such as adaptive-grade-65 and distributed-grade-66, while school_affiliation references a specific school like pilot-school-26 or seasonal-school-29. The identity_group field categorizes participants with values like extended-identity-63 and regional-identity-66, and the role field assigns functional designations such as pilot-role-20 and seasonal-role-23. Every participant is linked to a summit, an educational institution, and a panel discussion, forming a tripartite relationship that anchors their involvement.

**Table `youth_participants`**

| id | participant_id | full_name | grade_level | school_affiliation | identity_group | role | youth_empowerment_summit_id | educational_institution_id | panel_discussion_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | adaptive-grade-65 | pilot-school-26 | extended-identity-63 | pilot-role-20 | 1 | 1000 | 2087758 |
| 1001 | 4716387 | Account Name | distributed-grade-66 | extended-school-27 | integrated-identity-64 | extended-role-21 | 2 | 1001 | 4277009 |
| 1002 | 69430 | Saipan International Airport | baseline-grade-67 | integrated-school-28 | seasonal-identity-65 | integrated-role-22 | 3 | 1002 | 6926358 |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-grade-68 | seasonal-school-29 | regional-identity-66 | seasonal-role-23 | 4 | 1003 | 9424910 |

Conference workshops constitute the educational programming layer of each summit. Each workshop carries a conference_workshop_id, a workshop_id, a workshop_title, and a topic classification. Titles such as Baseline Series D, Distributed Assessment, Adaptive Survey, and Primary Corridor A describe the sessions, while topics like distributed-topic-60 and baseline-topic-61 categorize subject matter. The duration_minutes field records session length—35, 38, 41, and 44 minutes across the four records—and boolean flags is_youth_only and is_comprehensive indicate access restrictions and scope. Workshop 100, for instance, is both youth-only and comprehensive with a 35-minute duration, while workshop 101 is neither, lasting 38 minutes. Each workshop is associated with a summit and a staff member, establishing both an event-level and a personnel-level linkage.

**Table `conference_workshops`**

| conference_workshop_id | workshop_id | workshop_title | topic | duration_minutes | is_youth_only | is_comprehensive | youth_empowerment_summit_id | staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 8928498 | Baseline Series D | distributed-topic-60 | 35 | true | true | 1 | 1 |
| 101 | 12383516 | Distributed Assessment | baseline-topic-61 | 38 | false | false | 2 | 2 |
| 102 | 9424920 | Adaptive Survey | pilot-topic-62 | 41 | true | true | 3 | 3 |
| 103 | 2986231 | Primary Corridor A | extended-topic-63 | 44 | false | false | 4 | 4 |

Panel discussions provide a complementary format for knowledge exchange. Each panel is identified by a panel_id and characterized by a panel_theme, a number_of_panelists, a moderator_name, a recording status, and a discussion_focus. Panel 2087758 carries the composite-panel-69 theme with 16 panelists and Primary Framework A as moderator, and it is marked as recorded with a seasonal-discussi-11 focus. Panel 4277009 features 22 panelists under the primary-panel-70 theme with Composite Protocol moderating, and it is not recorded. Panel 6926358 has 28 panelists and Compact Programme as moderator, while panel 9424910 carries the largest roster at 34 panelists with Legacy Standard D moderating. Each panel is tied to a specific summit, maintaining the event-level organizational structure.

**Table `panel_discussions`**

| panel_id | panel_theme | number_of_panelists | moderator_name | is_recorded | discussion_focus | youth_empowerment_summit_id |
|---|---|---|---|---|---|---|
| 2087758 | composite-panel-69 | 16 | Primary Framework A | true | seasonal-discussi-11 | 1 |
| 4277009 | primary-panel-70 | 22 | Composite Protocol | false | regional-discussi-12 | 2 |
| 6926358 | adaptive-panel-71 | 28 | Compact Programme | true | legacy-discussi-13 | 3 |
| 9424910 | distributed-panel-72 | 34 | Legacy Standard D | false | compact-discussi-14 | 4 |

Staff members serve as the operational personnel connecting workshops and panels to their parent organizations and summits. The staff_members table records individual contributors who facilitate sessions, coordinate logistics, and provide subject-matter expertise. Their records are linked to youth organizations through the organizations_members junction table and to workshops and panels through the discussions_members junction table, creating a network of personnel assignments that span the entire summit ecosystem.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | job_title | is_youth | is_trainer | is_moderator | youth_organization_org_id | conference_workshop_id | panel_discussion_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Primary Initiative A | true | false | true | 790471 | 100 | 2087758 |
| 2 | 3158139 | Account Name | Composite Model | false | true | false | 1717 | 101 | 4277009 |
| 3 | 8189502 | Saipan International Airport | Compact Cluster | true | false | true | 69437 | 102 | 6926358 |
| 4 | 69438 | Norma Fisher | Legacy Review D | false | true | false | m16 | 103 | 9424910 |

The relational structure extends through a series of junction tables that model many-to-many relationships between the core entities. The summits_workshops table links summits to their constituent workshops, while summits_discussions performs the same function for panel discussions. The institutions_participants table records which educational institutions are associated with which participants, and organizations_members captures the staff-to-organization assignments. The organizations_participants table connects youth organizations to individual participants, while participants_workshops and workshops_participants (dual entries reflecting bidirectional relationship tracking) record participant enrollment in specific workshops. The discussions_members and discussions_participants tables complete the network by linking staff to panels and participants to panels respectively.

**Table `summits_workshops`**

| youth_empowerment_summit_id | conference_workshop_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `summits_discussions`**

| youth_empowerment_summit_id | panel_discussion_panel_id |
|---|---|
| 1 | 2087758 |
| 1 | 4277009 |
| 2 | 4277009 |
| 2 | 6926358 |
| 3 | 6926358 |
| 3 | 9424910 |
| 4 | 9424910 |
| 4 | 2087758 |

**Table `institutions_participants`**

| educational_institution_id | youth_participant_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `organizations_members`**

| youth_organization_org_id | staff_member_id |
|---|---|
| 790471 | 1 |
| 790471 | 2 |
| 1717 | 2 |
| 1717 | 3 |
| 69437 | 3 |
| 69437 | 4 |
| m16 | 4 |
| m16 | 1 |

**Table `organizations_participants`**

| youth_organization_org_id | youth_participant_id |
|---|---|
| 790471 | 1000 |
| 790471 | 1001 |
| 1717 | 1001 |
| 1717 | 1002 |
| 69437 | 1002 |
| 69437 | 1003 |
| m16 | 1003 |
| m16 | 1000 |

**Table `participants_workshops`**

| youth_participant_id | conference_workshop_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `workshops_participants`**

| conference_workshop_id | youth_participant_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `discussions_members`**

| panel_discussion_panel_id | staff_member_id |
|---|---|
| 2087758 | 1 |
| 2087758 | 2 |
| 4277009 | 2 |
| 4277009 | 3 |
| 6926358 | 3 |
| 6926358 | 4 |
| 9424910 | 4 |
| 9424910 | 1 |

**Table `discussions_participants`**

| panel_discussion_panel_id | youth_participant_id |
|---|---|
| 2087758 | 1000 |
| 2087758 | 1001 |
| 4277009 | 1001 |
| 4277009 | 1002 |
| 6926358 | 1002 |
| 6926358 | 1003 |
| 9424910 | 1003 |
| 9424910 | 1000 |

The analytical power of the system emerges through a comprehensive set of views that join these base tables into interpretable records. The youth_empowerment_summit_educational_institution_view answers the question of which educational institutions are associated with which summits, combining summit identifiers like SUM-2675 and SUM-2678 with institution names such as Extended Corridor and Pilot Series A. Reading the first row reveals that summit SUM-2675, edition 19, is linked to the Extended Corridor institution in integrated-city-34, a pilot-school-38 classified as a safe space. The second row shows SUM-2678 paired with Pilot Series A in seasonal-city-35, which is not designated as a safe space.

**View `youth_empowerment_summit_educational_institution_view`**

```sql
CREATE VIEW youth_empowerment_summit_educational_institution_view AS
SELECT a.youth_empowerment_summit_id, a.summit_identifier, a.edition_number, a.start_date, b.educational_institution_id AS institution_educational_institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM youth_empowerment_summits a JOIN educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| youth_empowerment_summit_id | summit_identifier | edition_number | start_date | institution_educational_institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 2022-09-05T20:24:00 | 1000 | 9424913 | Extended Corridor |
| 2 | SUM-2678 | 30 | 2023-02-16T03:41:00 | 1001 | 8189481 | Pilot Series A |
| 3 | SUM-2681 | 41 | 2024-07-27T10:58:00 | 1002 | 1437604 | Baseline Assessment |
| 4 | SUM-2684 | 52 | 2025-12-11T17:15:00 | 1003 | 884346 | Distributed Survey |

The youth_empowerment_summit_youth_organization_view performs an equivalent join for organizations, revealing that summit SUM-2675 is associated with Extended Review (org_id 790471), headquartered in seasonal-headquar-83, operating under the integrated-operatin-64 model with a youth_board_proportion of 5.20. Summit SUM-2681 connects to Baseline Model (org_id 69437), which has the highest youth_board_proportion at 13.60 and operates under regional-operatin-66.

**View `youth_empowerment_summit_youth_organization_view`**

```sql
CREATE VIEW youth_empowerment_summit_youth_organization_view AS
SELECT a.youth_empowerment_summit_id, a.summit_identifier, a.edition_number, a.start_date, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.headquarters_city AS organization_headquarters_city
FROM youth_empowerment_summits a JOIN youth_organizations b ON a.youth_organization_org_id = b.org_id;
```

| youth_empowerment_summit_id | summit_identifier | edition_number | start_date | organization_org_id | organization_org_name | organization_headquarters_city |
|---|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 2022-09-05T20:24:00 | 790471 | Extended Review | seasonal-headquar-83 |
| 2 | SUM-2678 | 30 | 2023-02-16T03:41:00 | 1717 | Pilot Initiative A | regional-headquar-84 |
| 3 | SUM-2681 | 41 | 2024-07-27T10:58:00 | 69437 | Baseline Model | legacy-headquar-85 |
| 4 | SUM-2684 | 52 | 2025-12-11T17:15:00 | m16 | Distributed Cluster | compact-headquar-86 |

The youth_empowerment_summit_conference_workshop_detail_view joins summit metadata with workshop details, answering which workshops belong to which summits. The first row pairs SUM-2675 with the Baseline Series D workshop (conference_workshop_id 100), a 35-minute session on distributed-topic-60 that is both youth-only and comprehensive, facilitated by staff member 1. The third row links SUM-2681 to the Adaptive Survey workshop (conference_workshop_id 102), a 41-minute pilot-topic-62 session that is also youth-only and comprehensive, under staff member 3.

**View `youth_empowerment_summit_conference_workshop_detail_view`**

```sql
CREATE VIEW youth_empowerment_summit_conference_workshop_detail_view AS
SELECT a.youth_empowerment_summit_id, a.summit_identifier, a.edition_number, b.conference_workshop_id AS workshop_conference_workshop_id, b.workshop_id AS workshop_workshop_id, b.workshop_title AS workshop_workshop_title
FROM youth_empowerment_summits a
  JOIN summits_workshops j ON j.youth_empowerment_summit_id = a.youth_empowerment_summit_id
  JOIN conference_workshops b ON b.conference_workshop_id = j.conference_workshop_id;
```

| youth_empowerment_summit_id | summit_identifier | edition_number | workshop_conference_workshop_id | workshop_workshop_id | workshop_workshop_title |
|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 100 | 8928498 | Baseline Series D |
| 1 | SUM-2675 | 19 | 101 | 12383516 | Distributed Assessment |
| 2 | SUM-2678 | 30 | 101 | 12383516 | Distributed Assessment |
| 2 | SUM-2678 | 30 | 102 | 9424920 | Adaptive Survey |
| 3 | SUM-2681 | 41 | 102 | 9424920 | Adaptive Survey |
| 3 | SUM-2681 | 41 | 103 | 2986231 | Primary Corridor A |
| 4 | SUM-2684 | 52 | 103 | 2986231 | Primary Corridor A |
| 4 | SUM-2684 | 52 | 100 | 8928498 | Baseline Series D |

The youth_empowerment_summit_panel_discussion_detail_view similarly joins summit records with panel discussion metadata. Summit SUM-2675 is associated with panel 2087758, the composite-panel-69 discussion moderated by Primary Framework A, featuring 16 panelists and marked as recorded. Summit SUM-2681 connects to panel 4277009, the primary-panel-70 discussion with 22 panelists and Composite Protocol as moderator, which is not recorded.

**View `youth_empowerment_summit_panel_discussion_detail_view`**

```sql
CREATE VIEW youth_empowerment_summit_panel_discussion_detail_view AS
SELECT a.youth_empowerment_summit_id, a.summit_identifier, a.edition_number, b.panel_id AS discussion_panel_id, b.panel_theme AS discussion_panel_theme, b.number_of_panelists AS discussion_number_of_panelists
FROM youth_empowerment_summits a
  JOIN summits_discussions j ON j.youth_empowerment_summit_id = a.youth_empowerment_summit_id
  JOIN panel_discussions b ON b.panel_id = j.panel_discussion_panel_id;
```

| youth_empowerment_summit_id | summit_identifier | edition_number | discussion_panel_id | discussion_panel_theme | discussion_number_of_panelists |
|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 2087758 | composite-panel-69 | 16 |
| 1 | SUM-2675 | 19 | 4277009 | primary-panel-70 | 22 |
| 2 | SUM-2678 | 30 | 4277009 | primary-panel-70 | 22 |
| 2 | SUM-2678 | 30 | 6926358 | adaptive-panel-71 | 28 |
| 3 | SUM-2681 | 41 | 6926358 | adaptive-panel-71 | 28 |
| 3 | SUM-2681 | 41 | 9424910 | distributed-panel-72 | 34 |
| 4 | SUM-2684 | 52 | 9424910 | distributed-panel-72 | 34 |
| 4 | SUM-2684 | 52 | 2087758 | composite-panel-69 | 16 |

The educational_institution_youth_empowerment_summit_view inverts the perspective, presenting each institution alongside its summit details. The first row shows institution 1000 (Extended Corridor) with summit SUM-2675, edition 19, 18 attendees, and the adaptive-current-71 theme. The third row presents institution 1002 (Baseline Assessment) with summit SUM-2681, edition 41, 16,791 attendees, and the baseline-current-73 theme.

**View `educational_institution_youth_empowerment_summit_view`**

```sql
CREATE VIEW educational_institution_youth_empowerment_summit_view AS
SELECT a.educational_institution_id, a.institution_id, a.institution_name, a.city, b.youth_empowerment_summit_id AS summit_youth_empowerment_summit_id, b.summit_identifier AS summit_summit_identifier, b.edition_number AS summit_edition_number
FROM educational_institutions a JOIN youth_empowerment_summits b ON a.youth_empowerment_summit_id = b.youth_empowerment_summit_id;
```

| educational_institution_id | institution_id | institution_name | city | summit_youth_empowerment_summit_id | summit_summit_identifier | summit_edition_number |
|---|---|---|---|---|---|---|
| 1000 | 9424913 | Extended Corridor | integrated-city-34 | 1 | SUM-2675 | 19 |
| 1001 | 8189481 | Pilot Series A | seasonal-city-35 | 2 | SUM-2678 | 30 |
| 1002 | 1437604 | Baseline Assessment | regional-city-36 | 3 | SUM-2681 | 41 |
| 1003 | 884346 | Distributed Survey | legacy-city-37 | 4 | SUM-2684 | 52 |

The educational_institution_youth_participant_detail_view joins institutions with their associated participants, answering which participants are affiliated with which institutions. The first row links institution 1000 (Extended Corridor) to participant 1000, Theodore Mcgrath, who holds adaptive-grade-65 status, is affiliated with pilot-school-26, belongs to the extended-identity-63 group, and serves in the pilot-role-20 capacity. The fourth row connects institution 1003 (Distributed Survey) to participant 1003, Norma Fisher, at pilot-grade-68, affiliated with seasonal-school-29, in the regional-identity-66 group, and serving as seasonal-role-23.

**View `educational_institution_youth_participant_detail_view`**

```sql
CREATE VIEW educational_institution_youth_participant_detail_view AS
SELECT a.educational_institution_id, a.institution_id, a.institution_name, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM educational_institutions a
  JOIN institutions_participants j ON j.educational_institution_id = a.educational_institution_id
  JOIN youth_participants b ON b.id = j.youth_participant_id;
```

| educational_institution_id | institution_id | institution_name | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|
| 1000 | 9424913 | Extended Corridor | 1000 | 3990185 | Theodore Mcgrath |
| 1000 | 9424913 | Extended Corridor | 1001 | 4716387 | Account Name |
| 1001 | 8189481 | Pilot Series A | 1001 | 4716387 | Account Name |
| 1001 | 8189481 | Pilot Series A | 1002 | 69430 | Saipan International Airport |
| 1002 | 1437604 | Baseline Assessment | 1002 | 69430 | Saipan International Airport |
| 1002 | 1437604 | Baseline Assessment | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 1003 | 884346 | Distributed Survey | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 1003 | 884346 | Distributed Survey | 1000 | 3990185 | Theodore Mcgrath |

The youth_organization_youth_empowerment_summit_view presents organizations alongside their summit associations. The first row shows Extended Review (org_id 790471) with summit SUM-2675, edition 19, 18 attendees, and adaptive-current-71 theme. The fourth row presents Distributed Cluster (org_id m16) with summit SUM-2684, edition 52, 62 attendees, and the pilot-current-74 theme.

**View `youth_organization_youth_empowerment_summit_view`**

```sql
CREATE VIEW youth_organization_youth_empowerment_summit_view AS
SELECT a.org_id, a.org_name, a.headquarters_city, a.headquarters_state, b.youth_empowerment_summit_id AS summit_youth_empowerment_summit_id, b.summit_identifier AS summit_summit_identifier, b.edition_number AS summit_edition_number
FROM youth_organizations a JOIN youth_empowerment_summits b ON a.youth_empowerment_summit_id = b.youth_empowerment_summit_id;
```

| org_id | org_name | headquarters_city | headquarters_state | summit_youth_empowerment_summit_id | summit_summit_identifier | summit_edition_number |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | seasonal-headquar-83 | compact-headquar-74 | 1 | SUM-2675 | 19 |
| 1717 | Pilot Initiative A | regional-headquar-84 | composite-headquar-75 | 2 | SUM-2678 | 30 |
| 69437 | Baseline Model | legacy-headquar-85 | primary-headquar-76 | 3 | SUM-2681 | 41 |
| m16 | Distributed Cluster | compact-headquar-86 | adaptive-headquar-77 | 4 | SUM-2684 | 52 |

The youth_organization_staff_member_detail_view joins organizations with their staff members, revealing the personnel assignments within each organization. The first row connects Extended Review (org_id 790471) to staff member 1, who is associated with summit SUM-2675. The fourth row links Distributed Cluster (org_id m16) to staff member 4, associated with summit SUM-2684.

**View `youth_organization_staff_member_detail_view`**

```sql
CREATE VIEW youth_organization_staff_member_detail_view AS
SELECT a.org_id, a.org_name, a.headquarters_city, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM youth_organizations a
  JOIN organizations_members j ON j.youth_organization_org_id = a.org_id
  JOIN staff_members b ON b.staff_member_id = j.staff_member_id;
```

| org_id | org_name | headquarters_city | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|
| 790471 | Extended Review | seasonal-headquar-83 | 1 | 937735 | Theodore Mcgrath |
| 790471 | Extended Review | seasonal-headquar-83 | 2 | 3158139 | Account Name |
| 1717 | Pilot Initiative A | regional-headquar-84 | 2 | 3158139 | Account Name |
| 1717 | Pilot Initiative A | regional-headquar-84 | 3 | 8189502 | Saipan International Airport |
| 69437 | Baseline Model | legacy-headquar-85 | 3 | 8189502 | Saipan International Airport |
| 69437 | Baseline Model | legacy-headquar-85 | 4 | 69438 | Norma Fisher |
| m16 | Distributed Cluster | compact-headquar-86 | 4 | 69438 | Norma Fisher |
| m16 | Distributed Cluster | compact-headquar-86 | 1 | 937735 | Theodore Mcgrath |

The youth_organization_youth_participant_detail_view connects organizations to participants, answering which participants are associated with which organizations. The first row shows Extended Review (org_id 790471) linked to participant 1000, Theodore Mcgrath, at adaptive-grade-65, affiliated with pilot-school-26, in the extended-identity-63 group, serving as pilot-role-20, and attending summit SUM-2675. The fourth row connects Distributed Cluster (org_id m16) to participant 1003, Norma Fisher, at pilot-grade-68, affiliated with seasonal-school-29, in the regional-identity-66 group, serving as seasonal-role-23, and attending summit SUM-2684.

**View `youth_organization_youth_participant_detail_view`**

```sql
CREATE VIEW youth_organization_youth_participant_detail_view AS
SELECT a.org_id, a.org_name, a.headquarters_city, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM youth_organizations a
  JOIN organizations_participants j ON j.youth_organization_org_id = a.org_id
  JOIN youth_participants b ON b.id = j.youth_participant_id;
```

| org_id | org_name | headquarters_city | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|
| 790471 | Extended Review | seasonal-headquar-83 | 1000 | 3990185 | Theodore Mcgrath |
| 790471 | Extended Review | seasonal-headquar-83 | 1001 | 4716387 | Account Name |
| 1717 | Pilot Initiative A | regional-headquar-84 | 1001 | 4716387 | Account Name |
| 1717 | Pilot Initiative A | regional-headquar-84 | 1002 | 69430 | Saipan International Airport |
| 69437 | Baseline Model | legacy-headquar-85 | 1002 | 69430 | Saipan International Airport |
| 69437 | Baseline Model | legacy-headquar-85 | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| m16 | Distributed Cluster | compact-headquar-86 | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| m16 | Distributed Cluster | compact-headquar-86 | 1000 | 3990185 | Theodore Mcgrath |

The youth_participant_youth_empowerment_summit_view joins participants with their summit details, providing a participant-centric view of event attendance. The first row shows Theodore Mcgrath (participant 1000) attending summit SUM-2675, edition 19, with 18 attendees and the adaptive-current-71 theme. The third row presents Saipan International Airport (participant 1002) at summit SUM-2681, edition 41, with 16,791 attendees and the baseline-current-73 theme.

**View `youth_participant_youth_empowerment_summit_view`**

```sql
CREATE VIEW youth_participant_youth_empowerment_summit_view AS
SELECT a.id, a.participant_id, a.full_name, a.grade_level, b.youth_empowerment_summit_id AS summit_youth_empowerment_summit_id, b.summit_identifier AS summit_summit_identifier, b.edition_number AS summit_edition_number
FROM youth_participants a JOIN youth_empowerment_summits b ON a.youth_empowerment_summit_id = b.youth_empowerment_summit_id;
```

| id | participant_id | full_name | grade_level | summit_youth_empowerment_summit_id | summit_summit_identifier | summit_edition_number |
|---|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | adaptive-grade-65 | 1 | SUM-2675 | 19 |
| 1001 | 4716387 | Account Name | distributed-grade-66 | 2 | SUM-2678 | 30 |
| 1002 | 69430 | Saipan International Airport | baseline-grade-67 | 3 | SUM-2681 | 41 |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-grade-68 | 4 | SUM-2684 | 52 |

The youth_participant_educational_institution_view links participants to their educational institutions. The first row connects participant 1000, Theodore Mcgrath, to institution 1000, Extended Corridor, located in integrated-city-34, classified as pilot-school-38, and designated as a safe space. The third row links participant 1002, Saipan International Airport, to institution 1002, Baseline Assessment, in regional-city-36, classified as integrated-school-40, and also designated as a safe space.

**View `youth_participant_educational_institution_view`**

```sql
CREATE VIEW youth_participant_educational_institution_view AS
SELECT a.id, a.participant_id, a.full_name, a.grade_level, b.educational_institution_id AS institution_educational_institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM youth_participants a JOIN educational_institutions b ON a.educational_institution_id = b.educational_institution_id;
```

| id | participant_id | full_name | grade_level | institution_educational_institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | adaptive-grade-65 | 1000 | 9424913 | Extended Corridor |
| 1001 | 4716387 | Account Name | distributed-grade-66 | 1001 | 8189481 | Pilot Series A |
| 1002 | 69430 | Saipan International Airport | baseline-grade-67 | 1002 | 1437604 | Baseline Assessment |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-grade-68 | 1003 | 884346 | Distributed Survey |

The youth_participant_conference_workshop_detail_view joins participants with the workshops they attend. The first row shows participant 1000, Theodore Mcgrath, enrolled in workshop 100, Baseline Series D, a 35-minute distributed-topic-60 session that is youth-only and comprehensive, under summit SUM-2675. The third row connects participant 1002, Saipan International Airport, to workshop 102, Adaptive Survey, a 41-minute pilot-topic-62 session that is youth-only and comprehensive, under summit SUM-2681.

**View `youth_participant_conference_workshop_detail_view`**

```sql
CREATE VIEW youth_participant_conference_workshop_detail_view AS
SELECT a.id, a.participant_id, a.full_name, b.conference_workshop_id AS workshop_conference_workshop_id, b.workshop_id AS workshop_workshop_id, b.workshop_title AS workshop_workshop_title
FROM youth_participants a
  JOIN participants_workshops j ON j.youth_participant_id = a.id
  JOIN conference_workshops b ON b.conference_workshop_id = j.conference_workshop_id;
```

| id | participant_id | full_name | workshop_conference_workshop_id | workshop_workshop_id | workshop_workshop_title |
|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | 100 | 8928498 | Baseline Series D |
| 1000 | 3990185 | Theodore Mcgrath | 101 | 12383516 | Distributed Assessment |
| 1001 | 4716387 | Account Name | 101 | 12383516 | Distributed Assessment |
| 1001 | 4716387 | Account Name | 102 | 9424920 | Adaptive Survey |
| 1002 | 69430 | Saipan International Airport | 102 | 9424920 | Adaptive Survey |
| 1002 | 69430 | Saipan International Airport | 103 | 2986231 | Primary Corridor A |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 103 | 2986231 | Primary Corridor A |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 100 | 8928498 | Baseline Series D |

The youth_participant_panel_discussion_view links participants to their panel discussion assignments. The first row shows participant 1000, Theodore Mcgrath, assigned to panel 2087758, the composite-panel-69 discussion with 16 panelists, moderated by Primary Framework A, recorded, with a seasonal-discussi-11 focus, under summit SUM-2675. The fourth row connects participant 1003, Norma Fisher, to panel 9424910, the distributed-panel-72 discussion with 34 panelists, moderated by Legacy Standard D, not recorded, with a compact-discussi-14 focus, under summit SUM-2684.

**View `youth_participant_panel_discussion_view`**

```sql
CREATE VIEW youth_participant_panel_discussion_view AS
SELECT a.id, a.participant_id, a.full_name, a.grade_level, b.panel_id AS discussion_panel_id, b.panel_theme AS discussion_panel_theme, b.number_of_panelists AS discussion_number_of_panelists
FROM youth_participants a JOIN panel_discussions b ON a.panel_discussion_panel_id = b.panel_id;
```

| id | participant_id | full_name | grade_level | discussion_panel_id | discussion_panel_theme | discussion_number_of_panelists |
|---|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | adaptive-grade-65 | 2087758 | composite-panel-69 | 16 |
| 1001 | 4716387 | Account Name | distributed-grade-66 | 4277009 | primary-panel-70 | 22 |
| 1002 | 69430 | Saipan International Airport | baseline-grade-67 | 6926358 | adaptive-panel-71 | 28 |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-grade-68 | 9424910 | distributed-panel-72 | 34 |

The conference_workshop_youth_empowerment_summit_view presents workshops alongside their summit associations. The first row shows workshop 100, Baseline Series D, under summit SUM-2675, edition 19, with 18 attendees and the adaptive-current-71 theme. The third row presents workshop 102, Adaptive Survey, under summit SUM-2681, edition 41, with 16,791 attendees and the baseline-current-73 theme.

**View `conference_workshop_youth_empowerment_summit_view`**

```sql
CREATE VIEW conference_workshop_youth_empowerment_summit_view AS
SELECT a.conference_workshop_id, a.workshop_id, a.workshop_title, a.topic, b.youth_empowerment_summit_id AS summit_youth_empowerment_summit_id, b.summit_identifier AS summit_summit_identifier, b.edition_number AS summit_edition_number
FROM conference_workshops a JOIN youth_empowerment_summits b ON a.youth_empowerment_summit_id = b.youth_empowerment_summit_id;
```

| conference_workshop_id | workshop_id | workshop_title | topic | summit_youth_empowerment_summit_id | summit_summit_identifier | summit_edition_number |
|---|---|---|---|---|---|---|
| 100 | 8928498 | Baseline Series D | distributed-topic-60 | 1 | SUM-2675 | 19 |
| 101 | 12383516 | Distributed Assessment | baseline-topic-61 | 2 | SUM-2678 | 30 |
| 102 | 9424920 | Adaptive Survey | pilot-topic-62 | 3 | SUM-2681 | 41 |
| 103 | 2986231 | Primary Corridor A | extended-topic-63 | 4 | SUM-2684 | 52 |

The conference_workshop_youth_participant_detail_view joins workshops with their enrolled participants. The first row connects workshop 100, Baseline Series D, to participant 1000, Theodore Mcgrath, at adaptive-grade-65, affiliated with pilot-school-26, in the extended-identity-63 group, serving as pilot-role-20, and attending summit SUM-2675. The third row links workshop 102, Adaptive Survey, to participant 1002, Saipan International Airport, at baseline-grade-67, affiliated with integrated-school-28, in the seasonal-identity-65 group, serving as integrated-role-22, and attending summit SUM-2681.

**View `conference_workshop_youth_participant_detail_view`**

```sql
CREATE VIEW conference_workshop_youth_participant_detail_view AS
SELECT a.conference_workshop_id, a.workshop_id, a.workshop_title, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM conference_workshops a
  JOIN workshops_participants j ON j.conference_workshop_id = a.conference_workshop_id
  JOIN youth_participants b ON b.id = j.youth_participant_id;
```

| conference_workshop_id | workshop_id | workshop_title | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|
| 100 | 8928498 | Baseline Series D | 1000 | 3990185 | Theodore Mcgrath |
| 100 | 8928498 | Baseline Series D | 1001 | 4716387 | Account Name |
| 101 | 12383516 | Distributed Assessment | 1001 | 4716387 | Account Name |
| 101 | 12383516 | Distributed Assessment | 1002 | 69430 | Saipan International Airport |
| 102 | 9424920 | Adaptive Survey | 1002 | 69430 | Saipan International Airport |
| 102 | 9424920 | Adaptive Survey | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 103 | 2986231 | Primary Corridor A | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 103 | 2986231 | Primary Corridor A | 1000 | 3990185 | Theodore Mcgrath |

The conference_workshop_staff_member_view joins workshops with their facilitating staff members. The first row shows workshop 100, Baseline Series D, facilitated by staff member 1, under summit SUM-2675, with Extended Corridor as the associated institution and Extended Review as the associated organization. The third row connects workshop 102, Adaptive Survey, to staff member 3, under summit SUM-2681, with Baseline Assessment as the institution and Baseline Model as the organization.

**View `conference_workshop_staff_member_view`**

```sql
CREATE VIEW conference_workshop_staff_member_view AS
SELECT a.conference_workshop_id, a.workshop_id, a.workshop_title, a.topic, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM conference_workshops a JOIN staff_members b ON a.staff_member_id = b.staff_member_id;
```

| conference_workshop_id | workshop_id | workshop_title | topic | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|---|
| 100 | 8928498 | Baseline Series D | distributed-topic-60 | 1 | 937735 | Theodore Mcgrath |
| 101 | 12383516 | Distributed Assessment | baseline-topic-61 | 2 | 3158139 | Account Name |
| 102 | 9424920 | Adaptive Survey | pilot-topic-62 | 3 | 8189502 | Saipan International Airport |
| 103 | 2986231 | Primary Corridor A | extended-topic-63 | 4 | 69438 | Norma Fisher |

The panel_discussion_youth_empowerment_summit_view presents panels alongside their summit associations. The first row shows panel 2087758, the composite-panel-69 discussion, under summit SUM-2675, edition 19, with 18 attendees and the adaptive-current-71 theme. The fourth row presents panel 9424910, the distributed-panel-72 discussion, under summit SUM-2684, edition 52, with 62 attendees and the pilot-current-74 theme.

**View `panel_discussion_youth_empowerment_summit_view`**

```sql
CREATE VIEW panel_discussion_youth_empowerment_summit_view AS
SELECT a.panel_id, a.panel_theme, a.number_of_panelists, a.moderator_name, b.youth_empowerment_summit_id AS summit_youth_empowerment_summit_id, b.summit_identifier AS summit_summit_identifier, b.edition_number AS summit_edition_number
FROM panel_discussions a JOIN youth_empowerment_summits b ON a.youth_empowerment_summit_id = b.youth_empowerment_summit_id;
```

| panel_id | panel_theme | number_of_panelists | moderator_name | summit_youth_empowerment_summit_id | summit_summit_identifier | summit_edition_number |
|---|---|---|---|---|---|---|
| 2087758 | composite-panel-69 | 16 | Primary Framework A | 1 | SUM-2675 | 19 |
| 4277009 | primary-panel-70 | 22 | Composite Protocol | 2 | SUM-2678 | 30 |
| 6926358 | adaptive-panel-71 | 28 | Compact Programme | 3 | SUM-2681 | 41 |
| 9424910 | distributed-panel-72 | 34 | Legacy Standard D | 4 | SUM-2684 | 52 |

The panel_discussion_staff_member_detail_view joins panels with their staff assignments. The first row connects panel 2087758, the composite-panel-69 discussion, to staff member 1, under summit SUM-2675, with Extended Corridor as the institution and Extended Review as the organization. The fourth row links panel 9424910, the distributed-panel-72 discussion, to staff member 4, under summit SUM-2684, with Distributed Survey as the institution and Distributed Cluster as the organization.

**View `panel_discussion_staff_member_detail_view`**

```sql
CREATE VIEW panel_discussion_staff_member_detail_view AS
SELECT a.panel_id, a.panel_theme, a.number_of_panelists, b.staff_member_id AS member_staff_member_id, b.staff_id AS member_staff_id, b.full_name AS member_full_name
FROM panel_discussions a
  JOIN discussions_members j ON j.panel_discussion_panel_id = a.panel_id
  JOIN staff_members b ON b.staff_member_id = j.staff_member_id;
```

| panel_id | panel_theme | number_of_panelists | member_staff_member_id | member_staff_id | member_full_name |
|---|---|---|---|---|---|
| 2087758 | composite-panel-69 | 16 | 1 | 937735 | Theodore Mcgrath |
| 2087758 | composite-panel-69 | 16 | 2 | 3158139 | Account Name |
| 4277009 | primary-panel-70 | 22 | 2 | 3158139 | Account Name |
| 4277009 | primary-panel-70 | 22 | 3 | 8189502 | Saipan International Airport |
| 6926358 | adaptive-panel-71 | 28 | 3 | 8189502 | Saipan International Airport |
| 6926358 | adaptive-panel-71 | 28 | 4 | 69438 | Norma Fisher |
| 9424910 | distributed-panel-72 | 34 | 4 | 69438 | Norma Fisher |
| 9424910 | distributed-panel-72 | 34 | 1 | 937735 | Theodore Mcgrath |

The panel_discussion_youth_participant_detail_view joins panels with their assigned participants. The first row shows panel 2087758, the composite-panel-69 discussion, with participant 1000, Theodore Mcgrath, at adaptive-grade-65, affiliated with pilot-school-26, in the extended-identity-63 group, serving as pilot-role-20, and attending summit SUM-2675. The fourth row connects panel 9424910, the distributed-panel-72 discussion, to participant 1003, Norma Fisher, at pilot-grade-68, affiliated with seasonal-school-29, in the regional-identity-66 group, serving as seasonal-role-23, and attending summit SUM-2684.

**View `panel_discussion_youth_participant_detail_view`**

```sql
CREATE VIEW panel_discussion_youth_participant_detail_view AS
SELECT a.panel_id, a.panel_theme, a.number_of_panelists, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM panel_discussions a
  JOIN discussions_participants j ON j.panel_discussion_panel_id = a.panel_id
  JOIN youth_participants b ON b.id = j.youth_participant_id;
```

| panel_id | panel_theme | number_of_panelists | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|
| 2087758 | composite-panel-69 | 16 | 1000 | 3990185 | Theodore Mcgrath |
| 2087758 | composite-panel-69 | 16 | 1001 | 4716387 | Account Name |
| 4277009 | primary-panel-70 | 22 | 1001 | 4716387 | Account Name |
| 4277009 | primary-panel-70 | 22 | 1002 | 69430 | Saipan International Airport |
| 6926358 | adaptive-panel-71 | 28 | 1002 | 69430 | Saipan International Airport |
| 6926358 | adaptive-panel-71 | 28 | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 9424910 | distributed-panel-72 | 34 | 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 9424910 | distributed-panel-72 | 34 | 1000 | 3990185 | Theodore Mcgrath |

The staff_member_youth_organization_view presents staff members alongside their organizational affiliations. The first row shows staff member 1 affiliated with Extended Review (org_id 790471), headquartered in seasonal-headquar-83, operating under integrated-operatin-64, with a youth_board_proportion of 5.20, and associated with summit SUM-2675. The fourth row connects staff member 4 to Distributed Cluster (org_id m16), headquartered in compact-headquar-86, operating under legacy-operatin-67, with a youth_board_proportion of 17.80, and associated with summit SUM-2684.

**View `staff_member_youth_organization_view`**

```sql
CREATE VIEW staff_member_youth_organization_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.job_title, b.org_id AS organization_org_id, b.org_name AS organization_org_name, b.headquarters_city AS organization_headquarters_city
FROM staff_members a JOIN youth_organizations b ON a.youth_organization_org_id = b.org_id;
```

| staff_member_id | staff_id | full_name | job_title | organization_org_id | organization_org_name | organization_headquarters_city |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Primary Initiative A | 790471 | Extended Review | seasonal-headquar-83 |
| 2 | 3158139 | Account Name | Composite Model | 1717 | Pilot Initiative A | regional-headquar-84 |
| 3 | 8189502 | Saipan International Airport | Compact Cluster | 69437 | Baseline Model | legacy-headquar-85 |
| 4 | 69438 | Norma Fisher | Legacy Review D | m16 | Distributed Cluster | compact-headquar-86 |

The staff_member_conference_workshop_view joins staff members with the workshops they facilitate. The first row shows staff member 1 facilitating workshop 100, Baseline Series D, a 35-minute distributed-topic-60 session that is youth-only and comprehensive, under summit SUM-2675. The third row connects staff member 3 to workshop 102, Adaptive Survey, a 41-minute pilot-topic-62 session that is youth-only and comprehensive, under summit SUM-2681.

**View `staff_member_conference_workshop_view`**

```sql
CREATE VIEW staff_member_conference_workshop_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.job_title, b.conference_workshop_id AS workshop_conference_workshop_id, b.workshop_id AS workshop_workshop_id, b.workshop_title AS workshop_workshop_title
FROM staff_members a JOIN conference_workshops b ON a.conference_workshop_id = b.conference_workshop_id;
```

| staff_member_id | staff_id | full_name | job_title | workshop_conference_workshop_id | workshop_workshop_id | workshop_workshop_title |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Primary Initiative A | 100 | 8928498 | Baseline Series D |
| 2 | 3158139 | Account Name | Composite Model | 101 | 12383516 | Distributed Assessment |
| 3 | 8189502 | Saipan International Airport | Compact Cluster | 102 | 9424920 | Adaptive Survey |
| 4 | 69438 | Norma Fisher | Legacy Review D | 103 | 2986231 | Primary Corridor A |

The staff_member_panel_discussion_view presents staff members alongside their panel discussion assignments. The first row shows staff member 1 assigned to panel 2087758, the composite-panel-69 discussion with 16 panelists, moderated by Primary Framework A, recorded, with a seasonal-discussi-11 focus, under summit SUM-2675. The fourth row connects staff member 4 to panel 9424910, the distributed-panel-72 discussion with 34 panelists, moderated by Legacy Standard D, not recorded, with a compact-discussi-14 focus, under summit SUM-2684.

**View `staff_member_panel_discussion_view`**

```sql
CREATE VIEW staff_member_panel_discussion_view AS
SELECT a.staff_member_id, a.staff_id, a.full_name, a.job_title, b.panel_id AS discussion_panel_id, b.panel_theme AS discussion_panel_theme, b.number_of_panelists AS discussion_number_of_panelists
FROM staff_members a JOIN panel_discussions b ON a.panel_discussion_panel_id = b.panel_id;
```

| staff_member_id | staff_id | full_name | job_title | discussion_panel_id | discussion_panel_theme | discussion_number_of_panelists |
|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Primary Initiative A | 2087758 | composite-panel-69 | 16 |
| 2 | 3158139 | Account Name | Composite Model | 4277009 | primary-panel-70 | 22 |
| 3 | 8189502 | Saipan International Airport | Compact Cluster | 6926358 | adaptive-panel-71 | 28 |
| 4 | 69438 | Norma Fisher | Legacy Review D | 9424910 | distributed-panel-72 | 34 |

The data model for youth empowerment summits captures a multi-layered ecosystem in which events, institutions, organizations, participants, workshops, panels, and staff members are interconnected through explicit relational links. The base tables establish the core entities and their attributes, while the junction tables resolve many-to-many relationships that arise when participants attend multiple workshops, staff members facilitate multiple sessions, or organizations contribute to multiple summits. The view layer provides pre-joined perspectives that answer specific operational questions—such as which participants are enrolled in which workshops, which staff members moderate which panels, or which institutions are associated with which summits—without requiring ad hoc query construction. Together, these components form a coherent record-keeping system that supports both the administrative management of individual summits and the analytical examination of program-wide patterns across editions, institutions, organizations, and participant cohorts.