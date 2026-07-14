The media and journalism domain under study captures the interlocking relationships between reporters, news organizations, broadcast productions, and the historical events they cover. At its core, the model distinguishes five principal entity types—journalists, news organizations, broadcast programs, historical events, and media personalities—each persisting in its own table with a stable surrogate key. Cross-cutting associations between journalists and the organizations or events they are tied to are materialized through two junction tables, while a suite of twelve views reconstructs the domain's multi-table facts for downstream consumption. The schema follows a normalized design where each fact is stored once, and joins are used to assemble the complete picture at query time.

## The Entity Landscape

The foundation of the schema rests on five base tables, each modelling a distinct concept in the media domain. The `journalists` table stores biographical and professional attributes for individual reporters. Its primary key is `journalist_id`, and each row carries a `callsign` (such as `integrated-callsign-16`), `birth_date` and `death_date` fields, a `birth_place` (e.g. `baseline-birth-61`), an `education_institution` (e.g. `baseline-educatio-25`), a `primary_employer` (e.g. `Ontrak Inc.`), a boolean `is_retired` flag, and two foreign keys: `news_organization_id` pointing to `news_organizations` and `historical_event_id` pointing to `historical_events`. The presence of these two FK columns means each journalist row is anchored to exactly one news organization and one historical event in the current design.

**Table `journalists`**

| journalist_id | callsign | birth_date | death_date | birth_place | education_institution | primary_employer | is_retired | news_organization_id | historical_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-callsign-16 | 2023-10-18 | 2022-01-12 | baseline-birth-61 | baseline-educatio-25 | Ontrak Inc. | false | 100 | 1 |
| 2 | seasonal-callsign-17 | 2024-03-02 | 2023-06-23 | pilot-birth-62 | pilot-educatio-26 | Grant Type | true | 101 | 2 |
| 3 | regional-callsign-18 | 2025-08-13 | 2024-11-07 | extended-birth-63 | extended-educatio-27 | ABIOMED Inc | false | 102 | 3 |
| 4 | legacy-callsign-19 | 2022-01-24 | 2025-04-18 | integrated-birth-64 | integrated-educatio-28 | The College-Ready Promise | true | 103 | 4 |

The `news_organizations` table captures the institutional side of the domain. Its primary key is `id`, and each row stores an `organization_name` (such as `Staples Inc.` or `Oscar Health Inc.`), a `founding_year` expressed as a relative integer (e.g. `43`), a `headquarters_location` (e.g. `composite-headquar-63`), an `organization_type` drawn from values like `wire_service`, `television_network`, and `radio_station`, an `is_defunct` boolean, and a `broadcast_program_id` foreign key. The `broadcast_program_id` column creates a link from each news organization to a single broadcast program.

**Table `news_organizations`**

| id | organization_name | founding_year | headquarters_location | organization_type | is_defunct | broadcast_program_id |
|---|---|---|---|---|---|---|
| 100 | Staples Inc. | 43 | composite-headquar-63 | wire_service | false | 100 |
| 101 | Oscar Health Inc. | 48 | primary-headquar-64 | television_network | true | 101 |
| 102 | Atlantic Richfield | 53 | adaptive-headquar-65 | radio_station | false | 102 |
| 103 | Port Loko | 58 | distributed-headquar-66 | wire_service | true | 103 |

The `broadcast_programs` table is the most heavily connected entity in the schema. Its primary key is `broadcast_program_id`, and each row carries a `program_title` (e.g. `Legacy Review D`), a `broadcast_date` timestamp (e.g. `2024-03-21T14:06:00`), a `network` identifier (e.g. `primary-network-40`), a `duration_minutes` integer (e.g. `35`), an `is_documentary` boolean, a `director_name` (e.g. `Primary Standard A`), a `premiere_venue` (e.g. `primary-premiere-52`), and three foreign keys: `news_organization_id` pointing to `news_organizations`, `journalist_id` pointing to `journalists`, and `historical_event_id` pointing to `historical_events`. This table thus serves as a central hub, connecting organizations, people, and events in a single production record.

**Table `broadcast_programs`**

| broadcast_program_id | program_title | broadcast_date | network | duration_minutes | is_documentary | director_name | premiere_venue | news_organization_id | journalist_id | historical_event_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Legacy Review D | 2024-03-21T14:06:00 | primary-network-40 | 35 | true | Primary Standard A | primary-premiere-52 | 100 | 1 | 1 |
| 101 | Regional Initiative | 2025-08-05T21:23:00 | adaptive-network-41 | 38 | false | Composite Framework | adaptive-premiere-53 | 101 | 2 | 2 |
| 102 | Seasonal Model | 2022-01-16T04:40:00 | distributed-network-42 | 41 | true | Compact Protocol | distributed-premiere-54 | 102 | 3 | 3 |
| 103 | Integrated Cluster A | 2023-06-27T11:57:00 | baseline-network-43 | 44 | false | Legacy Programme D | baseline-premiere-55 | 103 | 4 | 4 |

The `historical_events` table records the events that journalists and broadcast programs cover. Its primary key is `id`, and each row stores an `event_name` (e.g. `Seasonal Standard`), an `event_date` (e.g. `2025-04-15`), a `location` (e.g. `extended-location-99`), an `event_category` drawn from values like `political`, `military`, `assassination`, and `trial`, an `is_verified` boolean, and a `broadcast_program_id` foreign key. The `broadcast_program_id` column creates a link from each historical event back to a broadcast program, forming a bidirectional association with `broadcast_programs`.

**Table `historical_events`**

| id | event_name | event_date | location | event_category | is_verified | broadcast_program_id |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | 2025-04-15 | extended-location-99 | political | true | 100 |
| 2 | Integrated Framework | 2022-09-26 | integrated-location-100 | military | false | 101 |
| 3 | Extended Protocol D | 2023-02-10 | seasonal-location-101 | assassination | true | 102 |
| 4 | Pilot Programme | 2024-07-21 | regional-location-102 | trial | false | 103 |

The `media_personalities` table captures a parallel set of public figures who may overlap with, but are distinct from, the `journalists` entity. Its primary key is `media_personality_id`, and each row stores a `full_name` (e.g. `Theodore Mcgrath`), a `callsign` (e.g. `integrated-callsign-16`), a `recognition_title` (e.g. `Pilot Series`), a `years_active` integer (e.g. `21`), an `is_retired` boolean, and two foreign keys: `news_organization_id` pointing to `news_organizations` and `historical_event_id` pointing to `historical_events`. The schema design allows media personalities to be associated with organizations and events in the same way journalists are, enabling unified reporting across both entity types.

**Table `media_personalities`**

| media_personality_id | full_name | callsign | recognition_title | years_active | is_retired | news_organization_id | historical_event_id |
|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | integrated-callsign-16 | Pilot Series | 21 | false | 100 | 1 |
| 2 | Account Name | seasonal-callsign-17 | Baseline Assessment | 30 | true | 101 | 2 |
| 3 | Saipan International Airport | regional-callsign-18 | Distributed Survey A | 39 | false | 102 | 3 |
| 4 | Norma Fisher | legacy-callsign-19 | Adaptive Corridor | 48 | true | 103 | 4 |

## Junction Tables and Many-to-Many Relationships

While the five base tables above use single-column foreign keys to express one-to-many or many-to-one relationships, the schema also needs to represent many-to-many associations. Two junction tables handle this: `organizations_journalists` and `events_journalists`.

The `organizations_journalists` table resolves the many-to-many relationship between `news_organizations` and `journalists`. It contains two columns, `news_organization_id` and `journalist_id`, both serving as foreign keys. A journalist can be associated with multiple organizations over their career, and an organization can employ multiple journalists. For example, journalist `1` (callsign `integrated-callsign-16`) appears in two rows: one linking to organization `100` (Staples Inc.) and another linking to organization `103` (Port Loko). Similarly, journalist `2` (callsign `seasonal-callsign-17`) is associated with both organization `100` and organization `101`. This table thus captures the fluid career trajectories of journalists across multiple employers.

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

The `events_journalists` table plays an analogous role for the relationship between `historical_events` and `journalists`. It contains `historical_event_id` and `journalist_id` columns, both serving as foreign keys. Just as a journalist may work for multiple organizations, a journalist may cover multiple historical events, and a single historical event may be covered by multiple journalists. This junction table materializes that many-to-many relationship, allowing the schema to represent the full breadth of journalistic coverage without forcing a single event into the `historical_event_id` column of the `journalists` table.

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

## The View Layer

The base tables store facts in a normalized form. To answer common domain questions without writing multi-table joins repeatedly, the schema provides twelve views. Each view joins two or more base tables and presents the result as a single virtual table. The following sections describe each view, what question it answers, and what the joined data looks like in practice.

### Journalist-Centric Views

The `journalist_news_organization_view` joins `journalists` with `news_organizations` to answer the question "Which news organization is each journalist associated with?" The join is driven by the `news_organization_id` foreign key in the `journalists` table. Journalist `1` (callsign `integrated-callsign-16`, primary employer `Ontrak Inc.`, born `2023-10-18`) is linked to organization `100` (Staples Inc., founded `43` years ago, headquartered at `composite-headquar-63`, type `wire_service`). Journalist `2` (callsign `seasonal-callsign-17`, primary employer `Grant Type`, born `2024-03-02`) is linked to organization `101` (Oscar Health Inc., founded `48` years ago, headquartered at `primary-headquar-64`, type `television_network`).

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

The `journalist_historical_event_view` joins `journalists` with `historical_events` to answer "Which historical event is each journalist associated with?" The join is driven by the `historical_event_id` foreign key in the `journalists` table. Journalist `1` (callsign `integrated-callsign-16`) is linked to event `1` (Seasonal Standard, date `2025-04-15`, location `extended-location-99`, category `political`, verified). Journalist `2` (callsign `seasonal-callsign-17`) is linked to event `2` (Integrated Framework, date `2022-09-26`, location `integrated-location-100`, category `military`, not verified).

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

### News Organization-Centric Views

The `news_organization_journalist_detail_view` joins `news_organizations` with `journalists` to answer "Which journalists work at each news organization?" This is the inverse perspective of `journalist_news_organization_view`. Organization `100` (Staples Inc., type `wire_service`, not defunct) has journalist `1` (callsign `integrated-callsign-16`, primary employer `Ontrak Inc.`, retired `false`) and journalist `2` (callsign `seasonal-callsign-17`, primary employer `Grant Type`, retired `true`) associated with it. Organization `101` (Oscar Health Inc., type `television_network`, defunct) has journalist `2` (callsign `seasonal-callsign-17`) and journalist `3` (callsign `regional-callsign-18`, primary employer `ABIOMED Inc.`, retired `false`).

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

The `news_organization_broadcast_program_view` joins `news_organizations` with `broadcast_programs` to answer "Which broadcast programs are produced by each news organization?" The join is driven by the `broadcast_program_id` foreign key in `news_organizations` and the `broadcast_program_id` primary key in `broadcast_programs`. Organization `100` (Staples Inc.) is linked to program `100` (Legacy Review D, broadcast date `2024-03-21T14:06:00`, network `primary-network-40`, duration `35` minutes, documentary, director `Primary Standard A`). Organization `101` (Oscar Health Inc.) is linked to program `101` (Regional Initiative, broadcast date `2025-08-05T21:23:00`, network `adaptive-network-41`, duration `38` minutes, not a documentary, director `Composite Framework`).

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

### Broadcast Program-Centric Views

The `broadcast_program_news_organization_view` joins `broadcast_programs` with `news_organizations` to answer "Which news organization produces each broadcast program?" This is the inverse perspective of `news_organization_broadcast_program_view`. Program `100` (Legacy Review D, 35-minute documentary directed by `Primary Standard A`) is produced by organization `100` (Staples Inc., type `wire_service`). Program `103` (Integrated Cluster A, 44-minute non-documentary directed by `Legacy Programme D`) is produced by organization `103` (Port Loko, type `wire_service`, defunct).

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

The `broadcast_program_journalist_view` joins `broadcast_programs` with `journalists` to answer "Which journalist is associated with each broadcast program?" The join is driven by the `journalist_id` foreign key in `broadcast_programs`. Program `100` (Legacy Review D) is associated with journalist `1` (callsign `integrated-callsign-16`, born `2023-10-18`, retired `false`). Program `102` (Seasonal Model, 41-minute documentary directed by `Compact Protocol`) is associated with journalist `3` (callsign `regional-callsign-18`, born `2025-08-13`, retired `false`).

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

The `broadcast_program_historical_event_view` joins `broadcast_programs` with `historical_events` to answer "Which historical event does each broadcast program cover?" The join is driven by the `historical_event_id` foreign key in `broadcast_programs`. Program `100` (Legacy Review D) covers event `1` (Seasonal Standard, date `2025-04-15`, category `political`, verified). Program `103` (Integrated Cluster A) covers event `4` (Pilot Programme, date `2024-07-21`, category `trial`, not verified).

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

### Historical Event-Centric Views

The `historical_event_journalist_detail_view` joins `historical_events` with `journalists` to answer "Which journalists are associated with each historical event?" This is the inverse perspective of `journalist_historical_event_view`. Event `1` (Seasonal Standard, category `political`, verified, location `extended-location-99`) is associated with journalist `1` (callsign `integrated-callsign-16`, primary employer `Ontrak Inc.`). Event `3` (Extended Protocol D, category `assassination`, verified, location `seasonal-location-101`) is associated with journalist `3` (callsign `regional-callsign-18`, primary employer `ABIOMED Inc.`).

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

The `historical_event_broadcast_program_view` joins `historical_events` with `broadcast_programs` to answer "Which broadcast programs cover each historical event?" This is the inverse perspective of `broadcast_program_historical_event_view`. Event `1` (Seasonal Standard, category `political`) is covered by program `100` (Legacy Review D, 35-minute documentary). Event `4` (Pilot Programme, category `trial`) is covered by program `103` (Integrated Cluster A, 44-minute non-documentary).

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

### Media Personality-Centric Views

The `media_personality_news_organization_view` joins `media_personalities` with `news_organizations` to answer "Which news organization is each media personality associated with?" The join is driven by the `news_organization_id` foreign key in `media_personalities`. Media personality `1` (Theodore Mcgrath, callsign `integrated-callsign-16`, recognition title `Pilot Series`, `21` years active, not retired) is linked to organization `100` (Staples Inc., type `wire_service`). Media personality `2` (Account Name, callsign `seasonal-callsign-17`, recognition title `Baseline Assessment`, `30` years active, retired) is linked to organization `101` (Oscar Health Inc., type `television_network`).

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

The `media_personality_historical_event_view` joins `media_personalities` with `historical_events` to answer "Which historical event is each media personality associated with?" The join is driven by the `historical_event_id` foreign key in `media_personalities`. Media personality `1` (Theodore Mcgrath) is linked to event `1` (Seasonal Standard, category `political`, verified). Media personality `4` (Norma Fisher, callsign `legacy-callsign-19`, recognition title `Adaptive Corridor`, `48` years active, retired) is linked to event `4` (Pilot Programme, category `trial`, not verified).

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

## Closing Synthesis

The schema models the media and journalism domain through five base entity tables, two junction tables, and twelve views. The base tables store normalized facts about journalists, news organizations, broadcast programs, historical events, and media personalities. The junction tables (`organizations_journalists` and `events_journalists`) resolve many-to-many relationships that cannot be expressed through single-column foreign keys. The views assemble these normalized facts into readable, question-oriented perspectives: journalist-centric, organization-centric, broadcast-centric, event-centric, and media personality-centric. Each view answers a specific domain question by joining two or more base tables, and the concrete values in the joined results—such as journalist `1` (callsign `integrated-callsign-16`) being linked to organization `100` (Staples Inc.) and event `1` (Seasonal Standard)—demonstrate how the normalized design faithfully reconstructs the domain's multi-table facts at query time.