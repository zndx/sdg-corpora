The domain under examination is a restaurant menu management system, where each dish on the menu is decomposed into its constituent ingredients, paired with an optional side dish, offered at a configurable price point, and optionally prepared with a specific bread type. The data models this domain as a set of six base tables and eight materialized views. The base tables capture the canonical entities—menu items, ingredients, side dishes, price options, and bread types—while the junction table `items_ingredients` resolves the many-to-many relationship between menu items and ingredients. The views materialize the most common join paths, allowing downstream consumers to reconstruct domain facts without writing ad-hoc joins.

## Base Tables and Their Attributes

The anchor of the schema is the `menu_items` table, which stores one row per dish. Its primary key is `id`, a surrogate integer identifier. The column `menu_id` carries a business key—values such as `b_VB-IC-15` for the "Extended Review" dish or `2839520` for "Pilot Initiative A"—that ties the row to an external menu catalog. The `name` column holds the human-readable label, `base_price` stores the default price (e.g., `12.72` for "Extended Review"), and `category` classifies the dish into a meal segment such as `scrambles`, `rooster slinger`, `fried egg sandwich`, or `b.e.l.t.`. Three boolean columns—`is_vegetarian`, `is_vegan`, and `is_gluten_free`—encode dietary attributes; for instance, "Extended Review" is marked vegetarian and gluten-free but not vegan. The `serving_time` column restricts availability to a time of day (`breakfast`, `brunch`, `lunch`, or `dinner`). Two foreign keys, `side_dish_id` and `price_option_id`, point into the `side_dishes` and `price_options` tables respectively, enforcing a cardinality-bounded one-to-one relationship: each menu item is associated with at most one side dish and one price option.

**Table `menu_items`**

| id | menu_id | name | base_price | category | is_vegetarian | is_vegan | is_gluten_free | serving_time | side_dish_id | price_option_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-IC-15 | Extended Review | 12.72 | scrambles | true | false | true | breakfast | 1 | 100 |
| 101 | 2839520 | Pilot Initiative A | 12.87 | rooster slinger | false | true | false | brunch | 2 | 101 |
| 102 | id_3 | Baseline Model | 17.41 | fried egg sandwich | true | false | true | lunch | 3 | 102 |
| 103 | id_25 | Distributed Cluster | 18.59 | b.e.l.t. | false | true | false | dinner | 4 | 103 |

The `ingredients` table stores the building blocks of dishes. Its primary key is `id`, and `ingredient_id` is a business key (e.g., `1450638` for the ingredient named "Extended Review"). The `name` column is the ingredient label, `type` classifies it as `protein`, `vegetable`, `fruit`, or `dairy`, and `is_house_made` is a boolean flag. The `origin` column records a provenance string such as `distributed-origin-66` or `pilot-origin-68`. The column `menu_item_id` is a foreign key into `menu_items`, establishing a one-to-many relationship: a single menu item may reference multiple ingredient rows, but each ingredient row belongs to exactly one menu item.

**Table `ingredients`**

| id | ingredient_id | name | type | is_house_made | origin | menu_item_id |
|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | true | distributed-origin-66 | 100 |
| 1001 | 5844284 | Pilot Initiative A | vegetable | false | baseline-origin-67 | 101 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | fruit | true | pilot-origin-68 | 102 |
| 1003 | 2087735 | Distributed Cluster | dairy | false | extended-origin-69 | 103 |

The `side_dishes` table holds the optional accompaniments. Its primary key is `id`, and `side_id` is a business key—values like `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` or `937737`. The `name` column stores the side dish label, `price` records its surcharge (e.g., `12.87` or `35.45`), and `portion_type` describes the serving vessel (`cup`, `bowl`, or `side`). The foreign key `menu_item_id` links the side dish to its parent menu item, again enforcing a one-to-many cardinality from menu item to side dish.

**Table `side_dishes`**

| id | side_id | name | price | portion_type | menu_item_id |
|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | cup | 100 |
| 2 | 937737 | Pilot Initiative A | 35.45 | bowl | 101 |
| 3 | 6564389 | Baseline Model | 29.24 | side | 102 |
| 4 | 103178 | Distributed Cluster | 29.99 | cup | 103 |

The `price_options` table captures alternative pricing configurations. Its primary key is `id`, and `option_id` is a business key that can be a UUID (`a4e3c328-8fb9-11eb-924d-9cd76263cbd0`), a structured code (`1204-0009-S`), or a plain integer (`9424920`). The `price` column stores the monetary value, `type` classifies the option as `base`, `add-on`, `portion`, or `substitution`, and `description` provides a human-readable label. Two foreign keys anchor this table: `menu_item_id` links the price option to its parent menu item, and `ingredient_id` links it to a specific ingredient, enabling price adjustments that are scoped to a particular ingredient substitution or add-on.

**Table `price_options`**

| id | option_id | price | type | description | menu_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | 12.87 | base | Extended Survey | 100 | 1000 |
| 101 | 1204-0009-S | 35.45 | add-on | Pilot Corridor A | 101 | 1001 |
| 102 | 9424920 | 29.24 | portion | Baseline Series | 102 | 1002 |
| 103 | 1186083 | 29.99 | substitution | Distributed Assessment | 103 | 1003 |

The `bread_types` table enumerates the bread varieties available for menu items that require bread. Its primary key is `id`, and `bread_id` is a business key (e.g., `2125` for "white" or `1210-0007-M` for "wheat"). The `name` column holds the bread label, `is_house_made` is a boolean, and `menu_item_id` is a foreign key into `menu_items`. Like the other one-to-many tables, each menu item can have at most one bread type row, and each bread type row belongs to exactly one menu item.

**Table `bread_types`**

| id | bread_id | name | is_house_made | menu_item_id |
|---|---|---|---|---|
| 1 | 2125 | white | true | 100 |
| 2 | 1210-0007-M | wheat | false | 101 |
| 3 | 1152671 | sourdough | true | 102 |
| 4 | 46cf6b73-02b4-4298-a314-f28840b25c46 | focaccia | false | 103 |

The `items_ingredients` table is the junction table that resolves the many-to-many relationship between `menu_items` and `ingredients`. It has no surrogate primary key; instead, the composite of `menu_item_id` and `ingredient_id` serves as the natural key. Each row asserts that a particular ingredient is used in a particular menu item. For example, menu item `100` ("Extended Review") uses both ingredient `1000` and ingredient `1001`, while menu item `103` ("Distributed Cluster") uses ingredients `1003` and `1000`. This table is the only place in the schema where a menu item and an ingredient are linked without a direct foreign key column on either side.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

## Materialized Views and Their Join Semantics

The views in this schema are materialized join queries that reconstruct domain facts from the normalized base tables. Each view answers a specific analytical question by joining the relevant tables and presenting the result as a flat, queryable structure.

### `vw_menu_item_ingredient_detail`

This view joins `menu_items` with `ingredients` on `menu_item_id`, producing one row per ingredient of each menu item. It answers the question: "What ingredients compose each menu item, and what are their properties?" For menu item `100` ("Extended Review"), the view yields a row with ingredient `1000` ("Extended Review", type `protein`, house-made, from `distributed-origin-66`) and another with ingredient `1001` ("Pilot Initiative A", type `vegetable`, not house-made, from `baseline-origin-67`). The view effectively denormalizes the one-to-many relationship between menu items and ingredients into a single flat table.

### `vw_menu_item_side_dish`

This view joins `menu_items` with `side_dishes` on `menu_item_id`, producing one row per side dish associated with a menu item. It answers: "What side dish accompanies each menu item, and at what price and portion type?" For menu item `101` ("Pilot Initiative A"), the view returns a row with side dish `2` ("Pilot Initiative A", price `35.45`, portion type `bowl`). The join reconstructs the side dish context that is otherwise stored in a separate table.

### `vw_menu_item_price_option`

This view joins `menu_items` with `price_options` on `menu_item_id`, producing one row per price option for each menu item. It answers: "What price options are available for each menu item, and what is the option type and description?" For menu item `102` ("Baseline Model"), the view yields a row with price option `102` (price `29.24`, type `portion`, description "Baseline Series"). This view is particularly useful for pricing reports that need to display the menu item name alongside its price option details.

### `vw_ingredient_menu_item`

This view joins `ingredients` with `menu_items` on `menu_item_id`, producing one row per ingredient with its parent menu item's details. It answers: "Which menu item does each ingredient belong to, and what is the menu item's category and dietary profile?" For ingredient `1002` ("Baseline Model", type `fruit`, house-made), the view returns the associated menu item `102` ("Baseline Model", category `fried egg sandwich`, vegetarian, gluten-free). This view is the inverse of `vw_menu_item_ingredient_detail` and is useful when querying from the ingredient side.

### `vw_side_dish_menu_item`

This view joins `side_dishes` with `menu_items` on `menu_item_id`, producing one row per side dish with its parent menu item's details. It answers: "Which menu item is each side dish paired with, and what is the menu item's name and base price?" For side dish `3` ("Baseline Model", price `29.24`, portion type `side`), the view returns menu item `102` ("Baseline Model", base price `17.41`, category `fried egg sandwich`). This view supports side-dish-centric analytics, such as identifying which menu items drive the most side dish revenue.

### `vw_price_option_menu_item`

This view joins `price_options` with `menu_items` on `menu_item_id`, producing one row per price option with its parent menu item's details. It answers: "Which menu item is each price option associated with, and what is the menu item's category and dietary attributes?" For price option `103` (price `29.99`, type `substitution`, description "Distributed Assessment"), the view returns menu item `103` ("Distributed Cluster", base price `18.59`, category `b.e.l.t.`, not vegetarian, vegan, not gluten-free). This view is useful for pricing audits that need to cross-reference price options with menu item metadata.

### `vw_price_option_ingredient`

This view joins `price_options` with `ingredients` on `ingredient_id`, producing one row per price option with its associated ingredient's details. It answers: "Which ingredient is each price option scoped to, and what is the ingredient's type and origin?" For price option `101` (price `35.45`, type `add-on`, description "Pilot Corridor A"), the view returns ingredient `1001` ("Pilot Initiative A", type `vegetable`, not house-made, from `baseline-origin-67`). This view is unique in that it connects two tables that are not directly linked by a foreign key in the base schema—the link is mediated through the `price_options` table itself, which carries both `menu_item_id` and `ingredient_id` as foreign keys.

### `vw_bread_type_menu_item`

This view joins `bread_types` with `menu_items` on `menu_item_id`, producing one row per bread type with its parent menu item's details. It answers: "Which menu item uses each bread type, and what is the menu item's name and serving time?" For bread type `3` ("sourdough", house-made), the view returns menu item `102` ("Baseline Model", serving time `lunch`, category `fried egg sandwich`). This view supports bakery-centric queries, such as identifying which menu items require house-made bread.

**View `vw_menu_item_ingredient_detail`**

```sql
CREATE VIEW vw_menu_item_ingredient_detail AS
SELECT a.id, a.menu_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | menu_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 100 | b_VB-IC-15 | Extended Review | 1000 | 1450638 | Extended Review |
| 100 | b_VB-IC-15 | Extended Review | 1001 | 5844284 | Pilot Initiative A |
| 101 | 2839520 | Pilot Initiative A | 1001 | 5844284 | Pilot Initiative A |
| 101 | 2839520 | Pilot Initiative A | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 102 | id_3 | Baseline Model | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 102 | id_3 | Baseline Model | 1003 | 2087735 | Distributed Cluster |
| 103 | id_25 | Distributed Cluster | 1003 | 2087735 | Distributed Cluster |
| 103 | id_25 | Distributed Cluster | 1000 | 1450638 | Extended Review |
**View `vw_menu_item_side_dish`**

```sql
CREATE VIEW vw_menu_item_side_dish AS
SELECT a.id, a.menu_id, a.name, a.base_price, b.id AS dish_id, b.side_id AS dish_side_id, b.name AS dish_name
FROM menu_items a JOIN side_dishes b ON a.side_dish_id = b.id;
```

| id | menu_id | name | base_price | dish_id | dish_side_id | dish_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-IC-15 | Extended Review | 12.72 | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review |
| 101 | 2839520 | Pilot Initiative A | 12.87 | 2 | 937737 | Pilot Initiative A |
| 102 | id_3 | Baseline Model | 17.41 | 3 | 6564389 | Baseline Model |
| 103 | id_25 | Distributed Cluster | 18.59 | 4 | 103178 | Distributed Cluster |
**View `vw_menu_item_price_option`**

```sql
CREATE VIEW vw_menu_item_price_option AS
SELECT a.id, a.menu_id, a.name, a.base_price, b.id AS option_id, b.option_id AS option_option_id, b.price AS option_price
FROM menu_items a JOIN price_options b ON a.price_option_id = b.id;
```

| id | menu_id | name | base_price | option_id | option_option_id | option_price |
|---|---|---|---|---|---|---|
| 100 | b_VB-IC-15 | Extended Review | 12.72 | 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | 12.87 |
| 101 | 2839520 | Pilot Initiative A | 12.87 | 101 | 1204-0009-S | 35.45 |
| 102 | id_3 | Baseline Model | 17.41 | 102 | 9424920 | 29.24 |
| 103 | id_25 | Distributed Cluster | 18.59 | 103 | 1186083 | 29.99 |
**View `vw_ingredient_menu_item`**

```sql
CREATE VIEW vw_ingredient_menu_item AS
SELECT a.id, a.ingredient_id, a.name, a.type, b.id AS item_id, b.menu_id AS item_menu_id, b.name AS item_name
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | ingredient_id | name | type | item_id | item_menu_id | item_name |
|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | 100 | b_VB-IC-15 | Extended Review |
| 1001 | 5844284 | Pilot Initiative A | vegetable | 101 | 2839520 | Pilot Initiative A |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | fruit | 102 | id_3 | Baseline Model |
| 1003 | 2087735 | Distributed Cluster | dairy | 103 | id_25 | Distributed Cluster |
**View `vw_side_dish_menu_item`**

```sql
CREATE VIEW vw_side_dish_menu_item AS
SELECT a.id, a.side_id, a.name, a.price, b.id AS item_id, b.menu_id AS item_menu_id, b.name AS item_name
FROM side_dishes a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | side_id | name | price | item_id | item_menu_id | item_name |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | 100 | b_VB-IC-15 | Extended Review |
| 2 | 937737 | Pilot Initiative A | 35.45 | 101 | 2839520 | Pilot Initiative A |
| 3 | 6564389 | Baseline Model | 29.24 | 102 | id_3 | Baseline Model |
| 4 | 103178 | Distributed Cluster | 29.99 | 103 | id_25 | Distributed Cluster |
**View `vw_price_option_menu_item`**

```sql
CREATE VIEW vw_price_option_menu_item AS
SELECT a.id, a.option_id, a.price, a.type, b.id AS item_id, b.menu_id AS item_menu_id, b.name AS item_name
FROM price_options a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | option_id | price | type | item_id | item_menu_id | item_name |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | 12.87 | base | 100 | b_VB-IC-15 | Extended Review |
| 101 | 1204-0009-S | 35.45 | add-on | 101 | 2839520 | Pilot Initiative A |
| 102 | 9424920 | 29.24 | portion | 102 | id_3 | Baseline Model |
| 103 | 1186083 | 29.99 | substitution | 103 | id_25 | Distributed Cluster |
**View `vw_price_option_ingredient`**

```sql
CREATE VIEW vw_price_option_ingredient AS
SELECT a.id, a.option_id, a.price, a.type, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM price_options a JOIN ingredients b ON a.ingredient_id = b.id;
```

| id | option_id | price | type | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | 12.87 | base | 1000 | 1450638 | Extended Review |
| 101 | 1204-0009-S | 35.45 | add-on | 1001 | 5844284 | Pilot Initiative A |
| 102 | 9424920 | 29.24 | portion | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 103 | 1186083 | 29.99 | substitution | 1003 | 2087735 | Distributed Cluster |
**View `vw_bread_type_menu_item`**

```sql
CREATE VIEW vw_bread_type_menu_item AS
SELECT a.id, a.bread_id, a.name, a.is_house_made, b.id AS item_id, b.menu_id AS item_menu_id, b.name AS item_name
FROM bread_types a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | bread_id | name | is_house_made | item_id | item_menu_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 2125 | white | true | 100 | b_VB-IC-15 | Extended Review |
| 2 | 1210-0007-M | wheat | false | 101 | 2839520 | Pilot Initiative A |
| 3 | 1152671 | sourdough | true | 102 | id_3 | Baseline Model |
| 4 | 46cf6b73-02b4-4298-a314-f28840b25c46 | focaccia | false | 103 | id_25 | Distributed Cluster |

## Synthesis

The schema models a restaurant menu domain through a star-like structure centered on `menu_items`. The six base tables capture the canonical entities and their attributes, with foreign keys enforcing referential integrity and cardinality constraints. The junction table `items_ingredients` resolves the many-to-many relationship between menu items and ingredients, while the remaining one-to-many relationships are encoded as direct foreign key columns on the child tables. The eight views materialize the most common join paths, presenting flat, denormalized result sets that answer specific analytical questions without requiring ad-hoc joins. Together, the base tables and views provide a complete, queryable representation of the domain, balancing normalization for data integrity with denormalization for query convenience.