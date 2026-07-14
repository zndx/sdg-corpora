## Domain Modelling and Relational Materialisation

The chess tournament management domain captures the lifecycle of competitive games, the participants who play them, the teams they represent, and the tournament directors who oversee proceedings. At its core, a `tournament_game` is a discrete match event identified by a surrogate key and an external `game_id`, annotated with temporal boundaries (`start_date`, `end_date`), a `time_control` regime, a `status` such as `active` or `completed`, and operational metadata like `notation_agreement` and `transmission_mode`. Each game is assigned to a single `tournament_director` and optionally to a `team`, establishing the first layer of foreign-key relationships that anchor the entire schema.

**Table `tournament_games`**

| id | game_id | start_date | end_date | time_control | status | notation_agreement | transmission_mode | is_team_event | tournament_director_td_id | team_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | legacy-time-13 | active | baseline-notation-79 | mail | true | 8189491 | 1450649 |
| 1001 | 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | compact-time-14 | completed | pilot-notation-80 | email | false | 2106706 | 1437598 |
| 1002 | 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | composite-time-15 | forfeited | extended-notation-81 | fax | true | 10449524 | id_14 |
| 1003 | 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | primary-time-16 | disputed | integrated-notation-82 | telegram | false | 3355777 | 99701 |

The `tournament_games` table illustrates the domain's temporal and administrative dimensions. Game `8350009` (internal id `1000`) ran under `legacy-time-13` control with `baseline-notation-79` notation, was transmitted via `mail`, and was flagged as a team event (`is_team_event = true`). Its director, `8189491`, and its team, `1450649`, are referenced through the columns `tournament_director_td_id` and `team_id` respectively. Game `3001009030250` (id `1003`) used `telegram` transmission, carried the `disputed` status, and was associated with director `3355777` and team `99701`. The `end_date` preceding the `start_date` in several rows reflects the convention that the end date records the deadline by which the game must conclude, while the start date marks when play commenced.

**Table `players`**

| player_id | full_name | email_address | country_code | is_team_captain | vacation_periods | total_time_used | accumulated_time | team_id | tournament_director_td_id | team_captain_id |
|---|---|---|---|---|---|---|---|---|---|---|
| gd_fp_eu_acc2 | Theodore Mcgrath | primary-email-70 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | false | distributed-vacation-48 | 19.70 | 20.45 | 1450649 | 8189491 | 1000 |
| 605941 | Account Name | adaptive-email-71 | lu_tax_code_template_m_I_2 | true | baseline-vacation-49 | 23.40 | 24.90 | 1437598 | 2106706 | 1001 |
| 195362 | Saipan International Airport | distributed-email-72 | default_chart_a_account_57 | false | pilot-vacation-50 | 27.10 | 29.35 | id_14 | 10449524 | 1002 |
| id_26 | Norma Fisher | baseline-email-73 | 727045 | true | extended-vacation-51 | 30.80 | 33.80 | 99701 | 3355777 | 1003 |

The `players` table stores individual competitor profiles. Each row carries a `player_id` (e.g., `gd_fp_eu_acc2` for Theodore Mcgrath), a `full_name`, an `email_address`, and a `country_code` that in this dataset is represented as a UUID-like string such as `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`. Boolean flag `is_team_captain` distinguishes players who also serve as team captains. Time-tracking columns `total_time_used` and `accumulated_time` record cumulative clock consumption — Mcgrath has used `19.70` of a budgeted `20.45`. Foreign keys `team_id`, `tournament_director_td_id`, and `team_captain_id` link the player to their team, overseeing director, and captain record respectively.

**Table `teams`**

| team_id | team_name | country_code | captain_id | registration_date | status | team_captain_id |
|---|---|---|---|---|---|---|
| 1450649 | Composite Model | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 195352 | 2023-06-19 | active | 1000 |
| 1437598 | Compact Cluster A | lu_tax_code_template_m_I_2 | 338514 | 2024-11-03 | inactive | 1001 |
| id_14 | Legacy Review | default_chart_a_account_57 | 7021001070150 | 2025-04-14 | disqualified | 1002 |
| 99701 | Regional Initiative | 727045 | 3001009030270 | 2022-09-25 | active | 1003 |

Teams are first-class entities with a `team_id`, a `team_name` (e.g., `Composite Model` for id `1450649`), a `country_code`, a `captain_id`, a `registration_date`, and a `status` (`active`, `inactive`, or `disqualified`). The column `team_captain_id` is a foreign key into `team_captains`, establishing a one-to-one link between a team and its designated captain record. Team `id_14` (`Legacy Review`) holds the `disqualified` status, while `99701` (`Regional Initiative`) remains `active`.

**Table `team_captains`**

| id | captain_id | full_name | email_address | team_id | notification_preference | represents_team_team_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|
| 1000 | 195352 | Theodore Mcgrath | primary-email-70 | 1450649 | email | 1450649 | 8189491 |
| 1001 | 338514 | Account Name | adaptive-email-71 | 1437598 | mail | 1437598 | 2106706 |
| 1002 | 7021001070150 | Saipan International Airport | distributed-email-72 | id_14 | fax | id_14 | 10449524 |
| 1003 | 3001009030270 | Norma Fisher | baseline-email-73 | 99701 | email | 99701 | 3355777 |

The `team_captains` table materialises the captain role as a distinct entity. Each row has an `id` (e.g., `1000`), a `captain_id` (e.g., `195352`), the captain's `full_name` and `email_address`, the `team_id` they lead, a `notification_preference` (`email`, `mail`, or `fax`), and two foreign keys: `represents_team_team_id` pointing back to the `teams` table and `tournament_director_td_id` pointing to the overseeing director. Captain `1002` (`Saipan International Airport`) prefers `fax` notifications and represents team `id_14` under director `10449524`.

**Table `move_cards`**

| move_card_id | card_id | move_number | player_id | move_notation | time_used | postmark_date | transmission_timestamp | is_ambiguous | status | tournament_game_id | submitted_by_player_id | received_by_player_id | tournament_director_td_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 17788643 | 17 | gd_fp_eu_acc2 | primary-move-94 | 7.45 | 2024-03-07 | 2025-12-08T23:57:00 | true | pending | 1000 | gd_fp_eu_acc2 | gd_fp_eu_acc2 | 8189491 | 2025-01-01 00:14:00 |
| 2 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 25 | 605941 | adaptive-move-95 | 10.90 | 2025-08-18 | 2022-05-19T06:14:00 | false | clarified | 1001 | 605941 | 605941 | 2106706 | 2025-02-06 03:14:00 |
| 3 | 1336192 | 33 | 195362 | distributed-move-96 | 14.35 | 2022-01-02 | 2023-10-03T13:31:00 | true | accepted | 1002 | 195362 | 195362 | 10449524 | 2025-03-11 06:14:00 |
| 4 | 5917278 | 41 | id_26 | baseline-move-97 | 17.80 | 2023-06-13 | 2024-03-14T20:48:00 | false | rejected | 1003 | id_26 | id_26 | 3355777 | 2025-04-16 09:14:00 |

Move cards record individual chess moves submitted during a game. Each row carries a `move_card_id`, a `card_id`, a `move_number` (e.g., `17` for the first row), the `player_id` who made the move, a `move_notation` (e.g., `primary-move-94`), the `time_used` (e.g., `7.45`), a `postmark_date`, a `transmission_timestamp`, a boolean `is_ambiguous`, a `status` (`pending`, `clarified`, `accepted`, or `rejected`), and foreign keys to `tournament_game_id`, `submitted_by_player_id`, `received_by_player_id`, and `tournament_director_td_id`. Move card `1` (card `17788643`) was move `17` by player `gd_fp_eu_acc2`, was ambiguous (`is_ambiguous = true`), and remains `pending`.

**Table `tournament_directors`**

| td_id | full_name | email_address | jurisdiction | active_games_count | dispute_resolution_log |
|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | primary-email-70 | regional-jurisdic-30 | 69 | seasonal-dispute-41 |
| 2106706 | Account Name | adaptive-email-71 | legacy-jurisdic-31 | 4 | regional-dispute-42 |
| 10449524 | Saipan International Airport | distributed-email-72 | compact-jurisdic-32 | 99 | legacy-dispute-43 |
| 3355777 | Norma Fisher | baseline-email-73 | composite-jurisdic-33 | 4 | compact-dispute-44 |

Tournament directors are the administrative authority for games. The `tournament_directors` table stores `td_id`, `full_name`, `email_address`, a `jurisdiction` string (e.g., `regional-jurisdic-30`), an `active_games_count` (e.g., `69` for director `8189491`), and a `dispute_resolution_log` (e.g., `seasonal-dispute-41`). Director `10449524` (`Saipan International Airport`) oversees `99` active games, the highest count in the dataset.

The domain also employs a rich set of junction tables to model many-to-many relationships that cannot be captured by simple foreign keys. The table `games_players` links tournament games to the players who participated in them, while `games_cards` associates move cards with their parent games. The table `players_games` provides the reverse player-to-game association, and `teams_players` links players to their teams. The table `teams_games` connects teams to the games they entered.

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

Director-centric junction tables extend the same pattern. `directors_games` links tournament directors to the games they oversee, `directors_players` associates directors with players under their jurisdiction, `directors_captains` connects directors to team captains, and `directors_cards` links directors to move cards they have adjudicated.

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

The schema's denormalised views each answer a specific analytical question by joining the normalised tables. The view `vw_tournament_game_player_detail` reconstructs a game's full player context by joining `tournament_games` with `players` on the player's team or direct association, yielding a row that tells us which player competed in which game and under what conditions. Reading the row for game `1000` and player `gd_fp_eu_acc2`, we see Theodore Mcgrath's email `primary-email-70` and country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` alongside the game's `legacy-time-13` control and `mail` transmission mode.

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

The view `vw_tournament_game_tournament_director` joins `tournament_games` with `tournament_directors` to answer which director oversaw which game. For game `1000`, the join reveals director `8189491` (Theodore Mcgrath) with jurisdiction `regional-jurisdic-30` and `69` active games, confirming that the director's administrative scope encompasses this particular match.

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

The view `vw_tournament_game_team` joins `tournament_games` with `teams` to surface the team associated with each game. Game `1000` is linked to team `1450649` (`Composite Model`), which is `active` and registered on `2023-06-19`. Game `1002` (`24341655`) is associated with team `id_14` (`Legacy Review`), whose `disqualified` status is immediately visible in the joined result.

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

The view `vw_tournament_game_move_card_detail` joins `tournament_games` with `move_cards` to present each move card alongside its parent game's metadata. Move card `1` (card `17788643`, move `17`, notation `primary-move-94`, time `7.45`, status `pending`) appears alongside game `1000`'s `legacy-time-13` control and `mail` transmission, allowing an analyst to assess whether the move's timing or ambiguity relates to the game's operational parameters.

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

The view `vw_player_tournament_game_detail` reverses the perspective, joining `players` with `tournament_games` to answer which games a given player participated in. Player `gd_fp_eu_acc2` (Theodore Mcgrath) appears with game `1000` (`8350009`), whose `start_date` is `2022-09-05T20:24:00` and whose `tournament_director_td_id` is `8189491`. This view is useful for player-centric analytics such as tracking a competitor's game history.

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

The view `vw_player_team` joins `players` with `teams` to reveal which team each player belongs to. Player `gd_fp_eu_acc2` is associated with team `1450649` (`Composite Model`), while player `605941` (Account Name) belongs to team `1437598` (`Compact Cluster A`). The join also surfaces the team's `status` and `registration_date`, enabling queries such as "list all players on active teams."

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

The view `vw_player_tournament_director` joins `players` with `tournament_directors` to show which director oversees each player. Player `gd_fp_eu_acc2` is under director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`), while player `id_26` (Norma Fisher) falls under director `3355777` (Norma Fisher, jurisdiction `composite-jurisdic-33`). This view supports jurisdictional reporting and dispute routing.

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

The view `vw_player_team_captain` joins `players` with `team_captains` to surface the captain associated with each player. Player `gd_fp_eu_acc2` is linked to captain `1000` (Theodore Mcgrath, email `primary-email-70`, notification preference `email`), while player `605941` is linked to captain `1001` (Account Name, preference `mail`). The join also reveals the captain's `represents_team_team_id`, confirming that captain `1000` represents team `1450649`.

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

The view `vw_team_team_captain` joins `teams` with `team_captains` to present each team alongside its designated captain. Team `1450649` (`Composite Model`) is paired with captain `1000` (Theodore Mcgrath, captain_id `195352`, preference `email`), while team `id_14` (`Legacy Review`) is paired with captain `1002` (Saipan International Airport, preference `fax`). This view is essential for identifying the communication channel for each team's leadership.

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

The view `vw_team_player_detail` joins `teams` with `players` to list all players on a given team. Team `1450649` (`Composite Model`) includes player `gd_fp_eu_acc2` (Theodore Mcgrath, email `primary-email-70`, country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`) and player `605941` (Account Name, country code `lu_tax_code_template_m_I_2`). The join surfaces each player's `is_team_captain` flag, `total_time_used`, and `accumulated_time`, enabling roster-level time-budget analysis.

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

The view `vw_team_tournament_game_detail` joins `teams` with `tournament_games` to show which games each team entered. Team `1450649` (`Composite Model`) entered game `1000` (`8350009`), which used `legacy-time-13` control and `mail` transmission. Team `99701` (`Regional Initiative`) entered game `1003` (`3001009030250`), which carries the `disputed` status and was transmitted via `telegram`. This view supports team performance tracking across multiple games.

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

The view `vw_team_captain_team` joins `team_captains` with `teams` to present each captain alongside their team. Captain `1000` (Theodore Mcgrath, captain_id `195352`, preference `email`) represents team `1450649` (`Composite Model`, status `active`, registered `2023-06-19`). Captain `1002` (Saipan International Airport, preference `fax`) represents team `id_14` (`Legacy Review`, status `disqualified`). The join confirms the one-to-one mapping between captain records and teams.

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

The view `vw_team_captain_tournament_director` joins `team_captains` with `tournament_directors` to show which director oversees each captain. Captain `1000` is overseen by director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`, `69` active games), while captain `1002` is overseen by director `10449524` (Saipan International Airport, jurisdiction `compact-jurisdic-32`, `99` active games). This view supports administrative reporting on captain-director relationships.

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

The view `vw_move_card_tournament_game` joins `move_cards` with `tournament_games` to present each move card alongside its parent game. Move card `1` (card `17788643`, move `17`, notation `primary-move-94`, time `7.45`, status `pending`, ambiguous `true`) appears alongside game `1000`'s `legacy-time-13` control, `baseline-notation-79` agreement, and `mail` transmission. Move card `4` (card `5917278`, move `41`, notation `baseline-move-97`, time `17.80`, status `rejected`) is linked to game `1003` (`3001009030250`), which uses `integrated-notation-82` and `telegram` transmission.

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

The view `vw_move_card_player` joins `move_cards` with `players` to show which player submitted each move. Move card `1` was submitted by player `gd_fp_eu_acc2` (Theodore Mcgrath, email `primary-email-70`, country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`), while move card `2` was submitted by player `605941` (Account Name, country code `lu_tax_code_template_m_I_2`). The join surfaces the player's `is_team_captain` flag and time statistics, enabling analysis of captain versus non-captain move patterns.

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

The view `vw_move_card_tournament_director` joins `move_cards` with `tournament_directors` to show which director adjudicated each move. Move card `1` was adjudicated by director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`, `69` active games, dispute log `seasonal-dispute-41`), while move card `3` was adjudicated by director `10449524` (Saipan International Airport, jurisdiction `compact-jurisdic-32`, `99` active games, dispute log `legacy-dispute-43`). This view supports dispute resolution auditing.

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

The view `vw_tournament_director_tournament_game_detail` joins `tournament_directors` with `tournament_games` to present each director alongside the games they oversee. Director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`, `69` active games) oversees game `1000` (`8350009`), which has `start_date` `2022-09-05T20:24:00`, `time_control` `legacy-time-13`, and `status` `active`. Director `10449524` (Saipan International Airport, jurisdiction `compact-jurisdic-32`, `99` active games) oversees game `1002` (`24341655`), which has `status` `forfeited` and `is_team_event = true`. This view is the primary instrument for director workload analysis.

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

The view `vw_tournament_director_player_detail` joins `tournament_directors` with `players` to show which players fall under each director's jurisdiction. Director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`) oversees player `gd_fp_eu_acc2` (Theodore Mcgrath, email `primary-email-70`, country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`, `total_time_used` `19.70`, `accumulated_time` `20.45`). Director `3355777` (Norma Fisher, jurisdiction `composite-jurisdic-33`) oversees player `id_26` (Norma Fisher, email `baseline-email-73`, country code `727045`, `total_time_used` `30.80`, `accumulated_time` `33.80`). This view supports player-level reporting by administrative region.

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

The view `vw_tournament_director_team_captain_detail` joins `tournament_directors` with `team_captains` to present each director alongside the captains they oversee. Director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`, `69` active games, dispute log `seasonal-dispute-41`) oversees captain `1000` (Theodore Mcgrath, captain_id `195352`, email `primary-email-70`, notification preference `email`, representing team `1450649`). Director `10449524` (Saipan International Airport, jurisdiction `compact-jurisdic-32`, `99` active games, dispute log `legacy-dispute-43`) oversees captain `1002` (Saipan International Airport, captain_id `7021001070150`, preference `fax`, representing team `id_14`). This view is essential for administrative capacity planning.

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

The view `vw_tournament_director_move_card_detail` joins `tournament_directors` with `move_cards` to show which moves each director has adjudicated. Director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`, `69` active games) adjudicated move card `1` (card `17788643`, move `17`, notation `primary-move-94`, time `7.45`, status `pending`, ambiguous `true`). Director `2106706` (Account Name, jurisdiction `legacy-jurisdic-31`, `4` active games, dispute log `regional-dispute-42`) adjudicated move card `2` (card `ChIJ20iLSYBt5kcRqH2vq_dd6GU`, move `25`, notation `adaptive-move-95`, time `10.90`, status `clarified`). Director `10449524` (Saipan International Airport, jurisdiction `compact-jurisdic-32`, `99` active games) adjudicated move card `3` (card `1336192`, move `33`, notation `distributed-move-96`, time `14.35`, status `accepted`). Director `3355777` (Norma Fisher, jurisdiction `composite-jurisdic-33`, `4` active games) adjudicated move card `4` (card `5917278`, move `41`, notation `baseline-move-97`, time `17.80`, status `rejected`). This view provides a complete audit trail of director involvement in move adjudication.

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

The schema materialises a chess tournament domain where games, players, teams, captains, move cards, and tournament directors are modelled as distinct entities with well-defined foreign-key relationships. The base tables enforce referential integrity through columns such as `tournament_director_td_id` in `tournament_games` and `team_captain_id` in `teams`, while the junction tables (`games_players`, `games_cards`, `players_games`, `teams_players`, `teams_games`, `directors_games`, `directors_players`, `directors_captains`, `directors_cards`) resolve many-to-many associations that cannot be expressed through simple foreign keys. The twenty-three views each perform a specific join across two or more base tables to reconstruct a domain fact — whether that fact is "which director oversaw which game," "which captain represents which team," or "which move was adjudicated by which director." The concrete values in the data — Theodore Mcgrath's `19.70` time used against a `20.45` budget, the `disqualified` status of team `id_14`, the `pending` status of move card `1`, and the `99` active games overseen by director `10449524` — ground the abstract schema in a realistic operational context. Together, the tables and views form a coherent, normalised relational model that supports both transactional integrity and analytical querying across the full spectrum of chess tournament administration.