## Menu Engineering and Fulfillment Architecture

A commercial kitchen's operational backbone rests on three intertwined concerns: what is offered to the customer, how those offerings are assembled from constituent ingredients, and the business rules governing how orders are placed and fulfilled. The data model described here captures all three concerns as a unified system of records. Menu items carry pricing, availability, and categorization; ingredients carry type, allergen status, and sourcing provenance; categories, side dishes, order types, and policies form the organizational scaffolding that determines which items can be ordered, in what quantities, and under what conditions. The following sections walk through each record family, the cross-reference tables that bind them, and the analytical views that present joined results for day-to-day decision-making.

## Menu Items and Their Attributes

At the center of the system sits the menu item record. Each row represents a distinct offering, identified by a human-readable name and a machine-assigned item identifier. The price field anchors the commercial aspect, while the status column tracks availability. The minimum_order_quantity field enforces floor constraints on how many units must be purchased in a single transaction.

**Table `menu_items`**

| id | item_id | name | price | category | status | minimum_order_quantity | side_dish_id | menu_category_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | Breakfast | available | 0 | 100 | 1 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | Sandwiches | unavailable | 5 | 101 | 2 |
| 3 | ITE-2798 | Baseline Model | 29.24 | Wraps | available | 0 | 102 | 3 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | Salads | unavailable | 14 | 103 | 4 |

Consider the first row: item ITE-2792, named Extended Review, priced at 12.87, classified under Breakfast, and currently available with no minimum order quantity. Its side_dish_id of 100 and menu_category_id of 1 tie it to specific side and category records, establishing the first layer of relational linkage. By contrast, item ITE-2795 (Pilot Initiative A) carries a price of 35.45, belongs to Sandwiches, is marked unavailable, and requires a minimum order of five units. The side_dish_id of 101 and menu_category_id of 2 anchor it to its own side and category. These attributes collectively determine whether a customer can order the item, how many they must order, and what supplementary dish accompanies it.

## Ingredients and Sourcing

Every menu item is composed of one or more ingredients. The ingredients table records each ingredient's identity, type classification, allergen status, and sourcing region. The created_at and updated_at timestamps provide an audit trail for when ingredient records were first introduced and last modified.

**Table `ingredients`**

| id | ingredient_id | name | type | allergen_flag | sourcing_region | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | false | composite-sourcing-27 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 5844284 | Pilot Initiative A | vegetable | true | primary-sourcing-28 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | dairy | false | adaptive-sourcing-29 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2087735 | Distributed Cluster | grain | true | distributed-sourcing-30 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Ingredient 1450638, named Extended Review, is classified as a protein with no allergen flag and is sourced from composite-sourcing-27. Its lifecycle began on 2025-01-01 and was last updated on 2025-01-02. Ingredient 5844284 (Pilot Initiative A) is a vegetable flagged as an allergen, sourced from primary-sourcing-28, and carries a later update timestamp of 2025-02-09. The allergen_flag column is critical for compliance: when true, it signals that the ingredient must be disclosed to customers. The sourcing_region field supports supply-chain traceability, grouping ingredients into logical sourcing clusters such as adaptive-sourcing-29 or distributed-sourcing-30.

## Menu Categories and Organization

Menu categories provide the top-level classification that customers encounter when browsing. Each category has a display_order that determines its position in the menu, an includes_side flag indicating whether items in this category come with a side dish, and an order_type_id linking the category to a specific order type.

**Table `menu_categories`**

| id | category_id | name | display_order | includes_side | order_type_id |
|---|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 43 | false | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 52 | true | 2 |
| 3 | 1186099 | Baseline Model | 61 | false | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 70 | true | 4 |

Category state_et_9 (Extended Review) appears at display position 43, does not include a side dish, and is associated with order type 1. Category c744c896-8fcc-11eb-924d-9cd76263cbd0 (Pilot Initiative A) appears at position 52, does include a side dish, and links to order type 2. The includes_side flag is a business rule: when true, the system expects a side_dish_id to be present on the menu item belonging to this category. The order_type_id creates a vertical linkage from category through to the order type and its governing policies.

## Side Dishes and Inclusions

Side dishes are supplementary offerings that may accompany menu items. Each side dish record tracks whether it is house-made, whether its cost is included in the menu item's price, and which menu category it belongs to.

**Table `side_dishes`**

| id | side_id | name | is_house_made | included_in_price | menu_category_id |
|---|---|---|---|---|---|
| 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | true | true | 1 |
| 101 | 937737 | Pilot Initiative A | false | false | 2 |
| 102 | 6564389 | Baseline Model | true | true | 3 |
| 103 | 103178 | Distributed Cluster | false | false | 4 |

Side dish ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review) is house-made and included in the price, belonging to menu category 1. Side dish 937737 (Pilot Initiative A) is not house-made and is not included in the price, belonging to menu category 2. The is_house_made flag supports marketing and quality signaling, while included_in_price determines whether the side dish adds to the customer's total or is absorbed into the base price. The menu_category_id ties the side dish back to the category hierarchy, ensuring that only appropriate sides are offered with items in the correct category.

## Order Types and Policy Framework

Order types define the modes through which customers place orders: Standard, Catering, Bulk, and so on. Each order type carries a minimum_quantity requirement, a flag indicating whether advance notice is required, and a policy_id linking it to a governing policy.

**Table `order_types`**

| id | order_type_id | name | minimum_quantity | requires_advance_notice | policy_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 4463640 | Standard | 3 | false | 100 | 2025-01-01 00:14:00 |
| 2 | 726044 | Catering | 0 | true | 101 | 2025-02-06 03:14:00 |
| 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk | 3 | false | 102 | 2025-03-11 06:14:00 |
| 4 | 17969 | Standard | 6 | true | 103 | 2025-04-16 09:14:00 |

Order type 4463640 (Standard) requires a minimum quantity of 3, does not require advance notice, and is governed by policy 100. Order type 726044 (Catering) has no minimum quantity but does require advance notice, governed by policy 101. The requires_advance_notice flag is an operational constraint: when true, the fulfillment team must be given lead time before the order can be processed. The policy_id creates a direct linkage to the policies table, which defines the business rules that apply to each order type.

**Table `policies`**

| policy_id | description | effective_date | is_active |
|---|---|---|---|
| 100 | Extended Survey | 2023-02-14T13:27:00 | true |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | false |
| 102 | Baseline Series | 2025-12-09T03:01:00 | true |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | false |

Policy 100 (Extended Survey) became effective on 2023-02-14 and is currently active. Policy 101 (Pilot Corridor A) became effective on 2024-07-25 but is currently inactive. The is_active flag determines whether the policy is enforceable; inactive policies may represent historical rules or policies under review. The effective_date marks when the policy's terms took effect, supporting compliance audits.

## Cross-Reference Tables

The relational integrity of the system depends on a set of cross-reference tables that establish many-to-many and one-to-many relationships between the core entities. These tables do not carry business attributes of their own; they exist solely to record associations.

 records which ingredients are used in which menu items.  provides the inverse mapping, listing menu items for each ingredient.  links menu items to their categories.  links menu items to their side dishes.  links menu items to order types.  links policies to order types.  links policies directly to menu items.

These cross-reference tables enable flexible composition. A single menu item may reference multiple ingredients, a single ingredient may appear in multiple menu items, and a single policy may govern multiple order types and menu items. The junction tables ensure that changes to one entity propagate correctly through the system without duplicating data.

## Analytical Views and Joined Records

The cross-reference tables are powerful but require joins to produce human-readable results. The views in this system pre-compute those joins, presenting enriched records that answer specific operational questions. Each view is described below with concrete examples drawn from the data.

### Menu Item to Ingredient Detail

**View `v_menu_item_ingredient_detail`**

```sql
CREATE VIEW v_menu_item_ingredient_detail AS
SELECT a.id, a.item_id, a.name, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | item_id | name | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 1000 | 1450638 | Extended Review |
| 1 | ITE-2792 | Extended Review | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1001 | 5844284 | Pilot Initiative A |
| 2 | ITE-2795 | Pilot Initiative A | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1002 | template_ivacode_pagata_20det40ind | Baseline Model |
| 3 | ITE-2798 | Baseline Model | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1003 | 2087735 | Distributed Cluster |
| 4 | ITE-2801 | Distributed Cluster | 1000 | 1450638 | Extended Review |

This view answers the question: what ingredients compose each menu item? It joins menu_items with items_ingredients and ingredients, producing rows that pair each menu item with its constituent ingredients. For example, a row might show menu item ITE-2792 (Extended Review) alongside ingredient 1450638 (Extended Review, protein type). This view is essential for allergen disclosure, cost calculation, and recipe management.

### Menu Item to Side Dish Detail

**View `v_menu_item_side_dish`**

```sql
CREATE VIEW v_menu_item_side_dish AS
SELECT a.id, a.item_id, a.name, a.price, b.id AS dish_id, b.side_id AS dish_side_id, b.name AS dish_name
FROM menu_items a JOIN side_dishes b ON a.side_dish_id = b.id;
```

| id | item_id | name | price | dish_id | dish_side_id | dish_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 101 | 937737 | Pilot Initiative A |
| 3 | ITE-2798 | Baseline Model | 29.24 | 102 | 6564389 | Baseline Model |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 103 | 103178 | Distributed Cluster |

This view answers: which side dish accompanies each menu item? It joins menu_items with side_dishes, producing rows that pair each menu item with its side dish. A row might show ITE-2792 (Extended Review) paired with side dish ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review), which is house-made and included in the price. This view supports menu presentation and pricing transparency.

### Menu Item to Menu Category Detail

**View `v_menu_item_menu_category`**

```sql
CREATE VIEW v_menu_item_menu_category AS
SELECT a.id, a.item_id, a.name, a.price, b.id AS category_id, b.category_id AS category_category_id, b.name AS category_name
FROM menu_items a JOIN menu_categories b ON a.menu_category_id = b.id;
```

| id | item_id | name | price | category_id | category_category_id | category_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 1 | state_et_9 | Extended Review |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 3 | ITE-2798 | Baseline Model | 29.24 | 3 | 1186099 | Baseline Model |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

This view answers: which category does each menu item belong to? It joins menu_items with menu_categories, producing rows that pair each menu item with its category. A row might show ITE-2792 (Extended Review) in category state_et_9 (Extended Review), with display_order 43 and includes_side set to false. This view is used for menu layout and category-based filtering.

### Ingredient to Menu Item Detail

**View `v_ingredient_menu_item_detail`**

```sql
CREATE VIEW v_ingredient_menu_item_detail AS
SELECT a.id, a.ingredient_id, a.name, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | ingredient_id | name | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | 1 | ITE-2792 | Extended Review |
| 1000 | 1450638 | Extended Review | 2 | ITE-2795 | Pilot Initiative A |
| 1001 | 5844284 | Pilot Initiative A | 2 | ITE-2795 | Pilot Initiative A |
| 1001 | 5844284 | Pilot Initiative A | 3 | ITE-2798 | Baseline Model |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 3 | ITE-2798 | Baseline Model |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | 4 | ITE-2801 | Distributed Cluster |
| 1003 | 2087735 | Distributed Cluster | 4 | ITE-2801 | Distributed Cluster |
| 1003 | 2087735 | Distributed Cluster | 1 | ITE-2792 | Extended Review |

This view answers the inverse question: which menu items use each ingredient? It joins ingredients with items_ingredients and menu_items, producing rows that pair each ingredient with its menu items. A row might show ingredient 1450638 (Extended Review, protein) used in menu item ITE-2792 (Extended Review). This view supports inventory planning and ingredient-level cost analysis.

### Menu Category to Menu Item Detail

**View `v_menu_category_menu_item_detail`**

```sql
CREATE VIEW v_menu_category_menu_item_detail AS
SELECT a.id, a.category_id, a.name, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM menu_categories a
  JOIN categories_items j ON j.menu_category_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | category_id | name | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 1 | ITE-2792 | Extended Review |
| 1 | state_et_9 | Extended Review | 2 | ITE-2795 | Pilot Initiative A |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 2 | ITE-2795 | Pilot Initiative A |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 3 | ITE-2798 | Baseline Model |
| 3 | 1186099 | Baseline Model | 3 | ITE-2798 | Baseline Model |
| 3 | 1186099 | Baseline Model | 4 | ITE-2801 | Distributed Cluster |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 4 | ITE-2801 | Distributed Cluster |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 1 | ITE-2792 | Extended Review |

This view answers: which menu items belong to each category? It joins menu_categories with categories_items and menu_items, producing rows that pair each category with its items. A row might show category state_et_9 (Extended Review) containing menu item ITE-2792 (Extended Review). This view is used for category management and bulk operations on items within a category.

### Menu Category to Order Type

**View `v_menu_category_order_type`**

```sql
CREATE VIEW v_menu_category_order_type AS
SELECT a.id, a.category_id, a.name, a.display_order, b.id AS type_id, b.order_type_id AS type_order_type_id, b.name AS type_name
FROM menu_categories a JOIN order_types b ON a.order_type_id = b.id;
```

| id | category_id | name | display_order | type_id | type_order_type_id | type_name |
|---|---|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 43 | 1 | 4463640 | Standard |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 52 | 2 | 726044 | Catering |
| 3 | 1186099 | Baseline Model | 61 | 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 70 | 4 | 17969 | Standard |

This view answers: which order types are associated with each menu category? It joins menu_categories with order_types, producing rows that pair each category with its order type. A row might show category state_et_9 (Extended Review) linked to order type 4463640 (Standard). This view supports order routing and fulfillment planning.

### Side Dish to Menu Item Detail

**View `v_side_dish_menu_item_detail`**

```sql
CREATE VIEW v_side_dish_menu_item_detail AS
SELECT a.id, a.side_id, a.name, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM side_dishes a
  JOIN dishes_items j ON j.side_dish_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | side_id | name | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 1 | ITE-2792 | Extended Review |
| 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 2 | ITE-2795 | Pilot Initiative A |
| 101 | 937737 | Pilot Initiative A | 2 | ITE-2795 | Pilot Initiative A |
| 101 | 937737 | Pilot Initiative A | 3 | ITE-2798 | Baseline Model |
| 102 | 6564389 | Baseline Model | 3 | ITE-2798 | Baseline Model |
| 102 | 6564389 | Baseline Model | 4 | ITE-2801 | Distributed Cluster |
| 103 | 103178 | Distributed Cluster | 4 | ITE-2801 | Distributed Cluster |
| 103 | 103178 | Distributed Cluster | 1 | ITE-2792 | Extended Review |

This view answers: which menu items are paired with each side dish? It joins side_dishes with dishes_items and menu_items, producing rows that pair each side dish with its menu items. A row might show side dish ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review) paired with menu item ITE-2792 (Extended Review). This view supports side dish inventory and pairing optimization.

### Side Dish to Menu Category

**View `v_side_dish_menu_category`**

```sql
CREATE VIEW v_side_dish_menu_category AS
SELECT a.id, a.side_id, a.name, a.is_house_made, b.id AS category_id, b.category_id AS category_category_id, b.name AS category_name
FROM side_dishes a JOIN menu_categories b ON a.menu_category_id = b.id;
```

| id | side_id | name | is_house_made | category_id | category_category_id | category_name |
|---|---|---|---|---|---|---|
| 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | true | 1 | state_et_9 | Extended Review |
| 101 | 937737 | Pilot Initiative A | false | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 102 | 6564389 | Baseline Model | true | 3 | 1186099 | Baseline Model |
| 103 | 103178 | Distributed Cluster | false | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

This view answers: which menu category does each side dish belong to? It joins side_dishes with menu_categories, producing rows that pair each side dish with its category. A row might show side dish ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review) in category state_et_9 (Extended Review). This view ensures that side dishes are correctly associated with their parent categories.

### Order Type to Menu Item Detail

**View `v_order_type_menu_item_detail`**

```sql
CREATE VIEW v_order_type_menu_item_detail AS
SELECT a.id, a.order_type_id, a.name, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM order_types a
  JOIN types_items j ON j.order_type_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | order_type_id | name | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 1 | 4463640 | Standard | 1 | ITE-2792 | Extended Review |
| 1 | 4463640 | Standard | 2 | ITE-2795 | Pilot Initiative A |
| 2 | 726044 | Catering | 2 | ITE-2795 | Pilot Initiative A |
| 2 | 726044 | Catering | 3 | ITE-2798 | Baseline Model |
| 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk | 3 | ITE-2798 | Baseline Model |
| 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk | 4 | ITE-2801 | Distributed Cluster |
| 4 | 17969 | Standard | 4 | ITE-2801 | Distributed Cluster |
| 4 | 17969 | Standard | 1 | ITE-2792 | Extended Review |

This view answers: which menu items are available for each order type? It joins order_types with types_items and menu_items, producing rows that pair each order type with its menu items. A row might show order type 4463640 (Standard) with menu item ITE-2792 (Extended Review). This view is critical for order validation and customer-facing menus.

### Order Type to Policy

**View `v_order_type_policy`**

```sql
CREATE VIEW v_order_type_policy AS
SELECT a.id, a.order_type_id, a.name, a.minimum_quantity, b.policy_id AS policy_policy_id, b.description AS policy_description, b.effective_date AS policy_effective_date
FROM order_types a JOIN policies b ON a.policy_id = b.policy_id;
```

| id | order_type_id | name | minimum_quantity | policy_policy_id | policy_description | policy_effective_date |
|---|---|---|---|---|---|---|
| 1 | 4463640 | Standard | 3 | 100 | Extended Survey | 2023-02-14T13:27:00 |
| 2 | 726044 | Catering | 0 | 101 | Pilot Corridor A | 2024-07-25T20:44:00 |
| 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk | 3 | 102 | Baseline Series | 2025-12-09T03:01:00 |
| 4 | 17969 | Standard | 6 | 103 | Distributed Assessment | 2022-05-20T10:18:00 |

This view answers: which policy governs each order type? It joins order_types with policies_types and policies, producing rows that pair each order type with its policy. A row might show order type 4463640 (Standard) governed by policy 100 (Extended Survey). This view supports compliance checking and policy enforcement.

### Policy to Order Type Detail

**View `v_policy_order_type_detail`**

```sql
CREATE VIEW v_policy_order_type_detail AS
SELECT a.policy_id, a.description, a.effective_date, b.id AS type_id, b.order_type_id AS type_order_type_id, b.name AS type_name
FROM policies a
  JOIN policies_types j ON j.policy_id = a.policy_id
  JOIN order_types b ON b.id = j.order_type_id;
```

| policy_id | description | effective_date | type_id | type_order_type_id | type_name |
|---|---|---|---|---|---|
| 100 | Extended Survey | 2023-02-14T13:27:00 | 1 | 4463640 | Standard |
| 100 | Extended Survey | 2023-02-14T13:27:00 | 2 | 726044 | Catering |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | 2 | 726044 | Catering |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk |
| 102 | Baseline Series | 2025-12-09T03:01:00 | 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk |
| 102 | Baseline Series | 2025-12-09T03:01:00 | 4 | 17969 | Standard |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | 4 | 17969 | Standard |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | 1 | 4463640 | Standard |

This view answers the inverse: which order types are governed by each policy? It joins policies with policies_types and order_types, producing rows that pair each policy with its order types. A row might show policy 100 (Extended Survey) governing order type 4463640 (Standard). This view is used for policy impact analysis and bulk policy updates.

### Policy to Menu Item Detail

**View `v_policy_menu_item_detail`**

```sql
CREATE VIEW v_policy_menu_item_detail AS
SELECT a.policy_id, a.description, a.effective_date, b.id AS item_id, b.item_id AS item_item_id, b.name AS item_name
FROM policies a
  JOIN policies_items j ON j.policy_id = a.policy_id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| policy_id | description | effective_date | item_id | item_item_id | item_name |
|---|---|---|---|---|---|
| 100 | Extended Survey | 2023-02-14T13:27:00 | 1 | ITE-2792 | Extended Review |
| 100 | Extended Survey | 2023-02-14T13:27:00 | 2 | ITE-2795 | Pilot Initiative A |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | 2 | ITE-2795 | Pilot Initiative A |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | 3 | ITE-2798 | Baseline Model |
| 102 | Baseline Series | 2025-12-09T03:01:00 | 3 | ITE-2798 | Baseline Model |
| 102 | Baseline Series | 2025-12-09T03:01:00 | 4 | ITE-2801 | Distributed Cluster |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | 4 | ITE-2801 | Distributed Cluster |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | 1 | ITE-2792 | Extended Review |

This view answers: which menu items are governed by each policy? It joins policies with policies_items and menu_items, producing rows that pair each policy with its menu items. A row might show policy 100 (Extended Survey) governing menu item ITE-2792 (Extended Review). This view supports policy compliance and item-level rule enforcement.

## Closing Synthesis

The system described here models a complete menu engineering and fulfillment pipeline. Menu items carry the commercial attributes that customers see; ingredients carry the compositional and compliance attributes that kitchens need; categories, side dishes, order types, and policies provide the organizational and regulatory scaffolding. Cross-reference tables bind these entities into a coherent graph, and analytical views present that graph in human-readable form. The result is a data model that supports pricing, allergen disclosure, supply-chain traceability, order routing, and policy enforcement — all from a single, consistent set of records.

## Data appendix

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `ingredients_items`**

| ingredient_id | menu_item_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `categories_items`**

| menu_category_id | menu_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `dishes_items`**

| side_dish_id | menu_item_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `types_items`**

| order_type_id | menu_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `policies_types`**

| policy_id | order_type_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `policies_items`**

| policy_id | menu_item_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
