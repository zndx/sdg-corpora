The chapter has been written to `/tmp/harness_semantic_uirz2hhz/chapter_relational_schema.md`. It contains all 11 `` markers and all 12 `` markers, with 1500+ words of prose covering the base tables, junction tables, materialised views, and a closing synthesis.

## Data appendix

**Table `carpets`**

| id | carpet_id | design_style | origin_region | production_date | dimensions | material_composition | current_location | condition_status | workshop_id | household_id | market_region_id | design_pattern_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 209204 | Ottoman | Anatolia | 2025-04-06T03:21:00 | distributed-dimensio-42 | wool | baseline-current-43 | intact | 1 | 726044 | 1 | 100 |
| 1001 | 20024447 | Iranian | Persia | 2022-09-17T10:38:00 | baseline-dimensio-43 | silk | pilot-current-44 | fragmented | 2 | 16605652 | 2 | 101 |
| 1002 | 7731885 | Safavid | Central Asia | 2023-02-01T17:55:00 | pilot-dimensio-44 | cotton | extended-current-45 | restored | 3 | 8928495 | 3 | 102 |
| 1003 | 10445627 | Mughal | Anatolia | 2024-07-12T00:12:00 | extended-dimensio-45 | wool | integrated-current-46 | intact | 4 | 5844284 | 4 | 103 |

**Table `workshops`**

| id | workshop_id | location | established_date | patron | specialization | production_volume | operational_status | market_region_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8928498 | extended-location-99 | 2024-03-27T14:30:00 | Ottoman Court | pile carpets | 15 | active | 1 |
| 2 | 12383516 | integrated-location-100 | 2025-08-11T21:47:00 | Safavid Court | kilims | 25 | closed | 2 |
| 3 | 9424920 | seasonal-location-101 | 2022-01-22T04:04:00 | Ottoman Court | designer rugs | 35 | active | 3 |
| 4 | 2986231 | regional-location-102 | 2023-06-06T11:21:00 | Safavid Court | pile carpets | 45 | closed | 4 |

**Table `craftspersons`**

| id | craftsperson_id | role | gender | region | years_of_experience | affiliated_workshop | workshop_id |
|---|---|---|---|---|---|---|---|
| 1000 | 82ee323002ef44dd878d04d2fb7ff363 | spinner | female | Anatolia | 7 | baseline-affiliat-97 | 1 |
| 1001 | 209235 | dyer | male | Iran | 10 | pilot-affiliat-98 | 2 |
| 1002 | 3158157 | knotters | female | Anatolia | 13 | extended-affiliat-99 | 3 |
| 1003 | template_ivacode_pagata_20ind | design caller | male | Iran | 16 | integrated-affiliat-100 | 4 |

**Table `design_patterns`**

| design_pattern_id | pattern_id | pattern_type | complexity_level | cultural_origin | visual_impact | repetition_frequency | created_at |
|---|---|---|---|---|---|---|---|
| 100 | 6926379 | vegetal | 37 | Islamic | high | 13 | 2025-01-01 00:14:00 |
| 101 | 338538 | geometric | 45 | Byzantine | moderate | 21 | 2025-02-06 03:14:00 |
| 102 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | garden | 53 | Nomadic | low | 29 | 2025-03-11 06:14:00 |
| 103 | 1450649 | star | 61 | Islamic | high | 37 | 2025-04-16 09:14:00 |

**Table `royal_households`**

| household_id | location | ruling_dynasty | storage_capacity | rotation_period | custodian_name | design_pattern_id |
|---|---|---|---|---|---|---|
| 726044 | Constantinople | Ottoman | 10 | 32 | Composite Review | 100 |
| 16605652 | Baghdad | Abbasid | 19 | 38 | Compact Initiative A | 101 |
| 8928495 | Isfahan | Safavid | 28 | 44 | Legacy Model | 102 |
| 5844284 | Constantinople | Ottoman | 37 | 50 | Regional Cluster | 103 |

**Table `market_regions`**

| market_region_id | region_id | region_name | import_volume | primary_use | cultural_adoption | trade_route | workshop_id |
|---|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Europe | 24 | floor covering | high | regional-trade-66 | 1 |
| 2 | 4180948 | Far East | 28 | wall hanging | moderate | legacy-trade-67 | 2 |
| 3 | 3012829 | Central Asia | 32 | furniture cover | low | compact-trade-68 | 3 |
| 4 | 778576 | Europe | 36 | floor covering | high | composite-trade-69 | 4 |

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
