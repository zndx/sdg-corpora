In the competitive shooting domain, every fact of participation, performance, and ranking is captured across a normalized relational schema that mirrors the ontology of events, athletes, disciplines, and results. The domain revolves around four core entity types: shooting events (temporal gatherings at named venues), shooters (individual athletes with biographical attributes), disciplines (sporting formats distinguished by weapon, distance, gender category, and individual or team format), and competition results (scored outcomes that bind a shooter to a discipline within an event). A fifth entity, team results, aggregates scores across shooters for team-format disciplines. The schema enforces referential integrity through foreign keys on the base tables and resolves many-to-many relationships through seven junction tables. Thirteen materialized views then reconstitute domain facts by joining these normalized tables, each view answering a specific analytical question about the intersection of shooters, events, disciplines, and results.

## Core Entity Types and Their Attributes

The foundation of the schema is the `shoo_shooting_events` table, which stores one row per competition gathering. Its primary key is `event_id`, a string identifier that in the sample data takes values such as `ChIJEctqrYFt5kcRUrBEPR-XXBE` for the "Composite Review" event and `4793467` for the "Regional Cluster" event. Each event carries a human-readable `event_name`, geographic location fields (`host_city` and `host_country`), a date range (`start_date` and `end_date`), and a `status` column that classifies the event as `upcoming`, `ongoing`, or `completed`. The sample data shows events spanning from September 2022 through December 2025, with statuses reflecting their lifecycle stage — for instance, the "Legacy Model" event (`69440`) is marked `completed`, while the "Regional Cluster" event (`4793467`) is `upcoming`.

**Table `shoo_shooting_events`**

| event_id | event_name | host_city | host_country | start_date | end_date | status |
|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | primary-host-76 | 2022-09-10 | 2022-09-09 | upcoming |
| 209230 | Compact Initiative A | pilot-host-56 | adaptive-host-77 | 2023-02-21 | 2023-02-20 | ongoing |
| 69440 | Legacy Model | extended-host-57 | distributed-host-78 | 2024-07-05 | 2024-07-04 | completed |
| 4793467 | Regional Cluster | integrated-host-58 | baseline-host-79 | 2025-12-16 | 2025-12-15 | upcoming |

The `shoo_shooters` table models individual athletes. Its surrogate primary key is `id` (an integer), while the business identifier `shooter_id` provides a secondary unique reference. The table stores `first_name` and `last_name` as separate columns — in the sample data, shooter `100` is "April Snyder" with nationality `composite-national-39` and gender `male`, while shooter `101` is "Juneau International Airport" (a fictional name) with nationality `primary-national-40` and gender `female`. The `birth_date` column records the athlete's date of birth, with sample values ranging from `2022-09-17` to `2025-12-23`.

**Table `shoo_shooters`**

| id | shooter_id | first_name | last_name | nationality | gender | birth_date |
|---|---|---|---|---|---|---|
| 100 | state_uk_4 | April Snyder | Katherine Hernandez | composite-national-39 | male | 2022-09-17 |
| 101 | 10445617 | Juneau International Airport | Tasha Rodriguez | primary-national-40 | female | 2023-02-01 |
| 102 | 8350031 | Jason Wright | Terry Mason | adaptive-national-41 | male | 2024-07-12 |
| 103 | 69436 | Lucas Robinson | Susan Wagner | distributed-national-42 | female | 2025-12-23 |

The `shoo_disciplines` table captures the sporting format of each competition segment. Its surrogate primary key is `id`, and it carries a business identifier `discipline_id` alongside descriptive columns: `discipline_name`, `weapon_type` (such as `air_pistol` or `air_rifle`), `distance` (a numeric value ranging from `0.08502511` to `208.24771` in the sample), `gender_category` (`men`, `women`, or `mixed`), and `format` (`individual` or `team`). Crucially, the `event_id` column is a foreign key referencing `shoo_shooting_events`, establishing that each discipline belongs to exactly one event. For example, discipline `1000` ("Distributed Review", `air_pistol`, distance `0.08502511`, men's individual) is linked to event `ChIJEctqrYFt5kcRUrBEPR-XXBE`.

**Table `shoo_disciplines`**

| id | discipline_id | discipline_name | weapon_type | distance | gender_category | format | event_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392481 | Distributed Review | air_pistol | 0.08502511 | men | individual | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 1001 | 9424927 | Adaptive Initiative D | air_rifle | 5.0 | women | team | 209230 |
| 1002 | 7441163 | Primary Model | air_pistol | 208.24771 | mixed | individual | 69440 |
| 1003 | 8189491 | Composite Cluster | air_rifle | 36.29999923706055 | men | team | 4793467 |

The `shoo_competition_results` table records scored outcomes. Its surrogate primary key is `id`, and it carries a business identifier `result_id` (which in the sample data includes both integer values like `9246316` and UUIDs like `eff267f4-8fcb-11eb-924d-9cd76263cbd0`). The table stores three score columns — `qualification_score`, `final_score`, and `aggregate_score` — along with `rank` (an integer position), `medal` (`gold`, `silver`, `bronze`, or `none`), and `status` (`qualified`, `eliminated`, or `completed`). Three foreign keys anchor each result: `shooter_id` references `shoo_shooters`, `discipline_id` references `shoo_disciplines`, and `event_id` references `shoo_shooting_events`. Result `1` (result_id `9246316`) shows shooter `100` in discipline `1000` at event `ChIJEctqrYFt5kcRUrBEPR-XXBE` with a qualification score of `28`, final score of `22.20`, aggregate of `6.20`, rank `16`, and a `gold` medal.

**Table `shoo_competition_results`**

| id | result_id | qualification_score | final_score | aggregate_score | rank | medal | status | shooter_id | discipline_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 9246316 | 28 | 22.20 | 6.20 | 16 | gold | qualified | 100 | 1000 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | ZUGLB8 | 37 | 26.40 | 9.40 | 20 | silver | eliminated | 101 | 1001 | 209230 |
| 3 | 10966217 | 46 | 30.60 | 12.60 | 24 | bronze | completed | 102 | 1002 | 69440 |
| 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 | 34.80 | 15.80 | 28 | none | qualified | 103 | 1003 | 4793467 |

The `shoo_team_results` table captures aggregated team scores. Its primary key is `team_result_id`, and it stores `total_score`, `rank`, `medal`, and `team_name` (such as "Integrated Framework A" or "Baseline Standard D"). Like competition results, it carries foreign keys `discipline_id` and `event_id` to anchor the team result to its discipline and event. Team result `1` shows "Integrated Framework A" with a total score of `12`, rank `16`, and a `gold` medal in discipline `1000` at event `ChIJEctqrYFt5kcRUrBEPR-XXBE`.

**Table `shoo_team_results`**

| team_result_id | total_score | rank | medal | team_name | discipline_id | event_id |
|---|---|---|---|---|---|---|
| 1 | 12 | 16 | gold | Integrated Framework A | 1000 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | 51 | 20 | silver | Extended Protocol | 1001 | 209230 |
| 3 | 50 | 24 | bronze | Pilot Programme | 1002 | 69440 |
| 4 | 30 | 28 | none | Baseline Standard D | 1003 | 4793467 |

## Junction Tables and Many-to-Many Relationships

Several relationships in the domain are many-to-many and therefore require junction tables. The `shoo_shooting_eventsShooter` table links events to shooters, recording which athletes participated in which events. In the sample data, event `ChIJEctqrYFt5kcRUrBEPR-XXBE` is associated with shooters `100` and `101`, while event `4793467` links shooters `103` and `100`. This table's composite key is `(event_id, shooter_id)`.

**Table `shoo_shooting_eventsShooter`**

| event_id | shooter_id |
|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 100 |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 101 |
| 209230 | 101 |
| 209230 | 102 |
| 69440 | 102 |
| 69440 | 103 |
| 4793467 | 103 |
| 4793467 | 100 |

The `shoo_shootersShootingEvent` table appears to be a mirror or alternative representation of the same event-shooter relationship, with columns `shooter_id` and `event_id`. Its presence alongside `shoo_shooting_eventsShooter` suggests the schema supports bidirectional navigation or is designed for different query patterns.

**Table `shoo_shootersShootingEvent`**

| shooter_id | event_id |
|---|---|
| 100 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 100 | 209230 |
| 101 | 209230 |
| 101 | 69440 |
| 102 | 69440 |
| 102 | 4793467 |
| 103 | 4793467 |
| 103 | ChIJEctqrYFt5kcRUrBEPR-XXBE |

The `shoo_shootersDiscipline` table links shooters to disciplines, recording which athletes are eligible or registered for which formats. This relationship is independent of any specific event, allowing a shooter to be associated with multiple disciplines across different events.

**Table `shoo_shootersDiscipline`**

| shooter_id | discipline_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `shoo_shooting_eventsCompetitionResult` table links events to competition results, providing a direct event-to-result association that complements the indirect path through disciplines. This junction enables queries that ask which results belong to which events without traversing the discipline table.

**Table `shoo_shooting_eventsCompetitionResult`**

| event_id | competition_result_id |
|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 1 |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | 2 |
| 209230 | 2 |
| 209230 | 3 |
| 69440 | 3 |
| 69440 | 4 |
| 4793467 | 4 |
| 4793467 | 1 |

The `shoo_shootersCompetitionResult` table links shooters to their competition results, providing a direct athlete-to-result association. This is useful for queries that aggregate or filter results by shooter without needing to join through the competition_results table's own `shooter_id` foreign key.

**Table `shoo_shootersCompetitionResult`**

| shooter_id | competition_result_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `shoo_disciplinesCompetitionResult` table links disciplines to competition results, providing a direct format-to-result association. This complements the `shoo_competition_results` table's own `discipline_id` foreign key and enables queries that aggregate results by discipline.

**Table `shoo_disciplinesCompetitionResult`**

| discipline_id | competition_result_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `shoo_team_resultsShooter` table links team results to individual shooters, recording which athletes contributed to which team scores. This resolves the many-to-many relationship between team results and shooters, as a single shooter may appear in multiple team results across different disciplines and events.

**Table `shoo_team_resultsShooter`**

| team_result_id | shooter_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Materialized Views and Domain Fact Reconstruction

The schema includes thirteen materialized views that reconstitute domain facts by joining the normalized base and junction tables. Each view answers a specific analytical question by denormalizing the schema along a particular axis.

The view `v_shooting_event_shooter_detail` joins `shoo_shooting_events` with `shoo_shooting_eventsShooter` (and potentially `shoo_shooters`) to produce a flat record of which shooters participated in which events. Reading a row from this view, one would see the event name "Composite Review" alongside shooter "April Snyder", directly answering the question "who competed at this event?"

**View `v_shooting_event_shooter_detail`**

```sql
CREATE VIEW v_shooting_event_shooter_detail AS
SELECT a.event_id, a.event_name, a.host_city, b.id AS shooter_id, b.shooter_id AS shooter_shooter_id, b.first_name AS shooter_first_name
FROM shoo_shooting_events a
  JOIN shoo_shooting_eventsShooter j ON j.event_id = a.event_id
  JOIN shoo_shooters b ON b.id = j.shooter_id;
```

| event_id | event_name | host_city | shooter_id | shooter_shooter_id | shooter_first_name |
|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | 100 | state_uk_4 | April Snyder |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | 101 | 10445617 | Juneau International Airport |
| 209230 | Compact Initiative A | pilot-host-56 | 101 | 10445617 | Juneau International Airport |
| 209230 | Compact Initiative A | pilot-host-56 | 102 | 8350031 | Jason Wright |
| 69440 | Legacy Model | extended-host-57 | 102 | 8350031 | Jason Wright |
| 69440 | Legacy Model | extended-host-57 | 103 | 69436 | Lucas Robinson |
| 4793467 | Regional Cluster | integrated-host-58 | 103 | 69436 | Lucas Robinson |
| 4793467 | Regional Cluster | integrated-host-58 | 100 | state_uk_4 | April Snyder |

The view `v_shooting_event_competition_result_detail` joins `shoo_shooting_events` with `shoo_shooting_eventsCompetitionResult` and `shoo_competition_results` to produce a flat record of all competition results within an event. A row from this view would show the event "Composite Review" alongside result `9246316` with its qualification score of `28` and gold medal, answering "what were the scored outcomes at this event?"

**View `v_shooting_event_competition_result_detail`**

```sql
CREATE VIEW v_shooting_event_competition_result_detail AS
SELECT a.event_id, a.event_name, a.host_city, b.id AS result_id, b.result_id AS result_result_id, b.qualification_score AS result_qualification_score
FROM shoo_shooting_events a
  JOIN shoo_shooting_eventsCompetitionResult j ON j.event_id = a.event_id
  JOIN shoo_competition_results b ON b.id = j.competition_result_id;
```

| event_id | event_name | host_city | result_id | result_result_id | result_qualification_score |
|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | 1 | 9246316 | 28 |
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | 2 | ZUGLB8 | 37 |
| 209230 | Compact Initiative A | pilot-host-56 | 2 | ZUGLB8 | 37 |
| 209230 | Compact Initiative A | pilot-host-56 | 3 | 10966217 | 46 |
| 69440 | Legacy Model | extended-host-57 | 3 | 10966217 | 46 |
| 69440 | Legacy Model | extended-host-57 | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 4793467 | Regional Cluster | integrated-host-58 | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 4793467 | Regional Cluster | integrated-host-58 | 1 | 9246316 | 28 |

The view `v_shooter_shooting_event_detail` joins `shoo_shooters` with `shoo_shootersShootingEvent` and `shoo_shooting_events` to produce a flat record of which events each shooter participated in. A row would show shooter "April Snyder" (id `100`) alongside event "Composite Review", answering "which events did this athlete compete in?"

**View `v_shooter_shooting_event_detail`**

```sql
CREATE VIEW v_shooter_shooting_event_detail AS
SELECT a.id, a.shooter_id, a.first_name, b.event_id AS event_event_id, b.event_name AS event_event_name, b.host_city AS event_host_city
FROM shoo_shooters a
  JOIN shoo_shootersShootingEvent j ON j.shooter_id = a.id
  JOIN shoo_shooting_events b ON b.event_id = j.event_id;
```

| id | shooter_id | first_name | event_event_id | event_event_name | event_host_city |
|---|---|---|---|---|---|
| 100 | state_uk_4 | April Snyder | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 |
| 100 | state_uk_4 | April Snyder | 209230 | Compact Initiative A | pilot-host-56 |
| 101 | 10445617 | Juneau International Airport | 209230 | Compact Initiative A | pilot-host-56 |
| 101 | 10445617 | Juneau International Airport | 69440 | Legacy Model | extended-host-57 |
| 102 | 8350031 | Jason Wright | 69440 | Legacy Model | extended-host-57 |
| 102 | 8350031 | Jason Wright | 4793467 | Regional Cluster | integrated-host-58 |
| 103 | 69436 | Lucas Robinson | 4793467 | Regional Cluster | integrated-host-58 |
| 103 | 69436 | Lucas Robinson | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 |

The view `v_shooter_discipline_detail` joins `shoo_shooters` with `shoo_shootersDiscipline` and `shoo_disciplines` to produce a flat record of which disciplines each shooter is associated with. A row would show shooter "April Snyder" alongside discipline "Distributed Review" with weapon type `air_pistol`, answering "what formats is this athlete registered for?"

**View `v_shooter_discipline_detail`**

```sql
CREATE VIEW v_shooter_discipline_detail AS
SELECT a.id, a.shooter_id, a.first_name, b.id AS discipline_id, b.discipline_id AS discipline_discipline_id, b.discipline_name AS discipline_discipline_name
FROM shoo_shooters a
  JOIN shoo_shootersDiscipline j ON j.shooter_id = a.id
  JOIN shoo_disciplines b ON b.id = j.discipline_id;
```

| id | shooter_id | first_name | discipline_id | discipline_discipline_id | discipline_discipline_name |
|---|---|---|---|---|---|
| 100 | state_uk_4 | April Snyder | 1000 | 392481 | Distributed Review |
| 100 | state_uk_4 | April Snyder | 1001 | 9424927 | Adaptive Initiative D |
| 101 | 10445617 | Juneau International Airport | 1001 | 9424927 | Adaptive Initiative D |
| 101 | 10445617 | Juneau International Airport | 1002 | 7441163 | Primary Model |
| 102 | 8350031 | Jason Wright | 1002 | 7441163 | Primary Model |
| 102 | 8350031 | Jason Wright | 1003 | 8189491 | Composite Cluster |
| 103 | 69436 | Lucas Robinson | 1003 | 8189491 | Composite Cluster |
| 103 | 69436 | Lucas Robinson | 1000 | 392481 | Distributed Review |

The view `v_shooter_competition_result_detail` joins `shoo_shooters` with `shoo_shootersCompetitionResult` and `shoo_competition_results` to produce a flat record of each shooter's scored outcomes. A row would show shooter "April Snyder" alongside result `9246316` with a gold medal and rank `16`, answering "what are this athlete's competition results?"

**View `v_shooter_competition_result_detail`**

```sql
CREATE VIEW v_shooter_competition_result_detail AS
SELECT a.id, a.shooter_id, a.first_name, b.id AS result_id, b.result_id AS result_result_id, b.qualification_score AS result_qualification_score
FROM shoo_shooters a
  JOIN shoo_shootersCompetitionResult j ON j.shooter_id = a.id
  JOIN shoo_competition_results b ON b.id = j.competition_result_id;
```

| id | shooter_id | first_name | result_id | result_result_id | result_qualification_score |
|---|---|---|---|---|---|
| 100 | state_uk_4 | April Snyder | 1 | 9246316 | 28 |
| 100 | state_uk_4 | April Snyder | 2 | ZUGLB8 | 37 |
| 101 | 10445617 | Juneau International Airport | 2 | ZUGLB8 | 37 |
| 101 | 10445617 | Juneau International Airport | 3 | 10966217 | 46 |
| 102 | 8350031 | Jason Wright | 3 | 10966217 | 46 |
| 102 | 8350031 | Jason Wright | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 103 | 69436 | Lucas Robinson | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 103 | 69436 | Lucas Robinson | 1 | 9246316 | 28 |

The view `v_discipline_shooting_event` joins `shoo_disciplines` with `shoo_shooting_events` (via the `event_id` foreign key) to produce a flat record of which disciplines belong to which events. A row would show discipline "Distributed Review" alongside event "Composite Review", answering "which disciplines are offered at this event?"

**View `v_discipline_shooting_event`**

```sql
CREATE VIEW v_discipline_shooting_event AS
SELECT a.id, a.discipline_id, a.discipline_name, a.weapon_type, b.event_id AS event_event_id, b.event_name AS event_event_name, b.host_city AS event_host_city
FROM shoo_disciplines a JOIN shoo_shooting_events b ON a.event_id = b.event_id;
```

| id | discipline_id | discipline_name | weapon_type | event_event_id | event_event_name | event_host_city |
|---|---|---|---|---|---|---|
| 1000 | 392481 | Distributed Review | air_pistol | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 |
| 1001 | 9424927 | Adaptive Initiative D | air_rifle | 209230 | Compact Initiative A | pilot-host-56 |
| 1002 | 7441163 | Primary Model | air_pistol | 69440 | Legacy Model | extended-host-57 |
| 1003 | 8189491 | Composite Cluster | air_rifle | 4793467 | Regional Cluster | integrated-host-58 |

The view `v_discipline_competition_result_detail` joins `shoo_disciplines` with `shoo_disciplinesCompetitionResult` and `shoo_competition_results` to produce a flat record of all competition results within a discipline. A row would show discipline "Distributed Review" alongside result `9246316` with a qualification score of `28`, answering "what were the scored outcomes in this discipline?"

**View `v_discipline_competition_result_detail`**

```sql
CREATE VIEW v_discipline_competition_result_detail AS
SELECT a.id, a.discipline_id, a.discipline_name, b.id AS result_id, b.result_id AS result_result_id, b.qualification_score AS result_qualification_score
FROM shoo_disciplines a
  JOIN shoo_disciplinesCompetitionResult j ON j.discipline_id = a.id
  JOIN shoo_competition_results b ON b.id = j.competition_result_id;
```

| id | discipline_id | discipline_name | result_id | result_result_id | result_qualification_score |
|---|---|---|---|---|---|
| 1000 | 392481 | Distributed Review | 1 | 9246316 | 28 |
| 1000 | 392481 | Distributed Review | 2 | ZUGLB8 | 37 |
| 1001 | 9424927 | Adaptive Initiative D | 2 | ZUGLB8 | 37 |
| 1001 | 9424927 | Adaptive Initiative D | 3 | 10966217 | 46 |
| 1002 | 7441163 | Primary Model | 3 | 10966217 | 46 |
| 1002 | 7441163 | Primary Model | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 1003 | 8189491 | Composite Cluster | 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 |
| 1003 | 8189491 | Composite Cluster | 1 | 9246316 | 28 |

The view `v_competition_result_shooter` joins `shoo_competition_results` with `shoo_shootersCompetitionResult` and `shoo_shooters` to produce a flat record of each competition result alongside the shooter's identity. A row would show result `9246316` alongside shooter "April Snyder" with nationality `composite-national-39`, answering "which athlete achieved this result?"

**View `v_competition_result_shooter`**

```sql
CREATE VIEW v_competition_result_shooter AS
SELECT a.id, a.result_id, a.qualification_score, a.final_score, b.id AS shooter_id, b.shooter_id AS shooter_shooter_id, b.first_name AS shooter_first_name
FROM shoo_competition_results a JOIN shoo_shooters b ON a.shooter_id = b.id;
```

| id | result_id | qualification_score | final_score | shooter_id | shooter_shooter_id | shooter_first_name |
|---|---|---|---|---|---|---|
| 1 | 9246316 | 28 | 22.20 | 100 | state_uk_4 | April Snyder |
| 2 | ZUGLB8 | 37 | 26.40 | 101 | 10445617 | Juneau International Airport |
| 3 | 10966217 | 46 | 30.60 | 102 | 8350031 | Jason Wright |
| 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 | 34.80 | 103 | 69436 | Lucas Robinson |

The view `v_competition_result_discipline` joins `shoo_competition_results` with `shoo_disciplinesCompetitionResult` and `shoo_disciplines` to produce a flat record of each competition result alongside the discipline's identity. A row would show result `9246316` alongside discipline "Distributed Review" with weapon type `air_pistol` and distance `0.08502511`, answering "in which format was this result achieved?"

**View `v_competition_result_discipline`**

```sql
CREATE VIEW v_competition_result_discipline AS
SELECT a.id, a.result_id, a.qualification_score, a.final_score, b.id AS discipline_id, b.discipline_id AS discipline_discipline_id, b.discipline_name AS discipline_discipline_name
FROM shoo_competition_results a JOIN shoo_disciplines b ON a.discipline_id = b.id;
```

| id | result_id | qualification_score | final_score | discipline_id | discipline_discipline_id | discipline_discipline_name |
|---|---|---|---|---|---|---|
| 1 | 9246316 | 28 | 22.20 | 1000 | 392481 | Distributed Review |
| 2 | ZUGLB8 | 37 | 26.40 | 1001 | 9424927 | Adaptive Initiative D |
| 3 | 10966217 | 46 | 30.60 | 1002 | 7441163 | Primary Model |
| 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 | 34.80 | 1003 | 8189491 | Composite Cluster |

The view `v_competition_result_shooting_event` joins `shoo_competition_results` with `shoo_shooting_eventsCompetitionResult` and `shoo_shooting_events` to produce a flat record of each competition result alongside the event's identity. A row would show result `9246316` alongside event "Composite Review" hosted in `baseline-host-55`, answering "at which event was this result achieved?"

**View `v_competition_result_shooting_event`**

```sql
CREATE VIEW v_competition_result_shooting_event AS
SELECT a.id, a.result_id, a.qualification_score, a.final_score, b.event_id AS event_event_id, b.event_name AS event_event_name, b.host_city AS event_host_city
FROM shoo_competition_results a JOIN shoo_shooting_events b ON a.event_id = b.event_id;
```

| id | result_id | qualification_score | final_score | event_event_id | event_event_name | event_host_city |
|---|---|---|---|---|---|---|
| 1 | 9246316 | 28 | 22.20 | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 |
| 2 | ZUGLB8 | 37 | 26.40 | 209230 | Compact Initiative A | pilot-host-56 |
| 3 | 10966217 | 46 | 30.60 | 69440 | Legacy Model | extended-host-57 |
| 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 | 34.80 | 4793467 | Regional Cluster | integrated-host-58 |

The view `v_team_result_discipline` joins `shoo_team_results` with `shoo_disciplines` (via the `discipline_id` foreign key) to produce a flat record of each team result alongside its discipline. A row would show team "Integrated Framework A" with total score `12` and gold medal in discipline "Distributed Review", answering "which discipline did this team compete in?"

**View `v_team_result_discipline`**

```sql
CREATE VIEW v_team_result_discipline AS
SELECT a.team_result_id, a.total_score, a.rank, a.medal, b.id AS discipline_id, b.discipline_id AS discipline_discipline_id, b.discipline_name AS discipline_discipline_name
FROM shoo_team_results a JOIN shoo_disciplines b ON a.discipline_id = b.id;
```

| team_result_id | total_score | rank | medal | discipline_id | discipline_discipline_id | discipline_discipline_name |
|---|---|---|---|---|---|---|
| 1 | 12 | 16 | gold | 1000 | 392481 | Distributed Review |
| 2 | 51 | 20 | silver | 1001 | 9424927 | Adaptive Initiative D |
| 3 | 50 | 24 | bronze | 1002 | 7441163 | Primary Model |
| 4 | 30 | 28 | none | 1003 | 8189491 | Composite Cluster |

The view `v_team_result_shooting_event` joins `shoo_team_results` with `shoo_shooting_events` (via the `event_id` foreign key) to produce a flat record of each team result alongside its event. A row would show team "Integrated Framework A" with total score `12` at event "Composite Review", answering "at which event did this team compete?"

**View `v_team_result_shooting_event`**

```sql
CREATE VIEW v_team_result_shooting_event AS
SELECT a.team_result_id, a.total_score, a.rank, a.medal, b.event_id AS event_event_id, b.event_name AS event_event_name, b.host_city AS event_host_city
FROM shoo_team_results a JOIN shoo_shooting_events b ON a.event_id = b.event_id;
```

| team_result_id | total_score | rank | medal | event_event_id | event_event_name | event_host_city |
|---|---|---|---|---|---|---|
| 1 | 12 | 16 | gold | ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 |
| 2 | 51 | 20 | silver | 209230 | Compact Initiative A | pilot-host-56 |
| 3 | 50 | 24 | bronze | 69440 | Legacy Model | extended-host-57 |
| 4 | 30 | 28 | none | 4793467 | Regional Cluster | integrated-host-58 |

The view `v_team_result_shooter_detail` joins `shoo_team_results` with `shoo_team_resultsShooter`, `shoo_shooters`, and potentially `shoo_disciplines` to produce a flat record of each team result alongside the contributing shooters' identities. A row would show team "Integrated Framework A" alongside shooter "April Snyder" with a gold medal, answering "which athletes contributed to this team's score?"

**View `v_team_result_shooter_detail`**

```sql
CREATE VIEW v_team_result_shooter_detail AS
SELECT a.team_result_id, a.total_score, a.rank, b.id AS shooter_id, b.shooter_id AS shooter_shooter_id, b.first_name AS shooter_first_name
FROM shoo_team_results a
  JOIN shoo_team_resultsShooter j ON j.team_result_id = a.team_result_id
  JOIN shoo_shooters b ON b.id = j.shooter_id;
```

| team_result_id | total_score | rank | shooter_id | shooter_shooter_id | shooter_first_name |
|---|---|---|---|---|---|
| 1 | 12 | 16 | 100 | state_uk_4 | April Snyder |
| 1 | 12 | 16 | 101 | 10445617 | Juneau International Airport |
| 2 | 51 | 20 | 101 | 10445617 | Juneau International Airport |
| 2 | 51 | 20 | 102 | 8350031 | Jason Wright |
| 3 | 50 | 24 | 102 | 8350031 | Jason Wright |
| 3 | 50 | 24 | 103 | 69436 | Lucas Robinson |
| 4 | 30 | 28 | 103 | 69436 | Lucas Robinson |
| 4 | 30 | 28 | 100 | state_uk_4 | April Snyder |

## Synthesis

The schema models the competitive shooting domain as a network of four base entities connected through foreign keys and seven junction tables that resolve many-to-many relationships. The base tables enforce a clear hierarchy: disciplines belong to events, competition results bind shooters to disciplines within events, and team results aggregate scores at the discipline level. The junction tables — `shoo_shooting_eventsShooter`, `shoo_shootersShootingEvent`, `shoo_shootersDiscipline`, `shoo_shooting_eventsCompetitionResult`, `shoo_shootersCompetitionResult`, `shoo_disciplinesCompetitionResult`, and `shoo_team_resultsShooter` — provide the flexible connectivity needed to answer cross-cutting questions about participation, eligibility, and performance. The thirteen materialized views then denormalize this structure along twelve distinct axes, each view reconstructing a domain fact by joining the appropriate combination of base and junction tables. Together, the tables and views form a complete relational model of the shooting sports ontology, where every row in every view can be traced back through foreign keys and junction tables to the normalized base entities that store the authoritative data.