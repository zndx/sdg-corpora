## The Architecture of Happy Hour Promotions

A hospitality venue manages its happy hour promotions through a structured system of time-bound discount windows, menu items, and their underlying components. Each promotion defines a start and end time, a discount percentage, and an active status. Beverages and food items are catalogued with pricing, categorization, and sourcing information. The relationships between promotions and menu items are mediated through junction records, while ingredients and dipping sauces provide granular detail about each food offering. This chapter documents the entities, their attributes, and the analytical views that bring them together for operational decision-making.

**Table `happy_hour_specials`**

| id | start_time | end_time | discount_percentage | is_active | created_at |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 16.70 | true | 2025-01-01 00:14:00 |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 19.40 | false | 2025-02-06 03:14:00 |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 22.10 | true | 2025-03-11 06:14:00 |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 24.80 | false | 2025-04-16 09:14:00 |

The `happy_hour_specials` table establishes the temporal and financial framework for every promotion. Each row carries a unique identifier, a start time, an end time, a discount percentage, an active flag, and a creation timestamp. Promotion 1, for instance, opens at 14:42 on 27 March 2024 and closes at 13:27 on 26 February 2023, offering a 16.70 percent discount, and remains active. Promotion 2 runs from 21:59 on 11 August 2025 to 20:44 on 10 July 2024, carries a 19.40 percent discount, and is currently inactive. Promotion 3 spans from 04:16 on 22 January 2022 through 03:01 on 21 December 2025, applies a 22.10 percent discount, and is active. Promotion 4 begins at 11:33 on 6 June 2023 and ends at 10:18 on 5 May 2022, with a 24.80 percent discount, and is inactive. The creation timestamps range from 1 January 2025 to 16 April 2025, indicating when each promotion record was entered into the system.

**Table `beverages`**

| id | beverage_type | brand | volume | unit | price | happy_hour_special_id |
|---|---|---|---|---|---|---|
| 100 | craft_beer | Adobe Systems Inc | 9.45 | distributed-unit-18 | 12.87 | 1 |
| 101 | wine | Assicurazioni Generali | 11.90 | baseline-unit-19 | 35.45 | 2 |
| 102 | cocktail | LDAP First Name Field | 14.35 | pilot-unit-20 | 29.24 | 3 |
| 103 | craft_beer | National University of Singapore | 16.80 | extended-unit-21 | 29.99 | 4 |

Beverages are catalogued with their type, brand, volume, unit of measure, price, and an association to a happy hour promotion. The beverage catalog includes craft beers, wines, and cocktails. Beverage 100 is a craft beer from Adobe Systems Inc, with a volume of 9.45 distributed-unit-18, priced at 12.87, and linked to promotion 1. Beverage 101 is a wine from Assicurazioni Generali, volume 11.90 baseline-unit-19, priced at 35.45, and linked to promotion 2. Beverage 102 is a cocktail from LDAP First Name Field, volume 14.35 pilot-unit-20, priced at 29.24, and linked to promotion 3. Beverage 103 is a craft beer from National University of Singapore, volume 16.80 extended-unit-21, priced at 29.99, and linked to promotion 4. The price range spans from 12.87 to 35.45, reflecting the diversity of offerings across categories.

**Table `food_items`**

| food_item_id | name | category | price | serving_size | ingredients | happy_hour_special_id |
|---|---|---|---|---|---|---|
| 100 | Extended Review | small_plates | 12.87 | primary-serving-40 | regional-ingredie-42 | 1 |
| 101 | Pilot Initiative A | desserts | 35.45 | adaptive-serving-41 | legacy-ingredie-43 | 2 |
| 102 | Baseline Model | small_plates | 29.24 | distributed-serving-42 | compact-ingredie-44 | 3 |
| 103 | Distributed Cluster | desserts | 29.99 | baseline-serving-43 | composite-ingredie-45 | 4 |

Food items are organized by name, category, price, serving size, ingredient reference, and happy hour promotion association. The food catalog includes small plates and desserts. Item 100, named Extended Review, falls under small_plates, is priced at 12.87, has a primary-serving-40 serving size, references ingredient regional-ingredie-42, and is associated with promotion 1. Item 101, Pilot Initiative A, is a dessert priced at 35.45 with an adaptive-serving-41 serving size, references legacy-ingredie-43, and is tied to promotion 2. Item 102, Baseline Model, is a small plate priced at 29.24 with a distributed-serving-42 serving size, references compact-ingredie-44, and is linked to promotion 3. Item 103, Distributed Cluster, is a dessert priced at 29.99 with a baseline-serving-43 serving size, references composite-ingredie-45, and is associated with promotion 4.

**Table `ingredients`**

| ingredient_id | name | type | origin | food_item_id |
|---|---|---|---|---|
| 1 | Extended Review | protein | distributed-origin-66 | 100 |
| 2 | Pilot Initiative A | vegetable | baseline-origin-67 | 101 |
| 3 | Baseline Model | dairy | pilot-origin-68 | 102 |
| 4 | Distributed Cluster | spice | extended-origin-69 | 103 |

The `ingredients` table provides a breakdown of component ingredients for each food item. Each ingredient record carries an identifier, name, type, origin, and a foreign key to the food item it belongs to. Ingredient 1, named Extended Review, is classified as a protein of type distributed-origin-66 and is associated with food item 100. Ingredient 2, Pilot Initiative A, is a vegetable from baseline-origin-67, linked to food item 101. Ingredient 3, Baseline Model, is a dairy product from pilot-origin-68, connected to food item 102. Ingredient 4, Distributed Cluster, is a spice from extended-origin-69, tied to food item 103. The ingredient types span protein, vegetable, dairy, and spice, providing a categorical view of the food composition.

**Table `dipping_sauces`**

| dipping_sauce_id | name | flavor_profile | spiciness | food_item_id |
|---|---|---|---|---|
| 1 | Extended Review | baseline-flavor-19 | mild | 100 |
| 2 | Pilot Initiative A | pilot-flavor-20 | medium | 101 |
| 3 | Baseline Model | extended-flavor-21 | hot | 102 |
| 4 | Distributed Cluster | integrated-flavor-22 | mild | 103 |

Dipping sauces are paired with food items and characterized by their flavor profile and spiciness level. Sauce 1, named Extended Review, has a baseline-flavor-19 profile and a mild spiciness rating, and is associated with food item 100. Sauce 2, Pilot Initiative A, carries a pilot-flavor-20 profile with medium spiciness, linked to food item 101. Sauce 3, Baseline Model, features an extended-flavor-21 profile and hot spiciness, connected to food item 102. Sauce 4, Distributed Cluster, presents an integrated-flavor-22 profile with mild spiciness, and is tied to food item 103. The spiciness scale ranges from mild to hot, allowing customers to select sauces that match their preference.

**Table `specials_beverages`**

| happy_hour_special_id | beverage_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `specials_beverages` table serves as a junction between happy hour promotions and beverages, enabling many-to-many relationships. Promotion 1 includes beverages 100 and 101. Promotion 2 includes beverages 101 and 102. Promotion 3 includes beverages 102 and 103. Promotion 4 includes beverages 103 and 100. This structure allows a single beverage to participate in multiple promotions and a single promotion to feature multiple beverages. Beverage 100, for example, appears in both promotion 1 and promotion 4, while beverage 101 participates in promotions 1 and 2.

**Table `specials_items`**

| happy_hour_special_id | food_item_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `specials_items` table performs the same junction function for food items, linking happy hour promotions to food offerings. Promotion 1 includes food items 100 and 101. Promotion 2 includes food items 101 and 102. Promotion 3 includes food items 102 and 103. Promotion 4 includes food items 103 and 100. This mirrors the beverage association pattern, ensuring that each promotion can feature multiple food items and each food item can appear across multiple promotions.

**View `v_happy_hour_special_beverage_detail`**

```sql
CREATE VIEW v_happy_hour_special_beverage_detail AS
SELECT a.id, a.start_time, a.end_time, b.id AS beverage_id, b.beverage_type AS beverage_beverage_type, b.brand AS beverage_brand
FROM happy_hour_specials a
  JOIN specials_beverages j ON j.happy_hour_special_id = a.id
  JOIN beverages b ON b.id = j.beverage_id;
```

| id | start_time | end_time | beverage_id | beverage_beverage_type | beverage_brand |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | craft_beer | Adobe Systems Inc |
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 101 | wine | Assicurazioni Generali |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | wine | Assicurazioni Generali |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 102 | cocktail | LDAP First Name Field |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | cocktail | LDAP First Name Field |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 103 | craft_beer | National University of Singapore |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | craft_beer | National University of Singapore |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 100 | craft_beer | Adobe Systems Inc |

The view `v_happy_hour_special_beverage_detail` joins the happy hour specials with their associated beverages, producing a consolidated record that shows each promotion alongside the beverages it features. This view answers the operational question: which beverages are discounted during each happy hour window, and at what discount rate? Row 1 of the view shows promotion 1 (16.70 percent discount, active) paired with beverage 100 (craft beer from Adobe Systems Inc, priced at 12.87). Row 2 shows the same promotion 1 paired with beverage 101 (wine from Assicurazioni Generali, priced at 35.45). The view reveals that promotion 1 offers two beverages at the same discount rate, allowing customers to choose between a lower-priced craft beer and a higher-priced wine.

**View `v_happy_hour_special_food_item_detail`**

```sql
CREATE VIEW v_happy_hour_special_food_item_detail AS
SELECT a.id, a.start_time, a.end_time, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM happy_hour_specials a
  JOIN specials_items j ON j.happy_hour_special_id = a.id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| id | start_time | end_time | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | Extended Review | small_plates |
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 101 | Pilot Initiative A | desserts |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | Pilot Initiative A | desserts |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 102 | Baseline Model | small_plates |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | Baseline Model | small_plates |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 103 | Distributed Cluster | desserts |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | Distributed Cluster | desserts |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 100 | Extended Review | small_plates |

The view `v_happy_hour_special_food_item_detail` merges happy hour promotions with their associated food items, presenting each promotion alongside the food offerings it covers. This view addresses the question: which food items are available at a discount during each happy hour period, and what are their base prices? Row 1 of the view displays promotion 1 (16.70 percent discount, active) with food item 100 (Extended Review, small_plates category, priced at 12.87). Row 2 shows promotion 1 with food item 101 (Pilot Initiative A, desserts category, priced at 35.45). The view makes it clear that promotion 1 spans both a small plate and a dessert, giving customers a range of discounted options across categories.

**View `v_beverage_happy_hour_special`**

```sql
CREATE VIEW v_beverage_happy_hour_special AS
SELECT a.id, a.beverage_type, a.brand, a.volume, b.id AS special_id, b.start_time AS special_start_time, b.end_time AS special_end_time
FROM beverages a JOIN happy_hour_specials b ON a.happy_hour_special_id = b.id;
```

| id | beverage_type | brand | volume | special_id | special_start_time | special_end_time |
|---|---|---|---|---|---|---|
| 100 | craft_beer | Adobe Systems Inc | 9.45 | 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 |
| 101 | wine | Assicurazioni Generali | 11.90 | 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 |
| 102 | cocktail | LDAP First Name Field | 14.35 | 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 |
| 103 | craft_beer | National University of Singapore | 16.80 | 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 |

The view `v_beverage_happy_hour_special` inverts the perspective, organizing records by beverage and listing all the happy hour promotions in which each beverage participates. This view answers: for a given beverage, during which promotions is it discounted, and what are the terms of those promotions? Row 1 of the view shows beverage 100 (craft beer from Adobe Systems Inc, 12.87) appearing in promotion 1 (16.70 percent discount, active). Row 2 shows the same beverage 100 appearing in promotion 4 (24.80 percent discount, inactive). This dual appearance demonstrates that beverage 100 is featured in two separate promotions with different discount rates and active statuses, providing flexibility in how the venue schedules its beverage promotions.

**View `v_food_item_happy_hour_special`**

```sql
CREATE VIEW v_food_item_happy_hour_special AS
SELECT a.food_item_id, a.name, a.category, a.price, b.id AS special_id, b.start_time AS special_start_time, b.end_time AS special_end_time
FROM food_items a JOIN happy_hour_specials b ON a.happy_hour_special_id = b.id;
```

| food_item_id | name | category | price | special_id | special_start_time | special_end_time |
|---|---|---|---|---|---|---|
| 100 | Extended Review | small_plates | 12.87 | 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 |
| 101 | Pilot Initiative A | desserts | 35.45 | 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 |
| 102 | Baseline Model | small_plates | 29.24 | 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 |
| 103 | Distributed Cluster | desserts | 29.99 | 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 |

The view `v_food_item_happy_hour_special` similarly inverts the food-item perspective, listing all happy hour promotions associated with each food item. This view answers: for a given food item, which promotions include it, and what are the discount terms? Row 1 of the view shows food item 100 (Extended Review, small_plates, 12.87) in promotion 1 (16.70 percent discount, active). Row 2 shows the same food item 100 in promotion 4 (24.80 percent discount, inactive). The view reveals that food item 100 participates in two promotions, just as beverage 100 does, suggesting a coordinated approach to cross-promoting popular items across multiple discount windows.

**View `v_ingredient_food_item`**

```sql
CREATE VIEW v_ingredient_food_item AS
SELECT a.ingredient_id, a.name, a.type, a.origin, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM ingredients a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| ingredient_id | name | type | origin | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|---|
| 1 | Extended Review | protein | distributed-origin-66 | 100 | Extended Review | small_plates |
| 2 | Pilot Initiative A | vegetable | baseline-origin-67 | 101 | Pilot Initiative A | desserts |
| 3 | Baseline Model | dairy | pilot-origin-68 | 102 | Baseline Model | small_plates |
| 4 | Distributed Cluster | spice | extended-origin-69 | 103 | Distributed Cluster | desserts |

The view `v_ingredient_food_item` joins ingredients with their parent food items, producing a detailed record that shows each food item alongside its constituent ingredients. This view answers: what ingredients compose each food item, and how are those ingredients categorized? Row 1 of the view shows food item 100 (Extended Review, small_plates, 12.87) paired with ingredient 1 (Extended Review, protein type, distributed-origin-66). Row 2 shows food item 101 (Pilot Initiative A, desserts, 35.45) paired with ingredient 2 (Pilot Initiative A, vegetable type, baseline-origin-67). The view provides a transparent mapping from finished dishes to their component ingredients, supporting inventory management and allergen tracking.

**View `v_dipping_sauce_food_item`**

```sql
CREATE VIEW v_dipping_sauce_food_item AS
SELECT a.dipping_sauce_id, a.name, a.flavor_profile, a.spiciness, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM dipping_sauces a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| dipping_sauce_id | name | flavor_profile | spiciness | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|---|
| 1 | Extended Review | baseline-flavor-19 | mild | 100 | Extended Review | small_plates |
| 2 | Pilot Initiative A | pilot-flavor-20 | medium | 101 | Pilot Initiative A | desserts |
| 3 | Baseline Model | extended-flavor-21 | hot | 102 | Baseline Model | small_plates |
| 4 | Distributed Cluster | integrated-flavor-22 | mild | 103 | Distributed Cluster | desserts |

The view `v_dipping_sauce_food_item` joins dipping sauces with their associated food items, presenting each food item alongside its recommended sauce pairing. This view answers: which dipping sauce accompanies each food item, and what are the sauce's flavor and spiciness characteristics? Row 1 of the view shows food item 100 (Extended Review, small_plates, 12.87) paired with sauce 1 (Extended Review, baseline-flavor-19, mild spiciness). Row 2 shows food item 101 (Pilot Initiative A, desserts, 35.45) paired with sauce 2 (Pilot Initiative A, pilot-flavor-20, medium spiciness). The view enables customers and staff to understand the flavor pairing strategy, linking the spiciness of the sauce to the category and price of the food item it accompanies.