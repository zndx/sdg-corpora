# Farmland Investment and Agricultural Land Management

The acquisition, leasing, and management of agricultural land represent a complex intersection of finance, geography, and operational logistics. Institutional investors—pension funds, hedge funds, private equity firms, and insurance companies—acquire farmland parcels, often under the umbrella of parent corporations, and then lease those parcels to land owners who cultivate the soil. This chapter documents the data model that tracks every layer of that chain: the parcels themselves, the investors and their corporate hierarchies, the geographic regions in which the land sits, the land owners who work the fields, and the agricultural leases that bind investors to owners.

## The Farmland Parcel

At the core of the system is the farmland parcel, a discrete tract of agricultural land with measurable attributes.

**Table `farmland_parcels`**

| farmland_parcel_id | parcel_id | acreage | zoning_district | soil_quality_index | purchase_date | current_market_value | institutional_investor_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | 19.20 | adaptive-zoning-95 | 15.95 | 2022-01-07T00:36:00 | 17.45 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 325464 | 21.40 | distributed-zoning-96 | 17.90 | 2023-06-18T07:53:00 | 19.90 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | 3990187 | 23.60 | baseline-zoning-97 | 19.85 | 2024-11-02T14:10:00 | 22.35 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 110 | 25.80 | pilot-zoning-98 | 21.80 | 2025-04-13T21:27:00 | 24.80 | 1003 | 4 | 2025-04-16 09:14:00 |

Each parcel carries a unique internal identifier alongside a parcel_id that links to external land registries. The acreage column records the physical size of the tract; in the sample data, parcels range from 19.20 acres (parcel_id 4447034) to 25.80 acres (parcel_id 110). The zoning_district field classifies the regulatory environment—adaptive-zoning-95, distributed-zoning-96, baseline-zoning-97, and pilot-zoning-98 appear in the dataset. The soil_quality_index provides a quantitative measure of land productivity, with values from 15.95 to 21.80 in the sample. The purchase_date and current_market_value columns track the financial timeline of the asset. Every parcel is assigned to an institutional investor (via institutional_investor_id) and a geographic region (via geographic_region_id), establishing the two primary relationships that anchor the rest of the model.

## Institutional Investors and Corporate Hierarchy

Farmland is rarely held directly by individuals. Instead, institutional investors serve as the acquiring entities, and each investor is linked to a parent corporation that provides governance and capital.

**Table `institutional_investors`**

| institutional_investor_id | investor_id | investor_name | investor_type | total_agricultural_assets | headquarters_location | registration_date | parent_corporation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 39800621 | Adaptive Framework | pension_fund | 4.20 | composite-headquar-63 | 2023-06-19T17:27:00 | 1 |
| 1001 | 10238263 | Primary Protocol | hedge_fund | 6.40 | primary-headquar-64 | 2024-11-03T00:44:00 | 2 |
| 1002 | Catatan | Composite Programme D | private_equity | 8.60 | adaptive-headquar-65 | 2025-04-14T07:01:00 | 3 |
| 1003 | 4447007 | Compact Standard | insurance_company | 10.80 | distributed-headquar-66 | 2022-09-25T14:18:00 | 4 |

The institutional_investors table records the investor_id, investor_name, and investor_type. The four sample investors—Adaptive Framework (a pension_fund), Primary Protocol (a hedge_fund), Catatan Composite Programme D (a private_equity firm), and Compact Standard (an insurance_company)—hold total_agricultural_assets ranging from 4.20 to 10.80. Their headquarters_location values (composite-headquar-63, primary-headquar-64, adaptive-headquar-65, distributed-headquar-66) encode regional operational bases. The registration_date marks when the investor entered the system, and the parent_corporation_id links each investor to its corporate parent.

**Table `parent_corporations`**

| parent_corporation_id | corp_id | corp_name | country_of_origin | industry_sector | founding_year | is_publicly_traded |
|---|---|---|---|---|---|---|
| 1 | 20183941 | Integrated Programme A | compact-country-80 | banking | 43 | false |
| 2 | 727038 | Extended Standard | composite-country-81 | insurance | 48 | true |
| 3 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | Pilot Framework | primary-country-82 | asset_management | 53 | false |
| 4 | 209230 | Baseline Protocol D | adaptive-country-83 | banking | 58 | true |

The parent_corporations table defines the corporate entities above the investors. Integrated Programme A (corp_id 20183941) operates in the banking sector and was founded in year 43; Extended Standard (corp_id 727038) is in insurance, founded in year 48, and is publicly traded. Pilot Framework (corp_id 04ee30b4-8fb5-11eb-924d-9cd76263cbd0) works in asset_management, and Baseline Protocol D (corp_id 209230) is in banking, founded in year 58, and publicly traded. The country_of_origin and industry_sector columns provide the geopolitical and economic context for each corporation. The is_publicly_traded flag distinguishes between publicly listed and private entities.

The bridge between parent corporations and institutional investors is maintained through the corporations_investors relationship table, which records the linkage explicitly.

**Table `corporations_investors`**

| parent_corporation_id | institutional_investor_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## Geographic Regions

Every farmland parcel sits within a geographic region, and each region aggregates agricultural statistics that inform investment decisions.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | region_type | total_agricultural_acreage | average_land_price | dominant_crops |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | state | 3.70 | 11.88 | baseline-dominant-61 |
| 2 | 4180948 | Adaptive Survey D | county | 7.40 | 18.47 | pilot-dominant-62 |
| 3 | 3012829 | Primary Corridor | district | 11.10 | 37.54 | extended-dominant-63 |
| 4 | 778576 | Composite Series | state | 14.80 | 12.72 | integrated-dominant-64 |

The geographic_regions table assigns a geographic_region_id and a region_id to each area. The region_name (Distributed Assessment, Adaptive Survey D, Primary Corridor, Composite Series) and region_type (state, county, district) describe the administrative classification. The total_agricultural_acreage and average_land_price columns provide macro-level economic indicators; for example, Primary Corridor (region_id 3012829) reports 11.10 total agricultural acres at an average land price of 37.54, the highest in the sample. The dominant_crops field (baseline-dominant-61, pilot-dominant-62, extended-dominant-63, integrated-dominant-64) indicates the primary crop varieties grown in each region. The regions_parcels relationship table connects parcels to their regions.

**Table `regions_parcels`**

| geographic_region_id | farmland_parcel_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## Land Owners and Leasing

The operational layer of the model connects investors to the people and entities that actually cultivate the land. Land owners hold the parcels under lease from the institutional investors.

**Table `land_owners`**

| owner_id | owner_name | owner_type | total_land_held | retirement_status | last_sale_price | institutional_investor_id |
|---|---|---|---|---|---|---|
| Brian Hamilton | Craig Childs | individual_farmer | 8.70 | active | 233.57 | 1000 |
| Kerry West | Kimberly Smith | family_estate | 13.40 | retiring | 25.47 | 1001 |
| Peter Montgomery | Michelle Kelley | land_trust | 18.10 | deceased | 763.46 | 1002 |
| Susan Wagner | Jorge Sullivan | institutional | 22.80 | active | 12.72 | 1003 |

The land_owners table records the owner_id (which doubles as the owner_name in this dataset), the owner_name (a secondary identifier), and the owner_type, which classifies the entity as an individual_farmer, family_estate, land_trust, or institutional operator. The total_land_held column measures the aggregate acreage managed by each owner, ranging from 8.70 to 22.80. The retirement_status field (active, retiring, deceased) captures the lifecycle stage of the owner. The last_sale_price records the most recent transaction value for the owner's land portfolio. Each owner is linked to an institutional_investor_id, establishing the investor-owner relationship. The owners_parcels relationship table tracks which parcels each owner manages.

**Table `owners_parcels`**

| owner_id | farmland_parcel_id |
|---|---|
| Brian Hamilton | 1000 |
| Brian Hamilton | 1001 |
| Kerry West | 1001 |
| Kerry West | 1002 |
| Peter Montgomery | 1002 |
| Peter Montgomery | 1003 |
| Susan Wagner | 1003 |
| Susan Wagner | 1000 |

## Agricultural Leases

The agricultural lease is the contractual instrument that binds the system together. It specifies the terms under which a land owner cultivates a parcel owned by an institutional investor.

**Table `agricultural_leases`**

| id | lease_id | start_date | end_date | annual_rent | lease_status | crop_type | farmland_parcel_id | institutional_investor_id | owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844284 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1.70 | active | corn | 1000 | 1000 | Brian Hamilton |
| 101 | 168551 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 3.40 | pending | soybeans | 1001 | 1001 | Kerry West |
| 102 | 338517 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 5.10 | terminated | wheat | 1002 | 1002 | Peter Montgomery |
| 103 | 195354 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 6.80 | expired | mixed | 1003 | 1003 | Susan Wagner |

Each lease has an internal id and a lease_id for external reference. The start_date and end_date define the lease term; in the sample, lease 5844284 spans from 2022-09-05 to 2022-09-01, and lease 195354 runs from 2025-12-11 to 2025-12-07. The annual_rent column records the yearly payment, ranging from 1.70 to 6.80. The lease_status field (active, pending, terminated, expired) indicates the current state of the agreement. The crop_type column (corn, soybeans, wheat, mixed) specifies what is grown on the leased land. Each lease references a farmland_parcel_id, an institutional_investor_id, and an owner_id, creating a three-way link between the physical asset, the financial owner, and the cultivator.

## Investors and Parcels

The investors_parcels relationship table formalizes the connection between institutional investors and the farmland parcels they hold.

**Table `investors_parcels`**

| institutional_investor_id | farmland_parcel_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

This table enables many-to-many relationships where an investor may hold multiple parcels and a parcel may be associated with multiple investors over time. The sample data shows investor 1000 (Adaptive Framework) holding parcel 1000, investor 1001 (Primary Protocol) holding parcel 1001, and so on, with each investor-region pair forming a coherent investment portfolio.

## Viewed Relationships

The system provides several pre-joined views that answer common analytical questions by combining data from multiple tables.

The farmland_parcel_institutional_investor_view answers the question: which institutional investor holds which farmland parcel, and what are the parcel's key attributes?

**View `farmland_parcel_institutional_investor_view`**

```sql
CREATE VIEW farmland_parcel_institutional_investor_view AS
SELECT a.farmland_parcel_id, a.parcel_id, a.acreage, a.zoning_district, b.institutional_investor_id AS investor_institutional_investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM farmland_parcels a JOIN institutional_investors b ON a.institutional_investor_id = b.institutional_investor_id;
```

| farmland_parcel_id | parcel_id | acreage | zoning_district | investor_institutional_investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | 19.20 | adaptive-zoning-95 | 1000 | 39800621 | Adaptive Framework |
| 1001 | 325464 | 21.40 | distributed-zoning-96 | 1001 | 10238263 | Primary Protocol |
| 1002 | 3990187 | 23.60 | baseline-zoning-97 | 1002 | Catatan | Composite Programme D |
| 1003 | 110 | 25.80 | pilot-zoning-98 | 1003 | 4447007 | Compact Standard |

Reading the first row of this view, we see that parcel 4447034 (19.20 acres, soil_quality_index 15.95, purchased 2022-01-07) is held by Adaptive Framework, a pension_fund headquartered at composite-headquar-63. The second row shows that parcel 325464 (21.40 acres, soil_quality_index 17.90, purchased 2023-06-18) is held by Primary Protocol, a hedge_fund. This view is the primary tool for portfolio-level analysis, allowing analysts to assess the composition of an investor's farmland holdings at a glance.

The farmland_parcel_geographic_region_view answers: which geographic region contains which parcel, and what are the regional economic indicators?

**View `farmland_parcel_geographic_region_view`**

```sql
CREATE VIEW farmland_parcel_geographic_region_view AS
SELECT a.farmland_parcel_id, a.parcel_id, a.acreage, a.zoning_district, b.geographic_region_id AS region_geographic_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM farmland_parcels a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| farmland_parcel_id | parcel_id | acreage | zoning_district | region_geographic_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | 19.20 | adaptive-zoning-95 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 1001 | 325464 | 21.40 | distributed-zoning-96 | 2 | 4180948 | Adaptive Survey D |
| 1002 | 3990187 | 23.60 | baseline-zoning-97 | 3 | 3012829 | Primary Corridor |
| 1003 | 110 | 25.80 | pilot-zoning-98 | 4 | 778576 | Composite Series |

In the first row, parcel 4447034 is located in the region named Distributed Assessment (region_type state), which has total_agricultural_acreage of 3.70 and average_land_price of 11.88. The second row places parcel 325464 in Adaptive Survey D (region_type county), with average_land_price of 18.47. This view supports regional benchmarking, enabling investors to compare the performance of their holdings across different geographic markets.

The institutional_investor_farmland_parcel_detail_view provides a granular look at each investor's parcel-level holdings, combining investor metadata with parcel attributes.

**View `institutional_investor_farmland_parcel_detail_view`**

```sql
CREATE VIEW institutional_investor_farmland_parcel_detail_view AS
SELECT a.institutional_investor_id, a.investor_id, a.investor_name, b.farmland_parcel_id AS parcel_farmland_parcel_id, b.parcel_id AS parcel_parcel_id, b.acreage AS parcel_acreage
FROM institutional_investors a
  JOIN investors_parcels j ON j.institutional_investor_id = a.institutional_investor_id
  JOIN farmland_parcels b ON b.farmland_parcel_id = j.farmland_parcel_id;
```

| institutional_investor_id | investor_id | investor_name | parcel_farmland_parcel_id | parcel_parcel_id | parcel_acreage |
|---|---|---|---|---|---|
| 1000 | 39800621 | Adaptive Framework | 1000 | 4447034 | 19.20 |
| 1000 | 39800621 | Adaptive Framework | 1001 | 325464 | 21.40 |
| 1001 | 10238263 | Primary Protocol | 1001 | 325464 | 21.40 |
| 1001 | 10238263 | Primary Protocol | 1002 | 3990187 | 23.60 |
| 1002 | Catatan | Composite Programme D | 1002 | 3990187 | 23.60 |
| 1002 | Catatan | Composite Programme D | 1003 | 110 | 25.80 |
| 1003 | 4447007 | Compact Standard | 1003 | 110 | 25.80 |
| 1003 | 4447007 | Compact Standard | 1000 | 4447034 | 19.20 |

The first row shows that Adaptive Framework (investor_id 39800621, total_agricultural_assets 4.20) holds parcel 4447034 with current_market_value 17.45. The third row shows Catatan Composite Programme D (investor_id Catatan, total_agricultural_assets 8.60) holds parcel 3990187 with current_market_value 22.35. This view is useful for calculating per-investor portfolio metrics such as total acreage, average soil quality, and aggregate market value.

The institutional_investor_parent_corporation_view reveals the corporate hierarchy: which parent corporation oversees which institutional investor.

**View `institutional_investor_parent_corporation_view`**

```sql
CREATE VIEW institutional_investor_parent_corporation_view AS
SELECT a.institutional_investor_id, a.investor_id, a.investor_name, a.investor_type, b.parent_corporation_id AS corporation_parent_corporation_id, b.corp_id AS corporation_corp_id, b.corp_name AS corporation_corp_name
FROM institutional_investors a JOIN parent_corporations b ON a.parent_corporation_id = b.parent_corporation_id;
```

| institutional_investor_id | investor_id | investor_name | investor_type | corporation_parent_corporation_id | corporation_corp_id | corporation_corp_name |
|---|---|---|---|---|---|---|
| 1000 | 39800621 | Adaptive Framework | pension_fund | 1 | 20183941 | Integrated Programme A |
| 1001 | 10238263 | Primary Protocol | hedge_fund | 2 | 727038 | Extended Standard |
| 1002 | Catatan | Composite Programme D | private_equity | 3 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | Pilot Framework |
| 1003 | 4447007 | Compact Standard | insurance_company | 4 | 209230 | Baseline Protocol D |

The first row shows that Integrated Programme A (a banking corporation founded in year 43, not publicly traded) oversees Adaptive Framework. The second row shows that Extended Standard (an insurance corporation founded in year 48, publicly traded) oversees Primary Protocol. This view is essential for understanding the ultimate corporate ownership of farmland assets and for assessing the financial stability of the parent entities.

The parent_corporation_institutional_investor_detail_view provides the reverse perspective, starting from the corporation and listing all its investor subsidiaries with their farmland holdings.

**View `parent_corporation_institutional_investor_detail_view`**

```sql
CREATE VIEW parent_corporation_institutional_investor_detail_view AS
SELECT a.parent_corporation_id, a.corp_id, a.corp_name, b.institutional_investor_id AS investor_institutional_investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM parent_corporations a
  JOIN corporations_investors j ON j.parent_corporation_id = a.parent_corporation_id
  JOIN institutional_investors b ON b.institutional_investor_id = j.institutional_investor_id;
```

| parent_corporation_id | corp_id | corp_name | investor_institutional_investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|
| 1 | 20183941 | Integrated Programme A | 1000 | 39800621 | Adaptive Framework |
| 1 | 20183941 | Integrated Programme A | 1001 | 10238263 | Primary Protocol |
| 2 | 727038 | Extended Standard | 1001 | 10238263 | Primary Protocol |
| 2 | 727038 | Extended Standard | 1002 | Catatan | Composite Programme D |
| 3 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | Pilot Framework | 1002 | Catatan | Composite Programme D |
| 3 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | Pilot Framework | 1003 | 4447007 | Compact Standard |
| 4 | 209230 | Baseline Protocol D | 1003 | 4447007 | Compact Standard |
| 4 | 209230 | Baseline Protocol D | 1000 | 39800621 | Adaptive Framework |

In the first row, Integrated Programme A oversees Adaptive Framework, which holds parcel 4447034 (19.20 acres, soil_quality_index 15.95). In the second row, Extended Standard oversees Primary Protocol, which holds parcel 325464 (21.40 acres, soil_quality_index 17.90). This view supports corporate-level consolidation and reporting.

The agricultural_lease_farmland_parcel_view answers: which lease applies to which parcel, and what are the parcel's characteristics?

**View `agricultural_lease_farmland_parcel_view`**

```sql
CREATE VIEW agricultural_lease_farmland_parcel_view AS
SELECT a.id, a.lease_id, a.start_date, a.end_date, b.farmland_parcel_id AS parcel_farmland_parcel_id, b.parcel_id AS parcel_parcel_id, b.acreage AS parcel_acreage
FROM agricultural_leases a JOIN farmland_parcels b ON a.farmland_parcel_id = b.farmland_parcel_id;
```

| id | lease_id | start_date | end_date | parcel_farmland_parcel_id | parcel_parcel_id | parcel_acreage |
|---|---|---|---|---|---|---|
| 100 | 5844284 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 4447034 | 19.20 |
| 101 | 168551 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 325464 | 21.40 |
| 102 | 338517 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 3990187 | 23.60 |
| 103 | 195354 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 110 | 25.80 |

The first row shows that lease 5844284 (annual_rent 1.70, status active, crop_type corn) applies to parcel 4447034 (19.20 acres, soil_quality_index 15.95). The second row shows that lease 168551 (annual_rent 3.40, status pending, crop_type soybeans) applies to parcel 325464 (21.40 acres, soil_quality_index 17.90). This view is the primary tool for lease administration and crop planning.

The agricultural_lease_institutional_investor_view answers: which investor is the counterparty to each lease?

**View `agricultural_lease_institutional_investor_view`**

```sql
CREATE VIEW agricultural_lease_institutional_investor_view AS
SELECT a.id, a.lease_id, a.start_date, a.end_date, b.institutional_investor_id AS investor_institutional_investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM agricultural_leases a JOIN institutional_investors b ON a.institutional_investor_id = b.institutional_investor_id;
```

| id | lease_id | start_date | end_date | investor_institutional_investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|---|
| 100 | 5844284 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 39800621 | Adaptive Framework |
| 101 | 168551 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 10238263 | Primary Protocol |
| 102 | 338517 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | Catatan | Composite Programme D |
| 103 | 195354 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 4447007 | Compact Standard |

The first row shows that lease 5844284 (annual_rent 1.70, crop_type corn) is with Adaptive Framework, a pension_fund. The third row shows that lease 338517 (annual_rent 5.10, crop_type wheat, status terminated) is with Catatan Composite Programme D, a private_equity firm. This view supports revenue tracking and investor-level lease portfolio analysis.

The agricultural_lease_land_owner_view answers: which land owner is the cultivator under each lease?

**View `agricultural_lease_land_owner_view`**

```sql
CREATE VIEW agricultural_lease_land_owner_view AS
SELECT a.id, a.lease_id, a.start_date, a.end_date, b.owner_id AS owner_owner_id, b.owner_name AS owner_owner_name, b.owner_type AS owner_owner_type
FROM agricultural_leases a JOIN land_owners b ON a.owner_id = b.owner_id;
```

| id | lease_id | start_date | end_date | owner_owner_id | owner_owner_name | owner_owner_type |
|---|---|---|---|---|---|---|
| 100 | 5844284 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Brian Hamilton | Craig Childs | individual_farmer |
| 101 | 168551 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Kerry West | Kimberly Smith | family_estate |
| 102 | 338517 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Peter Montgomery | Michelle Kelley | land_trust |
| 103 | 195354 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Susan Wagner | Jorge Sullivan | institutional |

The first row shows that lease 5844284 (annual_rent 1.70, status active) is with Brian Hamilton (Craig Childs), an individual_farmer who holds 8.70 total land and is active. The third row shows that lease 338517 (annual_rent 5.10, status terminated) is with Peter Montgomery (Michelle Kelley), a land_trust that holds 18.10 total land and has a deceased status. This view is essential for operational management and owner communication.

The land_owner_farmland_parcel_detail_view answers: which parcels does each land owner cultivate, and what are the parcel attributes?

**View `land_owner_farmland_parcel_detail_view`**

```sql
CREATE VIEW land_owner_farmland_parcel_detail_view AS
SELECT a.owner_id, a.owner_name, a.owner_type, b.farmland_parcel_id AS parcel_farmland_parcel_id, b.parcel_id AS parcel_parcel_id, b.acreage AS parcel_acreage
FROM land_owners a
  JOIN owners_parcels j ON j.owner_id = a.owner_id
  JOIN farmland_parcels b ON b.farmland_parcel_id = j.farmland_parcel_id;
```

| owner_id | owner_name | owner_type | parcel_farmland_parcel_id | parcel_parcel_id | parcel_acreage |
|---|---|---|---|---|---|
| Brian Hamilton | Craig Childs | individual_farmer | 1000 | 4447034 | 19.20 |
| Brian Hamilton | Craig Childs | individual_farmer | 1001 | 325464 | 21.40 |
| Kerry West | Kimberly Smith | family_estate | 1001 | 325464 | 21.40 |
| Kerry West | Kimberly Smith | family_estate | 1002 | 3990187 | 23.60 |
| Peter Montgomery | Michelle Kelley | land_trust | 1002 | 3990187 | 23.60 |
| Peter Montgomery | Michelle Kelley | land_trust | 1003 | 110 | 25.80 |
| Susan Wagner | Jorge Sullivan | institutional | 1003 | 110 | 25.80 |
| Susan Wagner | Jorge Sullivan | institutional | 1000 | 4447034 | 19.20 |

The first row shows that Brian Hamilton (Craig Childs), an individual_farmer with 8.70 total land held, cultivates parcel 4447034 (19.20 acres, soil_quality_index 15.95, current_market_value 17.45). The second row shows that Kerry West (Kimberly Smith), a family_estate with 13.40 total land held and retiring status, cultivates parcel 325464 (21.40 acres, soil_quality_index 17.90, current_market_value 19.90). This view supports land owner performance analysis and portfolio optimization.

The land_owner_institutional_investor_view answers: which institutional investor is the lessor for each land owner?

**View `land_owner_institutional_investor_view`**

```sql
CREATE VIEW land_owner_institutional_investor_view AS
SELECT a.owner_id, a.owner_name, a.owner_type, a.total_land_held, b.institutional_investor_id AS investor_institutional_investor_id, b.investor_id AS investor_investor_id, b.investor_name AS investor_investor_name
FROM land_owners a JOIN institutional_investors b ON a.institutional_investor_id = b.institutional_investor_id;
```

| owner_id | owner_name | owner_type | total_land_held | investor_institutional_investor_id | investor_investor_id | investor_investor_name |
|---|---|---|---|---|---|---|
| Brian Hamilton | Craig Childs | individual_farmer | 8.70 | 1000 | 39800621 | Adaptive Framework |
| Kerry West | Kimberly Smith | family_estate | 13.40 | 1001 | 10238263 | Primary Protocol |
| Peter Montgomery | Michelle Kelley | land_trust | 18.10 | 1002 | Catatan | Composite Programme D |
| Susan Wagner | Jorge Sullivan | institutional | 22.80 | 1003 | 4447007 | Compact Standard |

The first row shows that Brian Hamilton (Craig Childs), an individual_farmer, is leased from Adaptive Framework, a pension_fund with total_agricultural_assets of 4.20. The fourth row shows that Susan Wagner (Jorge Sullivan), an institutional owner with 22.80 total land held, is leased from Compact Standard, an insurance_company with total_agricultural_assets of 10.80. This view clarifies the investor-owner contractual relationships.

The geographic_region_farmland_parcel_detail_view answers: which parcels fall within each geographic region, and what are the regional economic indicators?

**View `geographic_region_farmland_parcel_detail_view`**

```sql
CREATE VIEW geographic_region_farmland_parcel_detail_view AS
SELECT a.geographic_region_id, a.region_id, a.region_name, b.farmland_parcel_id AS parcel_farmland_parcel_id, b.parcel_id AS parcel_parcel_id, b.acreage AS parcel_acreage
FROM geographic_regions a
  JOIN regions_parcels j ON j.geographic_region_id = a.geographic_region_id
  JOIN farmland_parcels b ON b.farmland_parcel_id = j.farmland_parcel_id;
```

| geographic_region_id | region_id | region_name | parcel_farmland_parcel_id | parcel_parcel_id | parcel_acreage |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 1000 | 4447034 | 19.20 |
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 1001 | 325464 | 21.40 |
| 2 | 4180948 | Adaptive Survey D | 1001 | 325464 | 21.40 |
| 2 | 4180948 | Adaptive Survey D | 1002 | 3990187 | 23.60 |
| 3 | 3012829 | Primary Corridor | 1002 | 3990187 | 23.60 |
| 3 | 3012829 | Primary Corridor | 1003 | 110 | 25.80 |
| 4 | 778576 | Composite Series | 1003 | 110 | 25.80 |
| 4 | 778576 | Composite Series | 1000 | 4447034 | 19.20 |

The first row shows that the region Distributed Assessment (region_type state, total_agricultural_acreage 3.70, average_land_price 11.88, dominant_crops baseline-dominant-61) contains parcel 4447034 (19.20 acres, soil_quality_index 15.95, current_market_value 17.45). The third row shows that the region Primary Corridor (region_type district, total_agricultural_acreage 11.10, average_land_price 37.54, dominant_crops extended-dominant-63) contains parcel 3990187 (23.60 acres, soil_quality_index 19.85, current_market_value 22.35). This view supports regional investment strategy and market analysis.

## Synthesis

The farmland investment model described here captures the full chain of ownership, leasing, and cultivation. Farmland parcels are the physical assets, characterized by acreage, soil quality, zoning, and market value. Institutional investors acquire these parcels, often under the governance of parent corporations in sectors such as banking, insurance, and asset management. Each parcel is situated within a geographic region that provides macro-level economic context. Land owners—whether individual farmers, family estates, land trusts, or institutional operators—cultivate the parcels under agricultural leases that specify rent, crop type, and lease status. The relationship tables (investors_parcels, corporations_investors, owners_parcels, regions_parcels) formalize the many-to-many connections that arise in practice, while the pre-joined views provide ready-made analytical lenses for portfolio management, corporate consolidation, lease administration, and regional benchmarking. Together, these records form a coherent operational picture of modern institutional farmland investment.