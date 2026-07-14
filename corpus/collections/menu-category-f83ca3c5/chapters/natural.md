## The Menu Architecture of a Distributed Food Service

A modern food service operation manages its offerings through a structured system of categories, items, ingredients, pricing, and preparation details. Every dish on the menu is not merely a name and a price; it is a composite record that ties together categorical classification, dietary attributes, ingredient composition, pricing tiers, optional add-ons, and bread specifications. Understanding how these records interlock is essential for menu planning, cost control, allergen management, and customer-facing presentation. The domain revolves around six base tables and eight analytical views that together form the operational backbone of the menu system.

## Menu Categories and Item Classification

Every offering begins with a category. The `menu_categories` table defines the high-level groupings under which items are organized, each identified by a `category_code` and a human-readable `category_label`. Categories also carry temporal boundaries through `availability_start` and `availability_end` timestamps, enabling seasonal or time-limited rotations.

**Table `menu_categories`**

| category_code | category_label | availability_start | availability_end |
|---|---|---|---|
| breakfast | Distributed Cluster | 2022-09-03T20:36:00 | 2022-09-12T20:00:00 |
| brunch | Adaptive Review D | 2023-02-14T03:53:00 | 2023-02-23T03:17:00 |
| sandwich | Primary Initiative | 2024-07-25T10:10:00 | 2024-07-07T10:34:00 |
| salad_and_soup | Composite Model | 2025-12-09T17:27:00 | 2025-12-18T17:51:00 |

The `breakfast` category, labeled "Distributed Cluster," was available from September 3, 2022 through September 12, 2022. The `brunch` category ("Adaptive Review D") spanned February 14 to February 23, 2023. The `sandwich` category ("Primary Initiative") ran from July 25 to July 7, 2024, and the `salad_and_soup` category ("Composite Model") was scheduled from December 9 to December 18, 2025. These date ranges allow the operation to phase items in and out without deleting historical records.

Individual dishes are recorded in the `menu_items` table, where each row carries an `item_code`, a descriptive `item_name`, a `base_price`, and a set of boolean dietary flags: `is_vegetarian`, `is_vegan`, and `is_gluten_free`. The `serving_style` column indicates whether the item is served as a `cup`, `bowl`, `whole`, or `half` portion. Each item is linked to its parent category via the `category_code` foreign key.

**Table `menu_items`**

| item_code | item_name | base_price | is_vegetarian | is_vegan | is_gluten_free | serving_style | category_code |
|---|---|---|---|---|---|---|---|
| ITE-2446 | Seasonal Survey | 12.72 | true | false | true | cup | breakfast |
| ITE-2452 | Integrated Corridor | 12.87 | false | true | false | bowl | brunch |
| ITE-2458 | Extended Series D | 17.41 | true | false | true | whole | sandwich |
| ITE-2464 | Pilot Assessment | 18.59 | false | true | false | half | salad_and_soup |

Item `ITE-2446`, named "Seasonal Survey," is priced at $12.72, served in a cup, classified as vegetarian and gluten-free but not vegan, and belongs to the `breakfast` category. Item `ITE-2452`, "Integrated Corridor," costs $12.87, is served in a bowl, is vegan but not vegetarian or gluten-free, and falls under `brunch`. Item `ITE-2458`, "Extended Series D," is the most expensive at $17.41, served whole, vegetarian and gluten-free, and categorized as `sandwich`. Item `ITE-2464`, "Pilot Assessment," is priced at $18.59, served as a half portion, is vegan only, and belongs to `salad_and_soup`.

The `categories_items` table serves as the explicit join between categories and items, capturing the relationship in a dedicated record. This design supports scenarios where a single item might appear under multiple categories or where the association carries additional metadata beyond a simple foreign key.

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

## Ingredient Composition and Dietary Tracking

The `food_ingredients` table records the constituent components of each menu item. Each ingredient row carries a unique `id`, a UUID-based `ingredient_code`, a human-readable `ingredient_name`, and boolean flags for `is_protein`, `is_dairy`, and `is_gluten_source`. The `allergen_category` column classifies potential allergens, with values such as `none`, `dairy`, `gluten`, and `nuts`. The `item_code` foreign key ties each ingredient to its parent menu item, while `created_at` and `updated_at` timestamps track the ingredient's lifecycle.

**Table `food_ingredients`**

| id | ingredient_code | ingredient_name | is_protein | is_dairy | is_gluten_source | allergen_category | item_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | c7451d32-8fcc-11eb-924d-9cd76263cbd0 | Pilot Assessment | true | true | true | none | ITE-2446 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | id_13 | Baseline Survey | false | false | false | dairy | ITE-2452 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2e55c2f2-8fcc-11eb-924d-9cd76263cbd0 | Distributed Corridor A | true | true | true | gluten | ITE-2458 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2002007020210 | Adaptive Series | false | false | false | nuts | ITE-2464 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Ingredient record 100, identified by the code `c7451d32-8fcc-11eb-924d-9cd76263cbd0` and named "Pilot Assessment," is flagged as a protein, dairy, and gluten source with no allergen category. It is associated with item `ITE-2446` and was created on January 1, 2025. Ingredient 101, "Baseline Survey," carries the code `id_13`, is not a protein, dairy, or gluten source, but is categorized under `dairy` allergens; it belongs to item `ITE-2452`. Ingredient 102, "Distributed Corridor A," is a protein, dairy, and gluten source with a `gluten` allergen classification, linked to item `ITE-2458`. Ingredient 103, "Adaptive Series," is not a protein, dairy, or gluten source but carries a `nuts` allergen classification and is tied to item `ITE-2464`.

The `items_ingredients` table provides the explicit join between menu items and their ingredients, enabling many-to-many relationships where an ingredient may appear across multiple dishes or a single dish may reference multiple ingredient records.

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

## Pricing Tiers and Add-On Structure

Pricing in this system is managed through the `pricing_tiers` table, which defines price points for menu items under different conditions. Each tier record includes an `id`, a `tier_code`, a `tier_label`, a `price`, a `portion_size` (such as `half`, `whole`, or `cup`), and a boolean `is_add_on` flag. The `item_code` foreign key links the tier to its menu item, while `addon_code` references an optional add-on.

**Table `pricing_tiers`**

| id | tier_code | tier_label | price | portion_size | is_add_on | item_code | addon_code |
|---|---|---|---|---|---|---|---|
| 100 | 7119779 | Seasonal Survey | 12.87 | half | true | ITE-2446 | 3012834 |
| 101 | 9424931 | Integrated Corridor | 35.45 | whole | false | ITE-2452 | 17618 |
| 102 | 1889785 | Extended Series D | 29.24 | cup | true | ITE-2458 | IVC10 |
| 103 | 1186107 | Pilot Assessment | 29.99 | bowl | false | ITE-2464 | 209229 |

Tier `7119779` ("Seasonal Survey") prices item `ITE-2446` at $12.87 for a half portion and is marked as an add-on, with associated add-on code `3012834`. Tier `9424931` ("Integrated Corridor") prices item `ITE-2452` at $35.45 for a whole portion and is not an add-on, linked to add-on code `17618`. Tier `1889785` ("Extended Series D") prices item `ITE-2458` at $29.24 for a cup portion, is an add-on, and references add-on code `IVC10`. Tier `1186107` ("Pilot Assessment") prices item `ITE-2464` at $29.99 for a bowl portion, is not an add-on, and references add-on code `209229`.

The `pricing_addons` table defines optional extras that customers can add to their orders. Each add-on has an `addon_code`, an `addon_name`, an `additional_cost`, an `addon_type` (such as `protein`, `cheese`, `vegetable`, or `sauce`), an `item_code` foreign key, and a `created_at` timestamp.

**Table `pricing_addons`**

| addon_code | addon_name | additional_cost | addon_type | item_code | created_at |
|---|---|---|---|---|---|
| 3012834 | Baseline Standard D | 0.11 | protein | ITE-2446 | 2025-01-01 00:14:00 |
| 17618 | Distributed Framework | 13.13 | cheese | ITE-2452 | 2025-02-06 03:14:00 |
| IVC10 | Adaptive Protocol | 0.22 | vegetable | ITE-2458 | 2025-03-11 06:14:00 |
| 209229 | Primary Programme A | 9.99 | sauce | ITE-2464 | 2025-04-16 09:14:00 |

Add-on `3012834`, "Baseline Standard D," costs an additional $0.11, is classified as a `protein`, and applies to item `ITE-2446`. Add-on `17618`, "Distributed Framework," costs $13.13, is a `cheese` type, and applies to item `ITE-2452`. Add-on `IVC10`, "Adaptive Protocol," costs $0.22, is a `vegetable` type, and applies to item `ITE-2458`. Add-on `209229`, "Primary Programme A," costs $9.99, is a `sauce` type, and applies to item `ITE-2464`.

## Bread Specifications

The `bread_types` table captures the bread or bread-like components used in menu items, particularly relevant for sandwich and similar preparations. Each row includes a `bread_type_id`, a `bread_code`, a `bread_name`, and three boolean flags: `is_house_made`, `is_gluten_free`, and `is_vegan`. The `item_code` foreign key links each bread type to its parent menu item.

**Table `bread_types`**

| bread_type_id | bread_code | bread_name | is_house_made | is_gluten_free | is_vegan | item_code |
|---|---|---|---|---|---|---|
| 100 | 3355775 | Regional Series | true | true | false | ITE-2446 |
| 101 | 9085261 | Seasonal Assessment D | false | false | true | ITE-2452 |
| 102 | 4716414 | Integrated Survey | true | true | false | ITE-2458 |
| 103 | 4180957 | Extended Corridor | false | false | true | ITE-2464 |

Bread type 100, code `3355775` and named "Regional Series," is house-made, gluten-free, but not vegan, and is associated with item `ITE-2446`. Bread type 101, code `9085261` and named "Seasonal Assessment D," is not house-made, not gluten-free, but is vegan, and applies to item `ITE-2452`. Bread type 102, code `4716414` and named "Integrated Survey," is house-made, gluten-free, and not vegan, linked to item `ITE-2458`. Bread type 103, code `4180957` and named "Extended Corridor," is not house-made, not gluten-free, but is vegan, and applies to item `ITE-2464`.

## Analytical Views

The system provides eight materialized views that join base tables to answer common operational questions. Each view flattens the relational structure into a single result set suitable for reporting, dashboarding, or customer-facing display.

The view `v_menu_category_menu_item_detail` joins menu categories with their items, producing a flat record that shows each item alongside its category label, availability window, base price, dietary flags, and serving style. This view answers the question: "What items belong to each category, and what are their full details?"

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

A representative row from this view would show item `ITE-2446` ("Seasonal Survey") with category label "Distributed Cluster," base price $12.72, vegetarian and gluten-free flags set to true, and serving style "cup." Another row would show item `ITE-2464` ("Pilot Assessment") with category label "Composite Model," base price $18.59, vegan flag set to true, and serving style "half."

The view `v_menu_item_menu_category` performs the inverse join, presenting each menu item with its associated category information. This view answers: "For a given item, what category does it belong to, and when is that category available?"

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

In this view, item `ITE-2452` ("Integrated Corridor") would appear with its category code `brunch`, category label "Adaptive Review D," and availability window from February 14, 2023 to February 23, 2023.

The view `v_menu_item_food_ingredient_detail` joins menu items with their ingredient records, producing a flat table that shows each item-ingredient pairing with full ingredient attributes including allergen classification. This view answers: "What ingredients compose each menu item, and what are their dietary properties?"

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

A row from this view would pair item `ITE-2446` ("Seasonal Survey") with ingredient "Pilot Assessment" (code `c7451d32-8fcc-11eb-924d-9cd76263cbd0`), showing that the ingredient is a protein, dairy, and gluten source with no allergen category. Another row would pair item `ITE-2464` ("Pilot Assessment") with ingredient "Adaptive Series," showing a `nuts` allergen classification.

The view `v_food_ingredient_menu_item` reverses this relationship, presenting each ingredient alongside its parent menu item. This view answers: "For a given ingredient, which menu items contain it?"

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

In this view, ingredient "Baseline Survey" (code `id_13`) would appear with its associated item `ITE-2452` ("Integrated Corridor"), base price $12.87, and the item's dietary flags.

The view `v_pricing_tier_menu_item` joins pricing tiers with their menu items, producing a flat record that shows each tier's price, portion size, add-on status, and the corresponding item details. This view answers: "What are the pricing options for each menu item?"

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

A row from this view would show item `ITE-2452` ("Integrated Corridor") with tier label "Integrated Corridor," price $35.45, portion size "whole," and `is_add_on` set to false. Another row would show item `ITE-2458` ("Extended Series D") with tier label "Extended Series D," price $29.24, portion size "cup," and `is_add_on` set to true.

The view `v_pricing_tier_pricing_addon` joins pricing tiers with their associated add-ons, producing a flat table that shows each tier alongside its add-on details including additional cost and add-on type. This view answers: "Which add-ons are available for each pricing tier, and what do they cost?"

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

In this view, tier `9424931` ("Integrated Corridor") would appear with add-on "Distributed Framework" (code `17618`), additional cost $13.13, and add-on type `cheese`.

The view `v_pricing_addon_menu_item` joins pricing add-ons with their parent menu items, producing a flat record that shows each add-on alongside the item it modifies. This view answers: "For a given add-on, which menu item does it apply to, and what is the item's base price?"

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

A row from this view would show add-on "Primary Programme A" (code `209229`), additional cost $9.99, type `sauce`, applied to item `ITE-2464` ("Pilot Assessment") with base price $18.59.

The view `v_bread_type_menu_item` joins bread types with their parent menu items, producing a flat table that shows each bread specification alongside the item it belongs to. This view answers: "What bread options are available for each menu item, and what are their dietary properties?"

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

In this view, item `ITE-2446` ("Seasonal Survey") would appear with bread type "Regional Series" (code `3355775`), house-made flag true, gluten-free flag true, and vegan flag false. Another row would show item `ITE-2452` ("Integrated Corridor") with bread type "Seasonal Assessment D," house-made flag false, gluten-free flag false, and vegan flag true.

## Synthesis

The menu system described here is a relational model that separates concerns into distinct tables while providing analytical views that reassemble the data for practical use. Categories organize items temporally and thematically. Ingredients track composition and allergens at the item level. Pricing tiers and add-ons capture the financial structure, including portion-based variations and optional extras. Bread types provide preparation-specific details for relevant items. The eight views flatten these relationships into queryable result sets, each answering a specific operational question. Together, the base tables and views form a complete record of the food service's menu architecture, supporting everything from kitchen operations to customer-facing menus to cost analysis.