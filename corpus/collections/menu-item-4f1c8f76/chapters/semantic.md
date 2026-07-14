The domain under examination is a restaurant menu management system, where culinary items are organized into categories, enriched with ingredient profiles, paired with side dishes, and optionally accompanied by sauces. At its core, the schema revolves around a central entity — the menu item — which acts as the anchor for all other domain concepts. Each menu item carries a rich set of attributes: a surrogate key `menu_item_id`, a business identifier `item_id` (such as `ITE-2792` or `ITE-2795`), a human-readable `name` like *Extended Review* or *Pilot Initiative A*, a `price` (ranging from 12.87 to 35.45), a free-text `description`, a `weight` attribute expressed in coded form (e.g. `pilot-weight-32`), a `cooking_time` coded as `extended-cooking-63`, and two boolean flags — `is_vegetarian` and `is_vegan` — that classify dietary suitability. The menu item also holds foreign keys pointing to its category, its primary ingredient, and its side dish, establishing the backbone of the relational model.

**Table `menu_items`**

| menu_item_id | item_id | name | price | description | weight | cooking_time | is_vegetarian | is_vegan | menu_category_id | ingredient_id | side_dish_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | Extended Review | 12.87 | Extended Survey | pilot-weight-32 | extended-cooking-63 | true | false | 1 | 1000 | 1 |
| 2 | ITE-2795 | Pilot Initiative A | 35.45 | Pilot Corridor A | extended-weight-33 | integrated-cooking-64 | false | true | 2 | 1001 | 2 |
| 3 | ITE-2798 | Baseline Model | 29.24 | Baseline Series | integrated-weight-34 | seasonal-cooking-65 | true | false | 3 | 1002 | 3 |
| 4 | ITE-2801 | Distributed Cluster | 29.99 | Distributed Assessment | seasonal-weight-35 | regional-cooking-66 | false | true | 4 | 1003 | 4 |

The `menu_items` table is the hub of the schema. Its primary key is `menu_item_id`, an integer surrogate that the database uses for efficient joins. The `item_id` column carries a human-meaningful identifier with a prefix convention — `ITE-` followed by a four-digit number — which serves as the natural key visible to application code and external systems. The `name` and `description` columns store the display text for the item; for instance, row 1 carries the name *Extended Review* with the description *Extended Survey*, while row 2 holds *Pilot Initiative A* described as *Pilot Corridor A*. The `price` column is a numeric value (stored as a decimal or floating-point type) that records the cost to the customer. The `weight` and `cooking_time` columns encode categorical metadata as coded strings — `pilot-weight-32` paired with `extended-cooking-63` for the first item, `extended-weight-33` with `integrated-cooking-64` for the second — suggesting a lookup or enumeration pattern in the domain ontology. The boolean columns `is_vegetarian` and `is_vegan` are stored as native `BOOLEAN` types; row 1 has `is_vegetarian = true` and `is_vegan = false`, indicating a vegetarian but not vegan offering, while row 2 flips the pattern with `is_vegetarian = false` and `is_vegan = true`.

The foreign key `menu_category_id` in `menu_items` references the `menu_categories` table, binding each menu item to exactly one category. The foreign key `ingredient_id` references the `ingredients` table, and `side_dish_id` references the `side_dishes` table. These three foreign keys establish one-to-one or one-to-many relationships depending on the cardinality constraints defined in the ontology. The schema design reflects a normalized approach: instead of embedding category names, ingredient details, or side dish information directly in `menu_items`, the model delegates those attributes to their own tables, reducing redundancy and enabling independent updates.

**Table `menu_categories`**

| menu_category_id | category_id | name | sort_order | menu_item_id |
|---|---|---|---|---|
| 1 | state_et_9 | Extended Review | 36 | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Pilot Initiative A | 43 | 2 |
| 3 | 1186099 | Baseline Model | 50 | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | 57 | 4 |

The `menu_categories` table stores the classification taxonomy for menu items. Its primary key is `menu_category_id`, an integer that aligns with the `menu_category_id` foreign key in `menu_items`. The `category_id` column carries the natural identifier for the category — in the sample data, these are heterogeneous identifiers such as `state_et_9`, the UUID `c744c896-8fcc-11eb-924d-9cd76263cbd0`, and numeric codes like `1186099` and `2b2c096e-8fcd-11eb-924d-9cd76263cbd0`. The `name` column holds the display name of the category, which in the sample data coincides with the menu item names (*Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*), suggesting a one-to-one mapping between categories and items in this particular dataset snapshot. The `sort_order` column is an integer that determines the presentation order of categories in the user interface — values range from 36 to 57 across the four rows. The column `menu_item_id` in `menu_categories` appears to be a back-reference, creating a bidirectional link from category to its associated menu item, which supports queries that start from the category side and navigate to the item.

**Table `ingredients`**

| ingredient_id | name | is_allergen | allergen_type | menu_item_id |
|---|---|---|---|---|
| 1000 | Extended Review | false | pilot-allergen-38 | 1 |
| 1001 | Pilot Initiative A | true | extended-allergen-39 | 2 |
| 1002 | Baseline Model | false | integrated-allergen-40 | 3 |
| 1003 | Distributed Cluster | true | seasonal-allergen-41 | 4 |

The `ingredients` table captures the compositional makeup of menu items. Its primary key is `ingredient_id`, an integer (1000 through 1003 in the sample data) that is referenced by the `ingredient_id` foreign key in `menu_items`. The `name` column stores the ingredient's display name, which again mirrors the menu item names in the sample data. The `is_allergen` column is a boolean flag indicating whether the ingredient contains allergens; rows 1000 and 1002 have `is_allergen = false`, while rows 1001 and 1003 have `is_allergen = true`. The `allergen_type` column provides a coded classification of the allergen when present — values include `pilot-allergen-38`, `extended-allergen-39`, `integrated-allergen-40`, and `seasonal-allergen-41`. The `menu_item_id` column serves as a back-reference to the menu item, enabling queries that enumerate ingredients for a given item. The cardinality of the relationship between `menu_items` and `ingredients` is one-to-one in the sample data (each menu item has exactly one ingredient record), though the schema design likely supports a one-to-many relationship in production, where a single menu item could be associated with multiple ingredients.

**Table `side_dishes`**

| id | side_id | name | price | description | is_vegetarian | is_vegan | menu_item_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Extended Review | 12.87 | Extended Survey | true | false | 1 |
| 2 | 937737 | Pilot Initiative A | 35.45 | Pilot Corridor A | false | true | 2 |
| 3 | 6564389 | Baseline Model | 29.24 | Baseline Series | true | false | 3 |
| 4 | 103178 | Distributed Cluster | 29.99 | Distributed Assessment | false | true | 4 |

The `side_dishes` table models the accompaniments offered alongside menu items. Its primary key is `id`, an integer (1 through 4) that corresponds to the `side_dish_id` foreign key in `menu_items`. The `side_id` column carries a natural identifier for the side dish — in the sample data, these include a Google Places-style identifier (`ChIJD7fiBh9u5kcRYJSMaMOCCwQ`), plain integers (`937737`, `6564389`, `103178`), and other coded strings. The `name` and `description` columns store the display text, with values such as *Extended Review* and *Extended Survey* for the first row. The `price` column records the side dish's cost, which in the sample data matches the parent menu item's price exactly (12.87, 35.45, 29.24, 29.99), suggesting that side dishes may be priced as add-ons or bundled with the main item. The boolean columns `is_vegetarian` and `is_vegan` mirror the dietary classification pattern found in `menu_items`, with alternating true/false values across the four rows. The `menu_item_id` column is a back-reference to the parent menu item, completing the bidirectional navigation path.

**Table `sauces`**

| sauce_id | name | price | description | menu_item_id |
|---|---|---|---|---|
| 100 | Extended Review | 12.87 | Extended Survey | 1 |
| 101 | Pilot Initiative A | 35.45 | Pilot Corridor A | 2 |
| 102 | Baseline Model | 29.24 | Baseline Series | 3 |
| 103 | Distributed Cluster | 29.99 | Distributed Assessment | 4 |

The `sauces` table represents optional sauce accompaniments for menu items. Its primary key is `sauce_id`, an integer (100 through 103) that is not directly referenced as a foreign key in `menu_items` — instead, the relationship is materialized through the view `v_sauce_menu_item`, which joins `sauces` to `menu_items` via the shared `menu_item_id` column. The `name` and `description` columns store the sauce's display information, with values identical to those in the other tables (*Extended Review*, *Extended Survey*, etc.). The `price` column records the sauce's cost, again matching the parent menu item's price in the sample data. The `menu_item_id` column serves as the join key, linking each sauce to its associated menu item. The cardinality here is one-to-one in the sample data, though the schema likely supports one-to-many in production, allowing a menu item to have multiple sauce options.

The five base tables form a star-like normalized schema with `menu_items` at the center. The foreign key relationships are as follows: `menu_items.menu_category_id` → `menu_categories.menu_category_id` (many-to-one), `menu_items.ingredient_id` → `ingredients.ingredient_id` (many-to-one), `menu_items.side_dish_id` → `side_dishes.id` (many-to-one), and the sauce relationship is mediated through the shared `menu_item_id` column between `menu_items` and `sauces`. Each base table also contains a back-reference column (`menu_item_id`) that points back to the central `menu_items` table, enabling reverse navigation from any dimension table to the menu item. This bidirectional linking pattern is a common normalization technique that supports both forward and reverse queries without requiring additional junction tables.

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

The view `v_menu_item_menu_category` reconstructs the category assignment for each menu item by joining `menu_items` to `menu_categories` on the `menu_category_id` column. The join condition `a.menu_category_id = b.menu_category_id` ensures that every row in the result corresponds to a valid category-item pairing. The view projects the menu item's surrogate key `menu_item_id`, business identifier `item_id`, display `name`, and `price`, alongside the category's surrogate key `category_menu_category_id`, natural identifier `category_category_id`, and display name `category_name`. Reading the first row as evidence: menu item `ITE-2792` (*Extended Review*, priced at 12.87) belongs to category `state_et_9` (*Extended Review*), confirming that the join correctly propagates the category's natural identifier alongside the menu item's attributes. The second row shows `ITE-2795` (*Pilot Initiative A*, 35.45) mapped to category `c744c896-8fcc-11eb-924d-9cd76263cbd0` (*Pilot Initiative A*). This view answers the question: "For each menu item, what is its category and how is that category identified both internally and externally?" It is the primary query interface for category-based filtering and reporting.

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

The view `v_menu_item_ingredient` joins `menu_items` to `ingredients` on the `ingredient_id` column, reconstructing the ingredient profile for each menu item. The join condition `a.ingredient_id = b.ingredient_id` pairs each menu item with its corresponding ingredient record. The view projects the menu item's `menu_item_id`, `item_id`, `name`, and `price`, along with the ingredient's `ingredient_id`, natural `category_id` (which in this context is the ingredient's natural identifier), `name`, `is_allergen` flag, and `allergen_type`. The first row reveals that menu item `ITE-2792` (*Extended Review*, 12.87) uses ingredient 1000 (*Extended Review*), which is not an allergen (`is_allergen = false`) and carries the coded type `pilot-allergen-38`. The second row shows `ITE-2795` (*Pilot Initiative A*, 35.45) paired with ingredient 1001 (*Pilot Initiative A*), which *is* an allergen (`is_allergen = true`) of type `extended-allergen-39`. This view answers the question: "What ingredient is used in each menu item, and does it contain allergens?" It is essential for dietary compliance checking and allergen warnings.

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

The view `v_menu_item_side_dish` joins `menu_items` to `side_dishes` on the `side_dish_id` column, reconstructing the side dish pairing for each menu item. The join condition `a.side_dish_id = b.id` ensures that each menu item is matched with its designated side dish. The view projects the menu item's `menu_item_id`, `item_id`, `name`, and `price`, alongside the side dish's `id`, natural `side_id`, `name`, `price`, `description`, `is_vegetarian`, and `is_vegan` flags. The first row shows menu item `ITE-2792` (*Extended Review*, 12.87) paired with side dish `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (*Extended Review*, priced at 12.87, described as *Extended Survey*), which is vegetarian but not vegan. The second row pairs `ITE-2795` (*Pilot Initiative A*, 35.45) with side dish `937737` (*Pilot Initiative A*, 35.45, *Pilot Corridor A*), which is non-vegetarian but vegan. This view answers the question: "What side dish accompanies each menu item, and what are its dietary properties?" It supports menu bundling queries and dietary preference filtering.

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

The view `v_menu_category_menu_item` performs the inverse join of `v_menu_item_menu_category`, starting from `menu_categories` and joining to `menu_items` on `menu_category_id`. This perspective answers the complementary question: "For each category, which menu items does it contain?" The join condition `a.menu_category_id = b.menu_category_id` (where `a` is `menu_categories` and `b` is `menu_items`) produces rows where each category is paired with its assigned menu item. The first row shows category `state_et_9` (*Extended Review*, sort order 36) containing menu item `ITE-2792` (*Extended Review*, 12.87). The second row shows category `c744c896-8fcc-11eb-924d-9cd76263cbd0` (*Pilot Initiative A*, sort order 43) containing menu item `ITE-2795` (*Pilot Initiative A*, 35.45). This view is useful for category-centric navigation, such as displaying all items within a category in a restaurant ordering interface.

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

The view `v_ingredient_menu_item` joins `ingredients` to `menu_items` on `ingredient_id`, presenting the ingredient-centric perspective. It answers: "For each ingredient, which menu item uses it?" The join condition `a.ingredient_id = b.ingredient_id` (where `a` is `ingredients` and `b` is `menu_items`) produces rows where each ingredient is paired with its consuming menu item. The first row shows ingredient 1000 (*Extended Review*, non-allergen, type `pilot-allergen-38`) used in menu item `ITE-2792` (*Extended Review*, 12.87). The second row shows ingredient 1001 (*Pilot Initiative A*, allergen, type `extended-allergen-39`) used in menu item `ITE-2795` (*Pilot Initiative A*, 35.45). This view supports ingredient traceability queries, such as identifying all menu items that contain a specific allergen.

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

The view `v_side_dish_menu_item` joins `side_dishes` to `menu_items` on `id = side_dish_id`, presenting the side dish-centric perspective. It answers: "For each side dish, which menu item is it paired with?" The join condition `a.id = b.side_dish_id` (where `a` is `side_dishes` and `b` is `menu_items`) produces rows where each side dish is linked to its parent menu item. The first row shows side dish `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (*Extended Review*, 12.87, vegetarian, non-vegan) paired with menu item `ITE-2792` (*Extended Review*, 12.87). The second row shows side dish `937737` (*Pilot Initiative A*, 35.45, non-vegetarian, vegan) paired with menu item `ITE-2795` (*Pilot Initiative A*, 35.45). This view is useful for side dish inventory management and for queries that need to trace a side dish back to its parent menu.

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

The view `v_sauce_menu_item` joins `sauces` to `menu_items` on the shared `menu_item_id` column, reconstructing the sauce accompaniment for each menu item. The join condition `a.menu_item_id = b.menu_item_id` (where `a` is `sauces` and `b` is `menu_items`) pairs each sauce with its associated menu item. The view projects the sauce's `sauce_id`, `name`, `price`, and `description`, alongside the menu item's `menu_item_id`, `item_id`, `name`, and `price`. The first row shows sauce 100 (*Extended Review*, 12.87, *Extended Survey*) paired with menu item `ITE-2792` (*Extended Review*, 12.87). The second row shows sauce 101 (*Pilot Initiative A*, 35.45, *Pilot Corridor A*) paired with menu item `ITE-2795` (*Pilot Initiative A*, 35.45). This view answers the question: "What sauce accompanies each menu item?" It is the primary interface for sauce-related queries, such as identifying all menu items that offer a particular sauce or filtering items by sauce availability.

The materialized schema demonstrates a clean separation of concerns: the central `menu_items` table holds the core entity attributes, while dimension tables (`menu_categories`, `ingredients`, `side_dishes`, `sauces`) store specialized attributes that are related to menu items through foreign keys. The bidirectional back-reference columns (`menu_item_id` in each dimension table) enable reverse navigation without requiring explicit junction tables, keeping the schema lean while supporting both forward and reverse queries. The six views materialize the join paths between the central entity and each dimension, answering distinct domain questions — category assignment, ingredient composition with allergen information, side dish pairing with dietary flags, and sauce accompaniment — by reconstructing the normalized facts into denormalized result sets. This design pattern, where a star schema is complemented by dimension-centric views, allows the database to serve both transactional queries (starting from the menu item) and analytical queries (starting from a dimension) without requiring redundant storage. The use of coded values for `weight`, `cooking_time`, and `allergen_type` columns suggests that these fields reference external enumerations or lookup tables, further normalizing the schema and enabling consistent classification across the domain.