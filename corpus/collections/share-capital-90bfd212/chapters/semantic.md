Corporate governance in a joint-stock company is a web of interlocking obligations: capital structures define who owns what, shareholder registries track those stakes, annual general meetings serve as the forum where decisions are ratified, boards execute strategy, and nomination committees shepherd leadership succession. Dividend and fee resolutions crystallize the financial outcomes of those meetings. The relational model captures this ecosystem by normalising each concept into its own table, linking them through foreign keys and junction tables that encode many-to-many associations, and then reassembling the facts through materialised views. The result is a schema where every join path corresponds to a domain relationship, and every view answers a concrete governance question.

## Core Entity Types and Their Attributes

The foundation of the model consists of seven base tables that represent the primary entity types. The `share_capitals` table stores the capital structure records, each identified by a surrogate `id` (values such as `100`, `101`, `102`, `103`) and enriched with financial attributes: `total_value` (e.g. `9.45`, `12.90`, `16.35`, `19.80`), a `currency_code` drawn from a controlled vocabulary (`gd_fp_eu_acc3`, `managing-resources`, `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, `10445649`), `total_shares_issued` (ranging from `5` to `487`), `voting_rights_per_share` (values like `25`, `33`, `41`, `49`), a `record_date`, and audit timestamps `created_at` and `updated_at`. A `resolution_id` column (e.g. `9085246`, `gd_acc_120000`, `16587506`, `9736899`) links each capital record to its governing resolution.

**Table `share_capitals`**

| id | total_value | currency_code | total_shares_issued | voting_rights_per_share | record_date | resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 487 | 25 | 2023-10-23 | 9085246 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 12.90 | managing-resources | 5 | 33 | 2024-03-07 | gd_acc_120000 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 5 | 41 | 2025-08-18 | 16587506 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 19.80 | 10445649 | 11 | 49 | 2022-01-02 | 9736899 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `shareholders` table records individual and institutional owners. Its primary key is `id` (sequential integers `1` through `4` in the sample), while `shareholder_id` carries a business identifier such as `605948` or the tax-code-style value `lu_tax_code_template_b_VB-EC-15`. The `shareholder_name` column holds names like `Mary Alvarez`, `Kimberly Williams`, `Nicole Hampton`, and `Laurie Wallace`. Ownership is quantified by `share_count` (values `99298`, `16954`, `54`, `1122`) and `ownership_percentage` (`6.95`, `8.90`, `10.85`, `12.80`). The boolean flag `is_foreign_owner` appears in the sample data with values such as `James Sherman`, `Isabel Mack`, `Editorial Status`, and `Brian Hamilton` — reflecting the test dataset's column-swapping — while `registration_date` and the foreign key `share_capital_id` (referencing `share_capitals.id`) anchor each shareholder to a capital record. A second foreign key, `nomination_committee_id`, links the shareholder to a nomination committee.

**Table `shareholders`**

| id | shareholder_id | shareholder_name | share_count | ownership_percentage | is_foreign_owner | registration_date | share_capital_id | nomination_committee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 6.95 | James Sherman | 2023-06-19 | 100 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 8.90 | Isabel Mack | 2024-11-03 | 101 | 2 |
| 3 | 4447026 | Nicole Hampton | 54 | 10.85 | Editorial Status | 2025-04-14 | 102 | 3 |
| 4 | 2933460 | Laurie Wallace | 1122 | 12.80 | Brian Hamilton | 2022-09-25 | 103 | 4 |

Annual general meetings are captured in `annual_general_meetings`, where the primary key `meeting_id` uses a mix of numeric identifiers (`20967529`) and UUID-like strings (`ChIJd13ymnZu5kcRXM7jx5boJBs`, `gd_acc_763000`, `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`). The `meeting_date` column stores ISO timestamps such as `2023-10-23T21:39:00`. The `location` field uses descriptive strings like `extended-location-99` and `integrated-location-100`. Governance metadata includes `total_shares_represented` (values `6`, `15`, `75`, `179`), `attendee_shareholder_count` (`2`, `7`, `8`, `57`), boolean flags `quorum_met` and `minutes_published`, and foreign keys `nomination_committee_id` and `resolution_id`.

**Table `annual_general_meetings`**

| meeting_id | meeting_date | location | total_shares_represented | attendee_shareholder_count | quorum_met | minutes_published | nomination_committee_id | resolution_id |
|---|---|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 2 | false | true | 1 | 9085246 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | 7 | true | false | 2 | gd_acc_120000 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 8 | false | true | 3 | 16587506 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 57 | true | false | 4 | 9736899 |

Board members are modelled in `board_members`, keyed by `id` (`100`–`103`). The `member_id` column carries business identifiers like `10207158` and `25820616`. The `full_name` column stores names such as `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. The `role` column uses coded values (`pilot-role-20`, `extended-role-21`, `integrated-role-22`, `seasonal-role-23`), while `is_employee` in the sample data contains name values (`Jennifer Summers`, `Patricia Pham`, `Theodore Mcgrath`, `Haruki Murakami`). The `appointment_year` column holds integers (`26`, `36`, `46`, `56`), and `fee_amount` stores decimal values (`38.08`, `18.47`, `26.25`). The `currency_code` column mirrors the capital table's controlled vocabulary. Foreign keys `nomination_committee_id` and `fee_resolution_id` link board members to their overseeing committee and fee resolution respectively. Audit columns `created_at` and `updated_at` track modifications.

**Table `board_members`**

| id | member_id | full_name | role | is_employee | appointment_year | fee_amount | currency_code | nomination_committee_id | fee_resolution_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | Jennifer Summers | 26 | 38.08 | gd_fp_eu_acc3 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 10207158 | Account Name | extended-role-21 | Patricia Pham | 36 | 18.47 | managing-resources | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | Theodore Mcgrath | 46 | 38.08 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | Haruki Murakami | 56 | 26.25 | 10445649 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Nomination committees are stored in `nomination_committees`, with `nomination_committee_id` as the primary key (`1`–`4`). The `committee_id` column uses codes like `PHR-98`, `L785`, `7119774`, and `1186094`. The `meeting_date` column stores timestamps matching those in `annual_general_meetings`. Cardinality constraints are captured by `min_members` (`38`, `41`, `44`, `47`) and `max_members` (`16`, `23`, `30`, `37`). The `chairman_name` column holds values such as `Integrated Programme A`, `Extended Standard`, `Pilot Framework`, and `Baseline Protocol D`. A boolean `instructions_adopted` and the foreign key `meeting_id` (referencing `annual_general_meetings.meeting_id`) complete the table.

**Table `nomination_committees`**

| nomination_committee_id | committee_id | meeting_date | min_members | max_members | chairman_name | instructions_adopted | meeting_id |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 38 | 16 | Integrated Programme A | true | 20967529 |
| 2 | L785 | 2024-03-07T04:56:00 | 41 | 23 | Extended Standard | false | ChIJd13ymnZu5kcRXM7jx5boJBs |
| 3 | 7119774 | 2025-08-18T11:13:00 | 44 | 30 | Pilot Framework | true | gd_acc_763000 |
| 4 | 1186094 | 2022-01-02T18:30:00 | 47 | 37 | Baseline Protocol D | false | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 |

Dividend resolutions live in `dividend_resolutions`, keyed by `resolution_id` (values `9085246`, `gd_acc_120000`, `16587506`, `9736899`). The `amount_per_share` column stores values like `1,097`, `5.84`, `12.72`, and `221.03`. The `currency_code` column uses the same controlled vocabulary. The `payment_date` column holds dates such as `2024-03-24` and `2025-08-08`. The `approved_by_meeting` column contains coded approval statuses (`baseline-approved-73`, `pilot-approved-74`, `extended-approved-75`, `integrated-approved-76`). Foreign keys `meeting_id` and `share_capital_id` link each resolution to its ratifying meeting and the capital it concerns.

**Table `dividend_resolutions`**

| resolution_id | amount_per_share | currency_code | payment_date | approved_by_meeting | meeting_id | share_capital_id |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | baseline-approved-73 | 20967529 | 100 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | pilot-approved-74 | ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | extended-approved-75 | gd_acc_763000 | 102 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | integrated-approved-76 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |

Fee resolutions are captured in `fee_resolutions`, which follows a parallel structure to dividend resolutions, linking fee determinations to meetings and board members.

**Table `fee_resolutions`**

| id | resolution_id | role_type | fee_amount | currency_code | payment_frequency | approved_by_meeting | meeting_id |
|---|---|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 38.08 | gd_fp_eu_acc3 | legacy-payment-19 | baseline-approved-73 | 20967529 |
| 101 | gd_acc_120000 | pilot-role-68 | 18.47 | managing-resources | compact-payment-20 | pilot-approved-74 | ChIJd13ymnZu5kcRXM7jx5boJBs |
| 102 | 16587506 | extended-role-69 | 38.08 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | composite-payment-21 | extended-approved-75 | gd_acc_763000 |
| 103 | 9736899 | integrated-role-70 | 26.25 | 10445649 | primary-payment-22 | integrated-approved-76 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 |

## Junction Tables and Many-to-Many Relationships

Several entity pairs require junction tables because the domain permits many-to-many associations. The `capitals_shareholders` junction table resolves the relationship between share capitals and shareholders, allowing a single capital record to be associated with multiple shareholders and vice versa. Its columns include `id`, `share_capital_id`, and `shareholder_id`, forming a composite foreign key that references `share_capitals.id` and `shareholders.id` respectively.

**Table `capitals_shareholders`**

| share_capital_id | shareholder_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `meetings_members` junction table connects annual general meetings to board members. It contains `id`, `meeting_id`, and `member_id` columns, with foreign keys referencing `annual_general_meetings.meeting_id` and `board_members.id`. This table captures which board members attended which meetings.

**Table `meetings_members`**

| meeting_id | board_member_id |
|---|---|
| 20967529 | 100 |
| 20967529 | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 102 |
| gd_acc_763000 | 102 |
| gd_acc_763000 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 100 |

The `meetings_resolutions` junction table links meetings to resolutions (both dividend and fee). Its columns `id`, `meeting_id`, and `resolution_id` form foreign key references to `annual_general_meetings.meeting_id` and the respective resolution tables. This allows a single meeting to ratify multiple resolutions and a resolution to be referenced across meetings.

**Table `meetings_resolutions`**

| meeting_id | fee_resolution_id |
|---|---|
| 20967529 | 100 |
| 20967529 | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 101 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 102 |
| gd_acc_763000 | 102 |
| gd_acc_763000 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 103 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 100 |

The `committees_members` junction table associates nomination committees with board members. It contains `id`, `nomination_committee_id`, and `member_id` columns, with foreign keys pointing to `nomination_committees.nomination_committee_id` and `board_members.id`. This encodes which board members are under the purview of which nomination committee.

**Table `committees_members`**

| nomination_committee_id | board_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `resolutions_members` junction table links resolutions to board members, capturing which members are subject to or involved in particular fee or dividend resolutions. Its columns `id`, `resolution_id`, and `member_id` reference `fee_resolutions.resolution_id` (or `dividend_resolutions.resolution_id`) and `board_members.id`.

**Table `resolutions_members`**

| fee_resolution_id | board_member_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

## Materialised Views: Reconstructing Domain Facts

The normalised base tables are reassembled through materialised views that answer specific governance questions. Each view performs a controlled set of joins that reconstruct a domain fact from the distributed tables.

The view `v_share_capital_shareholder_detail` joins `share_capitals` with `shareholders` on `share_capital_id`, producing a denormalised record that pairs each capital's financial attributes with its shareholder's ownership details. For example, a row from this view would show capital `100` (total value `9.45`, currency `gd_fp_eu_acc3`, `487` shares issued) alongside shareholder `Mary Alvarez` (share count `99298`, ownership percentage `6.95`). This view answers the question: "What is the ownership composition of each share capital?"

**View `v_share_capital_shareholder_detail`**

```sql
CREATE VIEW v_share_capital_shareholder_detail AS
SELECT a.id, a.total_value, a.currency_code, b.id AS shareholder_id, b.shareholder_id AS shareholder_shareholder_id, b.shareholder_name AS shareholder_shareholder_name
FROM share_capitals a
  JOIN capitals_shareholders j ON j.share_capital_id = a.id
  JOIN shareholders b ON b.id = j.shareholder_id;
```

| id | total_value | currency_code | shareholder_id | shareholder_shareholder_id | shareholder_shareholder_name |
|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 1 | 605948 | Mary Alvarez |
| 100 | 9.45 | gd_fp_eu_acc3 | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams |
| 101 | 12.90 | managing-resources | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams |
| 101 | 12.90 | managing-resources | 3 | 4447026 | Nicole Hampton |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | 4447026 | Nicole Hampton |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 4 | 2933460 | Laurie Wallace |
| 103 | 19.80 | 10445649 | 4 | 2933460 | Laurie Wallace |
| 103 | 19.80 | 10445649 | 1 | 605948 | Mary Alvarez |

The view `v_share_capital_dividend_resolution` joins `share_capitals` with `dividend_resolutions` on `share_capital_id`, pairing capital records with their associated dividend resolutions. A representative row would show capital `100` alongside resolution `9085246` (amount per share `1,097`, payment date `2024-03-24`, approved by `baseline-approved-73`). This view answers: "Which dividend resolution applies to each share capital?"

**View `v_share_capital_dividend_resolution`**

```sql
CREATE VIEW v_share_capital_dividend_resolution AS
SELECT a.id, a.total_value, a.currency_code, a.total_shares_issued, b.resolution_id AS resolution_resolution_id, b.amount_per_share AS resolution_amount_per_share, b.currency_code AS resolution_currency_code
FROM share_capitals a JOIN dividend_resolutions b ON a.resolution_id = b.resolution_id;
```

| id | total_value | currency_code | total_shares_issued | resolution_resolution_id | resolution_amount_per_share | resolution_currency_code |
|---|---|---|---|---|---|---|
| 100 | 9.45 | gd_fp_eu_acc3 | 487 | 9085246 | 1,097 | gd_fp_eu_acc3 |
| 101 | 12.90 | managing-resources | 5 | gd_acc_120000 | 5.84 | managing-resources |
| 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 5 | 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 103 | 19.80 | 10445649 | 11 | 9736899 | 221.03 | 10445649 |

The view `v_shareholder_share_capital` performs the inverse of the shareholder-detail view, presenting each shareholder alongside their associated share capital. A row would show shareholder `Kimberly Williams` (share count `16954`, ownership `8.90%`) linked to capital `101` (total value `12.90`, currency `managing-resources`, `5` shares issued). This view answers: "Which share capital does each shareholder hold?"

**View `v_shareholder_share_capital`**

```sql
CREATE VIEW v_shareholder_share_capital AS
SELECT a.id, a.shareholder_id, a.shareholder_name, a.share_count, b.id AS capital_id, b.total_value AS capital_total_value, b.currency_code AS capital_currency_code
FROM shareholders a JOIN share_capitals b ON a.share_capital_id = b.id;
```

| id | shareholder_id | shareholder_name | share_count | capital_id | capital_total_value | capital_currency_code |
|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 100 | 9.45 | gd_fp_eu_acc3 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 101 | 12.90 | managing-resources |
| 3 | 4447026 | Nicole Hampton | 54 | 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 4 | 2933460 | Laurie Wallace | 1122 | 103 | 19.80 | 10445649 |

The view `v_shareholder_nomination_committee` joins `shareholders` with `nomination_committees` on `nomination_committee_id`, revealing which nomination committee oversees each shareholder. A sample row would show shareholder `Nicole Hampton` (registration date `2025-04-14`) linked to committee `7119774` (chairman `Pilot Framework`, min members `44`, max members `30`). This view answers: "Which nomination committee is associated with each shareholder?"

**View `v_shareholder_nomination_committee`**

```sql
CREATE VIEW v_shareholder_nomination_committee AS
SELECT a.id, a.shareholder_id, a.shareholder_name, a.share_count, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM shareholders a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| id | shareholder_id | shareholder_name | share_count | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 1 | 605948 | Mary Alvarez | 99298 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Williams | 16954 | 2 | L785 | 2024-03-07T04:56:00 |
| 3 | 4447026 | Nicole Hampton | 54 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 4 | 2933460 | Laurie Wallace | 1122 | 4 | 1186094 | 2022-01-02T18:30:00 |

The view `v_annual_general_meeting_board_member_detail` joins `annual_general_meetings` with `board_members` through the `meetings_members` junction table, reconstructing the attendance record of board members at each meeting. A representative row would show meeting `20967529` (date `2023-10-23T21:39:00`, location `extended-location-99`, quorum met `false`) alongside board member `Theodore Mcgrath` (role `pilot-role-20`, fee amount `38.08`). This view answers: "Which board members attended each annual general meeting?"

**View `v_annual_general_meeting_board_member_detail`**

```sql
CREATE VIEW v_annual_general_meeting_board_member_detail AS
SELECT a.meeting_id, a.meeting_date, a.location, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM annual_general_meetings a
  JOIN meetings_members j ON j.meeting_id = a.meeting_id
  JOIN board_members b ON b.id = j.board_member_id;
```

| meeting_id | meeting_date | location | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 100 | 10207158 | Theodore Mcgrath |
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 101 | 10207158 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 101 | 10207158 | Account Name |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 102 | 25820616 | Saipan International Airport |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 102 | 25820616 | Saipan International Airport |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 103 | 2002007020250 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 103 | 2002007020250 | Norma Fisher |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 100 | 10207158 | Theodore Mcgrath |

The view `v_annual_general_meeting_nomination_committee` joins `annual_general_meetings` with `nomination_committees` on `nomination_committee_id`, linking each meeting to its overseeing committee. A sample row would show meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` (date `2024-03-07T04:56:00`, location `integrated-location-100`, quorum met `true`) linked to committee `L785` (chairman `Extended Standard`, instructions adopted `false`). This view answers: "Which nomination committee oversaw each annual general meeting?"

**View `v_annual_general_meeting_nomination_committee`**

```sql
CREATE VIEW v_annual_general_meeting_nomination_committee AS
SELECT a.meeting_id, a.meeting_date, a.location, a.total_shares_represented, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM annual_general_meetings a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| meeting_id | meeting_date | location | total_shares_represented | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | 2 | L785 | 2024-03-07T04:56:00 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 4 | 1186094 | 2022-01-02T18:30:00 |

The view `v_annual_general_meeting_dividend_resolution` joins `annual_general_meetings` with `dividend_resolutions` on `meeting_id`, revealing which dividend resolutions were ratified at each meeting. A representative row would show meeting `gd_acc_763000` (date `2025-08-18T11:13:00`, location `seasonal-location-101`, quorum met `false`) alongside resolution `16587506` (amount per share `12.72`, payment date `2022-01-19`, approved by `extended-approved-75`). This view answers: "Which dividend resolutions were approved at each annual general meeting?"

**View `v_annual_general_meeting_dividend_resolution`**

```sql
CREATE VIEW v_annual_general_meeting_dividend_resolution AS
SELECT a.meeting_id, a.meeting_date, a.location, a.total_shares_represented, b.resolution_id AS resolution_resolution_id, b.amount_per_share AS resolution_amount_per_share, b.currency_code AS resolution_currency_code
FROM annual_general_meetings a JOIN dividend_resolutions b ON a.resolution_id = b.resolution_id;
```

| meeting_id | meeting_date | location | total_shares_represented | resolution_resolution_id | resolution_amount_per_share | resolution_currency_code |
|---|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 6 | 9085246 | 1,097 | gd_fp_eu_acc3 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 15 | gd_acc_120000 | 5.84 | managing-resources |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 75 | 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 179 | 9736899 | 221.03 | 10445649 |

The view `v_annual_general_meeting_fee_resolution_detail` joins `annual_general_meetings` with `fee_resolutions` through the `meetings_resolutions` junction table, reconstructing the fee resolution decisions made at each meeting. A sample row would show meeting `922ad118-9bad-11eb-a8a2-19ed5c03f8d3` (date `2022-01-02T18:30:00`, location `regional-location-102`, quorum met `true`) linked to its associated fee resolution. This view answers: "Which fee resolutions were determined at each annual general meeting?"

**View `v_annual_general_meeting_fee_resolution_detail`**

```sql
CREATE VIEW v_annual_general_meeting_fee_resolution_detail AS
SELECT a.meeting_id, a.meeting_date, a.location, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.role_type AS resolution_role_type
FROM annual_general_meetings a
  JOIN meetings_resolutions j ON j.meeting_id = a.meeting_id
  JOIN fee_resolutions b ON b.id = j.fee_resolution_id;
```

| meeting_id | meeting_date | location | resolution_id | resolution_resolution_id | resolution_role_type |
|---|---|---|---|---|---|
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 100 | 9085246 | baseline-role-67 |
| 20967529 | 2023-10-23T21:39:00 | extended-location-99 | 101 | gd_acc_120000 | pilot-role-68 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 101 | gd_acc_120000 | pilot-role-68 |
| ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 | 102 | 16587506 | extended-role-69 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 102 | 16587506 | extended-role-69 |
| gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 | 103 | 9736899 | integrated-role-70 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 103 | 9736899 | integrated-role-70 |
| 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 | 100 | 9085246 | baseline-role-67 |

The view `v_board_member_nomination_committee` joins `board_members` with `nomination_committees` on `nomination_committee_id`, revealing which nomination committee oversees each board member. A representative row would show board member `Theodore Mcgrath` (member ID `10207158`, role `pilot-role-20`, appointment year `26`, fee amount `38.08`) linked to committee `PHR-98` (chairman `Integrated Programme A`, min members `38`, max members `16`). This view answers: "Which nomination committee is responsible for each board member?"

**View `v_board_member_nomination_committee`**

```sql
CREATE VIEW v_board_member_nomination_committee AS
SELECT a.id, a.member_id, a.full_name, a.role, b.nomination_committee_id AS committee_nomination_committee_id, b.committee_id AS committee_committee_id, b.meeting_date AS committee_meeting_date
FROM board_members a JOIN nomination_committees b ON a.nomination_committee_id = b.nomination_committee_id;
```

| id | member_id | full_name | role | committee_nomination_committee_id | committee_committee_id | committee_meeting_date |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | 1 | PHR-98 | 2023-10-23T21:39:00 |
| 101 | 10207158 | Account Name | extended-role-21 | 2 | L785 | 2024-03-07T04:56:00 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | 3 | 7119774 | 2025-08-18T11:13:00 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | 4 | 1186094 | 2022-01-02T18:30:00 |

The view `v_board_member_fee_resolution` joins `board_members` with `fee_resolutions` on `fee_resolution_id`, linking each board member to their applicable fee resolution. A sample row would show board member `Norma Fisher` (member ID `2002007020250`, role `seasonal-role-23`, appointment year `56`, fee amount `26.25`) linked to fee resolution `103`. This view answers: "Which fee resolution applies to each board member?"

**View `v_board_member_fee_resolution`**

```sql
CREATE VIEW v_board_member_fee_resolution AS
SELECT a.id, a.member_id, a.full_name, a.role, b.id AS resolution_id, b.resolution_id AS resolution_resolution_id, b.role_type AS resolution_role_type
FROM board_members a JOIN fee_resolutions b ON a.fee_resolution_id = b.id;
```

| id | member_id | full_name | role | resolution_id | resolution_resolution_id | resolution_role_type |
|---|---|---|---|---|---|---|
| 100 | 10207158 | Theodore Mcgrath | pilot-role-20 | 100 | 9085246 | baseline-role-67 |
| 101 | 10207158 | Account Name | extended-role-21 | 101 | gd_acc_120000 | pilot-role-68 |
| 102 | 25820616 | Saipan International Airport | integrated-role-22 | 102 | 16587506 | extended-role-69 |
| 103 | 2002007020250 | Norma Fisher | seasonal-role-23 | 103 | 9736899 | integrated-role-70 |

The view `v_nomination_committee_annual_general_meeting` joins `nomination_committees` with `annual_general_meetings` on `meeting_id`, revealing which meetings each nomination committee oversaw. A representative row would show committee `PHR-98` (chairman `Integrated Programme A`, instructions adopted `true`) linked to meeting `20967529` (date `2023-10-23T21:39:00`, location `extended-location-99`, total shares represented `6`, attendee count `2`). This view answers: "Which annual general meetings did each nomination committee oversee?"

**View `v_nomination_committee_annual_general_meeting`**

```sql
CREATE VIEW v_nomination_committee_annual_general_meeting AS
SELECT a.nomination_committee_id, a.committee_id, a.meeting_date, a.min_members, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM nomination_committees a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| nomination_committee_id | committee_id | meeting_date | min_members | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 38 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| 2 | L785 | 2024-03-07T04:56:00 | 41 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 3 | 7119774 | 2025-08-18T11:13:00 | 44 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 4 | 1186094 | 2022-01-02T18:30:00 | 47 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

The view `v_nomination_committee_board_member_detail` joins `nomination_committees` with `board_members` through the `committees_members` junction table, reconstructing the membership roster of each nomination committee. A sample row would show committee `L785` (chairman `Extended Standard`, min members `41`, max members `23`) linked to board member `Account Name` (member ID `10207158`, role `extended-role-21`, appointment year `36`, fee amount `18.47`). This view answers: "Which board members belong to each nomination committee?"

**View `v_nomination_committee_board_member_detail`**

```sql
CREATE VIEW v_nomination_committee_board_member_detail AS
SELECT a.nomination_committee_id, a.committee_id, a.meeting_date, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM nomination_committees a
  JOIN committees_members j ON j.nomination_committee_id = a.nomination_committee_id
  JOIN board_members b ON b.id = j.board_member_id;
```

| nomination_committee_id | committee_id | meeting_date | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-23T21:39:00 | 100 | 10207158 | Theodore Mcgrath |
| 1 | PHR-98 | 2023-10-23T21:39:00 | 101 | 10207158 | Account Name |
| 2 | L785 | 2024-03-07T04:56:00 | 101 | 10207158 | Account Name |
| 2 | L785 | 2024-03-07T04:56:00 | 102 | 25820616 | Saipan International Airport |
| 3 | 7119774 | 2025-08-18T11:13:00 | 102 | 25820616 | Saipan International Airport |
| 3 | 7119774 | 2025-08-18T11:13:00 | 103 | 2002007020250 | Norma Fisher |
| 4 | 1186094 | 2022-01-02T18:30:00 | 103 | 2002007020250 | Norma Fisher |
| 4 | 1186094 | 2022-01-02T18:30:00 | 100 | 10207158 | Theodore Mcgrath |

The view `v_dividend_resolution_annual_general_meeting` joins `dividend_resolutions` with `annual_general_meetings` on `meeting_id`, presenting each dividend resolution alongside its ratifying meeting. A representative row would show resolution `9085246` (amount per share `1,097`, payment date `2024-03-24`, approved by `baseline-approved-73`) linked to meeting `20967529` (date `2023-10-23T21:39:00`, location `extended-location-99`, quorum met `false`). This view answers: "At which meeting was each dividend resolution approved?"

**View `v_dividend_resolution_annual_general_meeting`**

```sql
CREATE VIEW v_dividend_resolution_annual_general_meeting AS
SELECT a.resolution_id, a.amount_per_share, a.currency_code, a.payment_date, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM dividend_resolutions a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| resolution_id | amount_per_share | currency_code | payment_date | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

The view `v_dividend_resolution_share_capital` joins `dividend_resolutions` with `share_capitals` on `share_capital_id`, pairing each dividend resolution with the capital it concerns. A sample row would show resolution `gd_acc_120000` (amount per share `5.84`, payment date `2025-08-08`, approved by `pilot-approved-74`) linked to capital `101` (total value `12.90`, currency `managing-resources`, `5` shares issued, voting rights `33`). This view answers: "Which share capital does each dividend resolution pertain to?"

**View `v_dividend_resolution_share_capital`**

```sql
CREATE VIEW v_dividend_resolution_share_capital AS
SELECT a.resolution_id, a.amount_per_share, a.currency_code, a.payment_date, b.id AS capital_id, b.total_value AS capital_total_value, b.currency_code AS capital_currency_code
FROM dividend_resolutions a JOIN share_capitals b ON a.share_capital_id = b.id;
```

| resolution_id | amount_per_share | currency_code | payment_date | capital_id | capital_total_value | capital_currency_code |
|---|---|---|---|---|---|---|
| 9085246 | 1,097 | gd_fp_eu_acc3 | 2024-03-24 | 100 | 9.45 | gd_fp_eu_acc3 |
| gd_acc_120000 | 5.84 | managing-resources | 2025-08-08 | 101 | 12.90 | managing-resources |
| 16587506 | 12.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-01-19 | 102 | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 |
| 9736899 | 221.03 | 10445649 | 2023-06-03 | 103 | 19.80 | 10445649 |

The view `v_fee_resolution_annual_general_meeting` joins `fee_resolutions` with `annual_general_meetings` on `meeting_id`, revealing which fee resolutions were determined at each meeting. A representative row would show a fee resolution linked to meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` (date `2024-03-07T04:56:00`, location `integrated-location-100`, quorum met `true`, minutes published `false`). This view answers: "Which fee resolutions were ratified at each annual general meeting?"

**View `v_fee_resolution_annual_general_meeting`**

```sql
CREATE VIEW v_fee_resolution_annual_general_meeting AS
SELECT a.id, a.resolution_id, a.role_type, a.fee_amount, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date, b.location AS meeting_location
FROM fee_resolutions a JOIN annual_general_meetings b ON a.meeting_id = b.meeting_id;
```

| id | resolution_id | role_type | fee_amount | meeting_meeting_id | meeting_meeting_date | meeting_location |
|---|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 38.08 | 20967529 | 2023-10-23T21:39:00 | extended-location-99 |
| 101 | gd_acc_120000 | pilot-role-68 | 18.47 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | integrated-location-100 |
| 102 | 16587506 | extended-role-69 | 38.08 | gd_acc_763000 | 2025-08-18T11:13:00 | seasonal-location-101 |
| 103 | 9736899 | integrated-role-70 | 26.25 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | regional-location-102 |

The view `v_fee_resolution_board_member_detail` joins `fee_resolutions` with `board_members` through the `resolutions_members` junction table, reconstructing which board members are subject to each fee resolution. A sample row would show a fee resolution linked to board member `Saipan International Airport` (member ID `25820616`, role `integrated-role-22`, appointment year `46`, fee amount `38.08`). This view answers: "Which board members are covered by each fee resolution?"

**View `v_fee_resolution_board_member_detail`**

```sql
CREATE VIEW v_fee_resolution_board_member_detail AS
SELECT a.id, a.resolution_id, a.role_type, b.id AS member_id, b.member_id AS member_member_id, b.full_name AS member_full_name
FROM fee_resolutions a
  JOIN resolutions_members j ON j.fee_resolution_id = a.id
  JOIN board_members b ON b.id = j.board_member_id;
```

| id | resolution_id | role_type | member_id | member_member_id | member_full_name |
|---|---|---|---|---|---|
| 100 | 9085246 | baseline-role-67 | 100 | 10207158 | Theodore Mcgrath |
| 100 | 9085246 | baseline-role-67 | 101 | 10207158 | Account Name |
| 101 | gd_acc_120000 | pilot-role-68 | 101 | 10207158 | Account Name |
| 101 | gd_acc_120000 | pilot-role-68 | 102 | 25820616 | Saipan International Airport |
| 102 | 16587506 | extended-role-69 | 102 | 25820616 | Saipan International Airport |
| 102 | 16587506 | extended-role-69 | 103 | 2002007020250 | Norma Fisher |
| 103 | 9736899 | integrated-role-70 | 103 | 2002007020250 | Norma Fisher |
| 103 | 9736899 | integrated-role-70 | 100 | 10207158 | Theodore Mcgrath |

## Synthesis

The relational schema for this corporate governance domain achieves a clean separation of concerns: each entity type occupies its own table with a well-defined primary key, attributes are typed and bounded, and many-to-many relationships are resolved through explicit junction tables. Foreign keys enforce referential integrity across the seven core tables and five junction tables, creating a graph of relationships that mirrors the organisational reality. The materialised views then reassemble these normalised facts into readable, question-oriented projections — each view performing a specific join path that reconstructs a domain fact, from shareholder-capital ownership through meeting attendance to resolution ratification. The result is a schema that is both structurally sound and semantically transparent, where every column, foreign key, and view corresponds directly to a concept in the corporate governance domain.