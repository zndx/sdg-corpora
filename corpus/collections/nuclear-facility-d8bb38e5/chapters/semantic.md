## Ontology-Grounded Relational Modelling in Nuclear Safety Governance

The domain under examination concerns the administration of nuclear facilities, the safety personnel who oversee them, and the structured governance processes—forum meetings, sub-groups, health-safety-security-environment-quality issues, meeting documents, and action items—that bind facilities to their regulatory lifecycle. At the conceptual level, the ontology distinguishes seven core entity types: `nuclear_facilities`, `safety_directors`, `forum_meetings`, `h_s_s_s_e_q_issues`, `sub_groups`, `meeting_documents`, and `action_items`. These entities are connected through cardinality-bounded relationships that the relational schema materialises as foreign keys, a junction table, and a rich set of derived views. The following sections walk through the base tables, the junction structures, and the view layer that reconstructs domain facts from the normalised tables.

**Table `nuclear_facilities`**

| facility_id | facility_name | license_status | operational_status | site_type | last_inspection_date | director_id | h_s_s_s_e_q_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | licensed | operational | civil | 2025-04-12T15:09:00 | 195339 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1040 | Extended Programme | authorised | standby | moD | 2022-09-23T22:26:00 | 9125611 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2986228 | Pilot Standard | decommissioning | maintenance | research | 2023-02-07T05:43:00 | 2933481 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed | shutdown | waste | 2024-07-18T12:00:00 | 2087758 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `nuclear_facilities` table anchors the ontology's facility concept. Its primary key, `facility_id`, accepts both integer identifiers (69447, 1040, 2986228) and Google Place-style strings (ChIJvSxSbfdv5kcRanVzI8RRu20), reflecting a flexible identifier strategy. The descriptive columns `facility_name` (e.g. "Integrated Protocol A", "Baseline Framework D"), `license_status` (licensed, authorised, decommissioning, closed), `operational_status` (operational, standby, maintenance, shutdown), and `site_type` (civil, moD, research, waste) capture the regulatory and physical state of each site. The `last_inspection_date` column records the most recent audit timestamp. Two foreign keys link this table outward: `director_id` references `safety_directors.director_id`, establishing that each facility is overseen by a safety director, while `h_s_s_s_e_q_issue_id` references `h_s_s_s_e_q_issues.id`, binding the facility to a primary health-safety-security-environment-quality concern. For instance, facility 69447 ("Integrated Protocol A", licensed and operational) is overseen by director 195339 and associated with issue 1. The temporal columns `created_at` and `updated_at` provide audit trails.

**Table `safety_directors`**

| director_id | full_name | role_type | appointment_date | is_sponsor | facility_id | sub_group_id | forum_meeting_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | siteDirector | 2022-05-03 | false | 69447 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 9125611 | Account Name | baseSafetyRep | 2023-10-14 | true | 1040 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933481 | Saipan International Airport | companyDirector | 2024-03-25 | false | 2986228 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2087758 | Norma Fisher | observer | 2025-08-09 | true | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `safety_directors` table models the people (or organisational roles) responsible for facility oversight. Its primary key `director_id` aligns with the `director_id` FK in `nuclear_facilities`. The column `full_name` stores human-readable identifiers such as "Theodore Mcgrath" and "Norma Fisher", while `role_type` distinguishes appointment categories: siteDirector, baseSafetyRep, companyDirector, and observer. The boolean `is_sponsor` flag indicates whether the director holds sponsor-level authority. Three foreign keys radiate from this table: `facility_id` points back to `nuclear_facilities.facility_id`, `sub_group_id` points to `sub_groups.id`, and `forum_meeting_id` points to `forum_meetings.id`. This structure means a single director record simultaneously encodes their facility assignment, sub-group membership, and forum meeting participation. Director 195339 (Theodore Mcgrath, siteDirector, non-sponsor) is linked to facility 69447, sub-group 1000, and forum meeting 1.

**Table `forum_meetings`**

| id | meeting_id | meeting_date | meeting_type | venue | status | total_cost | director_id | meeting_document_id | action_item_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | quarterly | integrated-venue-34 | scheduled | 61.82 | 195339 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | annualSubGroupChairs | seasonal-venue-35 | completed | 89.53 | 9125611 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | regulatory | regional-venue-36 | cancelled | 29.24 | 2933481 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | quarterly | legacy-venue-37 | scheduled | 13.94 | 2087758 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Forum meetings represent the scheduled governance events through which safety oversight is exercised. The primary key `id` is an auto-incrementing integer, while `meeting_id` carries the external meeting identifier (20967529, ChIJd13ymnZu5kcRXM7jx5boJBs, gd_acc_763000, 922ad118-9bad-11eb-a8a2-19ed5c03f8d3). The columns `meeting_date`, `meeting_type` (quarterly, annualSubGroupChairs, regulatory), `venue`, and `status` (scheduled, completed, cancelled) describe the event. `total_cost` records the financial outlay (61.82, 89.53, 29.24, 13.94). Two foreign keys connect meetings to other entities: `director_id` references `safety_directors.director_id`, and `meeting_document_id` references `meeting_documents.id`. An additional FK, `action_item_id`, points to `action_items.id`, linking each meeting to its associated action item. Meeting 1 (external ID 20967529, quarterly type, scheduled at integrated-venue-34, cost 61.82) is chaired by director 195339, associated with document 1, and action item 100.

**Table `h_s_s_s_e_q_issues`**

| id | issue_id | issue_title | category | risk_level | status | reported_date | facility_id | sub_group_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5082978 | Seasonal Programme | health | low | identified | 2025-04-27T03:09:00 | 69447 | 1000 |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard | safety | medium | underReview | 2022-09-11T10:26:00 | 1040 | 1001 |
| 3 | 506004 | Extended Framework D | security | high | resolved | 2023-02-22T17:43:00 | 2986228 | 1002 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol | safeguards | critical | escalated | 2024-07-06T00:00:00 | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 |

The `h_s_s_s_e_q_issues` table captures health, safety, security, environment, and quality concerns. Its primary key `id` is an integer, while `issue_id` holds the external identifier (5082978, 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0, 506004, 57e52fbc-8fcd-11eb-924d-9cd76263cbd0). The `issue_title` column provides a human-readable label ("Seasonal Programme", "Integrated Standard", "Extended Framework D", "Pilot Protocol"), `category` classifies the concern (health, safety, security, safeguards), `risk_level` assigns severity (low, medium, high, critical), and `status` tracks resolution state (identified, underReview, resolved, escalated). The `reported_date` records when the issue was logged. Two foreign keys bind issues to the wider ontology: `facility_id` references `nuclear_facilities.facility_id`, and `sub_group_id` references `sub_groups.id`. Issue 1 ("Seasonal Programme", health category, low risk, identified) is associated with facility 69447 and sub-group 1000.

**Table `sub_groups`**

| id | sub_group_id | sub_group_title | focus_area | is_active | established_date | director_id | meeting_document_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1186085 | Seasonal Corridor | radiological | true | 2024-03-27 | 195339 | 1 |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | industrial | false | 2025-08-11 | 9125611 | 2 |
| 1002 | 5006436 | Extended Assessment D | engineering | true | 2022-01-22 | 2933481 | 3 |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cultural | false | 2023-06-06 | 2087758 | 4 |

Sub-groups are organisational units within the governance structure. The primary key `id` is an integer, while `sub_group_id` carries the external identifier (1186085, c7474e2c-8fcc-11eb-924d-9cd76263cbd0, 5006436, 340312da-9bad-11eb-a8a2-19ed5c03f8d3). The `sub_group_title` column names the unit ("Seasonal Corridor", "Integrated Series", "Extended Assessment D", "Pilot Survey"), `focus_area` describes its domain (radiological, industrial, engineering, cultural), and `is_active` is a boolean flag. The `established_date` records formation. Two foreign keys connect sub-groups: `director_id` references `safety_directors.director_id`, and `meeting_document_id` references `meeting_documents.id`. Sub-group 1000 ("Seasonal Corridor", radiological focus, active) is overseen by director 195339 and linked to document 1.

**Table `meeting_documents`**

| id | document_id | document_type | publication_date | version | is_public | forum_meeting_id | director_id | action_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IVC10I | agenda | 2025-12-01 | 21 | false | 1 | 195339 | 100 |
| 2 | 605943 | minutes | 2022-05-12 | 31 | true | 2 | 9125611 | 101 |
| 3 | 10449525 | report | 2023-10-23 | 41 | false | 3 | 2933481 | 102 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation | 2024-03-07 | 51 | true | 4 | 2087758 | 103 |

Meeting documents represent the artefacts produced during or for forum meetings. The primary key `id` is an integer, while `document_id` carries the external identifier (IVC10I, 605943, 10449525, 5f93a090-8fcd-11eb-924d-9cd76263cbd0). The `document_type` column classifies the artefact (agenda, minutes, report, presentation), `publication_date` records when it was published, `version` stores a numeric version, and `is_public` is a boolean visibility flag. Three foreign keys link documents to other entities: `forum_meeting_id` references `forum_meetings.id`, `director_id` references `safety_directors.director_id`, and `action_item_id` references `action_items.id`. Document 1 (external ID IVC10I, agenda type, version 21, not public) is associated with forum meeting 1, director 195339, and action item 100.

**Table `action_items`**

| id | action_id | description | due_date | priority | status | director_id | h_s_s_s_e_q_issue_id | meeting_document_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 8250 | Extended Survey | 2024-11-11 | low | open | 195339 | 1 | 1 |
| 101 | 450 | Pilot Corridor A | 2025-04-22 | medium | inProgress | 9125611 | 2 | 2 |
| 102 | 21005921 | Baseline Series | 2022-09-06 | high | completed | 2933481 | 3 | 3 |
| 103 | 1437589 | Distributed Assessment | 2023-02-17 | low | deferred | 2087758 | 4 | 4 |

Action items capture the follow-up tasks arising from forum meetings. The primary key `id` is an integer, while `action_item_id` carries the external identifier (100, 101, 102, 103). The `action_item_title` column provides a label ("Action Item 100" through "Action Item 103"), `description` stores the task details, `priority` assigns urgency (low, medium, high, critical), and `status` tracks completion (open, inProgress, completed, cancelled). The `due_date` column records the deadline. Two foreign keys connect action items: `forum_meeting_id` references `forum_meetings.id`, and `director_id` references `safety_directors.director_id`. Action item 100 is linked to forum meeting 1 and director 195339.

**Table `meetings_directors`**

| forum_meeting_id | director_id |
|---|---|
| 1 | 195339 |
| 1 | 9125611 |
| 2 | 9125611 |
| 2 | 2933481 |
| 3 | 2933481 |
| 3 | 2087758 |
| 4 | 2087758 |
| 4 | 195339 |

The `meetings_directors` junction table resolves the many-to-many relationship between `forum_meetings` and `safety_directors`. Its composite key consists of `meeting_id` (referencing `forum_meetings.id`) and `director_id` (referencing `safety_directors.director_id`). This table allows a single forum meeting to involve multiple directors and a single director to participate in multiple meetings, decoupling the one-to-one FK that exists in the `forum_meetings` table itself. The junction table thus provides the flexibility needed for complex governance scenarios where meetings are attended by panels of directors.

**Table `groups_issues`**

| sub_group_id | h_s_s_s_e_q_issue_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `groups_issues` junction table resolves the many-to-many relationship between `sub_groups` and `h_s_s_s_e_q_issues`. Its composite key consists of `group_id` (referencing `sub_groups.id`) and `issue_id` (referencing `h_s_s_s_e_q_issues.id`). This table allows a sub-group to be associated with multiple issues and an issue to be tracked across multiple sub-groups, providing the flexibility needed for cross-functional safety investigations.

The base tables above form the normalised core of the schema. The view layer then reconstructs domain facts by joining these tables along their foreign key paths. Each view answers a specific analytical question by denormalising the relationships into a flat, queryable result set.

**View `nuclear_facility_safety_director_view`**

```sql
CREATE VIEW nuclear_facility_safety_director_view AS
SELECT a.facility_id, a.facility_name, a.license_status, a.operational_status, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM nuclear_facilities a JOIN safety_directors b ON a.director_id = b.director_id;
```

| facility_id | facility_name | license_status | operational_status | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | licensed | operational | 195339 | Theodore Mcgrath | siteDirector |
| 1040 | Extended Programme | authorised | standby | 9125611 | Account Name | baseSafetyRep |
| 2986228 | Pilot Standard | decommissioning | maintenance | 2933481 | Saipan International Airport | companyDirector |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed | shutdown | 2087758 | Norma Fisher | observer |

This view joins `nuclear_facilities` to `safety_directors` on the `director_id` foreign key, answering the question: "Which safety director oversees which nuclear facility?" The result surface includes facility identifiers and names alongside director names, role types, and appointment dates. A row with facility 69447 ("Integrated Protocol A") paired with director 195339 ("Theodore Mcgrath", siteDirector) demonstrates the direct oversight relationship.

**View `nuclear_facility_h_s_s_s_e_q_issue_view`**

```sql
CREATE VIEW nuclear_facility_h_s_s_s_e_q_issue_view AS
SELECT a.facility_id, a.facility_name, a.license_status, a.operational_status, b.id AS issue_id, b.issue_id AS issue_issue_id, b.issue_title AS issue_issue_title
FROM nuclear_facilities a JOIN h_s_s_s_e_q_issues b ON a.h_s_s_s_e_q_issue_id = b.id;
```

| facility_id | facility_name | license_status | operational_status | issue_id | issue_issue_id | issue_issue_title |
|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | licensed | operational | 1 | 5082978 | Seasonal Programme |
| 1040 | Extended Programme | authorised | standby | 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard |
| 2986228 | Pilot Standard | decommissioning | maintenance | 3 | 506004 | Extended Framework D |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed | shutdown | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol |

This view joins `nuclear_facilities` to `h_s_s_s_e_q_issues` on the `h_s_s_s_e_q_issue_id` foreign key, answering: "What is the primary HSEEQ issue associated with each nuclear facility?" The result includes facility names alongside issue titles, categories, risk levels, and statuses. A row pairing facility 69447 with issue 1 ("Seasonal Programme", health category, low risk) shows the facility's primary safety concern.

**View `safety_director_nuclear_facility_view`**

```sql
CREATE VIEW safety_director_nuclear_facility_view AS
SELECT a.director_id, a.full_name, a.role_type, a.appointment_date, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.license_status AS facility_license_status
FROM safety_directors a JOIN nuclear_facilities b ON a.facility_id = b.facility_id;
```

| director_id | full_name | role_type | appointment_date | facility_facility_id | facility_facility_name | facility_license_status |
|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | siteDirector | 2022-05-03 | 69447 | Integrated Protocol A | licensed |
| 9125611 | Account Name | baseSafetyRep | 2023-10-14 | 1040 | Extended Programme | authorised |
| 2933481 | Saipan International Airport | companyDirector | 2024-03-25 | 2986228 | Pilot Standard | decommissioning |
| 2087758 | Norma Fisher | observer | 2025-08-09 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed |

This view joins `safety_directors` to `nuclear_facilities` on the `facility_id` foreign key, answering: "Which nuclear facility is assigned to each safety director?" The result surface includes director names and role types alongside facility names, license statuses, and operational statuses. A row with director 195339 ("Theodore Mcgrath") paired with facility 69447 ("Integrated Protocol A", licensed, operational) demonstrates the assignment from the director's perspective.

**View `safety_director_sub_group_view`**

```sql
CREATE VIEW safety_director_sub_group_view AS
SELECT a.director_id, a.full_name, a.role_type, a.appointment_date, b.id AS group_id, b.sub_group_id AS group_sub_group_id, b.sub_group_title AS group_sub_group_title
FROM safety_directors a JOIN sub_groups b ON a.sub_group_id = b.id;
```

| director_id | full_name | role_type | appointment_date | group_id | group_sub_group_id | group_sub_group_title |
|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | siteDirector | 2022-05-03 | 1000 | 1186085 | Seasonal Corridor |
| 9125611 | Account Name | baseSafetyRep | 2023-10-14 | 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series |
| 2933481 | Saipan International Airport | companyDirector | 2024-03-25 | 1002 | 5006436 | Extended Assessment D |
| 2087758 | Norma Fisher | observer | 2025-08-09 | 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |

This view joins `safety_directors` to `sub_groups` on the `sub_group_id` foreign key, answering: "Which sub-group is each safety director a member of?" The result includes director names and role types alongside sub-group titles, focus areas, and active status. A row with director 195339 ("Theodore Mcgrath") paired with sub-group 1000 ("Seasonal Corridor", radiological focus, active) demonstrates the membership relationship.

**View `safety_director_forum_meeting_view`**

```sql
CREATE VIEW safety_director_forum_meeting_view AS
SELECT a.director_id, a.full_name, a.role_type, a.appointment_date, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date
FROM safety_directors a JOIN forum_meetings b ON a.forum_meeting_id = b.id;
```

| director_id | full_name | role_type | appointment_date | meeting_id | meeting_meeting_id | meeting_meeting_date |
|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | siteDirector | 2022-05-03 | 1 | 20967529 | 2023-10-23T21:39:00 |
| 9125611 | Account Name | baseSafetyRep | 2023-10-14 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| 2933481 | Saipan International Airport | companyDirector | 2024-03-25 | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| 2087758 | Norma Fisher | observer | 2025-08-09 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |

This view joins `safety_directors` to `forum_meetings` on the `forum_meeting_id` foreign key, answering: "Which forum meetings is each safety director associated with?" The result includes director names and role types alongside meeting dates, types, venues, and statuses. A row with director 195339 ("Theodore Mcgrath") paired with meeting 1 (quarterly type, scheduled at integrated-venue-34) demonstrates the participation link.

**View `forum_meeting_safety_director_view`**

```sql
CREATE VIEW forum_meeting_safety_director_view AS
SELECT a.id, a.meeting_id, a.meeting_date, a.meeting_type, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM forum_meetings a JOIN safety_directors b ON a.director_id = b.director_id;
```

| id | meeting_id | meeting_date | meeting_type | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | quarterly | 195339 | Theodore Mcgrath | siteDirector |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | annualSubGroupChairs | 9125611 | Account Name | baseSafetyRep |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | regulatory | 2933481 | Saipan International Airport | companyDirector |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | quarterly | 2087758 | Norma Fisher | observer |

This view joins `forum_meetings` to `safety_directors` on the `director_id` foreign key, answering: "Which safety director chairs each forum meeting?" The result surface includes meeting dates, types, and venues alongside director names, role types, and appointment dates. A row with meeting 1 (quarterly, scheduled) paired with director 195339 ("Theodore Mcgrath") demonstrates the chairing relationship from the meeting's perspective.

**View `forum_meeting_safety_director_detail_view`**

```sql
CREATE VIEW forum_meeting_safety_director_detail_view AS
SELECT a.id, a.meeting_id, a.meeting_date, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM forum_meetings a
  JOIN meetings_directors j ON j.forum_meeting_id = a.id
  JOIN safety_directors b ON b.director_id = j.director_id;
```

| id | meeting_id | meeting_date | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | 195339 | Theodore Mcgrath | siteDirector |
| 1 | 20967529 | 2023-10-23T21:39:00 | 9125611 | Account Name | baseSafetyRep |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 9125611 | Account Name | baseSafetyRep |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 2933481 | Saipan International Airport | companyDirector |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 2933481 | Saipan International Airport | companyDirector |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 2087758 | Norma Fisher | observer |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 2087758 | Norma Fisher | observer |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 195339 | Theodore Mcgrath | siteDirector |

This view performs a three-way join across `forum_meetings`, `safety_directors`, and `nuclear_facilities`, answering: "What is the full governance context of each forum meeting, including the chairing director and their assigned facility?" The result includes meeting details, director information, and facility names, license statuses, and operational statuses. A row combining meeting 1, director 195339, and facility 69447 provides a complete picture of the governance event.

**View `forum_meeting_meeting_document_view`**

```sql
CREATE VIEW forum_meeting_meeting_document_view AS
SELECT a.id, a.meeting_id, a.meeting_date, a.meeting_type, b.id AS document_id, b.document_id AS document_document_id, b.document_type AS document_document_type
FROM forum_meetings a JOIN meeting_documents b ON a.meeting_document_id = b.id;
```

| id | meeting_id | meeting_date | meeting_type | document_id | document_document_id | document_document_type |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | quarterly | 1 | IVC10I | agenda |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | annualSubGroupChairs | 2 | 605943 | minutes |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | regulatory | 3 | 10449525 | report |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | quarterly | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation |

This view joins `forum_meetings` to `meeting_documents` on the `meeting_document_id` foreign key, answering: "Which meeting document is associated with each forum meeting?" The result includes meeting dates and types alongside document types, publication dates, versions, and public visibility flags. A row with meeting 1 paired with document 1 (agenda type, version 21, not public) demonstrates the document linkage.

**View `forum_meeting_action_item_view`**

```sql
CREATE VIEW forum_meeting_action_item_view AS
SELECT a.id, a.meeting_id, a.meeting_date, a.meeting_type, b.id AS item_id, b.action_id AS item_action_id, b.description AS item_description
FROM forum_meetings a JOIN action_items b ON a.action_item_id = b.id;
```

| id | meeting_id | meeting_date | meeting_type | item_id | item_action_id | item_description |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | quarterly | 100 | 8250 | Extended Survey |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | annualSubGroupChairs | 101 | 450 | Pilot Corridor A |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | regulatory | 102 | 21005921 | Baseline Series |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | quarterly | 103 | 1437589 | Distributed Assessment |

This view joins `forum_meetings` to `action_items` on the `action_item_id` foreign key, answering: "Which action item arises from each forum meeting?" The result includes meeting dates and types alongside action item titles, priorities, statuses, and due dates. A row with meeting 1 paired with action item 100 demonstrates the follow-up task linkage.

**View `h_s_s_s_e_q_issue_nuclear_facility_view`**

```sql
CREATE VIEW h_s_s_s_e_q_issue_nuclear_facility_view AS
SELECT a.id, a.issue_id, a.issue_title, a.category, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.license_status AS facility_license_status
FROM h_s_s_s_e_q_issues a JOIN nuclear_facilities b ON a.facility_id = b.facility_id;
```

| id | issue_id | issue_title | category | facility_facility_id | facility_facility_name | facility_license_status |
|---|---|---|---|---|---|---|
| 1 | 5082978 | Seasonal Programme | health | 69447 | Integrated Protocol A | licensed |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard | safety | 1040 | Extended Programme | authorised |
| 3 | 506004 | Extended Framework D | security | 2986228 | Pilot Standard | decommissioning |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol | safeguards | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed |

This view joins `h_s_s_s_e_q_issues` to `nuclear_facilities` on the `facility_id` foreign key, answering: "Which nuclear facility is the source of each HSEEQ issue?" The result includes issue titles, categories, risk levels, and statuses alongside facility names, license statuses, and operational statuses. A row with issue 1 ("Seasonal Programme", health, low risk) paired with facility 69447 ("Integrated Protocol A") demonstrates the origin relationship.

**View `h_s_s_s_e_q_issue_sub_group_view`**

```sql
CREATE VIEW h_s_s_s_e_q_issue_sub_group_view AS
SELECT a.id, a.issue_id, a.issue_title, a.category, b.id AS group_id, b.sub_group_id AS group_sub_group_id, b.sub_group_title AS group_sub_group_title
FROM h_s_s_s_e_q_issues a JOIN sub_groups b ON a.sub_group_id = b.id;
```

| id | issue_id | issue_title | category | group_id | group_sub_group_id | group_sub_group_title |
|---|---|---|---|---|---|---|
| 1 | 5082978 | Seasonal Programme | health | 1000 | 1186085 | Seasonal Corridor |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard | safety | 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series |
| 3 | 506004 | Extended Framework D | security | 1002 | 5006436 | Extended Assessment D |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol | safeguards | 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey |

This view joins `h_s_s_s_e_q_issues` to `sub_groups` on the `sub_group_id` foreign key, answering: "Which sub-group is responsible for tracking each HSEEQ issue?" The result includes issue titles and risk levels alongside sub-group titles, focus areas, and active status. A row with issue 1 ("Seasonal Programme") paired with sub-group 1000 ("Seasonal Corridor", radiological focus) demonstrates the tracking assignment.

**View `sub_group_safety_director_view`**

```sql
CREATE VIEW sub_group_safety_director_view AS
SELECT a.id, a.sub_group_id, a.sub_group_title, a.focus_area, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM sub_groups a JOIN safety_directors b ON a.director_id = b.director_id;
```

| id | sub_group_id | sub_group_title | focus_area | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|---|
| 1000 | 1186085 | Seasonal Corridor | radiological | 195339 | Theodore Mcgrath | siteDirector |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | industrial | 9125611 | Account Name | baseSafetyRep |
| 1002 | 5006436 | Extended Assessment D | engineering | 2933481 | Saipan International Airport | companyDirector |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cultural | 2087758 | Norma Fisher | observer |

This view joins `sub_groups` to `safety_directors` on the `director_id` foreign key, answering: "Which safety director oversees each sub-group?" The result includes sub-group titles and focus areas alongside director names, role types, and appointment dates. A row with sub-group 1000 ("Seasonal Corridor", radiological) paired with director 195339 ("Theodore Mcgrath", siteDirector) demonstrates the oversight relationship.

**View `sub_group_h_s_s_s_e_q_issue_detail_view`**

```sql
CREATE VIEW sub_group_h_s_s_s_e_q_issue_detail_view AS
SELECT a.id, a.sub_group_id, a.sub_group_title, b.id AS issue_id, b.issue_id AS issue_issue_id, b.issue_title AS issue_issue_title
FROM sub_groups a
  JOIN groups_issues j ON j.sub_group_id = a.id
  JOIN h_s_s_s_e_q_issues b ON b.id = j.h_s_s_s_e_q_issue_id;
```

| id | sub_group_id | sub_group_title | issue_id | issue_issue_id | issue_issue_title |
|---|---|---|---|---|---|
| 1000 | 1186085 | Seasonal Corridor | 1 | 5082978 | Seasonal Programme |
| 1000 | 1186085 | Seasonal Corridor | 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | 3 | 506004 | Extended Framework D |
| 1002 | 5006436 | Extended Assessment D | 3 | 506004 | Extended Framework D |
| 1002 | 5006436 | Extended Assessment D | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | 1 | 5082978 | Seasonal Programme |

This view performs a three-way join across `sub_groups`, `h_s_s_s_e_q_issues`, and `nuclear_facilities`, answering: "What is the full context of each HSEEQ issue within its sub-group and facility?" The result includes sub-group titles, issue titles, risk levels, and facility names. A row combining sub-group 1000, issue 1 ("Seasonal Programme"), and facility 69447 provides a complete picture of the issue's governance context.

**View `sub_group_meeting_document_view`**

```sql
CREATE VIEW sub_group_meeting_document_view AS
SELECT a.id, a.sub_group_id, a.sub_group_title, a.focus_area, b.id AS document_id, b.document_id AS document_document_id, b.document_type AS document_document_type
FROM sub_groups a JOIN meeting_documents b ON a.meeting_document_id = b.id;
```

| id | sub_group_id | sub_group_title | focus_area | document_id | document_document_id | document_document_type |
|---|---|---|---|---|---|---|
| 1000 | 1186085 | Seasonal Corridor | radiological | 1 | IVC10I | agenda |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | industrial | 2 | 605943 | minutes |
| 1002 | 5006436 | Extended Assessment D | engineering | 3 | 10449525 | report |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cultural | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation |

This view joins `sub_groups` to `meeting_documents` on the `meeting_document_id` foreign key, answering: "Which meeting document is associated with each sub-group?" The result includes sub-group titles and focus areas alongside document types, publication dates, and versions. A row with sub-group 1000 ("Seasonal Corridor") paired with document 1 (agenda type, version 21) demonstrates the document linkage.

**View `meeting_document_forum_meeting_view`**

```sql
CREATE VIEW meeting_document_forum_meeting_view AS
SELECT a.id, a.document_id, a.document_type, a.publication_date, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date
FROM meeting_documents a JOIN forum_meetings b ON a.forum_meeting_id = b.id;
```

| id | document_id | document_type | publication_date | meeting_id | meeting_meeting_id | meeting_meeting_date |
|---|---|---|---|---|---|---|
| 1 | IVC10I | agenda | 2025-12-01 | 1 | 20967529 | 2023-10-23T21:39:00 |
| 2 | 605943 | minutes | 2022-05-12 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| 3 | 10449525 | report | 2023-10-23 | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation | 2024-03-07 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |

This view joins `meeting_documents` to `forum_meetings` on the `forum_meeting_id` foreign key, answering: "Which forum meeting produced each meeting document?" The result includes document types and publication dates alongside meeting dates, types, and venues. A row with document 1 (agenda, published 2025-12-01) paired with meeting 1 (quarterly, scheduled) demonstrates the production relationship.

**View `meeting_document_safety_director_view`**

```sql
CREATE VIEW meeting_document_safety_director_view AS
SELECT a.id, a.document_id, a.document_type, a.publication_date, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM meeting_documents a JOIN safety_directors b ON a.director_id = b.director_id;
```

| id | document_id | document_type | publication_date | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|---|
| 1 | IVC10I | agenda | 2025-12-01 | 195339 | Theodore Mcgrath | siteDirector |
| 2 | 605943 | minutes | 2022-05-12 | 9125611 | Account Name | baseSafetyRep |
| 3 | 10449525 | report | 2023-10-23 | 2933481 | Saipan International Airport | companyDirector |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation | 2024-03-07 | 2087758 | Norma Fisher | observer |

This view joins `meeting_documents` to `safety_directors` on the `director_id` foreign key, answering: "Which safety director is associated with each meeting document?" The result includes document types and versions alongside director names, role types, and appointment dates. A row with document 1 (agenda, version 21) paired with director 195339 ("Theodore Mcgrath") demonstrates the association.

**View `meeting_document_action_item_view`**

```sql
CREATE VIEW meeting_document_action_item_view AS
SELECT a.id, a.document_id, a.document_type, a.publication_date, b.id AS item_id, b.action_id AS item_action_id, b.description AS item_description
FROM meeting_documents a JOIN action_items b ON a.action_item_id = b.id;
```

| id | document_id | document_type | publication_date | item_id | item_action_id | item_description |
|---|---|---|---|---|---|---|
| 1 | IVC10I | agenda | 2025-12-01 | 100 | 8250 | Extended Survey |
| 2 | 605943 | minutes | 2022-05-12 | 101 | 450 | Pilot Corridor A |
| 3 | 10449525 | report | 2023-10-23 | 102 | 21005921 | Baseline Series |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation | 2024-03-07 | 103 | 1437589 | Distributed Assessment |

This view joins `meeting_documents` to `action_items` on the `action_item_id` foreign key, answering: "Which action item is linked to each meeting document?" The result includes document types and publication dates alongside action item titles, priorities, and statuses. A row with document 1 (agenda) paired with action item 100 demonstrates the linkage.

**View `action_item_safety_director_view`**

```sql
CREATE VIEW action_item_safety_director_view AS
SELECT a.id, a.action_id, a.description, a.due_date, b.director_id AS director_director_id, b.full_name AS director_full_name, b.role_type AS director_role_type
FROM action_items a JOIN safety_directors b ON a.director_id = b.director_id;
```

| id | action_id | description | due_date | director_director_id | director_full_name | director_role_type |
|---|---|---|---|---|---|---|
| 100 | 8250 | Extended Survey | 2024-11-11 | 195339 | Theodore Mcgrath | siteDirector |
| 101 | 450 | Pilot Corridor A | 2025-04-22 | 9125611 | Account Name | baseSafetyRep |
| 102 | 21005921 | Baseline Series | 2022-09-06 | 2933481 | Saipan International Airport | companyDirector |
| 103 | 1437589 | Distributed Assessment | 2023-02-17 | 2087758 | Norma Fisher | observer |

This view joins `action_items` to `safety_directors` on the `director_id` foreign key, answering: "Which safety director is responsible for each action item?" The result includes action item titles, priorities, and statuses alongside director names, role types, and appointment dates. A row with action item 100 paired with director 195339 ("Theodore Mcgrath") demonstrates the responsibility assignment.

**View `action_item_h_s_s_s_e_q_issue_view`**

```sql
CREATE VIEW action_item_h_s_s_s_e_q_issue_view AS
SELECT a.id, a.action_id, a.description, a.due_date, b.id AS issue_id, b.issue_id AS issue_issue_id, b.issue_title AS issue_issue_title
FROM action_items a JOIN h_s_s_s_e_q_issues b ON a.h_s_s_s_e_q_issue_id = b.id;
```

| id | action_id | description | due_date | issue_id | issue_issue_id | issue_issue_title |
|---|---|---|---|---|---|---|
| 100 | 8250 | Extended Survey | 2024-11-11 | 1 | 5082978 | Seasonal Programme |
| 101 | 450 | Pilot Corridor A | 2025-04-22 | 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard |
| 102 | 21005921 | Baseline Series | 2022-09-06 | 3 | 506004 | Extended Framework D |
| 103 | 1437589 | Distributed Assessment | 2023-02-17 | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol |

This view joins `action_items` to `h_s_s_s_e_q_issues` on the `issue_id` foreign key, answering: "Which HSEEQ issue is associated with each action item?" The result includes action item titles and priorities alongside issue titles, categories, and risk levels. A row with action item 100 paired with issue 1 ("Seasonal Programme", health, low risk) demonstrates the association.

**View `action_item_meeting_document_view`**

```sql
CREATE VIEW action_item_meeting_document_view AS
SELECT a.id, a.action_id, a.description, a.due_date, b.id AS document_id, b.document_id AS document_document_id, b.document_type AS document_document_type
FROM action_items a JOIN meeting_documents b ON a.meeting_document_id = b.id;
```

| id | action_id | description | due_date | document_id | document_document_id | document_document_type |
|---|---|---|---|---|---|---|
| 100 | 8250 | Extended Survey | 2024-11-11 | 1 | IVC10I | agenda |
| 101 | 450 | Pilot Corridor A | 2025-04-22 | 2 | 605943 | minutes |
| 102 | 21005921 | Baseline Series | 2022-09-06 | 3 | 10449525 | report |
| 103 | 1437589 | Distributed Assessment | 2023-02-17 | 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation |

This view joins `action_items` to `meeting_documents` on the `document_id` foreign key, answering: "Which meeting document is linked to each action item?" The result includes action item titles and due dates alongside document types, publication dates, and versions. A row with action item 100 paired with document 1 (agenda, version 21) demonstrates the linkage.

The schema design follows a star-and-snowflake pattern where the `nuclear_facilities` and `safety_directors` tables serve as central hubs, connected through a web of foreign keys that encode the governance ontology. The junction tables `meetings_directors` and `groups_issues` provide the flexibility needed for many-to-many relationships that the one-to-one FK columns in the base tables cannot express. The view layer, comprising twenty-four denormalised projections, ensures that every domain question—whether about facility oversight, meeting participation, issue tracking, or document linkage—can be answered with a single flat query. This architecture balances the integrity guarantees of normalisation with the query simplicity of denormalisation, making the schema both sound for write operations and efficient for read operations. The fictional entities—facilities like "Integrated Protocol A" and "Baseline Framework D", directors like "Theodore Mcgrath" and "Norma Fisher", and sub-groups like "Seasonal Corridor" and "Pilot Survey"—illustrate how the schema accommodates a diverse and evolving governance landscape while maintaining referential integrity across all relationships.