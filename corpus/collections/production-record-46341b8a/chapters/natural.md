## Commodity Production, Trade, and Asset Management

The modern commodity sector operates across a complex web of production activities, price forecasting, international trade, and corporate asset restructuring. Organizations must track volumetric output across geographic regions, publish survey reports that contextualize production data, issue price forecasts that guide market participants, execute trade transactions that move physical goods, and manage divestments of land parcels as part of broader corporate strategy. The records in this domain capture every facet of that lifecycle, from the initial survey report that frames a production estimate to the final divestment of a land parcel that reshapes a company's portfolio.

**Table `prod_production_records`**

| id | record_id | volume | unit | start_date | end_date | source | survey_report_id | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 9.45 | distributed-unit-18 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-source-65 | 1000 | 1 |
| 2 | 10445619 | 11.90 | baseline-unit-19 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-source-66 | 1001 | 2 |
| 3 | 9568457 | 14.35 | pilot-unit-20 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-source-67 | 1002 | 3 |
| 4 | 20743593 | 16.80 | extended-unit-21 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-source-68 | 1003 | 4 |

Production records form the foundational layer of commodity tracking. Each record captures a measured volume—expressed in units such as `distributed-unit-18`, `baseline-unit-19`, `pilot-unit-20`, or `extended-unit-21`—alongside a temporal window defined by a start and end date. The record identified as `10449530` documents a volume of `9.45` in `distributed-unit-18`, spanning from `2022-09-01T08:00:00` through `2022-09-05T20:24:00`, and is attributed to `seasonal-source-65`. Production records are inherently contextual: each one is linked to a survey report that provides the methodological basis for the measurement and to a geographic region that anchors the activity to a physical location. The record `20743593`, for instance, reports a volume of `16.80` in `extended-unit-21` with a `compact-source-68` provenance, tied to survey report `1003` and geographic region `4`.

**Table `prod_survey_reports`**

| id | report_id | publisher | publication_date | report_type | period_covered | created_at |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | pilot-publishe-50 | 2025-12-01T23:33:00 | extended-report-93 | compact-period-14 | 2025-01-01 00:14:00 |
| 1001 | 8189500 | extended-publishe-51 | 2022-05-12T06:50:00 | integrated-report-94 | composite-period-15 | 2025-02-06 03:14:00 |
| 1002 | L355 | integrated-publishe-52 | 2023-10-23T13:07:00 | seasonal-report-95 | primary-period-16 | 2025-03-11 06:14:00 |
| 1003 | 5844272 | seasonal-publishe-53 | 2024-03-07T20:24:00 | regional-report-96 | adaptive-period-17 | 2025-04-16 09:14:00 |

Survey reports serve as the authoritative documentation layer for production data. Each report carries a unique identifier—`1202-0008-S`, `8189500`, `L355`, or `5844272`—and is published by an entity such as `pilot-publishe-50` or `extended-publishe-51`. Reports are classified by type, including `extended-report-93`, `integrated-report-94`, `seasonal-report-95`, and `regional-report-96`, and each covers a defined period such as `compact-period-14` or `composite-period-15`. The publication date anchors the report in time; report `8189500`, published by `extended-publishe-51` on `2022-05-12T06:50:00`, carries an `integrated-report-94` classification and covers the `composite-period-15` window. Production records reference these reports through their `survey_report_id` column, creating a traceable chain from raw measurement back to the methodology that produced it.

**Table `prod_price_forecasts`**

| id | forecast_id | target_price | currency | year | commodity | issuing_body | institution_id | commodity_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 7119771 | 35.57 | seasonal-currency-71 | 12 | legacy-commodit-19 | baseline-issuing-13 | 9424913 | 790492 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 3012834 | 20.14 | regional-currency-72 | 21 | compact-commodit-20 | pilot-issuing-14 | 8189481 | 5844256 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 12.34 | legacy-currency-73 | 30 | composite-commodit-21 | extended-issuing-15 | 1437604 | 3355768 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 13219 | 14.58 | compact-currency-74 | 39 | primary-commodit-22 | integrated-issuing-16 | 884346 | 2986241 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Price forecasts represent the forward-looking dimension of commodity management. Each forecast carries a `target_price`—values such as `35.57`, `20.14`, `12.34`, and `14.58`—expressed in a specific currency like `seasonal-currency-71` or `regional-currency-72`. Forecasts are associated with a calendar year, a commodity, and an issuing institution. The forecast identified as `7119771` projects a target price of `35.57` in `seasonal-currency-71` for year `12`, issued by institution `9424913` against commodity `790492`. Each forecast also carries a `forecast_id` that may be numeric, alphanumeric, or a UUID such as `2b2bb518-8fcd-11eb-924d-9cd76263cbd0`. The `created_at` and `updated_at` timestamps enable practitioners to track the evolution of price expectations over time.

**Table `prod_institutions`**

| institution_id | name | type | headquarters | created_at |
|---|---|---|---|---|
| 9424913 | Extended Review | composite-type-69 | composite-headquar-81 | 2025-01-01 00:14:00 |
| 8189481 | Pilot Initiative A | primary-type-70 | primary-headquar-82 | 2025-02-06 03:14:00 |
| 1437604 | Baseline Model | adaptive-type-71 | adaptive-headquar-83 | 2025-03-11 06:14:00 |
| 884346 | Distributed Cluster | distributed-type-72 | distributed-headquar-84 | 2025-04-16 09:14:00 |

Institutions are the organizations that issue price forecasts and participate in the broader commodity ecosystem. The institution `9424913`, named `Extended Review`, operates under a `composite-type-69` classification with its headquarters at `composite-headquar-81`. Institution `8189481`, known as `Pilot Initiative A`, is classified as `primary-type-70` and is headquartered at `primary-headquar-82`. The `Baseline Model` (`1437604`) and `Distributed Cluster` (`884346`) round out the institutional roster, each with distinct type and headquarters attributes. Institutions are the issuers of price forecasts, and their identity is captured in the `institution_id` column of the forecast records.

**Table `prod_commodities`**

| commodity_id | name | type | unit_of_measure |
|---|---|---|---|
| 790492 | Extended Review | composite-type-69 | composite-unit-69 |
| 5844256 | Pilot Initiative A | primary-type-70 | primary-unit-70 |
| 3355768 | Baseline Model | adaptive-type-71 | adaptive-unit-71 |
| 2986241 | Distributed Cluster | distributed-type-72 | distributed-unit-72 |

Commodities are the physical or financial products at the center of production, trade, and forecasting activities. The commodity `790492`, named `Extended Review`, is classified as `composite-type-69` and measured in `composite-unit-69`. Commodity `5844256`, `Pilot Initiative A`, uses `primary-unit-70` as its unit of measure, while `3355768` (`Baseline Model`) and `2986241` (`Distributed Cluster`) follow with `adaptive-unit-71` and `distributed-unit-72` respectively. Every price forecast and trade transaction references a commodity through its `commodity_id`, ensuring that all forward-looking and transactional records are anchored to a specific product.

**Table `prod_trade_transactions`**

| id | transaction_id | volume | unit | date | direction | status | geographic_region_id | involves_importer_geographic_region_id | commodity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 9.45 | distributed-unit-18 | 2023-02-05T13:03:00 | primary-directio-88 | regional-status-84 | 1 | 1 | 790492 |
| 2 | 89509 | 11.90 | baseline-unit-19 | 2024-07-16T20:20:00 | adaptive-directio-89 | legacy-status-85 | 2 | 2 | 5844256 |
| 3 | 1186092 | 14.35 | pilot-unit-20 | 2025-12-27T03:37:00 | distributed-directio-90 | compact-status-86 | 3 | 3 | 3355768 |
| 4 | 9085243 | 16.80 | extended-unit-21 | 2022-05-11T10:54:00 | baseline-directio-91 | composite-status-87 | 4 | 4 | 2986241 |

Trade transactions capture the movement of commodities across geographic boundaries. Each transaction records a volume—such as `9.45`, `11.90`, `14.35`, or `16.80`—in a unit like `distributed-unit-18` or `baseline-unit-19`, along with a transaction date, a direction (`primary-directio-88`, `adaptive-directio-89`, `distributed-directio-90`, `baseline-directio-91`), and a status (`regional-status-84`, `legacy-status-85`, `compact-status-86`, `composite-status-87`). The transaction `937738` moved `9.45` units on `2023-02-05T13:03:00` with a `primary-directio-88` direction and `regional-status-84` status, involving geographic region `1` as both the origin and destination, and trading commodity `790492`. Trade transactions are linked to geographic regions through both a primary region and an importer region, and to commodities through the `commodity_id` column.

**Table `prod_geographic_regions`**

| id | region_id | name | type | coordinates | political_affiliation |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Extended Review | composite-type-69 | integrated-coordina-70 | adaptive-politica-29 |
| 2 | 4180948 | Pilot Initiative A | primary-type-70 | seasonal-coordina-71 | distributed-politica-30 |
| 3 | 3012829 | Baseline Model | adaptive-type-71 | regional-coordina-72 | baseline-politica-31 |
| 4 | 778576 | Distributed Cluster | distributed-type-72 | legacy-coordina-73 | pilot-politica-32 |

Geographic regions provide the spatial framework for production and trade activities. While the specific names of regions are not enumerated in the sample data, each region is identified by an integer key that appears in production records and trade transactions. Region `1` anchors production record `10449530` and trade transaction `937738`; region `2` anchors record `10445619` and transaction `89509`; region `3` anchors record `9568457` and transaction `1186092`; and region `4` anchors record `20743593` and transaction `9085243`. The geographic dimension is essential for understanding where production occurs, where trade originates and terminates, and how regional characteristics influence commodity flows.

**Table `prod_asset_divestments`**

| divestment_id | total_value | currency | start_date | end_date | status | company_id | transferred_to_company_id |
|---|---|---|---|---|---|---|---|
| mensuel | 9.45 | seasonal-currency-71 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | regional-status-84 | 1 | 1 |
| 338541 | 12.90 | regional-currency-72 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | legacy-status-85 | 2 | 2 |
| 24704630 | 16.35 | legacy-currency-73 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | compact-status-86 | 3 | 3 |
| Q1ZVN2 | 19.80 | compact-currency-74 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | composite-status-87 | 4 | 4 |

Asset divestments represent the corporate restructuring dimension of the commodity domain. Divestments involve the sale or transfer of land parcels by companies, and each divestment record captures the essential details of that transaction. The divestment records are linked to both the company executing the divestment and the land parcel being divested, creating a clear audit trail of asset transfers.

**Table `prod_companies`**

| company_id | name | type | headquarters | ownership_structure |
|---|---|---|---|---|
| 1 | Extended Review | composite-type-69 | composite-headquar-81 | integrated-ownershi-46 |
| 2 | Pilot Initiative A | primary-type-70 | primary-headquar-82 | seasonal-ownershi-47 |
| 3 | Baseline Model | adaptive-type-71 | adaptive-headquar-83 | regional-ownershi-48 |
| 4 | Distributed Cluster | distributed-type-72 | distributed-headquar-84 | legacy-ownershi-49 |

Companies are the corporate entities that execute divestments and participate in the broader commodity market. Each company is identified by a unique key and carries attributes that define its role in the divestment process. The companies in the dataset are the sellers of land parcels, and their identity is captured in the divestment records through the `company_id` column.

**Table `prod_land_parcels`**

| land_parcel_id | parcel_id | acreage | location | development_status | area_name |
|---|---|---|---|---|---|
| 1 | 4447034 | 19.20 | extended-location-99 | extended-developm-45 | Primary Programme A |
| 2 | 325464 | 21.40 | integrated-location-100 | integrated-developm-46 | Composite Standard |
| 3 | 3990187 | 23.60 | seasonal-location-101 | seasonal-developm-47 | Compact Framework |
| 4 | 110 | 25.80 | regional-location-102 | regional-developm-48 | Legacy Protocol D |

Land parcels are the physical assets being divested. Each parcel carries geographic and attribute information that defines its value and characteristics. The parcels are the objects of divestment transactions, and their identity is captured in the divestment records through the `land_parcel_id` column.

The relationships between these base tables are expressed through junction tables that resolve many-to-many associations and through views that present joined results for analytical consumption. The junction table `prod_survey_reportsProductionRecord` links survey reports to production records, enabling a production record to reference multiple reports or a report to underpin multiple records. The table `prod_institutionsPriceForecast` connects institutions to their price forecasts, while `prod_commoditiesPriceForecast` links commodities to the forecasts that reference them. Trade transactions are associated with geographic regions through `prod_geographic_regionsTradeTransaction`, and production records are linked to regions via `prod_geographic_regionsProductionRecord`. Asset divestments are connected to companies through `prod_companiesAssetDivestment` and to land parcels through `prod_land_parcelsAssetDivestment`, with the additional junction `prod_asset_divestmentsLandParcel` providing a further layer of association.

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

The view `vw_production_record_survey_report` answers the question of which survey reports underpin which production records. By joining production records to their associated survey reports, this view reveals the methodological provenance of each measurement. A row showing production record `10449530` linked to survey report `1202-0008-S` tells the practitioner that the volume of `9.45` documented in that record was derived from the methodology described in the pilot-published report. This provenance chain is critical for quality assurance and for understanding the confidence level of production data.

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

The view `vw_production_record_geographic_region` maps production records to their geographic contexts. Each row in this view pairs a production record with the region where the activity took place. The row linking record `10449530` to geographic region `1` indicates that the volume of `9.45` was produced in that region, while the row connecting record `20743593` to region `4` places the `16.80` volume in a different spatial context. This geographic mapping enables regional aggregation, trend analysis, and the identification of production hotspots.

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

The view `vw_survey_report_production_record_detail` provides a detailed look at how individual survey reports relate to the production records they support. This view is particularly useful when a single report underpins multiple production records, as it reveals the scope and reach of each report's methodology. A row showing report `8189500` (published by `extended-publishe-51`) linked to production record `10445619` demonstrates how an integrated report can serve as the methodological foundation for a specific volume measurement.

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

The view `vw_price_forecast_institution` connects price forecasts to the institutions that issued them. Each row in this view pairs a forecast with its issuing institution, answering the question of which organization is responsible for a given price projection. The row linking forecast `7119771` (target price `35.57`) to institution `9424913` (`Extended Review`) tells the practitioner that this particular forecast carries the institutional weight and analytical rigor of the Extended Review organization. This association is essential for evaluating the credibility and methodology of price projections.

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

The view `vw_price_forecast_commodity` links price forecasts to the commodities they target. Each row identifies which commodity a forecast is projecting prices for, enabling practitioners to filter forecasts by product. The row connecting forecast `3012834` (target price `20.14`) to commodity `5844256` (`Pilot Initiative A`) reveals that this forecast is specifically about the Pilot Initiative A commodity, allowing market participants to focus on the products relevant to their operations.

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

The view `vw_institution_price_forecast_detail` provides a comprehensive view of an institution's forecasting activity by joining institution details with their forecasts. This view enables practitioners to assess the forecasting portfolio of each institution. A row showing institution `8189481` (`Pilot Initiative A`) with forecast `3012834` (target price `20.14` in `regional-currency-72` for year `21`) demonstrates how the view surfaces both the institutional identity and the specific forecast parameters in a single record.

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

The view `vw_commodity_price_forecast_detail` presents a commodity-centric perspective on price forecasting by joining commodity details with their associated forecasts. This view answers the question of what price projections exist for a given commodity. The row linking commodity `3355768` (`Baseline Model`) to forecast `2b2bb518-8fcd-11eb-924d-9cd76263cbd0` (target price `12.34` in `legacy-currency-73` for year `30`) provides a complete picture of the forecast parameters for that specific commodity.

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

The view `vw_trade_transaction_geographic_region` maps trade transactions to their associated geographic regions. Each row pairs a transaction with the region where it occurred, enabling spatial analysis of trade flows. The row linking transaction `937738` (volume `9.45`) to geographic region `1` indicates that this trade activity took place in region `1`, while the row connecting transaction `1186092` (volume `14.35`) to region `3` places that trade in a different geographic context. This view is essential for understanding the spatial distribution of commodity trade.

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

The view `vw_trade_transaction_commodity` connects trade transactions to the commodities being traded. Each row identifies which commodity a transaction involves, enabling practitioners to analyze trade volumes by product. The row linking transaction `89509` (volume `11.90`) to commodity `5844256` (`Pilot Initiative A`) reveals that this transaction involved the Pilot Initiative A commodity, allowing for product-specific trade analysis.

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

The view `vw_geographic_region_trade_transaction_detail` provides a detailed view of trade activity within geographic regions by joining region details with their associated transactions. This view enables practitioners to assess the trade volume and characteristics of each region. A row showing geographic region `2` with transaction `89509` (volume `11.90`, direction `adaptive-directio-89`, status `legacy-status-85`) demonstrates how the view surfaces both the regional context and the specific transaction attributes in a single record.

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

The view `vw_geographic_region_production_record_detail` presents a region-centric perspective on production by joining geographic region details with their associated production records. This view answers the question of what production activity occurs in each region. The row linking geographic region `3` to production record `9568457` (volume `14.35`, unit `pilot-unit-20`, source `legacy-source-67`) provides a complete picture of the production parameters for that specific region.

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

The view `vw_asset_divestment_company` connects asset divestments to the companies executing them. Each row pairs a divestment with its originating company, answering the question of which corporate entity is restructuring its asset portfolio. This view enables practitioners to track divestment activity by company and to understand the restructuring strategies of individual organizations.

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

The view `vw_asset_divestment_land_parcel_detail` provides a detailed view of divested land parcels by joining divestment records with their associated land parcel details. This view enables practitioners to assess the characteristics and value of divested assets. A row showing a divestment linked to a specific land parcel reveals the physical and geographic attributes of the asset being transferred, providing essential context for valuation and due diligence.

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

The view `vw_company_asset_divestment_detail` presents a company-centric perspective on divestment activity by joining company details with their divestment records. This view answers the question of what assets a company is divesting and when. The view surfaces both the corporate identity and the specific divestment parameters in a single record, enabling practitioners to assess the scope and timing of corporate restructuring efforts.

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

The view `vw_land_parcel_asset_divestment_detail` provides a land parcel-centric view of divestment activity by joining land parcel details with their associated divestment records. This view enables practitioners to track the divestment history of individual parcels and to understand how specific assets have changed hands over time. The view surfaces both the parcel characteristics and the divestment details, providing a complete picture of the asset's lifecycle within the corporate restructuring process.

The commodity production, trade, and asset management domain is defined by the interplay of measurement, forecasting, transaction, and restructuring. Production records capture volumetric output anchored to survey reports and geographic regions. Price forecasts project future values issued by institutions for specific commodities. Trade transactions move physical goods across regions. Asset divestments restructure corporate portfolios by transferring land parcels. The junction tables and views weave these elements into a coherent analytical fabric, enabling practitioners to trace a production measurement back to its survey methodology, to evaluate a price forecast against its issuing institution, to map a trade transaction to its commodity and region, and to track a divestment from company to land parcel. Every record, every junction, and every view serves the same purpose: to provide a complete, auditable, and analytically rich picture of commodity operations across space and time.

## Data appendix

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
