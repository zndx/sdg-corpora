## The Architecture of a Restaurant Menu System

A modern restaurant menu is more than a list of dishes and prices; it is a structured catalog of culinary products, each composed of ingredients, prepared in specific ways, and often accompanied by sides or presented as specialized variants like salads and pizzas. The data model underlying such a system captures every dimension of a menu item—from its classification and pricing to its preparation method and the individual components that constitute it. This chapter describes the entities, relationships, and derived views that together form a complete picture of the menu domain.

At the core of the system is the menu item, the fundamental unit of the catalog. Every dish begins as a record in the menu_items table, which assigns a unique identifier, a human-readable name, a category, and a price. Additional boolean flags describe how the item is prepared: whether it is baked, breaded, grilled, fried, or pan-seared, and whether it is gluten-free. These attributes allow the kitchen and the ordering system to communicate preparation requirements unambiguously.

**Table `menu_items`**

| id | item_id | name | category | price | description | is_gluten_free | is_baked | is_breaded | is_grilled | is_fried | is_pan_seared |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | Appetizer | 12.87 | Extended Survey | true | true | true | false | true | true |
| 2 | ITE-2795 | Pilot Initiative A | Salad | 35.45 | Pilot Corridor A | false | false | false | true | false | false |
| 3 | ITE-2798 | Baseline Model | Pizza | 29.24 | Baseline Series | true | true | true | false | true | true |
| 4 | ITE-2801 | Distributed Cluster | Specialty Dish | 29.99 | Distributed Assessment | false | false | false | true | false | false |

Consider the item identified as ITE-2792, named "Extended Review" and categorized as an Appetizer. It is priced at $12.87 and carries the description "Extended Survey." This particular item is marked as gluten-free, baked, breaded, fried, and pan-seared, while not being grilled—a combination of flags that reflects a multi-stage preparation process. By contrast, ITE-2795, "Pilot Initiative A," is classified as a Salad, priced at $35.45, and is grilled but not baked, breaded, fried, or pan-seared. The category field partitions items into Appetizer, Salad, Pizza, and Specialty Dish, providing a first-order organizational structure.

Every menu item is constructed from ingredients, which are tracked in their own table. The ingredients table records each component with an ingredient identifier, a name, a type (such as Meat, Cheese, Vegetable, or Seafood), an origin code, a preparation state, and boolean flags indicating whether the ingredient is locally grown or wild-caught. Crucially, each ingredient record carries a menu_item_id that links it back to the dish it belongs to.

**Table `ingredients`**

| id | ingredient_id | name | type | origin | state | is_locally_grown | is_wild_caught | menu_item_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | Meat | distributed-origin-66 | Raw | true | true | 1 |
| 1001 | 5844284 | Pilot Initiative A | Cheese | baseline-origin-67 | Breaded | false | false | 2 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | Vegetable | pilot-origin-68 | Fried | true | true | 3 |
| 1003 | 2087735 | Distributed Cluster | Seafood | extended-origin-69 | Grilled | false | false | 4 |

The ingredient with identifier 1450638, named "Extended Review," is classified as Meat, sourced from distributed-origin-66, and is in a Raw state. It is flagged as both locally grown and wild-caught, and it is associated with menu item 1. Similarly, ingredient 5844284, "Pilot Initiative A," is a Cheese from baseline-origin-67 in a Breaded state, linked to menu item 2. The ingredient with the template code template_ivacode_pagata_20det40ind is a Vegetable from pilot-origin-68, in a Fried state, and belongs to menu item 3. The ingredient 2087735, "Distributed Cluster," is a Seafood from extended-origin-69, in a Grilled state, associated with menu item 4.

The relationship between menu items and ingredients is mediated through the items_ingredients table, which serves as the associative record that explicitly pairs a menu item with one or more of its constituent ingredients. This table ensures that the composition of each dish is traceable and auditable.

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

Menu items may also include side dishes, which are defined in the side_dishes table. Each side dish has a side identifier, a name, a type (such as Pasta or Potato), a flag indicating whether it is included with the main item, and a reference to the parent menu item.

**Table `side_dishes`**

| side_id | name | type | is_included | menu_item_id |
|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | Pasta | true | 1 |
| 937737 | Pilot Initiative A | Potato | false | 2 |
| 6564389 | Baseline Model | Vegetable | true | 3 |
| 103178 | Distributed Cluster | Pasta | false | 4 |

The side dish with identifier ChIJD7fiBh9u5kcRYJSMaMOCCwQ, named "Extended Review," is of type Pasta and is marked as included with menu item 1. The side dish 937737, "Pilot Initiative A," is a Potato type and is not included with menu item 2. Side dish 6564389, "Baseline Model," is a Vegetable type and is included with menu item 3. The side dish 103178, "Distributed Cluster," is a Pasta type and is not included with menu item 4. The items_dishes table provides the explicit linkage between menu items and their associated side dishes.

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

Salads represent a specialized category of menu item with their own structure. The salads table extends the menu item concept by recording the base greens, the dressing, whether the salad is a chef's special, and timestamps for creation and last update.

**Table `salads`**

| id | salad_id | name | base_greens | dressing | is_chef_special | menu_item_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 3012833 | Extended Review | pilot-base-98 | integrated-dressing-46 | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 5844254 | Pilot Initiative A | extended-base-99 | seasonal-dressing-47 | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 4277036 | Baseline Model | integrated-base-100 | regional-dressing-48 | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | id_3 | Distributed Cluster | seasonal-base-101 | legacy-dressing-49 | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Salad record 100, identified by salad_id 3012833 and named "Extended Review," uses pilot-base-98 as its base greens and integrated-dressing-46 as its dressing. It is marked as a chef's special and is linked to menu item 1. It was created on 2025-01-01 and last updated on 2025-01-02. Salad 101, with salad_id 5844254, is named "Pilot Initiative A," uses extended-base-99 and seasonal-dressing-47, is not a chef's special, and is linked to menu item 2. The items_salads table connects menu items to their salad variants.

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

The ingredients used in salads are tracked separately in the salads_ingredients table, which pairs salad records with their specific ingredient components.

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

Pizzas form another specialized category. The pizzas table records each pizza with a pizza identifier, a name, a sauce type, a crust type, and a flag indicating whether it is a specialty item.

**Table `pizzas`**

| pizza_id | name | sauce_type | crust_type | is_specialty |
|---|---|---|---|---|
| 1996915 | Extended Review | House Red Sauce | Medium Crust | true |
| 505983 | Pilot Initiative A | Oil and Garlic Sauce | Fresh Pasta Sheets | false |
| id_18 | Baseline Model | Alfredo Sauce | Medium Crust | true |
| 2618556 | Distributed Cluster | Diablo Sauce | Fresh Pasta Sheets | false |

Pizza 1996915, named "Extended Review," uses House Red Sauce and a Medium Crust, and is designated as a specialty pizza. Pizza 505983, "Pilot Initiative A," uses Oil and Garlic Sauce with Fresh Pasta Sheets as the crust and is not a specialty. Pizza id_18, "Baseline Model," uses Alfredo Sauce and a Medium Crust and is a specialty. Pizza 2618556, "Distributed Cluster," uses Diablo Sauce with Fresh Pasta Sheets and is not a specialty.

Toppings are defined in the toppings table, which records each topping with an identifier, a name, a tier (Standard or Premium), a price adjustment, and a reference to the pizza it belongs to.

**Table `toppings`**

| id | topping_id | name | tier | price_adjustment | pizza_id |
|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Standard | 13.94 | 1996915 |
| 2 | 6969414 | Pilot Initiative A | Premium | 151.27 | 505983 |
| 3 | 10449532 | Baseline Model | Standard | 17.41 | id_18 |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Premium | 0.18 | 2618556 |

Topping 1, with topping_id Recount and named "Extended Review," is a Standard tier topping with a price adjustment of $13.94, associated with pizza 1996915. Topping 2, "Pilot Initiative A," is a Premium tier topping with a price adjustment of $151.27, linked to pizza 505983. Topping 3, "Baseline Model," is a Standard tier topping with a $17.41 adjustment, associated with pizza id_18. Topping 4, "Distributed Cluster," is a Premium tier topping with a minimal adjustment of $0.18, linked to pizza 2618556. The pizzas_ingredients table provides the explicit linkage between pizzas and their ingredient components.

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

Beyond the base tables, the system provides a set of derived views that join these entities to answer specific operational questions. Each view assembles related data into a single, readable result set.

The menu_item_ingredient_detail_view joins menu items with their ingredients, answering the question of which ingredients compose each dish. It surfaces the menu item's name, category, and price alongside the ingredient's name, type, origin, and state.

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

Reading a row from this view, we see that the menu item "Extended Review" (category: Appetizer, price: $12.87) is composed of the ingredient "Extended Review" (type: Meat, origin: distributed-origin-66, state: Raw). Another row shows "Pilot Initiative A" (category: Salad, price: $35.45) paired with the ingredient "Pilot Initiative A" (type: Cheese, origin: baseline-origin-67, state: Breaded).

The menu_item_side_dish_detail_view joins menu items with their side dishes, revealing which sides accompany each dish and whether they are included in the base price.

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

In this view, the menu item "Extended Review" is paired with the side dish "Extended Review" (type: Pasta, included: true), indicating that this pasta side comes with the appetizer at no extra charge. The menu item "Pilot Initiative A" is paired with side dish "Pilot Initiative A" (type: Potato, included: false), meaning the potato side is available but not included in the base price.

The menu_item_salad_detail_view joins menu items with their salad records, surfacing the salad-specific attributes such as base greens, dressing, and chef's special status.

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

A row from this view shows menu item "Extended Review" linked to salad 100, which uses pilot-base-98 as base greens, integrated-dressing-46 as dressing, and is marked as a chef's special. Another row shows "Pilot Initiative A" linked to salad 101, using extended-base-99 and seasonal-dressing-47, not a chef's special.

The ingredient_menu_item_view provides the inverse perspective: starting from an ingredient, it reveals which menu item it belongs to.

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

This view shows that the ingredient "Extended Review" (type: Meat, origin: distributed-origin-66) is used in menu item "Extended Review" (category: Appetizer, price: $12.87). The ingredient "Pilot Initiative A" (type: Cheese) is used in menu item "Pilot Initiative A" (category: Salad, price: $35.45).

The side_dish_menu_item_view joins side dishes back to their parent menu items, providing a side-centric view of the menu structure.

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

In this view, the side dish "Extended Review" (type: Pasta, included: true) is linked to menu item "Extended Review" (category: Appetizer). The side dish "Pilot Initiative A" (type: Potato, included: false) is linked to menu item "Pilot Initiative A" (category: Salad).

The salad_ingredient_detail_view joins salad records with their ingredients, answering the question of what ingredients are used in each salad.

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

This view reveals the composition of salads by pairing salad records with their constituent ingredients, enabling the kitchen to verify that each salad contains the correct components.

The salad_menu_item_view joins salad records to their parent menu items, providing a complete picture of the salad-to-menu-item relationship.

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

This view shows that salad 100 ("Extended Review," base greens: pilot-base-98, dressing: integrated-dressing-46, chef's special: true) is associated with menu item "Extended Review" (category: Appetizer, price: $12.87).

The pizza_ingredient_detail_view joins pizza records with their ingredients, revealing the ingredient composition of each pizza.

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

This view allows the kitchen and inventory systems to determine which ingredients are required for each pizza variant, supporting both preparation and ordering workflows.

Finally, the topping_pizza_view joins toppings to their parent pizzas, surfacing the tier and price adjustment for each topping on each pizza.

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

In this view, the topping "Extended Review" (tier: Standard, price adjustment: $13.94) is associated with pizza "Extended Review" (sauce: House Red Sauce, crust: Medium Crust, specialty: true). The topping "Pilot Initiative A" (tier: Premium, price adjustment: $151.27) is associated with pizza "Pilot Initiative A" (sauce: Oil and Garlic Sauce, crust: Fresh Pasta Sheets, specialty: false).

## Synthesis

The menu system described here captures the full complexity of a restaurant's product catalog. Menu items serve as the central entity, with ingredients, side dishes, salads, pizzas, and toppings forming specialized extensions. The base tables store the raw records, while the associative tables (items_ingredients, items_dishes, items_salads, salads_ingredients, pizzas_ingredients) establish the explicit relationships between entities. The derived views assemble these relationships into readable result sets that answer specific operational questions—what ingredients are in a dish, which sides accompany it, what dressing goes with a salad, or what toppings are available on a pizza. Together, these tables and views provide a complete, traceable, and queryable representation of the menu domain.