## Domain Modelling and Relational Materialization

The domain under examination is a menu-item catalogue system in which each consumable product—whether a dessert, a beverage, or a hybrid offering—is described through a constellation of orthogonal attributes: what it is called, how much it costs, what it is made of, how it is priced, how it is topped, and (for beverages) how it is served. The relational model captures this structure by decomposing the monolithic menu concept into five base tables whose rows are linked by foreign keys. The primary fact table, `menu_line_items`, anchors every row with a surrogate key `menu_line_item_id` and a business identifier `item_identifier` (values such as `ITE-2045`, `ITE-2050`, `ITE-2055`, `ITE-2060`). Each menu line item carries a human-readable `display_name` (`Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, `Distributed Survey`), a `base_price` ranging from 12.72 to 18.59, a `category` (`Dessert` or `Beverage`), a `serving_size` descriptor (`primary-serving-40`, `adaptive-serving-41`, `distributed-serving-42`, `baseline-serving-43`), and a boolean flag `is_ala_mode_available` indicating whether à-la-carde ordering is permitted. Three of the four rows (`menu_line_item_id` 1, 3, 4) have `is_ala_mode_available` set to `false`, while row 2 (`Pilot Series A`) enables it.

**Table `menu_line_items`**

| menu_line_item_id | item_identifier | display_name | base_price | category | serving_size | is_ala_mode_available | ingredient_id | price_point_id | topping_option_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Extended Corridor | 12.72 | Dessert | primary-serving-40 | true | 100 | 1 | 100 |
| 2 | ITE-2050 | Pilot Series A | 12.87 | Beverage | adaptive-serving-41 | false | 101 | 2 | 101 |
| 3 | ITE-2055 | Baseline Assessment | 17.41 | Dessert | distributed-serving-42 | true | 102 | 3 | 102 |
| 4 | ITE-2060 | Distributed Survey | 18.59 | Beverage | baseline-serving-43 | false | 103 | 4 | 103 |

The remaining four tables store attributes that are logically associated with a menu line item but are too voluminous or too structurally distinct to be inlined into the fact table. The `ingredients` table holds one row per ingredient, identified by `ingredient_id` (100–103), with a `name` column (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), a `state` (`Solid`, `Liquid`, `Creamy`), a boolean `is_allergen` flag, an `origin` code (`distributed-origin-66`, `baseline-origin-67`, `pilot-origin-68`, `extended-origin-69`), and a foreign key `menu_line_item_id` that points back to the anchoring row in `menu_line_items`. The cardinality here is one-to-one: each menu line item has exactly one ingredient row, and each ingredient row belongs to exactly one menu line item.

**Table `ingredients`**

| ingredient_id | name | state | is_allergen | origin | menu_line_item_id |
|---|---|---|---|---|---|
| 100 | Extended Review | Solid | false | distributed-origin-66 | 1 |
| 101 | Pilot Initiative A | Liquid | true | baseline-origin-67 | 2 |
| 102 | Baseline Model | Creamy | false | pilot-origin-68 | 3 |
| 103 | Distributed Cluster | Solid | true | extended-origin-69 | 4 |

The `price_points` table stores pricing metadata in a separate row per menu line item, identified by `price_point_id` (1–4). Each row carries a `price_id` (a string such as `1204-0009-S`, `7119782`, `d9d9f18e-8fcc-11eb-924d-9cd76263cbd0`, `1250220`), an `amount` (13.49, 25.47, 19.72, 12.74), a `currency_code` (values like `gd_fp_eu_acc3`, `managing-resources`, `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, `10445649`), a `price_type` (`Base` or `AddOn`), a `menu_line_item_id` foreign key, and a `created_at` timestamp. Again the cardinality is one-to-one: each menu line item has exactly one price point row.

**Table `price_points`**

| price_point_id | price_id | amount | currency_code | price_type | menu_line_item_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 1204-0009-S | 13.49 | gd_fp_eu_acc3 | Base | 1 | 2025-01-01 00:14:00 |
| 2 | 7119782 | 25.47 | managing-resources | AddOn | 2 | 2025-02-06 03:14:00 |
| 3 | d9d9f18e-8fcc-11eb-924d-9cd76263cbd0 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Base | 3 | 2025-03-11 06:14:00 |
| 4 | 1250220 | 12.74 | 10445649 | AddOn | 4 | 2025-04-16 09:14:00 |

The `topping_options` table is the most structurally rich of the four attribute tables. It is identified by a composite of `id` (100–103) and `option_id` (UUIDs such as `a4e3c328-8fb9-11eb-924d-9cd76263cbd0` and `1204-0009-S`), carries an `option_name` (`Seasonal Initiative`, `Integrated Model`, `Extended Cluster D`, `Pilot Review`), a boolean `is_choice_based` flag, an `associated_price_id` string, and two foreign keys: `menu_line_item_id` and `ingredient_id`. The presence of both foreign keys means that a topping option row simultaneously references its parent menu line item and the ingredient it modifies. The cardinality from `menu_line_items` to `topping_options` is one-to-one in the current dataset, as is the cardinality from `ingredients` to `topping_options`.

**Table `topping_options`**

| id | option_id | option_name | is_choice_based | associated_price_id | menu_line_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | false | organisational-knowledge | 1 | 100 |
| 101 | 1204-0009-S | Integrated Model | true | 195350 | 2 | 101 |
| 102 | 9424920 | Extended Cluster D | false | 3001009030130 | 3 | 102 |
| 103 | 1186083 | Pilot Review | true | 4277034 | 4 | 103 |

The `beverage_servings` table specializes the model for beverage-type menu items. It is identified by `beverage_serving_id` (1000–1003), carries a `serving_id` (values such as `325459`, `9568449`, `21005921`, `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `volume_oz` (13.70, 16.40, 19.10, 21.80), a `preparation_method` (`Cold Brewed`, `Fresh Squeezed`, `Fresh Brewed`), a boolean `is_sweetened` flag, and a `menu_line_item_id` foreign key. The cardinality is again one-to-one with `menu_line_items`.

**Table `beverage_servings`**

| beverage_serving_id | serving_id | volume_oz | preparation_method | is_sweetened | menu_line_item_id |
|---|---|---|---|---|---|
| 1000 | 325459 | 13.70 | Cold Brewed | true | 1 |
| 1001 | 9568449 | 16.40 | Fresh Squeezed | false | 2 |
| 1002 | 21005921 | 19.10 | Fresh Brewed | true | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 21.80 | Cold Brewed | false | 4 |

### From Entity Types to Columns and Foreign Keys

The materialization strategy follows a classic star-schema pattern with a central fact table (`menu_line_items`) and four satellite tables (`ingredients`, `price_points`, `topping_options`, `beverage_servings`). Each satellite table stores a single row per menu line item, linked by a one-to-one foreign key. The foreign key columns are `ingredient_id` in `menu_line_items` pointing to `ingredients.ingredient_id`, `price_point_id` in `menu_line_items` pointing to `price_points.price_point_id`, `topping_option_id` in `menu_line_items` pointing to `topping_options.id`, and `menu_line_item_id` in each satellite table pointing back to `menu_line_items.menu_line_item_id`. The `topping_options` table additionally carries a second foreign key, `ingredient_id`, pointing to `ingredients.ingredient_id`, which creates a cross-reference between the topping and ingredient domains.

This design choice—placing the foreign keys in the fact table rather than in the satellites—means that the `menu_line_items` table alone can be queried to retrieve the identifiers of all associated attribute rows. The actual attribute values (ingredient name, price amount, topping option name, preparation method) must be fetched through joins. The views defined below automate these joins and present the reconstructed domain facts as flat, queryable result sets.

### View Interpretations

The view `vw_menu_line_item_ingredient` joins `menu_line_items` to `ingredients` on `a.ingredient_id = b.ingredient_id` and projects the menu item's surrogate key, business identifier, display name, and base price alongside the ingredient's `ingredient_id`, `name`, and `state`. The result answers the question: "What ingredient is associated with each menu line item, and what is its physical state?" For example, the row for `Extended Corridor` (`menu_line_item_id` 1, `base_price` 12.72) reveals that its ingredient is `Extended Review` (`ingredient_ingredient_id` 100) in the `Solid` state. The row for `Pilot Series A` (`menu_line_item_id` 2, `base_price` 12.87) shows the ingredient `Pilot Initiative A` (`ingredient_ingredient_id` 101) in the `Liquid` state.

**View `vw_menu_line_item_ingredient`**

```sql
CREATE VIEW vw_menu_line_item_ingredient AS
SELECT a.menu_line_item_id, a.item_identifier, a.display_name, a.base_price, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.state AS ingredient_state
FROM menu_line_items a JOIN ingredients b ON a.ingredient_id = b.ingredient_id;
```

| menu_line_item_id | item_identifier | display_name | base_price | ingredient_ingredient_id | ingredient_name | ingredient_state |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Extended Corridor | 12.72 | 100 | Extended Review | Solid |
| 2 | ITE-2050 | Pilot Series A | 12.87 | 101 | Pilot Initiative A | Liquid |
| 3 | ITE-2055 | Baseline Assessment | 17.41 | 102 | Baseline Model | Creamy |
| 4 | ITE-2060 | Distributed Survey | 18.59 | 103 | Distributed Cluster | Solid |

The view `vw_menu_line_item_price_point` joins `menu_line_items` to `price_points` on `a.price_point_id = b.price_point_id` and projects the menu item's key and pricing alongside the price point's `price_id`, `amount`, `currency_code`, `price_type`, and `created_at`. This view answers: "What is the detailed pricing metadata for each menu line item?" The row for `Extended Corridor` (`menu_line_item_id` 1) shows a `price_id` of `1204-0009-S`, an `amount` of 13.49 in currency `gd_fp_eu_acc3`, a `price_type` of `Base`, and a `created_at` timestamp of `2025-01-01 00:14:00`. The row for `Pilot Series A` (`menu_line_item_id` 2) carries a `price_id` of `7119782`, an `amount` of 25.47 in currency `managing-resources`, a `price_type` of `AddOn`, and a `created_at` of `2025-02-06 03:14:00`.

**View `vw_menu_line_item_price_point`**

```sql
CREATE VIEW vw_menu_line_item_price_point AS
SELECT a.menu_line_item_id, a.item_identifier, a.display_name, a.base_price, b.price_point_id AS point_price_point_id, b.price_id AS point_price_id, b.amount AS point_amount
FROM menu_line_items a JOIN price_points b ON a.price_point_id = b.price_point_id;
```

| menu_line_item_id | item_identifier | display_name | base_price | point_price_point_id | point_price_id | point_amount |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Extended Corridor | 12.72 | 1 | 1204-0009-S | 13.49 |
| 2 | ITE-2050 | Pilot Series A | 12.87 | 2 | 7119782 | 25.47 |
| 3 | ITE-2055 | Baseline Assessment | 17.41 | 3 | d9d9f18e-8fcc-11eb-924d-9cd76263cbd0 | 19.72 |
| 4 | ITE-2060 | Distributed Survey | 18.59 | 4 | 1250220 | 12.74 |

The view `vw_menu_line_item_topping_option` joins `menu_line_items` to `topping_options` on `a.topping_option_id = b.id` and projects the menu item's key and display name alongside the topping's `option_id`, `option_name`, `is_choice_based`, `associated_price_id`, and `menu_line_item_id`. This view answers: "What topping option is configured for each menu line item, and is it choice-based?" The row for `Extended Corridor` (`menu_line_item_id` 1) reveals a topping with `option_id` `a4e3c328-8fb9-11eb-924d-9cd76263cbd0`, named `Seasonal Initiative`, where `is_choice_based` is `false` and `associated_price_id` is `organisational-knowledge`. The row for `Pilot Series A` (`menu_line_item_id` 2) shows `option_id` `1204-0009-S`, named `Integrated Model`, with `is_choice_based` set to `true` and `associated_price_id` `195350`.

**View `vw_menu_line_item_topping_option`**

```sql
CREATE VIEW vw_menu_line_item_topping_option AS
SELECT a.menu_line_item_id, a.item_identifier, a.display_name, a.base_price, b.id AS option_id, b.option_id AS option_option_id, b.option_name AS option_option_name
FROM menu_line_items a JOIN topping_options b ON a.topping_option_id = b.id;
```

| menu_line_item_id | item_identifier | display_name | base_price | option_id | option_option_id | option_option_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Extended Corridor | 12.72 | 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative |
| 2 | ITE-2050 | Pilot Series A | 12.87 | 101 | 1204-0009-S | Integrated Model |
| 3 | ITE-2055 | Baseline Assessment | 17.41 | 102 | 9424920 | Extended Cluster D |
| 4 | ITE-2060 | Distributed Survey | 18.59 | 103 | 1186083 | Pilot Review |

The view `vw_ingredient_menu_line_item` performs the inverse join: it starts from `ingredients` and joins to `menu_line_items` on `a.menu_line_item_id = b.menu_line_item_id`, projecting the ingredient's `ingredient_id`, `name`, `state`, `is_allergen`, `origin`, and the menu item's `menu_line_item_id`, `item_identifier`, `display_name`, and `base_price`. This view answers: "From the ingredient's perspective, which menu line item does it belong to, and what are that item's identifying attributes?" The row for `Extended Review` (`ingredient_id` 100, `state` `Solid`, `is_allergen` `false`, `origin` `distributed-origin-66`) is linked to `menu_line_item_id` 1 (`item_identifier` `ITE-2045`, `display_name` `Extended Corridor`, `base_price` 12.72). The row for `Pilot Initiative A` (`ingredient_id` 101, `state` `Liquid`, `is_allergen` `true`, `origin` `baseline-origin-67`) is linked to `menu_line_item_id` 2 (`item_identifier` `ITE-2050`, `display_name` `Pilot Series A`, `base_price` 12.87).

**View `vw_ingredient_menu_line_item`**

```sql
CREATE VIEW vw_ingredient_menu_line_item AS
SELECT a.ingredient_id, a.name, a.state, a.is_allergen, b.menu_line_item_id AS item_menu_line_item_id, b.item_identifier AS item_item_identifier, b.display_name AS item_display_name
FROM ingredients a JOIN menu_line_items b ON a.menu_line_item_id = b.menu_line_item_id;
```

| ingredient_id | name | state | is_allergen | item_menu_line_item_id | item_item_identifier | item_display_name |
|---|---|---|---|---|---|---|
| 100 | Extended Review | Solid | false | 1 | ITE-2045 | Extended Corridor |
| 101 | Pilot Initiative A | Liquid | true | 2 | ITE-2050 | Pilot Series A |
| 102 | Baseline Model | Creamy | false | 3 | ITE-2055 | Baseline Assessment |
| 103 | Distributed Cluster | Solid | true | 4 | ITE-2060 | Distributed Survey |

The view `vw_price_point_menu_line_item` joins `price_points` to `menu_line_items` on `a.menu_line_item_id = b.menu_line_item_id`, projecting the price point's `price_point_id`, `price_id`, `amount`, `currency_code`, `price_type`, `created_at`, and the menu item's `menu_line_item_id`, `item_identifier`, `display_name`, and `base_price`. This view answers: "From the price point's perspective, which menu line item does it describe?" The row with `price_point_id` 1 (`price_id` `1204-0009-S`, `amount` 13.49, `currency_code` `gd_fp_eu_acc3`, `price_type` `Base`, `created_at` `2025-01-01 00:14:00`) is linked to `menu_line_item_id` 1 (`item_identifier` `ITE-2045`, `display_name` `Extended Corridor`, `base_price` 12.72). The row with `price_point_id` 2 (`price_id` `7119782`, `amount` 25.47, `currency_code` `managing-resources`, `price_type` `AddOn`, `created_at` `2025-02-06 03:14:00`) is linked to `menu_line_item_id` 2 (`item_identifier` `ITE-2050`, `display_name` `Pilot Series A`, `base_price` 12.87).

**View `vw_price_point_menu_line_item`**

```sql
CREATE VIEW vw_price_point_menu_line_item AS
SELECT a.price_point_id, a.price_id, a.amount, a.currency_code, b.menu_line_item_id AS item_menu_line_item_id, b.item_identifier AS item_item_identifier, b.display_name AS item_display_name
FROM price_points a JOIN menu_line_items b ON a.menu_line_item_id = b.menu_line_item_id;
```

| price_point_id | price_id | amount | currency_code | item_menu_line_item_id | item_item_identifier | item_display_name |
|---|---|---|---|---|---|---|
| 1 | 1204-0009-S | 13.49 | gd_fp_eu_acc3 | 1 | ITE-2045 | Extended Corridor |
| 2 | 7119782 | 25.47 | managing-resources | 2 | ITE-2050 | Pilot Series A |
| 3 | d9d9f18e-8fcc-11eb-924d-9cd76263cbd0 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | ITE-2055 | Baseline Assessment |
| 4 | 1250220 | 12.74 | 10445649 | 4 | ITE-2060 | Distributed Survey |

The view `vw_topping_option_menu_line_item` joins `topping_options` to `menu_line_items` on `a.menu_line_item_id = b.menu_line_item_id`, projecting the topping's `id`, `option_id`, `option_name`, `is_choice_based`, `associated_price_id`, `menu_line_item_id`, `ingredient_id`, and the menu item's `menu_line_item_id`, `item_identifier`, `display_name`, `base_price`, `category`, `serving_size`, and `is_ala_mode_available`. This view answers: "From the topping option's perspective, which menu line item does it modify, and what are that item's full identifying and categorical attributes?" The row with `id` 100 (`option_id` `a4e3c328-8fb9-11eb-924d-9cd76263cbd0`, `option_name` `Seasonal Initiative`, `is_choice_based` `false`, `associated_price_id` `organisational-knowledge`, `ingredient_id` 100) is linked to `menu_line_item_id` 1 (`item_identifier` `ITE-2045`, `display_name` `Extended Corridor`, `base_price` 12.72, `category` `Dessert`, `serving_size` `primary-serving-40`, `is_ala_mode_available` `true`). The row with `id` 101 (`option_id` `1204-0009-S`, `option_name` `Integrated Model`, `is_choice_based` `true`, `associated_price_id` `195350`, `ingredient_id` 101) is linked to `menu_line_item_id` 2 (`item_identifier` `ITE-2050`, `display_name` `Pilot Series A`, `base_price` 12.87, `category` `Beverage`, `serving_size` `adaptive-serving-41`, `is_ala_mode_available` `false`).

**View `vw_topping_option_menu_line_item`**

```sql
CREATE VIEW vw_topping_option_menu_line_item AS
SELECT a.id, a.option_id, a.option_name, a.is_choice_based, b.menu_line_item_id AS item_menu_line_item_id, b.item_identifier AS item_item_identifier, b.display_name AS item_display_name
FROM topping_options a JOIN menu_line_items b ON a.menu_line_item_id = b.menu_line_item_id;
```

| id | option_id | option_name | is_choice_based | item_menu_line_item_id | item_item_identifier | item_display_name |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | false | 1 | ITE-2045 | Extended Corridor |
| 101 | 1204-0009-S | Integrated Model | true | 2 | ITE-2050 | Pilot Series A |
| 102 | 9424920 | Extended Cluster D | false | 3 | ITE-2055 | Baseline Assessment |
| 103 | 1186083 | Pilot Review | true | 4 | ITE-2060 | Distributed Survey |

The view `vw_topping_option_ingredient` joins `topping_options` to `ingredients` on `a.ingredient_id = b.ingredient_id`, projecting the topping's `id`, `option_id`, `option_name`, `is_choice_based`, `associated_price_id`, `menu_line_item_id`, and the ingredient's `ingredient_id`, `name`, `state`, `is_allergen`, `origin`. This view answers: "Which ingredient is associated with each topping option, and what are that ingredient's properties?" The row with `id` 100 (`option_name` `Seasonal Initiative`, `is_choice_based` `false`, `associated_price_id` `organisational-knowledge`, `menu_line_item_id` 1) is linked to `ingredient_id` 100 (`name` `Extended Review`, `state` `Solid`, `is_allergen` `false`, `origin` `distributed-origin-66`). The row with `id` 101 (`option_name` `Integrated Model`, `is_choice_based` `true`, `associated_price_id` `195350`, `menu_line_item_id` 2) is linked to `ingredient_id` 101 (`name` `Pilot Initiative A`, `state` `Liquid`, `is_allergen` `true`, `origin` `baseline-origin-67`).

**View `vw_topping_option_ingredient`**

```sql
CREATE VIEW vw_topping_option_ingredient AS
SELECT a.id, a.option_id, a.option_name, a.is_choice_based, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name, b.state AS ingredient_state
FROM topping_options a JOIN ingredients b ON a.ingredient_id = b.ingredient_id;
```

| id | option_id | option_name | is_choice_based | ingredient_ingredient_id | ingredient_name | ingredient_state |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | false | 100 | Extended Review | Solid |
| 101 | 1204-0009-S | Integrated Model | true | 101 | Pilot Initiative A | Liquid |
| 102 | 9424920 | Extended Cluster D | false | 102 | Baseline Model | Creamy |
| 103 | 1186083 | Pilot Review | true | 103 | Distributed Cluster | Solid |

The view `vw_beverage_serving_menu_line_item` joins `beverage_servings` to `menu_line_items` on `a.menu_line_item_id = b.menu_line_item_id`, projecting the beverage serving's `beverage_serving_id`, `serving_id`, `volume_oz`, `preparation_method`, `is_sweetened`, and the menu item's `menu_line_item_id`, `item_identifier`, `display_name`, `base_price`, `category`, `serving_size`, and `is_ala_mode_available`. This view answers: "What are the beverage-specific serving details for each menu line item, and how do they relate to the item's category and serving size?" The row with `beverage_serving_id` 1000 (`serving_id` `325459`, `volume_oz` 13.70, `preparation_method` `Cold Brewed`, `is_sweetened` `true`) is linked to `menu_line_item_id` 1 (`item_identifier` `ITE-2045`, `display_name` `Extended Corridor`, `base_price` 12.72, `category` `Dessert`, `serving_size` `primary-serving-40`, `is_ala_mode_available` `true`). The row with `beverage_serving_id` 1001 (`serving_id` `9568449`, `volume_oz` 16.40, `preparation_method` `Fresh Squeezed`, `is_sweetened` `false`) is linked to `menu_line_item_id` 2 (`item_identifier` `ITE-2050`, `display_name` `Pilot Series A`, `base_price` 12.87, `category` `Beverage`, `serving_size` `adaptive-serving-41`, `is_ala_mode_available` `false`).

**View `vw_beverage_serving_menu_line_item`**

```sql
CREATE VIEW vw_beverage_serving_menu_line_item AS
SELECT a.beverage_serving_id, a.serving_id, a.volume_oz, a.preparation_method, b.menu_line_item_id AS item_menu_line_item_id, b.item_identifier AS item_item_identifier, b.display_name AS item_display_name
FROM beverage_servings a JOIN menu_line_items b ON a.menu_line_item_id = b.menu_line_item_id;
```

| beverage_serving_id | serving_id | volume_oz | preparation_method | item_menu_line_item_id | item_item_identifier | item_display_name |
|---|---|---|---|---|---|---|
| 1000 | 325459 | 13.70 | Cold Brewed | 1 | ITE-2045 | Extended Corridor |
| 1001 | 9568449 | 16.40 | Fresh Squeezed | 2 | ITE-2050 | Pilot Series A |
| 1002 | 21005921 | 19.10 | Fresh Brewed | 3 | ITE-2055 | Baseline Assessment |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 21.80 | Cold Brewed | 4 | ITE-2060 | Distributed Survey |

### Synthesis

The relational model decomposes the menu-item domain into a central fact table and four satellite tables, each capturing a distinct attribute dimension: ingredient composition, pricing metadata, topping configuration, and beverage serving specifics. The foreign keys—`ingredient_id`, `price_point_id`, and `topping_option_id` in `menu_line_items`, and `menu_line_item_id` in each satellite—establish a star topology where every attribute row traces back to exactly one menu line item. The `topping_options` table introduces an additional cross-reference via its own `ingredient_id` column, enabling queries that relate toppings directly to ingredients without passing through the fact table. The eight views materialize the join logic that reconstructs flat, human-readable domain facts from this normalized structure, each view answering a specific analytical question by projecting a curated subset of columns from the participating tables. The result is a schema that is both normal enough to avoid update anomalies and denormalized enough at the view layer to support straightforward reporting and analysis.