## Nuclear Facility Safety Governance: Records, Meetings, and Accountability

The oversight of nuclear installations rests on a structured ecosystem of facilities, personnel, meetings, and issue-tracking mechanisms. Each installation maintains a defined license and operational posture, is assigned a responsible safety director, and participates in a calendar of forum meetings where documents are published, issues are raised, and action items are generated. The records below capture every element of that governance chain—from the facility itself through the sub-groups that support it, the meetings that convene its stakeholders, and the documents and actions that formalize decisions.

**Table `nuclear_facilities`**

| facility_id | facility_name | license_status | operational_status | site_type | last_inspection_date | director_id | h_s_s_s_e_q_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 69447 | Integrated Protocol A | licensed | operational | civil | 2025-04-12T15:09:00 | 195339 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1040 | Extended Programme | authorised | standby | moD | 2022-09-23T22:26:00 | 9125611 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2986228 | Pilot Standard | decommissioning | maintenance | research | 2023-02-07T05:43:00 | 2933481 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | closed | shutdown | waste | 2024-07-18T12:00:00 | 2087758 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

A nuclear facility is the central entity in this domain. Each row records a unique installation identified by `facility_id`, a human-readable `facility_name`, and two status fields: `license_status` (the regulatory standing) and `operational_status` (the current operational posture). The `site_type` column classifies the nature of the installation—civil, MoD, research, or waste. The `last_inspection_date` provides a timestamp of the most recent regulatory inspection, while `director_id` and `h_s_s_s_e_q_issue_id` link the facility to its assigned safety director and its primary health, safety, security, and environmental quality issue. Timestamps `created_at` and `updated_at` track the lifecycle of the record itself.

Consider the facility "Integrated Protocol A" (ID 69447), which holds a `licensed` status and is `operational` at a civil site. Its last inspection was recorded on 2025-04-12, and it is managed by director 195339. By contrast, "Baseline Framework D" (ID ChIJvSxSbfdv5kcRanVzI8RRu20) is `closed` and in `shutdown` status at a waste site, with its last inspection on 2024-07-18.

**Table `safety_directors`**

| director_id | full_name | role_type | appointment_date | is_sponsor | facility_id | sub_group_id | forum_meeting_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | siteDirector | 2022-05-03 | false | 69447 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 9125611 | Account Name | baseSafetyRep | 2023-10-14 | true | 1040 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933481 | Saipan International Airport | companyDirector | 2024-03-25 | false | 2986228 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2087758 | Norma Fisher | observer | 2025-08-09 | true | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Safety directors are the accountable individuals—whether site directors, company directors, base safety representatives, or observers—assigned to facilities. The `director_id` uniquely identifies each person, while `full_name` provides their name. The `role_type` distinguishes their function: `siteDirector`, `baseSafetyRep`, `companyDirector`, or `observer`. The boolean `is_sponsor` flag indicates whether the director holds a sponsorship role. The `appointment_date` records when they assumed their position.

The `facility_id`, `sub_group_id`, and `forum_meeting_id` columns tie each director to the specific facility, sub-group, and forum meeting they participate in. Theodore Mcgrath (ID 195339), a site director appointed on 2022-05-03, is linked to facility 69447, sub-group 1000, and forum meeting 1. Norma Fisher (ID 2087758), an observer appointed more recently on 2025-08-09, is a sponsor linked to facility ChIJvSxSbfdv5kcRanVzI8RRu20, sub-group 1003, and forum meeting 4.

**Table `forum_meetings`**

| id | meeting_id | meeting_date | meeting_type | venue | status | total_cost | director_id | meeting_document_id | action_item_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | quarterly | integrated-venue-34 | scheduled | 61.82 | 195339 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | annualSubGroupChairs | seasonal-venue-35 | completed | 89.53 | 9125611 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | regulatory | regional-venue-36 | cancelled | 29.24 | 2933481 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | quarterly | legacy-venue-37 | scheduled | 13.94 | 2087758 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Forum meetings are the scheduled gatherings where safety governance is discussed and decisions are formalized. Each meeting has a composite `id` and a separate `meeting_id` that may use a different identifier scheme. The `meeting_date` and `meeting_type` (quarterly, annualSubGroupChairs, regulatory) describe when and what kind of meeting it is. The `venue` field names the location, and `status` indicates whether the meeting is `scheduled`, `completed`, or `cancelled`. The `total_cost` field records the estimated or actual cost of the meeting.

Meeting 1 (ID 1, meeting_id 20967529) is a quarterly meeting held on 2023-10-23 at integrated-venue-34, currently `scheduled` with a cost of 61.82. Meeting 3 (ID 3, meeting_id gd_acc_763000) is a regulatory meeting on 2025-08-18 at regional-venue-36 that has been `cancelled`, with a cost of 29.24. Each meeting is associated with a `director_id`, a `meeting_document_id`, and an `action_item_id`.

**Table `h_s_s_s_e_q_issues`**

| id | issue_id | issue_title | category | risk_level | status | reported_date | facility_id | sub_group_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5082978 | Seasonal Programme | health | low | identified | 2025-04-27T03:09:00 | 69447 | 1000 |
| 2 | 2bc3c87c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Standard | safety | medium | underReview | 2022-09-11T10:26:00 | 1040 | 1001 |
| 3 | 506004 | Extended Framework D | security | high | resolved | 2023-02-22T17:43:00 | 2986228 | 1002 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Pilot Protocol | safeguards | critical | escalated | 2024-07-06T00:00:00 | ChIJvSxSbfdv5kcRanVzI8RRu20 | 1003 |

Health, safety, security, and environmental quality (HSSSEQ) issues are the problems or concerns that arise within or around a facility. Each issue has an `id`, an `issue_id`, a descriptive `issue_title`, a `category` (health, safety, security, or safeguards), a `risk_level` (low, medium, high, or critical), and a `status` (identified, underReview, resolved, or escalated). The `reported_date` records when the issue was first reported.

Issue 1, titled "Seasonal Programme" (issue_id 5082978), falls under the `health` category with a `low` risk level and is currently `identified`. It was reported on 2025-04-27 and is linked to facility 69447 and sub-group 1000. Issue 4, "Pilot Protocol" (issue_id 57e52fbc-8fcd-11eb-924d-9cd76263cbd0), is a `safeguards` issue with `critical` risk that has been `escalated`, reported on 2024-07-06, and linked to facility ChIJvSxSbfdv5kcRanVzI8RRu20 and sub-group 1003.

**Table `sub_groups`**

| id | sub_group_id | sub_group_title | focus_area | is_active | established_date | director_id | meeting_document_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1186085 | Seasonal Corridor | radiological | true | 2024-03-27 | 195339 | 1 |
| 1001 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series | industrial | false | 2025-08-11 | 9125611 | 2 |
| 1002 | 5006436 | Extended Assessment D | engineering | true | 2022-01-22 | 2933481 | 3 |
| 1003 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Pilot Survey | cultural | false | 2023-06-06 | 2087758 | 4 |

Sub-groups are organizational units that focus on specific areas of concern within the safety governance framework. Each sub-group has an `id`, a `sub_group_id`, a `sub_group_title`, a `focus_area` (radiological, industrial, engineering, or cultural), and an `is_active` flag. The `established_date` records when the sub-group was created.

Sub-group 1000, "Seasonal Corridor" (sub_group_id 1186085), focuses on `radiological` matters, is `active`, and was established on 2024-03-27. It is managed by director 195339 and associated with meeting document 1. Sub-group 1001, "Integrated Series" (sub_group_id c7474e2c-8fcc-11eb-924d-9cd76263cbd0), focuses on `industrial` matters, is `inactive`, and was established on 2025-08-11.

**Table `meeting_documents`**

| id | document_id | document_type | publication_date | version | is_public | forum_meeting_id | director_id | action_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IVC10I | agenda | 2025-12-01 | 21 | false | 1 | 195339 | 100 |
| 2 | 605943 | minutes | 2022-05-12 | 31 | true | 2 | 9125611 | 101 |
| 3 | 10449525 | report | 2023-10-23 | 41 | false | 3 | 2933481 | 102 |
| 4 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | presentation | 2024-03-07 | 51 | true | 4 | 2087758 | 103 |

Meeting documents are the formal records produced for or during forum meetings. Each document has an `id`, a `document_id`, a `document_type` (agenda, minutes, report, or presentation), a `publication_date`, a `version` number, and an `is_public` flag. The `forum_meeting_id` links the document to its parent meeting, while `director_id` and `action_item_id` tie it to the responsible director and any associated action item.

Document 1 (document_id IVC10I) is an `agenda` for forum meeting 1, published on 2025-12-01 at version 21, and is not public. Document 2 (document_id 605943) is `minutes` for forum meeting 2, published on 2022-05-12 at version 31, and is public.

**Table `action_items`**

| id | action_id | description | due_date | priority | status | director_id | h_s_s_s_e_q_issue_id | meeting_document_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 8250 | Extended Survey | 2024-11-11 | low | open | 195339 | 1 | 1 |
| 101 | 450 | Pilot Corridor A | 2025-04-22 | medium | inProgress | 9125611 | 2 | 2 |
| 102 | 21005921 | Baseline Series | 2022-09-06 | high | completed | 2933481 | 3 | 3 |
| 103 | 1437589 | Distributed Assessment | 2023-02-17 | low | deferred | 2087758 | 4 | 4 |

Action items are the follow-up tasks generated from meetings. Each action item has an `id`, an `action_item_id`, a `description`, a `priority` (low, medium, high, or critical), a `status` (open, inProgress, completed, or deferred), a `due_date`, and a `completed_date`. The `forum_meeting_id`, `director_id`, and `meeting_document_id` columns link the action item to its originating meeting, responsible director, and associated document.

Action item 100 is a `high` priority item for forum meeting 1, assigned to director 195339, with a due date of 2025-12-15 and a status of `open`. Action item 101 is a `medium` priority item for forum meeting 2, assigned to director 9125611, with a due date of 2025-06-30 and a status of `inProgress`.

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

The meetings_directors table captures the many-to-many relationship between forum meetings and safety directors, recording which directors participated in which meetings. Each row contains a `meeting_id`, a `director_id`, a `participation_type` (attendee, chair, or observer), and a `notes` field for additional context.

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

The groups_issues table captures the relationship between sub-groups and HSSSEQ issues, recording which sub-groups are responsible for tracking which issues. Each row contains a `sub_group_id`, an `issue_id`, a `responsibility_type` (lead, support, or monitor), and a `notes` field.

## Cross-Entity Relationships and Joined Views

The power of this dataset lies in the joined views that connect these base tables. Each view answers a specific operational question by bringing together records from multiple tables.

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

This view joins nuclear facilities with their assigned safety directors, answering the question: "Which director is responsible for which facility, and what are their combined details?" The row for facility 69447 (Integrated Protocol A) shows director Theodore Mcgrath (ID 195339), a siteDirector role appointed on 2022-05-03. The row for facility ChIJvSxSbfdv5kcRanVzI8RRu20 (Baseline Framework D) shows director Norma Fisher (ID 2087758), an observer role appointed on 2025-08-09 who is also a sponsor.

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

This view joins nuclear facilities with their associated HSSSEQ issues, answering: "What issues are linked to each facility, and what are their risk profiles?" The row for facility 69447 shows issue 1 (Seasonal Programme), a health-category issue with low risk that is currently identified. The row for facility ChIJvSxSbfdv5kcRanVzI8RRu20 shows issue 4 (Pilot Protocol), a safeguards-category issue with critical risk that has been escalated.

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

This view presents the inverse perspective: starting from safety directors and joining to their facilities. It answers: "Which facilities does each director oversee, and what are the facility-level details?" Director 195339 (Theodore Mcgrath) oversees facility 69447 (Integrated Protocol A), which is licensed and operational. Director 9125611 (Account Name) oversees facility 1040 (Extended Programme), which is authorised and on standby.

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

This view joins safety directors with the sub-groups they manage, answering: "Which sub-groups is each director responsible for, and what are their focus areas?" Director 195339 manages sub-group 1000 (Seasonal Corridor), which focuses on radiological matters and is active. Director 9125611 manages sub-group 1001 (Integrated Series), which focuses on industrial matters and is inactive.

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

This view joins safety directors with the forum meetings they participate in, answering: "Which meetings is each director involved in, and what are the meeting details?" Director 195339 participates in meeting 1 (ID 1), a quarterly meeting at integrated-venue-34 with a cost of 61.82. Director 2087758 participates in meeting 4 (ID 4), a quarterly meeting at legacy-venue-37 with a cost of 13.94.

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

This view presents the inverse: starting from forum meetings and joining to their directors. It answers: "Which director is associated with each meeting, and what are the director-level details?" Meeting 1 (ID 1) is associated with director 195339 (Theodore Mcgrath), a siteDirector. Meeting 3 (ID 3) is associated with director 2933481 (Saipan International Airport), a companyDirector.

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

This view provides a detailed join between forum meetings and safety directors, including all relevant fields from both tables. It answers: "What is the complete picture of each meeting's director assignment?" Meeting 2 (ID 2, meeting_id ChIJd13ymnZu5kcRXM7jx5boJBs) is an annualSubGroupChairs meeting at seasonal-venue-35, completed, with a cost of 89.53, associated with director 9125611 (Account Name), a baseSafetyRep who is a sponsor.

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

This view joins forum meetings with their associated meeting documents, answering: "What documents are produced for each meeting?" Meeting 1 (ID 1) has document 1 (IVC10I), an agenda published on 2025-12-01 at version 21, which is not public. Meeting 2 (ID 2) has document 2 (605943), minutes published on 2022-05-12 at version 31, which is public.

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

This view joins forum meetings with their associated action items, answering: "What action items result from each meeting?" Meeting 1 (ID 1) has action item 100, a high-priority item with status open and a due date of 2025-12-15. Meeting 3 (ID 3) has action item 102, a medium-priority item with status completed and a completed date of 2025-09-15.

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

This view joins HSSSEQ issues with their associated nuclear facilities, answering: "Which facility is each issue linked to, and what are the facility details?" Issue 1 (Seasonal Programme) is linked to facility 69447 (Integrated Protocol A), a licensed civil facility. Issue 3 (Extended Framework D) is linked to facility 2986228 (Pilot Standard), a decommissioning research facility.

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

This view joins HSSSEQ issues with their associated sub-groups, answering: "Which sub-group is responsible for each issue?" Issue 1 (Seasonal Programme) is associated with sub-group 1000 (Seasonal Corridor), a radiological-focus sub-group that is active. Issue 4 (Pilot Protocol) is associated with sub-group 1003 (Pilot Survey), a cultural-focus sub-group that is inactive.

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

This view joins sub-groups with their managing safety directors, answering: "Which director manages each sub-group?" Sub-group 1000 (Seasonal Corridor) is managed by director 195339 (Theodore Mcgrath), a siteDirector. Sub-group 1003 (Pilot Survey) is managed by director 2087758 (Norma Fisher), an observer and sponsor.

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

This view provides a detailed join between sub-groups and their associated HSSSEQ issues, including all relevant fields. It answers: "What is the complete picture of each sub-group's issue portfolio?" Sub-group 1000 (Seasonal Corridor) is associated with issue 1 (Seasonal Programme), a health-category issue with low risk that is identified. Sub-group 1002 (Extended Assessment D) is associated with issue 3 (Extended Framework D), a security-category issue with high risk that is resolved.

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

This view joins sub-groups with their associated meeting documents, answering: "What documents are produced for each sub-group?" Sub-group 1000 (Seasonal Corridor) is associated with document 1 (IVC10I), an agenda for forum meeting 1. Sub-group 1003 (Pilot Survey) is associated with document 4 (5f93a090-8fcd-11eb-924d-9cd76263cbd0), a presentation for forum meeting 4.

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

This view joins meeting documents with their parent forum meetings, answering: "Which meeting produced each document?" Document 1 (IVC10I) is an agenda for forum meeting 1 (ID 1), a quarterly meeting at integrated-venue-34. Document 4 (5f93a090-8fcd-11eb-924d-9cd76263cbd0) is a presentation for forum meeting 4 (ID 4), a quarterly meeting at legacy-venue-37.

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

This view joins meeting documents with their responsible safety directors, answering: "Which director is responsible for each document?" Document 1 (IVC10I) is associated with director 195339 (Theodore Mcgrath), a siteDirector. Document 3 (10449525) is associated with director 2933481 (Saipan International Airport), a companyDirector.

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

This view joins meeting documents with their associated action items, answering: "What action items are linked to each document?" Document 1 (IVC10I) is linked to action item 100, a high-priority open item. Document 2 (605943) is linked to action item 101, a medium-priority inProgress item.

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

This view joins action items with their responsible safety directors, answering: "Which director is assigned each action item?" Action item 100 is assigned to director 195339 (Theodore Mcgrath), a siteDirector. Action item 102 is assigned to director 2933481 (Saipan International Airport), a companyDirector.

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

This view joins action items with their associated HSSSEQ issues, answering: "Which issues are addressed by each action item?" Action item 100 is associated with issue 1 (Seasonal Programme), a health-category issue with low risk. Action item 103 is associated with issue 4 (Pilot Protocol), a safeguards-category issue with critical risk.

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

This view joins action items with their associated meeting documents, answering: "Which document is linked to each action item?" Action item 100 is linked to document 1 (IVC10I), an agenda. Action item 103 is linked to document 4 (5f93a090-8fcd-11eb-924d-9cd76263cbd0), a presentation.

## Synthesis

The governance of nuclear facilities is captured in a tightly interwoven set of records. Facilities carry license and operational statuses that reflect their regulatory standing. Safety directors are assigned to facilities, sub-groups, and meetings, creating a web of accountability. Forum meetings serve as the temporal anchors where documents are published, issues are discussed, and action items are generated. HSSSEQ issues carry risk levels and statuses that drive the urgency of follow-up. Sub-groups provide organizational structure, focusing on specific domains like radiological, industrial, engineering, or cultural concerns. Meeting documents formalize the output of meetings, while action items ensure that decisions are tracked to completion. The joined views make these relationships queryable, allowing practitioners to answer questions about responsibility, risk, and progress across the entire governance ecosystem.