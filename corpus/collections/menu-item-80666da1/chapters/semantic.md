## Ontology-Grounded Schema Design for a Restaurant Menu Domain

A restaurant menu is not a flat list of dishes; it is a structured knowledge base in which every food item participates in multiple taxonomies—ingredient composition, side-dish pairing, sauce assignment, and section-based navigation. The relational model captures this multi-dimensional structure by decomposing the menu into five base tables, three junction tables, and nine materialized views. Each base table isolates a single concept from the domain ontology, and each view reassembles the normalized pieces into a question-oriented fact. The following sections walk through the entity types, their attributes, the foreign-key topology that binds them, and the view-level joins that reconstruct domain facts.

**Table `menu_items`**

| menu_item_id | item_id | name | price | weight | cooking_time | is_vegetarian | is_vegan | category | side_dish_side_id | section_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | pilot-weight-32 | 44 | true | false | compact-category-92 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | 195362 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | extended-weight-33 | 55 | false | true | composite-category-93 | 937737 | 7731870 |
| 3 | ITE-2798 | Baseline Model | 29.24 | integrated-weight-34 | 66 | true | false | primary-category-94 | 6564389 | 4447016 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | seasonal-weight-35 | 77 | false | true | adaptive-category-95 | 103178 | 3001009030220 |

The `menu_items` table is the central entity of the menu ontology. Every row represents a distinct dish offered by the restaurant, identified by a surrogate primary key `menu_item_id` and a business identifier `item_id` (for example, `ITE-2792` for "Extended Review"). The remaining columns capture the item's descriptive and operational attributes: `name` stores the human-readable label, `price` records the unit cost, `weight` carries a categorical weight descriptor such as `pilot-weight-32`, and `cooking_time` stores an integer in minutes. Boolean flags `is_vegetarian` and `is_vegan` encode dietary constraints, while `category` classifies the item into a thematic bucket like `compact-category-92`. Two foreign keys anchor the row to other ontological dimensions: `side_dish_side_id` references the `side_dishes` table, and `section_id` references the `menu_sections` table. In the sample data, "Extended Review" (`menu_item_id = 1`) is vegetarian but not vegan, priced at 12.87, and belongs to section `195362`.

**Table `ingredients`**

| id | ingredient_id | name | is_allergen | allergen_category | origin | form | menu_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | false | gluten | distributed-origin-66 | raw | 1 |
| 2 | 5844284 | Pilot Initiative A | true | crustaceans | baseline-origin-67 | processed | 2 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | false | molluscs | pilot-origin-68 | cooked | 3 |
| 4 | 2087735 | Distributed Cluster | true | milk | extended-origin-69 | sauce | 4 |

The `ingredients` table models the atomic food components that compose menu items. Each row carries a surrogate `id`, a business `ingredient_id`, a `name`, and a rich set of metadata: `is_allergen` (a boolean), `allergen_category` (e.g., `gluten`, `crustaceans`, `milk`), `origin` (a categorical string such as `distributed-origin-66`), and `form` (one of `raw`, `processed`, `cooked`, `sauce`). The column `menu_item_id` is a foreign key back to `menu_items`, establishing a many-to-one relationship from ingredient to the dish it belongs to. In the data, ingredient `id = 1` named "Extended Review" is marked as non-allergenic, originates from `distributed-origin-66`, and is in `raw` form; it is linked to `menu_item_id = 1`. By contrast, ingredient `id = 2` ("Pilot Initiative A") carries the allergen flag `true` with `allergen_category = crustaceans`, illustrating how the model captures safety-critical information at the ingredient level.

**Table `side_dishes`**

| side_id | name | price | preparation_style | is_vegetarian | is_vegan | menu_item_id |
|---|---|---|---|---|---|---|
| ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | chipped | true | false | 1 |
| 937737 | Pilot Initiative A | 35.45 | mashed | false | true | 2 |
| 6564389 | Baseline Model | 29.24 | steamed | true | false | 3 |
| 103178 | Distributed Cluster | 29.99 | buttered | false | true | 4 |

Side dishes form a parallel entity type to menu items, stored in the `side_dishes` table. Each row is identified by `side_id` (which doubles as a business identifier, e.g., `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), and carries `name`, `price`, `preparation_style` (such as `chipped`, `mashed`, `steamed`, `buttered`), and the same dietary boolean flags `is_vegetarian` and `is_vegan`. The column `menu_item_id` is a foreign key to `menu_items`, indicating which main dish the side is paired with. The sample shows "Extended Review" as a side dish with `preparation_style = chipped`, priced at 12.87, and paired to `menu_item_id = 1`. The one-to-one pairing between a menu item and its side is enforced by the fact that each `menu_item_id` appears at most once in `side_dishes`, and symmetrically at most once in `menu_items.side_dish_side_id`.

**Table `sauces`**

| id | sauce_id | name | price | base_ingredient | is_spicy | menu_item_id |
|---|---|---|---|---|---|---|
| 1 | 4985159 | Extended Review | 12.87 | pilot-base-20 | true | 1 |
| 2 | 1186095 | Pilot Initiative A | 35.45 | extended-base-21 | false | 2 |
| 3 | 4277037 | Baseline Model | 29.24 | integrated-base-22 | true | 3 |
| 4 | 99835 | Distributed Cluster | 29.99 | seasonal-base-23 | false | 4 |

The `sauces` table captures the sauce dimension of the menu. Each row has a surrogate `id`, a business `sauce_id`, a `name`, a `price`, a `base_ingredient` descriptor (e.g., `pilot-base-20`, `extended-base-21`), a boolean `is_spicy`, and a foreign key `menu_item_id` linking the sauce to its parent dish. In the data, sauce `id = 1` ("Extended Review") is spicy, uses `pilot-base-20` as its base, and is associated with `menu_item_id = 1`. Like side dishes, the model enforces a one-to-one sauce-to-menu-item relationship through the `menu_item_id` column.

**Table `menu_sections`**

| section_id | name | sort_order | created_at | updated_at |
|---|---|---|---|---|
| 195362 | Extended Review | 36 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 7731870 | Pilot Initiative A | 43 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4447016 | Baseline Model | 50 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 3001009030220 | Distributed Cluster | 57 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Menu sections provide the navigational taxonomy. The `menu_sections` table stores each section with a surrogate `section_id`, a `name`, a `sort_order` integer (e.g., `36`, `43`, `50`, `57`), and audit timestamps `created_at` and `updated_at`. The section "Extended Review" (`section_id = 195362`) has `sort_order = 36` and was created on `2025-01-01`. This table is referenced by `menu_items.section_id`, establishing a many-to-one relationship: many menu items can belong to the same section, but each item belongs to exactly one section.

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

The `items_ingredients` table is a junction table that resolves the many-to-many relationship between `menu_items` and `ingredients`. Its composite primary key consists of `menu_item_id` and `ingredient_id`, both of which are foreign keys referencing their respective base tables. The sample data reveals that `menu_item_id = 1` ("Extended Review") is composed of two ingredients (`ingredient_id = 1` and `ingredient_id = 2`), while `menu_item_id = 4` ("Distributed Cluster") is composed of `ingredient_id = 4` and `ingredient_id = 1`. This table is the materialization of the ontology's composition relationship, allowing any menu item to be associated with zero, one, or many ingredients.

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

The `dishes_ingredients` table serves as an additional junction layer, providing a separate composition pathway for dishes distinct from the general `items_ingredients` mapping. Its structure mirrors that of `items_ingredients`, with foreign keys to both `menu_items` and `ingredients`, enabling the model to distinguish between ingredient composition at the dish level versus the item level.

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

The `sauces_ingredients` table captures the composition of sauces themselves, linking sauce entities to their constituent ingredients. This junction table allows the ontology to express that a sauce is not an atomic entity but is itself composed of ingredients, creating a recursive composition hierarchy where sauces contain ingredients just as menu items contain ingredients.

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

The `sections_items` table is a junction table that resolves the relationship between `menu_sections` and `menu_items`. While `menu_items.section_id` provides a direct foreign key reference, this explicit junction table allows for additional metadata to be stored on the section-to-item relationship and supports scenarios where the same item might appear in multiple sections with different contextual attributes.

The foreign-key topology of the schema can be summarized as follows. `menu_items` is the hub: it references `side_dishes` through `side_dish_side_id` and `menu_sections` through `section_id`. `ingredients`, `side_dishes`, and `sauces` each reference `menu_items` through their own `menu_item_id` columns, creating a fan-out from the central entity. The junction tables `items_ingredients`, `dishes_ingredients`, `sauces_ingredients`, and `sections_items` bridge the remaining many-to-many relationships. This star-and-junction topology ensures that every domain fact can be reconstructed through a small number of joins.

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

The view `vw_menu_item_ingredient_detail` answers the question: "What ingredients compose each menu item, and what are their properties?" It joins `menu_items` to `items_ingredients` and then to `ingredients`, projecting the item's name alongside each ingredient's name, allergen status, and form. Reading the sample data, the view would produce a row showing "Extended Review" (`menu_item_id = 1`) paired with ingredient "Extended Review" (id 1, non-allergenic, raw form), and a second row showing the same menu item paired with ingredient "Pilot Initiative A" (id 2, allergenic, crustaceans, processed form). This view is the primary tool for dietary compliance checks, as it surfaces allergen information at the item level.

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

The view `vw_menu_item_side_dish` answers: "What side dish is paired with each menu item, and what are its attributes?" It joins `menu_items` to `side_dishes` on the matching `menu_item_id`, projecting the item name, side dish name, preparation style, and price. In the sample, the view would show "Extended Review" paired with a side dish also named "Extended Review" prepared `chipped` style at a price of 12.87. This view supports menu bundling queries, such as listing all items with their recommended sides.

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

The view `vw_menu_item_menu_section` answers: "Which menu section does each item belong to, and in what order should sections be displayed?" It joins `menu_items` to `menu_sections` on `section_id`, projecting the item name, section name, and `sort_order`. The sample data yields a row showing "Extended Review" in section "Extended Review" (`sort_order = 36`), and "Distributed Cluster" in section "Distributed Cluster" (`sort_order = 57`). This view drives the front-end menu navigation, ensuring items are rendered in the correct section order.

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

The view `vw_ingredient_menu_item` inverts the composition perspective, answering: "Which menu items use this ingredient?" It joins `ingredients` to `items_ingredients` and then to `menu_items`, projecting the ingredient name alongside the names of all menu items that contain it. For example, ingredient "Extended Review" (id 1) would appear in rows for both `menu_item_id = 1` and `menu_item_id = 4`, revealing that this ingredient is shared across multiple dishes. This view supports ingredient-level analytics, such as identifying which dishes contain a specific allergen.

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

The view `vw_side_dish_menu_item` provides the inverse of `vw_menu_item_side_dish`, answering: "Which menu items are paired with this side dish?" It joins `side_dishes` to `menu_items` on `menu_item_id`, projecting the side dish name alongside the associated menu item name. In the sample, the side dish "Extended Review" (side_id `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`) is paired with menu item "Extended Review" (`menu_item_id = 1`). This view is useful for side-dish inventory planning and for identifying which main dishes drive demand for a particular side.

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

The view `vw_side_dish_ingredient_detail` answers a compositional question about side dishes: "What ingredients are associated with each side dish?" It joins `side_dishes` through `menu_items` to `items_ingredients` and `ingredients`, effectively tracing the ingredient composition of the menu item that a side dish is paired with. This view enables queries such as "list all side dishes whose paired main item contains gluten," supporting allergen-aware side-dish recommendations.

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

The view `vw_sauce_menu_item` answers: "What sauce accompanies each menu item, and is it spicy?" It joins `sauces` to `menu_items` on `menu_item_id`, projecting the item name, sauce name, base ingredient, and the `is_spicy` flag. The sample data shows "Extended Review" paired with a spicy sauce using `pilot-base-20` as its base. This view supports flavor-profile queries, such as listing all non-spicy options for customers with sensitivity to heat.

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

The view `vw_sauce_ingredient_detail` answers: "What ingredients compose the sauce that accompanies each menu item?" It joins `sauces` to `sauces_ingredients` and then to `ingredients`, projecting the menu item name, sauce name, and the ingredient details. This view enables granular sauce-level allergen analysis, revealing which ingredients in a sauce might trigger dietary restrictions. For instance, if a sauce's base ingredient is allergenic, this view surfaces that fact alongside the menu item it accompanies.

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

The view `vw_menu_section_menu_item_detail` answers: "What is the complete detail of each menu item within its section, including pricing and dietary flags?" It joins `menu_sections` to `sections_items` and then to `menu_items`, projecting the section name, sort order, item name, price, weight, cooking time, and dietary flags. The sample data yields a row showing section "Extended Review" (`sort_order = 36`) containing item "Extended Review" priced at 12.87, weighing `pilot-weight-32`, with a cooking time of 44 minutes, and marked as vegetarian but not vegan. This view is the primary rendering surface for the menu interface, providing all the information needed to display a sectioned menu with full item details.

The materialization strategy of this schema reflects a deliberate trade-off between normalization and query convenience. The five base tables (`menu_items`, `ingredients`, `side_dishes`, `sauces`, `menu_sections`) and three junction tables (`items_ingredients`, `dishes_ingredients`, `sauces_ingredients`, `sections_items`) enforce first normal form and eliminate redundancy: an ingredient's allergen status is stored once in `ingredients`, not duplicated across every menu item that uses it. The nine views then materialize the denormalized facts that application code needs without requiring every query to perform the full join chain. Each view corresponds to a single domain question, and its join path is minimal and deterministic. For example, `vw_menu_item_menu_section` requires exactly one join, while `vw_menu_item_ingredient_detail` requires two. This separation of concerns—base tables for data integrity, views for query ergonomics—ensures that the schema remains maintainable as the menu grows and as new ontological dimensions (such as nutritional data or supplier information) are added in the future.