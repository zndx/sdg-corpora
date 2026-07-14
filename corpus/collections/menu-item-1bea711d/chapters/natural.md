## Catering Operations and Menu Engineering

A commercial catering operation manages a complex web of relationships between menu offerings, ingredient sourcing, side accompaniments, and the orders that bind them together. At the core of this domain are menu items—the discrete products offered to clients—each carrying a price, a category classification, and availability constraints. These items are not isolated; they are composed of ingredients, paired with side items, and assembled into order lines that belong to broader catering orders. Understanding how these entities interlock is essential for pricing accuracy, inventory planning, and order fulfillment.

The primary product catalog lives in the menu items table, where each entry is identified by a unique menu item number and an item identifier such as ITE-2045 or ITE-2050. The item name carries descriptive weight—"Seasonal Survey," "Integrated Corridor," "Extended Series D," "Pilot Assessment"—while the base price anchors the financial model, ranging from 12.72 to 18.59 across the sample set. Every menu item belongs to a category, drawn from a controlled vocabulary that includes compact-category-92, composite-category-93, primary-category-94, and adaptive-category-95. Availability is tracked as a boolean flag, and a minimum order quantity constrains how many units a client may purchase in a single line. Each menu item also carries a side_item_id, establishing a direct association with a complementary side offering.

**Table `menu_items`**

| menu_item_id | item_identifier | item_name | base_price | category | is_available | minimum_order_quantity | side_item_id |
|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 12.72 | compact-category-92 | true | 0 | 1 |
| 2 | ITE-2050 | Integrated Corridor | 12.87 | composite-category-93 | false | 5 | 2 |
| 3 | ITE-2055 | Extended Series D | 17.41 | primary-category-94 | true | 0 | 3 |
| 4 | ITE-2060 | Pilot Assessment | 18.59 | adaptive-category-95 | false | 14 | 4 |

The side items table provides the complementary offerings that accompany menu items. Each side is identified by a side_item_id that matches the side_item_id on the menu item it accompanies, a side_id that serves as an external reference, and a side_name such as "Integrated Programme A" or "Extended Standard." The side_type field classifies the side within a taxonomy like distributed-side-18 or baseline-side-19, while the is_included flag indicates whether the side is bundled with the menu item at no additional charge. The menu_item_id column closes the loop, pointing back to the menu item this side supports.

**Table `side_items`**

| side_item_id | side_id | side_name | side_type | is_included | menu_item_id |
|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | distributed-side-18 | true | 1 |
| 2 | 937737 | Extended Standard | baseline-side-19 | false | 2 |
| 3 | 6564389 | Pilot Framework | pilot-side-20 | true | 3 |
| 4 | 103178 | Baseline Protocol D | extended-side-21 | false | 4 |

Ingredient composition forms the second structural pillar of the domain. The food ingredients table catalogs every raw material used in menu preparation, each identified by an ingredient_id that may be numeric, such as 1450638 or 5844284, or alphanumeric, such as template_ivacode_pagata_20det40ind. The ingredient_name field carries the material's designation—"Pilot Assessment," "Baseline Survey," "Distributed Corridor A," "Adaptive Series"—while the ingredient_type classifies it within a controlled set like primary-ingredie-70 or adaptive-ingredie-71. Allergen status is tracked as a boolean, and the origin_region field records where the ingredient is sourced, using codes such as baseline-origin-61 or pilot-origin-62.

**Table `food_ingredients`**

| ingredient_id | ingredient_name | ingredient_type | is_allergen | origin_region |
|---|---|---|---|---|
| 1450638 | Pilot Assessment | primary-ingredie-70 | false | baseline-origin-61 |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | true | pilot-origin-62 |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | false | extended-origin-63 |
| 2087735 | Adaptive Series | baseline-ingredie-73 | true | integrated-origin-64 |

The relationship between menu items and ingredients is captured in the items_ingredients junction table, which maps each menu item to one or more ingredients. This many-to-many relationship allows a single menu item to draw from multiple ingredients and a single ingredient to appear across multiple menu items. For example, menu item 1 references both ingredient 1450638 and ingredient 5844284, while menu item 2 references ingredient 5844284 and the template-based ingredient template_ivacode_pagata_20det40ind. Menu item 3 pairs template_ivacode_pagata_20det40ind with ingredient 2087735, and menu item 4 combines 2087735 with 1450638. The ingredients_items table mirrors this relationship from the ingredient side, providing the same linkage with columns reversed.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1450638 |
| 1 | 5844284 |
| 2 | 5844284 |
| 2 | template_ivacode_pagata_20det40ind |
| 3 | template_ivacode_pagata_20det40ind |
| 3 | 2087735 |
| 4 | 2087735 |
| 4 | 1450638 |

**Table `ingredients_items`**

| ingredient_id | menu_item_id |
|---|---|
| 1450638 | 1 |
| 1450638 | 2 |
| 5844284 | 2 |
| 5844284 | 3 |
| template_ivacode_pagata_20det40ind | 3 |
| template_ivacode_pagata_20det40ind | 4 |
| 2087735 | 4 |
| 2087735 | 1 |

Order fulfillment is tracked through the catering_orders and order_lines tables. A catering order represents a single client engagement, identified by a catering_order_id and associated with an order_id, an order_date, and a delivery_date. The order_status field classifies the order within a controlled set such as regional-order-84 or legacy-order-85, while the total_amount records the aggregate value of the engagement. A contact_phone field stores the client's name, which in this dataset appears as a person's name rather than a phone number—"Joe Tsai," "Stephanie Collins," "Tasha Rodriguez," "Walter Pratt."

**Table `catering_orders`**

| catering_order_id | order_id | order_date | delivery_date | order_status | total_amount | contact_phone |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-27T13:15:00 | 2022-09-10 | regional-order-84 | 112.11 | Joe Tsai |
| 1001 | comi | 2024-07-11T20:32:00 | 2023-02-21 | legacy-order-85 | 1,979 | Stephanie Collins |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 2024-07-05 | compact-order-86 | 15,418 | Tasha Rodriguez |
| 1003 | 99669 | 2022-05-06T10:06:00 | 2025-12-16 | composite-order-87 | 12,579 | Walter Pratt |

Order lines are the line-level records that populate a catering order. Each order line carries an id, a line_id that may be a UUID such as 57dcd340-8fcc-11eb-924d-9cd76263cbd0 or a short code like ChIJyxw4mjhu5kcR9yl4qn8CFbo, a quantity, a unit_price, and a line_total. The special_instructions field captures client-specific notes, drawn from a controlled vocabulary such as regional-special-78 or legacy-special-79. Each order line references a menu_item_id and a catering_order_id, tying the line to both a product and the order it belongs to.

**Table `order_lines`**

| id | line_id | quantity | unit_price | line_total | special_instructions | menu_item_id | catering_order_id |
|---|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 20.70 | regional-special-78 | 1 | 1000 |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 24.40 | legacy-special-79 | 2 | 1001 |
| 102 | 69436 | 0 | 2,705 | 28.10 | compact-special-80 | 3 | 1002 |
| 103 | 9085267 | 12 | 211.07 | 31.80 | composite-special-81 | 4 | 1003 |

The orders_lines table provides the same order line data with columns reversed, maintaining the same relationships between line identifiers, quantities, pricing, and the menu items and catering orders they reference.

**Table `orders_lines`**

| catering_order_id | order_line_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

## Analytical Views and Joined Relationships

The domain provides several views that join these base tables to answer specific operational questions. Each view materializes a particular relationship, making it straightforward to query composite information without writing explicit joins.

The menu_item_food_ingredient_detail_view joins menu items to their constituent ingredients, answering the question of which ingredients compose each menu product. This view is essential for allergen screening, cost roll-up, and recipe management. A row in this view might pair menu item 1 (ITE-2045, "Seasonal Survey") with ingredient 1450638 ("Pilot Assessment," primary-ingredie-70, non-allergenic, from baseline-origin-61), or with ingredient 5844284 ("Baseline Survey," adaptive-ingredie-71, allergenic, from pilot-origin-62). The view preserves the base_price from the menu item and the ingredient_type and is_allergen fields from the ingredient table, enabling queries that filter by allergen status or ingredient classification.

**View `menu_item_food_ingredient_detail_view`**

```sql
CREATE VIEW menu_item_food_ingredient_detail_view AS
SELECT a.menu_item_id, a.item_identifier, a.item_name, b.ingredient_id AS ingredient_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.ingredient_type AS ingredient_ingredient_type
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.menu_item_id
  JOIN food_ingredients b ON b.ingredient_id = j.ingredient_id;
```

| menu_item_id | item_identifier | item_name | ingredient_ingredient_id | ingredient_ingredient_name | ingredient_ingredient_type |
|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 1450638 | Pilot Assessment | primary-ingredie-70 |
| 1 | ITE-2045 | Seasonal Survey | 5844284 | Baseline Survey | adaptive-ingredie-71 |
| 2 | ITE-2050 | Integrated Corridor | 5844284 | Baseline Survey | adaptive-ingredie-71 |
| 2 | ITE-2050 | Integrated Corridor | template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 |
| 3 | ITE-2055 | Extended Series D | template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 |
| 3 | ITE-2055 | Extended Series D | 2087735 | Adaptive Series | baseline-ingredie-73 |
| 4 | ITE-2060 | Pilot Assessment | 2087735 | Adaptive Series | baseline-ingredie-73 |
| 4 | ITE-2060 | Pilot Assessment | 1450638 | Pilot Assessment | primary-ingredie-70 |

The menu_item_side_item_view joins menu items to their associated side items, answering the question of which side accompanies each menu product. This view is critical for understanding what a client receives when ordering a menu item. A row might pair menu item 1 (ITE-2045, "Seasonal Survey") with side item 1 ("Integrated Programme A," distributed-side-18, is_included: true), or menu item 2 (ITE-2050, "Integrated Corridor") with side item 2 ("Extended Standard," baseline-side-19, is_included: false). The view carries the is_included flag, which determines whether the side is bundled or billed separately, and the side_type for classification purposes.

**View `menu_item_side_item_view`**

```sql
CREATE VIEW menu_item_side_item_view AS
SELECT a.menu_item_id, a.item_identifier, a.item_name, a.base_price, b.side_item_id AS item_side_item_id, b.side_id AS item_side_id, b.side_name AS item_side_name
FROM menu_items a JOIN side_items b ON a.side_item_id = b.side_item_id;
```

| menu_item_id | item_identifier | item_name | base_price | item_side_item_id | item_side_id | item_side_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Seasonal Survey | 12.72 | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A |
| 2 | ITE-2050 | Integrated Corridor | 12.87 | 2 | 937737 | Extended Standard |
| 3 | ITE-2055 | Extended Series D | 17.41 | 3 | 6564389 | Pilot Framework |
| 4 | ITE-2060 | Pilot Assessment | 18.59 | 4 | 103178 | Baseline Protocol D |

The food_ingredient_menu_item_detail_view reverses the perspective, joining ingredients to the menu items that use them. This view answers the question of which menu products depend on a given ingredient, supporting inventory planning and substitution analysis. A row might link ingredient 1450638 ("Pilot Assessment") to menu item 1 (ITE-2045, "Seasonal Survey") and also to menu item 4 (ITE-2060, "Pilot Assessment"), revealing that this ingredient appears in multiple products. The view preserves the is_allergen flag and ingredient_type from the ingredient table alongside the item_name, base_price, and category from the menu item table.

**View `food_ingredient_menu_item_detail_view`**

```sql
CREATE VIEW food_ingredient_menu_item_detail_view AS
SELECT a.ingredient_id, a.ingredient_name, a.ingredient_type, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM food_ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.ingredient_id
  JOIN menu_items b ON b.menu_item_id = j.menu_item_id;
```

| ingredient_id | ingredient_name | ingredient_type | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|
| 1450638 | Pilot Assessment | primary-ingredie-70 | 1 | ITE-2045 | Seasonal Survey |
| 1450638 | Pilot Assessment | primary-ingredie-70 | 2 | ITE-2050 | Integrated Corridor |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | 2 | ITE-2050 | Integrated Corridor |
| 5844284 | Baseline Survey | adaptive-ingredie-71 | 3 | ITE-2055 | Extended Series D |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | 3 | ITE-2055 | Extended Series D |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | distributed-ingredie-72 | 4 | ITE-2060 | Pilot Assessment |
| 2087735 | Adaptive Series | baseline-ingredie-73 | 4 | ITE-2060 | Pilot Assessment |
| 2087735 | Adaptive Series | baseline-ingredie-73 | 1 | ITE-2045 | Seasonal Survey |

The side_item_menu_item_view joins side items to their parent menu items, providing the inverse of the menu_item_side_item_view. This view answers the question of which menu item a given side item supports. A row might link side item 1 ("Integrated Programme A") to menu item 1 (ITE-2045, "Seasonal Survey"), or side item 3 ("Pilot Framework," pilot-side-20, is_included: true) to menu item 3 (ITE-2055, "Extended Series D"). The view carries the is_included flag and side_type from the side items table alongside the item_name and base_price from the menu items table.

**View `side_item_menu_item_view`**

```sql
CREATE VIEW side_item_menu_item_view AS
SELECT a.side_item_id, a.side_id, a.side_name, a.side_type, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM side_items a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| side_item_id | side_id | side_name | side_type | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | distributed-side-18 | 1 | ITE-2045 | Seasonal Survey |
| 2 | 937737 | Extended Standard | baseline-side-19 | 2 | ITE-2050 | Integrated Corridor |
| 3 | 6564389 | Pilot Framework | pilot-side-20 | 3 | ITE-2055 | Extended Series D |
| 4 | 103178 | Baseline Protocol D | extended-side-21 | 4 | ITE-2060 | Pilot Assessment |

The order_line_menu_item_view joins order lines to their associated menu items, answering the question of which menu product was ordered in a given line. This view is essential for sales reporting and product-level revenue analysis. A row might link order line 100 (quantity: 9, unit_price: 5,692, line_total: 20.70, special_instructions: regional-special-78) to menu item 1 (ITE-2045, "Seasonal Survey," base_price: 12.72, category: compact-category-92). Another row might link order line 103 (quantity: 12, unit_price: 211.07, line_total: 31.80, special_instructions: composite-special-81) to menu item 4 (ITE-2060, "Pilot Assessment," base_price: 18.59, category: adaptive-category-95). The view preserves the quantity, unit_price, line_total, and special_instructions from the order line alongside the item_name, base_price, and category from the menu item.

**View `order_line_menu_item_view`**

```sql
CREATE VIEW order_line_menu_item_view AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.menu_item_id AS item_menu_item_id, b.item_identifier AS item_item_identifier, b.item_name AS item_item_name
FROM order_lines a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | line_id | quantity | unit_price | item_menu_item_id | item_item_identifier | item_item_name |
|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1 | ITE-2045 | Seasonal Survey |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 2 | ITE-2050 | Integrated Corridor |
| 102 | 69436 | 0 | 2,705 | 3 | ITE-2055 | Extended Series D |
| 103 | 9085267 | 12 | 211.07 | 4 | ITE-2060 | Pilot Assessment |

The order_line_catering_order_view joins order lines to their parent catering orders, answering the question of which catering order a given line belongs to. This view is essential for order-level aggregation and delivery scheduling. A row might link order line 100 (quantity: 9, unit_price: 5,692) to catering order 1000 (order_id: 1030, order_date: 2023-02-27, delivery_date: 2022-09-10, status: regional-order-84, total_amount: 112.11, contact: Joe Tsai). Another row might link order line 101 (quantity: 8, unit_price: 45,650) to catering order 1001 (order_id: comi, order_date: 2024-07-11, delivery_date: 2023-02-21, status: legacy-order-85, total_amount: 1,979, contact: Stephanie Collins). The view carries the quantity, unit_price, line_total, and special_instructions from the order line alongside the order_date, delivery_date, order_status, total_amount, and contact_phone from the catering order.

**View `order_line_catering_order_view`**

```sql
CREATE VIEW order_line_catering_order_view AS
SELECT a.id, a.line_id, a.quantity, a.unit_price, b.catering_order_id AS order_catering_order_id, b.order_id AS order_order_id, b.order_date AS order_order_date
FROM order_lines a JOIN catering_orders b ON a.catering_order_id = b.catering_order_id;
```

| id | line_id | quantity | unit_price | order_catering_order_id | order_order_id | order_order_date |
|---|---|---|---|---|---|---|
| 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 | 5,692 | 1000 | 1030 | 2023-02-27T13:15:00 |
| 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 | 45,650 | 1001 | comi | 2024-07-11T20:32:00 |
| 102 | 69436 | 0 | 2,705 | 1002 | state_uk_22 | 2025-12-22T03:49:00 |
| 103 | 9085267 | 12 | 211.07 | 1003 | 99669 | 2022-05-06T10:06:00 |

The catering_order_order_line_detail_view joins catering orders to their constituent order lines, answering the question of which lines comprise a given catering order. This view is essential for order review, invoice generation, and fulfillment planning. A row might link catering order 1000 (order_id: 1030, order_date: 2023-02-27, delivery_date: 2022-09-10, status: regional-order-84, total_amount: 112.11, contact: Joe Tsai) to order line 100 (line_id: ChIJyxw4mjhu5kcR9yl4qn8CFbo, quantity: 9, unit_price: 5,692, line_total: 20.70, special_instructions: regional-special-78, menu_item_id: 1). Another row might link catering order 1002 (order_id: state_uk_22, order_date: 2025-12-22, delivery_date: 2024-07-05, status: compact-order-86, total_amount: 15,418, contact: Tasha Rodriguez) to order line 102 (line_id: 69436, quantity: 0, unit_price: 2,705, line_total: 28.10, special_instructions: compact-special-80, menu_item_id: 3). The view carries the order_date, delivery_date, order_status, total_amount, and contact_phone from the catering order alongside the line_id, quantity, unit_price, line_total, and special_instructions from the order line.

**View `catering_order_order_line_detail_view`**

```sql
CREATE VIEW catering_order_order_line_detail_view AS
SELECT a.catering_order_id, a.order_id, a.order_date, b.id AS line_id, b.line_id AS line_line_id, b.quantity AS line_quantity
FROM catering_orders a
  JOIN orders_lines j ON j.catering_order_id = a.catering_order_id
  JOIN order_lines b ON b.id = j.order_line_id;
```

| catering_order_id | order_id | order_date | line_id | line_line_id | line_quantity |
|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-27T13:15:00 | 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 |
| 1000 | 1030 | 2023-02-27T13:15:00 | 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 |
| 1001 | comi | 2024-07-11T20:32:00 | 101 | 57dcd340-8fcc-11eb-924d-9cd76263cbd0 | 8 |
| 1001 | comi | 2024-07-11T20:32:00 | 102 | 69436 | 0 |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 102 | 69436 | 0 |
| 1002 | state_uk_22 | 2025-12-22T03:49:00 | 103 | 9085267 | 12 |
| 1003 | 99669 | 2022-05-06T10:06:00 | 103 | 9085267 | 12 |
| 1003 | 99669 | 2022-05-06T10:06:00 | 100 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | 9 |

## Synthesis

The catering domain is structured around three layers of composition. The product layer consists of menu items, each defined by its price, category, availability, and minimum order quantity, and each paired with a side item. The ingredient layer consists of food ingredients, each classified by type, allergen status, and origin, linked to menu items through a many-to-many junction. The order layer consists of catering orders, each with a date, status, and total amount, populated by order lines that reference both menu items and their parent order. The views materialize the joins between these layers, enabling queries that span composition (which ingredients are in which menu items?), pairing (which sides accompany which items?), and fulfillment (which lines belong to which orders, and what products do those lines reference?). Together, these tables and views form a coherent operational model that supports pricing, inventory, allergen management, and order tracking across the catering lifecycle.