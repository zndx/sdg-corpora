# Catering Operations and Menu Architecture

Event catering at scale requires a disciplined separation between what is offered, what is charged, and how items are assembled into coherent meal experiences. The data model described here captures that discipline: packages define the customer-facing offerings, food and beverage items populate the pantry, and a series of junction tables bind those items into packages, beverage selections, and sandwich-side pairings. Service charges sit alongside packages as financial modifiers, while a set of materialized views present the joined results that planners and operators actually consult when building quotes, checking allergen compliance, or reconciling invoices.

## Catering Packages and Their Financial Modifiers

Every catering engagement begins with a package. The `catering_packages` table records the structural identity of each offering: a human-readable name, the meal period it serves, a base price per person, and flags that describe its format.

**Table `catering_packages`**

| id | package_id | package_name | meal_period | base_price_per_person | is_buffet | includes_dessert | beverage_selection_id | service_charge_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424918 | Legacy Standard D | Breakfast | 19.97 | false | true | 1 | 100 |
| 2 | account_pymes_1044 | Regional Framework | Morning Break | 19.93 | true | false | 2 | 101 |
| 3 | 5844275 | Seasonal Protocol | Afternoon Break | 18.47 | false | true | 3 | 102 |
| 4 | 2106710 | Integrated Programme A | Lunch | 36.43 | true | false | 4 | 103 |

Consider the first row. Package `9424918`, named "Legacy Standard D," targets the Breakfast period at $19.97 per person. It is not a buffet format, it includes dessert, and it references beverage selection `1` and service charge `100`. The second row, `account_pymes_1044` ("Regional Framework"), serves Morning Break at $19.93 per person, is configured as a buffet, excludes dessert, and pairs with beverage selection `2` and service charge `101`. The third and fourth rows follow the same pattern: "Seasonal Protocol" (Afternoon Break, $18.47, buffet excluded, dessert included) and "Integrated Programme A" (Lunch, $36.43, buffet format, no dessert).

Service charges are stored in their own table and linked to packages through the `service_charge_id` column.

**Table `service_charges`**

| id | charge_id | charge_type | charge_value | charge_name | applies_to_group_size | catering_package_id |
|---|---|---|---|---|---|---|
| 100 | 19655015 | Percentage | 22.70 | Service Charge | All Groups | 1 |
| 101 | 3717635 | Fixed Fee | 26.40 | Sales Tax | Groups of 20 or less | 2 |
| 102 | 3717620 | Percentage | 30.10 | Small Group Fee | All Groups | 3 |
| 103 | 209232 | Fixed Fee | 33.80 | Service Charge | Groups of 20 or less | 4 |

The `service_charges` table captures both the type of charge and its applicability. Row `100` is a Percentage charge of 22.70 percent, labeled "Service Charge," applying to all groups. Row `101` is a Fixed Fee of $26.40, labeled "Sales Tax," applying only to groups of 20 or less. Row `102` is another Percentage charge at 30.10 percent, labeled "Small Group Fee," again for all groups. Row `103` is a Fixed Fee of $33.80, labeled "Service Charge," restricted to smaller groups. The `applies_to_group_size` column is the operational lever that determines whether a charge applies to a given order.

## Food and Beverage Items

The pantry is cataloged in `food_beverage_items`, which records each distinct menu component with its category, seasonal status, house-made designation, and allergen information.

**Table `food_beverage_items`**

| food_beverage_item_id | item_id | item_name | item_category | is_seasonal | is_housemade | allergen_info | catering_package_id | beverage_selection_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Seasonal Survey | Main Dish | false | false | distributed-allergen-72 | 1 | 1 |
| 101 | ITE-2795 | Integrated Corridor | Side Dish | true | true | baseline-allergen-73 | 2 | 2 |
| 102 | ITE-2798 | Extended Series D | Bread/Pastry | false | false | pilot-allergen-74 | 3 | 3 |
| 103 | ITE-2801 | Pilot Assessment | Fruit | true | true | extended-allergen-75 | 4 | 4 |

Item `ITE-2792`, "Seasonal Survey," is classified as a Main Dish. It is not seasonal, not house-made, and carries the allergen tag `distributed-allergen-72`. It belongs to catering package `1` and beverage selection `1`. Item `ITE-2795`, "Integrated Corridor," is a Side Dish that is both seasonal and house-made, with allergen tag `baseline-allergen-73`, linked to package `2` and beverage selection `2`. Item `ITE-2798`, "Extended Series D," is a Bread/Pastry category item, non-seasonal, non-house-made, allergen tag `pilot-allergen-74`, associated with package `3` and beverage selection `3`. Finally, item `ITE-2801`, "Pilot Assessment," is a Fruit item that is seasonal and house-made, with allergen tag `extended-allergen-75`, tied to package `4` and beverage selection `4`.

Each food or beverage item carries two foreign keys: `catering_package_id` and `beverage_selection_id`. These links answer the question "which package and which beverage selection does this item belong to?"

## Beverage Selections

Beverage selections define the drink offerings that accompany a package. The `beverage_selections` table records whether hot beverages, cold beverages, and alcohol are included.

**Table `beverage_selections`**

| id | selection_id | selection_name | includes_hot_beverages | includes_cold_beverages | includes_alcohol | catering_package_id |
|---|---|---|---|---|---|---|
| 1 | 7731882 | Legacy Review D | false | true | false | 1 |
| 2 | 605953 | Regional Initiative | true | false | true | 2 |
| 3 | 89419 | Seasonal Model | false | true | false | 3 |
| 4 | 1202-0001-S | Integrated Cluster A | true | false | true | 4 |

Selection `7731882`, "Legacy Review D," includes cold beverages only (no hot beverages, no alcohol) and is attached to catering package `1`. Selection `605953`, "Regional Initiative," includes hot beverages and alcohol but no cold beverages, linked to package `2`. Selection `89419`, "Seasonal Model," mirrors the first: cold beverages only, attached to package `3`. Selection `1202-0001-S`, "Integrated Cluster A," includes hot beverages and alcohol, no cold beverages, and is attached to package `4`. The boolean flags `includes_hot_beverages`, `includes_cold_beverages`, and `includes_alcohol` provide a compact summary of what a guest can expect to drink.

## Sandwich Varieties and Boxed Lunch Sides

For lunch and boxed-lunch offerings, the model distinguishes between the sandwich itself and the side items that accompany it. The `sandwich_varieties` table captures sandwich-level detail.

**Table `sandwich_varieties`**

| id | variety_id | variety_name | bread_type | primary_protein | includes_cheese | catering_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 16658 | Regional Initiative | Focaccia | Tomato Mozzarella | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5844261 | Seasonal Model D | Baguette | Roast Beef | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9125622 | Integrated Cluster | Croissant | Smoked Turkey | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 89419 | Extended Review | Kaiser Roll | Honey Ham | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Variety `16658`, "Regional Initiative," uses Focaccia bread, features Tomato Mozzarella as the primary protein, and includes cheese. It is associated with catering package `1` and was created on 2025-01-01, last updated on 2025-01-02. Variety `5844261`, "Seasonal Model D," uses Baguette bread, Roast Beef as protein, and does not include cheese; it is linked to package `2`, created 2025-02-06, updated 2025-02-09. Variety `9125622`, "Integrated Cluster," uses Croissant bread, Smoked Turkey as protein, includes cheese, linked to package `3`, created 2025-03-11, updated 2025-03-16. Variety `89419`, "Extended Review," uses Kaiser Roll bread, Honey Ham as protein, no cheese, linked to package `4`, created 2025-04-16, updated 2025-04-23.

Boxed lunch sides are recorded separately in `boxed_lunch_sides`.

**Table `boxed_lunch_sides`**

| boxed_lunch_side_id | side_id | side_name | side_category | sandwich_variety_id |
|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | Snack | 1 |
| 2 | 937737 | Extended Standard | Fruit | 2 |
| 3 | 6564389 | Pilot Framework | Beverage | 3 |
| 4 | 103178 | Baseline Protocol D | Snack | 4 |

Side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ`, "Integrated Programme A," is categorized as a Snack and is paired with sandwich variety `1`. Side `937737`, "Extended Standard," is a Fruit category side paired with sandwich variety `2`. Side `6564389`, "Pilot Framework," is a Beverage category side paired with sandwich variety `3`. Side `103178`, "Baseline Protocol D," is a Snack category side paired with sandwich variety `4`. The `sandwich_variety_id` column establishes the one-to-many relationship: each sandwich variety can have one or more side items.

## Junction Tables: Assembling Packages and Selections

The model uses three junction tables to express many-to-many relationships between packages, items, and sides. These tables do not carry business attributes of their own; they exist solely to record membership.

**Table `packages_items`**

| catering_package_id | food_beverage_item_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `packages_items` table links catering packages to food and beverage items. Each row asserts that a particular item is part of a particular package. The foreign keys point to `catering_packages.id` and `food_beverage_items.food_beverage_item_id`.

**Table `selections_items`**

| beverage_selection_id | food_beverage_item_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `selections_items` table links beverage selections to food and beverage items. Each row asserts that a particular item is available within a particular beverage selection. The foreign keys point to `beverage_selections.id` and `food_beverage_items.food_beverage_item_id`.

**Table `varieties_sides`**

| sandwich_variety_id | boxed_lunch_side_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `varieties_sides` table links sandwich varieties to boxed lunch sides. Each row asserts that a particular side is offered alongside a particular sandwich variety. The foreign keys point to `sandwich_varieties.id` and `boxed_lunch_sides.boxed_lunch_side_id`.

These junction tables are the connective tissue of the model. Without them, packages would be isolated from items, selections from items, and sandwiches from sides. With them, the system can answer composite questions: "What items are in package X?" "What sides accompany sandwich variety Y?" "Which beverage selections contain item Z?"

## Materialized Views: Joined Results for Operational Use

The junction tables are efficient for storage but cumbersome for direct consumption. The views present pre-joined results that answer specific operational questions. Each view is described below with the question it answers and concrete row-level evidence.

**View `v_catering_package_food_beverage_item_detail`**

```sql
CREATE VIEW v_catering_package_food_beverage_item_detail AS
SELECT a.id, a.package_id, a.package_name, b.food_beverage_item_id AS item_food_beverage_item_id, b.item_id AS item_item_id, b.item_name AS item_item_name
FROM catering_packages a
  JOIN packages_items j ON j.catering_package_id = a.id
  JOIN food_beverage_items b ON b.food_beverage_item_id = j.food_beverage_item_id;
```

| id | package_id | package_name | item_food_beverage_item_id | item_item_id | item_item_name |
|---|---|---|---|---|---|
| 1 | 9424918 | Legacy Standard D | 100 | ITE-2792 | Seasonal Survey |
| 1 | 9424918 | Legacy Standard D | 101 | ITE-2795 | Integrated Corridor |
| 2 | account_pymes_1044 | Regional Framework | 101 | ITE-2795 | Integrated Corridor |
| 2 | account_pymes_1044 | Regional Framework | 102 | ITE-2798 | Extended Series D |
| 3 | 5844275 | Seasonal Protocol | 102 | ITE-2798 | Extended Series D |
| 3 | 5844275 | Seasonal Protocol | 103 | ITE-2801 | Pilot Assessment |
| 4 | 2106710 | Integrated Programme A | 103 | ITE-2801 | Pilot Assessment |
| 4 | 2106710 | Integrated Programme A | 100 | ITE-2792 | Seasonal Survey |

This view joins catering packages with their food and beverage items, producing a flat record per package-item pair. It answers: "What food and beverage items belong to each catering package, and what are their attributes?" A row might show package `9424918` ("Legacy Standard D") alongside item `ITE-2792` ("Seasonal Survey," Main Dish, non-seasonal, non-house-made, allergen `distributed-allergen-72`). Another row could show package `account_pymes_1044` ("Regional Framework") alongside item `ITE-2795` ("Integrated Corridor," Side Dish, seasonal, house-made, allergen `baseline-allergen-73`). Planners use this view to verify that a package's item roster matches the client's requirements.

**View `v_catering_package_beverage_selection`**

```sql
CREATE VIEW v_catering_package_beverage_selection AS
SELECT a.id, a.package_id, a.package_name, a.meal_period, b.id AS selection_id, b.selection_id AS selection_selection_id, b.selection_name AS selection_selection_name
FROM catering_packages a JOIN beverage_selections b ON a.beverage_selection_id = b.id;
```

| id | package_id | package_name | meal_period | selection_id | selection_selection_id | selection_selection_name |
|---|---|---|---|---|---|---|
| 1 | 9424918 | Legacy Standard D | Breakfast | 1 | 7731882 | Legacy Review D |
| 2 | account_pymes_1044 | Regional Framework | Morning Break | 2 | 605953 | Regional Initiative |
| 3 | 5844275 | Seasonal Protocol | Afternoon Break | 3 | 89419 | Seasonal Model |
| 4 | 2106710 | Integrated Programme A | Lunch | 4 | 1202-0001-S | Integrated Cluster A |

This view joins catering packages with their beverage selections, answering: "What beverage offering accompanies each package?" A row might pair package `9424918` ("Legacy Standard D") with selection `7731882` ("Legacy Review D," cold beverages only, no alcohol). Another row could pair package `account_pymes_1044` ("Regional Framework") with selection `605953` ("Regional Initiative," hot beverages and alcohol, no cold beverages). This view is essential for confirming that the drink service matches the event's policy.

**View `v_catering_package_service_charge`**

```sql
CREATE VIEW v_catering_package_service_charge AS
SELECT a.id, a.package_id, a.package_name, a.meal_period, b.id AS charge_id, b.charge_id AS charge_charge_id, b.charge_type AS charge_charge_type
FROM catering_packages a JOIN service_charges b ON a.service_charge_id = b.id;
```

| id | package_id | package_name | meal_period | charge_id | charge_charge_id | charge_charge_type |
|---|---|---|---|---|---|---|
| 1 | 9424918 | Legacy Standard D | Breakfast | 100 | 19655015 | Percentage |
| 2 | account_pymes_1044 | Regional Framework | Morning Break | 101 | 3717635 | Fixed Fee |
| 3 | 5844275 | Seasonal Protocol | Afternoon Break | 102 | 3717620 | Percentage |
| 4 | 2106710 | Integrated Programme A | Lunch | 103 | 209232 | Fixed Fee |

This view joins catering packages with their service charges, answering: "What financial modifier applies to each package, and under what conditions?" A row might show package `9424918` ("Legacy Standard D") with charge `19655015` ("Service Charge," Percentage type, 22.70%, applies to all groups). Another row could show package `account_pymes_1044` ("Regional Framework") with charge `3717635` ("Sales Tax," Fixed Fee, $26.40, applies to groups of 20 or less). This view is the primary reference for invoice calculation.

**View `v_food_beverage_item_catering_package`**

```sql
CREATE VIEW v_food_beverage_item_catering_package AS
SELECT a.food_beverage_item_id, a.item_id, a.item_name, a.item_category, b.id AS package_id, b.package_id AS package_package_id, b.package_name AS package_package_name
FROM food_beverage_items a JOIN catering_packages b ON a.catering_package_id = b.id;
```

| food_beverage_item_id | item_id | item_name | item_category | package_id | package_package_id | package_package_name |
|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Seasonal Survey | Main Dish | 1 | 9424918 | Legacy Standard D |
| 101 | ITE-2795 | Integrated Corridor | Side Dish | 2 | account_pymes_1044 | Regional Framework |
| 102 | ITE-2798 | Extended Series D | Bread/Pastry | 3 | 5844275 | Seasonal Protocol |
| 103 | ITE-2801 | Pilot Assessment | Fruit | 4 | 2106710 | Integrated Programme A |

This view is the inverse of the first: it presents each food and beverage item alongside the catering package it belongs to, answering: "Which package contains this item?" A row might show item `ITE-2792` ("Seasonal Survey," Main Dish) linked to package `9424918` ("Legacy Standard D"). Another row could show item `ITE-2801` ("Pilot Assessment," Fruit) linked to package `2106710` ("Integrated Programme A"). This view supports reverse lookup: given an item, find its package.

**View `v_food_beverage_item_beverage_selection`**

```sql
CREATE VIEW v_food_beverage_item_beverage_selection AS
SELECT a.food_beverage_item_id, a.item_id, a.item_name, a.item_category, b.id AS selection_id, b.selection_id AS selection_selection_id, b.selection_name AS selection_selection_name
FROM food_beverage_items a JOIN beverage_selections b ON a.beverage_selection_id = b.id;
```

| food_beverage_item_id | item_id | item_name | item_category | selection_id | selection_selection_id | selection_selection_name |
|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Seasonal Survey | Main Dish | 1 | 7731882 | Legacy Review D |
| 101 | ITE-2795 | Integrated Corridor | Side Dish | 2 | 605953 | Regional Initiative |
| 102 | ITE-2798 | Extended Series D | Bread/Pastry | 3 | 89419 | Seasonal Model |
| 103 | ITE-2801 | Pilot Assessment | Fruit | 4 | 1202-0001-S | Integrated Cluster A |

This view joins food and beverage items with their beverage selections, answering: "Which beverage selection is associated with this item?" A row might show item `ITE-2792` ("Seasonal Survey") paired with selection `7731882` ("Legacy Review D"). Another row could show item `ITE-2795` ("Integrated Corridor") paired with selection `605953` ("Regional Initiative"). This view is useful when verifying that the beverage service aligns with the food items being served.

**View `v_beverage_selection_catering_package`**

```sql
CREATE VIEW v_beverage_selection_catering_package AS
SELECT a.id, a.selection_id, a.selection_name, a.includes_hot_beverages, b.id AS package_id, b.package_id AS package_package_id, b.package_name AS package_package_name
FROM beverage_selections a JOIN catering_packages b ON a.catering_package_id = b.id;
```

| id | selection_id | selection_name | includes_hot_beverages | package_id | package_package_id | package_package_name |
|---|---|---|---|---|---|---|
| 1 | 7731882 | Legacy Review D | false | 1 | 9424918 | Legacy Standard D |
| 2 | 605953 | Regional Initiative | true | 2 | account_pymes_1044 | Regional Framework |
| 3 | 89419 | Seasonal Model | false | 3 | 5844275 | Seasonal Protocol |
| 4 | 1202-0001-S | Integrated Cluster A | true | 4 | 2106710 | Integrated Programme A |

This view joins beverage selections with their catering packages, answering: "Which package uses this beverage selection?" A row might show selection `7731882` ("Legacy Review D") linked to package `9424918` ("Legacy Standard D"). Another row could show selection `1202-0001-S` ("Integrated Cluster A") linked to package `2106710` ("Integrated Programme A"). This view supports the same reverse-lookup pattern as the previous view, but from the beverage selection side.

**View `v_beverage_selection_food_beverage_item_detail`**

```sql
CREATE VIEW v_beverage_selection_food_beverage_item_detail AS
SELECT a.id, a.selection_id, a.selection_name, b.food_beverage_item_id AS item_food_beverage_item_id, b.item_id AS item_item_id, b.item_name AS item_item_name
FROM beverage_selections a
  JOIN selections_items j ON j.beverage_selection_id = a.id
  JOIN food_beverage_items b ON b.food_beverage_item_id = j.food_beverage_item_id;
```

| id | selection_id | selection_name | item_food_beverage_item_id | item_item_id | item_item_name |
|---|---|---|---|---|---|
| 1 | 7731882 | Legacy Review D | 100 | ITE-2792 | Seasonal Survey |
| 1 | 7731882 | Legacy Review D | 101 | ITE-2795 | Integrated Corridor |
| 2 | 605953 | Regional Initiative | 101 | ITE-2795 | Integrated Corridor |
| 2 | 605953 | Regional Initiative | 102 | ITE-2798 | Extended Series D |
| 3 | 89419 | Seasonal Model | 102 | ITE-2798 | Extended Series D |
| 3 | 89419 | Seasonal Model | 103 | ITE-2801 | Pilot Assessment |
| 4 | 1202-0001-S | Integrated Cluster A | 103 | ITE-2801 | Pilot Assessment |
| 4 | 1202-0001-S | Integrated Cluster A | 100 | ITE-2792 | Seasonal Survey |

This view joins beverage selections with food and beverage items, answering: "What items are available within each beverage selection?" A row might show selection `7731882` ("Legacy Review D") alongside item `ITE-2792` ("Seasonal Survey," Main Dish). Another row could show selection `605953` ("Regional Initiative") alongside item `ITE-2795` ("Integrated Corridor," Side Dish). This view is particularly useful for beverage planners who need to see the full item roster associated with a drink offering.

**View `v_service_charge_catering_package`**

```sql
CREATE VIEW v_service_charge_catering_package AS
SELECT a.id, a.charge_id, a.charge_type, a.charge_value, b.id AS package_id, b.package_id AS package_package_id, b.package_name AS package_package_name
FROM service_charges a JOIN catering_packages b ON a.catering_package_id = b.id;
```

| id | charge_id | charge_type | charge_value | package_id | package_package_id | package_package_name |
|---|---|---|---|---|---|---|
| 100 | 19655015 | Percentage | 22.70 | 1 | 9424918 | Legacy Standard D |
| 101 | 3717635 | Fixed Fee | 26.40 | 2 | account_pymes_1044 | Regional Framework |
| 102 | 3717620 | Percentage | 30.10 | 3 | 5844275 | Seasonal Protocol |
| 103 | 209232 | Fixed Fee | 33.80 | 4 | 2106710 | Integrated Programme A |

This view is the inverse of the service charge join, presenting each service charge alongside the catering package it applies to, answering: "Which package is subject to this charge?" A row might show charge `19655015` ("Service Charge," 22.70%) applied to package `9424918` ("Legacy Standard D"). Another row could show charge `3717635` ("Sales Tax," $26.40) applied to package `account_pymes_1044` ("Regional Framework"). This view supports financial reconciliation from the charge side.

**View `v_sandwich_variety_catering_package`**

```sql
CREATE VIEW v_sandwich_variety_catering_package AS
SELECT a.id, a.variety_id, a.variety_name, a.bread_type, b.id AS package_id, b.package_id AS package_package_id, b.package_name AS package_package_name
FROM sandwich_varieties a JOIN catering_packages b ON a.catering_package_id = b.id;
```

| id | variety_id | variety_name | bread_type | package_id | package_package_id | package_package_name |
|---|---|---|---|---|---|---|
| 1 | 16658 | Regional Initiative | Focaccia | 1 | 9424918 | Legacy Standard D |
| 2 | 5844261 | Seasonal Model D | Baguette | 2 | account_pymes_1044 | Regional Framework |
| 3 | 9125622 | Integrated Cluster | Croissant | 3 | 5844275 | Seasonal Protocol |
| 4 | 89419 | Extended Review | Kaiser Roll | 4 | 2106710 | Integrated Programme A |

This view joins sandwich varieties with their catering packages, answering: "Which sandwich varieties are offered in each package?" A row might show variety `16658` ("Regional Initiative," Focaccia, Tomato Mozzarella, includes cheese) linked to package `9424918` ("Legacy Standard D"). Another row could show variety `5844261` ("Seasonal Model D," Baguette, Roast Beef, no cheese) linked to package `account_pymes_1044` ("Regional Framework"). This view is the primary reference for lunch menu planning.

**View `v_sandwich_variety_boxed_lunch_side_detail`**

```sql
CREATE VIEW v_sandwich_variety_boxed_lunch_side_detail AS
SELECT a.id, a.variety_id, a.variety_name, b.boxed_lunch_side_id AS side_boxed_lunch_side_id, b.side_id AS side_side_id, b.side_name AS side_side_name
FROM sandwich_varieties a
  JOIN varieties_sides j ON j.sandwich_variety_id = a.id
  JOIN boxed_lunch_sides b ON b.boxed_lunch_side_id = j.boxed_lunch_side_id;
```

| id | variety_id | variety_name | side_boxed_lunch_side_id | side_side_id | side_side_name |
|---|---|---|---|---|---|
| 1 | 16658 | Regional Initiative | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A |
| 1 | 16658 | Regional Initiative | 2 | 937737 | Extended Standard |
| 2 | 5844261 | Seasonal Model D | 2 | 937737 | Extended Standard |
| 2 | 5844261 | Seasonal Model D | 3 | 6564389 | Pilot Framework |
| 3 | 9125622 | Integrated Cluster | 3 | 6564389 | Pilot Framework |
| 3 | 9125622 | Integrated Cluster | 4 | 103178 | Baseline Protocol D |
| 4 | 89419 | Extended Review | 4 | 103178 | Baseline Protocol D |
| 4 | 89419 | Extended Review | 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A |

This view joins sandwich varieties with their boxed lunch sides, answering: "What sides accompany each sandwich variety?" A row might show variety `16658` ("Regional Initiative") paired with side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," Snack). Another row could show variety `5844261` ("Seasonal Model D") paired with side `937737` ("Extended Standard," Fruit). This view is essential for boxed lunch configuration, ensuring that every sandwich has its intended accompaniments.

**View `v_boxed_lunch_side_sandwich_variety`**

```sql
CREATE VIEW v_boxed_lunch_side_sandwich_variety AS
SELECT a.boxed_lunch_side_id, a.side_id, a.side_name, a.side_category, b.id AS variety_id, b.variety_id AS variety_variety_id, b.variety_name AS variety_variety_name
FROM boxed_lunch_sides a JOIN sandwich_varieties b ON a.sandwich_variety_id = b.id;
```

| boxed_lunch_side_id | side_id | side_name | side_category | variety_id | variety_variety_id | variety_variety_name |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | Snack | 1 | 16658 | Regional Initiative |
| 2 | 937737 | Extended Standard | Fruit | 2 | 5844261 | Seasonal Model D |
| 3 | 6564389 | Pilot Framework | Beverage | 3 | 9125622 | Integrated Cluster |
| 4 | 103178 | Baseline Protocol D | Snack | 4 | 89419 | Extended Review |

This view is the inverse of the previous one, presenting each boxed lunch side alongside its sandwich variety, answering: "Which sandwich variety is this side paired with?" A row might show side `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` ("Integrated Programme A," Snack) paired with variety `16658` ("Regional Initiative"). Another row could show side `6564389` ("Pilot Framework," Beverage) paired with variety `9125622` ("Integrated Cluster"). This view supports reverse lookup from the side item to its sandwich.

## Closing Synthesis

The catering data model separates concerns cleanly: packages define the customer-facing structure, items populate the menu, beverage selections define drink service, service charges define financial modifiers, and sandwich varieties with their sides handle lunch-specific offerings. Junction tables express the many-to-many relationships between these entities, while materialized views present the joined results that operators actually need. The foreign keys—`catering_package_id` on food items, `beverage_selection_id` on food items and packages, `service_charge_id` on packages, and `sandwich_variety_id` on sides—form a coherent web of relationships that can be traversed in either direction. Whether a planner is building a quote, a chef is checking allergen tags, or an accountant is reconciling charges, the model provides the data needed to answer the question at hand.