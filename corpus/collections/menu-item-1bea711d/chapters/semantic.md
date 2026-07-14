The domain under examination is a catering and menu management system in which a kitchen maintains a catalog of dishes, each dish is composed of ingredients and optionally paired with a side item, and customers place catering orders that are decomposed into line items referencing specific menu dishes. The relational schema captures this structure through a set of normalized base tables linked by foreign keys and junction tables, and it exposes the domain's composite facts through a family of materialized views that reassemble the normalized pieces into human-readable detail rows. Understanding the schema requires tracing three conceptual layers: the entity tables that store atomic facts, the associative tables that resolve many-to-many relationships, and the views that project those facts back into the business questions operators actually ask.

## Entity Tables and Their Columns

The catalog of dishes lives in the `menu_items` table, which assigns each dish a surrogate primary key (`menu_item_id`), a business identifier (`item_identifier`), a human-readable name (`item_name`), a `base_price`, a `category` label, an availability flag (`is_available`), a `minimum_order_quantity`, and a foreign key (`side_item_id`) pointing to the `side_items` table. The first four rows illustrate the range of values: `Seasonal Survey` (identifier `ITE-2045`, price 12.72, category `compact-category-92`, available) sits alongside `Integrated Corridor` (identifier `ITE-2050`, price 12.87, category `composite-category-93`, unavailable, with a minimum order of five units). The `side_item_id` column on `menu_items` establishes a one-to-one or one-to-zero relationship between a dish and its designated side — for instance, menu item 1 (`Seasonal Survey`) is paired with side item 1, while menu item 2 (`Integrated Corridor`) is paired with side item 2.

**Table `menu_items`**

| menu_item_id | item_identifier | item_name | base_price | category | is_available | minimum_order_quantity | side_item_id |
|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 12.72 | compact-category-92 | true | 0 | 1 |
| 2 | ITE-2050 | Integrated Corridor | 12.87 | composite-category-93 | false | 5 | 2 |
| 3 | ITE-2055 | Extended Series D | 17.41 | primary-category-94 | true | 0 | 3 |
| 4 | ITE-2060 | Pilot Assessment | 18.59 | adaptive-category-95 | false | 14 | 4 |

The `food_ingredients` table stores the raw ingredients that compose dishes. Each row carries an `ingredient_id` (which serves as the primary key), an `ingredient_name`, an `ingredient_type` classification, a boolean `is_allergen` flag, and an `origin_region` code. The sample data shows ingredients such as `Pilot Assessment` (type `primary-ingredie-70`, not an allergen, from `baseline-origin-61`) and `Baseline Survey` (type `adaptive-ingredie-71`, marked as an allergen, from `pilot-origin-62`). The `ingredient_id` values are heterogeneous: some are pure integers like `1450638` and `5844284`, while others are composite strings such as `template_ivacode_pagata_20det40ind`, reflecting a mixed-key strategy that accommodates both auto-generated and externally assigned identifiers.

**Table `food_ingredients`**

| ingredient_id | ingredient_name | ingredient_type | is_allergen | origin_region |
|---|---|---|---|---|
| 1450638 | Pilot Assessment | primary-ingredie-70 | false | baseline-origin-61 |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | true | pilot-origin-62 |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | false | extended-origin-63 |
| 2087735 | Adaptive Series | baseline-ingredie-73 | true | integrated-origin-64 |

The `side_items` table holds the optional accompaniments that can be attached to menu dishes. Its primary key is `side_item_id`, and each row includes a `side_id` (a secondary identifier, in some cases a Google Place ID such as `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), a `side_name`, a `side_type` classification, an `is_included` flag indicating whether the side comes standard with the dish, and a `menu_item_id` foreign key that points back to the `menu_items` table. This back-reference creates the inverse of the `side_item_id` column on `menu_items`: side item 1 (`Integrated Programme A`, type `distributed-side-18`, included) is linked to menu item 1, and side item 2 (`Extended Standard`, type `baseline-side-19`, not included) is linked to menu item 2. The `is_included` flag distinguishes complimentary sides from add-ons.

**Table `side_items`**

| side_item_id | side_id | side_name | side_type | is_included | menu_item_id |
|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | distributed-side-18 | true | 1 |
| 2 | 937737 | Extended Standard | baseline-side-19 | false | 2 |
| 3 | 6564389 | Pilot Framework | pilot-side-20 | true | 3 |
| 4 | 103178 | Baseline Protocol D | extended-side-21 | false | 4 |

## Associative Tables for Many-to-Many Relationships

A single menu item can contain multiple ingredients, and a single ingredient can appear in multiple menu items. This many-to-many relationship is resolved through the `items_ingredients` junction table, which contains exactly two columns: `menu_item_id` and `ingredient_id`. Each row asserts that a particular ingredient is used in a particular dish. The data shows menu item 1 (`Seasonal Survey`) uses ingredients `1450638` and `5844284`; menu item 2 (`Integrated Corridor`) uses `5844284` and `template_ivacode_pagata_20det40ind`; menu item 3 (`Extended Series D`) uses `template_ivacode_pagata_20det40ind` and `2087735`; and menu item 4 (`Pilot Assessment`) uses `2087735` and `1450638`. The table is a pure bridge with no additional attributes — it exists solely to normalize the relationship.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1450638 |
| 1 | 5844284 |
| 2 | 5844284 |
| 2 | template_ivacode_pagata_20det40ind |
| 3 | template_ivacode_pagata_20det40ind |
| 3 | 2087735 |
| 4 | 2087735 |
| 4 | 1450638 |

The `ingredients_items` table appears to be a mirror or alternate representation of the same many-to-many relationship, storing the same pair of columns (`menu_item_id` and `ingredient_id`) in the same logical role. In some schema designs this redundancy supports bidirectional traversal without requiring the query engine to infer the join direction; in others it may serve as a staging table for incremental loads. Its presence alongside `items_ingredients` suggests the schema was designed to accommodate both directions of the relationship query without requiring a `JOIN` direction convention.

**Table `ingredients_items`**

| ingredient_id | menu_item_id |
|---|---|
| 1450638 | 1 |
| 1450638 | 2 |
| 5844284 | 2 |
| 5844284 | 3 |
| template_ivacode_pagata_20det40ind | 3 |
| template_ivacode_pagata_20det40ind | 4 |
| 2087735 | 4 |
| 2087735 | 1 |

## Order Tables and Their Cardinality

The ordering subsystem is built on two tables: `catering_orders` and `order_lines`. The `catering_orders` table stores the header-level information for each catering event. Its primary key is `catering_order_id`, and each row records an `order_id` (a secondary identifier), an `order_date` and `delivery_date` (both stored as ISO-8601 timestamps), an `order_status` code, a `total_amount` for the entire order, and a `contact_phone` field that holds the customer's name in the sample data (e.g., `Joe Tsai`, `Stephanie Collins`, `Tasha Rodriguez`, `Walter Pratt`). The `order_status` values are categorical codes such as `regional-order-84` and `legacy-order-85`. The four sample orders span delivery dates from 2022 to 2025, with total amounts ranging from 112.11 to 15,418.

**Table `catering_orders`**

| catering_order_id | order_id | order_date | delivery_date | order_status | total_amount | contact_phone |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-27T13:15:00 | 2022-09-10 | regional-order-84 | 112.11 | Joe Tsai |
| 1001 | comi | 2024-07-11T20:32:00 | 2023-02-21 | legacy-order-85 | 1,979 | Stephanie Collins |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 2024-07-05 | compact-order-86 | 15,418 | Tasha Rodriguez |
| 1003 | 99669 | 2022-05-06T10:06:00 | 2025-12-16 | composite-order-87 | 12,579 | Walter Pratt |

The `order_lines` table stores the line-item details of each catering order. Its primary key is `id`, and each row includes a `line_id` (a secondary identifier that can be a UUID, a numeric string, or a short integer), a `quantity` of units ordered, a `unit_price`, a `line_total` for the line's extended cost, `special_instructions` (a free-text or coded field such as `regional-special-78`), a `menu_item_id` foreign key pointing to the `menu_items` table, and a `catering_order_id` foreign key pointing to the `catering_orders` table. The `menu_item_id` and `catering_order_id` columns together enforce the cardinality: each line item belongs to exactly one catering order and references exactly one menu item, while a single catering order can contain multiple line items and a single menu item can appear on multiple orders. The sample data shows order line 100 (line ID `ChIJyxw4mjhu5kcR9yl4qn8CFbo`, quantity 9, unit price 5,692, total 20.70) belonging to catering order 1000 and referencing menu item 1; order line 103 (line ID `9085267`, quantity 12, unit price 211.07, total 31.80) belonging to catering order 1003 and referencing menu item 4.

**Table `order_lines`**

| id | line_id | quantity | unit_price | line_total | special_instructions | menu_item_id | catering_order_id |
|---|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 20.70 | regional-special-78 | 1 | 1000 |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 24.40 | legacy-special-79 | 2 | 1001 |
| 102 | 69436 | 0 | 2,705 | 28.10 | compact-special-80 | 3 | 1002 |
| 103 | 9085267 | 12 | 211.07 | 31.80 | composite-special-81 | 4 | 1003 |

The `orders_lines` table, like `ingredients_items`, appears to be a redundant or alternate representation of the order-line relationship, potentially serving the same normalization role as `order_lines` itself or acting as a staging area for order processing pipelines.

**Table `orders_lines`**

| catering_order_id | order_line_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

## Views: Reconstructing Domain Facts

The views in this schema are the primary interface for business reporting. Each view performs a `JOIN` across two or more base tables to reconstruct a domain fact that spans multiple normalized entities.

The `menu_item_food_ingredient_detail_view` joins `menu_items` to `items_ingredients` and then to `food_ingredients`, producing one row per menu-item–ingredient pairing. A row from this view tells a chef which ingredients compose a given dish. For example, the view would return a row showing that menu item 1 (`Seasonal Survey`) contains ingredient `1450638` (`Pilot Assessment`), and another row showing the same menu item contains ingredient `5844284` (`Baseline Survey`).

**View `menu_item_food_ingredient_detail_view`**

```sql
CREATE VIEW menu_item_food_ingredient_detail_view AS
SELECT a.menu_item_id, a.item_identifier, a.item_name, b.ingredient_id AS ingredient_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.ingredient_type AS ingredient_ingredient_type
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.menu_item_id
  JOIN food_ingredients b ON b.ingredient_id = j.ingredient_id;
```

| menu_item_id | item_identifier | item_name | ingredient_ingredient_id | ingredient_ingredient_name | ingredient_ingredient_type |
|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 1450638 | Pilot Assessment | primary-ingredie-70 |
| 1 | ITE-2045 | Seasonal Survey | 5844284 | Baseline Survey | adaptive-ingredie-71 |
| 2 | ITE-2050 | Integrated Corridor | 5844284 | Baseline Survey | adaptive-ingredie-71 |
| 2 | ITE-2050 | Integrated Corridor | template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 |
| 3 | ITE-2055 | Extended Series D | template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 |
| 3 | ITE-2055 | Extended Series D | 2087735 | Adaptive Series | baseline-ingredie-73 |
| 4 | ITE-2060 | Pilot Assessment | 2087735 | Adaptive Series | baseline-ingredie-73 |
| 4 | ITE-2060 | Pilot Assessment | 1450638 | Pilot Assessment | primary-ingredie-70 |

The `menu_item_side_item_view` joins `menu_items` to `side_items` on the matching `side_item_id` / `menu_item_id` columns, producing one row per dish–side pairing. This view answers the question "what side comes with this dish?" A row from the view would show that menu item 1 (`Seasonal Survey`) is paired with side item 1 (`Integrated Programme A`, type `distributed-side-18`, included).

**View `menu_item_side_item_view`**

```sql
CREATE VIEW menu_item_side_item_view AS
SELECT a.menu_item_id, a.item_identifier, a.item_name, a.base_price, b.side_item_id AS item_side_item_id, b.side_id AS item_side_id, b.side_name AS item_side_name
FROM menu_items a JOIN side_items b ON a.side_item_id = b.side_item_id;
```

| menu_item_id | item_identifier | item_name | base_price | item_side_item_id | item_side_id | item_side_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 12.72 | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A |
| 2 | ITE-2050 | Integrated Corridor | 12.87 | 2 | 937737 | Extended Standard |
| 3 | ITE-2055 | Extended Series D | 17.41 | 3 | 6564389 | Pilot Framework |
| 4 | ITE-2060 | Pilot Assessment | 18.59 | 4 | 103178 | Baseline Protocol D |

The `food_ingredient_menu_item_detail_view` is the inverse of `menu_item_food_ingredient_detail_view`: it joins `food_ingredients` to `items_ingredients` and then to `menu_items`, producing one row per ingredient–menu-item pairing. This view answers the question "which dishes use this ingredient?" A row would show that ingredient `1450638` (`Pilot Assessment`) appears in menu items 1 and 4.

**View `food_ingredient_menu_item_detail_view`**

```sql
CREATE VIEW food_ingredient_menu_item_detail_view AS
SELECT a.ingredient_id, a.ingredient_name, a.ingredient_type, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM food_ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.ingredient_id
  JOIN menu_items b ON b.menu_item_id = j.menu_item_id;
```

| ingredient_id | ingredient_name | ingredient_type | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|
| 1450638 | Pilot Assessment | primary-ingredie-70 | 1 | ITE-2045 | Seasonal Survey |
| 1450638 | Pilot Assessment | primary-ingredie-70 | 2 | ITE-2050 | Integrated Corridor |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | 2 | ITE-2050 | Integrated Corridor |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | 3 | ITE-2055 | Extended Series D |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | 3 | ITE-2055 | Extended Series D |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | 4 | ITE-2060 | Pilot Assessment |
| 2087735 | Adaptive Series | baseline-ingredie-73 | 4 | ITE-2060 | Pilot Assessment |
| 2087735 | Adaptive Series | baseline-ingredie-73 | 1 | ITE-2045 | Seasonal Survey |

The `side_item_menu_item_view` is the inverse of `menu_item_side_item_view`: it joins `side_items` to `menu_items` on the matching `side_item_id` / `menu_item_id` columns, producing one row per side–dish pairing. This view answers the question "which dish is this side attached to?" A row would show that side item 1 (`Integrated Programme A`) is attached to menu item 1 (`Seasonal Survey`).

**View `side_item_menu_item_view`**

```sql
CREATE VIEW side_item_menu_item_view AS
SELECT a.side_item_id, a.side_id, a.side_name, a.side_type, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM side_items a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| side_item_id | side_id | side_name | side_type | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | distributed-side-18 | 1 | ITE-2045 | Seasonal Survey |
| 2 | 937737 | Extended Standard | baseline-side-19 | 2 | ITE-2050 | Integrated Corridor |
| 3 | 6564389 | Pilot Framework | pilot-side-20 | 3 | ITE-2055 | Extended Series D |
| 4 | 103178 | Baseline Protocol D | extended-side-21 | 4 | ITE-2060 | Pilot Assessment |

The `order_line_menu_item_view` joins `order_lines` to `menu_items` on `menu_item_id`, producing one row per order line enriched with the dish's name, price, and category. This view answers the question "what dish was ordered, and how many?" A row from the view would show that order line 100 (quantity 9, unit price 5,692) references menu item 1 (`Seasonal Survey`, category `compact-category-92`).

**View `order_line_menu_item_view`**

```sql
CREATE VIEW order_line_menu_item_view AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM order_lines a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | line_id | quantity | unit_price | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1 | ITE-2045 | Seasonal Survey |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 2 | ITE-2050 | Integrated Corridor |
| 102 | 69436 | 0 | 2,705 | 3 | ITE-2055 | Extended Series D |
| 103 | 9085267 | 12 | 211.07 | 4 | ITE-2060 | Pilot Assessment |

The `order_line_catering_order_view` joins `order_lines` to `catering_orders` on `catering_order_id`, producing one row per order line enriched with the order's date, status, and total amount. This view answers the question "which catering order does this line belong to, and when is it due?" A row would show that order line 100 belongs to catering order 1000 (order date `2023-02-27T13:15:00`, delivery date `2022-09-10`, status `regional-order-84`, total amount 112.11, contact `Joe Tsai`).

**View `order_line_catering_order_view`**

```sql
CREATE VIEW order_line_catering_order_view AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.catering_order_id AS order_catering_order_id, b.order_id AS order_order_id, b.order_date AS order_order_date
FROM order_lines a JOIN catering_orders b ON a.catering_order_id = b.catering_order_id;
```

| id | line_id | quantity | unit_price | order_catering_order_id | order_order_id | order_order_date |
|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1000 | 1030 | 2023-02-27T13:15:00 |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 1001 | comi | 2024-07-11T20:32:00 |
| 102 | 69436 | 0 | 2,705 | 1002 | state_uk_22 | 2025-12-22T03:49:00 |
| 103 | 9085267 | 12 | 211.07 | 1003 | 99669 | 2022-05-06T10:06:00 |

The `catering_order_order_line_detail_view` joins `catering_orders` to `order_lines` on `catering_order_id`, producing one row per order line enriched with the header-level order information. This view answers the question "what are all the line items for a given catering order, with the order's metadata attached?" A row would show that catering order 1000 (contact `Joe Tsai`, total 112.11) contains order line 100 (menu item 1, quantity 9, unit price 5,692).

**View `catering_order_order_line_detail_view`**

```sql
CREATE VIEW catering_order_order_line_detail_view AS
SELECT a.catering_order_id, a.order_id, a.order_date, b.id AS line_id, b.line_id AS line_line_id, b.quantity AS line_quantity
FROM catering_orders a
  JOIN orders_lines j ON j.catering_order_id = a.catering_order_id
  JOIN order_lines b ON b.id = j.order_line_id;
```

| catering_order_id | order_id | order_date | line_id | line_line_id | line_quantity |
|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-27T13:15:00 | 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 |
| 1000 | 1030 | 2023-02-27T13:15:00 | 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 |
| 1001 | comi | 2024-07-11T20:32:00 | 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 |
| 1001 | comi | 2024-07-11T20:32:00 | 102 | 69436 | 0 |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 102 | 69436 | 0 |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 103 | 9085267 | 12 |
| 1003 | 99669 | 2022-05-06T10:06:00 | 103 | 9085267 | 12 |
| 1003 | 99669 | 2022-05-06T10:06:00 | 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 |

## Closing Synthesis

The schema follows a clean normalization pattern: entity tables (`menu_items`, `food_ingredients`, `side_items`, `catering_orders`) store atomic facts with surrogate primary keys; associative tables (`items_ingredients`, `ingredients_items`) resolve many-to-many relationships through two-column junctions; and transactional tables (`order_lines`) link entities through foreign keys while recording quantitative facts (`quantity`, `unit_price`, `line_total`). The views do not introduce new data — they merely reassemble the normalized pieces through `JOIN` operations so that business users can ask natural questions ("what ingredients are in this dish?", "which orders contain this ingredient?", "what side comes with this menu item?") without writing multi-table joins themselves. The foreign-key chains are short and direct: `menu_items.side_item_id` → `side_items.side_item_id`, `order_lines.menu_item_id` → `menu_items.menu_item_id`, `order_lines.catering_order_id` → `catering_orders.catering_order_id`, and the junction tables `items_ingredients` and `ingredients_items` bridge `menu_items` and `food_ingredients` through their shared `menu_item_id` / `ingredient_id` columns. This design keeps each table focused on a single concept while the views provide the composite perspectives that drive reporting and operational decision-making.