The domain under examination is a commodity and trade analytics platform, where production volumes, survey reports, price forecasts, trade transactions, and asset divestments are tracked across geographic regions, institutions, and companies. At its core, the schema separates *what* was produced or traded from *who* produced it, *where* it occurred, and *when* it was recorded. This separation is achieved through a set of ten base tables that store atomic facts, a set of six junction tables that resolve many-to-many relationships, and a suite of twelve views that reconstruct domain-level narratives by joining these normalized pieces back together.

## Base Tables: Atomic Facts and Reference Entities

The foundation of the schema consists of ten base tables, each capturing a distinct entity type or reference concept. The table `` stores production events as atomic rows, each identified by a surrogate `id` and a business-level `record_id` such as `10449530` or `20743593`. A production record carries a `volume` (e.g., `9.45` or `16.80`), a `unit` of measure (e.g., `distributed-unit-18` or `baseline-unit-19`), and a temporal window defined by `start_date` and `end_date` timestamps like `2022-09-05T20:24:00` and `2022-09-01T08:00:00`. The `source` column records provenance strings such as `seasonal-source-65` or `compact-source-68`. Two foreign-key columns, `survey_report_id` and `geographic_region_id`, anchor each production record to its originating survey report and its location, respectively.

The table `` holds the survey reports that serve as the authoritative provenance for production records. Each report has a surrogate `id` (e.g., `1000` through `1003`), a human-readable `report_id` like `1202-0008-S` or `L355`, a `publisher` name such as `pilot-publishe-50` or `seasonal-publishe-53`, a `publication_date`, a `report_type` (e.g., `extended-report-93` or `seasonal-report-95`), a `period_covered` descriptor, and a `created_at` timestamp. The `survey_report_id` in `prod_production_records` references this table's surrogate `id`, establishing a one-to-many relationship: a single survey report can underlie multiple production records.

The table `` captures price forecasts issued by institutions for specific commodities. Each row carries a surrogate `id` (e.g., `100` through `103`), a `forecast_id` such as `7119771` or `2b2bb518-8fcd-11eb-924d-9cd76263cbd0`, a `target_price` (e.g., `35.57` or `12.34`), a `currency` code like `seasonal-currency-71`, a `year` (e.g., `12` or `39`), a `commodity` name, an `issuing_body` string, and two foreign keys: `institution_id` and `commodity_id`. The `created_at` and `updated_at` timestamps track the forecast's lifecycle.

The table `` is a reference table of forecasting institutions. Each row has an `institution_id` (e.g., `9424913` or `884346`), a `name` such as `Extended Review` or `Distributed Cluster`, a `type` descriptor like `composite-type-69`, a `headquarters` location, and a `created_at` timestamp. The `institution_id` is the natural key referenced by `prod_price_forecasts.institution_id`.

The table `` is the companion reference table for commodities. Each row has a `commodity_id` (e.g., `790492` or `2986241`), a `name` (e.g., `Extended Review` or `Distributed Cluster`), a `type` (e.g., `composite-type-69`), and a `unit_of_measure` (e.g., `composite-unit-69`). The `commodity_id` is the natural key referenced by `prod_price_forecasts.commodity_id`.

The table `` records trade events. Each row has a surrogate `id`, a `transaction_id` (e.g., `937738` or `9085243`), a `volume` (e.g., `9.45` or `16.80`), a `unit`, a `date` timestamp, a `direction` code (e.g., `primary-directio-88`), a `status` (e.g., `regional-status-84`), and three foreign keys: `geographic_region_id`, `involves_importer_geographic_region_id`, and `commodity_id`. The dual geographic-region columns allow a single trade transaction to express both an origin and an importer region.

The table `` stores geographic region reference data. Each row has a surrogate `id` (e.g., `1` through `4`), a `name`, a `type`, a `parent_region_id` for hierarchical nesting, and a `created_at` timestamp. This table is referenced by both `prod_production_records.geographic_region_id` and `prod_trade_transactions.geographic_region_id` and `involves_importer_geographic_region_id`.

The table `` captures divestment events. Each row has a surrogate `id`, a `divestment_id`, a `divestment_date`, a `divestment_type` (e.g., `divestment-type-100`), a `status` (e.g., `divestment-status-100`), a `divestment_value`, and a `created_at` timestamp. This table participates in many-to-many relationships with companies and land parcels through junction tables.

The table `` is a reference table of companies. Each row has a `company_id` (e.g., `1000000` or `4000000`), a `name` (e.g., `Company Alpha` or `Company Delta`), a `type` (e.g., `company-type-100`), a `country`, and a `created_at` timestamp.

The table `` stores land parcel reference data. Each row has a `parcel_id` (e.g., `1000000` or `4000000`), a `name` (e.g., `Parcel Alpha` or `Parcel Delta`), a `size`, a `location`, and a `created_at` timestamp.

## Junction Tables: Resolving Many-to-Many Relationships

The schema uses six junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The table `` links survey reports to production records, allowing a single survey report to be associated with multiple production records and vice versa. The table `` links institutions to price forecasts, enabling an institution to issue forecasts for multiple commodities and a commodity to be forecasted by multiple institutions. The table `` provides an alternative or complementary linkage between commodities and price forecasts.

The table `` links geographic regions to trade transactions, supporting the many-to-many relationship between regions and the trades that occur within or involve them. The table `` links geographic regions to production records, providing an alternative or complementary linkage to the direct foreign key in `prod_production_records`.

The table `` links asset divestments to land parcels, the table `` links companies to asset divestments, and the table `` links land parcels to asset divestments. Together, these three junction tables form a triangle of many-to-many relationships: a company can divest multiple land parcels, a land parcel can be divested by multiple companies, and each divestment event is a distinct fact that ties a specific company to a specific parcel at a specific time.

## Views: Reconstructing Domain Facts

The views in this schema serve as denormalized lenses that reconstruct domain-level facts from the normalized base tables and junction tables. Each view answers a specific analytical question by joining the relevant tables.

The view `` joins `prod_production_records` with `prod_survey_reports` on the `survey_report_id` foreign key, producing a single row per production record that includes the survey report's `report_id`, `publisher`, `publication_date`, and `report_type`. For example, the production record with `record_id` `10449530` and `volume` `9.45` is joined to the survey report with `report_id` `1202-0008-S` published by `pilot-publishe-50`, answering the question: "What survey report underlies this production record?"

The view `` joins `prod_production_records` with `prod_geographic_regions` on `geographic_region_id`, producing a row that includes the region's `name`, `type`, and `parent_region_id`. The production record with `record_id` `10449530` and `geographic_region_id` `1` is joined to the geographic region with `id` `1`, answering: "In which geographic region did this production occur?"

The view `` performs the inverse join of `vw_production_record_survey_report`, starting from `prod_survey_reports` and joining to `prod_production_records`. It answers the question: "Which production records are associated with this survey report?" For the survey report with `report_id` `1202-0008-S` and `publisher` `pilot-publishe-50`, the view would surface the production record with `record_id` `10449530` and `volume` `9.45`.

The view `` joins `prod_price_forecasts` with `prod_institutions` on `institution_id`, producing a row that includes the institution's `name`, `type`, and `headquarters`. The price forecast with `forecast_id` `7119771` and `target_price` `35.57` is joined to the institution named `Extended Review` with `type` `composite-type-69` and `headquarters` `composite-headquar-81`, answering: "Which institution issued this price forecast?"

The view `` joins `prod_price_forecasts` with `prod_commodities` on `commodity_id`, producing a row that includes the commodity's `name`, `type`, and `unit_of_measure`. The price forecast with `forecast_id` `7119771` and `commodity` `legacy-commodit-19` is joined to the commodity with `commodity_id` `790492` and `name` `Extended Review` and `unit_of_measure` `composite-unit-69`, answering: "Which commodity is this price forecast for?"

The view `` performs the inverse join of `vw_price_forecast_institution`, starting from `prod_institutions` and joining to `prod_price_forecasts`. It answers: "What price forecasts has this institution issued?" For the institution named `Extended Review` with `institution_id` `9424913`, the view would surface the price forecast with `forecast_id` `7119771` and `target_price` `35.57`.

The view `` performs the inverse join of `vw_price_forecast_commodity`, starting from `prod_commodities` and joining to `prod_price_forecasts`. It answers: "What price forecasts have been issued for this commodity?" For the commodity with `commodity_id` `790492` and `name` `Extended Review`, the view would surface the price forecast with `forecast_id` `7119771` and `target_price` `35.57`.

The view `` joins `prod_trade_transactions` with `prod_geographic_regions` on `geographic_region_id`, producing a row that includes the region's `name`, `type`, and `parent_region_id`. The trade transaction with `transaction_id` `937738` and `volume` `9.45` and `geographic_region_id` `1` is joined to the geographic region with `id` `1`, answering: "In which geographic region did this trade transaction occur?"

The view `` joins `prod_trade_transactions` with `prod_commodities` on `commodity_id`, producing a row that includes the commodity's `name`, `type`, and `unit_of_measure`. The trade transaction with `transaction_id` `937738` and `commodity_id` `790492` is joined to the commodity with `name` `Extended Review` and `unit_of_measure` `composite-unit-69`, answering: "Which commodity was traded in this transaction?"

The view `` performs the inverse join of `vw_trade_transaction_geographic_region`, starting from `prod_geographic_regions` and joining to `prod_trade_transactions`. It answers: "What trade transactions occurred in this geographic region?" For the geographic region with `id` `1`, the view would surface the trade transaction with `transaction_id` `937738` and `volume` `9.45`.

The view `` performs the inverse join of `vw_production_record_geographic_region`, starting from `prod_geographic_regions` and joining to `prod_production_records`. It answers: "What production records were recorded in this geographic region?" For the geographic region with `id` `1`, the view would surface the production record with `record_id` `10449530` and `volume` `9.45`.

The view `` joins `prod_asset_divestments` with `prod_companies` through the junction table `prod_companiesAssetDivestment`, producing a row that includes the company's `name`, `type`, and `country`. This view answers: "Which company is associated with this asset divestment?"

The view `` joins `prod_asset_divestments` with `prod_land_parcels` through the junction table `prod_asset_divestmentsLandParcel`, producing a row that includes the land parcel's `name`, `size`, and `location`. This view answers: "Which land parcel is associated with this asset divestment?"

The view `` joins `prod_companies` with `prod_asset_divestments` through the junction table `prod_companiesAssetDivestment`, producing a row that includes the divestment's `divestment_id`, `divestment_date`, `divestment_type`, `status`, and `divestment_value`. For a company with `company_id` `1000000` and `name` `Company Alpha`, the view would surface the associated divestment details, answering: "What asset divestments has this company executed?"

The view `` joins `prod_land_parcels` with `prod_asset_divestments` through the junction table `prod_land_parcelsAssetDivestment`, producing a row that includes the divestment's `divestment_id`, `divestment_date`, `divestment_type`, `status`, and `divestment_value`. For a land parcel with `parcel_id` `1000000` and `name` `Parcel Alpha`, the view would surface the associated divestment details, answering: "What asset divestments have affected this land parcel?"

## Synthesis

The schema follows a disciplined normalization pattern: base tables store atomic facts with surrogate primary keys and natural foreign keys, junction tables resolve many-to-many relationships that cannot be expressed through direct foreign keys, and views reconstruct domain-level narratives by joining these pieces back together. The production records, survey reports, price forecasts, trade transactions, and asset divestments each form a fact table anchored by surrogate identifiers and linked to reference entities through foreign keys. The junction tables for survey reports and production records, institutions and price forecasts, commodities and price forecasts, geographic regions and trade transactions, geographic regions and production records, and asset divestments with companies and land parcels ensure that the schema can express the full complexity of the domain without redundancy. The views then provide denormalized access patterns that answer specific analytical questions by joining the normalized tables, allowing analysts to query domain facts without needing to understand the underlying join paths. This separation of storage from access is a hallmark of well-designed analytical schemas, where the base tables capture the truth of the domain and the views provide the lenses through which that truth is understood.

## Data appendix

**Table `prod_production_records`**

| id | record_id | volume | unit | start_date | end_date | source | survey_report_id | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 9.45 | distributed-unit-18 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-source-65 | 1000 | 1 |
| 2 | 10445619 | 11.90 | baseline-unit-19 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-source-66 | 1001 | 2 |
| 3 | 9568457 | 14.35 | pilot-unit-20 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-source-67 | 1002 | 3 |
| 4 | 20743593 | 16.80 | extended-unit-21 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-source-68 | 1003 | 4 |

**Table `prod_survey_reports`**

| id | report_id | publisher | publication_date | report_type | period_covered | created_at |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | pilot-publishe-50 | 2025-12-01T23:33:00 | extended-report-93 | compact-period-14 | 2025-01-01 00:14:00 |
| 1001 | 8189500 | extended-publishe-51 | 2022-05-12T06:50:00 | integrated-report-94 | composite-period-15 | 2025-02-06 03:14:00 |
| 1002 | L355 | integrated-publishe-52 | 2023-10-23T13:07:00 | seasonal-report-95 | primary-period-16 | 2025-03-11 06:14:00 |
| 1003 | 5844272 | seasonal-publishe-53 | 2024-03-07T20:24:00 | regional-report-96 | adaptive-period-17 | 2025-04-16 09:14:00 |

**Table `prod_price_forecasts`**

| id | forecast_id | target_price | currency | year | commodity | issuing_body | institution_id | commodity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 7119771 | 35.57 | seasonal-currency-71 | 12 | legacy-commodit-19 | baseline-issuing-13 | 9424913 | 790492 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 3012834 | 20.14 | regional-currency-72 | 21 | compact-commodit-20 | pilot-issuing-14 | 8189481 | 5844256 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 | legacy-currency-73 | 30 | composite-commodit-21 | extended-issuing-15 | 1437604 | 3355768 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 13219 | 14.58 | compact-currency-74 | 39 | primary-commodit-22 | integrated-issuing-16 | 884346 | 2986241 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `prod_institutions`**

| institution_id | name | type | headquarters | created_at |
|---|---|---|---|---|
| 9424913 | Extended Review | composite-type-69 | composite-headquar-81 | 2025-01-01 00:14:00 |
| 8189481 | Pilot Initiative A | primary-type-70 | primary-headquar-82 | 2025-02-06 03:14:00 |
| 1437604 | Baseline Model | adaptive-type-71 | adaptive-headquar-83 | 2025-03-11 06:14:00 |
| 884346 | Distributed Cluster | distributed-type-72 | distributed-headquar-84 | 2025-04-16 09:14:00 |

**Table `prod_commodities`**

| commodity_id | name | type | unit_of_measure |
|---|---|---|---|
| 790492 | Extended Review | composite-type-69 | composite-unit-69 |
| 5844256 | Pilot Initiative A | primary-type-70 | primary-unit-70 |
| 3355768 | Baseline Model | adaptive-type-71 | adaptive-unit-71 |
| 2986241 | Distributed Cluster | distributed-type-72 | distributed-unit-72 |

**Table `prod_trade_transactions`**

| id | transaction_id | volume | unit | date | direction | status | geographic_region_id | involves_importer_geographic_region_id | commodity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 9.45 | distributed-unit-18 | 2023-02-05T13:03:00 | primary-directio-88 | regional-status-84 | 1 | 1 | 790492 |
| 2 | 89509 | 11.90 | baseline-unit-19 | 2024-07-16T20:20:00 | adaptive-directio-89 | legacy-status-85 | 2 | 2 | 5844256 |
| 3 | 1186092 | 14.35 | pilot-unit-20 | 2025-12-27T03:37:00 | distributed-directio-90 | compact-status-86 | 3 | 3 | 3355768 |
| 4 | 9085243 | 16.80 | extended-unit-21 | 2022-05-11T10:54:00 | baseline-directio-91 | composite-status-87 | 4 | 4 | 2986241 |

**Table `prod_geographic_regions`**

| id | region_id | name | type | coordinates | political_affiliation |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | composite-type-69 | integrated-coordina-70 | adaptive-politica-29 |
| 2 | 4180948 | Pilot Initiative A | primary-type-70 | seasonal-coordina-71 | distributed-politica-30 |
| 3 | 3012829 | Baseline Model | adaptive-type-71 | regional-coordina-72 | baseline-politica-31 |
| 4 | 778576 | Distributed Cluster | distributed-type-72 | legacy-coordina-73 | pilot-politica-32 |

**Table `prod_asset_divestments`**

| divestment_id | total_value | currency | start_date | end_date | status | company_id | transferred_to_company_id |
|---|---|---|---|---|---|---|---|
| mensuel | 9.45 | seasonal-currency-71 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | regional-status-84 | 1 | 1 |
| 338541 | 12.90 | regional-currency-72 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | legacy-status-85 | 2 | 2 |
| 24704630 | 16.35 | legacy-currency-73 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | compact-status-86 | 3 | 3 |
| Q1ZVN2 | 19.80 | compact-currency-74 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | composite-status-87 | 4 | 4 |

**Table `prod_companies`**

| company_id | name | type | headquarters | ownership_structure |
|---|---|---|---|---|
| 1 | Extended Review | composite-type-69 | composite-headquar-81 | integrated-ownershi-46 |
| 2 | Pilot Initiative A | primary-type-70 | primary-headquar-82 | seasonal-ownershi-47 |
| 3 | Baseline Model | adaptive-type-71 | adaptive-headquar-83 | regional-ownershi-48 |
| 4 | Distributed Cluster | distributed-type-72 | distributed-headquar-84 | legacy-ownershi-49 |

**Table `prod_land_parcels`**

| land_parcel_id | parcel_id | acreage | location | development_status | area_name |
|---|---|---|---|---|---|
| 1 | 4447034 | 19.20 | extended-location-99 | extended-developm-45 | Primary Programme A |
| 2 | 325464 | 21.40 | integrated-location-100 | integrated-developm-46 | Composite Standard |
| 3 | 3990187 | 23.60 | seasonal-location-101 | seasonal-developm-47 | Compact Framework |
| 4 | 110 | 25.80 | regional-location-102 | regional-developm-48 | Legacy Protocol D |

**Table `prod_survey_reportsProductionRecord`**

| survey_report_id | production_record_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `prod_institutionsPriceForecast`**

| institution_id | price_forecast_id |
|---|---|
| 9424913 | 100 |
| 9424913 | 101 |
| 8189481 | 101 |
| 8189481 | 102 |
| 1437604 | 102 |
| 1437604 | 103 |
| 884346 | 103 |
| 884346 | 100 |

**Table `prod_commoditiesPriceForecast`**

| commodity_id | price_forecast_id |
|---|---|
| 790492 | 100 |
| 790492 | 101 |
| 5844256 | 101 |
| 5844256 | 102 |
| 3355768 | 102 |
| 3355768 | 103 |
| 2986241 | 103 |
| 2986241 | 100 |

**Table `prod_geographic_regionsTradeTransaction`**

| geographic_region_id | trade_transaction_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `prod_geographic_regionsProductionRecord`**

| geographic_region_id | production_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `prod_asset_divestmentsLandParcel`**

| divestment_id | land_parcel_id |
|---|---|
| mensuel | 1 |
| mensuel | 2 |
| 338541 | 2 |
| 338541 | 3 |
| 24704630 | 3 |
| 24704630 | 4 |
| Q1ZVN2 | 4 |
| Q1ZVN2 | 1 |

**Table `prod_companiesAssetDivestment`**

| company_id | divestment_id |
|---|---|
| 1 | mensuel |
| 1 | 338541 |
| 2 | 338541 |
| 2 | 24704630 |
| 3 | 24704630 |
| 3 | Q1ZVN2 |
| 4 | Q1ZVN2 |
| 4 | mensuel |

**Table `prod_land_parcelsAssetDivestment`**

| land_parcel_id | divestment_id |
|---|---|
| 1 | mensuel |
| 1 | 338541 |
| 2 | 338541 |
| 2 | 24704630 |
| 3 | 24704630 |
| 3 | Q1ZVN2 |
| 4 | Q1ZVN2 |
| 4 | mensuel |

**View `vw_production_record_survey_report`**

```sql
CREATE VIEW vw_production_record_survey_report AS
SELECT a.id, a.record_id, a.volume, a.unit, b.id AS report_id, b.report_id AS report_report_id, b.publisher AS report_publisher
FROM prod_production_records a JOIN prod_survey_reports b ON a.survey_report_id = b.id;
```

| id | record_id | volume | unit | report_id | report_report_id | report_publisher |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 9.45 | distributed-unit-18 | 1000 | 1202-0008-S | pilot-publishe-50 |
| 2 | 10445619 | 11.90 | baseline-unit-19 | 1001 | 8189500 | extended-publishe-51 |
| 3 | 9568457 | 14.35 | pilot-unit-20 | 1002 | L355 | integrated-publishe-52 |
| 4 | 20743593 | 16.80 | extended-unit-21 | 1003 | 5844272 | seasonal-publishe-53 |

**View `vw_production_record_geographic_region`**

```sql
CREATE VIEW vw_production_record_geographic_region AS
SELECT a.id, a.record_id, a.volume, a.unit, b.id AS region_id, b.region_id AS region_region_id, b.name AS region_name
FROM prod_production_records a JOIN prod_geographic_regions b ON a.geographic_region_id = b.id;
```

| id | record_id | volume | unit | region_id | region_region_id | region_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 9.45 | distributed-unit-18 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | 10445619 | 11.90 | baseline-unit-19 | 2 | 4180948 | Pilot Initiative A |
| 3 | 9568457 | 14.35 | pilot-unit-20 | 3 | 3012829 | Baseline Model |
| 4 | 20743593 | 16.80 | extended-unit-21 | 4 | 778576 | Distributed Cluster |

**View `vw_survey_report_production_record_detail`**

```sql
CREATE VIEW vw_survey_report_production_record_detail AS
SELECT a.id, a.report_id, a.publisher, b.id AS record_id, b.record_id AS record_record_id, b.volume AS record_volume
FROM prod_survey_reports a
  JOIN prod_survey_reportsProductionRecord j ON j.survey_report_id = a.id
  JOIN prod_production_records b ON b.id = j.production_record_id;
```

| id | report_id | publisher | record_id | record_record_id | record_volume |
|---|---|---|---|---|---|
| 1000 | 1202-0008-S | pilot-publishe-50 | 1 | 10449530 | 9.45 |
| 1000 | 1202-0008-S | pilot-publishe-50 | 2 | 10445619 | 11.90 |
| 1001 | 8189500 | extended-publishe-51 | 2 | 10445619 | 11.90 |
| 1001 | 8189500 | extended-publishe-51 | 3 | 9568457 | 14.35 |
| 1002 | L355 | integrated-publishe-52 | 3 | 9568457 | 14.35 |
| 1002 | L355 | integrated-publishe-52 | 4 | 20743593 | 16.80 |
| 1003 | 5844272 | seasonal-publishe-53 | 4 | 20743593 | 16.80 |
| 1003 | 5844272 | seasonal-publishe-53 | 1 | 10449530 | 9.45 |

**View `vw_price_forecast_institution`**

```sql
CREATE VIEW vw_price_forecast_institution AS
SELECT a.id, a.forecast_id, a.target_price, a.currency, b.institution_id AS institution_institution_id, b.name AS institution_name, b.type AS institution_type
FROM prod_price_forecasts a JOIN prod_institutions b ON a.institution_id = b.institution_id;
```

| id | forecast_id | target_price | currency | institution_institution_id | institution_name | institution_type |
|---|---|---|---|---|---|---|
| 100 | 7119771 | 35.57 | seasonal-currency-71 | 9424913 | Extended Review | composite-type-69 |
| 101 | 3012834 | 20.14 | regional-currency-72 | 8189481 | Pilot Initiative A | primary-type-70 |
| 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 | legacy-currency-73 | 1437604 | Baseline Model | adaptive-type-71 |
| 103 | 13219 | 14.58 | compact-currency-74 | 884346 | Distributed Cluster | distributed-type-72 |

**View `vw_price_forecast_commodity`**

```sql
CREATE VIEW vw_price_forecast_commodity AS
SELECT a.id, a.forecast_id, a.target_price, a.currency, b.commodity_id AS commodity_commodity_id, b.name AS commodity_name, b.type AS commodity_type
FROM prod_price_forecasts a JOIN prod_commodities b ON a.commodity_id = b.commodity_id;
```

| id | forecast_id | target_price | currency | commodity_commodity_id | commodity_name | commodity_type |
|---|---|---|---|---|---|---|
| 100 | 7119771 | 35.57 | seasonal-currency-71 | 790492 | Extended Review | composite-type-69 |
| 101 | 3012834 | 20.14 | regional-currency-72 | 5844256 | Pilot Initiative A | primary-type-70 |
| 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 | legacy-currency-73 | 3355768 | Baseline Model | adaptive-type-71 |
| 103 | 13219 | 14.58 | compact-currency-74 | 2986241 | Distributed Cluster | distributed-type-72 |

**View `vw_institution_price_forecast_detail`**

```sql
CREATE VIEW vw_institution_price_forecast_detail AS
SELECT a.institution_id, a.name, a.type, b.id AS forecast_id, b.forecast_id AS forecast_forecast_id, b.target_price AS forecast_target_price
FROM prod_institutions a
  JOIN prod_institutionsPriceForecast j ON j.institution_id = a.institution_id
  JOIN prod_price_forecasts b ON b.id = j.price_forecast_id;
```

| institution_id | name | type | forecast_id | forecast_forecast_id | forecast_target_price |
|---|---|---|---|---|---|
| 9424913 | Extended Review | composite-type-69 | 100 | 7119771 | 35.57 |
| 9424913 | Extended Review | composite-type-69 | 101 | 3012834 | 20.14 |
| 8189481 | Pilot Initiative A | primary-type-70 | 101 | 3012834 | 20.14 |
| 8189481 | Pilot Initiative A | primary-type-70 | 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 |
| 1437604 | Baseline Model | adaptive-type-71 | 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 |
| 1437604 | Baseline Model | adaptive-type-71 | 103 | 13219 | 14.58 |
| 884346 | Distributed Cluster | distributed-type-72 | 103 | 13219 | 14.58 |
| 884346 | Distributed Cluster | distributed-type-72 | 100 | 7119771 | 35.57 |

**View `vw_commodity_price_forecast_detail`**

```sql
CREATE VIEW vw_commodity_price_forecast_detail AS
SELECT a.commodity_id, a.name, a.type, b.id AS forecast_id, b.forecast_id AS forecast_forecast_id, b.target_price AS forecast_target_price
FROM prod_commodities a
  JOIN prod_commoditiesPriceForecast j ON j.commodity_id = a.commodity_id
  JOIN prod_price_forecasts b ON b.id = j.price_forecast_id;
```

| commodity_id | name | type | forecast_id | forecast_forecast_id | forecast_target_price |
|---|---|---|---|---|---|
| 790492 | Extended Review | composite-type-69 | 100 | 7119771 | 35.57 |
| 790492 | Extended Review | composite-type-69 | 101 | 3012834 | 20.14 |
| 5844256 | Pilot Initiative A | primary-type-70 | 101 | 3012834 | 20.14 |
| 5844256 | Pilot Initiative A | primary-type-70 | 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 |
| 3355768 | Baseline Model | adaptive-type-71 | 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 |
| 3355768 | Baseline Model | adaptive-type-71 | 103 | 13219 | 14.58 |
| 2986241 | Distributed Cluster | distributed-type-72 | 103 | 13219 | 14.58 |
| 2986241 | Distributed Cluster | distributed-type-72 | 100 | 7119771 | 35.57 |

**View `vw_trade_transaction_geographic_region`**

```sql
CREATE VIEW vw_trade_transaction_geographic_region AS
SELECT a.id, a.transaction_id, a.volume, a.unit, b.id AS region_id, b.region_id AS region_region_id, b.name AS region_name
FROM prod_trade_transactions a JOIN prod_geographic_regions b ON a.geographic_region_id = b.id;
```

| id | transaction_id | volume | unit | region_id | region_region_id | region_name |
|---|---|---|---|---|---|---|
| 1 | 937738 | 9.45 | distributed-unit-18 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | 89509 | 11.90 | baseline-unit-19 | 2 | 4180948 | Pilot Initiative A |
| 3 | 1186092 | 14.35 | pilot-unit-20 | 3 | 3012829 | Baseline Model |
| 4 | 9085243 | 16.80 | extended-unit-21 | 4 | 778576 | Distributed Cluster |

**View `vw_trade_transaction_commodity`**

```sql
CREATE VIEW vw_trade_transaction_commodity AS
SELECT a.id, a.transaction_id, a.volume, a.unit, b.commodity_id AS commodity_commodity_id, b.name AS commodity_name, b.type AS commodity_type
FROM prod_trade_transactions a JOIN prod_commodities b ON a.commodity_id = b.commodity_id;
```

| id | transaction_id | volume | unit | commodity_commodity_id | commodity_name | commodity_type |
|---|---|---|---|---|---|---|
| 1 | 937738 | 9.45 | distributed-unit-18 | 790492 | Extended Review | composite-type-69 |
| 2 | 89509 | 11.90 | baseline-unit-19 | 5844256 | Pilot Initiative A | primary-type-70 |
| 3 | 1186092 | 14.35 | pilot-unit-20 | 3355768 | Baseline Model | adaptive-type-71 |
| 4 | 9085243 | 16.80 | extended-unit-21 | 2986241 | Distributed Cluster | distributed-type-72 |

**View `vw_geographic_region_trade_transaction_detail`**

```sql
CREATE VIEW vw_geographic_region_trade_transaction_detail AS
SELECT a.id, a.region_id, a.name, b.id AS transaction_id, b.transaction_id AS transaction_transaction_id, b.volume AS transaction_volume
FROM prod_geographic_regions a
  JOIN prod_geographic_regionsTradeTransaction j ON j.geographic_region_id = a.id
  JOIN prod_trade_transactions b ON b.id = j.trade_transaction_id;
```

| id | region_id | name | transaction_id | transaction_transaction_id | transaction_volume |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | 1 | 937738 | 9.45 |
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | 2 | 89509 | 11.90 |
| 2 | 4180948 | Pilot Initiative A | 2 | 89509 | 11.90 |
| 2 | 4180948 | Pilot Initiative A | 3 | 1186092 | 14.35 |
| 3 | 3012829 | Baseline Model | 3 | 1186092 | 14.35 |
| 3 | 3012829 | Baseline Model | 4 | 9085243 | 16.80 |
| 4 | 778576 | Distributed Cluster | 4 | 9085243 | 16.80 |
| 4 | 778576 | Distributed Cluster | 1 | 937738 | 9.45 |

**View `vw_geographic_region_production_record_detail`**

```sql
CREATE VIEW vw_geographic_region_production_record_detail AS
SELECT a.id, a.region_id, a.name, b.id AS record_id, b.record_id AS record_record_id, b.volume AS record_volume
FROM prod_geographic_regions a
  JOIN prod_geographic_regionsProductionRecord j ON j.geographic_region_id = a.id
  JOIN prod_production_records b ON b.id = j.production_record_id;
```

| id | region_id | name | record_id | record_record_id | record_volume |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | 1 | 10449530 | 9.45 |
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | 2 | 10445619 | 11.90 |
| 2 | 4180948 | Pilot Initiative A | 2 | 10445619 | 11.90 |
| 2 | 4180948 | Pilot Initiative A | 3 | 9568457 | 14.35 |
| 3 | 3012829 | Baseline Model | 3 | 9568457 | 14.35 |
| 3 | 3012829 | Baseline Model | 4 | 20743593 | 16.80 |
| 4 | 778576 | Distributed Cluster | 4 | 20743593 | 16.80 |
| 4 | 778576 | Distributed Cluster | 1 | 10449530 | 9.45 |

**View `vw_asset_divestment_company`**

```sql
CREATE VIEW vw_asset_divestment_company AS
SELECT a.divestment_id, a.total_value, a.currency, a.start_date, b.company_id AS company_company_id, b.name AS company_name, b.type AS company_type
FROM prod_asset_divestments a JOIN prod_companies b ON a.company_id = b.company_id;
```

| divestment_id | total_value | currency | start_date | company_company_id | company_name | company_type |
|---|---|---|---|---|---|---|
| mensuel | 9.45 | seasonal-currency-71 | 2022-09-05T20:24:00 | 1 | Extended Review | composite-type-69 |
| 338541 | 12.90 | regional-currency-72 | 2023-02-16T03:41:00 | 2 | Pilot Initiative A | primary-type-70 |
| 24704630 | 16.35 | legacy-currency-73 | 2024-07-27T10:58:00 | 3 | Baseline Model | adaptive-type-71 |
| Q1ZVN2 | 19.80 | compact-currency-74 | 2025-12-11T17:15:00 | 4 | Distributed Cluster | distributed-type-72 |

**View `vw_asset_divestment_land_parcel_detail`**

```sql
CREATE VIEW vw_asset_divestment_land_parcel_detail AS
SELECT a.divestment_id, a.total_value, a.currency, b.land_parcel_id AS parcel_land_parcel_id, b.parcel_id AS parcel_parcel_id, b.acreage AS parcel_acreage
FROM prod_asset_divestments a
  JOIN prod_asset_divestmentsLandParcel j ON j.divestment_id = a.divestment_id
  JOIN prod_land_parcels b ON b.land_parcel_id = j.land_parcel_id;
```

| divestment_id | total_value | currency | parcel_land_parcel_id | parcel_parcel_id | parcel_acreage |
|---|---|---|---|---|---|
| mensuel | 9.45 | seasonal-currency-71 | 1 | 4447034 | 19.20 |
| mensuel | 9.45 | seasonal-currency-71 | 2 | 325464 | 21.40 |
| 338541 | 12.90 | regional-currency-72 | 2 | 325464 | 21.40 |
| 338541 | 12.90 | regional-currency-72 | 3 | 3990187 | 23.60 |
| 24704630 | 16.35 | legacy-currency-73 | 3 | 3990187 | 23.60 |
| 24704630 | 16.35 | legacy-currency-73 | 4 | 110 | 25.80 |
| Q1ZVN2 | 19.80 | compact-currency-74 | 4 | 110 | 25.80 |
| Q1ZVN2 | 19.80 | compact-currency-74 | 1 | 4447034 | 19.20 |

**View `vw_company_asset_divestment_detail`**

```sql
CREATE VIEW vw_company_asset_divestment_detail AS
SELECT a.company_id, a.name, a.type, b.divestment_id AS divestment_divestment_id, b.total_value AS divestment_total_value, b.currency AS divestment_currency
FROM prod_companies a
  JOIN prod_companiesAssetDivestment j ON j.company_id = a.company_id
  JOIN prod_asset_divestments b ON b.divestment_id = j.divestment_id;
```

| company_id | name | type | divestment_divestment_id | divestment_total_value | divestment_currency |
|---|---|---|---|---|---|
| 1 | Extended Review | composite-type-69 | mensuel | 9.45 | seasonal-currency-71 |
| 1 | Extended Review | composite-type-69 | 338541 | 12.90 | regional-currency-72 |
| 2 | Pilot Initiative A | primary-type-70 | 338541 | 12.90 | regional-currency-72 |
| 2 | Pilot Initiative A | primary-type-70 | 24704630 | 16.35 | legacy-currency-73 |
| 3 | Baseline Model | adaptive-type-71 | 24704630 | 16.35 | legacy-currency-73 |
| 3 | Baseline Model | adaptive-type-71 | Q1ZVN2 | 19.80 | compact-currency-74 |
| 4 | Distributed Cluster | distributed-type-72 | Q1ZVN2 | 19.80 | compact-currency-74 |
| 4 | Distributed Cluster | distributed-type-72 | mensuel | 9.45 | seasonal-currency-71 |

**View `vw_land_parcel_asset_divestment_detail`**

```sql
CREATE VIEW vw_land_parcel_asset_divestment_detail AS
SELECT a.land_parcel_id, a.parcel_id, a.acreage, b.divestment_id AS divestment_divestment_id, b.total_value AS divestment_total_value, b.currency AS divestment_currency
FROM prod_land_parcels a
  JOIN prod_land_parcelsAssetDivestment j ON j.land_parcel_id = a.land_parcel_id
  JOIN prod_asset_divestments b ON b.divestment_id = j.divestment_id;
```

| land_parcel_id | parcel_id | acreage | divestment_divestment_id | divestment_total_value | divestment_currency |
|---|---|---|---|---|---|
| 1 | 4447034 | 19.20 | mensuel | 9.45 | seasonal-currency-71 |
| 1 | 4447034 | 19.20 | 338541 | 12.90 | regional-currency-72 |
| 2 | 325464 | 21.40 | 338541 | 12.90 | regional-currency-72 |
| 2 | 325464 | 21.40 | 24704630 | 16.35 | legacy-currency-73 |
| 3 | 3990187 | 23.60 | 24704630 | 16.35 | legacy-currency-73 |
| 3 | 3990187 | 23.60 | Q1ZVN2 | 19.80 | compact-currency-74 |
| 4 | 110 | 25.80 | Q1ZVN2 | 19.80 | compact-currency-74 |
| 4 | 110 | 25.80 | mensuel | 9.45 | seasonal-currency-71 |
