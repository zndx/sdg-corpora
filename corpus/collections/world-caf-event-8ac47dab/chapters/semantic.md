**Table `world_caf_events`**

| id | event_identifier | event_date | location | status | duration_minutes | participant_count | moderator_count | break_count | security_project_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2025-04-15T15:21:00 | extended-location-99 | planned | 35 | 100 | 12 | 92 | 1 | 2025-01-01 00:14:00 |
| 1001 | EVE-2707 | 2022-09-26T22:38:00 | integrated-location-100 | ongoing | 38 | 27 | 20 | 25 | 2 | 2025-02-06 03:14:00 |
| 1002 | EVE-2708 | 2023-02-10T05:55:00 | seasonal-location-101 | completed | 41 | 23 | 33 | 49 | 3 | 2025-03-11 06:14:00 |
| 1003 | EVE-2709 | 2024-07-21T12:12:00 | regional-location-102 | cancelled | 44 | 34 | 4 | 8 | 4 | 2025-04-16 09:14:00 |

The domain under examination is a World Café–style deliberation framework deployed within a network of burglary prevention initiatives. Each World Café event—identified by a human-readable code such as `EVE-2706` or `EVE-2709`—is a scheduled gathering held at a named location (`extended-location-99`, `regional-location-102`) over a bounded duration (`35` to `44` minutes). Events carry a lifecycle status (`planned`, `ongoing`, `completed`, `cancelled`), track aggregate headcounts (`participant_count` ranging from `27` to `100`, `moderator_count` from `4` to `33`), and record the number of intermission breaks (`break_count` from `4` to `92`). Every event is anchored to a single `security_project_id` (values `1` through `4`), establishing the project-level sponsorship that cascades through the entire schema. The `created_at` timestamp marks when the event record was first instantiated, with dates spanning from early January through mid-April 2025.

**Table `discussion_sessions`**

| id | session_identifier | start_time | end_time | duration_minutes | theme | table_number | status | notes_summary | world_caf_event_id | field_moderator_id | discussion_session_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 35 | baseline-theme-79 | 21 | scheduled | baseline-notes-61 | 1000 | 1 | 100 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 38 | pilot-theme-80 | 31 | active | pilot-notes-62 | 1001 | 2 | 101 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 41 | extended-theme-81 | 41 | completed | extended-notes-63 | 1002 | 3 | 102 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 44 | integrated-theme-82 | 51 | abruptly_stopped | integrated-notes-64 | 1003 | 4 | 103 |

Within each World Café event, the conversation is partitioned into discussion sessions. The `discussion_sessions` table captures these sub-events, each bearing its own identifier (`SES-2443` through `SES-2461`), a `theme` drawn from a controlled vocabulary (`baseline-theme-79`, `pilot-theme-80`, `extended-theme-81`, `integrated-theme-82`), and a `table_number` (`21`, `31`, `41`, `51`) that maps to the physical seating arrangement typical of World Café methodology. Sessions record `start_time` and `end_time` values, a `duration_minutes` field, a `status` (`scheduled`, `active`, `completed`, `abruptly_stopped`), and a `notes_summary` (`baseline-notes-61` through `integrated-notes-64`). Each session is linked to its parent event via `world_caf_event_id` and to a `field_moderator_id`, while the self-referencing `discussion_session_id` column enables session-to-session chaining (e.g., `SES-2443` referencing itself as `100`).

**Table `field_moderators`**

| id | moderator_identifier | full_name | expertise_area | role | session_count | availability_status | security_project_id |
|---|---|---|---|---|---|---|---|
| 1 | MOD-2781 | Theodore Mcgrath | baseline-expertis-31 | lead_moderator | 44 | available | 1 |
| 2 | MOD-2788 | Account Name | pilot-expertis-32 | note_taker | 0 | busy | 2 |
| 3 | MOD-2795 | Saipan International Airport | extended-expertis-33 | file_manager | 72 | unavailable | 3 |
| 4 | MOD-2802 | Norma Fisher | integrated-expertis-34 | lead_moderator | 69 | available | 4 |

The `field_moderators` table stores the people who facilitate discussion sessions. Moderators carry an `expertise_area` (`baseline-expertis-31` through `integrated-expertis-34`), a `role` (`lead_moderator`, `note_taker`, `file_manager`), a `session_count` (`0` to `72`), and an `availability_status` (`available`, `busy`, `unavailable`). Names such as `Theodore Mcgrath` and `Norma Fisher` appear alongside organizational placeholders like `Account Name` and `Saipan International Airport`. Each moderator is assigned to exactly one `security_project_id`, mirroring the project-level grouping seen in events.

**Table `field_participants`**

| id | participant_identifier | full_name | organization | role | motivation_level | previous_experience | security_project_id |
|---|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Theodore Mcgrath | Whirlpool Corporation | practitioner | low | true | 1 |
| 2 | PAR-2725 | Account Name | Poshmark Inc. | expert | medium | false | 2 |
| 3 | PAR-2728 | Saipan International Airport | Whirlpool Corporation | policy_maker | high | true | 3 |
| 4 | PAR-2731 | Norma Fisher | Alexandria Real Estate Equities | field_worker | low | false | 4 |

The `field_participants` table records attendees who are not serving as moderators. Participants have a `role` (`practitioner`, `expert`, `policy_maker`, `field_worker`), a `motivation_level` (`low`, `medium`, `high`), a boolean `previous_experience` flag, and an `organization` field (`Whirlpool Corporation`, `Poshmark Inc.`, `Alexandria Real Estate Equities`). Like moderators, participants are scoped to a single `security_project_id`. The overlap between moderator and participant names (e.g., `Theodore Mcgrath` appearing in both tables) reflects the dual capacity some individuals hold within the domain.

**Table `prevention_insights`**

| id | insight_identifier | content | source_session | theme | quality_rating | is_recurring | is_new_element | discussion_session_id | burglary_prevention_topic_id | project_report_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | INS-2710 | adaptive-content-83 | regional-source-18 | baseline-theme-79 | low | true | false | 100 | 1 | 1 |
| 1001 | INS-2714 | distributed-content-84 | legacy-source-19 | pilot-theme-80 | medium | false | true | 101 | 2 | 2 |
| 1002 | INS-2718 | baseline-content-85 | compact-source-20 | extended-theme-81 | high | true | false | 102 | 3 | 3 |
| 1003 | INS-2722 | pilot-content-86 | composite-source-21 | integrated-theme-82 | low | false | true | 103 | 4 | 4 |

The `prevention_insights` table is the central repository for deliberation outcomes. Each insight carries a `content` string (`adaptive-content-83`, `distributed-content-84`, etc.), a `source_session` label (`regional-source-18` through `composite-source-21`), a `theme` matching the session vocabulary, a `quality_rating` (`low`, `medium`, `high`), and two boolean flags: `is_recurring` and `is_new_element`. Insights are linked to their originating `discussion_session_id`, to a `burglary_prevention_topic_id`, and to a `project_report_id`, forming a three-way association that ties raw deliberation output to both topical classification and formal reporting.

**Table `burglary_prevention_topics`**

| id | topic_identifier | topic_name | category | complexity_level | is_primary_focus | security_project_id |
|---|---|---|---|---|---|---|
| 1 | TOP-2690 | Regional Model | awareness | low | true | 1 |
| 2 | TOP-2696 | Seasonal Cluster D | practice_exchange | medium | false | 2 |
| 3 | TOP-2702 | Integrated Review | cooperation | high | true | 3 |
| 4 | TOP-2708 | Extended Initiative | policy | low | false | 4 |

The `burglary_prevention_topics` table defines the topical taxonomy used across the domain. Topics include `Regional Model`, `Seasonal Cluster D`, `Integrated Review`, and `Extended Initiative`, each classified under a `category` (`awareness`, `practice_exchange`, `cooperation`, `policy`), assigned a `complexity_level` (`low`, `medium`, `high`), and flagged as `is_primary_focus` (`true` or `false`). Every topic is scoped to a `security_project_id`, ensuring that topical coverage is project-specific.

**Table `security_projects`**

| id | project_identifier | project_name | start_date | end_date | funding_source | status | objectives |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2058 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | planning | integrated-objectiv-28 |
| 2 | PRO-2059 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | active | seasonal-objectiv-29 |
| 3 | PRO-2060 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | completed | regional-objectiv-30 |
| 4 | PRO-2061 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | terminated | legacy-objectiv-31 |

The `security_projects` table sits at the top of the project hierarchy. Although the table's own column definitions are not enumerated in the payload, every other entity in the schema references it through a `security_project_id` foreign key. Projects `1` through `4` serve as the organizational container for events, moderators, participants, topics, and reports, creating a clean multi-tenant partition across the entire dataset.

**Table `project_reports`**

| project_report_id | report_identifier | title | publication_date | status | word_count | contains_insights | world_caf_event_id | security_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | REP-2544 | Compact Initiative | 2025-12-01T23:33:00 | draft | 25 | true | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | REP-2545 | Legacy Model | 2022-05-12T06:50:00 | review | 425 | false | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | REP-2546 | Regional Cluster A | 2023-10-23T13:07:00 | published | 15 | true | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | REP-2547 | Seasonal Review | 2024-03-07T20:24:00 | archived | 40 | false | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `project_reports` table formalizes the output artifacts produced by each security project. Reports are linked to their parent `security_project_id` and serve as the target of the `project_report_id` foreign key in `prevention_insights`, thereby anchoring individual insights to a structured report. The `project_reports` table also participates in the `reports_insights` junction table, enabling a many-to-many relationship between reports and insights.

The base tables above define the core entity types. Their relationships are not all expressed through direct foreign keys; several are modelled as junction (association) tables that capture many-to-many cardinality. These junction tables are the structural glue that allows the schema to represent the rich, cross-cutting participation patterns inherent in World Café deliberation.

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

The `events_sessions` junction table links `world_caf_events` to `discussion_sessions`, allowing a single event to host multiple sessions and a session to be associated with multiple events (in cases of session reuse or rescheduling). This table materializes the event-to-session cardinality that the `world_caf_event_id` column in `discussion_sessions` alone cannot fully express when sessions are shared across events.

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

The `events_moderators` table connects events to moderators, enabling a moderator to serve at multiple events and an event to draw moderators from a pool. This is distinct from the `field_moderators.security_project_id` assignment, which is a static project-level relationship; `events_moderators` captures the dynamic, event-level assignment.

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

Similarly, `events_participants` links events to participants, supporting the many-to-many relationship between attendees and the events they attend. A participant such as `PAR-2722` (Theodore Mcgrath, `practitioner` at `Whirlpool Corporation`) may appear in multiple event records through this junction.

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

The `sessions_participants` table records which participants attended which discussion sessions. This is the fine-grained attendance record that, together with `events_sessions` and `events_participants`, allows reconstruction of the full participation graph: event → session → participant.

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

The `sessions_insights` junction table connects discussion sessions to prevention insights. While `prevention_insights.discussion_session_id` provides a direct link, `sessions_insights` enables a session to be associated with multiple insights and an insight to be attributed to multiple sessions, supporting the collaborative nature of World Café deliberation where insights emerge from group discussion.

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

The `moderators_sessions` table links moderators to the sessions they facilitate. This is a many-to-many relationship: a moderator like `MOD-2781` (Theodore Mcgrath, `lead_moderator` with `session_count` of `44`) may facilitate multiple sessions, and a session may have multiple co-moderators.

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

The `moderators_moderators` table is a self-referencing junction that captures relationships between moderators themselves—perhaps indicating co-facilitation pairs, mentorship relationships, or team assignments. This table enables the schema to model the social structure among facilitators.

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

The `participants_sessions` table is another many-to-many association between participants and sessions, complementing `sessions_participants`. The dual presence of both tables suggests a deliberate design choice to separate different facets of the participant-session relationship (e.g., attendance vs. contribution).

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

The `participants_insights` table links participants to the insights they contributed. This enables attribution of specific deliberation outcomes to individual contributors, supporting accountability and recognition within the World Café process.

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

The `insights_participants` table is the reciprocal of `participants_insights`, providing the reverse lookup from insight to contributing participants. The symmetry between these two junction tables ensures that the schema supports bidirectional traversal of the participant-insight relationship.

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

The `topics_sessions` junction table connects `burglary_prevention_topics` to `discussion_sessions`. A topic such as `TOP-2690` (`Regional Model`, category `awareness`, `is_primary_focus = true`) may be discussed across multiple sessions, and a session may cover multiple topics. This table decouples topic coverage from the single `burglary_prevention_topic_id` foreign key in `prevention_insights`.

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

The `topics_insights` table links topics to prevention insights, enabling an insight to be classified under multiple topics and a topic to accumulate insights from many sources. This supports the multi-label classification of deliberation outcomes.

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

The `projects_events` junction table connects security projects to World Café events. While `world_caf_events.security_project_id` provides a direct foreign key, `projects_events` enables a project to host multiple events and an event to be associated with multiple projects (e.g., in cross-project collaborations).

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

The `projects_moderators` table links security projects to moderators, supporting the many-to-many relationship between projects and their facilitator pools. This complements the `field_moderators.security_project_id` column, which assigns each moderator to a single project.

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

The `projects_participants` table connects security projects to participants, enabling a participant to be involved in multiple projects and a project to draw participants from a broad pool.

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

The `projects_topics` junction table links security projects to burglary prevention topics. A project such as project `1` may cover multiple topics (`TOP-2690`, `TOP-2696`, etc.), and a topic may be addressed across multiple projects.

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

The `projects_reports` table connects security projects to project reports, enabling a project to produce multiple reports and a report to be associated with multiple projects.

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

The `reports_insights` junction table links project reports to prevention insights. While `prevention_insights.project_report_id` provides a direct foreign key, `reports_insights` enables a report to contain multiple insights and an insight to be referenced by multiple reports.

The junction tables above complete the normalized schema. They transform what would otherwise be a set of rigid one-to-many relationships into a flexible graph of associations that accurately reflects the complex participation patterns of World Café deliberation. The next layer of the schema—the views—materializes these associations into denormalized result sets that answer specific analytical questions.

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

The view `v_world_caf_event_discussion_session_detail` joins `world_caf_events` with `discussion_sessions` to produce a session-level detail row for each event. Reading the row for event `EVE-2706` (`extended-location-99`, `planned`, `35` minutes, `100` participants), the view reveals that session `SES-2443` (`baseline-theme-79`, `table_number` `21`, `scheduled`) is hosted within this event. This view answers the question: "What discussion sessions belong to each World Café event, and what are their attributes?"

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

The view `v_world_caf_event_field_moderator_detail` joins `world_caf_events` with `field_moderators` to surface the moderators associated with each event. For event `EVE-2707` (`integrated-location-100`, `ongoing`, `27` participants), the view surfaces moderator `MOD-2788` (`Account Name`, `note_taker`, `busy`). This view answers: "Which moderators are assigned to each event, and what is their current availability?"

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

The view `v_world_caf_event_field_participant_detail` joins `world_caf_events` with `field_participants` to produce a participant-level detail row for each event. For event `EVE-2708` (`seasonal-location-101`, `completed`, `23` participants), the view surfaces participant `PAR-2728` (`Saipan International Airport`, `policy_maker`, `high` motivation, `Whirlpool Corporation`). This view answers: "Who attended each event, and what are their profiles?"

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

The view `v_world_caf_event_security_project` joins `world_caf_events` with `security_projects` to surface the project context for each event. Event `EVE-2709` (`regional-location-102`, `cancelled`, `34` participants) is linked to project `4`. This view answers: "Which security project sponsors each World Café event?"

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

The view `v_discussion_session_world_caf_event` joins `discussion_sessions` with `world_caf_events` to produce an event-level detail row for each session. Session `SES-2443` (`baseline-theme-79`, `table_number` `21`, `scheduled`) is shown within the context of event `EVE-2706` (`extended-location-99`, `planned`). This view answers the inverse of the previous view: "Which event hosts each discussion session?"

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

The view `v_discussion_session_field_moderator` joins `discussion_sessions` with `field_moderators` to surface the moderator responsible for each session. Session `SES-2449` (`pilot-theme-80`, `table_number` `31`, `active`) is facilitated by moderator `MOD-2788` (`Account Name`, `note_taker`). This view answers: "Who facilitates each discussion session?"

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

The view `v_discussion_session_field_participant_detail` joins `discussion_sessions` with `field_participants` to produce a participant-level detail row for each session. Session `SES-2455` (`extended-theme-81`, `table_number` `41`, `completed`) is attended by participant `PAR-2728` (`Saipan International Airport`, `policy_maker`). This view answers: "Which participants attended each discussion session?"

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

The view `v_discussion_session_prevention_insight_detail` joins `discussion_sessions` with `prevention_insights` to surface the insights generated by each session. Session `SES-2461` (`integrated-theme-82`, `table_number` `51`, `abruptly_stopped`) produced insight `INS-2722` (`pilot-content-86`, `quality_rating` `low`, `is_recurring = false`). This view answers: "What insights emerged from each discussion session?"

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

The view `v_discussion_session_discussion_session` is a self-join on `discussion_sessions` that surfaces session-to-session relationships. Session `SES-2443` (`baseline-theme-79`) is linked to session `SES-2443` (`baseline-theme-79`) via its `discussion_session_id` self-reference. This view answers: "Which sessions are chained or related to other sessions?"

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

The view `v_field_moderator_discussion_session_detail` joins `field_moderators` with `discussion_sessions` to produce a session-level detail row for each moderator. Moderator `MOD-2781` (`Theodore Mcgrath`, `lead_moderator`, `session_count` `44`) facilitates session `SES-2443` (`baseline-theme-79`, `table_number` `21`). This view answers: "Which sessions does each moderator facilitate?"

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

The view `v_field_moderator_security_project` joins `field_moderators` with `security_projects` to surface the project context for each moderator. Moderator `MOD-2788` (`Account Name`, `note_taker`, `busy`) is assigned to project `2`. This view answers: "Which security project is each moderator associated with?"

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

The view `v_field_moderator_field_moderator_detail` is a self-join on `field_moderators` that surfaces relationships between moderators. Moderator `MOD-2781` (`Theodore Mcgrath`) is linked to moderator `MOD-2781` (`Theodore Mcgrath`) via the `moderators_moderators` junction. This view answers: "Which moderators are related to other moderators?"

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

The view `v_field_participant_discussion_session_detail` joins `field_participants` with `discussion_sessions` to produce a session-level detail row for each participant. Participant `PAR-2722` (`Theodore Mcgrath`, `practitioner`, `low` motivation) attended session `SES-2443` (`baseline-theme-79`, `table_number` `21`). This view answers: "Which discussion sessions did each participant attend?"

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

The view `v_field_participant_prevention_insight_detail` joins `field_participants` with `prevention_insights` to surface the insights contributed by each participant. Participant `PAR-2725` (`Account Name`, `expert`, `medium` motivation) contributed to insight `INS-2714` (`distributed-content-84`, `quality_rating` `medium`, `is_new_element = true`). This view answers: "What insights did each participant contribute?"

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

The view `v_field_participant_security_project` joins `field_participants` with `security_projects` to surface the project context for each participant. Participant `PAR-2728` (`Saipan International Airport`, `policy_maker`, `high` motivation) is associated with project `3`. This view answers: "Which security project is each participant associated with?"

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

The view `v_prevention_insight_discussion_session` joins `prevention_insights` with `discussion_sessions` to produce a session-level detail row for each insight. Insight `INS-2710` (`adaptive-content-83`, `quality_rating` `low`, `is_recurring = true`) originated from session `SES-2443` (`baseline-theme-79`, `table_number` `21`). This view answers the inverse: "Which discussion session generated each insight?"

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

The view `v_prevention_insight_field_participant_detail` joins `prevention_insights` with `field_participants` to produce a participant-level detail row for each insight. Insight `INS-2714` (`distributed-content-84`, `quality_rating` `medium`) was contributed by participant `PAR-2725` (`Account Name`, `expert`). This view answers: "Which participant contributed each insight?"

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

The view `v_prevention_insight_burglary_prevention_topic` joins `prevention_insights` with `burglary_prevention_topics` to surface the topical classification of each insight. Insight `INS-2718` (`baseline-content-85`, `quality_rating` `high`, `is_recurring = true`) is classified under topic `TOP-2702` (`Integrated Review`, category `cooperation`, `complexity_level` `high`, `is_primary_focus = true`). This view answers: "Which topic does each insight address?"

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

The view `v_prevention_insight_project_report` joins `prevention_insights` with `project_reports` to surface the report context for each insight. Insight `INS-2722` (`pilot-content-86`, `quality_rating` `low`, `is_new_element = true`) is included in project report `4`. This view answers: "Which project report contains each insight?"

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

The view `v_burglary_prevention_topic_discussion_session_detail` joins `burglary_prevention_topics` with `discussion_sessions` to produce a session-level detail row for each topic. Topic `TOP-2690` (`Regional Model`, category `awareness`, `is_primary_focus = true`) is discussed in session `SES-2443` (`baseline-theme-79`, `table_number` `21`). This view answers: "Which discussion sessions address each topic?"

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

The view `v_burglary_prevention_topic_prevention_insight_detail` joins `burglary_prevention_topics` with `prevention_insights` to produce an insight-level detail row for each topic. Topic `TOP-2696` (`Seasonal Cluster D`, category `practice_exchange`, `complexity_level` `medium`) is addressed by insight `INS-2714` (`distributed-content-84`, `quality_rating` `medium`). This view answers: "Which insights address each topic?"

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

The view `v_burglary_prevention_topic_security_project` joins `burglary_prevention_topics` with `security_projects` to surface the project context for each topic. Topic `TOP-2702` (`Integrated Review`, category `cooperation`, `is_primary_focus = true`) is scoped to project `3`. This view answers: "Which security project covers each topic?"

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

The view `v_security_project_world_caf_event_detail` joins `security_projects` with `world_caf_events` to produce an event-level detail row for each project. Project `1` hosts event `EVE-2706` (`extended-location-99`, `planned`, `35` minutes, `100` participants). This view answers: "Which World Café events does each security project host?"

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

The view `v_security_project_field_moderator_detail` joins `security_projects` with `field_moderators` to produce a moderator-level detail row for each project. Project `2` includes moderator `MOD-2788` (`Account Name`, `note_taker`, `busy`). This view answers: "Which moderators are associated with each security project?"

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

The view `v_security_project_field_participant_detail` joins `security_projects` with `field_participants` to produce a participant-level detail row for each project. Project `3` includes participant `PAR-2728` (`Saipan International Airport`, `policy_maker`, `high` motivation). This view answers: "Which participants are associated with each security project?"

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

The view `v_security_project_burglary_prevention_topic_detail` joins `security_projects` with `burglary_prevention_topics` to produce a topic-level detail row for each project. Project `4` covers topic `TOP-2708` (`Extended Initiative`, category `policy`, `complexity_level` `low`, `is_primary_focus = false`). This view answers: "Which topics does each security project cover?"

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

The view `v_security_project_project_report_detail` joins `security_projects` with `project_reports` to produce a report-level detail row for each project. Project `1` produces project report `1`. This view answers: "Which project reports does each security project produce?"

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

The view `v_project_report_world_caf_event` joins `project_reports` with `world_caf_events` to produce an event-level detail row for each report. Project report `1` is associated with event `EVE-2706` (`extended-location-99`, `planned`). This view answers: "Which World Café events are covered by each project report?"

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

The view `v_project_report_prevention_insight_detail` joins `project_reports` with `prevention_insights` to produce an insight-level detail row for each report. Project report `2` includes insight `INS-2714` (`distributed-content-84`, `quality_rating` `medium`, `is_new_element = true`). This view answers: "Which insights are included in each project report?"

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

The view `v_project_report_security_project` joins `project_reports` with `security_projects` to surface the project context for each report. Project report `3` is produced by project `3`. This view answers: "Which security project produced each project report?"

The schema as a whole models a multi-layered deliberation ecosystem. At its core are security projects, which serve as the organizational container for all other entities. Within each project, World Café events are scheduled gatherings that host discussion sessions. Sessions are facilitated by field moderators and attended by field participants, generating prevention insights that are classified under burglary prevention topics and consolidated into project reports. The junction tables (`events_sessions`, `events_moderators`, `events_participants`, `sessions_participants`, `sessions_insights`, `moderators_sessions`, `moderators_moderators`, `participants_sessions`, `participants_insights`, `insights_participants`, `topics_sessions`, `topics_insights`, `projects_events`, `projects_moderators`, `projects_participants`, `projects_topics`, `projects_reports`, `reports_insights`) provide the many-to-many relationships that the direct foreign keys cannot express alone. The thirty views materialize these normalized relationships into denormalized result sets, each answering a specific analytical question by joining two or more base tables. Together, the tables and views form a complete relational model of the World Café burglary prevention domain, supporting both operational queries (e.g., "Which sessions are scheduled for event `EVE-2706`?") and analytical queries (e.g., "Which insights of `high` quality were generated by sessions in project `3`?").