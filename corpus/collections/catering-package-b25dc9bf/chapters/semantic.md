## Ontology-Grounded Relational Modelling in the Catering Domain

The catering domain centres on a single business concept: a `catering_package` is a sellable offering that bundles food, beverages, and service conditions into a single price. Each package carries descriptive metadata—its human-readable `package_name` such as *Legacy Standard D* or *Regional Framework*, a `meal_period` like Breakfast, Lunch, or Afternoon Break, and a `base_price_per_person` that ranges from 18.47 to 36.43 in the current dataset. Boolean flags `is_buffet` and `includes_dessert` capture structural choices about how the meal is served. Beyond these intrinsic attributes, a package is linked to exactly one `beverage_selection` and one `service_charge`, establishing the first layer of foreign-key relationships that propagate domain constraints into the relational schema.

**Table `catering_packages`**

| id | package_id | package_name | meal_period | base_price_per_person | is_buffet | includes_dessert | beverage_selection_id | service_charge_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424918 | Legacy Standard D | Breakfast | 19.97 | false | true | 1 | 100 |
| 2 | account_pymes_1044 | Regional Framework | Morning Break | 19.93 | true | false | 2 | 101 |
| 3 | 5844275 | Seasonal Protocol | Afternoon Break | 18.47 | false | true | 3 | 102 |
| 4 | 2106710 | Integrated Programme A | Lunch | 36.43 | true | false | 4 | 103 |

The `beverage_selections` table captures the drink-side of a package. Each row carries a `selection_name` (e.g. *Legacy Review D*, *Regional Initiative*), three boolean flags indicating whether hot beverages, cold beverages, or alcohol are included, and a `catering_package_id` foreign key that anchors the selection to its parent package. In the data, *Legacy Review D* excludes hot beverages and alcohol but includes cold beverages, whereas *Regional Initiative* does the opposite—hot and alcohol, but no cold. The `catering_package_id` column on this table creates a one-to-one link back to `catering_packages`, ensuring that every beverage selection belongs to exactly one package.

**Table `beverage_selections`**

| id | selection_id | selection_name | includes_hot_beverages | includes_cold_beverages | includes_alcohol | catering_package_id |
|---|---|---|---|---|---|---|
| 1 | 7731882 | Legacy Review D | false | true | false | 1 |
| 2 | 605953 | Regional Initiative | true | false | true | 2 |
| 3 | 89419 | Seasonal Model | false | true | false | 3 |
| 4 | 1202-0001-S | Integrated Cluster A | true | false | true | 4 |

The `service_charges` table models the financial overlay on a package. A `charge_type` of either *Percentage* or *Fixed Fee* determines how `charge_value` is applied; for instance, package 1 carries a 22.70 % service charge applied to all groups, while package 2 carries a 26.40 fixed fee restricted to groups of 20 or less. The `charge_name` column provides a human label such as *Service Charge* or *Sales Tax*, and `applies_to_group_size` encodes the applicability rule. Again, `catering_package_id` is a foreign key that binds each charge to its package.

**Table `service_charges`**

| id | charge_id | charge_type | charge_value | charge_name | applies_to_group_size | catering_package_id |
|---|---|---|---|---|---|---|
| 100 | 19655015 | Percentage | 22.70 | Service Charge | All Groups | 1 |
| 101 | 3717635 | Fixed Fee | 26.40 | Sales Tax | Groups of 20 or less | 2 |
| 102 | 3717620 | Percentage | 30.10 | Small Group Fee | All Groups | 3 |
| 103 | 209232 | Fixed Fee | 33.80 | Service Charge | Groups of 20 or less | 4 |

Food items live in `food_beverage_items`, a table that stores individual menu entries alongside their categorical and compliance metadata. Each row has an `item_name` (*Seasonal Survey*, *Integrated Corridor*, *Extended Series D*, *Pilot Assessment*), an `item_category` (Main Dish, Side Dish, Bread/Pastry, Fruit), and boolean flags `is_seasonal` and `is_housemade`. The `allergen_info` column carries a coded string such as *distributed-allergen-72*. Two foreign keys—`catering_package_id` and `beverage_selection_id`—tie each food item to its parent package and to a beverage selection, respectively. This dual linkage means a single food item can be referenced across multiple packages and beverage configurations, a design choice that the junction tables `packages_items` and `selections_items` make explicit.

**Table `food_beverage_items`**

| food_beverage_item_id | item_id | item_name | item_category | is_seasonal | is_housemade | allergen_info | catering_package_id | beverage_selection_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ITE-2792 | Seasonal Survey | Main Dish | false | false | distributed-allergen-72 | 1 | 1 |
| 101 | ITE-2795 | Integrated Corridor | Side Dish | true | true | baseline-allergen-73 | 2 | 2 |
| 102 | ITE-2798 | Extended Series D | Bread/Pastry | false | false | pilot-allergen-74 | 3 | 3 |
| 103 | ITE-2801 | Pilot Assessment | Fruit | true | true | extended-allergen-75 | 4 | 4 |

Sandwich varieties and boxed lunch sides form a sub-model for sandwich-based offerings. The `sandwich_varieties` table stores each variety's `variety_name` (e.g. *Regional Initiative*, *Seasonal Model D*), its `bread_type` (Focaccia, Baguette, Croissant, Kaiser Roll), its `primary_protein` (Tomato Mozzarella, Roast Beef, Smoked Turkey, Honey Ham), and a boolean `includes_cheese`. Timestamps `created_at` and `updated_at` track the lifecycle of each variety. The `catering_package_id` foreign key anchors the variety to a package.

**Table `sandwich_varieties`**

| id | variety_id | variety_name | bread_type | primary_protein | includes_cheese | catering_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 16658 | Regional Initiative | Focaccia | Tomato Mozzarella | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5844261 | Seasonal Model D | Baguette | Roast Beef | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9125622 | Integrated Cluster | Croissant | Smoked Turkey | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 89419 | Extended Review | Kaiser Roll | Honey Ham | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `boxed_lunch_sides` table stores side dishes that accompany a sandwich variety. Each row has a `side_name` (e.g. *Integrated Programme A*, *Extended Standard*), a `side_category` (Snack, Fruit, Beverage), and a `sandwich_variety_id` foreign key that links the side to its parent sandwich variety. The many-to-many relationship between sandwich varieties and sides is mediated by the junction table `varieties_sides`, which materializes the association as a pair of foreign keys.

**Table `boxed_lunch_sides`**

| boxed_lunch_side_id | side_id | side_name | side_category | sandwich_variety_id |
|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | Integrated Programme A | Snack | 1 |
| 2 | 937737 | Extended Standard | Fruit | 2 |
| 3 | 6564389 | Pilot Framework | Beverage | 3 |
| 4 | 103178 | Baseline Protocol D | Snack | 4 |

The three junction tables—`packages_items`, `selections_items`, and `varieties_sides`—are the relational manifestation of many-to-many relationships in the ontology. `packages_items` links `catering_packages` to `food_beverage_items`, allowing a single food item to appear in multiple packages and a single package to contain multiple items. `selections_items` links `beverage_selections` to `food_beverage_items`, enabling a beverage selection to be associated with multiple food items and vice versa. `varieties_sides` links `sandwich_varieties` to `boxed_lunch_sides`, allowing a sandwich variety to be paired with multiple sides and a side to appear with multiple varieties. These junction tables are the structural glue that transforms a set of independent entity types into a navigable graph of domain facts.

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

### Materialized Views as Domain Facts

The view layer reconstructs domain facts by joining the normalized tables. Each view answers a specific query pattern that a business user or downstream application would commonly need.

The view `v_catering_package_food_beverage_item_detail` joins `catering_packages` with `food_beverage_items` on `catering_package_id`, producing a denormalized row that combines package metadata with item metadata. Reading the first row: *Legacy Standard D* (Breakfast, 19.97 per person, buffet false, dessert true) is paired with the food item *Seasonal Survey* (Main Dish, not seasonal, not housemade, allergen code distributed-allergen-72). This view answers the question "what food items are available in each catering package?"

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

The view `v_catering_package_beverage_selection` joins `catering_packages` with `beverage_selections` on `catering_package_id`. The first row shows *Legacy Standard D* paired with *Legacy Review D*, a selection that includes cold beverages but excludes hot beverages and alcohol. The second row pairs *Regional Framework* with *Regional Initiative*, which includes hot beverages and alcohol but no cold beverages. This view answers "what beverage selection is attached to each package?"

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

The view `v_catering_package_service_charge` joins `catering_packages` with `service_charges` on `catering_package_id`. The first row reveals that *Legacy Standard D* carries a 22.70 % service charge applied to all groups. The second row shows *Regional Framework* with a 26.40 fixed fee (labelled *Sales Tax*) that applies only to groups of 20 or less. This view answers "what service charge applies to each package?"

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

The view `v_food_beverage_item_catering_package` is the inverse of the first view: it joins `food_beverage_items` with `catering_packages` to answer "which packages contain this food item?" The first row shows that *Seasonal Survey* (Main Dish) is available in package 1 (*Legacy Standard D*).

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

The view `v_food_beverage_item_beverage_selection` joins `food_beverage_items` with `beverage_selections` on `beverage_selection_id`, answering "what beverage selection accompanies this food item?" The first row pairs *Seasonal Survey* with *Legacy Review D* (cold beverages only).

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

The view `v_beverage_selection_catering_package` joins `beverage_selections` with `catering_packages` on `catering_package_id`, answering "which package is associated with this beverage selection?" The first row shows *Legacy Review D* linked to *Legacy Standard D*.

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

The view `v_beverage_selection_food_beverage_item_detail` joins `beverage_selections` with `food_beverage_items` on `beverage_selection_id`, answering "what food items are available with this beverage selection?" The first row pairs *Legacy Review D* with *Seasonal Survey*.

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

The view `v_service_charge_catering_package` joins `service_charges` with `catering_packages` on `catering_package_id`, answering "which package carries this service charge?" The first row shows the 22.70 % *Service Charge* applied to *Legacy Standard D*.

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

The view `v_sandwich_variety_catering_package` joins `sandwich_varieties` with `catering_packages` on `catering_package_id`, answering "which package offers this sandwich variety?" The first row shows *Regional Initiative* (Focaccia, Tomato Mozzarella, includes cheese) offered in *Legacy Standard D*.

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

The view `v_sandwich_variety_boxed_lunch_side_detail` joins `sandwich_varieties` with `boxed_lunch_sides` on `sandwich_variety_id`, answering "what sides accompany this sandwich variety?" The first row pairs the *Regional Initiative* sandwich (Focaccia, Tomato Mozzarella) with the side *Integrated Programme A* (Snack category).

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

The view `v_boxed_lunch_side_sandwich_variety` is the inverse: it joins `boxed_lunch_sides` with `sandwich_varieties` on `sandwich_variety_id`, answering "which sandwich variety is this side paired with?" The first row shows the side *Integrated Programme A* (Snack) paired with the *Regional Initiative* sandwich variety.

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

### Synthesis

The relational schema for the catering domain is a direct materialization of its ontology. Six entity types—`catering_packages`, `food_beverage_items`, `beverage_selections`, `service_charges`, `sandwich_varieties`, and `boxed_lunch_sides`—are stored as base tables, each with a primary key and a set of attributes that map one-to-one to domain properties. Foreign keys in `catering_packages` reference `beverage_selections` and `service_charges`, enforcing that every package has exactly one drink configuration and one financial overlay. The dual foreign keys on `food_beverage_items` (pointing to both `catering_packages` and `beverage_selections`) capture the fact that a food item is simultaneously a member of a package and compatible with a beverage selection. The three junction tables—`packages_items`, `selections_items`, and `varieties_sides`—resolve many-to-many relationships that the ontology expresses as navigable associations, ensuring that the schema supports flexible composition without data duplication.

The eleven views then reconstruct the domain graph from this normalized foundation. Each view performs a targeted join that answers a single business question, combining columns from two or more base tables into a denormalized result set. The views fall into three families: package-centric views (`v_catering_package_food_beverage_item_detail`, `v_catering_package_beverage_selection`, `v_catering_package_service_charge`) that start from a package and expand outward; item-centric views (`v_food_beverage_item_catering_package`, `v_food_beverage_item_beverage_selection`) that start from a food item and trace its associations; and sandwich-centric views (`v_sandwich_variety_catering_package`, `v_sandwich_variety_boxed_lunch_side_detail`, `v_boxed_lunch_side_sandwich_variety`) that explore the sandwich-and-sides sub-model. Together, the base tables and views provide a complete, queryable representation of the catering domain that is both structurally sound and semantically transparent.