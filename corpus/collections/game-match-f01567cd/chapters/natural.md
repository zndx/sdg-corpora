## Match Operations and Roster Management

The management of competitive match cycles requires coordinated tracking of fixtures, venues, rosters, officiating assignments, and infractions. Every scheduled encounter is anchored to a playing surface, staffed by a designated officiating crew, contested by two competing organizations, and governed by a set of enforcement rules that record penalties as they occur. The records below capture each layer of that ecosystem, from the initial scheduling of a fixture through the granular attribution of player eligibility and penalty enforcement.

**Table `game_matches`**

| match_id | start_date | status | home_team_id | away_team_id | venue_id | officials_count | playing_field_id | officiating_crew_id |
|---|---|---|---|---|---|---|---|---|
| 727038 | 2022-09-05T20:24:00 | scheduled | 69436 | lu_tax_code_template_m16 | 2839523 | 90 | 1 | 1000 |
| 10207150 | 2023-02-16T03:41:00 | in_progress | 4716399 | All | goh | 6 | 2 | 1001 |
| 8881 | 2024-07-27T10:58:00 | completed | 10207158 | 10238269 | 27d06ecf80b34272bb825aa8d4b0983f | 0 | 3 | 1002 |
| 2839507 | 2025-12-11T17:15:00 | postponed | id_19 | akz | L296 | 4 | 4 | 1003 |

A match record establishes the temporal and competitive skeleton of an event. The `match_id` serves as the primary key, while `start_date` anchors the fixture to a specific moment; match 727038 is scheduled for 2022-09-05 at 20:24, whereas match 8881 has already completed its window on 2024-07-27. The `status` column tracks lifecycle progression—scheduled, in_progress, completed, and postponed are all represented. Match 10207150 is currently in_progress, while match 2839507 has been postponed to 2025-12-11. The home and away participants are identified by `home_team_id` and `away_team_id`; in match 8881, team 10207158 faces team 10238269. The `venue_id` and `playing_field_id` columns point to the physical location, with `playing_field_id` values 1 through 4 corresponding to four distinct surfaces. The `officials_count` field records the number of officials assigned to the crew, ranging from 0 in match 8881 to 90 in match 727038.

**Table `playing_fields`**

| id | field_id | length_yards | width_yards | end_zone_depth_yards | has_goal_posts | has_hash_marks | has_no_run_zone | surface_type | match_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9085253 | 0.05000001 | 0.6 | 0.2849275832422 | false | true | true | integrated-surface-10 | 727038 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 0.74 | 0.83 | 1.0 | true | false | false | seasonal-surface-11 | 10207150 |
| 3 | 1996924 | 98.74285714285716 | 0.4 | 1.72 | false | true | true | regional-surface-12 | 8881 |
| 4 | 2298 | 36.5 | 1.76 | 1.12 | true | false | false | legacy-surface-13 | 2839507 |

Each playing field record describes the physical dimensions and equipment configuration of the surface where a match takes place. The `id` column is the primary key, and `field_id` provides an external identifier; field 1 carries the external ID 9085253, while field 2 uses a UUID-style identifier `1c87986a-8fcd-11eb-924d-9cd76263cbd0`. Dimensions are captured in `length_yards`, `width_yards`, and `end_zone_depth_yards`. Field 3 is notably elongated at 98.74 yards in length, whereas field 1 measures only 0.05 yards long. Boolean flags indicate equipment: `has_goal_posts` is true for fields 2 and 4, `has_hash_marks` is true for fields 1 and 3, and `has_no_run_zone` is true for fields 1 and 3. The `surface_type` column classifies the playing surface, with values such as `integrated-surface-10`, `seasonal-surface-11`, `regional-surface-12`, and `legacy-surface-13`. The `match_id` links each field to its assigned fixture.

**Table `teams`**

| team_id | team_name | affiliation_id | max_squad_size | min_squad_size | gender | age_group | match_id |
|---|---|---|---|---|---|---|---|
| 1000 | Composite Model | 8387529 | 16 | 13 | compact-gender-62 | integrated-age-22 | 727038 |
| 1001 | Compact Cluster A | ChIJn_8lvThu5kcRO4vrYN64KHE | 24 | 19 | composite-gender-63 | seasonal-age-23 | 10207150 |
| 1002 | Legacy Review | 209212 | 32 | 25 | primary-gender-64 | regional-age-24 | 8881 |
| 1003 | Regional Initiative | Karyawan | 40 | 31 | adaptive-gender-65 | legacy-age-25 | 2839507 |

The teams table catalogs the competing organizations. Each row carries a `team_id`, a `team_name`, and an `affiliation_id` that references an external organizational registry. Team 1000 is named "Composite Model" with affiliation 8387529, while team 1001, "Compact Cluster A," references affiliation `ChIJn_8lvThu5kcRO4vrYN64KHE`. Squad constraints are defined by `max_squad_size` and `min_squad_size`; team 1003 allows up to 40 players with a minimum of 31, whereas team 1000 requires between 13 and 16. The `gender` and `age_group` columns encode demographic classifications, with values like `compact-gender-62` and `integrated-age-22` for team 1000. The `match_id` associates each team entry with a specific fixture.

**Table `players`**

| id | player_id | first_name | last_name | jersey_number | position | is_eligible_to_blitz | stance_type | team_id | match_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | gd_fp_eu_acc2 | Stephanie Collins | Paul Allen | 22 | compact-position-20 | false | three-point | 1000 | 727038 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 605941 | Janice Johnston | Heather Beasley | 30 | composite-position-21 | true | four-point | 1001 | 10207150 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 195362 | Upal Saha | Audrey Taylor | 38 | primary-position-22 | false | standing | 1002 | 8881 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | id_26 | Katherine Snyder | Susan Wagner | 46 | adaptive-position-23 | true | backfield | 1003 | 2839507 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Player records link individual athletes to their teams and matches. The `id` is the primary key, and `player_id` is an external identifier; player 1 carries the external ID `gd_fp_eu_acc2`. Personal names are stored in `first_name` and `last_name`—for example, player 1 is Stephanie Collins, and player 4 is Katherine Snyder. The `jersey_number` assigns a numeric identifier, ranging from 22 (player 1) to 46 (player 4). The `position` column encodes the player's role, with values such as `compact-position-20` and `adaptive-position-23`. The boolean `is_eligible_to_blitz` indicates blitz eligibility; players 2 and 4 are eligible, while players 1 and 3 are not. The `stance_type` records the player's stance—three-point, four-point, standing, or backfield. The `team_id` links the player to their organization, and `match_id` ties them to a specific fixture. Timestamps `created_at` and `updated_at` track record lifecycle.

**Table `officiating_crews`**

| id | crew_id | mechanics_manual_version | officials_count | supervision_status | match_id |
|---|---|---|---|---|---|
| 1000 | state_et_7 | regional-mechanic-60 | 90 | active | 727038 |
| 1001 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | legacy-mechanic-61 | 6 | inactive | 10207150 |
| 1002 | 4180964 | compact-mechanic-62 | 0 | active | 8881 |
| 1003 | Cash | composite-mechanic-63 | 4 | inactive | 2839507 |

Officiating crews define the match officials assigned to each fixture. The `id` column is the primary key, and `crew_id` is an external identifier; crew 1000 uses `state_et_7`, while crew 1003 uses the identifier `Cash`. The `mechanics_manual_version` specifies the rule mechanics edition, with values like `regional-mechanic-60` and `composite-mechanic-63`. The `officials_count` records how many officials are on the crew, matching the value in the corresponding match record. The `supervision_status` indicates whether the crew is active or inactive; crews 1000 and 1002 are active, while crews 1001 and 1003 are inactive. The `match_id` links each crew to its assigned fixture.

**Table `penalties`**

| id | penalty_id | rule_article | yardage | penalty_type | enforced_by | match_id | team_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4180959 | integrated-rule-52 | 27 | primary-penalty-46 | legacy-enforced-19 | 727038 | 1000 | 2025-01-01 00:14:00 |
| 1001 | 325460 | seasonal-rule-53 | 30 | adaptive-penalty-47 | compact-enforced-20 | 10207150 | 1001 | 2025-02-06 03:14:00 |
| 1002 | 7119762 | regional-rule-54 | 33 | distributed-penalty-48 | composite-enforced-21 | 8881 | 1002 | 2025-03-11 06:14:00 |
| 1003 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | legacy-rule-55 | 36 | baseline-penalty-49 | primary-enforced-22 | 2839507 | 1003 | 2025-04-16 09:14:00 |

Penalty records document infractions committed during matches. The `id` is the primary key, and `penalty_id` is an external identifier; penalty 1000 carries ID `4180959`, while penalty 1003 uses a UUID `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`. The `rule_article` references the specific rule violated, with values such as `integrated-rule-52` and `legacy-rule-55`. The `yardage` column records the penalty distance in yards, ranging from 27 (penalty 1000) to 36 (penalty 1003). The `penalty_type` classifies the infraction, with values like `primary-penalty-46` and `baseline-penalty-49`. The `enforced_by` column identifies the enforcement category, such as `legacy-enforced-19` and `primary-enforced-22`. The `match_id` and `team_id` columns attribute each penalty to a specific match and the team against which it was assessed. Timestamps `created_at` track when the penalty was recorded.

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

The matches_teams table resolves the many-to-many relationship between matches and teams, recording which organizations participate in which fixtures. Each row pairs a match with one of its competing teams, enabling a single team to appear across multiple matches and a single match to reference both its home and away participants.

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

The teams_players table links individual players to their team memberships within the context of a match. A player may appear in multiple rows if they participate across different matches, and a team may have multiple player entries reflecting its roster for a given fixture.

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

This view joins match records with their assigned playing fields, answering the question of which physical surface hosts each fixture. The joined result reveals that match 727038 is hosted on field 1 (external ID 9085253), an integrated-surface-10 field with hash marks and a no-run zone but no goal posts. Match 10207150 uses field 2, a seasonal-surface-11 with goal posts but no hash marks or no-run zone. The view makes it straightforward to audit venue assignments and surface configurations across the match calendar.

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

This view connects each match to its assigned officiating crew, providing a consolidated record of who is responsible for enforcement. Match 727038 is staffed by crew 1000 (external ID `state_et_7`), which uses the regional-mechanic-60 manual, has 90 officials, and holds active supervision status. Match 10207150 is assigned crew 1001, which uses legacy-mechanic-61, has only 6 officials, and is marked inactive. The view surfaces the operational readiness of each crew at a glance.

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

This view enriches match records with the full details of both competing teams, answering which organizations are contesting each fixture and under what constraints. Match 727038 pits team 1000 (Composite Model, squad size 13–16, compact-gender-62, integrated-age-22) against its opponent. Match 8881 features team 1002 (Legacy Review, squad size 25–32, primary-gender-64, regional-age-24). The view consolidates team demographics and roster limits alongside match metadata for scheduling and compliance reviews.

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

This view reverses the perspective, starting from the playing field and listing all matches scheduled on it. Field 1 (external ID 9085253) hosts match 727038, while field 3 (external ID 1996924) hosts match 8881. The view supports venue utilization analysis, showing which surfaces are assigned to which fixtures and enabling capacity or scheduling conflict detection.

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

This view links each team to every match in which it participates, providing a complete fixture history per organization. Team 1000 (Composite Model) appears in match 727038, team 1001 (Compact Cluster A) in match 10207150, team 1002 (Legacy Review) in match 8881, and team 1003 (Regional Initiative) in match 2839507. The view supports roster planning and competitive load analysis across the season.

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

This view joins player records with their team assignments, answering which athletes are rostered for which organization in a given match. Player 1 (Stephanie Collins, jersey 22, three-point stance, ineligible to blitz) is rostered for team 1000 in match 727038. Player 4 (Katherine Snyder, jersey 46, backfield stance, eligible to blitz) is rostered for team 1003 in match 2839507. The view supports eligibility verification and lineup construction.

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

This view provides a consolidated roster listing, showing each player alongside their team affiliation and match context. Player 2 (Janice Johnston, jersey 30, four-point stance, eligible to blitz) is associated with team 1001 in match 10207150. Player 3 (Upal Saha, jersey 38, standing stance, ineligible to blitz) is with team 1002 in match 8881. The view is useful for administrative roster management and cross-referencing player eligibility against team constraints.

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

This view connects players directly to the matches they participate in, bypassing the team layer to answer which athletes are active in which fixtures. Player 1 participates in match 727038, player 2 in match 10207150, player 3 in match 8881, and player 4 in match 2839507. The view supports attendance tracking, performance logging, and match-day personnel verification.

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

This view pairs officiating crews with their assigned matches, providing a clear assignment matrix for match-day operations. Crew 1000 (state_et_7, 90 officials, active) is assigned to match 727038. Crew 1002 (4180964, 0 officials, active) is assigned to match 8881. Crews 1001 and 1003 are both inactive, which may indicate pending reassignment or staffing gaps. The view supports operational readiness checks and crew scheduling audits.

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

This view links penalty records to their corresponding matches, answering which infractions occurred during each fixture and when. Penalty 1000 (rule integrated-rule-52, 27 yards, primary-penalty-46, enforced by legacy-enforced-19) is associated with match 727038 and was recorded on 2025-01-01. Penalty 1003 (rule legacy-rule-55, 36 yards, baseline-penalty-49, enforced by primary-enforced-22) is tied to match 2839507 and was recorded on 2025-04-16. The view supports match review, rule enforcement analysis, and penalty trend tracking.

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

This view attributes penalties to the teams against which they were assessed, answering which organizations have incurred infractions in each match. Penalty 1000 was assessed against team 1000 in match 727038. Penalty 1001 was assessed against team 1001 in match 10207150. Penalty 1002 was assessed against team 1002 in match 8881. Penalty 1003 was assessed against team 1003 in match 2839507. The view supports team compliance monitoring and disciplinary review.

## Synthesis

The match management ecosystem spans six layers of operational data: fixtures, surfaces, organizations, athletes, officials, and infractions. Each layer is independently tracked yet interlinked through foreign-key relationships that enable multi-dimensional queries. A match record anchors the schedule; a playing field provides the physical context; teams define the competing organizations; players populate those rosters; officiating crews supply enforcement capacity; and penalties record rule violations with team attribution. The views synthesize these layers into operational dashboards—venue assignments, crew readiness, roster compositions, and penalty histories—each answering a distinct management question. Together, the tables and views form a coherent record system for planning, executing, and reviewing competitive match cycles.