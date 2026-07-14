# Competitive Shooting Event Management: Records, Relationships, and Query Views

Competitive shooting organizations coordinate a complex ecosystem of events, athletes, disciplines, and results. Each competition brings together shooters who specialize in particular disciplines—air pistol, air rifle, and others—competing over defined distances and formats. The records that capture this domain are organized around five core entities: the shooting events themselves, the shooters who compete, the disciplines within which they compete, the individual competition results, and the team results that aggregate performance across squad members. Understanding how these records interlock is essential for anyone managing tournament logistics, analyzing athlete performance, or generating reports for stakeholders.

**Table `shoo_shooting_events`**

| event_id | event_name | host_city | host_country | start_date | end_date | status |
|---|---|---|---|---|---|---|
| ChIJEctqrYFt5kcRUrBEPR-XXBE | Composite Review | baseline-host-55 | primary-host-76 | 2022-09-10 | 2022-09-09 | upcoming |
| 209230 | Compact Initiative A | pilot-host-56 | adaptive-host-77 | 2023-02-21 | 2023-02-20 | ongoing |
| 69440 | Legacy Model | extended-host-57 | distributed-host-78 | 2024-07-05 | 2024-07-04 | completed |
| 4793467 | Regional Cluster | integrated-host-58 | baseline-host-79 | 2025-12-16 | 2025-12-15 | upcoming |

Shooting events form the outermost container for all activity. Each event carries a unique identifier, a human-readable name, and geographic metadata including host city and host country. The status field tracks whether an event is upcoming, ongoing, or completed. Consider the event "Composite Review" (identifier ChIJEctqrYFt5kcRUrBEPR-XXBE), hosted at baseline-host-55 in primary-host-76, scheduled from 2022-09-10 through 2022-09-09 and marked as upcoming. The event "Compact Initiative A" (209230) is currently ongoing, having been scheduled for 2023-02-21 through 2023-02-20 at pilot-host-56 in adaptive-host-77. The "Legacy Model" event (69440) is completed, and "Regional Cluster" (4793467) is upcoming. These events serve as the temporal and geographic anchors to which all other records attach.

**Table `shoo_shooters`**

| id | shooter_id | first_name | last_name | nationality | gender | birth_date |
|---|---|---|---|---|---|---|
| 100 | state_uk_4 | April Snyder | Katherine Hernandez | composite-national-39 | male | 2022-09-17 |
| 101 | 10445617 | Juneau International Airport | Tasha Rodriguez | primary-national-40 | female | 2023-02-01 |
| 102 | 8350031 | Jason Wright | Terry Mason | adaptive-national-41 | male | 2024-07-12 |
| 103 | 69436 | Lucas Robinson | Susan Wagner | distributed-national-42 | female | 2025-12-23 |

Shooters are the individual competitors. Each record contains an internal id, a shooter_id used for external references, personal identifiers (first_name and last_name), nationality, gender, and birth_date. April Snyder (id 100, shooter_id state_uk_4), a male competitor with nationality composite-national-39, was born on 2022-09-17. Juneau International Airport (id 101, shooter_id 10445617) is a female shooter from primary-national-40, born 2023-02-01. Jason Wright (id 102, shooter_id 8350031) is male, from adaptive-national-41, born 2024-07-12. Lucas Robinson (id 103, shooter_id 69436) is female, from distributed-national-42, born 2025-12-23. The shooter_id field enables cross-referencing between the shooter master table and the various result and participation tables.

**Table `shoo_disciplines`**

| id | discipline_id | discipline_name | weapon_type | distance | gender_category | format | event_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392481 | Distributed Review | air_pistol | 0.08502511 | men | individual | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 1001 | 9424927 | Adaptive Initiative D | air_rifle | 5.0 | women | team | 209230 |
| 1002 | 7441163 | Primary Model | air_pistol | 208.24771 | mixed | individual | 69440 |
| 1003 | 8189491 | Composite Cluster | air_rifle | 36.29999923706055 | men | team | 4793467 |

Disciplines define the specific competitive format within an event. Each discipline record specifies a discipline_name, weapon_type (such as air_pistol or air_rifle), a distance value, a gender_category (men, women, or mixed), and a format (individual or team). The discipline also carries its own event_id, linking it to the hosting event. For example, discipline id 1000 (discipline_id 392481) is named "Distributed Review," uses air_pistol at a distance of 0.08502511, is categorized for men in individual format, and belongs to event ChIJEctqrYFt5kcRUrBEPR-XXBE. Discipline id 1001 (discipline_id 9424927), "Adaptive Initiative D," uses air_rifle at distance 5.0, is for women in team format, and belongs to event 209230. Discipline id 1002 (discipline_id 7441163), "Primary Model," uses air_pistol at distance 208.24771 for mixed individual competition at event 69440. Discipline id 1003 (discipline_id 8189491), "Composite Cluster," uses air_rifle at distance 36.29999923706055 for men in team format at event 4793467.

**Table `shoo_competition_results`**

| id | result_id | qualification_score | final_score | aggregate_score | rank | medal | status | shooter_id | discipline_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 9246316 | 28 | 22.20 | 6.20 | 16 | gold | qualified | 100 | 1000 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | ZUGLB8 | 37 | 26.40 | 9.40 | 20 | silver | eliminated | 101 | 1001 | 209230 |
| 3 | 10966217 | 46 | 30.60 | 12.60 | 24 | bronze | completed | 102 | 1002 | 69440 |
| 4 | eff267f4-8fcb-11eb-924d-9cd76263cbd0 | 55 | 34.80 | 15.80 | 28 | none | qualified | 103 | 1003 | 4793467 |

Competition results capture the performance of individual shooters within a discipline. Each result record includes a result_id, qualification_score, final_score, aggregate_score, rank, medal, and status. The result links to a specific shooter via shooter_id, a discipline via discipline_id, and an event via event_id. Result id 1 (result_id 9246316) shows shooter 100 achieving a qualification_score of 28, final_score of 22.20, and aggregate_score of 6.20, ranking 16th and earning a gold medal with qualified status in discipline 1000 at event ChIJEctqrYFt5kcRUrBEPR-XXBE. Result id 2 (result_id ZUGLB8) shows shooter 101 with qualification_score 37, final_score 26.40, aggregate_score 9.40, rank 20, silver medal, and eliminated status in discipline 1001 at event 209230. Result id 3 (result_id 10966217) shows shooter 102 with qualification_score 46, final_score 30.60, aggregate_score 12.60, rank 24, bronze medal, and completed status in discipline 1002 at event 69440. Result id 4 (result_id eff267f4-8fcb-11eb-924d-9cd76263cbd0) shows shooter 103 with qualification_score 55, final_score 34.80, aggregate_score 15.80, rank 28, no medal, and qualified status in discipline 1003 at event 4793467.

**Table `shoo_team_results`**

| team_result_id | total_score | rank | medal | team_name | discipline_id | event_id |
|---|---|---|---|---|---|---|
| 1 | 12 | 16 | gold | Integrated Framework A | 1000 | ChIJEctqrYFt5kcRUrBEPR-XXBE |
| 2 | 51 | 20 | silver | Extended Protocol | 1001 | 209230 |
| 3 | 50 | 24 | bronze | Pilot Programme | 1002 | 69440 |
| 4 | 30 | 28 | none | Baseline Standard D | 1003 | 4793467 |

Team results aggregate performance across squad members competing in team-format disciplines. Each record includes a team_result_id, total_score, rank, medal, team_name, discipline_id, and event_id. Team result id 1 (team_result_id 1) belongs to "Integrated Framework A," achieved a total_score of 12, ranked 16th, earned a gold medal, in discipline 1000 at event ChIJEctqrYFt5kcRUrBEPR-XXBE. Team result id 2 (team_result_id 2) belongs to "Extended Protocol," scored 51, ranked 20th, earned silver, in discipline 1001 at event 209230. Team result id 3 (team_result_id 3) belongs to "Pilot Programme," scored 50, ranked 24th, earned bronze, in discipline 1002 at event 69440. Team result id 4 (team_result_id 4) belongs to "Baseline Standard D," scored 30, ranked 28th, earned no medal, in discipline 1003 at event 4793467.

## Participation and Assignment Records

The relationships between events, shooters, disciplines, and results are mediated through a set of junction tables that record which entities participated together. These tables do not carry additional attributes beyond the foreign keys they contain; their sole purpose is to express many-to-many associations.

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

The event-to-shooter assignment table records which shooters are registered for which events. Event ChIJEctqrYFt5kcRUrBEPR-XXBE includes shooters 100 and 101. Event 209230 includes shooters 101 and 102. Event 69440 includes shooters 102 and 103. Event 4793467 includes shooters 103 and 100. This creates a circular participation pattern where each shooter appears in exactly two events, and each event hosts exactly two shooters.

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

This table links events to competition results, establishing which results belong to which events. The four competition results (ids 1 through 4) are each associated with their respective events: result 1 with ChIJEctqrYFt5kcRUrBEPR-XXBE, result 2 with 209230, result 3 with 69440, and result 4 with 4793467.

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

This table records shooter-to-event participation, mirroring the event-to-shooter relationship from the shooter's perspective. Shooter 100 participates in events ChIJEctqrYFt5kcRUrBEPR-XXBE and 4793467. Shooter 101 participates in events ChIJEctqrYFt5kcRUrBEPR-XXBE and 209230. Shooter 102 participates in events 209230 and 69440. Shooter 103 participates in events 69440 and 4793467.

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

This table links shooters to the disciplines in which they compete. The four shooters are each assigned to one discipline: shooter 100 to discipline 1000, shooter 101 to discipline 1001, shooter 102 to discipline 1002, and shooter 103 to discipline 1003.

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

This table links shooters to their competition results. Shooter 100 is linked to result 1, shooter 101 to result 2, shooter 102 to result 3, and shooter 103 to result 4.

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

This table links disciplines to competition results. Discipline 1000 is linked to result 1, discipline 1001 to result 2, discipline 1002 to result 3, and discipline 1003 to result 4.

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

This table links team results to the shooters who comprise each team. The four team results (ids 1 through 4) each reference the shooters who contributed to the team score, connecting the aggregated team performance back to individual athletes.

## Query Views and Their Interpretations

The system provides a set of materialized views that join the base tables and junction records into flat, queryable structures. Each view answers a specific analytical question by bringing together related entities.

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

This view answers the question: which shooters are registered for each shooting event, and what are their personal details? A row from this view might show event ChIJEctqrYFt5kcRUrBEPR-XXBE alongside shooter 100 (April Snyder, male, composite-national-39), revealing that this shooter is participating in this specific event. Another row would show the same event alongside shooter 101 (Juneau International Airport, female, primary-national-40), confirming the two-shooter roster for this event.

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

This view answers: what competition results were produced at each shooting event, and what were the scores and rankings? A row might show event ChIJEctqrYFt5kcRUrBEPR-XXBE alongside result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal), providing a complete picture of the event's outcome. Another row would show event 209230 alongside result 2 (result_id ZUGLB8, qualification_score 37, final_score 26.40, aggregate_score 9.40, rank 20, silver medal).

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

This view answers: for each shooter, which events did they participate in, and what are the event details? A row might show shooter 100 (April Snyder) alongside event ChIJEctqrYFt5kcRUrBEPR-XXBE (Composite Review, baseline-host-55, primary-host-76), and another row would show the same shooter alongside event 4793467 (Regional Cluster, integrated-host-58, baseline-host-79), tracing the full participation history of this athlete.

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

This view answers: which disciplines does each shooter compete in, and what are the discipline specifications? A row might show shooter 100 (April Snyder) alongside discipline 1000 (Distributed Review, air_pistol, distance 0.08502511, men, individual format), and another row would show shooter 101 alongside discipline 1001 (Adaptive Initiative D, air_rifle, distance 5.0, women, team format).

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

This view answers: what are the competition results for each shooter, including their scores, rankings, and medals? A row might show shooter 100 (April Snyder) alongside result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal, qualified status), providing a complete performance snapshot for this athlete.

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

This view answers: which shooting events host which disciplines, and what are the discipline specifications? A row might show event ChIJEctqrYFt5kcRUrBEPR-XXBE alongside discipline 1000 (Distributed Review, air_pistol, distance 0.08502511, men, individual), and another row would show event 209230 alongside discipline 1001 (Adaptive Initiative D, air_rifle, distance 5.0, women, team).

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

This view answers: what competition results were produced within each discipline, and what were the outcomes? A row might show discipline 1000 (Distributed Review) alongside result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal), and another row would show discipline 1001 (Adaptive Initiative D) alongside result 2 (result_id ZUGLB8, qualification_score 37, final_score 26.40, aggregate_score 9.40, rank 20, silver medal).

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

This view answers: which shooter achieved each competition result, and what are their personal details? A row might show result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal) alongside shooter 100 (April Snyder, male, composite-national-39), directly connecting performance to the athlete.

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

This view answers: which discipline produced each competition result, and what are the discipline specifications? A row might show result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal) alongside discipline 1000 (Distributed Review, air_pistol, distance 0.08502511, men, individual), linking the performance outcome to the competitive format.

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

This view answers: which shooting event produced each competition result, and what are the event details? A row might show result 1 (result_id 9246316, qualification_score 28, final_score 22.20, aggregate_score 6.20, rank 16, gold medal) alongside event ChIJEctqrYFt5kcRUrBEPR-XXBE (Composite Review, baseline-host-55, primary-host-76, upcoming), connecting the result to its temporal and geographic context.

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

This view answers: which discipline produced each team result, and what are the team performance metrics? A row might show team result 1 (team_result_id 1, total_score 12, rank 16, gold medal, team name "Integrated Framework A") alongside discipline 1000 (Distributed Review, air_pistol, distance 0.08502511, men, individual), revealing that the team competed in this specific discipline.

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

This view answers: which shooting event produced each team result, and what are the event details? A row might show team result 1 (team_result_id 1, total_score 12, rank 16, gold medal, team name "Integrated Framework A") alongside event ChIJEctqrYFt5kcRUrBEPR-XXBE (Composite Review, baseline-host-55, primary-host-76), connecting the team performance to the hosting event.

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

This view answers: which shooters contributed to each team result, and what are their personal details? A row might show team result 1 (team_result_id 1, total_score 12, rank 16, gold medal, team name "Integrated Framework A") alongside shooter 100 (April Snyder, male, composite-national-39), revealing the composition of the team and the identity of its members.

## Synthesis

The competitive shooting domain is structured around five core entities—events, shooters, disciplines, competition results, and team results—connected through a network of junction tables that express participation and assignment relationships. The base tables store the raw records: event identifiers and schedules, shooter biographical data, discipline specifications including weapon type and distance, individual performance scores and rankings, and aggregated team scores. The junction tables—shoo_shooting_eventsShooter, shoo_shooting_eventsCompetitionResult, shoo_shootersShootingEvent, shoo_shootersDiscipline, shoo_shootersCompetitionResult, shoo_disciplinesCompetitionResult, and shoo_team_resultsShooter—encode the many-to-many associations that make the domain rich: shooters participate in multiple events, disciplines belong to events, results link shooters to disciplines, and teams aggregate individual performances.

The twelve query views flatten these relationships into readable structures that answer specific operational questions. Views anchored on shooting events (v_shooting_event_shooter_detail, v_shooting_event_competition_result_detail) tell organizers which athletes are competing and what the outcomes were. Views anchored on shooters (v_shooter_shooting_event_detail, v_shooter_discipline_detail, v_shooter_competition_result_detail) trace individual participation and performance histories. Views anchored on disciplines (v_discipline_shooting_event, v_discipline_competition_result_detail) reveal the competitive formats and their outcomes. Views anchored on competition results (v_competition_result_shooter, v_competition_result_discipline, v_competition_result_shooting_event) connect performance metrics back to the athletes, formats, and events that produced them. Views anchored on team results (v_team_result_discipline, v_team_result_shooting_event, v_team_result_shooter_detail) decompose team-level achievements into their disciplinary, event, and shooter components. Together, these records and views provide a complete operational picture of the competitive shooting ecosystem.