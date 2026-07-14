# Semantic Modelling of a Match-Day Sports Domain

This chapter presents a relational schema that models a match-day sports domain. The domain centres on competitive fixtures between organised teams, each played on a designated field under the supervision of an officiating crew, with individual players rostered to teams and infractions (penalties) recorded during play. The schema is normalised into eight base tables and twelve derived views. Every table and view name is quoted in backticks throughout.

## Entity Types and Their Attributes

The domain recognises six core entity types, each materialised as a table.

The `game_matches` table is the central fact table. Its primary key is `match_id`. Each row records a single fixture with the columns `start_date` (a timestamp such as `2022-09-05T20:24:00`), `status` (one of `scheduled`, `in_progress`, `completed`, or `postponed`), `home_team_id` (an integer like `69436` or a string such as `lu_tax_code_template_m16`), `away_team_id` (similarly typed), `venue_id` (a string identifier), `officials_count` (an integer such as `90` or `0`), `playing_field_id` (an integer foreign key into `playing_fields`), and `officiating_crew_id` (an integer foreign key into `officiating_crews`). Representative rows include match `727038` (scheduled, starting `2022-09-05T20:24:00`), match `10207150` (in_progress), match `8881` (completed), and match `2839507` (postponed).

**Table `game_matches`**

| match_id | start_date | status | home_team_id | away_team_id | venue_id | officials_count | playing_field_id | officiating_crew_id |
|---|---|---|---|---|---|---|---|---|
| 727038 | 2022-09-05T20:24:00 | scheduled | 69436 | lu_tax_code_template_m16 | 2839523 | 90 | 1 | 1000 |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 4716399 | All | goh | 6 | 2 | 1001 |
| 8881 | 2024-07-27T10:58:00 | completed | 10207158 | 10238269 | 27d06ecf80b34272bb825aa8d4b0983f | 0 | 3 | 1002 |
| 2839507 | 2025-12-11T17:15:00 | postponed | id_19 | akz | L296 | 4 | 4 | 1003 |

The `playing_fields` table describes the physical pitch or court on which a match takes place. Its primary key is `id`. Columns include `field_id` (a string such as `9085253` or the UUID `1c87986a-8fcd-11eb-924d-9cd76263cbd0`), `length_yards` (a decimal, e.g. `0.05000001` or `98.74285714285716`), `width_yards` (e.g. `0.6` or `1.76`), `end_zone_depth_yards` (e.g. `0.2849275832422`), `has_goal_posts` (a boolean), `has_hash_marks` (a boolean), `has_no_run_zone` (a boolean), `surface_type` (a categorical string such as `integrated-surface-10` or `seasonal-surface-11`), and `match_id` (a foreign key referencing `game_matches.match_id`). Representative rows include field `1` (length `0.05000001`, surface `integrated-surface-10`) and field `3` (length `98.74285714285716`, surface `regional-surface-12`).

**Table `playing_fields`**

| id | field_id | length_yards | width_yards | end_zone_depth_yards | has_goal_posts | has_hash_marks | has_no_run_zone | surface_type | match_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9085253 | 0.05000001 | 0.6 | 0.2849275832422 | false | true | true | integrated-surface-10 | 727038 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 0.74 | 0.83 | 1.0 | true | false | false | seasonal-surface-11 | 10207150 |
| 3 | 1996924 | 98.74285714285716 | 0.4 | 1.72 | false | true | true | regional-surface-12 | 8881 |
| 4 | 2298 | 36.5 | 1.76 | 1.12 | true | false | false | legacy-surface-13 | 2839507 |

The `teams` table stores information about competing organisations. Its primary key is `team_id`. Columns include `team_name` (e.g. `Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`), `affiliation_id` (a string such as `8387529` or the Google Place ID `ChIJn_8lvThu5kcRO4vrYN64KHE`), `max_squad_size` (an integer like `16` or `40`), `min_squad_size` (an integer like `13` or `31`), `gender` (a categorical string such as `compact-gender-62`), `age_group` (a categorical string such as `integrated-age-22`), and `match_id` (a foreign key referencing `game_matches.match_id`). Representative rows include team `1000` ("Composite Model", max squad `16`) and team `1003` ("Regional Initiative", max squad `40`).

**Table `teams`**

| team_id | team_name | affiliation_id | max_squad_size | min_squad_size | gender | age_group | match_id |
|---|---|---|---|---|---|---|---|
| 1000 | Composite Model | 8387529 | 16 | 13 | compact-gender-62 | integrated-age-22 | 727038 |
| 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE | 24 | 19 | composite-gender-63 | seasonal-age-23 | 10207150 |
| 1002 | Legacy Review | 209212 | 32 | 25 | primary-gender-64 | regional-age-24 | 8881 |
| 1003 | Regional Initiative | Karyawan | 40 | 31 | adaptive-gender-65 | legacy-age-25 | 2839507 |

The `players` table captures individual athlete records. Its primary key is `id`. Columns include `player_id` (a string such as `gd_fp_eu_acc2` or `605941`), `first_name` (e.g. `Stephanie Collins`, `Janice Johnston`), `last_name` (e.g. `Paul Allen`, `Heather Beasley`), `jersey_number` (an integer like `22` or `46`), `position` (a categorical string such as `compact-position-20`), `is_eligible_to_blitz` (a boolean), `stance_type` (a string such as `three-point`, `four-point`, `standing`, or `backfield`), `team_id` (a foreign key referencing `teams.team_id`), `match_id` (a foreign key referencing `game_matches.match_id`), `created_at` (a timestamp), and `updated_at` (a timestamp). Representative rows include player `1` (Stephanie Collins, jersey `22`, stance `three-point`) and player `4` (Katherine Snyder, jersey `46`, stance `backfield`).

**Table `players`**

| id | player_id | first_name | last_name | jersey_number | position | is_eligible_to_blitz | stance_type | team_id | match_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | gd_fp_eu_acc2 | Stephanie Collins | Paul Allen | 22 | compact-position-20 | false | three-point | 1000 | 727038 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 605941 | Janice Johnston | Heather Beasley | 30 | composite-position-21 | true | four-point | 1001 | 10207150 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195362 | Upal Saha | Audrey Taylor | 38 | primary-position-22 | false | standing | 1002 | 8881 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | id_26 | Katherine Snyder | Susan Wagner | 46 | adaptive-position-23 | true | backfield | 1003 | 2839507 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `officiating_crews` table describes the match-day officials. Its primary key is `id`. Columns include `crew_id` (a string such as `state_et_7` or `Cash`), `mechanics_manual_version` (a categorical string like `regional-mechanic-60`), `officials_count` (an integer such as `90` or `0`), `supervision_status` (a string such as `active` or `inactive`), and `match_id` (a foreign key referencing `game_matches.match_id`). Representative rows include crew `1000` (status `active`, `90` officials) and crew `1003` (status `inactive`, `4` officials).

**Table `officiating_crews`**

| id | crew_id | mechanics_manual_version | officials_count | supervision_status | match_id |
|---|---|---|---|---|---|
| 1000 | state_et_7 | regional-mechanic-60 | 90 | active | 727038 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | legacy-mechanic-61 | 6 | inactive | 10207150 |
| 1002 | 4180964 | compact-mechanic-62 | 0 | active | 8881 |
| 1003 | Cash | composite-mechanic-63 | 4 | inactive | 2839507 |

The `penalties` table records infractions committed during matches. Its primary key is `id`. Columns include `penalty_id` (a string such as `4180959` or the UUID `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`), `rule_article` (a categorical string like `integrated-rule-52`), `yardage` (an integer such as `27` or `36`), `penalty_type` (a categorical string such as `primary-penalty-46`), `enforced_by` (a categorical string like `legacy-enforced-19`), `match_id` (a foreign key referencing `game_matches.match_id`), `team_id` (a foreign key referencing `teams.team_id`), and `created_at` (a timestamp). Representative rows include penalty `1000` (yardage `27`, rule `integrated-rule-52`) and penalty `1003` (yardage `36`, rule `legacy-rule-55`).

**Table `penalties`**

| id | penalty_id | rule_article | yardage | penalty_type | enforced_by | match_id | team_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4180959 | integrated-rule-52 | 27 | primary-penalty-46 | legacy-enforced-19 | 727038 | 1000 | 2025-01-01 00:14:00 |
| 1001 | 325460 | seasonal-rule-53 | 30 | adaptive-penalty-47 | compact-enforced-20 | 10207150 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 7119762 | regional-rule-54 | 33 | distributed-penalty-48 | composite-enforced-21 | 8881 | 1002 | 2025-03-11 06:14:00 |
| 1003 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | legacy-rule-55 | 36 | baseline-penalty-49 | primary-enforced-22 | 2839507 | 1003 | 2025-04-16 09:14:00 |

## Junction Tables for Many-to-Many Relationships

Two junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys.

The `matches_teams` table links matches to the teams that participate in them. Its composite primary key is `(match_id, team_id)`. Each row pairs a `match_id` (foreign key into `game_matches`) with a `team_id` (foreign key into `teams`). Representative rows show that match `727038` involves teams `1000` and `1001`, match `10207150` involves teams `1001` and `1002`, match `8881` involves teams `1002` and `1003`, and match `2839507` involves teams `1003` and `1000`. This table is the bridge that allows a single match to reference two or more teams without duplicating match data.

**Table `matches_teams`**

| match_id | team_id |
|---|---|
| 727038 | 1000 |
| 727038 | 1001 |
| 10207150 | 1001 |
| 10207150 | 1002 |
| 8881 | 1002 |
| 8881 | 1003 |
| 2839507 | 1003 |
| 2839507 | 1000 |

The `teams_players` table links teams to their rostered players. Its composite primary key is `(team_id, player_id)`. Each row pairs a `team_id` (foreign key into `teams`) with a `player_id` (foreign key into `players.id`). Representative rows show that team `1000` includes players `1` and `2`, team `1001` includes players `2` and `3`, team `1002` includes players `3` and `4`, and team `1003` includes players `4` and `1`. Note that players `1` through `4` each appear on two teams, reflecting a cross-roster or shared-squad arrangement.

**Table `teams_players`**

| team_id | player_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

## Foreign-Key Topology

The normalised schema forms a star-like topology with `game_matches` at the centre. The `playing_fields` table references `game_matches` via `playing_fields.match_id`. The `teams` table references `game_matches` via `teams.match_id`. The `players` table references both `teams` (via `players.team_id`) and `game_matches` (via `players.match_id`). The `officiating_crews` table references `game_matches` via `officiating_crews.match_id`. The `penalties` table references both `game_matches` (via `penalties.match_id`) and `teams` (via `penalties.team_id`). The two junction tables, `matches_teams` and `teams_players`, bridge the many-to-many relationships between matches and teams and between teams and players, respectively.

## Views as Reconstructed Domain Facts

Twelve views materialise common analytical queries by joining the normalised tables back together. Each view answers a specific domain question.

The `game_match_playing_field_view` joins `game_matches` to `playing_fields` on `game_matches.playing_field_id = playing_fields.id`, producing columns `match_id`, `start_date`, `status`, `home_team_id`, `field_id`, `field_field_id`, and `field_length_yards`. It answers "what field was used for each match?" Representative output includes match `727038` on field `1` (length `0.05000001`) and match `8881` on field `3` (length `98.74285714285716`).

**View `game_match_playing_field_view`**

```sql
CREATE VIEW game_match_playing_field_view AS
SELECT a.match_id, a.start_date, a.status, a.home_team_id, b.id AS field_id, b.field_id AS field_field_id, b.length_yards AS field_length_yards
FROM game_matches a JOIN playing_fields b ON a.playing_field_id = b.id;
```

| match_id | start_date | status | home_team_id | field_id | field_field_id | field_length_yards |
|---|---|---|---|---|---|---|
| 727038 | 2022-09-05T20:24:00 | scheduled | 69436 | 1 | 9085253 | 0.05000001 |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 4716399 | 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 0.74 |
| 8881 | 2024-07-27T10:58:00 | completed | 10207158 | 3 | 1996924 | 98.74285714285716 |
| 2839507 | 2025-12-11T17:15:00 | postponed | id_19 | 4 | 2298 | 36.5 |

The `game_match_officiating_crew_view` joins `game_matches` to `officiating_crews` on `game_matches.officiating_crew_id = officiating_crews.id`, producing columns `match_id`, `start_date`, `status`, `home_team_id`, `crew_id`, `crew_crew_id`, and `crew_mechanics_manual_version`. It answers "which officiating crew was assigned to each match?" Representative output includes match `727038` with crew `1000` (mechanics manual `regional-mechanic-60`) and match `2839507` with crew `1003` (mechanics manual `composite-mechanic-63`).

**View `game_match_officiating_crew_view`**

```sql
CREATE VIEW game_match_officiating_crew_view AS
SELECT a.match_id, a.start_date, a.status, a.home_team_id, b.id AS crew_id, b.crew_id AS crew_crew_id, b.mechanics_manual_version AS crew_mechanics_manual_version
FROM game_matches a JOIN officiating_crews b ON a.officiating_crew_id = b.id;
```

| match_id | start_date | status | home_team_id | crew_id | crew_crew_id | crew_mechanics_manual_version |
|---|---|---|---|---|---|---|
| 727038 | 2022-09-05T20:24:00 | scheduled | 69436 | 1000 | state_et_7 | regional-mechanic-60 |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 4716399 | 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | legacy-mechanic-61 |
| 8881 | 2024-07-27T10:58:00 | completed | 10207158 | 1002 | 4180964 | compact-mechanic-62 |
| 2839507 | 2025-12-11T17:15:00 | postponed | id_19 | 1003 | Cash | composite-mechanic-63 |

The `game_match_team_detail_view` joins `game_matches` through `matches_teams` to `teams`, producing columns `match_id`, `start_date`, `status`, `team_team_id`, `team_team_name`, and `team_affiliation_id`. It answers "which teams participated in each match and what are their details?" Because each match involves two teams, this view produces two rows per match. Representative output shows match `727038` with teams `1000` ("Composite Model") and `1001` ("Compact Cluster A").

**View `game_match_team_detail_view`**

```sql
CREATE VIEW game_match_team_detail_view AS
SELECT a.match_id, a.start_date, a.status, b.team_id AS team_team_id, b.team_name AS team_team_name, b.affiliation_id AS team_affiliation_id
FROM game_matches a
  JOIN matches_teams j ON j.match_id = a.match_id
  JOIN teams b ON b.team_id = j.team_id;
```

| match_id | start_date | status | team_team_id | team_team_name | team_affiliation_id |
|---|---|---|---|---|---|
| 727038 | 2022-09-05T20:24:00 | scheduled | 1000 | Composite Model | 8387529 |
| 727038 | 2022-09-05T20:24:00 | scheduled | 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 1002 | Legacy Review | 209212 |
| 8881 | 2024-07-27T10:58:00 | completed | 1002 | Legacy Review | 209212 |
| 8881 | 2024-07-27T10:58:00 | completed | 1003 | Regional Initiative | Karyawan |
| 2839507 | 2025-12-11T17:15:00 | postponed | 1003 | Regional Initiative | Karyawan |
| 2839507 | 2025-12-11T17:15:00 | postponed | 1000 | Composite Model | 8387529 |

The `playing_field_game_match_view` joins `playing_fields` to `game_matches` on `playing_fields.match_id = game_matches.match_id`, producing columns `id`, `field_id`, `length_yards`, `width_yards`, `match_match_id`, `match_start_date`, and `match_status`. It answers "which match was played on each field?" Representative output includes field `1` (length `0.05000001`, width `0.6`) used for match `727038` (status `scheduled`).

**View `playing_field_game_match_view`**

```sql
CREATE VIEW playing_field_game_match_view AS
SELECT a.id, a.field_id, a.length_yards, a.width_yards, b.match_id AS match_match_id, b.start_date AS match_start_date, b.status AS match_status
FROM playing_fields a JOIN game_matches b ON a.match_id = b.match_id;
```

| id | field_id | length_yards | width_yards | match_match_id | match_start_date | match_status |
|---|---|---|---|---|---|---|
| 1 | 9085253 | 0.05000001 | 0.6 | 727038 | 2022-09-05T20:24:00 | scheduled |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 0.74 | 0.83 | 10207150 | 2023-02-16T03:41:00 | in_progress |
| 3 | 1996924 | 98.74285714285716 | 0.4 | 8881 | 2024-07-27T10:58:00 | completed |
| 4 | 2298 | 36.5 | 1.76 | 2839507 | 2025-12-11T17:15:00 | postponed |

The `team_game_match_view` joins `teams` to `game_matches` on `teams.match_id = game_matches.match_id`, producing columns `team_id`, `team_name`, `affiliation_id`, `max_squad_size`, `match_match_id`, `match_start_date`, and `match_status`. It answers "which match did each team play in?" Representative output includes team `1000` ("Composite Model") in match `727038` (status `scheduled`).

**View `team_game_match_view`**

```sql
CREATE VIEW team_game_match_view AS
SELECT a.team_id, a.team_name, a.affiliation_id, a.max_squad_size, b.match_id AS match_match_id, b.start_date AS match_start_date, b.status AS match_status
FROM teams a JOIN game_matches b ON a.match_id = b.match_id;
```

| team_id | team_name | affiliation_id | max_squad_size | match_match_id | match_start_date | match_status |
|---|---|---|---|---|---|---|
| 1000 | Composite Model | 8387529 | 16 | 727038 | 2022-09-05T20:24:00 | scheduled |
| 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE | 24 | 10207150 | 2023-02-16T03:41:00 | in_progress |
| 1002 | Legacy Review | 209212 | 32 | 8881 | 2024-07-27T10:58:00 | completed |
| 1003 | Regional Initiative | Karyawan | 40 | 2839507 | 2025-12-11T17:15:00 | postponed |

The `team_player_detail_view` joins `teams` through `teams_players` to `players`, producing columns `team_id`, `team_name`, `affiliation_id`, `player_id`, `player_player_id`, and `player_first_name`. It answers "which players are rostered to which teams?" Because players can belong to multiple teams, this view produces multiple rows per player. Representative output shows team `1000` ("Composite Model") with players `1` (Stephanie Collins) and `2` (Janice Johnston).

**View `team_player_detail_view`**

```sql
CREATE VIEW team_player_detail_view AS
SELECT a.team_id, a.team_name, a.affiliation_id, b.id AS player_id, b.player_id AS player_player_id, b.first_name AS player_first_name
FROM teams a
  JOIN teams_players j ON j.team_id = a.team_id
  JOIN players b ON b.id = j.player_id;
```

| team_id | team_name | affiliation_id | player_id | player_player_id | player_first_name |
|---|---|---|---|---|---|
| 1000 | Composite Model | 8387529 | 1 | gd_fp_eu_acc2 | Stephanie Collins |
| 1000 | Composite Model | 8387529 | 2 | 605941 | Janice Johnston |
| 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE | 2 | 605941 | Janice Johnston |
| 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE | 3 | 195362 | Upal Saha |
| 1002 | Legacy Review | 209212 | 3 | 195362 | Upal Saha |
| 1002 | Legacy Review | 209212 | 4 | id_26 | Katherine Snyder |
| 1003 | Regional Initiative | Karyawan | 4 | id_26 | Katherine Snyder |
| 1003 | Regional Initiative | Karyawan | 1 | gd_fp_eu_acc2 | Stephanie Collins |

The `player_team_view` joins `players` to `teams` on `players.team_id = teams.team_id`, producing columns `id`, `player_id`, `first_name`, `last_name`, `team_team_id`, `team_team_name`, and `team_affiliation_id`. It answers "which team does each player belong to?" Representative output includes player `1` (Stephanie Collins, last name Paul Allen) on team `1000` ("Composite Model").

**View `player_team_view`**

```sql
CREATE VIEW player_team_view AS
SELECT a.id, a.player_id, a.first_name, a.last_name, b.team_id AS team_team_id, b.team_name AS team_team_name, b.affiliation_id AS team_affiliation_id
FROM players a JOIN teams b ON a.team_id = b.team_id;
```

| id | player_id | first_name | last_name | team_team_id | team_team_name | team_affiliation_id |
|---|---|---|---|---|---|---|
| 1 | gd_fp_eu_acc2 | Stephanie Collins | Paul Allen | 1000 | Composite Model | 8387529 |
| 2 | 605941 | Janice Johnston | Heather Beasley | 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE |
| 3 | 195362 | Upal Saha | Audrey Taylor | 1002 | Legacy Review | 209212 |
| 4 | id_26 | Katherine Snyder | Susan Wagner | 1003 | Regional Initiative | Karyawan |

The `player_game_match_view` joins `players` to `game_matches` on `players.match_id = game_matches.match_id`, producing columns `id`, `player_id`, `first_name`, `last_name`, `match_match_id`, `match_start_date`, and `match_status`. It answers "which match was each player associated with?" Representative output includes player `1` (Stephanie Collins) in match `727038` (status `scheduled`).

**View `player_game_match_view`**

```sql
CREATE VIEW player_game_match_view AS
SELECT a.id, a.player_id, a.first_name, a.last_name, b.match_id AS match_match_id, b.start_date AS match_start_date, b.status AS match_status
FROM players a JOIN game_matches b ON a.match_id = b.match_id;
```

| id | player_id | first_name | last_name | match_match_id | match_start_date | match_status |
|---|---|---|---|---|---|---|
| 1 | gd_fp_eu_acc2 | Stephanie Collins | Paul Allen | 727038 | 2022-09-05T20:24:00 | scheduled |
| 2 | 605941 | Janice Johnston | Heather Beasley | 10207150 | 2023-02-16T03:41:00 | in_progress |
| 3 | 195362 | Upal Saha | Audrey Taylor | 8881 | 2024-07-27T10:58:00 | completed |
| 4 | id_26 | Katherine Snyder | Susan Wagner | 2839507 | 2025-12-11T17:15:00 | postponed |

The `officiating_crew_game_match_view` joins `officiating_crews` to `game_matches` on `officiating_crews.match_id = game_matches.match_id`, producing columns `id`, `crew_id`, `mechanics_manual_version`, `officials_count`, `match_match_id`, `match_start_date`, and `match_status`. It answers "which match was each officiating crew assigned to?" Representative output includes crew `1000` (crew ID `state_et_7`, `90` officials) in match `727038` (status `scheduled`).

**View `officiating_crew_game_match_view`**

```sql
CREATE VIEW officiating_crew_game_match_view AS
SELECT a.id, a.crew_id, a.mechanics_manual_version, a.officials_count, b.match_id AS match_match_id, b.start_date AS match_start_date, b.status AS match_status
FROM officiating_crews a JOIN game_matches b ON a.match_id = b.match_id;
```

| id | crew_id | mechanics_manual_version | officials_count | match_match_id | match_start_date | match_status |
|---|---|---|---|---|---|---|
| 1000 | state_et_7 | regional-mechanic-60 | 90 | 727038 | 2022-09-05T20:24:00 | scheduled |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | legacy-mechanic-61 | 6 | 10207150 | 2023-02-16T03:41:00 | in_progress |
| 1002 | 4180964 | compact-mechanic-62 | 0 | 8881 | 2024-07-27T10:58:00 | completed |
| 1003 | Cash | composite-mechanic-63 | 4 | 2839507 | 2025-12-11T17:15:00 | postponed |

The `penalty_game_match_view` joins `penalties` to `game_matches` on `penalties.match_id = game_matches.match_id`, producing columns `id`, `penalty_id`, `rule_article`, `yardage`, `match_match_id`, `match_start_date`, and `match_status`. It answers "which match did each penalty occur in?" Representative output includes penalty `1000` (yardage `27`, rule `integrated-rule-52`) in match `727038` (status `scheduled`).

**View `penalty_game_match_view`**

```sql
CREATE VIEW penalty_game_match_view AS
SELECT a.id, a.penalty_id, a.rule_article, a.yardage, b.match_id AS match_match_id, b.start_date AS match_start_date, b.status AS match_status
FROM penalties a JOIN game_matches b ON a.match_id = b.match_id;
```

| id | penalty_id | rule_article | yardage | match_match_id | match_start_date | match_status |
|---|---|---|---|---|---|---|
| 1000 | 4180959 | integrated-rule-52 | 27 | 727038 | 2022-09-05T20:24:00 | scheduled |
| 1001 | 325460 | seasonal-rule-53 | 30 | 10207150 | 2023-02-16T03:41:00 | in_progress |
| 1002 | 7119762 | regional-rule-54 | 33 | 8881 | 2024-07-27T10:58:00 | completed |
| 1003 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | legacy-rule-55 | 36 | 2839507 | 2025-12-11T17:15:00 | postponed |

The `penalty_team_view` joins `penalties` to `teams` on `penalties.team_id = teams.team_id`, producing columns `id`, `penalty_id`, `rule_article`, `yardage`, `team_team_id`, `team_team_name`, and `team_affiliation_id`. It answers "which team was penalised?" Representative output includes penalty `1000` (yardage `27`) against team `1000` ("Composite Model").

**View `penalty_team_view`**

```sql
CREATE VIEW penalty_team_view AS
SELECT a.id, a.penalty_id, a.rule_article, a.yardage, b.team_id AS team_team_id, b.team_name AS team_team_name, b.affiliation_id AS team_affiliation_id
FROM penalties a JOIN teams b ON a.team_id = b.team_id;
```

| id | penalty_id | rule_article | yardage | team_team_id | team_team_name | team_affiliation_id |
|---|---|---|---|---|---|---|
| 1000 | 4180959 | integrated-rule-52 | 27 | 1000 | Composite Model | 8387529 |
| 1001 | 325460 | seasonal-rule-53 | 30 | 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE |
| 1002 | 7119762 | regional-rule-54 | 33 | 1002 | Legacy Review | 209212 |
| 1003 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | legacy-rule-55 | 36 | 1003 | Regional Initiative | Karyawan |

## Summary

The schema models a match-day sports domain through eight normalised tables and twelve derived views. The core entity types are `game_matches`, `playing_fields`, `teams`, `players`, `officiating_crews`, and `penalties`, linked by foreign keys and two junction tables (`matches_teams`, `teams_players`). The views reconstruct common domain facts by joining these tables back together, enabling analytical queries without denormalising the base schema. All data is fictional.
