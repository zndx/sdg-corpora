## Domain Modelling and Relational Materialisation

The bowling tournament management domain captures the lifecycle of competitive events, from bowler registration through rule enforcement, prize allocation, and dispute resolution. At its core, the model distinguishes six entity types—bowlers, tournaments, tournament rules, disqualification letters, prizes, and appeals—each materialised as a base table with a primary key and a set of attributes. Relationships between these entities are expressed through foreign keys embedded in the tables, and the analytical layer is built from twelve views that join the normalised tables back into domain-level facts. The following sections walk through the base schema, then interpret each view as a reconstruction of a specific business question.

**Table `bowlers`**

| id | book_id | full_name | declared_average | verified_average | residential_address | tournament_id | disqualification_letter_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 3.20 | compact-resident-62 | 100 | 1 | 2025-01-01 00:14:00 |
| 101 | 2986236 | Account Name | 9.90 | 6.40 | composite-resident-63 | 101 | 2 | 2025-02-06 03:14:00 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 9.60 | primary-resident-64 | 102 | 3 | 2025-03-11 06:14:00 |
| 103 | L683 | Norma Fisher | 15.80 | 12.80 | adaptive-resident-65 | 103 | 4 | 2025-04-16 09:14:00 |

The `bowlers` table is the central actor entity. Each row represents a registered competitor identified by a surrogate `id` (e.g. `100` through `103`) and a business-level `book_id` such as `5082964` or the alphanumeric `lu_tax_code_template_m12`. The `full_name` column carries the human-readable identifier—`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`—while `declared_average` and `verified_average` store numeric performance metrics (e.g. `6.95` and `3.20` for the first bowler). The `residential_address` column holds a categorical address tag like `compact-resident-62`. Two foreign keys anchor the bowler to the wider event context: `tournament_id` (e.g. `100`) and `disqualification_letter_id` (e.g. `1`). The `created_at` timestamp records registration time, such as `2025-01-01 00:14:00`.

**Table `tournaments`**

| id | tournament_name | location | manager_name | manager_address | tournament_rule_id | prize_id | bowler_id |
|---|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | extended-manager-57 | 100 | 100 | 100 |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | integrated-manager-58 | 101 | 101 | 101 |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | seasonal-manager-59 | 102 | 102 | 102 |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | regional-manager-60 | 103 | 103 | 103 |

The `tournaments` table describes each competitive event. Its surrogate key `id` (values `100`–`103`) pairs with a human-readable `tournament_name` such as `Legacy Cluster D` or `Regional Review`. The `location` column stores a categorical location tag (`extended-location-99`, `integrated-location-100`), while `manager_name` and `manager_address` identify the event administrator (e.g. `Extended Initiative` at `extended-manager-57`). Three foreign keys link the tournament to its rule set (`tournament_rule_id`), its prize allocation (`prize_id`), and its primary bowler (`bowler_id`), each referencing the corresponding base table's primary key.

**Table `tournament_rules`**

| id | rule_code | rule_description | issuing_body | bowler_id | tournament_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`tournament_rules` formalises the regulatory framework governing each event. The surrogate `id` (e.g. `100`) is paired with a `rule_code` that may be a numeric string (`2839520`), a UUID fragment (`72623baa-9bad-11eb-a8a2-19ed5c03f8d3`), or a short identifier (`romeg_ul`). The `rule_description` provides a human label such as `Integrated Series A` or `Extended Assessment`, and `issuing_body` names the authority (`baseline-issuing-13`, `pilot-issuing-14`). Foreign keys `bowler_id` and `tournament_id` tie the rule to a specific competitor and event, while `created_at` and `updated_at` timestamps track the rule's lifecycle (e.g. created `2025-01-01 00:14:00`, updated `2025-01-02 00:41:00`).

**Table `disqualification_letters`**

| id | issue_date | appeal_deadline_days | appeal_address | appeal_fax | appeal_email | status | bowler_id | tournament_rule_id | tournament_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | baseline-appeal-13 | pilot-appeal-56 | pending_appeal | 100 | 100 | 100 |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | pilot-appeal-14 | extended-appeal-57 | appeal_received | 101 | 101 | 101 |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | extended-appeal-15 | integrated-appeal-58 | appeal_denied | 102 | 102 | 102 |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | integrated-appeal-16 | seasonal-appeal-59 | appeal_granted | 103 | 103 | 103 |

The `disqualification_letters` table records formal notices issued to bowlers. Each row has a small integer `id` (`1`–`4`), an `issue_date` (e.g. `2023-02-01`), and an `appeal_deadline_days` integer (`36`, `40`, `44`, `48`) specifying the window for contesting the decision. Contact information for appeals is stored in `appeal_address`, `appeal_fax`, and `appeal_email` (e.g. `integrated-appeal-70`, `baseline-appeal-13`, `pilot-appeal-56`). The `status` column tracks the current disposition with values `pending_appeal`, `appeal_received`, `appeal_denied`, and `appeal_granted`. Foreign keys `bowler_id`, `tournament_rule_id`, and `tournament_id` connect the letter to the affected competitor, the violated rule, and the hosting event.

**Table `prizes`**

| prize_id | prize_type | prize_value | eligibility_status | bowler_id | tournament_id |
|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | 100 |
| 101 | handicap | 20.40 | disqualified | 101 | 101 |
| 102 | scratch | 22.60 | forfeited | 102 | 102 |
| 103 | handicap | 24.80 | eligible | 103 | 103 |

`prizes` captures the reward structure for each tournament. The surrogate `prize_id` (e.g. `100`) is paired with a `prize_type` of either `scratch` or `handicap`, a numeric `prize_value` (e.g. `18.20`, `20.40`, `22.60`, `24.80`), and an `eligibility_status` of `eligible`, `disqualified`, or `forfeited`. Foreign keys `bowler_id` and `tournament_id` associate each prize with a specific bowler and event.

**Table `appeals`**

| appeal_id | submission_date | postmark_date | is_written | outcome | disqualification_letter_id | bowler_id | tournament_id |
|---|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | upheld | 1 | 100 | 100 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | overturned | 2 | 101 | 101 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | pending | 3 | 102 | 102 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | upheld | 4 | 103 | 103 |

The `appeals` table logs formal disputes against disqualification letters. Each appeal has a surrogate `appeal_id` (`1`–`4`), a `submission_date` in ISO-8601 format (e.g. `2025-04-24T03:57:00`), and a `postmark_date` (e.g. `2024-03-07`). The boolean `is_written` flag indicates whether the appeal was submitted in writing (`true` or `false`), and the `outcome` column records the result: `upheld`, `overturned`, or `pending`. A foreign key `disqualification_letter_id` links the appeal to the letter it contests, while `bowler_id` and `tournament_id` identify the appellant and the relevant event.

### Base-table relationships

The normalised schema enforces referential integrity through six foreign-key columns distributed across the tables. The `bowlers` table references `tournaments` via `tournament_id` and `disqualification_letters` via `disqualification_letter_id`. The `tournaments` table references `tournament_rules` via `tournament_rule_id`, `prizes` via `prize_id`, and `bowlers` via `bowler_id`. The `tournament_rules` table references both `bowlers` and `tournaments`. The `disqualification_letters` table references `bowlers`, `tournament_rules`, and `tournaments`. The `prizes` table references `bowlers` and `tournaments`. Finally, the `appeals` table references `disqualification_letters`, `bowlers`, and `tournaments`. This web of keys ensures that every disqualification, prize, and appeal is traceable to a specific bowler, tournament, and rule.

### Analytical views

The twelve views materialise the normalised data into domain-level facts that answer concrete business questions. Each view joins the relevant base tables and presents the result as a single denormalised row per entity.

**View `v_bowler_tournament`**

```sql
CREATE VIEW v_bowler_tournament AS
SELECT a.id, a.book_id, a.full_name, a.declared_average, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM bowlers a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | book_id | full_name | declared_average | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 100 | Legacy Cluster D | extended-location-99 |
| 101 | 2986236 | Account Name | 9.90 | 101 | Regional Review | integrated-location-100 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | L683 | Norma Fisher | 15.80 | 103 | Integrated Model A | regional-location-102 |

The view `v_bowler_tournament` joins `bowlers` to `tournaments` on `bowler_id` / `tournament_id`, answering the question "which bowler is associated with which tournament?" For the row with `bowler_id` `100` (Theodore Mcgrath), the joined result shows `tournament_id` `100` (Legacy Cluster D), confirming that this bowler is registered for that event. The second row pairs `Account Name` (bowler `101`) with `Regional Review` (tournament `101`).

**View `v_bowler_disqualification_letter`**

```sql
CREATE VIEW v_bowler_disqualification_letter AS
SELECT a.id, a.book_id, a.full_name, a.declared_average, b.id AS letter_id, b.issue_date AS letter_issue_date, b.appeal_deadline_days AS letter_appeal_deadline_days
FROM bowlers a JOIN disqualification_letters b ON a.disqualification_letter_id = b.id;
```

| id | book_id | full_name | declared_average | letter_id | letter_issue_date | letter_appeal_deadline_days |
|---|---|---|---|---|---|---|
| 100 | 5082964 | Theodore Mcgrath | 6.95 | 1 | 2023-02-01 | 36 |
| 101 | 2986236 | Account Name | 9.90 | 2 | 2024-07-12 | 40 |
| 102 | lu_tax_code_template_m12 | Saipan International Airport | 12.85 | 3 | 2025-12-23 | 44 |
| 103 | L683 | Norma Fisher | 15.80 | 4 | 2022-05-07 | 48 |

`v_bowler_disqualification_letter` joins `bowlers` to `disqualification_letters` on `bowler_id`, answering "which disqualification letter was issued to which bowler?" The first row shows Theodore Mcgrath (`bowler_id` `100`) linked to disqualification letter `1` issued on `2023-02-01` with status `pending_appeal`. The second row links `Account Name` to letter `2` issued on `2024-07-12` with status `appeal_received`.

**View `v_tournament_tournament_rule`**

```sql
CREATE VIEW v_tournament_tournament_rule AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.id AS rule_id, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description
FROM tournaments a JOIN tournament_rules b ON a.tournament_rule_id = b.id;
```

| id | tournament_name | location | manager_name | rule_id | rule_rule_code | rule_rule_description |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | 2839520 | Integrated Series A |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | romeg_ul | Pilot Survey |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D |

`v_tournament_tournament_rule` joins `tournaments` to `tournament_rules` on `tournament_rule_id`, answering "which rule governs which tournament?" The first row pairs tournament `100` (Legacy Cluster D) with rule `100` (code `2839520`, description `Integrated Series A`, issued by `baseline-issuing-13`). The second row pairs tournament `101` (Regional Review) with rule `101` (code `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, description `Extended Assessment`).

**View `v_tournament_prize`**

```sql
CREATE VIEW v_tournament_prize AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.prize_id AS prize_prize_id, b.prize_type AS prize_prize_type, b.prize_value AS prize_prize_value
FROM tournaments a JOIN prizes b ON a.prize_id = b.prize_id;
```

| id | tournament_name | location | manager_name | prize_prize_id | prize_prize_type | prize_prize_value |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | scratch | 18.20 |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | handicap | 20.40 |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | scratch | 22.60 |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | handicap | 24.80 |

`v_tournament_prize` joins `tournaments` to `prizes` on `prize_id`, answering "which prize is allocated to which tournament?" The first row shows tournament `100` linked to prize `100` of type `scratch` with value `18.20` and status `eligible`. The second row shows tournament `101` linked to prize `101` of type `handicap` with value `20.40` and status `disqualified`.

**View `v_tournament_bowler`**

```sql
CREATE VIEW v_tournament_bowler AS
SELECT a.id, a.tournament_name, a.location, a.manager_name, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM tournaments a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | tournament_name | location | manager_name | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | Legacy Cluster D | extended-location-99 | Extended Initiative | 100 | 5082964 | Theodore Mcgrath |
| 101 | Regional Review | integrated-location-100 | Pilot Model A | 101 | 2986236 | Account Name |
| 102 | Seasonal Initiative | seasonal-location-101 | Baseline Cluster | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | Integrated Model A | regional-location-102 | Distributed Review | 103 | L683 | Norma Fisher |

`v_tournament_bowler` joins `tournaments` to `bowlers` on `bowler_id`, answering "which bowler is the primary competitor for which tournament?" The first row pairs tournament `100` (Legacy Cluster D) with bowler `100` (Theodore Mcgrath, declared average `6.95`, verified average `3.20`). The second row pairs tournament `101` (Regional Review) with bowler `101` (Account Name, declared average `9.90`, verified average `6.40`).

**View `v_tournament_rule_bowler`**

```sql
CREATE VIEW v_tournament_rule_bowler AS
SELECT a.id, a.rule_code, a.rule_description, a.issuing_body, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM tournament_rules a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | rule_code | rule_description | issuing_body | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | 5082964 | Theodore Mcgrath |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | 2986236 | Account Name |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | L683 | Norma Fisher |

`v_tournament_rule_bowler` joins `tournament_rules` to `bowlers` on `bowler_id`, answering "which bowler is subject to which tournament rule?" The first row shows rule `100` (code `2839520`, description `Integrated Series A`) applied to bowler `100` (Theodore Mcgrath). The second row shows rule `101` (code `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, description `Extended Assessment`) applied to bowler `101` (Account Name).

**View `v_tournament_rule_tournament`**

```sql
CREATE VIEW v_tournament_rule_tournament AS
SELECT a.id, a.rule_code, a.rule_description, a.issuing_body, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM tournament_rules a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | rule_code | rule_description | issuing_body | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | 2839520 | Integrated Series A | baseline-issuing-13 | 100 | Legacy Cluster D | extended-location-99 |
| 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | pilot-issuing-14 | 101 | Regional Review | integrated-location-100 |
| 102 | romeg_ul | Pilot Survey | extended-issuing-15 | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | integrated-issuing-16 | 103 | Integrated Model A | regional-location-102 |

`v_tournament_rule_tournament` joins `tournament_rules` to `tournaments` on `tournament_id`, answering "which tournament is governed by which rule?" The first row pairs rule `100` (code `2839520`, issuing body `baseline-issuing-13`) with tournament `100` (Legacy Cluster D, location `extended-location-99`). The second row pairs rule `101` (code `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, issuing body `pilot-issuing-14`) with tournament `101` (Regional Review, location `integrated-location-100`).

**View `v_disqualification_letter_bowler`**

```sql
CREATE VIEW v_disqualification_letter_bowler AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM disqualification_letters a JOIN bowlers b ON a.bowler_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | 5082964 | Theodore Mcgrath |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | 2986236 | Account Name |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | L683 | Norma Fisher |

`v_disqualification_letter_bowler` joins `disqualification_letters` to `bowlers` on `bowler_id`, answering "which bowler received which disqualification letter?" The first row shows letter `1` (issued `2023-02-01`, appeal deadline `36` days, status `pending_appeal`) sent to bowler `100` (Theodore Mcgrath). The second row shows letter `2` (issued `2024-07-12`, appeal deadline `40` days, status `appeal_received`) sent to bowler `101` (Account Name).

**View `v_disqualification_letter_tournament_rule`**

```sql
CREATE VIEW v_disqualification_letter_tournament_rule AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS rule_id, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description
FROM disqualification_letters a JOIN tournament_rules b ON a.tournament_rule_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | rule_id | rule_rule_code | rule_rule_description |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | 2839520 | Integrated Series A |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | romeg_ul | Pilot Survey |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D |

`v_disqualification_letter_tournament_rule` joins `disqualification_letters` to `tournament_rules` on `tournament_rule_id`, answering "which rule was violated in which disqualification?" The first row links letter `1` (status `pending_appeal`) to rule `100` (code `2839520`, description `Integrated Series A`, issued by `baseline-issuing-13`). The second row links letter `2` (status `appeal_received`) to rule `101` (code `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, description `Extended Assessment`, issued by `pilot-issuing-14`).

**View `v_disqualification_letter_tournament`**

```sql
CREATE VIEW v_disqualification_letter_tournament AS
SELECT a.id, a.issue_date, a.appeal_deadline_days, a.appeal_address, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM disqualification_letters a JOIN tournaments b ON a.tournament_id = b.id;
```

| id | issue_date | appeal_deadline_days | appeal_address | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 1 | 2023-02-01 | 36 | integrated-appeal-70 | 100 | Legacy Cluster D | extended-location-99 |
| 2 | 2024-07-12 | 40 | seasonal-appeal-71 | 101 | Regional Review | integrated-location-100 |
| 3 | 2025-12-23 | 44 | regional-appeal-72 | 102 | Seasonal Initiative | seasonal-location-101 |
| 4 | 2022-05-07 | 48 | legacy-appeal-73 | 103 | Integrated Model A | regional-location-102 |

`v_disqualification_letter_tournament` joins `disqualification_letters` to `tournaments` on `tournament_id`, answering "which tournament did a disqualification letter pertain to?" The first row shows letter `1` (issued `2023-02-01`, status `pending_appeal`) related to tournament `100` (Legacy Cluster D, location `extended-location-99`). The second row shows letter `2` (issued `2024-07-12`, status `appeal_received`) related to tournament `101` (Regional Review, location `integrated-location-100`).

**View `v_prize_bowler`**

```sql
CREATE VIEW v_prize_bowler AS
SELECT a.prize_id, a.prize_type, a.prize_value, a.eligibility_status, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM prizes a JOIN bowlers b ON a.bowler_id = b.id;
```

| prize_id | prize_type | prize_value | eligibility_status | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | 5082964 | Theodore Mcgrath |
| 101 | handicap | 20.40 | disqualified | 101 | 2986236 | Account Name |
| 102 | scratch | 22.60 | forfeited | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 103 | handicap | 24.80 | eligible | 103 | L683 | Norma Fisher |

`v_prize_bowler` joins `prizes` to `bowlers` on `bowler_id`, answering "which bowler is eligible for which prize?" The first row shows prize `100` (type `scratch`, value `18.20`, status `eligible`) allocated to bowler `100` (Theodore Mcgrath). The second row shows prize `101` (type `handicap`, value `20.40`, status `disqualified`) allocated to bowler `101` (Account Name).

**View `v_prize_tournament`**

```sql
CREATE VIEW v_prize_tournament AS
SELECT a.prize_id, a.prize_type, a.prize_value, a.eligibility_status, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM prizes a JOIN tournaments b ON a.tournament_id = b.id;
```

| prize_id | prize_type | prize_value | eligibility_status | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 100 | scratch | 18.20 | eligible | 100 | Legacy Cluster D | extended-location-99 |
| 101 | handicap | 20.40 | disqualified | 101 | Regional Review | integrated-location-100 |
| 102 | scratch | 22.60 | forfeited | 102 | Seasonal Initiative | seasonal-location-101 |
| 103 | handicap | 24.80 | eligible | 103 | Integrated Model A | regional-location-102 |

`v_prize_tournament` joins `prizes` to `tournaments` on `tournament_id`, answering "which tournament offers which prize?" The first row shows tournament `100` (Legacy Cluster D) offering prize `100` (type `scratch`, value `18.20`, status `eligible`). The second row shows tournament `101` (Regional Review) offering prize `101` (type `handicap`, value `20.40`, status `disqualified`).

**View `v_appeal_disqualification_letter`**

```sql
CREATE VIEW v_appeal_disqualification_letter AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS letter_id, b.issue_date AS letter_issue_date, b.appeal_deadline_days AS letter_appeal_deadline_days
FROM appeals a JOIN disqualification_letters b ON a.disqualification_letter_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | letter_id | letter_issue_date | letter_appeal_deadline_days |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 1 | 2023-02-01 | 36 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 2 | 2024-07-12 | 40 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 3 | 2025-12-23 | 44 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 4 | 2022-05-07 | 48 |

`v_appeal_disqualification_letter` joins `appeals` to `disqualification_letters` on `disqualification_letter_id`, answering "which appeal contests which disqualification letter?" The first row shows appeal `1` (submitted `2025-04-24T03:57:00`, postmarked `2024-03-07`, not written, outcome `upheld`) contesting letter `1` (issued `2023-02-01`, status `pending_appeal`). The second row shows appeal `2` (submitted `2022-09-08T10:14:00`, postmarked `2025-08-18`, written, outcome `overturned`) contesting letter `2` (issued `2024-07-12`, status `appeal_received`).

**View `v_appeal_bowler`**

```sql
CREATE VIEW v_appeal_bowler AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS bowler_id, b.book_id AS bowler_book_id, b.full_name AS bowler_full_name
FROM appeals a JOIN bowlers b ON a.bowler_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | bowler_id | bowler_book_id | bowler_full_name |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 100 | 5082964 | Theodore Mcgrath |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 101 | 2986236 | Account Name |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 102 | lu_tax_code_template_m12 | Saipan International Airport |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 103 | L683 | Norma Fisher |

`v_appeal_bowler` joins `appeals` to `bowlers` on `bowler_id`, answering "which bowler filed which appeal?" The first row shows bowler `100` (Theodore Mcgrath) filing appeal `1` (submitted `2025-04-24T03:57:00`, outcome `upheld`). The second row shows bowler `101` (Account Name) filing appeal `2` (submitted `2022-09-08T10:14:00`, outcome `overturned`).

**View `v_appeal_tournament`**

```sql
CREATE VIEW v_appeal_tournament AS
SELECT a.appeal_id, a.submission_date, a.postmark_date, a.is_written, b.id AS tournament_id, b.tournament_name AS tournament_tournament_name, b.location AS tournament_location
FROM appeals a JOIN tournaments b ON a.tournament_id = b.id;
```

| appeal_id | submission_date | postmark_date | is_written | tournament_id | tournament_tournament_name | tournament_location |
|---|---|---|---|---|---|---|
| 1 | 2025-04-24T03:57:00 | 2024-03-07 | false | 100 | Legacy Cluster D | extended-location-99 |
| 2 | 2022-09-08T10:14:00 | 2025-08-18 | true | 101 | Regional Review | integrated-location-100 |
| 3 | 2023-02-19T17:31:00 | 2022-01-02 | false | 102 | Seasonal Initiative | seasonal-location-101 |
| 4 | 2024-07-03T00:48:00 | 2023-06-13 | true | 103 | Integrated Model A | regional-location-102 |

`v_appeal_tournament` joins `appeals` to `tournaments` on `tournament_id`, answering "which tournament is associated with which appeal?" The first row shows tournament `100` (Legacy Cluster D) associated with appeal `1` (outcome `upheld`). The second row shows tournament `101` (Regional Review) associated with appeal `2` (outcome `overturned`).

### Synthesis

The bowling tournament domain is modelled as a set of six interrelated entity types, each with a clear primary key and a well-defined attribute set. Foreign keys propagate the tournament context through every entity: a bowler is registered for a tournament, a rule governs a tournament, a disqualification letter cites a rule and targets a bowler, a prize is allocated within a tournament, and an appeal contests a letter. The twelve views reconstruct these relationships into flat, query-ready facts—each view answering a single business question by joining the normalised tables along the foreign-key edges. The result is a schema that is both normalised for integrity and denormalised for readability, allowing analysts to trace any disqualification, prize allocation, or appeal back to its originating bowler, tournament, and rule.