## Energy Production and Trade Analytics

The energy sector operates across a complex web of corporate organizations, geographic territories, and logistical networks. Production reports capture output volumes from distinct regions, while trade shipments track the physical movement of commodities between territories. Price forecasts issued by corporate entities provide forward-looking valuations, and rig counts offer a measure of active drilling capacity across regions. Together, these records form the operational backbone for monitoring energy markets, assessing regional performance, and correlating corporate activity with physical output.

**Table `production_reports`**

| report_id | report_date | organization_name | region_name | volume_bpd | unit_of_measure | data_source | geographic_region_id | corporate_entity_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1202-0008-S | 2024-03-02 | Staples Inc. | Distributed Assessment | 5.95 | composite-unit-69 | pilot-data-38 | 1000 | 1 | 2025-01-01 00:14:00 |
| 8189500 | 2025-08-13 | Oscar Health Inc. | Adaptive Survey D | 7.90 | primary-unit-70 | extended-data-39 | 1001 | 2 | 2025-02-06 03:14:00 |
| L355 | 2022-01-24 | Atlantic Richfield | Primary Corridor | 9.85 | adaptive-unit-71 | integrated-data-40 | 1002 | 3 | 2025-03-11 06:14:00 |
| 5844272 | 2023-06-08 | Port Loko | Composite Series | 11.80 | distributed-unit-72 | seasonal-data-41 | 1003 | 4 | 2025-04-16 09:14:00 |

Production reports serve as the primary record of output volumes across operating territories. Each report carries a unique identifier, a reporting date, and the name of the organization responsible for the data. The volume is expressed in barrels per day alongside a unit of measure that classifies the measurement methodology. Data sources range from pilot and extended datasets to integrated and seasonal collections, reflecting the diversity of measurement programs. The report links to a geographic region and a corporate entity, establishing the territorial and organizational context for each volume entry. For instance, report 1202-0008-S from Staples Inc. records a volume of 5.95 barrels per day under the Distributed Assessment region, sourced from pilot-data-38. Report 8189500 from Oscar Health Inc. shows 7.90 barrels per day in the Adaptive Survey D region, while L355 from Atlantic Richfield captures 9.85 barrels per day in the Primary Corridor. The highest volume in the dataset, 11.80 barrels per day, appears in report 5844272 from Port Loko within the Composite Series region.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | country_code | latitude | longitude | region_type |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 13.95 | 21.20 | composite-region-21 |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 17.90 | 25.40 | primary-region-22 |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | 21.85 | 29.60 | adaptive-region-23 |
| 1003 | 778576 | Composite Series | 727045 | 25.80 | 33.80 | distributed-region-24 |

Geographic regions define the territorial framework within which production and trade activities occur. Each region carries a unique identifier, a region name, and a country code that anchors it to a national jurisdiction. Latitude and longitude coordinates provide spatial positioning, while the region type classifies the operational character of the territory—composite, primary, adaptive, or distributed. Region 1000, labeled Distributed Assessment, sits at coordinates 13.95 latitude and 21.20 longitude and is classified as a composite-region-21. Region 1001, Adaptive Survey D, occupies coordinates 17.90 and 25.40 as a primary-region-22. Region 1002, Primary Corridor, is positioned at 21.85 and 29.60 under the adaptive-region-23 classification. Region 1003, Composite Series, rests at 25.80 and 33.80 as a distributed-region-24. These territorial definitions provide the spatial reference for all production and trade records.

**Table `corporate_entities`**

| id | entity_id | entity_name | headquarters_location | entity_type | market_cap |
|---|---|---|---|---|---|
| 1 | 1996912 | Regional Cluster | composite-headquar-63 | adaptive-entity-35 | 3.95 |
| 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | primary-headquar-64 | distributed-entity-36 | 5.90 |
| 3 | 9736894 | Integrated Initiative | adaptive-headquar-65 | baseline-entity-37 | 7.85 |
| 4 | 974946 | Extended Model | distributed-headquar-66 | pilot-entity-38 | 9.80 |

Corporate entities represent the organizational actors responsible for energy operations and market forecasting. Each entity has a unique identifier, a name, a headquarters location, an entity type, and a market capitalization figure. The entity types—adaptive, distributed, baseline, and pilot—reflect different organizational structures or operational classifications. Entity 1, Regional Cluster, is headquartered at composite-headquar-63, classified as an adaptive-entity-35 with a market cap of 3.95. Entity 2, Seasonal Review D, operates from primary-headquar-64 as a distributed-entity-36 with a market cap of 5.90. Entity 3, Integrated Initiative, is based at adaptive-headquar-65, classified as a baseline-entity-37 with a market cap of 7.85. Entity 4, Extended Model, headquarters at distributed-headquar-66 carries the pilot-entity-38 classification and a market cap of 9.80. These entities issue production reports and price forecasts, linking organizational strategy to physical output and market expectations.

**Table `price_forecasts`**

| id | forecast_id | issue_date | target_year | price_value | currency_code | forecast_source | commodity_name | corporate_entity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7119771 | 2023-02-01 | 10 | 36.43 | gd_fp_eu_acc3 | baseline-forecast-19 | Extended Survey | 1 |
| 2 | 3012834 | 2024-07-12 | 19 | 14.31 | managing-resources | pilot-forecast-20 | Pilot Corridor A | 2 |
| 3 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | 2025-12-23 | 28 | 17.41 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | extended-forecast-21 | Baseline Series | 3 |
| 4 | 13219 | 2022-05-07 | 37 | 12.87 | 10445649 | integrated-forecast-22 | Distributed Assessment | 4 |

Price forecasts provide forward-looking commodity valuations issued by corporate entities. Each forecast carries a unique identifier, an issue date, a target year, a price value, a currency code, a forecast source, and the name of the commodity being valued. The target year indicates the future period to which the forecast applies, while the price value represents the expected unit price. Forecast 1, issued on 2023-02-01, targets year 10 with a price of 36.43 in currency gd_fp_eu_acc3 for the Extended Survey commodity, originating from baseline-forecast-19 and attributed to corporate entity 1. Forecast 2, dated 2024-07-12, targets year 19 with a price of 14.31 in managing-resources for Pilot Corridor A, sourced from pilot-forecast-20 under entity 2. Forecast 3, issued 2025-12-23, targets year 28 at 17.41 in currency f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 for Baseline Series, from extended-forecast-21 under entity 3. Forecast 4, dated 2022-05-07, targets year 37 at 12.87 in currency 10445649 for Distributed Assessment, from integrated-forecast-22 under entity 4. These forecasts enable market participants to assess future price trajectories across commodities and corporate strategies.

**Table `trade_shipments`**

| shipment_id | shipment_date | volume_tonnes | commodity_type | origin_country | destination_country | geographic_region_id | destined_for_geographic_region_id |
|---|---|---|---|---|---|---|---|
| 10782183 | 2023-10-02 | 18.45 | legacy-commodit-13 | compact-origin-14 | seasonal-destinat-29 | 1000 | 1000 |
| 39800616 | 2024-03-13 | 20.90 | compact-commodit-14 | composite-origin-15 | regional-destinat-30 | 1001 | 1001 |
| 2087737 | 2025-08-24 | 23.35 | composite-commodit-15 | primary-origin-16 | legacy-destinat-31 | 1002 | 1002 |
| 69441 | 2022-01-08 | 25.80 | primary-commodit-16 | adaptive-origin-17 | compact-destinat-32 | 1003 | 1003 |

Trade shipments document the physical movement of commodities between geographic territories. Each shipment record includes a unique shipment identifier, a shipment date, a volume in tonnes, a commodity type, origin and destination country codes, and the geographic region identifiers for both the origin and destination. The shipment date establishes the timing of the trade event, while the volume in tonnes quantifies the physical quantity moved. Shipment 10782183, dated 2023-10-02, moves 18.45 tonnes of legacy-commodit-13 from compact-origin-14 to seasonal-destinat-29 within region 1000. Shipment 39800616, dated 2024-03-13, transports 20.90 tonnes of compact-commodit-14 from composite-origin-15 to regional-destinat-30 within region 1001. Shipment 2087737, dated 2025-08-24, carries 23.35 tonnes of composite-commodit-15 from primary-origin-16 to legacy-destinat-31 within region 1002. Shipment 69441, dated 2022-01-08, moves the largest volume at 25.80 tonnes of primary-commodit-16 from adaptive-origin-17 to compact-destinat-32 within region 1003. These records enable tracking of commodity flows and regional trade balances.

**Table `rig_counts`**

| id | count_id | count_date | active_rig_count | region_name | data_provider | geographic_region_id |
|---|---|---|---|---|---|---|
| 1 | 5844271 | 2023-06-22 | 8 | Distributed Assessment | primary-data-58 | 1000 |
| 2 | 53bdbf9a-8fc2-11eb-924d-9cd76263cbd0 | 2024-11-06 | 52 | Adaptive Survey D | adaptive-data-59 | 1001 |
| 3 | 327 | 2025-04-17 | 26 | Primary Corridor | distributed-data-60 | 1002 |
| 4 | 4985173 | 2022-09-01 | 47 | Composite Series | baseline-data-61 | 1003 |

Rig counts measure the number of active drilling rigs operating within each geographic region, providing a direct indicator of exploration and development intensity. Each count record includes a unique identifier, a count identifier, a count date, the number of active rigs, the region name, the data provider, and the geographic region identifier. Count 5844271, recorded on 2023-06-22, reports 8 active rigs in the Distributed Assessment region, sourced from primary-data-58. Count 53bdbf9a-8fc2-11eb-924d-9cd76263cbd0, dated 2024-11-06, shows 52 active rigs in Adaptive Survey D from adaptive-data-59. Count 327, recorded 2025-04-17, indicates 26 active rigs in Primary Corridor from distributed-data-60. Count 4985173, dated 2022-09-01, reports 47 active rigs in Composite Series from baseline-data-61. The wide variation in rig counts—from 8 to 52—reflects differing levels of drilling activity across regions and time periods.

### Regional Production Context

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

The regional production view joins production reports with their corresponding geographic regions, answering the question of how much output each territory generates and under what classification. This join enriches production data with territorial metadata, enabling analysis of output by region type, country, and spatial coordinates. The first row of this view combines report 1202-0008-S from Staples Inc. with region 1000 (Distributed Assessment), showing a volume of 5.95 barrels per day in a composite-region-21 classified territory at coordinates 13.95 and 21.20. The second row pairs report 8189500 from Oscar Health Inc. with region 1001 (Adaptive Survey D), recording 7.90 barrels per day in a primary-region-22 at coordinates 17.90 and 25.40. The third row links report L355 from Atlantic Richfield to region 1002 (Primary Corridor), capturing 9.85 barrels per day in an adaptive-region-23 at 21.85 and 29.60. The fourth row associates report 5844272 from Port Loko with region 1003 (Composite Series), documenting 11.80 barrels per day in a distributed-region-24 at 25.80 and 33.80. This view supports territorial performance benchmarking and spatial analysis of production distribution.

### Corporate Production Context

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

The corporate production view links production reports to their originating corporate entities, revealing how different organizations contribute to overall output. By joining production data with entity metadata, this view enables analysis of production by entity type, headquarters location, and market capitalization. The first row connects report 1202-0008-S from Staples Inc. to entity 1 (Regional Cluster), an adaptive-entity-35 headquartered at composite-headquar-63 with a market cap of 3.95, producing 5.95 barrels per day. The second row links report 8189500 from Oscar Health Inc. to entity 2 (Seasonal Review D), a distributed-entity-36 at primary-headquar-64 with a market cap of 5.90, yielding 7.90 barrels per day. The third row associates report L355 from Atlantic Richfield with entity 3 (Integrated Initiative), a baseline-entity-37 at adaptive-headquar-65 and market cap 7.85, generating 9.85 barrels per day. The fourth row ties report 5844272 from Port Loko to entity 4 (Extended Model), a pilot-entity-38 at distributed-headquar-66 with market cap 9.80, producing 11.80 barrels per day. This view supports corporate performance evaluation and the correlation of market capitalization with production output.

### Corporate Price Forecast Context

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

The corporate price forecast view associates price forecasts with their issuing corporate entities, providing context for how different organizations formulate market expectations. This join enriches forecast data with entity characteristics, enabling analysis of forecasting behavior by entity type and market position. The first row pairs forecast 7119771, targeting year 10 at a price of 36.43 for Extended Survey, with entity 1 (Regional Cluster), an adaptive-entity-35 with market cap 3.95. The second row links forecast 3012834, targeting year 19 at 14.31 for Pilot Corridor A, to entity 2 (Seasonal Review D), a distributed-entity-36 with market cap 5.90. The third row associates forecast 2b2bb518-8fcd-11eb-924d-9cd76263cbd0, targeting year 28 at 17.41 for Baseline Series, with entity 3 (Integrated Initiative), a baseline-entity-37 and market cap 7.85. The fourth row connects forecast 13219, targeting year 37 at 12.87 for Distributed Assessment, to entity 4 (Extended Model), a pilot-entity-38 with market cap 9.80. This view supports the study of how corporate characteristics influence price forecasting methodology and target valuations.

### Regional Trade Context

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

The regional trade view joins trade shipments with their origin geographic regions, answering how commodity flows are distributed across territorial classifications. This join provides the regional context for each shipment, enabling analysis of trade volumes by region type and spatial characteristics. The first row connects shipment 10782183, moving 18.45 tonnes of legacy-commodit-13 on 2023-10-02, with origin region 1000 (Distributed Assessment), a composite-region-21 at coordinates 13.95 and 21.20. The second row links shipment 39800616, transporting 20.90 tonnes of compact-commodit-14 on 2024-03-13, to origin region 1001 (Adaptive Survey D), a primary-region-22 at 17.90 and 25.40. The third row associates shipment 2087737, carrying 23.35 tonnes of composite-commodit-15 on 2025-08-24, with origin region 1002 (Primary Corridor), an adaptive-region-23 at 21.85 and 29.60. The fourth row ties shipment 69441, moving 25.80 tonnes of primary-commodit-16 on 2022-01-08, to origin region 1003 (Composite Series), a distributed-region-24 at 25.80 and 33.80. This view supports territorial trade analysis and the identification of high-volume shipping regions.

### Regional Rig Count Context

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

The regional rig count view joins rig count records with their corresponding geographic regions, providing territorial context for drilling activity measurements. This join enables analysis of rig deployment by region type, country, and spatial location. The first row connects count 5844271, reporting 8 active rigs on 2023-06-22 from primary-data-58, with region 1000 (Distributed Assessment), a composite-region-21 at 13.95 and 21.20. The second row links count 53bdbf9a-8fc2-11eb-924d-9cd76263cbd0, showing 52 active rigs on 2024-11-06 from adaptive-data-59, to region 1001 (Adaptive Survey D), a primary-region-22 at 17.90 and 25.40. The third row associates count 327, recording 26 active rigs on 2025-04-17 from distributed-data-60, with region 1002 (Primary Corridor), an adaptive-region-23 at 21.85 and 29.60. The fourth row ties count 4985173, reporting 47 active rigs on 2022-09-01 from baseline-data-61, to region 1003 (Composite Series), a distributed-region-24 at 25.80 and 33.80. This view supports the assessment of drilling intensity across territories and the correlation of rig activity with production volumes and trade flows.

### Synthesis

The energy analytics domain integrates production volumes, territorial definitions, corporate organizations, price forecasts, trade movements, and drilling activity into a coherent operational picture. Production reports quantify output across regions and entities, while geographic regions provide the spatial framework for all activities. Corporate entities drive both production and forecasting, linking organizational strategy to market expectations. Trade shipments track the physical flow of commodities between territories, and rig counts measure the intensity of exploration and development. The joined views synthesize these dimensions, enabling cross-domain analysis that connects corporate performance with territorial output, forecast behavior with entity characteristics, and trade volumes with regional classifications. Together, these records support comprehensive monitoring of energy markets and the identification of operational patterns across the full spectrum of energy activities.