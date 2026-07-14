Workshop-based learning programs operate at the intersection of logistical coordination, environmental management, and human engagement. Each session is anchored to a physical learning environment whose conditions—noise, lighting, temperature, and security—directly shape participant experience. Participants arrive with varying levels of prior knowledge and motivation, and they progress through structured learning modules paired with hands-on or theoretical practice activities. Group agreements establish behavioral norms, while physical amenities support the comfort and functionality of the space. The data infrastructure captures every dimension of this ecosystem: session scheduling, environmental telemetry, participant records, motivation profiles, activity design, module content, and the many-to-many relationships that bind them together. Understanding how these records interlock is essential for practitioners who plan, deliver, and evaluate workshop programs.

## Workshop Sessions and Their Temporal Structure

A workshop session is the primary unit of delivery. Each session carries a unique identifier, a date range, a location label, a topic designation, and a status that reflects its lifecycle stage. Sessions are planned, in progress, completed, or cancelled, and each is assigned to a specific learning environment.

**Table `workshop_sessions`**

| id | session_identifier | start_date | end_date | location | topic | status | learning_environment_id |
|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | distributed-topic-60 | planned | 100 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | baseline-topic-61 | in_progress | 101 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | pilot-topic-62 | completed | 102 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | extended-topic-63 | cancelled | 103 |

Consider session SES-2443, which spans from September 5 to September 1 in 2022 and is hosted at extended-location-99 under the topic distributed-topic-60. Its status is planned, indicating it has not yet commenced. Session SES-2449, by contrast, is in progress at integrated-location-100, covering baseline-topic-61. The completed session SES-2455 took place at seasonal-location-101 with pilot-topic-62, while SES-2461 at regional-location-102 carries the status cancelled. The learning_environment_id column ties each session to its physical setting, ensuring that environmental conditions are traceable to every delivery event.

## Learning Environments and Their Measured Conditions

The learning environment table records the physical and operational characteristics of the spaces where workshops occur. Each environment has an internal environment_id, a safety level, a noise level measured in decibels, a lighting condition label, a temperature reading, and a boolean flag indicating whether the space is secure.

**Table `learning_environments`**

| learning_environment_id | environment_id | safety_level | noise_level | lighting_condition | temperature | is_secure | workshop_session_id | group_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 726050 | low | 10.70 | baseline-lighting-25 | 1.33 | false | 1 | 1 |
| 101 | 1996940 | medium | 13.40 | pilot-lighting-26 | 1.1714807757148185 | true | 2 | 2 |
| 102 | 2986218 | high | 16.10 | extended-lighting-27 | 0.51 | false | 3 | 3 |
| 103 | 8350020 | low | 18.80 | integrated-lighting-28 | 0.85 | true | 4 | 4 |

Environment 100, associated with session SES-2443, reports a low safety level, a noise level of 10.70, baseline-lighting-25, a temperature of 1.33, and is not secure. Environment 101, linked to session SES-2449, shows a medium safety level, noise at 13.40, pilot-lighting-26, temperature 1.17, and is marked as secure. Environment 102 (session SES-2455) has a high safety level, noise of 16.10, extended-lighting-27, temperature 0.51, and is not secure. Environment 103 (session SES-2461) returns to a low safety level, noise of 18.80, integrated-lighting-28, temperature 0.85, and is secure. These measurements provide a quantitative basis for comparing spaces and for correlating environmental factors with participant outcomes.

## Participants and Their Engagement Profiles

Participants are the human core of every workshop. The participants table stores each individual's full name, email address, registration date, attendance status, prior knowledge level, and a reference to their motivation type.

**Table `participants`**

| participant_id | full_name | email | registration_date | attendance_status | prior_knowledge_level | motivation_type_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 2023-06-19T17:27:00 | registered | beginner | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Account Name | regional-email-12 | 2024-11-03T00:44:00 | attended | intermediate | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Saipan International Airport | legacy-email-13 | 2025-04-14T07:01:00 | absent | advanced | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Norma Fisher | compact-email-14 | 2022-09-25T14:18:00 | dropped_out | beginner | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Theodore Mcgrath (participant 1) registered on June 19, 2023, holds a beginner knowledge level, and is currently registered. Account Name (participant 2) registered on November 3, 2024, has intermediate prior knowledge and attended. Saipan International Airport (participant 3) registered on April 14, 2025, is classified as advanced and is absent. Norma Fisher (participant 4) registered on September 25, 2022, is a beginner who dropped out. The attendance_status field—registered, attended, absent, or dropped_out—provides a quick snapshot of engagement, while the motivation_type_id links each person to a detailed motivational profile.

## Motivation Types and Their Drivers

Motivation drives participation and persistence. The motivation_types table categorizes each participant's motivational orientation, assigns an intensity score, identifies a trigger source, and indicates whether the motivation is sustainable over time.

**Table `motivation_types`**

| id | motivation_id | motivation_category | intensity | trigger_source | is_sustainable | participant_id |
|---|---|---|---|---|---|---|
| 100 | 1250209 | intrinsic | 7.20 | distributed-trigger-96 | true | 1 |
| 101 | a001f18c-9bac-11eb-a8a2-19ed5c03f8d3 | extrinsic | 9.40 | baseline-trigger-97 | false | 2 |
| 102 | 89146 | intrinsic | 11.60 | pilot-trigger-98 | true | 3 |
| 103 | 4793478 | extrinsic | 13.80 | extended-trigger-99 | false | 4 |

Motivation record 100 (linked to Theodore Mcgrath) is intrinsic, with an intensity of 7.20, triggered by distributed-trigger-96, and marked as sustainable. Record 101 (Account Name) is extrinsic, intensity 9.40, triggered by baseline-trigger-97, and not sustainable. Record 102 (Saipan International Airport) is intrinsic, intensity 11.60, triggered by pilot-trigger-98, and sustainable. Record 103 (Norma Fisher) is extrinsic, intensity 13.80, triggered by extended-trigger-99, and not sustainable. The intensity scale and sustainability flag allow practitioners to identify which participants may need additional support to maintain engagement.

## Practice Activities and Learning Modules

Practice activities are the experiential components of a workshop. Each activity has a unique identifier, an activity name, a duration in minutes, a complexity level, a flag indicating whether it is hands-on, and a completion rate.

**Table `practice_activities`**

| practice_activity_id | activity_id | activity_name | duration_minutes | complexity_level | is_hands_on | completion_rate | workshop_session_id | learning_module_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 8843761 | Composite Programme | 35 | low | true | 19.70 | 1 | 1 |
| 1001 | 4180957 | Compact Standard A | 38 | medium | false | 22.40 | 2 | 2 |
| 1002 | 168545 | Legacy Framework | 41 | high | true | 25.10 | 3 | 3 |
| 1003 | default_chart_a_account_53 | Regional Protocol | 44 | low | false | 27.80 | 4 | 4 |

Activity 1000, named Composite Programme, runs for 35 minutes at low complexity, is hands-on, and has a completion rate of 19.70. Activity 1001, Compact Standard A, lasts 38 minutes at medium complexity, is not hands-on, and has a completion rate of 22.40. Activity 1002, Legacy Framework, takes 41 minutes at high complexity, is hands-on, and has a completion rate of 25.10. Activity 1003, Regional Protocol, runs for 44 minutes at low complexity, is not hands-on, and has a completion rate of 27.80. Each activity is tied to a workshop session and a learning module, forming a structured learning pathway.

Learning modules provide the content backbone. Each module has a module identifier, a title, a content format, a duration, a difficulty level, a relevance flag, and links to both a workshop session and a practice activity.

**Table `learning_modules`**

| id | module_id | title | content_format | duration_minutes | difficulty_level | is_relevant | workshop_session_id | practice_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | lecture | 35 | basic | true | 1 | 1000 |
| 2 | template_ivacode_pagata_0 | Legacy Model | video | 38 | intermediate | false | 2 | 1001 |
| 3 | 3744024 | Regional Cluster A | handout | 41 | advanced | true | 3 | 1002 |
| 4 | 727063 | Seasonal Review | interactive | 44 | basic | false | 4 | 1003 |

Module 1, Compact Initiative, uses a lecture format, lasts 35 minutes at basic difficulty, is relevant, and is paired with session 1 and activity 1000. Module 2, Legacy Model, uses video format, lasts 38 minutes at intermediate difficulty, is not relevant, and is paired with session 2 and activity 1001. Module 3, Regional Cluster A, uses handout format, lasts 41 minutes at advanced difficulty, is relevant, and is paired with session 3 and activity 1002. Module 4, Seasonal Review, uses interactive format, lasts 44 minutes at basic difficulty, is not relevant, and is paired with session 4 and activity 1003. The content_format field—lecture, video, handout, or interactive—determines how material is delivered, while the is_relevant flag signals whether the module aligns with current program objectives.

## Physical Amenities and Group Agreements

Physical amenities represent the tangible resources available within a learning environment. These may include equipment, furniture, accessibility features, or technological tools that support the workshop experience.

**Table `physical_amenities`**

| physical_amenity_id | amenity_id | amenity_type | quantity_provided | is_clean | is_accessible | learning_environment_id | participant_id |
|---|---|---|---|---|---|---|---|
| 100 | 3158143 | snack | 4 | true | true | 100 | 1 |
| 101 | default_chart_a_tax_code_37 | lunch | 15 | false | false | 101 | 2 |
| 102 | BJBBB | toilet | 2 | true | true | 102 | 3 |
| 103 | L851 | hearing_aid | 1 | false | false | 103 | 4 |

Group agreements establish the behavioral and social norms that govern participant interactions during a workshop. They define expectations around communication, participation, and mutual respect.

**Table `group_agreements`**

| group_agreement_id | agreement_id | rule_description | is_enforced | violation_count | learning_environment_id |
|---|---|---|---|---|---|
| 1 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Integrated Series A | false | 96 | 100 |
| 2 | 4716391 | Extended Assessment | true | 11 | 101 |
| 3 | 3001009030180 | Pilot Survey | false | 61 | 102 |
| 4 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | true | 52 | 103 |

## Relational Junction Tables

The relationships between sessions, environments, participants, activities, modules, amenities, and agreements are captured through dedicated junction tables. These tables resolve the many-to-many connections that naturally arise in a multi-session, multi-participant program.

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

The sessions_modules table links workshop sessions to the learning modules they contain, enabling a session to encompass multiple modules and a module to appear across sessions.

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

The sessions_participants table records which participants are enrolled in which sessions, supporting tracking of attendance and engagement at the session level.

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

The environments_amenities table associates physical amenities with learning environments, allowing each space to offer a unique set of resources.

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

The participants_sessions table provides an alternative linkage between participants and sessions, capturing attendance records and session-level participation data.

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

The participants_activities table connects participants to the practice activities they have engaged with, enabling tracking of activity completion and hands-on experience.

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

The activities_participants table offers a reverse linkage from activities to participants, supporting analysis of which participants have completed which activities.

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

The agreements_participants table links participants to the group agreements they have acknowledged, ensuring that behavioral expectations are formally recognized.

## Analytical Views and Their Interpretive Value

The view layer synthesizes base tables into readable, decision-ready records. Each view answers a specific analytical question by joining related entities.

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

This view joins workshop sessions with their learning environments, answering which physical conditions apply to each session. For example, the row for SES-2443 reveals that it takes place in environment 100, which has low safety, noise at 10.70, baseline-lighting-25, temperature 1.33, and is not secure. The row for SES-2449 shows environment 101 with medium safety, noise at 13.40, pilot-lighting-26, temperature 1.17, and is secure.

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

This view connects sessions to their learning modules, revealing the content structure within each session. The row for SES-2443 shows module Compact Initiative delivered in lecture format at basic difficulty. The row for SES-2455 shows module Regional Cluster A delivered in handout format at advanced difficulty.

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

This view links sessions to their participants, providing a roster with engagement context. The row for SES-2443 includes Theodore Mcgrath, a beginner with registered attendance status. The row for SES-2455 includes Saipan International Airport, an advanced participant with absent status.

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

This view reverses the perspective, showing which sessions occur within each learning environment. Environment 100 hosts session SES-2443 on distributed-topic-60. Environment 102 hosts session SES-2455 on pilot-topic-62.

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

This view reveals which physical amenities are available in each learning environment, enabling resource planning and space comparison.

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

This view shows which group agreements are associated with each learning environment, ensuring that behavioral norms are tied to specific physical spaces.

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

This view provides a participant-centric view of their session enrollments. Theodore Mcgrath appears enrolled in SES-2443 with registered attendance. Norma Fisher appears in SES-2461 with dropped_out status.

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

This view surfaces each participant's motivational profile alongside their registration data. Theodore Mcgrath is linked to intrinsic motivation with intensity 7.20 and sustainable flag true. Norma Fisher is linked to extrinsic motivation with intensity 13.80 and sustainable flag false.

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

This view connects participants to the practice activities they have engaged with, showing activity names, durations, and completion rates alongside participant information.

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

This view reverses the motivational perspective, showing all participants associated with each motivation type. The intrinsic category includes Theodore Mcgrath and Saipan International Airport, while the extrinsic category includes Account Name and Norma Fisher.

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

This view links practice activities to their parent workshop sessions, revealing the activity schedule within each session. Composite Programme (activity 1000) is delivered within session SES-2443. Regional Protocol (activity 1003) is delivered within session SES-2461.

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

This view shows which participants have completed which practice activities, providing granular engagement data at the activity level.

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

This view connects practice activities to their corresponding learning modules, revealing the content-activity pairing. Composite Programme is paired with Compact Initiative. Legacy Framework is paired with Regional Cluster A.

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

This view shows which learning modules are delivered within each workshop session, providing a content schedule. Compact Initiative is delivered within SES-2443. Seasonal Review is delivered within SES-2461.

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

This view links learning modules to their paired practice activities, showing the content-to-experience mapping. Compact Initiative is paired with Composite Programme. Legacy Model is paired with Compact Standard A.

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

This view shows which physical amenities are available in each learning environment, supporting space evaluation and resource allocation decisions.

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

This view connects physical amenities to participants through their learning environments, enabling analysis of resource access patterns.

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

This view shows which group agreements are established within each learning environment, ensuring behavioral norms are space-specific.

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

This view links participants to the group agreements they have acknowledged, providing a compliance and expectation-tracking record.

## Closing Synthesis

The workshop ecosystem is a tightly coupled system of sessions, environments, participants, activities, and modules. Each record in the base tables captures a discrete fact—when a session runs, what conditions prevail in its space, who participates, what motivates them, what activities they engage with, and what content they encounter. The junction tables resolve the complex relationships between these entities, and the views synthesize them into interpretable records that answer practical questions about scheduling, resource allocation, engagement tracking, and content delivery. Practitioners who understand how these tables and views interlock can diagnose problems, optimize conditions, and design more effective learning experiences. The data does not merely store information; it tells the story of how workshops are planned, delivered, and experienced.