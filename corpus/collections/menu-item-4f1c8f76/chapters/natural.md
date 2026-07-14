## The Restaurant Menu Architecture

A restaurant menu is more than a list of dishes; it is a structured catalogue where every item carries pricing, dietary attributes, preparation details, and compositional data. The domain under examination organises this information across five core record types: menu items, menu categories, ingredients, side dishes, and sauces. Each record type captures a distinct facet of the offering, and the relationships between them form the backbone of menu management. A dish such as Extended Review (ITE-2792), priced at 12.87, is not an isolated entry — it belongs to a category, is composed of specific ingredients, may be accompanied by a side dish, and can be paired with a sauce. Understanding how these records interlock is essential for anyone managing a restaurant's product catalogue, whether for point-of-sale integration, allergen reporting, or nutritional analysis.

**Table `menu_items`**

| menu_item_id | item_id | name | price | description | weight | cooking_time | is_vegetarian | is_vegan | menu_category_id | ingredient_id | side_dish_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | Extended Survey | pilot-weight-32 | extended-cooking-63 | true | false | 1 | 1000 | 1 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | Pilot Corridor A | extended-weight-33 | integrated-cooking-64 | false | true | 2 | 1001 | 2 |
| 3 | ITE-2798 | Baseline Model | 29.24 | Baseline Series | integrated-weight-34 | seasonal-cooking-65 | true | false | 3 | 1002 | 3 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | Distributed Assessment | seasonal-weight-35 | regional-cooking-66 | false | true | 4 | 1003 | 4 |

The `menu_items` table is the central entity in the domain. Each row represents a distinct dish offered by the establishment, identified by a surrogate `menu_item_id` and a human-readable `item_id` such as ITE-2792 or ITE-2801. The `name` column carries the dish title — Extended Review, Pilot Initiative A, Baseline Model, Distributed Cluster — while `price` records the monetary value in a standard decimal format. The `description` field provides a brief textual summary, and `weight` and `cooking_time` encode operational attributes that matter to kitchen staff and delivery logistics. Dietary flags, `is_vegetarian` and `is_vegan`, allow the system to filter the menu for customers with dietary restrictions. For instance, Extended Review is marked as vegetarian but not vegan, whereas Pilot Initiative A carries the opposite combination. The `menu_category_id` column links each dish to its broader category, establishing the first of several foreign-key relationships that structure the catalogue.

**Table `menu_categories`**

| menu_category_id | category_id | name | sort_order | menu_item_id |
|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 36 | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 43 | 2 |
| 3 | 1186099 | Baseline Model | 50 | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 57 | 4 |

Menu categories provide the organisational hierarchy. The `menu_categories` table assigns each dish to a named group, identified by `menu_category_id` and a `category_id` that may take the form of a short string like state_et_9 or a UUID such as c744c896-8fcc-11eb-924d-9cd76263cbd0. The `name` column mirrors the dish name in this dataset, and `sort_order` determines the display sequence within the menu interface. A category with sort_order 36 appears before one with sort_order 57, ensuring a consistent presentation order. The relationship between `menu_items` and `menu_categories` is one-to-one in this schema: each dish belongs to exactly one category, and the `menu_category_id` foreign key in `menu_items` points to the corresponding row in `menu_categories`. This structure supports menu navigation, where customers can browse by category before selecting individual dishes.

**Table `ingredients`**

| ingredient_id | name | is_allergen | allergen_type | menu_item_id |
|---|---|---|---|---|
| 1000 | Extended Review | false | pilot-allergen-38 | 1 |
| 1001 | Pilot Initiative A | true | extended-allergen-39 | 2 |
| 1002 | Baseline Model | false | integrated-allergen-40 | 3 |
| 1003 | Distributed Cluster | true | seasonal-allergen-41 | 4 |

Every dish is composed of ingredients, and the `ingredients` table captures this compositional data. Each ingredient record carries an `ingredient_id`, a `name`, and two critical fields for allergen management: `is_allergen` and `allergen_type`. The boolean flag `is_allergen` indicates whether the ingredient poses an allergy risk, while `allergen_type` specifies the nature of that risk — pilot-allergen-38, extended-allergen-39, and so on. In the current dataset, Baseline Model (ingredient_id 1002) is not flagged as an allergen, whereas Distributed Cluster (ingredient_id 1003) carries the allergen flag set to true with allergen_type seasonal-allergen-41. The `menu_item_id` column creates the link back to the dish, establishing that each menu item references a single primary ingredient in this simplified model. This relationship is fundamental for allergen reporting: a system can trace from any dish to its ingredient and immediately surface allergy warnings.

**Table `side_dishes`**

| id | side_id | name | price | description | is_vegetarian | is_vegan | menu_item_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | Extended Survey | true | false | 1 |
| 2 | 937737 | Pilot Initiative A | 35.45 | Pilot Corridor A | false | true | 2 |
| 3 | 6564389 | Baseline Model | 29.24 | Baseline Series | true | false | 3 |
| 4 | 103178 | Distributed Cluster | 29.99 | Distributed Assessment | false | true | 4 |

Side dishes represent optional accompaniments that can be paired with a main course. The `side_dishes` table mirrors the structure of `menu_items` in many respects, carrying its own `id`, `side_id`, `name`, `price`, `description`, and dietary flags. The `side_id` column uses identifiers such as ChIJD7fiBh9u5kcRYJSMaMOCCwQ for Extended Review's side, and 937737 for Pilot Initiative A's. Pricing for sides is tracked independently — Extended Review's side carries a price of 12.87, identical to the main dish, while Distributed Cluster's side is priced at 29.99. The `is_vegetarian` and `is_vegan` flags on sides follow the same convention as on main dishes, allowing the system to present compatible pairings. The `menu_item_id` foreign key ties each side dish to its parent menu item, creating a one-to-one association in this schema. This structure supports à la carte ordering, where customers can add a side to their main course.

**Table `sauces`**

| sauce_id | name | price | description | menu_item_id |
|---|---|---|---|---|
| 100 | Extended Review | 12.87 | Extended Survey | 1 |
| 101 | Pilot Initiative A | 35.45 | Pilot Corridor A | 2 |
| 102 | Baseline Model | 29.24 | Baseline Series | 3 |
| 103 | Distributed Cluster | 29.99 | Distributed Assessment | 4 |

Sauces complete the flavour profile of a dish. The `sauces` table records each sauce with a `sauce_id`, `name`, `price`, and `description`, linked to its parent dish via `menu_item_id`. In the current dataset, each menu item has exactly one associated sauce, identified by sauce_ids 100 through 103. The pricing of sauces is tracked separately from the main dish and side, though in this dataset the sauce price matches the main dish price for every row — Extended Review's sauce costs 12.87, Pilot Initiative A's costs 35.45. The `description` field provides additional context, such as Extended Survey for the sauce paired with Extended Review. This relationship enables detailed flavour customization, where the system can present sauce options alongside each dish and calculate the total order value including sauce additions.

The relationships between these tables become fully visible when joined into analytical views. Each view answers a specific operational question by combining data from two or more base tables.

**View `v_menu_item_menu_category`**

```sql
CREATE VIEW v_menu_item_menu_category AS
SELECT a.menu_item_id, a.item_id, a.name, a.price, b.menu_category_id AS category_menu_category_id, b.category_id AS category_category_id, b.name AS category_name
FROM menu_items a JOIN menu_categories b ON a.menu_category_id = b.menu_category_id;
```

| menu_item_id | item_id | name | price | category_menu_category_id | category_category_id | category_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 1 | state_et_9 | Extended Review |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 3 | ITE-2798 | Baseline Model | 29.24 | 3 | 1186099 | Baseline Model |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_menu_item_menu_category` joins `menu_items` with `menu_categories` on the `menu_category_id` column, producing a flat record that pairs each dish with its category metadata. This view answers the question: "Which category does each menu item belong to, and what are the category's identifying attributes?" The result includes the dish's `menu_item_id`, `item_id`, `name`, and `price`, alongside the category's `menu_category_id`, `category_id`, and `category_name`. For the row corresponding to menu_item_id 1, the view shows that ITE-2792 (Extended Review, priced at 12.87) belongs to category state_et_9, which itself is named Extended Review and has a sort_order of 36. The second row reveals that ITE-2795 (Pilot Initiative A, 35.45) is categorised under the UUID c744c896-8fcc-11eb-924d-9cd76263cbd0, named Pilot Initiative A with sort_order 43. This view is the primary tool for menu rendering, as it provides all the information needed to display dishes grouped by their categories in the correct sort order.

**View `v_menu_item_ingredient`**

```sql
CREATE VIEW v_menu_item_ingredient AS
SELECT a.menu_item_id, a.item_id, a.name, a.price, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.is_allergen AS ingredient_is_allergen
FROM menu_items a JOIN ingredients b ON a.ingredient_id = b.ingredient_id;
```

| menu_item_id | item_id | name | price | ingredient_ingredient_id | ingredient_name | ingredient_is_allergen |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 1000 | Extended Review | false |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 1001 | Pilot Initiative A | true |
| 3 | ITE-2798 | Baseline Model | 29.24 | 1002 | Baseline Model | false |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 1003 | Distributed Cluster | true |

The view `v_menu_item_ingredient` joins `menu_items` with `ingredients` on the `menu_item_id` column, producing a record that associates each dish with its primary ingredient and allergen information. This view answers: "What ingredient is used in each dish, and does it carry allergen warnings?" The joined result surfaces the dish's identifying fields alongside the ingredient's `ingredient_id`, `name`, `is_allergen` flag, and `allergen_type`. For menu_item_id 1, the view shows that Extended Review is composed of ingredient 1000 (named Extended Review), which is not flagged as an allergen but carries the allergen_type pilot-allergen-38. In contrast, the row for menu_item_id 2 reveals that Pilot Initiative A uses ingredient 1001 (Pilot Initiative A), which has `is_allergen` set to true and allergen_type extended-allergen-39. This view is essential for allergen compliance reporting and for displaying ingredient information to customers who require transparency about what goes into their food.

**View `v_menu_item_side_dish`**

```sql
CREATE VIEW v_menu_item_side_dish AS
SELECT a.menu_item_id, a.item_id, a.name, a.price, b.id AS dish_id, b.side_id AS dish_side_id, b.name AS dish_name
FROM menu_items a JOIN side_dishes b ON a.side_dish_id = b.id;
```

| menu_item_id | item_id | name | price | dish_id | dish_side_id | dish_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | 2 | 937737 | Pilot Initiative A |
| 3 | ITE-2798 | Baseline Model | 29.24 | 3 | 6564389 | Baseline Model |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | 4 | 103178 | Distributed Cluster |

The view `v_menu_item_side_dish` joins `menu_items` with `side_dishes` on the `menu_item_id` column, producing a combined record that pairs each main dish with its accompanying side. This view answers: "What side dish is offered with each menu item, and what are the side's pricing and dietary attributes?" The result includes the dish's core fields alongside the side's `id`, `side_id`, `name`, `price`, `description`, and dietary flags. For menu_item_id 1, the view shows that Extended Review is paired with side ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review, priced at 12.87, described as Extended Survey), which is vegetarian but not vegan. The row for menu_item_id 3 reveals that Baseline Model is paired with side 6564389 (Baseline Model, 29.24, Baseline Series), also vegetarian and non-vegan. This view supports combo pricing calculations and dietary compatibility checks between main courses and their sides.

**View `v_menu_category_menu_item`**

```sql
CREATE VIEW v_menu_category_menu_item AS
SELECT a.menu_category_id, a.category_id, a.name, a.sort_order, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM menu_categories a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| menu_category_id | category_id | name | sort_order | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 36 | 1 | ITE-2792 | Extended Review |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 43 | 2 | ITE-2795 | Pilot Initiative A |
| 3 | 1186099 | Baseline Model | 50 | 3 | ITE-2798 | Baseline Model |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 57 | 4 | ITE-2801 | Distributed Cluster |

The view `v_menu_category_menu_item` performs the inverse join of `v_menu_item_menu_category`, starting from `menu_categories` and joining to `menu_items` to produce a category-centric perspective. This view answers: "Which menu items belong to each category, and what are their details?" The result surfaces the category's identifying fields alongside the dish's `menu_item_id`, `item_id`, `name`, `price`, and `description`. For the category identified by state_et_9, the view shows that it contains menu item ITE-2792 (Extended Review, 12.87, described as Extended Survey). The category c744c896-8fcc-11eb-924d-9cd76263cbd0 contains ITE-2795 (Pilot Initiative A, 35.45, Pilot Corridor A). This perspective is useful for category managers who need to review all items within a category, for inventory planning, and for ensuring that each category has a balanced selection of dishes across price points and dietary profiles.

**View `v_ingredient_menu_item`**

```sql
CREATE VIEW v_ingredient_menu_item AS
SELECT a.ingredient_id, a.name, a.is_allergen, a.allergen_type, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM ingredients a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| ingredient_id | name | is_allergen | allergen_type | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | false | pilot-allergen-38 | 1 | ITE-2792 | Extended Review |
| 1001 | Pilot Initiative A | true | extended-allergen-39 | 2 | ITE-2795 | Pilot Initiative A |
| 1002 | Baseline Model | false | integrated-allergen-40 | 3 | ITE-2798 | Baseline Model |
| 1003 | Distributed Cluster | true | seasonal-allergen-41 | 4 | ITE-2801 | Distributed Cluster |

The view `v_ingredient_menu_item` joins `ingredients` with `menu_items` on the `menu_item_id` column, producing an ingredient-centric record that shows which dish each ingredient is used in. This view answers: "For each ingredient, which menu item incorporates it, and what are the dish's details?" The result includes the ingredient's `ingredient_id`, `name`, `is_allergen`, and `allergen_type`, alongside the dish's `menu_item_id`, `item_id`, `name`, `price`, and `description`. For ingredient 1000 (Extended Review, non-allergen with type pilot-allergen-38), the view shows it is used in menu item ITE-2792 (Extended Review, 12.87, Extended Survey). For ingredient 1003 (Distributed Cluster, allergen with type seasonal-allergen-41), the view links it to ITE-2801 (Distributed Cluster, 29.99, Distributed Assessment). This view is valuable for ingredient-level reporting, such as tracking which dishes use a particular supplier's product or which dishes contain a specific allergen.

**View `v_side_dish_menu_item`**

```sql
CREATE VIEW v_side_dish_menu_item AS
SELECT a.id, a.side_id, a.name, a.price, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM side_dishes a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| id | side_id | name | price | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | 1 | ITE-2792 | Extended Review |
| 2 | 937737 | Pilot Initiative A | 35.45 | 2 | ITE-2795 | Pilot Initiative A |
| 3 | 6564389 | Baseline Model | 29.24 | 3 | ITE-2798 | Baseline Model |
| 4 | 103178 | Distributed Cluster | 29.99 | 4 | ITE-2801 | Distributed Cluster |

The view `v_side_dish_menu_item` joins `side_dishes` with `menu_items` on the `menu_item_id` column, producing a side-dish-centric perspective. This view answers: "For each side dish, which menu item is it paired with, and what are the dish's attributes?" The result includes the side's `id`, `side_id`, `name`, `price`, `description`, and dietary flags, alongside the dish's `menu_item_id`, `item_id`, `name`, `price`, and `description`. For side ChIJD7fiBh9u5kcRYJSMaMOCCwQ (Extended Review, 12.87, Extended Survey, vegetarian, non-vegan), the view shows it is paired with menu item ITE-2792 (Extended Review, 12.87, Extended Survey). For side 103178 (Distributed Cluster, 29.99, Distributed Assessment, non-vegetarian, vegan), the view links it to ITE-2801 (Distributed Cluster, 29.99, Distributed Assessment). This view supports side-dish inventory management and helps identify which sides are most commonly ordered with which main courses.

**View `v_sauce_menu_item`**

```sql
CREATE VIEW v_sauce_menu_item AS
SELECT a.sauce_id, a.name, a.price, a.description, b.menu_item_id AS item_menu_item_id, b.item_id AS item_item_id, b.name AS item_name
FROM sauces a JOIN menu_items b ON a.menu_item_id = b.menu_item_id;
```

| sauce_id | name | price | description | item_menu_item_id | item_item_id | item_name |
|---|---|---|---|---|---|---|
| 100 | Extended Review | 12.87 | Extended Survey | 1 | ITE-2792 | Extended Review |
| 101 | Pilot Initiative A | 35.45 | Pilot Corridor A | 2 | ITE-2795 | Pilot Initiative A |
| 102 | Baseline Model | 29.24 | Baseline Series | 3 | ITE-2798 | Baseline Model |
| 103 | Distributed Cluster | 29.99 | Distributed Assessment | 4 | ITE-2801 | Distributed Cluster |

The view `v_sauce_menu_item` joins `sauces` with `menu_items` on the `menu_item_id` column, producing a sauce-centric record that shows which dish each sauce accompanies. This view answers: "For each sauce, which menu item is it paired with, and what are the dish's details?" The result includes the sauce's `sauce_id`, `name`, `price`, and `description`, alongside the dish's `menu_item_id`, `item_id`, `name`, `price`, and `description`. For sauce 100 (Extended Review, 12.87, Extended Survey), the view shows it accompanies menu item ITE-2792 (Extended Review, 12.87, Extended Survey). For sauce 103 (Distributed Cluster, 29.99, Distributed Assessment), the view links it to ITE-2801 (Distributed Cluster, 29.99, Distributed Assessment). This view is useful for sauce inventory tracking, flavour profile analysis, and calculating the total cost of a dish including its sauce component.

The five base tables and seven views together form a coherent data model for restaurant menu management. The base tables capture discrete aspects of the offering — what is sold, how it is grouped, what it contains, what accompanies it, and what flavours it carries. The views synthesise these aspects into analytical perspectives that answer specific operational questions: which category does a dish belong to, what allergens does it contain, what side is paired with it, and which sauce completes it. The foreign-key relationships, anchored by `menu_item_id` and `menu_category_id`, ensure that every dish can be traced through its category, ingredient, side, and sauce in a single query. This structure supports everything from customer-facing menu displays to backend allergen compliance reports, making it a practical foundation for any restaurant's digital operations.