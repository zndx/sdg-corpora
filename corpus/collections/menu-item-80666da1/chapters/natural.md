## Core Menu Entities

A restaurant menu is a structured collection of dishes, each defined by a set of measurable attributes and compositional relationships. The primary record of any dish lives in the `menu_items` table, where every entry carries a unique identifier, a human-readable name, and a suite of operational metadata. Consider the first four records: `ITE-2792` (named "Extended Review") priced at 12.87 with a cooking time of 44 minutes, `ITE-2795` ("Pilot Initiative A") at 35.45 and 55 minutes, `ITE-2798` ("Baseline Model") at 29.24 and 66 minutes, and `ITE-2801` ("Distributed Cluster") at 29.99 and 77 minutes. Each item also carries boolean flags for dietary classification—`is_vegetarian` and `is_vegan`—alongside a weight descriptor and a category label such as `compact-category-92` or `adaptive-category-95`. These attributes determine how the dish appears to customers, how the kitchen schedules its preparation, and how the point-of-sale system calculates totals.

**Table `menu_items`**

| menu_item_id | item_id | name | price | weight | cooking_time | is_vegetarian | is_vegan | category | side_dish_side_id | section_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | pilot-weight-32 | 44 | true | false | compact-category-92 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 195362 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | extended-weight-33 | 55 | false | true | composite-category-93 | 937737 | 7731870 |
| 3 | ITE-2798 | Baseline Model | 29.24 | integrated-weight-34 | 66 | true | false | primary-category-94 | 6564389 | 4447016 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | seasonal-weight-35 | 77 | false | true | adaptive-category-95 | 103178 | 3001009030220 |

Ingredients form the foundational layer beneath every dish. The `ingredients` table stores each component with its own identifier, name, and safety metadata. The `is_allergen` flag, paired with `allergen_category`, provides critical information for customers with dietary restrictions. For instance, ingredient `1450638` ("Extended Review") is marked non-allergenic with a gluten category, while ingredient `5844284` ("Pilot Initiative A") carries a crustaceans allergen designation. The `origin` field traces where the ingredient was sourced—`distributed-origin-66`, `baseline-origin-67`, `pilot-origin-68`, and `extended-origin-69`—and the `form` field describes its preparation state: raw, processed, cooked, or sauce. Each ingredient record also references its parent `menu_item_id`, establishing a direct compositional link.

**Table `ingredients`**

| id | ingredient_id | name | is_allergen | allergen_category | origin | form | menu_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | false | gluten | distributed-origin-66 | raw | 1 |
| 2 | 5844284 | Pilot Initiative A | true | crustaceans | baseline-origin-67 | processed | 2 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | false | molluscs | pilot-origin-68 | cooked | 3 |
| 4 | 2087735 | Distributed Cluster | true | milk | extended-origin-69 | sauce | 4 |

Side dishes represent optional accompaniments that can be paired with a main item. The `side_dishes` table captures each side's `side_id`, name, price, and `preparation_style`. The four recorded styles—`chipped`, `mashed`, `steamed`, and `buttered`—correspond respectively to the sides linked to menu items 1 through 4. Like main items, sides carry `is_vegetarian` and `is_vegan` flags, enabling the system to filter options consistently across the menu. The `menu_item_id` column ties each side to its parent dish, indicating which main course it accompanies.

**Table `side_dishes`**

| side_id | name | price | preparation_style | is_vegetarian | is_vegan | menu_item_id |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | chipped | true | false | 1 |
| 937737 | Pilot Initiative A | 35.45 | mashed | false | true | 2 |
| 6564389 | Baseline Model | 29.24 | steamed | true | false | 3 |
| 103178 | Distributed Cluster | 29.99 | buttered | false | true | 4 |

Sauces add another dimension of flavor customization. The `sauces` table records each sauce's `id`, `sauce_id`, name, price, `base_ingredient`, and `is_spicy` flag. The base ingredients—`pilot-base-20`, `extended-base-21`, `integrated-base-22`, and `seasonal-base-23`—identify the primary component from which each sauce is derived. The spicy flag allows quick filtering for customers who prefer or avoid heat. As with sides, each sauce references a `menu_item_id`, anchoring it to the dish it complements.

**Table `sauces`**

| id | sauce_id | name | price | base_ingredient | is_spicy | menu_item_id |
|---|---|---|---|---|---|---|
| 1 | 4985159 | Extended Review | 12.87 | pilot-base-20 | true | 1 |
| 2 | 1186095 | Pilot Initiative A | 35.45 | extended-base-21 | false | 2 |
| 3 | 4277037 | Baseline Model | 29.24 | integrated-base-22 | true | 3 |
| 4 | 99835 | Distributed Cluster | 29.99 | seasonal-base-23 | false | 4 |

Menu sections provide the top-level organizational structure. The `menu_sections` table defines each section with a `section_id`, a human-readable `name`, a `sort_order` integer that determines display sequence, and timestamp columns (`created_at`, `updated_at`) for audit purposes. The four sections—"Extended Review" (sort order 36, created 2025-01-01), "Pilot Initiative A" (sort order 43, created 2025-02-06), "Baseline Model" (sort order 50, created 2025-03-11), and "Distributed Cluster" (sort order 57, created 2025-04-16)—establish a chronological ordering that reflects how the menu was built over time.

**Table `menu_sections`**

| section_id | name | sort_order | created_at | updated_at |
|---|---|---|---|---|
| 195362 | Extended Review | 36 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 7731870 | Pilot Initiative A | 43 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4447016 | Baseline Model | 50 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 3001009030220 | Distributed Cluster | 57 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Ingredient Composition

The relationship between menu items and their constituent ingredients is captured through a junction table. The `items_ingredients` table maps each `menu_item_id` to one or more `ingredient_id` values, forming a many-to-many relationship. Menu item 1 ("Extended Review") uses ingredients 1 and 2; item 2 ("Pilot Initiative A") uses ingredients 2 and 3; item 3 ("Baseline Model") uses ingredients 3 and 4; and item 4 ("Distributed Cluster") uses ingredients 4 and 1. This circular pattern—where each item shares one ingredient with its predecessor and one with its successor—creates a tightly interwoven ingredient pool across the menu.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `dishes_ingredients` table serves a parallel function, linking dish-level records to their ingredient components. While the exact column structure mirrors the item-to-ingredient mapping, this table operates at the dish abstraction layer, allowing the system to resolve ingredient requirements for composite dishes that may not appear directly in the main menu catalog.

**Table `dishes_ingredients`**

| side_dish_side_id | ingredient_id |
|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 1 |
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 2 |
| 937737 | 2 |
| 937737 | 3 |
| 6564389 | 3 |
| 6564389 | 4 |
| 103178 | 4 |
| 103178 | 1 |

Sauces also maintain their own ingredient linkage through the `sauces_ingredients` table. This junction connects each sauce record to the specific ingredients that compose it, enabling granular allergen tracking and nutritional calculation at the sauce level. The separation of sauce ingredients from main dish ingredients allows the system to update a sauce's composition without affecting the parent dish's ingredient list.

**Table `sauces_ingredients`**

| sauce_id | ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Section Organization

The `sections_items` table bridges the organizational hierarchy between menu sections and individual items. Each row associates a `section_id` with a `menu_item_id`, determining which dishes appear within which section of the menu. This table is the primary mechanism for menu layout control: changing a section-item assignment reorganizes the customer-facing menu without modifying any dish's intrinsic properties.

**Table `sections_items`**

| section_id | menu_item_id |
|---|---|
| 195362 | 1 |
| 195362 | 2 |
| 7731870 | 2 |
| 7731870 | 3 |
| 4447016 | 3 |
| 4447016 | 4 |
| 3001009030220 | 4 |
| 3001009030220 | 1 |

## View: Menu Item Ingredient Detail

The view `vw_menu_item_ingredient_detail` answers the question: "What ingredients compose each menu item, and what are their properties?" By joining `menu_items` with `items_ingredients` and `ingredients`, this view produces a flat record for every ingredient-dish pairing. For menu item `ITE-2792` ("Extended Review"), the view would surface ingredient `1450638` ("Extended Review", raw form, non-allergenic, gluten category) and ingredient `5844284` ("Pilot Initiative A", processed form, allergenic with crustaceans). This join is essential for allergen screening, nutritional analysis, and supply chain planning.

**View `vw_menu_item_ingredient_detail`**

```sql
CREATE VIEW vw_menu_item_ingredient_detail AS
SELECT a.menu_item_id, a.item_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.menu_item_id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| menu_item_id | item_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 1 | 1450638 | Extended Review |
| 1 | ITE-2792 | Extended Review | 2 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 2 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 4 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 4 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1 | 1450638 | Extended Review |

## View: Menu Item Side Dish

The view `vw_menu_item_side_dish` resolves the relationship between a main dish and its accompanying side. It joins `menu_items` with `side_dishes` on the shared `menu_item_id`, producing a record that shows each dish alongside its side's name, price, preparation style, and dietary flags. For the item "Extended Review" (price 12.87), the view reveals its side also named "Extended Review" with a preparation style of `chipped`, priced at 12.87, and marked vegetarian but not vegan. This view supports combo pricing, side selection interfaces, and dietary filtering across the full dish-and-side pairing.

**View `vw_menu_item_side_dish`**

```sql
CREATE VIEW vw_menu_item_side_dish AS
SELECT a.menu_item_id, a.item_id, a.name, a.price, b.side_id AS dish_side_id, b.name AS dish_name, b.price AS dish_price
FROM menu_items a JOIN side_dishes b ON a.side_dish_side_id = b.side_id;
```

| menu_item_id | item_id | name | price | dish_side_id | dish_name | dish_price |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 937737 | Pilot Initiative A | 35.45 |
| 3 | ITE-2798 | Baseline Model | 29.24 | 6564389 | Baseline Model | 29.24 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 103178 | Distributed Cluster | 29.99 |

## View: Menu Item Menu Section

The view `vw_menu_item_menu_section` maps each menu item to its containing section. By joining `menu_items` with `menu_sections` on `section_id`, it produces a record that includes the item's full metadata alongside the section's name, sort order, and timestamps. For item `ITE-2798` ("Baseline Model"), the view shows it belongs to section `4447016` ("Baseline Model", sort order 50, created 2025-03-11). This view drives the menu rendering pipeline, ensuring items appear in the correct section with proper ordering.

**View `vw_menu_item_menu_section`**

```sql
CREATE VIEW vw_menu_item_menu_section AS
SELECT a.menu_item_id, a.item_id, a.name, a.price, b.section_id AS section_section_id, b.name AS section_name, b.sort_order AS section_sort_order
FROM menu_items a JOIN menu_sections b ON a.section_id = b.section_id;
```

| menu_item_id | item_id | name | price | section_section_id | section_name | section_sort_order |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 195362 | Extended Review | 36 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 7731870 | Pilot Initiative A | 43 |
| 3 | ITE-2798 | Baseline Model | 29.24 | 4447016 | Baseline Model | 50 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 3001009030220 | Distributed Cluster | 57 |

## View: Ingredient Menu Item

The view `vw_ingredient_menu_item` inverts the composition relationship, answering: "Which menu items use this ingredient?" It joins `ingredients` with `items_ingredients` and `menu_items`, producing a record for every ingredient-to-dish association. Ingredient `2087735` ("Distributed Cluster", sauce form, allergenic with milk category) appears in the view linked to menu item `ITE-2801` ("Distributed Cluster"). This reverse lookup is critical for recall management—if an ingredient is found to be contaminated, the view immediately identifies all affected dishes.

**View `vw_ingredient_menu_item`**

```sql
CREATE VIEW vw_ingredient_menu_item AS
SELECT a.id, a.ingredient_id, a.name, a.is_allergen, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | ingredient_id | name | is_allergen | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | false | 1 | ITE-2792 | Extended Review |
| 2 | 5844284 | Pilot Initiative A | true | 2 | ITE-2795 | Pilot Initiative A |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | false | 3 | ITE-2798 | Baseline Model |
| 4 | 2087735 | Distributed Cluster | true | 4 | ITE-2801 | Distributed Cluster |

## View: Side Dish Menu Item

The view `vw_side_dish_menu_item` provides the inverse of the side-dish pairing, showing which main items are associated with each side dish. It joins `side_dishes` with `menu_items` on `menu_item_id`, producing a record that includes the side's preparation style and the main item's price and category. For the side "Baseline Model" (steamed, vegetarian, non-vegan), the view links to menu item `ITE-2798` ("Baseline Model", primary-category-94, price 29.24). This view supports cross-selling analysis and side-dish popularity tracking.

**View `vw_side_dish_menu_item`**

```sql
CREATE VIEW vw_side_dish_menu_item AS
SELECT a.side_id, a.name, a.price, a.preparation_style, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM side_dishes a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| side_id | name | price | preparation_style | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | chipped | 1 | ITE-2792 | Extended Review |
| 937737 | Pilot Initiative A | 35.45 | mashed | 2 | ITE-2795 | Pilot Initiative A |
| 6564389 | Baseline Model | 29.24 | steamed | 3 | ITE-2798 | Baseline Model |
| 103178 | Distributed Cluster | 29.99 | buttered | 4 | ITE-2801 | Distributed Cluster |

## View: Side Dish Ingredient Detail

The view `vw_side_dish_ingredient_detail` traces the ingredient composition of side dishes. By joining `side_dishes` through their associated menu items to the `items_ingredients` and `ingredients` tables, it produces a record for every ingredient used in a side dish. This view enables allergen screening for sides independently of their parent dish, which is important when sides are offered as standalone items or when a side's ingredients differ from the main dish's.

**View `vw_side_dish_ingredient_detail`**

```sql
CREATE VIEW vw_side_dish_ingredient_detail AS
SELECT a.side_id, a.name, a.price, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM side_dishes a
  JOIN dishes_ingredients j ON j.side_dish_side_id = a.side_id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| side_id | name | price | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | 1 | 1450638 | Extended Review |
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | 2 | 5844284 | Pilot Initiative A |
| 937737 | Pilot Initiative A | 35.45 | 2 | 5844284 | Pilot Initiative A |
| 937737 | Pilot Initiative A | 35.45 | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 6564389 | Baseline Model | 29.24 | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 6564389 | Baseline Model | 29.24 | 4 | 2087735 | Distributed Cluster |
| 103178 | Distributed Cluster | 29.99 | 4 | 2087735 | Distributed Cluster |
| 103178 | Distributed Cluster | 29.99 | 1 | 1450638 | Extended Review |

## View: Sauce Menu Item

The view `vw_sauce_menu_item` resolves the relationship between sauces and their parent menu items. It joins `sauces` with `menu_items` on `menu_item_id`, producing a record that includes the sauce's base ingredient, spicy flag, and price alongside the dish's full metadata. For sauce `4985159` ("Extended Review", base ingredient `pilot-base-20`, spicy, price 12.87), the view links to menu item `ITE-2792` ("Extended Review", compact-category-92). This view supports sauce customization interfaces and flavor profile analysis.

**View `vw_sauce_menu_item`**

```sql
CREATE VIEW vw_sauce_menu_item AS
SELECT a.id, a.sauce_id, a.name, a.price, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM sauces a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | sauce_id | name | price | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | 4985159 | Extended Review | 12.87 | 1 | ITE-2792 | Extended Review |
| 2 | 1186095 | Pilot Initiative A | 35.45 | 2 | ITE-2795 | Pilot Initiative A |
| 3 | 4277037 | Baseline Model | 29.24 | 3 | ITE-2798 | Baseline Model |
| 4 | 99835 | Distributed Cluster | 29.99 | 4 | ITE-2801 | Distributed Cluster |

## View: Sauce Ingredient Detail

The view `vw_sauce_ingredient_detail` traces the ingredient composition of sauces. By joining `sauces` through `sauces_ingredients` to the `ingredients` table, it produces a record for every ingredient used in each sauce. This view enables granular allergen tracking at the sauce level, allowing the system to flag a sauce as unsafe if any of its constituent ingredients carry an allergen designation.

**View `vw_sauce_ingredient_detail`**

```sql
CREATE VIEW vw_sauce_ingredient_detail AS
SELECT a.id, a.sauce_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM sauces a
  JOIN sauces_ingredients j ON j.sauce_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | sauce_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | 4985159 | Extended Review | 1 | 1450638 | Extended Review |
| 1 | 4985159 | Extended Review | 2 | 5844284 | Pilot Initiative A |
| 2 | 1186095 | Pilot Initiative A | 2 | 5844284 | Pilot Initiative A |
| 2 | 1186095 | Pilot Initiative A | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | 4277037 | Baseline Model | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | 4277037 | Baseline Model | 4 | 2087735 | Distributed Cluster |
| 4 | 99835 | Distributed Cluster | 4 | 2087735 | Distributed Cluster |
| 4 | 99835 | Distributed Cluster | 1 | 1450638 | Extended Review |

## View: Menu Section Menu Item Detail

The view `vw_menu_section_menu_item_detail` provides a comprehensive record of every menu item within its section context. It joins `menu_sections` with `sections_items` and `menu_items`, producing a flat record that includes the section's sort order and timestamps alongside the item's name, price, weight, cooking time, dietary flags, and category. For section `3001009030220` ("Distributed Cluster", sort order 57, created 2025-04-16), the view surfaces menu item `ITE-2801` ("Distributed Cluster", price 29.99, weight `seasonal-weight-35`, cooking time 77 minutes, non-vegetarian, vegan, `adaptive-category-95`). This view is the primary data source for menu rendering, reporting, and section-level analytics.

**View `vw_menu_section_menu_item_detail`**

```sql
CREATE VIEW vw_menu_section_menu_item_detail AS
SELECT a.section_id, a.name, a.sort_order, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM menu_sections a
  JOIN sections_items j ON j.section_id = a.section_id
  JOIN menu_items b ON b.menu_item_id = j.menu_item_id;
```

| section_id | name | sort_order | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 195362 | Extended Review | 36 | 1 | ITE-2792 | Extended Review |
| 195362 | Extended Review | 36 | 2 | ITE-2795 | Pilot Initiative A |
| 7731870 | Pilot Initiative A | 43 | 2 | ITE-2795 | Pilot Initiative A |
| 7731870 | Pilot Initiative A | 43 | 3 | ITE-2798 | Baseline Model |
| 4447016 | Baseline Model | 50 | 3 | ITE-2798 | Baseline Model |
| 4447016 | Baseline Model | 50 | 4 | ITE-2801 | Distributed Cluster |
| 3001009030220 | Distributed Cluster | 57 | 4 | ITE-2801 | Distributed Cluster |
| 3001009030220 | Distributed Cluster | 57 | 1 | ITE-2792 | Extended Review |

## Closing Synthesis

The menu management domain is built on a small set of well-defined entities—menu items, ingredients, side dishes, sauces, and menu sections—connected through explicit junction tables that encode composition and organizational relationships. The five core tables store the canonical records; the three junction tables (`items_ingredients`, `dishes_ingredients`, `sauces_ingredients`) and the `sections_items` table encode the many-to-many relationships that give the menu its structure. The nine views materialize common query patterns into reusable joins, each answering a specific operational question: what ingredients are in a dish, which items use an ingredient, which section contains an item, or how a side or sauce relates to its parent dish. Together, these tables and views form a complete operational model for menu management, supporting everything from allergen screening and dietary filtering to supply chain planning and customer-facing menu rendering.