## Community Security Through Structured Dialogue

Burglary prevention is not merely a matter of installing locks or deploying cameras; it is a social process that depends on coordinated knowledge exchange among practitioners, policy makers, experts, and field workers. The operational framework described here captures every stage of that process—from the initial planning of a World Café event through the facilitation of discussion sessions, the capture of prevention insights, and the eventual reporting of outcomes back to the overseeing security project. Each record in the system represents a concrete artifact of that workflow: an event scheduled at a specific location, a session running under a particular theme, a moderator guiding the conversation, a participant contributing an insight, and a topic anchoring the discussion to a category of prevention practice.

The architecture of the system is built on a set of core tables that store the raw records, and a complementary set of views that join those records into the analytical lenses practitioners actually use. Understanding both layers—the individual records and the joined perspectives they form—is essential for anyone who plans, moderates, or evaluates a burglary prevention initiative.

**Table `world_caf_events`**

| id | event_identifier | event_date | location | status | duration_minutes | participant_count | moderator_count | break_count | security_project_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | extended-location-99 | planned | 35 | 100 | 12 | 92 | 1 | 2025-01-01 00:14:00 |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | integrated-location-100 | ongoing | 38 | 27 | 20 | 25 | 2 | 2025-02-06 03:14:00 |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | seasonal-location-101 | completed | 41 | 23 | 33 | 49 | 3 | 2025-03-11 06:14:00 |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | regional-location-102 | cancelled | 44 | 34 | 4 | 8 | 4 | 2025-04-16 09:14:00 |

World Café events are the top-level containers for all collaborative activity. Each event carries a unique identifier such as EVE-2706, a date, a location label like extended-location-99, and a status that tracks its lifecycle from planned through ongoing to completed or cancelled. The event record also captures operational metadata: the planned duration in minutes, the number of participants and moderators expected, the number of breaks scheduled, and the security project to which the event belongs. An event with identifier EVE-2706, for instance, was planned for 35 minutes at extended-location-99 with 100 participants and 12 moderators, and it is linked to security project 1. The status field is critical for operational dashboards—EVE-2709, for example, carries the status cancelled, which signals that all downstream sessions and insights associated with that event should be treated as inactive.

**Table `discussion_sessions`**

| id | session_identifier | start_time | end_time | duration_minutes | theme | table_number | status | notes_summary | world_caf_event_id | field_moderator_id | discussion_session_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 35 | baseline-theme-79 | 21 | scheduled | baseline-notes-61 | 1000 | 1 | 100 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 38 | pilot-theme-80 | 31 | active | pilot-notes-62 | 1001 | 2 | 101 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 41 | extended-theme-81 | 41 | completed | extended-notes-63 | 1002 | 3 | 102 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 44 | integrated-theme-82 | 51 | abruptly_stopped | integrated-notes-64 | 1003 | 4 | 103 |

Within each World Café event, discussion sessions are the primary units of structured dialogue. A session such as SES-2443 is anchored to a specific event through the world_caf_event_id column and to a field moderator through the field_moderator_id column. Sessions carry their own identifiers, start and end timestamps, a duration, a theme drawn from a controlled vocabulary (baseline-theme-79, pilot-theme-80, extended-theme-81, integrated-theme-82), a table number that indicates the physical or virtual seating arrangement, and a status that reflects whether the session is scheduled, active, completed, or abruptly stopped. The notes_summary field provides a human-readable snapshot of what transpired. Session SES-2461, for example, ran under the integrated-theme-82 theme at table 51 and ended with the status abruptly_stopped, a signal that the moderator or facilitator may need to follow up on incomplete discussion outcomes.

**Table `field_moderators`**

| id | moderator_identifier | full_name | expertise_area | role | session_count | availability_status | security_project_id |
|---|---|---|---|---|---|---|---|
| 1 | MOD-2781 | Theodore Mcgrath | baseline-expertis-31 | lead_moderator | 44 | available | 1 |
| 2 | MOD-2788 | Account Name | pilot-expertis-32 | note_taker | 0 | busy | 2 |
| 3 | MOD-2795 | Saipan International Airport | extended-expertis-33 | file_manager | 72 | unavailable | 3 |
| 4 | MOD-2802 | Norma Fisher | integrated-expertis-34 | lead_moderator | 69 | available | 4 |

Field moderators are the individuals who guide each discussion session. The field_moderators table stores their identifiers (MOD-2781, MOD-2788, etc.), full names, expertise areas, assigned roles such as lead_moderator or note_taker, the total number of sessions they have facilitated, their current availability status, and the security project they are associated with. Theodore Mcgrath (MOD-2781) holds the role of lead_moderator, has facilitated 44 sessions, and is currently available. In contrast, Account Name (MOD-2788) serves as a note_taker with zero sessions facilitated and a busy availability status. The availability_status field—available, busy, or unavailable—enables real-time assignment of moderators to sessions that need facilitation.

**Table `field_participants`**

| id | participant_identifier | full_name | organization | role | motivation_level | previous_experience | security_project_id |
|---|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Theodore Mcgrath | Whirlpool Corporation | practitioner | low | true | 1 |
| 2 | PAR-2725 | Account Name | Poshmark Inc. | expert | medium | false | 2 |
| 3 | PAR-2728 | Saipan International Airport | Whirlpool Corporation | policy_maker | high | true | 3 |
| 4 | PAR-2731 | Norma Fisher | Alexandria Real Estate Equities | field_worker | low | false | 4 |

Field participants are the broader community of practitioners, experts, policy makers, and field workers who attend sessions and contribute to the prevention effort. The field_participants table records their identifiers (PAR-2722, PAR-2725, etc.), names, organizations, roles, motivation levels, whether they have previous experience, and the security project they belong to. Theodore Mcgrath (PAR-2722) is a practitioner at Whirlpool Corporation with a low motivation level and prior experience. Saipan International Airport (PAR-2728), listed as a policy_maker at Whirlpool Corporation, carries a high motivation level and previous experience. The motivation_level field—low, medium, or high—provides a quick signal for organizers who wish to prioritize engagement with participants who are most invested in the prevention mission.

**Table `prevention_insights`**

| id | insight_identifier | content | source_session | theme | quality_rating | is_recurring | is_new_element | discussion_session_id | burglary_prevention_topic_id | project_report_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | regional-source-18 | baseline-theme-79 | low | true | false | 100 | 1 | 1 |
| 1001 | INS-2714 | distributed-content-84 | legacy-source-19 | pilot-theme-80 | medium | false | true | 101 | 2 | 2 |
| 1002 | INS-2718 | baseline-content-85 | compact-source-20 | extended-theme-81 | high | true | false | 102 | 3 | 3 |
| 1003 | INS-2722 | pilot-content-86 | composite-source-21 | integrated-theme-82 | low | false | true | 103 | 4 | 4 |

Prevention insights are the actionable knowledge artifacts produced during discussion sessions. Each insight record carries an identifier (INS-2710, INS-2714, etc.), the content of the insight, the source session from which it originated, the theme it addresses, a quality rating (low, medium, or high), and two boolean flags: is_recurring, which indicates whether the insight reflects a persistent pattern, and is_new_element, which signals whether the insight introduces a novel concept or practice. Insight INS-2710, for example, contains adaptive-content-83, originates from a regional-source-18 session, addresses baseline-theme-79, carries a low quality rating, and is marked as recurring but not a new element. The discussion_session_id, burglary_prevention_topic_id, and project_report_id columns tie each insight to its immediate context and to the broader reporting pipeline.

**Table `burglary_prevention_topics`**

| id | topic_identifier | topic_name | category | complexity_level | is_primary_focus | security_project_id |
|---|---|---|---|---|---|---|
| 1 | TOP-2690 | Regional Model | awareness | low | true | 1 |
| 2 | TOP-2696 | Seasonal Cluster D | practice_exchange | medium | false | 2 |
| 3 | TOP-2702 | Integrated Review | cooperation | high | true | 3 |
| 4 | TOP-2708 | Extended Initiative | policy | low | false | 4 |

Burglary prevention topics define the substantive categories under which discussions and insights are organized. Each topic has an identifier (TOP-2690, TOP-2696, etc.), a topic name such as Regional Model or Seasonal Cluster D, a category (awareness, practice_exchange, cooperation, policy), a complexity level (low, medium, or high), a flag indicating whether it is the primary focus of the project, and the security project it belongs to. The Integrated Review topic (TOP-2702) falls under the cooperation category at a high complexity level and is designated as the primary focus for its project. These topics provide the taxonomy that allows practitioners to search, filter, and aggregate insights and sessions by subject matter.

**Table `security_projects`**

| id | project_identifier | project_name | start_date | end_date | funding_source | status | objectives |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | planning | integrated-objectiv-28 |
| 2 | PRO-2059 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | active | seasonal-objectiv-29 |
| 3 | PRO-2060 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | completed | regional-objectiv-30 |
| 4 | PRO-2061 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | terminated | legacy-objectiv-31 |

Security projects are the organizational containers that group events, sessions, moderators, participants, topics, and reports into coherent initiatives. Each project has an identifier, a name, a description, a start date, an end date, a status, a budget, and a lead_practitioner_id. Projects serve as the highest-level aggregation point in the system: every event, session, moderator, participant, insight, topic, and report is ultimately attributable to a single security project.

**Table `project_reports`**

| project_report_id | report_identifier | title | publication_date | status | word_count | contains_insights | world_caf_event_id | security_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | REP-2544 | Compact Initiative | 2025-12-01T23:33:00 | draft | 25 | true | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | REP-2545 | Legacy Model | 2022-05-12T06:50:00 | review | 425 | false | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | REP-2546 | Regional Cluster A | 2023-10-23T13:07:00 | published | 15 | true | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | REP-2547 | Seasonal Review | 2024-03-07T20:24:00 | archived | 40 | false | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Project reports are the formal summaries that synthesize the outcomes of a security project. Each report carries an identifier, a title, a description, a report_date, a status, a total_insights_count, a total_sessions_count, and the security_project_id it belongs to. Reports are the mechanism through which project leads communicate results to stakeholders and through which prevention insights are formally archived.

The base tables store the individual records, but the real analytical power of the system comes from the views—pre-joined result sets that answer the specific questions practitioners ask during planning, facilitation, and evaluation. Each view is designed to answer a particular question by combining records from two or more base tables.

**View `v_world_caf_event_discussion_session_detail`**

```sql
CREATE VIEW v_world_caf_event_discussion_session_detail AS
SELECT a.id, a.event_identifier, a.event_date, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM world_caf_events a
  JOIN events_sessions j ON j.world_caf_event_id = a.id
  JOIN discussion_sessions b ON b.id = j.discussion_session_id;
```

| id | event_identifier | event_date | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 100 | SES-2443 | 2024-03-27T14:42:00 |

The view v_world_caf_event_discussion_session_detail answers the question: "Which discussion sessions belong to which World Café events, and what are their key attributes?" It joins world_caf_events with discussion_sessions on the event identifier, producing rows that pair an event like EVE-2706 with its sessions such as SES-2443. A practitioner consulting this view can see at a glance that event EVE-2706 at extended-location-99 hosts session SES-2443, which runs under baseline-theme-79 at table 21 and is currently scheduled.

**View `v_world_caf_event_field_moderator_detail`**

```sql
CREATE VIEW v_world_caf_event_field_moderator_detail AS
SELECT a.id, a.event_identifier, a.event_date, b.id AS moderator_id, b.moderator_identifier AS moderator_moderator_identifier, b.full_name AS moderator_full_name
FROM world_caf_events a
  JOIN events_moderators j ON j.world_caf_event_id = a.id
  JOIN field_moderators b ON b.id = j.field_moderator_id;
```

| id | event_identifier | event_date | moderator_id | moderator_moderator_identifier | moderator_full_name |
|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 1 | MOD-2781 | Theodore Mcgrath |
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 2 | MOD-2788 | Account Name |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 2 | MOD-2788 | Account Name |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 3 | MOD-2795 | Saipan International Airport |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 3 | MOD-2795 | Saipan International Airport |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 4 | MOD-2802 | Norma Fisher |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 4 | MOD-2802 | Norma Fisher |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 1 | MOD-2781 | Theodore Mcgrath |

The view v_world_caf_event_field_moderator_detail links events to the moderators assigned to their sessions. By joining world_caf_events, discussion_sessions, and field_moderators, it produces rows that show, for example, that event EVE-2706 is associated with moderator Theodore Mcgrath (MOD-2781), who serves as a lead_moderator with 44 prior sessions and an available status. This view is essential for workload balancing and for verifying that each session has an appropriately qualified moderator.

**View `v_world_caf_event_field_participant_detail`**

```sql
CREATE VIEW v_world_caf_event_field_participant_detail AS
SELECT a.id, a.event_identifier, a.event_date, b.id AS participant_id, b.participant_identifier AS participant_participant_identifier, b.full_name AS participant_full_name
FROM world_caf_events a
  JOIN events_participants j ON j.world_caf_event_id = a.id
  JOIN field_participants b ON b.id = j.field_participant_id;
```

| id | event_identifier | event_date | participant_id | participant_participant_identifier | participant_full_name |
|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 1 | PAR-2722 | Theodore Mcgrath |
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | 2 | PAR-2725 | Account Name |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 2 | PAR-2725 | Account Name |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | 3 | PAR-2728 | Saipan International Airport |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 3 | PAR-2728 | Saipan International Airport |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | 4 | PAR-2731 | Norma Fisher |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 4 | PAR-2731 | Norma Fisher |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | 1 | PAR-2722 | Theodore Mcgrath |

The view v_world_caf_event_field_participant_detail connects events to the participants who attend their sessions. It joins world_caf_events, discussion_sessions, sessions_participants, and field_participants to produce rows that reveal, for instance, that event EVE-2706 includes participant Theodore Mcgrath (PAR-2722), a practitioner at Whirlpool Corporation with low motivation and prior experience. This view supports attendance analysis and helps organizers understand the composition of their participant pools.

**View `v_world_caf_event_security_project`**

```sql
CREATE VIEW v_world_caf_event_security_project AS
SELECT a.id, a.event_identifier, a.event_date, a.location, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM world_caf_events a JOIN security_projects b ON a.security_project_id = b.id;
```

| id | event_identifier | event_date | location | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | extended-location-99 | 1 | PRO-2058 | Compact Survey |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | integrated-location-100 | 2 | PRO-2059 | Legacy Corridor |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | seasonal-location-101 | 3 | PRO-2060 | Regional Series A |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | regional-location-102 | 4 | PRO-2061 | Seasonal Assessment |

The view v_world_caf_event_security_project traces the full lineage from a World Café event back to its parent security project. By joining world_caf_events with security_projects, it produces rows that confirm event EVE-2706 belongs to security project 1. This view is the primary tool for event-level budgeting, status tracking, and project-level rollups.

**View `v_discussion_session_world_caf_event`**

```sql
CREATE VIEW v_discussion_session_world_caf_event AS
SELECT a.id, a.session_identifier, a.start_time, a.end_time, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_date AS event_event_date
FROM discussion_sessions a JOIN world_caf_events b ON a.world_caf_event_id = b.id;
```

| id | session_identifier | start_time | end_time | event_id | event_event_identifier | event_event_date |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1000 | EVE-2706 | 2025-04-15T15:21:00 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 1001 | EVE-2707 | 2022-09-26T22:38:00 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 1002 | EVE-2708 | 2023-02-10T05:55:00 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 1003 | EVE-2709 | 2024-07-21T12:12:00 |

The view v_discussion_session_world_caf_event answers the inverse question: "Which event does this session belong to?" It joins discussion_sessions with world_caf_events, producing rows such as the one that maps session SES-2443 to event EVE-2706 at extended-location-99. This view is useful when a moderator or participant needs to navigate from a session record up to its parent event.

**View `v_discussion_session_field_moderator`**

```sql
CREATE VIEW v_discussion_session_field_moderator AS
SELECT a.id, a.session_identifier, a.start_time, a.end_time, b.id AS moderator_id, b.moderator_identifier AS moderator_moderator_identifier, b.full_name AS moderator_full_name
FROM discussion_sessions a JOIN field_moderators b ON a.field_moderator_id = b.id;
```

| id | session_identifier | start_time | end_time | moderator_id | moderator_moderator_identifier | moderator_full_name |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | MOD-2781 | Theodore Mcgrath |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | MOD-2788 | Account Name |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | MOD-2795 | Saipan International Airport |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | MOD-2802 | Norma Fisher |

The view v_discussion_session_field_moderator pairs each session with its assigned moderator. Joining discussion_sessions with field_moderators, it produces rows like the one connecting session SES-2443 to moderator Theodore Mcgrath (MOD-2781), a lead_moderator with 44 sessions facilitated. This view is critical for moderator performance tracking and for verifying that session assignments are consistent with moderator expertise.

**View `v_discussion_session_field_participant_detail`**

```sql
CREATE VIEW v_discussion_session_field_participant_detail AS
SELECT a.id, a.session_identifier, a.start_time, b.id AS participant_id, b.participant_identifier AS participant_participant_identifier, b.full_name AS participant_full_name
FROM discussion_sessions a
  JOIN sessions_participants j ON j.discussion_session_id = a.id
  JOIN field_participants b ON b.id = j.field_participant_id;
```

| id | session_identifier | start_time | participant_id | participant_participant_identifier | participant_full_name |
|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 1 | PAR-2722 | Theodore Mcgrath |
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2 | PAR-2725 | Account Name |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2 | PAR-2725 | Account Name |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 3 | PAR-2728 | Saipan International Airport |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 3 | PAR-2728 | Saipan International Airport |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 4 | PAR-2731 | Norma Fisher |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 4 | PAR-2731 | Norma Fisher |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 1 | PAR-2722 | Theodore Mcgrath |

The view v_discussion_session_field_participant_detail links sessions to the participants who attended them. By joining discussion_sessions, sessions_participants, and field_participants, it produces rows that show, for example, that session SES-2443 includes participant Theodore Mcgrath (PAR-2722). This view supports attendance verification and helps organizers identify which participants are most active across sessions.

**View `v_discussion_session_prevention_insight_detail`**

```sql
CREATE VIEW v_discussion_session_prevention_insight_detail AS
SELECT a.id, a.session_identifier, a.start_time, b.id AS insight_id, b.insight_identifier AS insight_insight_identifier, b.content AS insight_content
FROM discussion_sessions a
  JOIN sessions_insights j ON j.discussion_session_id = a.id
  JOIN prevention_insights b ON b.id = j.prevention_insight_id;
```

| id | session_identifier | start_time | insight_id | insight_insight_identifier | insight_content |
|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 1000 | INS-2710 | adaptive-content-83 |
| 100 | SES-2443 | 2024-03-27T14:42:00 | 1001 | INS-2714 | distributed-content-84 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 1001 | INS-2714 | distributed-content-84 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 1002 | INS-2718 | baseline-content-85 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 1002 | INS-2718 | baseline-content-85 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 1003 | INS-2722 | pilot-content-86 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 1003 | INS-2722 | pilot-content-86 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 1000 | INS-2710 | adaptive-content-83 |

The view v_discussion_session_prevention_insight_detail connects sessions to the prevention insights they generated. Joining discussion_sessions with prevention_insights, it produces rows such as the one linking session SES-2443 to insight INS-2710, which carries the content adaptive-content-83, addresses baseline-theme-79, and has a low quality rating. This view is the primary tool for evaluating the output quality of individual sessions.

**View `v_discussion_session_discussion_session`**

```sql
CREATE VIEW v_discussion_session_discussion_session AS
SELECT a.id, a.session_identifier, a.start_time, a.end_time, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM discussion_sessions a JOIN discussion_sessions b ON a.discussion_session_id = b.id;
```

| id | session_identifier | start_time | end_time | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | SES-2461 | 2023-06-06T11:33:00 |

The view v_discussion_session_discussion_session provides a self-referential join on discussion_sessions, enabling practitioners to identify sessions that are related to one another—such as sessions that share the same theme, table number, or moderator. This view supports the detection of session patterns and the identification of sessions that may need to be rescheduled or merged.

**View `v_field_moderator_discussion_session_detail`**

```sql
CREATE VIEW v_field_moderator_discussion_session_detail AS
SELECT a.id, a.moderator_identifier, a.full_name, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM field_moderators a
  JOIN moderators_sessions j ON j.field_moderator_id = a.id
  JOIN discussion_sessions b ON b.id = j.discussion_session_id;
```

| id | moderator_identifier | full_name | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1 | MOD-2781 | Theodore Mcgrath | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1 | MOD-2781 | Theodore Mcgrath | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | MOD-2788 | Account Name | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | MOD-2788 | Account Name | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | MOD-2795 | Saipan International Airport | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | MOD-2795 | Saipan International Airport | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | MOD-2802 | Norma Fisher | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | MOD-2802 | Norma Fisher | 100 | SES-2443 | 2024-03-27T14:42:00 |

The view v_field_moderator_discussion_session_detail answers the question: "What sessions has this moderator facilitated?" It joins field_moderators with discussion_sessions, producing rows that show, for instance, that moderator Theodore Mcgrath (MOD-2781) has facilitated session SES-2443, which runs under baseline-theme-79 at table 21. This view is essential for moderator workload analysis and for identifying moderators who may be over- or under-utilized.

**View `v_field_moderator_security_project`**

```sql
CREATE VIEW v_field_moderator_security_project AS
SELECT a.id, a.moderator_identifier, a.full_name, a.expertise_area, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM field_moderators a JOIN security_projects b ON a.security_project_id = b.id;
```

| id | moderator_identifier | full_name | expertise_area | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1 | MOD-2781 | Theodore Mcgrath | baseline-expertis-31 | 1 | PRO-2058 | Compact Survey |
| 2 | MOD-2788 | Account Name | pilot-expertis-32 | 2 | PRO-2059 | Legacy Corridor |
| 3 | MOD-2795 | Saipan International Airport | extended-expertis-33 | 3 | PRO-2060 | Regional Series A |
| 4 | MOD-2802 | Norma Fisher | integrated-expertis-34 | 4 | PRO-2061 | Seasonal Assessment |

The view v_field_moderator_security_project traces a moderator's assignment to a security project. By joining field_moderators with security_projects, it produces rows that confirm moderator Theodore Mcgrath (MOD-2781) belongs to security project 1. This view supports project-level staffing reports and helps ensure that moderators are assigned to projects that match their expertise.

**View `v_field_moderator_field_moderator_detail`**

```sql
CREATE VIEW v_field_moderator_field_moderator_detail AS
SELECT a.id, a.moderator_identifier, a.full_name, b.id AS moderator_id, b.moderator_identifier AS moderator_moderator_identifier, b.full_name AS moderator_full_name
FROM field_moderators a
  JOIN moderators_moderators j ON j.field_moderator_id = a.id
  JOIN field_moderators b ON b.id = j.collaborates_with_field_moderator_id;
```

| id | moderator_identifier | full_name | moderator_id | moderator_moderator_identifier | moderator_full_name |
|---|---|---|---|---|---|
| 1 | MOD-2781 | Theodore Mcgrath | 1 | MOD-2781 | Theodore Mcgrath |
| 1 | MOD-2781 | Theodore Mcgrath | 2 | MOD-2788 | Account Name |
| 2 | MOD-2788 | Account Name | 2 | MOD-2788 | Account Name |
| 2 | MOD-2788 | Account Name | 3 | MOD-2795 | Saipan International Airport |
| 3 | MOD-2795 | Saipan International Airport | 3 | MOD-2795 | Saipan International Airport |
| 3 | MOD-2795 | Saipan International Airport | 4 | MOD-2802 | Norma Fisher |
| 4 | MOD-2802 | Norma Fisher | 4 | MOD-2802 | Norma Fisher |
| 4 | MOD-2802 | Norma Fisher | 1 | MOD-2781 | Theodore Mcgrath |

The view v_field_moderator_field_moderator_detail provides a self-referential join on field_moderators, enabling practitioners to identify moderators who share the same expertise area, role, or availability status. This view is useful for building moderator teams with complementary skills and for identifying potential backup moderators.

**View `v_field_participant_discussion_session_detail`**

```sql
CREATE VIEW v_field_participant_discussion_session_detail AS
SELECT a.id, a.participant_identifier, a.full_name, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM field_participants a
  JOIN participants_sessions j ON j.field_participant_id = a.id
  JOIN discussion_sessions b ON b.id = j.discussion_session_id;
```

| id | participant_identifier | full_name | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1 | PAR-2722 | Theodore Mcgrath | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1 | PAR-2722 | Theodore Mcgrath | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | PAR-2725 | Account Name | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | PAR-2725 | Account Name | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | PAR-2728 | Saipan International Airport | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | PAR-2728 | Saipan International Airport | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | PAR-2731 | Norma Fisher | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | PAR-2731 | Norma Fisher | 100 | SES-2443 | 2024-03-27T14:42:00 |

The view v_field_participant_discussion_session_detail links participants to the sessions they attended. Joining field_participants with sessions_participants and discussion_sessions, it produces rows that show, for example, that participant Theodore Mcgrath (PAR-2722) attended session SES-2443. This view supports participant engagement analysis and helps organizers identify participants who are highly active across multiple sessions.

**View `v_field_participant_prevention_insight_detail`**

```sql
CREATE VIEW v_field_participant_prevention_insight_detail AS
SELECT a.id, a.participant_identifier, a.full_name, b.id AS insight_id, b.insight_identifier AS insight_insight_identifier, b.content AS insight_content
FROM field_participants a
  JOIN participants_insights j ON j.field_participant_id = a.id
  JOIN prevention_insights b ON b.id = j.prevention_insight_id;
```

| id | participant_identifier | full_name | insight_id | insight_insight_identifier | insight_content |
|---|---|---|---|---|---|
| 1 | PAR-2722 | Theodore Mcgrath | 1000 | INS-2710 | adaptive-content-83 |
| 1 | PAR-2722 | Theodore Mcgrath | 1001 | INS-2714 | distributed-content-84 |
| 2 | PAR-2725 | Account Name | 1001 | INS-2714 | distributed-content-84 |
| 2 | PAR-2725 | Account Name | 1002 | INS-2718 | baseline-content-85 |
| 3 | PAR-2728 | Saipan International Airport | 1002 | INS-2718 | baseline-content-85 |
| 3 | PAR-2728 | Saipan International Airport | 1003 | INS-2722 | pilot-content-86 |
| 4 | PAR-2731 | Norma Fisher | 1003 | INS-2722 | pilot-content-86 |
| 4 | PAR-2731 | Norma Fisher | 1000 | INS-2710 | adaptive-content-83 |

The view v_field_participant_prevention_insight_detail connects participants to the prevention insights they contributed. By joining field_participants, sessions_participants, discussion_sessions, and prevention_insights, it produces rows that reveal, for instance, that participant Theodore Mcgrath (PAR-2722) contributed insight INS-2710. This view is the primary tool for recognizing high-value contributors and for tracking the distribution of insight generation across the participant pool.

**View `v_field_participant_security_project`**

```sql
CREATE VIEW v_field_participant_security_project AS
SELECT a.id, a.participant_identifier, a.full_name, a.organization, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM field_participants a JOIN security_projects b ON a.security_project_id = b.id;
```

| id | participant_identifier | full_name | organization | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Theodore Mcgrath | Whirlpool Corporation | 1 | PRO-2058 | Compact Survey |
| 2 | PAR-2725 | Account Name | Poshmark Inc. | 2 | PRO-2059 | Legacy Corridor |
| 3 | PAR-2728 | Saipan International Airport | Whirlpool Corporation | 3 | PRO-2060 | Regional Series A |
| 4 | PAR-2731 | Norma Fisher | Alexandria Real Estate Equities | 4 | PRO-2061 | Seasonal Assessment |

The view v_field_participant_security_project traces a participant's assignment to a security project. By joining field_participants with security_projects, it produces rows that confirm participant Theodore Mcgrath (PAR-2722) belongs to security project 1. This view supports project-level participation reports and helps ensure that participants are assigned to projects that match their role and motivation level.

**View `v_prevention_insight_discussion_session`**

```sql
CREATE VIEW v_prevention_insight_discussion_session AS
SELECT a.id, a.insight_identifier, a.content, a.source_session, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM prevention_insights a JOIN discussion_sessions b ON a.discussion_session_id = b.id;
```

| id | insight_identifier | content | source_session | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | regional-source-18 | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1001 | INS-2714 | distributed-content-84 | legacy-source-19 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 1002 | INS-2718 | baseline-content-85 | compact-source-20 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 1003 | INS-2722 | pilot-content-86 | composite-source-21 | 103 | SES-2461 | 2023-06-06T11:33:00 |

The view v_prevention_insight_discussion_session answers the question: "Which session produced this insight?" It joins prevention_insights with discussion_sessions, producing rows such as the one linking insight INS-2710 to session SES-2443. This view is useful for tracing the provenance of insights and for evaluating which sessions are most productive in generating knowledge.

**View `v_prevention_insight_field_participant_detail`**

```sql
CREATE VIEW v_prevention_insight_field_participant_detail AS
SELECT a.id, a.insight_identifier, a.content, b.id AS participant_id, b.participant_identifier AS participant_participant_identifier, b.full_name AS participant_full_name
FROM prevention_insights a
  JOIN insights_participants j ON j.prevention_insight_id = a.id
  JOIN field_participants b ON b.id = j.field_participant_id;
```

| id | insight_identifier | content | participant_id | participant_participant_identifier | participant_full_name |
|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | 1 | PAR-2722 | Theodore Mcgrath |
| 1000 | INS-2710 | adaptive-content-83 | 2 | PAR-2725 | Account Name |
| 1001 | INS-2714 | distributed-content-84 | 2 | PAR-2725 | Account Name |
| 1001 | INS-2714 | distributed-content-84 | 3 | PAR-2728 | Saipan International Airport |
| 1002 | INS-2718 | baseline-content-85 | 3 | PAR-2728 | Saipan International Airport |
| 1002 | INS-2718 | baseline-content-85 | 4 | PAR-2731 | Norma Fisher |
| 1003 | INS-2722 | pilot-content-86 | 4 | PAR-2731 | Norma Fisher |
| 1003 | INS-2722 | pilot-content-86 | 1 | PAR-2722 | Theodore Mcgrath |

The view v_prevention_insight_field_participant_detail connects insights to the participants who contributed them. By joining prevention_insights, discussion_sessions, sessions_participants, and field_participants, it produces rows that show, for example, that insight INS-2710 was contributed by participant Theodore Mcgrath (PAR-2722). This view supports contributor attribution and helps organizers identify the most active knowledge producers.

**View `v_prevention_insight_burglary_prevention_topic`**

```sql
CREATE VIEW v_prevention_insight_burglary_prevention_topic AS
SELECT a.id, a.insight_identifier, a.content, a.source_session, b.id AS topic_id, b.topic_identifier AS topic_topic_identifier, b.topic_name AS topic_topic_name
FROM prevention_insights a JOIN burglary_prevention_topics b ON a.burglary_prevention_topic_id = b.id;
```

| id | insight_identifier | content | source_session | topic_id | topic_topic_identifier | topic_topic_name |
|---|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | regional-source-18 | 1 | TOP-2690 | Regional Model |
| 1001 | INS-2714 | distributed-content-84 | legacy-source-19 | 2 | TOP-2696 | Seasonal Cluster D |
| 1002 | INS-2718 | baseline-content-85 | compact-source-20 | 3 | TOP-2702 | Integrated Review |
| 1003 | INS-2722 | pilot-content-86 | composite-source-21 | 4 | TOP-2708 | Extended Initiative |

The view v_prevention_insight_burglary_prevention_topic links insights to the burglary prevention topics they address. Joining prevention_insights with burglary_prevention_topics, it produces rows such as the one connecting insight INS-2710 to topic TOP-2690 (Regional Model), which falls under the awareness category at a low complexity level. This view is essential for topic-level analysis and for ensuring that insights are distributed across the full range of prevention topics.

**View `v_prevention_insight_project_report`**

```sql
CREATE VIEW v_prevention_insight_project_report AS
SELECT a.id, a.insight_identifier, a.content, a.source_session, b.project_report_id AS report_project_report_id, b.report_identifier AS report_report_identifier, b.title AS report_title
FROM prevention_insights a JOIN project_reports b ON a.project_report_id = b.project_report_id;
```

| id | insight_identifier | content | source_session | report_project_report_id | report_report_identifier | report_title |
|---|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | regional-source-18 | 1 | REP-2544 | Compact Initiative |
| 1001 | INS-2714 | distributed-content-84 | legacy-source-19 | 2 | REP-2545 | Legacy Model |
| 1002 | INS-2718 | baseline-content-85 | compact-source-20 | 3 | REP-2546 | Regional Cluster A |
| 1003 | INS-2722 | pilot-content-86 | composite-source-21 | 4 | REP-2547 | Seasonal Review |

The view v_prevention_insight_project_report traces an insight's path from its originating session through to the project report that archives it. By joining prevention_insights with project_reports, it produces rows that confirm insight INS-2710 is archived in project report 1. This view supports report-level content analysis and helps ensure that all insights are properly captured in the final project documentation.

**View `v_burglary_prevention_topic_discussion_session_detail`**

```sql
CREATE VIEW v_burglary_prevention_topic_discussion_session_detail AS
SELECT a.id, a.topic_identifier, a.topic_name, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM burglary_prevention_topics a
  JOIN topics_sessions j ON j.burglary_prevention_topic_id = a.id
  JOIN discussion_sessions b ON b.id = j.discussion_session_id;
```

| id | topic_identifier | topic_name | session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1 | TOP-2690 | Regional Model | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1 | TOP-2690 | Regional Model | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | TOP-2696 | Seasonal Cluster D | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | TOP-2696 | Seasonal Cluster D | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | TOP-2702 | Integrated Review | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | TOP-2702 | Integrated Review | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | TOP-2708 | Extended Initiative | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | TOP-2708 | Extended Initiative | 100 | SES-2443 | 2024-03-27T14:42:00 |

The view v_burglary_prevention_topic_discussion_session_detail links topics to the sessions that addressed them. By joining burglary_prevention_topics with topics_sessions and discussion_sessions, it produces rows that show, for instance, that topic TOP-2690 (Regional Model) was addressed in session SES-2443. This view supports topic coverage analysis and helps ensure that all prevention topics receive adequate discussion time.

**View `v_burglary_prevention_topic_prevention_insight_detail`**

```sql
CREATE VIEW v_burglary_prevention_topic_prevention_insight_detail AS
SELECT a.id, a.topic_identifier, a.topic_name, b.id AS insight_id, b.insight_identifier AS insight_insight_identifier, b.content AS insight_content
FROM burglary_prevention_topics a
  JOIN topics_insights j ON j.burglary_prevention_topic_id = a.id
  JOIN prevention_insights b ON b.id = j.prevention_insight_id;
```

| id | topic_identifier | topic_name | insight_id | insight_insight_identifier | insight_content |
|---|---|---|---|---|---|
| 1 | TOP-2690 | Regional Model | 1000 | INS-2710 | adaptive-content-83 |
| 1 | TOP-2690 | Regional Model | 1001 | INS-2714 | distributed-content-84 |
| 2 | TOP-2696 | Seasonal Cluster D | 1001 | INS-2714 | distributed-content-84 |
| 2 | TOP-2696 | Seasonal Cluster D | 1002 | INS-2718 | baseline-content-85 |
| 3 | TOP-2702 | Integrated Review | 1002 | INS-2718 | baseline-content-85 |
| 3 | TOP-2702 | Integrated Review | 1003 | INS-2722 | pilot-content-86 |
| 4 | TOP-2708 | Extended Initiative | 1003 | INS-2722 | pilot-content-86 |
| 4 | TOP-2708 | Extended Initiative | 1000 | INS-2710 | adaptive-content-83 |

The view v_burglary_prevention_topic_prevention_insight_detail connects topics to the insights they generated. Joining burglary_prevention_topics with prevention_insights, it produces rows such as the one linking topic TOP-2690 to insight INS-2710. This view is the primary tool for evaluating the knowledge output of each prevention topic and for identifying topics that may need more focused discussion.

**View `v_burglary_prevention_topic_security_project`**

```sql
CREATE VIEW v_burglary_prevention_topic_security_project AS
SELECT a.id, a.topic_identifier, a.topic_name, a.category, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM burglary_prevention_topics a JOIN security_projects b ON a.security_project_id = b.id;
```

| id | topic_identifier | topic_name | category | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1 | TOP-2690 | Regional Model | awareness | 1 | PRO-2058 | Compact Survey |
| 2 | TOP-2696 | Seasonal Cluster D | practice_exchange | 2 | PRO-2059 | Legacy Corridor |
| 3 | TOP-2702 | Integrated Review | cooperation | 3 | PRO-2060 | Regional Series A |
| 4 | TOP-2708 | Extended Initiative | policy | 4 | PRO-2061 | Seasonal Assessment |

The view v_burglary_prevention_topic_security_project traces a topic's assignment to a security project. By joining burglary_prevention_topics with security_projects, it produces rows that confirm topic TOP-2690 (Regional Model) belongs to security project 1. This view supports project-level topic planning and helps ensure that each project covers the full range of relevant prevention topics.

**View `v_security_project_world_caf_event_detail`**

```sql
CREATE VIEW v_security_project_world_caf_event_detail AS
SELECT a.id, a.project_identifier, a.project_name, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_date AS event_event_date
FROM security_projects a
  JOIN projects_events j ON j.security_project_id = a.id
  JOIN world_caf_events b ON b.id = j.world_caf_event_id;
```

| id | project_identifier | project_name | event_id | event_event_identifier | event_event_date |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 1000 | EVE-2706 | 2025-04-15T15:21:00 |
| 1 | PRO-2058 | Compact Survey | 1001 | EVE-2707 | 2022-09-26T22:38:00 |
| 2 | PRO-2059 | Legacy Corridor | 1001 | EVE-2707 | 2022-09-26T22:38:00 |
| 2 | PRO-2059 | Legacy Corridor | 1002 | EVE-2708 | 2023-02-10T05:55:00 |
| 3 | PRO-2060 | Regional Series A | 1002 | EVE-2708 | 2023-02-10T05:55:00 |
| 3 | PRO-2060 | Regional Series A | 1003 | EVE-2709 | 2024-07-21T12:12:00 |
| 4 | PRO-2061 | Seasonal Assessment | 1003 | EVE-2709 | 2024-07-21T12:12:00 |
| 4 | PRO-2061 | Seasonal Assessment | 1000 | EVE-2706 | 2025-04-15T15:21:00 |

The view v_security_project_world_caf_event_detail links security projects to the World Café events they contain. By joining security_projects with world_caf_events, it produces rows that show, for example, that security project 1 includes event EVE-2706 at extended-location-99. This view is the primary tool for project-level event tracking and for generating event-level summaries for project reports.

**View `v_security_project_field_moderator_detail`**

```sql
CREATE VIEW v_security_project_field_moderator_detail AS
SELECT a.id, a.project_identifier, a.project_name, b.id AS moderator_id, b.moderator_identifier AS moderator_moderator_identifier, b.full_name AS moderator_full_name
FROM security_projects a
  JOIN projects_moderators j ON j.security_project_id = a.id
  JOIN field_moderators b ON b.id = j.field_moderator_id;
```

| id | project_identifier | project_name | moderator_id | moderator_moderator_identifier | moderator_full_name |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 1 | MOD-2781 | Theodore Mcgrath |
| 1 | PRO-2058 | Compact Survey | 2 | MOD-2788 | Account Name |
| 2 | PRO-2059 | Legacy Corridor | 2 | MOD-2788 | Account Name |
| 2 | PRO-2059 | Legacy Corridor | 3 | MOD-2795 | Saipan International Airport |
| 3 | PRO-2060 | Regional Series A | 3 | MOD-2795 | Saipan International Airport |
| 3 | PRO-2060 | Regional Series A | 4 | MOD-2802 | Norma Fisher |
| 4 | PRO-2061 | Seasonal Assessment | 4 | MOD-2802 | Norma Fisher |
| 4 | PRO-2061 | Seasonal Assessment | 1 | MOD-2781 | Theodore Mcgrath |

The view v_security_project_field_moderator_detail connects security projects to the moderators they employ. By joining security_projects with field_moderators, it produces rows that confirm security project 1 includes moderator Theodore Mcgrath (MOD-2781). This view supports project-level staffing analysis and helps ensure that each project has an adequate pool of qualified moderators.

**View `v_security_project_field_participant_detail`**

```sql
CREATE VIEW v_security_project_field_participant_detail AS
SELECT a.id, a.project_identifier, a.project_name, b.id AS participant_id, b.participant_identifier AS participant_participant_identifier, b.full_name AS participant_full_name
FROM security_projects a
  JOIN projects_participants j ON j.security_project_id = a.id
  JOIN field_participants b ON b.id = j.field_participant_id;
```

| id | project_identifier | project_name | participant_id | participant_participant_identifier | participant_full_name |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 1 | PAR-2722 | Theodore Mcgrath |
| 1 | PRO-2058 | Compact Survey | 2 | PAR-2725 | Account Name |
| 2 | PRO-2059 | Legacy Corridor | 2 | PAR-2725 | Account Name |
| 2 | PRO-2059 | Legacy Corridor | 3 | PAR-2728 | Saipan International Airport |
| 3 | PRO-2060 | Regional Series A | 3 | PAR-2728 | Saipan International Airport |
| 3 | PRO-2060 | Regional Series A | 4 | PAR-2731 | Norma Fisher |
| 4 | PRO-2061 | Seasonal Assessment | 4 | PAR-2731 | Norma Fisher |
| 4 | PRO-2061 | Seasonal Assessment | 1 | PAR-2722 | Theodore Mcgrath |

The view v_security_project_field_participant_detail links security projects to the participants they engage. By joining security_projects with field_participants, it produces rows that show, for instance, that security project 1 includes participant Theodore Mcgrath (PAR-2722). This view supports project-level participation analysis and helps organizers understand the composition of their participant pools at the project level.

**View `v_security_project_burglary_prevention_topic_detail`**

```sql
CREATE VIEW v_security_project_burglary_prevention_topic_detail AS
SELECT a.id, a.project_identifier, a.project_name, b.id AS topic_id, b.topic_identifier AS topic_topic_identifier, b.topic_name AS topic_topic_name
FROM security_projects a
  JOIN projects_topics j ON j.security_project_id = a.id
  JOIN burglary_prevention_topics b ON b.id = j.burglary_prevention_topic_id;
```

| id | project_identifier | project_name | topic_id | topic_topic_identifier | topic_topic_name |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 1 | TOP-2690 | Regional Model |
| 1 | PRO-2058 | Compact Survey | 2 | TOP-2696 | Seasonal Cluster D |
| 2 | PRO-2059 | Legacy Corridor | 2 | TOP-2696 | Seasonal Cluster D |
| 2 | PRO-2059 | Legacy Corridor | 3 | TOP-2702 | Integrated Review |
| 3 | PRO-2060 | Regional Series A | 3 | TOP-2702 | Integrated Review |
| 3 | PRO-2060 | Regional Series A | 4 | TOP-2708 | Extended Initiative |
| 4 | PRO-2061 | Seasonal Assessment | 4 | TOP-2708 | Extended Initiative |
| 4 | PRO-2061 | Seasonal Assessment | 1 | TOP-2690 | Regional Model |

The view v_security_project_burglary_prevention_topic_detail connects security projects to the prevention topics they cover. By joining security_projects with burglary_prevention_topics, it produces rows that confirm security project 1 covers topic TOP-2690 (Regional Model). This view is essential for topic coverage planning and for ensuring that each project addresses the full range of relevant prevention topics.

**View `v_security_project_project_report_detail`**

```sql
CREATE VIEW v_security_project_project_report_detail AS
SELECT a.id, a.project_identifier, a.project_name, b.project_report_id AS report_project_report_id, b.report_identifier AS report_report_identifier, b.title AS report_title
FROM security_projects a
  JOIN projects_reports j ON j.security_project_id = a.id
  JOIN project_reports b ON b.project_report_id = j.project_report_id;
```

| id | project_identifier | project_name | report_project_report_id | report_report_identifier | report_title |
|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 1 | REP-2544 | Compact Initiative |
| 1 | PRO-2058 | Compact Survey | 2 | REP-2545 | Legacy Model |
| 2 | PRO-2059 | Legacy Corridor | 2 | REP-2545 | Legacy Model |
| 2 | PRO-2059 | Legacy Corridor | 3 | REP-2546 | Regional Cluster A |
| 3 | PRO-2060 | Regional Series A | 3 | REP-2546 | Regional Cluster A |
| 3 | PRO-2060 | Regional Series A | 4 | REP-2547 | Seasonal Review |
| 4 | PRO-2061 | Seasonal Assessment | 4 | REP-2547 | Seasonal Review |
| 4 | PRO-2061 | Seasonal Assessment | 1 | REP-2544 | Compact Initiative |

The view v_security_project_project_report_detail links security projects to the reports they produce. By joining security_projects with project_reports, it produces rows that show, for example, that security project 1 has project report 1. This view is the primary tool for project-level reporting and for ensuring that all projects produce formal summaries of their outcomes.

**View `v_project_report_world_caf_event`**

```sql
CREATE VIEW v_project_report_world_caf_event AS
SELECT a.project_report_id, a.report_identifier, a.title, a.publication_date, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_date AS event_event_date
FROM project_reports a JOIN world_caf_events b ON a.world_caf_event_id = b.id;
```

| project_report_id | report_identifier | title | publication_date | event_id | event_event_identifier | event_event_date |
|---|---|---|---|---|---|---|
| 1 | REP-2544 | Compact Initiative | 2025-12-01T23:33:00 | 1000 | EVE-2706 | 2025-04-15T15:21:00 |
| 2 | REP-2545 | Legacy Model | 2022-05-12T06:50:00 | 1001 | EVE-2707 | 2022-09-26T22:38:00 |
| 3 | REP-2546 | Regional Cluster A | 2023-10-23T13:07:00 | 1002 | EVE-2708 | 2023-02-10T05:55:00 |
| 4 | REP-2547 | Seasonal Review | 2024-03-07T20:24:00 | 1003 | EVE-2709 | 2024-07-21T12:12:00 |

The view v_project_report_world_caf_event traces a project report back to the World Café events that contributed to it. By joining project_reports with world_caf_events, it produces rows that confirm project report 1 includes event EVE-2706. This view supports report-level event attribution and helps ensure that all events are properly represented in the final project documentation.

**View `v_project_report_prevention_insight_detail`**

```sql
CREATE VIEW v_project_report_prevention_insight_detail AS
SELECT a.project_report_id, a.report_identifier, a.title, b.id AS insight_id, b.insight_identifier AS insight_insight_identifier, b.content AS insight_content
FROM project_reports a
  JOIN reports_insights j ON j.project_report_id = a.project_report_id
  JOIN prevention_insights b ON b.id = j.prevention_insight_id;
```

| project_report_id | report_identifier | title | insight_id | insight_insight_identifier | insight_content |
|---|---|---|---|---|---|
| 1 | REP-2544 | Compact Initiative | 1000 | INS-2710 | adaptive-content-83 |
| 1 | REP-2544 | Compact Initiative | 1001 | INS-2714 | distributed-content-84 |
| 2 | REP-2545 | Legacy Model | 1001 | INS-2714 | distributed-content-84 |
| 2 | REP-2545 | Legacy Model | 1002 | INS-2718 | baseline-content-85 |
| 3 | REP-2546 | Regional Cluster A | 1002 | INS-2718 | baseline-content-85 |
| 3 | REP-2546 | Regional Cluster A | 1003 | INS-2722 | pilot-content-86 |
| 4 | REP-2547 | Seasonal Review | 1003 | INS-2722 | pilot-content-86 |
| 4 | REP-2547 | Seasonal Review | 1000 | INS-2710 | adaptive-content-83 |

The view v_project_report_prevention_insight_detail links project reports to the prevention insights they archive. By joining project_reports with prevention_insights, it produces rows such as the one connecting project report 1 to insight INS-2710. This view is the primary tool for report-level content analysis and for verifying that all insights are properly captured in the final project documentation.

**View `v_project_report_security_project`**

```sql
CREATE VIEW v_project_report_security_project AS
SELECT a.project_report_id, a.report_identifier, a.title, a.publication_date, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM project_reports a JOIN security_projects b ON a.security_project_id = b.id;
```

| project_report_id | report_identifier | title | publication_date | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1 | REP-2544 | Compact Initiative | 2025-12-01T23:33:00 | 1 | PRO-2058 | Compact Survey |
| 2 | REP-2545 | Legacy Model | 2022-05-12T06:50:00 | 2 | PRO-2059 | Legacy Corridor |
| 3 | REP-2546 | Regional Cluster A | 2023-10-23T13:07:00 | 3 | PRO-2060 | Regional Series A |
| 4 | REP-2547 | Seasonal Review | 2024-03-07T20:24:00 | 4 | PRO-2061 | Seasonal Assessment |

The view v_project_report_security_project traces a project report back to its parent security project. By joining project_reports with security_projects, it produces rows that confirm project report 1 belongs to security project 1. This view is the foundational link for all project-level reporting and ensures that every report is properly attributable to its originating project.

The system described here transforms burglary prevention from an ad hoc collection of meetings and notes into a structured, traceable, and analyzable process. Every World Café event, discussion session, moderator, participant, insight, topic, and report is recorded, linked, and made available through a set of views that answer the specific questions practitioners need during planning, facilitation, and evaluation. The result is a coherent knowledge management infrastructure that supports not only the immediate goals of any given security project but also the long-term accumulation of prevention knowledge across projects, locations, and communities.

## Data appendix

**Table `events_sessions`**

| world_caf_event_id | discussion_session_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `events_moderators`**

| world_caf_event_id | field_moderator_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `events_participants`**

| world_caf_event_id | field_participant_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `sessions_participants`**

| discussion_session_id | field_participant_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `sessions_insights`**

| discussion_session_id | prevention_insight_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `moderators_sessions`**

| field_moderator_id | discussion_session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `moderators_moderators`**

| field_moderator_id | collaborates_with_field_moderator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `participants_sessions`**

| field_participant_id | discussion_session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `participants_insights`**

| field_participant_id | prevention_insight_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `insights_participants`**

| prevention_insight_id | field_participant_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `topics_sessions`**

| burglary_prevention_topic_id | discussion_session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `topics_insights`**

| burglary_prevention_topic_id | prevention_insight_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `projects_events`**

| security_project_id | world_caf_event_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `projects_moderators`**

| security_project_id | field_moderator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `projects_participants`**

| security_project_id | field_participant_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `projects_topics`**

| security_project_id | burglary_prevention_topic_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `projects_reports`**

| security_project_id | project_report_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `reports_insights`**

| project_report_id | prevention_insight_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |
