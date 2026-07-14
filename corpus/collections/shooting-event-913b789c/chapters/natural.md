The architecture of competitive shooting is built upon a structured ecosystem of events, athletes, national delegations, and championship tournaments. Each competition cycle produces a cascade of records: individual performances are logged against specific event codes and gender categories, athletes are enrolled in national teams, and those teams aggregate into championship-level standings. The data model captures this hierarchy through a set of core tables and a collection of analytical views that join them into interpretable summaries. Understanding how these pieces relate is essential for anyone tracking results, generating reports, or building downstream applications on top of the competition database.

## The Competition Calendar

At the center of the domain are shooting events, each identified by a unique event code and tied to a specific championship edition. The `shooting_events` table records the competitive parameters for every individual contest.

**Table `shooting_events`**

| id | event_code | gender_category | qualification_score | final_score | final_rank | medal_awarded | championship_edition_number |
|---|---|---|---|---|---|---|---|
| 1 | 10m_air_pistol | men | 16 | 12.20 | 9 | gold | 19 |
| 2 | 10m_air_rifle | women | 21 | 16.40 | 13 | silver | 30 |
| 3 | 10m_air_pistol | men | 26 | 20.60 | 17 | bronze | 41 |
| 4 | 10m_air_rifle | women | 31 | 24.80 | 21 | none | 52 |

An event such as `10m_air_pistol` in the men's category produced a qualification score of 16 and a final score of 12.20, earning the competitor a gold medal at championship edition 19. The same event code appears again in a different row with a qualification score of 26, a final score of 20.60, and a bronze medal awarded at edition 41. The women's `10m_air_rifle` event shows a qualification score of 21 and a final score of 16.40 at edition 30, with silver awarded, while a separate row for the same event code at edition 52 recorded a qualification score of 31, a final score of 24.80, and no medal. The `final_rank` column provides an ordinal placement, ranging from 9 to 21 across the sample, and `medal_awarded` captures the outcome as `gold`, `silver`, `bronze`, or `none`. The `championship_edition_number` links each event to its parent tournament, establishing the first layer of relational structure.

Championships themselves are catalogued in the `championships` table, which stores the administrative and temporal metadata for each tournament.

**Table `championships`**

| championship_name | edition_number | host_city | host_country | start_date | end_date | location_id |
|---|---|---|---|---|---|---|
| Composite Protocol | 19 | seasonal-host-83 | composite-host-21 | 2022-09-05 | 2022-09-01 | 1 |
| Compact Programme A | 30 | regional-host-84 | primary-host-22 | 2023-02-16 | 2023-02-12 | 2 |
| Legacy Standard | 41 | legacy-host-85 | adaptive-host-23 | 2024-07-27 | 2024-07-23 | 3 |
| Regional Framework | 52 | compact-host-86 | distributed-host-24 | 2025-12-11 | 2025-12-07 | 4 |

The Composite Protocol, held in edition 19, took place at seasonal-host-83 in composite-host-21, running from 2022-09-05 to 2022-09-01. The Compact Programme A, edition 30, was hosted at regional-host-84 in primary-host-22 during February 2023. The Legacy Standard, edition 41, occurred at legacy-host-85 in adaptive-host-23 in July 2024, and the Regional Framework, edition 52, was scheduled for compact-host-86 in distributed-host-24 in December 2025. The `location_id` column in this table references the `locations` table, creating a foreign-key relationship that grounds each championship in a physical venue.

The `locations` table provides the geographic anchor for every championship.

**Table `locations`**

| id | city_name | country_name |
|---|---|---|
| 1 | Regional Protocol | Baseline Corridor D |
| 2 | Seasonal Programme D | Distributed Series |
| 3 | Integrated Standard | Adaptive Assessment |
| 4 | Extended Framework | Primary Survey A |

Location 1 corresponds to Regional Protocol in Baseline Corridor D, location 2 to Seasonal Programme D in Distributed Series, location 3 to Integrated Standard in Adaptive Assessment, and location 4 to Extended Framework in Primary Survey A. These entries are purely fictional and serve as the addressable entities that championships point to through their `location_id` foreign key.

## Athletes and National Delegations

Individual competitors are stored in the `shooters` table, which assigns each athlete a unique `shooter_id`, a full name, a nationality label, and a boolean flag indicating Olympic champion status.

**Table `shooters`**

| id | shooter_id | full_name | nationality | is_olympic_champion | national_team_id |
|---|---|---|---|---|---|
| 1 | 8189474 | Theodore Mcgrath | composite-national-39 | true | 100 |
| 2 | 338520 | Account Name | primary-national-40 | false | 101 |
| 3 | ChIJCbVGx_tt5kcRJYrXOupoDgA | Saipan International Airport | adaptive-national-41 | true | 102 |
| 4 | 5082990 | Norma Fisher | distributed-national-42 | false | 103 |

The shooter with identifier 8189474, named Theodore Mcgrath, holds the nationality `composite-national-39` and is marked as an Olympic champion (`true`). The entry with shooter_id 338520, labeled Account Name, carries the nationality `primary-national-40` and is not an Olympic champion. The third row, identified by the composite key ChIJCbVGx_tt5kcRJYrXOupoDgA, is associated with Saipan International Airport and the nationality `adaptive-national-41`, with Olympic champion status set to true. The fourth shooter, Norma Fisher (identifier 5082990), belongs to `distributed-national-42` and is not an Olympic champion. Every shooter record includes a `national_team_id` that references the `national_teams` table, forming the primary link between individual athletes and their national delegations.

National teams are the organizational units that aggregate shooter performances at the championship level. The `national_teams` table stores each team's code, country name, total score, rank, and medal outcome.

**Table `national_teams`**

| id | team_code | country_name | total_score | team_rank | team_medal | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | 4447029 | Baseline Corridor D | 75 | 48 | gold | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Series | 1 | 59 | silver | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Assessment | 6 | 70 | bronze | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 6969423 | Primary Survey A | 47 | 81 | none | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Team 100, coded as 4447029 and named Baseline Corridor D, accumulated a total score of 75, achieved a team rank of 48, and was awarded a gold medal. Team 101, identified by the UUID fbbddc7a-9bac-11eb-a8a2-19ed5c03f8d3 and called Distributed Series, scored 1 point, ranked 59th, and received silver. Team 102, with code 2bc4a76a-8fcc-11eb-924d-9cd76263cbd0 and the name Adaptive Assessment, totaled 6 points, ranked 70th, and earned bronze. Team 103, coded 6969423 and named Primary Survey A, scored 47 points, ranked 81st, and received no medal. The `created_at` and `updated_at` timestamps record when each team's profile was first created and last modified, providing an audit trail for team data.

## Relational Junctions

The domain employs several junction tables to model the many-to-many relationships that arise when shooters participate in multiple events, teams field competitors across events, and championships host numerous events. The `events_shooters` table is the most direct of these junctions, linking a `shooting_event_id` to a `shooter_id`.

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

Event 1 includes shooters 1 and 2. Event 2 includes shooters 2 and 3. Event 3 includes shooters 3 and 4. Event 4 includes shooters 4 and 1. This pattern shows that each event fields exactly two shooters in the sample data, and each shooter participates in exactly two events, forming a cyclic enrollment structure.

The `shooters_events` table mirrors this relationship from the shooter's perspective, pairing a `shooter_id` with a `shooting_event_id`.

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

The data in this table is the inverse of `events_shooters`: shooter 1 is enrolled in events 1 and 4, shooter 2 in events 1 and 2, shooter 3 in events 2 and 3, and shooter 4 in events 3 and 4. The presence of both tables reflects a design choice to allow efficient lookups from either direction — from event to shooters or from shooter to events — without requiring the application layer to invert joins.

The `teams_events` table connects national teams to the shooting events they compete in.

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

Team 100 participates in events 1 and 4. Team 101 participates in events 1 and 2. Team 102 participates in events 2 and 3. Team 103 participates in events 3 and 4. This mirrors the shooter-event enrollment pattern, suggesting that each team fields competitors in the same pair of events as its constituent shooters.

The `teams_shooters` table establishes the membership relationship between national teams and individual shooters.

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

Team 100 includes shooters 1 and 2. Team 101 includes shooters 2 and 3. Team 102 includes shooters 3 and 4. Team 103 includes shooters 4 and 1. This creates a rotational assignment where each shooter belongs to two teams and each team fields two shooters, reinforcing the interconnected nature of the competition structure.

The `championships_events` table links championships to the shooting events they contain.

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

Championship edition 19 hosts events 1 and 4. Championship edition 30 hosts events 1 and 2. Championship edition 41 hosts events 2 and 3. Championship edition 52 hosts events 3 and 4. This mapping confirms that each championship contains exactly two events in the sample, and each event belongs to exactly one championship, establishing a clean parent-child relationship between tournaments and their constituent competitions.

## Analytical Views

The database provides a set of materialized or virtual views that join the base tables into ready-to-consume summaries. Each view answers a specific analytical question by combining data from multiple tables.

The view `vw_shooting_event_shooter_detail` enriches each event record with the shooter who competed in it.

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

This view answers the question: which shooter competed in which event, and what was the result? Reading the first row, event 1 (10m_air_pistol, men's category, gold medal) is associated with shooter 1 (Theodore Mcgrath, composite-national-39, Olympic champion). The second row shows the same event paired with shooter 2 (Account Name, primary-national-40, not an Olympic champion). The view effectively materializes the `events_shooters` junction by pulling in shooter details, allowing analysts to see event outcomes alongside competitor profiles in a single row.

The view `vw_shooting_event_championship` joins event records to their parent championship.

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

This view answers: which championship does each event belong to, and what are the championship's administrative details? The first row shows event 1 linked to the Composite Protocol (edition 19, hosted at seasonal-host-83 in composite-host-21, running from 2022-09-05 to 2022-09-01). The second row connects event 2 to the Compact Programme A (edition 30, regional-host-84, primary-host-22, February 2023). This join is essential for any report that needs to filter or group events by their hosting tournament.

The view `vw_shooter_shooting_event_detail` provides the inverse perspective, starting from the shooter and listing their event participations.

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

This view answers: what events has a given shooter competed in, and how did they perform? The first row shows shooter 1 (Theodore Mcgrath) competing in event 1 (10m_air_pistol, men, gold medal, final score 12.20). The second row shows the same shooter in event 4 (10m_air_rifle, women, no medal, final score 24.80). This view is particularly useful for generating athlete career summaries or performance histories.

The view `vw_shooter_national_team` links each shooter to their national team.

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

This view answers: which national team does a shooter represent? The first row shows shooter 1 (Theodore Mcgrath) on team 100 (Baseline Corridor D, total score 75, rank 48, gold medal). The second row shows shooter 2 (Account Name) on team 101 (Distributed Series, total score 1, rank 59, silver medal). This join is the foundation for any analysis that compares shooter performance against team-level outcomes.

The view `vw_national_team_shooting_event_detail` combines team and event data to show which events each team competed in.

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

This view answers: which events did a national team participate in, and what were the event-level results? The first row shows team 100 (Baseline Corridor D) in event 1 (10m_air_pistol, men, gold medal, final score 12.20). The second row shows the same team in event 4 (10m_air_rifle, women, no medal, final score 24.80). This view is valuable for understanding team-level event coverage and correlating team scores with individual event outcomes.

The view `vw_national_team_shooter_detail` joins team records to their constituent shooters.

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

This view answers: which shooters belong to a given national team, and what are their individual profiles? The first row shows team 100 (Baseline Corridor D) with shooter 1 (Theodore Mcgrath, composite-national-39, Olympic champion). The second row shows the same team with shooter 2 (Account Name, primary-national-40, not an Olympic champion). This view is the operational counterpart to `teams_shooters`, providing a fully resolved roster for each team.

The view `vw_championship_shooting_event_detail` connects championship metadata to the events they host.

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

This view answers: which events are part of a given championship, and what are the event results? The first row shows the Composite Protocol (edition 19, seasonal-host-83, composite-host-21) hosting event 1 (10m_air_pistol, men, gold medal, final score 12.20). The second row shows the same championship hosting event 4 (10m_air_rifle, women, no medal, final score 24.80). This view is essential for generating championship-level result summaries.

The view `vw_championship_location` joins championship records to their geographic locations.

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

This view answers: where was each championship held? The first row shows the Composite Protocol (edition 19) held at Regional Protocol in Baseline Corridor D. The second row shows the Compact Programme A (edition 30) at Seasonal Programme D in Distributed Series. The third row shows the Legacy Standard (edition 41) at Integrated Standard in Adaptive Assessment. The fourth row shows the Regional Framework (edition 52) at Extended Framework in Primary Survey A. This view resolves the `location_id` foreign key from the championships table into human-readable geographic information, completing the chain from tournament to venue.

## Synthesis

The competition database models a multi-layered structure: championships host events, events enroll shooters, shooters belong to national teams, and teams compete within events. The base tables capture each entity in isolation, while the junction tables (`events_shooters`, `shooters_events`, `teams_events`, `teams_shooters`, `championships_events`) express the many-to-many relationships that bind them together. The views then materialize these relationships into analytical summaries that answer concrete questions — which shooter competed in which event, which team represents which athletes, which championship hosted which events, and where each championship took place. Together, the tables and views form a coherent record of competitive shooting results, from the individual performance to the championship-level standings.