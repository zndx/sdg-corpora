The restaurant menu domain models a catalog of food items alongside their compositional ingredients, size variants, optional toppings, and add-on extras. At its core, the schema separates the menu item itself from the ingredients that compose it, the sizes in which it is served, and the optional toppings and add-ons that can be layered on. This separation is enforced through foreign keys and a dedicated junction table, and it is materialized for reporting through a family of views that rejoin the normalized pieces into domain-meaningful rows. The following chapter walks through the entity types, their attributes, the cardinality-bounded relationships that bind them, and the views that reconstruct the original business facts.

## The Entity Landscape

The domain centers on six base tables. The primary entity is the menu item, captured in `menu_items`, which stores the item's identifier, a human-readable name, its price, its category, dietary flags, and the cooking method used to prepare it.

**Table `menu_items`**

| id | menu_item_id | name | price | category | is_gluten_free | is_available_for_order | cooking_method | food_ingredient_id | menu_item_size_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | MEN-2563 | Extended Review | 12.87 | APPETIZERS | true | true | Flash Fried | 1 | 1000 |
| 1001 | MEN-2569 | Pilot Initiative A | 35.45 | STARTERS | false | false | cooked to order | 2 | 1001 |
| 1002 | MEN-2575 | Baseline Model | 29.24 | SOUP & SALAD | true | true | served raw | 3 | 1002 |
| 1003 | MEN-2581 | Distributed Cluster | 29.99 | ENTREES | false | false | Baked | 4 | 1003 |

Each row in `menu_items` represents a distinct offering. The `name` column carries descriptive labels such as *Extended Review* or *Pilot Initiative A*, while `category` groups items into *APPETIZERS*, *STARTERS*, *SOUP & SALAD*, and *ENTREES*. The `price` column holds decimal values like `12.87` and `35.45`. Boolean columns `is_gluten_free` and `is_available_for_order` encode dietary and availability constraints, and `cooking_method` records preparation styles ranging from *Flash Fried* to *Baked* to *served raw*.

The ingredients that go into these items are stored in `food_ingredients`.

**Table `food_ingredients`**

| id | ingredient_id | name | type | is_allergen | is_vegetarian | is_vegan | is_gluten_free | menu_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | Vegetable | false | true | false | true | 1000 |
| 2 | 5844284 | Pilot Initiative A | Protein | true | false | true | false | 1001 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | Cheese | false | true | false | true | 1002 |
| 4 | 2087735 | Distributed Cluster | Sauce | true | false | true | false | 1003 |

Each ingredient row carries its own identifier (`ingredient_id`), a `name` that mirrors the menu item it is associated with (e.g., *Extended Review*, *Baseline Model*), a `type` such as *Vegetable*, *Protein*, *Cheese*, or *Sauce*, and a set of boolean flags (`is_allergen`, `is_vegetarian`, `is_vegan`, `is_gluten_free`) that describe its dietary properties. The `menu_item_id` column on this table points back to the menu item the ingredient belongs to.

Size variants are captured in `menu_item_sizes`.

**Table `menu_item_sizes`**

| id | size_id | weight_oz | price | description | menu_item_id |
|---|---|---|---|---|---|
| 1000 | 25820616 | 0.18002123 | 12.87 | Extended Survey | 1000 |
| 1001 | 10238287 | 0.61 | 35.45 | Pilot Corridor A | 1001 |
| 1002 | 3012825 | 1.88004 | 29.24 | Baseline Series | 1002 |
| 1003 | 859644a0-9bad-11eb-a8a2-19ed5c03f8d3 | 0.10069832 | 29.99 | Distributed Assessment | 1003 |

Each row defines a size option with a `size_id`, a `weight_oz` value (e.g., `0.18002123`, `0.61`, `1.88004`), a `price`, a human-readable `description` such as *Extended Survey* or *Pilot Corridor A*, and a `menu_item_id` foreign key linking the size back to its parent menu item.

Toppings specific to pizza items live in `pizza_toppings`.

**Table `pizza_toppings`**

| id | topping_id | name | type | is_extra_cost | extra_cost_amount | menu_item_id |
|---|---|---|---|---|---|---|
| 1 | Recount | Extended Review | Meat | false | 289.59 | 1000 |
| 2 | 6969414 | Pilot Initiative A | Vegetable | true | 442.51 | 1001 |
| 3 | 10449532 | Baseline Model | Cheese | false | 5.34 | 1002 |
| 4 | 6937ce06-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | Other | true | 9.99 | 1003 |

Each topping row has a `topping_id`, a `name`, a `type` (e.g., *Meat*, *Vegetable*, *Cheese*, *Other*), a boolean `is_extra_cost` flag, an `extra_cost_amount` (such as `289.59` or `442.51`), and a `menu_item_id` foreign key.

Optional extras are stored in `add_on_options`.

**Table `add_on_options`**

| id | add_on_id | name | additional_price | type | menu_item_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 4011 | Extended Review | 89.53 | Protein | 1000 | 2025-01-01 00:14:00 |
| 2 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 0.02 | Side | 1001 | 2025-02-06 03:14:00 |
| 3 | 974918 | Baseline Model | 4.44 | Bread | 1002 | 2025-03-11 06:14:00 |
| 4 | 884345 | Distributed Cluster | 0.04 | Protein | 1003 | 2025-04-16 09:14:00 |

Each add-on row carries an `add_on_id`, a `name`, an `additional_price` (ranging from `0.02` to `89.53`), a `type` such as *Protein*, *Side*, or *Bread*, a `menu_item_id` foreign key, and a `created_at` timestamp.

Finally, the many-to-many relationship between menu items and food ingredients is materialized in the junction table `items_ingredients`.

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

This table contains only two columns—`menu_item_id` and `food_ingredient_id`—and each row asserts that a particular ingredient is used in a particular menu item. For example, menu item `1000` is associated with ingredients `1` and `2`, while menu item `1003` is associated with ingredients `4` and `1`.

## Attribute Columns and Cardinality-Bounded Relationships

In this schema, attributes of each entity type are stored as columns within their respective tables. The `menu_items` table stores the item's name, price, category, dietary flags, and cooking method directly as columns. The `food_ingredients` table stores the ingredient's name, type, and dietary flags as columns. The `menu_item_sizes` table stores weight, price, and description as columns. The `pizza_toppings` table stores topping name, type, cost flags, and extra cost as columns. The `add_on_options` table stores add-on name, additional price, type, and creation timestamp as columns.

The cardinality of the relationships between these tables is expressed through foreign keys. The `menu_items` table contains a `food_ingredient_id` column that references `food_ingredients.id`, establishing a one-to-one or many-to-one relationship between a menu item and its primary ingredient. Similarly, `menu_items` contains a `menu_item_size_id` column referencing `menu_item_sizes.id`, linking each menu item to its default size variant.

Conversely, the `food_ingredients`, `menu_item_sizes`, `pizza_toppings`, and `add_on_options` tables each contain a `menu_item_id` column that references `menu_items.id`. This creates a one-to-many relationship from menu items to their associated ingredients, sizes, toppings, and add-ons. A single menu item can have multiple associated rows in any of these child tables.

The `items_ingredients` junction table provides an additional many-to-many path between `menu_items` and `food_ingredients`. While the direct `food_ingredient_id` column on `menu_items` identifies a primary ingredient, the junction table allows a menu item to be associated with multiple ingredients. For instance, menu item `1000` (named *Extended Review*) is linked to both ingredient `1` (*Extended Review*, a *Vegetable*) and ingredient `2` (*Pilot Initiative A*, a *Protein*). This dual-path design supports both a primary ingredient constraint and a flexible composition model.

## Materialized Views

The schema includes seven views that rejoin the normalized tables into domain-meaningful rows. Each view answers a specific business question by joining the relevant tables and presenting the result as a single flat result set.

### vw_menu_item_food_ingredient_detail

This view joins `menu_items` with `food_ingredients` to produce a detailed record of each menu item alongside its primary ingredient. It answers the question: "What is the primary ingredient of each menu item, and what are the item's full details?"

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

Reading the first row of this view, we see that menu item `MEN-2563` (*Extended Review*, priced at `12.87`, in the *APPETIZERS* category, gluten-free, available for order, and *Flash Fried*) has primary ingredient `1450638` (*Extended Review*, a *Vegetable*, not an allergen, vegetarian, vegan, and gluten-free). The second row shows that menu item `MEN-2569` (*Pilot Initiative A*, priced at `35.45`, in the *STARTERS* category, not gluten-free, not available for order, and *cooked to order*) has primary ingredient `5844284` (*Pilot Initiative A*, a *Protein*, an allergen, not vegetarian, vegan, and not gluten-free).

### vw_menu_item_food_ingredient

This view provides a streamlined join between `menu_items` and `food_ingredients`, focusing on the core relationship between menu items and their primary ingredients without the full detail columns. It answers: "Which menu items are associated with which ingredients?"

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

The first row confirms that menu item `1000` is associated with ingredient `1`, while the second row links menu item `1001` to ingredient `2`. This view is useful for quick lookups and for validating the integrity of the primary ingredient relationship.

### vw_menu_item_menu_item_size

This view joins `menu_items` with `menu_item_sizes` to present each menu item alongside its default size variant. It answers: "What size option is associated with each menu item?"

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

The first row shows that menu item `1000` (*Extended Review*) is associated with size `25820616` (*Extended Survey*, weighing `0.18002123` oz, priced at `12.87`). The second row links menu item `1001` (*Pilot Initiative A*) to size `10238287` (*Pilot Corridor A*, weighing `0.61` oz, priced at `35.45`). The third row connects menu item `1002` (*Baseline Model*) to size `3012825` (*Baseline Series*, weighing `1.88004` oz, priced at `29.24`).

### vw_food_ingredient_menu_item

This view reverses the join direction, presenting `food_ingredients` alongside their associated `menu_items`. It answers: "For each ingredient, which menu item does it belong to?"

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

The first row shows that ingredient `1450638` (*Extended Review*, a *Vegetable*) is associated with menu item `1000`. The second row links ingredient `5844284` (*Pilot Initiative A*, a *Protein*) to menu item `1001`. The third row connects ingredient `template_ivacode_pagata_20det40ind` (*Baseline Model*, a *Cheese*) to menu item `1002`. This view is useful for ingredient-centric queries, such as finding all menu items that use a particular ingredient type.

### vw_menu_item_size_menu_item

This view joins `menu_item_sizes` with `menu_items`, presenting each size variant alongside its parent menu item. It answers: "Which menu item does each size variant belong to?"

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

The first row shows that size `25820616` (*Extended Survey*, weighing `0.18002123` oz, priced at `12.87`) belongs to menu item `1000`. The second row links size `10238287` (*Pilot Corridor A*, weighing `0.61` oz, priced at `35.45`) to menu item `1001`. The third row connects size `3012825` (*Baseline Series*, weighing `1.88004` oz, priced at `29.24`) to menu item `1002`. The fourth row shows size `859644a0-9bad-11eb-a8a2-19ed5c03f8d3` (*Distributed Assessment*, weighing `0.10069832` oz, priced at `29.99`) belongs to menu item `1003`.

### vw_pizza_topping_menu_item

This view joins `pizza_toppings` with `menu_items`, presenting each pizza topping alongside its associated menu item. It answers: "Which menu items have which pizza toppings?"

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

The first row shows that topping `Recount` (*Extended Review*, a *Meat* type, not an extra-cost item with an extra cost of `289.59`) is associated with menu item `1000`. The second row links topping `6969414` (*Pilot Initiative A*, a *Vegetable* type, an extra-cost item with an extra cost of `442.51`) to menu item `1001`. The third row connects topping `10449532` (*Baseline Model*, a *Cheese* type, not an extra-cost item with an extra cost of `5.34`) to menu item `1002`. The fourth row shows topping `6937ce06-8fcc-11eb-924d-9cd76263cbd0` (*Distributed Cluster*, an *Other* type, an extra-cost item with an extra cost of `9.99`) belongs to menu item `1003`.

### vw_add_on_option_menu_item

This view joins `add_on_options` with `menu_items`, presenting each add-on option alongside its associated menu item. It answers: "Which menu items have which add-on options, and at what additional price?"

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

The first row shows that add-on `4011` (*Extended Review*, a *Protein* type, priced at `89.53`) is associated with menu item `1000` and was created on `2025-01-01 00:14:00`. The second row links add-on `68f46afd953b4de8824b596a1bff565c` (*Pilot Initiative A*, a *Side* type, priced at `0.02`) to menu item `1001` with a creation timestamp of `2025-02-06 03:14:00`. The third row connects add-on `974918` (*Baseline Model*, a *Bread* type, priced at `4.44`) to menu item `1002` with a creation timestamp of `2025-03-11 06:14:00`. The fourth row shows add-on `884345` (*Distributed Cluster*, a *Protein* type, priced at `0.04`) belongs to menu item `1003` with a creation timestamp of `2025-04-16 09:14:00`.

## Synthesis

The schema models the restaurant menu domain through a clear separation of concerns: menu items are stored in `menu_items`, their ingredients in `food_ingredients`, their size variants in `menu_item_sizes`, their pizza toppings in `pizza_toppings`, and their add-on options in `add_on_options`. The `items_ingredients` junction table provides a many-to-many bridge between menu items and ingredients, complementing the direct foreign key path. Foreign keys in `menu_items` (`food_ingredient_id`, `menu_item_size_id`) and in the child tables (`menu_item_id`) enforce referential integrity and express the cardinality of each relationship. The seven views—`vw_menu_item_food_ingredient_detail`, `vw_menu_item_food_ingredient`, `vw_menu_item_menu_item_size`, `vw_food_ingredient_menu_item`, `vw_menu_item_size_menu_item`, `vw_pizza_topping_menu_item`, and `vw_add_on_option_menu_item`—rejoin these normalized tables into flat, queryable result sets that answer specific business questions about the menu catalog. Together, the tables and views form a complete, normalized model of the domain that supports both data integrity and flexible reporting.