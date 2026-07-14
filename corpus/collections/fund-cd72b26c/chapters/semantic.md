## Domain Modelling and Relational Materialization in Fund Management

The fund management domain captures the lifecycle of investment vehicles, their underlying portfolios, performance tracking, and the organizational entities that govern them. At its core, the model distinguishes between top-level `funds`—the public-facing investment products—and `underlying_funds`, which represent the actual portfolio vehicles where capital is deployed. These two entity types are linked through a one-to-many relationship: a single `funds` record can aggregate multiple `underlying_funds`, each carrying its own investment strategy, geographic focus, and asset class. The model further enriches this hierarchy with `benchmark_indexes` that serve as performance baselines, `performance_reports` that quantify returns and risk metrics, `assets` that constitute the investable universe, `fund_managers` who operate the vehicles, `charitable_causes` that track donation commitments, and `corporate_meetings` that record governance events.

**Table `funds`**

| fund_id | fund_identifier | fund_name | inception_date | fund_class | total_assets_under_management | management_fee_rate | performance_fee_rate | charitable_donation_status | benchmark_index_id | charitable_cause_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 2024-07-19 | seasonal-fund-59 | 13.95 | 29.43 | 10.72 | false | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | FUN-2672 | Integrated Standard | 2025-12-03 | regional-fund-60 | 16.90 | 0.12 | 0.37 | true | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | FUN-2674 | Extended Framework D | 2022-05-14 | legacy-fund-61 | 19.85 | 89.53 | 9.54 | false | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | FUN-2676 | Pilot Protocol | 2023-10-25 | compact-fund-62 | 22.80 | 14.31 | 89.53 | true | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `funds` table anchors the entire schema. Each row represents a public investment product identified by a surrogate `fund_id` and a human-readable `fund_identifier` such as `FUN-2670`. The `fund_name` column carries descriptive labels like *Seasonal Programme* or *Integrated Standard*, while `inception_date` records when the fund launched. The `fund_class` column classifies funds into categories such as `seasonal-fund-59`, `regional-fund-60`, `legacy-fund-61`, and `compact-fund-62`. Financial attributes include `total_assets_under_management` (a decimal value in millions, e.g., 13.95 for the Seasonal Programme), `management_fee_rate` (e.g., 29.43%), and `performance_fee_rate` (e.g., 10.72%). The boolean `charitable_donation_status` indicates whether the fund participates in charitable giving. Foreign keys `benchmark_index_id` and `charitable_cause_id` link to the `benchmark_indexes` and `charitable_causes` tables respectively, while `created_at` and `updated_at` provide audit timestamps.

**Table `underlying_funds`**

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | management_fee_waived | performance_fee_waived | investment_strategy | geographic_focus | asset_class | manager_name | fund_id | benchmark_index_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | true | true | extended-investme-93 | extended-geograph-99 | legacy-asset-43 | Extended Initiative | 100 | 1 |
| 101 | UND-2524 | Distributed Protocol | false | false | integrated-investme-94 | integrated-geograph-100 | compact-asset-44 | Pilot Model A | 101 | 2 |
| 102 | UND-2525 | Adaptive Programme | true | true | seasonal-investme-95 | seasonal-geograph-101 | composite-asset-45 | Baseline Cluster | 102 | 3 |
| 103 | UND-2526 | Primary Standard A | false | false | regional-investme-96 | regional-geograph-102 | primary-asset-46 | Distributed Review | 103 | 4 |

The `underlying_funds` table models the actual portfolio vehicles nested beneath each fund. Each row carries an `underlying_fund_id` surrogate key and an `underlying_fund_identifier` such as `UND-2523`. The `underlying_fund_name` column holds labels like *Baseline Framework D* or *Distributed Protocol*. Fee waiver flags (`management_fee_waived` and `performance_fee_waived`) are stored as booleans, while `investment_strategy`, `geographic_focus`, and `asset_class` use coded values such as `extended-investme-93`, `extended-geograph-99`, and `legacy-asset-43`. The `manager_name` column stores a free-text name for the operating manager (e.g., *Extended Initiative*), and foreign keys `fund_id` and `benchmark_index_id` link back to the parent fund and its benchmark index.

**Table `benchmark_indexes`**

| benchmark_index_id | index_name | index_ticker | index_type | currency | rebalancing_frequency | weighting_scheme | number_of_components | is_hedged | fund_id | underlying_fund_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | primary-index-94 | regional-index-84 | seasonal-currency-71 | compact-rebalanc-26 | composite-weightin-45 | 41 | false | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Composite Model | adaptive-index-95 | legacy-index-85 | regional-currency-72 | composite-rebalanc-27 | primary-weightin-46 | 49 | true | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Compact Cluster | distributed-index-96 | compact-index-86 | legacy-currency-73 | primary-rebalanc-28 | adaptive-weightin-47 | 57 | false | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Legacy Review D | baseline-index-97 | composite-index-87 | compact-currency-74 | adaptive-rebalanc-29 | distributed-weightin-48 | 65 | true | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Benchmark indexes serve as performance reference points. The `benchmark_indexes` table stores each index with a `benchmark_index_id` surrogate key, an `index_name` (e.g., *Primary Initiative A*), and an `index_ticker` (e.g., `primary-index-94`). The `index_type` column classifies indexes as `regional-index-84`, `legacy-index-85`, `compact-index-86`, or `composite-index-87`. Additional attributes include `currency` (e.g., `seasonal-currency-71`), `rebalancing_frequency` (e.g., `compact-rebalanc-26`), `weighting_scheme` (e.g., `composite-weightin-45`), `number_of_components` (an integer such as 41), and `is_hedged` (a boolean). Foreign keys `fund_id` and `underlying_fund_id` associate each index with its parent fund and underlying fund, while `created_at` and `updated_at` provide audit timestamps.

**Table `performance_reports`**

| performance_report_id | report_date | period_start | period_end | trailing_return | benchmark_return | standard_deviation | sharpe_ratio | alpha | beta | report_type | fund_id | underlying_fund_id | benchmark_index_id | fund_manager_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 18.70 | 15.70 | 18.20 | 10.45 | 18.70 | 13.95 | extended-report-93 | 100 | 100 | 1 | 1000 |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 22.40 | 19.40 | 22.40 | 13.90 | 23.40 | 16.90 | integrated-report-94 | 101 | 101 | 2 | 1001 |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 26.10 | 23.10 | 26.60 | 17.35 | 28.10 | 19.85 | seasonal-report-95 | 102 | 102 | 3 | 1002 |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 29.80 | 26.80 | 30.80 | 20.80 | 32.80 | 22.80 | regional-report-96 | 103 | 103 | 4 | 1003 |

Performance reports quantify the returns and risk characteristics of funds and underlying vehicles. The `performance_reports` table uses `performance_report_id` as its surrogate key and stores `report_date` as an ISO 8601 timestamp (e.g., `2024-03-02T02:54:00`). The reporting window is captured by `period_start` and `period_end` dates. Quantitative metrics include `trailing_return` (e.g., 18.70), `benchmark_return` (e.g., 15.70), `standard_deviation` (e.g., 18.20), `sharpe_ratio` (e.g., 10.45), `alpha` (e.g., 18.70), and `beta` (e.g., 13.95). The `report_type` column classifies reports as `extended-report-93`, `integrated-report-94`, `seasonal-report-95`, or `regional-report-96`. Foreign keys `fund_id`, `underlying_fund_id`, `benchmark_index_id`, and `fund_manager_id` link the report to its associated entities.

**Table `assets`**

| asset_id | asset_identifier | asset_name | asset_type | market_cap | sector | country_of_incorporation | currency_denomination | is_equity | is_fixed_income | underlying_fund_id | benchmark_index_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | pilot-asset-86 | 3.95 | adaptive-sector-53 | adaptive-country-11 | primary-currency-16 | false | false | 100 | 1 |
| 2 | ASS-2756 | Baseline Standard | extended-asset-87 | 5.90 | distributed-sector-54 | distributed-country-12 | adaptive-currency-17 | true | true | 101 | 2 |
| 3 | ASS-2760 | Distributed Framework A | integrated-asset-88 | 7.85 | baseline-sector-55 | baseline-country-13 | distributed-currency-18 | false | false | 102 | 3 |
| 4 | ASS-2764 | Adaptive Protocol | seasonal-asset-89 | 9.80 | pilot-sector-56 | pilot-country-14 | baseline-currency-19 | true | true | 103 | 4 |

The `assets` table represents individual investable securities. Each row carries an `asset_id` surrogate key and an `asset_identifier` such as `ASS-2752`. The `asset_name` column holds labels like *Pilot Programme* or *Baseline Standard*. Classification attributes include `asset_type` (e.g., `pilot-asset-86`), `market_cap` (a decimal such as 3.95), `sector` (e.g., `adaptive-sector-53`), `country_of_incorporation` (e.g., `adaptive-country-11`), and `currency_denomination` (e.g., `primary-currency-16`). Boolean flags `is_equity` and `is_fixed_income` indicate the security type. Foreign keys `underlying_fund_id` and `benchmark_index_id` associate each asset with its parent underlying fund and benchmark index.

**Table `fund_managers`**

| fund_manager_id | manager_identifier | manager_name | regulatory_license | management_fee_waived | performance_fee_waived | headquarters_country | total_a_u_m | years_in_operation |
|---|---|---|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | legacy-regulato-25 | true | true | regional-headquar-42 | 6.95 | 32 |
| 1001 | MAN-2736 | Jorge Sullivan | compact-regulato-26 | false | false | legacy-headquar-43 | 8.90 | 40 |
| 1002 | MAN-2743 | Norma Fisher | composite-regulato-27 | true | true | compact-headquar-44 | 10.85 | 48 |
| 1003 | MAN-2750 | Norma Fisher | primary-regulato-28 | false | false | composite-headquar-45 | 12.80 | 56 |

Fund managers are the organizational or individual entities responsible for operating investment vehicles. The `fund_managers` table uses `fund_manager_id` as its surrogate key and stores `manager_identifier` (e.g., `MAN-2729`) and `manager_name` (e.g., *Melissa Hernandez*). The `regulatory_license` column holds a coded license type such as `legacy-regulato-25`. Fee waiver flags (`management_fee_waived` and `performance_fee_waived`) are stored as booleans. The `headquarters_country` column uses coded values like `regional-headquar-42`, while `total_a_u_m` records the manager's total assets under management (e.g., 6.95) and `years_in_operation` records tenure (e.g., 32 years).

**Table `charitable_causes`**

| id | cause_identifier | cause_name | cause_category | total_donations_received | donation_frequency | next_donation_date | tax_exempt_status | geographic_focus | fund_id | underlying_fund_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | CAU-2797 | Integrated Framework A | seasonal-cause-89 | 8.45 | primary-donation-46 | 2022-09-13 | false | extended-geograph-99 | 100 | 100 |
| 101 | CAU-2803 | Extended Protocol | regional-cause-90 | 11.90 | adaptive-donation-47 | 2023-02-24 | true | integrated-geograph-100 | 101 | 101 |
| 102 | CAU-2809 | Pilot Programme | legacy-cause-91 | 15.35 | distributed-donation-48 | 2024-07-08 | false | seasonal-geograph-101 | 102 | 102 |
| 103 | CAU-2815 | Baseline Standard D | compact-cause-92 | 18.80 | baseline-donation-49 | 2025-12-19 | true | regional-geograph-102 | 103 | 103 |

Charitable causes represent the philanthropic commitments associated with funds. Each cause is identified by a `charitable_cause_id` surrogate key and carries a `charitable_cause_name`, a `description`, and a `category`. The `is_active` boolean indicates whether the cause is currently operational, while `created_at` and `updated_at` provide audit timestamps. The `funds` table references causes through its `charitable_cause_id` foreign key.

**Table `corporate_meetings`**

| id | meeting_identifier | meeting_date | meeting_type | participants_count | meeting_outcome | is_confidential | meeting_duration_minutes | location | fund_manager_id | asset_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | 2023-10-23T21:39:00 | integrated-meeting-70 | 25 | composite-meeting-21 | false | 31 | extended-location-99 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | MEE-2377 | 2024-03-07T04:56:00 | seasonal-meeting-71 | 9 | primary-meeting-22 | true | 37 | integrated-location-100 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | MEE-2384 | 2025-08-18T11:13:00 | regional-meeting-72 | 27 | adaptive-meeting-23 | false | 43 | seasonal-location-101 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | MEE-2391 | 2022-01-02T18:30:00 | legacy-meeting-73 | 45 | distributed-meeting-24 | true | 49 | regional-location-102 | 1003 | 4 | 2025-04-16 09:14:00 |

Corporate meetings record governance events. Each meeting carries a surrogate `meeting_id`, a `meeting_date`, a `meeting_type`, an `agenda` description, and a `location`. The `fund_manager_id` foreign key links the meeting to the responsible manager, while `created_at` and `updated_at` provide audit timestamps.

The model employs junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `funds_funds` table links a `fund_id` to a `related_fund_id`, enabling self-referential fund relationships such as feeder-fund structures. The `funds_reports` table associates a `fund_id` with a `performance_report_id`, allowing a single fund to have multiple performance reports. The `funds_assets` table links a `fund_id` to an `asset_id`, representing direct fund-level asset holdings. The `indexes_assets` table associates a `benchmark_index_id` with an `asset_id`, defining the constituents of each benchmark index.

**Table `funds_funds`**

| fund_id | underlying_fund_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `funds_funds` junction table resolves the many-to-many relationship between funds. Each row contains a `fund_id` and a `related_fund_id`, both foreign keys referencing `funds.fund_id`. This structure enables complex fund hierarchies where a fund can be related to multiple other funds in various capacities.

**Table `funds_reports`**

| fund_id | performance_report_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `funds_reports` junction table links `fund_id` to `performance_report_id`, enabling a fund to be associated with multiple performance reports over time. Each row represents a single fund-report association.

**Table `funds_assets`**

| underlying_fund_id | asset_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `funds_assets` junction table links `fund_id` to `asset_id`, representing direct asset holdings at the fund level. Each row establishes that a particular fund holds a particular asset.

**Table `indexes_assets`**

| benchmark_index_id | asset_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `indexes_assets` junction table links `benchmark_index_id` to `asset_id`, defining the constituent assets of each benchmark index. Each row establishes that a particular asset is included in a particular index.

**Table `managers_funds`**

| fund_manager_id | underlying_fund_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `managers_funds` junction table links `fund_manager_id` to `fund_id`, establishing which managers operate which funds. Each row represents a manager-fund assignment.

**Table `managers_reports`**

| fund_manager_id | performance_report_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `managers_reports` junction table links `fund_manager_id` to `performance_report_id`, associating managers with the performance reports they are responsible for. Each row represents a manager-report association.

**Table `managers_assets`**

| fund_manager_id | asset_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `managers_assets` junction table links `fund_manager_id` to `asset_id`, establishing which assets a manager is responsible for. Each row represents a manager-asset assignment.

**Table `managers_meetings`**

| fund_manager_id | corporate_meeting_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `managers_meetings` junction table links `fund_manager_id` to `meeting_id`, associating managers with the corporate meetings they attend or organize. Each row represents a manager-meeting association.

The relational model materializes through a series of views that reconstruct domain facts by joining normalized tables. Each view answers a specific analytical question by denormalizing the schema along a particular axis.

**View `fund_underlying_fund_detail_view`**

```sql
CREATE VIEW fund_underlying_fund_detail_view AS
SELECT a.fund_id, a.fund_identifier, a.fund_name, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM funds a
  JOIN funds_funds j ON j.fund_id = a.fund_id
  JOIN underlying_funds b ON b.underlying_fund_id = j.underlying_fund_id;
```

| fund_id | fund_identifier | fund_name | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 100 | UND-2523 | Baseline Framework D |
| 100 | FUN-2670 | Seasonal Programme | 101 | UND-2524 | Distributed Protocol |
| 101 | FUN-2672 | Integrated Standard | 101 | UND-2524 | Distributed Protocol |
| 101 | FUN-2672 | Integrated Standard | 102 | UND-2525 | Adaptive Programme |
| 102 | FUN-2674 | Extended Framework D | 102 | UND-2525 | Adaptive Programme |
| 102 | FUN-2674 | Extended Framework D | 103 | UND-2526 | Primary Standard A |
| 103 | FUN-2676 | Pilot Protocol | 103 | UND-2526 | Primary Standard A |
| 103 | FUN-2676 | Pilot Protocol | 100 | UND-2523 | Baseline Framework D |

The `fund_underlying_fund_detail_view` joins `funds` to `underlying_funds` on `fund_id`, reconstructing the parent-child relationship between public funds and their underlying portfolio vehicles. A row such as fund `FUN-2670` (Seasonal Programme) linked to underlying fund `UND-2523` (Baseline Framework D) with `management_fee_waived = true` reveals how fee structures propagate from the parent fund down to its underlying vehicles.

**View `fund_benchmark_index_view`**

```sql
CREATE VIEW fund_benchmark_index_view AS
SELECT a.fund_id, a.fund_identifier, a.fund_name, a.inception_date, b.benchmark_index_id AS index_benchmark_index_id, b.index_name AS index_index_name, b.index_ticker AS index_index_ticker
FROM funds a JOIN benchmark_indexes b ON a.benchmark_index_id = b.benchmark_index_id;
```

| fund_id | fund_identifier | fund_name | inception_date | index_benchmark_index_id | index_index_name | index_index_ticker |
|---|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 2024-07-19 | 1 | Primary Initiative A | primary-index-94 |
| 101 | FUN-2672 | Integrated Standard | 2025-12-03 | 2 | Composite Model | adaptive-index-95 |
| 102 | FUN-2674 | Extended Framework D | 2022-05-14 | 3 | Compact Cluster | distributed-index-96 |
| 103 | FUN-2676 | Pilot Protocol | 2023-10-25 | 4 | Legacy Review D | baseline-index-97 |

The `fund_benchmark_index_view` joins `funds` to `benchmark_indexes` on `benchmark_index_id`, answering which benchmark index each fund tracks. A row showing fund `FUN-2670` linked to index `Primary Initiative A` (`primary-index-94`) with 41 components and `is_hedged = false` provides a complete picture of the fund's performance reference.

**View `fund_performance_report_detail_view`**

```sql
CREATE VIEW fund_performance_report_detail_view AS
SELECT a.fund_id, a.fund_identifier, a.fund_name, b.performance_report_id AS report_performance_report_id, b.report_date AS report_report_date, b.period_start AS report_period_start
FROM funds a
  JOIN funds_reports j ON j.fund_id = a.fund_id
  JOIN performance_reports b ON b.performance_report_id = j.performance_report_id;
```

| fund_id | fund_identifier | fund_name | report_performance_report_id | report_report_date | report_period_start |
|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 1 | 2024-03-02T02:54:00 | 2023-10-27 |
| 100 | FUN-2670 | Seasonal Programme | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 101 | FUN-2672 | Integrated Standard | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 101 | FUN-2672 | Integrated Standard | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 102 | FUN-2674 | Extended Framework D | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 102 | FUN-2674 | Extended Framework D | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 103 | FUN-2676 | Pilot Protocol | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 103 | FUN-2676 | Pilot Protocol | 1 | 2024-03-02T02:54:00 | 2023-10-27 |

The `fund_performance_report_detail_view` joins `funds` to `performance_reports` on `fund_id`, reconstructing the performance history of each fund. A row for fund `FUN-2670` with a trailing return of 18.70 against a benchmark return of 15.70, a Sharpe ratio of 10.45, and alpha of 18.70 quantifies the fund's risk-adjusted outperformance.

**View `fund_charitable_cause_view`**

```sql
CREATE VIEW fund_charitable_cause_view AS
SELECT a.fund_id, a.fund_identifier, a.fund_name, a.inception_date, b.id AS cause_id, b.cause_identifier AS cause_cause_identifier, b.cause_name AS cause_cause_name
FROM funds a JOIN charitable_causes b ON a.charitable_cause_id = b.id;
```

| fund_id | fund_identifier | fund_name | inception_date | cause_id | cause_cause_identifier | cause_cause_name |
|---|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 2024-07-19 | 100 | CAU-2797 | Integrated Framework A |
| 101 | FUN-2672 | Integrated Standard | 2025-12-03 | 101 | CAU-2803 | Extended Protocol |
| 102 | FUN-2674 | Extended Framework D | 2022-05-14 | 102 | CAU-2809 | Pilot Programme |
| 103 | FUN-2676 | Pilot Protocol | 2023-10-25 | 103 | CAU-2815 | Baseline Standard D |

The `fund_charitable_cause_view` joins `funds` to `charitable_causes` on `charitable_cause_id`, revealing the philanthropic commitments of each fund. A row for fund `FUN-2672` (Integrated Standard) with `charitable_donation_status = true` linked to its associated charitable cause demonstrates the fund's social responsibility alignment.

**View `underlying_fund_fund_view`**

```sql
CREATE VIEW underlying_fund_fund_view AS
SELECT a.underlying_fund_id, a.underlying_fund_identifier, a.underlying_fund_name, a.management_fee_waived, b.fund_id AS fund_fund_id, b.fund_identifier AS fund_fund_identifier, b.fund_name AS fund_fund_name
FROM underlying_funds a JOIN funds b ON a.fund_id = b.fund_id;
```

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | management_fee_waived | fund_fund_id | fund_fund_identifier | fund_fund_name |
|---|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | true | 100 | FUN-2670 | Seasonal Programme |
| 101 | UND-2524 | Distributed Protocol | false | 101 | FUN-2672 | Integrated Standard |
| 102 | UND-2525 | Adaptive Programme | true | 102 | FUN-2674 | Extended Framework D |
| 103 | UND-2526 | Primary Standard A | false | 103 | FUN-2676 | Pilot Protocol |

The `underlying_fund_fund_view` joins `underlying_funds` to `funds` on `fund_id`, inverting the parent-child perspective to show which parent fund each underlying vehicle belongs to. A row for underlying fund `UND-2524` (Distributed Protocol) linked to fund `FUN-2672` (Integrated Standard) with `management_fee_waived = false` clarifies the fee structure at the parent level.

**View `underlying_fund_asset_detail_view`**

```sql
CREATE VIEW underlying_fund_asset_detail_view AS
SELECT a.underlying_fund_id, a.underlying_fund_identifier, a.underlying_fund_name, b.asset_id AS asset_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM underlying_funds a
  JOIN funds_assets j ON j.underlying_fund_id = a.underlying_fund_id
  JOIN assets b ON b.asset_id = j.asset_id;
```

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | asset_asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | 1 | ASS-2752 | Pilot Programme |
| 100 | UND-2523 | Baseline Framework D | 2 | ASS-2756 | Baseline Standard |
| 101 | UND-2524 | Distributed Protocol | 2 | ASS-2756 | Baseline Standard |
| 101 | UND-2524 | Distributed Protocol | 3 | ASS-2760 | Distributed Framework A |
| 102 | UND-2525 | Adaptive Programme | 3 | ASS-2760 | Distributed Framework A |
| 102 | UND-2525 | Adaptive Programme | 4 | ASS-2764 | Adaptive Protocol |
| 103 | UND-2526 | Primary Standard A | 4 | ASS-2764 | Adaptive Protocol |
| 103 | UND-2526 | Primary Standard A | 1 | ASS-2752 | Pilot Programme |

The `underlying_fund_asset_detail_view` joins `underlying_funds` to `assets` on `underlying_fund_id`, reconstructing the asset composition of each underlying fund. A row for underlying fund `UND-2523` linked to asset `ASS-2752` (Pilot Programme) with a market cap of 3.95 and `is_equity = false` reveals the security-level holdings.

**View `underlying_fund_benchmark_index_view`**

```sql
CREATE VIEW underlying_fund_benchmark_index_view AS
SELECT a.underlying_fund_id, a.underlying_fund_identifier, a.underlying_fund_name, a.management_fee_waived, b.benchmark_index_id AS index_benchmark_index_id, b.index_name AS index_index_name, b.index_ticker AS index_index_ticker
FROM underlying_funds a JOIN benchmark_indexes b ON a.benchmark_index_id = b.benchmark_index_id;
```

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | management_fee_waived | index_benchmark_index_id | index_index_name | index_index_ticker |
|---|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | true | 1 | Primary Initiative A | primary-index-94 |
| 101 | UND-2524 | Distributed Protocol | false | 2 | Composite Model | adaptive-index-95 |
| 102 | UND-2525 | Adaptive Programme | true | 3 | Compact Cluster | distributed-index-96 |
| 103 | UND-2526 | Primary Standard A | false | 4 | Legacy Review D | baseline-index-97 |

The `underlying_fund_benchmark_index_view` joins `underlying_funds` to `benchmark_indexes` on `benchmark_index_id`, showing which benchmark each underlying fund tracks. A row for underlying fund `UND-2524` linked to index `Composite Model` (`adaptive-index-95`) with `is_hedged = true` provides the hedging context for performance evaluation.

**View `underlying_fund_performance_report_detail_view`**

```sql
CREATE VIEW underlying_fund_performance_report_detail_view AS
SELECT a.underlying_fund_id, a.underlying_fund_identifier, a.underlying_fund_name, b.performance_report_id AS report_performance_report_id, b.report_date AS report_report_date, b.period_start AS report_period_start
FROM underlying_funds a
  JOIN funds_reports j ON j.underlying_fund_id = a.underlying_fund_id
  JOIN performance_reports b ON b.performance_report_id = j.performance_report_id;
```

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | report_performance_report_id | report_report_date | report_period_start |
|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | 1 | 2024-03-02T02:54:00 | 2023-10-27 |
| 100 | UND-2523 | Baseline Framework D | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 101 | UND-2524 | Distributed Protocol | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 101 | UND-2524 | Distributed Protocol | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 102 | UND-2525 | Adaptive Programme | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 102 | UND-2525 | Adaptive Programme | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 103 | UND-2526 | Primary Standard A | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 103 | UND-2526 | Primary Standard A | 1 | 2024-03-02T02:54:00 | 2023-10-27 |

The `underlying_fund_performance_report_detail_view` joins `underlying_funds` to `performance_reports` on `underlying_fund_id`, reconstructing the performance history at the underlying fund level. A row for underlying fund `UND-2525` (Adaptive Programme) with a trailing return of 26.10 and standard deviation of 26.60 quantifies the risk-return profile of the underlying vehicle.

**View `benchmark_index_asset_detail_view`**

```sql
CREATE VIEW benchmark_index_asset_detail_view AS
SELECT a.benchmark_index_id, a.index_name, a.index_ticker, b.asset_id AS asset_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM benchmark_indexes a
  JOIN indexes_assets j ON j.benchmark_index_id = a.benchmark_index_id
  JOIN assets b ON b.asset_id = j.asset_id;
```

| benchmark_index_id | index_name | index_ticker | asset_asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|
| 1 | Primary Initiative A | primary-index-94 | 1 | ASS-2752 | Pilot Programme |
| 1 | Primary Initiative A | primary-index-94 | 2 | ASS-2756 | Baseline Standard |
| 2 | Composite Model | adaptive-index-95 | 2 | ASS-2756 | Baseline Standard |
| 2 | Composite Model | adaptive-index-95 | 3 | ASS-2760 | Distributed Framework A |
| 3 | Compact Cluster | distributed-index-96 | 3 | ASS-2760 | Distributed Framework A |
| 3 | Compact Cluster | distributed-index-96 | 4 | ASS-2764 | Adaptive Protocol |
| 4 | Legacy Review D | baseline-index-97 | 4 | ASS-2764 | Adaptive Protocol |
| 4 | Legacy Review D | baseline-index-97 | 1 | ASS-2752 | Pilot Programme |

The `benchmark_index_asset_detail_view` joins `benchmark_indexes` to `assets` through the `indexes_assets` junction table, reconstructing the constituent assets of each benchmark index. A row for index `Primary Initiative A` linked to asset `ASS-2752` (Pilot Programme) with `asset_type = pilot-asset-86` reveals the index composition.

**View `benchmark_index_fund_view`**

```sql
CREATE VIEW benchmark_index_fund_view AS
SELECT a.benchmark_index_id, a.index_name, a.index_ticker, a.index_type, b.fund_id AS fund_fund_id, b.fund_identifier AS fund_fund_identifier, b.fund_name AS fund_fund_name
FROM benchmark_indexes a JOIN funds b ON a.fund_id = b.fund_id;
```

| benchmark_index_id | index_name | index_ticker | index_type | fund_fund_id | fund_fund_identifier | fund_fund_name |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | primary-index-94 | regional-index-84 | 100 | FUN-2670 | Seasonal Programme |
| 2 | Composite Model | adaptive-index-95 | legacy-index-85 | 101 | FUN-2672 | Integrated Standard |
| 3 | Compact Cluster | distributed-index-96 | compact-index-86 | 102 | FUN-2674 | Extended Framework D |
| 4 | Legacy Review D | baseline-index-97 | composite-index-87 | 103 | FUN-2676 | Pilot Protocol |

The `benchmark_index_fund_view` joins `benchmark_indexes` to `funds` on `fund_id`, showing which funds track each benchmark index. A row for index `Primary Initiative A` linked to fund `FUN-2670` (Seasonal Programme) with `total_assets_under_management = 13.95` provides the scale context.

**View `benchmark_index_underlying_fund_view`**

```sql
CREATE VIEW benchmark_index_underlying_fund_view AS
SELECT a.benchmark_index_id, a.index_name, a.index_ticker, a.index_type, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM benchmark_indexes a JOIN underlying_funds b ON a.underlying_fund_id = b.underlying_fund_id;
```

| benchmark_index_id | index_name | index_ticker | index_type | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | primary-index-94 | regional-index-84 | 100 | UND-2523 | Baseline Framework D |
| 2 | Composite Model | adaptive-index-95 | legacy-index-85 | 101 | UND-2524 | Distributed Protocol |
| 3 | Compact Cluster | distributed-index-96 | compact-index-86 | 102 | UND-2525 | Adaptive Programme |
| 4 | Legacy Review D | baseline-index-97 | composite-index-87 | 103 | UND-2526 | Primary Standard A |

The `benchmark_index_underlying_fund_view` joins `benchmark_indexes` to `underlying_funds` on `underlying_fund_id`, showing which underlying funds track each benchmark index. A row for index `Composite Model` linked to underlying fund `UND-2524` (Distributed Protocol) with `investment_strategy = integrated-investme-94` reveals the strategy-index alignment.

**View `performance_report_fund_view`**

```sql
CREATE VIEW performance_report_fund_view AS
SELECT a.performance_report_id, a.report_date, a.period_start, a.period_end, b.fund_id AS fund_fund_id, b.fund_identifier AS fund_fund_identifier, b.fund_name AS fund_fund_name
FROM performance_reports a JOIN funds b ON a.fund_id = b.fund_id;
```

| performance_report_id | report_date | period_start | period_end | fund_fund_id | fund_fund_identifier | fund_fund_name |
|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 100 | FUN-2670 | Seasonal Programme |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 101 | FUN-2672 | Integrated Standard |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 102 | FUN-2674 | Extended Framework D |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 103 | FUN-2676 | Pilot Protocol |

The `performance_report_fund_view` joins `performance_reports` to `funds` on `fund_id`, reconstructing the fund-level context for each performance report. A row for report with `trailing_return = 18.70` linked to fund `FUN-2670` (Seasonal Programme) with `fund_class = seasonal-fund-59` provides the classification context.

**View `performance_report_underlying_fund_view`**

```sql
CREATE VIEW performance_report_underlying_fund_view AS
SELECT a.performance_report_id, a.report_date, a.period_start, a.period_end, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM performance_reports a JOIN underlying_funds b ON a.underlying_fund_id = b.underlying_fund_id;
```

| performance_report_id | report_date | period_start | period_end | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 100 | UND-2523 | Baseline Framework D |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 101 | UND-2524 | Distributed Protocol |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 102 | UND-2525 | Adaptive Programme |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 103 | UND-2526 | Primary Standard A |

The `performance_report_underlying_fund_view` joins `performance_reports` to `underlying_funds` on `underlying_fund_id`, reconstructing the underlying fund context for each performance report. A row for report with `sharpe_ratio = 10.45` linked to underlying fund `UND-2523` (Baseline Framework D) with `asset_class = legacy-asset-43` provides the asset class context.

**View `performance_report_benchmark_index_view`**

```sql
CREATE VIEW performance_report_benchmark_index_view AS
SELECT a.performance_report_id, a.report_date, a.period_start, a.period_end, b.benchmark_index_id AS index_benchmark_index_id, b.index_name AS index_index_name, b.index_ticker AS index_index_ticker
FROM performance_reports a JOIN benchmark_indexes b ON a.benchmark_index_id = b.benchmark_index_id;
```

| performance_report_id | report_date | period_start | period_end | index_benchmark_index_id | index_index_name | index_index_ticker |
|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 1 | Primary Initiative A | primary-index-94 |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 2 | Composite Model | adaptive-index-95 |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 3 | Compact Cluster | distributed-index-96 |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 4 | Legacy Review D | baseline-index-97 |

The `performance_report_benchmark_index_view` joins `performance_reports` to `benchmark_indexes` on `benchmark_index_id`, reconstructing the benchmark context for each performance report. A row for report with `alpha = 18.70` linked to index `Primary Initiative A` with `number_of_components = 41` provides the index structure context.

**View `performance_report_fund_manager_view`**

```sql
CREATE VIEW performance_report_fund_manager_view AS
SELECT a.performance_report_id, a.report_date, a.period_start, a.period_end, b.fund_manager_id AS manager_fund_manager_id, b.manager_identifier AS manager_manager_identifier, b.manager_name AS manager_manager_name
FROM performance_reports a JOIN fund_managers b ON a.fund_manager_id = b.fund_manager_id;
```

| performance_report_id | report_date | period_start | period_end | manager_fund_manager_id | manager_manager_identifier | manager_manager_name |
|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 1000 | MAN-2729 | Melissa Hernandez |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 1001 | MAN-2736 | Jorge Sullivan |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 1002 | MAN-2743 | Norma Fisher |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 1003 | MAN-2750 | Norma Fisher |

The `performance_report_fund_manager_view` joins `performance_reports` to `fund_managers` on `fund_manager_id`, reconstructing the manager context for each performance report. A row for report with `beta = 13.95` linked to manager *Melissa Hernandez* (`MAN-2729`) with `years_in_operation = 32` provides the manager experience context.

**View `asset_underlying_fund_view`**

```sql
CREATE VIEW asset_underlying_fund_view AS
SELECT a.asset_id, a.asset_identifier, a.asset_name, a.asset_type, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM assets a JOIN underlying_funds b ON a.underlying_fund_id = b.underlying_fund_id;
```

| asset_id | asset_identifier | asset_name | asset_type | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | pilot-asset-86 | 100 | UND-2523 | Baseline Framework D |
| 2 | ASS-2756 | Baseline Standard | extended-asset-87 | 101 | UND-2524 | Distributed Protocol |
| 3 | ASS-2760 | Distributed Framework A | integrated-asset-88 | 102 | UND-2525 | Adaptive Programme |
| 4 | ASS-2764 | Adaptive Protocol | seasonal-asset-89 | 103 | UND-2526 | Primary Standard A |

The `asset_underlying_fund_view` joins `assets` to `underlying_funds` on `underlying_fund_id`, reconstructing the underlying fund context for each asset. A row for asset `ASS-2752` (Pilot Programme) with `market_cap = 3.95` linked to underlying fund `UND-2523` (Baseline Framework D) with `geographic_focus = extended-geograph-99` provides the geographic context.

**View `asset_benchmark_index_view`**

```sql
CREATE VIEW asset_benchmark_index_view AS
SELECT a.asset_id, a.asset_identifier, a.asset_name, a.asset_type, b.benchmark_index_id AS index_benchmark_index_id, b.index_name AS index_index_name, b.index_ticker AS index_index_ticker
FROM assets a JOIN benchmark_indexes b ON a.benchmark_index_id = b.benchmark_index_id;
```

| asset_id | asset_identifier | asset_name | asset_type | index_benchmark_index_id | index_index_name | index_index_ticker |
|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | pilot-asset-86 | 1 | Primary Initiative A | primary-index-94 |
| 2 | ASS-2756 | Baseline Standard | extended-asset-87 | 2 | Composite Model | adaptive-index-95 |
| 3 | ASS-2760 | Distributed Framework A | integrated-asset-88 | 3 | Compact Cluster | distributed-index-96 |
| 4 | ASS-2764 | Adaptive Protocol | seasonal-asset-89 | 4 | Legacy Review D | baseline-index-97 |

The `asset_benchmark_index_view` joins `assets` to `benchmark_indexes` on `benchmark_index_id`, reconstructing the benchmark context for each asset. A row for asset `ASS-2756` (Baseline Standard) with `sector = distributed-sector-54` linked to index `Composite Model` (`adaptive-index-95`) with `weighting_scheme = primary-weightin-46` provides the weighting context.

**View `fund_manager_underlying_fund_detail_view`**

```sql
CREATE VIEW fund_manager_underlying_fund_detail_view AS
SELECT a.fund_manager_id, a.manager_identifier, a.manager_name, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM fund_managers a
  JOIN managers_funds j ON j.fund_manager_id = a.fund_manager_id
  JOIN underlying_funds b ON b.underlying_fund_id = j.underlying_fund_id;
```

| fund_manager_id | manager_identifier | manager_name | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | 100 | UND-2523 | Baseline Framework D |
| 1000 | MAN-2729 | Melissa Hernandez | 101 | UND-2524 | Distributed Protocol |
| 1001 | MAN-2736 | Jorge Sullivan | 101 | UND-2524 | Distributed Protocol |
| 1001 | MAN-2736 | Jorge Sullivan | 102 | UND-2525 | Adaptive Programme |
| 1002 | MAN-2743 | Norma Fisher | 102 | UND-2525 | Adaptive Programme |
| 1002 | MAN-2743 | Norma Fisher | 103 | UND-2526 | Primary Standard A |
| 1003 | MAN-2750 | Norma Fisher | 103 | UND-2526 | Primary Standard A |
| 1003 | MAN-2750 | Norma Fisher | 100 | UND-2523 | Baseline Framework D |

The `fund_manager_underlying_fund_detail_view` joins `fund_managers` to `underlying_funds` through the `managers_funds` junction table and the `funds` table, reconstructing the manager-to-underlying-fund relationship. A row for manager *Melissa Hernandez* (`MAN-2729`) with `total_a_u_m = 6.95` linked to underlying fund `UND-2523` (Baseline Framework D) with `manager_name = Extended Initiative` reveals the operational assignment.

**View `fund_manager_performance_report_detail_view`**

```sql
CREATE VIEW fund_manager_performance_report_detail_view AS
SELECT a.fund_manager_id, a.manager_identifier, a.manager_name, b.performance_report_id AS report_performance_report_id, b.report_date AS report_report_date, b.period_start AS report_period_start
FROM fund_managers a
  JOIN managers_reports j ON j.fund_manager_id = a.fund_manager_id
  JOIN performance_reports b ON b.performance_report_id = j.performance_report_id;
```

| fund_manager_id | manager_identifier | manager_name | report_performance_report_id | report_report_date | report_period_start |
|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | 1 | 2024-03-02T02:54:00 | 2023-10-27 |
| 1000 | MAN-2729 | Melissa Hernandez | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 1001 | MAN-2736 | Jorge Sullivan | 2 | 2025-08-13T09:11:00 | 2024-03-11 |
| 1001 | MAN-2736 | Jorge Sullivan | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 1002 | MAN-2743 | Norma Fisher | 3 | 2022-01-24T16:28:00 | 2025-08-22 |
| 1002 | MAN-2743 | Norma Fisher | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 1003 | MAN-2750 | Norma Fisher | 4 | 2023-06-08T23:45:00 | 2022-01-06 |
| 1003 | MAN-2750 | Norma Fisher | 1 | 2024-03-02T02:54:00 | 2023-10-27 |

The `fund_manager_performance_report_detail_view` joins `fund_managers` to `performance_reports` on `fund_manager_id`, reconstructing the performance history managed by each fund manager. A row for manager *Jorge Sullivan* (`MAN-2736`) with `years_in_operation = 40` linked to a report with `trailing_return = 22.40` and `sharpe_ratio = 13.90` quantifies the manager's track record.

**View `fund_manager_asset_detail_view`**

```sql
CREATE VIEW fund_manager_asset_detail_view AS
SELECT a.fund_manager_id, a.manager_identifier, a.manager_name, b.asset_id AS asset_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM fund_managers a
  JOIN managers_assets j ON j.fund_manager_id = a.fund_manager_id
  JOIN assets b ON b.asset_id = j.asset_id;
```

| fund_manager_id | manager_identifier | manager_name | asset_asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | 1 | ASS-2752 | Pilot Programme |
| 1000 | MAN-2729 | Melissa Hernandez | 2 | ASS-2756 | Baseline Standard |
| 1001 | MAN-2736 | Jorge Sullivan | 2 | ASS-2756 | Baseline Standard |
| 1001 | MAN-2736 | Jorge Sullivan | 3 | ASS-2760 | Distributed Framework A |
| 1002 | MAN-2743 | Norma Fisher | 3 | ASS-2760 | Distributed Framework A |
| 1002 | MAN-2743 | Norma Fisher | 4 | ASS-2764 | Adaptive Protocol |
| 1003 | MAN-2750 | Norma Fisher | 4 | ASS-2764 | Adaptive Protocol |
| 1003 | MAN-2750 | Norma Fisher | 1 | ASS-2752 | Pilot Programme |

The `fund_manager_asset_detail_view` joins `fund_managers` to `assets` through the `managers_assets` junction table, reconstructing the asset universe managed by each fund manager. A row for manager *Norma Fisher* (`MAN-2743`) with `headquarters_country = compact-headquar-44` linked to asset `ASS-2760` (Distributed Framework A) with `asset_type = integrated-asset-88` reveals the managed holdings.

**View `fund_manager_corporate_meeting_detail_view`**

```sql
CREATE VIEW fund_manager_corporate_meeting_detail_view AS
SELECT a.fund_manager_id, a.manager_identifier, a.manager_name, b.id AS meeting_id, b.meeting_identifier AS meeting_meeting_identifier, b.meeting_date AS meeting_meeting_date
FROM fund_managers a
  JOIN managers_meetings j ON j.fund_manager_id = a.fund_manager_id
  JOIN corporate_meetings b ON b.id = j.corporate_meeting_id;
```

| fund_manager_id | manager_identifier | manager_name | meeting_id | meeting_meeting_identifier | meeting_meeting_date |
|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | 1000 | MEE-2370 | 2023-10-23T21:39:00 |
| 1000 | MAN-2729 | Melissa Hernandez | 1001 | MEE-2377 | 2024-03-07T04:56:00 |
| 1001 | MAN-2736 | Jorge Sullivan | 1001 | MEE-2377 | 2024-03-07T04:56:00 |
| 1001 | MAN-2736 | Jorge Sullivan | 1002 | MEE-2384 | 2025-08-18T11:13:00 |
| 1002 | MAN-2743 | Norma Fisher | 1002 | MEE-2384 | 2025-08-18T11:13:00 |
| 1002 | MAN-2743 | Norma Fisher | 1003 | MEE-2391 | 2022-01-02T18:30:00 |
| 1003 | MAN-2750 | Norma Fisher | 1003 | MEE-2391 | 2022-01-02T18:30:00 |
| 1003 | MAN-2750 | Norma Fisher | 1000 | MEE-2370 | 2023-10-23T21:39:00 |

The `fund_manager_corporate_meeting_detail_view` joins `fund_managers` to `corporate_meetings` through the `managers_meetings` junction table, reconstructing the governance participation of each fund manager. A row for manager *Norma Fisher* (`MAN-2750`) with `regulatory_license = primary-regulato-28` linked to a corporate meeting at a specific `location` reveals the governance engagement.

**View `charitable_cause_fund_view`**

```sql
CREATE VIEW charitable_cause_fund_view AS
SELECT a.id, a.cause_identifier, a.cause_name, a.cause_category, b.fund_id AS fund_fund_id, b.fund_identifier AS fund_fund_identifier, b.fund_name AS fund_fund_name
FROM charitable_causes a JOIN funds b ON a.fund_id = b.fund_id;
```

| id | cause_identifier | cause_name | cause_category | fund_fund_id | fund_fund_identifier | fund_fund_name |
|---|---|---|---|---|---|---|
| 100 | CAU-2797 | Integrated Framework A | seasonal-cause-89 | 100 | FUN-2670 | Seasonal Programme |
| 101 | CAU-2803 | Extended Protocol | regional-cause-90 | 101 | FUN-2672 | Integrated Standard |
| 102 | CAU-2809 | Pilot Programme | legacy-cause-91 | 102 | FUN-2674 | Extended Framework D |
| 103 | CAU-2815 | Baseline Standard D | compact-cause-92 | 103 | FUN-2676 | Pilot Protocol |

The `charitable_cause_fund_view` joins `charitable_causes` to `funds` on `charitable_cause_id`, reconstructing the fund-level context for each charitable cause. A row for a charitable cause linked to fund `FUN-2672` (Integrated Standard) with `charitable_donation_status = true` and `management_fee_rate = 0.12` demonstrates the fee-structure alignment with charitable commitments.

**View `charitable_cause_underlying_fund_view`**

```sql
CREATE VIEW charitable_cause_underlying_fund_view AS
SELECT a.id, a.cause_identifier, a.cause_name, a.cause_category, b.underlying_fund_id AS fund_underlying_fund_id, b.underlying_fund_identifier AS fund_underlying_fund_identifier, b.underlying_fund_name AS fund_underlying_fund_name
FROM charitable_causes a JOIN underlying_funds b ON a.underlying_fund_id = b.underlying_fund_id;
```

| id | cause_identifier | cause_name | cause_category | fund_underlying_fund_id | fund_underlying_fund_identifier | fund_underlying_fund_name |
|---|---|---|---|---|---|---|
| 100 | CAU-2797 | Integrated Framework A | seasonal-cause-89 | 100 | UND-2523 | Baseline Framework D |
| 101 | CAU-2803 | Extended Protocol | regional-cause-90 | 101 | UND-2524 | Distributed Protocol |
| 102 | CAU-2809 | Pilot Programme | legacy-cause-91 | 102 | UND-2525 | Adaptive Programme |
| 103 | CAU-2815 | Baseline Standard D | compact-cause-92 | 103 | UND-2526 | Primary Standard A |

The `charitable_cause_underlying_fund_view` joins `charitable_causes` to `underlying_funds` through the `funds` table, reconstructing the underlying fund context for each charitable cause. A row for a charitable cause linked to underlying fund `UND-2524` (Distributed Protocol) with `investment_strategy = integrated-investme-94` reveals the strategy-cause alignment.

**View `corporate_meeting_fund_manager_view`**

```sql
CREATE VIEW corporate_meeting_fund_manager_view AS
SELECT a.id, a.meeting_identifier, a.meeting_date, a.meeting_type, b.fund_manager_id AS manager_fund_manager_id, b.manager_identifier AS manager_manager_identifier, b.manager_name AS manager_manager_name
FROM corporate_meetings a JOIN fund_managers b ON a.fund_manager_id = b.fund_manager_id;
```

| id | meeting_identifier | meeting_date | meeting_type | manager_fund_manager_id | manager_manager_identifier | manager_manager_name |
|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | 2023-10-23T21:39:00 | integrated-meeting-70 | 1000 | MAN-2729 | Melissa Hernandez |
| 1001 | MEE-2377 | 2024-03-07T04:56:00 | seasonal-meeting-71 | 1001 | MAN-2736 | Jorge Sullivan |
| 1002 | MEE-2384 | 2025-08-18T11:13:00 | regional-meeting-72 | 1002 | MAN-2743 | Norma Fisher |
| 1003 | MEE-2391 | 2022-01-02T18:30:00 | legacy-meeting-73 | 1003 | MAN-2750 | Norma Fisher |

The `corporate_meeting_fund_manager_view` joins `corporate_meetings` to `fund_managers` on `fund_manager_id`, reconstructing the manager context for each corporate meeting. A row for a meeting linked to manager *Melissa Hernandez* (`MAN-2729`) with `manager_name = Melissa Hernandez` and `regulatory_license = legacy-regulato-25` provides the regulatory context.

**View `corporate_meeting_asset_view`**

```sql
CREATE VIEW corporate_meeting_asset_view AS
SELECT a.id, a.meeting_identifier, a.meeting_date, a.meeting_type, b.asset_id AS asset_asset_id, b.asset_identifier AS asset_asset_identifier, b.asset_name AS asset_asset_name
FROM corporate_meetings a JOIN assets b ON a.asset_id = b.asset_id;
```

| id | meeting_identifier | meeting_date | meeting_type | asset_asset_id | asset_asset_identifier | asset_asset_name |
|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | 2023-10-23T21:39:00 | integrated-meeting-70 | 1 | ASS-2752 | Pilot Programme |
| 1001 | MEE-2377 | 2024-03-07T04:56:00 | seasonal-meeting-71 | 2 | ASS-2756 | Baseline Standard |
| 1002 | MEE-2384 | 2025-08-18T11:13:00 | regional-meeting-72 | 3 | ASS-2760 | Distributed Framework A |
| 1003 | MEE-2391 | 2022-01-02T18:30:00 | legacy-meeting-73 | 4 | ASS-2764 | Adaptive Protocol |

The `corporate_meeting_asset_view` joins `corporate_meetings` to `assets` through the `managers_assets` and `managers_meetings` junction tables, reconstructing the asset context for each corporate meeting. A row for a meeting linked to asset `ASS-2752` (Pilot Programme) with `market_cap = 3.95` and `sector = adaptive-sector-53` reveals the asset-level governance topics.

The relational materialization of this fund management ontology demonstrates a disciplined normalization strategy: entity types are captured in base tables with surrogate keys and descriptive attributes, cardinality-bounded relationships are expressed through foreign keys embedded in the referencing table, and many-to-many relationships are resolved through explicit junction tables. Views then denormalize along specific analytical axes, joining the normalized tables to reconstruct domain facts for reporting and analysis. This separation of concerns between the normalized schema and the denormalized views enables both data integrity at the storage layer and flexible query patterns at the presentation layer, embodying the principle that the schema captures what the domain is, while the views answer what the domain does.