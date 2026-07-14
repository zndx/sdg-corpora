## Core Menu Entities

A restaurant menu is not a flat list but a structured composition of dishes, their constituent ingredients, optional sides, pricing tiers, and bread selections. The domain records these relationships across six base tables, each capturing a distinct dimension of the offering. The central table, `menu_items`, enumerates every dish available to the customer. Each row carries a unique identifier, a business-level `menu_id` such as `b_VB-IC-15` or `2839520`, a human-readable `name`, a `base_price`, a `category` (e.g., scrambles, rooster slinger, fried egg sandwich, b.e.l.t.), dietary flags (`is_vegetarian`, `is_vegan`, `is_gluten_free`), and a `serving_time` indicating when the item is available.

**Table `menu_items`**

| id | menu_id | name | base_price | category | is_vegetarian | is_vegan | is_gluten_free | serving_time | side_dish_id | price_option_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-IC-15 | Extended Review | 12.72 | scrambles | true | false | true | breakfast | 1 | 100 |
| 101 | 2839520 | Pilot Initiative A | 12.87 | rooster slinger | false | true | false | brunch | 2 | 101 |
| 102 | id_3 | Baseline Model | 17.41 | fried egg sandwich | true | false | true | lunch | 3 | 102 |
| 103 | id_25 | Distributed Cluster | 18.59 | b.e.l.t. | false | true | false | dinner | 4 | 103 |

The `menu_items` table also holds foreign keys `side_dish_id` and `price_option_id`, which point into the `side_dishes` and `price_options` tables respectively. These links are the backbone of the menu's configurability: a single dish can carry a default side and a default price tier, while additional relationships are captured in the junction and detail tables described below.

**Table `ingredients`**

| id | ingredient_id | name | type | is_house_made | origin | menu_item_id |
|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | true | distributed-origin-66 | 100 |
| 1001 | 5844284 | Pilot Initiative A | vegetable | false | baseline-origin-67 | 101 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | fruit | true | pilot-origin-68 | 102 |
| 1003 | 2087735 | Distributed Cluster | dairy | false | extended-origin-69 | 103 |

The `ingredients` table stores the raw components that compose each dish. Every ingredient row includes an `ingredient_id`, a `name`, a `type` (protein, vegetable, fruit, dairy), a boolean `is_house_made`, an `origin` string such as `distributed-origin-66` or `baseline-origin-67`, and a `menu_item_id` that ties the ingredient back to the dish it belongs to. In the sample data, ingredient `1450638` named "Extended Review" is a house-made protein sourced from `distributed-origin-66` and is associated with menu item `100`.

**Table `side_dishes`**

| id | side_id | name | price | portion_type | menu_item_id |
|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | cup | 100 |
| 2 | 937737 | Pilot Initiative A | 35.45 | bowl | 101 |
| 3 | 6564389 | Baseline Model | 29.24 | side | 102 |
| 4 | 103178 | Distributed Cluster | 29.99 | cup | 103 |

Side dishes form their own catalog, each with a `side_id`, a `name`, a `price`, a `portion_type` (cup, bowl, side), and a `menu_item_id` linking the side to the dish it accompanies. The side named "Extended Review" with `side_id` `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` is served in a cup and priced at `12.87` for menu item `100`.

**Table `price_options`**

| id | option_id | price | type | description | menu_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | 12.87 | base | Extended Survey | 100 | 1000 |
| 101 | 1204-0009-S | 35.45 | add-on | Pilot Corridor A | 101 | 1001 |
| 102 | 9424920 | 29.24 | portion | Baseline Series | 102 | 1002 |
| 103 | 1186083 | 29.99 | substitution | Distributed Assessment | 103 | 1003 |

Price options capture the various ways a dish can be priced or modified. Each row has an `option_id`, a `price`, a `type` (base, add-on, portion, substitution), a `description`, and foreign keys `menu_item_id` and `ingredient_id` that associate the pricing tier with both a dish and a specific ingredient. The base price option for menu item `100` carries `option_id` `a4e3c328-8fb9-11eb-924d-9cd76263cbd0`, is priced at `12.87`, and references ingredient `1000`.

**Table `bread_types`**

| id | bread_id | name | is_house_made | menu_item_id |
|---|---|---|---|---|
| 1 | 2125 | white | true | 100 |
| 2 | 1210-0007-M | wheat | false | 101 |
| 3 | 1152671 | sourdough | true | 102 |
| 4 | 46cf6b73-02b4-4298-a314-f28840b25c46 | focaccia | false | 103 |

Bread types are a specialized dimension for sandwich-style items. Each row records a `bread_id`, a `name` (white, wheat, sourdough, focaccia), an `is_house_made` flag, and a `menu_item_id`. Menu item `100` is paired with `bread_id` `2125`, a house-made white bread.

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

The `items_ingredients` junction table resolves the many-to-many relationship between menu items and ingredients. A single dish may contain multiple ingredients, and a single ingredient may appear across multiple dishes. In the sample data, menu item `100` is composed of ingredients `1000` and `1001`, while menu item `103` combines ingredients `1003` and `1000`. This table is the primary mechanism for querying which ingredients belong to which dishes without relying on the `menu_item_id` column in the `ingredients` table alone.

## Ingredient Composition

The view `vw_menu_item_ingredient_detail` answers the question: what ingredients make up each menu item, and what are their properties? By joining `menu_items` with `items_ingredients` and `ingredients`, the view produces one row per ingredient-dish pair, surfacing the dish name, the ingredient name, its type, whether it is house-made, and its origin.

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

Consider the first row of this view: menu item `100` (Extended Review) is composed of ingredient `1450638` (Extended Review), which is a protein and is house-made, originating from `distributed-origin-66`. The second row shows that the same menu item also includes ingredient `5844284` (Pilot Initiative A), a non-house-made vegetable from `baseline-origin-67`. This dual-row structure for item `100` confirms that the junction table correctly captures multi-ingredient compositions. Menu item `101` (Pilot Initiative A) similarly spans two ingredients — `5844284` and `template_ivacode_pagata_20det40ind` — while menu item `103` (Distributed Cluster) combines `2087735` and `1450638`, demonstrating that ingredients are shared across dishes.

## Side Dish Assignments

The view `vw_menu_item_side_dish` resolves the relationship between a menu item and its assigned side dish. It joins `menu_items` with `side_dishes` on the matching `menu_item_id`, producing a single row per dish-side pairing.

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

The view confirms that menu item `100` (Extended Review) is paired with side dish `1` (Extended Review), served in a cup at a price of `12.87`. Menu item `101` (Pilot Initiative A) carries side dish `2` (Pilot Initiative A) in a bowl portion at `35.45`. Menu item `102` (Baseline Model) is linked to side dish `3` (Baseline Model) with a portion type of `side` priced at `29.24`. The view makes it straightforward to answer operational questions such as "what side accompanies each dish" or "which sides are served in bowls versus cups."

## Price Option Structures

The view `vw_menu_item_price_option` joins `menu_items` with `price_options` to reveal the pricing configuration for each dish. Each row presents the menu item name, its base price, the price option type, the option's own price, and its description.

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

For menu item `100` (Extended Review), the base price is `12.72`, and the associated price option is of type `base` with a price of `12.87` and description "Extended Survey." Menu item `101` (Pilot Initiative A) has a base price of `12.87` but its price option is of type `add-on`, priced at `35.45` with description "Pilot Corridor A." This distinction between `base` and `add-on` types is operationally significant: a `base` option likely represents the standard pricing tier, while an `add-on` suggests an additional charge or premium variant. Menu item `102` carries a `portion` type option at `29.24`, and menu item `103` carries a `substitution` type option at `29.99`, indicating that the pricing model supports not just standard and premium tiers but also portion-based and substitution-based price adjustments.

## Ingredient-to-Menu Relationships

The view `vw_ingredient_menu_item` inverts the perspective of `vw_menu_item_ingredient_detail`: it starts from the ingredient and shows which menu items use it. This is the natural query for inventory planning, allergen tracking, and sourcing analysis.

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

Ingredient `1450638` (Extended Review, a protein) appears in menu item `100` (Extended Review). Ingredient `5844284` (Pilot Initiative A, a vegetable) appears in menu item `101` (Pilot Initiative A). Ingredient `template_ivacode_pagata_20det40ind` (Baseline Model, a fruit) is used in menu item `102` (Baseline Model). Ingredient `2087735` (Distributed Cluster, dairy) is used in menu item `103` (Distributed Cluster). The view also reveals cross-dish usage: ingredient `1450638` appears in both menu item `100` and menu item `103`, confirming that the protein labeled "Extended Review" is a shared component. This cross-referencing is essential for understanding ingredient utilization across the full menu.

## Side Dish to Menu Mapping

The view `vw_side_dish_menu_item` provides the reverse mapping of `vw_menu_item_side_dish`: it starts from the side dish and shows which menu item it is assigned to. This is useful for side-dish inventory management and for verifying that every side has a valid parent dish.

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

Side dish `1` (Extended Review, cup portion, priced at `12.87`) is assigned to menu item `100` (Extended Review). Side dish `2` (Pilot Initiative A, bowl portion, priced at `35.45`) is assigned to menu item `101` (Pilot Initiative A). Side dish `3` (Baseline Model, side portion, priced at `29.24`) is assigned to menu item `102` (Baseline Model). Side dish `4` (Distributed Cluster, cup portion, priced at `29.99`) is assigned to menu item `103` (Distributed Cluster). The view confirms a one-to-one mapping in the sample data, though the underlying schema supports the possibility of a side being referenced by multiple dishes if the foreign key were structured accordingly.

## Price Option to Menu Mapping

The view `vw_price_option_menu_item` joins `price_options` with `menu_items` to present each price option alongside its parent dish. This view is the operational reference for pricing audits and for understanding how price tiers relate to specific menu items.

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

Price option `100` (type `base`, price `12.87`, description "Extended Survey") is associated with menu item `100` (Extended Review, base price `12.72`). Price option `101` (type `add-on`, price `35.45`, description "Pilot Corridor A") is associated with menu item `101` (Pilot Initiative A, base price `12.87`). Price option `102` (type `portion`, price `29.24`, description "Baseline Series") is associated with menu item `102` (Baseline Model, base price `17.41`). Price option `103` (type `substitution`, price `29.99`, description "Distributed Assessment") is associated with menu item `103` (Distributed Cluster, base price `18.59`). The view makes it clear that the price option price does not always match the menu item's base price — for instance, menu item `101` has a base price of `12.87` but its add-on option is priced at `35.45`, suggesting the add-on represents a premium configuration or an upsell tier.

## Price Option to Ingredient Mapping

The view `vw_price_option_ingredient` joins `price_options` with `ingredients` to reveal which ingredient each price option is tied to. This is the critical link for understanding how ingredient-level decisions drive pricing — for example, a substitution option may reflect the cost difference between two ingredients.

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

Price option `100` (type `base`, price `12.87`) is linked to ingredient `1000` (Extended Review, a protein). Price option `101` (type `add-on`, price `35.45`) is linked to ingredient `1001` (Pilot Initiative A, a vegetable). Price option `102` (type `portion`, price `29.24`) is linked to ingredient `1002` (Baseline Model, a fruit). Price option `103` (type `substitution`, price `29.99`) is linked to ingredient `1003` (Distributed Cluster, dairy). The view confirms that every price option references exactly one ingredient, establishing a direct line from ingredient selection to price tier. This is particularly relevant for the `substitution` type: if a customer substitutes one ingredient for another, the system can look up the substitution option's price and apply the appropriate adjustment.

## Bread Type Assignments

The view `vw_bread_type_menu_item` joins `bread_types` with `menu_items` to show which bread is paired with each dish. This is a focused view for sandwich and bread-based items, where the bread selection is a defining characteristic of the dish.

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

Menu item `100` (Extended Review) is served with `bread_id` `2125`, a house-made white bread. Menu item `101` (Pilot Initiative A) uses `bread_id` `1210-0007-M`, a non-house-made wheat bread. Menu item `102` (Baseline Model) uses `bread_id` `1152671`, a house-made sourdough. Menu item `103` (Distributed Cluster) uses `bread_id` `46cf6b73-02b4-4298-a314-f28840b25c46`, a non-house-made focaccia. The `is_house_made` flag provides a quick operational signal: items `100` and `102` feature house-made breads, while items `101` and `103` use externally sourced breads. This distinction may affect preparation workflows, allergen labeling, and sourcing logistics.

## Closing Synthesis

The menu domain is built on a small set of well-defined tables and a complementary set of views that answer the most common operational questions. The base tables capture the raw entities — dishes, ingredients, sides, price tiers, and breads — while the junction table `items_ingredients` resolves the many-to-many relationship between dishes and their components. The views then reassemble these pieces into readable perspectives: ingredient detail per dish, side dish assignments, price option structures, and the reverse mappings from ingredients, sides, and price options back to their parent dishes. Together, they form a complete record of what is offered, how it is composed, how it is priced, and how it is served.