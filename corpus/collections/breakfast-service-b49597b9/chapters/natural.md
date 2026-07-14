## Hospitality Breakfast Operations

A hotel's breakfast operation is a coordinated exercise in scheduling, provisioning, and guest service. Each morning begins with a breakfast service—a time-bound offering that may be buffet-style or plated, scheduled for a specific window, and tied to the guests occupying the property. Behind every service sits a menu of options, each item composed of food ingredients and paired with a beverage type. Guests arrive with reservations, dietary restrictions, and room assignments, and the operation must reconcile all of these constraints before the first plate is served. The data model that supports this operation captures services, menus, ingredients, beverages, and reservations as distinct records, linked through junction tables and exposed through analytical views that answer the operational questions staff actually ask.

**Table `breakfast_services`**

| breakfast_service_id | service_id | name | start_time | end_time | status | is_buffet_style | guest_reservation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 1996925 | Extended Review | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | scheduled | false | 1000 |
| 1001 | 3990164 | Pilot Initiative A | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | active | true | 1001 |
| 1002 | 5844258 | Baseline Model | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | completed | false | 1002 |
| 1003 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Distributed Cluster | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | cancelled | true | 1003 |

The `breakfast_services` table is the operational backbone. Each row represents a single breakfast service instance, identified by `breakfast_service_id` and linked to an external `service_id` that may originate from a property management system. The `name` column carries a human-readable label such as *Extended Review* or *Pilot Initiative A*, while `start_time` and `end_time` define the service window. The `status` column tracks the lifecycle state—`scheduled`, `active`, `completed`, or `cancelled`—and `is_buffet_style` is a boolean flag distinguishing buffet service from plated service. The `guest_reservation_id` column ties the service to a specific guest reservation, establishing a direct link between the service instance and the guest it serves. In the sample data, service 1000 (*Extended Review*) is scheduled for a window spanning March 2024, is not buffet-style, and is associated with reservation 1000. Service 1001 (*Pilot Initiative A*) is currently active, is buffet-style, and links to reservation 1001.

**Table `menu_options`**

| menu_option_id | option_id | name | category | is_gluten_free | is_vegetarian | is_vegan | serving_size | breakfast_service_id | food_ingredient_id | beverage_type_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Extended Review | main | true | true | false | primary-serving-40 | 1000 | 1 | 100 |
| 2 | 1204-0009-S | Pilot Initiative A | side | false | false | true | adaptive-serving-41 | 1001 | 2 | 101 |
| 3 | 9424920 | Baseline Model | beverage | true | true | false | distributed-serving-42 | 1002 | 3 | 102 |
| 4 | 1186083 | Distributed Cluster | pastry | false | false | true | baseline-serving-43 | 1003 | 4 | 103 |

Menu items live in the `menu_options` table, where each row is a distinct offering available during a breakfast service. The `menu_option_id` is the primary key, and `option_id` carries an external reference. The `name` column holds the item name—*Extended Review*, *Pilot Initiative A*, and so on—while `category` classifies the item as `main`, `side`, `beverage`, or `pastry`. Dietary compliance is captured through three boolean flags: `is_gluten_free`, `is_vegetarian`, and `is_vegan`. The `serving_size` column describes the portion format, with values such as `primary-serving-40` or `adaptive-serving-41`. Crucially, each menu option is linked to a `breakfast_service_id`, a `food_ingredient_id`, and a `beverage_type_id`, establishing the core relationships that bind the menu to the service, the ingredient, and the beverage.

**Table `food_ingredients`**

| id | ingredient_id | name | origin | allergen_flag | is_local_sourced | storage_temp | menu_option_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 1450638 | Extended Review | distributed-origin-66 | false | false | 22.70 | 1 | 2025-01-01 00:14:00 |
| 2 | 5844284 | Pilot Initiative A | baseline-origin-67 | true | true | 26.40 | 2 | 2025-02-06 03:14:00 |
| 3 | template_ivacode_pagata_20det40ind | Baseline Model | pilot-origin-68 | false | false | 30.10 | 3 | 2025-03-11 06:14:00 |
| 4 | 2087735 | Distributed Cluster | extended-origin-69 | true | true | 33.80 | 4 | 2025-04-16 09:14:00 |

The `food_ingredients` table records the raw materials that compose menu items. Each ingredient has an `id`, an external `ingredient_id`, a `name`, and an `origin` field that describes where the ingredient is sourced—values include `distributed-origin-66` and `baseline-origin-67`. The `allergen_flag` indicates whether the ingredient contains allergens, and `is_local_sourced` signals whether the ingredient is procured locally. The `storage_temp` column records the required storage temperature in degrees, ranging from 22.70 to 33.80 in the sample data. The `menu_option_id` column links the ingredient to the menu item it belongs to, and `created_at` records when the ingredient record was first entered. Ingredient 1 (*Extended Review*) has no allergen flag, is not locally sourced, and requires storage at 22.70 degrees. Ingredient 2 (*Pilot Initiative A*) carries an allergen flag, is locally sourced, and requires storage at 26.40 degrees.

**Table `beverage_types`**

| id | beverage_id | name | type | serving_temp | caffeinated | menu_option_id |
|---|---|---|---|---|---|---|
| 100 | 884345 | Extended Review | coffee | hot | true | 1 |
| 101 | 4447029 | Pilot Initiative A | tea | cold | false | 2 |
| 102 | 2002007020170 | Baseline Model | juice | room_temp | true | 3 |
| 103 | 3158148 | Distributed Cluster | water | hot | false | 4 |

Beverages are catalogued in the `beverage_types` table, which stores the drink options paired with menu items. Each row has an `id`, an external `beverage_id`, a `name`, and a `type` field that classifies the beverage as `coffee`, `tea`, `juice`, or `water`. The `serving_temp` column indicates whether the beverage is served `hot`, `cold`, or at `room_temp`, and `caffeinated` is a boolean flag. The `menu_option_id` column links the beverage to its associated menu option. Beverage 100 (*Extended Review*) is a hot, caffeinated coffee. Beverage 101 (*Pilot Initiative A*) is a cold, non-caffeinated tea. Beverage 102 (*Baseline Model*) is a room-temperature, caffeinated juice. Beverage 103 (*Distributed Cluster*) is a hot, non-caffeinated water.

**Table `guest_reservations`**

| guest_reservation_id | reservation_id | guest_name | check_in_date | room_number | dietary_restrictions | status | breakfast_service_id | menu_option_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4277031 | Extended Standard | 2023-06-25 | ROO-2106 | pilot-dietary-38 | confirmed | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Pilot Framework A | 2024-11-09 | ROO-2113 | extended-dietary-39 | checked_in | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | template_impcode_pagata_20ind | Baseline Protocol | 2025-04-20 | ROO-2120 | integrated-dietary-40 | completed | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 468 | Distributed Programme | 2022-09-04 | ROO-2127 | seasonal-dietary-41 | no_show | 1003 | 4 | 2025-04-16 09:14:00 |

Guest reservations are the anchor of the operation. The `guest_reservations` table records each guest's booking with a `guest_reservation_id`, an external `reservation_id`, the `guest_name`, `check_in_date`, `room_number`, and `dietary_restrictions`. The `status` column tracks the reservation state—`confirmed`, `checked_in`, `completed`, or `no_show`—and the `breakfast_service_id` and `menu_option_id` columns link the reservation to the specific breakfast service and menu option the guest has selected. The `created_at` timestamp records when the reservation was made. Reservation 1000 (*Extended Standard*) is confirmed, occupies room ROO-2106, has dietary restriction `pilot-dietary-38`, and is linked to breakfast service 1000 and menu option 1. Reservation 1001 (*Pilot Framework A*) is checked in, occupies room ROO-2113, has dietary restriction `extended-dietary-39`, and links to service 1001 and menu option 2.

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

The `services_options` table is a junction table that resolves the many-to-many relationship between breakfast services and menu options. Each row pairs a `breakfast_service_id` with a `menu_option_id`, indicating that a particular menu option is available during a particular service. In the sample data, service 1000 offers menu options 1 and 2; service 1001 offers options 2 and 3; service 1002 offers options 3 and 4; and service 1003 offers options 4 and 1. This table is the structural bridge that allows any service to serve any menu, and vice versa.

### Service and Menu Detail

The view `v_breakfast_service_menu_option_detail` answers the question: which menu options are available during which breakfast services, and what are the details of those offerings? By joining `breakfast_services` with `menu_options` through the `services_options` junction table, the view produces a flattened record for each service-menu pairing. Consider the row where breakfast service 1000 (*Extended Review*) is paired with menu option 1 (*Extended Review*, category `main`, gluten-free, vegetarian, primary serving). The view exposes the service's start and end times, its scheduled status, and the full dietary profile of the menu item in a single row. Another row pairs service 1001 (*Pilot Initiative A*, active, buffet-style) with menu option 2 (*Pilot Initiative A*, category `side`, vegan, adaptive serving). This view is the operational dashboard for front-desk staff who need to confirm what a guest can order during their service window.

### Service and Guest Correlation

The view `v_breakfast_service_guest_reservation` answers: which guest reservations are associated with which breakfast services, and what are the details of both? By joining `guest_reservations` with `breakfast_services` on `breakfast_service_id`, the view produces a record that shows the guest's name, room number, dietary restrictions, and reservation status alongside the service's name, time window, and buffet flag. A representative row shows guest *Extended Standard* in room ROO-2106, with confirmed status and dietary restriction `pilot-dietary-38`, linked to breakfast service 1000 (*Extended Review*, scheduled, non-buffet). Another row shows *Pilot Framework A* in room ROO-2113, checked in, with restriction `extended-dietary-39`, linked to service 1001 (*Pilot Initiative A*, active, buffet-style). This view enables the kitchen to prepare for specific guests and their known requirements.

### Menu Option to Service Mapping

The view `v_menu_option_breakfast_service` answers: for each menu option, which breakfast services include it? This is the inverse of the service-to-menu view and is useful for menu planning and inventory forecasting. By joining `menu_options` with `breakfast_services` through `services_options`, the view produces a row for each menu-option–service pairing. Menu option 1 (*Extended Review*, main, gluten-free, vegetarian) appears in service 1000 (*Extended Review*, scheduled). Menu option 4 (*Distributed Cluster*, pastry, vegan) appears in both service 1002 (*Baseline Model*, completed) and service 1003 (*Distributed Cluster*, cancelled). This view helps the culinary team understand which services carry which items and plan ingredient procurement accordingly.

### Menu Option to Food Ingredient

The view `v_menu_option_food_ingredient` answers: what food ingredient is associated with each menu option, and what are the ingredient's properties? By joining `menu_options` with `food_ingredients` on `menu_option_id`, the view exposes the ingredient's origin, allergen status, local sourcing flag, and storage temperature alongside the menu item's name, category, and dietary flags. A representative row shows menu option 1 (*Extended Review*, main) paired with ingredient 1 (*Extended Review*, distributed origin, no allergen, not local, storage at 22.70 degrees). Another row shows menu option 2 (*Pilot Initiative A*, side) paired with ingredient 2 (*Pilot Initiative A*, baseline origin, allergen present, locally sourced, storage at 26.40 degrees). This view is essential for allergen management and for verifying that ingredients are stored at the correct temperatures.

### Menu Option to Beverage Type

The view `v_menu_option_beverage_type` answers: what beverage is paired with each menu option, and what are the beverage's characteristics? By joining `menu_options` with `beverage_types` on `menu_option_id`, the view produces a record that includes the beverage's type, serving temperature, and caffeine status alongside the menu item's details. Menu option 1 (*Extended Review*, main) is paired with beverage 100 (*Extended Review*, coffee, hot, caffeinated). Menu option 2 (*Pilot Initiative A*, side) is paired with beverage 101 (*Pilot Initiative A*, tea, cold, non-caffeinated). Menu option 3 (*Baseline Model*, beverage) is paired with beverage 102 (*Baseline Model*, juice, room temperature, caffeinated). Menu option 4 (*Distributed Cluster*, pastry) is paired with beverage 103 (*Distributed Cluster*, water, hot, non-caffeinated). This view supports beverage inventory management and helps staff communicate options to guests.

### Food Ingredient to Menu Option

The view `v_food_ingredient_menu_option` answers: which menu option uses each food ingredient? This is the inverse of the menu-to-ingredient view and is useful for ingredient-level reporting. By joining `food_ingredients` with `menu_options` on `menu_option_id`, the view produces a row for each ingredient–menu pairing. Ingredient 1 (*Extended Review*, distributed origin, no allergen) is used in menu option 1 (*Extended Review*, main, gluten-free, vegetarian). Ingredient 4 (*Distributed Cluster*, extended origin, allergen present, locally sourced) is used in menu option 4 (*Distributed Cluster*, pastry, vegan). This view supports traceability and allows the kitchen to identify all menu items that contain a specific ingredient.

### Beverage Type to Menu Option

The view `v_beverage_type_menu_option` answers: which menu option is paired with each beverage type? By joining `beverage_types` with `menu_options` on `menu_option_id`, the view produces a row for each beverage–menu pairing. Beverage 100 (*Extended Review*, coffee, hot, caffeinated) is paired with menu option 1 (*Extended Review*, main). Beverage 103 (*Distributed Cluster*, water, hot, non-caffeinated) is paired with menu option 4 (*Distributed Cluster*, pastry). This view is useful for beverage procurement and for ensuring that the right drinks are available for each menu category.

### Guest Reservation to Breakfast Service

The view `v_guest_reservation_breakfast_service` answers: which breakfast service is each guest reservation linked to, and what are the details of both? By joining `guest_reservations` with `breakfast_services` on `breakfast_service_id`, the view produces a record that shows the guest's name, room, dietary restrictions, and reservation status alongside the service's name, time window, status, and buffet flag. Reservation 1000 (*Extended Standard*, confirmed, room ROO-2106, restriction `pilot-dietary-38`) is linked to service 1000 (*Extended Review*, scheduled, non-buffet). Reservation 1003 (*Distributed Programme*, no-show, room ROO-2127, restriction `seasonal-dietary-41`) is linked to service 1003 (*Distributed Cluster*, cancelled, buffet-style). This view is critical for identifying guests who have not shown up and for adjusting service preparations accordingly.

### Guest Reservation to Menu Option

The view `v_guest_reservation_menu_option` answers: which menu option has each guest reservation selected? By joining `guest_reservations` with `menu_options` on `menu_option_id`, the view produces a record that shows the guest's details alongside the menu item's name, category, dietary flags, and serving size. Reservation 1000 (*Extended Standard*) is linked to menu option 1 (*Extended Review*, main, gluten-free, vegetarian, primary serving). Reservation 1001 (*Pilot Framework A*) is linked to menu option 2 (*Pilot Initiative A*, side, vegan, adaptive serving). Reservation 1002 (*Baseline Protocol*) is linked to menu option 3 (*Baseline Model*, beverage, gluten-free, vegetarian, distributed serving). Reservation 1003 (*Distributed Programme*) is linked to menu option 4 (*Distributed Cluster*, pastry, vegan, baseline serving). This view is the primary tool for the kitchen to know exactly what each guest has ordered and what dietary accommodations are required.

### Synthesis

The breakfast operation data model is a coherent system of interlocking records. Breakfast services define when and how food is served. Menu options define what is served, with full dietary and serving-size metadata. Food ingredients and beverage types provide the compositional detail behind each menu item. Guest reservations anchor the entire operation to specific people, rooms, and dietary needs. The junction table `services_options` decouples services from menus, allowing flexible combinations. The analytical views synthesize these relationships into actionable rows that answer the operational questions staff face every morning: what is available, who is coming, what do they need, and what ingredients must be on hand. Together, the tables and views form a complete operational picture of a hotel's breakfast service.

## Data appendix

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
