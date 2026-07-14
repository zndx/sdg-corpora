## Relational Modelling of a Catering Domain

The catering domain captures the business of assembling food packages for events, where each package bundles one or more menu items, each menu item decomposes into ingredients and sauces, and each order line records a customer's selection of a package with a specific quantity, price, and sauce preference. The schema is normalised to third normal form: base tables hold atomic facts, junction tables resolve many-to-many relationships, and materialised views re-join those tables so that analysts can query domain-level concepts — such as "which ingredients belong to which menu items inside which packages" — without writing joins by hand. Every table and view is named to reflect the domain entities it represents, and every foreign key traces a referential path from a child fact back to its parent entity.

The five core base tables are `catering_packages`, `menu_food_items`, `ingredients`, `sauces`, and `order_lines`. The first three are enriched by three junction tables — `packages_items`, `items_ingredients`, and `sauces_items` — that resolve the many-to-many relationships between packages and menu items, and between menu items and their constituent ingredients and sauces. A fourth junction table, `ingredients_items`, appears in the schema as a symmetric alias for the item-to-ingredient relationship.

**Table `catering_packages`**

| catering_package_id | package_id | title | base_price | epic_price | serves_count | status | menu_food_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424918 | Compact Initiative | 12.72 | 12.34 | 45 | available | 1 |
| 2 | account_pymes_1044 | Legacy Model | 12.87 | 19.97 | 31 | sold_out | 2 |
| 3 | 5844275 | Regional Cluster A | 17.41 | 27.02 | 0 | discontinued | 3 |
| 4 | 2106710 | Seasonal Review | 18.59 | 36.43 | 5 | available | 4 |

The `catering_packages` table stores one row per purchasable catering package. Its primary key is `catering_package_id`, a surrogate integer that the application uses as the stable identifier across all joins. The natural business key `package_id` carries a human-readable code such as `9424918` or `account_pymes_1044`, while `title` holds the display name — for example, "Compact Initiative" or "Legacy Model". The pricing columns `base_price` and `epic_price` record the standard and premium rates respectively; in the sample data the base price for the "Compact Initiative" package is `12.72` and its epic price is `12.34`. The `serves_count` column indicates how many guests the package is designed for, ranging from `0` (as seen for "Regional Cluster A") to `45`. The `status` column constrains the package lifecycle to one of `available`, `sold_out`, or `discontinued`, and the optional foreign key `menu_food_item_id` points to a canonical menu item associated with the package, establishing a one-to-one anchor between the two entities.

**Table `menu_food_items`**

| menu_food_item_id | item_id | name | category | unit_price | portion_size | is_gluten_free | is_vegetarian | served_with_menu_food_item_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | sandwich | 5,692 | 31 | true | true | 1 |
| 2 | ITE-2795 | Pilot Initiative A | wrap | 45,650 | 38 | false | false | 2 |
| 3 | ITE-2798 | Baseline Model | tender | 2,705 | 45 | true | true | 3 |
| 4 | ITE-2801 | Distributed Cluster | fish | 211.07 | 52 | false | false | 4 |

The `menu_food_items` table defines the catalogue of individual food offerings. Its surrogate primary key is `menu_food_item_id`, while `item_id` carries the natural product code such as `ITE-2792` or `ITE-2795`. The `name` column stores the display label — "Extended Review", "Pilot Initiative A", and so on — and `category` classifies the item into a food type like `sandwich`, `wrap`, `tender`, or `fish`. The `unit_price` records the per-unit cost (for instance, `5,692` for the "Extended Review" sandwich), and `portion_size` is an integer indicating serving size. Two boolean flags, `is_gluten_free` and `is_vegetarian`, constrain the dietary attributes of each item; the "Extended Review" sandwich is marked `true` for both, whereas the "Pilot Initiative A" wrap is `false` for both. The column `served_with_menu_food_item_id` is a self-referencing foreign key that links a menu item to another menu item it is traditionally served alongside — in the sample data, each item references itself, indicating a placeholder for future cross-sell relationships.

**Table `ingredients`**

| id | ingredient_id | name | type | certification | is_allergen |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | USDA Certified Black Angus | false |
| 1001 | 5844284 | Pilot Initiative A | cheese | none | true |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | vegetable | USDA Certified Black Angus | false |
| 1003 | 2087735 | Distributed Cluster | condiment | none | true |

The `ingredients` table enumerates the raw food components used across the menu. Its surrogate key is `id`, while `ingredient_id` is the natural identifier, carrying values such as `1450638` or the template-style code `template_ivacode_pagata_20det40ind`. The `name` column mirrors the menu item names in the sample data ("Extended Review", "Pilot Initiative A", etc.), and `type` classifies the ingredient as `protein`, `cheese`, `vegetable`, or `condiment`. The `certification` column stores regulatory or quality labels — for example, "USDA Certified Black Angus" — and `is_allergen` is a boolean flag; the "Pilot Initiative A" cheese ingredient is marked `true`, signalling an allergen concern.

**Table `sauces`**

| id | sauce_id | name | is_homemade | spice_level |
|---|---|---|---|---|
| 100 | 4985159 | Extended Review | false | mild |
| 101 | 1186095 | Pilot Initiative A | true | medium |
| 102 | 4277037 | Baseline Model | false | hot |
| 103 | 99835 | Distributed Cluster | true | mild |

The `sauces` table holds the condiment catalogue. Its surrogate key is `id`, and `sauce_id` is the natural key, with values like `4985159` or `99835`. The `name` column stores the sauce label, `is_homemade` is a boolean indicating whether the sauce is house-made, and `spice_level` constrains the heat to one of `mild`, `medium`, or `hot`. In the sample data, the "Extended Review" sauce is not homemade and is `mild`, while the "Pilot Initiative A" sauce is homemade and `medium`.

**Table `order_lines`**

| id | line_id | quantity | unit_price | total_price | selected_sauce | is_epic_upgrade | menu_food_item_id | catering_package_id | sauce_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 43.48 | pilot-selected-20 | false | 1 | 1 | 100 |
| 2 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 25.36 | extended-selected-21 | true | 2 | 2 | 101 |
| 3 | 69436 | 0 | 2,705 | 16.11 | integrated-selected-22 | false | 3 | 3 | 102 |
| 4 | 9085267 | 12 | 211.07 | 14.31 | seasonal-selected-23 | true | 4 | 4 | 103 |

The `order_lines` table records individual line items on customer orders. Its surrogate primary key is `id`, and `line_id` carries the natural order-line identifier, which in the sample data takes the form of a Google Place ID (`ChIJyxw4mjhu5kcR9yl4qn8CFbo`), a UUID (`57dcd340-8fcc-11eb-924d-9cd76263cbd0`), or a plain integer (`69436`). The `quantity` column records how many units were ordered — values range from `0` to `12` in the sample — and `unit_price` stores the per-unit price at time of order. The `total_price` column holds the computed line total (for example, `43.48` for nine units of the "Extended Review" item). The `selected_sauce` column records the customer's sauce choice as a free-text label such as `pilot-selected-20` or `extended-selected-21`. The boolean `is_epic_upgrade` indicates whether the line includes the premium upgrade. The foreign keys `menu_food_item_id` and `catering_package_id` link the line to the selected menu item and package respectively, while `sauce_id` links to the `sauces` table, establishing a many-to-one relationship between order lines and sauces.

The many-to-many relationships in the domain are resolved by three junction tables. The `packages_items` table resolves the relationship between `catering_packages` and `menu_food_items`, allowing each package to contain multiple menu items and each menu item to appear in multiple packages.

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

In the sample data, package `1` ("Compact Initiative") contains menu items `1` and `2`, while package `4` ("Seasonal Review") contains menu items `4` and `1`. This creates a flexible bundling model where packages are not rigidly tied to a single menu item.

The `items_ingredients` table resolves the relationship between `menu_food_items` and `ingredients`.

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

This junction table enables each menu item to be composed of multiple ingredients and each ingredient to appear across multiple menu items. The symmetric alias `ingredients_items` serves the same purpose from the ingredient's perspective.

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

The `sauces_items` table resolves the relationship between `sauces` and `menu_food_items`.

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

This allows each menu item to be associated with one or more sauces, and each sauce to be offered with multiple menu items.

With the base tables and junction tables in place, the schema provides a set of materialised views that reassemble the normalised facts into domain-level queries. Each view performs a specific join pattern that answers a common analytical question.

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

This view joins `catering_packages` to `menu_food_items` through the `packages_items` junction table, producing a row for every package-item combination. It answers the question: "Which menu items are included in each catering package, and what are their prices and dietary attributes?" Reading the sample data, the view would produce a row showing that package `1` ("Compact Initiative", base price `12.72`, serving `45` guests) contains menu item `1` ("Extended Review", category `sandwich`, unit price `5,692`, gluten-free `true`, vegetarian `true`), and a second row showing the same package also contains menu item `2` ("Pilot Initiative A", category `wrap`, unit price `45,650`, gluten-free `false`, vegetarian `false`). This view is the primary interface for customers browsing package contents.

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

This view provides a condensed join between `catering_packages` and `menu_food_items`, likely aggregating or deduplicating the detail view to present a one-row-per-package summary. It answers: "What is the primary or representative menu item for each catering package?" In the sample data, package `1` is associated with menu item `1`, package `2` with menu item `2`, and so on, reflecting the direct `menu_food_item_id` foreign key on the `catering_packages` table.

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

This view joins `menu_food_items` to `ingredients` through the `items_ingredients` junction table, producing a row for every menu-item-to-ingredient pairing. It answers: "Which ingredients compose each menu item, and what are their types and allergen statuses?" For the "Extended Review" sandwich (menu item `1`), the view would reveal its associated ingredients — for instance, the "Extended Review" protein (type `protein`, certification "USDA Certified Black Angus", not an allergen) — enabling dietary compliance checks and nutritional analysis.

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

This self-join view on `menu_food_items` uses the `served_with_menu_food_item_id` column to produce pairs of menu items that are traditionally served together. It answers: "Which menu items are cross-referenced as companion dishes?" In the sample data, since each item references itself, the view would produce rows where each menu item is paired with itself, serving as a placeholder for future cross-sell recommendations.

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

This view presents the ingredient-to-menu-item relationship from the ingredient's perspective, joining `ingredients` to `menu_food_items` through the `ingredients_items` junction table. It answers: "Which menu items use this ingredient?" For the "Pilot Initiative A" cheese ingredient (type `cheese`, allergen `true`), the view would list every menu item that includes this cheese, enabling allergen traceability across the entire menu.

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

This view joins `sauces` to `menu_food_items` through the `sauces_items` junction table, producing a row for every sauce-to-menu-item pairing. It answers: "Which sauces are offered with each menu item, and are they homemade?" The "Extended Review" sauce (not homemade, spice level `mild`) would appear alongside every menu item it accompanies, allowing customers to filter menu items by sauce preference.

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

This view joins `order_lines` to `menu_food_items`, producing a row for each order line enriched with the menu item's name, category, and dietary attributes. It answers: "What did the customer order, and what are the details of the menu item?" For order line `1` (quantity `9`, unit price `5,692`, total `43.48`, epic upgrade `false`), the view would show that the customer ordered the "Extended Review" sandwich (category `sandwich`, gluten-free `true`, vegetarian `true`), enabling order history reports and dietary compliance audits.

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

This view joins `order_lines` to `catering_packages`, producing a row for each order line enriched with the package's title, pricing, and status. It answers: "Which catering package was selected for each order line, and what are the package details?" For order line `2` (quantity `8`, unit price `45,650`, total `25.36`, epic upgrade `true`), the view would show that the customer selected package `2` ("Legacy Model", base price `12.87`, status `sold_out`), providing a clear audit trail of package selections even for packages that may no longer be available.

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

This view joins `order_lines` to `sauces`, producing a row for each order line enriched with the sauce's name, homemade status, and spice level. It answers: "Which sauce was selected for each order line, and what are its characteristics?" For order line `1`, the view would show that the customer selected sauce `100` ("Extended Review", not homemade, spice level `mild`), enabling sauce preference analytics and inventory planning for homemade versus commercial sauces.

The schema's design reflects a disciplined approach to relational modelling: base tables store atomic facts with surrogate keys, junction tables resolve many-to-many relationships without introducing redundancy, and materialised views reassemble the normalised structure into domain-level queries that mirror how business users think about the data. The foreign key paths — from `order_lines` to `catering_packages` and `menu_food_items`, from `packages_items` to both `catering_packages` and `menu_food_items`, from `items_ingredients` and `sauces_items` to their respective parent tables — form a connected graph that ensures referential integrity across the entire domain. Views such as `v_catering_package_menu_food_item_detail` and `v_order_line_menu_food_item` demonstrate how a single join chain can reconstruct a complete business fact from its normalised components, while views like `v_menu_food_item_ingredient_detail` and `v_sauce_menu_food_item_detail` provide the granular traceability needed for dietary compliance and inventory management. The result is a schema that is both efficient for write-heavy operational workloads and expressive enough for analytical queries, embodying the principle that a well-designed relational model makes the domain's structure visible in its table names, column choices, and join patterns.