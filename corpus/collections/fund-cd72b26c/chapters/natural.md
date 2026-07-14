## Investment Fund Ecosystems: Structure, Performance, and Governance

The modern investment landscape is built upon layered fund structures where parent funds delegate capital to underlying vehicles, each tracked against benchmark indexes and measured through standardized performance reports. Fund managers operate across this hierarchy, overseeing assets that span equity, fixed-income, and hybrid classifications while navigating regulatory requirements and corporate governance obligations. Charitable causes represent an increasingly formalized dimension of fund operations, with donation commitments embedded directly into fund mandates. This chapter documents the operational architecture of such systems, tracing how records flow from inception through performance measurement to governance review.

At the core of the structure are the parent funds, which serve as the primary investment vehicles. Each fund carries a unique identifier, a descriptive name, and an inception date that anchors its lifecycle. The Seasonal Programme (FUN-2670), for instance, began operations on 2024-07-19 as a seasonal-fund-59 classification with 13.95 million in assets under management, a management fee rate of 29.43 percent, and a performance fee rate of 10.72 percent. Its charitable donation status is set to false, and it references benchmark index 1 and charitable cause 100. The Integrated Standard (FUN-2672), launched 2025-12-03 as a regional-fund-60, holds 16.90 million in assets with notably lower fee rates of 0.12 percent and 0.37 percent, and carries a true charitable donation status tied to benchmark index 2 and charitable cause 101.

**Table `funds`**

| fund_id | fund_identifier | fund_name | inception_date | fund_class | total_assets_under_management | management_fee_rate | performance_fee_rate | charitable_donation_status | benchmark_index_id | charitable_cause_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | FUN-2670 | Seasonal Programme | 2024-07-19 | seasonal-fund-59 | 13.95 | 29.43 | 10.72 | false | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | FUN-2672 | Integrated Standard | 2025-12-03 | regional-fund-60 | 16.90 | 0.12 | 0.37 | true | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | FUN-2674 | Extended Framework D | 2022-05-14 | legacy-fund-61 | 19.85 | 89.53 | 9.54 | false | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | FUN-2676 | Pilot Protocol | 2023-10-25 | compact-fund-62 | 22.80 | 14.31 | 89.53 | true | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Parent funds do not operate in isolation. They delegate investment decisions to underlying funds, which carry their own management and performance fee waivers, distinct investment strategies, and geographic focus areas. The Baseline Framework D (UND-2523) operates under Extended Initiative as its manager, employs an extended-investme-93 strategy with an extended-geograph-99 geographic focus, and holds legacy-asset-43 as its asset class. Both its management and performance fees are waived, and it is linked to parent fund 100 and benchmark index 1. In contrast, the Distributed Protocol (UND-2524) under Pilot Model A retains both fee structures, follows an integrated-investme-94 strategy within an integrated-geograph-100 scope, and manages compact-asset-44 holdings.

**Table `underlying_funds`**

| underlying_fund_id | underlying_fund_identifier | underlying_fund_name | management_fee_waived | performance_fee_waived | investment_strategy | geographic_focus | asset_class | manager_name | fund_id | benchmark_index_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | UND-2523 | Baseline Framework D | true | true | extended-investme-93 | extended-geograph-99 | legacy-asset-43 | Extended Initiative | 100 | 1 |
| 101 | UND-2524 | Distributed Protocol | false | false | integrated-investme-94 | integrated-geograph-100 | compact-asset-44 | Pilot Model A | 101 | 2 |
| 102 | UND-2525 | Adaptive Programme | true | true | seasonal-investme-95 | seasonal-geograph-101 | composite-asset-45 | Baseline Cluster | 102 | 3 |
| 103 | UND-2526 | Primary Standard A | false | false | regional-investme-96 | regional-geograph-102 | primary-asset-46 | Distributed Review | 103 | 4 |

Benchmark indexes provide the performance yardsticks against which both parent and underlying funds are measured. Each index carries a name, ticker, type, and currency denomination, along with rebalancing frequency, weighting scheme, and the number of components it tracks. The Primary Initiative A (primary-index-94) is classified as a regional-index-84, denominated in seasonal-currency-71, rebalanced on a compact-rebalanc-26 schedule, and uses a composite-weightin-45 scheme across 41 components. It is not hedged and serves both parent fund 100 and underlying fund 100. The Composite Model (adaptive-index-95), by contrast, is a legacy-index-85 in regional-currency-72 with 49 components, a primary-weightin-46 weighting scheme, and is hedged, supporting parent fund 101 and underlying fund 101.

**Table `benchmark_indexes`**

| benchmark_index_id | index_name | index_ticker | index_type | currency | rebalancing_frequency | weighting_scheme | number_of_components | is_hedged | fund_id | underlying_fund_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | primary-index-94 | regional-index-84 | seasonal-currency-71 | compact-rebalanc-26 | composite-weightin-45 | 41 | false | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Composite Model | adaptive-index-95 | legacy-index-85 | regional-currency-72 | composite-rebalanc-27 | primary-weightin-46 | 49 | true | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Compact Cluster | distributed-index-96 | compact-index-86 | legacy-currency-73 | primary-rebalanc-28 | adaptive-weightin-47 | 57 | false | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Legacy Review D | baseline-index-97 | composite-index-87 | compact-currency-74 | adaptive-rebalanc-29 | distributed-weightin-48 | 65 | true | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Performance reports capture the quantitative outcomes of fund operations over defined periods. Each report spans a period from a start date to an end date and records trailing return, benchmark return, standard deviation, Sharpe ratio, alpha, and beta. Report 1, dated 2024-03-02T02:54:00, covers the period from 2023-10-27 to 2022-01-24 and shows a trailing return of 18.70 against a benchmark return of 15.70, with a Sharpe ratio of 10.45 and alpha of 18.70. This report is classified as an extended-report-93 and is associated with parent fund 100, underlying fund 100, benchmark index 1, and fund manager 1000. Report 4, dated 2023-06-08T23:45:00, records a trailing return of 29.80 versus a benchmark return of 26.80, with a Sharpe ratio of 20.80 and alpha of 32.80, linking parent fund 103, underlying fund 103, benchmark index 4, and fund manager 1003.

**Table `performance_reports`**

| performance_report_id | report_date | period_start | period_end | trailing_return | benchmark_return | standard_deviation | sharpe_ratio | alpha | beta | report_type | fund_id | underlying_fund_id | benchmark_index_id | fund_manager_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2024-03-02T02:54:00 | 2023-10-27 | 2022-01-24 | 18.70 | 15.70 | 18.20 | 10.45 | 18.70 | 13.95 | extended-report-93 | 100 | 100 | 1 | 1000 |
| 2 | 2025-08-13T09:11:00 | 2024-03-11 | 2023-06-08 | 22.40 | 19.40 | 22.40 | 13.90 | 23.40 | 16.90 | integrated-report-94 | 101 | 101 | 2 | 1001 |
| 3 | 2022-01-24T16:28:00 | 2025-08-22 | 2024-11-19 | 26.10 | 23.10 | 26.60 | 17.35 | 28.10 | 19.85 | seasonal-report-95 | 102 | 102 | 3 | 1002 |
| 4 | 2023-06-08T23:45:00 | 2022-01-06 | 2025-04-03 | 29.80 | 26.80 | 30.80 | 20.80 | 32.80 | 22.80 | regional-report-96 | 103 | 103 | 4 | 1003 |

Assets represent the individual holdings within the fund ecosystem. Each asset has a type classification, market capitalization, sector, country of incorporation, and currency denomination, along with boolean flags indicating whether it is equity or fixed income. The Pilot Programme (ASS-2752) is classified as a pilot-asset-86 with a market cap of 3.95, operates in the adaptive-sector-53, is incorporated in adaptive-country-11, and is denominated in primary-currency-16. It is neither equity nor fixed income and is held by underlying fund 100 and benchmark index 1. The Adaptive Protocol (ASS-2764), by contrast, is a seasonal-asset-89 with a market cap of 9.80 in the pilot-sector-56, incorporated in pilot-country-14, denominated in baseline-currency-19, and carries both equity and fixed-income flags, held by underlying fund 103 and benchmark index 4.

**Table `assets`**

| asset_id | asset_identifier | asset_name | asset_type | market_cap | sector | country_of_incorporation | currency_denomination | is_equity | is_fixed_income | underlying_fund_id | benchmark_index_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2752 | Pilot Programme | pilot-asset-86 | 3.95 | adaptive-sector-53 | adaptive-country-11 | primary-currency-16 | false | false | 100 | 1 |
| 2 | ASS-2756 | Baseline Standard | extended-asset-87 | 5.90 | distributed-sector-54 | distributed-country-12 | adaptive-currency-17 | true | true | 101 | 2 |
| 3 | ASS-2760 | Distributed Framework A | integrated-asset-88 | 7.85 | baseline-sector-55 | baseline-country-13 | distributed-currency-18 | false | false | 102 | 3 |
| 4 | ASS-2764 | Adaptive Protocol | seasonal-asset-89 | 9.80 | pilot-sector-56 | pilot-country-14 | baseline-currency-19 | true | true | 103 | 4 |

Fund managers are the human operators at the center of this structure. Each manager has a regulatory license, headquarters country, total assets under management, and years in operation. Melissa Hernandez (MAN-2729) holds a legacy-regulato-25 license, is headquartered in regional-headquar-42, manages 6.95 million in assets, has been in operation for 32 years, and has both management and performance fees waived. Norma Fisher (MAN-2743) holds a composite-regulato-27 license from compact-headquar-44, manages 10.85 million, has operated for 48 years, and also has both fee waivers. Norma Fisher appears again as MAN-2750 with a primary-regulato-28 license from composite-headquar-45, managing 12.80 million over 56 years with no fee waivers.

**Table `fund_managers`**

| fund_manager_id | manager_identifier | manager_name | regulatory_license | management_fee_waived | performance_fee_waived | headquarters_country | total_a_u_m | years_in_operation |
|---|---|---|---|---|---|---|---|---|
| 1000 | MAN-2729 | Melissa Hernandez | legacy-regulato-25 | true | true | regional-headquar-42 | 6.95 | 32 |
| 1001 | MAN-2736 | Jorge Sullivan | compact-regulato-26 | false | false | legacy-headquar-43 | 8.90 | 40 |
| 1002 | MAN-2743 | Norma Fisher | composite-regulato-27 | true | true | compact-headquar-44 | 10.85 | 48 |
| 1003 | MAN-2750 | Norma Fisher | primary-regulato-28 | false | false | composite-headquar-45 | 12.80 | 56 |

Charitable causes and corporate meetings form the governance and social responsibility layers of the ecosystem. Charitable causes are linked to funds at both the parent and underlying levels, while corporate meetings serve as the governance mechanism through which fund managers exercise oversight. The specific charitable causes and meeting records are catalogued in their respective tables, establishing the compliance and social impact dimensions that accompany financial performance.

**Table `charitable_causes`**

| id | cause_identifier | cause_name | cause_category | total_donations_received | donation_frequency | next_donation_date | tax_exempt_status | geographic_focus | fund_id | underlying_fund_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | CAU-2797 | Integrated Framework A | seasonal-cause-89 | 8.45 | primary-donation-46 | 2022-09-13 | false | extended-geograph-99 | 100 | 100 |
| 101 | CAU-2803 | Extended Protocol | regional-cause-90 | 11.90 | adaptive-donation-47 | 2023-02-24 | true | integrated-geograph-100 | 101 | 101 |
| 102 | CAU-2809 | Pilot Programme | legacy-cause-91 | 15.35 | distributed-donation-48 | 2024-07-08 | false | seasonal-geograph-101 | 102 | 102 |
| 103 | CAU-2815 | Baseline Standard D | compact-cause-92 | 18.80 | baseline-donation-49 | 2025-12-19 | true | regional-geograph-102 | 103 | 103 |

**Table `corporate_meetings`**

| id | meeting_identifier | meeting_date | meeting_type | participants_count | meeting_outcome | is_confidential | meeting_duration_minutes | location | fund_manager_id | asset_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | 2023-10-23T21:39:00 | integrated-meeting-70 | 25 | composite-meeting-21 | false | 31 | extended-location-99 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | MEE-2377 | 2024-03-07T04:56:00 | seasonal-meeting-71 | 9 | primary-meeting-22 | true | 37 | integrated-location-100 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | MEE-2384 | 2025-08-18T11:13:00 | regional-meeting-72 | 27 | adaptive-meeting-23 | false | 43 | seasonal-location-101 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | MEE-2391 | 2022-01-02T18:30:00 | legacy-meeting-73 | 45 | distributed-meeting-24 | true | 49 | regional-location-102 | 1003 | 4 | 2025-04-16 09:14:00 |

The relational structure extends beyond base tables through a series of junction tables that capture many-to-many relationships. The funds_funds table records parent-to-parent fund relationships, while funds_reports and funds_assets link parent funds to their performance reports and asset holdings. The indexes_assets table connects benchmark indexes to the assets they track, and the managers_funds, managers_reports, and managers_assets tables establish the operational relationships between fund managers and the funds, reports, and assets they oversee. The managers_meetings table records the governance meetings convened by fund managers.

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

The view layer synthesizes these base tables and junction records into analytical perspectives that answer specific operational questions. The fund_underlying_fund_detail_view joins parent funds with their underlying fund allocations, revealing which underlying vehicles each parent fund deploys. The fund_benchmark_index_view maps parent funds to their benchmark indexes, showing the performance yardsticks against which each fund is measured. The fund_performance_report_detail_view connects parent funds to their performance reports, providing a complete picture of returns, risk metrics, and manager attribution.

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

The fund_charitable_cause_view links parent funds to their designated charitable causes, making the social impact commitments of each fund explicit. This view is essential for compliance reporting and stakeholder communication regarding donation obligations.

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

From the underlying fund perspective, the underlying_fund_fund_view reverses the parent-to-child relationship, showing which parent funds each underlying fund serves. The underlying_fund_asset_detail_view connects underlying funds to their asset holdings, revealing the composition of each underlying vehicle. The underlying_fund_benchmark_index_view maps underlying funds to their benchmark indexes, and the underlying_fund_performance_report_detail_view ties underlying funds to their performance reports.

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

Benchmark indexes are similarly enriched through their own views. The benchmark_index_asset_detail_view shows which assets are tracked by each index, providing transparency into index composition. The benchmark_index_fund_view maps indexes to the parent funds that use them as benchmarks, and the benchmark_index_underlying_fund_view maps indexes to the underlying funds that reference them.

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

Performance reports gain context through their associated views. The performance_report_fund_view links reports to their parent funds, the performance_report_underlying_fund_view links them to underlying funds, and the performance_report_benchmark_index_view links them to the benchmark indexes used for comparison. The performance_report_fund_manager_view connects reports to the fund managers responsible for the performance, enabling attribution analysis.

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

Assets are contextualized through the asset_underlying_fund_view, which shows which underlying fund holds each asset, and the asset_benchmark_index_view, which shows which benchmark index tracks each asset. These views are critical for understanding asset allocation and index replication.

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

Fund managers are the most heavily connected entities in the ecosystem. The fund_manager_underlying_fund_detail_view shows which underlying funds each manager oversees. The fund_manager_performance_report_detail_view links managers to the performance reports they are attributed to, enabling performance attribution. The fund_manager_asset_detail_view shows which assets each manager has influence over, and the fund_manager_corporate_meeting_detail_view connects managers to the corporate meetings they convene or attend.

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

Charitable causes are made visible through the charitable_cause_fund_view, which shows which parent funds are committed to each cause, and the charitable_cause_underlying_fund_view, which shows which underlying funds contribute to each cause. These views support impact reporting and regulatory disclosure.

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

Corporate meetings are documented through the corporate_meeting_fund_manager_view, which shows which fund managers participate in each meeting, and the corporate_meeting_asset_view, which shows which assets are discussed or decided upon in each meeting. These views provide the governance audit trail.

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

The investment fund ecosystem described here operates as an interconnected system of financial vehicles, performance measurements, and governance mechanisms. Parent funds delegate to underlying funds, which hold assets tracked against benchmark indexes, with performance reported through standardized metrics and attributed to fund managers who govern through corporate meetings and commit to charitable causes. The junction tables capture the many-to-many relationships that make this ecosystem flexible, while the views provide the analytical lenses through which practitioners assess allocation, performance, risk, and compliance. Every record—from the inception date of the Seasonal Programme to the Sharpe ratio of its performance report—serves as a data point in the continuous evaluation of capital deployment and stewardship.