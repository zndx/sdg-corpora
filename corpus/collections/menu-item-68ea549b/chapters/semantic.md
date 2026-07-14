The chapter has been written to `/tmp/harness_semantic_se0jlx35/chapter_relational_modelling.md`. All 11 payload blocks are embedded in their correct positions, the prose covers all five base tables and six views with concrete data values woven throughout, and the word count falls within the 1500–2500 range.

## Data appendix

**Table `menu_items`**

| id | item_id | name | price | category | is_vegetarian | description | weight_grams | ingredient_id | course_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Extended Review | 12.87 | APERITIF COCKTAILS | true | Extended Survey | 22 | 1 | 6983 |
| 101 | ITE-2795 | Pilot Initiative A | 35.45 | STARTERS | false | Pilot Corridor A | 32 | 2 | 8189505 |
| 102 | ITE-2798 | Baseline Model | 29.24 | MAINS | true | Baseline Series | 42 | 3 | 9246307 |
| 103 | ITE-2801 | Distributed Cluster | 29.99 | VEGETABLES & SALADS | false | Distributed Assessment | 52 | 4 | 99615 |

**Table `ingredients`**

| id | ingredient_id | name | type | origin_region | allergen_flag | menu_item_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | PROTEIN | baseline-origin-61 | false | 100 | 2025-01-01 00:14:00 |
| 2 | 5844284 | Pilot Initiative A | VEGETABLE | pilot-origin-62 | true | 101 | 2025-02-06 03:14:00 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | FRUIT | extended-origin-63 | false | 102 | 2025-03-11 06:14:00 |
| 4 | 2087735 | Distributed Cluster | SPICE | integrated-origin-64 | true | 103 | 2025-04-16 09:14:00 |

**Table `menu_courses`**

| course_id | name | sequence_order | menu_item_id |
|---|---|---|---|
| 6983 | STARTERS | 42 | 100 |
| 8189505 | MAINS | 53 | 101 |
| 9246307 | VEGETABLES & SALADS | 64 | 102 |
| 99615 | DESSERTS | 75 | 103 |

**Table `pricing_tiers`**

| id | tier_id | course_count | price | valid_days | valid_start | valid_end | course_id |
|---|---|---|---|---|---|---|---|
| 1 | default_chart_a_account_56 | 12 | 12.87 | MONDAY | 2024-03-06T02:30:00 | 2022-05-16T16:00:00 | 6983 |
| 2 | 9736902 | 7 | 35.45 | TUESDAY | 2025-08-17T09:47:00 | 2023-10-27T23:17:00 | 8189505 |
| 3 | 790462 | 12 | 29.24 | WEDNESDAY | 2022-01-01T16:04:00 | 2024-03-11T06:34:00 | 9246307 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | 13 | 29.99 | THURSDAY | 2023-06-12T23:21:00 | 2025-08-22T13:51:00 | 99615 |

**Table `dining_occasions`**

| dining_occasion_id | occasion_id | name | duration_minutes | is_available | pricing_tier_id |
|---|---|---|---|---|---|
| 1 | b_V-ART-43 | Extended Review | 35 | true | 1 |
| 2 | 24371134 | Pilot Initiative A | 38 | false | 2 |
| 3 | 10966239 | Baseline Model | 41 | true | 3 |
| 4 | 611517 | Distributed Cluster | 44 | false | 4 |

**View `v_menu_item_ingredient`**

```sql
CREATE VIEW v_menu_item_ingredient AS
SELECT a.id, a.item_id, a.name, a.price, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a JOIN ingredients b ON a.ingredient_id = b.id;
```

| id | item_id | name | price | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Extended Review | 12.87 | 1 | 1450638 | Extended Review |
| 101 | ITE-2795 | Pilot Initiative A | 35.45 | 2 | 5844284 | Pilot Initiative A |
| 102 | ITE-2798 | Baseline Model | 29.24 | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 103 | ITE-2801 | Distributed Cluster | 29.99 | 4 | 2087735 | Distributed Cluster |

**View `v_menu_item_menu_course`**

```sql
CREATE VIEW v_menu_item_menu_course AS
SELECT a.id, a.item_id, a.name, a.price, b.course_id AS course_course_id, b.name AS course_name, b.sequence_order AS course_sequence_order
FROM menu_items a JOIN menu_courses b ON a.course_id = b.course_id;
```

| id | item_id | name | price | course_course_id | course_name | course_sequence_order |
|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Extended Review | 12.87 | 6983 | STARTERS | 42 |
| 101 | ITE-2795 | Pilot Initiative A | 35.45 | 8189505 | MAINS | 53 |
| 102 | ITE-2798 | Baseline Model | 29.24 | 9246307 | VEGETABLES & SALADS | 64 |
| 103 | ITE-2801 | Distributed Cluster | 29.99 | 99615 | DESSERTS | 75 |

**View `v_ingredient_menu_item`**

```sql
CREATE VIEW v_ingredient_menu_item AS
SELECT a.id, a.ingredient_id, a.name, a.type, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | ingredient_id | name | type | item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | PROTEIN | 100 | ITE-2792 | Extended Review |
| 2 | 5844284 | Pilot Initiative A | VEGETABLE | 101 | ITE-2795 | Pilot Initiative A |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | FRUIT | 102 | ITE-2798 | Baseline Model |
| 4 | 2087735 | Distributed Cluster | SPICE | 103 | ITE-2801 | Distributed Cluster |

**View `v_menu_course_menu_item`**

```sql
CREATE VIEW v_menu_course_menu_item AS
SELECT a.course_id, a.name, a.sequence_order, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM menu_courses a JOIN menu_items b ON a.menu_item_id = b.id;
```

| course_id | name | sequence_order | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 6983 | STARTERS | 42 | 100 | ITE-2792 | Extended Review |
| 8189505 | MAINS | 53 | 101 | ITE-2795 | Pilot Initiative A |
| 9246307 | VEGETABLES & SALADS | 64 | 102 | ITE-2798 | Baseline Model |
| 99615 | DESSERTS | 75 | 103 | ITE-2801 | Distributed Cluster |

**View `v_pricing_tier_menu_course`**

```sql
CREATE VIEW v_pricing_tier_menu_course AS
SELECT a.id, a.tier_id, a.course_count, a.price, b.course_id AS course_course_id, b.name AS course_name, b.sequence_order AS course_sequence_order
FROM pricing_tiers a JOIN menu_courses b ON a.course_id = b.course_id;
```

| id | tier_id | course_count | price | course_course_id | course_name | course_sequence_order |
|---|---|---|---|---|---|---|
| 1 | default_chart_a_account_56 | 12 | 12.87 | 6983 | STARTERS | 42 |
| 2 | 9736902 | 7 | 35.45 | 8189505 | MAINS | 53 |
| 3 | 790462 | 12 | 29.24 | 9246307 | VEGETABLES & SALADS | 64 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | 13 | 29.99 | 99615 | DESSERTS | 75 |

**View `v_dining_occasion_pricing_tier`**

```sql
CREATE VIEW v_dining_occasion_pricing_tier AS
SELECT a.dining_occasion_id, a.occasion_id, a.name, a.duration_minutes, b.id AS tier_id, b.tier_id AS tier_tier_id, b.course_count AS tier_course_count
FROM dining_occasions a JOIN pricing_tiers b ON a.pricing_tier_id = b.id;
```

| dining_occasion_id | occasion_id | name | duration_minutes | tier_id | tier_tier_id | tier_course_count |
|---|---|---|---|---|---|---|
| 1 | b_V-ART-43 | Extended Review | 35 | 1 | default_chart_a_account_56 | 12 |
| 2 | 24371134 | Pilot Initiative A | 38 | 2 | 9736902 | 7 |
| 3 | 10966239 | Baseline Model | 41 | 3 | 790462 | 12 |
| 4 | 611517 | Distributed Cluster | 44 | 4 | ce090318-ea6a-431b-949e-c1573da75d62 | 13 |
