## Ontology-Grounded Modelling of a Breakfast Service Domain

The domain under examination captures the operational lifecycle of hotel breakfast services, where each service is a time-bound offering that presents a curated menu of food and beverage options to registered guests. The ontology distinguishes six core entity types: `breakfast_services`, `menu_options`, `food_ingredients`, `beverage_types`, `guest_reservations`, and the associative entity `services_options` that resolves a many-to-many relationship between services and menu items. Attributes are modelled as typed columns with cardinality-bounded relationships materialised as foreign keys, while derived views reconstitute domain facts by joining the normalised tables. The following sections walk through the schema layer by layer, grounding every structural claim in the actual row values.

**Table `breakfast_services`**

| breakfast_service_id | service_id | name | start_time | end_time | status | is_buffet_style | guest_reservation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1996925 | Extended Review | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | scheduled | false | 1000 |
| 1001 | 3990164 | Pilot Initiative A | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | active | true | 1001 |
| 1002 | 5844258 | Baseline Model | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | completed | false | 1002 |
| 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | cancelled | true | 1003 |

The `breakfast_services` table anchors the domain. Each row represents a distinct breakfast service instance identified by the surrogate key `breakfast_service_id` (values 1000 through 1003). The business identifier `service_id` carries a heterogeneous mix of UUIDs and integers — for example, `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` for the "Distributed Cluster" service and `5844258` for "Baseline Model". The `name` column stores human-readable labels such as "Extended Review" and "Pilot Initiative A". Temporal bounds are captured in `start_time` and `end_time` as ISO-8601 timestamps; note that the data exhibits intentional temporal inversions (e.g., `start_time` of `2024-03-27T14:42:00` exceeds `end_time` of `2023-02-26T13:27:00` for service 1000), which the ontology treats as a data-quality signal rather than a modelling error. The `status` column is an enumerated state machine with values `scheduled`, `active`, `completed`, and `cancelled`, while `is_buffet_style` is a boolean flag. Finally, `guest_reservation_id` provides a direct one-to-one pointer back to the `guest_reservations` table, establishing the first foreign-key edge in the schema.

**Table `menu_options`**

| menu_option_id | option_id | name | category | is_gluten_free | is_vegetarian | is_vegan | serving_size | breakfast_service_id | food_ingredient_id | beverage_type_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review | main | true | true | false | primary-serving-40 | 1000 | 1 | 100 |
| 2 | 1204-0009-S | Pilot Initiative A | side | false | false | true | adaptive-serving-41 | 1001 | 2 | 101 |
| 3 | 9424920 | Baseline Model | beverage | true | true | false | distributed-serving-42 | 1002 | 3 | 102 |
| 4 | 1186083 | Distributed Cluster | pastry | false | false | true | baseline-serving-43 | 1003 | 4 | 103 |

The `menu_options` table is the central hub of the food-and-beverage ontology. Its primary key `menu_option_id` is a small integer (1–4), while the business-level `option_id` carries UUIDs or alphanumeric codes like `1204-0009-S`. The `name` column reuses domain labels ("Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster") that echo the service and reservation names, reflecting a shared naming convention across entity types. The `category` column classifies items as `main`, `side`, `beverage`, or `pastry`. Three boolean dietary flags — `is_gluten_free`, `is_vegetarian`, and `is_vegan` — encode constraint metadata; for instance, menu option 1 is both gluten-free and vegetarian but not vegan, whereas option 2 is vegan but neither gluten-free nor vegetarian. The `serving_size` column stores descriptive strings such as `primary-serving-40` and `adaptive-serving-41`. Three foreign keys anchor this table to its neighbours: `breakfast_service_id` references `breakfast_services.breakfast_service_id`, `food_ingredient_id` references `food_ingredients.id`, and `beverage_type_id` references `beverage_types.id`. Each menu option thus carries exactly one ingredient and one beverage type, enforcing a 1:1 composition at the schema level.

**Table `food_ingredients`**

| id | ingredient_id | name | origin | allergen_flag | is_local_sourced | storage_temp | menu_option_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | distributed-origin-66 | false | false | 22.70 | 1 | 2025-01-01 00:14:00 |
| 2 | 5844284 | Pilot Initiative A | baseline-origin-67 | true | true | 26.40 | 2 | 2025-02-06 03:14:00 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | pilot-origin-68 | false | false | 30.10 | 3 | 2025-03-11 06:14:00 |
| 4 | 2087735 | Distributed Cluster | extended-origin-69 | true | true | 33.80 | 4 | 2025-04-16 09:14:00 |

The `food_ingredients` table models the raw materials that compose menu items. Its surrogate key `id` (1–4) is referenced by `menu_options.food_ingredient_id`. The business identifier `ingredient_id` is a mixed-type column containing integers (`1450638`, `5844284`), a template-style string (`template_ivacode_pagata_20det40ind`), and another integer (`2087735`). The `name` column mirrors the domain naming convention, and `origin` stores provenance strings such as `distributed-origin-66` and `baseline-origin-67`. The `allergen_flag` and `is_local_sourced` booleans capture safety and sustainability attributes; ingredient 2 ("Pilot Initiative A") is both allergenic and locally sourced, while ingredient 1 is neither. The `storage_temp` column records a floating-point temperature in degrees Celsius (22.70, 26.40, 30.10, 33.80), and `created_at` provides an audit timestamp. The foreign key `menu_option_id` points back to `menu_options.menu_option_id`, establishing a 1:1 reverse composition: each ingredient belongs to exactly one menu option.

**Table `beverage_types`**

| id | beverage_id | name | type | serving_temp | caffeinated | menu_option_id |
|---|---|---|---|---|---|---|
| 100 | 884345 | Extended Review | coffee | hot | true | 1 |
| 101 | 4447029 | Pilot Initiative A | tea | cold | false | 2 |
| 102 | 2002007020170 | Baseline Model | juice | room_temp | true | 3 |
| 103 | 3158148 | Distributed Cluster | water | hot | false | 4 |

The `beverage_types` table describes the drink component of each menu option. Its surrogate key `id` (100–103) is referenced by `menu_options.beverage_type_id`. The business identifier `beverage_id` is a mixed-type column with integers and a long numeric string (`2002007020170`). The `name` column again echoes domain labels, while `type` classifies beverages as `coffee`, `tea`, `juice`, or `water`. The `serving_temp` column stores temperature descriptors (`hot`, `cold`, `room_temp`), and `caffeinated` is a boolean flag. The foreign key `menu_option_id` references `menu_options.menu_option_id`, enforcing the same 1:1 composition as the ingredient side. Beverage 100 ("Extended Review") is a hot, caffeinated coffee; beverage 101 ("Pilot Initiative A") is a cold, non-caffeinated tea.

**Table `guest_reservations`**

| guest_reservation_id | reservation_id | guest_name | check_in_date | room_number | dietary_restrictions | status | breakfast_service_id | menu_option_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4277031 | Extended Standard | 2023-06-25 | ROO-2106 | pilot-dietary-38 | confirmed | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Pilot Framework A | 2024-11-09 | ROO-2113 | extended-dietary-39 | checked_in | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | template_impcode_pagata_20ind | Baseline Protocol | 2025-04-20 | ROO-2120 | integrated-dietary-40 | completed | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 468 | Distributed Programme | 2022-09-04 | ROO-2127 | seasonal-dietary-41 | no_show | 1003 | 4 | 2025-04-16 09:14:00 |

The `guest_reservations` table captures the guest-facing side of the domain. Its primary key `guest_reservation_id` (1000–1003) is referenced by `breakfast_services.guest_reservation_id`. The business identifier `reservation_id` is a mixed-type column with integers, UUIDs, and template strings. The `guest_name` column stores names like "Extended Standard" and "Pilot Framework A". The `check_in_date` column records dates, and `room_number` stores room identifiers such as `ROO-2106` and `ROO-2113`. The `dietary_restrictions` column holds free-text restriction labels (`pilot-dietary-38`, `extended-dietary-39`, `integrated-dietary-40`, `seasonal-dietary-41`). The `status` column is an enumerated state machine with values `confirmed`, `checked_in`, `completed`, and `no_show`. Two foreign keys anchor this table: `breakfast_service_id` references `breakfast_services.breakfast_service_id`, and `menu_option_id` references `menu_options.menu_option_id`, meaning each reservation is associated with exactly one breakfast service and one menu option. The `created_at` column provides an audit timestamp.

**Table `services_options`**

| breakfast_service_id | menu_option_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `services_options` table is a junction (associative) entity that resolves the many-to-many relationship between `breakfast_services` and `menu_options`. Its composite key consists of `breakfast_service_id` and `menu_option_id`. The data shows that each breakfast service offers multiple menu options and each menu option is available across multiple services. For example, breakfast service 1000 is linked to menu options 1 and 2, while menu option 1 is offered by services 1000 and 1003. This table has no surrogate key of its own; the composite of its two columns serves as the primary key, and both columns are foreign keys referencing their respective parent tables.

**View `v_breakfast_service_menu_option_detail`**

```sql
CREATE VIEW v_breakfast_service_menu_option_detail AS
SELECT a.breakfast_service_id, a.service_id, a.name, b.menu_option_id AS option_menu_option_id, b.option_id AS option_option_id, b.name AS option_name
FROM breakfast_services a
  JOIN services_options j ON j.breakfast_service_id = a.breakfast_service_id
  JOIN menu_options b ON b.menu_option_id = j.menu_option_id;
```

| breakfast_service_id | service_id | name | option_menu_option_id | option_option_id | option_name |
|---|---|---|---|---|---|
| 1000 | 1996925 | Extended Review | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review |
| 1000 | 1996925 | Extended Review | 2 | 1204-0009-S | Pilot Initiative A |
| 1001 | 3990164 | Pilot Initiative A | 2 | 1204-0009-S | Pilot Initiative A |
| 1001 | 3990164 | Pilot Initiative A | 3 | 9424920 | Baseline Model |
| 1002 | 5844258 | Baseline Model | 3 | 9424920 | Baseline Model |
| 1002 | 5844258 | Baseline Model | 4 | 1186083 | Distributed Cluster |
| 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster | 4 | 1186083 | Distributed Cluster |
| 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review |

The view `v_breakfast_service_menu_option_detail` joins `breakfast_services` with `menu_options` on `breakfast_service_id`, producing a denormalised row for each service–menu pairing. It answers the question: "What menu options are available during a given breakfast service, and what are their dietary and serving characteristics?" For the row corresponding to service 1000 ("Extended Review"), the view reveals menu option 1 ("Extended Review", category `main`, gluten-free, vegetarian, primary serving) and menu option 2 ("Pilot Initiative A", category `side`, vegan, adaptive serving). This join reconstructs the domain fact that a breakfast service is a temporal container for a set of menu offerings, each with its own dietary profile.

**View `v_breakfast_service_guest_reservation`**

```sql
CREATE VIEW v_breakfast_service_guest_reservation AS
SELECT a.breakfast_service_id, a.service_id, a.name, a.start_time, b.guest_reservation_id AS reservation_guest_reservation_id, b.reservation_id AS reservation_reservation_id, b.guest_name AS reservation_guest_name
FROM breakfast_services a JOIN guest_reservations b ON a.guest_reservation_id = b.guest_reservation_id;
```

| breakfast_service_id | service_id | name | start_time | reservation_guest_reservation_id | reservation_reservation_id | reservation_guest_name |
|---|---|---|---|---|---|---|
| 1000 | 1996925 | Extended Review | 2024-03-27T14:42:00 | 1000 | 4277031 | Extended Standard |
| 1001 | 3990164 | Pilot Initiative A | 2025-08-11T21:59:00 | 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Pilot Framework A |
| 1002 | 5844258 | Baseline Model | 2022-01-22T04:16:00 | 1002 | template_impcode_pagata_20ind | Baseline Protocol |
| 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster | 2023-06-06T11:33:00 | 1003 | 468 | Distributed Programme |

The view `v_breakfast_service_guest_reservation` joins `breakfast_services` with `guest_reservations` on `breakfast_service_id`, answering: "Which guest reservations are associated with a given breakfast service, and what are their current statuses?" For service 1000, the view surfaces reservation 1000 ("Extended Standard", room `ROO-2106`, status `confirmed`, dietary restriction `pilot-dietary-38`). For service 1001, it surfaces reservation 1001 ("Pilot Framework A", room `ROO-2113`, status `checked_in`, dietary restriction `extended-dietary-39`). This join materialises the operational fact that a breakfast service is booked by specific guests, each with their own reservation lifecycle state.

**View `v_menu_option_breakfast_service`**

```sql
CREATE VIEW v_menu_option_breakfast_service AS
SELECT a.menu_option_id, a.option_id, a.name, a.category, b.breakfast_service_id AS service_breakfast_service_id, b.service_id AS service_service_id, b.name AS service_name
FROM menu_options a JOIN breakfast_services b ON a.breakfast_service_id = b.breakfast_service_id;
```

| menu_option_id | option_id | name | category | service_breakfast_service_id | service_service_id | service_name |
|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review | main | 1000 | 1996925 | Extended Review |
| 2 | 1204-0009-S | Pilot Initiative A | side | 1001 | 3990164 | Pilot Initiative A |
| 3 | 9424920 | Baseline Model | beverage | 1002 | 5844258 | Baseline Model |
| 4 | 1186083 | Distributed Cluster | pastry | 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_menu_option_breakfast_service` joins `menu_options` with `breakfast_services` on `breakfast_service_id`, answering: "During which breakfast services is a given menu option offered?" For menu option 1 ("Extended Review", category `main`), the view reveals it is served during breakfast service 1000 ("Extended Review", status `scheduled`). For menu option 3 ("Baseline Model", category `beverage`), it is served during breakfast service 1002 ("Baseline Model", status `completed`). This perspective inverts the service-centric view, allowing queries about menu availability across the service calendar.

**View `v_menu_option_food_ingredient`**

```sql
CREATE VIEW v_menu_option_food_ingredient AS
SELECT a.menu_option_id, a.option_id, a.name, a.category, b.id AS ingredient_id, b.ingredient_id AS ingredient_ingredient_id, b.name AS ingredient_name
FROM menu_options a JOIN food_ingredients b ON a.food_ingredient_id = b.id;
```

| menu_option_id | option_id | name | category | ingredient_id | ingredient_ingredient_id | ingredient_name |
|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review | main | 1 | 1450638 | Extended Review |
| 2 | 1204-0009-S | Pilot Initiative A | side | 2 | 5844284 | Pilot Initiative A |
| 3 | 9424920 | Baseline Model | beverage | 3 | template_ivacode_pagata_20det40ind | Baseline Model |
| 4 | 1186083 | Distributed Cluster | pastry | 4 | 2087735 | Distributed Cluster |

The view `v_menu_option_food_ingredient` joins `menu_options` with `food_ingredients` on `food_ingredient_id`, answering: "What raw ingredient composes a given menu option, and what are its safety and sourcing attributes?" For menu option 1 ("Extended Review", category `main`), the view reveals ingredient 1 ("Extended Review", origin `distributed-origin-66`, non-allergenic, non-local, stored at 22.70 °C). For menu option 2 ("Pilot Initiative A", category `side`), it reveals ingredient 2 ("Pilot Initiative A", origin `baseline-origin-67`, allergenic, locally sourced, stored at 26.40 °C). This join reconstructs the composition fact that each menu item is built from exactly one ingredient with defined allergen and provenance metadata.

**View `v_menu_option_beverage_type`**

```sql
CREATE VIEW v_menu_option_beverage_type AS
SELECT a.menu_option_id, a.option_id, a.name, a.category, b.id AS type_id, b.beverage_id AS type_beverage_id, b.name AS type_name
FROM menu_options a JOIN beverage_types b ON a.beverage_type_id = b.id;
```

| menu_option_id | option_id | name | category | type_id | type_beverage_id | type_name |
|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review | main | 100 | 884345 | Extended Review |
| 2 | 1204-0009-S | Pilot Initiative A | side | 101 | 4447029 | Pilot Initiative A |
| 3 | 9424920 | Baseline Model | beverage | 102 | 2002007020170 | Baseline Model |
| 4 | 1186083 | Distributed Cluster | pastry | 103 | 3158148 | Distributed Cluster |

The view `v_menu_option_beverage_type` joins `menu_options` with `beverage_types` on `beverage_type_id`, answering: "What beverage accompanies a given menu option, and what are its serving characteristics?" For menu option 1 ("Extended Review", category `main`), the view reveals beverage 100 ("Extended Review", type `coffee`, serving temperature `hot`, caffeinated). For menu option 2 ("Pilot Initiative A", category `side`), it reveals beverage 101 ("Pilot Initiative A", type `tea`, serving temperature `cold`, non-caffeinated). This join materialises the beverage-companion fact, enabling queries about caffeine content or temperature profiles across the menu.

**View `v_food_ingredient_menu_option`**

```sql
CREATE VIEW v_food_ingredient_menu_option AS
SELECT a.id, a.ingredient_id, a.name, a.origin, b.menu_option_id AS option_menu_option_id, b.option_id AS option_option_id, b.name AS option_name
FROM food_ingredients a JOIN menu_options b ON a.menu_option_id = b.menu_option_id;
```

| id | ingredient_id | name | origin | option_menu_option_id | option_option_id | option_name |
|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | distributed-origin-66 | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review |
| 2 | 5844284 | Pilot Initiative A | baseline-origin-67 | 2 | 1204-0009-S | Pilot Initiative A |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | pilot-origin-68 | 3 | 9424920 | Baseline Model |
| 4 | 2087735 | Distributed Cluster | extended-origin-69 | 4 | 1186083 | Distributed Cluster |

The view `v_food_ingredient_menu_option` joins `food_ingredients` with `menu_options` on `menu_option_id`, answering: "Which menu option is composed from a given ingredient?" This is the inverse of `v_menu_option_food_ingredient`. For ingredient 1 ("Extended Review", origin `distributed-origin-66`), the view shows it composes menu option 1 ("Extended Review", category `main`, gluten-free, vegetarian). For ingredient 4 ("Distributed Cluster", origin `extended-origin-69`), it composes menu option 4 ("Distributed Cluster", category `pastry`, vegan, baseline serving). This perspective is useful for allergen tracing: given an ingredient, one can identify all menu items that contain it.

**View `v_beverage_type_menu_option`**

```sql
CREATE VIEW v_beverage_type_menu_option AS
SELECT a.id, a.beverage_id, a.name, a.type, b.menu_option_id AS option_menu_option_id, b.option_id AS option_option_id, b.name AS option_name
FROM beverage_types a JOIN menu_options b ON a.menu_option_id = b.menu_option_id;
```

| id | beverage_id | name | type | option_menu_option_id | option_option_id | option_name |
|---|---|---|---|---|---|---|
| 100 | 884345 | Extended Review | coffee | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | 4447029 | Pilot Initiative A | tea | 2 | 1204-0009-S | Pilot Initiative A |
| 102 | 2002007020170 | Baseline Model | juice | 3 | 9424920 | Baseline Model |
| 103 | 3158148 | Distributed Cluster | water | 4 | 1186083 | Distributed Cluster |

The view `v_beverage_type_menu_option` joins `beverage_types` with `menu_options` on `menu_option_id`, answering: "Which menu option is paired with a given beverage type?" This is the inverse of `v_menu_option_beverage_type`. For beverage 100 ("Extended Review", type `coffee`, hot, caffeinated), the view shows it is paired with menu option 1 ("Extended Review", category `main`). For beverage 103 ("Distributed Cluster", type `water`, hot, non-caffeinated), it is paired with menu option 4 ("Distributed Cluster", category `pastry`). This join supports beverage-centric queries, such as identifying all menu items served with hot beverages.

**View `v_guest_reservation_breakfast_service`**

```sql
CREATE VIEW v_guest_reservation_breakfast_service AS
SELECT a.guest_reservation_id, a.reservation_id, a.guest_name, a.check_in_date, b.breakfast_service_id AS service_breakfast_service_id, b.service_id AS service_service_id, b.name AS service_name
FROM guest_reservations a JOIN breakfast_services b ON a.breakfast_service_id = b.breakfast_service_id;
```

| guest_reservation_id | reservation_id | guest_name | check_in_date | service_breakfast_service_id | service_service_id | service_name |
|---|---|---|---|---|---|---|
| 1000 | 4277031 | Extended Standard | 2023-06-25 | 1000 | 1996925 | Extended Review |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Pilot Framework A | 2024-11-09 | 1001 | 3990164 | Pilot Initiative A |
| 1002 | template_impcode_pagata_20ind | Baseline Protocol | 2025-04-20 | 1002 | 5844258 | Baseline Model |
| 1003 | 468 | Distributed Programme | 2022-09-04 | 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_guest_reservation_breakfast_service` joins `guest_reservations` with `breakfast_services` on `breakfast_service_id`, answering: "What breakfast service is a guest reservation linked to, and what are the service's temporal and status properties?" For reservation 1000 ("Extended Standard", room `ROO-2106`, status `confirmed`), the view reveals breakfast service 1000 ("Extended Review", status `scheduled`, buffet style `false`). For reservation 1003 ("Distributed Programme", room `ROO-2127`, status `no_show`), it reveals breakfast service 1003 ("Distributed Cluster", status `cancelled`, buffet style `true`). This join reconstructs the guest-service linkage, enabling queries about which guests are booked for which services and their current operational states.

**View `v_guest_reservation_menu_option`**

```sql
CREATE VIEW v_guest_reservation_menu_option AS
SELECT a.guest_reservation_id, a.reservation_id, a.guest_name, a.check_in_date, b.menu_option_id AS option_menu_option_id, b.option_id AS option_option_id, b.name AS option_name
FROM guest_reservations a JOIN menu_options b ON a.menu_option_id = b.menu_option_id;
```

| guest_reservation_id | reservation_id | guest_name | check_in_date | option_menu_option_id | option_option_id | option_name |
|---|---|---|---|---|---|---|
| 1000 | 4277031 | Extended Standard | 2023-06-25 | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Pilot Framework A | 2024-11-09 | 2 | 1204-0009-S | Pilot Initiative A |
| 1002 | template_impcode_pagata_20ind | Baseline Protocol | 2025-04-20 | 3 | 9424920 | Baseline Model |
| 1003 | 468 | Distributed Programme | 2022-09-04 | 4 | 1186083 | Distributed Cluster |

The view `v_guest_reservation_menu_option` joins `guest_reservations` with `menu_options` on `menu_option_id`, answering: "What menu option has a guest reservation selected, and what are its dietary and category attributes?" For reservation 1000 ("Extended Standard", dietary restriction `pilot-dietary-38`), the view shows menu option 1 ("Extended Review", category `main`, gluten-free, vegetarian, vegan `false`). For reservation 1003 ("Distributed Programme", dietary restriction `seasonal-dietary-41`), it shows menu option 4 ("Distributed Cluster", category `pastry`, gluten-free `false`, vegetarian `false`, vegan `true`). This join materialises the guest-menu selection fact, allowing queries about dietary compatibility between guest restrictions and menu properties.

The schema presented here demonstrates a clean separation of concerns: `breakfast_services` models temporal offerings, `menu_options` models food-and-beverage items with dietary metadata, `food_ingredients` and `beverage_types` model the constituent materials, `guest_reservations` models the guest-facing bookings, and `services_options` resolves the many-to-many service–menu relationship. Foreign keys enforce referential integrity at every composition point, while the nine views provide denormalised lenses that answer specific operational questions by rejoining the normalised tables. The result is an ontology-grounded relational model where every column, key, and join corresponds to a well-defined domain concept, and every view reconstructs a verifiable fact from the underlying normalised structure.