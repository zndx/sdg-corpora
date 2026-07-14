# The Architecture of a Restaurant Menu System

A modern restaurant menu is more than a list of dishes and prices; it is a structured network of ingredients, preparation techniques, accompaniments, and beverage pairings that must be tracked, queried, and reported with precision. The data model described here captures every facet of that network — from the base price of a mains dish to the allergen status of a single ingredient, from the cooking temperature of a preparation method to the alcohol content of a drink variant. Understanding how these records relate to one another is essential for menu engineering, cost control, dietary compliance, and operational reporting. The tables and views that follow form the backbone of this system, each serving a distinct role in the chain of information that flows from supplier to plate.

## Core Menu Records

At the heart of the system lies the menu items table, which serves as the primary catalog of every dish and beverage offered. Each record carries a unique identifier, a descriptive name, a price point, and a categorical classification. Boolean flags indicate whether an item contains alcohol or carries a spicy profile, enabling quick filtering for dietary preferences. The table also stores foreign keys linking each menu item to its default side item and its primary preparation method, anchoring the dish within the broader operational context.

**Table `menu_items`**

| menu_item_id | name | price | category | is_alcoholic | is_spicy | side_item_id | method_id |
|---|---|---|---|---|---|---|---|
| MEN-2563 | Extended Review | 12.87 | Mains | false | true | 100 | 209228 |
| MEN-2569 | Pilot Initiative A | 35.45 | Fruits & Grains | true | false | 101 | 7441161 |
| MEN-2575 | Baseline Model | 29.24 | Sandwiches | false | true | 102 | 89447 |
| MEN-2581 | Distributed Cluster | 29.99 | Avocado Toasts | true | false | 103 | 4180941 |

Consider the entry for "Extended Review" (MEN-2563), a mains dish priced at 12.87 that is marked as non-alcoholic but spicy. It is associated with side item 100 and preparation method 209228. In contrast, "Pilot Initiative A" (MEN-2569) falls under the Fruits & Grains category, carries a higher price of 35.45, is flagged as alcoholic, and links to side item 101 and method 7441161. These records establish the foundational layer upon which all ingredient and method relationships are built.

## Ingredients and Their Classifications

Ingredients form the atomic building blocks of every menu item. The ingredients table records each component with an identifier, a name, a type classification (such as Protein, Dairy, Grain, or Vegetable), and boolean flags for allergen status and seasonality. Crucially, each ingredient record also carries a foreign key to the menu item it belongs to and to the preparation method through which it is used. This dual linkage ensures that the system can answer questions about which ingredients appear in which dishes and under which cooking processes.

**Table `ingredients`**

| ingredient_id | name | type | is_allergen | is_seasonal | menu_item_id | method_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Protein | false | false | MEN-2563 | 209228 |
| 2 | Pilot Initiative A | Dairy | true | true | MEN-2569 | 7441161 |
| 3 | Baseline Model | Grain | false | false | MEN-2575 | 89447 |
| 4 | Distributed Cluster | Vegetable | true | true | MEN-2581 | 4180941 |

The ingredient named "Extended Review" (ID 1) is classified as a Protein, is not an allergen, and is not seasonal. It is linked to menu item MEN-2563 and preparation method 209228. Meanwhile, the ingredient "Pilot Initiative A" (ID 2) is a Dairy product, is flagged as both an allergen and seasonal, and connects to menu item MEN-2569 and method 7441161. The ingredient "Distributed Cluster" (ID 4) is a Vegetable allergen that is seasonal, tied to menu item MEN-2581 and method 4180941. These records make it possible to generate allergen warnings, track seasonal availability, and trace the composition of any dish.

## Side Items and Inclusion Logic

Side items represent the accompaniments that can be paired with a main dish. The side items table stores each side with its own identifier, name, price, and a boolean flag indicating whether the side is included in the base price of the menu item or must be purchased separately. The table links each side item to its parent menu item, creating a clear parent-child relationship that supports menu bundling and pricing calculations.

**Table `side_items`**

| id | side_item_id | name | price | is_included | menu_item_id |
|---|---|---|---|---|---|
| 100 | SID-2588 | Extended Review | 12.87 | true | MEN-2563 |
| 101 | SID-2595 | Pilot Initiative A | 35.45 | false | MEN-2569 |
| 102 | SID-2602 | Baseline Model | 29.24 | true | MEN-2575 |
| 103 | SID-2609 | Distributed Cluster | 29.99 | false | MEN-2581 |

Side item SID-2588, named "Extended Review," is priced at 12.87 and is marked as included with menu item MEN-2563. Side item SID-2595, "Pilot Initiative A," carries the same price of 35.45 but is not included, meaning it would be an add-on purchase for the associated menu item MEN-2569. Side item SID-2602, "Baseline Model," is included with MEN-2575, while SID-2609, "Distributed Cluster," is not included with MEN-2581. This inclusion flag is critical for accurate revenue reporting, as it distinguishes between revenue that is guaranteed with a main dish and revenue that is optional.

## Preparation Methods and Cooking Parameters

Preparation methods define how each dish is cooked. The preparation methods table records the method's identifier, name, cooking temperature, and cooking duration. Each method is linked to a specific menu item, establishing the canonical cooking process for that dish. The cooking temperature and duration fields provide the operational parameters that kitchen staff follow during preparation.

**Table `preparation_methods`**

| method_id | name | cooking_temperature | cooking_duration | menu_item_id |
|---|---|---|---|---|
| 209228 | Extended Review | 0.58 | 17 | MEN-2563 |
| 7441161 | Pilot Initiative A | 1.05 | 25 | MEN-2569 |
| 89447 | Baseline Model | 0.4492872599999999 | 33 | MEN-2575 |
| 4180941 | Distributed Cluster | 0.28 | 41 | MEN-2581 |

Method 209228, named "Extended Review," specifies a cooking temperature of 0.58 and a duration of 17 minutes for menu item MEN-2563. Method 7441161, "Pilot Initiative A," calls for a temperature of 1.05 and a duration of 25 minutes for MEN-2569. Method 89447, "Baseline Model," uses a temperature of approximately 0.45 and a duration of 33 minutes for MEN-2575. Method 4180941, "Distributed Cluster," operates at a temperature of 0.28 with the longest duration of 41 minutes for MEN-2581. These parameters ensure consistency across kitchen shifts and enable quality control audits.

## Drink Variants and Alcohol Tracking

For establishments serving beverages, the drink variants table captures the specifics of each drink offering. Each variant has a unique identifier, a name, a base alcohol type, a price, and an alcohol content measurement. The table links each variant to its parent menu item, allowing the system to track which drinks are available and their precise alcohol levels for compliance and responsible service.

**Table `drink_variants`**

| variant_id | name | base_alcohol | price | alcohol_content | menu_item_id |
|---|---|---|---|---|---|
| 790490 | Extended Review | distributed-base-54 | 12.87 | 7.70 | MEN-2563 |
| 937715 | Pilot Initiative A | baseline-base-55 | 35.45 | 10.40 | MEN-2569 |
| state_et_10 | Baseline Model | pilot-base-56 | 29.24 | 13.10 | MEN-2575 |
| gd_taxc_1211 | Distributed Cluster | extended-base-57 | 29.99 | 15.80 | MEN-2581 |

Variant 790490, "Extended Review," uses a base alcohol type of "distributed-base-54," is priced at 12.87, and has an alcohol content of 7.70, linked to menu item MEN-2563. Variant 937715, "Pilot Initiative A," uses "baseline-base-55," costs 35.45, has an alcohol content of 10.40, and connects to MEN-2569. Variant state_et_10, "Baseline Model," uses "pilot-base-56," costs 29.24, has an alcohol content of 13.10, and links to MEN-2575. Variant gd_taxc_1211, "Distributed Cluster," uses "extended-base-57," costs 29.99, has the highest alcohol content at 15.80, and connects to MEN-2581. These records support responsible alcohol service by providing exact content measurements for each variant.

## Omelette Add-Ons and Category Management

The omelette add-ons table captures optional extras that can be added to omelette-style dishes. Each add-on has an identifier, a name, an additional cost, a category classification (such as Cheese, Vegetable, Meat, or Premium), and links to both the parent menu item and the specific ingredient it represents. This dual linkage to a menu item and an ingredient enables precise cost tracking and allergen propagation.

**Table `omelette_add_ons`**

| id | add_on_id | name | additional_cost | category | menu_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | 4011 | Extended Review | 0.11 | Cheese | MEN-2563 | 1 |
| 101 | 68f46afd953b4de8824b596a1bff565c | Pilot Initiative A | 13.13 | Vegetable | MEN-2569 | 2 |
| 102 | 974918 | Baseline Model | 0.22 | Meat | MEN-2575 | 3 |
| 103 | 884345 | Distributed Cluster | 9.99 | Premium | MEN-2581 | 4 |

Add-on 4011, "Extended Review," costs an additional 0.11, falls under the Cheese category, is linked to menu item MEN-2563, and corresponds to ingredient ID 1. Add-on 68f46afd953b4de8824b596a1bff565c, "Pilot Initiative A," costs 13.13, is categorized as Vegetable, links to MEN-2569, and corresponds to ingredient ID 2. Add-on 974918, "Baseline Model," costs 0.22, is a Meat add-on for MEN-2575, and maps to ingredient ID 3. Add-on 884345, "Distributed Cluster," costs 9.99, is a Premium add-on for MEN-2581, and maps to ingredient ID 4. The wide range in additional costs — from 0.11 to 13.13 — reflects the diversity of premium ingredients available as upgrades.

## Cross-Reference Tables

Beyond the core entity tables, three cross-reference tables manage the many-to-many relationships between entities. The items_ingredients table records which ingredients are used in which menu items, the methods_ingredients table records which ingredients are used in which preparation methods, and the variants_ingredients table records which ingredients are used in which drink variants. These junction tables are the connective tissue of the system, enabling flexible composition without hardcoding relationships into the entity tables themselves.

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

The items_ingredients table allows a single menu item to reference multiple ingredients and a single ingredient to appear across multiple menu items. The methods_ingredients table similarly decouples ingredients from preparation methods, enabling a shared ingredient pool across different cooking techniques. The variants_ingredients table extends this pattern to drink variants, ensuring that every component of a beverage is traceable.

## Detailed Join Views

The system provides a suite of joined views that combine data from multiple tables into single, queryable result sets. Each view answers a specific operational question by bringing together related records.

### Menu Item to Ingredient Detail

The v_menu_item_ingredient_detail view joins menu items with their associated ingredients, producing a comprehensive record that includes the dish name, price, category, and all ingredient details such as type, allergen status, and seasonality.

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

This view answers the question: "What ingredients are in each menu item, and what are their properties?" For example, a row might show that menu item MEN-2563 ("Extended Review") contains ingredient ID 1 ("Extended Review"), which is a Protein, non-allergen, and non-seasonal. This view is essential for generating allergen menus and dietary guides.

### Menu Item to Side Item Detail

The v_menu_item_side_item view joins menu items with their associated side items, producing records that include the dish name, price, side item name, side item price, and the inclusion flag.

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

This view answers: "What side item accompanies each menu item, and is it included in the base price?" A row for MEN-2563 would show side item SID-2588 ("Extended Review") at 12.87, marked as included. A row for MEN-2569 would show side item SID-2595 ("Pilot Initiative A") at 35.45, marked as not included. This view supports pricing audits and menu bundling analysis.

### Menu Item to Preparation Method Detail

The v_menu_item_preparation_method view joins menu items with their preparation methods, producing records that include the dish name, price, method name, cooking temperature, and cooking duration.

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

This view answers: "How is each menu item prepared, and what are the cooking parameters?" A row for MEN-2563 would show method 209228 ("Extended Review") with a temperature of 0.58 and duration of 17 minutes. This view is critical for kitchen operations, quality assurance, and training documentation.

### Ingredient to Menu Item Detail

The v_ingredient_menu_item view reverses the perspective, joining ingredients with their associated menu items. This produces records that answer: "Which menu items use this ingredient?"

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

This view is useful for allergen impact analysis. If an ingredient is recalled or becomes unavailable, this view quickly identifies all menu items that would be affected.

### Ingredient to Preparation Method Detail

The v_ingredient_preparation_method view joins ingredients with their associated preparation methods, answering: "Under which cooking processes is this ingredient used?"

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

This view supports recipe standardization by showing how each ingredient is incorporated into different cooking techniques.

### Side Item to Menu Item Detail

The v_side_item_menu_item view joins side items with their parent menu items, providing a side-item-centric perspective on the same relationship captured by v_menu_item_side_item.

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

This view answers: "Which menu items are associated with each side item?" It is useful for inventory planning, as it shows the demand for each side item across the menu.

### Side Item to Ingredient Detail

The v_side_item_ingredient_detail view joins side items with their associated ingredients, answering: "What ingredients compose each side item?"

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

This view enables allergen tracking at the side item level, which is important because sides may contain different ingredients than their parent mains.

### Preparation Method to Ingredient Detail

The v_preparation_method_ingredient_detail view joins preparation methods with their associated ingredients, answering: "What ingredients are used in each preparation method?"

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

This view supports recipe development by showing the ingredient composition of each cooking process.

### Preparation Method to Menu Item Detail

The v_preparation_method_menu_item view joins preparation methods with their associated menu items, providing a method-centric perspective on the cooking process.

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

This view answers: "Which menu items use each preparation method?" It is useful for kitchen workflow optimization, as it groups dishes by their cooking requirements.

### Drink Variant to Ingredient Detail

The v_drink_variant_ingredient_detail view joins drink variants with their associated ingredients, answering: "What ingredients are in each drink variant?"

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

This view is essential for beverage allergen tracking and for understanding the composition of each drink offering.

### Drink Variant to Menu Item Detail

The v_drink_variant_menu_item view joins drink variants with their parent menu items, answering: "Which drink variants are associated with each menu item?"

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

This view supports beverage pairing recommendations and revenue analysis by linking drinks to their parent dishes.

### Omelette Add-On to Menu Item Detail

The v_omelette_add_on_menu_item view joins omelette add-ons with their parent menu items, answering: "What add-ons are available for each omelette dish, and what are their costs and categories?"

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

This view is critical for upselling analysis, as it shows the additional revenue potential of each add-on option.

### Omelette Add-On to Ingredient Detail

The v_omelette_add_on_ingredient view joins omelette add-ons with their associated ingredients, answering: "Which ingredient does each add-on represent?"

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

This view completes the traceability chain for omelette add-ons, linking the optional extra directly to its underlying ingredient for allergen and cost tracking.

## Synthesis

The data model presented here captures the full complexity of a restaurant menu system through a network of interconnected tables and views. The core entity tables — menu items, ingredients, side items, preparation methods, drink variants, and omelette add-ons — store the fundamental attributes of each offering. The cross-reference tables — items_ingredients, methods_ingredients, and variants_ingredients — manage the many-to-many relationships that make the system flexible and extensible. The twelve joined views provide specialized lenses through which operational questions can be answered, from allergen compliance to pricing audits to kitchen workflow optimization. Together, these records form a coherent and queryable representation of the menu ecosystem, enabling data-driven decisions across every aspect of restaurant operations.