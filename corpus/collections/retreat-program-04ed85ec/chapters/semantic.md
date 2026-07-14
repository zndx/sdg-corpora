## Ontology-Grounded Relational Modelling in the Spiritual Retreat Domain

The spiritual retreat ecosystem captures a network of organisations, seekers, donation flows, and structured programmes that together form a coherent domain model. At its core, the ontology distinguishes five principal entity types: `spiritual_organizations` that host retreats, `retreat_programs` that schedule and locate those events, `donations` that record financial contributions, `spiritual_seekers` who participate and give, and `spiritual_paths` that encode the philosophical frameworks guiding seekers' journeys. Each entity type materialises as a relational table with a primary key, a set of attribute columns, and foreign-key references that bind the entities into a normalised schema. The views then reassemble these normalised facts through joins, answering domain queries that span multiple entity types.

**Table `retreat_programs`**

| id | program_identifier | program_name | start_date | end_date | location | is_annual | spiritual_organization_id | donation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | false | 1000 | 1000 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | true | 1001 | 1001 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | false | 1002 | 1002 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | true | 1003 | 1003 |

The `retreat_programs` table anchors the programme side of the domain. Its surrogate primary key `id` is an auto-incrementing integer, while the business identifier `program_identifier` carries human-readable codes such as `PRO-2198` and `PRO-2205`. The `program_name` column stores descriptive labels — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — and the temporal bounds of each programme are captured by `start_date` and `end_date`, both stored as ISO-8601 timestamps. The `location` column holds strings like `extended-location-99` and `regional-location-102`, while the boolean `is_annual` flag distinguishes recurring annual events from one-off offerings. Two foreign keys complete the table: `spiritual_organization_id` references the hosting `spiritual_organizations` entity, and `donation_id` links the programme to its associated donation record. Row 1, for instance, shows programme `PRO-2198` (`Extended Review`) running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` at `extended-location-99`, managed by organization `1000` and tied to donation `1000`.

**Table `donations`**

| id | donation_id | amount | currency_code | donation_date | status | is_anonymous | spiritual_seeker_id | spiritual_organization_id | retreat_program_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 2022-01-26T12:36:00 | pending | true | 100 | 1000 | 1 |
| 1001 | 10445623 | 25.47 | managing-resources | 2023-06-10T19:53:00 | received | false | 101 | 1001 | 2 |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-11-21T02:10:00 | allocated | true | 102 | 1002 | 3 |
| 1003 | supp1 | 12.74 | 10445649 | 2025-04-05T09:27:00 | pending | false | 103 | 1003 | 4 |

The `donations` table records the financial transactions that fund retreat activities. Its surrogate key `id` (values `1000` through `1003`) is distinct from the business-level `donation_id` column, which carries identifiers such as `1996936`, `10445623`, `168`, and `supp1`. The `amount` column stores decimal values — `13.49`, `25.47`, `19.72`, `12.74` — and `currency_code` holds strings like `gd_fp_eu_acc3` and `managing-resources`. The `donation_date` column captures the transaction timestamp, while `status` enumerates the lifecycle state (`pending`, `received`, `allocated`). The boolean `is_anonymous` flag indicates whether the donor's identity is concealed. Three foreign keys bind donations to other entities: `spiritual_seeker_id` points to the donor, `spiritual_organization_id` to the recipient organisation, and `retreat_program_id` to the programme being funded. Row 1000 records a `pending` anonymous donation of `13.49` from seeker `100` to organization `1000` for programme `1`.

**Table `spiritual_seekers`**

| spiritual_seeker_id | seeker_id | first_name | last_name | email_address | member_since | is_anonymous | donation_id | retreat_program_id | spiritual_path_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | primary-email-70 | 2022-01-12T00:36:00 | true | 1000 | 1 | 100 |
| 101 | 392498 | Janice Johnston | Heather Beasley | adaptive-email-71 | 2023-06-23T07:53:00 | false | 1001 | 2 | 101 |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | distributed-email-72 | 2024-11-07T14:10:00 | true | 1002 | 3 | 102 |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | baseline-email-73 | 2025-04-18T21:27:00 | false | 1003 | 4 | 103 |

`spiritual_seekers` stores the individuals who engage with the retreat ecosystem. The surrogate primary key `spiritual_seeker_id` (values `100`–`103`) is distinct from the business identifier `seeker_id`, which carries diverse formats: numeric (`8387537`, `392498`), alphanumeric (`IVC20Iind`), and UUID (`c7df85b0-8fcd-11eb-924d-9cd76263cbd0`). The `first_name` and `last_name` columns store names such as `Stephanie Collins` and `Janice Johnston`, while `email_address` holds values like `primary-email-70` and `adaptive-email-71`. The `member_since` timestamp records when the seeker joined, and `is_anonymous` mirrors the anonymity flag from the donations table. Foreign keys `donation_id`, `retreat_program_id`, and `spiritual_path_id` link each seeker to their donation, programme, and philosophical path respectively. Row 100 associates seeker `8387537` (Stephanie Collins) with donation `1000`, programme `1`, and path `100`.

**Table `spiritual_paths`**

| spiritual_path_id | path_id | path_name | core_principle | origin_tradition | is_universal | spiritual_seeker_id | retreat_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | regional-origin-54 | true | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 48753444 | Baseline Programme | compact-core-32 | legacy-origin-55 | false | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | compact-origin-56 | true | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | composite-origin-57 | false | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `spiritual_paths` table encodes the philosophical frameworks that guide seekers. Its surrogate key `spiritual_path_id` (values `100`–`103`) is distinct from the business `path_id`, which carries identifiers such as `b_VB-EC-15`, `48753444`, `a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3`, and `interpersonal`. The `path_name` column stores labels like `Pilot Protocol`, `Baseline Programme`, `Distributed Standard A`, and `Adaptive Framework`. The `core_principle` column holds strings such as `legacy-core-31` and `compact-core-32`, while `origin_tradition` captures the provenance (e.g., `regional-origin-54`, `legacy-origin-55`). The boolean `is_universal` flag indicates whether the path is considered universally applicable. Timestamps `created_at` and `updated_at` track the path's lifecycle. Foreign keys `spiritual_seeker_id` and `retreat_program_id` bind each path to a seeker and a programme. Row 100 describes path `b_VB-EC-15` (`Pilot Protocol`) with principle `legacy-core-31` from tradition `regional-origin-54`, marked as universal, linked to seeker `100` and programme `1`.

**Table `spiritual_organizations`**

| spiritual_organization_id | org_id | org_name | founding_date | mission_statement | is_non_profit | retreat_program_id | donation_id | spiritual_seeker_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | compact-mission-14 | true | 1 | 1000 | 100 |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | composite-mission-15 | false | 2 | 1001 | 101 |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | primary-mission-16 | true | 3 | 1002 | 102 |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | adaptive-mission-17 | false | 4 | 1003 | 103 |

`spiritual_organizations` represents the entities that host and manage retreat programmes. The surrogate primary key `spiritual_organization_id` (values `1000`–`1003`) is distinct from the business `org_id`, which carries values like `790471`, `1717`, `69437`, and `m16`. The `org_name` column stores names that coincide with programme names in this dataset — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — while `founding_date` records the organisation's establishment timestamp. The `mission_statement` column holds strings such as `compact-mission-14` and `composite-mission-15`. The boolean `is_non_profit` flag indicates the organisation's legal status. Foreign keys `retreat_program_id`, `donation_id`, and `spiritual_seeker_id` link each organisation to its programme, donation, and associated seeker. Row 1000 describes organisation `790471` (`Extended Review`), founded on `2023-06-24T05:03:00` with mission `compact-mission-14`, classified as a non-profit, tied to programme `1`, donation `1000`, and seeker `100`.

The foreign-key relationships between these five base tables form a star-like topology centred on the `donations` and `retreat_programs` tables. The `retreat_programs.spiritual_organization_id` → `spiritual_organizations.spiritual_organization_id` link binds each programme to its hosting organisation. The `donations.spiritual_seeker_id` → `spiritual_seekers.spiritual_seeker_id` link connects each donation to its donor. The `donations.spiritual_organization_id` → `spiritual_organizations.spiritual_organization_id` link connects each donation to its recipient. The `donations.retreat_program_id` → `retreat_programs.id` link connects each donation to the programme it funds. The `spiritual_seekers.spiritual_path_id` → `spiritual_paths.spiritual_path_id` link associates each seeker with their philosophical path. The `spiritual_paths.spiritual_seeker_id` → `spiritual_seekers.spiritual_seeker_id` link provides a secondary association from path to seeker. These relationships ensure that every fact in the domain can be reconstructed from the normalised tables through well-defined joins.

**View `v_retreat_program_spiritual_organization`**

```sql
CREATE VIEW v_retreat_program_spiritual_organization AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.spiritual_organization_id AS organization_spiritual_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM retreat_programs a JOIN spiritual_organizations b ON a.spiritual_organization_id = b.spiritual_organization_id;
```

| id | program_identifier | program_name | start_date | organization_spiritual_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1000 | 790471 | Extended Review |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | 1717 | Pilot Initiative A |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 1002 | 69437 | Baseline Model |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | m16 | Distributed Cluster |

The view `v_retreat_program_spiritual_organization` answers the question: *which organisation hosts which retreat programme?* It joins `retreat_programs` to `spiritual_organizations` on `spiritual_organization_id`, projecting the programme's `id`, `program_identifier`, `program_name`, and `start_date` alongside the organisation's `spiritual_organization_id`, `org_id`, and `org_name`. The result is a one-to-one mapping in this dataset. Row 1 shows programme `PRO-2198` (`Extended Review`, starting `2022-09-05T20:24:00`) hosted by organisation `790471` (`Extended Review`). Row 2 maps programme `PRO-2205` (`Pilot Initiative A`, starting `2023-02-16T03:41:00`) to organisation `1717` (`Pilot Initiative A`). The view collapses the two-table relationship into a single flat fact, making it straightforward to report programme–organisation pairings without writing a join.

**View `v_retreat_program_donation`**

```sql
CREATE VIEW v_retreat_program_donation AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM retreat_programs a JOIN donations b ON a.donation_id = b.id;
```

| id | program_identifier | program_name | start_date | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1000 | 1996936 | 13.49 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | 10445623 | 25.47 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 1002 | 168 | 19.72 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | supp1 | 12.74 |

The view `v_retreat_program_donation` reconstructs the fact that *a specific donation funds a specific retreat programme*. By joining `retreat_programs` to `donations` on `retreat_programs.id = donations.retreat_program_id`, the view surfaces the programme's identifier and name alongside the donation's business `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous` flag. Row 1 reveals that programme `PRO-2198` (`Extended Review`) is funded by donation `1996936` of amount `13.49` in currency `gd_fp_eu_acc3`, dated `2022-01-26T12:36:00`, with status `pending` and `is_anonymous` set to true. Row 2 shows programme `PRO-2205` (`Pilot Initiative A`) funded by donation `10445623` of amount `25.47` in currency `managing-resources`, dated `2023-06-10T19:53:00`, with status `received` and `is_anonymous` set to false. This view is the primary mechanism for auditing which donations have been allocated to which programmes.

**View `v_donation_spiritual_seeker`**

```sql
CREATE VIEW v_donation_spiritual_seeker AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM donations a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| id | donation_id | amount | currency_code | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 100 | 8387537 | Stephanie Collins |
| 1001 | 10445623 | 25.47 | managing-resources | 101 | 392498 | Janice Johnston |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 102 | IVC20Iind | Upal Saha |
| 1003 | supp1 | 12.74 | 10445649 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

The view `v_donation_spiritual_seeker` answers: *who is the donor behind each donation?* It joins `donations` to `spiritual_seekers` on `donations.spiritual_seeker_id = spiritual_seekers.spiritual_seeker_id`, projecting the donation's `id`, `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous` alongside the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous`. Row 1 shows donation `1996936` of amount `13.49` from seeker `8387537` (Stephanie Collins, email `primary-email-70`, member since `2022-01-12T00:36:00`), with both the donation and seeker marked as anonymous. Row 2 shows donation `10445623` of amount `25.47` from seeker `392498` (Janice Johnston, email `adaptive-email-71`, member since `2023-06-23T07:53:00`), with both flags set to false. This view is essential for donor reporting and for reconciling the anonymity flags across the two tables.

**View `v_donation_spiritual_organization`**

```sql
CREATE VIEW v_donation_spiritual_organization AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.spiritual_organization_id AS organization_spiritual_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM donations a JOIN spiritual_organizations b ON a.spiritual_organization_id = b.spiritual_organization_id;
```

| id | donation_id | amount | currency_code | organization_spiritual_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 1000 | 790471 | Extended Review |
| 1001 | 10445623 | 25.47 | managing-resources | 1001 | 1717 | Pilot Initiative A |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1002 | 69437 | Baseline Model |
| 1003 | supp1 | 12.74 | 10445649 | 1003 | m16 | Distributed Cluster |

The view `v_donation_spiritual_organization` answers: *which organisation receives each donation?* It joins `donations` to `spiritual_organizations` on `donations.spiritual_organization_id = spiritual_organizations.spiritual_organization_id`, projecting the donation's `id`, `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous` alongside the organisation's `org_id`, `org_name`, `founding_date`, `mission_statement`, and `is_non_profit`. Row 1 shows donation `1996936` of amount `13.49` received by organisation `790471` (`Extended Review`, founded `2023-06-24T05:03:00`, mission `compact-mission-14`, non-profit `true`). Row 2 shows donation `10445623` of amount `25.47` received by organisation `1717` (`Pilot Initiative A`, founded `2024-11-08T12:20:00`, mission `composite-mission-15`, non-profit `false`). This view supports financial reporting by associating each incoming donation with the recipient organisation's legal and operational details.

**View `v_donation_retreat_program`**

```sql
CREATE VIEW v_donation_retreat_program AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM donations a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| id | donation_id | amount | currency_code | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 1 | PRO-2198 | Extended Review |
| 1001 | 10445623 | 25.47 | managing-resources | 2 | PRO-2205 | Pilot Initiative A |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | PRO-2212 | Baseline Model |
| 1003 | supp1 | 12.74 | 10445649 | 4 | PRO-2219 | Distributed Cluster |

The view `v_donation_retreat_program` answers: *which retreat programme is funded by each donation?* It joins `donations` to `retreat_programs` on `donations.retreat_program_id = retreat_programs.id`, projecting the donation's `id`, `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous` alongside the programme's `program_identifier`, `program_name`, `start_date`, `end_date`, `location`, and `is_annual`. Row 1 shows donation `1996936` of amount `13.49` funding programme `PRO-2198` (`Extended Review`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` at `extended-location-99`, not annual). Row 2 shows donation `10445623` of amount `25.47` funding programme `PRO-2205` (`Pilot Initiative A`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00` at `integrated-location-100`, annual). This view is the inverse of `v_retreat_program_donation` and serves the same auditing purpose from the donation side.

**View `v_spiritual_seeker_donation`**

```sql
CREATE VIEW v_spiritual_seeker_donation AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM spiritual_seekers a JOIN donations b ON a.donation_id = b.id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 1000 | 1996936 | 13.49 |
| 101 | 392498 | Janice Johnston | Heather Beasley | 1001 | 10445623 | 25.47 |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 1002 | 168 | 19.72 |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 1003 | supp1 | 12.74 |

The view `v_spiritual_seeker_donation` answers: *what donations has each seeker made?* It joins `spiritual_seekers` to `donations` on `spiritual_seekers.spiritual_seeker_id = donations.spiritual_seeker_id`, projecting the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous` alongside the donation's `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous`. Row 1 shows seeker `8387537` (Stephanie Collins, email `primary-email-70`, member since `2022-01-12T00:36:00`, anonymous) made donation `1996936` of amount `13.49` in currency `gd_fp_eu_acc3` on `2022-01-26T12:36:00` with status `pending` and `is_anonymous` true. Row 2 shows seeker `392498` (Janice Johnston, email `adaptive-email-71`, member since `2023-06-23T07:53:00`, not anonymous) made donation `10445623` of amount `25.47` in currency `managing-resources` on `2023-06-10T19:53:00` with status `received` and `is_anonymous` false. This view is the primary mechanism for generating donor statements and tracking giving history.

**View `v_spiritual_seeker_retreat_program`**

```sql
CREATE VIEW v_spiritual_seeker_retreat_program AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_seekers a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 1 | PRO-2198 | Extended Review |
| 101 | 392498 | Janice Johnston | Heather Beasley | 2 | PRO-2205 | Pilot Initiative A |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 3 | PRO-2212 | Baseline Model |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 4 | PRO-2219 | Distributed Cluster |

The view `v_spiritual_seeker_retreat_program` answers: *which retreat programme is each seeker associated with?* It joins `spiritual_seekers` to `retreat_programs` on `spiritual_seekers.retreat_program_id = retreat_programs.id`, projecting the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous` alongside the programme's `program_identifier`, `program_name`, `start_date`, `end_date`, `location`, and `is_annual`. Row 1 shows seeker `8387537` (Stephanie Collins) associated with programme `PRO-2198` (`Extended Review`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` at `extended-location-99`, not annual). Row 2 shows seeker `392498` (Janice Johnston) associated with programme `PRO-2205` (`Pilot Initiative A`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00` at `integrated-location-100`, annual). This view supports programme enrolment reporting and helps identify which seekers are linked to which events.

**View `v_spiritual_seeker_spiritual_path`**

```sql
CREATE VIEW v_spiritual_seeker_spiritual_path AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.spiritual_path_id AS path_spiritual_path_id, b.path_id AS path_path_id, b.path_name AS path_path_name
FROM spiritual_seekers a JOIN spiritual_paths b ON a.spiritual_path_id = b.spiritual_path_id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | path_spiritual_path_id | path_path_id | path_path_name |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 100 | b_VB-EC-15 | Pilot Protocol |
| 101 | 392498 | Janice Johnston | Heather Beasley | 101 | 48753444 | Baseline Programme |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 103 | interpersonal | Adaptive Framework |

The view `v_spiritual_seeker_spiritual_path` answers: *which spiritual path does each seeker follow?* It joins `spiritual_seekers` to `spiritual_paths` on `spiritual_seekers.spiritual_path_id = spiritual_paths.spiritual_path_id`, projecting the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous` alongside the path's `path_id`, `path_name`, `core_principle`, `origin_tradition`, and `is_universal`. Row 1 shows seeker `8387537` (Stephanie Collins) following path `b_VB-EC-15` (`Pilot Protocol`, principle `legacy-core-31`, tradition `regional-origin-54`, universal `true`). Row 2 shows seeker `392498` (Janice Johnston) following path `48753444` (`Baseline Programme`, principle `compact-core-32`, tradition `legacy-origin-55`, universal `false`). This view is essential for philosophical profiling and for understanding the ideological composition of the seeker community.

**View `v_spiritual_path_spiritual_seeker`**

```sql
CREATE VIEW v_spiritual_path_spiritual_seeker AS
SELECT a.spiritual_path_id, a.path_id, a.path_name, a.core_principle, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM spiritual_paths a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| spiritual_path_id | path_id | path_name | core_principle | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | 100 | 8387537 | Stephanie Collins |
| 101 | 48753444 | Baseline Programme | compact-core-32 | 101 | 392498 | Janice Johnston |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | 102 | IVC20Iind | Upal Saha |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

The view `v_spiritual_path_spiritual_seeker` answers: *which seekers are associated with each spiritual path?* It joins `spiritual_paths` to `spiritual_seekers` on `spiritual_paths.spiritual_seeker_id = spiritual_seekers.spiritual_seeker_id`, projecting the path's `path_id`, `path_name`, `core_principle`, `origin_tradition`, and `is_universal` alongside the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous`. Row 1 shows path `b_VB-EC-15` (`Pilot Protocol`, principle `legacy-core-31`, tradition `regional-origin-54`, universal `true`) associated with seeker `8387537` (Stephanie Collins, email `primary-email-70`, member since `2022-01-12T00:36:00`, anonymous). Row 2 shows path `48753444` (`Baseline Programme`, principle `compact-core-32`, tradition `legacy-origin-55`, not universal) associated with seeker `392498` (Janice Johnston, email `adaptive-email-71`, member since `2023-06-23T07:53:00`, not anonymous). This view is the inverse of `v_spiritual_seeker_spiritual_path` and supports path-level community analysis.

**View `v_spiritual_path_retreat_program`**

```sql
CREATE VIEW v_spiritual_path_retreat_program AS
SELECT a.spiritual_path_id, a.path_id, a.path_name, a.core_principle, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_paths a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_path_id | path_id | path_name | core_principle | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | 1 | PRO-2198 | Extended Review |
| 101 | 48753444 | Baseline Programme | compact-core-32 | 2 | PRO-2205 | Pilot Initiative A |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | 3 | PRO-2212 | Baseline Model |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | 4 | PRO-2219 | Distributed Cluster |

The view `v_spiritual_path_retreat_program` answers: *which retreat programme is associated with each spiritual path?* It joins `spiritual_paths` to `retreat_programs` on `spiritual_paths.retreat_program_id = retreat_programs.id`, projecting the path's `path_id`, `path_name`, `core_principle`, `origin_tradition`, and `is_universal` alongside the programme's `program_identifier`, `program_name`, `start_date`, `end_date`, `location`, and `is_annual`. Row 1 shows path `b_VB-EC-15` (`Pilot Protocol`, principle `legacy-core-31`, tradition `regional-origin-54`, universal `true`) associated with programme `PRO-2198` (`Extended Review`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` at `extended-location-99`, not annual). Row 2 shows path `48753444` (`Baseline Programme`, principle `compact-core-32`, tradition `legacy-origin-55`, not universal) associated with programme `PRO-2205` (`Pilot Initiative A`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00` at `integrated-location-100`, annual). This view links philosophical frameworks to concrete programme offerings, enabling ideological-programme alignment analysis.

**View `v_spiritual_organization_retreat_program`**

```sql
CREATE VIEW v_spiritual_organization_retreat_program AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_organizations a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_organization_id | org_id | org_name | founding_date | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 1 | PRO-2198 | Extended Review |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 2 | PRO-2205 | Pilot Initiative A |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 3 | PRO-2212 | Baseline Model |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 4 | PRO-2219 | Distributed Cluster |

The view `v_spiritual_organization_retreat_program` answers: *which retreat programmes does each spiritual organisation host?* It joins `spiritual_organizations` to `retreat_programs` on `spiritual_organizations.spiritual_organization_id = retreat_programs.spiritual_organization_id`, projecting the organisation's `org_id`, `org_name`, `founding_date`, `mission_statement`, and `is_non_profit` alongside the programme's `program_identifier`, `program_name`, `start_date`, `end_date`, `location`, and `is_annual`. Row 1 shows organisation `790471` (`Extended Review`, founded `2023-06-24T05:03:00`, mission `compact-mission-14`, non-profit `true`) hosting programme `PRO-2198` (`Extended Review`, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` at `extended-location-99`, not annual). Row 2 shows organisation `1717` (`Pilot Initiative A`, founded `2024-11-08T12:20:00`, mission `composite-mission-15`, non-profit `false`) hosting programme `PRO-2205` (`Pilot Initiative A`, running from `2023-02-16T03:41:00` to `2023-02-12T15:17:00` at `integrated-location-100`, annual). This view supports organisational portfolio reporting and helps identify which organisations are most active in programme delivery.

**View `v_spiritual_organization_donation`**

```sql
CREATE VIEW v_spiritual_organization_donation AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM spiritual_organizations a JOIN donations b ON a.donation_id = b.id;
```

| spiritual_organization_id | org_id | org_name | founding_date | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 1000 | 1996936 | 13.49 |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 1001 | 10445623 | 25.47 |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 1002 | 168 | 19.72 |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 1003 | supp1 | 12.74 |

The view `v_spiritual_organization_donation` answers: *which donations has each spiritual organisation received?* It joins `spiritual_organizations` to `donations` on `spiritual_organizations.spiritual_organization_id = donations.spiritual_organization_id`, projecting the organisation's `org_id`, `org_name`, `founding_date`, `mission_statement`, and `is_non_profit` alongside the donation's `donation_id`, `amount`, `currency_code`, `donation_date`, `status`, and `is_anonymous`. Row 1 shows organisation `790471` (`Extended Review`, founded `2023-06-24T05:03:00`, mission `compact-mission-14`, non-profit `true`) received donation `1996936` of amount `13.49` in currency `gd_fp_eu_acc3` on `2022-01-26T12:36:00` with status `pending` and `is_anonymous` true. Row 2 shows organisation `1717` (`Pilot Initiative A`, founded `2024-11-08T12:20:00`, mission `composite-mission-15`, non-profit `false`) received donation `10445623` of amount `25.47` in currency `managing-resources` on `2023-06-10T19:53:00` with status `received` and `is_anonymous` false. This view is the primary mechanism for financial reconciliation and revenue attribution.

**View `v_spiritual_organization_spiritual_seeker`**

```sql
CREATE VIEW v_spiritual_organization_spiritual_seeker AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM spiritual_organizations a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| spiritual_organization_id | org_id | org_name | founding_date | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 100 | 8387537 | Stephanie Collins |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 101 | 392498 | Janice Johnston |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 102 | IVC20Iind | Upal Saha |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

The view `v_spiritual_organization_spiritual_seeker` answers: *which seekers are associated with each spiritual organisation?* It joins `spiritual_organizations` to `spiritual_seekers` on `spiritual_organizations.spiritual_seeker_id = spiritual_seekers.spiritual_seeker_id`, projecting the organisation's `org_id`, `org_name`, `founding_date`, `mission_statement`, and `is_non_profit` alongside the seeker's `seeker_id`, `first_name`, `last_name`, `email_address`, `member_since`, and `is_anonymous`. Row 1 shows organisation `790471` (`Extended Review`, founded `2023-06-24T05:03:00`, mission `compact-mission-14`, non-profit `true`) associated with seeker `8387537` (Stephanie Collins, email `primary-email-70`, member since `2022-01-12T00:36:00`, anonymous). Row 2 shows organisation `1717` (`Pilot Initiative A`, founded `2024-11-08T12:20:00`, mission `composite-mission-15`, non-profit `false`) associated with seeker `392498` (Janice Johnston, email `adaptive-email-71`, member since `2023-06-23T07:53:00`, not anonymous). This view supports community mapping and helps identify which seekers are affiliated with which organisations.

The materialisation of this ontology into a relational schema demonstrates a disciplined approach to normalisation: each entity type occupies its own table with a surrogate primary key, attributes are stored as columns with appropriate data types, and relationships are expressed through foreign keys rather than redundant data duplication. The views then serve as denormalised lenses that answer specific domain questions by joining the appropriate tables. Each view corresponds to a single binary relationship in the ontology, projecting the relevant attributes from both participating entities. This design ensures that updates are localised to the base tables — changing a seeker's email, for instance, requires a single update to `spiritual_seekers` and is immediately reflected in all views that include that seeker's data. The schema supports both operational queries (e.g., "what is the status of donation `1996936`?") and analytical queries (e.g., "which organisations have received the most donations?") through the same set of views, making it a robust foundation for the spiritual retreat domain.