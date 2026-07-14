## The Architecture of Media Records

The modern media landscape is built upon a complex web of interconnected entities: journalists who report, organizations that publish, programs that broadcast, and historical events that anchor the news cycle. Understanding how these entities relate requires examining the structured records that capture their identities, attributes, and associations. This chapter documents the core data model used to track journalists, news organizations, broadcast programs, historical events, and media personalities, along with the joined views that reveal their operational relationships. Each record carries identifiers, temporal markers, and categorical flags that together form a complete picture of the media ecosystem.

**Table `journalists`**

| journalist_id | callsign | birth_date | death_date | birth_place | education_institution | primary_employer | is_retired | news_organization_id | historical_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-callsign-16 | 2023-10-18 | 2022-01-12 | baseline-birth-61 | baseline-educatio-25 | Ontrak Inc. | false | 100 | 1 |
| 2 | seasonal-callsign-17 | 2024-03-02 | 2023-06-23 | pilot-birth-62 | pilot-educatio-26 | Grant Type | true | 101 | 2 |
| 3 | regional-callsign-18 | 2025-08-13 | 2024-11-07 | extended-birth-63 | extended-educatio-27 | ABIOMED Inc | false | 102 | 3 |
| 4 | legacy-callsign-19 | 2022-01-24 | 2025-04-18 | integrated-birth-64 | integrated-educatio-28 | The College-Ready Promise | true | 103 | 4 |

The journalists table serves as the central registry of reporting personnel. Each entry carries a unique `journalist_id`, a `callsign` used for on-air or byline identification, and biographical fields including `birth_date`, `death_date`, and `birth_place`. The `education_institution` field records where the journalist trained, while `primary_employer` links them to an organization. Boolean flags such as `is_retired` indicate career status, and the foreign keys `news_organization_id` and `historical_event_id` anchor the journalist to specific organizational and event contexts. Consider journalist 1, who holds the callsign `integrated-callsign-16`, was born on 2023-10-18, and is associated with Ontrak Inc. under news organization 100. Journalist 4, `legacy-callsign-19`, is marked as retired and is tied to The College-Ready Promise under organization 103. The presence of `death_date` values alongside `birth_date` values indicates that the registry tracks both living and deceased journalists, with dates such as 2022-01-12 and 2025-04-18 providing temporal anchors for their lifespans.

**Table `news_organizations`**

| id | organization_name | founding_year | headquarters_location | organization_type | is_defunct | broadcast_program_id |
|---|---|---|---|---|---|---|
| 100 | Staples Inc. | 43 | composite-headquar-63 | wire_service | false | 100 |
| 101 | Oscar Health Inc. | 48 | primary-headquar-64 | television_network | true | 101 |
| 102 | Atlantic Richfield | 53 | adaptive-headquar-65 | radio_station | false | 102 |
| 103 | Port Loko | 58 | distributed-headquar-66 | wire_service | true | 103 |

News organizations form the institutional backbone of the media model. The `news_organizations` table records each entity by its `id`, `organization_name`, `founding_year`, and `headquarters_location`. The `organization_type` field classifies the entity as a `wire_service`, `television_network`, or `radio_station`, while `is_defunct` flags whether the organization has ceased operations. Each organization also carries a `broadcast_program_id` that links it to a specific program. Staples Inc. (id 100), founded in year 43 and headquartered at `composite-headquar-63`, operates as a wire service and remains active. In contrast, Oscar Health Inc. (id 101), founded in year 48 at `primary-headquar-64`, is classified as a television network and is marked as defunct. Atlantic Richfield (id 102) and Port Loko (id 103) round out the registry, with the latter being a defunct wire service headquartered at `distributed-headquar-66`.

**Table `broadcast_programs`**

| broadcast_program_id | program_title | broadcast_date | network | duration_minutes | is_documentary | director_name | premiere_venue | news_organization_id | journalist_id | historical_event_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Legacy Review D | 2024-03-21T14:06:00 | primary-network-40 | 35 | true | Primary Standard A | primary-premiere-52 | 100 | 1 | 1 |
| 101 | Regional Initiative | 2025-08-05T21:23:00 | adaptive-network-41 | 38 | false | Composite Framework | adaptive-premiere-53 | 101 | 2 | 2 |
| 102 | Seasonal Model | 2022-01-16T04:40:00 | distributed-network-42 | 41 | true | Compact Protocol | distributed-premiere-54 | 102 | 3 | 3 |
| 103 | Integrated Cluster A | 2023-06-27T11:57:00 | baseline-network-43 | 44 | false | Legacy Programme D | baseline-premiere-55 | 103 | 4 | 4 |

Broadcast programs represent the produced content that connects journalists, organizations, and events. The `broadcast_programs` table captures each program with a `broadcast_program_id`, `program_title`, `broadcast_date`, `network`, `duration_minutes`, and `is_documentary` flag. Additional fields include `director_name` and `premiere_venue`, while foreign keys `news_organization_id`, `journalist_id`, and `historical_event_id` tie the program to its producing organization, its associated journalist, and the event it covers. Legacy Review D (id 100), broadcast on 2024-03-21 across `primary-network-40` for 35 minutes, is a documentary directed by Primary Standard A and premiered at `primary-premiere-52`. Regional Initiative (id 101), a 38-minute non-documentary broadcast on 2025-08-05, was directed by Composite Framework. Seasonal Model (id 102) and Integrated Cluster A (id 103) complete the set, with durations ranging from 35 to 44 minutes and networks spanning `primary-network-40` through `baseline-network-43`.

**Table `historical_events`**

| id | event_name | event_date | location | event_category | is_verified | broadcast_program_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | 2025-04-15 | extended-location-99 | political | true | 100 |
| 2 | Integrated Framework | 2022-09-26 | integrated-location-100 | military | false | 101 |
| 3 | Extended Protocol D | 2023-02-10 | seasonal-location-101 | assassination | true | 102 |
| 4 | Pilot Programme | 2024-07-21 | regional-location-102 | trial | false | 103 |

Historical events provide the factual anchor points that journalists and programs reference. The `historical_events` table records each event by `id`, `event_name`, `event_date`, `location`, `event_category`, and `is_verified` status. The `event_category` field classifies events as `political`, `military`, `assassination`, or `trial`, while `is_verified` indicates whether the event's details have been confirmed. Each event also carries a `broadcast_program_id` linking it to related coverage. Seasonal Standard (id 1), a verified political event on 2025-04-15 at `extended-location-99`, is covered by broadcast program 100. Integrated Framework (id 2), an unverified military event from 2022-09-26 at `integrated-location-100`, is tied to program 101. Extended Protocol D (id 3) is a verified assassination event on 2023-02-10, and Pilot Programme (id 4) is an unverified trial event dated 2024-07-21 at `regional-location-102`.

**Table `media_personalities`**

| media_personality_id | full_name | callsign | recognition_title | years_active | is_retired | news_organization_id | historical_event_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | integrated-callsign-16 | Pilot Series | 21 | false | 100 | 1 |
| 2 | Account Name | seasonal-callsign-17 | Baseline Assessment | 30 | true | 101 | 2 |
| 3 | Saipan International Airport | regional-callsign-18 | Distributed Survey A | 39 | false | 102 | 3 |
| 4 | Norma Fisher | legacy-callsign-19 | Adaptive Corridor | 48 | true | 103 | 4 |

Media personalities represent a parallel registry of public figures who may overlap with journalists but are tracked separately. The `media_personalities` table includes `media_personality_id`, `full_name`, `callsign`, `recognition_title`, `years_active`, and `is_retired`. Foreign keys `news_organization_id` and `historical_event_id` link each personality to an organization and an event. Theodore Mcgrath (id 1), holding callsign `integrated-callsign-16` and the recognition title Pilot Series, has been active for 21 years and is not retired. Account Name (id 2), with callsign `seasonal-callsign-17` and the title Baseline Assessment, has 30 years of active service and is retired. Saipan International Airport (id 3) carries the title Distributed Survey A with 39 years active, while Norma Fisher (id 4) holds the title Adaptive Corridor and has 48 years of experience, also retired.

**Table `organizations_journalists`**

| news_organization_id | journalist_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The many-to-many relationship between journalists and news organizations is captured in the `organizations_journalists` junction table. This table contains pairs of `news_organization_id` and `journalist_id`, allowing a single journalist to be associated with multiple organizations and vice versa. Journalist 1 appears with both organization 100 and organization 103, demonstrating cross-organizational affiliation. Journalist 2 is linked to organizations 100 and 101, while journalist 3 connects to 101 and 102. Journalist 4 is associated with organizations 102 and 103. This structure supports the reality that journalists may contribute to multiple outlets over their careers, and organizations may employ multiple journalists simultaneously.

**Table `events_journalists`**

| historical_event_id | journalist_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `events_journalists` table similarly captures the many-to-many relationship between journalists and historical events. Each row pairs a `news_organization_id` with a `journalist_id`, though the table name and structure suggest it tracks which journalists have covered which events through their organizational affiliations. The data mirrors the organizational relationships, with journalist 1 appearing in both organization-event pairings (100 and 103), journalist 2 in pairings (100 and 101), journalist 3 in (101 and 102), and journalist 4 in (102 and 103). This ensures that event coverage can be traced back through the organizational structure to the individual journalists responsible.

**View `journalist_news_organization_view`**

```sql
CREATE VIEW journalist_news_organization_view AS
SELECT a.journalist_id, a.callsign, a.birth_date, a.death_date, b.id AS organization_id, b.organization_name AS organization_organization_name, b.founding_year AS organization_founding_year
FROM journalists a JOIN news_organizations b ON a.news_organization_id = b.id;
```

| journalist_id | callsign | birth_date | death_date | organization_id | organization_organization_name | organization_founding_year |
|---|---|---|---|---|---|---|
| 1 | integrated-callsign-16 | 2023-10-18 | 2022-01-12 | 100 | Staples Inc. | 43 |
| 2 | seasonal-callsign-17 | 2024-03-02 | 2023-06-23 | 101 | Oscar Health Inc. | 48 |
| 3 | regional-callsign-18 | 2025-08-13 | 2024-11-07 | 102 | Atlantic Richfield | 53 |
| 4 | legacy-callsign-19 | 2022-01-24 | 2025-04-18 | 103 | Port Loko | 58 |

The journalist-to-news-organization view answers the question of which journalists are employed by which organizations, presenting a flat, readable record of the employment relationship. Each row in this view combines journalist details with the corresponding organization's name, type, and status. For instance, journalist 1 (`integrated-callsign-16`) appears alongside Staples Inc., a wire service that remains active, while journalist 4 (`legacy-callsign-19`) is linked to Port Loko, a defunct wire service. This view is essential for organizational reporting, allowing analysts to quickly determine the staffing composition of each news organization and identify which journalists are associated with defunct entities.

**View `journalist_historical_event_view`**

```sql
CREATE VIEW journalist_historical_event_view AS
SELECT a.journalist_id, a.callsign, a.birth_date, a.death_date, b.id AS event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM journalists a JOIN historical_events b ON a.historical_event_id = b.id;
```

| journalist_id | callsign | birth_date | death_date | event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|---|
| 1 | integrated-callsign-16 | 2023-10-18 | 2022-01-12 | 1 | Seasonal Standard | 2025-04-15 |
| 2 | seasonal-callsign-17 | 2024-03-02 | 2023-06-23 | 2 | Integrated Framework | 2022-09-26 |
| 3 | regional-callsign-18 | 2025-08-13 | 2024-11-07 | 3 | Extended Protocol D | 2023-02-10 |
| 4 | legacy-callsign-19 | 2022-01-24 | 2025-04-18 | 4 | Pilot Programme | 2024-07-21 |

This view maps journalists to the historical events they have covered, joining journalist records with event details. The result reveals which reporters have been assigned to which events and under what organizational context. Journalist 1, for example, is linked to the Seasonal Standard, a verified political event, while journalist 2 is associated with the Integrated Framework, an unverified military event. The view surfaces the `is_verified` status of each event alongside the journalist's retirement status, enabling analysts to assess whether retired journalists were assigned to verified or unverified events. This relationship is critical for accountability tracking and editorial review.

**View `news_organization_journalist_detail_view`**

```sql
CREATE VIEW news_organization_journalist_detail_view AS
SELECT a.id, a.organization_name, a.founding_year, b.journalist_id AS journalist_journalist_id, b.callsign AS journalist_callsign, b.birth_date AS journalist_birth_date
FROM news_organizations a
  JOIN organizations_journalists j ON j.news_organization_id = a.id
  JOIN journalists b ON b.journalist_id = j.journalist_id;
```

| id | organization_name | founding_year | journalist_journalist_id | journalist_callsign | journalist_birth_date |
|---|---|---|---|---|---|
| 100 | Staples Inc. | 43 | 1 | integrated-callsign-16 | 2023-10-18 |
| 100 | Staples Inc. | 43 | 2 | seasonal-callsign-17 | 2024-03-02 |
| 101 | Oscar Health Inc. | 48 | 2 | seasonal-callsign-17 | 2024-03-02 |
| 101 | Oscar Health Inc. | 48 | 3 | regional-callsign-18 | 2025-08-13 |
| 102 | Atlantic Richfield | 53 | 3 | regional-callsign-18 | 2025-08-13 |
| 102 | Atlantic Richfield | 53 | 4 | legacy-callsign-19 | 2022-01-24 |
| 103 | Port Loko | 58 | 4 | legacy-callsign-19 | 2022-01-24 |
| 103 | Port Loko | 58 | 1 | integrated-callsign-16 | 2023-10-18 |

The news organization journalist detail view provides a comprehensive profile of each organization's journalistic staff. By joining the news organizations table with the journalists table, this view presents organization names, types, and defunct status alongside journalist callsigns, education, and retirement status. Staples Inc. (a wire service, not defunct) is shown with journalist 1, who is not retired and was educated at `baseline-educatio-25`. Oscar Health Inc. (a television network, defunct) is paired with journalist 2, who is retired and educated at `pilot-educatio-26`. This view supports human resources analysis, organizational audits, and the identification of staffing patterns across different organization types.

**View `news_organization_broadcast_program_view`**

```sql
CREATE VIEW news_organization_broadcast_program_view AS
SELECT a.id, a.organization_name, a.founding_year, a.headquarters_location, b.broadcast_program_id AS program_broadcast_program_id, b.program_title AS program_program_title, b.broadcast_date AS program_broadcast_date
FROM news_organizations a JOIN broadcast_programs b ON a.broadcast_program_id = b.broadcast_program_id;
```

| id | organization_name | founding_year | headquarters_location | program_broadcast_program_id | program_program_title | program_broadcast_date |
|---|---|---|---|---|---|---|
| 100 | Staples Inc. | 43 | composite-headquar-63 | 100 | Legacy Review D | 2024-03-21T14:06:00 |
| 101 | Oscar Health Inc. | 48 | primary-headquar-64 | 101 | Regional Initiative | 2025-08-05T21:23:00 |
| 102 | Atlantic Richfield | 53 | adaptive-headquar-65 | 102 | Seasonal Model | 2022-01-16T04:40:00 |
| 103 | Port Loko | 58 | distributed-headquar-66 | 103 | Integrated Cluster A | 2023-06-27T11:57:00 |

This view connects news organizations to their broadcast programs, revealing which programs are produced by which organizations. Each row combines organization details with program titles, broadcast dates, networks, and documentary status. Staples Inc. is linked to Legacy Review D, a 35-minute documentary broadcast on `primary-network-40`. Oscar Health Inc. is associated with Regional Initiative, a 38-minute non-documentary on `adaptive-network-41`. Atlantic Richfield produces Seasonal Model, a 41-minute documentary, while Port Loko produces Integrated Cluster A, a 44-minute non-documentary. This view is valuable for content audits, helping producers understand the relationship between organizational resources and program output.

**View `broadcast_program_news_organization_view`**

```sql
CREATE VIEW broadcast_program_news_organization_view AS
SELECT a.broadcast_program_id, a.program_title, a.broadcast_date, a.network, b.id AS organization_id, b.organization_name AS organization_organization_name, b.founding_year AS organization_founding_year
FROM broadcast_programs a JOIN news_organizations b ON a.news_organization_id = b.id;
```

| broadcast_program_id | program_title | broadcast_date | network | organization_id | organization_organization_name | organization_founding_year |
|---|---|---|---|---|---|---|
| 100 | Legacy Review D | 2024-03-21T14:06:00 | primary-network-40 | 100 | Staples Inc. | 43 |
| 101 | Regional Initiative | 2025-08-05T21:23:00 | adaptive-network-41 | 101 | Oscar Health Inc. | 48 |
| 102 | Seasonal Model | 2022-01-16T04:40:00 | distributed-network-42 | 102 | Atlantic Richfield | 53 |
| 103 | Integrated Cluster A | 2023-06-27T11:57:00 | baseline-network-43 | 103 | Port Loko | 58 |

The broadcast program to news organization view reverses the perspective, presenting each program alongside its producing organization's details. This orientation is useful for program-centric analysis, where the primary question is about the program itself and its organizational context. Legacy Review D is shown with Staples Inc., a wire service founded in year 43. Regional Initiative is paired with Oscar Health Inc., a defunct television network. Seasonal Model is linked to Atlantic Richfield, a radio station founded in year 53. Integrated Cluster A is associated with Port Loko, a defunct wire service founded in year 58. The view surfaces the `is_documentary` flag alongside the organization's `is_defunct` status, enabling analysts to assess whether documentary production correlates with organizational stability.

**View `broadcast_program_journalist_view`**

```sql
CREATE VIEW broadcast_program_journalist_view AS
SELECT a.broadcast_program_id, a.program_title, a.broadcast_date, a.network, b.journalist_id AS journalist_journalist_id, b.callsign AS journalist_callsign, b.birth_date AS journalist_birth_date
FROM broadcast_programs a JOIN journalists b ON a.journalist_id = b.journalist_id;
```

| broadcast_program_id | program_title | broadcast_date | network | journalist_journalist_id | journalist_callsign | journalist_birth_date |
|---|---|---|---|---|---|---|
| 100 | Legacy Review D | 2024-03-21T14:06:00 | primary-network-40 | 1 | integrated-callsign-16 | 2023-10-18 |
| 101 | Regional Initiative | 2025-08-05T21:23:00 | adaptive-network-41 | 2 | seasonal-callsign-17 | 2024-03-02 |
| 102 | Seasonal Model | 2022-01-16T04:40:00 | distributed-network-42 | 3 | regional-callsign-18 | 2025-08-13 |
| 103 | Integrated Cluster A | 2023-06-27T11:57:00 | baseline-network-43 | 4 | legacy-callsign-19 | 2022-01-24 |

This view joins broadcast programs with their associated journalists, answering which reporter is connected to which program. Each row presents the program title, broadcast date, and network alongside the journalist's callsign, birth date, and retirement status. Legacy Review D is linked to journalist 1 (`integrated-callsign-16`), who is not retired. Regional Initiative is associated with journalist 2 (`seasonal-callsign-17`), who is retired. Seasonal Model connects to journalist 3 (`regional-callsign-18`), not retired, and Integrated Cluster A to journalist 4 (`legacy-callsign-19`), who is retired. This view supports editorial accountability, allowing producers to trace program authorship back to individual journalists.

**View `broadcast_program_historical_event_view`**

```sql
CREATE VIEW broadcast_program_historical_event_view AS
SELECT a.broadcast_program_id, a.program_title, a.broadcast_date, a.network, b.id AS event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM broadcast_programs a JOIN historical_events b ON a.historical_event_id = b.id;
```

| broadcast_program_id | program_title | broadcast_date | network | event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|---|
| 100 | Legacy Review D | 2024-03-21T14:06:00 | primary-network-40 | 1 | Seasonal Standard | 2025-04-15 |
| 101 | Regional Initiative | 2025-08-05T21:23:00 | adaptive-network-41 | 2 | Integrated Framework | 2022-09-26 |
| 102 | Seasonal Model | 2022-01-16T04:40:00 | distributed-network-42 | 3 | Extended Protocol D | 2023-02-10 |
| 103 | Integrated Cluster A | 2023-06-27T11:57:00 | baseline-network-43 | 4 | Pilot Programme | 2024-07-21 |

The broadcast program to historical event view reveals which events are covered by which programs, joining program details with event metadata. Each row presents the program title and broadcast date alongside the event name, date, category, and verification status. Legacy Review D covers the Seasonal Standard, a verified political event from 2025-04-15. Regional Initiative covers the Integrated Framework, an unverified military event from 2022-09-26. Seasonal Model covers Extended Protocol D, a verified assassination event, and Integrated Cluster A covers Pilot Programme, an unverified trial event. This view is essential for editorial review, enabling analysts to assess the balance between verified and unverified event coverage across programs.

**View `historical_event_journalist_detail_view`**

```sql
CREATE VIEW historical_event_journalist_detail_view AS
SELECT a.id, a.event_name, a.event_date, b.journalist_id AS journalist_journalist_id, b.callsign AS journalist_callsign, b.birth_date AS journalist_birth_date
FROM historical_events a
  JOIN events_journalists j ON j.historical_event_id = a.id
  JOIN journalists b ON b.journalist_id = j.journalist_id;
```

| id | event_name | event_date | journalist_journalist_id | journalist_callsign | journalist_birth_date |
|---|---|---|---|---|---|
| 1 | Seasonal Standard | 2025-04-15 | 1 | integrated-callsign-16 | 2023-10-18 |
| 1 | Seasonal Standard | 2025-04-15 | 2 | seasonal-callsign-17 | 2024-03-02 |
| 2 | Integrated Framework | 2022-09-26 | 2 | seasonal-callsign-17 | 2024-03-02 |
| 2 | Integrated Framework | 2022-09-26 | 3 | regional-callsign-18 | 2025-08-13 |
| 3 | Extended Protocol D | 2023-02-10 | 3 | regional-callsign-18 | 2025-08-13 |
| 3 | Extended Protocol D | 2023-02-10 | 4 | legacy-callsign-19 | 2022-01-24 |
| 4 | Pilot Programme | 2024-07-21 | 4 | legacy-callsign-19 | 2022-01-24 |
| 4 | Pilot Programme | 2024-07-21 | 1 | integrated-callsign-16 | 2023-10-18 |

This view provides a detailed profile of journalists in the context of the historical events they have covered. By joining historical events with journalists, it presents event names, dates, and categories alongside journalist callsigns, education, and employer information. The Seasonal Standard (a verified political event) is linked to journalist 1, who works for Ontrak Inc. and was educated at `baseline-educatio-25`. The Integrated Framework (an unverified military event) is associated with journalist 2, employed by Grant Type and educated at `pilot-educatio-26`. Extended Protocol D (a verified assassination event) connects to journalist 3 of ABIOMED Inc., and Pilot Programme (an unverified trial event) to journalist 4 of The College-Ready Promise. This view supports investigative analysis, allowing researchers to examine whether certain journalists are disproportionately assigned to verified or unverified events.

**View `historical_event_broadcast_program_view`**

```sql
CREATE VIEW historical_event_broadcast_program_view AS
SELECT a.id, a.event_name, a.event_date, a.location, b.broadcast_program_id AS program_broadcast_program_id, b.program_title AS program_program_title, b.broadcast_date AS program_broadcast_date
FROM historical_events a JOIN broadcast_programs b ON a.broadcast_program_id = b.broadcast_program_id;
```

| id | event_name | event_date | location | program_broadcast_program_id | program_program_title | program_broadcast_date |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | 2025-04-15 | extended-location-99 | 100 | Legacy Review D | 2024-03-21T14:06:00 |
| 2 | Integrated Framework | 2022-09-26 | integrated-location-100 | 101 | Regional Initiative | 2025-08-05T21:23:00 |
| 3 | Extended Protocol D | 2023-02-10 | seasonal-location-101 | 102 | Seasonal Model | 2022-01-16T04:40:00 |
| 4 | Pilot Programme | 2024-07-21 | regional-location-102 | 103 | Integrated Cluster A | 2023-06-27T11:57:00 |

The historical event to broadcast program view presents each event alongside the programs that cover it, joining event details with program metadata. Each row shows the event name, date, category, and verification status alongside the program title, broadcast date, network, and duration. The Seasonal Standard is covered by Legacy Review D, a 35-minute documentary on `primary-network-40`. The Integrated Framework is covered by Regional Initiative, a 38-minute non-documentary on `adaptive-network-41`. Extended Protocol D is covered by Seasonal Model, a 41-minute documentary on `distributed-network-42`, and Pilot Programme by Integrated Cluster A, a 44-minute non-documentary on `baseline-network-43`. This view is useful for content strategy analysis, helping producers understand the relationship between event categories and program formats.

**View `media_personality_news_organization_view`**

```sql
CREATE VIEW media_personality_news_organization_view AS
SELECT a.media_personality_id, a.full_name, a.callsign, a.recognition_title, b.id AS organization_id, b.organization_name AS organization_organization_name, b.founding_year AS organization_founding_year
FROM media_personalities a JOIN news_organizations b ON a.news_organization_id = b.id;
```

| media_personality_id | full_name | callsign | recognition_title | organization_id | organization_organization_name | organization_founding_year |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | integrated-callsign-16 | Pilot Series | 100 | Staples Inc. | 43 |
| 2 | Account Name | seasonal-callsign-17 | Baseline Assessment | 101 | Oscar Health Inc. | 48 |
| 3 | Saipan International Airport | regional-callsign-18 | Distributed Survey A | 102 | Atlantic Richfield | 53 |
| 4 | Norma Fisher | legacy-callsign-19 | Adaptive Corridor | 103 | Port Loko | 58 |

This view connects media personalities to their associated news organizations, presenting personality details alongside organizational information. Each row includes the personality's full name, callsign, recognition title, and years of active service alongside the organization's name, type, and defunct status. Theodore Mcgrath, holding the recognition title Pilot Series with 21 years of active service, is linked to Staples Inc., an active wire service. Account Name, with the title Baseline Assessment and 30 years active, is associated with Oscar Health Inc., a defunct television network. Saipan International Airport, titled Distributed Survey A with 39 years active, is linked to Atlantic Richfield, an active radio station. Norma Fisher, holding Adaptive Corridor with 48 years of experience, is associated with Port Loko, a defunct wire service. This view supports talent management and organizational staffing analysis.

**View `media_personality_historical_event_view`**

```sql
CREATE VIEW media_personality_historical_event_view AS
SELECT a.media_personality_id, a.full_name, a.callsign, a.recognition_title, b.id AS event_id, b.event_name AS event_event_name, b.event_date AS event_event_date
FROM media_personalities a JOIN historical_events b ON a.historical_event_id = b.id;
```

| media_personality_id | full_name | callsign | recognition_title | event_id | event_event_name | event_event_date |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | integrated-callsign-16 | Pilot Series | 1 | Seasonal Standard | 2025-04-15 |
| 2 | Account Name | seasonal-callsign-17 | Baseline Assessment | 2 | Integrated Framework | 2022-09-26 |
| 3 | Saipan International Airport | regional-callsign-18 | Distributed Survey A | 3 | Extended Protocol D | 2023-02-10 |
| 4 | Norma Fisher | legacy-callsign-19 | Adaptive Corridor | 4 | Pilot Programme | 2024-07-21 |

The media personality to historical event view reveals which public figures are associated with which events, joining personality records with event details. Each row presents the personality's name, callsign, and recognition title alongside the event name, date, category, and verification status. Theodore Mcgrath is linked to the Seasonal Standard, a verified political event. Account Name is associated with the Integrated Framework, an unverified military event. Saipan International Airport is connected to Extended Protocol D, a verified assassination event, and Norma Fisher to Pilot Programme, an unverified trial event. This view enables analysts to assess the relationship between personality recognition titles and the types of events they are associated with, supporting editorial strategy and talent placement decisions.

The data model presented here captures the essential relationships within a media organization's operational ecosystem. Journalists are tracked through biographical and professional attributes, news organizations through institutional details and operational status, broadcast programs through production metadata, and historical events through factual and categorical information. Media personalities provide a parallel registry of public figures, while the junction tables `organizations_journalists` and `events_journalists` enable many-to-many relationships that reflect the complexity of real-world media operations. The twelve views derived from these base tables each answer a specific analytical question, from employment tracking to event coverage analysis. Together, they form a comprehensive reference framework for understanding how journalists, organizations, programs, and events interconnect within the media landscape.