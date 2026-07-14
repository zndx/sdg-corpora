## The Restaurant Menu Data Model

A restaurant menu is more than a list of dishes; it is a structured catalog of offerings, each defined by its price, availability, preparation method, and the ingredients that compose it. The data model described here captures the full lifecycle of a menu item—from its base definition through its size variants, toppings, add-ons, and the ingredient composition that determines dietary attributes. Every record in this system carries a unique identifier, a human-readable name, and a set of boolean flags that answer practical questions: Is this item available for ordering? Is it gluten-free? Does it contain allergens? The following sections walk through each table and view, showing how the pieces fit together to support menu management, dietary filtering, and pricing calculations.

**Table `menu_items`**

| id | menu_item_id | name | price | category | is_gluten_free | is_available_for_order | cooking_method | food_ingredient_id | menu_item_size_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | MEN-2563 | Extended Review | 12.87 | APPETIZERS | true | true | Flash Fried | 1 | 1000 |
| 1001 | MEN-2569 | Pilot Initiative A | 35.45 | STARTERS | false | false | cooked to order | 2 | 1001 |
| 1002 | MEN-2575 | Baseline Model | 29.24 | SOUP & SALAD | true | true | served raw | 3 | 1002 |
| 1003 | MEN-2581 | Distributed Cluster | 29.99 | ENTREES | false | false | Baked | 4 | 1003 |

The `menu_items` table is the central catalog of all dishes. Each row represents a single menu item identified by a surrogate `id` (e.g., `1000`) and a business-facing `menu_item_id` such as `MEN-2563`. The `name` column holds the display name—"Extended Review," "Pilot Initiative A," and so on—while `price` records the base cost in dollars. The `category` field groups items into logical sections like APPETIZERS, STARTERS, SOUP & SALAD, and ENTREES. Boolean flags `is_gluten_free` and `is_available_for_order` answer the two most common customer-facing questions. The `cooking_method` column describes how the dish is prepared, with values ranging from "Flash Fried" and "Baked" to "cooked to order" and "served raw." The columns `food_ingredient_id` and `menu_item_size_id` serve as foreign keys pointing into the `food_ingredients` and `menu_item_sizes` tables respectively, establishing the primary compositional relationships for each item.

**Table `food_ingredients`**

| id | ingredient_id | name | type | is_allergen | is_vegetarian | is_vegan | is_gluten_free | menu_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | Vegetable | false | true | false | true | 1000 |
| 2 | 5844284 | Pilot Initiative A | Protein | true | false | true | false | 1001 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | Cheese | false | true | false | true | 1002 |
| 4 | 2087735 | Distributed Cluster | Sauce | true | false | true | false | 1003 |

The `food_ingredients` table stores the building blocks of every dish. Each ingredient has its own surrogate `id`, a business identifier (`ingredient_id`), a `name`, and a `type` that classifies it as Vegetable, Protein, Cheese, Sauce, or another category. Dietary flags—`is_allergen`, `is_vegetarian`, `is_vegan`, and `is_gluten_free`—allow the system to filter menus by customer preference. For example, ingredient `1450638` (named "Extended Review") is a Vegetable that is vegetarian and gluten-free but not vegan, while ingredient `5844284` ("Pilot Initiative A") is a Protein that is both an allergen and vegan. The `menu_item_id` column links each ingredient back to the menu item it belongs to, creating a direct association between a dish and its component ingredients.

**Table `menu_item_sizes`**

| id | size_id | weight_oz | price | description | menu_item_id |
|---|---|---|---|---|---|
| 1000 | 25820616 | 0.18002123 | 12.87 | Extended Survey | 1000 |
| 1001 | 10238287 | 0.61 | 35.45 | Pilot Corridor A | 1001 |
| 1002 | 3012825 | 1.88004 | 29.24 | Baseline Series | 1002 |
| 1003 | 859644a0-9bad-11eb-a8a2-19ed5c03f8d3 | 0.10069832 | 29.99 | Distributed Assessment | 1003 |

Menu items often come in multiple sizes, each with its own weight and price. The `menu_item_sizes` table captures these variants. The `size_id` is a business identifier for the size (e.g., `25820616`), `weight_oz` records the portion weight in ounces, and `price` stores the size-specific cost. The `description` column provides a human-readable label such as "Extended Survey" or "Pilot Corridor A." The `menu_item_id` column ties each size variant back to its parent menu item. In the sample data, item `1000` has a size weighing just `0.18002123` ounces priced at `$12.87`, while item `1002` offers a larger portion at `1.88004` ounces for `$29.24`.

**Table `pizza_toppings`**

| id | topping_id | name | type | is_extra_cost | extra_cost_amount | menu_item_id |
|---|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Meat | false | 289.59 | 1000 |
| 2 | 6969414 | Pilot Initiative A | Vegetable | true | 442.51 | 1001 |
| 3 | 10449532 | Baseline Model | Cheese | false | 5.34 | 1002 |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Other | true | 9.99 | 1003 |

For pizza-style dishes, toppings are tracked separately from base ingredients. The `pizza_toppings` table records each topping with a business `topping_id`, a `name`, and a `type` (Meat, Vegetable, Cheese, or Other). The `is_extra_cost` flag indicates whether the topping incurs an additional charge, and `extra_cost_amount` specifies the surcharge when applicable. For instance, topping `6969414` ("Pilot Initiative A") is a Vegetable that carries an extra cost of `$442.51`, while topping `Rec`ount ("Extended Review") is a Meat topping with no additional charge despite an `extra_cost_amount` of `$289.59` on record. The `menu_item_id` column links each topping to the pizza item it belongs to.

**Table `add_on_options`**

| id | add_on_id | name | additional_price | type | menu_item_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 4011 | Extended Review | 89.53 | Protein | 1000 | 2025-01-01 00:14:00 |
| 2 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 0.02 | Side | 1001 | 2025-02-06 03:14:00 |
| 3 | 974918 | Baseline Model | 4.44 | Bread | 1002 | 2025-03-11 06:14:00 |
| 4 | 884345 | Distributed Cluster | 0.04 | Protein | 1003 | 2025-04-16 09:14:00 |

Add-on options represent supplementary items that customers can append to their orders. The `add_on_options` table stores each add-on with a business `add_on_id`, a `name`, an `additional_price`, and a `type` (Protein, Side, Bread, etc.). A `created_at` timestamp records when the add-on was introduced to the menu. Item `4011` ("Extended Review") is a Protein add-on priced at `$89.53`, added on January 1, 2025, while item `68f46afd953b4de8824b596a1bff565c` ("Pilot Initiative A") is a Side add-on costing only `$0.02`, added on February 6, 2025. The `menu_item_id` column associates each add-on with the menu item it supplements.

**Table `items_ingredients`**

| menu_item_id | food_ingredient_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `items_ingredients` table is a junction table that resolves the many-to-many relationship between menu items and food ingredients. Each row pairs a `menu_item_id` with a `food_ingredient_id`, indicating that a specific ingredient is used in a specific dish. Item `1000` ("Extended Review") uses both ingredient `1` and ingredient `2`, while item `1001` ("Pilot Initiative A") uses ingredients `2` and `3`. This table is the foundation for dietary filtering: by joining through it, the system can determine which menu items contain a given ingredient or which ingredients compose a given item.

## Menu Item and Ingredient Relationships

The views in this model synthesize the base tables into readable reports that answer specific operational questions. Each view joins the relevant tables and presents the result as a flat, queryable dataset.

**View `vw_menu_item_food_ingredient_detail`**

```sql
CREATE VIEW vw_menu_item_food_ingredient_detail AS
SELECT a.id, a.menu_item_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN food_ingredients b ON b.id = j.food_ingredient_id;
```

| id | menu_item_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1000 | MEN-2563 | Extended Review | 1 | 1450638 | Extended Review |
| 1000 | MEN-2563 | Extended Review | 2 | 5844284 | Pilot Initiative A |
| 1001 | MEN-2569 | Pilot Initiative A | 2 | 5844284 | Pilot Initiative A |
| 1001 | MEN-2569 | Pilot Initiative A | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 1002 | MEN-2575 | Baseline Model | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 1002 | MEN-2575 | Baseline Model | 4 | 2087735 | Distributed Cluster |
| 1003 | MEN-2581 | Distributed Cluster | 4 | 2087735 | Distributed Cluster |
| 1003 | MEN-2581 | Distributed Cluster | 1 | 1450638 | Extended Review |

The view `vw_menu_item_food_ingredient_detail` provides the most granular ingredient report, joining `menu_items`, `items_ingredients`, and `food_ingredients` into a single row per ingredient per menu item. It answers the question: "What ingredients compose each menu item, and what are their dietary properties?" For menu item `MEN-2563` ("Extended Review"), the view produces two rows—one for ingredient `1450638` (a vegetarian, gluten-free Vegetable) and one for ingredient `5844284` (a vegan Protein that is an allergen). This level of detail is essential for allergen warnings and dietary filtering.

**View `vw_menu_item_food_ingredient`**

```sql
CREATE VIEW vw_menu_item_food_ingredient AS
SELECT a.id, a.menu_item_id, a.name, a.price, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a JOIN food_ingredients b ON a.food_ingredient_id = b.id;
```

| id | menu_item_id | name | price | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|---|
| 1000 | MEN-2563 | Extended Review | 12.87 | 1 | 1450638 | Extended Review |
| 1001 | MEN-2569 | Pilot Initiative A | 35.45 | 2 | 5844284 | Pilot Initiative A |
| 1002 | MEN-2575 | Baseline Model | 29.24 | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 1003 | MEN-2581 | Distributed Cluster | 29.99 | 4 | 2087735 | Distributed Cluster |

The view `vw_menu_item_food_ingredient` simplifies the relationship by presenting one row per menu-item–ingredient pairing without the full ingredient attribute set. It answers: "Which ingredients are associated with which menu items?" The row for `MEN-2569` ("Pilot Initiative A") shows its link to ingredient `5844284`, while the row for `MEN-2575` ("Baseline Model") links to ingredient `template_ivacode_pagata_20det40ind`. This view is useful for quick lookups and for building ingredient-based search indexes.

**View `vw_menu_item_menu_item_size`**

```sql
CREATE VIEW vw_menu_item_menu_item_size AS
SELECT a.id, a.menu_item_id, a.name, a.price, b.id AS size_id, b.size_id AS size_size_id, b.weight_oz AS size_weight_oz
FROM menu_items a JOIN menu_item_sizes b ON a.menu_item_size_id = b.id;
```

| id | menu_item_id | name | price | size_id | size_size_id | size_weight_oz |
|---|---|---|---|---|---|---|
| 1000 | MEN-2563 | Extended Review | 12.87 | 1000 | 25820616 | 0.18002123 |
| 1001 | MEN-2569 | Pilot Initiative A | 35.45 | 1001 | 10238287 | 0.61 |
| 1002 | MEN-2575 | Baseline Model | 29.24 | 1002 | 3012825 | 1.88004 |
| 1003 | MEN-2581 | Distributed Cluster | 29.99 | 1003 | 859644a0-9bad-11eb-a8a2-19ed5c03f8d3 | 0.10069832 |

The view `vw_menu_item_menu_item_size` joins `menu_items` with `menu_item_sizes` to present each size variant alongside its parent dish. It answers: "What sizes are available for each menu item, and what are their weights and prices?" For `MEN-2563` ("Extended Review"), the view shows size `25820616` ("Extended Survey") weighing `0.18002123` ounces at `$12.87`. For `MEN-2581` ("Distributed Cluster"), the view shows size `859644a0-9bad-11eb-a8a2-19ed5c03f8d3` ("Distributed Assessment") at just `0.10069832` ounces for `$29.99`. This view supports size selection in ordering interfaces and price comparison across variants.

**View `vw_food_ingredient_menu_item`**

```sql
CREATE VIEW vw_food_ingredient_menu_item AS
SELECT a.id, a.ingredient_id, a.name, a.type, b.id AS item_id, b.menu_item_id AS item_menu_item_id, b.name AS item_name
FROM food_ingredients a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | ingredient_id | name | type | item_id | item_menu_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | Vegetable | 1000 | MEN-2563 | Extended Review |
| 2 | 5844284 | Pilot Initiative A | Protein | 1001 | MEN-2569 | Pilot Initiative A |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | Cheese | 1002 | MEN-2575 | Baseline Model |
| 4 | 2087735 | Distributed Cluster | Sauce | 1003 | MEN-2581 | Distributed Cluster |

The view `vw_food_ingredient_menu_item` reverses the perspective of the ingredient relationship, presenting one row per ingredient–menu-item pairing from the ingredient's point of view. It answers: "Which menu items use this ingredient?" Ingredient `1450638` appears in the view linked to menu item `1000`, while ingredient `2087735` ("Distributed Cluster") appears linked to menu item `1003`. This view is particularly useful for reverse allergen lookup: given an ingredient, find all dishes that contain it.

**View `vw_menu_item_size_menu_item`**

```sql
CREATE VIEW vw_menu_item_size_menu_item AS
SELECT a.id, a.size_id, a.weight_oz, a.price, b.id AS item_id, b.menu_item_id AS item_menu_item_id, b.name AS item_name
FROM menu_item_sizes a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | size_id | weight_oz | price | item_id | item_menu_item_id | item_name |
|---|---|---|---|---|---|---|
| 1000 | 25820616 | 0.18002123 | 12.87 | 1000 | MEN-2563 | Extended Review |
| 1001 | 10238287 | 0.61 | 35.45 | 1001 | MEN-2569 | Pilot Initiative A |
| 1002 | 3012825 | 1.88004 | 29.24 | 1002 | MEN-2575 | Baseline Model |
| 1003 | 859644a0-9bad-11eb-a8a2-19ed5c03f8d3 | 0.10069832 | 29.99 | 1003 | MEN-2581 | Distributed Cluster |

The view `vw_menu_item_size_menu_item` presents the size relationship from the menu item's perspective, joining `menu_item_sizes` back to `menu_items`. It answers: "For each menu item, what are its available sizes with full item context?" The row for `MEN-2569` ("Pilot Initiative A") shows size `10238287` ("Pilot Corridor A") at `0.61` ounces for `$35.45`. This view is ideal for displaying size options in a menu listing where the item name and price are already visible.

**View `vw_pizza_topping_menu_item`**

```sql
CREATE VIEW vw_pizza_topping_menu_item AS
SELECT a.id, a.topping_id, a.name, a.type, b.id AS item_id, b.menu_item_id AS item_menu_item_id, b.name AS item_name
FROM pizza_toppings a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | topping_id | name | type | item_id | item_menu_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Meat | 1000 | MEN-2563 | Extended Review |
| 2 | 6969414 | Pilot Initiative A | Vegetable | 1001 | MEN-2569 | Pilot Initiative A |
| 3 | 10449532 | Baseline Model | Cheese | 1002 | MEN-2575 | Baseline Model |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Other | 1003 | MEN-2581 | Distributed Cluster |

The view `vw_pizza_topping_menu_item` joins `pizza_toppings` with `menu_items` to present each topping alongside its parent dish. It answers: "What toppings are available for each pizza-style menu item, and do they carry extra charges?" For `MEN-2563` ("Extended Review"), the view shows topping `Rec`ount ("Extended Review"), a Meat topping with `is_extra_cost` set to false. For `MEN-2581` ("Distributed Cluster"), the view shows topping `6937ce06-8fcc-11eb-924d-9cd76263cbd0` ("Distributed Cluster"), an Other-type topping with `is_extra_cost` set to true and an extra cost of `$9.99`. This view powers the topping selection interface in ordering systems.

**View `vw_add_on_option_menu_item`**

```sql
CREATE VIEW vw_add_on_option_menu_item AS
SELECT a.id, a.add_on_id, a.name, a.additional_price, b.id AS item_id, b.menu_item_id AS item_menu_item_id, b.name AS item_name
FROM add_on_options a JOIN menu_items b ON a.menu_item_id = b.id;
```

| id | add_on_id | name | additional_price | item_id | item_menu_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 4011 | Extended Review | 89.53 | 1000 | MEN-2563 | Extended Review |
| 2 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 0.02 | 1001 | MEN-2569 | Pilot Initiative A |
| 3 | 974918 | Baseline Model | 4.44 | 1002 | MEN-2575 | Baseline Model |
| 4 | 884345 | Distributed Cluster | 0.04 | 1003 | MEN-2581 | Distributed Cluster |

The view `vw_add_on_option_menu_item` joins `add_on_options` with `menu_items` to present each add-on alongside its parent dish. It answers: "What add-ons are available for each menu item, and at what additional price?" For `MEN-2563` ("Extended Review"), the view shows add-on `4011` ("Extended Review"), a Protein add-on with an additional price of `$89.53`. For `MEN-2575` ("Baseline Model"), the view shows add-on `974918` ("Baseline Model"), a Bread add-on priced at `$4.44`. This view supports the add-on selection flow in digital ordering platforms.

## Synthesis

The data model presented here captures a restaurant menu as a network of interconnected records. The `menu_items` table anchors the catalog, while `food_ingredients`, `menu_item_sizes`, `pizza_toppings`, and `add_on_options` provide the dimensions of customization. The junction table `items_ingredients` resolves the many-to-many relationship between dishes and their component ingredients, enabling precise dietary filtering. The seven views each answer a distinct operational question—ingredient composition, size variants, topping availability, and add-on options—by joining the base tables into flat, queryable results. Together, these tables and views form a complete data foundation for menu management, customer-facing dietary filters, and pricing calculations across a restaurant's digital ordering system.