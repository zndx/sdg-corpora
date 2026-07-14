## Domain Modelling and Relational Materialization

The domain under examination is a restaurant and catering menu management system, where food items, their constituent ingredients, categorical groupings, side dishes, order fulfilment types, and governing business policies are modelled as a coherent set of relational entities. The schema follows a hybrid normalisation strategy: core entity tables carry their own surrogate and business identifiers, while many-to-many associations are resolved through dedicated junction tables. This chapter explains how the ontology of menu items, ingredients, categories, sides, order types, and policies materialises as a relational schema, how foreign keys and cardinality constraints bind the tables together, and how the twelve analytical views reconstruct domain facts from the normalised base tables.

**Table `menu_items`**

| id | item_id | name | price | category | status | minimum_order_quantity | side_dish_id | menu_category_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | Breakfast | available | 0 | 100 | 1 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | Sandwiches | unavailable | 5 | 101 | 2 |
| 3 | ITE-2798 | Baseline Model | 29.24 | Wraps | available | 0 | 102 | 3 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | Salads | unavailable | 14 | 103 | 4 |

The `menu_items` table is the central entity of the schema. Each row represents a distinct food offering, identified by a surrogate primary key `id` and a business-level `item_id` such as `ITE-2792` or `ITE-2801`. The `name` column carries human-readable labels — "Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster" — while `price` stores the unit cost as a decimal (12.87, 35.45, 29.24, 29.99). The `category` column provides a free-text classification ("Breakfast", "Sandwiches", "Wraps", "Salads"), and `status` constrains availability to `available` or `unavailable`. The `minimum_order_quantity` column enforces a cardinality bound on ordering: a value of `0` means no minimum, while `14` (as in row 4) imposes a floor. Two foreign-key columns anchor the item to other entities: `side_dish_id` references the `side_dishes` table (values 100–103), and `menu_category_id` references `menu_categories` (values 1–4). This dual foreign-key design means each menu item participates in exactly one side-dish association and one category association, enforcing a 1:1 or N:1 cardinality from the item's perspective.

**Table `ingredients`**

| id | ingredient_id | name | type | allergen_flag | sourcing_region | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | 1450638 | Extended Review | protein | false | composite-sourcing-27 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 5844284 | Pilot Initiative A | vegetable | true | primary-sourcing-28 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | template_ivacode_pagata_20det40ind | Baseline Model | dairy | false | adaptive-sourcing-29 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2087735 | Distributed Cluster | grain | true | distributed-sourcing-30 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `ingredients` table stores the master catalogue of food components. Its surrogate key `id` runs sequentially (1000–1003), while `ingredient_id` carries a business identifier that can be a numeric string (`1450638`, `5844284`) or a template-style code (`template_ivacode_pagata_20det40ind`). The `name` column mirrors the menu item names in this dataset ("Extended Review", "Pilot Initiative A", etc.), suggesting a naming convention where ingredients share identifiers with the items they compose. The `type` column classifies ingredients into `protein`, `vegetable`, `dairy`, and `grain`. The `allergen_flag` is a boolean (`true`/`false`) indicating whether the ingredient triggers an allergen warning. `sourcing_region` records the supply chain origin using structured codes like `composite-sourcing-27` or `adaptive-sourcing-29`. Timestamp columns `created_at` and `updated_at` track the lifecycle of each ingredient record, with dates ranging from January 2025 through April 2025.

**Table `menu_categories`**

| id | category_id | name | display_order | includes_side | order_type_id |
|---|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 43 | false | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 52 | true | 2 |
| 3 | 1186099 | Baseline Model | 61 | false | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 70 | true | 4 |

`menu_categories` defines the categorical buckets into which menu items are grouped. The surrogate `id` (1–4) is the primary key, while `category_id` carries the business identifier (e.g., `state_et_9`, `c744c896-8fcc-11eb-924d-9cd76263cbd0`). The `name` column repeats the category labels seen in `menu_items.category` ("Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster"), confirming that the category name in `menu_items` is a denormalised copy of the canonical name stored here. The `display_order` column (43, 52, 61, 70) controls UI presentation order. The `includes_side` boolean indicates whether items in this category come with a side dish. Crucially, `order_type_id` (values 1–4) is a foreign key into `order_types`, establishing that each menu category is associated with exactly one order type.

**Table `side_dishes`**

| id | side_id | name | is_house_made | included_in_price | menu_category_id |
|---|---|---|---|---|---|
| 100 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | true | true | 1 |
| 101 | 937737 | Pilot Initiative A | false | false | 2 |
| 102 | 6564389 | Baseline Model | true | true | 3 |
| 103 | 103178 | Distributed Cluster | false | false | 4 |

The `side_dishes` table holds the catalogue of optional side items. Its surrogate `id` (100–103) is the primary key, and `side_id` carries the business identifier (e.g., `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, `937737`). The `name` column again mirrors the menu item names, reinforcing the naming convention across entities. The `is_house_made` boolean distinguishes in-house preparations from outsourced sides, while `included_in_price` indicates whether the side's cost is baked into the menu item price. The `menu_category_id` column is a foreign key into `menu_categories`, meaning each side dish is associated with exactly one category. This creates a one-to-one correspondence between categories and sides in the current data: category 1 maps to side 100, category 2 to side 101, and so on.

**Table `order_types`**

| id | order_type_id | name | minimum_quantity | requires_advance_notice | policy_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 4463640 | Standard | 3 | false | 100 | 2025-01-01 00:14:00 |
| 2 | 726044 | Catering | 0 | true | 101 | 2025-02-06 03:14:00 |
| 3 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | Bulk | 3 | false | 102 | 2025-03-11 06:14:00 |
| 4 | 17969 | Standard | 6 | true | 103 | 2025-04-16 09:14:00 |

`order_types` enumerates the ways customers can place orders. The surrogate `id` (1–4) is the primary key, and `order_type_id` carries the business identifier (e.g., `4463640`, `726044`, `050bdfa8-8fc7-11eb-924d-9cd76263cbd0`). The `name` column classifies the type as "Standard", "Catering", or "Bulk". The `minimum_quantity` column (0, 3, 6) enforces a floor on order size, while `requires_advance_notice` is a boolean indicating whether advance scheduling is mandatory. The `policy_id` column (100–103) is a foreign key into `policies`, linking each order type to its governing policy. The `created_at` timestamp records when the order type was introduced.

**Table `policies`**

| policy_id | description | effective_date | is_active |
|---|---|---|---|
| 100 | Extended Survey | 2023-02-14T13:27:00 | true |
| 101 | Pilot Corridor A | 2024-07-25T20:44:00 | false |
| 102 | Baseline Series | 2025-12-09T03:01:00 | true |
| 103 | Distributed Assessment | 2022-05-20T10:18:00 | false |

The `policies` table is the leaf entity in the policy hierarchy. Its primary key is `policy_id` (100–103), and the `description` column carries policy labels ("Extended Survey", "Pilot Corridor A", "Baseline Series", "Distributed Assessment"). The `effective_date` column stores the policy's start date as an ISO 8601 timestamp (e.g., `2023-02-14T13:27:00`), and `is_active` is a boolean indicating current enforceability. Policies are referenced by `order_types.policy_id` and by the junction table `policies_items`, making them the central governance entity that constrains both order types and individual menu items.

The schema then introduces seven junction tables that resolve many-to-many relationships between the core entities. These tables do not carry their own surrogate keys in the current schema; instead, they function as pure association matrices.

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

The `items_ingredients` table links menu items to their constituent ingredients. Each row represents a single ingredient used in a single menu item, forming the canonical N:M relationship between `menu_items` and `ingredients`.

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

The `ingredients_items` table is the inverse association of `items_ingredients`, linking ingredients back to the menu items that use them. In practice, this table may serve as a denormalised mirror or a query optimisation index, allowing efficient lookups from the ingredient side.

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

The `categories_items` table resolves the many-to-many relationship between `menu_categories` and `menu_items`. While `menu_items.menu_category_id` already provides a direct N:1 link, this junction table allows a category to be associated with multiple items and potentially an item to belong to multiple categories, depending on the application's business rules.

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

The `dishes_items` table links `side_dishes` to `menu_items`, enabling a side dish to be associated with multiple menu items and vice versa. This is a many-to-many relationship that goes beyond the single `side_dish_id` foreign key in `menu_items`, suggesting that the junction table captures a broader set of associations than the direct foreign key alone.

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

The `types_items` table connects `order_types` to `menu_items`, allowing an order type to apply to multiple items and an item to be orderable under multiple types. This is another many-to-many association that supplements the category-to-order-type link in `menu_categories`.

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

The `policies_types` table links `policies` to `order_types`, enabling a single policy to govern multiple order types and an order type to be subject to multiple policies. This is a many-to-many relationship that extends beyond the single `policy_id` foreign key in `order_types`.

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

The `policies_items` table connects `policies` directly to `menu_items`, allowing a policy to constrain individual menu items. This creates a direct governance link from policy to item, independent of the order type or category mediation.

With the base tables and junction tables defined, the schema provides twelve analytical views that materialise common query patterns as virtual tables. Each view joins two or more base tables to answer a specific domain question.

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

This view joins `menu_items` to `ingredients` (via the `items_ingredients` junction) to answer the question: "What ingredients compose each menu item?" The result presents each menu item alongside its ingredient details, allowing a reader to see, for example, that the item "Extended Review" (price 12.87, category Breakfast) is composed of the ingredient also named "Extended Review" (type protein, sourced from composite-sourcing-27). This view is essential for allergen tracking and nutritional analysis.

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

This view joins `menu_items` to `side_dishes` to answer: "What side dish accompanies each menu item?" Given the direct `side_dish_id` foreign key in `menu_items`, this join is straightforward. For instance, the item "Pilot Initiative A" (price 35.45, status unavailable) is paired with side dish 101 ("Pilot Initiative A", not house-made, not included in price). This view supports menu presentation and pricing transparency.

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

This view joins `menu_items` to `menu_categories` to answer: "Which category does each menu item belong to, and what are the category's properties?" The join reveals that "Baseline Model" (price 29.24, category Wraps) belongs to category 3 ("Baseline Model", display order 61, includes_side false, order_type_id 3). This view is the backbone of category-based menu browsing.

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

This view inverts the perspective of `v_menu_item_ingredient_detail`, joining `ingredients` to `menu_items` to answer: "Which menu items use this ingredient?" For example, the ingredient "Distributed Cluster" (type grain, allergen_flag true, sourced from distributed-sourcing-30) is used in the menu item "Distributed Cluster" (price 29.99, status unavailable). This view supports ingredient-driven menu exploration and supply chain analysis.

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

This view joins `menu_categories` to `menu_items` to answer: "What items are available in each category?" The result shows, for instance, that category "Extended Review" (display order 43, includes_side false, order_type_id 1) contains the menu item "Extended Review" (price 12.87, status available). This view is used for category-level menu summaries.

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

This view joins `menu_categories` to `order_types` to answer: "Which order type governs each category?" The join reveals that category "Pilot Initiative A" (display order 52, includes_side true) is governed by order type 2 ("Catering", minimum_quantity 0, requires_advance_notice true, policy_id 101). This view is critical for understanding the ordering constraints that apply to each category.

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

This view joins `side_dishes` to `menu_items` to answer: "Which menu items are associated with each side dish?" For example, side dish 102 ("Baseline Model", house-made, included_in_price true) is associated with the menu item "Baseline Model" (price 29.24, status available). This view supports side-dish-centric menu navigation.

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

This view joins `side_dishes` to `menu_categories` to answer: "Which category does each side dish belong to?" The join confirms that side dish 100 ("Extended Review", house-made, included_in_price true) belongs to category 1 ("Extended Review", display order 43). This view validates the one-to-one correspondence between categories and sides.

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

This view joins `order_types` to `menu_items` (via `types_items` or through the category mediation) to answer: "Which menu items are orderable under each order type?" For instance, order type 1 ("Standard", minimum_quantity 3, requires_advance_notice false, policy_id 100) applies to the menu item "Extended Review" (price 12.87, status available). This view supports order-type-based menu filtering.

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

This view joins `order_types` to `policies` to answer: "Which policy governs each order type?" The join shows that order type 2 ("Catering", minimum_quantity 0, requires_advance_notice true) is governed by policy 101 ("Pilot Corridor A", effective 2024-07-25, is_active false). This view is essential for compliance auditing and policy propagation analysis.

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

This view inverts the perspective of `v_order_type_policy`, joining `policies` to `order_types` to answer: "Which order types are subject to each policy?" For example, policy 100 ("Extended Survey", effective 2023-02-14, is_active true) governs order type 1 ("Standard", minimum_quantity 3, requires_advance_notice false). This view supports policy-driven order type discovery.

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

This view joins `policies` to `menu_items` (via `policies_items`) to answer: "Which menu items are directly constrained by each policy?" The join reveals that policy 102 ("Baseline Series", effective 2025-12-09, is_active true) constrains the menu item "Baseline Model" (price 29.24, status available). This view is the most direct governance lens, bypassing the order type and category mediation to show policy-to-item relationships.

The schema as a whole embodies a layered domain model. At the top level, `menu_items` serves as the central fact table, enriched by foreign keys to `side_dishes` and `menu_categories`. The `menu_categories` table, in turn, references `order_types`, which references `policies`, creating a chain of governance from policy down to individual menu items. The junction tables (`items_ingredients`, `ingredients_items`, `categories_items`, `dishes_items`, `types_items`, `policies_types`, `policies_items`) provide the flexibility to model many-to-many relationships that the direct foreign keys cannot express, while the views materialise the most common join paths as reusable query abstractions.

The naming convention across entities — where `menu_items.name`, `ingredients.name`, `menu_categories.name`, `side_dishes.name`, and `order_types.name` all share values like "Extended Review" and "Pilot Initiative A" — suggests that the domain model treats menu items, ingredients, categories, sides, and order types as interchangeable conceptual roles within a unified product ontology. This is a deliberate modelling choice that simplifies cross-entity lookups at the cost of semantic clarity; in a production system, one might expect distinct naming conventions to disambiguate the roles.

The schema's cardinality constraints are enforced through a combination of foreign keys (e.g., `menu_items.side_dish_id` → `side_dishes.id`, `menu_categories.order_type_id` → `order_types.id`, `order_types.policy_id` → `policies.policy_id`) and boolean flags that act as domain-specific cardinality bounds (e.g., `menu_categories.includes_side`, `side_dishes.is_house_made`, `order_types.requires_advance_notice`). The `minimum_order_quantity` and `minimum_quantity` columns provide numeric cardinality bounds that are enforced at the application layer rather than the database layer.

The twelve views collectively cover all pairwise relationships between the six core entity types, providing a complete set of analytical lenses through which the domain can be queried. Each view answers a specific question by joining two or more base tables, and together they form a comprehensive query interface that abstracts away the complexity of the underlying normalised