## Domain Modelling and Relational Materialization

The festival management domain captures the lifecycle of participating entities—organizations, clubs, and initiatives—as they apply for, are evaluated at, and occupy physical space within festival venues. The data model separates concerns across six base tables that together encode who participates, where they exhibit, what products they showcase, and how venues allocate booths. The model is deliberately normalized: entity identity, participation records, booth assignments, venue metadata, product catalogues, and the many-to-many venue-to-booth allocation are each stored in their own relation, with foreign keys and a junction table stitching them into a coherent queryable whole.

### Base Tables and Entity Types

The anchor of the model is `participating_entities`, which stores the roster of organizations and individuals that engage with the festival system. Each row carries a surrogate `participating_entity_id` (e.g. `100`, `101`, `102`, `103`), a human-readable `entity_identifier` such as `ENT-2129` or `ENT-2147`, and an `entity_type` that classifies the participant as `FPO`, `FPC`, `FIG`, or `Farmers_Club`. The `entity_name` column holds descriptive labels like `Regional Cluster`, `Seasonal Review D`, `Integrated Initiative`, and `Extended Model`. Contact information is captured across `contact_person`, `contact_address`, and `contact_phone`—for instance, row `100` lists `Alyssa Chung` as the contact person with phone `Joe Tsai`, while row `103` records `Peter Montgomery` at `Walter Pratt`. The `enrolment_status` column tracks the lifecycle stage of each entity, taking values `pending`, `evaluating`, `enrolled`, and `rejected`. Notably, `participating_entities` also carries `festival_participation_id` and `festival_booth_id` columns, which serve as denormalized pointers to the participation and booth records that reference this entity, enabling direct lookups without joins.

**Table `participating_entities`**

| participating_entity_id | entity_identifier | entity_type | entity_name | contact_person | contact_address | contact_phone | enrolment_status | festival_participation_id | festival_booth_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ENT-2129 | FPO | Regional Cluster | Alyssa Chung | Kimberly Maynard | Joe Tsai | pending | 1000 | 1 |
| 101 | ENT-2135 | FPC | Seasonal Review D | Brianna Mejia | Theodore Mcgrath | Stephanie Collins | evaluating | 1001 | 2 |
| 102 | ENT-2141 | FIG | Integrated Initiative | Eric Schultz | Susan Levy | Tasha Rodriguez | enrolled | 1002 | 3 |
| 103 | ENT-2147 | Farmers_Club | Extended Model | Peter Montgomery | Haruki Murakami | Walter Pratt | rejected | 1003 | 4 |

The `festival_participations` table records each entity's application and evaluation within a specific festival. Its primary key `id` (e.g. `1000`, `1001`, `1002`, `1003`) is distinct from the `participation_id` column, which holds large identifiers like `9246314`, `1996919`, `3706`, and `43197166`. The `festival_name` column identifies the event—`Compact Series`, `Legacy Assessment`, `Regional Survey A`, `Seasonal Corridor`—while `application_date` timestamps the submission as an ISO-8601 datetime such as `2022-05-16T16:24:00` or `2025-08-22T13:15:00`. The `evaluation_result` column stores categorical outcomes like `integrated-evaluati-94` and `seasonal-evaluati-95`. Quantitative assessment is captured in `quality_score` (ranging from `19.45` to `29.80`) and `standard_compliance`, a boolean flag (`true` or `false`). Foreign keys `participating_entity_id` and `festival_booth_id` link back to `participating_entities` and `festival_booths` respectively, while `product_display_id` points to the associated product catalogue entry.

**Table `festival_participations`**

| id | participation_id | festival_name | application_date | evaluation_result | quality_score | standard_compliance | participating_entity_id | festival_booth_id | product_display_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9246314 | Compact Series | 2022-05-16T16:24:00 | integrated-evaluati-94 | 19.45 | false | 100 | 1 | 100 |
| 1001 | 1996919 | Legacy Assessment | 2023-10-27T23:41:00 | seasonal-evaluati-95 | 22.90 | true | 101 | 2 | 101 |
| 1002 | 3706 | Regional Survey A | 2024-03-11T06:58:00 | regional-evaluati-96 | 26.35 | false | 102 | 3 | 102 |
| 1003 | 43197166 | Seasonal Corridor | 2025-08-22T13:15:00 | legacy-evaluati-97 | 29.80 | true | 103 | 4 | 103 |

`festival_booths` models the physical exhibition spaces. Each booth has a surrogate `id` (`1`, `2`, `3`, `4`), a `booth_id` with large identifiers like `9736893` and `2087736`, and a `booth_location` string such as `seasonal-booth-71` or `regional-booth-72`. The `booth_size` column stores a decimal measurement—`1.57`, `0.48022102`, `1.3`, `0.6000001`—and `booth_status` tracks availability with values `allocated`, `occupied`, and `available`. Temporal boundaries are recorded in `setup_date` and `dismantle_date`, for example `2023-02-04` through `2023-06-02` for booth `1`. Foreign keys `festival_venue_id`, `festival_participation_id`, and `product_display_id` connect the booth to its venue, its participation record, and its product display, respectively.

**Table `festival_booths`**

| id | booth_id | booth_location | booth_size | booth_status | setup_date | dismantle_date | festival_venue_id | festival_participation_id | product_display_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736893 | seasonal-booth-71 | 1.57 | allocated | 2023-02-04 | 2023-06-02 | 1000 | 1000 | 100 |
| 2 | 2087736 | regional-booth-72 | 0.48022102 | occupied | 2024-07-15 | 2024-11-13 | 1001 | 1001 | 101 |
| 3 | 937736 | legacy-booth-73 | 1.3 | available | 2025-12-26 | 2025-04-24 | 1002 | 1002 | 102 |
| 4 | 4543 | compact-booth-74 | 0.6000001 | allocated | 2022-05-10 | 2022-09-08 | 1003 | 1003 | 103 |

`festival_venues` stores the geographic and temporal context of each festival site. The surrogate `id` (`1000`–`1003`) maps to a `venue_id` such as `2839523`, `goh`, `27d06ecf80b34272bb825aa8d4b0983f`, and `L296`. The `venue_name` column holds labels like `Legacy Review D`, `Regional Initiative`, `Seasonal Model`, and `Integrated Cluster A`. Location is decomposed into `city`, `district`, `state`, and `pin_code`—for instance, venue `1000` is located in `integrated-city-34`, `integrated-district-40`, `distributed-state-84`, with pin code `DR-AF-1`. The `festival_start_date` and `festival_end_date` columns define the event window, such as `2022-05-16` to `2022-01-18` for venue `1000`.

**Table `festival_venues`**

| id | venue_id | venue_name | city | district | state | pin_code | festival_start_date | festival_end_date |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2839523 | Legacy Review D | integrated-city-34 | integrated-district-40 | distributed-state-84 | DR-AF-1 | 2022-05-16 | 2022-01-18 |
| 1001 | goh | Regional Initiative | seasonal-city-35 | seasonal-district-41 | baseline-state-85 | 726049 | 2023-10-27 | 2023-06-02 |
| 1002 | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | regional-city-36 | regional-district-42 | pilot-state-86 | 884345 | 2024-03-11 | 2024-11-13 |
| 1003 | L296 | Integrated Cluster A | legacy-city-37 | legacy-district-43 | extended-state-87 | lu_tax_code_template_b_VB-TR-12 | 2025-08-22 | 2025-04-24 |

`product_displays` catalogs the products or services exhibited by participants. The primary key `product_display_id` doubles as a natural identifier, taking values like `100`, `101`, `102`, and `103`. A separate `display_id` column holds UUIDs or large integers such as `3717642`, `3744016`, `c4d6113c-8fd1-11eb-924d-9cd76263cbd0`, and `4277022`. The `product_name` column records names like `Composite Assessment`, `Compact Survey A`, `Legacy Corridor`, and `Regional Series`. Product taxonomy is captured in `product_category` (`composite-product-87`, `primary-product-88`, `adaptive-product-89`, `distributed-product-90`), while `quantity` and `unit_of_measure` describe the offering (e.g., `3.95` `composite-unit-69`). Pricing is in `price_per_unit` (`33.06`, `12.34`, `12.34`, `13.94`) and quality classification in `quality_grade` (`integrated-quality-46`, `seasonal-quality-47`, `regional-quality-48`, `legacy-quality-49`). Foreign keys `festival_participation_id` and `festival_booth_id` link each product display to its participation and booth.

**Table `product_displays`**

| product_display_id | display_id | product_name | product_category | quantity | unit_of_measure | price_per_unit | quality_grade | festival_participation_id | festival_booth_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3717642 | Composite Assessment | composite-product-87 | 3.95 | composite-unit-69 | 33.06 | integrated-quality-46 | 1000 | 1 |
| 101 | 3744016 | Compact Survey A | primary-product-88 | 6.90 | primary-unit-70 | 12.34 | seasonal-quality-47 | 1001 | 2 |
| 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-product-89 | 9.85 | adaptive-unit-71 | 12.34 | regional-quality-48 | 1002 | 3 |
| 103 | 4277022 | Regional Series | distributed-product-90 | 12.80 | distributed-unit-72 | 13.94 | legacy-quality-49 | 1003 | 4 |

The junction table `venues_booths` resolves the many-to-many relationship between `festival_venues` and `festival_booths`. Its composite key consists of `festival_venue_id` and `festival_booth_id`. The data shows that venue `1000` hosts booths `1` and `2`, venue `1001` hosts booths `2` and `3`, venue `1002` hosts booths `3` and `4`, and venue `1003` hosts booths `4` and `1`. This allocation pattern means each venue accommodates two booths, and each booth is associated with two venues in the junction table—a structural redundancy that the views below reconcile into coherent single-venue facts.

**Table `venues_booths`**

| festival_venue_id | festival_booth_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

### View-Based Reconciliation

The base tables are normalized to avoid update anomalies, but domain queries require denormalized facts. The views materialize these facts by joining the appropriate tables and selecting columns that answer specific questions about the festival ecosystem.

The view `v_participating_entity_festival_participation` joins `participating_entities` to `festival_participations` on `participating_entity_id`, producing a flat record that answers "which festival did this entity apply to, and what was the outcome?" For entity `100` (`Regional Cluster`, type `FPO`, status `pending`), the joined row reveals participation in `Compact Series` with quality score `19.45` and `standard_compliance` set to `false`. Entity `103` (`Extended Model`, type `Farmers_Club`, status `rejected`) participated in `Seasonal Corridor` with the highest quality score of `29.80` and `standard_compliance` set to `true`—a case where high quality did not guarantee acceptance.

**View `v_participating_entity_festival_participation`**

```sql
CREATE VIEW v_participating_entity_festival_participation AS
SELECT a.participating_entity_id, a.entity_identifier, a.entity_type, a.entity_name, b.id AS participation_id, b.participation_id AS participation_participation_id, b.festival_name AS participation_festival_name
FROM participating_entities a JOIN festival_participations b ON a.festival_participation_id = b.id;
```

| participating_entity_id | entity_identifier | entity_type | entity_name | participation_id | participation_participation_id | participation_festival_name |
|---|---|---|---|---|---|---|
| 100 | ENT-2129 | FPO | Regional Cluster | 1000 | 9246314 | Compact Series |
| 101 | ENT-2135 | FPC | Seasonal Review D | 1001 | 1996919 | Legacy Assessment |
| 102 | ENT-2141 | FIG | Integrated Initiative | 1002 | 3706 | Regional Survey A |
| 103 | ENT-2147 | Farmers_Club | Extended Model | 1003 | 43197166 | Seasonal Corridor |

The view `v_participating_entity_festival_booth` extends the previous join by also linking to `festival_booths`, answering "which booth was assigned to this entity's participation?" Entity `101` (`Seasonal Review D`, type `FPC`, status `evaluating`) is associated with booth `2` (`regional-booth-72`, size `0.48022102`, status `occupied`). Entity `102` (`Integrated Initiative`, type `FIG`, status `enrolled`) occupies booth `3` (`legacy-booth-73`, size `1.3`, status `available`).

**View `v_participating_entity_festival_booth`**

```sql
CREATE VIEW v_participating_entity_festival_booth AS
SELECT a.participating_entity_id, a.entity_identifier, a.entity_type, a.entity_name, b.id AS booth_id, b.booth_id AS booth_booth_id, b.booth_location AS booth_booth_location
FROM participating_entities a JOIN festival_booths b ON a.festival_booth_id = b.id;
```

| participating_entity_id | entity_identifier | entity_type | entity_name | booth_id | booth_booth_id | booth_booth_location |
|---|---|---|---|---|---|---|
| 100 | ENT-2129 | FPO | Regional Cluster | 1 | 9736893 | seasonal-booth-71 |
| 101 | ENT-2135 | FPC | Seasonal Review D | 2 | 2087736 | regional-booth-72 |
| 102 | ENT-2141 | FIG | Integrated Initiative | 3 | 937736 | legacy-booth-73 |
| 103 | ENT-2147 | Farmers_Club | Extended Model | 4 | 4543 | compact-booth-74 |

The view `v_festival_participation_participating_entity` reverses the perspective of the first view, joining from `festival_participations` to `participating_entities` to answer "which entity is behind this participation record?" Participation `1000` (`Compact Series`, application `2022-05-16T16:24:00`) is linked to entity `100` (`Regional Cluster`, contact `Alyssa Chung`, phone `Joe Tsai`). Participation `1002` (`Regional Survey A`, application `2024-03-11T06:58:00`) belongs to entity `102` (`Integrated Initiative`, contact `Eric Schultz`, phone `Tasha Rodriguez`).

**View `v_festival_participation_participating_entity`**

```sql
CREATE VIEW v_festival_participation_participating_entity AS
SELECT a.id, a.participation_id, a.festival_name, a.application_date, b.participating_entity_id AS entity_participating_entity_id, b.entity_identifier AS entity_entity_identifier, b.entity_type AS entity_entity_type
FROM festival_participations a JOIN participating_entities b ON a.participating_entity_id = b.participating_entity_id;
```

| id | participation_id | festival_name | application_date | entity_participating_entity_id | entity_entity_identifier | entity_entity_type |
|---|---|---|---|---|---|---|
| 1000 | 9246314 | Compact Series | 2022-05-16T16:24:00 | 100 | ENT-2129 | FPO |
| 1001 | 1996919 | Legacy Assessment | 2023-10-27T23:41:00 | 101 | ENT-2135 | FPC |
| 1002 | 3706 | Regional Survey A | 2024-03-11T06:58:00 | 102 | ENT-2141 | FIG |
| 1003 | 43197166 | Seasonal Corridor | 2025-08-22T13:15:00 | 103 | ENT-2147 | Farmers_Club |

The view `v_festival_participation_festival_booth` joins `festival_participations` to `festival_booths`, answering "which booth corresponds to this participation?" Participation `1000` maps to booth `1` (`seasonal-booth-71`, status `allocated`, setup `2023-02-04`). Participation `1001` maps to booth `2` (`regional-booth-72`, status `occupied`, setup `2024-07-15`). Participation `1003` maps to booth `4` (`compact-booth-74`, status `allocated`, setup `2022-05-10`).

**View `v_festival_participation_festival_booth`**

```sql
CREATE VIEW v_festival_participation_festival_booth AS
SELECT a.id, a.participation_id, a.festival_name, a.application_date, b.id AS booth_id, b.booth_id AS booth_booth_id, b.booth_location AS booth_booth_location
FROM festival_participations a JOIN festival_booths b ON a.festival_booth_id = b.id;
```

| id | participation_id | festival_name | application_date | booth_id | booth_booth_id | booth_booth_location |
|---|---|---|---|---|---|---|
| 1000 | 9246314 | Compact Series | 2022-05-16T16:24:00 | 1 | 9736893 | seasonal-booth-71 |
| 1001 | 1996919 | Legacy Assessment | 2023-10-27T23:41:00 | 2 | 2087736 | regional-booth-72 |
| 1002 | 3706 | Regional Survey A | 2024-03-11T06:58:00 | 3 | 937736 | legacy-booth-73 |
| 1003 | 43197166 | Seasonal Corridor | 2025-08-22T13:15:00 | 4 | 4543 | compact-booth-74 |

The view `v_festival_participation_product_display` joins `festival_participations` to `product_displays`, answering "which product is being exhibited under this participation?" Participation `1000` is linked to product `100` (`Composite Assessment`, category `composite-product-87`, quantity `3.95`, price `33.06`, grade `integrated-quality-46`). Participation `1003` is linked to product `103` (`Regional Series`, category `distributed-product-90`, quantity `12.80`, price `13.94`, grade `legacy-quality-49`).

**View `v_festival_participation_product_display`**

```sql
CREATE VIEW v_festival_participation_product_display AS
SELECT a.id, a.participation_id, a.festival_name, a.application_date, b.product_display_id AS display_product_display_id, b.display_id AS display_display_id, b.product_name AS display_product_name
FROM festival_participations a JOIN product_displays b ON a.product_display_id = b.product_display_id;
```

| id | participation_id | festival_name | application_date | display_product_display_id | display_display_id | display_product_name |
|---|---|---|---|---|---|---|
| 1000 | 9246314 | Compact Series | 2022-05-16T16:24:00 | 100 | 3717642 | Composite Assessment |
| 1001 | 1996919 | Legacy Assessment | 2023-10-27T23:41:00 | 101 | 3744016 | Compact Survey A |
| 1002 | 3706 | Regional Survey A | 2024-03-11T06:58:00 | 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 1003 | 43197166 | Seasonal Corridor | 2025-08-22T13:15:00 | 103 | 4277022 | Regional Series |

The view `v_festival_booth_festival_venue` joins `festival_booths` to `festival_venues` on `festival_venue_id`, answering "which venue hosts this booth?" Booth `1` (`seasonal-booth-71`) is hosted at venue `1000` (`Legacy Review D`, city `integrated-city-34`, pin `DR-AF-1`). Booth `2` (`regional-booth-72`) is hosted at venue `1001` (`Regional Initiative`, city `seasonal-city-35`, pin `726049`). Booth `3` (`legacy-booth-73`) is hosted at venue `1002` (`Seasonal Model`, city `regional-city-36`, pin `884345`). Booth `4` (`compact-booth-74`) is hosted at venue `1003` (`Integrated Cluster A`, city `legacy-city-37`, pin `lu_tax_code_template_b_VB-TR-12`).

**View `v_festival_booth_festival_venue`**

```sql
CREATE VIEW v_festival_booth_festival_venue AS
SELECT a.id, a.booth_id, a.booth_location, a.booth_size, b.id AS venue_id, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name
FROM festival_booths a JOIN festival_venues b ON a.festival_venue_id = b.id;
```

| id | booth_id | booth_location | booth_size | venue_id | venue_venue_id | venue_venue_name |
|---|---|---|---|---|---|---|
| 1 | 9736893 | seasonal-booth-71 | 1.57 | 1000 | 2839523 | Legacy Review D |
| 2 | 2087736 | regional-booth-72 | 0.48022102 | 1001 | goh | Regional Initiative |
| 3 | 937736 | legacy-booth-73 | 1.3 | 1002 | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model |
| 4 | 4543 | compact-booth-74 | 0.6000001 | 1003 | L296 | Integrated Cluster A |

The view `v_festival_booth_festival_participation` joins `festival_booths` to `festival_participations`, answering "which participation is associated with this booth?" Booth `1` corresponds to participation `1000` (`Compact Series`, score `19.45`, compliance `false`). Booth `2` corresponds to participation `1001` (`Legacy Assessment`, score `22.90`, compliance `true`). Booth `3` corresponds to participation `1002` (`Regional Survey A`, score `26.35`, compliance `false`). Booth `4` corresponds to participation `1003` (`Seasonal Corridor`, score `29.80`, compliance `true`).

**View `v_festival_booth_festival_participation`**

```sql
CREATE VIEW v_festival_booth_festival_participation AS
SELECT a.id, a.booth_id, a.booth_location, a.booth_size, b.id AS participation_id, b.participation_id AS participation_participation_id, b.festival_name AS participation_festival_name
FROM festival_booths a JOIN festival_participations b ON a.festival_participation_id = b.id;
```

| id | booth_id | booth_location | booth_size | participation_id | participation_participation_id | participation_festival_name |
|---|---|---|---|---|---|---|
| 1 | 9736893 | seasonal-booth-71 | 1.57 | 1000 | 9246314 | Compact Series |
| 2 | 2087736 | regional-booth-72 | 0.48022102 | 1001 | 1996919 | Legacy Assessment |
| 3 | 937736 | legacy-booth-73 | 1.3 | 1002 | 3706 | Regional Survey A |
| 4 | 4543 | compact-booth-74 | 0.6000001 | 1003 | 43197166 | Seasonal Corridor |

The view `v_festival_booth_product_display` joins `festival_booths` to `product_displays`, answering "which product is displayed at this booth?" Booth `1` displays product `100` (`Composite Assessment`, `composite-product-87`, `3.95` `composite-unit-69` at `33.06`). Booth `2` displays product `101` (`Compact Survey A`, `primary-product-88`, `6.90` `primary-unit-70` at `12.34`). Booth `3` displays product `102` (`Legacy Corridor`, `adaptive-product-89`, `9.85` `adaptive-unit-71` at `12.34`). Booth `4` displays product `103` (`Regional Series`, `distributed-product-90`, `12.80` `distributed-unit-72` at `13.94`).

**View `v_festival_booth_product_display`**

```sql
CREATE VIEW v_festival_booth_product_display AS
SELECT a.id, a.booth_id, a.booth_location, a.booth_size, b.product_display_id AS display_product_display_id, b.display_id AS display_display_id, b.product_name AS display_product_name
FROM festival_booths a JOIN product_displays b ON a.product_display_id = b.product_display_id;
```

| id | booth_id | booth_location | booth_size | display_product_display_id | display_display_id | display_product_name |
|---|---|---|---|---|---|---|
| 1 | 9736893 | seasonal-booth-71 | 1.57 | 100 | 3717642 | Composite Assessment |
| 2 | 2087736 | regional-booth-72 | 0.48022102 | 101 | 3744016 | Compact Survey A |
| 3 | 937736 | legacy-booth-73 | 1.3 | 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 4 | 4543 | compact-booth-74 | 0.6000001 | 103 | 4277022 | Regional Series |

The view `v_festival_venue_festival_booth_detail` joins `festival_venues` to `festival_booths` through the `venues_booths` junction table, answering "which booths are allocated at this venue, and what are their characteristics?" Venue `1000` (`Legacy Review D`, `integrated-city-34`) hosts booth `1` (`seasonal-booth-71`, size `1.57`, status `allocated`) and booth `2` (`regional-booth-72`, size `0.48022102`, status `occupied`). Venue `1001` (`Regional Initiative`, `seasonal-city-35`) hosts booth `2` and booth `3` (`legacy-booth-73`, size `1.3`, status `available`). Venue `1002` (`Seasonal Model`, `regional-city-36`) hosts booth `3` and booth `4` (`compact-booth-74`, size `0.6000001`, status `allocated`). Venue `1003` (`Integrated Cluster A`, `legacy-city-37`) hosts booth `4` and booth `1`. The junction table's bidirectional mapping means each booth appears in two venue rows, reflecting the allocation pattern where booths are shared across venues.

**View `v_festival_venue_festival_booth_detail`**

```sql
CREATE VIEW v_festival_venue_festival_booth_detail AS
SELECT a.id, a.venue_id, a.venue_name, b.id AS booth_id, b.booth_id AS booth_booth_id, b.booth_location AS booth_booth_location
FROM festival_venues a
  JOIN venues_booths j ON j.festival_venue_id = a.id
  JOIN festival_booths b ON b.id = j.festival_booth_id;
```

| id | venue_id | venue_name | booth_id | booth_booth_id | booth_booth_location |
|---|---|---|---|---|---|
| 1000 | 2839523 | Legacy Review D | 1 | 9736893 | seasonal-booth-71 |
| 1000 | 2839523 | Legacy Review D | 2 | 2087736 | regional-booth-72 |
| 1001 | goh | Regional Initiative | 2 | 2087736 | regional-booth-72 |
| 1001 | goh | Regional Initiative | 3 | 937736 | legacy-booth-73 |
| 1002 | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | 3 | 937736 | legacy-booth-73 |
| 1002 | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | 4 | 4543 | compact-booth-74 |
| 1003 | L296 | Integrated Cluster A | 4 | 4543 | compact-booth-74 |
| 1003 | L296 | Integrated Cluster A | 1 | 9736893 | seasonal-booth-71 |

The view `v_product_display_festival_participation` joins `product_displays` to `festival_participations`, answering "which participation is associated with this product display?" Product `100` (`Composite Assessment`, `integrated-quality-46`) is linked to participation `1000` (`Compact Series`, score `19.45`). Product `101` (`Compact Survey A`, `seasonal-quality-47`) is linked to participation `1001` (`Legacy Assessment`, score `22.90`). Product `102` (`Legacy Corridor`, `regional-quality-48`) is linked to participation `1002` (`Regional Survey A`, score `26.35`). Product `103` (`Regional Series`, `legacy-quality-49`) is linked to participation `1003` (`Seasonal Corridor`, score `29.80`).

**View `v_product_display_festival_participation`**

```sql
CREATE VIEW v_product_display_festival_participation AS
SELECT a.product_display_id, a.display_id, a.product_name, a.product_category, b.id AS participation_id, b.participation_id AS participation_participation_id, b.festival_name AS participation_festival_name
FROM product_displays a JOIN festival_participations b ON a.festival_participation_id = b.id;
```

| product_display_id | display_id | product_name | product_category | participation_id | participation_participation_id | participation_festival_name |
|---|---|---|---|---|---|---|
| 100 | 3717642 | Composite Assessment | composite-product-87 | 1000 | 9246314 | Compact Series |
| 101 | 3744016 | Compact Survey A | primary-product-88 | 1001 | 1996919 | Legacy Assessment |
| 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-product-89 | 1002 | 3706 | Regional Survey A |
| 103 | 4277022 | Regional Series | distributed-product-90 | 1003 | 43197166 | Seasonal Corridor |

The view `v_product_display_festival_booth` joins `product_displays` to `festival_booths`, answering "which booth displays this product?" Product `100` is displayed at booth `1` (`seasonal-booth-71`, size `1.57`, status `allocated`). Product `101` is displayed at booth `2` (`regional-booth-72`, size `0.48022102`, status `occupied`). Product `102` is displayed at booth `3` (`legacy-booth-73`, size `1.3`, status `available`). Product `103` is displayed at booth `4` (`compact-booth-74`, size `0.6000001`, status `allocated`).

**View `v_product_display_festival_booth`**

```sql
CREATE VIEW v_product_display_festival_booth AS
SELECT a.product_display_id, a.display_id, a.product_name, a.product_category, b.id AS booth_id, b.booth_id AS booth_booth_id, b.booth_location AS booth_booth_location
FROM product_displays a JOIN festival_booths b ON a.festival_booth_id = b.id;
```

| product_display_id | display_id | product_name | product_category | booth_id | booth_booth_id | booth_booth_location |
|---|---|---|---|---|---|---|
| 100 | 3717642 | Composite Assessment | composite-product-87 | 1 | 9736893 | seasonal-booth-71 |
| 101 | 3744016 | Compact Survey A | primary-product-88 | 2 | 2087736 | regional-booth-72 |
| 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-product-89 | 3 | 937736 | legacy-booth-73 |
| 103 | 4277022 | Regional Series | distributed-product-90 | 4 | 4543 | compact-booth-74 |

### Synthesis

The festival management schema separates concerns across six normalized base tables, each capturing a distinct facet of the domain: entity identity (`participating_entities`), participation records (`festival_participations`), physical booths (`festival_booths`), venue geography (`festival_venues`), product catalogues (`product_displays`), and venue-to-booth allocation (`venues_booths`). Foreign keys establish a directed graph of relationships—entities participate in festivals, participations occupy booths, booths reside at venues, and products are displayed at booths—while the junction table `venues_booths` resolves the many-to-many allocation between venues and booths. The twelve views materialize denormalized facts by joining these tables along different axes, each answering a specific domain question: which entity applied to which festival, which booth hosts which product, which venue accommodates which booths, and so forth. The model balances normalization against query convenience, using views as the reconciliation layer that reconstructs the rich, multi-dimensional facts of the festival domain from its atomic, well-structured components.