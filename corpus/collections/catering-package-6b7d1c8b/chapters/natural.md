## Catering Operations and Menu Architecture

The catering industry operates at the intersection of culinary preparation, inventory management, and order fulfillment. A catering organization must coordinate three distinct layers of information: the packages offered to clients, the individual food items that compose those packages, and the underlying ingredients and sauces that define each dish. Every order line ties these layers together, recording what was selected, in what quantity, and at what price. The records in this system capture that full chain of relationships, from the high-level package down to the specific sauce chosen for a given order.

**Table `catering_packages`**

| catering_package_id | package_id | title | base_price | epic_price | serves_count | status | menu_food_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424918 | Compact Initiative | 12.72 | 12.34 | 45 | available | 1 |
| 2 | account_pymes_1044 | Legacy Model | 12.87 | 19.97 | 31 | sold_out | 2 |
| 3 | 5844275 | Regional Cluster A | 17.41 | 27.02 | 0 | discontinued | 3 |
| 4 | 2106710 | Seasonal Review | 18.59 | 36.43 | 5 | available | 4 |

Catering packages form the top-level commercial offering. Each package carries a unique identifier, a human-readable title, and two pricing tiers: a base price and an epic price, the latter typically reflecting an upgraded or premium configuration. The `serves_count` column indicates the number of guests a package is designed to accommodate, while `status` tracks its availability. In the current dataset, the "Compact Initiative" (package 1) is priced at 12.72 for the base tier and 12.34 for the epic tier, serving 45 guests and marked as available. By contrast, the "Legacy Model" (package 2) carries a base price of 12.87 but an inflated epic price of 19.97, and its status is `sold_out`. The "Regional Cluster A" (package 3) is discontinued, and the "Seasonal Review" (package 4) is available with a base price of 18.59 and an epic price of 36.43, serving only five guests. Each package is also associated with a `menu_food_item_id`, anchoring it to a specific food item in the menu catalog.

**Table `menu_food_items`**

| menu_food_item_id | item_id | name | category | unit_price | portion_size | is_gluten_free | is_vegetarian | served_with_menu_food_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | sandwich | 5,692 | 31 | true | true | 1 |
| 2 | ITE-2795 | Pilot Initiative A | wrap | 45,650 | 38 | false | false | 2 |
| 3 | ITE-2798 | Baseline Model | tender | 2,705 | 45 | true | true | 3 |
| 4 | ITE-2801 | Distributed Cluster | fish | 211.07 | 52 | false | false | 4 |

The menu food items table defines the individual dishes available across all packages. Each item has an internal identifier, a product-level `item_id` (such as ITE-2792), a descriptive name, and a category that classifies the dish type. The categories in the current data include sandwich, wrap, tender, and fish. Pricing is captured in `unit_price`, and `portion_size` provides a numeric measure of serving size. Boolean flags `is_gluten_free` and `is_vegetarian` indicate dietary attributes. The "Extended Review" (item 1) is a sandwich priced at 5,692 per unit, with a portion size of 31, and is both gluten-free and vegetarian. The "Pilot Initiative A" (item 2) is a wrap priced at 45,650, with a portion size of 38, and is neither gluten-free nor vegetarian. The "Baseline Model" (item 3) is a tender priced at 2,705, also gluten-free and vegetarian, while the "Distributed Cluster" (item 4) is a fish dish priced at 211.07 with a portion size of 52.

**Table `ingredients`**

| id | ingredient_id | name | type | certification | is_allergen |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | USDA Certified Black Angus | false |
| 1001 | 5844284 | Pilot Initiative A | cheese | none | true |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | vegetable | USDA Certified Black Angus | false |
| 1003 | 2087735 | Distributed Cluster | condiment | none | true |

Ingredients represent the foundational components used to prepare menu food items. Each ingredient record includes a unique identifier, a product-level `ingredient_id`, a name, a type classification, a certification field, and an allergen flag. The types observed in the dataset are protein, cheese, vegetable, and condiment. The "Extended Review" ingredient (id 1000) is classified as a protein with a USDA Certified Black Angus designation and is not marked as an allergen. The "Pilot Initiative A" ingredient (id 1001) is a cheese type and is flagged as an allergen. The "Baseline Model" ingredient (id 1002) is a vegetable, also USDA Certified Black Angus, and not an allergen. The "Distributed Cluster" ingredient (id 1003) is a condiment and is flagged as an allergen.

**Table `sauces`**

| id | sauce_id | name | is_homemade | spice_level |
|---|---|---|---|---|
| 100 | 4985159 | Extended Review | false | mild |
| 101 | 1186095 | Pilot Initiative A | true | medium |
| 102 | 4277037 | Baseline Model | false | hot |
| 103 | 99835 | Distributed Cluster | true | mild |

Sauces provide the finishing element for menu items, each characterized by a name, a homemade flag, and a spice level. The spice levels in the current data are mild, medium, and hot. The "Extended Review" sauce (id 100) is not homemade and has a mild spice level. The "Pilot Initiative A" sauce (id 101) is homemade with a medium spice level. The "Baseline Model" sauce (id 102) is not homemade and is hot. The "Distributed Cluster" sauce (id 103) is homemade and mild.

**Table `order_lines`**

| id | line_id | quantity | unit_price | total_price | selected_sauce | is_epic_upgrade | menu_food_item_id | catering_package_id | sauce_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 43.48 | pilot-selected-20 | false | 1 | 1 | 100 |
| 2 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 25.36 | extended-selected-21 | true | 2 | 2 | 101 |
| 3 | 69436 | 0 | 2,705 | 16.11 | integrated-selected-22 | false | 3 | 3 | 102 |
| 4 | 9085267 | 12 | 211.07 | 14.31 | seasonal-selected-23 | true | 4 | 4 | 103 |

Order lines are the transactional records that bind packages, food items, and sauces into a single customer order. Each line records a `line_id`, the `quantity` ordered, the `unit_price`, the `total_price`, the `selected_sauce` (a human-readable sauce selection label), whether an epic upgrade was applied (`is_epic_upgrade`), and foreign keys to the `menu_food_item_id` and `catering_package_id`. The first order line (id 1) corresponds to 9 units of the "Extended Review" sandwich from the "Compact Initiative" package, priced at 5,692 per unit, with a total of 43.48, a pilot-selected sauce, and no epic upgrade. The second line (id 2) records 8 units of the "Pilot Initiative A" wrap from the "Legacy Model" package at 45,650 per unit, totaling 25.36, with an extended-selected sauce and an epic upgrade applied.

**Table `packages_items`**

| catering_package_id | menu_food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `packages_items` table establishes the many-to-many relationship between catering packages and menu food items. A single package can contain multiple food items, and a food item can appear in multiple packages. In the current data, package 1 ("Compact Initiative") includes items 1 and 2, package 2 ("Legacy Model") includes items 2 and 3, package 3 ("Regional Cluster A") includes items 3 and 4, and package 4 ("Seasonal Review") includes items 4 and 1. This cross-reference table is the structural backbone that allows the system to answer which dishes are available within each package offering.

**Table `items_ingredients`**

| menu_food_item_id | ingredient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `items_ingredients` table links menu food items to their constituent ingredients. This relationship captures the recipe structure: each menu item is composed of one or more ingredients, and each ingredient can appear in multiple menu items. The table records the pairing between a `menu_food_item_id` and an `ingredient_id`, forming the bridge between the culinary preparation layer and the inventory layer.

**Table `ingredients_items`**

| ingredient_id | menu_food_item_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `ingredients_items` table serves as the inverse linkage from ingredients to menu food items. While `items_ingredients` starts from the dish and enumerates its components, `ingredients_items` starts from the ingredient and enumerates the dishes that use it. This bidirectional structure supports both recipe lookup (what goes into a dish) and inventory impact analysis (which dishes consume a given ingredient).

**Table `sauces_items`**

| sauce_id | menu_food_item_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `sauces_items` table connects sauces to menu food items, defining which sauces are appropriate pairings for each dish. This relationship enables the system to recommend or validate sauce selections when an order is placed, ensuring that the chosen sauce is compatible with the selected menu item.

**View `v_catering_package_menu_food_item_detail`**

```sql
CREATE VIEW v_catering_package_menu_food_item_detail AS
SELECT a.catering_package_id, a.package_id, a.title, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM catering_packages a
  JOIN packages_items j ON j.catering_package_id = a.catering_package_id
  JOIN menu_food_items b ON b.menu_food_item_id = j.menu_food_item_id;
```

| catering_package_id | package_id | title | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 1 | 9424918 | Compact Initiative | 1 | ITE-2792 | Extended Review |
| 1 | 9424918 | Compact Initiative | 2 | ITE-2795 | Pilot Initiative A |
| 2 | account_pymes_1044 | Legacy Model | 2 | ITE-2795 | Pilot Initiative A |
| 2 | account_pymes_1044 | Legacy Model | 3 | ITE-2798 | Baseline Model |
| 3 | 5844275 | Regional Cluster A | 3 | ITE-2798 | Baseline Model |
| 3 | 5844275 | Regional Cluster A | 4 | ITE-2801 | Distributed Cluster |
| 4 | 2106710 | Seasonal Review | 4 | ITE-2801 | Distributed Cluster |
| 4 | 2106710 | Seasonal Review | 1 | ITE-2792 | Extended Review |

The view `v_catering_package_menu_food_item_detail` joins catering packages with their constituent menu food items, producing a flattened record that shows each package alongside every dish it contains. This view answers the question: "What food items are included in each catering package?" For example, the "Compact Initiative" (package 1) appears with both the "Extended Review" sandwich and the "Pilot Initiative A" wrap, confirming that this package offers a dual-item menu. The "Legacy Model" (package 2) similarly appears with the "Pilot Initiative A" wrap and the "Baseline Model" tender, illustrating how packages can share items across different offerings.

**View `v_catering_package_menu_food_item`**

```sql
CREATE VIEW v_catering_package_menu_food_item AS
SELECT a.catering_package_id, a.package_id, a.title, a.base_price, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM catering_packages a JOIN menu_food_items b ON a.menu_food_item_id = b.menu_food_item_id;
```

| catering_package_id | package_id | title | base_price | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 9424918 | Compact Initiative | 12.72 | 1 | ITE-2792 | Extended Review |
| 2 | account_pymes_1044 | Legacy Model | 12.87 | 2 | ITE-2795 | Pilot Initiative A |
| 3 | 5844275 | Regional Cluster A | 17.41 | 3 | ITE-2798 | Baseline Model |
| 4 | 2106710 | Seasonal Review | 18.59 | 4 | ITE-2801 | Distributed Cluster |

The view `v_catering_package_menu_food_item` provides a summarized pairing of catering packages with their menu food items, stripping away redundant detail to present a clean package-to-item mapping. This view is useful for quick reference when generating package brochures or comparing item availability across packages. The "Regional Cluster A" (package 3) maps to the "Baseline Model" tender and the "Distributed Cluster" fish, while the "Seasonal Review" (package 4) maps to the "Distributed Cluster" fish and the "Extended Review" sandwich, demonstrating the cyclical nature of item reuse across the package catalog.

**View `v_menu_food_item_ingredient_detail`**

```sql
CREATE VIEW v_menu_food_item_ingredient_detail AS
SELECT a.menu_food_item_id, a.item_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_food_items a
  JOIN items_ingredients j ON j.menu_food_item_id = a.menu_food_item_id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| menu_food_item_id | item_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 1000 | 1450638 | Extended Review |
| 1 | ITE-2792 | Extended Review | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1000 | 1450638 | Extended Review |

The view `v_menu_food_item_ingredient_detail` joins menu food items with their ingredients, revealing the recipe composition of each dish. This view answers the question: "What ingredients make up each menu food item?" The "Extended Review" sandwich (item 1) is linked to the "Extended Review" ingredient (id 1000), a protein type. The "Pilot Initiative A" wrap (item 2) is linked to the "Pilot Initiative A" ingredient (id 1001), a cheese type flagged as an allergen. The "Baseline Model" tender (item 3) is linked to the "Baseline Model" ingredient (id 1002), a vegetable. The "Distributed Cluster" fish (item 4) is linked to the "Distributed Cluster" ingredient (id 1003), a condiment also flagged as an allergen.

**View `v_menu_food_item_menu_food_item`**

```sql
CREATE VIEW v_menu_food_item_menu_food_item AS
SELECT a.menu_food_item_id, a.item_id, a.name, a.category, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM menu_food_items a JOIN menu_food_items b ON a.served_with_menu_food_item_id = b.menu_food_item_id;
```

| menu_food_item_id | item_id | name | category | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | sandwich | 1 | ITE-2792 | Extended Review |
| 2 | ITE-2795 | Pilot Initiative A | wrap | 2 | ITE-2795 | Pilot Initiative A |
| 3 | ITE-2798 | Baseline Model | tender | 3 | ITE-2798 | Baseline Model |
| 4 | ITE-2801 | Distributed Cluster | fish | 4 | ITE-2801 | Distributed Cluster |

The view `v_menu_food_item_menu_food_item` creates a self-referential join on the menu food items table, using the `served_with_menu_food_item_id` column to identify which dishes are served alongside each other. This view captures the pairing logic embedded in the menu structure. For instance, the "Extended Review" sandwich (item 1) is served with itself (item 1), the "Pilot Initiative A" wrap (item 2) is served with itself (item 2), and so on. This self-referential pattern may indicate that each item defines its own serving context or that the column is used to establish a canonical serving relationship within a package.

**View `v_ingredient_menu_food_item_detail`**

```sql
CREATE VIEW v_ingredient_menu_food_item_detail AS
SELECT a.id, a.ingredient_id, a.name, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.id
  JOIN menu_food_items b ON b.menu_food_item_id = j.menu_food_item_id;
```

| id | ingredient_id | name | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | 1 | ITE-2792 | Extended Review |
| 1000 | 1450638 | Extended Review | 2 | ITE-2795 | Pilot Initiative A |
| 1001 | 5844284 | Pilot Initiative A | 2 | ITE-2795 | Pilot Initiative A |
| 1001 | 5844284 | Pilot Initiative A | 3 | ITE-2798 | Baseline Model |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 3 | ITE-2798 | Baseline Model |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 4 | ITE-2801 | Distributed Cluster |
| 1003 | 2087735 | Distributed Cluster | 4 | ITE-2801 | Distributed Cluster |
| 1003 | 2087735 | Distributed Cluster | 1 | ITE-2792 | Extended Review |

The view `v_ingredient_menu_food_item_detail` inverts the ingredient-to-item relationship, presenting each ingredient alongside the menu food items that use it. This view answers the question: "Which menu items use a given ingredient?" The "Extended Review" ingredient (id 1000) is used by the "Extended Review" sandwich (item 1). The "Pilot Initiative A" ingredient (id 1001) is used by the "Pilot Initiative A" wrap (item 2). The "Baseline Model" ingredient (id 1002) is used by the "Baseline Model" tender (item 3). The "Distributed Cluster" ingredient (id 1003) is used by the "Distributed Cluster" fish (item 4). This perspective is particularly valuable for allergen tracking and inventory forecasting.

**View `v_sauce_menu_food_item_detail`**

```sql
CREATE VIEW v_sauce_menu_food_item_detail AS
SELECT a.id, a.sauce_id, a.name, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM sauces a
  JOIN sauces_items j ON j.sauce_id = a.id
  JOIN menu_food_items b ON b.menu_food_item_id = j.menu_food_item_id;
```

| id | sauce_id | name | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 100 | 4985159 | Extended Review | 1 | ITE-2792 | Extended Review |
| 100 | 4985159 | Extended Review | 2 | ITE-2795 | Pilot Initiative A |
| 101 | 1186095 | Pilot Initiative A | 2 | ITE-2795 | Pilot Initiative A |
| 101 | 1186095 | Pilot Initiative A | 3 | ITE-2798 | Baseline Model |
| 102 | 4277037 | Baseline Model | 3 | ITE-2798 | Baseline Model |
| 102 | 4277037 | Baseline Model | 4 | ITE-2801 | Distributed Cluster |
| 103 | 99835 | Distributed Cluster | 4 | ITE-2801 | Distributed Cluster |
| 103 | 99835 | Distributed Cluster | 1 | ITE-2792 | Extended Review |

The view `v_sauce_menu_food_item_detail` joins sauces with menu food items, showing which sauces are associated with each dish. This view answers the question: "What sauce options are available for each menu food item?" The "Extended Review" sauce (id 100, mild, not homemade) is paired with the "Extended Review" sandwich (item 1). The "Pilot Initiative A" sauce (id 101, medium, homemade) is paired with the "Pilot Initiative A" wrap (item 2). The "Baseline Model" sauce (id 102, hot, not homemade) is paired with the "Baseline Model" tender (item 3). The "Distributed Cluster" sauce (id 103, mild, homemade) is paired with the "Distributed Cluster" fish (item 4).

**View `v_order_line_menu_food_item`**

```sql
CREATE VIEW v_order_line_menu_food_item AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.menu_food_item_id AS item_menu_food_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM order_lines a JOIN menu_food_items b ON a.menu_food_item_id = b.menu_food_item_id;
```

| id | line_id | quantity | unit_price | item_menu_food_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1 | ITE-2792 | Extended Review |
| 2 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 2 | ITE-2795 | Pilot Initiative A |
| 3 | 69436 | 0 | 2,705 | 3 | ITE-2798 | Baseline Model |
| 4 | 9085267 | 12 | 211.07 | 4 | ITE-2801 | Distributed Cluster |

The view `v_order_line_menu_food_item` joins order lines with their corresponding menu food items, producing a detailed transactional record that includes the dish name, category, and pricing. This view answers the question: "What food items were ordered, and at what quantities and prices?" The first order line records 9 units of the "Extended Review" sandwich at 5,692 per unit. The second line records 8 units of the "Pilot Initiative A" wrap at 45,650 per unit. The third line records 0 units of the "Baseline Model" tender at 2,705 per unit, and the fourth line records 12 units of the "Distributed Cluster" fish at 211.07 per unit.

**View `v_order_line_catering_package`**

```sql
CREATE VIEW v_order_line_catering_package AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.catering_package_id AS package_catering_package_id, b.package_id AS package_package_id, b.title AS package_title
FROM order_lines a JOIN catering_packages b ON a.catering_package_id = b.catering_package_id;
```

| id | line_id | quantity | unit_price | package_catering_package_id | package_package_id | package_title |
|---|---|---|---|---|---|---|
| 1 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1 | 9424918 | Compact Initiative |
| 2 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 2 | account_pymes_1044 | Legacy Model |
| 3 | 69436 | 0 | 2,705 | 3 | 5844275 | Regional Cluster A |
| 4 | 9085267 | 12 | 211.07 | 4 | 2106710 | Seasonal Review |

The view `v_order_line_catering_package` joins order lines with their associated catering packages, providing a complete picture of which package each order line belongs to. This view answers the question: "Which catering package is each order line part of?" The first order line is associated with the "Compact Initiative" package (id 1), the second with the "Legacy Model" package (id 2), the third with the "Regional Cluster A" package (id 3), and the fourth with the "Seasonal Review" package (id 4). This linkage is essential for revenue attribution and package-level sales reporting.

**View `v_order_line_sauce`**

```sql
CREATE VIEW v_order_line_sauce AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.id AS sauce_id, b.sauce_id AS sauce_sauce_id, b.name AS sauce_name
FROM order_lines a JOIN sauces b ON a.sauce_id = b.id;
```

| id | line_id | quantity | unit_price | sauce_id | sauce_sauce_id | sauce_name |
|---|---|---|---|---|---|---|
| 1 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 100 | 4985159 | Extended Review |
| 2 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 101 | 1186095 | Pilot Initiative A |
| 3 | 69436 | 0 | 2,705 | 102 | 4277037 | Baseline Model |
| 4 | 9085267 | 12 | 211.07 | 103 | 99835 | Distributed Cluster |

The view `v_order_line_sauce` joins order lines with their selected sauces, completing the transactional record with the finishing element chosen by the customer. This view answers the question: "What sauce was selected for each order line?" The first order line selected the "Extended Review" sauce (id 100, mild). The second order line selected the "Pilot Initiative A" sauce (id 101, medium, homemade). The third order line selected the "Baseline Model" sauce (id 102, hot). The fourth order line selected the "Distributed Cluster" sauce (id 103, mild, homemade). The `selected_sauce` column in the order lines table provides a human-readable label for each selection, such as "pilot-selected-20" and "extended-selected-21", which maps to the corresponding sauce record.

## Synthesis

The catering domain is structured around three interconnected layers: packages that define commercial offerings, menu items that define culinary offerings, and ingredients and sauces that define preparation details. Order lines serve as the transactional nexus, binding a specific package, a specific food item, and a specific sauce into a single line of commerce. The cross-reference tables—`packages_items`, `items_ingredients`, `ingredients_items`, and `sauces_items`—provide the relational scaffolding that allows any layer to be queried from any other. The views derived from these tables answer the operational questions that catering managers and kitchen staff need: what is in a package, what goes into a dish, which sauce pairs with which item, and what was actually ordered. Together, these records form a coherent operational model that supports everything from menu planning and allergen tracking to order fulfillment and revenue analysis.