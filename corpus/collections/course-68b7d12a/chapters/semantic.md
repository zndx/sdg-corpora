The restaurant domain under examination models a multi-tiered menu architecture where dining establishments offer structured tasting experiences composed of sequential courses, each containing one or more dishes drawn from a broader catalogue of ingredients. A restaurant hosts one or more fixed-price menus, each valid within a date range and priced per person; each menu sequences courses—first course, second course, dessert—and each course groups menu items that share a common structural role. Ingredients, annotated with allergen and organic flags, are linked to menu items through associative tables that capture many-to-many composition. The following sections walk through the entity types, their attributes, the junction tables that resolve cardinality-bounded relationships, and the materialized views that reassemble normalized rows into domain-level facts.

## Core Entity Types and Their Attributes

The schema centres on five base tables that capture the principal domain concepts. The `restaurants` table anchors the hierarchy, storing each establishment's identity and operational metadata. Its primary key `id` is an integer identifier; the `restaurant_name` column holds values such as `Baseline Protocol D`, `Distributed Programme`, `Adaptive Standard`, and `Primary Framework A`. Supporting columns `address`, `phone`, `operating_hours`, and `cuisine_type` carry categorical descriptors like `integrated-cuisine-52` and `seasonal-cuisine-53`.

**Table `restaurants`**

| id | restaurant_name | address | phone | operating_hours | cuisine_type |
|---|---|---|---|---|---|
| 100 | Baseline Protocol D | distributed-address-72 | compact-phone-26 | pilot-operatin-50 | integrated-cuisine-52 |
| 101 | Distributed Programme | baseline-address-73 | composite-phone-27 | extended-operatin-51 | seasonal-cuisine-53 |
| 102 | Adaptive Standard | pilot-address-74 | primary-phone-28 | integrated-operatin-52 | regional-cuisine-54 |
| 103 | Primary Framework A | extended-address-75 | adaptive-phone-29 | seasonal-operatin-53 | legacy-cuisine-55 |

Each restaurant offers one or more `fixed_price_menus`, modelled in the `fixed_price_menus` table. The table's primary key `id` is an integer, while `menu_name` carries labels such as `Pilot Review`, `Baseline Initiative`, `Distributed Model A`, and `Adaptive Cluster`. Pricing is captured in `price_per_person` (e.g., `17.12`, `18.59`, `47.66`, `19.72`), and the boolean flags `tax_included` and `gratuity_included` indicate whether those charges are baked into the quoted price. Temporal validity is expressed through `valid_from` and `valid_until` timestamps; for instance, the menu `Pilot Review` is valid from `2025-12-17T11:09:00` until `2023-06-09T17:15:00`. A foreign key `restaurant_id` links each menu back to its parent restaurant, so menu `1` (Pilot Review) belongs to restaurant `100` (Baseline Protocol D).

**Table `fixed_price_menus`**

| id | menu_name | price_per_person | tax_included | gratuity_included | valid_from | valid_until | restaurant_id |
|---|---|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | false | true | 2025-12-17T11:09:00 | 2023-06-09T17:15:00 | 100 |
| 2 | Baseline Initiative | 18.59 | true | false | 2022-05-01T18:26:00 | 2024-11-20T00:32:00 | 101 |
| 3 | Distributed Model A | 47.66 | false | true | 2023-10-12T01:43:00 | 2025-04-04T07:49:00 | 102 |
| 4 | Adaptive Cluster | 19.72 | true | false | 2024-03-23T08:00:00 | 2022-09-15T14:06:00 | 103 |

Courses represent the sequential structure within a fixed-price menu. The `courses` table stores each course's `id`, a `course_number` that orders it within the menu (values `1`, `2`, `3`), and a `course_type` column with values such as `FIRST COURSE`, `SECOND COURSE`, and `DESSERT`. The boolean `is_choice` flag indicates whether the diner may select among items in that course; course `101` (Pilot Corridor A, type `SECOND COURSE`) has `is_choice = true`, whereas course `100` (Extended Survey, type `FIRST COURSE`) has `is_choice = false`. The `description` column carries free-text labels like `Extended Survey` and `Distributed Assessment`. A foreign key `fixed_price_menu_id` ties each course to its parent menu, so course `100` belongs to fixed-price menu `1` (Pilot Review).

**Table `courses`**

| id | course_number | course_type | is_choice | description | fixed_price_menu_id |
|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | false | Extended Survey | 1 |
| 101 | 2 | SECOND COURSE | true | Pilot Corridor A | 2 |
| 102 | 3 | DESSERT | false | Baseline Series | 3 |
| 103 | 1 | FIRST COURSE | true | Distributed Assessment | 4 |

Menu items are the leaf-level offerings that diners actually consume. The `menu_items` table stores each item's `id`, `item_name` (e.g., `Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, `Pilot Assessment`), `price` (ranging from `12.87` to `35.45`), and `is_available` (a boolean; `Seasonal Survey` is available, while `Integrated Corridor` is not). Additional attributes include `preparation_method` (values like `pilot-preparat-56`), `serving_size` (e.g., `primary-serving-40`), and `allergen_info` (e.g., `distributed-allergen-72`). A foreign key `course_id` links each menu item to its parent course, so item `1` (Seasonal Survey) belongs to course `100`.

**Table `menu_items`**

| id | item_name | price | is_available | preparation_method | serving_size | allergen_info | course_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | true | pilot-preparat-56 | primary-serving-40 | distributed-allergen-72 | 100 |
| 2 | Integrated Corridor | 35.45 | false | extended-preparat-57 | adaptive-serving-41 | baseline-allergen-73 | 101 |
| 3 | Extended Series D | 29.24 | true | integrated-preparat-58 | distributed-serving-42 | pilot-allergen-74 | 102 |
| 4 | Pilot Assessment | 29.99 | false | seasonal-preparat-59 | baseline-serving-43 | extended-allergen-75 | 103 |

Ingredients capture the atomic components used across the menu. The `ingredients` table stores each ingredient's `id`, `ingredient_name` (e.g., `Pilot Assessment`, `Baseline Survey`, `Distributed Corridor A`, `Adaptive Series`), and three boolean or categorical flags: `is_allergen` (e.g., `Baseline Survey` is an allergen, while `Pilot Assessment` is not), `origin` (values like `distributed-origin-66`), and `is_organic` (e.g., `Baseline Survey` is organic, while `Pilot Assessment` is not).

**Table `ingredients`**

| id | ingredient_name | is_allergen | origin | is_organic |
|---|---|---|---|---|
| 1 | Pilot Assessment | false | distributed-origin-66 | false |
| 2 | Baseline Survey | true | baseline-origin-67 | true |
| 3 | Distributed Corridor A | false | pilot-origin-68 | false |
| 4 | Adaptive Series | true | extended-origin-69 | true |

## Junction Tables and Many-to-Many Relationships

Several junction tables resolve relationships that exceed simple one-to-many cardinality. The `courses_items` table maps courses to their constituent menu items, allowing a single course to contain multiple items. For example, course `100` is associated with menu items `1` and `2`, while course `101` links to items `2` and `3`. The table's composite key consists of `course_id` and `menu_item_id`, and its rows include `(100, 1)`, `(100, 2)`, `(101, 2)`, `(101, 3)`, `(102, 3)`, `(102, 4)`, `(103, 4)`, and `(103, 1)`.

**Table `courses_items`**

| course_id | menu_item_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `items_ingredients` and `ingredients_items` tables both model the many-to-many relationship between menu items and ingredients, with each row pairing an item identifier with an ingredient identifier. These associative tables enable a single ingredient to appear in multiple menu items and a single menu item to contain multiple ingredients. The naming convention distinguishes the two tables by column ordering, but both serve the same semantic purpose of materializing the composition graph.

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

**Table `ingredients_items`**

| ingredient_id | menu_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `menus_courses` table links fixed-price menus to their constituent courses, providing an explicit mapping that complements the `courses.fixed_price_menu_id` foreign key. This junction table allows a menu to define a custom ordering of courses that may differ from the natural `course_number` sequence.

**Table `menus_courses`**

| fixed_price_menu_id | course_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Similarly, the `restaurants_menus` table links restaurants to their fixed-price menus, providing an explicit mapping that complements the `fixed_price_menus.restaurant_id` foreign key. This allows a restaurant to offer multiple menus and for the schema to capture additional metadata about each restaurant–menu pairing if needed.

**Table `restaurants_menus`**

| restaurant_id | fixed_price_menu_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

## Materialized Views

The schema includes eight materialized views that join normalized tables to present domain-level facts in a single, queryable result set. Each view answers a specific analytical question by reconstructing a coherent narrative from the underlying relational structure.

The view `v_course_menu_item_detail` joins `courses` with `menu_items` through the `courses_items` junction table, producing one row per course–item pairing enriched with the course's type and the item's price and availability. For instance, the row for course `100` (Extended Survey, type `FIRST COURSE`) paired with item `1` (Seasonal Survey, price `12.87`, available) tells a server or a diner exactly which dishes are offered under that course heading.

**View `v_course_menu_item_detail`**

```sql
CREATE VIEW v_course_menu_item_detail AS
SELECT a.id, a.course_number, a.course_type, b.id AS item_id, b.item_name AS item_item_name, b.price AS item_price
FROM courses a
  JOIN courses_items j ON j.course_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | course_number | course_type | item_id | item_item_name | item_price |
|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | 1 | Seasonal Survey | 12.87 |
| 100 | 1 | FIRST COURSE | 2 | Integrated Corridor | 35.45 |
| 101 | 2 | SECOND COURSE | 2 | Integrated Corridor | 35.45 |
| 101 | 2 | SECOND COURSE | 3 | Extended Series D | 29.24 |
| 102 | 3 | DESSERT | 3 | Extended Series D | 29.24 |
| 102 | 3 | DESSERT | 4 | Pilot Assessment | 29.99 |
| 103 | 1 | FIRST COURSE | 4 | Pilot Assessment | 29.99 |
| 103 | 1 | FIRST COURSE | 1 | Seasonal Survey | 12.87 |

The view `v_course_fixed_price_menu` joins `courses` with `fixed_price_menus` via the `courses.fixed_price_menu_id` foreign key, producing one row per course enriched with the parent menu's name, price, and validity window. The row for course `100` (Extended Survey) joined with menu `1` (Pilot Review, price `17.12`, valid from `2025-12-17T11:09:00` to `2023-06-09T17:15:00`) allows a query to answer which menu a given course belongs to and at what total price.

**View `v_course_fixed_price_menu`**

```sql
CREATE VIEW v_course_fixed_price_menu AS
SELECT a.id, a.course_number, a.course_type, a.is_choice, b.id AS menu_id, b.menu_name AS menu_menu_name, b.price_per_person AS menu_price_per_person
FROM courses a JOIN fixed_price_menus b ON a.fixed_price_menu_id = b.id;
```

| id | course_number | course_type | is_choice | menu_id | menu_menu_name | menu_price_per_person |
|---|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | false | 1 | Pilot Review | 17.12 |
| 101 | 2 | SECOND COURSE | true | 2 | Baseline Initiative | 18.59 |
| 102 | 3 | DESSERT | false | 3 | Distributed Model A | 47.66 |
| 103 | 1 | FIRST COURSE | true | 4 | Adaptive Cluster | 19.72 |

The view `v_menu_item_course` joins `menu_items` with `courses` through the `menu_items.course_id` foreign key, producing one row per menu item enriched with its parent course's number, type, and choice flag. The row for item `1` (Seasonal Survey) joined with course `100` (course number `1`, type `FIRST COURSE`, not a choice) tells a diner the structural role of the dish within the tasting sequence.

**View `v_menu_item_course`**

```sql
CREATE VIEW v_menu_item_course AS
SELECT a.id, a.item_name, a.price, a.is_available, b.id AS course_id, b.course_number AS course_course_number, b.course_type AS course_course_type
FROM menu_items a JOIN courses b ON a.course_id = b.id;
```

| id | item_name | price | is_available | course_id | course_course_number | course_course_type |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | true | 100 | 1 | FIRST COURSE |
| 2 | Integrated Corridor | 35.45 | false | 101 | 2 | SECOND COURSE |
| 3 | Extended Series D | 29.24 | true | 102 | 3 | DESSERT |
| 4 | Pilot Assessment | 29.99 | false | 103 | 1 | FIRST COURSE |

The view `v_menu_item_ingredient_detail` joins `menu_items` with `ingredients` through the `items_ingredients` or `ingredients_items` junction tables, producing one row per item–ingredient pairing enriched with the ingredient's allergen status and organic flag. The row for item `1` (Seasonal Survey) paired with ingredient `1` (Pilot Assessment, not an allergen, not organic) allows a diner with dietary restrictions to trace every component of a dish.

**View `v_menu_item_ingredient_detail`**

```sql
CREATE VIEW v_menu_item_ingredient_detail AS
SELECT a.id, a.item_name, a.price, b.id AS ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_allergen AS ingredient_is_allergen
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | item_name | price | ingredient_id | ingredient_ingredient_name | ingredient_is_allergen |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | 1 | Pilot Assessment | false |
| 1 | Seasonal Survey | 12.87 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 35.45 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 35.45 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 29.24 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 29.24 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 29.99 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 29.99 | 1 | Pilot Assessment | false |

The view `v_ingredient_menu_item_detail` is the inverse of `v_menu_item_ingredient_detail`, joining `ingredients` with `menu_items` to produce one row per ingredient–item pairing. The row for ingredient `2` (Baseline Survey, allergen, organic) paired with its associated menu items allows a query to answer which dishes contain a specific ingredient, supporting allergen-aware menu filtering.

**View `v_ingredient_menu_item_detail`**

```sql
CREATE VIEW v_ingredient_menu_item_detail AS
SELECT a.id, a.ingredient_name, a.is_allergen, b.id AS item_id, b.item_name AS item_item_name, b.price AS item_price
FROM ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | ingredient_name | is_allergen | item_id | item_item_name | item_price |
|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | 1 | Seasonal Survey | 12.87 |
| 1 | Pilot Assessment | false | 2 | Integrated Corridor | 35.45 |
| 2 | Baseline Survey | true | 2 | Integrated Corridor | 35.45 |
| 2 | Baseline Survey | true | 3 | Extended Series D | 29.24 |
| 3 | Distributed Corridor A | false | 3 | Extended Series D | 29.24 |
| 3 | Distributed Corridor A | false | 4 | Pilot Assessment | 29.99 |
| 4 | Adaptive Series | true | 4 | Pilot Assessment | 29.99 |
| 4 | Adaptive Series | true | 1 | Seasonal Survey | 12.87 |

The view `v_fixed_price_menu_course_detail` joins `fixed_price_menus` with `courses` via the `courses.fixed_price_menu_id` foreign key, producing one row per course enriched with the parent menu's name, price, and restaurant linkage. The row for menu `1` (Pilot Review, price `17.12`) joined with course `100` (Extended Survey, type `FIRST COURSE`) allows a diner to see the full course-by-course breakdown of a tasting menu's total price.

**View `v_fixed_price_menu_course_detail`**

```sql
CREATE VIEW v_fixed_price_menu_course_detail AS
SELECT a.id, a.menu_name, a.price_per_person, b.id AS course_id, b.course_number AS course_course_number, b.course_type AS course_course_type
FROM fixed_price_menus a
  JOIN menus_courses j ON j.fixed_price_menu_id = a.id
  JOIN courses b ON b.id = j.course_id;
```

| id | menu_name | price_per_person | course_id | course_course_number | course_course_type |
|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | 100 | 1 | FIRST COURSE |
| 1 | Pilot Review | 17.12 | 101 | 2 | SECOND COURSE |
| 2 | Baseline Initiative | 18.59 | 101 | 2 | SECOND COURSE |
| 2 | Baseline Initiative | 18.59 | 102 | 3 | DESSERT |
| 3 | Distributed Model A | 47.66 | 102 | 3 | DESSERT |
| 3 | Distributed Model A | 47.66 | 103 | 1 | FIRST COURSE |
| 4 | Adaptive Cluster | 19.72 | 103 | 1 | FIRST COURSE |
| 4 | Adaptive Cluster | 19.72 | 100 | 1 | FIRST COURSE |

The view `v_fixed_price_menu_restaurant` joins `fixed_price_menus` with `restaurants` via the `fixed_price_menus.restaurant_id` foreign key, producing one row per menu enriched with the restaurant's name, cuisine type, and contact information. The row for menu `1` (Pilot Review, price `17.12`) joined with restaurant `100` (Baseline Protocol D, cuisine `integrated-cuisine-52`) allows a query to answer which restaurant offers a given tasting menu and what style of cuisine it represents.

**View `v_fixed_price_menu_restaurant`**

```sql
CREATE VIEW v_fixed_price_menu_restaurant AS
SELECT a.id, a.menu_name, a.price_per_person, a.tax_included, b.id AS restaurant_id, b.restaurant_name AS restaurant_restaurant_name, b.address AS restaurant_address
FROM fixed_price_menus a JOIN restaurants b ON a.restaurant_id = b.id;
```

| id | menu_name | price_per_person | tax_included | restaurant_id | restaurant_restaurant_name | restaurant_address |
|---|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | false | 100 | Baseline Protocol D | distributed-address-72 |
| 2 | Baseline Initiative | 18.59 | true | 101 | Distributed Programme | baseline-address-73 |
| 3 | Distributed Model A | 47.66 | false | 102 | Adaptive Standard | pilot-address-74 |
| 4 | Adaptive Cluster | 19.72 | true | 103 | Primary Framework A | extended-address-75 |

The view `v_restaurant_fixed_price_menu_detail` joins `restaurants` with `fixed_price_menus` and optionally with `courses` and `menu_items` to produce a comprehensive row per restaurant–menu pairing enriched with all downstream details. The row for restaurant `100` (Baseline Protocol D) joined with menu `1` (Pilot Review, price `17.12`) and its courses and items provides a complete, denormalized snapshot of one restaurant's tasting offering, suitable for a menu display or a pricing comparison across establishments.

**View `v_restaurant_fixed_price_menu_detail`**

```sql
CREATE VIEW v_restaurant_fixed_price_menu_detail AS
SELECT a.id, a.restaurant_name, a.address, b.id AS menu_id, b.menu_name AS menu_menu_name, b.price_per_person AS menu_price_per_person
FROM restaurants a
  JOIN restaurants_menus j ON j.restaurant_id = a.id
  JOIN fixed_price_menus b ON b.id = j.fixed_price_menu_id;
```

| id | restaurant_name | address | menu_id | menu_menu_name | menu_price_per_person |
|---|---|---|---|---|---|
| 100 | Baseline Protocol D | distributed-address-72 | 1 | Pilot Review | 17.12 |
| 100 | Baseline Protocol D | distributed-address-72 | 2 | Baseline Initiative | 18.59 |
| 101 | Distributed Programme | baseline-address-73 | 2 | Baseline Initiative | 18.59 |
| 101 | Distributed Programme | baseline-address-73 | 3 | Distributed Model A | 47.66 |
| 102 | Adaptive Standard | pilot-address-74 | 3 | Distributed Model A | 47.66 |
| 102 | Adaptive Standard | pilot-address-74 | 4 | Adaptive Cluster | 19.72 |
| 103 | Primary Framework A | extended-address-75 | 4 | Adaptive Cluster | 19.72 |
| 103 | Primary Framework A | extended-address-75 | 1 | Pilot Review | 17.12 |

## Closing Synthesis

The schema models a restaurant domain where entities are decomposed into their most atomic, reusable components: restaurants host menus, menus sequence courses, courses group items, and items compose ingredients. Foreign keys (`courses.fixed_price_menu_id`, `menu_items.course_id`, `fixed_price_menus.restaurant_id`) enforce the primary hierarchical containment, while junction tables (`courses_items`, `items_ingredients`, `ingredients_items`, `menus_courses`, `restaurants_menus`) resolve the many-to-many relationships that arise when a single course contains multiple items, a single item contains multiple ingredients, or a restaurant offers multiple menus. The materialized views reassemble these normalized pieces into domain-level narratives—course–item pairings, menu–course breakdowns, ingredient–item compositions, and restaurant–menu summaries—each answering a specific analytical question without requiring the consumer to reconstruct the join logic manually. The result is a schema that is both rigorously normalized for data integrity and richly queryable through views that mirror the way diners, servers, and analysts actually reason about menus.