## Relational Modelling of a Workshop Learning Ecosystem

A workshop learning ecosystem brings together sessions, environments, participants, and instructional content into a single managed domain. The data model captures who attends, where they learn, what motivates them, which activities they perform, and how physical spaces and group norms shape the experience. The schema is normalised to third normal form: each entity type lives in its own table, relationships are expressed through foreign keys and junction tables, and materialised views reassemble the joins so that analysts can query domain facts without reconstructing the graph each time.

**Table `workshop_sessions`**

| id | session_identifier | start_date | end_date | location | topic | status | learning_environment_id |
|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | distributed-topic-60 | planned | 100 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | baseline-topic-61 | in_progress | 101 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | pilot-topic-62 | completed | 102 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | extended-topic-63 | cancelled | 103 |

The `workshop_sessions` table is the central event entity. Each row represents a scheduled workshop identified by a human-readable `session_identifier` such as `SES-2443` or `SES-2461`. Temporal boundaries are stored in `start_date` and `end_date` as ISO-8601 timestamps; for example, session `SES-2443` spans from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`. The `location` column holds a descriptive string like `extended-location-99`, while `topic` carries a domain label such as `distributed-topic-60`. A `status` column constrains the lifecycle state to one of `planned`, `in_progress`, `completed`, or `cancelled`, as seen in the four rows where the statuses cycle through each value. The primary key is the surrogate `id` column, and a foreign key `learning_environment_id` links each session to exactly one row in `learning_environments`.

**Table `learning_environments`**

| learning_environment_id | environment_id | safety_level | noise_level | lighting_condition | temperature | is_secure | workshop_session_id | group_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 726050 | low | 10.70 | baseline-lighting-25 | 1.33 | false | 1 | 1 |
| 101 | 1996940 | medium | 13.40 | pilot-lighting-26 | 1.1714807757148185 | true | 2 | 2 |
| 102 | 2986218 | high | 16.10 | extended-lighting-27 | 0.51 | false | 3 | 3 |
| 103 | 8350020 | low | 18.80 | integrated-lighting-28 | 0.85 | true | 4 | 4 |

The `learning_environments` table describes the physical and procedural conditions of a session's venue. Its primary key is `learning_environment_id`, and it carries a business identifier `environment_id` (for instance, `726050` or `1996940`). Environmental attributes are stored as scalar values: `safety_level` is an ordinal string (`low`, `medium`, `high`), `noise_level` is a numeric measurement (e.g. `10.70` or `18.80`), `lighting_condition` is a categorical label such as `baseline-lighting-25`, and `temperature` is a floating-point reading (e.g. `1.33` or `0.51`). The boolean `is_secure` flag indicates whether the space is secured. A foreign key `workshop_session_id` creates a one-to-one relationship back to `workshop_sessions`, meaning each session has exactly one environment record and each environment belongs to exactly one session. The `group_agreement_id` column is a foreign key into the `group_agreements` table, establishing a one-to-one link between an environment and the behavioural norms that apply within it.

**Table `participants`**

| participant_id | full_name | email | registration_date | attendance_status | prior_knowledge_level | motivation_type_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 2023-06-19T17:27:00 | registered | beginner | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | regional-email-12 | 2024-11-03T00:44:00 | attended | intermediate | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | legacy-email-13 | 2025-04-14T07:01:00 | absent | advanced | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | compact-email-14 | 2022-09-25T14:18:00 | dropped_out | beginner | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `participants` table stores registered individuals. Its surrogate primary key is `participant_id`, and the business identity is `full_name`, which in the sample data includes values like `Theodore Mcgrath` and `Account Name`. Contact information is captured in `email` (e.g. `seasonal-email-11`), and the `registration_date` records when the participant enrolled. The `attendance_status` column constrains attendance to one of `registered`, `attended`, `absent`, or `dropped_out`. A `prior_knowledge_level` column classifies the participant as `beginner`, `intermediate`, or `advanced`. The foreign key `motivation_type_id` links each participant to a single row in `motivation_types`. Audit timestamps `created_at` and `updated_at` track the lifecycle of the registration record.

**Table `motivation_types`**

| id | motivation_id | motivation_category | intensity | trigger_source | is_sustainable | participant_id |
|---|---|---|---|---|---|---|
| 100 | 1250209 | intrinsic | 7.20 | distributed-trigger-96 | true | 1 |
| 101 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | extrinsic | 9.40 | baseline-trigger-97 | false | 2 |
| 102 | 89146 | intrinsic | 11.60 | pilot-trigger-98 | true | 3 |
| 103 | 4793478 | extrinsic | 13.80 | extended-trigger-99 | false | 4 |

The `motivation_types` table defines the motivational profile associated with each participant. Its primary key is `id`, and it carries a business identifier `motivation_id` that can be a numeric string (`1250209`) or a UUID (`a001f18c-9bac-11eb-a8a2-19ed5c03f8d3`). The `motivation_category` column classifies motivation as `intrinsic` or `extrinsic`. The `intensity` column stores a numeric score (e.g. `7.20` or `13.80`), and `trigger_source` is a categorical label such as `distributed-trigger-96`. The boolean `is_sustainable` indicates whether the motivation is expected to persist. A foreign key `participant_id` creates a one-to-one relationship back to `participants`, meaning each participant has exactly one motivation type and each motivation type belongs to exactly one participant.

**Table `practice_activities`**

| practice_activity_id | activity_id | activity_name | duration_minutes | complexity_level | is_hands_on | completion_rate | workshop_session_id | learning_module_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 8843761 | Composite Programme | 35 | low | true | 19.70 | 1 | 1 |
| 1001 | 4180957 | Compact Standard A | 38 | medium | false | 22.40 | 2 | 2 |
| 1002 | 168545 | Legacy Framework | 41 | high | true | 25.10 | 3 | 3 |
| 1003 | default_chart_a_account_53 | Regional Protocol | 44 | low | false | 27.80 | 4 | 4 |

The `practice_activities` table captures hands-on or theoretical exercises. Its surrogate primary key is `practice_activity_id`, and it carries a business identifier `activity_id` (e.g. `8843761` or `default_chart_a_account_53`). The `activity_name` column holds a human-readable title such as `Composite Programme` or `Regional Protocol`. The `duration_minutes` column stores the planned length (e.g. `35` or `44`), and `complexity_level` is an ordinal string (`low`, `medium`, `high`). The boolean `is_hands_on` flag distinguishes practical exercises from theoretical ones. The `completion_rate` column stores a numeric percentage (e.g. `19.70` or `27.80`). Two foreign keys anchor this table: `workshop_session_id` links each activity to the session it belongs to, and `learning_module_id` links it to a `learning_modules` row.

**Table `learning_modules`**

| id | module_id | title | content_format | duration_minutes | difficulty_level | is_relevant | workshop_session_id | practice_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | lecture | 35 | basic | true | 1 | 1000 |
| 2 | template_ivacode_pagata_0 | Legacy Model | video | 38 | intermediate | false | 2 | 1001 |
| 3 | 3744024 | Regional Cluster A | handout | 41 | advanced | true | 3 | 1002 |
| 4 | 727063 | Seasonal Review | interactive | 44 | basic | false | 4 | 1003 |

The `learning_modules` table defines instructional content units. Its surrogate primary key is `id`, and it carries a business identifier `module_id` (e.g. `13061773` or `template_ivacode_pagata_0`). The `title` column holds a descriptive name such as `Compact Initiative` or `Seasonal Review`. The `content_format` column classifies the delivery method as `lecture`, `video`, `handout`, or `interactive`. The `duration_minutes` column stores the planned length, and `difficulty_level` is an ordinal string (`basic`, `intermediate`, `advanced`). The boolean `is_relevant` flag indicates whether the module is currently applicable. A foreign key `workshop_session_id` links each module to its parent session, and `practice_activity_id` creates a one-to-one link back to `practice_activities`, meaning each module is associated with exactly one practice activity and vice versa.

**Table `physical_amenities`**

| physical_amenity_id | amenity_id | amenity_type | quantity_provided | is_clean | is_accessible | learning_environment_id | participant_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158143 | snack | 4 | true | true | 100 | 1 |
| 101 | default_chart_a_tax_code_37 | lunch | 15 | false | false | 101 | 2 |
| 102 | BJBBB | toilet | 2 | true | true | 102 | 3 |
| 103 | L851 | hearing_aid | 1 | false | false | 103 | 4 |

The `physical_amenities` table stores the catalogue of physical resources available in learning spaces. Each row represents a distinct amenity type, and the table is linked to `learning_environments` through the junction table `environments_amenities`, enabling a many-to-many relationship: a single amenity can be available across multiple environments, and a single environment can offer multiple amenities.

**Table `group_agreements`**

| group_agreement_id | agreement_id | rule_description | is_enforced | violation_count | learning_environment_id |
|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A | false | 96 | 100 |
| 2 | 4716391 | Extended Assessment | true | 11 | 101 |
| 3 | 3001009030180 | Pilot Survey | false | 61 | 102 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | true | 52 | 103 |

The `group_agreements` table defines the behavioural norms and ground rules that apply within a learning environment. Each row represents a distinct agreement, and it is linked to `learning_environments` via the `group_agreement_id` foreign key in the environment table (one-to-one in the current normalisation), and to `participants` through the junction table `agreements_participants`, enabling a many-to-many relationship where participants can be bound by multiple agreements and each agreement can apply to multiple participants.

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

The `sessions_modules` junction table resolves the many-to-many relationship between `workshop_sessions` and `learning_modules`. Although `learning_modules` already carries a `workshop_session_id` foreign key, this explicit junction table allows a session to reference multiple modules and a module to be referenced by multiple sessions, providing flexibility for cross-session content reuse.

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

The `sessions_participants` junction table resolves the many-to-many relationship between `workshop_sessions` and `participants`. It records which participants are enrolled in which sessions, complementing the direct `participants_sessions` table which may carry additional enrolment metadata.

**Table `environments_amenities`**

| learning_environment_id | physical_amenity_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `environments_amenities` junction table resolves the many-to-many relationship between `learning_environments` and `physical_amenities`. Each row asserts that a particular amenity is available in a particular environment.

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

The `participants_sessions` junction table records the explicit enrolment relationship between `participants` and `workshop_sessions`. It may carry additional metadata beyond the bare association, such as enrolment date or role, and complements the `sessions_participants` table which serves the same logical relationship from the session's perspective.

**Table `participants_activities`**

| participant_id | practice_activity_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `participants_activities` junction table resolves the many-to-many relationship between `participants` and `practice_activities`. It records which participants have engaged with which activities, enabling tracking of individual participation across multiple exercises.

**Table `activities_participants`**

| practice_activity_id | participant_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `activities_participants` junction table provides the inverse view of the `participants_activities` relationship, recording which participants are associated with each practice activity. This redundancy supports queries that start from the activity and enumerate its participants.

**Table `agreements_participants`**

| group_agreement_id | participant_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `agreements_participants` junction table resolves the many-to-many relationship between `group_agreements` and `participants`. Each row asserts that a particular participant is bound by a particular group agreement.

**View `v_workshop_session_learning_environment`**

```sql
CREATE VIEW v_workshop_session_learning_environment AS
SELECT a.id, a.session_identifier, a.start_date, a.end_date, b.learning_environment_id AS environment_learning_environment_id, b.environment_id AS environment_environment_id, b.safety_level AS environment_safety_level
FROM workshop_sessions a JOIN learning_environments b ON a.learning_environment_id = b.learning_environment_id;
```

| id | session_identifier | start_date | end_date | environment_learning_environment_id | environment_environment_id | environment_safety_level |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | 726050 | low |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | 1996940 | medium |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 2986218 | high |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 8350020 | low |

This view joins `workshop_sessions` with `learning_environments` on the `learning_environment_id` / `workshop_session_id` relationship, producing a single row per session that combines the session's metadata with its environmental conditions. For example, the row for session `SES-2443` (`id = 1`) shows `location = extended-location-99` alongside `safety_level = low`, `noise_level = 10.70`, and `is_secure = false`. The second row for `SES-2449` (`id = 2`) pairs `integrated-location-100` with `safety_level = medium`, `noise_level = 13.40`, and `is_secure = true`. This view answers the question: "What are the environmental conditions for each workshop session?"

**View `v_workshop_session_learning_module_detail`**

```sql
CREATE VIEW v_workshop_session_learning_module_detail AS
SELECT a.id, a.session_identifier, a.start_date, b.id AS module_id, b.module_id AS module_module_id, b.title AS module_title
FROM workshop_sessions a
  JOIN sessions_modules j ON j.workshop_session_id = a.id
  JOIN learning_modules b ON b.id = j.learning_module_id;
```

| id | session_identifier | start_date | module_id | module_module_id | module_title |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 1 | 13061773 | Compact Initiative |
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 3 | 3744024 | Regional Cluster A |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 3 | 3744024 | Regional Cluster A |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 4 | 727063 | Seasonal Review |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 4 | 727063 | Seasonal Review |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 1 | 13061773 | Compact Initiative |

This view joins `workshop_sessions` with `learning_modules` through the `workshop_session_id` foreign key, producing a row per module that includes the session's identifying information. The first row shows session `SES-2443` paired with module `Compact Initiative` (`module_id = 13061773`), delivered as a `lecture` with `duration_minutes = 35` and `difficulty_level = basic`. The fourth row pairs session `SES-2461` with module `Seasonal Review` (`module_id = 727063`), delivered as `interactive` content with `difficulty_level = basic` and `is_relevant = false`. This view answers: "Which learning modules are associated with each workshop session, and what are their characteristics?"

**View `v_workshop_session_participant_detail`**

```sql
CREATE VIEW v_workshop_session_participant_detail AS
SELECT a.id, a.session_identifier, a.start_date, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM workshop_sessions a
  JOIN sessions_participants j ON j.workshop_session_id = a.id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| id | session_identifier | start_date | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 1 | Theodore Mcgrath | seasonal-email-11 |
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2 | Account Name | regional-email-12 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2 | Account Name | regional-email-12 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 3 | Saipan International Airport | legacy-email-13 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 3 | Saipan International Airport | legacy-email-13 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 4 | Norma Fisher | compact-email-14 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 4 | Norma Fisher | compact-email-14 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `workshop_sessions` with `participants` through the `sessions_participants` or `participants_sessions` junction tables, producing a row per session-participant enrolment. The first row might show session `SES-2443` with participant `Theodore Mcgrath` (`participant_id = 1`), who has `attendance_status = registered` and `prior_knowledge_level = beginner`. The third row could pair session `SES-2455` with participant `Saipan International Airport` (`participant_id = 3`), who has `attendance_status = absent` and `prior_knowledge_level = advanced`. This view answers: "Who is enrolled in each workshop session, and what is their attendance and knowledge profile?"

**View `v_learning_environment_workshop_session`**

```sql
CREATE VIEW v_learning_environment_workshop_session AS
SELECT a.learning_environment_id, a.environment_id, a.safety_level, a.noise_level, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM learning_environments a JOIN workshop_sessions b ON a.workshop_session_id = b.id;
```

| learning_environment_id | environment_id | safety_level | noise_level | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|---|
| 100 | 726050 | low | 10.70 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 101 | 1996940 | medium | 13.40 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 102 | 2986218 | high | 16.10 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 103 | 8350020 | low | 18.80 | 4 | SES-2461 | 2025-12-11T17:15:00 |

This view joins `learning_environments` with `workshop_sessions` on the `workshop_session_id` foreign key, presenting the environment as the driving entity. The first row shows environment `learning_environment_id = 100` (with `environment_id = 726050`) linked to session `SES-2443` (`id = 1`), with `safety_level = low` and `noise_level = 10.70`. The third row pairs environment `learning_environment_id = 102` (`environment_id = 2986218`) with session `SES-2455` (`id = 3`), showing `safety_level = high`, `noise_level = 16.10`, and `is_secure = false`. This view answers: "For each learning environment, which workshop session does it serve, and what are the session's details?"

**View `v_learning_environment_physical_amenity_detail`**

```sql
CREATE VIEW v_learning_environment_physical_amenity_detail AS
SELECT a.learning_environment_id, a.environment_id, a.safety_level, b.physical_amenity_id AS amenity_physical_amenity_id, b.amenity_id AS amenity_amenity_id, b.amenity_type AS amenity_amenity_type
FROM learning_environments a
  JOIN environments_amenities j ON j.learning_environment_id = a.learning_environment_id
  JOIN physical_amenities b ON b.physical_amenity_id = j.physical_amenity_id;
```

| learning_environment_id | environment_id | safety_level | amenity_physical_amenity_id | amenity_amenity_id | amenity_amenity_type |
|---|---|---|---|---|---|
| 100 | 726050 | low | 100 | 3158143 | snack |
| 100 | 726050 | low | 101 | default_chart_a_tax_code_37 | lunch |
| 101 | 1996940 | medium | 101 | default_chart_a_tax_code_37 | lunch |
| 101 | 1996940 | medium | 102 | BJBBB | toilet |
| 102 | 2986218 | high | 102 | BJBBB | toilet |
| 102 | 2986218 | high | 103 | L851 | hearing_aid |
| 103 | 8350020 | low | 103 | L851 | hearing_aid |
| 103 | 8350020 | low | 100 | 3158143 | snack |

This view joins `learning_environments` with `physical_amenities` through the `environments_amenities` junction table, producing a row per environment-amenity pairing. Each row reveals which physical resources are available in a given environment, enabling queries such as "Which environments offer Wi-Fi?" or "What amenities are available in the high-safety environment?"

**View `v_learning_environment_group_agreement`**

```sql
CREATE VIEW v_learning_environment_group_agreement AS
SELECT a.learning_environment_id, a.environment_id, a.safety_level, a.noise_level, b.group_agreement_id AS agreement_group_agreement_id, b.agreement_id AS agreement_agreement_id, b.rule_description AS agreement_rule_description
FROM learning_environments a JOIN group_agreements b ON a.group_agreement_id = b.group_agreement_id;
```

| learning_environment_id | environment_id | safety_level | noise_level | agreement_group_agreement_id | agreement_agreement_id | agreement_rule_description |
|---|---|---|---|---|---|---|
| 100 | 726050 | low | 10.70 | 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A |
| 101 | 1996940 | medium | 13.40 | 2 | 4716391 | Extended Assessment |
| 102 | 2986218 | high | 16.10 | 3 | 3001009030180 | Pilot Survey |
| 103 | 8350020 | low | 18.80 | 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D |

This view joins `learning_environments` with `group_agreements` on the `group_agreement_id` foreign key, producing a row per environment that includes the behavioural norms applicable within it. The first row shows environment `learning_environment_id = 100` linked to `group_agreement_id = 1`. The fourth row pairs environment `learning_environment_id = 103` with `group_agreement_id = 4`. This view answers: "Which group agreements apply to each learning environment?"

**View `v_participant_workshop_session_detail`**

```sql
CREATE VIEW v_participant_workshop_session_detail AS
SELECT a.participant_id, a.full_name, a.email, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM participants a
  JOIN participants_sessions j ON j.participant_id = a.participant_id
  JOIN workshop_sessions b ON b.id = j.workshop_session_id;
```

| participant_id | full_name | email | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | Theodore Mcgrath | seasonal-email-11 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | regional-email-12 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | regional-email-12 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | legacy-email-13 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | legacy-email-13 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | compact-email-14 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | compact-email-14 | 1 | SES-2443 | 2022-09-05T20:24:00 |

This view joins `participants` with `workshop_sessions` through the junction tables, producing a row per participant-session enrolment. The first row might show participant `Theodore Mcgrath` (`participant_id = 1`) enrolled in session `SES-2443` (`id = 1`), with `registration_date = 2023-06-19T17:27:00` and `attendance_status = registered`. The fourth row could pair participant `Norma Fisher` (`participant_id = 4`) with session `SES-2461` (`id = 4`), showing `attendance_status = dropped_out` and `prior_knowledge_level = beginner`. This view answers: "For each participant, which sessions are they enrolled in, and what is their attendance status?"

**View `v_participant_motivation_type`**

```sql
CREATE VIEW v_participant_motivation_type AS
SELECT a.participant_id, a.full_name, a.email, a.registration_date, b.id AS type_id, b.motivation_id AS type_motivation_id, b.motivation_category AS type_motivation_category
FROM participants a JOIN motivation_types b ON a.motivation_type_id = b.id;
```

| participant_id | full_name | email | registration_date | type_id | type_motivation_id | type_motivation_category |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 2023-06-19T17:27:00 | 100 | 1250209 | intrinsic |
| 2 | Account Name | regional-email-12 | 2024-11-03T00:44:00 | 101 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | extrinsic |
| 3 | Saipan International Airport | legacy-email-13 | 2025-04-14T07:01:00 | 102 | 89146 | intrinsic |
| 4 | Norma Fisher | compact-email-14 | 2022-09-25T14:18:00 | 103 | 4793478 | extrinsic |

This view joins `participants` with `motivation_types` on the `motivation_type_id` foreign key, producing a row per participant that includes their motivational profile. The first row shows participant `Theodore Mcgrath` (`participant_id = 1`) with `motivation_category = intrinsic`, `intensity = 7.20`, `trigger_source = distributed-trigger-96`, and `is_sustainable = true`. The second row pairs participant `Account Name` (`participant_id = 2`) with `motivation_category = extrinsic`, `intensity = 9.40`, and `is_sustainable = false`. This view answers: "What is the motivational profile of each participant?"

**View `v_participant_practice_activity_detail`**

```sql
CREATE VIEW v_participant_practice_activity_detail AS
SELECT a.participant_id, a.full_name, a.email, b.practice_activity_id AS activity_practice_activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM participants a
  JOIN participants_activities j ON j.participant_id = a.participant_id
  JOIN practice_activities b ON b.practice_activity_id = j.practice_activity_id;
```

| participant_id | full_name | email | activity_practice_activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 1000 | 8843761 | Composite Programme |
| 1 | Theodore Mcgrath | seasonal-email-11 | 1001 | 4180957 | Compact Standard A |
| 2 | Account Name | regional-email-12 | 1001 | 4180957 | Compact Standard A |
| 2 | Account Name | regional-email-12 | 1002 | 168545 | Legacy Framework |
| 3 | Saipan International Airport | legacy-email-13 | 1002 | 168545 | Legacy Framework |
| 3 | Saipan International Airport | legacy-email-13 | 1003 | default_chart_a_account_53 | Regional Protocol |
| 4 | Norma Fisher | compact-email-14 | 1003 | default_chart_a_account_53 | Regional Protocol |
| 4 | Norma Fisher | compact-email-14 | 1000 | 8843761 | Composite Programme |

This view joins `participants` with `practice_activities` through the `participants_activities` or `activities_participants` junction tables, producing a row per participant-activity engagement. Each row reveals which activities a participant has completed or is working on, enabling analysis of individual participation patterns across exercises.

**View `v_motivation_type_participant`**

```sql
CREATE VIEW v_motivation_type_participant AS
SELECT a.id, a.motivation_id, a.motivation_category, a.intensity, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM motivation_types a JOIN participants b ON a.participant_id = b.participant_id;
```

| id | motivation_id | motivation_category | intensity | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|---|
| 100 | 1250209 | intrinsic | 7.20 | 1 | Theodore Mcgrath | seasonal-email-11 |
| 101 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | extrinsic | 9.40 | 2 | Account Name | regional-email-12 |
| 102 | 89146 | intrinsic | 11.60 | 3 | Saipan International Airport | legacy-email-13 |
| 103 | 4793478 | extrinsic | 13.80 | 4 | Norma Fisher | compact-email-14 |

This view joins `motivation_types` with `participants` on the `participant_id` foreign key, presenting motivation as the driving entity. The first row shows `motivation_type_id = 100` with `motivation_category = intrinsic` and `intensity = 7.20` linked to participant `Theodore Mcgrath` (`participant_id = 1`). The fourth row pairs `motivation_type_id = 103` with `motivation_category = extrinsic`, `intensity = 13.80`, and `is_sustainable = false` linked to participant `Norma Fisher` (`participant_id = 4`). This view answers: "For each motivation type, which participant does it belong to, and what are their details?"

**View `v_practice_activity_workshop_session`**

```sql
CREATE VIEW v_practice_activity_workshop_session AS
SELECT a.practice_activity_id, a.activity_id, a.activity_name, a.duration_minutes, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM practice_activities a JOIN workshop_sessions b ON a.workshop_session_id = b.id;
```

| practice_activity_id | activity_id | activity_name | duration_minutes | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|---|
| 1000 | 8843761 | Composite Programme | 35 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1001 | 4180957 | Compact Standard A | 38 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 1002 | 168545 | Legacy Framework | 41 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 1003 | default_chart_a_account_53 | Regional Protocol | 44 | 4 | SES-2461 | 2025-12-11T17:15:00 |

This view joins `practice_activities` with `workshop_sessions` on the `workshop_session_id` foreign key, producing a row per activity that includes the session's identifying information. The first row shows activity `Composite Programme` (`practice_activity_id = 1000`) linked to session `SES-2443` (`id = 1`), with `duration_minutes = 35`, `complexity_level = low`, and `is_hands_on = true`. The third row pairs activity `Legacy Framework` (`practice_activity_id = 1002`) with session `SES-2455` (`id = 3`), showing `duration_minutes = 41`, `complexity_level = high`, and `completion_rate = 25.10`. This view answers: "Which practice activities belong to each workshop session, and what are their characteristics?"

**View `v_practice_activity_participant_detail`**

```sql
CREATE VIEW v_practice_activity_participant_detail AS
SELECT a.practice_activity_id, a.activity_id, a.activity_name, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM practice_activities a
  JOIN activities_participants j ON j.practice_activity_id = a.practice_activity_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| practice_activity_id | activity_id | activity_name | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 1000 | 8843761 | Composite Programme | 1 | Theodore Mcgrath | seasonal-email-11 |
| 1000 | 8843761 | Composite Programme | 2 | Account Name | regional-email-12 |
| 1001 | 4180957 | Compact Standard A | 2 | Account Name | regional-email-12 |
| 1001 | 4180957 | Compact Standard A | 3 | Saipan International Airport | legacy-email-13 |
| 1002 | 168545 | Legacy Framework | 3 | Saipan International Airport | legacy-email-13 |
| 1002 | 168545 | Legacy Framework | 4 | Norma Fisher | compact-email-14 |
| 1003 | default_chart_a_account_53 | Regional Protocol | 4 | Norma Fisher | compact-email-14 |
| 1003 | default_chart_a_account_53 | Regional Protocol | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `practice_activities` with `participants` through the junction tables, producing a row per activity-participant engagement. Each row reveals which participants have engaged with a particular activity, enabling queries such as "Which participants completed the Composite Programme activity?" or "What is the average completion rate for activities attended by beginner-level participants?"

**View `v_practice_activity_learning_module`**

```sql
CREATE VIEW v_practice_activity_learning_module AS
SELECT a.practice_activity_id, a.activity_id, a.activity_name, a.duration_minutes, b.id AS module_id, b.module_id AS module_module_id, b.title AS module_title
FROM practice_activities a JOIN learning_modules b ON a.learning_module_id = b.id;
```

| practice_activity_id | activity_id | activity_name | duration_minutes | module_id | module_module_id | module_title |
|---|---|---|---|---|---|---|
| 1000 | 8843761 | Composite Programme | 35 | 1 | 13061773 | Compact Initiative |
| 1001 | 4180957 | Compact Standard A | 38 | 2 | template_ivacode_pagata_0 | Legacy Model |
| 1002 | 168545 | Legacy Framework | 41 | 3 | 3744024 | Regional Cluster A |
| 1003 | default_chart_a_account_53 | Regional Protocol | 44 | 4 | 727063 | Seasonal Review |

This view joins `practice_activities` with `learning_modules` on the `learning_module_id` / `practice_activity_id` relationship, producing a row per activity that includes the associated module's details. The first row shows activity `Composite Programme` (`practice_activity_id = 1000`) linked to module `Compact Initiative` (`id = 1`), with `content_format = lecture` and `difficulty_level = basic`. The fourth row pairs activity `Regional Protocol` (`practice_activity_id = 1003`) with module `Seasonal Review` (`id = 4`), showing `content_format = interactive` and `difficulty_level = basic`. This view answers: "For each practice activity, which learning module is it associated with, and what are the module's characteristics?"

**View `v_learning_module_workshop_session`**

```sql
CREATE VIEW v_learning_module_workshop_session AS
SELECT a.id, a.module_id, a.title, a.content_format, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM learning_modules a JOIN workshop_sessions b ON a.workshop_session_id = b.id;
```

| id | module_id | title | content_format | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | lecture | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 2 | template_ivacode_pagata_0 | Legacy Model | video | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 3 | 3744024 | Regional Cluster A | handout | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 4 | 727063 | Seasonal Review | interactive | 4 | SES-2461 | 2025-12-11T17:15:00 |

This view joins `learning_modules` with `workshop_sessions` on the `workshop_session_id` foreign key, producing a row per module that includes the session's identifying information. The first row shows module `Compact Initiative` (`id = 1`) linked to session `SES-2443` (`id = 1`), with `content_format = lecture` and `duration_minutes = 35`. The second row pairs module `Legacy Model` (`id = 2`) with session `SES-2449` (`id = 2`), showing `content_format = video`, `difficulty_level = intermediate`, and `is_relevant = false`. This view answers: "For each learning module, which workshop session does it belong to, and what are the session's details?"

**View `v_learning_module_practice_activity`**

```sql
CREATE VIEW v_learning_module_practice_activity AS
SELECT a.id, a.module_id, a.title, a.content_format, b.practice_activity_id AS activity_practice_activity_id, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name
FROM learning_modules a JOIN practice_activities b ON a.practice_activity_id = b.practice_activity_id;
```

| id | module_id | title | content_format | activity_practice_activity_id | activity_activity_id | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | lecture | 1000 | 8843761 | Composite Programme |
| 2 | template_ivacode_pagata_0 | Legacy Model | video | 1001 | 4180957 | Compact Standard A |
| 3 | 3744024 | Regional Cluster A | handout | 1002 | 168545 | Legacy Framework |
| 4 | 727063 | Seasonal Review | interactive | 1003 | default_chart_a_account_53 | Regional Protocol |

This view joins `learning_modules` with `practice_activities` on the `practice_activity_id` foreign key, producing a row per module that includes the associated activity's details. The first row shows module `Compact Initiative` (`id = 1`) linked to activity `Composite Programme` (`practice_activity_id = 1000`), with `duration_minutes = 35`, `complexity_level = low`, and `is_hands_on = true`. The third row pairs module `Regional Cluster A` (`id = 3`) with activity `Legacy Framework` (`practice_activity_id = 1002`), showing `duration_minutes = 41`, `complexity_level = high`, and `completion_rate = 25.10`. This view answers: "For each learning module, which practice activity is it associated with, and what are the activity's characteristics?"

**View `v_physical_amenity_learning_environment`**

```sql
CREATE VIEW v_physical_amenity_learning_environment AS
SELECT a.physical_amenity_id, a.amenity_id, a.amenity_type, a.quantity_provided, b.learning_environment_id AS environment_learning_environment_id, b.environment_id AS environment_environment_id, b.safety_level AS environment_safety_level
FROM physical_amenities a JOIN learning_environments b ON a.learning_environment_id = b.learning_environment_id;
```

| physical_amenity_id | amenity_id | amenity_type | quantity_provided | environment_learning_environment_id | environment_environment_id | environment_safety_level |
|---|---|---|---|---|---|---|
| 100 | 3158143 | snack | 4 | 100 | 726050 | low |
| 101 | default_chart_a_tax_code_37 | lunch | 15 | 101 | 1996940 | medium |
| 102 | BJBBB | toilet | 2 | 102 | 2986218 | high |
| 103 | L851 | hearing_aid | 1 | 103 | 8350020 | low |

This view joins `physical_amenities` with `learning_environments` through the `environments_amenities` junction table, producing a row per amenity-environment pairing. Each row reveals which environments offer a particular physical resource, enabling queries such as "Which environments have projector access?" or "What amenities are available in environments with high safety levels?"

**View `v_physical_amenity_participant`**

```sql
CREATE VIEW v_physical_amenity_participant AS
SELECT a.physical_amenity_id, a.amenity_id, a.amenity_type, a.quantity_provided, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM physical_amenities a JOIN participants b ON a.participant_id = b.participant_id;
```

| physical_amenity_id | amenity_id | amenity_type | quantity_provided | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|---|
| 100 | 3158143 | snack | 4 | 1 | Theodore Mcgrath | seasonal-email-11 |
| 101 | default_chart_a_tax_code_37 | lunch | 15 | 2 | Account Name | regional-email-12 |
| 102 | BJBBB | toilet | 2 | 3 | Saipan International Airport | legacy-email-13 |
| 103 | L851 | hearing_aid | 1 | 4 | Norma Fisher | compact-email-14 |

This view joins `physical_amenities` with `participants` through a chain of joins via `learning_environments` and `workshop_sessions`, producing a row per amenity-participant pairing. Each row reveals which participants have access to a particular physical resource through their session's environment, enabling analysis of resource accessibility across the participant population.

**View `v_group_agreement_learning_environment`**

```sql
CREATE VIEW v_group_agreement_learning_environment AS
SELECT a.group_agreement_id, a.agreement_id, a.rule_description, a.is_enforced, b.learning_environment_id AS environment_learning_environment_id, b.environment_id AS environment_environment_id, b.safety_level AS environment_safety_level
FROM group_agreements a JOIN learning_environments b ON a.learning_environment_id = b.learning_environment_id;
```

| group_agreement_id | agreement_id | rule_description | is_enforced | environment_learning_environment_id | environment_environment_id | environment_safety_level |
|---|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A | false | 100 | 726050 | low |
| 2 | 4716391 | Extended Assessment | true | 101 | 1996940 | medium |
| 3 | 3001009030180 | Pilot Survey | false | 102 | 2986218 | high |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | true | 103 | 8350020 | low |

This view joins `group_agreements` with `learning_environments` on the `group_agreement_id` foreign key, producing a row per agreement that includes the environment's details. The first row shows `group_agreement_id = 1` linked to environment `learning_environment_id = 100` (with `safety_level = low` and `noise_level = 10.70`). The fourth row pairs `group_agreement_id = 4` with environment `learning_environment_id = 103` (with `safety_level = low`, `noise_level = 18.80`, and `is_secure = true`). This view answers: "For each group agreement, which learning environment does it apply to, and what are the environment's conditions?"

**View `v_group_agreement_participant_detail`**

```sql
CREATE VIEW v_group_agreement_participant_detail AS
SELECT a.group_agreement_id, a.agreement_id, a.rule_description, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.email AS participant_email
FROM group_agreements a
  JOIN agreements_participants j ON j.group_agreement_id = a.group_agreement_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| group_agreement_id | agreement_id | rule_description | participant_participant_id | participant_full_name | participant_email |
|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A | 1 | Theodore Mcgrath | seasonal-email-11 |
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A | 2 | Account Name | regional-email-12 |
| 2 | 4716391 | Extended Assessment | 2 | Account Name | regional-email-12 |
| 2 | 4716391 | Extended Assessment | 3 | Saipan International Airport | legacy-email-13 |
| 3 | 3001009030180 | Pilot Survey | 3 | Saipan International Airport | legacy-email-13 |
| 3 | 3001009030180 | Pilot Survey | 4 | Norma Fisher | compact-email-14 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | 4 | Norma Fisher | compact-email-14 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | 1 | Theodore Mcgrath | seasonal-email-11 |

This view joins `group_agreements` with `participants` through the `agreements_participants` junction table, producing a row per agreement-participant binding. Each row reveals which participants are bound by a particular group agreement, enabling queries such as "Which participants are bound by the noise-level agreement?" or "What is the distribution of knowledge levels among participants bound by each agreement?"

## Synthesis

The workshop learning ecosystem is modelled as a set of eight base tables connected by foreign keys and junction tables, forming a normalised relational graph. The core entities — `workshop_sessions`, `learning_environments`, `participants`, `motivation_types`, `practice_activities`, `learning_modules`, `physical_amenities`, and `group_agreements` — each capture a distinct dimension of the domain. Relationships are expressed through direct foreign keys (such as `learning_environments.workshop_session_id` and `participants.motivation_type_id`) and through explicit junction tables (`sessions_modules`, `sessions_participants`, `environments_amenities`, `participants_sessions`, `participants_activities`, `activities_participants`, and `agreements_participants`) that resolve many-to-many associations. The twenty materialised views reassemble these normalised tables through joins, each view answering a specific analytical question by presenting a particular entity as the driving dimension and attaching the details of its related entities. Together, the base tables and views provide a complete, queryable representation of the workshop learning domain, from individual participant motivation through to the physical conditions of learning environments.