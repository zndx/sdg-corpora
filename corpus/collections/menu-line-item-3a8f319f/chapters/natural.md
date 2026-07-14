## Menu Engineering and Line-Item Composition

A restaurant's menu is not merely a list of offerings; it is a structured composition of ingredients, pricing strategies, and preparation methods that together define the customer experience. Every dish or drink on the menu exists as a line item—a discrete record that ties together what the item is called, how much it costs, what goes into it, and how it is prepared. The data model underlying this domain captures that complexity through a set of interrelated tables, each responsible for a distinct dimension of the menu. At the center sits the `menu_line_items` table, which anchors every other entity through foreign-key relationships. From this hub, the system branches into ingredients, price points, topping options, and beverage-specific serving details, forming a coherent picture of the entire catalog.

**Table `menu_line_items`**

| menu_line_item_id | item_identifier | display_name | base_price | category | serving_size | is_ala_mode_available | ingredient_id | price_point_id | topping_option_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | Extended Corridor | 12.72 | Dessert | primary-serving-40 | true | 100 | 1 | 100 |
| 2 | ITE-2050 | Pilot Series A | 12.87 | Beverage | adaptive-serving-41 | false | 101 | 2 | 101 |
| 3 | ITE-2055 | Baseline Assessment | 17.41 | Dessert | distributed-serving-42 | true | 102 | 3 | 102 |
| 4 | ITE-2060 | Distributed Survey | 18.59 | Beverage | baseline-serving-43 | false | 103 | 4 | 103 |

Each row in `menu_line_items` represents a single sellable product. The `menu_line_item_id` serves as the primary key, while `item_identifier` provides a human-readable code such as `ITE-2045` or `ITE-2050`. The `display_name` column carries the name presented to customers—names like "Extended Corridor" and "Pilot Series A" appear in the data, alongside "Baseline Assessment" and "Distributed Survey." The `base_price` field records the starting cost, ranging from $12.72 for "Extended Corridor" to $18.59 for "Distributed Survey." The `category` column distinguishes between broad types, with values such as `Dessert` and `Beverage` appearing in the sample rows. The `serving_size` field uses descriptive labels like `primary-serving-40` and `adaptive-serving-41`, while `is_ala_mode_available` is a boolean flag indicating whether the item can be ordered à la carte.

The foreign keys embedded in `menu_line_items`—`ingredient_id`, `price_point_id`, and `topping_option_id`—point to their respective detail tables, establishing the foundational relationships that allow the system to answer questions about composition, cost, and customization.

## Ingredients and Their Properties

Every menu item is built from one or more ingredients, each of which carries its own set of attributes. The `ingredients` table stores these properties, linking back to the menu line item through the `menu_line_item_id` column.

**Table `ingredients`**

| ingredient_id | name | state | is_allergen | origin | menu_line_item_id |
|---|---|---|---|---|---|
| 100 | Extended Review | Solid | false | distributed-origin-66 | 1 |
| 101 | Pilot Initiative A | Liquid | true | baseline-origin-67 | 2 |
| 102 | Baseline Model | Creamy | false | pilot-origin-68 | 3 |
| 103 | Distributed Cluster | Solid | true | extended-origin-69 | 4 |

The `ingredient_id` column acts as the primary key for this table. The `name` field holds the ingredient's designation—entries such as "Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster" populate the dataset. The `state` column describes the physical state of the ingredient, with values like `Solid`, `Liquid`, and `Creamy` appearing across the rows. The `is_allergen` flag is a critical safety attribute; in the sample data, "Pilot Initiative A" and "Distributed Cluster" are marked as allergens, while "Extended Review" and "Baseline Model" are not. The `origin` field records where the ingredient comes from, using coded values such as `distributed-origin-66` and `baseline-origin-67`.

The relationship between `menu_line_items` and `ingredients` is one-to-one in the current data model: each menu line item references exactly one ingredient via the `ingredient_id` foreign key. This design choice simplifies the model but may not capture recipes that require multiple ingredients. The view `vw_menu_line_item_ingredient` resolves this relationship by joining the two tables, producing a unified record that pairs each menu item with its ingredient's full profile.

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

This view answers the question: "What ingredient is associated with each menu line item, and what are that ingredient's properties?" Reading the first row, "Extended Corridor" (item identifier `ITE-2045`, base price $12.72) is linked to ingredient 100, "Extended Review," which is in a `Solid` state. The second row shows "Pilot Series A" (`ITE-2050`, $12.87) paired with "Pilot Initiative A," a `Liquid` ingredient flagged as an allergen. The third and fourth rows follow the same pattern, with "Baseline Assessment" connected to "Baseline Model" (`Creamy`) and "Distributed Survey" connected to "Distributed Cluster" (`Solid`, allergen).

The reverse perspective is captured by `vw_ingredient_menu_line_item`, which starts from the ingredient side and surfaces the menu items that reference it.

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

This view is useful when an operations manager needs to trace from a raw material to the finished products that use it. For instance, ingredient 100 ("Extended Review") maps to menu line item 1 ("Extended Corridor"), confirming the one-to-one linkage. The view preserves all ingredient attributes alongside the full menu line item record, enabling queries that filter by ingredient state or allergen status and return the associated products.

## Pricing Structure and Price Points

Pricing in this domain is not a single number attached to a menu item. Instead, the `price_points` table captures pricing as a separate entity with its own identifier, amount, currency, and type.

**Table `price_points`**

| price_point_id | price_id | amount | currency_code | price_type | menu_line_item_id | created_at |
|---|---|---|---|---|---|---|
| 1 | 1204-0009-S | 13.49 | gd_fp_eu_acc3 | Base | 1 | 2025-01-01 00:14:00 |
| 2 | 7119782 | 25.47 | managing-resources | AddOn | 2 | 2025-02-06 03:14:00 |
| 3 | d9d9f18e-8fcc-11eb-924d-9cd76263cbd0 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Base | 3 | 2025-03-11 06:14:00 |
| 4 | 1250220 | 12.74 | 10445649 | AddOn | 4 | 2025-04-16 09:14:00 |

The `price_point_id` serves as the primary key. The `price_id` column carries a secondary identifier that varies in format—from numeric strings like `7119782` to UUIDs like `d9d9f18e-8fcc-11eb-924d-9cd76263cbd0`. The `amount` field records the monetary value, ranging from $12.74 to $25.47 in the sample data. The `currency_code` column uses coded values such as `gd_fp_eu_acc3` and `managing-resources`, which likely map to specific currencies or pricing regions within the system. The `price_type` column distinguishes between `Base` and `AddOn` prices, indicating whether the amount represents the item's standard cost or an additional charge. The `menu_line_item_id` foreign key ties each price point to its corresponding menu item, and `created_at` records when the price point was established.

The view `vw_menu_line_item_price_point` joins `menu_line_items` with `price_points` to present a combined record.

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

This view answers: "What is the price point associated with each menu line item, and what are its details?" The first row shows that "Extended Corridor" (base price $12.72) has a `Base` price point with an amount of $13.49, created on 2025-01-01. The second row reveals that "Pilot Series A" (base price $12.87) carries an `AddOn` price point of $25.47, created on 2025-02-06. The third and fourth rows follow similarly, with "Baseline Assessment" linked to a `Base` price of $19.72 and "Distributed Survey" linked to an `AddOn` price of $12.74.

The complementary view `vw_price_point_menu_line_item` inverts this relationship, starting from the price point and surfacing the menu item it belongs to.

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

This perspective is valuable for financial analysis, such as identifying all menu items that share a particular price type or currency code. The view preserves the full price point record alongside the menu line item, enabling queries that filter by price type or amount range and return the associated products.

## Topping Options and Customization

Customers often customize their orders with toppings or modifiers. The `topping_options` table captures these choices, linking them to both the menu line item and the ingredient they modify.

**Table `topping_options`**

| id | option_id | option_name | is_choice_based | associated_price_id | menu_line_item_id | ingredient_id |
|---|---|---|---|---|---|---|
| 100 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | false | organisational-knowledge | 1 | 100 |
| 101 | 1204-0009-S | Integrated Model | true | 195350 | 2 | 101 |
| 102 | 9424920 | Extended Cluster D | false | 3001009030130 | 3 | 102 |
| 103 | 1186083 | Pilot Review | true | 4277034 | 4 | 103 |

The `id` column serves as the primary key for topping options. The `option_id` column carries a secondary identifier, which in the sample data includes UUIDs like `a4e3c328-8fb9-11eb-924d-9cd76263cbd0` and numeric strings like `1204-0009-S`. The `option_name` field describes the topping—"Seasonal Initiative," "Integrated Model," "Extended Cluster D," and "Pilot Review" appear in the data. The `is_choice_based` flag indicates whether the topping is a customer-selected option or a fixed inclusion. The `associated_price_id` column references a price identifier, likely used to calculate any additional charge for the topping. The `menu_line_item_id` and `ingredient_id` foreign keys tie the topping to both the menu item and the ingredient it relates to.

The view `vw_menu_line_item_topping_option` joins the menu line items with their topping options.

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

This view answers: "What topping option is available for each menu line item, and what are its characteristics?" The first row shows that "Extended Corridor" has topping option 100, named "Seasonal Initiative," which is not choice-based (`false`). The second row links "Pilot Series A" to "Integrated Model," a choice-based topping (`true`). The third and fourth rows follow the same pattern, with "Baseline Assessment" linked to "Extended Cluster D" (not choice-based) and "Distributed Survey" linked to "Pilot Review" (choice-based).

The reverse view `vw_topping_option_menu_line_item` starts from the topping and surfaces the menu item it belongs to.

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

This perspective is useful for inventory and procurement, as it allows the system to trace from a topping back to the products that use it. The view preserves all topping attributes alongside the full menu line item record.

The view `vw_topping_option_ingredient` provides a further join, connecting topping options directly to their associated ingredients.

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

This view answers: "Which ingredient is associated with each topping option?" The first row shows that topping option 100 ("Seasonal Initiative") is linked to ingredient 100 ("Extended Review"). The second row links topping option 101 ("Integrated Model") to ingredient 101 ("Pilot Initiative A"). The third and fourth rows follow the same pattern, with topping option 102 connected to ingredient 102 ("Baseline Model") and topping option 103 connected to ingredient 103 ("Distributed Cluster"). This view is particularly useful for allergen tracking, as it allows the system to determine which ingredients are affected by which topping choices.

## Beverage Servings and Preparation

For items in the `Beverage` category, additional preparation details are captured in the `beverage_servings` table. This table stores information about volume, preparation method, and sweetness.

**Table `beverage_servings`**

| beverage_serving_id | serving_id | volume_oz | preparation_method | is_sweetened | menu_line_item_id |
|---|---|---|---|---|---|
| 1000 | 325459 | 13.70 | Cold Brewed | true | 1 |
| 1001 | 9568449 | 16.40 | Fresh Squeezed | false | 2 |
| 1002 | 21005921 | 19.10 | Fresh Brewed | true | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 21.80 | Cold Brewed | false | 4 |

The `beverage_serving_id` serves as the primary key. The `serving_id` column carries a secondary identifier, which in the sample data includes numeric values like `325459` and `9568449`, as well as a string that resembles a Google Places ID (`ChIJkzsYUIBt5kcRM6_JHx26ONk`). The `volume_oz` field records the serving size in fluid ounces, ranging from 13.70 oz to 21.80 oz in the data. The `preparation_method` column describes how the beverage is made, with values such as `Cold Brewed`, `Fresh Squeezed`, and `Fresh Brewed` appearing in the sample rows. The `is_sweetened` flag indicates whether the beverage includes added sweetener. The `menu_line_item_id` foreign key ties each beverage serving to its corresponding menu item.

The view `vw_beverage_serving_menu_line_item` joins the beverage servings with the menu line items.

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

This view answers: "What are the preparation details for each beverage menu line item?" The first row shows that "Extended Corridor" has a beverage serving of 13.70 oz, prepared by `Cold Brewed` method, and is sweetened (`true`). The second row links "Pilot Series A" to a 16.40 oz serving, prepared by `Fresh Squeezed` method, and not sweetened (`false`). The third and fourth rows follow the same pattern, with "Baseline Assessment" linked to a 19.10 oz `Fresh Brewed` sweetened beverage and "Distributed Survey" linked to a 21.80 oz `Cold Brewed` unsweetened beverage.

## Synthesis

The data model for this menu domain is built around a central table of line items, each of which is enriched by foreign-key relationships to ingredients, price points, topping options, and beverage servings. The base tables capture the raw attributes of each entity, while the views provide joined perspectives that answer specific operational questions. The `vw_menu_line_item_ingredient` view links products to their raw materials, `vw_menu_line_item_price_point` surfaces pricing details, `vw_menu_line_item_topping_option` reveals customization options, and `vw_beverage_serving_menu_line_item` captures preparation specifics for drinks. The reverse views—`vw_ingredient_menu_line_item`, `vw_price_point_menu_line_item`, `vw_topping_option_menu_line_item`, and `vw_topping_option_ingredient`—provide the inverse perspective, enabling traceability from component to product. Together, these tables and views form a coherent framework for managing a menu catalog, supporting everything from allergen tracking and pricing analysis to inventory planning and customer-facing product descriptions.