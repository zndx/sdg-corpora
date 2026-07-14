## Ontology-Grounded Relational Modelling of a Restaurant Menu Domain

This chapter documents how a restaurant menu domain—encompassing dishes, ingredients, preparation methods, drink variants, and omelette add-ons—is modelled as an ontology and materialised as a relational schema. The domain centres on `menu_items` as the primary entity, with each dish optionally linked to a side item, a preparation method, one or more ingredients, and, where applicable, a drink variant or an omelette add-on. The schema separates concerns into six base tables for core entities, three junction tables for many-to-many associations, and thirteen views that reconstruct domain facts through controlled joins. Every table and column name is quoted in backticks throughout.

**Table `menu_items`**

| menu_item_id | name | price | category | is_alcoholic | is_spicy | side_item_id | method_id |
|---|---|---|---|---|---|---|---|
| MEN-2563 | Extended Review | 12.87 | Mains | false | true | 100 | 209228 |
| MEN-2569 | Pilot Initiative A | 35.45 | Fruits & Grains | true | false | 101 | 7441161 |
| MEN-2575 | Baseline Model | 29.24 | Sandwiches | false | true | 102 | 89447 |
| MEN-2581 | Distributed Cluster | 29.99 | Avocado Toasts | true | false | 103 | 4180941 |

The `menu_items` table anchors the entire schema. Its primary key `menu_item_id` is a composite of a prefix and a numeric identifier—for example, `MEN-2563` for the dish named "Extended Review" priced at 12.87 in the "Mains" category. Two boolean flags, `is_alcoholic` and `is_spicy`, capture dietary attributes at the row level. The dish "Pilot Initiative A" (`MEN-2569`) is marked as alcoholic but not spicy, whereas "Baseline Model" (`MEN-2575`) is spicy but non-alcoholic. Two foreign keys, `side_item_id` and `method_id`, point respectively into the `side_items` and `preparation_methods` tables, establishing one-to-one or one-to-zero relationships between a menu item and its side and its cooking procedure. The value `100` in `side_item_id` for "Extended Review" links it to the side item with identifier `SID-2588`, while `method_id` value `209228` ties the same dish to the preparation method of the same identifier.

**Table `ingredients`**

| ingredient_id | name | type | is_allergen | is_seasonal | menu_item_id | method_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Protein | false | false | MEN-2563 | 209228 |
| 2 | Pilot Initiative A | Dairy | true | true | MEN-2569 | 7441161 |
| 3 | Baseline Model | Grain | false | false | MEN-2575 | 89447 |
| 4 | Distributed Cluster | Vegetable | true | true | MEN-2581 | 4180941 |

The `ingredients` table stores ingredient master records. Each row carries an `ingredient_id` (an integer surrogate), a `name`, a `type` (such as "Protein", "Dairy", "Grain", or "Vegetable"), and two boolean flags: `is_allergen` and `is_seasonal`. Ingredient 1, named "Extended Review" of type "Protein", is neither an allergen nor seasonal. Ingredient 2, "Pilot Initiative A", is of type "Dairy" and is both an allergen and seasonal. The table also embeds two foreign keys—`menu_item_id` and `method_id`—that create a direct association between an ingredient and the menu item and preparation method it belongs to. For instance, ingredient 4 ("Distributed Cluster", type "Vegetable", allergen and seasonal) is linked to menu item `MEN-2581` and method `4180941`.

**Table `side_items`**

| id | side_item_id | name | price | is_included | menu_item_id |
|---|---|---|---|---|---|
| 100 | SID-2588 | Extended Review | 12.87 | true | MEN-2563 |
| 101 | SID-2595 | Pilot Initiative A | 35.45 | false | MEN-2569 |
| 102 | SID-2602 | Baseline Model | 29.24 | true | MEN-2575 |
| 103 | SID-2609 | Distributed Cluster | 29.99 | false | MEN-2581 |

Side items are captured in the `side_items` table, which uses a surrogate primary key `id` alongside a business identifier `side_item_id`. The side item with `id` 100 and `side_item_id` `SID-2588` is named "Extended Review", priced at 12.87, and marked as included (`is_included = true`). The side item with `id` 101 (`SID-2595`, "Pilot Initiative A") is priced at 35.45 and is not included. A foreign key `menu_item_id` ties each side item back to its parent dish, so that side `SID-2588` is associated with menu item `MEN-2563`.

**Table `preparation_methods`**

| method_id | name | cooking_temperature | cooking_duration | menu_item_id |
|---|---|---|---|---|
| 209228 | Extended Review | 0.58 | 17 | MEN-2563 |
| 7441161 | Pilot Initiative A | 1.05 | 25 | MEN-2569 |
| 89447 | Baseline Model | 0.4492872599999999 | 33 | MEN-2575 |
| 4180941 | Distributed Cluster | 0.28 | 41 | MEN-2581 |

The `preparation_methods` table records cooking procedures. Its primary key is `method_id`, and each row includes a `name`, a `cooking_temperature` (a floating-point value), and a `cooking_duration` (an integer in minutes). Method `209228`, named "Extended Review", specifies a temperature of 0.58 and a duration of 17 minutes. Method `7441161` ("Pilot Initiative A") calls for 1.05 temperature and 25 minutes. A foreign key `menu_item_id` links each method to the dish it prepares, so method `209228` is the procedure for menu item `MEN-2563`.

**Table `drink_variants`**

| variant_id | name | base_alcohol | price | alcohol_content | menu_item_id |
|---|---|---|---|---|---|
| 790490 | Extended Review | distributed-base-54 | 12.87 | 7.70 | MEN-2563 |
| 937715 | Pilot Initiative A | baseline-base-55 | 35.45 | 10.40 | MEN-2569 |
| state_et_10 | Baseline Model | pilot-base-56 | 29.24 | 13.10 | MEN-2575 |
| gd_taxc_1211 | Distributed Cluster | extended-base-57 | 29.99 | 15.80 | MEN-2581 |

Drink variants are modelled in `drink_variants`, with primary key `variant_id`. Each variant has a `name`, a `base_alcohol` (a string such as "distributed-base-54"), a `price`, an `alcohol_content` (a float), and a foreign key `menu_item_id`. Variant `790490` ("Extended Review") uses base alcohol "distributed-base-54", costs 12.87, and has an alcohol content of 7.70. Variant `937715` ("Pilot Initiative A") has a higher alcohol content of 10.40. The foreign key `menu_item_id` associates each drink with its parent menu item.

**Table `omelette_add_ons`**

| id | add_on_id | name | additional_cost | category | menu_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | 4011 | Extended Review | 0.11 | Cheese | MEN-2563 | 1 |
| 101 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 13.13 | Vegetable | MEN-2569 | 2 |
| 102 | 974918 | Baseline Model | 0.22 | Meat | MEN-2575 | 3 |
| 103 | 884345 | Distributed Cluster | 9.99 | Premium | MEN-2581 | 4 |

Omelette add-ons are stored in `omelette_add_ons`, with surrogate primary key `id` and business key `add_on_id`. Each row carries a `name`, an `additional_cost`, a `category` (e.g., "Cheese", "Vegetable", "Meat", "Premium"), and two foreign keys: `menu_item_id` and `ingredient_id`. Add-on `4011` ("Extended Review", category "Cheese") costs an additional 0.11 and is linked to menu item `MEN-2563` and ingredient 1. Add-on `68f46afd953b4de8824b596a1bff565c` ("Pilot Initiative A", category "Vegetable") adds 13.13 to the price and references ingredient 2.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| MEN-2563 | 1 |
| MEN-2563 | 2 |
| MEN-2569 | 2 |
| MEN-2569 | 3 |
| MEN-2575 | 3 |
| MEN-2575 | 4 |
| MEN-2581 | 4 |
| MEN-2581 | 1 |

The `items_ingredients` table is a junction table that resolves a many-to-many relationship between `menu_items` and `ingredients`. It contains foreign keys referencing both `menu_item_id` and `ingredient_id`, allowing a single menu item to be composed of multiple ingredients and a single ingredient to appear across multiple dishes. This normalisation avoids repeating ingredient data within the `menu_items` table and supports flexible recipe management.

**Table `methods_ingredients`**

| method_id | ingredient_id |
|---|---|
| 209228 | 1 |
| 209228 | 2 |
| 7441161 | 2 |
| 7441161 | 3 |
| 89447 | 3 |
| 89447 | 4 |
| 4180941 | 4 |
| 4180941 | 1 |

Similarly, `methods_ingredients` is a junction table linking `preparation_methods` to `ingredients`. It holds foreign keys `method_id` and `ingredient_id`, capturing which ingredients are required for a given preparation method. This separation allows the same ingredient to be used across different cooking techniques and the same technique to apply to dishes with different ingredient sets.

**Table `variants_ingredients`**

| variant_id | ingredient_id |
|---|---|
| 790490 | 1 |
| 790490 | 2 |
| 937715 | 2 |
| 937715 | 3 |
| state_et_10 | 3 |
| state_et_10 | 4 |
| gd_taxc_1211 | 4 |
| gd_taxc_1211 | 1 |

The `variants_ingredients` junction table connects `drink_variants` to `ingredients`. With foreign keys `variant_id` and `ingredient_id`, it records which ingredients are used in each drink variant, supporting a many-to-many relationship between alcoholic beverages and their component ingredients.

**View `v_menu_item_ingredient_detail`**

```sql
CREATE VIEW v_menu_item_ingredient_detail AS
SELECT a.menu_item_id, a.name, a.price, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.type AS ingredient_type
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.menu_item_id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| menu_item_id | name | price | ingredient_ingredient_id | ingredient_name | ingredient_type |
|---|---|---|---|---|---|
| MEN-2563 | Extended Review | 12.87 | 1 | Extended Review | Protein |
| MEN-2563 | Extended Review | 12.87 | 2 | Pilot Initiative A | Dairy |
| MEN-2569 | Pilot Initiative A | 35.45 | 2 | Pilot Initiative A | Dairy |
| MEN-2569 | Pilot Initiative A | 35.45 | 3 | Baseline Model | Grain |
| MEN-2575 | Baseline Model | 29.24 | 3 | Baseline Model | Grain |
| MEN-2575 | Baseline Model | 29.24 | 4 | Distributed Cluster | Vegetable |
| MEN-2581 | Distributed Cluster | 29.99 | 4 | Distributed Cluster | Vegetable |
| MEN-2581 | Distributed Cluster | 29.99 | 1 | Extended Review | Protein |

The view `v_menu_item_ingredient_detail` joins `menu_items` with `ingredients` through the `items_ingredients` junction table, producing a denormalised row for each menu-item–ingredient pairing. It answers the question: "Which ingredients belong to which menu items?" For example, the row for menu item `MEN-2563` ("Extended Review") shows ingredient 1 ("Extended Review", type "Protein"), confirming that this protein ingredient is part of the "Extended Review" dish. The view surfaces the full ingredient profile alongside the dish name, price, and category, enabling a single-query lookup of recipe composition.

**View `v_menu_item_side_item`**

```sql
CREATE VIEW v_menu_item_side_item AS
SELECT a.menu_item_id, a.name, a.price, a.category, b.id AS item_id, b.side_item_id AS item_side_item_id, b.name AS item_name
FROM menu_items a JOIN side_items b ON a.side_item_id = b.id;
```

| menu_item_id | name | price | category | item_id | item_side_item_id | item_name |
|---|---|---|---|---|---|---|
| MEN-2563 | Extended Review | 12.87 | Mains | 100 | SID-2588 | Extended Review |
| MEN-2569 | Pilot Initiative A | 35.45 | Fruits & Grains | 101 | SID-2595 | Pilot Initiative A |
| MEN-2575 | Baseline Model | 29.24 | Sandwiches | 102 | SID-2602 | Baseline Model |
| MEN-2581 | Distributed Cluster | 29.99 | Avocado Toasts | 103 | SID-2609 | Distributed Cluster |

The view `v_menu_item_side_item` joins `menu_items` to `side_items` on the `side_item_id` foreign key, answering: "What side item accompanies each menu item?" The row for `MEN-2563` ("Extended Review", price 12.87) shows side item `SID-2588` ("Extended Review", price 12.87, included). The row for `MEN-2569` ("Pilot Initiative A", price 35.45) shows side item `SID-2595` ("Pilot Initiative A", price 35.45, not included). This view is useful for menu display and for verifying that every dish has an associated side.

**View `v_menu_item_preparation_method`**

```sql
CREATE VIEW v_menu_item_preparation_method AS
SELECT a.menu_item_id, a.name, a.price, a.category, b.method_id AS method_method_id, b.name AS method_name, b.cooking_temperature AS method_cooking_temperature
FROM menu_items a JOIN preparation_methods b ON a.method_id = b.method_id;
```

| menu_item_id | name | price | category | method_method_id | method_name | method_cooking_temperature |
|---|---|---|---|---|---|---|
| MEN-2563 | Extended Review | 12.87 | Mains | 209228 | Extended Review | 0.58 |
| MEN-2569 | Pilot Initiative A | 35.45 | Fruits & Grains | 7441161 | Pilot Initiative A | 1.05 |
| MEN-2575 | Baseline Model | 29.24 | Sandwiches | 89447 | Baseline Model | 0.4492872599999999 |
| MEN-2581 | Distributed Cluster | 29.99 | Avocado Toasts | 4180941 | Distributed Cluster | 0.28 |

The view `v_menu_item_preparation_method` joins `menu_items` to `preparation_methods` on `method_id`, answering: "How is each menu item prepared?" The row for `MEN-2563` ("Extended Review") reveals preparation method `209228` ("Extended Review") with a cooking temperature of 0.58 and duration of 17 minutes. The row for `MEN-2581` ("Distributed Cluster") shows method `4180941` ("Distributed Cluster") at temperature 0.28 and duration 41 minutes. This view consolidates dish metadata with its cooking instructions in a single result set.

**View `v_ingredient_menu_item`**

```sql
CREATE VIEW v_ingredient_menu_item AS
SELECT a.ingredient_id, a.name, a.type, a.is_allergen, b.menu_item_id AS item_menu_item_id, b.name AS item_name, b.price AS item_price
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| ingredient_id | name | type | is_allergen | item_menu_item_id | item_name | item_price |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Protein | false | MEN-2563 | Extended Review | 12.87 |
| 2 | Pilot Initiative A | Dairy | true | MEN-2569 | Pilot Initiative A | 35.45 |
| 3 | Baseline Model | Grain | false | MEN-2575 | Baseline Model | 29.24 |
| 4 | Distributed Cluster | Vegetable | true | MEN-2581 | Distributed Cluster | 29.99 |

The view `v_ingredient_menu_item` inverts the relationship, joining `ingredients` to `menu_items` to answer: "Which menu items use a given ingredient?" The row for ingredient 1 ("Extended Review", type "Protein") shows it is used in menu item `MEN-2563`. The row for ingredient 2 ("Pilot Initiative A", type "Dairy", allergen and seasonal) links to menu item `MEN-2569`. This perspective is valuable for allergen tracing and for identifying all dishes that contain a particular ingredient.

**View `v_ingredient_preparation_method`**

```sql
CREATE VIEW v_ingredient_preparation_method AS
SELECT a.ingredient_id, a.name, a.type, a.is_allergen, b.method_id AS method_method_id, b.name AS method_name, b.cooking_temperature AS method_cooking_temperature
FROM ingredients a JOIN preparation_methods b ON a.method_id = b.method_id;
```

| ingredient_id | name | type | is_allergen | method_method_id | method_name | method_cooking_temperature |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Protein | false | 209228 | Extended Review | 0.58 |
| 2 | Pilot Initiative A | Dairy | true | 7441161 | Pilot Initiative A | 1.05 |
| 3 | Baseline Model | Grain | false | 89447 | Baseline Model | 0.4492872599999999 |
| 4 | Distributed Cluster | Vegetable | true | 4180941 | Distributed Cluster | 0.28 |

The view `v_ingredient_preparation_method` joins `ingredients` to `preparation_methods`, answering: "Which preparation methods are associated with a given ingredient?" Ingredient 1 ("Extended Review", "Protein") is linked to method `209228` ("Extended Review", temperature 0.58, duration 17). Ingredient 4 ("Distributed Cluster", "Vegetable") is linked to method `4180941` ("Distributed Cluster", temperature 0.28, duration 41). This view supports cross-referencing ingredient requirements with cooking techniques.

**View `v_side_item_menu_item`**

```sql
CREATE VIEW v_side_item_menu_item AS
SELECT a.id, a.side_item_id, a.name, a.price, b.menu_item_id AS item_menu_item_id, b.name AS item_name, b.price AS item_price
FROM side_items a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | side_item_id | name | price | item_menu_item_id | item_name | item_price |
|---|---|---|---|---|---|---|
| 100 | SID-2588 | Extended Review | 12.87 | MEN-2563 | Extended Review | 12.87 |
| 101 | SID-2595 | Pilot Initiative A | 35.45 | MEN-2569 | Pilot Initiative A | 35.45 |
| 102 | SID-2602 | Baseline Model | 29.24 | MEN-2575 | Baseline Model | 29.24 |
| 103 | SID-2609 | Distributed Cluster | 29.99 | MEN-2581 | Distributed Cluster | 29.99 |

The view `v_side_item_menu_item` joins `side_items` to `menu_items`, answering: "Which menu items are paired with a given side item?" The row for side item `SID-2588` ("Extended Review", included) shows it is paired with menu item `MEN-2563`. The row for side item `SID-2595` ("Pilot Initiative A", not included) links to menu item `MEN-2569`. This view is useful for inventory planning and for understanding side-item distribution across the menu.

**View `v_side_item_ingredient_detail`**

```sql
CREATE VIEW v_side_item_ingredient_detail AS
SELECT a.id, a.side_item_id, a.name, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.type AS ingredient_type
FROM side_items a
  JOIN items_ingredients j ON j.side_item_id = a.id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| id | side_item_id | name | ingredient_ingredient_id | ingredient_name | ingredient_type |
|---|---|---|---|---|---|
| 100 | SID-2588 | Extended Review | 1 | Extended Review | Protein |
| 100 | SID-2588 | Extended Review | 2 | Pilot Initiative A | Dairy |
| 101 | SID-2595 | Pilot Initiative A | 2 | Pilot Initiative A | Dairy |
| 101 | SID-2595 | Pilot Initiative A | 3 | Baseline Model | Grain |
| 102 | SID-2602 | Baseline Model | 3 | Baseline Model | Grain |
| 102 | SID-2602 | Baseline Model | 4 | Distributed Cluster | Vegetable |
| 103 | SID-2609 | Distributed Cluster | 4 | Distributed Cluster | Vegetable |
| 103 | SID-2609 | Distributed Cluster | 1 | Extended Review | Protein |

The view `v_side_item_ingredient_detail` joins `side_items` to `ingredients`, answering: "What ingredients are associated with a given side item?" The row for side item `SID-2588` ("Extended Review") shows ingredient 1 ("Extended Review", type "Protein"). The row for side item `SID-2595` ("Pilot Initiative A") shows ingredient 2 ("Pilot Initiative A", type "Dairy"). This view provides a side-item-centric view of ingredient composition.

**View `v_preparation_method_ingredient_detail`**

```sql
CREATE VIEW v_preparation_method_ingredient_detail AS
SELECT a.method_id, a.name, a.cooking_temperature, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.type AS ingredient_type
FROM preparation_methods a
  JOIN methods_ingredients j ON j.method_id = a.method_id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| method_id | name | cooking_temperature | ingredient_ingredient_id | ingredient_name | ingredient_type |
|---|---|---|---|---|---|
| 209228 | Extended Review | 0.58 | 1 | Extended Review | Protein |
| 209228 | Extended Review | 0.58 | 2 | Pilot Initiative A | Dairy |
| 7441161 | Pilot Initiative A | 1.05 | 2 | Pilot Initiative A | Dairy |
| 7441161 | Pilot Initiative A | 1.05 | 3 | Baseline Model | Grain |
| 89447 | Baseline Model | 0.4492872599999999 | 3 | Baseline Model | Grain |
| 89447 | Baseline Model | 0.4492872599999999 | 4 | Distributed Cluster | Vegetable |
| 4180941 | Distributed Cluster | 0.28 | 4 | Distributed Cluster | Vegetable |
| 4180941 | Distributed Cluster | 0.28 | 1 | Extended Review | Protein |

The view `v_preparation_method_ingredient_detail` joins `preparation_methods` to `ingredients`, answering: "Which ingredients are used in a given preparation method?" Method `209228` ("Extended Review", temperature 0.58, duration 17) is associated with ingredient 1 ("Extended Review", type "Protein"). Method `4180941` ("Distributed Cluster", temperature 0.28, duration 41) is associated with ingredient 4 ("Distributed Cluster", type "Vegetable"). This view supports technique-driven recipe analysis.

**View `v_preparation_method_menu_item`**

```sql
CREATE VIEW v_preparation_method_menu_item AS
SELECT a.method_id, a.name, a.cooking_temperature, a.cooking_duration, b.menu_item_id AS item_menu_item_id, b.name AS item_name, b.price AS item_price
FROM preparation_methods a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| method_id | name | cooking_temperature | cooking_duration | item_menu_item_id | item_name | item_price |
|---|---|---|---|---|---|---|
| 209228 | Extended Review | 0.58 | 17 | MEN-2563 | Extended Review | 12.87 |
| 7441161 | Pilot Initiative A | 1.05 | 25 | MEN-2569 | Pilot Initiative A | 35.45 |
| 89447 | Baseline Model | 0.4492872599999999 | 33 | MEN-2575 | Baseline Model | 29.24 |
| 4180941 | Distributed Cluster | 0.28 | 41 | MEN-2581 | Distributed Cluster | 29.99 |

The view `v_preparation_method_menu_item` joins `preparation_methods` to `menu_items`, answering: "Which menu items are prepared using a given method?" Method `209228` ("Extended Review") is used for menu item `MEN-2563` ("Extended Review", price 12.87, category "Mains"). Method `7441161` ("Pilot Initiative A") is used for menu item `MEN-2569` ("Pilot Initiative A", price 35.45, category "Fruits & Grains"). This view is useful for understanding cooking technique distribution across the menu.

**View `v_drink_variant_ingredient_detail`**

```sql
CREATE VIEW v_drink_variant_ingredient_detail AS
SELECT a.variant_id, a.name, a.base_alcohol, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.type AS ingredient_type
FROM drink_variants a
  JOIN variants_ingredients j ON j.variant_id = a.variant_id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| variant_id | name | base_alcohol | ingredient_ingredient_id | ingredient_name | ingredient_type |
|---|---|---|---|---|---|
| 790490 | Extended Review | distributed-base-54 | 1 | Extended Review | Protein |
| 790490 | Extended Review | distributed-base-54 | 2 | Pilot Initiative A | Dairy |
| 937715 | Pilot Initiative A | baseline-base-55 | 2 | Pilot Initiative A | Dairy |
| 937715 | Pilot Initiative A | baseline-base-55 | 3 | Baseline Model | Grain |
| state_et_10 | Baseline Model | pilot-base-56 | 3 | Baseline Model | Grain |
| state_et_10 | Baseline Model | pilot-base-56 | 4 | Distributed Cluster | Vegetable |
| gd_taxc_1211 | Distributed Cluster | extended-base-57 | 4 | Distributed Cluster | Vegetable |
| gd_taxc_1211 | Distributed Cluster | extended-base-57 | 1 | Extended Review | Protein |

The view `v_drink_variant_ingredient_detail` joins `drink_variants` to `ingredients`, answering: "Which ingredients are used in a given drink variant?" Variant `790490` ("Extended Review", base alcohol "distributed-base-54", alcohol content 7.70) is associated with ingredient 1 ("Extended Review", type "Protein"). Variant `937715` ("Pilot Initiative A", base alcohol "baseline-base-55", alcohol content 10.40) is associated with ingredient 2 ("Pilot Initiative A", type "Dairy"). This view supports beverage recipe management.

**View `v_drink_variant_menu_item`**

```sql
CREATE VIEW v_drink_variant_menu_item AS
SELECT a.variant_id, a.name, a.base_alcohol, a.price, b.menu_item_id AS item_menu_item_id, b.name AS item_name, b.price AS item_price
FROM drink_variants a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| variant_id | name | base_alcohol | price | item_menu_item_id | item_name | item_price |
|---|---|---|---|---|---|---|
| 790490 | Extended Review | distributed-base-54 | 12.87 | MEN-2563 | Extended Review | 12.87 |
| 937715 | Pilot Initiative A | baseline-base-55 | 35.45 | MEN-2569 | Pilot Initiative A | 35.45 |
| state_et_10 | Baseline Model | pilot-base-56 | 29.24 | MEN-2575 | Baseline Model | 29.24 |
| gd_taxc_1211 | Distributed Cluster | extended-base-57 | 29.99 | MEN-2581 | Distributed Cluster | 29.99 |

The view `v_drink_variant_menu_item` joins `drink_variants` to `menu_items`, answering: "Which menu items are paired with a given drink variant?" Variant `790490` ("Extended Review") is paired with menu item `MEN-2563` ("Extended Review", price 12.87). Variant `937715` ("Pilot Initiative A") is paired with menu item `MEN-2569` ("Pilot Initiative A", price 35.45). This view is useful for beverage pairing and menu bundling.

**View `v_omelette_add_on_menu_item`**

```sql
CREATE VIEW v_omelette_add_on_menu_item AS
SELECT a.id, a.add_on_id, a.name, a.additional_cost, b.menu_item_id AS item_menu_item_id, b.name AS item_name, b.price AS item_price
FROM omelette_add_ons a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | add_on_id | name | additional_cost | item_menu_item_id | item_name | item_price |
|---|---|---|---|---|---|---|
| 100 | 4011 | Extended Review | 0.11 | MEN-2563 | Extended Review | 12.87 |
| 101 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 13.13 | MEN-2569 | Pilot Initiative A | 35.45 |
| 102 | 974918 | Baseline Model | 0.22 | MEN-2575 | Baseline Model | 29.24 |
| 103 | 884345 | Distributed Cluster | 9.99 | MEN-2581 | Distributed Cluster | 29.99 |

The view `v_omelette_add_on_menu_item` joins `omelette_add_ons` to `menu_items`, answering: "Which menu items offer a given omelette add-on?" Add-on `4011` ("Extended Review", category "Cheese", additional cost 0.11) is offered with menu item `MEN-2563` ("Extended Review", price 12.87). Add-on `68f46afd953b4de8824b596a1bff565c` ("Pilot Initiative A", category "Vegetable", additional cost 13.13) is offered with menu item `MEN-2569` ("Pilot Initiative A", price 35.45). This view supports add-on pricing and availability queries.

**View `v_omelette_add_on_ingredient`**

```sql
CREATE VIEW v_omelette_add_on_ingredient AS
SELECT a.id, a.add_on_id, a.name, a.additional_cost, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.type AS ingredient_type
FROM omelette_add_ons a JOIN ingredients b ON a.ingredient_id = b.ingredient_id;
```

| id | add_on_id | name | additional_cost | ingredient_ingredient_id | ingredient_name | ingredient_type |
|---|---|---|---|---|---|---|
| 100 | 4011 | Extended Review | 0.11 | 1 | Extended Review | Protein |
| 101 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 13.13 | 2 | Pilot Initiative A | Dairy |
| 102 | 974918 | Baseline Model | 0.22 | 3 | Baseline Model | Grain |
| 103 | 884345 | Distributed Cluster | 9.99 | 4 | Distributed Cluster | Vegetable |

The view `v_omelette_add_on_ingredient` joins `omelette_add_ons` to `ingredients`, answering: "Which ingredient is associated with a given omelette add-on?" Add-on `4011` ("Extended Review", category "Cheese") is linked to ingredient 1 ("Extended Review", type "Protein"). Add-on `68f46afd953b4de8824b596a1bff565c` ("Pilot Initiative A", category "Vegetable") is linked to ingredient 2 ("Pilot Initiative A", type "Dairy"). This view provides an ingredient-centric view of omelette add-ons, useful for allergen and dietary analysis.

### Synthesis

The schema models a restaurant menu domain through a carefully normalised set of base tables, junction tables, and denormalising views. The `menu_items` table serves as the central entity, with foreign keys to `side_items` and `preparation_methods` establishing one-to-one associations. The `ingredients` table, alongside the three junction tables (`items_ingredients`, `methods_ingredients`, `variants_ingredients`), supports many-to-many relationships between ingredients and menu items, preparation methods, and drink variants respectively. The `drink_variants` and `omelette_add_ons` tables capture domain-specific extensions—beverage composition and omelette customisation—each linked back to `menu_items`. The thirteen views reconstruct domain facts by joining these normalised tables, each view answering a specific question about the relationship between two entity types. For example, `v_menu_item_ingredient_detail` answers which ingredients belong to which dishes, while `v_ingredient_menu_item` answers the inverse. The design balances normalisation (avoiding data duplication) with query convenience (providing pre-joined views for common lookups), and the use of composite identifiers like `MEN-2563` and `SID-2588` alongside integer surrogates supports both human readability and referential integrity.