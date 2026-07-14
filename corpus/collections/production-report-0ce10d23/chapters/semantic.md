The domain under examination spans the operational and commercial lifecycle of energy-resource extraction, from upstream production reporting through price forecasting, physical trade logistics, and rig-count monitoring. Six base tables capture the raw facts; five materialized views join those tables back together so that analysts can read a single row as a complete business event. The schema follows a star-like pattern: two dimension tables—`geographic_regions` and `corporate_entities`—anchor the fact tables, while the fact tables themselves (`production_reports`, `price_forecasts`, `trade_shipments`, `rig_counts`) store measures, timestamps, and free-text descriptors. Foreign keys from the facts to the dimensions enforce referential integrity, and the views materialize those joins as flat, query-ready surfaces.

## Production Reports

The `production_reports` table is the central fact table for upstream output measurement. Each row records a single production volume observation, identified by a composite `report_id` such as `1202-0008-S` or `L355`. The `report_date` column anchors the observation in time (e.g., `2024-03-02`), while `volume_bpd` carries the numeric measure—in this dataset, values range from `5.95` to `11.80` barrels per day. The `unit_of_measure` column (e.g., `composite-unit-69`) qualifies the measure, and `data_source` (e.g., `pilot-data-38`) records provenance. Two foreign keys, `geographic_region_id` and `corporate_entity_id`, link the report to its location and the responsible organization. The `organization_name` and `region_name` columns are denormalized copies of the dimension values, retained for display convenience. A `created_at` timestamp (`2025-01-01 00:14:00` for the first row) records when the row was inserted into the warehouse.

**Table `production_reports`**

| report_id | report_date | organization_name | region_name | volume_bpd | unit_of_measure | data_source | geographic_region_id | corporate_entity_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1202-0008-S | 2024-03-02 | Staples Inc. | Distributed Assessment | 5.95 | composite-unit-69 | pilot-data-38 | 1000 | 1 | 2025-01-01 00:14:00 |
| 8189500 | 2025-08-13 | Oscar Health Inc. | Adaptive Survey D | 7.90 | primary-unit-70 | extended-data-39 | 1001 | 2 | 2025-02-06 03:14:00 |
| L355 | 2022-01-24 | Atlantic Richfield | Primary Corridor | 9.85 | adaptive-unit-71 | integrated-data-40 | 1002 | 3 | 2025-03-11 06:14:00 |
| 5844272 | 2023-06-08 | Port Loko | Composite Series | 11.80 | distributed-unit-72 | seasonal-data-41 | 1003 | 4 | 2025-04-16 09:14:00 |

The `geographic_region_id` value `1000` in the first row points to the `geographic_regions` dimension, while `corporate_entity_id` value `1` points to `corporate_entities`. This dual foreign-key structure means every production report is simultaneously a geographic and a corporate fact.

## Geographic Regions

The `geographic_regions` table is a slowly changing dimension that describes the spatial units used throughout the schema. Its surrogate primary key, `geographic_region_id`, takes integer values `1000` through `1003` in the sample data. The natural `region_id` column carries UUIDs or opaque codes (e.g., `46d49f56-8fcc-11eb-924d-9cd76263cbd0`), while `region_name` provides a human-readable label such as `Distributed Assessment`. The `country_code` column stores a code or identifier (e.g., `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`), and `latitude` / `longitude` store the spatial coordinates (`13.95`, `21.20` for the first region). The `region_type` column (e.g., `composite-region-21`) classifies the region by its aggregation level. This table is referenced by four fact tables, making it the most widely joined dimension in the schema.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | country_code | latitude | longitude | region_type |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 13.95 | 21.20 | composite-region-21 |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 17.90 | 25.40 | primary-region-22 |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | 21.85 | 29.60 | adaptive-region-23 |
| 1003 | 778576 | Composite Series | 727045 | 25.80 | 33.80 | distributed-region-24 |

## Corporate Entities

The `corporate_entities` table models the organizations that own or operate production assets. Its surrogate key `id` is an integer (`1`–`4`), while the natural `entity_id` carries UUIDs or opaque identifiers (e.g., `1996912`). The `entity_name` column holds the organization name (`Regional Cluster`, `Seasonal Review D`), and `headquarters_location` stores a location code (e.g., `composite-headquar-63`). The `entity_type` column (e.g., `adaptive-entity-35`) classifies the organization, and `market_cap` carries a numeric value (`3.95` for the first row). This table is referenced by `production_reports` and `price_forecasts`, linking production and pricing facts to their corporate owners.

**Table `corporate_entities`**

| id | entity_id | entity_name | headquarters_location | entity_type | market_cap |
|---|---|---|---|---|---|
| 1 | 1996912 | Regional Cluster | composite-headquar-63 | adaptive-entity-35 | 3.95 |
| 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | primary-headquar-64 | distributed-entity-36 | 5.90 |
| 3 | 9736894 | Integrated Initiative | adaptive-headquar-65 | baseline-entity-37 | 7.85 |
| 4 | 974946 | Extended Model | distributed-headquar-66 | pilot-entity-38 | 9.80 |

## Price Forecasts

The `price_forecasts` table captures forward-looking commodity price estimates. Each row is identified by an `id` (integer) and a `forecast_id` (e.g., `7119771`). The `issue_date` (`2023-02-01`) and `target_year` (`10`) define the temporal scope of the forecast. The `price_value` column carries the numeric estimate (`36.43`), and `currency_code` (e.g., `gd_fp_eu_acc3`) specifies the unit. The `forecast_source` column (e.g., `baseline-forecast-19`) records provenance, while `commodity_name` (e.g., `Extended Survey`) identifies the commodity. The foreign key `corporate_entity_id` links the forecast to the issuing organization. This table is the only fact that references `corporate_entities` without also referencing `geographic_regions`.

**Table `price_forecasts`**

| id | forecast_id | issue_date | target_year | price_value | currency_code | forecast_source | commodity_name | corporate_entity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119771 | 2023-02-01 | 10 | 36.43 | gd_fp_eu_acc3 | baseline-forecast-19 | Extended Survey | 1 |
| 2 | 3012834 | 2024-07-12 | 19 | 14.31 | managing-resources | pilot-forecast-20 | Pilot Corridor A | 2 |
| 3 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 28 | 17.41 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | extended-forecast-21 | Baseline Series | 3 |
| 4 | 13219 | 2022-05-07 | 37 | 12.87 | 10445649 | integrated-forecast-22 | Distributed Assessment | 4 |

## Trade Shipments

The `trade_shipments` table records physical commodity movements. Each row carries a `shipment_id` (e.g., `10782183`), a `shipment_date` (`2023-10-02`), and a `volume_tonnes` measure (`18.45`). The `commodity_type` column (e.g., `legacy-commodit-13`) classifies the cargo. The `origin_country` and `destination_country` columns store free-text or coded location names (e.g., `compact-origin-14`, `seasonal-destinat-29`). Two foreign keys to `geographic_regions`—`geographic_region_id` and `destined_for_geographic_region_id`—link the shipment's origin and destination regions. In the sample data both keys point to the same region (`1000`), indicating intra-region shipments, but the schema supports inter-region flows by design.

**Table `trade_shipments`**

| shipment_id | shipment_date | volume_tonnes | commodity_type | origin_country | destination_country | geographic_region_id | destined_for_geographic_region_id |
|---|---|---|---|---|---|---|---|
| 10782183 | 2023-10-02 | 18.45 | legacy-commodit-13 | compact-origin-14 | seasonal-destinat-29 | 1000 | 1000 |
| 39800616 | 2024-03-13 | 20.90 | compact-commodit-14 | composite-origin-15 | regional-destinat-30 | 1001 | 1001 |
| 2087737 | 2025-08-24 | 23.35 | composite-commodit-15 | primary-origin-16 | legacy-destinat-31 | 1002 | 1002 |
| 69441 | 2022-01-08 | 25.80 | primary-commodit-16 | adaptive-origin-17 | compact-destinat-32 | 1003 | 1003 |

## Rig Counts

The `rig_counts` table tracks the number of active drilling rigs per region over time. Each row has a surrogate `id`, a `count_id` (e.g., `5844271`), and a `count_date` (`2023-06-22`). The `active_rig_count` column carries the integer measure (`8` for the first row). The `region_name` column is a denormalized copy of the dimension's `region_name` (`Distributed Assessment`), and `data_provider` (e.g., `primary-data-58`) records provenance. The foreign key `geographic_region_id` links the count to its spatial unit. This table is the simplest fact, containing only one measure and one dimension reference.

**Table `rig_counts`**

| id | count_id | count_date | active_rig_count | region_name | data_provider | geographic_region_id |
|---|---|---|---|---|---|---|
| 1 | 5844271 | 2023-06-22 | 8 | Distributed Assessment | primary-data-58 | 1000 |
| 2 | 53bdbf9a-8fc2-11eb-924d-9cd76263cbd0 | 2024-11-06 | 52 | Adaptive Survey D | adaptive-data-59 | 1001 |
| 3 | 327 | 2025-04-17 | 26 | Primary Corridor | distributed-data-60 | 1002 |
| 4 | 4985173 | 2022-09-01 | 47 | Composite Series | baseline-data-61 | 1003 |

## View: Production Report × Geographic Region

The view `v_production_report_geographic_region` joins `production_reports` to `geographic_regions` on `geographic_region_id`, producing a flat row that combines production measures with their spatial context. The join reconstructs the domain fact: "this volume was produced in this region on this date." Reading the first row of the view, one sees `report_id` `1202-0008-S`, `volume_bpd` `5.95`, `region_name` `Distributed Assessment`, `latitude` `13.95`, and `region_type` `composite-region-21`—all in a single row. The second row shows `report_id` `8189500`, `volume_bpd` `7.90`, `region_name` `Adaptive Survey D`, and `region_type` `primary-region-22`. This view answers questions such as "what volumes were produced in each region" without requiring the analyst to write a join.

**View `v_production_report_geographic_region`**

```sql
CREATE VIEW v_production_report_geographic_region AS
SELECT a.report_id, a.report_date, a.organization_name, a.region_name, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM production_reports a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| report_id | report_date | organization_name | region_name | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1202-0008-S | 2024-03-02 | Staples Inc. | Distributed Assessment | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 8189500 | 2025-08-13 | Oscar Health Inc. | Adaptive Survey D | 1001 | 4180948 | Adaptive Survey D |
| L355 | 2022-01-24 | Atlantic Richfield | Primary Corridor | 1002 | 3012829 | Primary Corridor |
| 5844272 | 2023-06-08 | Port Loko | Composite Series | 1003 | 778576 | Composite Series |

## View: Production Report × Corporate Entity

The view `v_production_report_corporate_entity` joins `production_reports` to `corporate_entities` on `corporate_entity_id`, pairing production volumes with their responsible organizations. The first row of the view yields `report_id` `1202-0008-S`, `volume_bpd` `5.95`, `entity_name` `Regional Cluster`, `entity_type` `adaptive-entity-35`, and `market_cap` `3.95`. The third row shows `report_id` `L355`, `volume_bpd` `9.85`, `entity_name` `Integrated Initiative`, and `market_cap` `7.85`. This view supports corporate-level aggregation: "what did each organization produce" or "how does production correlate with market capitalization."

**View `v_production_report_corporate_entity`**

```sql
CREATE VIEW v_production_report_corporate_entity AS
SELECT a.report_id, a.report_date, a.organization_name, a.region_name, b.id AS entity_id, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name
FROM production_reports a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| report_id | report_date | organization_name | region_name | entity_id | entity_entity_id | entity_entity_name |
|---|---|---|---|---|---|---|
| 1202-0008-S | 2024-03-02 | Staples Inc. | Distributed Assessment | 1 | 1996912 | Regional Cluster |
| 8189500 | 2025-08-13 | Oscar Health Inc. | Adaptive Survey D | 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D |
| L355 | 2022-01-24 | Atlantic Richfield | Primary Corridor | 3 | 9736894 | Integrated Initiative |
| 5844272 | 2023-06-08 | Port Loko | Composite Series | 4 | 974946 | Extended Model |

## View: Price Forecast × Corporate Entity

The view `v_price_forecast_corporate_entity` joins `price_forecasts` to `corporate_entities` on `corporate_entity_id`, linking price estimates to their issuing organizations. The first row of the view presents `forecast_id` `7119771`, `price_value` `36.43`, `target_year` `10`, `entity_name` `Regional Cluster`, and `entity_type` `adaptive-entity-35`. The fourth row shows `forecast_id` `13219`, `price_value` `12.87`, `target_year` `37`, `entity_name` `Extended Model`, and `market_cap` `9.80`. This view answers questions like "which organization issued which forecast" and "how do price estimates vary across entities and target years."

**View `v_price_forecast_corporate_entity`**

```sql
CREATE VIEW v_price_forecast_corporate_entity AS
SELECT a.id, a.forecast_id, a.issue_date, a.target_year, b.id AS entity_id, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name
FROM price_forecasts a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| id | forecast_id | issue_date | target_year | entity_id | entity_entity_id | entity_entity_name |
|---|---|---|---|---|---|---|
| 1 | 7119771 | 2023-02-01 | 10 | 1 | 1996912 | Regional Cluster |
| 2 | 3012834 | 2024-07-12 | 19 | 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D |
| 3 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 28 | 3 | 9736894 | Integrated Initiative |
| 4 | 13219 | 2022-05-07 | 37 | 4 | 974946 | Extended Model |

## View: Trade Shipment × Geographic Region

The view `v_trade_shipment_geographic_region` joins `trade_shipments` to `geographic_regions` on `geographic_region_id`, enriching shipment records with origin-region metadata. The first row of the view yields `shipment_id` `10782183`, `volume_tonnes` `18.45`, `commodity_type` `legacy-commodit-13`, `region_name` `Distributed Assessment`, and `latitude` `13.95`. The third row shows `shipment_id` `2087737`, `volume_tonnes` `23.35`, `commodity_type` `composite-commodit-15`, `region_name` `Primary Corridor`, and `longitude` `29.60`. This view supports spatial analysis of trade flows: "what commodities move through which regions" and "how do shipment volumes distribute across geographic units."

**View `v_trade_shipment_geographic_region`**

```sql
CREATE VIEW v_trade_shipment_geographic_region AS
SELECT a.shipment_id, a.shipment_date, a.volume_tonnes, a.commodity_type, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM trade_shipments a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| shipment_id | shipment_date | volume_tonnes | commodity_type | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 10782183 | 2023-10-02 | 18.45 | legacy-commodit-13 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 39800616 | 2024-03-13 | 20.90 | compact-commodit-14 | 1001 | 4180948 | Adaptive Survey D |
| 2087737 | 2025-08-24 | 23.35 | composite-commodit-15 | 1002 | 3012829 | Primary Corridor |
| 69441 | 2022-01-08 | 25.80 | primary-commodit-16 | 1003 | 778576 | Composite Series |

## View: Rig Count × Geographic Region

The view `v_rig_count_geographic_region` joins `rig_counts` to `geographic_regions` on `geographic_region_id`, pairing rig activity with spatial context. The first row of the view presents `count_id` `5844271`, `count_date` `2023-06-22`, `active_rig_count` `8`, `region_name` `Distributed Assessment`, and `region_type` `composite-region-21`. The second row shows `count_id` `53bdbf9a-8fc2-11eb-924d-9cd76263cbd0`, `active_rig_count` `52`, `region_name` `Adaptive Survey D`, and `region_type` `primary-region-22`. This view answers questions such as "how many rigs are active in each region" and "does rig activity correlate with region type."

**View `v_rig_count_geographic_region`**

```sql
CREATE VIEW v_rig_count_geographic_region AS
SELECT a.id, a.count_id, a.count_date, a.active_rig_count, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM rig_counts a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| id | count_id | count_date | active_rig_count | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 5844271 | 2023-06-22 | 8 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | 53bdbf9a-8fc2-11eb-924d-9cd76263cbd0 | 2024-11-06 | 52 | 1001 | 4180948 | Adaptive Survey D |
| 3 | 327 | 2025-04-17 | 26 | 1002 | 3012829 | Primary Corridor |
| 4 | 4985173 | 2022-09-01 | 47 | 1003 | 778576 | Composite Series |

## Synthesis

The schema models the energy-extraction domain through a clean separation of concerns: six base tables capture atomic facts and dimensions, while five views materialize the most common analytical joins. The two dimension tables—`geographic_regions` and `corporate_entities`—serve as the primary join keys, with `geographic_region_id` referenced by three fact tables and `corporate_entity_id` referenced by two. Each view reconstructs a single domain question from normalized tables: `v_production_report_geographic_region` answers "what was produced where," `v_production_report_corporate_entity` answers "what did each organization produce," `v_price_forecast_corporate_entity` answers "which organization issued which forecast," `v_trade_shipment_geographic_region` answers "what moves through which region," and `v_rig_count_geographic_region` answers "how many rigs operate in each region." The denormalized name columns (`organization_name`, `region_name`, `entity_name`) in the fact tables provide display-ready values without requiring additional joins, while the surrogate keys (`geographic_region_id`, `corporate_entity_id`) maintain referential integrity. This design balances normalization (reducing redundancy in dimensions) with query convenience (pre-joining the most common fact-dimension pairs in views), a pattern well-suited to analytical workloads where read performance matters more than write throughput.