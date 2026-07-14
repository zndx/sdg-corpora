## Ontology-Grounded Schema Design for a Restaurant Menu Domain

A restaurant menu is not a flat list of dishes; it is a structured domain where each menu item may be a salad, a pizza, a side dish, or a generic offering, and each of those subtypes carries its own attributes and ingredient associations. The relational model captures this hierarchy through a core `menu_items` table that anchors every offering, with subtype tables (`salads`, `pizzas`, `side_dishes`) and junction tables (`items_ingredients`, `items_dishes`, `items_salads`, `salads_ingredients`, `pizzas_ingredients`) that materialize the many-to-many relationships between items, their subtypes, and the ingredients that compose them. This chapter walks through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and the views that reconstruct domain facts from the normalized structure.

**Table `menu_items`**

| id | item_id | name | category | price | description | is_gluten_free | is_baked | is_breaded | is_grilled | is_fried | is_pan_seared |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | Appetizer | 12.87 | Extended Survey | true | true | true | false | true | true |
| 2 | ITE-2795 | Pilot Initiative A | Salad | 35.45 | Pilot Corridor A | false | false | false | true | false | false |
| 3 | ITE-2798 | Baseline Model | Pizza | 29.24 | Baseline Series | true | true | true | false | true | true |
| 4 | ITE-2801 | Distributed Cluster | Specialty Dish | 29.99 | Distributed Assessment | false | false | false | true | false | false |

The `menu_items` table is the root entity of the schema. Every row represents a distinct offering on the menu, identified by a surrogate `id` (an integer such as `1`, `2`, `3`, `4`) and a business key `item_id` (a string like `ITE-2792`, `ITE-2795`, `ITE-2798`, `ITE-2801`). The `name` column carries the display name — `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster` — while `category` classifies the item into a broad group such as `Appetizer`, `Salad`, `Pizza`, or `Specialty Dish`. The `price` column stores a decimal value (e.g. `12.87`, `35.45`, `29.24`, `29.99`), and `description` provides a free-text summary. Six boolean flags — `is_gluten_free`, `is_baked`, `is_breaded`, `is_grilled`, `is_fried`, `is_pan_seared` — encode preparation attributes. For instance, the row with `id = 1` and `item_id = ITE-2792` is named `Extended Review`, belongs to the `Appetizer` category, costs `12.87`, and carries the flags `is_gluten_free = true`, `is_baked = true`, `is_breaded = true`, `is_fried = true`, `is_pan_seared = true`, while `is_grilled = false`. This denormalized flag pattern is a deliberate design choice: it allows fast filtering on preparation style without requiring a separate lookup table, at the cost of redundancy.

**Table `ingredients`**

| id | ingredient_id | name | type | origin | state | is_locally_grown | is_wild_caught | menu_item_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | Meat | distributed-origin-66 | Raw | true | true | 1 |
| 1001 | 5844284 | Pilot Initiative A | Cheese | baseline-origin-67 | Breaded | false | false | 2 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | Vegetable | pilot-origin-68 | Fried | true | true | 3 |
| 1003 | 2087735 | Distributed Cluster | Seafood | extended-origin-69 | Grilled | false | false | 4 |

The `ingredients` table stores the building blocks of every dish. Each ingredient has a surrogate `id` (e.g. `1000`, `1001`, `1002`, `1003`), a business `ingredient_id` (such as `1450638`, `5844284`, `template_ivacode_pagata_20det40ind`, `2087735`), a `name` that may coincide with the menu item name in this dataset (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), a `type` (`Meat`, `Cheese`, `Vegetable`, `Seafood`), an `origin` string (`distributed-origin-66`, `baseline-origin-67`, `pilot-origin-68`, `extended-origin-69`), a `state` (`Raw`, `Breaded`, `Fried`, `Grilled`), and two boolean flags — `is_locally_grown` and `is_wild_caught`. The column `menu_item_id` is a foreign key referencing `menu_items.id`, establishing a one-to-many relationship: each ingredient row is owned by exactly one menu item. In the data, ingredient `id = 1000` with `type = Meat` and `origin = distributed-origin-66` is linked to `menu_item_id = 1` (`Extended Review`), while ingredient `id = 1003` with `type = Seafood` and `state = Grilled` is linked to `menu_item_id = 4` (`Distributed Cluster`). The presence of `is_locally_grown = true` alongside `is_wild_caught = true` for ingredient `1000` suggests that the domain allows an ingredient to be both locally sourced and wild-caught simultaneously — a valid overlap for seafood products.

**Table `side_dishes`**

| side_id | name | type | is_included | menu_item_id |
|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | Pasta | true | 1 |
| 937737 | Pilot Initiative A | Potato | false | 2 |
| 6564389 | Baseline Model | Vegetable | true | 3 |
| 103178 | Distributed Cluster | Pasta | false | 4 |

Side dishes are a subtype of menu items, stored in the `side_dishes` table. Each row has a `side_id` (a string identifier such as `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, `937737`, `6564389`, `103178`), a `name` (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), a `type` (`Pasta`, `Potato`, `Vegetable`), a boolean `is_included` flag, and a `menu_item_id` foreign key. The `is_included` flag indicates whether the side dish comes bundled with the parent menu item at no extra charge. For example, the side dish with `side_id = ChIJD7fiBh9u5kcRYJSMaMOCCwQ` is of `type = Pasta`, has `is_included = true`, and is associated with `menu_item_id = 1`. Conversely, the side dish with `side_id = 937737` is of `type = Potato`, has `is_included = false`, and is associated with `menu_item_id = 2`. The `menu_item_id` column creates a one-to-one or one-to-many link from `menu_items` to `side_dishes`, depending on whether a menu item can have multiple sides.

**Table `salads`**

| id | salad_id | name | base_greens | dressing | is_chef_special | menu_item_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 3012833 | Extended Review | pilot-base-98 | integrated-dressing-46 | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 5844254 | Pilot Initiative A | extended-base-99 | seasonal-dressing-47 | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4277036 | Baseline Model | integrated-base-100 | regional-dressing-48 | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | id_3 | Distributed Cluster | seasonal-base-101 | legacy-dressing-49 | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `salads` table models the salad subtype. Each row carries a surrogate `id` (`100`, `101`, `102`, `103`), a business `salad_id` (`3012833`, `5844254`, `4277036`, `id_3`), a `name`, a `base_greens` identifier (`pilot-base-98`, `extended-base-99`, `integrated-base-100`, `seasonal-base-101`), a `dressing` identifier (`integrated-dressing-46`, `seasonal-dressing-47`, `regional-dressing-48`, `legacy-dressing-49`), a boolean `is_chef_special`, a `menu_item_id` foreign key, and two timestamp columns — `created_at` and `updated_at`. The salad with `id = 100` and `salad_id = 3012833` is named `Extended Review`, uses `pilot-base-98` as its base greens, `integrated-dressing-46` as its dressing, is marked `is_chef_special = true`, and is linked to `menu_item_id = 1`. Its `created_at` timestamp is `2025-01-01 00:14:00` and `updated_at` is `2025-01-02 00:41:00`. The `menu_item_id` column again anchors the salad to its parent menu item.

**Table `pizzas`**

| pizza_id | name | sauce_type | crust_type | is_specialty |
|---|---|---|---|---|
| 1996915 | Extended Review | House Red Sauce | Medium Crust | true |
| 505983 | Pilot Initiative A | Oil and Garlic Sauce | Fresh Pasta Sheets | false |
| id_18 | Baseline Model | Alfredo Sauce | Medium Crust | true |
| 2618556 | Distributed Cluster | Diablo Sauce | Fresh Pasta Sheets | false |

The `pizzas` table stores the pizza subtype. It has a `pizza_id` (`1996915`, `505983`, `id_18`, `2618556`), a `name`, a `sauce_type` (`House Red Sauce`, `Oil and Garlic Sauce`, `Alfredo Sauce`, `Diablo Sauce`), a `crust_type` (`Medium Crust`, `Fresh Pasta Sheets`), and a boolean `is_specialty`. The pizza with `pizza_id = 1996915` is named `Extended Review`, uses `House Red Sauce`, has a `Medium Crust`, and is marked `is_specialty = true`. The pizza with `pizza_id = id_18` uses `Alfredo Sauce` and also carries `is_specialty = true`, while `pizza_id = 505983` uses `Oil and Garlic Sauce` with `Fresh Pasta Sheets` and `is_specialty = false`. Unlike `salads` and `side_dishes`, the `pizzas` table does not contain a `menu_item_id` column; the association between pizzas and menu items is mediated through the `pizzas_ingredients` junction table and the `items_ingredients` table, which we will discuss shortly.

**Table `toppings`**

| id | topping_id | name | tier | price_adjustment | pizza_id |
|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Standard | 13.94 | 1996915 |
| 2 | 6969414 | Pilot Initiative A | Premium | 151.27 | 505983 |
| 3 | 10449532 | Baseline Model | Standard | 17.41 | id_18 |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Premium | 0.18 | 2618556 |

Toppings are a subtype of pizzas, stored in the `toppings` table. Each row has a surrogate `id` (`1`, `2`, `3`, `4`), a business `topping_id` (`Recount`, `6969414`, `10449532`, `6937ce06-8fcc-11eb-924d-9cd76263cbd0`), a `name`, a `tier` (`Standard`, `Premium`), a `price_adjustment` (a decimal such as `13.94`, `151.27`, `17.41`, `0.18`), and a `pizza_id` foreign key. The topping with `id = 1` and `topping_id = Recount` is named `Extended Review`, belongs to the `Standard` tier, has a `price_adjustment` of `13.94`, and is linked to `pizza_id = 1996915`. The topping with `id = 2` and `topping_id = 6969414` is named `Pilot Initiative A`, belongs to the `Premium` tier, has a `price_adjustment` of `151.27`, and is linked to `pizza_id = 505983`. The `pizza_id` column creates a one-to-many relationship: each pizza can have multiple toppings, each with its own tier and price impact.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `items_ingredients` table is a junction table that resolves the many-to-many relationship between `menu_items` and `ingredients`. While the `ingredients` table already has a `menu_item_id` column that directly links ingredients to menu items, the `items_ingredients` junction table provides an additional association layer — likely supporting scenarios where an ingredient can be associated with multiple menu items independently of the direct foreign key, or where the junction table carries additional metadata (such as quantity or preparation notes) not visible in the current schema. The presence of both the direct `menu_item_id` FK in `ingredients` and the `items_ingredients` junction table suggests a flexible design where the direct FK handles the primary ownership relationship, while the junction table supports cross-references or composite associations.

**Table `items_dishes`**

| menu_item_id | side_dish_side_id |
|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ |
| 1 | 937737 |
| 2 | 937737 |
| 2 | 6564389 |
| 3 | 6564389 |
| 3 | 103178 |
| 4 | 103178 |
| 4 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ |

The `items_dishes` table is a junction table linking `menu_items` to `side_dishes`. It resolves the relationship between a menu item and its associated side dish(es). The `side_dishes` table already has a `menu_item_id` column, so this junction table may serve to support multiple sides per menu item or to carry additional association metadata. The naming convention `items_dishes` (rather than `items_side_dishes`) suggests a generalized pattern that could be extended to other dish subtypes in the future.

**Table `items_salads`**

| menu_item_id | salad_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `items_salads` table is a junction table linking `menu_items` to `salads`. Similar to `items_dishes`, it provides an association layer between the root menu item and its salad subtype. The `salads` table has a `menu_item_id` column, so this junction table may support multiple salad references per menu item or carry additional metadata about the association.

**Table `salads_ingredients`**

| salad_id | ingredient_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `salads_ingredients` table is a junction table linking `salads` to `ingredients`. This is a critical relationship: a salad is composed of one or more ingredients, and an ingredient can appear in multiple salads. The `salads_ingredients` table resolves this many-to-many relationship. The `ingredients` table has a `menu_item_id` column, but that links ingredients to the parent menu item, not to the specific salad. The `salads_ingredients` junction table provides the precise salad-to-ingredient mapping.

**Table `pizzas_ingredients`**

| pizza_id | ingredient_id |
|---|---|
| 1996915 | 1000 |
| 1996915 | 1001 |
| 505983 | 1001 |
| 505983 | 1002 |
| id_18 | 1002 |
| id_18 | 1003 |
| 2618556 | 1003 |
| 2618556 | 1000 |

The `pizzas_ingredients` table is a junction table linking `pizzas` to `ingredients`. Like `salads_ingredients`, it resolves a many-to-many relationship: a pizza is composed of one or more ingredients, and an ingredient can appear in multiple pizzas. This table is essential because the `pizzas` table does not have a direct `menu_item_id` column — the association between pizzas and menu items flows through the ingredients and the `items_ingredients` junction table.

**View `menu_item_ingredient_detail_view`**

```sql
CREATE VIEW menu_item_ingredient_detail_view AS
SELECT a.id, a.item_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | item_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 1000 | 1450638 | Extended Review |
| 1 | ITE-2792 | Extended Review | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1000 | 1450638 | Extended Review |

The `menu_item_ingredient_detail_view` reconstructs the full ingredient detail for each menu item by joining `menu_items` with `ingredients` on `menu_items.id = ingredients.menu_item_id`. This view answers the question: "What ingredients belong to each menu item, and what are their properties?" Reading the first row of the view, we see `menu_item_id = 1` (`Extended Review`, `Appetizer`, `$12.87`) paired with `ingredient_id = 1450638` (`Extended Review`, `Meat`, `distributed-origin-66`, `Raw`, `is_locally_grown = true`, `is_wild_caught = true`). The second row shows `menu_item_id = 2` (`Pilot Initiative A`, `Salad`, `$35.45`) paired with `ingredient_id = 5844284` (`Pilot Initiative A`, `Cheese`, `baseline-origin-67`, `Breaded`, `is_locally_grown = false`, `is_wild_caught = false`). This view is the primary query surface for ingredient-level menu exploration.

**View `menu_item_side_dish_detail_view`**

```sql
CREATE VIEW menu_item_side_dish_detail_view AS
SELECT a.id, a.item_id, a.name, b.side_id AS dish_side_id, b.name AS dish_name, b.type AS dish_type
FROM menu_items a
  JOIN items_dishes j ON j.menu_item_id = a.id
  JOIN side_dishes b ON b.side_id = j.side_dish_side_id;
```

| id | item_id | name | dish_side_id | dish_name | dish_type |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | Pasta |
| 1 | ITE-2792 | Extended Review | 937737 | Pilot Initiative A | Potato |
| 2 | ITE-2795 | Pilot Initiative A | 937737 | Pilot Initiative A | Potato |
| 2 | ITE-2795 | Pilot Initiative A | 6564389 | Baseline Model | Vegetable |
| 3 | ITE-2798 | Baseline Model | 6564389 | Baseline Model | Vegetable |
| 3 | ITE-2798 | Baseline Model | 103178 | Distributed Cluster | Pasta |
| 4 | ITE-2801 | Distributed Cluster | 103178 | Distributed Cluster | Pasta |
| 4 | ITE-2801 | Distributed Cluster | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | Pasta |

The `menu_item_side_dish_detail_view` joins `menu_items` with `side_dishes` on `menu_items.id = side_dishes.menu_item_id`, answering: "What side dish accompanies each menu item, and is it included in the price?" The first row pairs `menu_item_id = 1` (`Extended Review`, `Appetizer`) with `side_id = ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Extended Review`, `Pasta`, `is_included = true`). The second row pairs `menu_item_id = 2` (`Pilot Initiative A`, `Salad`) with `side_id = 937737` (`Pilot Initiative A`, `Potato`, `is_included = false`). The `is_included` flag is the key differentiator: a `true` value means the side is bundled, while `false` means it is an add-on.

**View `menu_item_salad_detail_view`**

```sql
CREATE VIEW menu_item_salad_detail_view AS
SELECT a.id, a.item_id, a.name, b.id AS salad_id, b.salad_id AS salad_salad_id, b.name AS salad_name
FROM menu_items a
  JOIN items_salads j ON j.menu_item_id = a.id
  JOIN salads b ON b.id = j.salad_id;
```

| id | item_id | name | salad_id | salad_salad_id | salad_name |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 100 | 3012833 | Extended Review |
| 1 | ITE-2792 | Extended Review | 101 | 5844254 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 101 | 5844254 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 102 | 4277036 | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 102 | 4277036 | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 103 | id_3 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 103 | id_3 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 100 | 3012833 | Extended Review |

The `menu_item_salad_detail_view` joins `menu_items` with `salads` on `menu_items.id = salads.menu_item_id`, answering: "What are the salad details for each menu item that is a salad?" The first row shows `menu_item_id = 1` (`Extended Review`, `Appetizer`) paired with `salad_id = 3012833` (`Extended Review`, `pilot-base-98`, `integrated-dressing-46`, `is_chef_special = true`, `created_at = 2025-01-01`). The third row shows `menu_item_id = 3` (`Baseline Model`, `Pizza`) paired with `salad_id = 4277036` (`Baseline Model`, `integrated-base-100`, `regional-dressing-48`, `is_chef_special = true`, `created_at = 2025-03-11`). The presence of a salad record for a menu item categorized as `Pizza` (row 3) suggests that the category column may not strictly enforce subtype boundaries, or that a menu item can have both a pizza and a salad representation.

**View `ingredient_menu_item_view`**

```sql
CREATE VIEW ingredient_menu_item_view AS
SELECT a.id, a.ingredient_id, a.name, a.type, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | ingredient_id | name | type | item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | Meat | 1 | ITE-2792 | Extended Review |
| 1001 | 5844284 | Pilot Initiative A | Cheese | 2 | ITE-2795 | Pilot Initiative A |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | Vegetable | 3 | ITE-2798 | Baseline Model |
| 1003 | 2087735 | Distributed Cluster | Seafood | 4 | ITE-2801 | Distributed Cluster |

The `ingredient_menu_item_view` inverts the relationship, joining `ingredients` with `menu_items` to answer: "Which menu items use this ingredient?" This is the reverse of `menu_item_ingredient_detail_view` and is useful for ingredient-centric queries, such as "Which menu items contain this cheese?" The first row pairs `ingredient_id = 1450638` (`Extended Review`, `Meat`) with `menu_item_id = 1` (`Extended Review`, `Appetizer`, `$12.87`). The fourth row pairs `ingredient_id = 2087735` (`Distributed Cluster`, `Seafood`, `Grilled`) with `menu_item_id = 4` (`Distributed Cluster`, `Specialty Dish`, `$29.99`).

**View `side_dish_menu_item_view`**

```sql
CREATE VIEW side_dish_menu_item_view AS
SELECT a.side_id, a.name, a.type, a.is_included, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM side_dishes a JOIN menu_items b ON a.menu_item_id = b.id;
```

| side_id | name | type | is_included | item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | Pasta | true | 1 | ITE-2792 | Extended Review |
| 937737 | Pilot Initiative A | Potato | false | 2 | ITE-2795 | Pilot Initiative A |
| 6564389 | Baseline Model | Vegetable | true | 3 | ITE-2798 | Baseline Model |
| 103178 | Distributed Cluster | Pasta | false | 4 | ITE-2801 | Distributed Cluster |

The `side_dish_menu_item_view` joins `side_dishes` with `menu_items` to answer: "Which menu item is this side dish associated with?" This is the reverse of `menu_item_side_dish_detail_view`. The first row pairs `side_id = ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (`Extended Review`, `Pasta`, `is_included = true`) with `menu_item_id = 1` (`Extended Review`, `Appetizer`). The second row pairs `side_id = 937737` (`Pilot Initiative A`, `Potato`, `is_included = false`) with `menu_item_id = 2` (`Pilot Initiative A`, `Salad`).

**View `salad_ingredient_detail_view`**

```sql
CREATE VIEW salad_ingredient_detail_view AS
SELECT a.id, a.salad_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM salads a
  JOIN salads_ingredients j ON j.salad_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | salad_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 100 | 3012833 | Extended Review | 1000 | 1450638 | Extended Review |
| 100 | 3012833 | Extended Review | 1001 | 5844284 | Pilot Initiative A |
| 101 | 5844254 | Pilot Initiative A | 1001 | 5844284 | Pilot Initiative A |
| 101 | 5844254 | Pilot Initiative A | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 102 | 4277036 | Baseline Model | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 102 | 4277036 | Baseline Model | 1003 | 2087735 | Distributed Cluster |
| 103 | id_3 | Distributed Cluster | 1003 | 2087735 | Distributed Cluster |
| 103 | id_3 | Distributed Cluster | 1000 | 1450638 | Extended Review |

The `salad_ingredient_detail_view` joins `salads` with `salads_ingredients` and `ingredients` to answer: "What ingredients compose each salad?" This view is essential for salad-level ingredient tracing. It reconstructs the salad-to-ingredient relationship that is stored in the `salads_ingredients` junction table, bringing in the full ingredient profile from the `ingredients` table. The join path is `salads → salads_ingredients → ingredients`, and the result provides a complete picture of each salad's composition.

**View `salad_menu_item_view`**

```sql
CREATE VIEW salad_menu_item_view AS
SELECT a.id, a.salad_id, a.name, a.base_greens, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM salads a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | salad_id | name | base_greens | item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 100 | 3012833 | Extended Review | pilot-base-98 | 1 | ITE-2792 | Extended Review |
| 101 | 5844254 | Pilot Initiative A | extended-base-99 | 2 | ITE-2795 | Pilot Initiative A |
| 102 | 4277036 | Baseline Model | integrated-base-100 | 3 | ITE-2798 | Baseline Model |
| 103 | id_3 | Distributed Cluster | seasonal-base-101 | 4 | ITE-2801 | Distributed Cluster |

The `salad_menu_item_view` joins `salads` with `menu_items` to answer: "Which menu item does this salad belong to?" This is the reverse of `menu_item_salad_detail_view`. The first row pairs `salad_id = 3012833` (`Extended Review`, `pilot-base-98`, `integrated-dressing-46`, `is_chef_special = true`) with `menu_item_id = 1` (`Extended Review`, `Appetizer`, `$12.87`). The third row pairs `salad_id = 4277036` (`Baseline Model`, `integrated-base-100`, `regional-dressing-48`, `is_chef_special = true`) with `menu_item_id = 3` (`Baseline Model`, `Pizza`, `$29.24`).

**View `pizza_ingredient_detail_view`**

```sql
CREATE VIEW pizza_ingredient_detail_view AS
SELECT a.pizza_id, a.name, a.sauce_type, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM pizzas a
  JOIN pizzas_ingredients j ON j.pizza_id = a.pizza_id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| pizza_id | name | sauce_type | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1996915 | Extended Review | House Red Sauce | 1000 | 1450638 | Extended Review |
| 1996915 | Extended Review | House Red Sauce | 1001 | 5844284 | Pilot Initiative A |
| 505983 | Pilot Initiative A | Oil and Garlic Sauce | 1001 | 5844284 | Pilot Initiative A |
| 505983 | Pilot Initiative A | Oil and Garlic Sauce | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| id_18 | Baseline Model | Alfredo Sauce | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| id_18 | Baseline Model | Alfredo Sauce | 1003 | 2087735 | Distributed Cluster |
| 2618556 | Distributed Cluster | Diablo Sauce | 1003 | 2087735 | Distributed Cluster |
| 2618556 | Distributed Cluster | Diablo Sauce | 1000 | 1450638 | Extended Review |

The `pizza_ingredient_detail_view` joins `pizzas` with `pizzas_ingredients` and `ingredients` to answer: "What ingredients compose each pizza?" This view reconstructs the pizza-to-ingredient relationship via the `pizzas_ingredients` junction table. The join path is `pizzas → pizzas_ingredients → ingredients`, and the result provides a complete picture of each pizza's ingredient composition. This view is the pizza equivalent of `salad_ingredient_detail_view`.

**View `topping_pizza_view`**

```sql
CREATE VIEW topping_pizza_view AS
SELECT a.id, a.topping_id, a.name, a.tier, b.pizza_id AS pizza_pizza_id, b.name AS pizza_name, b.sauce_type AS pizza_sauce_type
FROM toppings a JOIN pizzas b ON a.pizza_id = b.pizza_id;
```

| id | topping_id | name | tier | pizza_pizza_id | pizza_name | pizza_sauce_type |
|---|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Standard | 1996915 | Extended Review | House Red Sauce |
| 2 | 6969414 | Pilot Initiative A | Premium | 505983 | Pilot Initiative A | Oil and Garlic Sauce |
| 3 | 10449532 | Baseline Model | Standard | id_18 | Baseline Model | Alfredo Sauce |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Premium | 2618556 | Distributed Cluster | Diablo Sauce |

The `topping_pizza_view` joins `toppings` with `pizzas` on `toppings.pizza_id = pizzas.pizza_id` to answer: "What toppings are on each pizza, and what is their tier and price impact?" The first row pairs `topping_id = Recount` (`Extended Review`, `Standard`, `price_adjustment = 13.94`) with `pizza_id = 1996915` (`Extended Review`, `House Red Sauce`, `Medium Crust`, `is_specialty = true`). The second row pairs `topping_id = 6969414` (`Pilot Initiative A`, `Premium`, `price_adjustment = 151.27`) with `pizza_id = 505983` (`Pilot Initiative A`, `Oil and Garlic Sauce`, `Fresh Pasta Sheets`, `is_specialty = false`). The `price_adjustment` column is particularly important: a `Premium` tier topping like `6969414` adds `151.27` to the base pizza price, while a `Standard` tier topping like `Recount` adds only `13.94`. This view enables dynamic price calculation by summing the base pizza price with all applicable topping adjustments.

## Synthesis

The schema models a restaurant menu as a rooted entity (`menu_items`) with subtype specializations (`salads`, `pizzas`, `side_dishes`) and a rich ingredient graph. The direct foreign keys in `ingredients`, `side_dishes`, and `salads` (all referencing `menu_items.id`) establish immediate ownership, while the junction tables (`items_ingredients`, `items_dishes`, `items_salads`, `salads_ingredients`, `pizzas_ingredients`) provide the flexible many-to-many associations that allow ingredients to be shared across items and subtypes. The views materialize the most common query patterns — item-to-ingredient, item-to-side, item-to-salad, ingredient-to-item, side-to-item, salad-to-ingredient, salad-to-item, pizza-to-ingredient, and topping-to-pizza — each answering a specific domain question by joining the appropriate normalized tables. The design balances normalization (avoiding duplication of ingredient data) with query performance (providing pre-joined views for the most frequent access patterns), and the boolean flags on `menu_items` and `ingredients` encode preparation and sourcing attributes directly in the row, enabling fast filtering without additional lookups.