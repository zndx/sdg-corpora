The shooting sports domain captures the competitive anatomy of international shooting championships: events defined by discipline and gender, athletes drawn from national teams, and the tournaments that bind them together in time and place. A single championship edition—say, the *Composite Protocol* held in edition 19—hosts multiple events such as `10m_air_pistol` and `10m_air_rifle`, each producing qualification and final scores, a final rank, and a medal outcome. Shooters like Theodore Mcgrath (identifier `8189474`) or Norma Fisher (identifier `5082990`) compete within those events, and their national teams—Baseline Corridor D, Distributed Series, Adaptive Assessment, Primary Survey A—accumulate aggregate scores and medals across the tournament. The relational model stores these entities in five base tables, links them through four junction tables, and exposes eight analytical views that reassemble the normalised facts into domain-readable narratives.

## Entity Types and Their Attributes

The foundation of the schema consists of five entity tables, each representing a distinct concept in the shooting sports universe.

**Table `shooting_events`**

| id | event_code | gender_category | qualification_score | final_score | final_rank | medal_awarded | championship_edition_number |
|---|---|---|---|---|---|---|---|
| 1 | 10m_air_pistol | men | 16 | 12.20 | 9 | gold | 19 |
| 2 | 10m_air_rifle | women | 21 | 16.40 | 13 | silver | 30 |
| 3 | 10m_air_pistol | men | 26 | 20.60 | 17 | bronze | 41 |
| 4 | 10m_air_rifle | women | 31 | 24.80 | 21 | none | 52 |

The `shooting_events` table is the central event entity. Its primary key `id` is a surrogate integer, while the business identifier `event_code` encodes the discipline—values such as `10m_air_pistol` and `10m_air_rifle` appear in the data. The `gender_category` column constrains participation to `men` or `women`. Performance is captured through `qualification_score` (integer values like 16, 21, 26, 31), `final_score` (decimal values such as 12.20, 16.40, 20.60, 24.80), and `final_rank` (integers 9, 13, 17, 21). The `medal_awarded` column holds the ordinal outcome—`gold`, `silver`, `bronze`, or `none`—and `championship_edition_number` is a foreign key reference back to the `championships` table, establishing that event 1 belongs to edition 19, event 2 to edition 30, and so on.

**Table `shooters`**

| id | shooter_id | full_name | nationality | is_olympic_champion | national_team_id |
|---|---|---|---|---|---|
| 1 | 8189474 | Theodore Mcgrath | composite-national-39 | true | 100 |
| 2 | 338520 | Account Name | primary-national-40 | false | 101 |
| 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport | adaptive-national-41 | true | 102 |
| 4 | 5082990 | Norma Fisher | distributed-national-42 | false | 103 |

The `shooters` table stores individual athletes. Its surrogate key `id` is an integer, while the domain-level `shooter_id` carries a heterogeneous identifier: numeric strings like `8189474` and `338520`, as well as UUID-like identifiers such as `ChIJCbVGx_tt5kcRJYrXOupoDgA`. The `full_name` column holds the athlete's name—Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher—while `nationality` encodes the team affiliation type (`composite-national-39`, `primary-national-40`, `adaptive-national-41`, `distributed-national-42`). The boolean `is_olympic_champion` flags prior Olympic success, and `national_team_id` is a foreign key pointing to `national_teams`, binding each shooter to exactly one national team.

**Table `national_teams`**

| id | team_code | country_name | total_score | team_rank | team_medal | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | 4447029 | Baseline Corridor D | 75 | 48 | gold | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 1 | 59 | silver | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 6 | 70 | bronze | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 6969423 | Primary Survey A | 47 | 81 | none | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

National teams are modelled in `national_teams`, keyed by surrogate `id` (100 through 103). The `team_code` column stores a mix of numeric and UUID codes—`4447029`, `fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3`, `2bc4a76a-8fcc-11eb-924d-9cd76263cbd0`, `6969423`. The `country_name` column carries the team's display name: Baseline Corridor D, Distributed Series, Adaptive Assessment, Primary Survey A. Aggregate performance is captured in `total_score` (75, 1, 6, 47), `team_rank` (48, 59, 70, 81), and `team_medal` (gold, silver, bronze, none). The `created_at` and `updated_at` timestamps record the lifecycle of each team record.

**Table `championships`**

| championship_name | edition_number | host_city | host_country | start_date | end_date | location_id |
|---|---|---|---|---|---|---|
| Composite Protocol | 19 | seasonal-host-83 | composite-host-21 | 2022-09-05 | 2022-09-01 | 1 |
| Compact Programme A | 30 | regional-host-84 | primary-host-22 | 2023-02-16 | 2023-02-12 | 2 |
| Legacy Standard | 41 | legacy-host-85 | adaptive-host-23 | 2024-07-27 | 2024-07-23 | 3 |
| Regional Framework | 52 | compact-host-86 | distributed-host-24 | 2025-12-11 | 2025-12-07 | 4 |

Championships are the top-level tournament containers. The table `championships` uses a composite business key formed by `championship_name` and `edition_number`—for instance, *Composite Protocol* at edition 19, *Compact Programme A* at edition 30, *Legacy Standard* at edition 41, and *Regional Framework* at edition 52. The `host_city` and `host_country` columns store location descriptors such as `seasonal-host-83` and `composite-host-21`. The `start_date` and `end_date` columns define the tournament window (e.g., 2022-09-05 to 2022-09-01 for the Composite Protocol). The `location_id` column is a foreign key into the `locations` table, anchoring each championship to a physical venue.

**Table `locations`**

| id | city_name | country_name |
|---|---|---|
| 1 | Regional Protocol | Baseline Corridor D |
| 2 | Seasonal Programme D | Distributed Series |
| 3 | Integrated Standard | Adaptive Assessment |
| 4 | Extended Framework | Primary Survey A |

The `locations` table is the simplest entity: surrogate `id` (1 through 4), `city_name` (Regional Protocol, Seasonal Programme D, Integrated Standard, Extended Framework), and `country_name` (Baseline Corridor D, Distributed Series, Adaptive Assessment, Primary Survey A). Each location row is referenced by exactly one championship via the `location_id` foreign key, enforcing a one-to-one logical mapping from venue to tournament.

## Junction Tables and Cardinality-Bounded Relationships

The five entity tables alone cannot express the many-to-many relationships that define the domain. Four junction tables bridge these gaps, each materialising a specific association.

**Table `events_shooters`**

| shooting_event_id | shooter_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `events_shooters` table is the primary event–shooter association. Its composite key is formed by `shooting_event_id` and `shooter_id`, both foreign keys referencing `shooting_events.id` and `shooters.id` respectively. The data shows a clean bipartite pattern: event 1 is linked to shooters 1 and 2; event 2 to shooters 2 and 3; event 3 to shooters 3 and 4; event 4 to shooters 4 and 1. Each shooter participates in exactly two events, and each event hosts exactly two shooters, yielding a balanced 2×2 participation matrix.

**Table `shooters_events`**

| shooter_id | shooting_event_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `shooters_events` table mirrors the `events_shooters` association, providing a second perspective on the same many-to-many relationship. Its column order and semantics are identical—`shooting_event_id` and `shooter_id` as a composite key—allowing queries to traverse the relationship from either the shooter or the event side without schema asymmetry.

**Table `teams_events`**

| national_team_id | shooting_event_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `teams_events` table links national teams to the events they compete in. Its composite key comprises the team and event identifiers, enabling a team such as Baseline Corridor D (id 100) to be associated with multiple events, and an event to be contested by multiple teams. The cardinality is bounded by the foreign key constraints: each row references exactly one team and one event.

**Table `teams_shooters`**

| national_team_id | shooter_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `teams_shooters` table captures the team–shooter membership relationship. Its composite key of team and shooter identifiers allows a shooter to belong to one or more teams and a team to field one or more shooters. This table complements the `national_team_id` column in `shooters`, which enforces a single primary team assignment per shooter, while `teams_shooters` records the full roster of all team affiliations.

**Table `championships_events`**

| championship_edition_number | shooting_event_id |
|---|---|
| 19 | 1 |
| 19 | 2 |
| 30 | 2 |
| 30 | 3 |
| 41 | 3 |
| 41 | 4 |
| 52 | 4 |
| 52 | 1 |

The `championships_events` table binds championships to the events they host. Its composite key of championship and event identifiers allows a championship to contain multiple events and an event to appear in multiple championship editions. This junction table is the bridge that the `vw_shooting_event_championship` and `vw_championship_shooting_event_detail` views traverse to reconstruct the tournament–event hierarchy.

## Analytical Views: Reassembling Normalised Facts

The eight views in the schema are the primary interface for domain queries. Each view performs a specific join pattern that reassembles normalised rows into a coherent fact.

**View `vw_shooting_event_shooter_detail`**

```sql
CREATE VIEW vw_shooting_event_shooter_detail AS
SELECT a.id, a.event_code, a.gender_category, b.id AS shooter_id, b.shooter_id AS shooter_shooter_id, b.full_name AS shooter_full_name
FROM shooting_events a
  JOIN events_shooters j ON j.shooting_event_id = a.id
  JOIN shooters b ON b.id = j.shooter_id;
```

| id | event_code | gender_category | shooter_id | shooter_shooter_id | shooter_full_name |
|---|---|---|---|---|---|
| 1 | 10m_air_pistol | men | 1 | 8189474 | Theodore Mcgrath |
| 1 | 10m_air_pistol | men | 2 | 338520 | Account Name |
| 2 | 10m_air_rifle | women | 2 | 338520 | Account Name |
| 2 | 10m_air_rifle | women | 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport |
| 3 | 10m_air_pistol | men | 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport |
| 3 | 10m_air_pistol | men | 4 | 5082990 | Norma Fisher |
| 4 | 10m_air_rifle | women | 4 | 5082990 | Norma Fisher |
| 4 | 10m_air_rifle | women | 1 | 8189474 | Theodore Mcgrath |

This view answers the question: *which shooters competed in which event, and what were their results?* It joins `shooting_events` to `shooters` through the `events_shooters` junction, producing rows that combine event metadata (event_code, gender_category, medal_awarded) with shooter identity (full_name, nationality, is_olympic_champion). A representative row might show Theodore Mcgrath (nationality `composite-national-39`, Olympic champion `true`) competing in the `10m_air_pistol` event (gender `men`, medal `gold`), while another row shows Account Name (nationality `primary-national-40`, Olympic champion `false`) in the same event with medal `silver`. The view collapses the many-to-many into a flat fact table suitable for reporting.

**View `vw_shooting_event_championship`**

```sql
CREATE VIEW vw_shooting_event_championship AS
SELECT a.id, a.event_code, a.gender_category, a.qualification_score, b.championship_name AS championship_championship_name, b.edition_number AS championship_edition_number, b.host_city AS championship_host_city
FROM shooting_events a JOIN championships b ON a.championship_edition_number = b.edition_number;
```

| id | event_code | gender_category | qualification_score | championship_championship_name | championship_edition_number | championship_host_city |
|---|---|---|---|---|---|---|
| 1 | 10m_air_pistol | men | 16 | Composite Protocol | 19 | seasonal-host-83 |
| 2 | 10m_air_rifle | women | 21 | Compact Programme A | 30 | regional-host-84 |
| 3 | 10m_air_pistol | men | 26 | Legacy Standard | 41 | legacy-host-85 |
| 4 | 10m_air_rifle | women | 31 | Regional Framework | 52 | compact-host-86 |

This view answers: *which championship edition hosted which event, and what was the outcome?* It joins `shooting_events` to `championships` via the `championships_events` junction, producing rows that pair event_code and medal_awarded with championship_name and edition_number. A row might show the `10m_air_pistol` event (medal `gold`) belonging to the *Composite Protocol* at edition 19, while another row shows the `10m_air_rifle` event (medal `silver`) belonging to *Compact Programme A* at edition 30. This view is the primary lens for analysing event performance across tournament editions.

**View `vw_shooter_shooting_event_detail`**

```sql
CREATE VIEW vw_shooter_shooting_event_detail AS
SELECT a.id, a.shooter_id, a.full_name, b.id AS event_id, b.event_code AS event_event_code, b.gender_category AS event_gender_category
FROM shooters a
  JOIN shooters_events j ON j.shooter_id = a.id
  JOIN shooting_events b ON b.id = j.shooting_event_id;
```

| id | shooter_id | full_name | event_id | event_event_code | event_gender_category |
|---|---|---|---|---|---|
| 1 | 8189474 | Theodore Mcgrath | 1 | 10m_air_pistol | men |
| 1 | 8189474 | Theodore Mcgrath | 2 | 10m_air_rifle | women |
| 2 | 338520 | Account Name | 2 | 10m_air_rifle | women |
| 2 | 338520 | Account Name | 3 | 10m_air_pistol | men |
| 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport | 3 | 10m_air_pistol | men |
| 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport | 4 | 10m_air_rifle | women |
| 4 | 5082990 | Norma Fisher | 4 | 10m_air_rifle | women |
| 4 | 5082990 | Norma Fisher | 1 | 10m_air_pistol | men |

This view answers: *what events did a given shooter compete in, and how did they perform?* It joins `shooters` to `shooting_events` through the `events_shooters` junction, producing rows that combine shooter identity with event results. A representative row might show Norma Fisher (nationality `distributed-national-42`, Olympic champion `false`) competing in the `10m_air_rifle` event (gender `women`, final_score 24.80, medal `none`), while another row shows Theodore Mcgrath in the same event with medal `gold`. The view inverts the perspective of `vw_shooting_event_shooter_detail`, making shooter-centric queries efficient.

**View `vw_shooter_national_team`**

```sql
CREATE VIEW vw_shooter_national_team AS
SELECT a.id, a.shooter_id, a.full_name, a.nationality, b.id AS team_id, b.team_code AS team_team_code, b.country_name AS team_country_name
FROM shooters a JOIN national_teams b ON a.national_team_id = b.id;
```

| id | shooter_id | full_name | nationality | team_id | team_team_code | team_country_name |
|---|---|---|---|---|---|---|
| 1 | 8189474 | Theodore Mcgrath | composite-national-39 | 100 | 4447029 | Baseline Corridor D |
| 2 | 338520 | Account Name | primary-national-40 | 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series |
| 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport | adaptive-national-41 | 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment |
| 4 | 5082990 | Norma Fisher | distributed-national-42 | 103 | 6969423 | Primary Survey A |

This view answers: *which national team does a shooter belong to, and what are the team's aggregate statistics?* It joins `shooters` to `national_teams` on the `national_team_id` foreign key, producing rows that combine shooter identity with team-level metrics. A row might show Theodore Mcgrath (Olympic champion `true`) belonging to Baseline Corridor D (team_code `4447029`, total_score 75, team_rank 48, medal `gold`), while another row shows Account Name belonging to Distributed Series (total_score 1, team_rank 59, medal `silver`). This view is the primary lens for analysing team composition and performance.

**View `vw_national_team_shooting_event_detail`**

```sql
CREATE VIEW vw_national_team_shooting_event_detail AS
SELECT a.id, a.team_code, a.country_name, b.id AS event_id, b.event_code AS event_event_code, b.gender_category AS event_gender_category
FROM national_teams a
  JOIN teams_events j ON j.national_team_id = a.id
  JOIN shooting_events b ON b.id = j.shooting_event_id;
```

| id | team_code | country_name | event_id | event_event_code | event_gender_category |
|---|---|---|---|---|---|
| 100 | 4447029 | Baseline Corridor D | 1 | 10m_air_pistol | men |
| 100 | 4447029 | Baseline Corridor D | 2 | 10m_air_rifle | women |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 2 | 10m_air_rifle | women |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 3 | 10m_air_pistol | men |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 3 | 10m_air_pistol | men |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 4 | 10m_air_rifle | women |
| 103 | 6969423 | Primary Survey A | 4 | 10m_air_rifle | women |
| 103 | 6969423 | Primary Survey A | 1 | 10m_air_pistol | men |

This view answers: *which events did a national team's shooters compete in, and what were the outcomes?* It joins `national_teams` to `shooting_events` through both `teams_shooters` and `events_shooters`, producing rows that combine team identity with event results. A representative row might show Baseline Corridor D (total_score 75, medal `gold`) with shooters competing in the `10m_air_pistol` event (medal `gold`), while another row shows Distributed Series (total_score 1, medal `silver`) with shooters in the `10m_air_rifle` event (medal `silver`). This view enables team-level event performance analysis.

**View `vw_national_team_shooter_detail`**

```sql
CREATE VIEW vw_national_team_shooter_detail AS
SELECT a.id, a.team_code, a.country_name, b.id AS shooter_id, b.shooter_id AS shooter_shooter_id, b.full_name AS shooter_full_name
FROM national_teams a
  JOIN teams_shooters j ON j.national_team_id = a.id
  JOIN shooters b ON b.id = j.shooter_id;
```

| id | team_code | country_name | shooter_id | shooter_shooter_id | shooter_full_name |
|---|---|---|---|---|---|
| 100 | 4447029 | Baseline Corridor D | 1 | 8189474 | Theodore Mcgrath |
| 100 | 4447029 | Baseline Corridor D | 2 | 338520 | Account Name |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 2 | 338520 | Account Name |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 4 | 5082990 | Norma Fisher |
| 103 | 6969423 | Primary Survey A | 4 | 5082990 | Norma Fisher |
| 103 | 6969423 | Primary Survey A | 1 | 8189474 | Theodore Mcgrath |

This view answers: *which shooters belong to a given national team, and what are their individual credentials?* It joins `national_teams` to `shooters` on the `national_team_id` foreign key, producing rows that combine team-level metrics with shooter identity. A row might show Adaptive Assessment (total_score 6, team_rank 70, medal `bronze`) with shooter Saipan International Airport (Olympic champion `true`), while another row shows Primary Survey A (total_score 47, team_rank 81, medal `none`) with shooter Norma Fisher (Olympic champion `false`). This view is the primary lens for roster analysis.

**View `vw_championship_shooting_event_detail`**

```sql
CREATE VIEW vw_championship_shooting_event_detail AS
SELECT a.championship_name, a.edition_number, a.host_city, b.id AS event_id, b.event_code AS event_event_code, b.gender_category AS event_gender_category
FROM championships a
  JOIN championships_events j ON j.championship_edition_number = a.edition_number
  JOIN shooting_events b ON b.id = j.shooting_event_id;
```

| championship_name | edition_number | host_city | event_id | event_event_code | event_gender_category |
|---|---|---|---|---|---|
| Composite Protocol | 19 | seasonal-host-83 | 1 | 10m_air_pistol | men |
| Composite Protocol | 19 | seasonal-host-83 | 2 | 10m_air_rifle | women |
| Compact Programme A | 30 | regional-host-84 | 2 | 10m_air_rifle | women |
| Compact Programme A | 30 | regional-host-84 | 3 | 10m_air_pistol | men |
| Legacy Standard | 41 | legacy-host-85 | 3 | 10m_air_pistol | men |
| Legacy Standard | 41 | legacy-host-85 | 4 | 10m_air_rifle | women |
| Regional Framework | 52 | compact-host-86 | 4 | 10m_air_rifle | women |
| Regional Framework | 52 | compact-host-86 | 1 | 10m_air_pistol | men |

This view answers: *which events were hosted by a given championship, and what were their results?* It joins `championships` to `shooting_events` through the `championships_events` junction, producing rows that combine championship metadata with event outcomes. A row might show the *Composite Protocol* (edition 19, host_city `seasonal-host-83`, start_date `2022-09-05`) hosting the `10m_air_pistol` event (medal `gold`, final_rank 9), while another row shows *Regional Framework* (edition 52, host_city `compact-host-86`, start_date `2025-12-11`) hosting the `10m_air_rifle` event (medal `none`, final_rank 21). This view is the primary lens for tournament-level event reporting.

**View `vw_championship_location`**

```sql
CREATE VIEW vw_championship_location AS
SELECT a.championship_name, a.edition_number, a.host_city, a.host_country, b.id AS location_id, b.city_name AS location_city_name, b.country_name AS location_country_name
FROM championships a JOIN locations b ON a.location_id = b.id;
```

| championship_name | edition_number | host_city | host_country | location_id | location_city_name | location_country_name |
|---|---|---|---|---|---|---|
| Composite Protocol | 19 | seasonal-host-83 | composite-host-21 | 1 | Regional Protocol | Baseline Corridor D |
| Compact Programme A | 30 | regional-host-84 | primary-host-22 | 2 | Seasonal Programme D | Distributed Series |
| Legacy Standard | 41 | legacy-host-85 | adaptive-host-23 | 3 | Integrated Standard | Adaptive Assessment |
| Regional Framework | 52 | compact-host-86 | distributed-host-24 | 4 | Extended Framework | Primary Survey A |

This view answers: *where was each championship held?* It joins `championships` to `locations` on the `location_id` foreign key, producing rows that combine championship metadata with venue details. A row might show the *Composite Protocol* (edition 19, host_city `seasonal-host-83`) held at Regional Protocol in Baseline Corridor D, while another row shows *Compact Programme A* (edition 30, host_city `regional-host-84`) held at Seasonal Programme D in Distributed Series. This view is the simplest analytical view, collapsing the championship–location foreign key into a single denormalised row.

## Synthesis

The schema models the shooting sports domain through a disciplined separation of concerns: five entity tables capture the core concepts (events, shooters, teams, championships, locations), four junction tables materialise the many-to-many relationships that bind them, and eight views reassemble the normalised facts into domain-readable narratives. The foreign key architecture enforces referential integrity at every level—shooters reference national teams, events reference championships, championships reference locations, and junction tables reference their parent entities on both sides. The views provide the analytical surface: shooter-centric, team-centric, event-centric, and championship-centric perspectives, each answering a specific question by joining the appropriate subset of tables. The data itself—fictional organisations, athletes, and tournaments—demonstrates the model's capacity to represent a realistic competitive domain with full traceability from individual performance up through tournament-level aggregation.