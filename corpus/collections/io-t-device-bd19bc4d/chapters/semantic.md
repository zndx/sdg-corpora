The domain under examination is a device lifecycle and market-distribution model, where physical hardware assets are manufactured, certified, and routed through commercial channels into geographic markets. Each device carries a unique identifier, a model designation, firmware version, and a manufacturing timestamp, and is linked to the organization that produced it, the channel through which it was distributed, and the market region where it was deployed. Safety certifications and intellectual property assets attach to devices and their manufacturers, forming a compliance and IP portfolio overlay. The relational schema captures these relationships through a central `io_t_devices` table flanked by six supporting tables, with a suite of twelve join views that reconstruct the domain facts from the normalized structure.

## The Device Core

At the centre of the schema sits the `io_t_devices` table, which stores the canonical record for every hardware unit in the system.

**Table `io_t_devices`**

| id | device_identifier | device_name | device_model | firmware_version | manufacturing_date | is_certified | certification_body | manufacturer_id | channel_id | market_region_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Pilot Assessment | seasonal-device-23 | distributed-firmware-48 | 2024-11-14T10:42:00 | true | integrated-certific-58 | 1 | 1562831 | 1 |
| 2 | DEV-2378 | Baseline Survey | regional-device-24 | baseline-firmware-49 | 2025-04-25T17:59:00 | false | seasonal-certific-59 | 2 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | 2 |
| 3 | DEV-2384 | Distributed Corridor A | legacy-device-25 | pilot-firmware-50 | 2022-09-09T00:16:00 | true | regional-certific-60 | 3 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | 3 |
| 4 | DEV-2390 | Adaptive Series | compact-device-26 | extended-firmware-51 | 2023-02-20T07:33:00 | false | legacy-certific-61 | 4 | 4447006 | 4 |

The primary key `id` is an integer surrogate, while `device_identifier` carries a human-readable code such as `DEV-2372` or `DEV-2390`. The `device_name` column holds descriptive labels like *Pilot Assessment* or *Adaptive Series*, and `device_model` stores a model tag such as `seasonal-device-23` or `compact-device-26`. Firmware state is tracked in `firmware_version` (e.g. `distributed-firmware-48`), and `manufacturing_date` records the production timestamp in ISO-8601 format, as in `2024-11-14T10:42:00`. Boolean compliance is captured in `is_certified`, and `certification_body` names the issuing authority, for instance `integrated-certific-58`. Three foreign keys anchor the device to the rest of the model: `manufacturer_id` references the producing organization, `channel_id` references the distribution channel, and `market_region_id` references the target market region. In the sample data, device 1 (`DEV-2372`) is linked to manufacturer 1, channel `1562831`, and market region 1, while device 2 (`DEV-2378`) carries a UUID-style channel identifier `df2de334-8fcc-11eb-924d-9cd76263cbd0`, illustrating that the channel key is not uniformly typed across rows.

## The Manufacturer Entity

The `manufacturers` table records the organizations that produce devices.

**Table `manufacturers`**

| id | manufacturer_id | company_name | country_of_operation | contract_status | certification_level | contact_email | io_t_device_id | channel_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Esperion Therapeutics Inc. | Feedback Rating | pilot-country-50 | composite-contract-99 | seasonal-certific-59 | Christopher Wilson | 1 | 1562831 |
| 2 | Microsoft Corporation | Virgin Group | extended-country-51 | primary-contract-100 | regional-certific-60 | Charles Larsen | 2 | df2de334-8fcc-11eb-924d-9cd76263cbd0 |
| 3 | Northrop Grumman | United Technologies | integrated-country-52 | adaptive-contract-101 | legacy-certific-61 | Mary Alvarez | 3 | ae409270-8fcd-11eb-924d-9cd76263cbd0 |
| 4 | Switch Card Services Ltd. | Link Title | seasonal-country-53 | distributed-contract-102 | compact-certific-62 | April Snyder | 4 | 4447006 |

Its primary key `id` is an integer, and `manufacturer_id` stores the company name as a free-text field — for example, *Esperion Therapeutics Inc.* or *Microsoft Corporation*. The `company_name` column appears to store a secondary label such as *Feedback Rating* or *Virgin Group*, while `country_of_operation` holds a region tag like `pilot-country-50`. Contractual state is captured in `contract_status` (e.g. `composite-contract-99`) and `certification_level` (e.g. `seasonal-certific-59`). A `contact_email` column stores a person's name rather than an email address in the sample data — *Christopher Wilson*, *Charles Larsen* — suggesting the column may serve as a general contact field. Two foreign keys link the manufacturer to the device model: `io_t_device_id` references the device it produced, and `channel_id` references the distribution channel through which its products flow. Manufacturer 1 (*Esperion Therapeutics Inc.*) is linked to device 1 and channel `1562831`, while manufacturer 4 (*Switch Card Services Ltd.*) is linked to device 4 and channel `4447006`.

## Distribution Channels and Market Regions

The `distribution_channels` table models the commercial pathways through which devices reach end markets.

**Table `distribution_channels`**

| channel_id | channel_name | region_served | contract_start_date | contract_end_date | is_negotiating | io_t_device_id | market_region_id |
|---|---|---|---|---|---|---|---|
| 1562831 | Adaptive Corridor | adaptive-region-53 | 2022-01-26 | 2025-12-07 | false | 1 | 1 |
| df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 | 2023-06-10 | 2022-05-18 | true | 2 | 2 |
| ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 | 2024-11-21 | 2023-10-02 | false | 3 | 3 |
| 4447006 | Compact Survey | pilot-region-56 | 2025-04-05 | 2024-03-13 | true | 4 | 4 |

The primary key `channel_id` is a string column that mixes integer-like values (`1562831`, `4447006`) with UUIDs (`df2de334-8fcc-11eb-924d-9cd76263cbd0`). The `channel_name` column holds descriptive labels such as *Adaptive Corridor* or *Primary Series*, and `region_served` stores a region tag like `adaptive-region-53`. Contractual dates are captured in `contract_start_date` and `contract_end_date`, while `is_negotiating` is a boolean indicating whether the channel is currently under negotiation. Two foreign keys link the channel to the device model: `io_t_device_id` references the device distributed through this channel, and `market_region_id` references the geographic market it serves. Channel `1562831` (*Adaptive Corridor*) is linked to device 1 and market region 1, while channel `ae409270-8fcd-11eb-924d-9cd76263cbd0` (*Composite Assessment D*) is linked to device 3 and market region 3.

The `market_regions` table captures the geographic and economic characteristics of the markets into which devices are deployed.

**Table `market_regions`**

| id | region_id | region_name | household_count | housing_starts_rate | market_maturity | is_target_market | channel_id | io_t_device_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 66 | 18.70 | extended-market-57 | false | 1562831 | 1 |
| 2 | 4180948 | Adaptive Survey D | 5 | 22.40 | integrated-market-58 | true | df2de334-8fcc-11eb-924d-9cd76263cbd0 | 2 |
| 3 | 3012829 | Primary Corridor | 21 | 26.10 | seasonal-market-59 | false | ae409270-8fcd-11eb-924d-9cd76263cbd0 | 3 |
| 4 | 778576 | Composite Series | 3 | 29.80 | regional-market-60 | true | 4447006 | 4 |

Its primary key `id` is an integer, and `region_id` stores a UUID or integer identifier for the region. The `region_name` column holds descriptive labels such as *Distributed Assessment* or *Adaptive Survey D*, while `household_count` stores an integer representing the number of households in the region (e.g. `66`, `5`). The `housing_starts_rate` column stores a decimal value such as `18.70` or `29.80`, and `market_maturity` holds a maturity tag like `extended-market-57`. The `is_target_market` boolean indicates whether the region is a strategic target. Two foreign keys link the market region to the device model: `channel_id` references the distribution channel serving this region, and `io_t_device_id` references the device deployed there. Market region 1 (*Distributed Assessment*) is linked to channel `1562831` and device 1, while market region 4 (*Composite Series*) is linked to channel `4447006` and device 4.

## Safety Certifications and Intellectual Property

The `safety_certifications` table records the compliance certifications that devices and their manufacturers hold.

**Table `safety_certifications`**

| id | certification_id | standard_code | issuing_authority | issue_date | expiry_date | status | scope_description | io_t_device_id | manufacturer_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 57e439e0-8fcd-11eb-924d-9cd76263cbd0 | L459 | extended-issuing-33 | 2023-02-01 | 2023-10-24 | regional-status-84 | Integrated Model A | 1 | 1 |
| 2 | acheivement-focus | account_pymes_596 | integrated-issuing-34 | 2024-07-12 | 2024-03-08 | legacy-status-85 | Extended Cluster | 2 | 2 |
| 3 | 9246319 | 9125613 | seasonal-issuing-35 | 2025-12-23 | 2025-08-19 | compact-status-86 | Pilot Review | 3 | 3 |
| 4 | 9125624 | 8189504 | regional-issuing-36 | 2022-05-07 | 2022-01-03 | composite-status-87 | Baseline Initiative D | 4 | 4 |

Its primary key `id` is an integer, and `certification_id` stores a UUID or string identifier for the certification. The `standard_code` column holds a code such as `L459` or `account_pymes_596`, while `issuing_authority` names the certifying body, for instance `extended-issuing-33`. Dates are captured in `issue_date` and `expiry_date`, and `status` holds a status tag like `regional-status-84`. The `scope_description` column provides a free-text description of the certification scope, such as *Integrated Model A* or *Extended Cluster*. Two foreign keys link the certification to the device model: `io_t_device_id` references the certified device, and `manufacturer_id` references the manufacturer that holds the certification. Certification 1 (ID `57e439e0-8fcd-11eb-924d-9cd76263cbd0`) is linked to device 1 and manufacturer 1, while certification 4 (ID `9125624`) is linked to device 4 and manufacturer 4.

The `intellectual_property_assets` table models the IP portfolio associated with devices and manufacturers.

**Table `intellectual_property_assets`**

| asset_id | asset_name | asset_type | valuation_amount | currency_code | registration_date | is_licensed | io_t_device_id | manufacturer_id |
|---|---|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | pilot-asset-86 | 442.51 | gd_fp_eu_acc3 | 2023-06-19 | true | 1 | 1 |
| 6564392 | Baseline Standard | extended-asset-87 | 33.06 | managing-resources | 2024-11-03 | false | 2 | 2 |
| 5917296 | Distributed Framework A | integrated-asset-88 | 3,079 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-14 | true | 3 | 3 |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | seasonal-asset-89 | 45,650 | 10445649 | 2022-09-25 | false | 4 | 4 |

Its primary key `asset_id` is a string column that mixes integers (`7731874`) with UUIDs (`990e161e10664c5885182d95dc07e606`). The `asset_name` column holds descriptive labels such as *Pilot Programme* or *Baseline Standard*, and `asset_type` stores a type tag like `pilot-asset-86`. The `valuation_amount` column stores a numeric value (e.g. `442.51`, `45,650`), and `currency_code` holds a currency identifier such as `gd_fp_eu_acc3`. The `registration_date` column stores the registration date in ISO-8601 format, and `is_licensed` is a boolean indicating whether the asset is licensed. Two foreign keys link the IP asset to the device model: `io_t_device_id` references the associated device, and `manufacturer_id` references the manufacturer that owns the asset. Asset 1 (*Pilot Programme*) is linked to device 1 and manufacturer 1, while asset 4 (*Adaptive Protocol*) is linked to device 4 and manufacturer 4.

## Device-to-Manufacturer View

The view `io_t_device_manufacturer_view` joins `io_t_devices` with `manufacturers` to present each device alongside its producing organization.

**View `io_t_device_manufacturer_view`**

```sql
CREATE VIEW io_t_device_manufacturer_view AS
SELECT a.id, a.device_identifier, a.device_name, a.device_model, b.id AS manufacturer_id, b.manufacturer_id AS manufacturer_manufacturer_id, b.company_name AS manufacturer_company_name
FROM io_t_devices a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| id | device_identifier | device_name | device_model | manufacturer_id | manufacturer_manufacturer_id | manufacturer_company_name |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Pilot Assessment | seasonal-device-23 | 1 | Esperion Therapeutics Inc. | Feedback Rating |
| 2 | DEV-2378 | Baseline Survey | regional-device-24 | 2 | Microsoft Corporation | Virgin Group |
| 3 | DEV-2384 | Distributed Corridor A | legacy-device-25 | 3 | Northrop Grumman | United Technologies |
| 4 | DEV-2390 | Adaptive Series | compact-device-26 | 4 | Switch Card Services Ltd. | Link Title |

This view answers the question: *Which manufacturer produced each device, and what is the contractual and certification context of that relationship?* Reading the first row, device `DEV-2372` (*Pilot Assessment*) is produced by *Esperion Therapeutics Inc.*, which operates under `pilot-country-50` with a `composite-contract-99` status and `seasonal-certific-59` certification level. The second row shows device `DEV-2378` (*Baseline Survey*) produced by *Microsoft Corporation*, operating under `extended-country-51` with a `primary-contract-100` status. The view effectively denormalizes the device–manufacturer relationship, collapsing two tables into a single row per device and making it straightforward to audit the manufacturer–device linkage.

## Device-to-Channel View

The view `io_t_device_distribution_channel_view` joins `io_t_devices` with `distribution_channels` to present each device alongside its distribution channel.

**View `io_t_device_distribution_channel_view`**

```sql
CREATE VIEW io_t_device_distribution_channel_view AS
SELECT a.id, a.device_identifier, a.device_name, a.device_model, b.channel_id AS channel_channel_id, b.channel_name AS channel_channel_name, b.region_served AS channel_region_served
FROM io_t_devices a JOIN distribution_channels b ON a.channel_id = b.channel_id;
```

| id | device_identifier | device_name | device_model | channel_channel_id | channel_channel_name | channel_region_served |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Pilot Assessment | seasonal-device-23 | 1562831 | Adaptive Corridor | adaptive-region-53 |
| 2 | DEV-2378 | Baseline Survey | regional-device-24 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 |
| 3 | DEV-2384 | Distributed Corridor A | legacy-device-25 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 |
| 4 | DEV-2390 | Adaptive Series | compact-device-26 | 4447006 | Compact Survey | pilot-region-56 |

This view answers the question: *Through which channel is each device distributed, and what are the contractual terms of that channel?* The first row shows device `DEV-2372` distributed through *Adaptive Corridor* (`channel_id` `1562831`), which serves `adaptive-region-53` under a contract running from `2022-01-26` to `2025-12-07` and is not currently negotiating. The second row shows device `DEV-2378` distributed through *Primary Series* (`channel_id` `df2de334-8fcc-11eb-924d-9cd76263cbd0`), which serves `distributed-region-54` under a contract running from `2023-06-10` to `2022-05-18` and is currently negotiating. The inverted contract end date in the second row (earlier than the start date) may indicate a data anomaly or a retroactive contract adjustment.

## Device-to-Market-Region View

The view `io_t_device_market_region_view` joins `io_t_devices` with `market_regions` to present each device alongside its target market region.

**View `io_t_device_market_region_view`**

```sql
CREATE VIEW io_t_device_market_region_view AS
SELECT a.id, a.device_identifier, a.device_name, a.device_model, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM io_t_devices a JOIN market_regions b ON a.market_region_id = b.id;
```

| id | device_identifier | device_name | device_model | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Pilot Assessment | seasonal-device-23 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | DEV-2378 | Baseline Survey | regional-device-24 | 2 | 4180948 | Adaptive Survey D |
| 3 | DEV-2384 | Distributed Corridor A | legacy-device-25 | 3 | 3012829 | Primary Corridor |
| 4 | DEV-2390 | Adaptive Series | compact-device-26 | 4 | 778576 | Composite Series |

This view answers the question: *In which market region is each device deployed, and what are the economic characteristics of that region?* The first row shows device `DEV-2372` deployed in *Distributed Assessment* (`region_id` `46d49f56-8fcc-11eb-924d-9cd76263cbd0`), which has `66` households, a housing starts rate of `18.70`, and an `extended-market-57` maturity level, and is not a target market. The second row shows device `DEV-2378` deployed in *Adaptive Survey D* (`region_id` `4180948`), which has only `5` households, a housing starts rate of `22.40`, an `integrated-market-58` maturity level, and is a target market. The view enables market-level analysis by bringing device deployment data together with regional economic indicators.

## Manufacturer-to-Device View

The view `manufacturer_io_t_device_view` joins `manufacturers` with `io_t_devices` to present each manufacturer alongside its devices.

**View `manufacturer_io_t_device_view`**

```sql
CREATE VIEW manufacturer_io_t_device_view AS
SELECT a.id, a.manufacturer_id, a.company_name, a.country_of_operation, b.id AS device_id, b.device_identifier AS device_device_identifier, b.device_name AS device_device_name
FROM manufacturers a JOIN io_t_devices b ON a.io_t_device_id = b.id;
```

| id | manufacturer_id | company_name | country_of_operation | device_id | device_device_identifier | device_device_name |
|---|---|---|---|---|---|---|
| 1 | Esperion Therapeutics Inc. | Feedback Rating | pilot-country-50 | 1 | DEV-2372 | Pilot Assessment |
| 2 | Microsoft Corporation | Virgin Group | extended-country-51 | 2 | DEV-2378 | Baseline Survey |
| 3 | Northrop Grumman | United Technologies | integrated-country-52 | 3 | DEV-2384 | Distributed Corridor A |
| 4 | Switch Card Services Ltd. | Link Title | seasonal-country-53 | 4 | DEV-2390 | Adaptive Series |

This view answers the question: *Which devices has each manufacturer produced, and what are the device-level attributes?* The first row shows *Esperion Therapeutics Inc.* (manufacturer 1) produced device `DEV-2372` (*Pilot Assessment*), model `seasonal-device-23`, with firmware `distributed-firmware-48`, manufactured on `2024-11-14T10:42:00`, and certified (`is_certified` = true). The second row shows *Microsoft Corporation* (manufacturer 2) produced device `DEV-2378` (*Baseline Survey*), model `regional-device-24`, with firmware `baseline-firmware-49`, manufactured on `2025-04-25T17:59:00`, and not certified. This view is useful for manufacturer-level product portfolio analysis.

## Manufacturer-to-Channel View

The view `manufacturer_distribution_channel_view` joins `manufacturers` with `distribution_channels` to present each manufacturer alongside its distribution channels.

**View `manufacturer_distribution_channel_view`**

```sql
CREATE VIEW manufacturer_distribution_channel_view AS
SELECT a.id, a.manufacturer_id, a.company_name, a.country_of_operation, b.channel_id AS channel_channel_id, b.channel_name AS channel_channel_name, b.region_served AS channel_region_served
FROM manufacturers a JOIN distribution_channels b ON a.channel_id = b.channel_id;
```

| id | manufacturer_id | company_name | country_of_operation | channel_channel_id | channel_channel_name | channel_region_served |
|---|---|---|---|---|---|---|
| 1 | Esperion Therapeutics Inc. | Feedback Rating | pilot-country-50 | 1562831 | Adaptive Corridor | adaptive-region-53 |
| 2 | Microsoft Corporation | Virgin Group | extended-country-51 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 |
| 3 | Northrop Grumman | United Technologies | integrated-country-52 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 |
| 4 | Switch Card Services Ltd. | Link Title | seasonal-country-53 | 4447006 | Compact Survey | pilot-region-56 |

This view answers the question: *Through which channels does each manufacturer distribute its products, and what are the channel contractual terms?* The first row shows *Esperion Therapeutics Inc.* distributes through *Adaptive Corridor* (`channel_id` `1562831`), which serves `adaptive-region-53` under a contract from `2022-01-26` to `2025-12-07`. The second row shows *Microsoft Corporation* distributes through *Primary Series* (`channel_id` `df2de334-8fcc-11eb-924d-9cd76263cbd0`), which serves `distributed-region-54` under a contract from `2023-06-10` to `2022-05-18`. This view supports channel performance analysis at the manufacturer level.

## Channel-to-Device View

The view `distribution_channel_io_t_device_view` joins `distribution_channels` with `io_t_devices` to present each channel alongside the devices it distributes.

**View `distribution_channel_io_t_device_view`**

```sql
CREATE VIEW distribution_channel_io_t_device_view AS
SELECT a.channel_id, a.channel_name, a.region_served, a.contract_start_date, b.id AS device_id, b.device_identifier AS device_device_identifier, b.device_name AS device_device_name
FROM distribution_channels a JOIN io_t_devices b ON a.io_t_device_id = b.id;
```

| channel_id | channel_name | region_served | contract_start_date | device_id | device_device_identifier | device_device_name |
|---|---|---|---|---|---|---|
| 1562831 | Adaptive Corridor | adaptive-region-53 | 2022-01-26 | 1 | DEV-2372 | Pilot Assessment |
| df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 | 2023-06-10 | 2 | DEV-2378 | Baseline Survey |
| ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 | 2024-11-21 | 3 | DEV-2384 | Distributed Corridor A |
| 4447006 | Compact Survey | pilot-region-56 | 2025-04-05 | 4 | DEV-2390 | Adaptive Series |

This view answers the question: *Which devices flow through each distribution channel?* The first row shows *Adaptive Corridor* (`channel_id` `1562831`) distributes device `DEV-2372` (*Pilot Assessment*), model `seasonal-device-23`, with firmware `distributed-firmware-48`. The second row shows *Primary Series* (`channel_id` `df2de334-8fcc-11eb-924d-9cd76263cbd0`) distributes device `DEV-2378` (*Baseline Survey*), model `regional-device-24`, with firmware `baseline-firmware-49`. This view is useful for channel throughput analysis.

## Channel-to-Market-Region View

The view `distribution_channel_market_region_view` joins `distribution_channels` with `market_regions` to present each channel alongside the market regions it serves.

**View `distribution_channel_market_region_view`**

```sql
CREATE VIEW distribution_channel_market_region_view AS
SELECT a.channel_id, a.channel_name, a.region_served, a.contract_start_date, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM distribution_channels a JOIN market_regions b ON a.market_region_id = b.id;
```

| channel_id | channel_name | region_served | contract_start_date | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1562831 | Adaptive Corridor | adaptive-region-53 | 2022-01-26 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 | 2023-06-10 | 2 | 4180948 | Adaptive Survey D |
| ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 | 2024-11-21 | 3 | 3012829 | Primary Corridor |
| 4447006 | Compact Survey | pilot-region-56 | 2025-04-05 | 4 | 778576 | Composite Series |

This view answers the question: *Which market regions does each distribution channel serve, and what are the regional economic indicators?* The first row shows *Adaptive Corridor* (`channel_id` `1562831`) serves *Distributed Assessment* (`region_id` `46d49f56-8fcc-11eb-924d-9cd76263cbd0`), which has `66` households and a housing starts rate of `18.70`. The second row shows *Primary Series* (`channel_id` `df2de334-8fcc-11eb-924d-9cd76263cbd0`) serves *Adaptive Survey D* (`region_id` `4180948`), which has `5` households and a housing starts rate of `22.40`. This view supports channel–market fit analysis.

## Market-Region-to-Channel View

The view `market_region_distribution_channel_view` joins `market_regions` with `distribution_channels` to present each market region alongside its distribution channel.

**View `market_region_distribution_channel_view`**

```sql
CREATE VIEW market_region_distribution_channel_view AS
SELECT a.id, a.region_id, a.region_name, a.household_count, b.channel_id AS channel_channel_id, b.channel_name AS channel_channel_name, b.region_served AS channel_region_served
FROM market_regions a JOIN distribution_channels b ON a.channel_id = b.channel_id;
```

| id | region_id | region_name | household_count | channel_channel_id | channel_channel_name | channel_region_served |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 66 | 1562831 | Adaptive Corridor | adaptive-region-53 |
| 2 | 4180948 | Adaptive Survey D | 5 | df2de334-8fcc-11eb-924d-9cd76263cbd0 | Primary Series | distributed-region-54 |
| 3 | 3012829 | Primary Corridor | 21 | ae409270-8fcd-11eb-924d-9cd76263cbd0 | Composite Assessment D | baseline-region-55 |
| 4 | 778576 | Composite Series | 3 | 4447006 | Compact Survey | pilot-region-56 |

This view answers the question: *Which distribution channel serves each market region, and what are the channel contractual terms?* The first row shows *Distributed Assessment* (`region_id` `46d49f56-8fcc-11eb-924d-9cd76263cbd0`) is served by *Adaptive Corridor* (`channel_id` `1562831`), which serves `adaptive-region-53` under a contract from `2022-01-26` to `2025-12-07`. The second row shows *Adaptive Survey D* (`region_id` `4180948`) is served by *Primary Series* (`channel_id` `df2de334-8fcc-11eb-924d-9cd76263cbd0`), which serves `distributed-region-54` under a contract from `2023-06-10` to `2022-05-18`. This view supports market-level channel coverage analysis.

## Market-Region-to-Device View

The view `market_region_io_t_device_view` joins `market_regions` with `io_t_devices` to present each market region alongside the devices deployed there.

**View `market_region_io_t_device_view`**

```sql
CREATE VIEW market_region_io_t_device_view AS
SELECT a.id, a.region_id, a.region_name, a.household_count, b.id AS device_id, b.device_identifier AS device_device_identifier, b.device_name AS device_device_name
FROM market_regions a JOIN io_t_devices b ON a.io_t_device_id = b.id;
```

| id | region_id | region_name | household_count | device_id | device_device_identifier | device_device_name |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 66 | 1 | DEV-2372 | Pilot Assessment |
| 2 | 4180948 | Adaptive Survey D | 5 | 2 | DEV-2378 | Baseline Survey |
| 3 | 3012829 | Primary Corridor | 21 | 3 | DEV-2384 | Distributed Corridor A |
| 4 | 778576 | Composite Series | 3 | 4 | DEV-2390 | Adaptive Series |

This view answers the question: *Which devices are deployed in each market region, and what are the device-level attributes?* The first row shows *Distributed Assessment* (`region_id` `46d49f56-8fcc-11eb-924d-9cd76263cbd0`) has device `DEV-2372` (*Pilot Assessment*), model `seasonal-device-23`, with firmware `distributed-firmware-48`, manufactured on `2024-11-14T10:42:00`. The second row shows *Adaptive Survey D* (`region_id` `4180948`) has device `DEV-2378` (*Baseline Survey*), model `regional-device-24`, with firmware `baseline-firmware-49`, manufactured on `2025-04-25T17:59:00`. This view supports regional deployment analysis.

## Safety-Certification-to-Device View

The view `safety_certification_io_t_device_view` joins `safety_certifications` with `io_t_devices` to present each certification alongside the device it covers.

**View `safety_certification_io_t_device_view`**

```sql
CREATE VIEW safety_certification_io_t_device_view AS
SELECT a.id, a.certification_id, a.standard_code, a.issuing_authority, b.id AS device_id, b.device_identifier AS device_device_identifier, b.device_name AS device_device_name
FROM safety_certifications a JOIN io_t_devices b ON a.io_t_device_id = b.id;
```

| id | certification_id | standard_code | issuing_authority | device_id | device_device_identifier | device_device_name |
|---|---|---|---|---|---|---|
| 1 | 57e439e0-8fcd-11eb-924d-9cd76263cbd0 | L459 | extended-issuing-33 | 1 | DEV-2372 | Pilot Assessment |
| 2 | acheivement-focus | account_pymes_596 | integrated-issuing-34 | 2 | DEV-2378 | Baseline Survey |
| 3 | 9246319 | 9125613 | seasonal-issuing-35 | 3 | DEV-2384 | Distributed Corridor A |
| 4 | 9125624 | 8189504 | regional-issuing-36 | 4 | DEV-2390 | Adaptive Series |

This view answers the question: *Which device does each safety certification cover, and what are the device-level attributes?* The first row shows certification `57e439e0-8fcd-11eb-924d-9cd76263cbd0` (standard code `L459`, issued by `extended-issuing-33` on `2023-02-01`, expiring `2023-10-24`, with status `regional-status-84` and scope *Integrated Model A*) covers device `DEV-2372` (*Pilot Assessment*), model `seasonal-device-23`, with firmware `distributed-firmware-48`. The second row shows certification `acheivement-focus` (standard code `account_pymes_596`, issued by `integrated-issuing-34` on `2024-07-12`, expiring `2024-03-08`, with status `legacy-status-85` and scope *Extended Cluster*) covers device `DEV-2378` (*Baseline Survey*), model `regional-device-24`, with firmware `baseline-firmware-49`. This view supports compliance auditing by bringing certification and device data together.

## Safety-Certification-to-Manufacturer View

The view `safety_certification_manufacturer_view` joins `safety_certifications` with `manufacturers` to present each certification alongside the manufacturer that holds it.

**View `safety_certification_manufacturer_view`**

```sql
CREATE VIEW safety_certification_manufacturer_view AS
SELECT a.id, a.certification_id, a.standard_code, a.issuing_authority, b.id AS manufacturer_id, b.manufacturer_id AS manufacturer_manufacturer_id, b.company_name AS manufacturer_company_name
FROM safety_certifications a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| id | certification_id | standard_code | issuing_authority | manufacturer_id | manufacturer_manufacturer_id | manufacturer_company_name |
|---|---|---|---|---|---|---|
| 1 | 57e439e0-8fcd-11eb-924d-9cd76263cbd0 | L459 | extended-issuing-33 | 1 | Esperion Therapeutics Inc. | Feedback Rating |
| 2 | acheivement-focus | account_pymes_596 | integrated-issuing-34 | 2 | Microsoft Corporation | Virgin Group |
| 3 | 9246319 | 9125613 | seasonal-issuing-35 | 3 | Northrop Grumman | United Technologies |
| 4 | 9125624 | 8189504 | regional-issuing-36 | 4 | Switch Card Services Ltd. | Link Title |

This view answers the question: *Which manufacturer holds each safety certification, and what is the manufacturer's contractual and certification context?* The first row shows certification `57e439e0-8fcd-11eb-924d-9cd76263cbd0` (standard code `L459`, issued by `extended-issuing-33` on `2023-02-01`, expiring `2023-10-24`, with status `regional-status-84` and scope *Integrated Model A*) is held by *Esperion Therapeutics Inc.* (manufacturer 1), which operates under `pilot-country-50` with a `composite-contract-99` status and `seasonal-certific-59` certification level. The second row shows certification `acheivement-focus` (standard code `account_pymes_596`, issued by `integrated-issuing-34` on `2024-07-12`, expiring `2024-03-08`, with status `legacy-status-85` and scope *Extended Cluster*) is held by *Microsoft Corporation* (manufacturer 2), which operates under `extended-country-51` with a `primary-contract-100` status and `regional-certific-60` certification level. This view supports manufacturer compliance analysis.

## IP-Asset-to-Device View

The view `intellectual_property_asset_io_t_device_view` joins `intellectual_property_assets` with `io_t_devices` to present each IP asset alongside the device it is associated with.

**View `intellectual_property_asset_io_t_device_view`**

```sql
CREATE VIEW intellectual_property_asset_io_t_device_view AS
SELECT a.asset_id, a.asset_name, a.asset_type, a.valuation_amount, b.id AS device_id, b.device_identifier AS device_device_identifier, b.device_name AS device_device_name
FROM intellectual_property_assets a JOIN io_t_devices b ON a.io_t_device_id = b.id;
```

| asset_id | asset_name | asset_type | valuation_amount | device_id | device_device_identifier | device_device_name |
|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | pilot-asset-86 | 442.51 | 1 | DEV-2372 | Pilot Assessment |
| 6564392 | Baseline Standard | extended-asset-87 | 33.06 | 2 | DEV-2378 | Baseline Survey |
| 5917296 | Distributed Framework A | integrated-asset-88 | 3,079 | 3 | DEV-2384 | Distributed Corridor A |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | seasonal-asset-89 | 45,650 | 4 | DEV-2390 | Adaptive Series |

This view answers the question: *Which device is associated with each IP asset, and what are the device-level attributes?* The first row shows asset *Pilot Programme* (`asset_id` `7731874`, type `pilot-asset-86`, valued at `442.51` in currency `gd_fp_eu_acc3`, registered on `2023-06-19`, and licensed) is associated with device `DEV-2372` (*Pilot Assessment*), model `seasonal-device-23`, with firmware `distributed-firmware-48`. The second row shows asset *Baseline Standard* (`asset_id` `6564392`, type `extended-asset-87`, valued at `33.06` in currency `managing-resources`, registered on `2024-11-03`, and not licensed) is associated with device `DEV-2378` (*Baseline Survey*), model `regional-device-24`, with firmware `baseline-firmware-49`. This view supports device-level IP portfolio analysis.

## IP-Asset-to-Manufacturer View

The view `intellectual_property_asset_manufacturer_view` joins `intellectual_property_assets` with `manufacturers` to present each IP asset alongside the manufacturer that owns it.

**View `intellectual_property_asset_manufacturer_view`**

```sql
CREATE VIEW intellectual_property_asset_manufacturer_view AS
SELECT a.asset_id, a.asset_name, a.asset_type, a.valuation_amount, b.id AS manufacturer_id, b.manufacturer_id AS manufacturer_manufacturer_id, b.company_name AS manufacturer_company_name
FROM intellectual_property_assets a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| asset_id | asset_name | asset_type | valuation_amount | manufacturer_id | manufacturer_manufacturer_id | manufacturer_company_name |
|---|---|---|---|---|---|---|
| 7731874 | Pilot Programme | pilot-asset-86 | 442.51 | 1 | Esperion Therapeutics Inc. | Feedback Rating |
| 6564392 | Baseline Standard | extended-asset-87 | 33.06 | 2 | Microsoft Corporation | Virgin Group |
| 5917296 | Distributed Framework A | integrated-asset-88 | 3,079 | 3 | Northrop Grumman | United Technologies |
| 990e161e10664c5885182d95dc07e606 | Adaptive Protocol | seasonal-asset-89 | 45,650 | 4 | Switch Card Services Ltd. | Link Title |

This view answers the question: *Which manufacturer owns each IP asset, and what is the manufacturer's contractual and certification context?* The first row shows asset *Pilot Programme* (`asset_id` `7731874`, type `pilot-asset-86`, valued at `442.51` in currency `gd_fp_eu_acc3`, registered on `2023-06-19`, and licensed) is owned by *Esperion Therapeutics Inc.* (manufacturer 1), which operates under `pilot-country-50` with a `composite-contract-99` status and `seasonal-certific-59` certification level. The second row shows asset *Baseline Standard* (`asset_id` `6564392`, type `extended-asset-87`, valued at `33.06` in currency `managing-resources`, registered on `2024-11-03`, and not licensed) is owned by *Microsoft Corporation* (manufacturer 2), which operates under `extended-country-51` with a `primary-contract-100` status and `regional-certific-60` certification level. This view supports manufacturer-level IP portfolio analysis.

## Synthesis

The schema models a device lifecycle domain through a central `io_t_devices` table that anchors the model, with six supporting tables capturing manufacturer identity, distribution channel terms, market region characteristics, safety certification records, and intellectual property assets. Each supporting table links back to `io_t_devices` via a foreign key, creating a star-like topology where the device is the central entity. The twelve join views denormalize this structure along different axes — device-to-manufacturer, device-to-channel, device-to-market-region, manufacturer-to-device, manufacturer-to-channel, channel-to-device, channel-to-market-region, market-region-to-channel, market-region-to-device, safety-certification-to-device, safety-certification-to-manufacturer, IP-asset-to-device, and IP-asset-to-manufacturer — each answering a specific analytical question by reconstructing a domain fact from the normalized tables. The result is a schema that supports both transactional integrity through normalization and analytical convenience through denormalized views, with representative values such as device `DEV-2372` (*Pilot Assessment*) produced by *Esperion Therapeutics Inc.* and distributed through *Adaptive Corridor* into market region *Distributed Assessment*, or device `DEV-2390` (*Adaptive Series*) produced by *Switch Card Services Ltd.* with IP asset *Adaptive Protocol* valued at `45,650`.