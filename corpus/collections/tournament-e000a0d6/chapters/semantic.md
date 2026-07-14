Chess tournaments form a structured ecosystem of organizations, participants, and competitive events. The domain captures individual and team competitions, each governed by a tournament director, populated by players, and mediated through chess games that record moves, disputes, and outcomes. The relational schema normalizes this domain into base tables that store atomic facts, junction tables that resolve many-to-many associations, and materialized views that reassemble domain facts for reporting. Every identifier, date, and status value traces back to a specific row in a base table, and every view join reconstructs a coherent narrative from those normalized pieces.

## Base Tables and Their Attributes

The `tournaments` table anchors the domain. Each row represents a single competition with a surrogate `id`, a business `tournament_id`, a `start_date` and `end_date`, a `format` (either `individual` or `team`), a `status` (`scheduled`, `active`, `completed`, or `cancelled`), a `time_control` string such as `10/30` or `10/60`, and two foreign keys: `td_id` referencing the assigned `tournament_directors` row, and `captain_id` referencing the `team_captains` row for team-format events. For example, tournament `9568450` (row `id` 1) is an `individual`-format event, `scheduled` with time control `10/30`, overseen by director `8189491` and captain `195352`. Tournament `383` (row `id` 2) is a `team`-format event, `active`, with time control `10/60`, director `2106706`, and captain `338514`.

**Table `tournaments`**

| id | tournament_id | start_date | end_date | format | status | time_control | td_id | captain_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9568450 | 2022-09-05 | 2022-09-01 | individual | scheduled | 10/30 | 8189491 | 195352 |
| 2 | 383 | 2023-02-16 | 2023-02-12 | team | active | 10/60 | 2106706 | 338514 |
| 3 | 10624 | 2024-07-27 | 2024-07-23 | individual | completed | 10/30 | 10449524 | 7021001070150 |
| 4 | 7159 | 2025-12-11 | 2025-12-07 | team | cancelled | 10/60 | 3355777 | 3001009030270 |

The `players` table stores participant records. Its columns include a surrogate `id`, a business `player_id`, `full_name`, `email`, `country`, an integer `rating`, a `status` (`active`, `defaulted`, or `forfeited`), and three foreign keys: `tournament_id` linking to `tournaments`, `game_id` linking to `chess_games`, and `team_id` linking to `teams`. Player `gd_fp_eu_acc2` (row `id` 100) is `active`, rated `24`, associated with tournament `1`, game `8350009`, and team `1450649`. Player `605941` (row `id` 101) is `defaulted`, rated `29`, tied to tournament `2`, game `8843755`, and team `1437598`.

**Table `players`**

| id | player_id | full_name | email | country | rating | status | tournament_id | game_id | team_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | gd_fp_eu_acc2 | Theodore Mcgrath | seasonal-email-11 | compact-country-26 | 24 | active | 1 | 8350009 | 1450649 |
| 101 | 605941 | Account Name | regional-email-12 | composite-country-27 | 29 | defaulted | 2 | 8843755 | 1437598 |
| 102 | 195362 | Saipan International Airport | legacy-email-13 | primary-country-28 | 34 | forfeited | 3 | 24341655 | id_14 |
| 103 | id_26 | Norma Fisher | compact-email-14 | adaptive-country-29 | 39 | active | 4 | 3001009030250 | 99701 |

The `teams` table models organizational units. It carries a `team_id`, a `team_name` (such as `Composite Model` or `Compact Cluster A`), a `country`, a `captain_id` pointing to `team_captains`, a self-referential `has_captain_captain_id` column, and a `tournament_id` foreign key. Team `1450649` is named `Composite Model`, based in `compact-country-26`, captained by `195352`, and linked to tournament `1`. Team `1437598` is `Compact Cluster A`, from `composite-country-27`, captained by `338514`, and linked to tournament `2`.

**Table `teams`**

| team_id | team_name | country | captain_id | has_captain_captain_id | tournament_id |
|---|---|---|---|---|---|
| 1450649 | Composite Model | compact-country-26 | 195352 | 195352 | 1 |
| 1437598 | Compact Cluster A | composite-country-27 | 338514 | 338514 | 2 |
| id_14 | Legacy Review | primary-country-28 | 7021001070150 | 7021001070150 | 3 |
| 99701 | Regional Initiative | adaptive-country-29 | 3001009030270 | 3001009030270 | 4 |

The `team_captains` table holds captain records. Columns are `captain_id`, `full_name`, `email`, `team_id` (a foreign key to `teams`), `leads_team_team_id` (a self-referential link), and `tournament_director_td_id` (a foreign key to `tournament_directors`). Captain `195352` is named `Theodore Mcgrath`, email `seasonal-email-11`, leads team `1450649`, and is assigned director `8189491`. Captain `338514` is `Account Name`, email `regional-email-12`, leads team `1437598`, and is assigned director `2106706`.

**Table `team_captains`**

| captain_id | full_name | email | team_id | leads_team_team_id | tournament_director_td_id |
|---|---|---|---|---|---|
| 195352 | Theodore Mcgrath | seasonal-email-11 | 1450649 | 1450649 | 8189491 |
| 338514 | Account Name | regional-email-12 | 1437598 | 1437598 | 2106706 |
| 7021001070150 | Saipan International Airport | legacy-email-13 | id_14 | id_14 | 10449524 |
| 3001009030270 | Norma Fisher | compact-email-14 | 99701 | 99701 | 3355777 |

The `tournament_directors` table stores the officials who oversee competitions. Its columns are `td_id`, `full_name`, `email`, `jurisdiction` (a string such as `regional-jurisdic-30` or `legacy-jurisdic-31`), and three foreign keys: `tournament_id`, `game_id`, and `dispute_id`. Director `8189491` is `Theodore Mcgrath`, email `seasonal-email-11`, with jurisdiction `regional-jurisdic-30`, linked to tournament `1`, game `8350009`, and dispute `1000`. Director `2106706` is `Account Name`, email `regional-email-12`, jurisdiction `legacy-jurisdic-31`, linked to tournament `2`, game `8843755`, and dispute `1001`.

**Table `tournament_directors`**

| td_id | full_name | email | jurisdiction | tournament_id | game_id | dispute_id |
|---|---|---|---|---|---|---|
| 8189491 | Theodore Mcgrath | seasonal-email-11 | regional-jurisdic-30 | 1 | 8350009 | 1000 |
| 2106706 | Account Name | regional-email-12 | legacy-jurisdic-31 | 2 | 8843755 | 1001 |
| 10449524 | Saipan International Airport | legacy-email-13 | compact-jurisdic-32 | 3 | 24341655 | 1002 |
| 3355777 | Norma Fisher | compact-email-14 | composite-jurisdic-33 | 4 | 3001009030250 | 1003 |

The `chess_games` table records individual matches. Columns include `game_id`, `start_date`, `end_date`, `status` (`active`, `completed`, `forfeited`, or `drawn`), `time_control`, `notation_type` (`algebraic`, `numeric`, or `mixed`), `transmission_method` (`mail`, `email`, or `fax`), an integer `move_count`, and foreign keys: `player_id` (to `players`), `has_player2_player_id` (a self-referential player link), `tournament_id` (to `tournaments`), and `dispute_id` (to `disputes`). Game `8350009` started `2022-09-05T20:24:00`, ended `2022-09-01T08:00:00`, is `active`, uses time control `10/30`, algebraic notation, mail transmission, has `5` moves, involves player `100`, and is linked to tournament `1` and dispute `1000`. Game `8843755` is `completed`, has `18` moves, uses numeric notation and email transmission, involves player `101`, and is linked to tournament `2` and dispute `1001`.

**Table `chess_games`**

| game_id | start_date | end_date | status | time_control | notation_type | transmission_method | move_count | player_id | has_player2_player_id | tournament_id | dispute_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8350009 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 10/30 | algebraic | mail | 5 | 100 | 100 | 1 | 1000 |
| 8843755 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | completed | 10/60 | numeric | email | 18 | 101 | 101 | 2 | 1001 |
| 24341655 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | forfeited | 10/30 | mixed | fax | 41 | 102 | 102 | 3 | 1002 |
| 3001009030250 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | drawn | 10/60 | algebraic | mail | 12 | 103 | 103 | 4 | 1003 |

The `move_cards` table captures individual move records within a chess game. Each row represents a single move played, linked to its parent `chess_games` row via a foreign key, and carrying metadata about the move's timing, notation, and the player who executed it. The table normalizes the move sequence so that a game with `41` moves (such as game `24341655`) produces `41` distinct rows in `move_cards`.

**Table `move_cards`**

| move_card_id | card_id | game_id | player_id | move_notation | time_used | total_time | postmark_date | transmission_date | status | belongs_game_game_id | submitted_by_player_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 17788643 | 8350009 | gd_fp_eu_acc2 | primary-move-94 | 7.45 | 17.45 | 2024-03-07 | 2023-06-14T05:27:00 | received | 8350009 | 100 | 8189491 |
| 101 | ChIJ20iLSYBt5kcRqH2vq_dd6GU | 8843755 | 605941 | adaptive-move-95 | 10.90 | 19.90 | 2025-08-18 | 2024-11-25T12:44:00 | processed | 8843755 | 101 | 2106706 |
| 102 | 1336192 | 24341655 | 195362 | distributed-move-96 | 14.35 | 22.35 | 2022-01-02 | 2025-04-09T19:01:00 | ambiguous | 24341655 | 102 | 10449524 |
| 103 | 5917278 | 3001009030250 | id_26 | baseline-move-97 | 17.80 | 24.80 | 2023-06-13 | 2022-09-20T02:18:00 | received | 3001009030250 | 103 | 3355777 |

The `disputes` table records formal disputes raised during tournaments. Each row carries a `dispute_id`, details about the nature of the dispute, the `tournament_id` it belongs to, the `game_id` it references, and a `status` indicating whether it is open, resolved, or closed. Dispute `1000` is associated with tournament `1` and game `8350009`. Dispute `1001` is associated with tournament `2` and game `8843755`.

**Table `disputes`**

| id | dispute_id | game_id | type | status | resolution | arises_in_game_id | tournament_director_td_id |
|---|---|---|---|---|---|---|---|
| 1000 | 9bb474ba-8fcc-11eb-924d-9cd76263cbd0 | 8350009 | ambiguous_move | open | regional-resoluti-30 | 8350009 | 8189491 |
| 1001 | 121 | 8843755 | time_violation | resolved | legacy-resoluti-31 | 8843755 | 2106706 |
| 1002 | d9d9d79e-8fcc-11eb-924d-9cd76263cbd0 | 24341655 | communication_breakdown | escalated | compact-resoluti-32 | 24341655 | 10449524 |
| 1003 | level-3 | 3001009030250 | forfeiture | open | composite-resoluti-33 | 3001009030250 | 3355777 |

## Junction Tables and Many-to-Many Relationships

The domain contains several many-to-many relationships that require junction tables to normalize. The `tournaments_players` junction table resolves the association between tournaments and players, allowing a player to participate in multiple tournaments and a tournament to host multiple players. Each row contains a `tournament_id` foreign key and a `player_id` foreign key.

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

The `tournaments_games` junction table links tournaments to chess games, enabling a tournament to contain many games and a game to be associated with multiple tournaments (in cross-tournament scenarios). Each row carries a `tournament_id` and a `game_id`.

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

The `teams_players` junction table resolves the team-to-player membership relationship. A player can belong to multiple teams across different tournaments, and a team can have multiple members. Each row contains a `team_id` and a `player_id`.

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

The `games_cards` junction table connects chess games to move cards, providing the bridge between a game and its sequence of moves. Each row carries a `game_id` and a `move_card_id`.

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

The `disputes_players` junction table links disputes to the players involved. A dispute may involve multiple players, and a player may be involved in multiple disputes. Each row contains a `dispute_id` and a `player_id`.

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

## Materialized Views

Materialized views reconstruct domain facts by joining base and junction tables into readable, report-ready result sets. Each view answers a specific analytical question about the tournament ecosystem.

The `tournament_player_detail_view` joins `tournaments` with `players` through `tournaments_players`, producing a row per tournament-player participation. It answers: "Which players participated in which tournaments, and what are their ratings and statuses?" A row might show tournament `9568450` with player `gd_fp_eu_acc2` (Theodore Mcgrath, rating `24`, status `active`).

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

The `tournament_chess_game_detail_view` joins `tournaments` with `chess_games` through `tournaments_games`, answering: "Which chess games belong to which tournaments, and what are their statuses and move counts?" A row might show tournament `9568450` with game `8350009` (status `active`, `5` moves, time control `10/30`).

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

The `tournament_team_captain_view` joins `tournaments` with `team_captains` through `teams` and `tournaments`, answering: "Which team captains are associated with which tournaments, and what are their names and emails?" A row might show tournament `9568450` with captain `195352` (Theodore Mcgrath, email `seasonal-email-11`).

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

The `player_tournament_view` joins `players` with `tournaments` through `tournaments_players`, answering: "Which tournaments has each player participated in, and what are the tournament formats and statuses?" A row might show player `gd_fp_eu_acc2` in tournament `9568450` (format `individual`, status `scheduled`).

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

The `player_chess_game_view` joins `players` with `chess_games` through `chess_games`'s `player_id` foreign key, answering: "Which chess games has each player been involved in, and what are the game details?" A row might show player `gd_fp_eu_acc2` in game `8350009` (status `active`, `5` moves, transmission `mail`).

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

The `player_team_view` joins `players` with `teams` through `teams_players`, answering: "Which teams has each player been a member of, and what are the team names and countries?" A row might show player `gd_fp_eu_acc2` in team `1450649` (Composite Model, country `compact-country-26`).

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

The `team_player_detail_view` joins `teams` with `players` through `teams_players`, answering: "Which players belong to which teams, and what are their ratings and statuses?" A row might show team `1450649` (Composite Model) with player `gd_fp_eu_acc2` (Theodore Mcgrath, rating `24`, status `active`).

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

The `team_team_captain_view` joins `teams` with `team_captains` through the `captain_id` foreign key, answering: "Which captain leads which team, and what are their names and emails?" A row might show team `1450649` (Composite Model) captained by `195352` (Theodore Mcgrath, email `seasonal-email-11`).

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

The `team_tournament_view` joins `teams` with `tournaments` through the `tournament_id` foreign key in `teams`, answering: "Which tournaments is each team associated with, and what are the tournament formats and statuses?" A row might show team `1450649` (Composite Model) in tournament `9568450` (format `individual`, status `scheduled`).

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

The `team_captain_team_view` joins `team_captains` with `teams` through the `team_id` foreign key, answering: "Which team does each captain lead, and what are the team names and countries?" A row might show captain `195352` (Theodore Mcgrath) leading team `1450649` (Composite Model, country `compact-country-26`).

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

The `team_captain_tournament_director_view` joins `team_captains` with `tournament_directors` through the `tournament_director_td_id` foreign key, answering: "Which tournament director oversees which team captain, and what are their jurisdictions?" A row might show captain `195352` (Theodore Mcgrath) overseen by director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`).

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

The `tournament_director_tournament_view` joins `tournament_directors` with `tournaments` through the `td_id` foreign key, answering: "Which tournaments is each director assigned to, and what are the tournament formats and statuses?" A row might show director `8189491` (Theodore Mcgrath) assigned to tournament `9568450` (format `individual`, status `scheduled`).

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

The `tournament_director_chess_game_view` joins `tournament_directors` with `chess_games` through the `game_id` foreign key, answering: "Which chess games is each director overseeing, and what are the game statuses and move counts?" A row might show director `8189491` (Theodore Mcgrath) overseeing game `8350009` (status `active`, `5` moves, time control `10/30`).

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

The `tournament_director_dispute_view` joins `tournament_directors` with `disputes` through the `dispute_id` foreign key, answering: "Which disputes is each director handling, and what are the dispute details?" A row might show director `8189491` (Theodore Mcgrath) handling dispute `1000`.

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

The `chess_game_player_view` joins `chess_games` with `players` through the `player_id` foreign key, answering: "Which players are involved in which chess games, and what are their ratings and statuses?" A row might show game `8350009` (status `active`, `5` moves) involving player `gd_fp_eu_acc2` (Theodore Mcgrath, rating `24`, status `active`).

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

The `chess_game_tournament_view` joins `chess_games` with `tournaments` through the `tournament_id` foreign key, answering: "Which tournaments contain which chess games, and what are the tournament formats and statuses?" A row might show game `8350009` (status `active`, `5` moves) in tournament `9568450` (format `individual`, status `scheduled`).

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

The `chess_game_move_card_detail_view` joins `chess_games` with `move_cards` through `games_cards`, answering: "Which move cards belong to which chess games, and what are the move details?" A row might show game `8350009` (status `active`, `5` moves) with its associated move cards.

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

The `chess_game_dispute_view` joins `chess_games` with `disputes` through the `dispute_id` foreign key, answering: "Which disputes are associated with which chess games, and what are the dispute details?" A row might show game `8350009` (status `active`) associated with dispute `1000`.

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

The `move_card_chess_game_view` joins `move_cards` with `chess_games` through `games_cards`, answering: "Which chess games contain which move cards, and what are the game statuses and move counts?" A row might show move card associated with game `8350009` (status `active`, `5` moves, time control `10/30`).

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

The `move_card_player_view` joins `move_cards` with `players` through `chess_games` and `games_cards`, answering: "Which players made which moves, and what are the player ratings and statuses?" A row might show a move card linked to player `gd_fp_eu_acc2` (Theodore Mcgrath, rating `24`, status `active`).

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

The `move_card_tournament_director_view` joins `move_cards` with `tournament_directors` through `chess_games` and `games_cards`, answering: "Which tournament directors oversee the games containing which move cards, and what are their jurisdictions?" A row might show a move card overseen by director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`).

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

The `dispute_chess_game_view` joins `disputes` with `chess_games` through the `game_id` foreign key in `disputes`, answering: "Which chess games are associated with which disputes, and what are the game statuses and move counts?" A row might show dispute `1000` associated with game `8350009` (status `active`, `5` moves).

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

The `dispute_tournament_director_view` joins `disputes` with `tournament_directors` through the `td_id` foreign key in `disputes`, answering: "Which tournament directors are handling which disputes, and what are their jurisdictions?" A row might show dispute `1000` handled by director `8189491` (Theodore Mcgrath, jurisdiction `regional-jurisdic-30`).

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

The `dispute_player_detail_view` joins `disputes` with `players` through `disputes_players`, answering: "Which players are involved in which disputes, and what are their ratings and statuses?" A row might show dispute `1000` involving player `gd_fp_eu_acc2` (Theodore Mcgrath, rating `24`, status `active`).

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

## Synthesis

The schema models chess tournaments as a network of interrelated entities: tournaments host games and players; teams group players under captains; tournament directors oversee the entire competition; and disputes arise from games and involve players. The base tables store atomic facts with surrogate and business keys, while junction tables resolve the many-to-many associations that the domain naturally produces. The materialized views reassemble these normalized facts into readable, report-ready result sets, each answering a specific analytical question about the tournament ecosystem. Together, the tables and views provide a complete, queryable representation of the domain, from the lowest-level move card to the highest-level tournament overview.