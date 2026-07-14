The farmland investment domain captures the interlocking relationships between institutional capital, land ownership, agricultural leasing, and geographic context. At its core, the model distinguishes between the physical parcels of farmland, the institutional investors who acquire them, the parent corporations that oversee those investors, the land owners who may hold or have held title, the agricultural leases that govern cultivation rights, and the geographic regions that provide spatial and regulatory context. The schema normalizes these concepts into ten base tables and eleven materialized views, each view representing a specific join that reconstructs a domain fact from the underlying normalized structure.

## Entity Types and Their Attributes

The domain begins with six core entity tables, each representing a distinct concept in the farmland ecosystem.

**Table `farmland_parcels`**

| farmland_parcel_id | parcel_id | acreage | zoning_district | soil_quality_index | purchase_date | current_market_value | institutional_investor_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | 19.20 | adaptive-zoning-95 | 15.95 | 2022-01-07T00:36:00 | 17.45 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 325464 | 21.40 | distributed-zoning-96 | 17.90 | 2023-06-18T07:53:00 | 19.90 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | 3990187 | 23.60 | baseline-zoning-97 | 19.85 | 2024-11-02T14:10:00 | 22.35 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 110 | 25.80 | pilot-zoning-98 | 21.80 | 2025-04-13T21:27:00 | 24.80 | 1003 | 4 | 2025-04-16 09:14:00 |

The `farmland_parcels` table is the central entity, anchoring every other relationship. Each row represents a distinct parcel of agricultural land, identified by a surrogate `farmland_parcel_id` (values such as `1000`, `1001`, `1002`, `1003`) and a business-level `parcel_id` (e.g., `4447034`, `325464`). The parcel carries descriptive attributes: `acreage` ranges from `19.20` to `25.80`, `zoning_district` encodes regulatory classification as strings like `adaptive-zoning-95` and `pilot-zoning-98`, and `soil_quality_index` provides a numeric quality metric between `15.95` and `21.80`. The `purchase_date` records when the parcel was acquired (e.g., `2022-01-07T00:36:00`), `current_market_value` captures its valuation (e.g., `17.45`), and `created_at` timestamps the schema record. Crucially, two foreign keys — `institutional_investor_id` and `geographic_region_id` — bind each parcel to its investor and its region, respectively.

**Table `institutional_investors`**

| institutional_investor_id | investor_id | investor_name | investor_type | total_agricultural_assets | headquarters_location | registration_date | parent_corporation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 39800621 | Adaptive Framework | pension_fund | 4.20 | composite-headquar-63 | 2023-06-19T17:27:00 | 1 |
| 1001 | 10238263 | Primary Protocol | hedge_fund | 6.40 | primary-headquar-64 | 2024-11-03T00:44:00 | 2 |
| 1002 | Catatan | Composite Programme D | private_equity | 8.60 | adaptive-headquar-65 | 2025-04-14T07:01:00 | 3 |
| 1003 | 4447007 | Compact Standard | insurance_company | 10.80 | distributed-headquar-66 | 2022-09-25T14:18:00 | 4 |

The `institutional_investors` table models the capital entities that acquire farmland. Each investor is identified by `institutional_investor_id` (`1000` through `1003`) and a business `investor_id` (e.g., `39800621`, `10238263`). The `investor_name` column holds names such as `Adaptive Framework`, `Primary Protocol`, `Catatan`, and `Compact Standard`. The `investor_type` distinguishes between `pension_fund`, `hedge_fund`, `private_equity`, and `insurance_company`. The `total_agricultural_assets` column quantifies portfolio scale (values `4.20` through `10.80`), `headquarters_location` encodes a regional identifier (e.g., `composite-headquar-63`), and `registration_date` records when the entity was registered. The `parent_corporation_id` foreign key links each investor to its parent organization.

**Table `parent_corporations`**

| parent_corporation_id | corp_id | corp_name | country_of_origin | industry_sector | founding_year | is_publicly_traded |
|---|---|---|---|---|---|---|
| 1 | 20183941 | Integrated Programme A | compact-country-80 | banking | 43 | false |
| 2 | 727038 | Extended Standard | composite-country-81 | insurance | 48 | true |
| 3 | 04ee30b4-8fb5-11eb-924d-9cd76263cbd0 | Pilot Framework | primary-country-82 | asset_management | 53 | false |
| 4 | 209230 | Baseline Protocol D | adaptive-country-83 | banking | 58 | true |

The `parent_corporations` table captures the ultimate corporate owners of institutional investors. Each corporation has a `parent_corporation_id` (`1` through `4`), a business `corp_id` (e.g., `20183941`, `727038`), and a `corp_name` such as `Integrated Programme A`, `Extended Standard`, `Pilot Framework`, and `Baseline Protocol D`. The `country_of_origin` column stores identifiers like `compact-country-80` and `composite-country-81`, `industry_sector` classifies the business as `banking`, `insurance`, or `asset_management`, `founding_year` records the age of the corporation (`43` through `58`), and `is_publicly_traded` is a boolean flag distinguishing public from private entities.

**Table `agricultural_leases`**

| id | lease_id | start_date | end_date | annual_rent | lease_status | crop_type | farmland_parcel_id | institutional_investor_id | owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844284 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1.70 | active | corn | 1000 | 1000 | Brian Hamilton |
| 101 | 168551 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 3.40 | pending | soybeans | 1001 | 1001 | Kerry West |
| 102 | 338517 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 5.10 | terminated | wheat | 1002 | 1002 | Peter Montgomery |
| 103 | 195354 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 6.80 | expired | mixed | 1003 | 1003 | Susan Wagner |

The `agricultural_leases` table models the cultivation agreements between investors and land. Each lease has a surrogate `id` (`100` through `103`), a business `lease_id` (e.g., `5844284`, `168551`), and a date range defined by `start_date` and `end_date`. The `annual_rent` column records the lease payment (e.g., `1.70`, `3.40`), `lease_status` captures the current state as `active`, `pending`, `terminated`, or `expired`, and `crop_type` specifies what is grown — `corn`, `soybeans`, `wheat`, or `mixed`. The foreign keys `farmland_parcel_id` and `institutional_investor_id` tie each lease to a specific parcel and investor, while `owner_id` references the land owner.

**Table `land_owners`**

| owner_id | owner_name | owner_type | total_land_held | retirement_status | last_sale_price | institutional_investor_id |
|---|---|---|---|---|---|---|
| Brian Hamilton | Craig Childs | individual_farmer | 8.70 | active | 233.57 | 1000 |
| Kerry West | Kimberly Smith | family_estate | 13.40 | retiring | 25.47 | 1001 |
| Peter Montgomery | Michelle Kelley | land_trust | 18.10 | deceased | 763.46 | 1002 |
| Susan Wagner | Jorge Sullivan | institutional | 22.80 | active | 12.72 | 1003 |

The `land_owners` table represents the individuals and entities that hold or have held land title. The `owner_id` column serves as both the primary key and the business identifier — values such as `Brian Hamilton`, `Kerry West`, `Peter Montgomery`, and `Susan Wagner` are the owner identifiers themselves. The `owner_name` column provides a display name (e.g., `Craig Childs`, `Kimberly Smith`), `owner_type` classifies the holder as `individual_farmer`, `family_estate`, `land_trust`, or `institutional`. The `total_land_held` column quantifies holdings (`8.70` through `22.80`), `retirement_status` tracks lifecycle state (`active`, `retiring`, `deceased`), `last_sale_price` records the most recent transaction value (e.g., `233.57`, `763.46`), and `institutional_investor_id` links the owner to their associated investor.

**Table `geographic_regions`**

| geographic_region_id | region_id | region_name | region_type | total_agricultural_acreage | average_land_price | dominant_crops |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | state | 3.70 | 11.88 | baseline-dominant-61 |
| 2 | 4180948 | Adaptive Survey D | county | 7.40 | 18.47 | pilot-dominant-62 |
| 3 | 3012829 | Primary Corridor | district | 11.10 | 37.54 | extended-dominant-63 |
| 4 | 778576 | Composite Series | state | 14.80 | 12.72 | integrated-dominant-64 |

The `geographic_regions` table provides the spatial and regulatory context for parcels. Each region has a `geographic_region_id` (`1` through `4`), a business `region_id` (e.g., `46d49f56-8fcc-11eb-924d-9cd76263cbd0`), and a `region_name` such as `Distributed Assessment`, `Adaptive Survey D`, `Primary Corridor`, and `Composite Series`. The `region_type` column distinguishes `state`, `county`, and `district` jurisdictions. The `total_agricultural_acreage` and `average_land_price` columns provide aggregate statistics (e.g., `3.70` acres, `11.88` price), and `dominant_crops` encodes the primary agricultural output (e.g., `baseline-dominant-61`).

## Junction Tables and Many-to-Many Relationships

Not all relationships in the domain are one-to-many. Some require junction tables to resolve many-to-many cardinality.

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

The `investors_parcels` table resolves the many-to-many relationship between institutional investors and farmland parcels. It contains foreign keys referencing both `institutional_investors` and `farmland_parcels`, allowing a single investor to hold multiple parcels and a single parcel to be associated with multiple investors over time.

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

The `corporations_investors` table resolves the many-to-many relationship between parent corporations and institutional investors. While the `institutional_investors` table already carries a `parent_corporation_id` foreign key suggesting a one-to-many relationship, this junction table provides an additional normalization layer, enabling a corporation to be associated with multiple investors and an investor to potentially report to multiple parent entities.

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

The `owners_parcels` table resolves the many-to-many relationship between land owners and farmland parcels. It allows a land owner to hold multiple parcels and a parcel to have multiple owners (e.g., through co-ownership or succession).

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

The `regions_parcels` table resolves the many-to-many relationship between geographic regions and farmland parcels. While `farmland_parcels` already carries a `geographic_region_id` foreign key, this junction table provides an additional layer of normalization, supporting scenarios where a parcel spans multiple regions or a region encompasses many parcels.

## Materialized Views: Reconstructing Domain Facts

The eleven views materialize specific joins across the base tables, each answering a distinct analytical question about the domain.

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

This view joins `farmland_parcels` with `institutional_investors` to answer the question: *Which institutional investor holds which farmland parcel, and what are the parcel's characteristics?* Reading row `1000` from the data, the view would show that `Adaptive Framework` (a `pension_fund` headquartered at `composite-headquar-63`) holds parcel `4447034` with `19.20` acres, `soil_quality_index` of `15.95`, and a `current_market_value` of `17.45`. Row `1003` reveals that `Compact Standard` (an `insurance_company`) holds parcel `110` with `25.80` acres and a `current_market_value` of `24.80`.

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

This view joins `farmland_parcels` with `geographic_regions` to answer: *Which geographic region contains which farmland parcel, and what are the region's aggregate statistics?* Row `1000` would show that parcel `4447034` (with `19.20` acres) resides in region `Distributed Assessment` (a `state` with `3.70` total agricultural acres and `11.88` average land price). Row `1002` would show that parcel `3990187` (with `23.60` acres) resides in region `Primary Corridor` (a `district` with `11.10` total agricultural acres and `37.54` average land price).

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

This view joins `institutional_investors` with `farmland_parcels` to answer: *What is the detailed portfolio of each institutional investor across their farmland holdings?* Row `1000` would show that `Adaptive Framework` (a `pension_fund` with `4.20` total agricultural assets) holds parcel `4447034` with `19.20` acres and `soil_quality_index` of `15.95`. Row `1002` would show that `Catatan` (a `private_equity` firm with `8.60` total agricultural assets) holds parcel `3990187` with `23.60` acres and `soil_quality_index` of `19.85`.

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

This view joins `institutional_investors` with `parent_corporations` to answer: *Which parent corporation oversees which institutional investor, and what is the corporation's profile?* Row `1000` would show that `Adaptive Framework` is overseen by `Integrated Programme A` (a `banking` sector corporation from `compact-country-80`, founded in year `43`, not publicly traded). Row `1001` would show that `Primary Protocol` is overseen by `Extended Standard` (an `insurance` sector corporation from `composite-country-81`, founded in year `48`, publicly traded).

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

This view joins `parent_corporations` with `institutional_investors` to answer: *Which institutional investors does each parent corporation oversee, and what are their profiles?* Row `1` would show that `Integrated Programme A` (a `banking` corporation from `compact-country-80`) oversees `Adaptive Framework` (a `pension_fund` with `4.20` total agricultural assets). Row `4` would show that `Baseline Protocol D` (a `banking` corporation from `adaptive-country-83`, publicly traded) oversees `Compact Standard` (an `insurance_company` with `10.80` total agricultural assets).

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

This view joins `agricultural_leases` with `farmland_parcels` to answer: *Which farmland parcel is subject to which agricultural lease, and what are the lease terms?* Row `100` would show that parcel `4447034` (with `19.20` acres) is subject to lease `5844284` with `annual_rent` of `1.70`, `crop_type` of `corn`, and `lease_status` of `active`. Row `102` would show that parcel `3990187` (with `23.60` acres) is subject to lease `338517` with `annual_rent` of `5.10`, `crop_type` of `wheat`, and `lease_status` of `terminated`.

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

This view joins `agricultural_leases` with `institutional_investors` to answer: *Which institutional investor is party to which agricultural lease, and what are the lease terms?* Row `100` would show that `Adaptive Framework` (a `pension_fund`) is party to lease `5844284` with `annual_rent` of `1.70`, `crop_type` of `corn`, and `lease_status` of `active`. Row `103` would show that `Compact Standard` (an `insurance_company`) is party to lease `195354` with `annual_rent` of `6.80`, `crop_type` of `mixed`, and `lease_status` of `expired`.

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

This view joins `agricultural_leases` with `land_owners` to answer: *Which land owner is associated with which agricultural lease, and what are the lease terms?* Row `100` would show that `Brian Hamilton` (an `individual_farmer` with `8.70` total land held and `active` retirement status) is associated with lease `5844284` with `annual_rent` of `1.70` and `crop_type` of `corn`. Row `102` would show that `Peter Montgomery` (a `land_trust` with `18.10` total land held and `deceased` retirement status) is associated with lease `338517` with `annual_rent` of `5.10` and `crop_type` of `wheat`.

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

This view joins `land_owners` with `farmland_parcels` to answer: *Which land owner holds which farmland parcel, and what are the parcel's characteristics?* Row `Brian Hamilton` would show that this `individual_farmer` (with `8.70` total land held and `last_sale_price` of `233.57`) is associated with parcel `4447034` (with `19.20` acres, `soil_quality_index` of `15.95`, and `current_market_value` of `17.45`). Row `Susan Wagner` would show that this `institutional` owner (with `22.80` total land held and `last_sale_price` of `12.72`) is associated with parcel `110` (with `25.80` acres, `soil_quality_index` of `21.80`, and `current_market_value` of `24.80`).

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

This view joins `land_owners` with `institutional_investors` to answer: *Which institutional investor is associated with which land owner, and what are their profiles?* Row `Brian Hamilton` would show that this `individual_farmer` (with `8.70` total land held) is associated with `Adaptive Framework` (a `pension_fund` with `4.20` total agricultural assets). Row `Susan Wagner` would show that this `institutional` owner (with `22.80` total land held) is associated with `Compact Standard` (an `insurance_company` with `10.80` total agricultural assets).

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

This view joins `geographic_regions` with `farmland_parcels` to answer: *Which farmland parcels reside in which geographic region, and what are the parcel's characteristics?* Row `1` would show that region `Distributed Assessment` (a `state` with `3.70` total agricultural acres and `11.88` average land price) contains parcel `4447034` (with `19.20` acres, `soil_quality_index` of `15.95`, and `current_market_value` of `17.45`). Row `4` would show that region `Composite Series` (a `state` with `14.80` total agricultural acres and `12.72` average land price) contains parcel `110` (with `25.80` acres, `soil_quality_index` of `21.80`, and `current_market_value` of `24.80`).

## Synthesis

The schema models the farmland investment domain as a network of six core entities — parcels, investors, parent corporations, leases, land owners, and geographic regions — connected through foreign keys and four junction tables that resolve many-to-many relationships. The eleven materialized views each reconstruct a specific domain fact by joining two base tables, enabling analytical queries without requiring ad-hoc joins. The design reflects a deliberate trade-off: normalization reduces redundancy and enforces referential integrity, while the views provide denormalized access patterns for common analytical workflows. Every row in every view can be traced back to its constituent base tables, ensuring that the materialized results remain faithful to the underlying normalized model.