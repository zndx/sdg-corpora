## Festival Operations and Exhibition Management

A regional festival program coordinates participating organizations, physical exhibition spaces, and product showcases across multiple venues. Each participating entity—whether a farmer producer organization, a farmers' club, or an integrated initiative group—applies to exhibit at a festival, receives an evaluation, and is assigned a booth within a venue where products are displayed. The operational data captures every stage of this lifecycle: enrollment status, application dates, quality scores, booth allocation, and the spatial relationship between venues and booths. Understanding how these records interlock is essential for planners who need to answer questions about capacity utilization, compliance tracking, and product visibility across the festival network.

**Table `participating_entities`**

| participating_entity_id | entity_identifier | entity_type | entity_name | contact_person | contact_address | contact_phone | enrolment_status | festival_participation_id | festival_booth_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ENT-2129 | FPO | Regional Cluster | Alyssa Chung | Kimberly Maynard | Joe Tsai | pending | 1000 | 1 |
| 101 | ENT-2135 | FPC | Seasonal Review D | Brianna Mejia | Theodore Mcgrath | Stephanie Collins | evaluating | 1001 | 2 |
| 102 | ENT-2141 | FIG | Integrated Initiative | Eric Schultz | Susan Levy | Tasha Rodriguez | enrolled | 1002 | 3 |
| 103 | ENT-2147 | Farmers_Club | Extended Model | Peter Montgomery | Haruki Murakami | Walter Pratt | rejected | 1003 | 4 |

The participating entities table forms the roster of organizations entering the festival program. Each record carries a unique entity identifier such as ENT-2129 or ENT-2141, an entity type that classifies the organization (FPO, FPC, FIG, or Farmers_Club), and a human-readable name like Regional Cluster or Seasonal Review D. Contact details are stored across three columns—contact_person, contact_address, and contact_phone—though in practice these may hold names of individuals or organizations rather than traditional contact information. The enrolment_status column tracks the current standing of each entity, with values ranging from pending and evaluating to enrolled and rejected. Notably, the table also includes festival_participation_id and festival_booth_id columns, which directly link an entity to its participation record and assigned booth. For instance, entity 100 (Regional Cluster, type FPO) holds a pending status and is associated with participation 1000 and booth 1, while entity 103 (Extended Model, type Farmers_Club) has been rejected and maps to participation 1003 and booth 4.

**Table `festival_participations`**

| id | participation_id | festival_name | application_date | evaluation_result | quality_score | standard_compliance | participating_entity_id | festival_booth_id | product_display_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9246314 | Compact Series | 2022-05-16T16:24:00 | integrated-evaluati-94 | 19.45 | false | 100 | 1 | 100 |
| 1001 | 1996919 | Legacy Assessment | 2023-10-27T23:41:00 | seasonal-evaluati-95 | 22.90 | true | 101 | 2 | 101 |
| 1002 | 3706 | Regional Survey A | 2024-03-11T06:58:00 | regional-evaluati-96 | 26.35 | false | 102 | 3 | 102 |
| 1003 | 43197166 | Seasonal Corridor | 2025-08-22T13:15:00 | legacy-evaluati-97 | 29.80 | true | 103 | 4 | 103 |

Festival participations record the formal application and evaluation of each entity's involvement in a specific festival event. The primary key id runs from 1000 to 1003, and each record includes a participation_id (such as 9246314 or 3706), the name of the festival (Compact Series, Legacy Assessment, Regional Survey A, or Seasonal Corridor), and an application_date spanning from May 2022 through August 2025. The evaluation_result column stores an evaluation code like integrated-evaluati-94 or seasonal-evaluati-95, while quality_score provides a numeric rating between 19.45 and 29.80. The standard_compliance flag indicates whether the participant meets required standards—false for Compact Series and Regional Survey A, true for Legacy Assessment and Seasonal Corridor. Foreign keys participating_entity_id, festival_booth_id, and product_display_id tie each participation to its entity, booth, and product display respectively.

**Table `festival_booths`**

| id | booth_id | booth_location | booth_size | booth_status | setup_date | dismantle_date | festival_venue_id | festival_participation_id | product_display_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736893 | seasonal-booth-71 | 1.57 | allocated | 2023-02-04 | 2023-06-02 | 1000 | 1000 | 100 |
| 2 | 2087736 | regional-booth-72 | 0.48022102 | occupied | 2024-07-15 | 2024-11-13 | 1001 | 1001 | 101 |
| 3 | 937736 | legacy-booth-73 | 1.3 | available | 2025-12-26 | 2025-04-24 | 1002 | 1002 | 102 |
| 4 | 4543 | compact-booth-74 | 0.6000001 | allocated | 2022-05-10 | 2022-09-08 | 1003 | 1003 | 103 |

Festival booths represent the physical exhibition spaces allocated at each venue. The booth_id column holds large numeric identifiers such as 9736893 or 2087736, while booth_location provides a descriptive label like seasonal-booth-71 or regional-booth-72. The booth_size column records a numeric measurement—values range from 0.48 to 1.57—and booth_status indicates the current state of the booth, with values of allocated, occupied, or available. Setup and dismantle dates define the operational window for each booth; booth 1, for example, was set up on 2023-02-04 and dismantled on 2023-06-02. The festival_venue_id, festival_participation_id, and product_display_id columns create the spatial and programmatic links between booths, venues, participations, and products.

**Table `festival_venues`**

| id | venue_id | venue_name | city | district | state | pin_code | festival_start_date | festival_end_date |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2839523 | Legacy Review D | integrated-city-34 | integrated-district-40 | distributed-state-84 | DR-AF-1 | 2022-05-16 | 2022-01-18 |
| 1001 | goh | Regional Initiative | seasonal-city-35 | seasonal-district-41 | baseline-state-85 | 726049 | 2023-10-27 | 2023-06-02 |
| 1002 | 27d06ecf80b34272bb825aa8d4b0983f | Seasonal Model | regional-city-36 | regional-district-42 | pilot-state-86 | 884345 | 2024-03-11 | 2024-11-13 |
| 1003 | L296 | Integrated Cluster A | legacy-city-37 | legacy-district-43 | extended-state-87 | lu_tax_code_template_b_VB-TR-12 | 2025-08-22 | 2025-04-24 |

Festival venues define the geographic locations where exhibitions take place. Each venue carries a venue_id (2839523, goh, 27d06ecf80b34272bb825aa8d4b0983f, or L296), a venue_name such as Legacy Review D or Regional Initiative, and location details including city, district, state, and pin_code. The festival_start_date and festival_end_date columns specify the event window for each venue. Venue 1000 (Legacy Review D) runs from 2022-05-16 to 2022-01-18, while venue 1003 (Integrated Cluster A) spans from 2025-08-22 to 2025-04-24. The pin_code values vary widely, from simple numeric codes like 726049 to alphanumeric strings like DR-AF-1 and lu_tax_code_template_b_VB-TR-12.

**Table `product_displays`**

| product_display_id | display_id | product_name | product_category | quantity | unit_of_measure | price_per_unit | quality_grade | festival_participation_id | festival_booth_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3717642 | Composite Assessment | composite-product-87 | 3.95 | composite-unit-69 | 33.06 | integrated-quality-46 | 1000 | 1 |
| 101 | 3744016 | Compact Survey A | primary-product-88 | 6.90 | primary-unit-70 | 12.34 | seasonal-quality-47 | 1001 | 2 |
| 102 | c4d6113c-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-product-89 | 9.85 | adaptive-unit-71 | 12.34 | regional-quality-48 | 1002 | 3 |
| 103 | 4277022 | Regional Series | distributed-product-90 | 12.80 | distributed-unit-72 | 13.94 | legacy-quality-49 | 1003 | 4 |

Product displays catalog the items exhibited at festivals. Each record includes a product_display_id (3717642, 3744016, a UUID-style identifier, or 4277022), a product_name such as Composite Assessment or Compact Survey A, and a product_category like composite-product-87 or primary-product-88. The quantity column holds a numeric value (3.95 through 12.80), unit_of_measure provides the measurement type, and price_per_unit ranges from 12.34 to 33.06. The quality_grade column assigns a classification such as integrated-quality-46 or seasonal-quality-47. Foreign keys festival_participation_id and festival_booth_id connect each product display to its participation and booth.

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

The venues_booths table establishes the many-to-many relationship between festival venues and festival booths. Each row pairs a festival_venue_id with a festival_booth_id, indicating that a particular booth is located at a particular venue. Venue 1000 hosts booths 1 and 2, venue 1001 hosts booths 2 and 3, venue 1002 hosts booths 3 and 4, and venue 1003 hosts booths 4 and 1. This cross-reference table is essential for determining which booths are available at which venues and for capacity planning across the festival network.

## Entity and Participation Overview

The view v_participating_entity_festival_participation joins the participating_entities table with festival_participations to present a unified record of each organization's festival involvement. This view answers the question: what is the enrollment status and evaluation outcome for each participating entity? A row from this view might show entity ENT-2129 (Regional Cluster, type FPO) with enrolment_status pending, festival name Compact Series, quality_score 19.45, and standard_compliance false. Another row could display entity ENT-2141 (Integrated Initiative, type FIG) with enrolment_status enrolled, festival name Regional Survey A, quality_score 26.35, and standard_compliance false. The view consolidates contact details, enrollment standing, and evaluation metrics into a single readable record for each entity-participation pair.

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

## Entity and Booth Assignment

The view v_participating_entity_festival_booth combines participating_entities with festival_booths to reveal which booth each entity has been assigned. This view is useful for operational staff who need to know the physical location and status of each entity's exhibition space. A representative row might show entity ENT-2135 (Seasonal Review D, type FPC) with enrolment_status evaluating, booth_location regional-booth-72, booth_size 0.48022102, and booth_status occupied. Another row could display entity ENT-2147 (Extended Model, type Farmers_Club) with enrolment_status rejected, booth_location compact-booth-74, booth_size 0.6000001, and booth_status allocated. The juxtaposition of enrolment_status against booth_status provides immediate insight into allocation efficiency—for instance, a rejected entity still having an allocated booth may indicate a need for reallocation.

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

## Participation and Entity Detail

The view v_festival_participation_participating_entity reverses the join perspective, starting from festival_participations and linking back to participating_entities. This view answers the question: for each festival participation record, what are the details of the associated entity? A row might present participation id 1000 with festival name Compact Series, participation_id 9246314, application_date 2022-05-16, and the linked entity ENT-2129 (Regional Cluster, type FPO) with contact person Alyssa Chung and enrolment_status pending. Another row could show participation id 1003 with festival name Seasonal Corridor, participation_id 43197166, application_date 2025-08-22, and the linked entity ENT-2147 (Extended Model, type Farmers_Club) with contact person Peter Montgomery and enrolment_status rejected. This perspective is particularly useful for audit trails and compliance reviews.

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

## Participation and Booth Detail

The view v_festival_participation_festival_booth joins festival_participations with festival_booths to connect each participation record with its assigned booth. This view answers the question: which booth is associated with each festival participation, and what is the booth's current status? A row might display participation id 1001 with festival name Legacy Assessment, evaluation_result seasonal-evaluati-95, quality_score 22.90, standard_compliance true, and the linked booth booth_id 2087736, booth_location regional-booth-72, booth_status occupied. Another row could show participation id 1002 with festival name Regional Survey A, evaluation_result regional-evaluati-96, quality_score 26.35, standard_compliance false, and the linked booth booth_id 937736, booth_location legacy-booth-73, booth_status available. The combination of compliance status and booth availability helps planners identify underutilized resources.

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

## Participation and Product Display

The view v_festival_participation_product_display links festival_participations with product_displays to reveal which products are being exhibited as part of each participation. This view answers the question: what products are associated with each festival participation, and at what price and quality grade? A row might present participation id 1000 with festival name Compact Series, quality_score 19.45, and the linked product Composite Assessment (category composite-product-87, quantity 3.95, price_per_unit 33.06, quality_grade integrated-quality-46). Another row could display participation id 1003 with festival name Seasonal Corridor, quality_score 29.80, and the linked product Regional Series (category distributed-product-90, quantity 12.80, price_per_unit 13.94, quality_grade legacy-quality-49). This view supports pricing analysis and quality benchmarking across participations.

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

## Booth and Venue Mapping

The view v_festival_booth_festival_venue joins festival_booths with festival_venues to map each booth to its hosting venue. This view answers the question: which venue hosts each booth, and what are the venue's event dates? A row might show booth booth_id 9736893, booth_location seasonal-booth-71, booth_status allocated, and the linked venue Legacy Review D (city integrated-city-34, state distributed-state-84, pin_code DR-AF-1, festival_start_date 2022-05-16, festival_end_date 2022-01-18). Another row could display booth booth_id 2087736, booth_location regional-booth-72, booth_status occupied, and the linked venue Regional Initiative (city seasonal-city-35, state baseline-state-85, pin_code 726049, festival_start_date 2023-10-27, festival_end_date 2023-06-02). This mapping is critical for logistical planning and venue capacity management.

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

## Booth and Participation Mapping

The view v_festival_booth_festival_participation joins festival_booths with festival_participations to connect each booth with its associated participation. This view answers the question: which festival participation is assigned to each booth, and what is the participation's evaluation outcome? A row might present booth booth_id 9736893, booth_location seasonal-booth-71, booth_size 1.57, and the linked participation Compact Series with evaluation_result integrated-evaluati-94, quality_score 19.45, standard_compliance false. Another row could show booth booth_id 4543, booth_location compact-booth-74, booth_size 0.6000001, and the linked participation Seasonal Corridor with evaluation_result legacy-evaluati-97, quality_score 29.80, standard_compliance true. This view supports booth utilization analysis and participation-to-space allocation reviews.

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

## Booth and Product Display

The view v_festival_booth_product_display joins festival_booths with product_displays to reveal which products are displayed at each booth. This view answers the question: what product is exhibited at each booth, and what are its commercial and quality attributes? A row might display booth booth_id 9736893, booth_location seasonal-booth-71, booth_status allocated, and the linked product Composite Assessment (product_category composite-product-87, quantity 3.95, price_per_unit 33.06, quality_grade integrated-quality-46). Another row could show booth booth_id 4543, booth_location compact-booth-74, booth_status allocated, and the linked product Regional Series (product_category distributed-product-90, quantity 12.80, price_per_unit 13.94, quality_grade legacy-quality-49). This view is valuable for merchandising strategy and product placement optimization.

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

## Venue and Booth Detail

The view v_festival_venue_festival_booth_detail joins festival_venues with festival_booths to provide a comprehensive view of booth allocation within each venue. This view answers the question: which booths are located at each venue, and what are their operational characteristics? A row might present venue Legacy Review D (city integrated-city-34, district integrated-district-40, state distributed-state-84, pin_code DR-AF-1, festival_start_date 2022-05-16, festival_end_date 2022-01-18) with the linked booth booth_id 9736893, booth_location seasonal-booth-71, booth_size 1.57, booth_status allocated, setup_date 2023-02-04, dismantle_date 2023-06-02. Another row could display venue Regional Initiative (city seasonal-city-35, district seasonal-district-41, state baseline-state-85, pin_code 726049, festival_start_date 2023-10-27, festival_end_date 2023-06-02) with the linked booth booth_id 2087736, booth_location regional-booth-72, booth_size 0.48022102, booth_status occupied, setup_date 2024-07-15, dismantle_date 2024-11-13. This view supports venue-level capacity analysis and booth lifecycle tracking.

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

## Product Display and Participation

The view v_product_display_festival_participation joins product_displays with festival_participations to connect each product display with its associated festival participation. This view answers the question: which festival participation is associated with each product display, and what are the participation's evaluation metrics? A row might show product Composite Assessment (product_category composite-product-87, quantity 3.95, price_per_unit 33.06, quality_grade integrated-quality-46) linked to participation Compact Series with evaluation_result integrated-evaluati-94, quality_score 19.45, standard_compliance false. Another row could display product Legacy Corridor (product_category adaptive-product-89, quantity 9.85, price_per_unit 12.34, quality_grade regional-quality-48) linked to participation Regional Survey A with evaluation_result regional-evaluati-96, quality_score 26.35, standard_compliance false. This view enables product-level compliance and quality analysis across the festival program.

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

## Product Display and Booth

The view v_product_display_festival_booth joins product_displays with festival_booths to reveal which booth hosts each product display. This view answers the question: at which booth is each product being exhibited, and what is the booth's current status and size? A row might present product Compact Survey A (product_category primary-product-88, quantity 6.90, price_per_unit 12.34, quality_grade seasonal-quality-47) displayed at booth booth_id 2087736, booth_location regional-booth-72, booth_size 0.48022102, booth_status occupied. Another row could show product Regional Series (product_category distributed-product-90, quantity 12.80, price_per_unit 13.94, quality_grade legacy-quality-49) displayed at booth booth_id 4543, booth_location compact-booth-74, booth_size 0.6000001, booth_status allocated. This view supports spatial merchandising analysis and booth utilization reporting.

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

## Synthesis

The festival operations dataset captures a complete exhibition lifecycle: organizations enroll and apply, participations are evaluated and scored, booths are allocated and tracked, venues host events across geographic locations, and products are displayed with commercial and quality attributes. The cross-reference table venues_booths ensures that the spatial relationship between venues and booths is explicitly recorded, while the various joined views provide multiple perspectives for answering operational questions—from entity-level enrollment tracking to booth-level product placement. Planners can use these records to monitor compliance rates, optimize booth utilization, benchmark product quality, and coordinate logistics across venues. The data model, with its clear foreign-key relationships and descriptive identifiers, supports both day-to-day operations and strategic analysis of the festival program.