## Normalizing the Happy-Hour Domain

A bar or gastropub that runs time-bound happy-hour promotions must coordinate three distinct data concerns: the promotions themselves, the menu items eligible for discount, and the ingredient-level provenance of those items. In the relational model, these concerns are separated into five base tables and two junction tables, then reassembled by six materialized views. The design follows a classic star-of-normalized-facts pattern: a central promotion entity anchors two one-to-many item hierarchies (beverages and food), each food item further decomposes into ingredients and dipping sauces, while the beverage–special relationship is mediated by a many-to-many junction because a single promotion can feature multiple drinks and a single drink can appear across promotions. The following sections walk through each table, its columns, and the foreign-key constraints that bind them, then show how each view reconstructs a domain fact from the normalized tables.

**Table `happy_hour_specials`**

| id | start_time | end_time | discount_percentage | is_active | created_at |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 16.70 | true | 2025-01-01 00:14:00 |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 19.40 | false | 2025-02-06 03:14:00 |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 22.10 | true | 2025-03-11 06:14:00 |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 24.80 | false | 2025-04-16 09:14:00 |

The `happy_hour_specials` table is the anchor of the entire schema. Each row represents a discrete promotion window identified by `id` (a surrogate integer primary key), with `start_time` and `end_time` defining the temporal bounds of the discount. The `discount_percentage` column stores the numeric reduction—values such as `16.70`, `19.40`, `22.10`, and `24.80` in the sample data indicate the percentage off the regular price. The boolean `is_active` flag distinguishes currently running promotions from historical ones, and `created_at` records when the promotion record was inserted. In the sample data, promotion `id = 1` is active with a `16.70` percent discount, while `id = 2` is inactive at `19.40` percent. This table has no incoming foreign keys; it is the root of the promotion hierarchy.

**Table `beverages`**

| id | beverage_type | brand | volume | unit | price | happy_hour_special_id |
|---|---|---|---|---|---|---|
| 100 | craft_beer | Adobe Systems Inc | 9.45 | distributed-unit-18 | 12.87 | 1 |
| 101 | wine | Assicurazioni Generali | 11.90 | baseline-unit-19 | 35.45 | 2 |
| 102 | cocktail | LDAP First Name Field | 14.35 | pilot-unit-20 | 29.24 | 3 |
| 103 | craft_beer | National University of Singapore | 16.80 | extended-unit-21 | 29.99 | 4 |

The `beverages` table captures the drink-side of the menu. Its primary key is `id`, and the columns `beverage_type`, `brand`, `volume`, `unit`, and `price` describe the product attributes. The `happy_hour_special_id` column is a foreign key referencing `happy_hour_specials(id)`, establishing a many-to-one relationship: each beverage row points to at most one promotion, but a single promotion can be referenced by multiple beverage rows. In the sample data, beverage `id = 100` (a craft beer from "Adobe Systems Inc" at `$12.87`) belongs to promotion `id = 1`, while beverage `id = 101` (wine from "Assicurazioni Generali" at `$35.45`) belongs to promotion `id = 2`. The `unit` column carries domain-specific unit labels such as `distributed-unit-18` and `baseline-unit-19`, and `volume` stores the numeric quantity. This table is a leaf in the beverage branch of the hierarchy.

**Table `food_items`**

| food_item_id | name | category | price | serving_size | ingredients | happy_hour_special_id |
|---|---|---|---|---|---|---|
| 100 | Extended Review | small_plates | 12.87 | primary-serving-40 | regional-ingredie-42 | 1 |
| 101 | Pilot Initiative A | desserts | 35.45 | adaptive-serving-41 | legacy-ingredie-43 | 2 |
| 102 | Baseline Model | small_plates | 29.24 | distributed-serving-42 | compact-ingredie-44 | 3 |
| 103 | Distributed Cluster | desserts | 29.99 | baseline-serving-43 | composite-ingredie-45 | 4 |

The `food_items` table mirrors the beverage table's structure for the food side. Its primary key is `food_item_id`, and the columns `name`, `category`, `price`, `serving_size`, and `ingredients` describe the dish. The `happy_hour_special_id` column is a foreign key into `happy_hour_specials(id)`, again forming a many-to-one relationship. In the sample data, food item `id = 100` named "Extended Review" in the `small_plates` category at `$12.87` is linked to promotion `id = 1`, while food item `id = 101` named "Pilot Initiative A" in the `desserts` category at `$35.45` is linked to promotion `id = 2`. The `ingredients` column stores a textual reference to the ingredient record (e.g., `regional-ingredie-42`), and `serving_size` carries labels like `primary-serving-40`. Like `beverages`, this table is a leaf in its branch.

**Table `ingredients`**

| ingredient_id | name | type | origin | food_item_id |
|---|---|---|---|---|
| 1 | Extended Review | protein | distributed-origin-66 | 100 |
| 2 | Pilot Initiative A | vegetable | baseline-origin-67 | 101 |
| 3 | Baseline Model | dairy | pilot-origin-68 | 102 |
| 4 | Distributed Cluster | spice | extended-origin-69 | 103 |

The `ingredients` table decomposes food items into their constituent components. Its primary key is `ingredient_id`, and the columns `name`, `type`, and `origin` describe the ingredient's identity and classification. The `food_item_id` column is a foreign key referencing `food_items(food_item_id)`, establishing a many-to-one relationship: each ingredient belongs to exactly one food item, but a food item can have multiple ingredients. In the sample data, ingredient `id = 1` named "Extended Review" of type `protein` from `distributed-origin-66` is associated with food item `id = 100`. Ingredient `id = 2` ("Pilot Initiative A", type `vegetable`, `baseline-origin-67`) belongs to food item `id = 101`. This table adds a second level of granularity beneath `food_items`.

**Table `dipping_sauces`**

| dipping_sauce_id | name | flavor_profile | spiciness | food_item_id |
|---|---|---|---|---|
| 1 | Extended Review | baseline-flavor-19 | mild | 100 |
| 2 | Pilot Initiative A | pilot-flavor-20 | medium | 101 |
| 3 | Baseline Model | extended-flavor-21 | hot | 102 |
| 4 | Distributed Cluster | integrated-flavor-22 | mild | 103 |

The `dipping_sauces` table captures the sauce accompaniments for food items. Its primary key is `dipping_sauce_id`, and the columns `name`, `flavor_profile`, and `spiciness` describe the sauce. The `food_item_id` column is a foreign key into `food_items(food_item_id)`, forming a many-to-one relationship analogous to `ingredients`. In the sample data, dipping sauce `id = 1` named "Extended Review" with `baseline-flavor-19` and `mild` spiciness is paired with food item `id = 100`. Dipping sauce `id = 3` ("Baseline Model", `extended-flavor-21`, `hot` spiciness) is paired with food item `id = 102`. Like `ingredients`, this table is a sibling leaf under `food_items`.

**Table `specials_beverages`**

| happy_hour_special_id | beverage_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `specials_beverages` table is a junction (association) table that resolves a many-to-many relationship between `happy_hour_specials` and `beverages`. Its composite primary key consists of `happy_hour_special_id` and `beverage_id`, both of which are foreign keys referencing their respective parent tables. This table exists because a single promotion can feature multiple beverages and a single beverage can appear in multiple promotions. In the sample data, promotion `id = 1` includes beverages `100` and `101`; promotion `id = 2` includes beverages `101` and `102`; promotion `id = 3` includes beverages `102` and `103`; and promotion `id = 4` includes beverages `103` and `100`. The cross-referencing pattern—beverage `100` appears in both promotions `1` and `4`—demonstrates the many-to-many cardinality that necessitates this junction table.

**Table `specials_items`**

| happy_hour_special_id | food_item_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `specials_items` table is the food-side counterpart to `specials_beverages`. Its composite primary key consists of `happy_hour_special_id` and `food_item_id`, both foreign keys into `happy_hour_specials(id)` and `food_items(food_item_id)` respectively. This junction table mediates the many-to-many relationship between promotions and food items. In the sample data, promotion `id = 1` is associated with food items `100` and `101`; promotion `id = 2` with food items `101` and `102`; promotion `id = 3` with food items `102` and `103`; and promotion `id = 4` with food items `103` and `100`. The pattern mirrors `specials_beverages` exactly, confirming that the model treats beverages and food items symmetrically at the promotion eligibility level.

### Reconstructing Domain Facts with Views

The six views materialize the normalized relationships into denormalized result sets that answer specific business questions. Each view performs a join across the base tables to reconstruct a coherent domain fact.

**View `v_happy_hour_special_beverage_detail`**

```sql
CREATE VIEW v_happy_hour_special_beverage_detail AS
SELECT a.id, a.start_time, a.end_time, b.id AS beverage_id, b.beverage_type AS beverage_beverage_type, b.brand AS beverage_brand
FROM happy_hour_specials a
  JOIN specials_beverages j ON j.happy_hour_special_id = a.id
  JOIN beverages b ON b.id = j.beverage_id;
```

| id | start_time | end_time | beverage_id | beverage_beverage_type | beverage_brand |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | craft_beer | Adobe Systems Inc |
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 101 | wine | Assicurazioni Generali |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | wine | Assicurazioni Generali |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 102 | cocktail | LDAP First Name Field |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | cocktail | LDAP First Name Field |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 103 | craft_beer | National University of Singapore |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | craft_beer | National University of Singapore |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 100 | craft_beer | Adobe Systems Inc |

This view joins `happy_hour_specials` with `specials_beverages` and `beverages` to produce a detail report of every beverage featured in every happy-hour promotion. The join path is `happy_hour_specials.id → specials_beverages.happy_hour_special_id → specials_beverages.beverage_id → beverages.id`. The result answers the question: "For each promotion, which beverages are discounted and at what price?" In the sample data, the view would surface that promotion `id = 1` (active, `16.70` percent discount) features beverage `id = 100` (craft beer, `$12.87`) and beverage `id = 101` (wine, `$35.45`). A second row would show that promotion `id = 2` (inactive, `19.40` percent discount) features beverage `id = 101` (wine, `$35.45`) and beverage `id = 102` (cocktail, `$29.24`). The view effectively flattens the three-table join into a single denormalized row per promotion–beverage pair.

**View `v_happy_hour_special_food_item_detail`**

```sql
CREATE VIEW v_happy_hour_special_food_item_detail AS
SELECT a.id, a.start_time, a.end_time, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM happy_hour_specials a
  JOIN specials_items j ON j.happy_hour_special_id = a.id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| id | start_time | end_time | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | Extended Review | small_plates |
| 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 101 | Pilot Initiative A | desserts |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | Pilot Initiative A | desserts |
| 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 102 | Baseline Model | small_plates |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | Baseline Model | small_plates |
| 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 103 | Distributed Cluster | desserts |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | Distributed Cluster | desserts |
| 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 100 | Extended Review | small_plates |

Analogous to the beverage detail view, this view joins `happy_hour_specials` with `specials_items` and `food_items` to produce a detail report of every food item featured in every happy-hour promotion. The join path is `happy_hour_specials.id → specials_items.happy_hour_special_id → specials_items.food_item_id → food_items.food_item_id`. The result answers: "For each promotion, which food items are discounted and at what price?" In the sample data, promotion `id = 1` (active, `16.70` percent discount) features food item `id = 100` ("Extended Review", `small_plates`, `$12.87`) and food item `id = 101` ("Pilot Initiative A", `desserts`, `$35.45`). Promotion `id = 3` (active, `22.10` percent discount) features food item `id = 102` ("Baseline Model", `small_plates`, `$29.24`) and food item `id = 103` ("Distributed Cluster", `desserts`, `$29.99`). This view provides the food-side counterpart to the beverage detail view.

**View `v_beverage_happy_hour_special`**

```sql
CREATE VIEW v_beverage_happy_hour_special AS
SELECT a.id, a.beverage_type, a.brand, a.volume, b.id AS special_id, b.start_time AS special_start_time, b.end_time AS special_end_time
FROM beverages a JOIN happy_hour_specials b ON a.happy_hour_special_id = b.id;
```

| id | beverage_type | brand | volume | special_id | special_start_time | special_end_time |
|---|---|---|---|---|---|---|
| 100 | craft_beer | Adobe Systems Inc | 9.45 | 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 |
| 101 | wine | Assicurazioni Generali | 11.90 | 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 |
| 102 | cocktail | LDAP First Name Field | 14.35 | 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 |
| 103 | craft_beer | National University of Singapore | 16.80 | 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 |

This view inverts the perspective: instead of listing beverages per promotion, it lists promotions per beverage. The join path is `beverages.id → specials_beverages.beverage_id → specials_beverages.happy_hour_special_id → happy_hour_specials.id`. The result answers: "For each beverage, which promotions feature it?" In the sample data, beverage `id = 100` (craft beer, `$12.87`) appears in promotions `id = 1` (active, `16.70` percent discount) and `id = 4` (inactive, `24.80` percent discount). Beverage `id = 101` (wine, `$35.45`) appears in promotions `id = 1` and `id = 2`. This view is useful for inventory planning—determining which drinks are promoted and across how many concurrent promotions.

**View `v_food_item_happy_hour_special`**

```sql
CREATE VIEW v_food_item_happy_hour_special AS
SELECT a.food_item_id, a.name, a.category, a.price, b.id AS special_id, b.start_time AS special_start_time, b.end_time AS special_end_time
FROM food_items a JOIN happy_hour_specials b ON a.happy_hour_special_id = b.id;
```

| food_item_id | name | category | price | special_id | special_start_time | special_end_time |
|---|---|---|---|---|---|---|
| 100 | Extended Review | small_plates | 12.87 | 1 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 |
| 101 | Pilot Initiative A | desserts | 35.45 | 2 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 |
| 102 | Baseline Model | small_plates | 29.24 | 3 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 |
| 103 | Distributed Cluster | desserts | 29.99 | 4 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 |

The food-side inversion of the previous view, this joins `food_items` with `specials_items` and `happy_hour_specials` to answer: "For each food item, which promotions feature it?" The join path is `food_items.food_item_id → specials_items.food_item_id → specials_items.happy_hour_special_id → happy_hour_specials.id`. In the sample data, food item `id = 100` ("Extended Review", `$12.87`) appears in promotion `id = 1` (active, `16.70` percent discount) and promotion `id = 4` (inactive, `24.80` percent discount). Food item `id = 101` ("Pilot Initiative A", `$35.45`) appears in promotion `id = 1` and promotion `id = 2`. This view supports menu analytics by revealing the promotional footprint of each dish.

**View `v_ingredient_food_item`**

```sql
CREATE VIEW v_ingredient_food_item AS
SELECT a.ingredient_id, a.name, a.type, a.origin, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM ingredients a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| ingredient_id | name | type | origin | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|---|
| 1 | Extended Review | protein | distributed-origin-66 | 100 | Extended Review | small_plates |
| 2 | Pilot Initiative A | vegetable | baseline-origin-67 | 101 | Pilot Initiative A | desserts |
| 3 | Baseline Model | dairy | pilot-origin-68 | 102 | Baseline Model | small_plates |
| 4 | Distributed Cluster | spice | extended-origin-69 | 103 | Distributed Cluster | desserts |

This view joins `ingredients` with `food_items` to answer: "For each food item, what are its constituent ingredients?" The join path is `food_items.food_item_id → ingredients.food_item_id`. In the sample data, food item `id = 100` ("Extended Review") is composed of ingredient `id = 1` ("Extended Review", type `protein`, origin `distributed-origin-66`). Food item `id = 101` ("Pilot Initiative A") is composed of ingredient `id = 2` ("Pilot Initiative A", type `vegetable`, origin `baseline-origin-67`). Food item `id = 102` ("Baseline Model") is composed of ingredient `id = 3` ("Baseline Model", type `dairy`, origin `pilot-origin-68`). Food item `id = 103` ("Distributed Cluster") is composed of ingredient `id = 4` ("Distributed Cluster", type `spice`, origin `extended-origin-69`). This view supports allergen tracking, sourcing audits, and recipe management.

**View `v_dipping_sauce_food_item`**

```sql
CREATE VIEW v_dipping_sauce_food_item AS
SELECT a.dipping_sauce_id, a.name, a.flavor_profile, a.spiciness, b.food_item_id AS item_food_item_id, b.name AS item_name, b.category AS item_category
FROM dipping_sauces a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| dipping_sauce_id | name | flavor_profile | spiciness | item_food_item_id | item_name | item_category |
|---|---|---|---|---|---|---|
| 1 | Extended Review | baseline-flavor-19 | mild | 100 | Extended Review | small_plates |
| 2 | Pilot Initiative A | pilot-flavor-20 | medium | 101 | Pilot Initiative A | desserts |
| 3 | Baseline Model | extended-flavor-21 | hot | 102 | Baseline Model | small_plates |
| 4 | Distributed Cluster | integrated-flavor-22 | mild | 103 | Distributed Cluster | desserts |

This view joins `dipping_sauces` with `food_items` to answer: "For each food item, what dipping sauces are recommended?" The join path is `food_items.food_item_id → dipping_sauces.food_item_id`. In the sample data, food item `id = 100` ("Extended Review") is paired with dipping sauce `id = 1` ("Extended Review", `baseline-flavor-19`, `mild` spiciness). Food item `id = 101` ("Pilot Initiative A") is paired with dipping sauce `id = 2` ("Pilot Initiative A", `pilot-flavor-20`, `medium` spiciness). Food item `id = 102` ("Baseline Model") is paired with dipping sauce `id = 3` ("Baseline Model", `extended-flavor-21`, `hot` spiciness). Food item `id = 103` ("Distributed Cluster") is paired with dipping sauce `id = 4` ("Distributed Cluster", `integrated-flavor-22`, `mild` spiciness). This view supports menu pairing recommendations and customer-facing sauce descriptions.

### Synthesis

The happy-hour schema separates concerns along three orthogonal axes: temporal promotion management (`happy_hour_specials`), product catalog management (`beverages` and `food_items`), and ingredient provenance (`ingredients` and `dipping_sauces`). The two junction tables (`specials_beverages` and `specials_items`) resolve the many-to-many relationships between promotions and products, enabling a single beverage or food item to participate in multiple promotions and a single promotion to feature multiple items. The six views then reconstruct these normalized facts into denormalized result sets that answer specific business questions—detail reports, promotional footprints, and ingredient/sauce pairings—without requiring application-level joins. This separation of storage from presentation is the hallmark of a well-normalized relational design: the base tables enforce data integrity through foreign keys and composite primary keys, while the views provide a stable query interface that shields downstream consumers from schema evolution.