# The Architecture of Canapé and Tasting Dish Operations

A culinary operations platform manages the lifecycle of canapés and tasting dishes across event planning, ingredient sourcing, and dietary compliance. At its core, the system tracks individual items—canapés and tasting dishes—each carrying pricing, dietary classification, serving specifications, and categorical assignments. These items are composed of ingredients, some of which carry allergen flags that must be surfaced during menu planning. Categories organize items by event type and serving conventions, while junction tables record the many-to-many relationships between items and their constituent ingredients. The domain's data model captures not only what exists but how items relate to one another, enabling queries that answer practical questions: which canapés belong to a given category, which ingredients compose a specific item, and how tasting dishes map to their own categorical structure.

## Canapé Inventory and Classification

The canapé registry is the primary entity for small-plate offerings. Each record carries a unique identifier, a human-readable name, a unit price, a dietary category code, a descriptive label, a serving size, and a foreign key pointing to its category.

**Table `canapes`**

| id | canape_id | name | unit_price | dietary_category | description | serving_size | canape_category_id |
|---|---|---|---|---|---|---|---|
| 1 | 4793464 | Extended Review | 5,692 | v | Extended Survey | 36 | 1000 |
| 2 | 3744024 | Pilot Initiative A | 45,650 | vg | Pilot Corridor A | 42 | 1001 |
| 3 | 8928509 | Baseline Model | 2,705 | v | Baseline Series | 48 | 1002 |
| 4 | gd_taxc_2121 | Distributed Cluster | 211.07 | vg | Distributed Assessment | 54 | 1003 |

The first entry, identified as `4793464` and named "Extended Review," carries a unit price of 5,692 and is classified under dietary category `v`. Its description reads "Extended Survey" and it specifies a serving size of 36 units. The second record, `3744024` ("Pilot Initiative A"), is priced at 45,650, carries the dietary code `vg`, and has a serving size of 42. The third, `8928509` ("Baseline Model"), is the least expensive at 2,705 with a serving size of 48. The fourth record, `gd_taxc_2121` ("Distributed Cluster"), is priced at 211.07 and also carries the `vg` dietary code. All four canapés reference category identifiers in the range 1000–1003, linking them to the category definitions that follow.

The category table provides the organizational structure for canapés. Each category has its own identifier, a business-facing category name, a recommended serving size, an event type classification, and timestamps for creation and last update.

**Table `canape_categories`**

| id | category_id | category_name | recommended_serving_size | event_type | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | state_et_9 | Legacy Programme D | 13 | pre-dinner reception | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 23 | drinks party | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 1186099 | Seasonal Framework | 33 | pre-dinner reception | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 43 | drinks party | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Category `1000` is named "Legacy Programme D" with a recommended serving size of 13 and is designated for "pre-dinner reception" events. It was created on 2025-01-01 and last updated on 2025-01-02. Category `1001`, "Regional Standard," recommends 23 servings and is associated with "drinks party" events. Category `1002`, "Seasonal Framework," also targets pre-dinner receptions with a recommended serving size of 33. Category `1003`, "Integrated Protocol A," is a drinks-party category recommending 43 servings. The internal `category_id` fields contain both numeric identifiers like `state_et_9` and `1186099` and UUID-style values such as `c744c896-8fcc-11eb-924d-9cd76263cbd0`.

## Ingredient Management

Ingredients form the compositional layer beneath both canapés and tasting dishes. The ingredient registry records each ingredient's identifier, name, food category, and whether it carries an allergen flag.

**Table `ingredients`**

| ingredient_id | name | category | allergen_flag |
|---|---|---|---|
| 1 | Extended Review | protein | false |
| 2 | Pilot Initiative A | vegetable | true |
| 3 | Baseline Model | dairy | false |
| 4 | Distributed Cluster | grain | true |

Ingredient `1`, named "Extended Review," falls under the protein category and has no allergen flag. Ingredient `2`, "Pilot Initiative A," is a vegetable and carries an allergen flag of `true`. Ingredient `3`, "Baseline Model," is classified as dairy with no allergen flag. Ingredient `4`, "Distributed Cluster," is a grain and also carries an allergen flag of `true`. The allergen flag is a critical operational field: any menu item composed of ingredients `2` or `4` must surface allergen warnings during event planning.

## Tasting Dish Registry

Tasting dishes occupy a parallel structure to canapés, with their own naming, pricing, and categorization. The tasting dish table mirrors the canapé schema with equivalent columns.

**Table `tasting_dishes`**

| id | dish_id | name | unit_price | dietary_category | description | serving_size | dish_category_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106692 | Extended Review | 5,692 | v | Extended Survey | 36 | 1 |
| 2 | 8928522 | Pilot Initiative A | 45,650 | vg | Pilot Corridor A | 42 | 2 |
| 3 | 790477 | Baseline Model | 2,705 | v | Baseline Series | 48 | 3 |
| 4 | gd_acc_220000 | Distributed Cluster | 211.07 | vg | Distributed Assessment | 54 | 4 |

The tasting dish `2106692` ("Extended Review") is priced at 5,692, carries dietary code `v`, and has a serving size of 36. The dish `8928522` ("Pilot Initiative A") is priced at 45,650 with dietary code `vg` and a serving size of 42. Dish `790477` ("Baseline Model") is priced at 2,705 with dietary code `v` and a serving size of 48. The final dish, `gd_acc_220000` ("Distributed Cluster"), is priced at 211.07 with dietary code `vg` and a serving size of 54. Each dish references a `dish_category_id` in the range 1–4, linking to the dish category definitions.

## Dish Categories

Dish categories organize tasting dishes by event type and serving conventions, analogous to canapé categories.

**Table `dish_categories`**

| dish_category_id | category_id | category_name | recommended_serving_size | event_type |
|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | 13 | distributed-event-24 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 23 | baseline-event-25 |
| 3 | 1186099 | Seasonal Framework | 33 | pilot-event-26 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 43 | extended-event-27 |

Dish category `1`, "Legacy Programme D," recommends 13 servings and is tagged for the event type `distributed-event-24`. Dish category `2`, "Regional Standard," recommends 23 servings for `baseline-event-25`. Dish category `3`, "Seasonal Framework," recommends 33 servings for `pilot-event-26`. Dish category `4`, "Integrated Protocol A," recommends 43 servings for `extended-event-27`. The internal `category_id` fields reuse the same identifiers found in the canapé categories table—`state_et_9`, `c744c896-8fcc-11eb-924d-9cd76263cbd0`, `1186099`, and `2b2c096e-8fcd-11eb-924d-9cd76263cbd0`—indicating a shared categorical taxonomy across both canapé and tasting dish domains.

## Ingredient Composition: Canapés

The relationship between canapés and ingredients is captured in a junction table that records which ingredients compose each canapé.

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

Canapé `1` ("Extended Review") is composed of ingredients `1` ("Extended Review," protein) and `2` ("Pilot Initiative A," vegetable, allergen). Canapé `2` ("Pilot Initiative A") uses ingredients `2` and `3` ("Baseline Model," dairy). Canapé `3` ("Baseline Model") combines ingredients `3` and `4` ("Distributed Cluster," grain, allergen). Canapé `4` ("Distributed Cluster") uses ingredients `4` and `1`. Every canapé contains exactly two ingredients, and each ingredient appears in exactly two canapés, forming a balanced composition pattern. The allergen flag on ingredients `2` and `4` means that canapés `1`, `2`, `3`, and `4` all contain at least one allergen-bearing ingredient.

## Cross-Reference Tables

The remaining junction tables—`categories_canapes`, `ingredients_canapes`, and `dishes_ingredients`—along with `categories_dishes`, provide additional linkage layers. These tables formalize the relationships between categories and items, and between items and ingredients, ensuring referential integrity across the domain.

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

These cross-reference structures enable flexible querying: any item can be traced to its categories, any category can be expanded to its constituent items, and any ingredient can be traced to all items that use it. The design supports both top-down exploration (category → items → ingredients) and bottom-up aggregation (ingredient → items → categories).

## View: Canapé and Canapé Category Association

The view `v_canape_canape_category` joins canapés with their categories, answering the question: which canapés belong to which category?

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

This view reveals that canapé `4793464` ("Extended Review") is classified under category `1000` ("Legacy Programme D"), while canapé `3744024` ("Pilot Initiative A") maps to category `1001` ("Regional Standard"). Canapé `8928509` ("Baseline Model") belongs to category `1002` ("Seasonal Framework"), and canapé `gd_taxc_2121` ("Distributed Cluster") is assigned to category `1003` ("Integrated Protocol A"). The join confirms a one-to-one mapping between the four canapés and the four categories, with each canapé occupying exactly one category.

## View: Canapé and Ingredient Detail

The view `v_canape_ingredient_detail` joins canapés with their ingredients, answering: what ingredients compose each canapé?

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

Reading the first row, canapé `4793464` ("Extended Review") is composed of ingredient `1` ("Extended Review," protein, no allergen). The second row shows the same canapé also uses ingredient `2` ("Pilot Initiative A," vegetable, allergen flagged). The third row reveals canapé `3744024` ("Pilot Initiative A") uses ingredient `2`, and the fourth row shows it also uses ingredient `3` ("Baseline Model," dairy). This view is essential for allergen screening: any row with `allergen_flag = true` signals that the associated canapé contains an allergen-bearing ingredient.

## View: Canapé Category and Canapé Detail

The view `v_canape_category_canape_detail` joins categories with their canapés, answering: which canapés fall under each category?

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

The first row shows category `1000` ("Legacy Programme D") contains canapé `4793464` ("Extended Review"), priced at 5,692 with dietary code `v`. The second row maps category `1001` ("Regional Standard") to canapé `3744024` ("Pilot Initiative A"), priced at 45,650 with dietary code `vg`. The third row associates category `1002` ("Seasonal Framework") with canapé `8928509` ("Baseline Model"), priced at 2,705. The fourth row links category `1003` ("Integrated Protocol A") to canapé `gd_taxc_2121` ("Distributed Cluster"), priced at 211.07. This view supports event planners who need to browse canapés by category and see full item details including pricing and dietary codes.

## View: Ingredient and Canapé Detail

The view `v_ingredient_canape_detail` joins ingredients with the canapés that use them, answering: which canapés use a given ingredient?

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

Ingredient `1` ("Extended Review," protein) appears in canapé `4793464` ("Extended Review") and canapé `gd_taxc_2121` ("Distributed Cluster"). Ingredient `2` ("Pilot Initiative A," vegetable, allergen) is used in canapé `4793464` and canapé `3744024`. Ingredient `3` ("Baseline Model," dairy) appears in canapé `3744024` and canapé `8928509`. Ingredient `4` ("Distributed Cluster," grain, allergen) is used in canapé `8928509` and canapé `gd_taxc_2121`. This view is particularly useful for ingredient-level reporting: a procurement manager can determine which canapés require a given ingredient, and a dietary compliance officer can identify all items containing allergen-bearing ingredients.

## View: Tasting Dish and Dish Category Association

The view `v_tasting_dish_dish_category` joins tasting dishes with their categories, answering: which tasting dishes belong to which category?

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

The first row shows dish `2106692` ("Extended Review") is classified under dish category `1` ("Legacy Programme D"). The second row maps dish `8928522` ("Pilot Initiative A") to dish category `2` ("Regional Standard"). The third row associates dish `790477` ("Baseline Model") with dish category `3` ("Seasonal Framework"). The fourth row links dish `gd_acc_220000` ("Distributed Cluster") to dish category `4` ("Integrated Protocol A"). As with canapés, the mapping is one-to-one: each tasting dish occupies exactly one dish category.

## View: Tasting Dish and Ingredient Detail

The view `v_tasting_dish_ingredient_detail` joins tasting dishes with their ingredients, answering: what ingredients compose each tasting dish?

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

This view reveals the ingredient composition of tasting dishes in the same pattern as canapés. Each tasting dish is associated with two ingredients, and the allergen flags on ingredients `2` and `4` apply equally to the dishes that use them. This view enables the same allergen-screening and procurement workflows for tasting dishes as the canapé ingredient view does for canapés.

## View: Dish Category and Tasting Dish Detail

The view `v_dish_category_tasting_dish_detail` joins dish categories with their tasting dishes, answering: which tasting dishes fall under each dish category?

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

The first row shows dish category `1` ("Legacy Programme D") contains dish `2106692` ("Extended Review"), priced at 5,692 with dietary code `v`. The second row maps dish category `2` ("Regional Standard") to dish `8928522` ("Pilot Initiative A"), priced at 45,650 with dietary code `vg`. The third row associates dish category `3` ("Seasonal Framework") with dish `790477` ("Baseline Model"), priced at 2,705. The fourth row links dish category `4` ("Integrated Protocol A") to dish `gd_acc_220000` ("Distributed Cluster"), priced at 211.07. This view supports the same event-planning workflow for tasting dishes as the canapé category view supports for canapés.

## Synthesis

The domain's data model captures a coherent operational picture: canapés and tasting dishes are the primary menu items, each priced, classified by dietary code, and assigned to a category. Ingredients form the compositional layer, with allergen flags that must be surfaced during menu planning. Junction tables record the many-to-many relationships between items and ingredients, while category tables organize items by event type and serving conventions. The seven views provide focused lenses on the data—category membership, ingredient composition, and cross-references—enabling event planners, procurement managers, and dietary compliance officers to answer practical questions without constructing ad-hoc joins. The consistent naming patterns across canapés, tasting dishes, and their categories suggest a unified taxonomy, while the parallel structures for canapés and tasting dishes allow independent management of each item type within a shared operational framework.