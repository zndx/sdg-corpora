## Webinar Session Management in Meteorological Outreach

Meteorological outreach programs rely on structured webinar sessions to disseminate weather science, hazard preparedness, and climate research to diverse audiences. Each session is a discrete event with a lifecycle that spans planning, registration, delivery, and archival. The system records every session with a unique identifier such as `SES-2443` or `SES-2449`, a scheduled start and end time, a registration deadline, capacity limits, and a status that tracks whether the session is `scheduled`, `in_progress`, `completed`, or `cancelled`. Sessions are conducted in either `English` or `Español`, and each one is anchored to a geographic region, assigned to a meteorologist, paired with a video recording, and provided with a registration link. The following sections describe the data model that supports this workflow, the relationships between entities, and the analytical views that practitioners use to monitor and report on outreach activities.

**Table `webinar_sessions`**

| webinar_session_id | session_identifier | scheduled_start_date_time | scheduled_end_date_time | registration_deadline | max_participants | current_registrations | status | language | geographic_region_id | meteorologist_id | video_recording_id | registration_link_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | 2024-11-24T22:18:00 | 2023-02-05T13:15:00 | 22 | 18 | scheduled | English | 1000 | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SES-2449 | 2022-05-12T18:02:00 | 2025-04-08T05:35:00 | 2024-07-16T20:32:00 | 25 | 25 | in_progress | Español | 1001 | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SES-2455 | 2023-10-23T01:19:00 | 2022-09-19T12:52:00 | 2025-12-27T03:49:00 | 28 | 32 | completed | English | 1002 | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SES-2461 | 2024-03-07T08:36:00 | 2023-02-03T19:09:00 | 2022-05-11T10:06:00 | 31 | 39 | cancelled | Español | 1003 | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `webinar_sessions` table is the central record of the outreach pipeline. Every row captures the full administrative envelope of a single session. The `session_identifier` column provides a human-readable code—`SES-2443` through `SES-2461` in the current dataset—while `scheduled_start_date_time` and `scheduled_end_date_time` define the event window. The `registration_deadline` marks the cutoff after which no new registrants are accepted. Capacity is controlled by `max_participants`, and `current_registrations` tracks how many seats are filled; in session `SES-2455`, for example, the system records 32 registrations against a maximum of 28, indicating an over-capacity state. The `status` column progresses through four states: `scheduled` for upcoming events, `in_progress` for sessions currently running, `completed` for finished presentations, and `cancelled` for events that were called off. The `language` field distinguishes between `English` and `Español` sessions. Finally, four foreign-key columns—`geographic_region_id`, `meteorologist_id`, `video_recording_id`, and `registration_link_id`—tie each session to its supporting resources.

**Table `grade_levels`**

| grade_identifier | grade_number | description | webinar_session_id |
|---|---|---|---|
| GRA-2642 | 29 | Extended Survey | 1 |
| GRA-2643 | 33 | Pilot Corridor A | 2 |
| GRA-2644 | 37 | Baseline Series | 3 |
| GRA-2645 | 41 | Distributed Assessment | 4 |

The `grade_levels` table defines the educational tiers that each webinar targets. Each row carries a `grade_identifier` such as `GRA-2642`, a numeric `grade_number`, a descriptive label like `Extended Survey` or `Pilot Corridor A`, and a reference back to the `webinar_session_id` it serves. The descriptions are programmatic designations rather than traditional school grades; they encode the scope and methodology of the outreach content. Session `SES-2443` is paired with `GRA-2642` (grade number 29, described as `Extended Survey`), while session `SES-2449` uses `GRA-2643` (grade number 33, `Pilot Corridor A`). The `sessions_levels` table provides an additional layer of classification that maps sessions to their corresponding educational tier, enabling multi-dimensional filtering by both grade and level attributes.

**Table `geographic_regions`**

| id | region_identifier | region_name | region_type | hurricane_vulnerability | webinar_session_id |
|---|---|---|---|---|---|
| 1000 | REG-2093 | Distributed Assessment | Country | false | 1 |
| 1001 | REG-2100 | Adaptive Survey D | State | true | 2 |
| 1002 | REG-2107 | Primary Corridor | Territory | false | 3 |
| 1003 | REG-2114 | Composite Series | CoastalZone | true | 4 |

Geographic context is essential for meteorological outreach because weather patterns, hazard profiles, and audience needs vary by region. The `geographic_regions` table stores each region's `id`, `region_identifier` (e.g., `REG-2093`), `region_name`, `region_type` (such as `Country`, `State`, `Territory`, or `CoastalZone`), and a `hurricane_vulnerability` boolean flag. Region `REG-2093` covers a `Country`-level area named `Distributed Assessment` with no hurricane vulnerability, while `REG-2100` represents a `State`-level region called `Adaptive Survey D` that is flagged as hurricane-vulnerable. The `region_type` column distinguishes administrative boundaries from environmental zones, and the vulnerability flag is critical for prioritizing outreach in high-risk areas. Each region row also includes a `webinar_session_id` to indicate which session addresses that geography.

**Table `meteorologists`**

| meteorologist_id | meteorologist_identifier | full_name | specialization | affiliation | webinar_session_id |
|---|---|---|---|---|---|
| 1000 | MET-2794 | Theodore Mcgrath | HurricaneScience | baseline-affiliat-55 | 1 |
| 1001 | MET-2797 | Account Name | WeatherHazards | pilot-affiliat-56 | 2 |
| 1002 | MET-2800 | Saipan International Airport | DataCollection | extended-affiliat-57 | 3 |
| 1003 | MET-2803 | Norma Fisher | HurricaneScience | integrated-affiliat-58 | 4 |

The `meteorologists` table catalogs the subject-matter experts who lead or contribute to webinar sessions. Each entry includes a `meteorologist_id`, a `meteorologist_identifier` such as `MET-2794`, a `full_name`, a `specialization` (e.g., `HurricaneScience`, `WeatherHazards`, `DataCollection`), an `affiliation` code like `baseline-affiliat-55`, and a `webinar_session_id` linking the expert to their assigned session. Theodore Mcgrath (`MET-2794`), specializing in `HurricaneScience` and affiliated with `baseline-affiliat-55`, is assigned to session `SES-2443`. Account Name (`MET-2797`), a `WeatherHazards` specialist from `pilot-affiliat-56`, leads session `SES-2449`. The specialization field enables practitioners to filter sessions by expertise area, while the affiliation code connects the meteorologist to their institutional home.

**Table `video_recordings`**

| id | recording_identifier | hosting_platform | access_url | publish_date | duration_seconds | webinar_session_id |
|---|---|---|---|---|---|---|
| 1 | REC-2192 | YouTube | https://ecocyc.org/gene?orgid=ECOLI&id=G6140 | 2023-06-06 | 31 | 1 |
| 2 | REC-2198 | WebinarPlatform | https://www.nature.com/articles/nphys3742 | 2024-11-17 | 37 | 2 |
| 3 | REC-2204 | YouTube | https://www.fi.ee/en/supervised-entities | 2025-04-01 | 43 | 3 |
| 4 | REC-2210 | WebinarPlatform | http://www.altmeyerlewisbrewing.com | 2022-09-12 | 49 | 4 |

Every webinar session may have an associated video recording, stored in the `video_recordings` table. Each recording has an `id`, a `recording_identifier` (e.g., `REC-2192`), a `hosting_platform` such as `YouTube` or `WebinarPlatform`, an `access_url` pointing to the hosted video, a `publish_date`, a `duration_seconds` value, and a `webinar_session_id`. Recording `REC-2192` for session `SES-2443` is hosted on `YouTube`, has a duration of 31 seconds, and was published on `2023-06-06`. Recording `REC-2210` for session `SES-2461` uses the `WebinarPlatform`, runs for 49 seconds, and was published on `2022-09-12`. The `access_url` provides the direct link for post-session viewing, and the `duration_seconds` metric supports content analytics and scheduling reviews.

**Table `registration_links`**

| id | link_identifier | url | expiration_date | webinar_session_id |
|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | https://www.nature.com/articles/nphoton.2017.123 | 2025-08-18T19:45:00 | 1 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 2022-01-02T02:02:00 | 2 |
| 3 | http://hdl.handle.net/10419/142700 | https://www.deshaw.com/recruit/UnivListing.html | 2023-06-13T09:19:00 | 3 |
| 4 | https://www.nature.com/articles/nphys3742 | https://www.nature.com/articles/nphoton.2015.276 | 2024-11-24T16:36:00 | 4 |

The `registration_links` table manages the web addresses through which participants enroll in sessions. Each row contains an `id`, a `link_identifier` (which in this dataset stores the primary registration URL), a secondary `url` field, an `expiration_date` for the link, and a `webinar_session_id`. For session `SES-2443`, the registration link identifier is `https://www.robertchristgau.com/get_album.php?id=4445`, with an expiration set to `2025-08-18T19:45:00`. Session `SES-2449` uses `https://bugs.launchpad.net/murano/+bug/1287690` as its link identifier, expiring on `2022-01-02T02:02:00`. The `expiration_date` ensures that registration links are deactivated after the deadline, preventing late enrollments.

### Analytical Views for Session Oversight

The system provides a suite of views that join `webinar_sessions` with its related tables, enabling practitioners to answer operational questions without writing ad-hoc queries. Each view isolates a specific dimension of the session record and presents the joined data in a flat, reportable format.

**View `v_webinar_session_grade_level_detail`**

```sql
CREATE VIEW v_webinar_session_grade_level_detail AS
SELECT a.webinar_session_id, a.session_identifier, a.scheduled_start_date_time, b.grade_identifier AS level_grade_identifier, b.grade_number AS level_grade_number, b.description AS level_description
FROM webinar_sessions a
  JOIN sessions_levels j ON j.webinar_session_id = a.webinar_session_id
  JOIN grade_levels b ON b.grade_number = j.grade_level_grade_number;
```

| webinar_session_id | session_identifier | scheduled_start_date_time | level_grade_identifier | level_grade_number | level_description |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | GRA-2642 | 29 | Extended Survey |
| 1 | SES-2443 | 2025-12-01T11:45:00 | GRA-2643 | 33 | Pilot Corridor A |
| 2 | SES-2449 | 2022-05-12T18:02:00 | GRA-2643 | 33 | Pilot Corridor A |
| 2 | SES-2449 | 2022-05-12T18:02:00 | GRA-2644 | 37 | Baseline Series |
| 3 | SES-2455 | 2023-10-23T01:19:00 | GRA-2644 | 37 | Baseline Series |
| 3 | SES-2455 | 2023-10-23T01:19:00 | GRA-2645 | 41 | Distributed Assessment |
| 4 | SES-2461 | 2024-03-07T08:36:00 | GRA-2645 | 41 | Distributed Assessment |
| 4 | SES-2461 | 2024-03-07T08:36:00 | GRA-2642 | 29 | Extended Survey |

The `v_webinar_session_grade_level_detail` view joins `webinar_sessions` with `grade_levels` to answer the question: which educational tier does each session target, and what are the session's administrative details? Reading session `SES-2443` through this view, one sees the session's scheduled start time (`2025-12-01T11:45:00`), its `scheduled` status, its `English` language setting, and the grade-level description `Extended Survey` (grade number 29). Session `SES-2455` appears with its `completed` status, `English` language, and the grade-level description `Baseline Series` (grade number 37). This view is the primary tool for program managers who need to verify that each session is correctly mapped to its intended audience tier.

**View `v_webinar_session_geographic_region`**

```sql
CREATE VIEW v_webinar_session_geographic_region AS
SELECT a.webinar_session_id, a.session_identifier, a.scheduled_start_date_time, a.scheduled_end_date_time, b.id AS region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM webinar_sessions a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| webinar_session_id | session_identifier | scheduled_start_date_time | scheduled_end_date_time | region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | 2024-11-24T22:18:00 | 1000 | REG-2093 | Distributed Assessment |
| 2 | SES-2449 | 2022-05-12T18:02:00 | 2025-04-08T05:35:00 | 1001 | REG-2100 | Adaptive Survey D |
| 3 | SES-2455 | 2023-10-23T01:19:00 | 2022-09-19T12:52:00 | 1002 | REG-2107 | Primary Corridor |
| 4 | SES-2461 | 2024-03-07T08:36:00 | 2023-02-03T19:09:00 | 1003 | REG-2114 | Composite Series |

The `v_webinar_session_geographic_region` view pairs each session with its geographic context, answering: where is this session focused, and what is the region's hazard profile? For session `SES-2443`, the view shows region `REG-2093` (`Distributed Assessment`, type `Country`, hurricane vulnerability `false`). Session `SES-2449` is linked to region `REG-2100` (`Adaptive Survey D`, type `State`, hurricane vulnerability `true`), flagging it as a high-priority outreach area. The `region_type` and `hurricane_vulnerability` columns enable filtering for sessions that target vulnerable coastal or hurricane-prone jurisdictions.

**View `v_webinar_session_meteorologist`**

```sql
CREATE VIEW v_webinar_session_meteorologist AS
SELECT a.webinar_session_id, a.session_identifier, a.scheduled_start_date_time, a.scheduled_end_date_time, b.meteorologist_id AS meteorologist_meteorologist_id, b.meteorologist_identifier AS meteorologist_meteorologist_identifier, b.full_name AS meteorologist_full_name
FROM webinar_sessions a JOIN meteorologists b ON a.meteorologist_id = b.meteorologist_id;
```

| webinar_session_id | session_identifier | scheduled_start_date_time | scheduled_end_date_time | meteorologist_meteorologist_id | meteorologist_meteorologist_identifier | meteorologist_full_name |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | 2024-11-24T22:18:00 | 1000 | MET-2794 | Theodore Mcgrath |
| 2 | SES-2449 | 2022-05-12T18:02:00 | 2025-04-08T05:35:00 | 1001 | MET-2797 | Account Name |
| 3 | SES-2455 | 2023-10-23T01:19:00 | 2022-09-19T12:52:00 | 1002 | MET-2800 | Saipan International Airport |
| 4 | SES-2461 | 2024-03-07T08:36:00 | 2023-02-03T19:09:00 | 1003 | MET-2803 | Norma Fisher |

The `v_webinar_session_meteorologist` view connects sessions to their assigned experts, answering: who is leading this session, and what is their area of specialization? Session `SES-2443` shows meteorologist `MET-2794` (Theodore Mcgrath, `HurricaneScience`, `baseline-affiliat-55`). Session `SES-2461` shows meteorologist `MET-2803` (Norma Fisher, `HurricaneScience`, `integrated-affiliat-58`). This view supports workload balancing across specialists and helps coordinators assign sessions based on expertise alignment.

**View `v_webinar_session_video_recording`**

```sql
CREATE VIEW v_webinar_session_video_recording AS
SELECT a.webinar_session_id, a.session_identifier, a.scheduled_start_date_time, a.scheduled_end_date_time, b.id AS recording_id, b.recording_identifier AS recording_recording_identifier, b.hosting_platform AS recording_hosting_platform
FROM webinar_sessions a JOIN video_recordings b ON a.video_recording_id = b.id;
```

| webinar_session_id | session_identifier | scheduled_start_date_time | scheduled_end_date_time | recording_id | recording_recording_identifier | recording_hosting_platform |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | 2024-11-24T22:18:00 | 1 | REC-2192 | YouTube |
| 2 | SES-2449 | 2022-05-12T18:02:00 | 2025-04-08T05:35:00 | 2 | REC-2198 | WebinarPlatform |
| 3 | SES-2455 | 2023-10-23T01:19:00 | 2022-09-19T12:52:00 | 3 | REC-2204 | YouTube |
| 4 | SES-2461 | 2024-03-07T08:36:00 | 2023-02-03T19:09:00 | 4 | REC-2210 | WebinarPlatform |

The `v_webinar_session_video_recording` view links sessions to their archived recordings, answering: is there a recording available, on which platform, and how long is it? Session `SES-2443` has recording `REC-2192` on `YouTube` with a duration of 31 seconds, published on `2023-06-06`. Session `SES-2461` has recording `REC-2210` on `WebinarPlatform` with a duration of 49 seconds, published on `2022-09-12`. The view is essential for content teams auditing the completeness of the archival pipeline and for researchers retrieving session recordings by platform or duration.

**View `v_webinar_session_registration_link`**

```sql
CREATE VIEW v_webinar_session_registration_link AS
SELECT a.webinar_session_id, a.session_identifier, a.scheduled_start_date_time, a.scheduled_end_date_time, b.id AS link_id, b.link_identifier AS link_link_identifier, b.url AS link_url
FROM webinar_sessions a JOIN registration_links b ON a.registration_link_id = b.id;
```

| webinar_session_id | session_identifier | scheduled_start_date_time | scheduled_end_date_time | link_id | link_link_identifier | link_url |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2025-12-01T11:45:00 | 2024-11-24T22:18:00 | 1 | https://www.robertchristgau.com/get_album.php?id=4445 | https://www.nature.com/articles/nphoton.2017.123 |
| 2 | SES-2449 | 2022-05-12T18:02:00 | 2025-04-08T05:35:00 | 2 | https://bugs.launchpad.net/murano/+bug/1287690 | http://www.mdpi.com/2073-445X/8/3/43/pdf |
| 3 | SES-2455 | 2023-10-23T01:19:00 | 2022-09-19T12:52:00 | 3 | http://hdl.handle.net/10419/142700 | https://www.deshaw.com/recruit/UnivListing.html |
| 4 | SES-2461 | 2024-03-07T08:36:00 | 2023-02-03T19:09:00 | 4 | https://www.nature.com/articles/nphys3742 | https://www.nature.com/articles/nphoton.2015.276 |

The `v_webinar_session_registration_link` view associates sessions with their registration URLs, answering: where do participants register, and when does the link expire? Session `SES-2443` has its registration link identifier `https://www.robertchristgau.com/get_album.php?id=4445` with an expiration of `2025-08-18T19:45:00`. Session `SES-2449` uses `https://bugs.launchpad.net/murano/+bug/1287690`, expiring on `2022-01-02T02:02:00`. This view is used by registration coordinators to verify that links are active and to audit expiration dates against session deadlines.

**View `v_grade_level_webinar_session`**

```sql
CREATE VIEW v_grade_level_webinar_session AS
SELECT a.grade_identifier, a.grade_number, a.description, b.webinar_session_id AS session_webinar_session_id, b.session_identifier AS session_session_identifier, b.scheduled_start_date_time AS session_scheduled_start_date_time
FROM grade_levels a JOIN webinar_sessions b ON a.webinar_session_id = b.webinar_session_id;
```

| grade_identifier | grade_number | description | session_webinar_session_id | session_session_identifier | session_scheduled_start_date_time |
|---|---|---|---|---|---|
| GRA-2642 | 29 | Extended Survey | 1 | SES-2443 | 2025-12-01T11:45:00 |
| GRA-2643 | 33 | Pilot Corridor A | 2 | SES-2449 | 2022-05-12T18:02:00 |
| GRA-2644 | 37 | Baseline Series | 3 | SES-2455 | 2023-10-23T01:19:00 |
| GRA-2645 | 41 | Distributed Assessment | 4 | SES-2461 | 2024-03-07T08:36:00 |

The `v_grade_level_webinar_session` view presents the relationship from the grade-level side, answering: which sessions are associated with each educational tier? This reverse-index is useful for program planners who need to see all sessions targeting a particular grade level or description. For example, the `Extended Survey` tier (grade number 29) is associated with session `SES-2443`, while the `Distributed Assessment` tier (grade number 41) corresponds to session `SES-2461`. The view supports capacity planning by revealing how many sessions are allocated to each educational category.

**View `v_geographic_region_webinar_session`**

```sql
CREATE VIEW v_geographic_region_webinar_session AS
SELECT a.id, a.region_identifier, a.region_name, a.region_type, b.webinar_session_id AS session_webinar_session_id, b.session_identifier AS session_session_identifier, b.scheduled_start_date_time AS session_scheduled_start_date_time
FROM geographic_regions a JOIN webinar_sessions b ON a.webinar_session_id = b.webinar_session_id;
```

| id | region_identifier | region_name | region_type | session_webinar_session_id | session_session_identifier | session_scheduled_start_date_time |
|---|---|---|---|---|---|---|
| 1000 | REG-2093 | Distributed Assessment | Country | 1 | SES-2443 | 2025-12-01T11:45:00 |
| 1001 | REG-2100 | Adaptive Survey D | State | 2 | SES-2449 | 2022-05-12T18:02:00 |
| 1002 | REG-2107 | Primary Corridor | Territory | 3 | SES-2455 | 2023-10-23T01:19:00 |
| 1003 | REG-2114 | Composite Series | CoastalZone | 4 | SES-2461 | 2024-03-07T08:36:00 |

The `v_geographic_region_webinar_session` view presents the relationship from the geographic-region side, answering: which sessions address each region? This reverse-index helps regional coordinators identify all outreach activities in their jurisdiction. Region `REG-2093` (`Distributed Assessment`, `Country` type) is linked to session `SES-2443`, while region `REG-2114` (`Composite Series`, `CoastalZone` type, hurricane-vulnerable) is linked to session `SES-2461`. The view is particularly valuable for hurricane-vulnerable regions, where multiple sessions may need to be coordinated within a single season.

**View `v_meteorologist_webinar_session`**

```sql
CREATE VIEW v_meteorologist_webinar_session AS
SELECT a.meteorologist_id, a.meteorologist_identifier, a.full_name, a.specialization, b.webinar_session_id AS session_webinar_session_id, b.session_identifier AS session_session_identifier, b.scheduled_start_date_time AS session_scheduled_start_date_time
FROM meteorologists a JOIN webinar_sessions b ON a.webinar_session_id = b.webinar_session_id;
```

| meteorologist_id | meteorologist_identifier | full_name | specialization | session_webinar_session_id | session_session_identifier | session_scheduled_start_date_time |
|---|---|---|---|---|---|---|
| 1000 | MET-2794 | Theodore Mcgrath | HurricaneScience | 1 | SES-2443 | 2025-12-01T11:45:00 |
| 1001 | MET-2797 | Account Name | WeatherHazards | 2 | SES-2449 | 2022-05-12T18:02:00 |
| 1002 | MET-2800 | Saipan International Airport | DataCollection | 3 | SES-2455 | 2023-10-23T01:19:00 |
| 1003 | MET-2803 | Norma Fisher | HurricaneScience | 4 | SES-2461 | 2024-03-07T08:36:00 |

The `v_meteorologist_webinar_session` view presents the relationship from the meteorologist side, answering: which sessions is each expert assigned to? This reverse-index supports workload tracking and scheduling. Theodore Mcgrath (`MET-2794`, `HurricaneScience`) is assigned to session `SES-2443`, while Norma Fisher (`MET-2803`, `HurricaneScience`) is assigned to session `SES-2461`. The view enables coordinators to identify experts who may be over-allocated or to match upcoming sessions with available specialists.

**View `v_video_recording_webinar_session`**

```sql
CREATE VIEW v_video_recording_webinar_session AS
SELECT a.id, a.recording_identifier, a.hosting_platform, a.access_url, b.webinar_session_id AS session_webinar_session_id, b.session_identifier AS session_session_identifier, b.scheduled_start_date_time AS session_scheduled_start_date_time
FROM video_recordings a JOIN webinar_sessions b ON a.webinar_session_id = b.webinar_session_id;
```

| id | recording_identifier | hosting_platform | access_url | session_webinar_session_id | session_session_identifier | session_scheduled_start_date_time |
|---|---|---|---|---|---|---|
| 1 | REC-2192 | YouTube | https://ecocyc.org/gene?orgid=ECOLI&id=G6140 | 1 | SES-2443 | 2025-12-01T11:45:00 |
| 2 | REC-2198 | WebinarPlatform | https://www.nature.com/articles/nphys3742 | 2 | SES-2449 | 2022-05-12T18:02:00 |
| 3 | REC-2204 | YouTube | https://www.fi.ee/en/supervised-entities | 3 | SES-2455 | 2023-10-23T01:19:00 |
| 4 | REC-2210 | WebinarPlatform | http://www.altmeyerlewisbrewing.com | 4 | SES-2461 | 2024-03-07T08:36:00 |

The `v_video_recording_webinar_session` view presents the relationship from the recording side, answering: which session does each recording belong to, and what are its hosting details? Recording `REC-2192` (hosted on `YouTube`, 31 seconds) belongs to session `SES-2443`, while recording `REC-2210` (hosted on `WebinarPlatform`, 49 seconds) belongs to session `SES-2461`. This view is used by the content team to audit recording completeness and to verify that every session has an associated archival entry.

**View `v_registration_link_webinar_session`**

```sql
CREATE VIEW v_registration_link_webinar_session AS
SELECT a.id, a.link_identifier, a.url, a.expiration_date, b.webinar_session_id AS session_webinar_session_id, b.session_identifier AS session_session_identifier, b.scheduled_start_date_time AS session_scheduled_start_date_time
FROM registration_links a JOIN webinar_sessions b ON a.webinar_session_id = b.webinar_session_id;
```

| id | link_identifier | url | expiration_date | session_webinar_session_id | session_session_identifier | session_scheduled_start_date_time |
|---|---|---|---|---|---|---|
| 1 | https://www.robertchristgau.com/get_album.php?id=4445 | https://www.nature.com/articles/nphoton.2017.123 | 2025-08-18T19:45:00 | 1 | SES-2443 | 2025-12-01T11:45:00 |
| 2 | https://bugs.launchpad.net/murano/+bug/1287690 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 2022-01-02T02:02:00 | 2 | SES-2449 | 2022-05-12T18:02:00 |
| 3 | http://hdl.handle.net/10419/142700 | https://www.deshaw.com/recruit/UnivListing.html | 2023-06-13T09:19:00 | 3 | SES-2455 | 2023-10-23T01:19:00 |
| 4 | https://www.nature.com/articles/nphys3742 | https://www.nature.com/articles/nphoton.2015.276 | 2024-11-24T16:36:00 | 4 | SES-2461 | 2024-03-07T08:36:00 |

The `v_registration_link_webinar_session` view presents the relationship from the registration-link side, answering: which session does each link serve, and when does it expire? Link `https://www.robertchristgau.com/get_album.php?id=4445` serves session `SES-2443` and expires on `2025-08-18T19:45:00`. Link `https://bugs.launchpad.net/murano/+bug/1287690` serves session `SES-2449` and expires on `2022-01-02T02:02:00`. This view is critical for the registration team to monitor link validity and to ensure that expired links are replaced before their associated sessions begin.

### Synthesis

The webinar session management system organizes outreach into a coherent data model where each session is a hub connecting educational tier, geographic region, subject-matter expert, video archive, and registration mechanism. The base tables—`webinar_sessions`, `grade_levels`, `geographic_regions`, `meteorologists`, `video_recordings`, `registration_links`, and `sessions_levels`—store the raw records, while the analytical views provide ready-made joins that answer the operational questions practitioners encounter daily. Session `SES-2443` illustrates a fully assembled record: an English-language, scheduled session targeting the Extended Survey grade level in a non-hurricane-vulnerable country, led by a HurricaneScience specialist, with a YouTube recording and an active registration link. Session `SES-2449` demonstrates a parallel configuration in Español, assigned to a hurricane-vulnerable state region, with a WeatherHazards specialist and a WebinarPlatform recording. Together, the tables and views form a complete operational picture, enabling coordinators to plan, execute, and audit meteorological outreach with precision.

## Data appendix

**Table `sessions_levels`**

| webinar_session_id | grade_level_grade_number |
|---|---|
| 1 | 29 |
| 1 | 33 |
| 2 | 33 |
| 2 | 37 |
| 3 | 37 |
| 3 | 41 |
| 4 | 41 |
| 4 | 29 |
