In a professional development ecosystem, learning events are orchestrated across physical and virtual spaces, delivered through structured modules, and experienced by participants whose prior knowledge shapes their trajectory. The domain captures workshop sessions—time-bound gatherings with capacity limits and statuses—anchored to learning environments that encode safety, accessibility, and group-agreement attributes. Participants register for sessions, accumulate prior knowledge records, and engage with practice activities, while learning modules define the pedagogical content with duration, delivery method, and difficulty. The relational schema models this ecosystem through six core entity tables, thirteen junction tables that materialize many-to-many relationships, and sixteen derived views that reconstruct domain facts by joining normalized tables back into readable, question-answering projections.

## Core Entity Tables

The foundation of the schema consists of six tables that store atomic facts about the domain.

**Table `workshop_sessions`**

| workshop_session_id | session_identifier | start_date | end_date | location | max_capacity | current_attendance | status | environment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | 32 | 23 | planned | 726050 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | 42 | 31 | active | 1996940 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | 52 | 39 | completed | 2986218 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | 62 | 47 | cancelled | 8350020 |

The `workshop_sessions` table is the central event entity. Each row represents a scheduled gathering identified by a surrogate `workshop_session_id` and a human-readable `session_identifier` such as `SES-2443`. Temporal boundaries are captured in `start_date` and `end_date`—note that in the sample data, `SES-2443` begins on 2022-09-05 and ends on 2022-09-01, suggesting a data-entry convention where the end date may precede the start date in certain edge cases. The `location` column stores a descriptive string like `extended-location-99`, while `max_capacity` (32 for the first row) and `current_attendance` (23) track seat utilization. The `status` column constrains to a small vocabulary: `planned`, `active`, `completed`, and `cancelled`. A foreign key `environment_id` links each session to its physical or virtual setting in the `learning_environments` table.

**Table `learning_environments`**

| environment_id | physical_safety_level | emotional_safety_level | has_group_agreement | stress_reduction_measures | accessibility_compliance | workshop_session_id |
|---|---|---|---|---|---|---|
| 726050 | low | low | true | integrated-stress-10 | false | 1 |
| 1996940 | medium | medium | false | seasonal-stress-11 | true | 2 |
| 2986218 | high | high | true | regional-stress-12 | false | 3 |
| 8350020 | low | low | false | legacy-stress-13 | true | 4 |

The `learning_environments` table describes the conditions under which a workshop session takes place. Its primary key `environment_id` is referenced by `workshop_sessions.environment_id`. The table encodes two ordinal safety dimensions—`physical_safety_level` and `emotional_safety_level`, each taking values from a small set (`low`, `medium`, `high`). A boolean `has_group_agreement` indicates whether the group established norms, while `stress_reduction_measures` stores a descriptive label such as `integrated-stress-10`. The `accessibility_compliance` boolean signals whether the environment meets accessibility standards. A reciprocal foreign key `workshop_session_id` points back to the session, forming a bidirectional association between environment and session.

**Table `participants`**

| participant_id | full_name | email | registration_date | attendance_status | prior_knowledge_level |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 2023-06-19T17:27:00 | registered | beginner |
| 2 | Account Name | regional-email-12 | 2024-11-03T00:44:00 | attended | intermediate |
| 3 | Saipan International Airport | legacy-email-13 | 2025-04-14T07:01:00 | absent | advanced |
| 4 | Norma Fisher | compact-email-14 | 2022-09-25T14:18:00 | dropped_out | beginner |

The `participants` table stores registered individuals. The surrogate `participant_id` serves as the primary key, while `full_name` holds values like `Theodore Mcgrath` and `Norma Fisher`. The `email` column contains synthetic identifiers such as `seasonal-email-11`. The `registration_date` records when the participant enrolled, and `attendance_status` constrains to `registered`, `attended`, `absent`, or `dropped_out`. The `prior_knowledge_level` column provides a coarse self-assessment (`beginner`, `intermediate`, `advanced`) that complements the more detailed records in `participant_prior_knowledges`.

**Table `learning_modules`**

| id | module_id | title | duration_minutes | delivery_method | difficulty_level | learning_objective |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | 35 | lecture | introductory | composite-learning-33 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 38 | discussion | intermediate | primary-learning-34 |
| 3 | 3744024 | Regional Cluster A | 41 | demonstration | advanced | adaptive-learning-35 |
| 4 | 727063 | Seasonal Review | 44 | simulation | introductory | distributed-learning-36 |

The `learning_modules` table defines the pedagogical content delivered within sessions. Its primary key `id` is a surrogate, while `module_id` provides a secondary identifier (e.g., `13061773` or the template-style `template_ivacode_pagata_0`). The `title` column names the module—`Compact Initiative`, `Legacy Model`, `Regional Cluster A`—and `duration_minutes` specifies its length (35–44 minutes in the sample). The `delivery_method` constrains to `lecture`, `discussion`, `demonstration`, or `simulation`. The `difficulty_level` takes values `introductory`, `intermediate`, or `advanced`, and `learning_objective` stores a coded description such as `composite-learning-33`.

**Table `practice_activities`**

| practice_activity_id | activity_id | activity_type | duration_minutes | required_materials | success_criteria | is_completed |
|---|---|---|---|---|---|---|
| 100 | 8843761 | think_pair_share | 35 | extended-required-45 | extended-success-33 | false |
| 101 | 4180957 | group_discussion | 38 | integrated-required-46 | integrated-success-34 | true |
| 102 | 168545 | role_play | 41 | seasonal-required-47 | seasonal-success-35 | false |
| 103 | default_chart_a_account_53 | case_study | 44 | regional-required-48 | regional-success-36 | true |

The `practice_activities` table captures hands-on exercises. Its primary key `practice_activity_id` is a surrogate, with `activity_id` as a secondary identifier (e.g., `8843761` or the template-style `default_chart_a_account_53`). The `activity_type` column classifies the exercise as `think_pair_share`, `group_discussion`, `role_play`, or `case_study`. Duration, required materials (`extended-required-45`), and success criteria (`extended-success-33`) are stored as descriptive strings. The `is_completed` boolean tracks whether the activity has been finished.

**Table `participant_prior_knowledges`**

| participant_prior_knowledge_id | knowledge_id | topic_area | proficiency_level | source_experience | last_updated | participant_id |
|---|---|---|---|---|---|---|
| 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 | none | composite-source-93 | 2023-06-17T17:27:00 | 1 |
| 2 | 21956270 | compact-topic-56 | basic | primary-source-94 | 2024-11-01T00:44:00 | 2 |
| 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 | moderate | adaptive-source-95 | 2025-04-12T07:01:00 | 3 |
| 4 | 9424910 | primary-topic-58 | expert | distributed-source-96 | 2022-09-23T14:18:00 | 4 |

The `participant_prior_knowledges` table records each participant's pre-existing expertise. Its primary key `participant_prior_knowledge_id` is a surrogate, while `knowledge_id` stores a UUID-style identifier (e.g., `693fde70-8fcc-11eb-924d-9cd76263cbd0`) or a numeric code. The `topic_area` column names the domain (`legacy-topic-55`, `compact-topic-56`), and `proficiency_level` constrains to `none`, `basic`, `moderate`, or `expert`. The `source_experience` column describes where the knowledge originated (`composite-source-93`), and `last_updated` records the timestamp of the most recent assessment. A foreign key `participant_id` links each knowledge record to the `participants` table.

## Junction Tables and Many-to-Many Relationships

The six core entities participate in numerous many-to-many relationships that cannot be captured by simple foreign keys. The schema resolves these through thirteen junction tables, each storing pairs of foreign keys that establish associations between two entity types.

The `sessions_participants` junction table links `workshop_sessions` to `participants`, enabling a session to have many attendees and a participant to attend many sessions. The `sessions_modules` table associates sessions with learning modules, allowing a single module to be delivered across multiple sessions and a session to cover multiple modules. The `environments_participants` table connects learning environments to participants, capturing which participants experienced which environments.

Three additional junction tables mirror these associations from the participant side: `participants_sessions` (participants ↔ sessions), `participants_environments` (participants ↔ environments), and `participants_activities` (participants ↔ practice activities). These symmetric junctions ensure that queries can traverse relationships from either entity's perspective without requiring complex self-joins.

The learning module side of the schema is supported by `modules_sessions` (modules ↔ sessions), `modules_knowledges` (modules ↔ prior knowledge records), and `modules_activities` (modules ↔ practice activities). The `modules_knowledges` junction is particularly important: it connects a learning module to the prior knowledge records of participants who have engaged with it, enabling the system to reason about prerequisite knowledge and knowledge gaps.

The practice activities side is similarly well-connected through `activities_sessions` (activities ↔ sessions), `activities_participants` (activities ↔ participants), and `activities_modules` (activities ↔ modules). This tripartite connectivity means any practice activity can be traced back to the session in which it was conducted, the participants who performed it, and the learning module it supports.

Finally, the `knowledges_modules` junction table links `participant_prior_knowledges` to `learning_modules`, completing the knowledge graph by associating each prior knowledge record with the modules it is relevant to.

## View Projections

The junction tables alone are not directly queryable by end users; instead, sixteen derived views materialize the most common analytical questions by joining the appropriate tables. Each view answers a specific domain question by reconstructing a fact from the normalized schema.

**View `vw_workshop_session_learning_environment`**

```sql
CREATE VIEW vw_workshop_session_learning_environment AS
SELECT a.workshop_session_id, a.session_identifier, a.start_date, a.end_date, b.environment_id AS environment_environment_id, b.physical_safety_level AS environment_physical_safety_level, b.emotional_safety_level AS environment_emotional_safety_level
FROM workshop_sessions a JOIN learning_environments b ON a.environment_id = b.environment_id;
```

| workshop_session_id | session_identifier | start_date | end_date | environment_environment_id | environment_physical_safety_level | environment_emotional_safety_level |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 726050 | low | low |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1996940 | medium | medium |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 2986218 | high | high |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 8350020 | low | low |

This view joins `workshop_sessions` with `learning_environments` on their mutual foreign keys, producing a single-row-per-session projection that combines temporal and capacity data with safety and accessibility attributes. For session `SES-2443`, the view would show that the session at `extended-location-99` with 23 of 32 seats filled takes place in an environment rated `low` for both physical and emotional safety, with `integrated-stress-10` measures in place but without accessibility compliance.

**View `vw_workshop_session_participant_detail`**

```sql
CREATE VIEW vw_workshop_session_participant_detail AS
SELECT a.workshop_session_id, a.session_identifier, a.start_date, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM workshop_sessions a
  JOIN sessions_participants j ON j.workshop_session_id = a.workshop_session_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| workshop_session_id | session_identifier | start_date | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 1 | Theodore Mcgrath | seasonal-email-11 |
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2 | Account Name | regional-email-12 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2 | Account Name | regional-email-12 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 3 | Saipan International Airport | legacy-email-13 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 3 | Saipan International Airport | legacy-email-13 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 4 | Norma Fisher | compact-email-14 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 4 | Norma Fisher | compact-email-14 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `workshop_sessions` with `sessions_participants` and `participants`, answering the question: "Who is attending which session, and what is their registration status?" A row for participant `Theodore Mcgrath` (email `seasonal-email-11`, status `registered`) attending session `SES-2443` would appear, combining the participant's profile with the session's schedule and location.

**View `vw_workshop_session_learning_module_detail`**

```sql
CREATE VIEW vw_workshop_session_learning_module_detail AS
SELECT a.workshop_session_id, a.session_identifier, a.start_date, b.id AS module_id, b.module_id AS module_module_id, b.title AS module_title
FROM workshop_sessions a
  JOIN sessions_modules j ON j.workshop_session_id = a.workshop_session_id
  JOIN learning_modules b ON b.id = j.learning_module_id;
```

| workshop_session_id | session_identifier | start_date | module_id | module_module_id | module_title |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 1 | 13061773 | Compact Initiative |
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 3 | 3744024 | Regional Cluster A |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 3 | 3744024 | Regional Cluster A |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 4 | 727063 | Seasonal Review |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 4 | 727063 | Seasonal Review |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 1 | 13061773 | Compact Initiative |

This view joins `workshop_sessions` with `sessions_modules` and `learning_modules`, answering: "Which modules are delivered in which session?" For session `SES-2443`, the view would list each associated module—for instance, `Compact Initiative` (35 minutes, lecture, introductory difficulty, objective `composite-learning-33`)—allowing curriculum planners to verify module coverage per session.

**View `vw_learning_environment_workshop_session`**

```sql
CREATE VIEW vw_learning_environment_workshop_session AS
SELECT a.environment_id, a.physical_safety_level, a.emotional_safety_level, a.has_group_agreement, b.workshop_session_id AS session_workshop_session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM learning_environments a JOIN workshop_sessions b ON a.workshop_session_id = b.workshop_session_id;
```

| environment_id | physical_safety_level | emotional_safety_level | has_group_agreement | session_workshop_session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|---|
| 726050 | low | low | true | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1996940 | medium | medium | false | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2986218 | high | high | true | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 8350020 | low | low | false | 4 | SES-2461 | 2025-12-11T17:15:00 |

This view reverses the perspective of the first view, joining `learning_environments` with `workshop_sessions` to answer: "Which sessions are scheduled in which environment?" For environment `726050` (physical safety `low`, emotional safety `low`, group agreement `true`, stress measures `integrated-stress-10`, no accessibility compliance), the view would show session `SES-2443` at `extended-location-99`, enabling facility managers to assess which sessions are in environments needing improvement.

**View `vw_learning_environment_participant_detail`**

```sql
CREATE VIEW vw_learning_environment_participant_detail AS
SELECT a.environment_id, a.physical_safety_level, a.emotional_safety_level, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM learning_environments a
  JOIN environments_participants j ON j.environment_id = a.environment_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| environment_id | physical_safety_level | emotional_safety_level | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 726050 | low | low | 1 | Theodore Mcgrath | seasonal-email-11 |
| 726050 | low | low | 2 | Account Name | regional-email-12 |
| 1996940 | medium | medium | 2 | Account Name | regional-email-12 |
| 1996940 | medium | medium | 3 | Saipan International Airport | legacy-email-13 |
| 2986218 | high | high | 3 | Saipan International Airport | legacy-email-13 |
| 2986218 | high | high | 4 | Norma Fisher | compact-email-14 |
| 8350020 | low | low | 4 | Norma Fisher | compact-email-14 |
| 8350020 | low | low | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `learning_environments` with `environments_participants` and `participants`, answering: "Which participants experienced which environment?" A row would link participant `Theodore Mcgrath` to environment `726050`, combining the participant's registration details with the environment's safety profile.

**View `vw_participant_workshop_session_detail`**

```sql
CREATE VIEW vw_participant_workshop_session_detail AS
SELECT a.participant_id, a.full_name, a.email, b.workshop_session_id AS session_workshop_session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM participants a
  JOIN participants_sessions j ON j.participant_id = a.participant_id
  JOIN workshop_sessions b ON b.workshop_session_id = j.workshop_session_id;
```

| participant_id | full_name | email | session_workshop_session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | Theodore Mcgrath | seasonal-email-11 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | regional-email-12 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | regional-email-12 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | legacy-email-13 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | legacy-email-13 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | compact-email-14 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | compact-email-14 | 1 | SES-2443 | 2022-09-05T20:24:00 |

This view joins `participants` with `participants_sessions` and `workshop_sessions`, answering: "Which sessions has each participant registered for, and what is their attendance status?" For participant `Account Name` (status `attended`), the view would show the sessions they have attended, along with each session's date range, location, and capacity utilization.

**View `vw_participant_learning_environment_detail`**

```sql
CREATE VIEW vw_participant_learning_environment_detail AS
SELECT a.participant_id, a.full_name, a.email, b.environment_id AS environment_environment_id, b.physical_safety_level AS environment_physical_safety_level, b.emotional_safety_level AS environment_emotional_safety_level
FROM participants a
  JOIN participants_environments j ON j.participant_id = a.participant_id
  JOIN learning_environments b ON b.environment_id = j.environment_id;
```

| participant_id | full_name | email | environment_environment_id | environment_physical_safety_level | environment_emotional_safety_level |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 726050 | low | low |
| 1 | Theodore Mcgrath | seasonal-email-11 | 1996940 | medium | medium |
| 2 | Account Name | regional-email-12 | 1996940 | medium | medium |
| 2 | Account Name | regional-email-12 | 2986218 | high | high |
| 3 | Saipan International Airport | legacy-email-13 | 2986218 | high | high |
| 3 | Saipan International Airport | legacy-email-13 | 8350020 | low | low |
| 4 | Norma Fisher | compact-email-14 | 8350020 | low | low |
| 4 | Norma Fisher | compact-email-14 | 726050 | low | low |

This view joins `participants` with `participants_environments` and `learning_environments`, answering: "Which environments has each participant experienced?" A row for participant `Saipan International Airport` (status `absent`) would show the environments they were associated with, along with each environment's safety and accessibility attributes.

**View `vw_participant_practice_activity_detail`**

```sql
CREATE VIEW vw_participant_practice_activity_detail AS
SELECT a.participant_id, a.full_name, a.email, b.practice_activity_id AS activity_practice_activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM participants a
  JOIN participants_activities j ON j.participant_id = a.participant_id
  JOIN practice_activities b ON b.practice_activity_id = j.practice_activity_id;
```

| participant_id | full_name | email | activity_practice_activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 100 | 8843761 | think_pair_share |
| 1 | Theodore Mcgrath | seasonal-email-11 | 101 | 4180957 | group_discussion |
| 2 | Account Name | regional-email-12 | 101 | 4180957 | group_discussion |
| 2 | Account Name | regional-email-12 | 102 | 168545 | role_play |
| 3 | Saipan International Airport | legacy-email-13 | 102 | 168545 | role_play |
| 3 | Saipan International Airport | legacy-email-13 | 103 | default_chart_a_account_53 | case_study |
| 4 | Norma Fisher | compact-email-14 | 103 | default_chart_a_account_53 | case_study |
| 4 | Norma Fisher | compact-email-14 | 100 | 8843761 | think_pair_share |

This view joins `participants` with `participants_activities` and `practice_activities`, answering: "Which practice activities has each participant completed?" For participant `Norma Fisher` (status `dropped_out`), the view would list the activities they engaged with, including the activity type (`think_pair_share`, `group_discussion`, etc.), duration, and completion status.

**View `vw_learning_module_workshop_session_detail`**

```sql
CREATE VIEW vw_learning_module_workshop_session_detail AS
SELECT a.id, a.module_id, a.title, b.workshop_session_id AS session_workshop_session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM learning_modules a
  JOIN modules_sessions j ON j.learning_module_id = a.id
  JOIN workshop_sessions b ON b.workshop_session_id = j.workshop_session_id;
```

| id | module_id | title | session_workshop_session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | 13061773 | Compact Initiative | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | 3744024 | Regional Cluster A | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | 3744024 | Regional Cluster A | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | 727063 | Seasonal Review | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | 727063 | Seasonal Review | 1 | SES-2443 | 2022-09-05T20:24:00 |

This view joins `learning_modules` with `modules_sessions` and `workshop_sessions`, answering: "In which sessions is each learning module delivered?" For module `Compact Initiative` (35 minutes, lecture, introductory), the view would show all sessions in which it appears, enabling curriculum auditors to verify that modules are distributed across sessions as intended.

**View `vw_learning_module_participant_prior_knowledge_detail`**

```sql
CREATE VIEW vw_learning_module_participant_prior_knowledge_detail AS
SELECT a.id, a.module_id, a.title, b.participant_prior_knowledge_id AS knowledge_participant_prior_knowledge_id, b.knowledge_id AS knowledge_knowledge_id, b.topic_area AS knowledge_topic_area
FROM learning_modules a
  JOIN modules_knowledges j ON j.learning_module_id = a.id
  JOIN participant_prior_knowledges b ON b.participant_prior_knowledge_id = j.participant_prior_knowledge_id;
```

| id | module_id | title | knowledge_participant_prior_knowledge_id | knowledge_knowledge_id | knowledge_topic_area |
|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 |
| 1 | 13061773 | Compact Initiative | 2 | 21956270 | compact-topic-56 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 2 | 21956270 | compact-topic-56 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 |
| 3 | 3744024 | Regional Cluster A | 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 |
| 3 | 3744024 | Regional Cluster A | 4 | 9424910 | primary-topic-58 |
| 4 | 727063 | Seasonal Review | 4 | 9424910 | primary-topic-58 |
| 4 | 727063 | Seasonal Review | 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 |

This view joins `learning_modules` with `modules_knowledges` and `participant_prior_knowledges`, answering: "Which participants' prior knowledge records are relevant to each learning module?" For module `Legacy Model` (38 minutes, discussion, intermediate difficulty), the view would list the prior knowledge records associated with it, including the topic area (`compact-topic-56`), proficiency level (`basic`), and source experience (`primary-source-94`).

**View `vw_learning_module_practice_activity_detail`**

```sql
CREATE VIEW vw_learning_module_practice_activity_detail AS
SELECT a.id, a.module_id, a.title, b.practice_activity_id AS activity_practice_activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM learning_modules a
  JOIN modules_activities j ON j.learning_module_id = a.id
  JOIN practice_activities b ON b.practice_activity_id = j.practice_activity_id;
```

| id | module_id | title | activity_practice_activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | 100 | 8843761 | think_pair_share |
| 1 | 13061773 | Compact Initiative | 101 | 4180957 | group_discussion |
| 2 | template_ivacode_pagata_0 | Legacy Model | 101 | 4180957 | group_discussion |
| 2 | template_ivacode_pagata_0 | Legacy Model | 102 | 168545 | role_play |
| 3 | 3744024 | Regional Cluster A | 102 | 168545 | role_play |
| 3 | 3744024 | Regional Cluster A | 103 | default_chart_a_account_53 | case_study |
| 4 | 727063 | Seasonal Review | 103 | default_chart_a_account_53 | case_study |
| 4 | 727063 | Seasonal Review | 100 | 8843761 | think_pair_share |

This view joins `learning_modules` with `modules_activities` and `practice_activities`, answering: "Which practice activities support each learning module?" For module `Regional Cluster A` (41 minutes, demonstration, advanced), the view would list the associated activities, such as `role_play` (41 minutes, seasonal-required-47 materials, seasonal-success-35 criteria, not yet completed).

**View `vw_practice_activity_workshop_session_detail`**

```sql
CREATE VIEW vw_practice_activity_workshop_session_detail AS
SELECT a.practice_activity_id, a.activity_id, a.activity_type, b.workshop_session_id AS session_workshop_session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM practice_activities a
  JOIN activities_sessions j ON j.practice_activity_id = a.practice_activity_id
  JOIN workshop_sessions b ON b.workshop_session_id = j.workshop_session_id;
```

| practice_activity_id | activity_id | activity_type | session_workshop_session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 100 | 8843761 | think_pair_share | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 100 | 8843761 | think_pair_share | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 101 | 4180957 | group_discussion | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 101 | 4180957 | group_discussion | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 102 | 168545 | role_play | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 102 | 168545 | role_play | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 103 | default_chart_a_account_53 | case_study | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 103 | default_chart_a_account_53 | case_study | 1 | SES-2443 | 2022-09-05T20:24:00 |

This view joins `practice_activities` with `activities_sessions` and `workshop_sessions`, answering: "In which sessions is each practice activity conducted?" For activity `group_discussion` (38 minutes, completed), the view would show the sessions in which it was delivered, along with each session's date, location, and status.

**View `vw_practice_activity_participant_detail`**

```sql
CREATE VIEW vw_practice_activity_participant_detail AS
SELECT a.practice_activity_id, a.activity_id, a.activity_type, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM practice_activities a
  JOIN activities_participants j ON j.practice_activity_id = a.practice_activity_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| practice_activity_id | activity_id | activity_type | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 100 | 8843761 | think_pair_share | 1 | Theodore Mcgrath | seasonal-email-11 |
| 100 | 8843761 | think_pair_share | 2 | Account Name | regional-email-12 |
| 101 | 4180957 | group_discussion | 2 | Account Name | regional-email-12 |
| 101 | 4180957 | group_discussion | 3 | Saipan International Airport | legacy-email-13 |
| 102 | 168545 | role_play | 3 | Saipan International Airport | legacy-email-13 |
| 102 | 168545 | role_play | 4 | Norma Fisher | compact-email-14 |
| 103 | default_chart_a_account_53 | case_study | 4 | Norma Fisher | compact-email-14 |
| 103 | default_chart_a_account_53 | case_study | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `practice_activities` with `activities_participants` and `participants`, answering: "Which participants performed each practice activity?" For activity `case_study` (44 minutes, completed), the view would list the participants who engaged with it, along with their names, registration dates, and attendance statuses.

**View `vw_practice_activity_learning_module_detail`**

```sql
CREATE VIEW vw_practice_activity_learning_module_detail AS
SELECT a.practice_activity_id, a.activity_id, a.activity_type, b.id AS module_id, b.module_id AS module_module_id, b.title AS module_title
FROM practice_activities a
  JOIN activities_modules j ON j.practice_activity_id = a.practice_activity_id
  JOIN learning_modules b ON b.id = j.learning_module_id;
```

| practice_activity_id | activity_id | activity_type | module_id | module_module_id | module_title |
|---|---|---|---|---|---|
| 100 | 8843761 | think_pair_share | 1 | 13061773 | Compact Initiative |
| 100 | 8843761 | think_pair_share | 2 | template_ivacode_pagata_0 | Legacy Model |
| 101 | 4180957 | group_discussion | 2 | template_ivacode_pagata_0 | Legacy Model |
| 101 | 4180957 | group_discussion | 3 | 3744024 | Regional Cluster A |
| 102 | 168545 | role_play | 3 | 3744024 | Regional Cluster A |
| 102 | 168545 | role_play | 4 | 727063 | Seasonal Review |
| 103 | default_chart_a_account_53 | case_study | 4 | 727063 | Seasonal Review |
| 103 | default_chart_a_account_53 | case_study | 1 | 13061773 | Compact Initiative |

This view joins `practice_activities` with `activities_modules` and `learning_modules`, answering: "Which learning module does each practice activity support?" For activity `think_pair_share` (35 minutes, not completed), the view would show the associated module, such as `Seasonal Review` (44 minutes, simulation, introductory difficulty, objective `distributed-learning-36`).

**View `vw_participant_prior_knowledge_participant`**

```sql
CREATE VIEW vw_participant_prior_knowledge_participant AS
SELECT a.participant_prior_knowledge_id, a.knowledge_id, a.topic_area, a.proficiency_level, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM participant_prior_knowledges a JOIN participants b ON a.participant_id = b.participant_id;
```

| participant_prior_knowledge_id | knowledge_id | topic_area | proficiency_level | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|---|
| 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 | none | 1 | Theodore Mcgrath | seasonal-email-11 |
| 2 | 21956270 | compact-topic-56 | basic | 2 | Account Name | regional-email-12 |
| 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 | moderate | 3 | Saipan International Airport | legacy-email-13 |
| 4 | 9424910 | primary-topic-58 | expert | 4 | Norma Fisher | compact-email-14 |

This view joins `participant_prior_knowledges` with `participants`, answering: "What prior knowledge does each participant have?" For participant `Theodore Mcgrath`, the view would show their knowledge record with topic area `legacy-topic-55`, proficiency level `none`, and source experience `composite-source-93`, providing a detailed snapshot of their starting point.

**View `vw_participant_prior_knowledge_learning_module_detail`**

```sql
CREATE VIEW vw_participant_prior_knowledge_learning_module_detail AS
SELECT a.participant_prior_knowledge_id, a.knowledge_id, a.topic_area, b.id AS module_id, b.module_id AS module_module_id, b.title AS module_title
FROM participant_prior_knowledges a
  JOIN knowledges_modules j ON j.participant_prior_knowledge_id = a.participant_prior_knowledge_id
  JOIN learning_modules b ON b.id = j.learning_module_id;
```

| participant_prior_knowledge_id | knowledge_id | topic_area | module_id | module_module_id | module_title |
|---|---|---|---|---|---|
| 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 | 1 | 13061773 | Compact Initiative |
| 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | 21956270 | compact-topic-56 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | 21956270 | compact-topic-56 | 3 | 3744024 | Regional Cluster A |
| 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 | 3 | 3744024 | Regional Cluster A |
| 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 | 4 | 727063 | Seasonal Review |
| 4 | 9424910 | primary-topic-58 | 4 | 727063 | Seasonal Review |
| 4 | 9424910 | primary-topic-58 | 1 | 13061773 | Compact Initiative |

This view joins `participant_prior_knowledges` with `knowledges_modules` and `learning_modules`, answering: "Which learning modules are relevant to each participant's prior knowledge?" For the knowledge record with topic `composite-topic-57` and proficiency `moderate` (belonging to participant `Saipan International Airport`), the view would show the modules it is associated with, enabling the system to recommend appropriate learning paths based on existing expertise.

## Synthesis

The schema models a professional development ecosystem through a carefully layered design: six core entity tables store atomic facts about sessions, environments, participants, modules, activities, and prior knowledge; thirteen junction tables resolve the many-to-many relationships between these entities, ensuring that no information is duplicated and that associations can be queried from any direction; and sixteen derived views reconstruct the most common analytical questions by joining the appropriate tables, presenting normalized data in a form that directly answers domain-specific queries. The result is a schema that is both normalized—avoiding redundancy and update anomalies—and analytically rich, with every view providing a clear, question-driven projection of the underlying data.

## Data appendix

**Table `sessions_participants`**

| workshop_session_id | participant_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `sessions_modules`**

| workshop_session_id | learning_module_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `environments_participants`**

| environment_id | participant_id |
|---|---|
| 726050 | 1 |
| 726050 | 2 |
| 1996940 | 2 |
| 1996940 | 3 |
| 2986218 | 3 |
| 2986218 | 4 |
| 8350020 | 4 |
| 8350020 | 1 |

**Table `participants_sessions`**

| participant_id | workshop_session_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `participants_environments`**

| participant_id | environment_id |
|---|---|
| 1 | 726050 |
| 1 | 1996940 |
| 2 | 1996940 |
| 2 | 2986218 |
| 3 | 2986218 |
| 3 | 8350020 |
| 4 | 8350020 |
| 4 | 726050 |

**Table `participants_activities`**

| participant_id | practice_activity_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `modules_sessions`**

| learning_module_id | workshop_session_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `modules_knowledges`**

| learning_module_id | participant_prior_knowledge_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `modules_activities`**

| learning_module_id | practice_activity_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `activities_sessions`**

| practice_activity_id | workshop_session_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `activities_participants`**

| practice_activity_id | participant_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `activities_modules`**

| practice_activity_id | learning_module_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `knowledges_modules`**

| participant_prior_knowledge_id | learning_module_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
