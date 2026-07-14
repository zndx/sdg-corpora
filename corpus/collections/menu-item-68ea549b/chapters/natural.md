## Menu Architecture and Dining Operations

Every restaurant or catering operation maintains a structured record of what it serves, how items relate to ingredients, which course each dish belongs to, and how pricing shifts across occasions and time windows. The domain of menu management captures these relationships in a set of interlinked tables that together describe the full lifecycle of a dish—from its raw components through its placement on a menu, its pricing tier, and the dining occasion for which it is offered. This chapter walks through each table and view, showing how the records interlock and what operational questions they answer.

The foundation of any menu system is the item itself. A menu item carries a unique identifier, a human-readable name, a price point, a category label, and metadata such as whether it is vegetarian and its weight in grams.

**Table `menu_items`**

| id | item_id | name | price | category | is_vegetarian | description | weight_grams | ingredient_id | course_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Extended Review | 12.87 | APERITIF COCKTAILS | true | Extended Survey | 22 | 1 | 6983 |
| 101 | ITE-2795 | Pilot Initiative A | 35.45 | STARTERS | false | Pilot Corridor A | 32 | 2 | 8189505 |
| 102 | ITE-2798 | Baseline Model | 29.24 | MAINS | true | Baseline Series | 42 | 3 | 9246307 |
| 103 | ITE-2801 | Distributed Cluster | 29.99 | VEGETABLES & SALADS | false | Distributed Assessment | 52 | 4 | 99615 |

Consider the item `ITE-2792`, named "Extended Review," priced at 12.87 and categorized under APERITIF COCKTAILS. It is marked as vegetarian, weighs 22 grams, and carries the description "Extended Survey." The item `ITE-2795`, "Pilot Initiative A," sits in the STARTERS category at 35.45, is not vegetarian, and weighs 32 grams. The item `ITE-2798`, "Baseline Model," belongs to MAINS, is vegetarian, and weighs 42 grams. Finally, `ITE-2801`, "Distributed Cluster," falls under VEGETABLES & SALADS at 29.99, is not vegetarian, and weighs 52 grams. Each item also carries an `ingredient_id` and a `course_id` that link it to its component ingredient and its course placement, respectively.

Every menu item traces back to at least one ingredient. The ingredients table records the component's identity, its type (PROTEIN, VEGETABLE, FRUIT, SPICE), its origin region, whether it carries an allergen flag, and the menu item it belongs to.

**Table `ingredients`**

| id | ingredient_id | name | type | origin_region | allergen_flag | menu_item_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | PROTEIN | baseline-origin-61 | false | 100 | 2025-01-01 00:14:00 |
| 2 | 5844284 | Pilot Initiative A | VEGETABLE | pilot-origin-62 | true | 101 | 2025-02-06 03:14:00 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | FRUIT | extended-origin-63 | false | 102 | 2025-03-11 06:14:00 |
| 4 | 2087735 | Distributed Cluster | SPICE | integrated-origin-64 | true | 103 | 2025-04-16 09:14:00 |

The ingredient with `ingredient_id` 1450638, named "Extended Review," is classified as a PROTEIN originating from `baseline-origin-61`. It is not flagged as an allergen and is associated with menu item 100. The ingredient `5844284`, also named "Pilot Initiative A," is a VEGETABLE from `pilot-origin-62` and carries an allergen flag of true, linked to menu item 101. The ingredient `template_ivacode_pagata_20det40ind`, named "Baseline Model," is a FRUIT from `extended-origin-63`, is not allergenic, and maps to menu item 102. The ingredient `2087735`, named "Distributed Cluster," is a SPICE from `integrated-origin-64`, is allergenic, and maps to menu item 103. Each ingredient also carries a `created_at` timestamp, with the earliest entry dated 2025-01-01 and the latest on 2025-04-16.

Menu items are organized into courses, which impose a sequence on the dining experience. The menu_courses table assigns each course a name, a sequence order, and a link back to the menu item it anchors.

**Table `menu_courses`**

| course_id | name | sequence_order | menu_item_id |
|---|---|---|---|
| 6983 | STARTERS | 42 | 100 |
| 8189505 | MAINS | 53 | 101 |
| 9246307 | VEGETABLES & SALADS | 64 | 102 |
| 99615 | DESSERTS | 75 | 103 |

The course with `course_id` 6983 is named STARTERS and carries a sequence order of 42. It is linked to menu item 100. The course `8189505`, named MAINS, has a sequence order of 53 and links to menu item 101. The course `9246307`, named VEGETABLES & SALADS, sits at sequence order 64 and links to menu item 102. The course `99615`, named DESSERTS, has the highest sequence order of 75 and links to menu item 103. The ascending sequence values reflect the typical progression of a meal: appetizers first, followed by mains, vegetables, and finally desserts.

Pricing in this domain is not static. It varies by tier, each tier specifying a course count, a price, the days on which it is valid, and a time window during which the tier applies.

**Table `pricing_tiers`**

| id | tier_id | course_count | price | valid_days | valid_start | valid_end | course_id |
|---|---|---|---|---|---|---|---|
| 1 | default_chart_a_account_56 | 12 | 12.87 | MONDAY | 2024-03-06T02:30:00 | 2022-05-16T16:00:00 | 6983 |
| 2 | 9736902 | 7 | 35.45 | TUESDAY | 2025-08-17T09:47:00 | 2023-10-27T23:17:00 | 8189505 |
| 3 | 790462 | 12 | 29.24 | WEDNESDAY | 2022-01-01T16:04:00 | 2024-03-11T06:34:00 | 9246307 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | 13 | 29.99 | THURSDAY | 2023-06-12T23:21:00 | 2025-08-22T13:51:00 | 99615 |

The tier `default_chart_a_account_56` covers 12 courses at a price of 12.87, is valid on MONDAY, and has a validity window from 2024-03-06T02:30:00 to 2022-05-16T16:00:00. Note that the end date precedes the start date, indicating a configuration that may require review. The tier `9736902` covers 7 courses at 35.45, is valid on TUESDAY, and spans from 2025-08-17T09:47:00 to 2023-10-27T23:17:00—a similarly inverted window. The tier `790462` covers 12 courses at 29.24, is valid on WEDNESDAY, and spans from 2022-01-01T16:04:00 to 2024-03-11T06:34:00. The tier `ce090318-ea6a-431b-949e-c1573da75d62`, a UUID-formatted identifier, covers 13 courses at 29.99, is valid on THURSDAY, and spans from 2023-06-12T23:21:00 to 2025-08-22T13:51:00. Each tier also links to a `course_id`, binding the pricing structure to a specific course.

Dining occasions capture the context in which a menu is served. Each occasion has a unique identifier, a name, a duration in minutes, an availability flag, and a link to the pricing tier that applies.

**Table `dining_occasions`**

| dining_occasion_id | occasion_id | name | duration_minutes | is_available | pricing_tier_id |
|---|---|---|---|---|---|
| 1 | b_V-ART-43 | Extended Review | 35 | true | 1 |
| 2 | 24371134 | Pilot Initiative A | 38 | false | 2 |
| 3 | 10966239 | Baseline Model | 41 | true | 3 |
| 4 | 611517 | Distributed Cluster | 44 | false | 4 |

The occasion `b_V-ART-43`, named "Extended Review," lasts 35 minutes, is available, and is associated with pricing tier 1. The occasion `24371134`, named "Pilot Initiative A," lasts 38 minutes, is not available, and links to pricing tier 2. The occasion `10966239`, named "Baseline Model," lasts 41 minutes, is available, and links to pricing tier 3. The occasion `611517`, named "Distributed Cluster," lasts 44 minutes, is not available, and links to pricing tier 4. The duration increases monotonically across the four records, suggesting a progression from shorter to longer dining experiences.

The view `v_menu_item_ingredient` joins menu items with their ingredients, answering the question: which ingredient is associated with each menu item, and what are the shared identifiers?

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

In the first row, menu item `ITE-2792` ("Extended Review," priced at 12.87) is joined with ingredient `1450638` ("Extended Review"). The view surfaces both the menu item's internal `id` (100) and the ingredient's internal `id` (1), along with the ingredient's own `ingredient_id` (1450638). The second row links menu item `ITE-2795` ("Pilot Initiative A," 35.45) with ingredient `5844284` ("Pilot Initiative A"). The third row connects `ITE-2798` ("Baseline Model," 29.24) with ingredient `template_ivacode_pagata_20det40ind` ("Baseline Model"). The fourth row connects `ITE-2801` ("Distributed Cluster," 29.99) with ingredient `2087735` ("Distributed Cluster"). The view makes it straightforward to trace any menu item back to its ingredient by name and by both internal and external identifiers.

The view `v_menu_item_menu_course` joins menu items with their courses, answering the question: which course does each menu item belong to, and in what sequence does that course appear?

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

The first row shows menu item `ITE-2792` ("Extended Review," 12.87) linked to the course STARTERS at sequence order 42. The second row shows `ITE-2795` ("Pilot Initiative A," 35.45) linked to MAINS at sequence order 53. The third row shows `ITE-2798` ("Baseline Model," 29.24) linked to VEGETABLES & SALADS at sequence order 64. The fourth row shows `ITE-2801` ("Distributed Cluster," 29.99) linked to DESSERTS at sequence order 75. This view is the primary tool for reconstructing the meal sequence: it tells you which dish appears first, second, third, and fourth.

The view `v_ingredient_menu_item` performs the same join as `v_menu_item_ingredient` but from the ingredient's perspective, answering: for each ingredient, which menu item does it serve?

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

The first row presents ingredient `1450638` ("Extended Review") linked to menu item `ITE-2792` ("Extended Review," 12.87). The second row presents ingredient `5844284` ("Pilot Initiative A") linked to menu item `ITE-2795` ("Pilot Initiative A," 35.45). The third row presents ingredient `template_ivacode_pagata_20det40ind` ("Baseline Model") linked to menu item `ITE-2798` ("Baseline Model," 29.24). The fourth row presents ingredient `2087735` ("Distributed Cluster") linked to menu item `ITE-2801` ("Distributed Cluster," 29.99). This perspective is useful when inventory or allergen management starts from the ingredient side and needs to propagate upward to the menu item.

The view `v_menu_course_menu_item` joins menu courses with their menu items, answering: for each course, which menu item is assigned to it?

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

The first row shows the course STARTERS (sequence order 42) linked to menu item `ITE-2792` ("Extended Review," 12.87). The second row shows MAINS (sequence order 53) linked to `ITE-2795` ("Pilot Initiative A," 35.45). The third row shows VEGETABLES & SALADS (sequence order 64) linked to `ITE-2798` ("Baseline Model," 29.24). The fourth row shows DESSERTS (sequence order 75) linked to `ITE-2801` ("Distributed Cluster," 29.99). This view is the inverse of `v_menu_item_menu_course` and is useful when a chef or menu planner starts from the course structure and needs to see which dishes fill each slot.

The view `v_pricing_tier_menu_course` joins pricing tiers with their courses, answering: which pricing tier applies to which course, and what are the pricing parameters?

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

The first row shows tier `default_chart_a_account_56` (12 courses, price 12.87, valid MONDAY) linked to course 6983 (STARTERS). The second row shows tier `9736902` (7 courses, price 35.45, valid TUESDAY) linked to course 8189505 (MAINS). The third row shows tier `790462` (12 courses, price 29.24, valid WEDNESDAY) linked to course 9246307 (VEGETABLES & SALADS). The fourth row shows tier `ce090318-ea6a-431b-949e-c1573da75d62` (13 courses, price 29.99, valid THURSDAY) linked to course 99615 (DESSERTS). This view is essential for cost control: it tells you the price and validity window for each course under each tier.

The view `v_dining_occasion_pricing_tier` joins dining occasions with their pricing tiers, answering: for each dining occasion, which pricing tier applies and what are the occasion's parameters?

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

The first row shows occasion `b_V-ART-43` ("Extended Review," 35 minutes, available) linked to pricing tier 1 (`default_chart_a_account_56`, 12 courses, 12.87, MONDAY). The second row shows occasion `24371134` ("Pilot Initiative A," 38 minutes, not available) linked to pricing tier 2 (`9736902`, 7 courses, 35.45, TUESDAY). The third row shows occasion `10966239` ("Baseline Model," 41 minutes, available) linked to pricing tier 3 (`790462`, 12 courses, 29.24, WEDNESDAY). The fourth row shows occasion `611517` ("Distributed Cluster," 44 minutes, not available) linked to pricing tier 4 (`ce090318-ea6a-431b-949e-c1573da75d62`, 13 courses, 29.99, THURSDAY). This view is the operational bridge between the dining context and the financial structure: it tells you which tier governs pricing for a given occasion, how long the occasion lasts, and whether it is currently available for booking.

The five base tables and six views together form a complete picture of menu operations. The base tables store the raw records: what items exist, what ingredients they use, which courses they belong to, how pricing is structured, and which dining occasions are active. The views join these records to answer specific operational questions—ingredient lookup, course sequencing, pricing validation, and occasion-to-tier mapping. Together they enable a restaurant or catering operation to manage its menu with precision, ensuring that every dish is traceable to its components, correctly sequenced within a course, priced according to the appropriate tier, and available for the right dining occasion.