The domain under examination is a restaurant menu and pricing system, where food items are organized into categories, composed from ingredients, and priced through tiers that may include optional add-ons and bread selections. The ontology behind this domain distinguishes six core entity types—menu categories, menu items, food ingredients, pricing tiers, pricing add-ons, and bread types—along with two associative entities that resolve many-to-many relationships between categories and items, and between items and ingredients. Each entity type materializes as a base table whose columns correspond to the entity's attributes, while foreign keys encode the cardinality-bounded relationships that bind the model together. Views then join these normalized tables to reconstruct domain facts for reporting and application logic.

## Menu Categories and Menu Items

The `menu_categories` table stores the top-level groupings under which food items are organized. Its primary key is `category_code`, a short string such as `breakfast`, `brunch`, `sandwich`, or `salad_and_soup`. Each category carries a human-readable `category_label`—for instance, "Distributed Cluster" for `breakfast` and "Adaptive Review D" for `brunch`—along with temporal bounds `availability_start` and `availability_end` that define the window during which the category is active. The earliest recorded start date in the data is `2022-09-03T20:36:00` for the breakfast category, while the latest end date extends to `2025-12-18T17:51:00` for the salad_and_soup category.

**Table `menu_categories`**

| category_code | category_label | availability_start | availability_end |
|---|---|---|---|
| breakfast | Distributed Cluster | 2022-09-03T20:36:00 | 2022-09-12T20:00:00 |
| brunch | Adaptive Review D | 2023-02-14T03:53:00 | 2023-02-23T03:17:00 |
| sandwich | Primary Initiative | 2024-07-25T10:10:00 | 2024-07-07T10:34:00 |
| salad_and_soup | Composite Model | 2025-12-09T17:27:00 | 2025-12-18T17:51:00 |

The `menu_items` table is the central entity of the domain. Each row represents a distinct food product identified by `item_code`, a composite key such as `ITE-2446` or `ITE-2452`. The `item_name` column holds the display name—"Seasonal Survey" for `ITE-2446`, "Integrated Corridor" for `ITE-2452"—while `base_price` records the standard price point, ranging from `12.72` to `18.59` in the sample data. Boolean flags `is_vegetarian`, `is_vegan`, and `is_gluten_free` capture dietary attributes; for example, `ITE-2446` is both vegetarian and gluten-free but not vegan, whereas `ITE-2452` is vegan but neither vegetarian nor gluten-free. The `serving_style` column describes how the item is presented, with values like `cup`, `bowl`, `whole`, and `half`.

The critical structural relationship in `menu_items` is the `category_code` column, which is a foreign key referencing `menu_categories.category_code`. This enforces that every menu item belongs to exactly one category. In the data, `ITE-2446` (Seasonal Survey) is assigned to `breakfast`, `ITE-2452` (Integrated Corridor) to `brunch`, `ITE-2458` (Extended Series D) to `sandwich`, and `ITE-2464` (Pilot Assessment) to `salad_and_soup`. The cardinality is one-to-many: a single category can contain many items, but an item belongs to only one category.

**Table `menu_items`**

| item_code | item_name | base_price | is_vegetarian | is_vegan | is_gluten_free | serving_style | category_code |
|---|---|---|---|---|---|---|---|
| ITE-2446 | Seasonal Survey | 12.72 | true | false | true | cup | breakfast |
| ITE-2452 | Integrated Corridor | 12.87 | false | true | false | bowl | brunch |
| ITE-2458 | Extended Series D | 17.41 | true | false | true | whole | sandwich |
| ITE-2464 | Pilot Assessment | 18.59 | false | true | false | half | salad_and_soup |

## Associative Entities: Categories and Ingredients

The `categories_items` table exists as a junction table to resolve the many-to-many relationship between `menu_categories` and `menu_items`. Although the `menu_items` table already carries a `category_code` foreign key suggesting a direct one-to-many link, the presence of `categories_items` indicates that the ontology allows an item to be associated with multiple categories through this associative entity. The table's columns encode the composite relationship, with foreign keys pointing to both `menu_categories.category_code` and `menu_items.item_code`.

**Table `categories_items`**

| category_code | item_code |
|---|---|
| breakfast | ITE-2446 |
| breakfast | ITE-2452 |
| brunch | ITE-2452 |
| brunch | ITE-2458 |
| sandwich | ITE-2458 |
| sandwich | ITE-2464 |
| salad_and_soup | ITE-2464 |
| salad_and_soup | ITE-2446 |

Similarly, the `items_ingredients` table resolves the many-to-many relationship between `menu_items` and `food_ingredients`. While the `food_ingredients` table includes an `item_code` column that could suggest a direct foreign key, the junction table `items_ingredients` provides the canonical associative structure, allowing an ingredient to appear in multiple items and an item to contain multiple ingredients.

**Table `items_ingredients`**

| item_code | food_ingredient_id |
|---|---|
| ITE-2446 | 100 |
| ITE-2446 | 101 |
| ITE-2452 | 101 |
| ITE-2452 | 102 |
| ITE-2458 | 102 |
| ITE-2458 | 103 |
| ITE-2464 | 103 |
| ITE-2464 | 100 |

## Food Ingredients

The `food_ingredients` table captures the component substances that compose menu items. Its primary key is `id`, an integer such as `100`, `101`, `102`, or `103`. The `ingredient_code` column holds a UUID-style identifier—for example, `c7451d32-8fcc-11eb-924d-9cd76263cbd0` for the ingredient named "Pilot Assessment" (row 100). The `ingredient_name` column provides the human-readable label, which in the sample data coincidentally mirrors item names: "Pilot Assessment", "Baseline Survey", "Distributed Corridor A", and "Adaptive Series".

Dietary and allergen attributes are encoded as boolean columns: `is_protein`, `is_dairy`, and `is_gluten_source`. In the data, row 100 (Pilot Assessment) is marked as protein, dairy, and gluten source simultaneously, while row 101 (Baseline Survey) has none of these attributes. The `allergen_category` column records the specific allergen classification, with values including `none`, `dairy`, `gluten`, and `nuts`. Row 100 has `none`, row 101 has `dairy`, row 102 has `gluten`, and row 103 has `nuts`.

The `item_code` column is a foreign key referencing `menu_items.item_code`, establishing that each ingredient record is associated with a specific menu item. Row 100 links to `ITE-2446`, row 101 to `ITE-2452`, row 102 to `ITE-2458`, and row 103 to `ITE-2464`. Timestamp columns `created_at` and `updated_at` track the lifecycle of each ingredient record, with creation dates ranging from `2025-01-01` to `2025-04-16` and update dates lagging by approximately five days.

**Table `food_ingredients`**

| id | ingredient_code | ingredient_name | is_protein | is_dairy | is_gluten_source | allergen_category | item_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | c7451d32-8fcc-11eb-924d-9cd76263cbd0 | Pilot Assessment | true | true | true | none | ITE-2446 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | id_13 | Baseline Survey | false | false | false | dairy | ITE-2452 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2e55c2f2-8fcc-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | true | true | gluten | ITE-2458 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2002007020210 | Adaptive Series | false | false | false | nuts | ITE-2464 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Pricing Tiers and Pricing Add-ons

The `pricing_tiers` table models the pricing structure for menu items. Its primary key is `id`, and it carries `tier_code` and `tier_label` columns that identify and describe each pricing tier. The `price` column records the monetary value, ranging from `12.87` to `35.45` in the sample data. The `portion_size` column captures serving size with values like `half`, `whole`, and `cup`. The boolean `is_add_on` flag distinguishes base pricing from supplementary pricing.

The `item_code` column is a foreign key to `menu_items.item_code`, binding each pricing tier to a specific menu item. Row 100 (tier `7119779`, labeled "Seasonal Survey") applies to `ITE-2446` at a price of `12.87` with a `half` portion size and is marked as an add-on. Row 101 (tier `9424931`, labeled "Integrated Corridor") applies to `ITE-2452` at `35.45` with a `whole` portion size and is not an add-on.

The `addon_code` column in `pricing_tiers` is a foreign key referencing `pricing_addons.addon_code`, creating a relationship between pricing tiers and add-on products. This allows a pricing tier to be associated with a specific add-on, such as row 100 linking to addon `3012834` and row 102 linking to addon `IVC10`.

**Table `pricing_tiers`**

| id | tier_code | tier_label | price | portion_size | is_add_on | item_code | addon_code |
|---|---|---|---|---|---|---|---|
| 100 | 7119779 | Seasonal Survey | 12.87 | half | true | ITE-2446 | 3012834 |
| 101 | 9424931 | Integrated Corridor | 35.45 | whole | false | ITE-2452 | 17618 |
| 102 | 1889785 | Extended Series D | 29.24 | cup | true | ITE-2458 | IVC10 |
| 103 | 1186107 | Pilot Assessment | 29.99 | bowl | false | ITE-2464 | 209229 |

The `pricing_addons` table stores supplementary products that can be added to a menu item. Its primary key is `addon_code`, a string such as `3012834`, `17618`, `IVC10`, or `209229`. The `addon_name` column provides the display name—"Baseline Standard D" for `3012834`, "Distributed Framework" for `17618`. The `additional_cost` column records the extra charge, ranging from `0.11` to `13.13`. The `addon_type` column classifies the add-on, with values including `protein`, `cheese`, `vegetable`, and `sauce`.

The `item_code` column is a foreign key to `menu_items.item_code`, associating each add-on with a specific menu item. Row 100 (addon `3012834`, "Baseline Standard D") is linked to `ITE-2446` with an additional cost of `0.11` and type `protein`. Row 101 (addon `17618`, "Distributed Framework") is linked to `ITE-2452` with a cost of `13.13` and type `cheese`. The `created_at` timestamp records when the add-on was introduced.

**Table `pricing_addons`**

| addon_code | addon_name | additional_cost | addon_type | item_code | created_at |
|---|---|---|---|---|---|
| 3012834 | Baseline Standard D | 0.11 | protein | ITE-2446 | 2025-01-01 00:14:00 |
| 17618 | Distributed Framework | 13.13 | cheese | ITE-2452 | 2025-02-06 03:14:00 |
| IVC10 | Adaptive Protocol | 0.22 | vegetable | ITE-2458 | 2025-03-11 06:14:00 |
| 209229 | Primary Programme A | 9.99 | sauce | ITE-2464 | 2025-04-16 09:14:00 |

## Bread Types

The `bread_types` table captures the bread varieties available for menu items, particularly relevant for sandwich and brunch items. Its primary key is `bread_type_id`, an integer such as `100` through `103`. The `bread_code` column holds a numeric identifier like `3355775` or `9085261`, while `bread_name` provides the human-readable label—"Regional Series" for `3355775`, "Seasonal Assessment D" for `9085261`.

Dietary attributes are encoded as booleans: `is_house_made`, `is_gluten_free`, and `is_vegan`. Row 100 (bread `3355775`, "Regional Series") is house-made and gluten-free but not vegan. Row 101 (bread `9085261`, "Seasonal Assessment D") is not house-made, not gluten-free, but is vegan. The `item_code` column is a foreign key to `menu_items.item_code`, binding each bread type to a specific menu item. Row 100 links to `ITE-2446`, row 101 to `ITE-2452`, row 102 to `ITE-2458`, and row 103 to `ITE-2464`.

**Table `bread_types`**

| bread_type_id | bread_code | bread_name | is_house_made | is_gluten_free | is_vegan | item_code |
|---|---|---|---|---|---|---|
| 100 | 3355775 | Regional Series | true | true | false | ITE-2446 |
| 101 | 9085261 | Seasonal Assessment D | false | false | true | ITE-2452 |
| 102 | 4716414 | Integrated Survey | true | true | false | ITE-2458 |
| 103 | 4180957 | Extended Corridor | false | false | true | ITE-2464 |

## Views: Reconstructing Domain Facts

Views in this schema join normalized base tables to present domain facts in a denormalized form suitable for reporting and application queries. Each view answers a specific question by combining data from two or more tables.

The view `v_menu_category_menu_item_detail` joins `menu_categories` with `menu_items` on the category relationship, producing a flat record that pairs each item with its category label and availability window. Reading a concrete row: `ITE-2446` (Seasonal Survey) appears alongside the category `breakfast` with label "Distributed Cluster" and availability from `2022-09-03T20:36:00` to `2022-09-12T20:00:00`. This view answers the question "What items belong to which category, and during what time is that category available?"

**View `v_menu_category_menu_item_detail`**

```sql
CREATE VIEW v_menu_category_menu_item_detail AS
SELECT a.category_code, a.category_label, a.availability_start, b.item_code AS item_item_code, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM menu_categories a
  JOIN categories_items j ON j.category_code = a.category_code
  JOIN menu_items b ON b.item_code = j.item_code;
```

| category_code | category_label | availability_start | item_item_code | item_item_name | item_base_price |
|---|---|---|---|---|---|
| breakfast | Distributed Cluster | 2022-09-03T20:36:00 | ITE-2446 | Seasonal Survey | 12.72 |
| breakfast | Distributed Cluster | 2022-09-03T20:36:00 | ITE-2452 | Integrated Corridor | 12.87 |
| brunch | Adaptive Review D | 2023-02-14T03:53:00 | ITE-2452 | Integrated Corridor | 12.87 |
| brunch | Adaptive Review D | 2023-02-14T03:53:00 | ITE-2458 | Extended Series D | 17.41 |
| sandwich | Primary Initiative | 2024-07-25T10:10:00 | ITE-2458 | Extended Series D | 17.41 |
| sandwich | Primary Initiative | 2024-07-25T10:10:00 | ITE-2464 | Pilot Assessment | 18.59 |
| salad_and_soup | Composite Model | 2025-12-09T17:27:00 | ITE-2464 | Pilot Assessment | 18.59 |
| salad_and_soup | Composite Model | 2025-12-09T17:27:00 | ITE-2446 | Seasonal Survey | 12.72 |

The view `v_menu_item_menu_category` performs the inverse join, presenting each menu item with its associated category information. A row for `ITE-2452` (Integrated Corridor) would show the category code `brunch` and its label "Adaptive Review D". This view is useful when the application needs to navigate from an item upward to its category context.

**View `v_menu_item_menu_category`**

```sql
CREATE VIEW v_menu_item_menu_category AS
SELECT a.item_code, a.item_name, a.base_price, a.is_vegetarian, b.category_code AS category_category_code, b.category_label AS category_category_label, b.availability_start AS category_availability_start
FROM menu_items a JOIN menu_categories b ON a.category_code = b.category_code;
```

| item_code | item_name | base_price | is_vegetarian | category_category_code | category_category_label | category_availability_start |
|---|---|---|---|---|---|---|
| ITE-2446 | Seasonal Survey | 12.72 | true | breakfast | Distributed Cluster | 2022-09-03T20:36:00 |
| ITE-2452 | Integrated Corridor | 12.87 | false | brunch | Adaptive Review D | 2023-02-14T03:53:00 |
| ITE-2458 | Extended Series D | 17.41 | true | sandwich | Primary Initiative | 2024-07-25T10:10:00 |
| ITE-2464 | Pilot Assessment | 18.59 | false | salad_and_soup | Composite Model | 2025-12-09T17:27:00 |

The view `v_menu_item_food_ingredient_detail` joins `menu_items` with `food_ingredients` on the item-ingredient relationship, producing a denormalized record that shows each ingredient alongside its parent item. A row for `ITE-2446` would display the ingredient "Pilot Assessment" (id `100`, code `c7451d32-8fcc-11eb-924d-9cd76263cbd0`) with its attributes: protein=true, dairy=true, gluten_source=true, allergen_category=none. This view answers "What ingredients compose a given menu item, and what are their dietary properties?"

**View `v_menu_item_food_ingredient_detail`**

```sql
CREATE VIEW v_menu_item_food_ingredient_detail AS
SELECT a.item_code, a.item_name, a.base_price, b.id AS ingredient_id, b.ingredient_code AS ingredient_ingredient_code, b.ingredient_name AS ingredient_ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.item_code = a.item_code
  JOIN food_ingredients b ON b.id = j.food_ingredient_id;
```

| item_code | item_name | base_price | ingredient_id | ingredient_ingredient_code | ingredient_ingredient_name |
|---|---|---|---|---|---|
| ITE-2446 | Seasonal Survey | 12.72 | 100 | c7451d32-8fcc-11eb-924d-9cd76263cbd0 | Pilot Assessment |
| ITE-2446 | Seasonal Survey | 12.72 | 101 | id_13 | Baseline Survey |
| ITE-2452 | Integrated Corridor | 12.87 | 101 | id_13 | Baseline Survey |
| ITE-2452 | Integrated Corridor | 12.87 | 102 | 2e55c2f2-8fcc-11eb-924d-9cd76263cbd0 | Distributed Corridor A |
| ITE-2458 | Extended Series D | 17.41 | 102 | 2e55c2f2-8fcc-11eb-924d-9cd76263cbd0 | Distributed Corridor A |
| ITE-2458 | Extended Series D | 17.41 | 103 | 2002007020210 | Adaptive Series |
| ITE-2464 | Pilot Assessment | 18.59 | 103 | 2002007020210 | Adaptive Series |
| ITE-2464 | Pilot Assessment | 18.59 | 100 | c7451d32-8fcc-11eb-924d-9cd76263cbd0 | Pilot Assessment |

The view `v_food_ingredient_menu_item` presents the same join from the ingredient's perspective, showing each food ingredient alongside its parent menu item. A row for ingredient id `101` (Baseline Survey) would display the associated item `ITE-2452` (Integrated Corridor). This view is useful for allergen tracing: "Given an ingredient, which menu items contain it?"

**View `v_food_ingredient_menu_item`**

```sql
CREATE VIEW v_food_ingredient_menu_item AS
SELECT a.id, a.ingredient_code, a.ingredient_name, a.is_protein, b.item_code AS item_item_code, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM food_ingredients a JOIN menu_items b ON a.item_code = b.item_code;
```

| id | ingredient_code | ingredient_name | is_protein | item_item_code | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 100 | c7451d32-8fcc-11eb-924d-9cd76263cbd0 | Pilot Assessment | true | ITE-2446 | Seasonal Survey | 12.72 |
| 101 | id_13 | Baseline Survey | false | ITE-2452 | Integrated Corridor | 12.87 |
| 102 | 2e55c2f2-8fcc-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | ITE-2458 | Extended Series D | 17.41 |
| 103 | 2002007020210 | Adaptive Series | false | ITE-2464 | Pilot Assessment | 18.59 |

The view `v_pricing_tier_menu_item` joins `pricing_tiers` with `menu_items`, presenting each pricing tier alongside its associated menu item. A row for tier id `100` (tier code `7119779`, labeled "Seasonal Survey") would show the item `ITE-2446` (Seasonal Survey) with a base price of `12.72` and a tier price of `12.87`. This view answers "What is the pricing structure for each menu item?"

**View `v_pricing_tier_menu_item`**

```sql
CREATE VIEW v_pricing_tier_menu_item AS
SELECT a.id, a.tier_code, a.tier_label, a.price, b.item_code AS item_item_code, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM pricing_tiers a JOIN menu_items b ON a.item_code = b.item_code;
```

| id | tier_code | tier_label | price | item_item_code | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 100 | 7119779 | Seasonal Survey | 12.87 | ITE-2446 | Seasonal Survey | 12.72 |
| 101 | 9424931 | Integrated Corridor | 35.45 | ITE-2452 | Integrated Corridor | 12.87 |
| 102 | 1889785 | Extended Series D | 29.24 | ITE-2458 | Extended Series D | 17.41 |
| 103 | 1186107 | Pilot Assessment | 29.99 | ITE-2464 | Pilot Assessment | 18.59 |

The view `v_pricing_tier_pricing_addon` joins `pricing_tiers` with `pricing_addons` on the addon relationship, producing a record that pairs each pricing tier with its associated add-on. A row for tier id `100` would display addon `3012834` (Baseline Standard D) with an additional cost of `0.11` and type `protein`. This view answers "Which add-ons are associated with each pricing tier?"

**View `v_pricing_tier_pricing_addon`**

```sql
CREATE VIEW v_pricing_tier_pricing_addon AS
SELECT a.id, a.tier_code, a.tier_label, a.price, b.addon_code AS addon_addon_code, b.addon_name AS addon_addon_name, b.additional_cost AS addon_additional_cost
FROM pricing_tiers a JOIN pricing_addons b ON a.addon_code = b.addon_code;
```

| id | tier_code | tier_label | price | addon_addon_code | addon_addon_name | addon_additional_cost |
|---|---|---|---|---|---|---|
| 100 | 7119779 | Seasonal Survey | 12.87 | 3012834 | Baseline Standard D | 0.11 |
| 101 | 9424931 | Integrated Corridor | 35.45 | 17618 | Distributed Framework | 13.13 |
| 102 | 1889785 | Extended Series D | 29.24 | IVC10 | Adaptive Protocol | 0.22 |
| 103 | 1186107 | Pilot Assessment | 29.99 | 209229 | Primary Programme A | 9.99 |

The view `v_pricing_addon_menu_item` joins `pricing_addons` with `menu_items`, presenting each add-on alongside its parent menu item. A row for addon `3012834` (Baseline Standard D) would show the item `ITE-2446` (Seasonal Survey) with an additional cost of `0.11` and type `protein`. This view answers "Given an add-on, which menu item does it supplement?"

**View `v_pricing_addon_menu_item`**

```sql
CREATE VIEW v_pricing_addon_menu_item AS
SELECT a.addon_code, a.addon_name, a.additional_cost, a.addon_type, b.item_code AS item_item_code, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM pricing_addons a JOIN menu_items b ON a.item_code = b.item_code;
```

| addon_code | addon_name | additional_cost | addon_type | item_item_code | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 3012834 | Baseline Standard D | 0.11 | protein | ITE-2446 | Seasonal Survey | 12.72 |
| 17618 | Distributed Framework | 13.13 | cheese | ITE-2452 | Integrated Corridor | 12.87 |
| IVC10 | Adaptive Protocol | 0.22 | vegetable | ITE-2458 | Extended Series D | 17.41 |
| 209229 | Primary Programme A | 9.99 | sauce | ITE-2464 | Pilot Assessment | 18.59 |

The view `v_bread_type_menu_item` joins `bread_types` with `menu_items`, presenting each bread type alongside its associated menu item. A row for bread type id `100` (bread code `3355775`, "Regional Series") would show the item `ITE-2446` (Seasonal Survey) with attributes: house-made=true, gluten-free=true, vegan=false. This view answers "What bread options are available for each menu item?"

**View `v_bread_type_menu_item`**

```sql
CREATE VIEW v_bread_type_menu_item AS
SELECT a.bread_type_id, a.bread_code, a.bread_name, a.is_house_made, b.item_code AS item_item_code, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM bread_types a JOIN menu_items b ON a.item_code = b.item_code;
```

| bread_type_id | bread_code | bread_name | is_house_made | item_item_code | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 100 | 3355775 | Regional Series | true | ITE-2446 | Seasonal Survey | 12.72 |
| 101 | 9085261 | Seasonal Assessment D | false | ITE-2452 | Integrated Corridor | 12.87 |
| 102 | 4716414 | Integrated Survey | true | ITE-2458 | Extended Series D | 17.41 |
| 103 | 4180957 | Extended Corridor | false | ITE-2464 | Pilot Assessment | 18.59 |

## Synthesis

The relational schema for this restaurant menu domain follows a clear normalization pattern: six base tables encode the core entity types and their attributes, two junction tables (`categories_items` and `items_ingredients`) resolve many-to-many relationships, and eight views join these tables to reconstruct domain facts for consumption. Foreign keys bind the model together—`menu_items.category_code` references `menu_categories`, `food_ingredients.item_code` references `menu_items`, `pricing_tiers.item_code` and `addon_code` reference `menu_items` and `pricing_addons` respectively, and `bread_types.item_code` references `menu_items`. Each view answers a specific analytical question by denormalizing the relevant join, allowing applications to query domain facts without manually constructing joins. The result is a schema that is both structurally sound—respecting first and second normal forms through proper foreign key relationships and associative entities—and practically useful through its view layer.