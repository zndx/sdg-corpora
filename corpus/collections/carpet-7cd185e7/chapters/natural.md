## The Architecture of Carpet Production and Trade

The production, distribution, and custodianship of handwoven carpets form a complex supply chain spanning artisan workshops, royal households, and international markets. Each carpet carries a lineage: it is designed, woven by skilled craftspersons within a workshop, assigned a design pattern, stored within a royal household, and ultimately routed through a market region for trade. Understanding this ecosystem requires examining the records that document every stage—from the raw material composition of a rug to the cultural adoption rates in distant markets. The following chapters detail the entities, their relationships, and the analytical views that bring the full picture into focus.

### Core Entities of the Carpet Trade

The foundation of the domain rests on several interrelated records. At the center sits the carpet itself, a manufactured artifact with a unique identifier, design style, and physical attributes.

**Table `carpets`**

| id | carpet_id | design_style | origin_region | production_date | dimensions | material_composition | current_location | condition_status | workshop_id | household_id | market_region_id | design_pattern_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 2025-04-06T03:21:00 | distributed-dimensio-42 | wool | baseline-current-43 | intact | 1 | 726044 | 1 | 100 |
| 1001 | 20024447 | Iranian | Persia | 2022-09-17T10:38:00 | baseline-dimensio-43 | silk | pilot-current-44 | fragmented | 2 | 16605652 | 2 | 101 |
| 1002 | 7731885 | Safavid | Central Asia | 2023-02-01T17:55:00 | pilot-dimensio-44 | cotton | extended-current-45 | restored | 3 | 8928495 | 3 | 102 |
| 1003 | 10445627 | Mughal | Anatolia | 2024-07-12T00:12:00 | extended-dimensio-45 | wool | integrated-current-46 | intact | 4 | 5844284 | 4 | 103 |

Each carpet record captures its design style—Ottoman, Iranian, Safavid, or Mughal—alongside its origin region such as Anatolia, Persia, or Central Asia. The production date anchors the artifact in time, while dimensions, material composition (wool, silk, or cotton), and current location describe its physical state. Condition status ranges from intact to fragmented to restored, reflecting the care and history each piece has endured. Crucially, every carpet is linked to a workshop, a royal household, a market region, and a design pattern, establishing the relational backbone of the entire system.

Workshops serve as the production engines. They are defined by their location, the date they were established, the patron court that supports them, and their specialization in particular carpet types.

**Table `workshops`**

| id | workshop_id | location | established_date | patron | specialization | production_volume | operational_status | market_region_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8928498 | extended-location-99 | 2024-03-27T14:30:00 | Ottoman Court | pile carpets | 15 | active | 1 |
| 2 | 12383516 | integrated-location-100 | 2025-08-11T21:47:00 | Safavid Court | kilims | 25 | closed | 2 |
| 3 | 9424920 | seasonal-location-101 | 2022-01-22T04:04:00 | Ottoman Court | designer rugs | 35 | active | 3 |
| 4 | 2986231 | regional-location-102 | 2023-06-06T11:21:00 | Safavid Court | pile carpets | 45 | closed | 4 |

The data reveals workshops operating under both Ottoman and Safavid Court patronage, each specializing in pile carpets, kilims, or designer rugs. Production volumes vary from 15 to 45 units, and operational status alternates between active and closed, reflecting the cyclical nature of artisan production. Each workshop is also associated with a market region, indicating where its output is primarily directed.

The human element of production is captured in the craftspersons table, which records the individuals who weave, spin, dye, and design these textiles.

**Table `craftspersons`**

| id | craftsperson_id | role | gender | region | years_of_experience | affiliated_workshop | workshop_id |
|---|---|---|---|---|---|---|---|
| 1000 | 82ee323002ef44dd878d04d2fb7ff363 | spinner | female | Anatolia | 7 | baseline-affiliat-97 | 1 |
| 1001 | 209235 | dyer | male | Iran | 10 | pilot-affiliat-98 | 2 |
| 1002 | 3158157 | knotters | female | Anatolia | 13 | extended-affiliat-99 | 3 |
| 1003 | template_ivacode_pagata_20ind | design caller | male | Iran | 16 | integrated-affiliat-100 | 4 |

Craftspersons hold distinct roles—spinner, dyer, knotters, and design caller—and are distributed across regions including Anatolia and Iran. Their years of experience range from 7 to 16, and each is affiliated with a specific workshop, creating a direct link between artisan and production facility. The workshop affiliation ensures that every craftsperson contributes to a coordinated output.

Design patterns encode the aesthetic and cultural DNA of each carpet.

**Table `design_patterns`**

| design_pattern_id | pattern_id | pattern_type | complexity_level | cultural_origin | visual_impact | repetition_frequency | created_at |
|---|---|---|---|---|---|---|---|
| 100 | 6926379 | vegetal | 37 | Islamic | high | 13 | 2025-01-01 00:14:00 |
| 101 | 338538 | geometric | 45 | Byzantine | moderate | 21 | 2025-02-06 03:14:00 |
| 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden | 53 | Nomadic | low | 29 | 2025-03-11 06:14:00 |
| 103 | 1450649 | star | 61 | Islamic | high | 37 | 2025-04-16 09:14:00 |

Patterns are classified by type—vegetal, geometric, garden, or star—and assigned a complexity level ranging from 37 to 61. Their cultural origins span Islamic, Byzantine, and Nomadic traditions, while visual impact is rated as high or moderate. Repetition frequency, measured as a numeric count, indicates how often the pattern recurs within a carpet's field. These patterns are not merely decorative; they carry cultural provenance and influence the market appeal of the finished product.

Royal households function as both custodians and consumers of carpets, maintaining collections with specific storage and rotation protocols.

**Table `royal_households`**

| household_id | location | ruling_dynasty | storage_capacity | rotation_period | custodian_name | design_pattern_id |
|---|---|---|---|---|---|---|
| 726044 | Constantinople | Ottoman | 10 | 32 | Composite Review | 100 |
| 16605652 | Baghdad | Abbasid | 19 | 38 | Compact Initiative A | 101 |
| 8928495 | Isfahan | Safavid | 28 | 44 | Legacy Model | 102 |
| 5844284 | Constantinople | Ottoman | 37 | 50 | Regional Cluster | 103 |

Households are identified by their location—Constantinople, Baghdad, or Isfahan—and their ruling dynasty, whether Ottoman, Abbasid, or Safavid. Storage capacity varies from 10 to 37 units, and rotation periods range from 32 to 50 days, suggesting a systematic approach to display and preservation. Each household is associated with a custodian name and a design pattern, indicating a preference or specialization that guides acquisition.

Market regions define the commercial geography of the trade.

**Table `market_regions`**

| market_region_id | region_id | region_name | import_volume | primary_use | cultural_adoption | trade_route | workshop_id |
|---|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe | 24 | floor covering | high | regional-trade-66 | 1 |
| 2 | 4180948 | Far East | 28 | wall hanging | moderate | legacy-trade-67 | 2 |
| 3 | 3012829 | Central Asia | 32 | furniture cover | low | compact-trade-68 | 3 |
| 4 | 778576 | Europe | 36 | floor covering | high | composite-trade-69 | 4 |

Regions such as Europe, the Far East, and Central Asia are characterized by their import volume, primary use for carpets (floor covering, wall hanging, or furniture cover), and cultural adoption level. Trade routes—regional, legacy, compact, or composite—connect these markets to their source workshops, forming the distribution network that moves carpets from production to consumption.

### Relational Tables: Connecting Production to Distribution

The base tables alone do not capture the full picture. Relational tables bridge the entities, documenting the many-to-many relationships that define the trade.

**Table `workshops_craftspersons`**

| workshop_id | craftsperson_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This table records which craftspersons are assigned to which workshops, enabling the tracking of labor allocation and production capacity. A single workshop may employ multiple craftspersons, and a craftsperson may be associated with multiple workshops over time.

**Table `workshops_carpets`**

| workshop_id | carpet_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The workshops_carpets table links production facilities to the carpets they produce, establishing a direct lineage from workshop to finished artifact. This relationship is essential for quality tracking, production auditing, and provenance verification.

**Table `patterns_carpets`**

| design_pattern_id | carpet_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

Design patterns are connected to carpets through this table, documenting which pattern was applied to which carpet. This linkage supports aesthetic analysis, cultural provenance research, and market preference studies.

**Table `households_carpets`**

| household_id | carpet_id |
|---|---|
| 726044 | 1000 |
| 726044 | 1001 |
| 16605652 | 1001 |
| 16605652 | 1002 |
| 8928495 | 1002 |
| 8928495 | 1003 |
| 5844284 | 1003 |
| 5844284 | 1000 |

Royal households acquire carpets through this relational table, recording which household holds which carpet. This enables the tracking of collection composition, rotation schedules, and custodial responsibility.

**Table `regions_carpets`**

| market_region_id | carpet_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Market regions receive carpets through this table, documenting the flow of goods from production to trade. This relationship is critical for understanding market saturation, demand patterns, and the effectiveness of trade routes.

### Analytical Views: Interpreting the Joined Data

Relational tables alone are descriptive; analytical views synthesize them into actionable insights. Each view answers a specific question by joining multiple tables and presenting the results in a unified format.

**View `v_carpet_workshop`**

```sql
CREATE VIEW v_carpet_workshop AS
SELECT a.id, a.carpet_id, a.design_style, a.origin_region, b.id AS workshop_id, b.workshop_id AS workshop_workshop_id, b.location AS workshop_location
FROM carpets a JOIN workshops b ON a.workshop_id = b.id;
```

| id | carpet_id | design_style | origin_region | workshop_id | workshop_workshop_id | workshop_location |
|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 1 | 8928498 | extended-location-99 |
| 1001 | 20024447 | Iranian | Persia | 2 | 12383516 | integrated-location-100 |
| 1002 | 7731885 | Safavid | Central Asia | 3 | 9424920 | seasonal-location-101 |
| 1003 | 10445627 | Mughal | Anatolia | 4 | 2986231 | regional-location-102 |

The carpet-to-workshop view answers the question: which workshop produced each carpet, and what are the workshop's operational characteristics? Reading the first row, carpet 209204 in the Ottoman style was produced by workshop 8928498, an active facility specializing in pile carpets with a production volume of 15, located in extended-location-99 under Ottoman Court patronage. The second row reveals that carpet 20024447, an Iranian piece in silk, came from workshop 12383516, which is currently closed and specializes in kilims with a higher production volume of 25. This view enables producers and auditors to trace any carpet back to its origin facility and assess the operational context of its creation.

**View `v_carpet_royal_household`**

```sql
CREATE VIEW v_carpet_royal_household AS
SELECT a.id, a.carpet_id, a.design_style, a.origin_region, b.household_id AS household_household_id, b.location AS household_location, b.ruling_dynasty AS household_ruling_dynasty
FROM carpets a JOIN royal_households b ON a.household_id = b.household_id;
```

| id | carpet_id | design_style | origin_region | household_household_id | household_location | household_ruling_dynasty |
|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 726044 | Constantinople | Ottoman |
| 1001 | 20024447 | Iranian | Persia | 16605652 | Baghdad | Abbasid |
| 1002 | 7731885 | Safavid | Central Asia | 8928495 | Isfahan | Safavid |
| 1003 | 10445627 | Mughal | Anatolia | 5844284 | Constantinople | Ottoman |

This view maps carpets to the royal households that custodially hold them, answering: which household is responsible for which carpet? The first row shows carpet 209204 held by household 726044 in Constantinople under the Ottoman dynasty, with a storage capacity of 10 and a rotation period of 32 days, overseen by the custodian Composite Review. The second row places carpet 20024447 in the Baghdad household of the Abbasid dynasty, which has a larger storage capacity of 19 and a longer rotation period of 38 days, managed by Compact Initiative A. This view supports inventory management, rotation planning, and custodial accountability.

**View `v_carpet_market_region`**

```sql
CREATE VIEW v_carpet_market_region AS
SELECT a.id, a.carpet_id, a.design_style, a.origin_region, b.market_region_id AS region_market_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM carpets a JOIN market_regions b ON a.market_region_id = b.market_region_id;
```

| id | carpet_id | design_style | origin_region | region_market_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe |
| 1001 | 20024447 | Iranian | Persia | 2 | 4180948 | Far East |
| 1002 | 7731885 | Safavid | Central Asia | 3 | 3012829 | Central Asia |
| 1003 | 10445627 | Mughal | Anatolia | 4 | 778576 | Europe |

The carpet-to-market-region view reveals the commercial destination of each carpet, answering: through which market region is this carpet being traded? The first row indicates carpet 209204 is routed through market region 46d49f56-8fcc-11eb-924d-9cd76263cbd0 in Europe, with an import volume of 24, used primarily as a floor covering, and achieving high cultural adoption via the regional-trade-66 route. The second row shows carpet 20024447 heading to the Far East market (region 4180948), with an import volume of 28, used as a wall hanging, and experiencing moderate cultural adoption through the legacy-trade-67 route. This view is essential for trade analysis, demand forecasting, and route optimization.

**View `v_carpet_design_pattern`**

```sql
CREATE VIEW v_carpet_design_pattern AS
SELECT a.id, a.carpet_id, a.design_style, a.origin_region, b.design_pattern_id AS pattern_design_pattern_id, b.pattern_id AS pattern_pattern_id, b.pattern_type AS pattern_pattern_type
FROM carpets a JOIN design_patterns b ON a.design_pattern_id = b.design_pattern_id;
```

| id | carpet_id | design_style | origin_region | pattern_design_pattern_id | pattern_pattern_id | pattern_pattern_type |
|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 100 | 6926379 | vegetal |
| 1001 | 20024447 | Iranian | Persia | 101 | 338538 | geometric |
| 1002 | 7731885 | Safavid | Central Asia | 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden |
| 1003 | 10445627 | Mughal | Anatolia | 103 | 1450649 | star |

This view connects carpets to their design patterns, answering: what aesthetic and cultural template defines this carpet? The first row reveals carpet 209204 uses pattern 6926379, a vegetal type of complexity 37 with Islamic cultural origin, high visual impact, and a repetition frequency of 13. The second row shows carpet 20024447 employs pattern 338538, a geometric design of complexity 45 with Byzantine origin, moderate visual impact, and a repetition frequency of 21. This view supports aesthetic classification, cultural provenance research, and pattern popularity analysis.

**View `v_workshop_craftsperson_detail`**

```sql
CREATE VIEW v_workshop_craftsperson_detail AS
SELECT a.id, a.workshop_id, a.location, b.id AS craftsperson_id, b.craftsperson_id AS craftsperson_craftsperson_id, b.role AS craftsperson_role
FROM workshops a
  JOIN workshops_craftspersons j ON j.workshop_id = a.id
  JOIN craftspersons b ON b.id = j.craftsperson_id;
```

| id | workshop_id | location | craftsperson_id | craftsperson_craftsperson_id | craftsperson_role |
|---|---|---|---|---|---|
| 1 | 8928498 | extended-location-99 | 1000 | 82ee323002ef44dd878d04d2fb7ff363 | spinner |
| 1 | 8928498 | extended-location-99 | 1001 | 209235 | dyer |
| 2 | 12383516 | integrated-location-100 | 1001 | 209235 | dyer |
| 2 | 12383516 | integrated-location-100 | 1002 | 3158157 | knotters |
| 3 | 9424920 | seasonal-location-101 | 1002 | 3158157 | knotters |
| 3 | 9424920 | seasonal-location-101 | 1003 | template_ivacode_pagata_20ind | design caller |
| 4 | 2986231 | regional-location-102 | 1003 | template_ivacode_pagata_20ind | design caller |
| 4 | 2986231 | regional-location-102 | 1000 | 82ee323002ef44dd878d04d2fb7ff363 | spinner |

The workshop-craftsperson detail view answers: which craftspersons work at which workshop, and what are their qualifications? The first row shows craftsperson 82ee323002ef44dd878d04d2fb7ff363, a female spinner from Anatolia with 7 years of experience, affiliated with workshop 8928498. The second row lists craftsperson 209235, a male dyer from Iran with 10 years of experience, working at workshop 12383516. This view enables workforce planning, skill distribution analysis, and cross-regional labor mapping.

**View `v_workshop_carpet_detail`**

```sql
CREATE VIEW v_workshop_carpet_detail AS
SELECT a.id, a.workshop_id, a.location, b.id AS carpet_id, b.carpet_id AS carpet_carpet_id, b.design_style AS carpet_design_style
FROM workshops a
  JOIN workshops_carpets j ON j.workshop_id = a.id
  JOIN carpets b ON b.id = j.carpet_id;
```

| id | workshop_id | location | carpet_id | carpet_carpet_id | carpet_design_style |
|---|---|---|---|---|---|
| 1 | 8928498 | extended-location-99 | 1000 | 209204 | Ottoman |
| 1 | 8928498 | extended-location-99 | 1001 | 20024447 | Iranian |
| 2 | 12383516 | integrated-location-100 | 1001 | 20024447 | Iranian |
| 2 | 12383516 | integrated-location-100 | 1002 | 7731885 | Safavid |
| 3 | 9424920 | seasonal-location-101 | 1002 | 7731885 | Safavid |
| 3 | 9424920 | seasonal-location-101 | 1003 | 10445627 | Mughal |
| 4 | 2986231 | regional-location-102 | 1003 | 10445627 | Mughal |
| 4 | 2986231 | regional-location-102 | 1000 | 209204 | Ottoman |

This view links workshops to the carpets they produce, answering: which carpets originated from which workshop, and what are their characteristics? The first row connects workshop 8928498 to carpet 209204, an Ottoman-style piece made of wool with intact condition. The second row links workshop 12383516 to carpet 20024447, an Iranian-style silk carpet in fragmented condition. This view supports production auditing, quality assessment, and workshop performance evaluation.

**View `v_workshop_market_region`**

```sql
CREATE VIEW v_workshop_market_region AS
SELECT a.id, a.workshop_id, a.location, a.established_date, b.market_region_id AS region_market_region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM workshops a JOIN market_regions b ON a.market_region_id = b.market_region_id;
```

| id | workshop_id | location | established_date | region_market_region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 8928498 | extended-location-99 | 2024-03-27T14:30:00 | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe |
| 2 | 12383516 | integrated-location-100 | 2025-08-11T21:47:00 | 2 | 4180948 | Far East |
| 3 | 9424920 | seasonal-location-101 | 2022-01-22T04:04:00 | 3 | 3012829 | Central Asia |
| 4 | 2986231 | regional-location-102 | 2023-06-06T11:21:00 | 4 | 778576 | Europe |

The workshop-to-market-region view answers: which market regions receive output from which workshops? The first row shows workshop 8928498 supplies market region 46d49f56-8fcc-11eb-924d-9cd76263cbd0 in Europe, with an import volume of 24 and high cultural adoption. The second row connects workshop 12383516 to the Far East market (region 4180948), with an import volume of 28 and moderate adoption. This view is critical for supply chain management and market coverage analysis.

**View `v_craftsperson_workshop`**

```sql
CREATE VIEW v_craftsperson_workshop AS
SELECT a.id, a.craftsperson_id, a.role, a.gender, b.id AS workshop_id, b.workshop_id AS workshop_workshop_id, b.location AS workshop_location
FROM craftspersons a JOIN workshops b ON a.workshop_id = b.id;
```

| id | craftsperson_id | role | gender | workshop_id | workshop_workshop_id | workshop_location |
|---|---|---|---|---|---|---|
| 1000 | 82ee323002ef44dd878d04d2fb7ff363 | spinner | female | 1 | 8928498 | extended-location-99 |
| 1001 | 209235 | dyer | male | 2 | 12383516 | integrated-location-100 |
| 1002 | 3158157 | knotters | female | 3 | 9424920 | seasonal-location-101 |
| 1003 | template_ivacode_pagata_20ind | design caller | male | 4 | 2986231 | regional-location-102 |

This view presents the craftsperson-to-workshop relationship from the artisan's perspective, answering: which workshop is each craftsperson associated with, and what is the workshop's specialization? The first row shows craftsperson 82ee323002ef44dd878d04d2fb7ff363 is affiliated with workshop 8928498, which specializes in pile carpets and has a production volume of 15. The second row places craftsperson 209235 at workshop 12383516, specializing in kilims with a production volume of 25. This view supports artisan career tracking and workshop capacity planning.

**View `v_design_pattern_carpet_detail`**

```sql
CREATE VIEW v_design_pattern_carpet_detail AS
SELECT a.design_pattern_id, a.pattern_id, a.pattern_type, b.id AS carpet_id, b.carpet_id AS carpet_carpet_id, b.design_style AS carpet_design_style
FROM design_patterns a
  JOIN patterns_carpets j ON j.design_pattern_id = a.design_pattern_id
  JOIN carpets b ON b.id = j.carpet_id;
```

| design_pattern_id | pattern_id | pattern_type | carpet_id | carpet_carpet_id | carpet_design_style |
|---|---|---|---|---|---|
| 100 | 6926379 | vegetal | 1000 | 209204 | Ottoman |
| 100 | 6926379 | vegetal | 1001 | 20024447 | Iranian |
| 101 | 338538 | geometric | 1001 | 20024447 | Iranian |
| 101 | 338538 | geometric | 1002 | 7731885 | Safavid |
| 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden | 1002 | 7731885 | Safavid |
| 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden | 1003 | 10445627 | Mughal |
| 103 | 1450649 | star | 1003 | 10445627 | Mughal |
| 103 | 1450649 | star | 1000 | 209204 | Ottoman |

The design-pattern-to-carpet view answers: which carpets employ each design pattern, and what are the pattern's characteristics? The first row shows pattern 6926379 (vegetal, complexity 37, Islamic origin) is used in carpet 209204. The second row links pattern 338538 (geometric, complexity 45, Byzantine origin) to carpet 20024447. This view enables pattern usage analysis, cultural origin tracking, and complexity distribution studies.

**View `v_royal_household_carpet_detail`**

```sql
CREATE VIEW v_royal_household_carpet_detail AS
SELECT a.household_id, a.location, a.ruling_dynasty, b.id AS carpet_id, b.carpet_id AS carpet_carpet_id, b.design_style AS carpet_design_style
FROM royal_households a
  JOIN households_carpets j ON j.household_id = a.household_id
  JOIN carpets b ON b.id = j.carpet_id;
```

| household_id | location | ruling_dynasty | carpet_id | carpet_carpet_id | carpet_design_style |
|---|---|---|---|---|---|
| 726044 | Constantinople | Ottoman | 1000 | 209204 | Ottoman |
| 726044 | Constantinople | Ottoman | 1001 | 20024447 | Iranian |
| 16605652 | Baghdad | Abbasid | 1001 | 20024447 | Iranian |
| 16605652 | Baghdad | Abbasid | 1002 | 7731885 | Safavid |
| 8928495 | Isfahan | Safavid | 1002 | 7731885 | Safavid |
| 8928495 | Isfahan | Safavid | 1003 | 10445627 | Mughal |
| 5844284 | Constantinople | Ottoman | 1003 | 10445627 | Mughal |
| 5844284 | Constantinople | Ottoman | 1000 | 209204 | Ottoman |

This view maps royal households to the carpets in their collections, answering: which carpets does each household hold, and what are their attributes? The first row shows household 726044 (Constantinople, Ottoman dynasty) holds carpet 209204, an Ottoman-style wool piece. The second row places household 16605652 (Baghdad, Abbasid dynasty) in possession of carpet 20024447, an Iranian-style silk carpet. This view supports collection management, provenance research, and household preference analysis.

**View `v_royal_household_design_pattern`**

```sql
CREATE VIEW v_royal_household_design_pattern AS
SELECT a.household_id, a.location, a.ruling_dynasty, a.storage_capacity, b.design_pattern_id AS pattern_design_pattern_id, b.pattern_id AS pattern_pattern_id, b.pattern_type AS pattern_pattern_type
FROM royal_households a JOIN design_patterns b ON a.design_pattern_id = b.design_pattern_id;
```

| household_id | location | ruling_dynasty | storage_capacity | pattern_design_pattern_id | pattern_pattern_id | pattern_pattern_type |
|---|---|---|---|---|---|---|
| 726044 | Constantinople | Ottoman | 10 | 100 | 6926379 | vegetal |
| 16605652 | Baghdad | Abbasid | 19 | 101 | 338538 | geometric |
| 8928495 | Isfahan | Safavid | 28 | 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden |
| 5844284 | Constantinople | Ottoman | 37 | 103 | 1450649 | star |

The royal-household-to-design-pattern view answers: which design patterns does each household prefer or specialize in? The first row shows household 726044 is associated with pattern 6926379, a vegetal design of Islamic origin. The second row links household 16605652 to pattern 338538, a geometric design of Byzantine origin. This view reveals cultural preferences within royal collections and supports acquisition strategy.

**View `v_market_region_carpet_detail`**

```sql
CREATE VIEW v_market_region_carpet_detail AS
SELECT a.market_region_id, a.region_id, a.region_name, b.id AS carpet_id, b.carpet_id AS carpet_carpet_id, b.design_style AS carpet_design_style
FROM market_regions a
  JOIN regions_carpets j ON j.market_region_id = a.market_region_id
  JOIN carpets b ON b.id = j.carpet_id;
```

| market_region_id | region_id | region_name | carpet_id | carpet_carpet_id | carpet_design_style |
|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe | 1000 | 209204 | Ottoman |
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe | 1001 | 20024447 | Iranian |
| 2 | 4180948 | Far East | 1001 | 20024447 | Iranian |
| 2 | 4180948 | Far East | 1002 | 7731885 | Safavid |
| 3 | 3012829 | Central Asia | 1002 | 7731885 | Safavid |
| 3 | 3012829 | Central Asia | 1003 | 10445627 | Mughal |
| 4 | 778576 | Europe | 1003 | 10445627 | Mughal |
| 4 | 778576 | Europe | 1000 | 209204 | Ottoman |

This view connects market regions to the carpets traded through them, answering: which carpets flow through each market region? The first row shows market region 46d49f56-8fcc-11eb-924d-9cd76263cbd0 (Europe) handles carpet 209204, with an import volume of 24 and high cultural adoption. The second row links the Far East market (region 4180948) to carpet 20024447, with an import volume of 28 and moderate adoption. This view is essential for trade volume analysis and market penetration studies.

**View `v_market_region_workshop`**

```sql
CREATE VIEW v_market_region_workshop AS
SELECT a.market_region_id, a.region_id, a.region_name, a.import_volume, b.id AS workshop_id, b.workshop_id AS workshop_workshop_id, b.location AS workshop_location
FROM market_regions a JOIN workshops b ON a.workshop_id = b.id;
```

| market_region_id | region_id | region_name | import_volume | workshop_id | workshop_workshop_id | workshop_location |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe | 24 | 1 | 8928498 | extended-location-99 |
| 2 | 4180948 | Far East | 28 | 2 | 12383516 | integrated-location-100 |
| 3 | 3012829 | Central Asia | 32 | 3 | 9424920 | seasonal-location-101 |
| 4 | 778576 | Europe | 36 | 4 | 2986231 | regional-location-102 |

The market-region-to-workshop view answers: which workshops supply each market region? The first row shows market region 46d49f56-8fcc-11eb-924d-9cd76263cbd0 in Europe receives supply from workshop 8928498, an active facility specializing in pile carpets. The second row connects the Far East market (region 4180948) to workshop 12383516, a closed facility specializing in kilims. This view supports supply chain mapping and regional sourcing decisions.

### Synthesis

The carpet trade domain is a tightly interwoven system where production, custodianship, and distribution are recorded with precision. Carpets are manufactured in workshops by craftspersons, designed with culturally significant patterns, held by royal households, and distributed through market regions. The relational tables capture the many-to-many connections that define this ecosystem, while the analytical views synthesize these relationships into actionable intelligence. Whether tracing a single carpet back to its workshop, analyzing the cultural preferences of a royal household, or mapping the flow of goods through international trade routes, the data provides a comprehensive framework for understanding the art, craft, and commerce of carpet production.