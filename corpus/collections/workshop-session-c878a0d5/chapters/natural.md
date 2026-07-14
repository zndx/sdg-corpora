## Workshop Operations and Learning Delivery

Professional development programs rely on a structured ecosystem of scheduled sessions, physical and psychological learning environments, enrolled participants, curated learning modules, and hands-on practice activities. The data model underlying these operations captures every dimension of the workshop lifecycle—from initial planning through delivery and assessment. Each entity maintains its own record set, while relational tables and analytical views bind them into a coherent operational picture. Understanding how these components interlock is essential for program coordinators, instructional designers, and quality assurance teams who must track attendance, evaluate environmental readiness, and align prior knowledge with module difficulty.

**Table `workshop_sessions`**

| workshop_session_id | session_identifier | start_date | end_date | location | max_capacity | current_attendance | status | environment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | 32 | 23 | planned | 726050 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | 42 | 31 | active | 1996940 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | 52 | 39 | completed | 2986218 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | 62 | 47 | cancelled | 8350020 |

Workshop sessions form the temporal backbone of the program. Each session carries a unique identifier such as SES-2443 or SES-2461, a defined date range, a location designation, and capacity metrics. The session identified as SES-2443, for instance, was scheduled from September 5, 2022, through September 1, 2022, at extended-location-99, with a maximum capacity of 32 and a current attendance of 23. Its status is recorded as planned. SES-2449, running from February 16 to February 12, 2023, at integrated-location-100, shows 31 of 42 seats filled and carries an active status. SES-2455, held at seasonal-location-101 in July 2024, reached 39 of 52 capacity and is marked completed. SES-2461, located at regional-location-102 in December 2025, has 47 of 62 attendees and is cancelled. Every session is anchored to a learning environment through the environment_id foreign key, ensuring that the physical and psychological conditions of delivery are always traceable to the session itself.

**Table `learning_environments`**

| environment_id | physical_safety_level | emotional_safety_level | has_group_agreement | stress_reduction_measures | accessibility_compliance | workshop_session_id |
|---|---|---|---|---|---|---|
| 726050 | low | low | true | integrated-stress-10 | false | 1 |
| 1996940 | medium | medium | false | seasonal-stress-11 | true | 2 |
| 2986218 | high | high | true | regional-stress-12 | false | 3 |
| 8350020 | low | low | false | legacy-stress-13 | true | 4 |

Learning environments define the conditions under which each workshop session takes place. The environment linked to SES-2443 (environment_id 726050) reports low physical and emotional safety levels, has a group agreement in place, employs an integrated-stress-10 reduction measure, and lacks accessibility compliance. The environment tied to SES-2449 (1996940) sits at medium safety on both dimensions, has no group agreement, uses seasonal-stress-11, and meets accessibility standards. Environment 2986218, associated with the completed SES-2455, achieves high ratings on both safety measures, includes a group agreement, applies regional-stress-12, and does not meet accessibility compliance. Environment 8350020, connected to the cancelled SES-2461, mirrors the first environment with low safety ratings, no group agreement, legacy-stress-13 measures, and full accessibility compliance. These environmental attributes directly influence participant engagement and must be monitored alongside session logistics.

**Table `participants`**

| participant_id | full_name | email | registration_date | attendance_status | prior_knowledge_level |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | seasonal-email-11 | 2023-06-19T17:27:00 | registered | beginner |
| 2 | Account Name | regional-email-12 | 2024-11-03T00:44:00 | attended | intermediate |
| 3 | Saipan International Airport | legacy-email-13 | 2025-04-14T07:01:00 | absent | advanced |
| 4 | Norma Fisher | compact-email-14 | 2022-09-25T14:18:00 | dropped_out | beginner |

Participants are the individuals who enroll in and attend workshop sessions. Each participant record contains a full name, an email address, a registration date, an attendance status, and a self-reported prior knowledge level. Theodore Mcgrath (participant_id 1) registered on June 19, 2023, at seasonal-email-11, holds a beginner prior knowledge level, and is currently registered. Account Name (participant_id 2) registered on November 3, 2024, at regional-email-12, is classified as intermediate, and has attended. Saipan International Airport (participant_id 3) registered on April 14, 2025, at legacy-email-13, holds an advanced level, and is marked absent. Norma Fisher (participant_id 4) registered on September 25, 2022, at compact-email-14, is a beginner, and has dropped out. The attendance_status field—whether registered, attended, absent, or dropped_out—provides a real-time snapshot of each participant's engagement with the program.

**Table `learning_modules`**

| id | module_id | title | duration_minutes | delivery_method | difficulty_level | learning_objective |
|---|---|---|---|---|---|---|
| 1 | 13061773 | Compact Initiative | 35 | lecture | introductory | composite-learning-33 |
| 2 | template_ivacode_pagata_0 | Legacy Model | 38 | discussion | intermediate | primary-learning-34 |
| 3 | 3744024 | Regional Cluster A | 41 | demonstration | advanced | adaptive-learning-35 |
| 4 | 727063 | Seasonal Review | 44 | simulation | introductory | distributed-learning-36 |

Learning modules are the instructional units delivered within workshop sessions. Each module has a unique module_id, a title, a duration in minutes, a delivery method, a difficulty level, and a learning objective. Module 13061773, titled Compact Initiative, runs for 35 minutes via lecture, targets introductory difficulty, and aims at composite-learning-33. Module template_ivacode_pagata_0, Legacy Model, spans 38 minutes through discussion, targets intermediate difficulty, and focuses on primary-learning-34. Module 3744024, Regional Cluster A, lasts 41 minutes, uses demonstration, targets advanced difficulty, and addresses adaptive-learning-35. Module 727063, Seasonal Review, runs 44 minutes via simulation, targets introductory difficulty, and covers distributed-learning-36. The delivery_method and difficulty_level fields together determine which participants are best suited for each module.

**Table `practice_activities`**

| practice_activity_id | activity_id | activity_type | duration_minutes | required_materials | success_criteria | is_completed |
|---|---|---|---|---|---|---|
| 100 | 8843761 | think_pair_share | 35 | extended-required-45 | extended-success-33 | false |
| 101 | 4180957 | group_discussion | 38 | integrated-required-46 | integrated-success-34 | true |
| 102 | 168545 | role_play | 41 | seasonal-required-47 | seasonal-success-35 | false |
| 103 | default_chart_a_account_53 | case_study | 44 | regional-required-48 | regional-success-36 | true |

Practice activities are the hands-on exercises embedded within the learning experience. Each activity carries an activity_id, an activity_type, a duration, a list of required materials, a success criteria identifier, and a completion flag. Activity 8843761 is a think_pair_share exercise lasting 35 minutes, requiring extended-required-45 materials, measured against extended-success-33, and is not yet completed. Activity 4180957, a group_discussion, runs 38 minutes, needs integrated-required-46, targets integrated-success-34, and is marked completed. Activity 168545, a role_play, spans 41 minutes, requires seasonal-required-47, evaluates against seasonal-success-35, and remains incomplete. Activity default_chart_a_account_53, a case_study, lasts 44 minutes, uses regional-required-48, measures success via regional-success-36, and is completed. The is_completed flag enables coordinators to track hands-on engagement in real time.

**Table `participant_prior_knowledges`**

| participant_prior_knowledge_id | knowledge_id | topic_area | proficiency_level | source_experience | last_updated | participant_id |
|---|---|---|---|---|---|---|
| 1 | 693fde70-8fcc-11eb-924d-9cd76263cbd0 | legacy-topic-55 | none | composite-source-93 | 2023-06-17T17:27:00 | 1 |
| 2 | 21956270 | compact-topic-56 | basic | primary-source-94 | 2024-11-01T00:44:00 | 2 |
| 3 | ChIJyQkrS_pt5kcRgcBUZri0Wao | composite-topic-57 | moderate | adaptive-source-95 | 2025-04-12T07:01:00 | 3 |
| 4 | 9424910 | primary-topic-58 | expert | distributed-source-96 | 2022-09-23T14:18:00 | 4 |

Participant prior knowledge records capture each individual's background before entering a workshop. The record for participant 1 (Theodore Mcgrath) carries knowledge_id 693fde70-8fcc-11eb-924d-9cd76263cbd0, covers legacy-topic-55, reports a none proficiency level, cites composite-source-93 as the source experience, and was last updated on June 17, 2023. Participant 2 (Account Name) holds knowledge_id 21956270, addresses compact-topic-56, has a basic proficiency, references primary-source-94, and was updated November 1, 2024. Participant 3 (Saipan International Airport) carries knowledge_id ChIJyQkrS_pt5kcRgcBUZri0Wao, covers composite-topic-57, reports moderate proficiency, cites adaptive-source-95, and was last updated April 12, 2025. Participant 4 (Norma Fisher) holds knowledge_id 9424910, addresses primary-topic-58, has expert proficiency, references distributed-source-96, and was updated September 23, 2022. These records allow program designers to match participant readiness with module difficulty.

### Relational Assignments and Cross-References

The workshop ecosystem is held together by a network of relational tables that assign participants to sessions, link modules to sessions, connect environments to participants, and map activities to sessions, participants, and modules. These tables do not introduce new entities; they record the operational decisions made by coordinators.

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

The sessions_participants table records which participants are enrolled in which workshop sessions. Each row establishes a direct enrollment link between a session and a participant, enabling attendance tracking and capacity management.

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

The sessions_modules table maps learning modules to the workshop sessions in which they are delivered. A single session may carry multiple modules, and a module may appear across multiple sessions, creating a many-to-many relationship that supports modular curriculum design.

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

The environments_participants table links participants to learning environments, independent of any specific session. This allows the system to track which participants have experienced which environmental conditions, supporting longitudinal analysis of how safety levels, group agreements, and stress reduction measures correlate with outcomes.

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

The participants_sessions table provides a participant-centric view of session enrollments. While sessions_participants records from the session side, participants_sessions records from the participant side, enabling queries such as "which sessions has participant 2 attended?"

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

The participants_environments table mirrors environments_participants from the participant perspective, allowing coordinators to see which environments each participant has been exposed to across their entire program history.

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

The participants_activities table records which participants have engaged with which practice activities. This table is essential for tracking hands-on completion rates and for identifying participants who may need additional support with specific activity types.

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

The modules_sessions table provides a module-centric view of session assignments. While sessions_modules records from the session side, modules_sessions records from the module side, enabling queries such as "in which sessions is module 3744024 delivered?"

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

The modules_knowledges table links learning modules to prior knowledge topics. This relationship allows the system to identify which knowledge areas a module builds upon, supporting curriculum sequencing and prerequisite management.

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

The modules_activities table maps practice activities to learning modules. A module may include multiple activities, and an activity may be used across multiple modules, enabling flexible instructional design.

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

The activities_sessions table links practice activities to workshop sessions. This relationship ensures that every hands-on exercise is anchored to a specific session, allowing coordinators to plan activity logistics and material preparation at the session level.

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

The activities_participants table provides a participant-centric view of activity engagement. While participants_activities records from the participant side, activities_participants records from the activity side, enabling queries such as "which participants completed activity 4180957?"

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

The activities_modules table provides a module-centric view of activity assignments. While modules_activities records from the module side, activities_modules records from the activity side, enabling queries such as "which activities are associated with module template_ivacode_pagata_0?"

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

The knowledges_modules table provides a knowledge-topic-centric view of module linkages. While modules_knowledges records from the module side, knowledges_modules records from the knowledge side, enabling queries such as "which modules address legacy-topic-55?"

### Analytical Views for Operational Reporting

The analytical views synthesize the relational data into readable, decision-ready formats. Each view answers a specific operational question by joining multiple base tables and presenting the results in a single, coherent record set.

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

This view answers the question: what are the environmental conditions for each workshop session? It joins workshop_sessions with learning_environments on environment_id. A row for SES-2443 reveals that the session at extended-location-99 operates in an environment with low physical and emotional safety, an integrated-stress-10 measure, and no accessibility compliance. A row for SES-2455 shows that the completed session at seasonal-location-101 benefits from high safety ratings, a group agreement, and regional-stress-12 measures.

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

This view answers: who is enrolled in each workshop session, and what is their status? It joins workshop_sessions with participants through the enrollment relationship. A row for SES-2449 shows that Account Name (participant_id 2), an intermediate-level attendee, is enrolled in the active session at integrated-location-100. A row for SES-2443 shows that Theodore Mcgrath (participant_id 1), a beginner, is registered for the planned session.

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

This view answers: which learning modules are delivered in each workshop session? It joins workshop_sessions with learning_modules through the session-module relationship. A row for SES-2449 reveals that the active session at integrated-location-100 includes the Legacy Model module (template_ivacode_pagata_0), a 38-minute discussion targeting intermediate difficulty and primary-learning-34.

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

This view answers: which workshop sessions are conducted within each learning environment? It joins learning_environments with workshop_sessions. A row for environment 726050 shows that the low-safety, integrated-stress-10 environment hosts session SES-2443 at extended-location-99. A row for environment 2986218 shows that the high-safety, regional-stress-12 environment hosted the completed session SES-2455.

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

This view answers: which participants have experienced each learning environment? It joins learning_environments with participants through the environment-participant relationship. A row for environment 1996940 shows that Account Name (participant_id 2) has been exposed to the medium-safety, seasonal-stress-11 environment that meets accessibility standards.

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

This view answers: which workshop sessions is each participant enrolled in? It joins participants with workshop_sessions. A row for Theodore Mcgrath (participant_id 1) shows enrollment in session SES-2443, a planned session at extended-location-99 with 23 of 32 seats filled. A row for Norma Fisher (participant_id 4) shows enrollment in a session at regional-location-102, though her attendance status is dropped_out.

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

This view answers: which learning environments has each participant experienced? It joins participants with learning_environments. A row for Saipan International Airport (participant_id 3) shows exposure to environment 2986218, which has high safety ratings, a group agreement, and regional-stress-12 measures.

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

This view answers: which practice activities has each participant engaged with? It joins participants with practice_activities. A row for Account Name (participant_id 2) shows engagement with activity 4180957, a completed group_discussion lasting 38 minutes that required integrated-required-46 materials and met integrated-success-34 criteria.

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

This view answers: in which workshop sessions is each learning module delivered? It joins learning_modules with workshop_sessions. A row for Compact Initiative (module 13061773) shows delivery in session SES-2443, a planned session at extended-location-99 with 23 attendees.

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

This view answers: which participants' prior knowledge records are associated with each learning module? It joins learning_modules with participant_prior_knowledges through the knowledge-module relationship. A row for Legacy Model (template_ivacode_pagata_0) shows association with participant 2 (Account Name), whose prior knowledge covers compact-topic-56 at a basic proficiency level, sourced from primary-source-94.

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

This view answers: which practice activities are linked to each learning module? It joins learning_modules with practice_activities. A row for Regional Cluster A (module 3744024) shows linkage to activity 168545, a role_play exercise lasting 41 minutes that requires seasonal-required-47 materials and evaluates against seasonal-success-35.

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

This view answers: in which workshop sessions is each practice activity conducted? It joins practice_activities with workshop_sessions. A row for activity 8843761 (think_pair_share) shows delivery in session SES-2443, a planned session at extended-location-99 with 23 of 32 attendees.

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

This view answers: which participants have engaged with each practice activity? It joins practice_activities with participants. A row for activity 103 (case_study, default_chart_a_account_53) shows engagement by participant 4 (Norma Fisher), a beginner who has dropped out, suggesting the activity may have been assigned before the participant withdrew.

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

This view answers: which learning modules are associated with each practice activity? It joins practice_activities with learning_modules. A row for activity 100 (think_pair_share, 8843761) shows association with module 13061773 (Compact Initiative), a 35-minute introductory lecture targeting composite-learning-33.

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

This view answers: what prior knowledge does each participant bring to the program? It joins participant_prior_knowledges with participants. A row for Theodore Mcgrath (participant_id 1) shows a prior knowledge record covering legacy-topic-55 at a none proficiency level, sourced from composite-source-93, last updated June 17, 2023. A row for Norma Fisher (participant_id 4) shows expert proficiency in primary-topic-58, sourced from distributed-source-96.

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

This view answers: which learning modules correspond to each participant's prior knowledge? It joins participant_prior_knowledges with learning_modules through the knowledge-module relationship. A row for participant 3 (Saipan International Airport) shows a composite-topic-57 knowledge record at moderate proficiency linked to module 3744024 (Regional Cluster A), an advanced-difficulty demonstration module targeting adaptive-learning-35. This alignment suggests the participant's background is well-matched to the module's complexity.

### Synthesis

The workshop operations data model captures a complete picture of professional development delivery: sessions are scheduled within environments, participants enroll and engage, modules are designed and delivered, and practice activities reinforce learning. The relational tables bind these entities into a coherent structure, while the analytical views translate that structure into actionable information. Program coordinators can use these records to monitor capacity, assess environmental readiness, track attendance, and align participant knowledge with module difficulty. The system supports both operational oversight and instructional design, ensuring that every workshop session is delivered under appropriate conditions with the right participants, modules, and activities.