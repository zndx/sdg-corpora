## The Architecture of Competitive Chess Administration

A modern chess tournament organization manages a complex ecosystem of events, participants, teams, and adjudication. At its core, the system tracks tournaments as the primary container for all competitive activity. Each tournament carries a unique identifier, a date range, a format classification, and a current status that reflects its lifecycle stage. The time control parameter dictates the pace of play, while administrative oversight is assigned to a tournament director and, for team-format events, a designated team captain. This infrastructure supports both individual and team competitions, with statuses ranging from scheduled and active to completed and cancelled.

**Table `tournaments`**

| id | tournament_id | start_date | end_date | format | status | time_control | td_id | captain_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9568450 | 2022-09-05 | 2022-09-01 | individual | scheduled | 10/30 | 8189491 | 195352 |
| 2 | 383 | 2023-02-16 | 2023-02-12 | team | active | 10/60 | 2106706 | 338514 |
| 3 | 10624 | 2024-07-27 | 2024-07-23 | individual | completed | 10/30 | 10449524 | 7021001070150 |
| 4 | 7159 | 2025-12-11 | 2025-12-07 | team | cancelled | 10/60 | 3355777 | 3001009030270 |

The tournament records reveal a diverse portfolio of events. Tournament 9568450, running from September 5 to September 1, 2022, operates under an individual format with a 10/30 time control and holds a scheduled status, overseen by director 8189491 and captain 195352. Tournament 383, active since February 16, 2023, employs a team format with a longer 10/60 time control and is managed by director 2106706 with captain 338514. The completed tournament 10624, held in July 2024, returned to the individual format under director 10449524 and captain 7021001070150. Tournament 7159, scheduled for December 2025 with a team format and 10/60 time control, carries a cancelled status and is assigned director 3355777 and captain 3001009030270.

## Player Registration and Competitive Standing

Players form the human foundation of every tournament. Each player record carries a persistent identifier, a full name, an email address, and a country designation. The rating column quantifies competitive strength on a scale that, in this dataset, ranges from 24 to 39. A status field captures the player's current standing: active, defaulted, or forfeited. Additional columns link the player to a specific tournament, game, and team, enabling granular tracking of participation across the competitive calendar.

**Table `players`**

| id | player_id | full_name | email | country | rating | status | tournament_id | game_id | team_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | gd_fp_eu_acc2 | Theodore Mcgrath | seasonal-email-11 | compact-country-26 | 24 | active | 1 | 8350009 | 1450649 |
| 101 | 605941 | Account Name | regional-email-12 | composite-country-27 | 29 | defaulted | 2 | 8843755 | 1437598 |
| 102 | 195362 | Saipan International Airport | legacy-email-13 | primary-country-28 | 34 | forfeited | 3 | 24341655 | id_14 |
| 103 | id_26 | Norma Fisher | compact-email-14 | adaptive-country-29 | 39 | active | 4 | 3001009030250 | 99701 |

Player gd_fp_eu_acc2, registered as Theodore Mcgrath, holds an active status with a rating of 24 and is associated with tournament 1, game 8350009, and team 1450649. Player 605941, listed as Account Name, carries a defaulted status with a rating of 29 and participates in tournament 2, game 8843755, under team 1437598. Player 195362, named Saipan International Airport, has a forfeited status with a rating of 34 and is linked to tournament 3, game 24341655, and team id_14. Player id_26, Norma Fisher, maintains an active status with a rating of 39 and is connected to tournament 4, game 3001009030250, and team 99701.

## Team Organization and Geographic Affiliation

Teams aggregate players into structured units for team-format competition. Each team record includes a team identifier, a descriptive name, a country designation, a captain assignment, and a tournament linkage. The captain_id column references the team captain who leads the unit, while the tournament_id column anchors the team to its competitive event.

**Table `teams`**

| team_id | team_name | country | captain_id | has_captain_captain_id | tournament_id |
|---|---|---|---|---|---|
| 1450649 | Composite Model | compact-country-26 | 195352 | 195352 | 1 |
| 1437598 | Compact Cluster A | composite-country-27 | 338514 | 338514 | 2 |
| id_14 | Legacy Review | primary-country-28 | 7021001070150 | 7021001070150 | 3 |
| 99701 | Regional Initiative | adaptive-country-29 | 3001009030270 | 3001009030270 | 4 |

Team 1450649, named Composite Model, represents compact-country-26 under captain 195352 and competes in tournament 1. Team 1437598, Compact Cluster A, represents composite-country-27 under captain 338514 and competes in tournament 2. Team id_14, Legacy Review, represents primary-country-28 under captain 7021001070150 and competes in tournament 3. Team 99701, Regional Initiative, represents adaptive-country-29 under captain 3001009030270 and competes in tournament 4.

## Captaincy and Administrative Leadership

Team captains serve as the bridge between players and tournament administration. The team_captains table records each captain's identifier, full name, email address, the team they lead, and the tournament director who oversees their tournament. The leads_team_team_id column confirms the captain's association with their respective team, while the tournament_director_td_id column establishes the supervisory chain.

**Table `team_captains`**

| captain_id | full_name | email | team_id | leads_team_team_id | tournament_director_td_id |
|---|---|---|---|---|---|
| 195352 | Theodore Mcgrath | seasonal-email-11 | 1450649 | 1450649 | 8189491 |
| 338514 | Account Name | regional-email-12 | 1437598 | 1437598 | 2106706 |
| 7021001070150 | Saipan International Airport | legacy-email-13 | id_14 | id_14 | 10449524 |
| 3001009030270 | Norma Fisher | compact-email-14 | 99701 | 99701 | 3355777 |

Captain 195352, Theodore Mcgrath, leads team 1450649 and reports to tournament director 8189491. Captain 338514, Account Name, leads team 1437598 and reports to tournament director 2106706. Captain 7021001070150, Saipan International Airport, leads team id_14 and reports to tournament director 10449524. Captain 3001009030270, Norma Fisher, leads team 99701 and reports to tournament director 3355777.

## Tournament Direction and Jurisdictional Authority

Tournament directors provide the administrative and adjudicative backbone of the competitive structure. Each director record includes an identifier, full name, email address, and a jurisdiction designation that defines their scope of authority. Additional columns link each director to a tournament, a chess game, and a dispute, reflecting their multi-faceted role in event management, game oversight, and conflict resolution.

**Table `tournament_directors`**

| td_id | full_name | email | jurisdiction | tournament_id | game_id | dispute_id |
|---|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | seasonal-email-11 | regional-jurisdic-30 | 1 | 8350009 | 1000 |
| 2106706 | Account Name | regional-email-12 | legacy-jurisdic-31 | 2 | 8843755 | 1001 |
| 10449524 | Saipan International Airport | legacy-email-13 | compact-jurisdic-32 | 3 | 24341655 | 1002 |
| 3355777 | Norma Fisher | compact-email-14 | composite-jurisdic-33 | 4 | 3001009030250 | 1003 |

Director 8189491, Theodore Mcgrath, holds regional-jurisdic-30 and is associated with tournament 1, game 8350009, and dispute 1000. Director 2106706, Account Name, holds legacy-jurisdic-31 and is associated with tournament 2, game 8843755, and dispute 1001. Director 10449524, Saipan International Airport, holds compact-jurisdic-32 and is associated with tournament 3, game 24341655, and dispute 1002. Director 3355777, Norma Fisher, holds composite-jurisdic-33 and is associated with tournament 4, game 3001009030250, and dispute 1003.

## Chess Games and Match Records

Chess games represent the fundamental unit of competitive activity within a tournament. Each game record captures a start date, an end date, a status, a time control, a notation type, a transmission method, and a move count. The player_id and has_player2_player_id columns identify the two competitors, while the tournament_id and dispute_id columns anchor the game to its event and any associated conflict.

**Table `chess_games`**

| game_id | start_date | end_date | status | time_control | notation_type | transmission_method | move_count | player_id | has_player2_player_id | tournament_id | dispute_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 10/30 | algebraic | mail | 5 | 100 | 100 | 1 | 1000 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | completed | 10/60 | numeric | email | 18 | 101 | 101 | 2 | 1001 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | forfeited | 10/30 | mixed | fax | 41 | 102 | 102 | 3 | 1002 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | drawn | 10/60 | algebraic | mail | 12 | 103 | 103 | 4 | 1003 |

Game 8350009 began on September 5, 2022, and ended on September 1, 2022, with an active status under a 10/30 time control. It uses algebraic notation transmitted via mail, recorded 5 moves, involves player 100 against player 100, belongs to tournament 1, and is linked to dispute 1000. Game 8843755, running from February 16 to February 12, 2023, carries a completed status, a 10/60 time control, numeric notation transmitted by email, 18 recorded moves, players 101 and 101, tournament 2, and dispute 1001. Game 24341655, spanning July 27 to July 23, 2024, shows a forfeited status, a 10/30 time control, mixed notation transmitted by fax, 41 moves, players 102 and 102, tournament 3, and dispute 1002. Game 3001009030250, from December 11 to December 7, 2025, displays a drawn status, a 10/60 time control, algebraic notation transmitted by mail, 12 moves, players 103 and 103, tournament 4, and dispute 1003.

## Move Cards and Notation Tracking

Move cards document the individual moves played during a chess game, preserving the notation and providing a granular record of the game's progression. Each move card is associated with a specific chess game and may reference the player who made the move and the tournament director who verified it.

**Table `move_cards`**

| move_card_id | card_id | game_id | player_id | move_notation | time_used | total_time | postmark_date | transmission_date | status | belongs_game_game_id | submitted_by_player_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 17788643 | 8350009 | gd_fp_eu_acc2 | primary-move-94 | 7.45 | 17.45 | 2024-03-07 | 2023-06-14T05:27:00 | received | 8350009 | 100 | 8189491 |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 | 605941 | adaptive-move-95 | 10.90 | 19.90 | 2025-08-18 | 2024-11-25T12:44:00 | processed | 8843755 | 101 | 2106706 |
| 102 | 1336192 | 24341655 | 195362 | distributed-move-96 | 14.35 | 22.35 | 2022-01-02 | 2025-04-09T19:01:00 | ambiguous | 24341655 | 102 | 10449524 |
| 103 | 5917278 | 3001009030250 | id_26 | baseline-move-97 | 17.80 | 24.80 | 2023-06-13 | 2022-09-20T02:18:00 | received | 3001009030250 | 103 | 3355777 |

## Dispute Resolution and Conflict Management

Disputes represent formal conflicts that arise during tournament play. Each dispute record is linked to a chess game, a tournament director responsible for adjudication, and one or more players involved in the conflict. The disputes_players junction table captures the multi-party nature of disputes, allowing a single dispute to involve multiple players.

**Table `disputes`**

| id | dispute_id | game_id | type | status | resolution | arises_in_game_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | ambiguous_move | open | regional-resoluti-30 | 8350009 | 8189491 |
| 1001 | 121 | 8843755 | time_violation | resolved | legacy-resoluti-31 | 8843755 | 2106706 |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | communication_breakdown | escalated | compact-resoluti-32 | 24341655 | 10449524 |
| 1003 | level-3 | 3001009030250 | forfeiture | open | composite-resoluti-33 | 3001009030250 | 3355777 |

## Relational Junctions and Participation Records

The tournament infrastructure relies on junction tables to express many-to-many relationships between core entities. The tournaments_players table records which players participate in which tournaments, enabling a player to compete across multiple events and a tournament to host multiple competitors. The tournaments_games table links games to their parent tournaments, ensuring every game is traceable to its event. The teams_players table establishes team membership, allowing players to be assigned to teams within a tournament context. The games_cards table connects move cards to their parent chess games, preserving the complete move history. The disputes_players table captures player involvement in disputes, supporting the adjudication workflow.

## Tournament and Player Detail

The tournament_player_detail_view consolidates tournament metadata with player registration information, answering the question of which players are entered in which tournaments and what their competitive standing is at the time of entry. This view joins the tournaments table with the players table on their shared tournament identifier, producing a unified record that includes the tournament's format, status, and time control alongside the player's name, rating, and status.

**View `tournament_player_detail_view`**

```sql
CREATE VIEW tournament_player_detail_view AS
SELECT a.id, a.tournament_id, a.start_date, b.id AS player_id, b.player_id AS player_player_id, b.full_name AS player_full_name
FROM tournaments a
  JOIN tournaments_players j ON j.tournament_id = a.id
  JOIN players b ON b.id = j.player_id;
```

| id | tournament_id | start_date | player_id | player_player_id | player_full_name |
|---|---|---|---|---|---|
| 1 | 9568450 | 2022-09-05 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |
| 1 | 9568450 | 2022-09-05 | 101 | 605941 | Account Name |
| 2 | 383 | 2023-02-16 | 101 | 605941 | Account Name |
| 2 | 383 | 2023-02-16 | 102 | 195362 | Saipan International Airport |
| 3 | 10624 | 2024-07-27 | 102 | 195362 | Saipan International Airport |
| 3 | 10624 | 2024-07-27 | 103 | id_26 | Norma Fisher |
| 4 | 7159 | 2025-12-11 | 103 | id_26 | Norma Fisher |
| 4 | 7159 | 2025-12-11 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |

Reading the first row of this view, tournament 9568450 (individual format, scheduled status, 10/30 time control) is associated with player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active status). The second row shows tournament 383 (team format, active status, 10/60 time control) paired with player 605941 (Account Name, rating 29, defaulted status). The third row links tournament 10624 (individual format, completed status, 10/30 time control) with player 195362 (Saipan International Airport, rating 34, forfeited status).

## Tournament and Chess Game Detail

The tournament_chess_game_detail_view answers the question of which games belong to which tournaments by joining the tournaments table with the chess_games table. This provides a complete picture of a tournament's match schedule, including game dates, statuses, time controls, notation types, transmission methods, and move counts.

**View `tournament_chess_game_detail_view`**

```sql
CREATE VIEW tournament_chess_game_detail_view AS
SELECT a.id, a.tournament_id, a.start_date, b.game_id AS game_game_id, b.start_date AS game_start_date, b.end_date AS game_end_date
FROM tournaments a
  JOIN tournaments_games j ON j.tournament_id = a.id
  JOIN chess_games b ON b.game_id = j.game_id;
```

| id | tournament_id | start_date | game_game_id | game_start_date | game_end_date |
|---|---|---|---|---|---|
| 1 | 9568450 | 2022-09-05 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 1 | 9568450 | 2022-09-05 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 2 | 383 | 2023-02-16 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 2 | 383 | 2023-02-16 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 3 | 10624 | 2024-07-27 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 3 | 10624 | 2024-07-27 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |
| 4 | 7159 | 2025-12-11 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |
| 4 | 7159 | 2025-12-11 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |

The first row of this view pairs tournament 9568450 (individual, scheduled, 10/30) with game 8350009 (active, algebraic notation, mail transmission, 5 moves). The second row links tournament 383 (team, active, 10/60) with game 8843755 (completed, numeric notation, email transmission, 18 moves). The third row associates tournament 10624 (individual, completed, 10/30) with game 24341655 (forfeited, mixed notation, fax transmission, 41 moves).

## Tournament and Team Captain Detail

The tournament_team_captain_view joins tournament records with team captain information, revealing which captain is responsible for which tournament. This view is essential for understanding the administrative chain of command within each event.

**View `tournament_team_captain_view`**

```sql
CREATE VIEW tournament_team_captain_view AS
SELECT a.id, a.tournament_id, a.start_date, a.end_date, b.captain_id AS captain_captain_id, b.full_name AS captain_full_name, b.email AS captain_email
FROM tournaments a JOIN team_captains b ON a.captain_id = b.captain_id;
```

| id | tournament_id | start_date | end_date | captain_captain_id | captain_full_name | captain_email |
|---|---|---|---|---|---|---|
| 1 | 9568450 | 2022-09-05 | 2022-09-01 | 195352 | Theodore Mcgrath | seasonal-email-11 |
| 2 | 383 | 2023-02-16 | 2023-02-12 | 338514 | Account Name | regional-email-12 |
| 3 | 10624 | 2024-07-27 | 2024-07-23 | 7021001070150 | Saipan International Airport | legacy-email-13 |
| 4 | 7159 | 2025-12-11 | 2025-12-07 | 3001009030270 | Norma Fisher | compact-email-14 |

The first row shows tournament 9568450 (individual, scheduled, 10/30) overseen by captain 195352 (Theodore Mcgrath, seasonal-email-11, leading team 1450649). The second row links tournament 383 (team, active, 10/60) with captain 338514 (Account Name, regional-email-12, leading team 1437598). The third row associates tournament 10624 (individual, completed, 10/30) with captain 7021001070150 (Saipan International Airport, legacy-email-13, leading team id_14).

## Player Tournament Participation

The player_tournament_view provides a player-centric perspective on tournament participation, joining player records with their associated tournament information. This view answers the question of which tournaments a given player has entered and what the competitive conditions were.

**View `player_tournament_view`**

```sql
CREATE VIEW player_tournament_view AS
SELECT a.id, a.player_id, a.full_name, a.email, b.id AS tournament_id, b.tournament_id AS tournament_tournament_id, b.start_date AS tournament_start_date
FROM players a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | player_id | full_name | email | tournament_id | tournament_tournament_id | tournament_start_date |
|---|---|---|---|---|---|---|
| 100 | gd_fp_eu_acc2 | Theodore Mcgrath | seasonal-email-11 | 1 | 9568450 | 2022-09-05 |
| 101 | 605941 | Account Name | regional-email-12 | 2 | 383 | 2023-02-16 |
| 102 | 195362 | Saipan International Airport | legacy-email-13 | 3 | 10624 | 2024-07-27 |
| 103 | id_26 | Norma Fisher | compact-email-14 | 4 | 7159 | 2025-12-11 |

The first row shows player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active) participating in tournament 9568450 (individual, scheduled, 10/30 time control). The second row links player 605941 (Account Name, rating 29, defaulted) to tournament 383 (team, active, 10/60 time control). The third row associates player 195362 (Saipan International Airport, rating 34, forfeited) with tournament 10624 (individual, completed, 10/30 time control).

## Player Chess Game Participation

The player_chess_game_view joins player records with their associated chess games, revealing the match history of each player. This view answers the question of which games a player has competed in and what the outcomes and conditions were.

**View `player_chess_game_view`**

```sql
CREATE VIEW player_chess_game_view AS
SELECT a.id, a.player_id, a.full_name, a.email, b.game_id AS game_game_id, b.start_date AS game_start_date, b.end_date AS game_end_date
FROM players a JOIN chess_games b ON a.game_id = b.game_id;
```

| id | player_id | full_name | email | game_game_id | game_start_date | game_end_date |
|---|---|---|---|---|---|---|
| 100 | gd_fp_eu_acc2 | Theodore Mcgrath | seasonal-email-11 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 101 | 605941 | Account Name | regional-email-12 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 102 | 195362 | Saipan International Airport | legacy-email-13 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 103 | id_26 | Norma Fisher | compact-email-14 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

The first row shows player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active) competing in game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves). The second row links player 605941 (Account Name, rating 29, defaulted) to game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves). The third row associates player 195362 (Saipan International Airport, rating 34, forfeited) with game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves).

## Player Team Membership

The player_team_view joins player records with their team affiliations, answering the question of which team a player belongs to and what the team's competitive context is. This view is particularly relevant for team-format tournaments.

**View `player_team_view`**

```sql
CREATE VIEW player_team_view AS
SELECT a.id, a.player_id, a.full_name, a.email, b.team_id AS team_team_id, b.team_name AS team_team_name, b.country AS team_country
FROM players a JOIN teams b ON a.team_id = b.team_id;
```

| id | player_id | full_name | email | team_team_id | team_team_name | team_country |
|---|---|---|---|---|---|---|
| 100 | gd_fp_eu_acc2 | Theodore Mcgrath | seasonal-email-11 | 1450649 | Composite Model | compact-country-26 |
| 101 | 605941 | Account Name | regional-email-12 | 1437598 | Compact Cluster A | composite-country-27 |
| 102 | 195362 | Saipan International Airport | legacy-email-13 | id_14 | Legacy Review | primary-country-28 |
| 103 | id_26 | Norma Fisher | compact-email-14 | 99701 | Regional Initiative | adaptive-country-29 |

The first row shows player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active) on team 1450649 (Composite Model, compact-country-26, captain 195352, tournament 1). The second row links player 605941 (Account Name, rating 29, defaulted) to team 1437598 (Compact Cluster A, composite-country-27, captain 338514, tournament 2). The third row associates player 195362 (Saipan International Airport, rating 34, forfeited) with team id_14 (Legacy Review, primary-country-28, captain 7021001070150, tournament 3).

## Team Player Detail

The team_player_detail_view joins team records with their player rosters, providing a comprehensive view of each team's composition. This view answers the question of which players comprise each team and what their individual ratings and statuses are.

**View `team_player_detail_view`**

```sql
CREATE VIEW team_player_detail_view AS
SELECT a.team_id, a.team_name, a.country, b.id AS player_id, b.player_id AS player_player_id, b.full_name AS player_full_name
FROM teams a
  JOIN teams_players j ON j.team_id = a.team_id
  JOIN players b ON b.id = j.player_id;
```

| team_id | team_name | country | player_id | player_player_id | player_full_name |
|---|---|---|---|---|---|
| 1450649 | Composite Model | compact-country-26 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |
| 1450649 | Composite Model | compact-country-26 | 101 | 605941 | Account Name |
| 1437598 | Compact Cluster A | composite-country-27 | 101 | 605941 | Account Name |
| 1437598 | Compact Cluster A | composite-country-27 | 102 | 195362 | Saipan International Airport |
| id_14 | Legacy Review | primary-country-28 | 102 | 195362 | Saipan International Airport |
| id_14 | Legacy Review | primary-country-28 | 103 | id_26 | Norma Fisher |
| 99701 | Regional Initiative | adaptive-country-29 | 103 | id_26 | Norma Fisher |
| 99701 | Regional Initiative | adaptive-country-29 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |

The first row shows team 1450649 (Composite Model, compact-country-26, captain 195352, tournament 1) with player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active). The second row links team 1437598 (Compact Cluster A, composite-country-27, captain 338514, tournament 2) to player 605941 (Account Name, rating 29, defaulted). The third row associates team id_14 (Legacy Review, primary-country-28, captain 7021001070150, tournament 3) with player 195362 (Saipan International Airport, rating 34, forfeited).

## Team and Captain Relationship

The team_team_captain_view joins team records with their captain information, confirming the leadership structure of each team. This view answers the question of who leads each team and what the captain's contact and administrative details are.

**View `team_team_captain_view`**

```sql
CREATE VIEW team_team_captain_view AS
SELECT a.team_id, a.team_name, a.country, a.captain_id, b.captain_id AS captain_captain_id, b.full_name AS captain_full_name, b.email AS captain_email
FROM teams a JOIN team_captains b ON a.has_captain_captain_id = b.captain_id;
```

| team_id | team_name | country | captain_id | captain_captain_id | captain_full_name | captain_email |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | compact-country-26 | 195352 | 195352 | Theodore Mcgrath | seasonal-email-11 |
| 1437598 | Compact Cluster A | composite-country-27 | 338514 | 338514 | Account Name | regional-email-12 |
| id_14 | Legacy Review | primary-country-28 | 7021001070150 | 7021001070150 | Saipan International Airport | legacy-email-13 |
| 99701 | Regional Initiative | adaptive-country-29 | 3001009030270 | 3001009030270 | Norma Fisher | compact-email-14 |

The first row shows team 1450649 (Composite Model, compact-country-26, tournament 1) led by captain 195352 (Theodore Mcgrath, seasonal-email-11). The second row links team 1437598 (Compact Cluster A, composite-country-27, tournament 2) to captain 338514 (Account Name, regional-email-12). The third row associates team id_14 (Legacy Review, primary-country-28, tournament 3) with captain 7021001070150 (Saipan International Airport, legacy-email-13).

## Team Tournament Participation

The team_tournament_view joins team records with their tournament information, answering the question of which tournament each team competes in and what the event's format and status are.

**View `team_tournament_view`**

```sql
CREATE VIEW team_tournament_view AS
SELECT a.team_id, a.team_name, a.country, a.captain_id, b.id AS tournament_id, b.tournament_id AS tournament_tournament_id, b.start_date AS tournament_start_date
FROM teams a JOIN tournaments b ON a.tournament_id = b.id;
```

| team_id | team_name | country | captain_id | tournament_id | tournament_tournament_id | tournament_start_date |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | compact-country-26 | 195352 | 1 | 9568450 | 2022-09-05 |
| 1437598 | Compact Cluster A | composite-country-27 | 338514 | 2 | 383 | 2023-02-16 |
| id_14 | Legacy Review | primary-country-28 | 7021001070150 | 3 | 10624 | 2024-07-27 |
| 99701 | Regional Initiative | adaptive-country-29 | 3001009030270 | 4 | 7159 | 2025-12-11 |

The first row shows team 1450649 (Composite Model, compact-country-26, captain 195352) competing in tournament 9568450 (individual format, scheduled status, 10/30 time control). The second row links team 1437598 (Compact Cluster A, composite-country-27, captain 338514) to tournament 383 (team format, active status, 10/60 time control). The third row associates team id_14 (Legacy Review, primary-country-28, captain 7021001070150) with tournament 10624 (individual format, completed status, 10/30 time control).

## Captain and Team Leadership

The team_captain_team_view joins team captain records with their team information, providing a captain-centric view of their leadership responsibilities. This view answers the question of which team each captain leads and what the team's geographic and competitive context is.

**View `team_captain_team_view`**

```sql
CREATE VIEW team_captain_team_view AS
SELECT a.captain_id, a.full_name, a.email, a.team_id, b.team_id AS team_team_id, b.team_name AS team_team_name, b.country AS team_country
FROM team_captains a JOIN teams b ON a.leads_team_team_id = b.team_id;
```

| captain_id | full_name | email | team_id | team_team_id | team_team_name | team_country |
|---|---|---|---|---|---|---|
| 195352 | Theodore Mcgrath | seasonal-email-11 | 1450649 | 1450649 | Composite Model | compact-country-26 |
| 338514 | Account Name | regional-email-12 | 1437598 | 1437598 | Compact Cluster A | composite-country-27 |
| 7021001070150 | Saipan International Airport | legacy-email-13 | id_14 | id_14 | Legacy Review | primary-country-28 |
| 3001009030270 | Norma Fisher | compact-email-14 | 99701 | 99701 | Regional Initiative | adaptive-country-29 |

The first row shows captain 195352 (Theodore Mcgrath, seasonal-email-11) leading team 1450649 (Composite Model, compact-country-26, tournament 1). The second row links captain 338514 (Account Name, regional-email-12) to team 1437598 (Compact Cluster A, composite-country-27, tournament 2). The third row associates captain 7021001070150 (Saipan International Airport, legacy-email-13) with team id_14 (Legacy Review, primary-country-28, tournament 3).

## Captain and Tournament Director Oversight

The team_captain_tournament_director_view joins team captain records with their overseeing tournament director, revealing the supervisory chain from captain to director. This view answers the question of which tournament director is responsible for adjudicating and overseeing each captain's tournament.

**View `team_captain_tournament_director_view`**

```sql
CREATE VIEW team_captain_tournament_director_view AS
SELECT a.captain_id, a.full_name, a.email, a.team_id, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email AS director_email
FROM team_captains a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| captain_id | full_name | email | team_id | director_td_id | director_full_name | director_email |
|---|---|---|---|---|---|---|
| 195352 | Theodore Mcgrath | seasonal-email-11 | 1450649 | 8189491 | Theodore Mcgrath | seasonal-email-11 |
| 338514 | Account Name | regional-email-12 | 1437598 | 2106706 | Account Name | regional-email-12 |
| 7021001070150 | Saipan International Airport | legacy-email-13 | id_14 | 10449524 | Saipan International Airport | legacy-email-13 |
| 3001009030270 | Norma Fisher | compact-email-14 | 99701 | 3355777 | Norma Fisher | compact-email-14 |

The first row shows captain 195352 (Theodore Mcgrath, seasonal-email-11, leading team 1450649) under the oversight of director 8189491 (Theodore Mcgrath, regional-jurisdic-30). The second row links captain 338514 (Account Name, regional-email-12, leading team 1437598) to director 2106706 (Account Name, legacy-jurisdic-31). The third row associates captain 7021001070150 (Saipan International Airport, legacy-email-13, leading team id_14) with director 10449524 (Saipan International Airport, compact-jurisdic-32).

## Tournament Director and Tournament Oversight

The tournament_director_tournament_view joins tournament director records with their assigned tournaments, answering the question of which tournaments each director is responsible for managing. This view is essential for understanding the distribution of administrative workload.

**View `tournament_director_tournament_view`**

```sql
CREATE VIEW tournament_director_tournament_view AS
SELECT a.td_id, a.full_name, a.email, a.jurisdiction, b.id AS tournament_id, b.tournament_id AS tournament_tournament_id, b.start_date AS tournament_start_date
FROM tournament_directors a JOIN tournaments b ON a.tournament_id = b.id;
```

| td_id | full_name | email | jurisdiction | tournament_id | tournament_tournament_id | tournament_start_date |
|---|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | seasonal-email-11 | regional-jurisdic-30 | 1 | 9568450 | 2022-09-05 |
| 2106706 | Account Name | regional-email-12 | legacy-jurisdic-31 | 2 | 383 | 2023-02-16 |
| 10449524 | Saipan International Airport | legacy-email-13 | compact-jurisdic-32 | 3 | 10624 | 2024-07-27 |
| 3355777 | Norma Fisher | compact-email-14 | composite-jurisdic-33 | 4 | 7159 | 2025-12-11 |

The first row shows director 8189491 (Theodore Mcgrath, seasonal-email-11, regional-jurisdic-30) managing tournament 9568450 (individual format, scheduled status, 10/30 time control). The second row links director 2106706 (Account Name, regional-email-12, legacy-jurisdic-31) to tournament 383 (team format, active status, 10/60 time control). The third row associates director 10449524 (Saipan International Airport, legacy-email-13, compact-jurisdic-32) with tournament 10624 (individual format, completed status, 10/30 time control).

## Tournament Director and Chess Game Oversight

The tournament_director_chess_game_view joins tournament director records with the chess games they oversee, revealing the game-level responsibilities of each director. This view answers the question of which games fall under each director's purview.

**View `tournament_director_chess_game_view`**

```sql
CREATE VIEW tournament_director_chess_game_view AS
SELECT a.td_id, a.full_name, a.email, a.jurisdiction, b.game_id AS game_game_id, b.start_date AS game_start_date, b.end_date AS game_end_date
FROM tournament_directors a JOIN chess_games b ON a.game_id = b.game_id;
```

| td_id | full_name | email | jurisdiction | game_game_id | game_start_date | game_end_date |
|---|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | seasonal-email-11 | regional-jurisdic-30 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 2106706 | Account Name | regional-email-12 | legacy-jurisdic-31 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 10449524 | Saipan International Airport | legacy-email-13 | compact-jurisdic-32 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 3355777 | Norma Fisher | compact-email-14 | composite-jurisdic-33 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

The first row shows director 8189491 (Theodore Mcgrath, seasonal-email-11, regional-jurisdic-30) overseeing game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves). The second row links director 2106706 (Account Name, regional-email-12, legacy-jurisdic-31) to game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves). The third row associates director 10449524 (Saipan International Airport, legacy-email-13, compact-jurisdic-32) with game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves).

## Tournament Director and Dispute Adjudication

The tournament_director_dispute_view joins tournament director records with the disputes they adjudicate, answering the question of which conflicts each director is responsible for resolving. This view is critical for understanding the adjudication workload distribution.

**View `tournament_director_dispute_view`**

```sql
CREATE VIEW tournament_director_dispute_view AS
SELECT a.td_id, a.full_name, a.email, a.jurisdiction, b.id AS dispute_id, b.dispute_id AS dispute_dispute_id, b.game_id AS dispute_game_id
FROM tournament_directors a JOIN disputes b ON a.dispute_id = b.id;
```

| td_id | full_name | email | jurisdiction | dispute_id | dispute_dispute_id | dispute_game_id |
|---|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | seasonal-email-11 | regional-jurisdic-30 | 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 |
| 2106706 | Account Name | regional-email-12 | legacy-jurisdic-31 | 1001 | 121 | 8843755 |
| 10449524 | Saipan International Airport | legacy-email-13 | compact-jurisdic-32 | 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 |
| 3355777 | Norma Fisher | compact-email-14 | composite-jurisdic-33 | 1003 | level-3 | 3001009030250 |

The first row shows director 8189491 (Theodore Mcgrath, seasonal-email-11, regional-jurisdic-30) adjudicating dispute 1000. The second row links director 2106706 (Account Name, regional-email-12, legacy-jurisdic-31) to dispute 1001. The third row associates director 10449524 (Saipan International Airport, legacy-email-13, compact-jurisdic-32) with dispute 1002.

## Chess Game and Player Participation

The chess_game_player_view joins chess game records with their player participants, answering the question of which players competed in each game and what their ratings and statuses were at the time of play.

**View `chess_game_player_view`**

```sql
CREATE VIEW chess_game_player_view AS
SELECT a.game_id, a.start_date, a.end_date, a.status, b.id AS player_id, b.player_id AS player_player_id, b.full_name AS player_full_name
FROM chess_games a JOIN players b ON a.player_id = b.id;
```

| game_id | start_date | end_date | status | player_id | player_player_id | player_full_name |
|---|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | completed | 101 | 605941 | Account Name |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | forfeited | 102 | 195362 | Saipan International Airport |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | drawn | 103 | id_26 | Norma Fisher |

The first row shows game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves) involving player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active). The second row links game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves) to player 605941 (Account Name, rating 29, defaulted). The third row associates game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves) with player 195362 (Saipan International Airport, rating 34, forfeited).

## Chess Game and Tournament Context

The chess_game_tournament_view joins chess game records with their parent tournament information, providing the event-level context for each game. This view answers the question of which tournament each game belongs to and what the tournament's format and status are.

**View `chess_game_tournament_view`**

```sql
CREATE VIEW chess_game_tournament_view AS
SELECT a.game_id, a.start_date, a.end_date, a.status, b.id AS tournament_id, b.tournament_id AS tournament_tournament_id, b.start_date AS tournament_start_date
FROM chess_games a JOIN tournaments b ON a.tournament_id = b.id;
```

| game_id | start_date | end_date | status | tournament_id | tournament_tournament_id | tournament_start_date |
|---|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1 | 9568450 | 2022-09-05 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | completed | 2 | 383 | 2023-02-16 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | forfeited | 3 | 10624 | 2024-07-27 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | drawn | 4 | 7159 | 2025-12-11 |

The first row shows game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves) belonging to tournament 9568450 (individual format, scheduled status, 10/30 time control). The second row links game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves) to tournament 383 (team format, active status, 10/60 time control). The third row associates game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves) with tournament 10624 (individual format, completed status, 10/30 time control).

## Chess Game and Move Card Detail

The chess_game_move_card_detail_view joins chess game records with their associated move cards, providing a complete picture of a game's move history. This view answers the question of which moves were played in each game and in what sequence.

**View `chess_game_move_card_detail_view`**

```sql
CREATE VIEW chess_game_move_card_detail_view AS
SELECT a.game_id, a.start_date, a.end_date, b.move_card_id AS card_move_card_id, b.card_id AS card_card_id, b.game_id AS card_game_id
FROM chess_games a
  JOIN games_cards j ON j.game_id = a.game_id
  JOIN move_cards b ON b.move_card_id = j.move_card_id;
```

| game_id | start_date | end_date | card_move_card_id | card_card_id | card_game_id |
|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | 17788643 | 8350009 |
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 102 | 1336192 | 24341655 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 1336192 | 24341655 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 103 | 5917278 | 3001009030250 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 5917278 | 3001009030250 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 100 | 17788643 | 8350009 |

The first row shows game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves) with its associated move cards. The second row links game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves) to its move card records. The third row associates game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves) with its move card entries.

## Chess Game and Dispute Association

The chess_game_dispute_view joins chess game records with their associated disputes, answering the question of which games have generated formal disputes and what the dispute identifiers are.

**View `chess_game_dispute_view`**

```sql
CREATE VIEW chess_game_dispute_view AS
SELECT a.game_id, a.start_date, a.end_date, a.status, b.id AS dispute_id, b.dispute_id AS dispute_dispute_id, b.game_id AS dispute_game_id
FROM chess_games a JOIN disputes b ON a.dispute_id = b.id;
```

| game_id | start_date | end_date | status | dispute_id | dispute_dispute_id | dispute_game_id |
|---|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | completed | 1001 | 121 | 8843755 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | forfeited | 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | drawn | 1003 | level-3 | 3001009030250 |

The first row shows game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves) associated with dispute 1000. The second row links game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves) to dispute 1001. The third row associates game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves) with dispute 1002.

## Move Card and Chess Game Context

The move_card_chess_game_view joins move card records with their parent chess game information, providing the game-level context for each recorded move. This view answers the question of which game each move card belongs to and what the game's status and conditions were.

**View `move_card_chess_game_view`**

```sql
CREATE VIEW move_card_chess_game_view AS
SELECT a.move_card_id, a.card_id, a.game_id, a.player_id, b.game_id AS game_game_id, b.start_date AS game_start_date, b.end_date AS game_end_date
FROM move_cards a JOIN chess_games b ON a.belongs_game_game_id = b.game_id;
```

| move_card_id | card_id | game_id | player_id | game_game_id | game_start_date | game_end_date |
|---|---|---|---|---|---|---|
| 100 | 17788643 | 8350009 | gd_fp_eu_acc2 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 | 605941 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 102 | 1336192 | 24341655 | 195362 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 103 | 5917278 | 3001009030250 | id_26 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

The first row shows a move card associated with game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves). The second row links a move card to game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves). The third row associates a move card with game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves).

## Move Card and Player Attribution

The move_card_player_view joins move card records with the player who made each move, answering the question of which player played each recorded move.

**View `move_card_player_view`**

```sql
CREATE VIEW move_card_player_view AS
SELECT a.move_card_id, a.card_id, a.game_id, a.player_id, b.id AS player_id, b.player_id AS player_player_id, b.full_name AS player_full_name
FROM move_cards a JOIN players b ON a.submitted_by_player_id = b.id;
```

| move_card_id | card_id | game_id | player_id | player_id | player_player_id | player_full_name |
|---|---|---|---|---|---|---|
| 100 | 17788643 | 8350009 | gd_fp_eu_acc2 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 | 605941 | 101 | 605941 | Account Name |
| 102 | 1336192 | 24341655 | 195362 | 102 | 195362 | Saipan International Airport |
| 103 | 5917278 | 3001009030250 | id_26 | 103 | id_26 | Norma Fisher |

The first row shows a move card attributed to player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active). The second row links a move card to player 605941 (Account Name, rating 29, defaulted). The third row associates a move card with player 195362 (Saipan International Airport, rating 34, forfeited).

## Move Card and Tournament Director Verification

The move_card_tournament_director_view joins move card records with the tournament director who verified each move, answering the question of which director oversaw the recording of each move.

**View `move_card_tournament_director_view`**

```sql
CREATE VIEW move_card_tournament_director_view AS
SELECT a.move_card_id, a.card_id, a.game_id, a.player_id, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email AS director_email
FROM move_cards a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| move_card_id | card_id | game_id | player_id | director_td_id | director_full_name | director_email |
|---|---|---|---|---|---|---|
| 100 | 17788643 | 8350009 | gd_fp_eu_acc2 | 8189491 | Theodore Mcgrath | seasonal-email-11 |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 | 605941 | 2106706 | Account Name | regional-email-12 |
| 102 | 1336192 | 24341655 | 195362 | 10449524 | Saipan International Airport | legacy-email-13 |
| 103 | 5917278 | 3001009030250 | id_26 | 3355777 | Norma Fisher | compact-email-14 |

The first row shows a move card verified by director 8189491 (Theodore Mcgrath, seasonal-email-11, regional-jurisdic-30). The second row links a move card to director 2106706 (Account Name, regional-email-12, legacy-jurisdic-31). The third row associates a move card with director 10449524 (Saipan International Airport, legacy-email-13, compact-jurisdic-32).

## Dispute and Chess Game Origin

The dispute_chess_game_view joins dispute records with the chess game that generated the dispute, answering the question of which game each dispute originated from and what the game's conditions were.

**View `dispute_chess_game_view`**

```sql
CREATE VIEW dispute_chess_game_view AS
SELECT a.id, a.dispute_id, a.game_id, a.type, b.game_id AS game_game_id, b.start_date AS game_start_date, b.end_date AS game_end_date
FROM disputes a JOIN chess_games b ON a.arises_in_game_id = b.game_id;
```

| id | dispute_id | game_id | type | game_game_id | game_start_date | game_end_date |
|---|---|---|---|---|---|---|
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | ambiguous_move | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 |
| 1001 | 121 | 8843755 | time_violation | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | communication_breakdown | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 |
| 1003 | level-3 | 3001009030250 | forfeiture | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 |

The first row shows dispute 1000 originating from game 8350009 (active, 10/30 time control, algebraic notation, mail transmission, 5 moves). The second row links dispute 1001 to game 8843755 (completed, 10/60 time control, numeric notation, email transmission, 18 moves). The third row associates dispute 1002 with game 24341655 (forfeited, 10/30 time control, mixed notation, fax transmission, 41 moves).

## Dispute and Tournament Director Adjudication

The dispute_tournament_director_view joins dispute records with the tournament director responsible for adjudicating each dispute, answering the question of which director handles each conflict.

**View `dispute_tournament_director_view`**

```sql
CREATE VIEW dispute_tournament_director_view AS
SELECT a.id, a.dispute_id, a.game_id, a.type, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email AS director_email
FROM disputes a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| id | dispute_id | game_id | type | director_td_id | director_full_name | director_email |
|---|---|---|---|---|---|---|
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | ambiguous_move | 8189491 | Theodore Mcgrath | seasonal-email-11 |
| 1001 | 121 | 8843755 | time_violation | 2106706 | Account Name | regional-email-12 |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | communication_breakdown | 10449524 | Saipan International Airport | legacy-email-13 |
| 1003 | level-3 | 3001009030250 | forfeiture | 3355777 | Norma Fisher | compact-email-14 |

The first row shows dispute 1000 adjudicated by director 8189491 (Theodore Mcgrath, seasonal-email-11, regional-jurisdic-30). The second row links dispute 1001 to director 2106706 (Account Name, regional-email-12, legacy-jurisdic-31). The third row associates dispute 1002 with director 10449524 (Saipan International Airport, legacy-email-13, compact-jurisdic-32).

## Dispute and Player Involvement

The dispute_player_detail_view joins dispute records with the players involved in each dispute, answering the question of which players are parties to each conflict and what their ratings and statuses are.

**View `dispute_player_detail_view`**

```sql
CREATE VIEW dispute_player_detail_view AS
SELECT a.id, a.dispute_id, a.game_id, b.id AS player_id, b.player_id AS player_player_id, b.full_name AS player_full_name
FROM disputes a
  JOIN disputes_players j ON j.dispute_id = a.id
  JOIN players b ON b.id = j.player_id;
```

| id | dispute_id | game_id | player_id | player_player_id | player_full_name |
|---|---|---|---|---|---|
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | 101 | 605941 | Account Name |
| 1001 | 121 | 8843755 | 101 | 605941 | Account Name |
| 1001 | 121 | 8843755 | 102 | 195362 | Saipan International Airport |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | 102 | 195362 | Saipan International Airport |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | 103 | id_26 | Norma Fisher |
| 1003 | level-3 | 3001009030250 | 103 | id_26 | Norma Fisher |
| 1003 | level-3 | 3001009030250 | 100 | gd_fp_eu_acc2 | Theodore Mcgrath |

The first row shows dispute 1000 involving player gd_fp_eu_acc2 (Theodore Mcgrath, rating 24, active). The second row links dispute 1001 to player 605941 (Account Name, rating 29, defaulted). The third row associates dispute 1002 with player 195362 (Saipan International Airport, rating 34, forfeited).

## Synthesis

The chess tournament administration domain is a tightly interwoven system of events, participants, and oversight mechanisms. Tournaments serve as the container for all competitive activity, each with a defined format, time control, and administrative structure. Players bring competitive strength measured by ratings and participate across tournaments, games, and teams. Teams aggregate players into units led by captains who report to tournament directors. Chess games represent the fundamental competitive unit, with detailed records of moves, notation, and transmission. Disputes provide a formal mechanism for conflict resolution, adjudicated by tournament directors and involving the players in question. The junction tables and detail views ensure that every entity can be traced through its relationships, providing a complete and auditable record of the competitive ecosystem.

## Data appendix

**Table `tournaments_players`**

| tournament_id | player_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `tournaments_games`**

| tournament_id | game_id |
|---|---|
| 1 | 8350009 |
| 1 | 8843755 |
| 2 | 8843755 |
| 2 | 24341655 |
| 3 | 24341655 |
| 3 | 3001009030250 |
| 4 | 3001009030250 |
| 4 | 8350009 |

**Table `teams_players`**

| team_id | player_id |
|---|---|
| 1450649 | 100 |
| 1450649 | 101 |
| 1437598 | 101 |
| 1437598 | 102 |
| id_14 | 102 |
| id_14 | 103 |
| 99701 | 103 |
| 99701 | 100 |

**Table `games_cards`**

| game_id | move_card_id |
|---|---|
| 8350009 | 100 |
| 8350009 | 101 |
| 8843755 | 101 |
| 8843755 | 102 |
| 24341655 | 102 |
| 24341655 | 103 |
| 3001009030250 | 103 |
| 3001009030250 | 100 |

**Table `disputes_players`**

| dispute_id | player_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |
