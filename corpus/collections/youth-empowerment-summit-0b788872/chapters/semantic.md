## Modelling Youth Empowerment Summits as a Relational Schema

The Youth Empowerment Summits domain captures the organisational ecology of multi-day conferences that convene students, educators, and community organisations around shared developmental themes. Each summit is a temporal event anchored to a specific date range, a current theme, and a total attendance count; it is simultaneously sponsored by an educational institution and a youth organisation, and it hosts a portfolio of conference workshops and panel discussions. The relational model preserves this ecology in a normalised form: seven base tables store the atomic entities, five junction tables resolve the many-to-many associations, and twenty-two materialised views reassemble the normalised facts into domain-readable projections.

**Table `youth_empowerment_summits`**

| youth_empowerment_summit_id | summit_identifier | edition_number | start_date | end_date | total_attendance | current_theme | educational_institution_id | youth_organization_org_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SUM-2675 | 19 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 18 | adaptive-current-71 | 1000 | 790471 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SUM-2678 | 30 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 316 | distributed-current-72 | 1001 | 1717 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SUM-2681 | 41 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 16791 | baseline-current-73 | 1002 | 69437 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SUM-2684 | 52 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 62 | pilot-current-74 | 1003 | m16 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `youth_empowerment_summits` table is the temporal anchor of the entire schema. Its surrogate primary key, `youth_empowerment_summit_id`, is an auto-incrementing integer (1, 2, 3, 4 in the sample), while the business-level `summit_identifier` column carries human-readable codes such as `SUM-2675` or `SUM-2684`. The `edition_number` column (19, 30, 41, 52) distinguishes successive iterations of the same conceptual summit. The `start_date` and `end_date` columns store ISO-8601 timestamps; note that in the sample data the `end_date` precedes the `start_date` within each row, a data-quality artefact that the model does not correct at the schema level. The `total_attendance` column is an integer ranging from 18 to 16791 across the four rows, and `current_theme` carries categorical labels such as `adaptive-current-71` or `distributed-current-72`. Two foreign keys bind the summit to its sponsors: `educational_institution_id` references `educational_institutions.educational_institution_id`, and `youth_organization_org_id` references `youth_organizations.org_id`. The `created_at` and `updated_at` columns provide audit timestamps.

**Table `educational_institutions`**

| educational_institution_id | institution_id | institution_name | city | state | school_level | is_safe_space | youth_empowerment_summit_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 9424913 | Extended Corridor | integrated-city-34 | distributed-state-84 | pilot-school-38 | true | 1 | 2025-01-01 00:14:00 |
| 1001 | 8189481 | Pilot Series A | seasonal-city-35 | baseline-state-85 | extended-school-39 | false | 2 | 2025-02-06 03:14:00 |
| 1002 | 1437604 | Baseline Assessment | regional-city-36 | pilot-state-86 | integrated-school-40 | true | 3 | 2025-03-11 06:14:00 |
| 1003 | 884346 | Distributed Survey | legacy-city-37 | extended-state-87 | seasonal-school-41 | false | 4 | 2025-04-16 09:14:00 |

The `educational_institutions` table stores the school entities that sponsor summits. Its primary key is `educational_institution_id` (1000–1003), and the business identifier `institution_id` carries large integers such as `9424913`. The `institution_name` column holds values like `Extended Corridor` or `Pilot Series A`, while `city` and `state` store synthetic location tokens (`integrated-city-34`, `distributed-state-84`). The `school_level` column categorises the institution (`pilot-school-38`, `extended-school-39`), and `is_safe_space` is a boolean flag. The foreign key `youth_empowerment_summit_id` creates a unidirectional link back to the summit table, meaning each institution row is associated with exactly one summit in this normalised design.

**Table `youth_organizations`**

| org_id | org_name | headquarters_city | headquarters_state | operating_model | youth_board_proportion | youth_empowerment_summit_id |
|---|---|---|---|---|---|---|
| 790471 | Extended Review | seasonal-headquar-83 | compact-headquar-74 | integrated-operatin-64 | 5.20 | 1 |
| 1717 | Pilot Initiative A | regional-headquar-84 | composite-headquar-75 | seasonal-operatin-65 | 9.40 | 2 |
| 69437 | Baseline Model | legacy-headquar-85 | primary-headquar-76 | regional-operatin-66 | 13.60 | 3 |
| m16 | Distributed Cluster | compact-headquar-86 | adaptive-headquar-77 | legacy-operatin-67 | 17.80 | 4 |

Youth organisations are captured in `youth_organizations`, whose primary key is `org_id`. The sample shows a mix of integer keys (`790471`, `1717`, `69437`) and a UUID-style key (`m16`). The `org_name` column contains values such as `Extended Review` or `Distributed Cluster`. Headquarters location is stored in `headquarters_city` and `headquarters_state`, while `operating_model` carries categorical descriptors (`integrated-operatin-64`, `seasonal-operatin-65`). The `youth_board_proportion` column is a decimal (5.20, 9.40, 13.60, 17.80) representing the proportion of board seats held by youth members. The foreign key `youth_empowerment_summit_id` links each organisation to its sponsoring summit.

**Table `youth_participants`**

| id | participant_id | full_name | grade_level | school_affiliation | identity_group | role | youth_empowerment_summit_id | educational_institution_id | panel_discussion_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 3990185 | Theodore Mcgrath | adaptive-grade-65 | pilot-school-26 | extended-identity-63 | pilot-role-20 | 1 | 1000 | 2087758 |
| 1001 | 4716387 | Account Name | distributed-grade-66 | extended-school-27 | integrated-identity-64 | extended-role-21 | 2 | 1001 | 4277009 |
| 1002 | 69430 | Saipan International Airport | baseline-grade-67 | integrated-school-28 | seasonal-identity-65 | integrated-role-22 | 3 | 1002 | 6926358 |
| 1003 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | pilot-grade-68 | seasonal-school-29 | regional-identity-66 | seasonal-role-23 | 4 | 1003 | 9424910 |

The `youth_participants` table is the most heavily connected entity. Its primary key is `id` (1000–1003), and the business identifier `participant_id` carries diverse formats: integers (`3990185`, `4716387`), a UUID (`c7460a44-8fcc-11eb-924d-9cd76263cbd0`), and a synthetic string (`69430`). The `full_name` column stores names such as `Theodore Mcgrath` or `Norma Fisher`. The `grade_level` column carries categorical tokens (`adaptive-grade-65`, `distributed-grade-66`), and `school_affiliation` references the participant's school (`pilot-school-26`, `extended-school-27`). The `identity_group` column stores demographic categories (`extended-identity-63`, `integrated-identity-64`), while `role` captures the participant's function at the summit (`pilot-role-20`, `extended-role-21`). Three foreign keys bind this table: `youth_empowerment_summit_id` points to the summit, `educational_institution_id` points to the school, and `panel_discussion_panel_id` points to a specific panel discussion.

**Table `conference_workshops`**

| conference_workshop_id | workshop_id | workshop_title | topic | duration_minutes | is_youth_only | is_comprehensive | youth_empowerment_summit_id | staff_member_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 8928498 | Baseline Series D | distributed-topic-60 | 35 | true | true | 1 | 1 |
| 101 | 12383516 | Distributed Assessment | baseline-topic-61 | 38 | false | false | 2 | 2 |
| 102 | 9424920 | Adaptive Survey | pilot-topic-62 | 41 | true | true | 3 | 3 |
| 103 | 2986231 | Primary Corridor A | extended-topic-63 | 44 | false | false | 4 | 4 |

Conference workshops are stored in `conference_workshops` with primary key `conference_workshop_id` (100–103). The business identifier `workshop_id` carries large integers (`8928498`, `12383516`). The `workshop_title` column holds descriptive names such as `Baseline Series D` or `Primary Corridor A`, and `topic` stores categorical topic codes (`distributed-topic-60`, `baseline-topic-61`). The `duration_minutes` column is an integer (35, 38, 41, 44). Two boolean flags, `is_youth_only` and `is_comprehensive`, control access and scope. The foreign key `youth_empowerment_summit_id` links the workshop to its summit, and `staff_member_id` links it to the responsible staff member.

**Table `panel_discussions`**

| panel_id | panel_theme | number_of_panelists | moderator_name | is_recorded | discussion_focus | youth_empowerment_summit_id |
|---|---|---|---|---|---|---|
| 2087758 | composite-panel-69 | 16 | Primary Framework A | true | seasonal-discussi-11 | 1 |
| 4277009 | primary-panel-70 | 22 | Composite Protocol | false | regional-discussi-12 | 2 |
| 6926358 | adaptive-panel-71 | 28 | Compact Programme | true | legacy-discussi-13 | 3 |
| 9424910 | distributed-panel-72 | 34 | Legacy Standard D | false | compact-discussi-14 | 4 |

Panel discussions live in `panel_discussions` with primary key `panel_id` (2087758, 4277009, 6926358, 9424910). The `panel_theme` column carries categorical codes (`composite-panel-69`, `primary-panel-70`), and `number_of_panelists` is an integer (16, 22, 28, 34). The `moderator_name` column stores names such as `Primary Framework A` or `Composite Protocol`. The `is_recorded` boolean indicates whether the session was recorded, and `discussion_focus` stores categorical descriptors (`seasonal-discussi-11`, `regional-discussi-12`). The foreign key `youth_empowerment_summit_id` links each panel to its summit.

**Table `staff_members`**

| staff_member_id | staff_id | full_name | job_title | is_youth | is_trainer | is_moderator | youth_organization_org_id | conference_workshop_id | panel_discussion_panel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Theodore Mcgrath | Primary Initiative A | true | false | true | 790471 | 100 | 2087758 |
| 2 | 3158139 | Account Name | Composite Model | false | true | false | 1717 | 101 | 4277009 |
| 3 | 8189502 | Saipan International Airport | Compact Cluster | true | false | true | 69437 | 102 | 6926358 |
| 4 | 69438 | Norma Fisher | Legacy Review D | false | true | false | m16 | 103 | 9424910 |

Staff members are stored in `staff_members` with primary key `staff_member_id` (1–4 in the sample). The business identifier `staff_id` carries large integers (`10001`, `10002`, `10003`, `10004`). The `full_name` column holds names such as `Account Name` or `Saipan International Airport`, and `role_title` stores job titles (`pilot-role-20`, `extended-role-21`). The `department` column categorises the staff member (`pilot-department-26`, `extended-department-27`). The foreign key `youth_organization_org_id` links the staff member to their employing youth organisation.

The remaining five tables are junction (association) tables that resolve many-to-many relationships not expressible through direct foreign keys.

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

The `summits_workshops` junction table links summits to workshops. Its composite key comprises `summit_id` (referencing `youth_empowerment_summits.youth_empowerment_summit_id`) and `conference_workshop_id` (referencing `conference_workshops.conference_workshop_id`). The `role` column captures the nature of the association (`pilot-role-20`, `extended-role-21`).

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

The `summits_discussions` junction table links summits to panel discussions. Its composite key comprises `summit_id` and `panel_id` (referencing `panel_discussions.panel_id`). The `role` column captures the association type.

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

The `institutions_participants` junction table links educational institutions to youth participants. Its composite key comprises `educational_institution_id` and `participant_id` (referencing `youth_participants.id`). The `role` column captures the association type.

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

The `organizations_members` junction table links youth organisations to staff members. Its composite key comprises `org_id` and `staff_member_id`. The `role` column captures the association type.

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

The `organizations_participants` junction table links youth organisations to youth participants. Its composite key comprises `org_id` and `participant_id`. The `role` column captures the association type.

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

The `participants_workshops` junction table links youth participants to conference workshops. Its composite key comprises `participant_id` and `conference_workshop_id`. The `role` column captures the association type.

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

The `workshops_participants` junction table provides the reverse link from workshops to participants. Its composite key comprises `conference_workshop_id` and `participant_id`. The `role` column captures the association type.

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

The `discussions_members` junction table links panel discussions to staff members. Its composite key comprises `panel_id` and `staff_member_id`. The `role` column captures the association type.

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

The `discussions_participants` junction table links panel discussions to youth participants. Its composite key comprises `panel_id` and `participant_id`. The `role` column captures the association type.

With the base and junction tables established, the twenty-two views materialise domain-readable projections by joining the normalised tables. Each view answers a specific analytical question by denormalising a pair of related entities.

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

This view joins `youth_empowerment_summits` to `educational_institutions` on `summit_id = educational_institution_id`, producing a row that pairs each summit with its sponsoring school. Reading the first row: summit `SUM-2675` (edition 19, theme `adaptive-current-71`, attendance 18) is sponsored by `Extended Corridor` in `integrated-city-34`, a `pilot-school-38` that is designated as a safe space. This view answers the question: "Which educational institution sponsors each summit?"

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

This view joins `youth_empowerment_summits` to `youth_organizations` on `summit_id = org_id`, pairing each summit with its sponsoring youth organisation. The first row shows summit `SUM-2675` sponsored by `Extended Review`, headquartered in `seasonal-headquar-83`, operating under model `integrated-operatin-64` with a youth board proportion of 5.20. This view answers: "Which youth organisation sponsors each summit?"

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

This view joins `youth_empowerment_summits` to `conference_workshops` on `summit_id = conference_workshop_id`, producing a row that pairs each summit with its workshops. The first row shows summit `SUM-2675` hosting workshop `Baseline Series D` (topic `distributed-topic-60`, duration 35 minutes, youth-only, comprehensive). This view answers: "What workshops are offered at each summit?"

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

This view joins `youth_empowerment_summits` to `panel_discussions` on `summit_id = panel_id`, pairing each summit with its panel discussions. The first row shows summit `SUM-2675` hosting panel `composite-panel-69` with 16 panelists, moderated by `Primary Framework A`, recorded, with focus `seasonal-discussi-11`. This view answers: "What panel discussions are offered at each summit?"

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

This view is the inverse of the first: it joins `educational_institutions` to `youth_empowerment_summits`, answering the question from the institution's perspective. The first row shows `Extended Corridor` (institution ID `9424913`) sponsoring summit `SUM-2675` (edition 19, attendance 18). This view is useful for institutional reporting.

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

This view joins `educational_institutions` to `youth_participants` on `educational_institution_id`, pairing each institution with its enrolled participants. The first row shows `Extended Corridor` with participant `Theodore Mcgrath` (participant ID `3990185`, grade `adaptive-grade-65`, school `pilot-school-26`, identity group `extended-identity-63`, role `pilot-role-20`). This view answers: "Which youth participants are affiliated with each educational institution?"

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

This view joins `youth_organizations` to `youth_empowerment_summits`, answering the question from the organisation's perspective. The first row shows `Extended Review` (org ID `790471`) sponsoring summit `SUM-2675` (edition 19, attendance 18). This view is useful for organisational reporting.

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

This view joins `youth_organizations` to `staff_members` on `org_id`, pairing each organisation with its staff. The first row shows `Extended Review` with staff member `Account Name` (staff ID `10001`, role `pilot-role-20`, department `pilot-department-26`). This view answers: "Which staff members belong to each youth organisation?"

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

This view joins `youth_organizations` to `youth_participants` on `org_id`, pairing each organisation with its participants. The first row shows `Extended Review` with participant `Theodore Mcgrath` (grade `adaptive-grade-65`, school `pilot-school-26`). This view answers: "Which youth participants are associated with each youth organisation?"

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

This view joins `youth_participants` to `youth_empowerment_summits` on `youth_empowerment_summit_id`, answering the question from the participant's perspective. The first row shows `Theodore Mcgrath` (participant ID `3990185`) attending summit `SUM-2675` (edition 19, attendance 18, theme `adaptive-current-71`). This view answers: "Which summit does each youth participant attend?"

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

This view joins `youth_participants` to `educational_institutions` on `educational_institution_id`, pairing each participant with their school. The first row shows `Theodore Mcgrath` enrolled at `Extended Corridor` (institution ID `9424913`, city `integrated-city-34`, level `pilot-school-38`). This view answers: "Which educational institution is each youth participant affiliated with?"

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

This view joins `youth_participants` to `conference_workshops` on `conference_workshop_id`, pairing each participant with the workshops they attend. The first row shows `Theodore Mcgrath` attending workshop `Baseline Series D` (topic `distributed-topic-60`, duration 35 minutes, youth-only, comprehensive). This view answers: "Which conference workshops does each youth participant attend?"

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

This view joins `youth_participants` to `panel_discussions` on `panel_id`, pairing each participant with the panels they join. The first row shows `Theodore Mcgrath` participating in panel `composite-panel-69` (22 panelists, moderated by `Primary Framework A`, recorded, focus `seasonal-discussi-11`). This view answers: "Which panel discussions does each youth participant join?"

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

This view joins `conference_workshops` to `youth_empowerment_summits`, answering the question from the workshop's perspective. The first row shows workshop `Baseline Series D` (topic `distributed-topic-60`, duration 35 minutes) offered at summit `SUM-2675` (edition 19, attendance 18). This view is useful for workshop-level reporting.

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

This view joins `conference_workshops` to `youth_participants` on `conference_workshop_id`, pairing each workshop with its attendees. The first row shows workshop `Baseline Series D` attended by `Theodore Mcgrath` (grade `adaptive-grade-65`, school `pilot-school-26`). This view answers: "Which youth participants attend each conference workshop?"

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

This view joins `conference_workshops` to `staff_members` on `staff_member_id`, pairing each workshop with its responsible staff. The first row shows workshop `Baseline Series D` managed by staff member `Account Name` (role `pilot-role-20`, department `pilot-department-26`). This view answers: "Which staff member is responsible for each conference workshop?"

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

This view joins `panel_discussions` to `youth_empowerment_summits`, answering the question from the panel's perspective. The first row shows panel `composite-panel-69` (22 panelists, moderated by `Primary Framework A`, recorded) offered at summit `SUM-2675` (edition 19, attendance 18). This view is useful for panel-level reporting.

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

This view joins `panel_discussions` to `staff_members` on `staff_member_id`, pairing each panel with its moderator. The first row shows panel `composite-panel-69` moderated by staff member `Account Name` (role `pilot-role-20`, department `pilot-department-26`). This view answers: "Which staff member moderates each panel discussion?"

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

This view joins `panel_discussions` to `youth_participants` on `panel_id`, pairing each panel with its participants. The first row shows panel `composite-panel-69` with participant `Theodore Mcgrath` (grade `adaptive-grade-65`, school `pilot-school-26`). This view answers: "Which youth participants join each panel discussion?"

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

This view joins `staff_members` to `youth_organizations` on `org_id`, answering the question from the staff member's perspective. The first row shows staff member `Account Name` (role `pilot-role-20`, department `pilot-department-26`) employed by `Extended Review` (org ID `790471`, headquarters `seasonal-headquar-83`, operating model `integrated-operatin-64`). This view is useful for HR reporting.

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

This view joins `staff_members` to `conference_workshops` on `staff_member_id`, pairing each staff member with their workshops. The first row shows staff member `Account Name` managing workshop `Baseline Series D` (topic `distributed-topic-60`, duration 35 minutes, youth-only, comprehensive). This view answers: "Which conference workshops does each staff member manage?"

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

This view joins `staff_members` to `panel_discussions` on `staff_member_id`, pairing each staff member with their panels. The first row shows staff member `Account Name` moderating panel `composite-panel-69` (22 panelists, recorded, focus `seasonal-discussi-11`). This view answers: "Which panel discussions does each staff member moderate?"

The schema design reflects a deliberate trade-off between normalisation and query convenience. The seven base tables store each entity type in its own table with a single primary key, eliminating redundancy for institution names, organisation names, and participant names. The five junction tables (`summits_workshops`, `summits_discussions`, `institutions_participants`, `organizations_members`, `organizations_participants`, `participants_workshops`, `workshops_participants`, `discussions_members`, `discussions_participants`) resolve the many-to-many relationships that arise because a single summit hosts multiple workshops and panels, a single participant attends multiple workshops and panels, and a single staff member moderates multiple panels. The twenty-two views materialise the most common join paths, allowing analysts to ask domain-level questions—"Which institution sponsors which summit?" or "Which participants attend which workshops?"—without writing explicit JOIN clauses. The model is extensible: adding a new entity type requires only a new base table and, if necessary, new junction tables, while the view layer can be extended to cover new join paths.