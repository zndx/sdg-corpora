Tournament play in distributed, asynchronous environments requires meticulous tracking of every participant, every move, and every administrative decision. A single contest may involve multiple players organized into teams, each move recorded on a card with precise timestamps, and a tournament director overseeing compliance and dispute resolution. The records that capture this ecosystem are organized around six core entities: the games themselves, the players who compete, the teams they represent, the captains who lead them, the move cards that document each play, and the tournament directors who govern the proceedings. Association tables bridge these entities, recording which players participated in which games, which cards were submitted in which contests, and which directors oversaw which participants. The resulting structure supports detailed queries at every level—from a single move card back to its director, to a team's full roster across all tournaments.

## Tournament Games

The central event in this domain is the tournament game, a discrete contest with a unique identifier, a start and end date, and a defined time control regime. Each game is assigned a time control such as `legacy-time-13` or `primary-time-16`, and carries a status that reflects its current standing: `active`, `completed`, `forfeited`, or `disputed`. The notation agreement—`baseline-notation-79`, `pilot-notation-80`, `extended-notation-81`, or `integrated-notation-82`—specifies how moves are recorded, while the transmission mode (`email`, `mail`, `fax`, `telegram`) indicates the channel through which play was conducted.

**Table `tournament_games`**

| id | game_id | start_date | end_date | time_control | status | notation_agreement | transmission_mode | is_team_event | tournament_director_td_id | team_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | legacy-time-13 | active | baseline-notation-79 | mail | true | 8189491 | 1450649 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | compact-time-14 | completed | pilot-notation-80 | email | false | 2106706 | 1437598 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | composite-time-15 | forfeited | extended-notation-81 | fax | true | 10449524 | id_14 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | primary-time-16 | disputed | integrated-notation-82 | telegram | false | 3355777 | 99701 |

Consider game `8350009` (internal id `1000`), which began on 2022-09-05 and was governed by tournament director `8189491`. It was a team event, linked to team `1450649`, and used the `mail` transmission mode under the `legacy-time-13` control. By contrast, game `24341655` (id `1002`) was also a team event but ended in a `forfeited` status, transmitted via `fax` with `composite-time-15` control. The most recent entry, game `3001009030250` (id `1003`), is marked `disputed` and uses `telegram` as its transmission mode under `primary-time-16`.

## Players

Players are the individual competitors. Each player record carries a `player_id`, a `full_name`, an `email_address`, and a `country_code`. The boolean flag `is_team_captain` distinguishes those who also serve as team leaders. Additional fields track time consumption: `total_time_used` and `accumulated_time` record how long a player has spent across all moves, while `vacation_periods` notes any scheduled absences.

**Table `players`**

| player_id | full_name | email_address | country_code | is_team_captain | vacation_periods | total_time_used | accumulated_time | team_id | tournament_director_td_id | team_captain_id |
|---|---|---|---|---|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | false | distributed-vacation-48 | 19.70 | 20.45 | 1450649 | 8189491 | 1000 |
| 605941 | Account Name | adaptive-email-71 | lu_tax_code_template_m_I_2 | true | baseline-vacation-49 | 23.40 | 24.90 | 1437598 | 2106706 | 1001 |
| 195362 | Saipan International Airport | distributed-email-72 | default_chart_a_account_57 | false | pilot-vacation-50 | 27.10 | 29.35 | id_14 | 10449524 | 1002 |
| id_26 | Norma Fisher | baseline-email-73 | 727045 | true | extended-vacation-51 | 30.80 | 33.80 | 99701 | 3355777 | 1003 |

Player `gd_fp_eu_acc2`, named Theodore Mcgrath, is not a team captain and has used 19.70 units of time out of an accumulated 20.45. Player `605941`, listed as Account Name, is a team captain with 23.40 total time used against 24.90 accumulated. Player `id_26`, Norma Fisher, is also a team captain and has consumed 30.80 of 33.80 accumulated time units. Each player is associated with a team and a tournament director, establishing the primary relationships that anchor the rest of the data.

## Teams and Team Captains

Teams aggregate players into competitive units. A team has a `team_id`, a `team_name`, a `country_code`, a `registration_date`, and a `status` that can be `active`, `inactive`, or `disqualified`. The `captain_id` field references the individual who leads the team, while `team_captain_id` links to the formal team captain record.

**Table `teams`**

| team_id | team_name | country_code | captain_id | registration_date | status | team_captain_id |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 195352 | 2023-06-19 | active | 1000 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 338514 | 2024-11-03 | inactive | 1001 |
| id_14 | Legacy Review | default_chart_a_account_57 | 7021001070150 | 2025-04-14 | disqualified | 1002 |
| 99701 | Regional Initiative | 727045 | 3001009030270 | 2022-09-25 | active | 1003 |

Team `1450649`, named Composite Model, is active and was registered on 2023-06-19. Team `1437598`, Compact Cluster A, is inactive as of its 2024-11-03 registration. Team `id_14`, Legacy Review, holds a `disqualified` status, while team `99701`, Regional Initiative, remains active with a registration date of 2022-09-25.

The team captain records formalize the leadership role. Each captain has an `id`, a `captain_id`, a `full_name`, an `email_address`, and a `notification_preference` that can be `email`, `mail`, or `fax`. The `represents_team_team_id` field ties the captain to the team they lead, and `tournament_director_td_id` assigns oversight.

**Table `team_captains`**

| id | captain_id | full_name | email_address | team_id | notification_preference | represents_team_team_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|
| 1000 | 195352 | Theodore Mcgrath | primary-email-70 | 1450649 | email | 1450649 | 8189491 |
| 1001 | 338514 | Account Name | adaptive-email-71 | 1437598 | mail | 1437598 | 2106706 |
| 1002 | 7021001070150 | Saipan International Airport | distributed-email-72 | id_14 | fax | id_14 | 10449524 |
| 1003 | 3001009030270 | Norma Fisher | baseline-email-73 | 99701 | email | 99701 | 3355777 |

Captain record `1000` corresponds to Theodore Mcgrath, who prefers `email` notifications and represents team `1450649` under director `8189491`. Captain `1002`, listed as Saipan International Airport, uses `fax` for notifications and represents team `id_14` under director `10449524`.

## Move Cards

Every move in a tournament game is documented on a move card. The `move_card_id` uniquely identifies the record, while `card_id` provides an external reference. The `move_number` indicates the sequence position, and `player_id` identifies the submitting player. The `move_notation` field stores the actual move (e.g., `primary-move-94`, `adaptive-move-95`), and `time_used` records how long the player took.

**Table `move_cards`**

| move_card_id | card_id | move_number | player_id | move_notation | time_used | postmark_date | transmission_timestamp | is_ambiguous | status | tournament_game_id | submitted_by_player_id | received_by_player_id | tournament_director_td_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 17788643 | 17 | gd_fp_eu_acc2 | primary-move-94 | 7.45 | 2024-03-07 | 2025-12-08T23:57:00 | true | pending | 1000 | gd_fp_eu_acc2 | gd_fp_eu_acc2 | 8189491 | 2025-01-01 00:14:00 |
| 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 | 605941 | adaptive-move-95 | 10.90 | 2025-08-18 | 2022-05-19T06:14:00 | false | clarified | 1001 | 605941 | 605941 | 2106706 | 2025-02-06 03:14:00 |
| 3 | 1336192 | 33 | 195362 | distributed-move-96 | 14.35 | 2022-01-02 | 2023-10-03T13:31:00 | true | accepted | 1002 | 195362 | 195362 | 10449524 | 2025-03-11 06:14:00 |
| 4 | 5917278 | 41 | id_26 | baseline-move-97 | 17.80 | 2023-06-13 | 2024-03-14T20:48:00 | false | rejected | 1003 | id_26 | id_26 | 3355777 | 2025-04-16 09:14:00 |

Move card `1` (card_id `17788643`) is move number 17, submitted by player `gd_fp_eu_acc2` with notation `primary-move-94`. It took 7.45 time units, was postmarked on 2024-03-07, and is currently `pending`. The `is_ambiguous` flag is `true`, indicating the move notation required clarification. Move card `2` (card_id `ChIJ20iLSYBt5kcRqH2vq_dd6GU`) is move number 25, submitted by player `605941` with notation `adaptive-move-95`, took 10.90 time units, and has a `clarified` status. Move card `3` is move number 33, submitted by player `195362`, with notation `distributed-move-96`, and an `accepted` status. Move card `4` is move number 41, submitted by player `id_26`, with notation `baseline-move-97`, and a `rejected` status. Each card is linked to a `tournament_game_id` and a `tournament_director_td_id`.

## Tournament Directors

Tournament directors administer the games. Each director has a `td_id`, a `full_name`, an `email_address`, a `jurisdiction` (such as `regional-jurisdic-30` or `compact-jurisdic-32`), an `active_games_count`, and a `dispute_resolution_log`.

**Table `tournament_directors`**

| td_id | full_name | email_address | jurisdiction | active_games_count | dispute_resolution_log |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | regional-jurisdic-30 | 69 | seasonal-dispute-41 |
| 2106706 | Account Name | adaptive-email-71 | legacy-jurisdic-31 | 4 | regional-dispute-42 |
| 10449524 | Saipan International Airport | distributed-email-72 | compact-jurisdic-32 | 99 | legacy-dispute-43 |
| 3355777 | Norma Fisher | baseline-email-73 | composite-jurisdic-33 | 4 | compact-dispute-44 |

Director `8189491`, Theodore Mcgrath, has jurisdiction `regional-jurisdic-30`, oversees 69 active games, and maintains a `seasonal-dispute-41` resolution log. Director `10449524`, Saipan International Airport, has the highest active game count at 99 and manages `legacy-dispute-43`. Director `3355777`, Norma Fisher, oversees 4 active games under `composite-jurisdic-33` with a `compact-dispute-44` log.

## Association Records

The domain uses a set of association tables to record the many-to-many relationships between the core entities. The `games_players` table links players to the games they participated in. The `games_cards` table records which move cards were submitted in which games. The `players_games` table provides an alternative linkage from the player side. The `teams_players` table associates players with their teams. The `teams_games` table records which teams competed in which games. The `directors_games` table links directors to the games they oversaw. The `directors_players` table connects directors to the players under their jurisdiction. The `directors_captains` table links directors to the team captains they supervise. Finally, the `directors_cards` table records which directors reviewed which move cards.

These association tables form the connective tissue of the domain, enabling queries that traverse from any entity to all related entities across the tournament ecosystem.

## Tournament Game Detail Views

The view `vw_tournament_game_player_detail` answers the question: which players participated in which tournament games, and what are their individual details? It joins tournament games with players through the association tables, producing rows that combine game metadata with player information. A row from this view might show game `8350009` alongside player `gd_fp_eu_acc2` (Theodore Mcgrath), revealing that this player competed in a team event under director `8189491` with `legacy-time-13` control.

**View `vw_tournament_game_player_detail`**

```sql
CREATE VIEW vw_tournament_game_player_detail AS
SELECT a.id, a.game_id, a.start_date, b.player_id AS player_player_id, b.full_name AS player_full_name, b.email_address AS player_email_address
FROM tournament_games a
  JOIN games_players j ON j.tournament_game_id = a.id
  JOIN players b ON b.player_id = j.player_id;
```

| id | game_id | start_date | player_player_id | player_full_name | player_email_address |
|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |
| 1000 | 8350009 | 2022-09-05T20:24:00 | 605941 | Account Name | adaptive-email-71 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 605941 | Account Name | adaptive-email-71 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 195362 | Saipan International Airport | distributed-email-72 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 195362 | Saipan International Airport | distributed-email-72 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | id_26 | Norma Fisher | baseline-email-73 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | id_26 | Norma Fisher | baseline-email-73 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |

The view `vw_tournament_game_tournament_director` joins tournament games with their overseeing directors, answering which director administered which game. A representative row links game `8350009` to director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`), showing that this director managed a game transmitted via `mail` with `legacy-time-13` time control.

**View `vw_tournament_game_tournament_director`**

```sql
CREATE VIEW vw_tournament_game_tournament_director AS
SELECT a.id, a.game_id, a.start_date, a.end_date, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email_address AS director_email_address
FROM tournament_games a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| id | game_id | start_date | end_date | director_td_id | director_full_name | director_email_address |
|---|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 8189491 | Theodore Mcgrath | primary-email-70 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2106706 | Account Name | adaptive-email-71 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 10449524 | Saipan International Airport | distributed-email-72 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 3355777 | Norma Fisher | baseline-email-73 |

The view `vw_tournament_game_team` joins tournament games with the teams that competed in them. A row from this view might show game `8350009` alongside team `1450649` (Composite Model), revealing that this active team participated in a team event with `mail` transmission and `legacy-time-13` control.

**View `vw_tournament_game_team`**

```sql
CREATE VIEW vw_tournament_game_team AS
SELECT a.id, a.game_id, a.start_date, a.end_date, b.team_id AS team_team_id, b.team_name AS team_team_name, b.country_code AS team_country_code
FROM tournament_games a JOIN teams b ON a.team_id = b.team_id;
```

| id | game_id | start_date | end_date | team_team_id | team_team_name | team_country_code |
|---|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | id_14 | Legacy Review | default_chart_a_account_57 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 99701 | Regional Initiative | 727045 |

The view `vw_tournament_game_move_card_detail` joins tournament games with the move cards submitted within them. A representative row links game `1000` to move card `1` (card_id `17788643`, move number 17, notation `primary-move-94`), showing that this move was submitted by player `gd_fp_eu_acc2`, took 7.45 time units, and is currently `pending` with an ambiguous flag set to `true`.

**View `vw_tournament_game_move_card_detail`**

```sql
CREATE VIEW vw_tournament_game_move_card_detail AS
SELECT a.id, a.game_id, a.start_date, b.move_card_id AS card_move_card_id, b.card_id AS card_card_id, b.move_number AS card_move_number
FROM tournament_games a
  JOIN games_cards j ON j.tournament_game_id = a.id
  JOIN move_cards b ON b.move_card_id = j.move_card_id;
```

| id | game_id | start_date | card_move_card_id | card_card_id | card_move_number |
|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | 1 | 17788643 | 17 |
| 1000 | 8350009 | 2022-09-05T20:24:00 | 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 3 | 1336192 | 33 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 3 | 1336192 | 33 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 4 | 5917278 | 41 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 4 | 5917278 | 41 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 1 | 17788643 | 17 |

## Player Detail Views

The view `vw_player_tournament_game_detail` answers: which games did a given player participate in, and what were the game conditions? A row might show player `gd_fp_eu_acc2` (Theodore Mcgrath) competing in game `8350009`, which had `legacy-time-13` control, was transmitted via `mail`, and was overseen by director `8189491`.

**View `vw_player_tournament_game_detail`**

```sql
CREATE VIEW vw_player_tournament_game_detail AS
SELECT a.player_id, a.full_name, a.email_address, b.id AS game_id, b.game_id AS game_game_id, b.start_date AS game_start_date
FROM players a
  JOIN players_games j ON j.player_id = a.player_id
  JOIN tournament_games b ON b.id = j.tournament_game_id;
```

| player_id | full_name | email_address | game_id | game_game_id | game_start_date |
|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 1000 | 8350009 | 2022-09-05T20:24:00 |
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 605941 | Account Name | adaptive-email-71 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 605941 | Account Name | adaptive-email-71 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| 195362 | Saipan International Airport | distributed-email-72 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| 195362 | Saipan International Airport | distributed-email-72 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| id_26 | Norma Fisher | baseline-email-73 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| id_26 | Norma Fisher | baseline-email-73 | 1000 | 8350009 | 2022-09-05T20:24:00 |

The view `vw_player_team` joins players with their teams, answering which team each player represents. A row from this view might show player `gd_fp_eu_acc2` associated with team `1450649` (Composite Model), an active team registered on 2023-06-19.

**View `vw_player_team`**

```sql
CREATE VIEW vw_player_team AS
SELECT a.player_id, a.full_name, a.email_address, a.country_code, b.team_id AS team_team_id, b.team_name AS team_team_name, b.country_code AS team_country_code
FROM players a JOIN teams b ON a.team_id = b.team_id;
```

| player_id | full_name | email_address | country_code | team_team_id | team_team_name | team_country_code |
|---|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |
| 605941 | Account Name | adaptive-email-71 | lu_tax_code_template_m_I_2 | 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 |
| 195362 | Saipan International Airport | distributed-email-72 | default_chart_a_account_57 | id_14 | Legacy Review | default_chart_a_account_57 |
| id_26 | Norma Fisher | baseline-email-73 | 727045 | 99701 | Regional Initiative | 727045 |

The view `vw_player_tournament_director` joins players with their overseeing tournament directors. A representative row links player `gd_fp_eu_acc2` to director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`), showing the administrative chain of authority.

**View `vw_player_tournament_director`**

```sql
CREATE VIEW vw_player_tournament_director AS
SELECT a.player_id, a.full_name, a.email_address, a.country_code, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email_address AS director_email_address
FROM players a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| player_id | full_name | email_address | country_code | director_td_id | director_full_name | director_email_address |
|---|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 8189491 | Theodore Mcgrath | primary-email-70 |
| 605941 | Account Name | adaptive-email-71 | lu_tax_code_template_m_I_2 | 2106706 | Account Name | adaptive-email-71 |
| 195362 | Saipan International Airport | distributed-email-72 | default_chart_a_account_57 | 10449524 | Saipan International Airport | distributed-email-72 |
| id_26 | Norma Fisher | baseline-email-73 | 727045 | 3355777 | Norma Fisher | baseline-email-73 |

The view `vw_player_team_captain` joins players with the team captains in their organization. A row might show player `605941` (Account Name, who is themselves a team captain) linked to captain record `1001`, who represents team `1437598` (Compact Cluster A) under director `2106706`.

**View `vw_player_team_captain`**

```sql
CREATE VIEW vw_player_team_captain AS
SELECT a.player_id, a.full_name, a.email_address, a.country_code, b.id AS captain_id, b.captain_id AS captain_captain_id, b.full_name AS captain_full_name
FROM players a JOIN team_captains b ON a.team_captain_id = b.id;
```

| player_id | full_name | email_address | country_code | captain_id | captain_captain_id | captain_full_name |
|---|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 195352 | Theodore Mcgrath |
| 605941 | Account Name | adaptive-email-71 | lu_tax_code_template_m_I_2 | 1001 | 338514 | Account Name |
| 195362 | Saipan International Airport | distributed-email-72 | default_chart_a_account_57 | 1002 | 7021001070150 | Saipan International Airport |
| id_26 | Norma Fisher | baseline-email-73 | 727045 | 1003 | 3001009030270 | Norma Fisher |

## Team Detail Views

The view `vw_team_team_captain` joins teams with their formal captain records. A representative row links team `1450649` (Composite Model) to captain record `1000` (Theodore Mcgrath, notification preference `email`), showing the formal leadership assignment.

**View `vw_team_team_captain`**

```sql
CREATE VIEW vw_team_team_captain AS
SELECT a.team_id, a.team_name, a.country_code, a.captain_id, b.id AS captain_id, b.captain_id AS captain_captain_id, b.full_name AS captain_full_name
FROM teams a JOIN team_captains b ON a.team_captain_id = b.id;
```

| team_id | team_name | country_code | captain_id | captain_id | captain_captain_id | captain_full_name |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 195352 | 1000 | 195352 | Theodore Mcgrath |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 338514 | 1001 | 338514 | Account Name |
| id_14 | Legacy Review | default_chart_a_account_57 | 7021001070150 | 1002 | 7021001070150 | Saipan International Airport |
| 99701 | Regional Initiative | 727045 | 3001009030270 | 1003 | 3001009030270 | Norma Fisher |

The view `vw_team_player_detail` joins teams with their player rosters, answering which players belong to which teams. A row might show team `1450649` alongside player `gd_fp_eu_acc2` (Theodore Mcgrath), revealing the team's composition.

**View `vw_team_player_detail`**

```sql
CREATE VIEW vw_team_player_detail AS
SELECT a.team_id, a.team_name, a.country_code, b.player_id AS player_player_id, b.full_name AS player_full_name, b.email_address AS player_email_address
FROM teams a
  JOIN teams_players j ON j.team_id = a.team_id
  JOIN players b ON b.player_id = j.player_id;
```

| team_id | team_name | country_code | player_player_id | player_full_name | player_email_address |
|---|---|---|---|---|---|
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 605941 | Account Name | adaptive-email-71 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 605941 | Account Name | adaptive-email-71 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 195362 | Saipan International Airport | distributed-email-72 |
| id_14 | Legacy Review | default_chart_a_account_57 | 195362 | Saipan International Airport | distributed-email-72 |
| id_14 | Legacy Review | default_chart_a_account_57 | id_26 | Norma Fisher | baseline-email-73 |
| 99701 | Regional Initiative | 727045 | id_26 | Norma Fisher | baseline-email-73 |
| 99701 | Regional Initiative | 727045 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |

The view `vw_team_tournament_game_detail` joins teams with the tournament games they competed in. A representative row links team `1450649` to game `8350009`, showing that Composite Model participated in a team event with `legacy-time-13` control transmitted via `mail`.

**View `vw_team_tournament_game_detail`**

```sql
CREATE VIEW vw_team_tournament_game_detail AS
SELECT a.team_id, a.team_name, a.country_code, b.id AS game_id, b.game_id AS game_game_id, b.start_date AS game_start_date
FROM teams a
  JOIN teams_games j ON j.team_id = a.team_id
  JOIN tournament_games b ON b.id = j.tournament_game_id;
```

| team_id | team_name | country_code | game_id | game_game_id | game_start_date |
|---|---|---|---|---|---|
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 8350009 | 2022-09-05T20:24:00 |
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| id_14 | Legacy Review | default_chart_a_account_57 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| id_14 | Legacy Review | default_chart_a_account_57 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| 99701 | Regional Initiative | 727045 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| 99701 | Regional Initiative | 727045 | 1000 | 8350009 | 2022-09-05T20:24:00 |

## Team Captain Detail Views

The view `vw_team_captain_team` joins team captain records with the teams they represent. A row from this view might show captain `1000` (Theodore Mcgrath) representing team `1450649` (Composite Model), with a notification preference of `email`.

**View `vw_team_captain_team`**

```sql
CREATE VIEW vw_team_captain_team AS
SELECT a.id, a.captain_id, a.full_name, a.email_address, b.team_id AS team_team_id, b.team_name AS team_team_name, b.country_code AS team_country_code
FROM team_captains a JOIN teams b ON a.represents_team_team_id = b.team_id;
```

| id | captain_id | full_name | email_address | team_team_id | team_team_name | team_country_code |
|---|---|---|---|---|---|---|
| 1000 | 195352 | Theodore Mcgrath | primary-email-70 | 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 338514 | Account Name | adaptive-email-71 | 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 |
| 1002 | 7021001070150 | Saipan International Airport | distributed-email-72 | id_14 | Legacy Review | default_chart_a_account_57 |
| 1003 | 3001009030270 | Norma Fisher | baseline-email-73 | 99701 | Regional Initiative | 727045 |

The view `vw_team_captain_tournament_director` joins team captains with their overseeing directors. A representative row links captain `1000` to director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`), showing the administrative oversight chain for team leadership.

**View `vw_team_captain_tournament_director`**

```sql
CREATE VIEW vw_team_captain_tournament_director AS
SELECT a.id, a.captain_id, a.full_name, a.email_address, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email_address AS director_email_address
FROM team_captains a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| id | captain_id | full_name | email_address | director_td_id | director_full_name | director_email_address |
|---|---|---|---|---|---|---|
| 1000 | 195352 | Theodore Mcgrath | primary-email-70 | 8189491 | Theodore Mcgrath | primary-email-70 |
| 1001 | 338514 | Account Name | adaptive-email-71 | 2106706 | Account Name | adaptive-email-71 |
| 1002 | 7021001070150 | Saipan International Airport | distributed-email-72 | 10449524 | Saipan International Airport | distributed-email-72 |
| 1003 | 3001009030270 | Norma Fisher | baseline-email-73 | 3355777 | Norma Fisher | baseline-email-73 |

## Move Card Detail Views

The view `vw_move_card_tournament_game` joins move cards with the tournament games they belong to. A representative row links move card `1` (card_id `17788643`, move number 17, notation `primary-move-94`) to game `1000`, showing that this move was part of a team event with `legacy-time-13` control transmitted via `mail`.

**View `vw_move_card_tournament_game`**

```sql
CREATE VIEW vw_move_card_tournament_game AS
SELECT a.move_card_id, a.card_id, a.move_number, a.player_id, b.id AS game_id, b.game_id AS game_game_id, b.start_date AS game_start_date
FROM move_cards a JOIN tournament_games b ON a.tournament_game_id = b.id;
```

| move_card_id | card_id | move_number | player_id | game_id | game_game_id | game_start_date |
|---|---|---|---|---|---|---|
| 1 | 17788643 | 17 | gd_fp_eu_acc2 | 1000 | 8350009 | 2022-09-05T20:24:00 |
| 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 | 605941 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 3 | 1336192 | 33 | 195362 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| 4 | 5917278 | 41 | id_26 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |

The view `vw_move_card_player` joins move cards with the players who submitted them. A row might show move card `1` submitted by player `gd_fp_eu_acc2` (Theodore Mcgrath), with 7.45 time units used and a `pending` status.

**View `vw_move_card_player`**

```sql
CREATE VIEW vw_move_card_player AS
SELECT a.move_card_id, a.card_id, a.move_number, a.player_id, b.player_id AS player_player_id, b.full_name AS player_full_name, b.email_address AS player_email_address
FROM move_cards a JOIN players b ON a.submitted_by_player_id = b.player_id;
```

| move_card_id | card_id | move_number | player_id | player_player_id | player_full_name | player_email_address |
|---|---|---|---|---|---|---|
| 1 | 17788643 | 17 | gd_fp_eu_acc2 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |
| 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 | 605941 | 605941 | Account Name | adaptive-email-71 |
| 3 | 1336192 | 33 | 195362 | 195362 | Saipan International Airport | distributed-email-72 |
| 4 | 5917278 | 41 | id_26 | id_26 | Norma Fisher | baseline-email-73 |

The view `vw_move_card_tournament_director` joins move cards with the directors who reviewed them. A representative row links move card `1` to director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`), showing the administrative review chain for move adjudication.

**View `vw_move_card_tournament_director`**

```sql
CREATE VIEW vw_move_card_tournament_director AS
SELECT a.move_card_id, a.card_id, a.move_number, a.player_id, b.td_id AS director_td_id, b.full_name AS director_full_name, b.email_address AS director_email_address
FROM move_cards a JOIN tournament_directors b ON a.tournament_director_td_id = b.td_id;
```

| move_card_id | card_id | move_number | player_id | director_td_id | director_full_name | director_email_address |
|---|---|---|---|---|---|---|
| 1 | 17788643 | 17 | gd_fp_eu_acc2 | 8189491 | Theodore Mcgrath | primary-email-70 |
| 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 | 605941 | 2106706 | Account Name | adaptive-email-71 |
| 3 | 1336192 | 33 | 195362 | 10449524 | Saipan International Airport | distributed-email-72 |
| 4 | 5917278 | 41 | id_26 | 3355777 | Norma Fisher | baseline-email-73 |

## Tournament Director Detail Views

The view `vw_tournament_director_tournament_game_detail` joins tournament directors with the games they oversee. A representative row links director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`) to game `1000` (game_id `8350009`), showing that this director administered a team event with `legacy-time-13` control transmitted via `mail`.

**View `vw_tournament_director_tournament_game_detail`**

```sql
CREATE VIEW vw_tournament_director_tournament_game_detail AS
SELECT a.td_id, a.full_name, a.email_address, b.id AS game_id, b.game_id AS game_game_id, b.start_date AS game_start_date
FROM tournament_directors a
  JOIN directors_games j ON j.tournament_director_td_id = a.td_id
  JOIN tournament_games b ON b.id = j.tournament_game_id;
```

| td_id | full_name | email_address | game_id | game_game_id | game_start_date |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | 1000 | 8350009 | 2022-09-05T20:24:00 |
| 8189491 | Theodore Mcgrath | primary-email-70 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 2106706 | Account Name | adaptive-email-71 | 1001 | 8843755 | 2023-02-16T03:41:00 |
| 2106706 | Account Name | adaptive-email-71 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| 10449524 | Saipan International Airport | distributed-email-72 | 1002 | 24341655 | 2024-07-27T10:58:00 |
| 10449524 | Saipan International Airport | distributed-email-72 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| 3355777 | Norma Fisher | baseline-email-73 | 1003 | 3001009030250 | 2025-12-11T17:15:00 |
| 3355777 | Norma Fisher | baseline-email-73 | 1000 | 8350009 | 2022-09-05T20:24:00 |

The view `vw_tournament_director_player_detail` joins tournament directors with the players under their jurisdiction. A row might show director `8189491` overseeing player `gd_fp_eu_acc2` (Theodore Mcgrath), who has used 19.70 of 20.45 accumulated time units and is associated with team `1450649`.

**View `vw_tournament_director_player_detail`**

```sql
CREATE VIEW vw_tournament_director_player_detail AS
SELECT a.td_id, a.full_name, a.email_address, b.player_id AS player_player_id, b.full_name AS player_full_name, b.email_address AS player_email_address
FROM tournament_directors a
  JOIN directors_players j ON j.tournament_director_td_id = a.td_id
  JOIN players b ON b.player_id = j.player_id;
```

| td_id | full_name | email_address | player_player_id | player_full_name | player_email_address |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |
| 8189491 | Theodore Mcgrath | primary-email-70 | 605941 | Account Name | adaptive-email-71 |
| 2106706 | Account Name | adaptive-email-71 | 605941 | Account Name | adaptive-email-71 |
| 2106706 | Account Name | adaptive-email-71 | 195362 | Saipan International Airport | distributed-email-72 |
| 10449524 | Saipan International Airport | distributed-email-72 | 195362 | Saipan International Airport | distributed-email-72 |
| 10449524 | Saipan International Airport | distributed-email-72 | id_26 | Norma Fisher | baseline-email-73 |
| 3355777 | Norma Fisher | baseline-email-73 | id_26 | Norma Fisher | baseline-email-73 |
| 3355777 | Norma Fisher | baseline-email-73 | gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 |

The view `vw_tournament_director_team_captain_detail` joins tournament directors with the team captains under their supervision. A representative row links director `8189491` to captain `1000` (Theodore Mcgrath, notification preference `email`, representing team `1450649`), showing the director's oversight of team leadership.

**View `vw_tournament_director_team_captain_detail`**

```sql
CREATE VIEW vw_tournament_director_team_captain_detail AS
SELECT a.td_id, a.full_name, a.email_address, b.id AS captain_id, b.captain_id AS captain_captain_id, b.full_name AS captain_full_name
FROM tournament_directors a
  JOIN directors_captains j ON j.tournament_director_td_id = a.td_id
  JOIN team_captains b ON b.id = j.team_captain_id;
```

| td_id | full_name | email_address | captain_id | captain_captain_id | captain_full_name |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | 1000 | 195352 | Theodore Mcgrath |
| 8189491 | Theodore Mcgrath | primary-email-70 | 1001 | 338514 | Account Name |
| 2106706 | Account Name | adaptive-email-71 | 1001 | 338514 | Account Name |
| 2106706 | Account Name | adaptive-email-71 | 1002 | 7021001070150 | Saipan International Airport |
| 10449524 | Saipan International Airport | distributed-email-72 | 1002 | 7021001070150 | Saipan International Airport |
| 10449524 | Saipan International Airport | distributed-email-72 | 1003 | 3001009030270 | Norma Fisher |
| 3355777 | Norma Fisher | baseline-email-73 | 1003 | 3001009030270 | Norma Fisher |
| 3355777 | Norma Fisher | baseline-email-73 | 1000 | 195352 | Theodore Mcgrath |

The view `vw_tournament_director_move_card_detail` joins tournament directors with the move cards they reviewed. A row might show director `8189491` reviewing move card `1` (card_id `17788643`, move number 17, notation `primary-move-94`), which was submitted by player `gd_fp_eu_acc2`, took 7.45 time units, and is currently `pending` with an ambiguous flag set to `true`.

**View `vw_tournament_director_move_card_detail`**

```sql
CREATE VIEW vw_tournament_director_move_card_detail AS
SELECT a.td_id, a.full_name, a.email_address, b.move_card_id AS card_move_card_id, b.card_id AS card_card_id, b.move_number AS card_move_number
FROM tournament_directors a
  JOIN directors_cards j ON j.tournament_director_td_id = a.td_id
  JOIN move_cards b ON b.move_card_id = j.move_card_id;
```

| td_id | full_name | email_address | card_move_card_id | card_card_id | card_move_number |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | 1 | 17788643 | 17 |
| 8189491 | Theodore Mcgrath | primary-email-70 | 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 |
| 2106706 | Account Name | adaptive-email-71 | 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 |
| 2106706 | Account Name | adaptive-email-71 | 3 | 1336192 | 33 |
| 10449524 | Saipan International Airport | distributed-email-72 | 3 | 1336192 | 33 |
| 10449524 | Saipan International Airport | distributed-email-72 | 4 | 5917278 | 41 |
| 3355777 | Norma Fisher | baseline-email-73 | 4 | 5917278 | 41 |
| 3355777 | Norma Fisher | baseline-email-73 | 1 | 17788643 | 17 |

## Synthesis

The tournament domain is structured around six core entities—games, players, teams, team captains, move cards, and tournament directors—connected through a network of association tables that capture every competitive and administrative relationship. The base tables store the raw records: game metadata with time controls and transmission modes, player profiles with time tracking, team rosters with registration dates, captain assignments with notification preferences, move cards with notation and timestamps, and director profiles with jurisdiction and dispute logs. The association tables—`games_players`, `games_cards`, `players_games`, `teams_players`, `teams_games`, `directors_games`, `directors_players`, `directors_captains`, and `directors_cards`—form the connective tissue that enables cross-entity queries. The twenty-two detail views then materialize these relationships into focused lenses: from a game's perspective (its players, director, team, and move cards), from a player's perspective (their games, team, director, and captain), from a team's perspective (its captain, players, and games), from a captain's perspective (their team and director), from a move card's perspective (its game, player, and director), and from a director's perspective (their games, players, captains, and cards). Together, this structure supports comprehensive tracking of every aspect of distributed tournament play, from the submission of a single ambiguous move to the administrative oversight of an entire tournament.

## Data appendix

**Table `games_players`**

| tournament_game_id | player_id |
|---|---|
| 1000 | gd_fp_eu_acc2 |
| 1000 | 605941 |
| 1001 | 605941 |
| 1001 | 195362 |
| 1002 | 195362 |
| 1002 | id_26 |
| 1003 | id_26 |
| 1003 | gd_fp_eu_acc2 |

**Table `games_cards`**

| tournament_game_id | move_card_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `players_games`**

| player_id | tournament_game_id |
|---|---|
| gd_fp_eu_acc2 | 1000 |
| gd_fp_eu_acc2 | 1001 |
| 605941 | 1001 |
| 605941 | 1002 |
| 195362 | 1002 |
| 195362 | 1003 |
| id_26 | 1003 |
| id_26 | 1000 |

**Table `teams_players`**

| team_id | player_id |
|---|---|
| 1450649 | gd_fp_eu_acc2 |
| 1450649 | 605941 |
| 1437598 | 605941 |
| 1437598 | 195362 |
| id_14 | 195362 |
| id_14 | id_26 |
| 99701 | id_26 |
| 99701 | gd_fp_eu_acc2 |

**Table `teams_games`**

| team_id | tournament_game_id |
|---|---|
| 1450649 | 1000 |
| 1450649 | 1001 |
| 1437598 | 1001 |
| 1437598 | 1002 |
| id_14 | 1002 |
| id_14 | 1003 |
| 99701 | 1003 |
| 99701 | 1000 |

**Table `directors_games`**

| tournament_director_td_id | tournament_game_id |
|---|---|
| 8189491 | 1000 |
| 8189491 | 1001 |
| 2106706 | 1001 |
| 2106706 | 1002 |
| 10449524 | 1002 |
| 10449524 | 1003 |
| 3355777 | 1003 |
| 3355777 | 1000 |

**Table `directors_players`**

| tournament_director_td_id | player_id |
|---|---|
| 8189491 | gd_fp_eu_acc2 |
| 8189491 | 605941 |
| 2106706 | 605941 |
| 2106706 | 195362 |
| 10449524 | 195362 |
| 10449524 | id_26 |
| 3355777 | id_26 |
| 3355777 | gd_fp_eu_acc2 |

**Table `directors_captains`**

| tournament_director_td_id | team_captain_id |
|---|---|
| 8189491 | 1000 |
| 8189491 | 1001 |
| 2106706 | 1001 |
| 2106706 | 1002 |
| 10449524 | 1002 |
| 10449524 | 1003 |
| 3355777 | 1003 |
| 3355777 | 1000 |

**Table `directors_cards`**

| tournament_director_td_id | move_card_id |
|---|---|
| 8189491 | 1 |
| 8189491 | 2 |
| 2106706 | 2 |
| 2106706 | 3 |
| 10449524 | 3 |
| 10449524 | 4 |
| 3355777 | 4 |
| 3355777 | 1 |
