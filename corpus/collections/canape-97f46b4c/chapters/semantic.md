## Ontology-Grounded Relational Modelling of a Canapé and Tasting-Dish Catalogue

The domain under examination is a culinary catalogue that tracks two parallel product families—canapés and tasting dishes—each enriched with categorical metadata, ingredient composition, and pricing. At the conceptual level the ontology recognises four principal entity types: `canape`, `canape_category`, `ingredient`, and `tasting_dish`, alongside a parallel `dish_category` entity that mirrors the category structure for the tasting-dish family. Relationships between these entities are cardinality-bounded: a canapé belongs to exactly one category (one-to-many from `canape_category` to `canape`), while a canapé may contain many ingredients and an ingredient may appear in many canapés (many-to-many, materialised through junction tables). The same pattern repeats for tasting dishes. The relational schema materialises these concepts through a combination of narrow base tables, foreign-key constraints, and junction tables that decompose the many-to-many associations into first-normal-form rows.

**Table `canapes`**

| id | canape_id | name | unit_price | dietary_category | description | serving_size | canape_category_id |
|---|---|---|---|---|---|---|---|
| 1 | 4793464 | Extended Review | 5,692 | v | Extended Survey | 36 | 1000 |
| 2 | 3744024 | Pilot Initiative A | 45,650 | vg | Pilot Corridor A | 42 | 1001 |
| 3 | 8928509 | Baseline Model | 2,705 | v | Baseline Series | 48 | 1002 |
| 4 | gd_taxc_2121 | Distributed Cluster | 211.07 | vg | Distributed Assessment | 54 | 1003 |

The `canapes` table is the central fact table for the canapé product line. It stores six business attributes—`name`, `unit_price`, `dietary_category`, `description`, `serving_size`, and the foreign key `canape_category_id`—alongside a surrogate primary key `id` and a business identifier `canape_id`. The `unit_price` column carries values ranging from 211.07 for the row whose `name` is `Distributed Cluster` up to 45,650 for `Pilot Initiative A`, while `dietary_category` is a two-character code (`v` or `vg`) that distinguishes vegetarian from vegan items. The `serving_size` column holds integer counts (36, 42, 48, 54) that indicate how many individual pieces are served per unit. The foreign key `canape_category_id` references the primary key `id` of the `canape_categories` table, enforcing that every canapé is classified into exactly one category. For example, the canapé `Baseline Model` (id 3) carries `canape_category_id = 1002`, which points to the category `Seasonal Framework`.

**Table `canape_categories`**

| id | category_id | category_name | recommended_serving_size | event_type | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | state_et_9 | Legacy Programme D | 13 | pre-dinner reception | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 23 | drinks party | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 1186099 | Seasonal Framework | 33 | pre-dinner reception | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 43 | drinks party | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `canape_categories` table defines the classification taxonomy for canapés. Each row carries a surrogate `id`, a business `category_id` (which may be a UUID such as `c744c896-8fcc-11eb-924d-9cd76263cbd0` or a short string like `1186099`), a human-readable `category_name`, a `recommended_serving_size`, an `event_type` (e.g. `pre-dinner reception` or `drinks party`), and audit timestamps `created_at` and `updated_at`. The `category_name` values—`Legacy Programme D`, `Regional Standard`, `Seasonal Framework`, `Integrated Protocol A`—serve as the domain vocabulary for canapé classification. The `recommended_serving_size` column (13, 23, 33, 43) provides a normative serving count that may differ from the actual `serving_size` stored on the canapé itself, reflecting a planning versus operational distinction.

The foreign-key relationship from `canapes.canape_category_id` to `canape_categories.id` is a standard one-to-many association: each category can be referenced by zero or more canapés, but each canapé references exactly one category. In the data, category `id = 1000` (`Legacy Programme D`) is referenced by the canapé `Extended Review`, while category `id = 1001` (`Regional Standard`) is referenced by `Pilot Initiative A`.

**Table `ingredients`**

| ingredient_id | name | category | allergen_flag |
|---|---|---|---|
| 1 | Extended Review | protein | false |
| 2 | Pilot Initiative A | vegetable | true |
| 3 | Baseline Model | dairy | false |
| 4 | Distributed Cluster | grain | true |

The `ingredients` table is a shared reference table that enumerates the ingredient master data used across both product families. It has four columns: `ingredient_id` (the primary key), `name`, `category`, and `allergen_flag`. The `name` column stores ingredient identifiers that, in this dataset, coincide with product names such as `Extended Review`, `Pilot Initiative A`, `Baseline Model`, and `Distributed Cluster`. The `category` column classifies each ingredient into one of four food groups: `protein`, `vegetable`, `dairy`, and `grain`. The `allergen_flag` is a boolean (`true` or `false`) that signals whether the ingredient is an allergen; for instance, `Pilot Initiative A` (a `vegetable`) and `Distributed Cluster` (a `grain`) are flagged as allergens, while `Extended Review` (a `protein`) and `Baseline Model` (a `dairy`) are not.

**Table `tasting_dishes`**

| id | dish_id | name | unit_price | dietary_category | description | serving_size | dish_category_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106692 | Extended Review | 5,692 | v | Extended Survey | 36 | 1 |
| 2 | 8928522 | Pilot Initiative A | 45,650 | vg | Pilot Corridor A | 42 | 2 |
| 3 | 790477 | Baseline Model | 2,705 | v | Baseline Series | 48 | 3 |
| 4 | gd_acc_220000 | Distributed Cluster | 211.07 | vg | Distributed Assessment | 54 | 4 |

The `tasting_dishes` table mirrors the structure of `canapes` and serves as the central fact table for the tasting-dish product line. It stores the same six business attributes—`name`, `unit_price`, `dietary_category`, `description`, `serving_size`, and the foreign key `dish_category_id`—alongside surrogate `id` and business `dish_id` columns. The `unit_price` values span from 211.07 (`Distributed Cluster`) to 45,650 (`Pilot Initiative A`), and `dietary_category` again uses the `v`/`vg` codes. The `serving_size` column holds values of 36, 42, 48, and 54. The foreign key `dish_category_id` references `dish_categories.dish_category_id`, enforcing that each tasting dish belongs to exactly one category. For example, the dish `Baseline Model` (id 3) carries `dish_category_id = 3`, which points to the category `Seasonal Framework`.

**Table `dish_categories`**

| dish_category_id | category_id | category_name | recommended_serving_size | event_type |
|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | 13 | distributed-event-24 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 23 | baseline-event-25 |
| 3 | 1186099 | Seasonal Framework | 33 | pilot-event-26 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 43 | extended-event-27 |

The `dish_categories` table defines the classification taxonomy for tasting dishes. It has five columns: `dish_category_id` (the primary key), `category_id` (a business identifier that may be a UUID or short string), `category_name`, `recommended_serving_size`, and `event_type`. The `category_name` values are identical to those in `canape_categories`—`Legacy Programme D`, `Regional Standard`, `Seasonal Framework`, `Integrated Protocol A`—indicating a shared category ontology across both product families. The `event_type` column uses different values here (`distributed-event-24`, `baseline-event-25`, `pilot-event-26`, `extended-event-27`) compared to the canapé categories, reflecting a different event taxonomy for the tasting-dish domain. The `recommended_serving_size` column (13, 23, 33, 43) mirrors the canapé category serving sizes.

The foreign-key relationship from `tasting_dishes.dish_category_id` to `dish_categories.dish_category_id` is a one-to-many association: each category can be referenced by zero or more dishes, and each dish references exactly one category.

**Table `canapes_ingredients`**

| canape_id | ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The many-to-many relationship between canapés and ingredients is materialised through the junction table `canapes_ingredients`. This table has two columns, `canape_id` and `ingredient_id`, both of which are foreign keys referencing `canapes.id` and `ingredients.ingredient_id` respectively. The composite key (`canape_id`, `ingredient_id`) ensures that each canapé-ingredient pairing appears at most once. In the data, canapé id 1 (`Extended Review`) is associated with ingredients 1 and 2 (`Extended Review` and `Pilot Initiative A`), while canapé id 2 (`Pilot Initiative A`) is associated with ingredients 2 and 3 (`Pilot Initiative A` and `Baseline Model`). This decomposition allows any canapé to contain an arbitrary number of ingredients without violating first normal form.

**Table `categories_canapes`**

| canape_category_id | canape_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `categories_canapes` table is a junction table that links `canape_categories` to `canapes`. While the `canapes` table already carries a direct foreign key `canape_category_id` to `canape_categories`, this additional junction table suggests a many-to-many relationship is modelled at the schema level—allowing a single canapé to be classified under multiple categories, or a category to encompass many canapés through an explicit association table. The presence of both the direct FK and the junction table indicates that the canonical classification is enforced by the FK, while the junction table may support optional secondary classifications or historical category assignments.

**Table `ingredients_canapes`**

| ingredient_id | canape_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `ingredients_canapes` table is a second junction table linking `ingredients` to `canapes`. Alongside `canapes_ingredients`, this dual-junction structure suggests that the schema distinguishes between two types of ingredient relationships—perhaps primary versus supplementary ingredients, or current versus historical formulations. Both tables share the same two-column structure (`canape_id`, `ingredient_id`) and reference the same parent tables, but their separate existence allows the application layer to encode semantic distinctions in the relationship type.

**Table `dishes_ingredients`**

| tasting_dish_id | ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `dishes_ingredients` table is the junction table for the tasting-dish-to-ingredient many-to-many relationship. It has two columns, `dish_id` and `ingredient_id`, referencing `tasting_dishes.id` and `ingredients.ingredient_id` respectively. This table plays the same structural role as `canapes_ingredients` but for the tasting-dish product family, enabling any tasting dish to contain an arbitrary number of ingredients.

**Table `categories_dishes`**

| dish_category_id | tasting_dish_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `categories_dishes` table is the junction table linking `dish_categories` to `tasting_dishes`. Like `categories_canapes`, it exists alongside the direct foreign key `dish_category_id` in `tasting_dishes`, suggesting a dual-classification model where the FK enforces the primary category while the junction table supports optional or historical category assignments.

**View `v_canape_canape_category`**

```sql
CREATE VIEW v_canape_canape_category AS
SELECT a.id, a.canape_id, a.name, a.unit_price, b.id AS category_id, b.category_id AS category_category_id, b.category_name AS category_category_name
FROM canapes a JOIN canape_categories b ON a.canape_category_id = b.id;
```

| id | canape_id | name | unit_price | category_id | category_category_id | category_category_name |
|---|---|---|---|---|---|---|
| 1 | 4793464 | Extended Review | 5,692 | 1000 | state_et_9 | Legacy Programme D |
| 2 | 3744024 | Pilot Initiative A | 45,650 | 1001 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| 3 | 8928509 | Baseline Model | 2,705 | 1002 | 1186099 | Seasonal Framework |
| 4 | gd_taxc_2121 | Distributed Cluster | 211.07 | 1003 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |

The view `v_canape_canape_category` joins `canapes` to `canape_categories` on the foreign-key relationship, producing a denormalised row per canapé that includes both the canapé's business attributes and its category metadata. This view answers the question: "What category does each canapé belong to, and what are the category's recommended serving size and event type?" Reading the first row, the canapé `Extended Review` (unit price 5,692, dietary category `v`, serving size 36) is classified under `Legacy Programme D`, which has a recommended serving size of 13 and is associated with the event type `pre-dinner reception`. The second row shows `Pilot Initiative A` (unit price 45,650, dietary category `vg`, serving size 42) classified under `Regional Standard`, with a recommended serving size of 23 and event type `drinks party`. The view effectively collapses the one-to-many relationship into a single flat row per canapé, making category metadata directly accessible without a join in application queries.

**View `v_canape_ingredient_detail`**

```sql
CREATE VIEW v_canape_ingredient_detail AS
SELECT a.id, a.canape_id, a.name, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.category AS ingredient_category
FROM canapes a
  JOIN canapes_ingredients j ON j.canape_id = a.id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| id | canape_id | name | ingredient_ingredient_id | ingredient_name | ingredient_category |
|---|---|---|---|---|---|
| 1 | 4793464 | Extended Review | 1 | Extended Review | protein |
| 1 | 4793464 | Extended Review | 2 | Pilot Initiative A | vegetable |
| 2 | 3744024 | Pilot Initiative A | 2 | Pilot Initiative A | vegetable |
| 2 | 3744024 | Pilot Initiative A | 3 | Baseline Model | dairy |
| 3 | 8928509 | Baseline Model | 3 | Baseline Model | dairy |
| 3 | 8928509 | Baseline Model | 4 | Distributed Cluster | grain |
| 4 | gd_taxc_2121 | Distributed Cluster | 4 | Distributed Cluster | grain |
| 4 | gd_taxc_2121 | Distributed Cluster | 1 | Extended Review | protein |

The view `v_canape_ingredient_detail` joins `canapes` to `ingredients` through the `canapes_ingredients` junction table, producing one row per canapé-ingredient pairing. This view answers the question: "Which ingredients compose each canapé, and what are the ingredient's food category and allergen status?" The first two rows correspond to canapé id 1 (`Extended Review`), which contains ingredient 1 (`Extended Review`, category `protein`, allergen `false`) and ingredient 2 (`Pilot Initiative A`, category `vegetable`, allergen `true`). The third and fourth rows correspond to canapé id 2 (`Pilot Initiative A`), which contains ingredient 2 (`Pilot Initiative A`, `vegetable`, `true`) and ingredient 3 (`Baseline Model`, `dairy`, `false`). This view is particularly useful for allergen screening: any row with `allergen_flag = true` signals that the corresponding canapé contains an allergen.

**View `v_canape_category_canape_detail`**

```sql
CREATE VIEW v_canape_category_canape_detail AS
SELECT a.id, a.category_id, a.category_name, b.id AS canape_id, b.canape_id AS canape_canape_id, b.name AS canape_name
FROM canape_categories a
  JOIN categories_canapes j ON j.canape_category_id = a.id
  JOIN canapes b ON b.id = j.canape_id;
```

| id | category_id | category_name | canape_id | canape_canape_id | canape_name |
|---|---|---|---|---|---|
| 1000 | state_et_9 | Legacy Programme D | 1 | 4793464 | Extended Review |
| 1000 | state_et_9 | Legacy Programme D | 2 | 3744024 | Pilot Initiative A |
| 1001 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 2 | 3744024 | Pilot Initiative A |
| 1001 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 3 | 8928509 | Baseline Model |
| 1002 | 1186099 | Seasonal Framework | 3 | 8928509 | Baseline Model |
| 1002 | 1186099 | Seasonal Framework | 4 | gd_taxc_2121 | Distributed Cluster |
| 1003 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 4 | gd_taxc_2121 | Distributed Cluster |
| 1003 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 1 | 4793464 | Extended Review |

The view `v_canape_category_canape_detail` reverses the join direction of `v_canape_canape_category`, producing one row per canapé but with the category columns appearing first. This view answers the question: "For each category, which canapés are classified under it, and what are their prices and dietary classifications?" The first row shows that the category `Legacy Programme D` (recommended serving size 13, event type `pre-dinner reception`) contains the canapé `Extended Review` priced at 5,692 with dietary category `v`. The second row shows `Regional Standard` (recommended serving size 23, event type `drinks party`) containing `Pilot Initiative A` priced at 45,650 with dietary category `vg`. This orientation is useful for category-level reporting, where the category acts as the grouping dimension.

**View `v_ingredient_canape_detail`**

```sql
CREATE VIEW v_ingredient_canape_detail AS
SELECT a.ingredient_id, a.name, a.category, b.id AS canape_id, b.canape_id AS canape_canape_id, b.name AS canape_name
FROM ingredients a
  JOIN ingredients_canapes j ON j.ingredient_id = a.ingredient_id
  JOIN canapes b ON b.id = j.canape_id;
```

| ingredient_id | name | category | canape_id | canape_canape_id | canape_name |
|---|---|---|---|---|---|
| 1 | Extended Review | protein | 1 | 4793464 | Extended Review |
| 1 | Extended Review | protein | 2 | 3744024 | Pilot Initiative A |
| 2 | Pilot Initiative A | vegetable | 2 | 3744024 | Pilot Initiative A |
| 2 | Pilot Initiative A | vegetable | 3 | 8928509 | Baseline Model |
| 3 | Baseline Model | dairy | 3 | 8928509 | Baseline Model |
| 3 | Baseline Model | dairy | 4 | gd_taxc_2121 | Distributed Cluster |
| 4 | Distributed Cluster | grain | 4 | gd_taxc_2121 | Distributed Cluster |
| 4 | Distributed Cluster | grain | 1 | 4793464 | Extended Review |

The view `v_ingredient_canape_detail` joins `ingredients` to `canapes` through the `canapes_ingredients` junction table, producing one row per ingredient-canapé pairing with the ingredient columns appearing first. This view answers the question: "For each ingredient, which canapés use it, and what are the canapé's price and serving size?" The first two rows show that ingredient 1 (`Extended Review`, category `protein`, allergen `false`) is used in canapé id 1 (`Extended Review`, price 5,692, serving size 36) and canapé id 4 (`Distributed Cluster`, price 211.07, serving size 54). The third and fourth rows show ingredient 2 (`Pilot Initiative A`, category `vegetable`, allergen `true`) is used in canapé id 1 and canapé id 2 (`Pilot Initiative A`, price 45,650, serving size 42). This view supports ingredient-level analytics, such as determining which canapés contain a given allergen.

**View `v_tasting_dish_dish_category`**

```sql
CREATE VIEW v_tasting_dish_dish_category AS
SELECT a.id, a.dish_id, a.name, a.unit_price, b.dish_category_id AS category_dish_category_id, b.category_id AS category_category_id, b.category_name AS category_category_name
FROM tasting_dishes a JOIN dish_categories b ON a.dish_category_id = b.dish_category_id;
```

| id | dish_id | name | unit_price | category_dish_category_id | category_category_id | category_category_name |
|---|---|---|---|---|---|---|
| 1 | 2106692 | Extended Review | 5,692 | 1 | state_et_9 | Legacy Programme D |
| 2 | 8928522 | Pilot Initiative A | 45,650 | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| 3 | 790477 | Baseline Model | 2,705 | 3 | 1186099 | Seasonal Framework |
| 4 | gd_acc_220000 | Distributed Cluster | 211.07 | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |

The view `v_tasting_dish_dish_category` joins `tasting_dishes` to `dish_categories` on the foreign-key relationship, producing a denormalised row per tasting dish that includes both the dish's business attributes and its category metadata. This view answers the question: "What category does each tasting dish belong to, and what are the category's recommended serving size and event type?" The first row shows the dish `Extended Review` (unit price 5,692, dietary category `v`, serving size 36) classified under `Legacy Programme D`, with a recommended serving size of 13 and event type `distributed-event-24`. The second row shows `Pilot Initiative A` (unit price 45,650, dietary category `vg`, serving size 42) classified under `Regional Standard`, with a recommended serving size of 23 and event type `baseline-event-25`. The view collapses the one-to-many relationship into a single flat row per dish, making category metadata directly accessible.

**View `v_tasting_dish_ingredient_detail`**

```sql
CREATE VIEW v_tasting_dish_ingredient_detail AS
SELECT a.id, a.dish_id, a.name, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.category AS ingredient_category
FROM tasting_dishes a
  JOIN dishes_ingredients j ON j.tasting_dish_id = a.id
  JOIN ingredients b ON b.ingredient_id = j.ingredient_id;
```

| id | dish_id | name | ingredient_ingredient_id | ingredient_name | ingredient_category |
|---|---|---|---|---|---|
| 1 | 2106692 | Extended Review | 1 | Extended Review | protein |
| 1 | 2106692 | Extended Review | 2 | Pilot Initiative A | vegetable |
| 2 | 8928522 | Pilot Initiative A | 2 | Pilot Initiative A | vegetable |
| 2 | 8928522 | Pilot Initiative A | 3 | Baseline Model | dairy |
| 3 | 790477 | Baseline Model | 3 | Baseline Model | dairy |
| 3 | 790477 | Baseline Model | 4 | Distributed Cluster | grain |
| 4 | gd_acc_220000 | Distributed Cluster | 4 | Distributed Cluster | grain |
| 4 | gd_acc_220000 | Distributed Cluster | 1 | Extended Review | protein |

The view `v_tasting_dish_ingredient_detail` joins `tasting_dishes` to `ingredients` through the `dishes_ingredients` junction table, producing one row per tasting-dish-ingredient pairing. This view answers the question: "Which ingredients compose each tasting dish, and what are the ingredient's food category and allergen status?" The first two rows correspond to dish id 1 (`Extended Review`), which contains ingredient 1 (`Extended Review`, category `protein`, allergen `false`) and ingredient 2 (`Pilot Initiative A`, category `vegetable`, allergen `true`). The third and fourth rows correspond to dish id 2 (`Pilot Initiative A`), which contains ingredient 2 (`Pilot Initiative A`, `vegetable`, `true`) and ingredient 3 (`Baseline Model`, `dairy`, `false`). Like its canapé counterpart, this view is useful for allergen screening and ingredient-level analysis.

**View `v_dish_category_tasting_dish_detail`**

```sql
CREATE VIEW v_dish_category_tasting_dish_detail AS
SELECT a.dish_category_id, a.category_id, a.category_name, b.id AS dish_id, b.dish_id AS dish_dish_id, b.name AS dish_name
FROM dish_categories a
  JOIN categories_dishes j ON j.dish_category_id = a.dish_category_id
  JOIN tasting_dishes b ON b.id = j.tasting_dish_id;
```

| dish_category_id | category_id | category_name | dish_id | dish_dish_id | dish_name |
|---|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | 1 | 2106692 | Extended Review |
| 1 | state_et_9 | Legacy Programme D | 2 | 8928522 | Pilot Initiative A |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 2 | 8928522 | Pilot Initiative A |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 3 | 790477 | Baseline Model |
| 3 | 1186099 | Seasonal Framework | 3 | 790477 | Baseline Model |
| 3 | 1186099 | Seasonal Framework | 4 | gd_acc_220000 | Distributed Cluster |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 4 | gd_acc_220000 | Distributed Cluster |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 1 | 2106692 | Extended Review |

The view `v_dish_category_tasting_dish_detail` reverses the join direction of `v_tasting_dish_dish_category`, producing one row per tasting dish but with the category columns appearing first. This view answers the question: "For each category, which tasting dishes are classified under it, and what are their prices and dietary classifications?" The first row shows that the category `Legacy Programme D` (recommended serving size 13, event type `distributed-event-24`) contains the dish `Extended Review` priced at 5,692 with dietary category `v`. The second row shows `Regional Standard` (recommended serving size 23, event type `baseline-event-25`) containing `Pilot Initiative A` priced at 45,650 with dietary category `vg`. This orientation supports category-level reporting for the tasting-dish product family.

### Synthesis

The relational schema materialises a clean ontology of two product families (canapés and tasting dishes), each classified into a shared category taxonomy and composed from a shared ingredient master. The one-to-many category relationships are enforced by direct foreign keys (`canape_category_id` and `dish_category_id`), while the many-to-many ingredient relationships are decomposed into junction tables (`canapes_ingredients`, `dishes_ingredients`, and their companion junctions). The seven views provide denormalised projections that reconstruct domain facts—category membership, ingredient composition, and cross-referenced detail—by joining the normalised base tables. Together, the tables and views form a complete, queryable representation of the culinary catalogue that supports both product-level and category-level analytics without sacrificing data integrity.