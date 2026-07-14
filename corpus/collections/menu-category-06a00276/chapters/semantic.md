## Ontology-Grounded Relational Modelling of a Restaurant Menu Domain

The restaurant menu domain captures the structured relationships between menu categories, food items, ingredients, cheese varieties, and side-dish substitution rules. At its core, the domain distinguishes between *menu-level* organisation (categories that group items for display) and *composition-level* detail (ingredients and cheese types that define what each food item contains). The relational schema materialises this distinction through a set of normalised base tables linked by foreign keys and junction tables, then reassembles domain facts via a family of views that join the normalised pieces back together. Every table and view in the schema is grounded in an ontology of menu entities, and the foreign-key constraints enforce the cardinality-bounded relationships that the ontology prescribes.

### Menu Categories and Food Items

The top-level organisational structure begins with the `menu_categories` table, which stores the display categories under which food items are grouped for customers. Each row carries a surrogate key `menu_category_id`, a human-readable `category_name`, a `display_order` that controls presentation sequence, and audit timestamps `created_at` and `updated_at`. The category names repeat across rows — for example, "Salads" appears as both `menu_category_id` 1 and 4 — reflecting the possibility that the same category label can be reused in different menu contexts. The `display_order` values range from 43 to 70, establishing a non-sequential but deterministic ordering.

**Table `menu_categories`**

| menu_category_id | category_name | display_order | created_at | updated_at |
|---|---|---|---|---|
| 1 | Salads | 43 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Sandwiches | 52 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Other Favorites | 61 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Salads | 70 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Food items are the central entities of the domain, stored in the `food_items` table. Each food item carries a rich set of attributes: a surrogate `food_item_id`, a descriptive `item_name`, a `base_price` (ranging from 12.72 to 18.59 in the sample data), a `serving_weight` in kilograms, and boolean flags `is_vegetarian` and `is_gluten_free` that encode dietary constraints. The `allergen_codes` column stores coded allergen information such as `extended-allergen-15` or `integrated-allergen-16`. Crucially, each food item also holds two foreign keys: `menu_category_id` and `cheese_type_id`, which link the item to its display category and its cheese variety respectively.

**Table `food_items`**

| food_item_id | item_name | base_price | serving_weight | is_vegetarian | is_gluten_free | allergen_codes | menu_category_id | cheese_type_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | true | true | extended-allergen-15 | 1 | 1 |
| 2 | Integrated Corridor | 12.87 | 1.48 | false | false | integrated-allergen-16 | 2 | 2 |
| 3 | Extended Series D | 17.41 | 0.635 | true | true | seasonal-allergen-17 | 3 | 3 |
| 4 | Pilot Assessment | 18.59 | 1.42 | false | false | regional-allergen-18 | 4 | 4 |

The foreign key `menu_category_id` in `food_items` points to `menu_categories.menu_category_id`, establishing a many-to-one relationship: multiple food items can belong to the same category, but each item references exactly one category row. The `cheese_type_id` foreign key similarly points to the `cheese_types` table, which is a small lookup table containing the four cheese varieties used in the domain.

**Table `cheese_types`**

| cheese_type_id | cheese_name |
|---|---|
| 1 | Cheddar |
| 2 | American |
| 3 | Swiss |
| 4 | Provolone |

### Ingredients and Their Taxonomy

The `food_ingredients` table models the ingredient ontology, where each ingredient is itself a food entity with boolean flags indicating its preparation state: `is_raw`, `is_cooked`, `is_condiment`, and `is_side_dish`. The sample data shows ingredients like "Pilot Assessment" and "Baseline Survey" with varying combinations of these flags. The column `is_subtype_of_food_ingredient_id` introduces a self-referential foreign key that creates a taxonomy hierarchy among ingredients — for instance, ingredient 1 ("Pilot Assessment") is a subtype of ingredient 1 itself, while ingredient 2 ("Baseline Survey") is a subtype of ingredient 2. This recursive relationship allows the ontology to express that certain ingredients are specialised forms of others.

**Table `food_ingredients`**

| food_ingredient_id | ingredient_name | is_raw | is_cooked | is_condiment | is_side_dish | is_subtype_of_food_ingredient_id |
|---|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | false | false | false | 1 |
| 2 | Baseline Survey | true | true | true | true | 2 |
| 3 | Distributed Corridor A | false | false | false | false | 3 |
| 4 | Adaptive Series | true | true | true | true | 4 |

### Side Dishes and Substitution Rules

Side dishes are modelled in the `side_dishes` table, which captures not only the side dish identity (`side_dish_id`, `side_name`) but also the business logic of substitution: `substitution_cost` indicates the price adjustment when a customer swaps one side for another, `is_default_side` marks the standard offering, and `food_item_id` links the side dish to the food item it accompanies. The column `substitutes_for_side_dish_id` creates a self-referential relationship, allowing one side dish to be defined as a substitute for another. In the sample data, each side dish substitutes for itself — for example, "Integrated Programme A" (`side_dish_id` 1) substitutes for `side_dish_id` 1 — which represents a baseline identity substitution before more complex rules are added.

**Table `side_dishes`**

| side_dish_id | side_name | substitution_cost | is_default_side | food_item_id | substitutes_for_side_dish_id |
|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | 1 |
| 2 | Extended Standard | 43.48 | false | 2 | 2 |
| 3 | Pilot Framework | 29.24 | true | 3 | 3 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | 4 |

### Junction Tables for Many-to-Many Relationships

The schema employs three junction tables to resolve many-to-many relationships that the ontology requires but cannot express through simple foreign keys. The `categories_items` table links `menu_categories` to `food_items`, allowing a single category to contain multiple food items and a single food item to appear in multiple categories. The sample data shows that food item 1 ("Seasonal Survey") appears in both category 1 ("Salads") and category 4 ("Salads"), demonstrating that the same item can be cross-listed across category instances.

**Table `categories_items`**

| menu_category_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `items_ingredients` table resolves the many-to-many relationship between food items and food ingredients, capturing which ingredients compose which food items. Similarly, the `ingredients_items` table provides another many-to-many linkage between food ingredients and food items, potentially representing a different semantic relationship such as ingredient usage in reverse or a secondary association.

**Table `items_ingredients`**

| food_item_id | food_ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `ingredients_items`**

| food_ingredient_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `types_items` table links `cheese_types` to `food_items`, providing an alternative or supplementary association between cheese varieties and food items beyond the direct foreign key in `food_items`. This junction table allows a cheese type to be associated with multiple food items and a food item to reference multiple cheese types, supporting scenarios where a dish might combine several cheese varieties.

**Table `types_items`**

| cheese_type_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### View-Based Reconstruction of Domain Facts

The views in this schema serve as denormalised projections that reconstruct domain facts from the normalised base tables. Each view answers a specific analytical question by joining the relevant tables and presenting the result as a single flat table.

The view `vw_menu_category_food_item_detail` joins `menu_categories` with `food_items` through the `categories_items` junction table, producing a flat view that shows each food item alongside its category name, display order, price, dietary flags, and allergen codes. This view answers the question: "What food items belong to each menu category, and what are their details?" Reading a concrete row, one would see that "Seasonal Survey" (food item 1, priced at 12.72) appears under the "Salads" category (category 1, display order 43), with vegetarian and gluten-free flags both set to true.

**View `vw_menu_category_food_item_detail`**

```sql
CREATE VIEW vw_menu_category_food_item_detail AS
SELECT a.menu_category_id, a.category_name, a.display_order, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM menu_categories a
  JOIN categories_items j ON j.menu_category_id = a.menu_category_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| menu_category_id | category_name | display_order | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|
| 1 | Salads | 43 | 1 | Seasonal Survey | 12.72 |
| 1 | Salads | 43 | 2 | Integrated Corridor | 12.87 |
| 2 | Sandwiches | 52 | 2 | Integrated Corridor | 12.87 |
| 2 | Sandwiches | 52 | 3 | Extended Series D | 17.41 |
| 3 | Other Favorites | 61 | 3 | Extended Series D | 17.41 |
| 3 | Other Favorites | 61 | 4 | Pilot Assessment | 18.59 |
| 4 | Salads | 70 | 4 | Pilot Assessment | 18.59 |
| 4 | Salads | 70 | 1 | Seasonal Survey | 12.72 |

The view `vw_food_item_menu_category` performs the inverse join, presenting food items with their associated menu categories. This view answers: "For each food item, which menu categories does it appear in?" A row from this view would show "Integrated Corridor" (food item 2) associated with category 2 ("Sandwiches"), confirming the cross-listing capability of the schema.

**View `vw_food_item_menu_category`**

```sql
CREATE VIEW vw_food_item_menu_category AS
SELECT a.food_item_id, a.item_name, a.base_price, a.serving_weight, b.menu_category_id AS category_menu_category_id, b.category_name AS category_category_name, b.display_order AS category_display_order
FROM food_items a JOIN menu_categories b ON a.menu_category_id = b.menu_category_id;
```

| food_item_id | item_name | base_price | serving_weight | category_menu_category_id | category_category_name | category_display_order |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | 1 | Salads | 43 |
| 2 | Integrated Corridor | 12.87 | 1.48 | 2 | Sandwiches | 52 |
| 3 | Extended Series D | 17.41 | 0.635 | 3 | Other Favorites | 61 |
| 4 | Pilot Assessment | 18.59 | 1.42 | 4 | Salads | 70 |

The view `vw_food_item_food_ingredient_detail` joins `food_items` with `food_ingredients` through the `items_ingredients` junction table, revealing the ingredient composition of each food item. This view answers: "What ingredients compose each food item, and what are their preparation states?" A sample row would show "Seasonal Survey" composed of "Pilot Assessment" (ingredient 1, not raw, not cooked), providing the detailed composition data needed for nutritional analysis or allergen tracking.

**View `vw_food_item_food_ingredient_detail`**

```sql
CREATE VIEW vw_food_item_food_ingredient_detail AS
SELECT a.food_item_id, a.item_name, a.base_price, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_raw AS ingredient_is_raw
FROM food_items a
  JOIN items_ingredients j ON j.food_item_id = a.food_item_id
  JOIN food_ingredients b ON b.food_ingredient_id = j.food_ingredient_id;
```

| food_item_id | item_name | base_price | ingredient_food_ingredient_id | ingredient_ingredient_name | ingredient_is_raw |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 1 | Pilot Assessment | false |
| 1 | Seasonal Survey | 12.72 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 12.87 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 12.87 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 17.41 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 17.41 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 18.59 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 18.59 | 1 | Pilot Assessment | false |

The view `vw_food_item_cheese_type` joins `food_items` with `cheese_types` through the `types_items` junction table, presenting each food item alongside its cheese variety. This view answers: "Which cheese type is associated with each food item?" A row would show "Seasonal Survey" paired with "Cheddar" (cheese type 1), confirming the cheese association that is also stored directly in the `food_items` table via the `cheese_type_id` foreign key.

**View `vw_food_item_cheese_type`**

```sql
CREATE VIEW vw_food_item_cheese_type AS
SELECT a.food_item_id, a.item_name, a.base_price, a.serving_weight, b.cheese_type_id AS type_cheese_type_id, b.cheese_name AS type_cheese_name
FROM food_items a JOIN cheese_types b ON a.cheese_type_id = b.cheese_type_id;
```

| food_item_id | item_name | base_price | serving_weight | type_cheese_type_id | type_cheese_name |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | 1 | Cheddar |
| 2 | Integrated Corridor | 12.87 | 1.48 | 2 | American |
| 3 | Extended Series D | 17.41 | 0.635 | 3 | Swiss |
| 4 | Pilot Assessment | 18.59 | 1.42 | 4 | Provolone |

The view `vw_food_ingredient_food_item_detail` joins `food_ingredients` with `food_items` through the `ingredients_items` junction table, presenting ingredients alongside the food items they compose. This view answers the inverse question: "For each ingredient, which food items contain it?" A row would show "Baseline Survey" (ingredient 2, which is raw, cooked, a condiment, and a side dish) associated with food item 2 ("Integrated Corridor"), providing a reverse-index for ingredient-based queries.

**View `vw_food_ingredient_food_item_detail`**

```sql
CREATE VIEW vw_food_ingredient_food_item_detail AS
SELECT a.food_ingredient_id, a.ingredient_name, a.is_raw, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM food_ingredients a
  JOIN ingredients_items j ON j.food_ingredient_id = a.food_ingredient_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| food_ingredient_id | ingredient_name | is_raw | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | 1 | Seasonal Survey | 12.72 |
| 1 | Pilot Assessment | false | 2 | Integrated Corridor | 12.87 |
| 2 | Baseline Survey | true | 2 | Integrated Corridor | 12.87 |
| 2 | Baseline Survey | true | 3 | Extended Series D | 17.41 |
| 3 | Distributed Corridor A | false | 3 | Extended Series D | 17.41 |
| 3 | Distributed Corridor A | false | 4 | Pilot Assessment | 18.59 |
| 4 | Adaptive Series | true | 4 | Pilot Assessment | 18.59 |
| 4 | Adaptive Series | true | 1 | Seasonal Survey | 12.72 |

The view `vw_food_ingredient_food_ingredient` joins `food_ingredients` with itself through the `items_ingredients` junction table, creating a self-referential view that reveals relationships between ingredients. This view answers: "How do ingredients relate to each other through their shared usage in food items?" A row would show "Pilot Assessment" (ingredient 1) related to "Baseline Survey" (ingredient 2) if they appear together in the same food item, exposing the co-occurrence structure of the ingredient ontology.

**View `vw_food_ingredient_food_ingredient`**

```sql
CREATE VIEW vw_food_ingredient_food_ingredient AS
SELECT a.food_ingredient_id, a.ingredient_name, a.is_raw, a.is_cooked, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_raw AS ingredient_is_raw
FROM food_ingredients a JOIN food_ingredients b ON a.is_subtype_of_food_ingredient_id = b.food_ingredient_id;
```

| food_ingredient_id | ingredient_name | is_raw | is_cooked | ingredient_food_ingredient_id | ingredient_ingredient_name | ingredient_is_raw |
|---|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | false | 1 | Pilot Assessment | false |
| 2 | Baseline Survey | true | true | 2 | Baseline Survey | true |
| 3 | Distributed Corridor A | false | false | 3 | Distributed Corridor A | false |
| 4 | Adaptive Series | true | true | 4 | Adaptive Series | true |

The view `vw_cheese_type_food_item_detail` joins `cheese_types` with `food_items` through the `types_items` junction table, presenting cheese varieties alongside the food items that use them. This view answers: "Which food items use each cheese type?" A row would show "Cheddar" (cheese type 1) associated with "Seasonal Survey" (food item 1, priced at 12.72), providing a cheese-centric perspective on the menu.

**View `vw_cheese_type_food_item_detail`**

```sql
CREATE VIEW vw_cheese_type_food_item_detail AS
SELECT a.cheese_type_id, a.cheese_name, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM cheese_types a
  JOIN types_items j ON j.cheese_type_id = a.cheese_type_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| cheese_type_id | cheese_name | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|
| 1 | Cheddar | 1 | Seasonal Survey | 12.72 |
| 1 | Cheddar | 2 | Integrated Corridor | 12.87 |
| 2 | American | 2 | Integrated Corridor | 12.87 |
| 2 | American | 3 | Extended Series D | 17.41 |
| 3 | Swiss | 3 | Extended Series D | 17.41 |
| 3 | Swiss | 4 | Pilot Assessment | 18.59 |
| 4 | Provolone | 4 | Pilot Assessment | 18.59 |
| 4 | Provolone | 1 | Seasonal Survey | 12.72 |

The view `vw_side_dish_food_item` joins `side_dishes` with `food_items`, presenting each side dish alongside its associated food item. This view answers: "Which side dish accompanies each food item, and what are the substitution details?" A row would show "Integrated Programme A" (side dish 1, with a substitution cost of 37.54 and marked as the default side) associated with "Seasonal Survey" (food item 1), providing the complete side-dish context for menu planning.

**View `vw_side_dish_food_item`**

```sql
CREATE VIEW vw_side_dish_food_item AS
SELECT a.side_dish_id, a.side_name, a.substitution_cost, a.is_default_side, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM side_dishes a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| side_dish_id | side_name | substitution_cost | is_default_side | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | Seasonal Survey | 12.72 |
| 2 | Extended Standard | 43.48 | false | 2 | Integrated Corridor | 12.87 |
| 3 | Pilot Framework | 29.24 | true | 3 | Extended Series D | 17.41 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | Pilot Assessment | 18.59 |

The view `vw_side_dish_side_dish` joins `side_dishes` with itself through the `substitutes_for_side_dish_id` self-referential relationship, revealing the substitution hierarchy among side dishes. This view answers: "Which side dish substitutes for which other side dish?" A row would show "Integrated Programme A" (side dish 1) substituting for "Integrated Programme A" (side dish 1), representing the identity substitution that serves as the base case before more complex substitution rules are layered in.

**View `vw_side_dish_side_dish`**

```sql
CREATE VIEW vw_side_dish_side_dish AS
SELECT a.side_dish_id, a.side_name, a.substitution_cost, a.is_default_side, b.side_dish_id AS dish_side_dish_id, b.side_name AS dish_side_name, b.substitution_cost AS dish_substitution_cost
FROM side_dishes a JOIN side_dishes b ON a.substitutes_for_side_dish_id = b.side_dish_id;
```

| side_dish_id | side_name | substitution_cost | is_default_side | dish_side_dish_id | dish_side_name | dish_substitution_cost |
|---|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | Integrated Programme A | 37.54 |
| 2 | Extended Standard | 43.48 | false | 2 | Extended Standard | 43.48 |
| 3 | Pilot Framework | 29.24 | true | 3 | Pilot Framework | 29.24 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | Baseline Protocol D | 32.21 |

### Synthesis

The restaurant menu schema demonstrates how an ontology of menu entities — categories, food items, ingredients, cheese types, and side dishes — materialises as a normalised relational structure. The base tables enforce entity integrity through surrogate keys and capture relationships through foreign keys and junction tables. The views then reconstruct domain facts by joining these normalised pieces, each view answering a specific analytical question about the menu domain. The schema's design reflects the cardinality-bounded relationships of the ontology: many-to-many relationships are resolved through junction tables, self-referential relationships enable taxonomies and substitution hierarchies, and the combination of direct foreign keys and junction tables provides both simplicity and flexibility. The sample data, with its fictional organisations and products, illustrates how the schema handles real-world complexity — repeated category names, cross-listed food items, and multi-flagged ingredients — while maintaining referential integrity through the foreign-key constraints that bind the tables together.