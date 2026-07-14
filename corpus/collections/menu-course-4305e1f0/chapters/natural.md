## The Architecture of a Multi-Outlet Dining Operation

A modern restaurant group manages its business through a structured set of records that capture everything from individual menu items to the financial mechanics of service charges. The domain revolves around six core entities: menu courses, dining packages, food ingredients, restaurant outlets, staff members, and service charge transactions. Each entity carries its own identifiers and attributes, and together they form an interconnected system where a single course can belong to a package, an ingredient can be traced to a course, a staff member can be assigned to an outlet, and a service charge can be recorded against both a package and a staff member. Understanding how these records relate is essential for anyone responsible for menu engineering, cost control, or payroll distribution across a chain of dining venues.

**Table `MenuCourse`**

| id | courseIdentifier | courseName | price | isVegetarian | isVegan | description | packageId | ingredientId |
|---|---|---|---|---|---|---|---|---|
| 1 | soup | Legacy Protocol D | 12.87 | true | false | Extended Survey | 100 | 1450638 |
| 2 | starter | Regional Programme | 35.45 | false | true | Pilot Corridor A | 101 | 5844284 |
| 3 | main | Seasonal Standard | 29.24 | true | false | Baseline Series | 102 | template_ivacode_pagata_20det40ind |
| 4 | dessert | Integrated Framework A | 29.99 | false | true | Distributed Assessment | 103 | 2087735 |

The `MenuCourse` table stores the individual dishes that appear on a restaurant's menu. Each row carries a unique `id`, a `courseIdentifier` that classifies the dish by type, and a `courseName` that serves as the internal label. The `price` field records the cost to the customer, while `isVegetarian` and `isVegan` flags indicate dietary compatibility. A free-text `description` provides additional context, and the `packageId` and `ingredientId` columns link the course to its parent dining package and its primary ingredient, respectively. Consider the first row: course id `1` carries the identifier `soup` and the internal name `Legacy Protocol D`, priced at `12.87`. It is marked as vegetarian but not vegan, with the description `Extended Survey`. Its `packageId` of `100` ties it to a dining package, and its `ingredientId` of `1450638` points to a specific food ingredient. The second row, id `2`, is classified as a `starter` named `Regional Programme` at `35.45`, is vegan but not vegetarian, and references package `101` and ingredient `5844284`. The third and fourth rows follow the same pattern, with ids `3` and `4`, identifiers `main` and `dessert`, and prices of `29.24` and `29.99` respectively. Notably, the third row's `ingredientId` uses a composite string `template_ivacode_pagata_20det40ind` rather than a plain integer, illustrating that ingredient references are not restricted to numeric keys.

**Table `DiningPackage`**

| id | packageId | packageName | totalPrice | currencyCode | includesChampagneCocktail | serviceChargePercentage | outletId |
|---|---|---|---|---|---|---|---|
| 100 | 9424918 | Legacy Standard D | 43.48 | gd_fp_eu_acc3 | false | 4.95 | 1 |
| 101 | account_pymes_1044 | Regional Framework | 25.36 | managing-resources | true | 7.90 | 2 |
| 102 | 5844275 | Seasonal Protocol | 16.11 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | false | 10.85 | 3 |
| 103 | 2106710 | Integrated Programme A | 14.31 | 10445649 | true | 13.80 | 4 |

Dining packages represent curated collections of courses offered at a bundled price. The `DiningPackage` table holds one row per package, identified by both a surrogate `id` and a business-level `packageId`. The `packageName` gives the package a human-readable title, while `totalPrice` and `currencyCode` capture the financial terms. Two boolean-style fields — `includesChampagneCocktail` and `serviceChargePercentage` — describe premium inclusions and the applicable service charge rate. The `outletId` column anchors the package to a specific restaurant location. Row `100` (surrogate id `100`) is named `Legacy Standard D`, priced at `43.48` in the currency code `gd_fp_eu_acc3`, does not include a champagne cocktail, carries a service charge of `4.95` percent, and is associated with outlet `1`. Row `101` (surrogate id `101`) is `Regional Framework` at `25.36` in `managing-resources`, includes a champagne cocktail, has a service charge of `7.90` percent, and belongs to outlet `2`. The remaining rows, `102` and `103`, follow the same structure with prices of `16.11` and `14.31`, service charges of `10.85` and `13.80` percent, and outlet associations of `3` and `4`.

**Table `FoodIngredient`**

| ingredientId | ingredientName | category | allergenFlag | originRegion | courseId |
|---|---|---|---|---|---|
| 1450638 | Pilot Assessment | protein | false | baseline-origin-61 | 1 |
| 5844284 | Baseline Survey | vegetable | true | pilot-origin-62 | 2 |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | dairy | false | extended-origin-63 | 3 |
| 2087735 | Adaptive Series | grain | true | integrated-origin-64 | 4 |

The `FoodIngredient` table catalogs the raw materials used in menu preparation. Each ingredient has an `ingredientId`, a human-readable `ingredientName`, a `category` such as protein or vegetable, an `allergenFlag` indicating whether it is an allergen, an `originRegion` describing where it is sourced, and a `courseId` linking it back to the menu course that uses it. The first ingredient, id `1450638`, is named `Pilot Assessment`, falls in the `protein` category, is not flagged as an allergen, originates from `baseline-origin-61`, and is associated with course `1`. The second, id `5844284`, is `Baseline Survey`, categorized as `vegetable`, flagged as an allergen, from `pilot-origin-62`, and linked to course `2`. The third ingredient uses the composite identifier `template_ivacode_pagata_20det40ind`, is named `Distributed Corridor A`, belongs to the `dairy` category, is not an allergen, comes from `extended-origin-63`, and maps to course `3`. The fourth, id `2087735`, is `Adaptive Series`, a `grain` allergen from `integrated-origin-64` tied to course `4`.

**Table `RestaurantOutlet`**

| id | outletId | outletName | addressLine1 | city | postalCode | operatingHours | packageId | staffId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 48753442 | Extended Review | adaptive-address-77 | integrated-city-34 | 9125611 | pilot-operatin-50 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2618568 | Pilot Initiative A | distributed-address-78 | seasonal-city-35 | ChIJt4hBkzhu5kcRJJDUNqGUpso | extended-operatin-51 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9085247 | Baseline Model | baseline-address-79 | regional-city-36 | 3001009030200 | integrated-operatin-52 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2125 | Distributed Cluster | pilot-address-80 | legacy-city-37 | 4060635 | seasonal-operatin-53 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Restaurant outlets are the physical locations where dining packages are served. The `RestaurantOutlet` table records each venue with an `id`, an `outletId`, an `outletName`, an `addressLine1`, a `city`, a `postalCode`, `operatingHours`, and timestamps `createdAt` and `updatedAt`. The `packageId` and `staffId` columns link the outlet to its primary dining package and its assigned staff member. Outlet `1` (id `1`, outlet id `48753442`) is named `Extended Review`, located at `adaptive-address-77` in `integrated-city-34` with postal code `9125611`, operates under the hours code `pilot-operatin-50`, and is associated with package `100` and staff `100`. It was created on `2025-01-01` and last updated on `2025-01-02`. Outlet `2` (id `2`, outlet id `2618568`) is `Pilot Initiative A` at `distributed-address-78` in `seasonal-city-35`, postal code `ChIJt4hBkzhu5kcRJJDUNqGUpso`, operating under `extended-operatin-51`, linked to package `101` and staff `101`, created on `2025-02-06`. Outlet `3` (id `3`, outlet id `9085247`) is `Baseline Model` at `baseline-address-79` in `regional-city-36`, postal code `3001009030200`, operating under `integrated-operatin-52`, tied to package `102` and staff `102`, created on `2025-03-11`. Outlet `4` (id `4`, outlet id `2125`) is `Distributed Cluster` at `pilot-address-80` in `legacy-city-37`, postal code `4060635`, operating under `seasonal-operatin-53`, linked to package `103` and staff `103`, created on `2025-04-16`.

**Table `RestaurantStaff`**

| id | staffId | staffName | roleType | shiftStart | shiftEnd | receivesServiceChargeShare | outletId | courseId |
|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Jim Henson | waiter | 2024-11-04T22:30:00 | 2023-06-07T05:51:00 | false | 1 | 1 |
| 101 | 3158139 | Purnima Medical | runner | 2025-04-15T05:47:00 | 2024-11-18T12:08:00 | true | 2 | 2 |
| 102 | 8189502 | Deanna Turner | chef | 2022-09-26T12:04:00 | 2025-04-02T19:25:00 | false | 3 | 3 |
| 103 | 69438 | Kimberly Myers | kitchen_porter | 2023-02-10T19:21:00 | 2022-09-13T02:42:00 | true | 4 | 4 |

Staff members are the people who deliver service at each outlet. The `RestaurantStaff` table stores each employee's `id`, a `staffId`, their `staffName`, a `roleType` such as waiter or chef, `shiftStart` and `shiftEnd` timestamps, a `receivesServiceChargeShare` flag, an `outletId` assignment, and a `courseId` reference. Staff id `100` is `Jim Henson`, a `waiter` whose shift runs from `2024-11-04T22:30:00` to `2023-06-07T05:51:00`, who does not receive a service charge share, is assigned to outlet `1`, and references course `1`. Staff id `101` is `Purnima Medical`, a `runner` with shift times `2025-04-15T05:47:00` to `2024-11-18T12:08:00`, who does receive a service charge share, assigned to outlet `2` and course `2`. Staff id `102` is `Deanna Turner`, a `chef` working `2022-09-26T12:04:00` to `2025-04-02T19:25:00`, not receiving a service charge share, at outlet `3` and course `3`. Staff id `103` is `Kimberly Myers`, a `kitchen_porter` with shift `2023-02-10T19:21:00` to `2022-09-13T02:42:00`, receiving a service charge share, at outlet `4` and course `4`.

**Table `ServiceChargeRecord`**

| id | recordId | transactionDate | totalChargeAmount | chargePercentage | paymentMethod | isDeductedByCompany | packageId | staffId |
|---|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 2023-02-25T01:39:00 | 10,296 | 15.70 | cash | Council Of The Great City Schools | 100 | 100 |
| 101 | 10445619 | 2024-07-09T08:56:00 | 13,785 | 17.40 | credit_card | Alaska Air Group Inc | 101 | 101 |
| 102 | 9568457 | 2025-12-20T15:13:00 | 89.53 | 19.10 | cash | Amazon.com Inc. | 102 | 102 |
| 103 | 20743593 | 2022-05-04T22:30:00 | 9,957 | 20.80 | credit_card | School District of Philadelphia | 103 | 103 |

Service charge records capture the financial transactions that occur when customers pay for their meals. The `ServiceChargeRecord` table includes an `id`, a `recordId`, a `transactionDate`, a `totalChargeAmount`, a `chargePercentage`, a `paymentMethod` (either `cash` or `credit_card`), an `isDeductedByCompany` field that stores the name of the deducting organization, a `packageId` linking the charge to a dining package, and a `staffId` linking it to the staff member who earned the share. Record `100` (id `100`, record id `10449530`) occurred on `2023-02-25T01:39:00` with a total charge of `10,296` at `15.70` percent, paid by `cash`, deducted by `Council Of The Great City Schools`, associated with package `100` and staff `100`. Record `101` (id `101`, record id `10445619`) was on `2024-07-09T08:56:00` for `13,785` at `17.40` percent, paid by `credit_card`, deducted by `Alaska Air Group Inc`, tied to package `101` and staff `101`. Record `102` (id `102`, record id `9568457`) took place on `2025-12-20T15:13:00` for `89.53` at `19.10` percent, paid by `cash`, deducted by `Amazon.com Inc.`, linked to package `102` and staff `102`. Record `103` (id `103`, record id `20743593`) was on `2022-05-04T22:30:00` for `9,957` at `20.80` percent, paid by `credit_card`, deducted by `School District of Philadelphia`, connected to package `103` and staff `103`.

**Table `DiningPackageMenuCourse`**

| packageId | courseId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `DiningPackageMenuCourse` table serves as the junction between dining packages and menu courses, establishing which courses are included in which packages. This many-to-many relationship allows a single course to appear across multiple packages and a single package to contain multiple courses. The table's rows are the explicit bindings that make the package pricing and course composition possible. Without this junction, the system could not determine which courses contribute to a package's `totalPrice` or which courses should be served together as a set.

The following views materialize the relationships between these base tables, answering specific operational questions that managers and analysts need to address on a regular basis.

**View `vw_menu_course_dining_package`**

```sql
CREATE VIEW vw_menu_course_dining_package AS
SELECT a.id, a.courseIdentifier, a.courseName, a.price, b.id AS package_id, b.packageId AS package_packageId, b.packageName AS package_packageName
FROM MenuCourse a JOIN DiningPackage b ON a.packageId = b.id;
```

| id | courseIdentifier | courseName | price | package_id | package_packageId | package_packageName |
|---|---|---|---|---|---|---|
| 1 | soup | Legacy Protocol D | 12.87 | 100 | 9424918 | Legacy Standard D |
| 2 | starter | Regional Programme | 35.45 | 101 | account_pymes_1044 | Regional Framework |
| 3 | main | Seasonal Standard | 29.24 | 102 | 5844275 | Seasonal Protocol |
| 4 | dessert | Integrated Framework A | 29.99 | 103 | 2106710 | Integrated Programme A |

This view joins `MenuCourse` with `DiningPackage` to answer the question: which dining package does each menu course belong to, and what are the financial terms of that package? A row from this view might show course id `1` (`Legacy Protocol D`, priced at `12.87`) linked to package `100` (`Legacy Standard D`, total price `43.48`, service charge `4.95` percent). This tells a menu planner that the soup course is part of the Legacy Standard D package and that the package-level service charge rate is `4.95` percent. Another row could show course id `2` (`Regional Programme`, `35.45`) linked to package `101` (`Regional Framework`, `25.36`, service charge `7.90` percent), indicating that the starter belongs to the Regional Framework package with a higher service charge rate.

**View `vw_menu_course_food_ingredient`**

```sql
CREATE VIEW vw_menu_course_food_ingredient AS
SELECT a.id, a.courseIdentifier, a.courseName, a.price, b.ingredientId AS ingredient_ingredientId, b.ingredientName AS ingredient_ingredientName, b.category AS ingredient_category
FROM MenuCourse a JOIN FoodIngredient b ON a.ingredientId = b.ingredientId;
```

| id | courseIdentifier | courseName | price | ingredient_ingredientId | ingredient_ingredientName | ingredient_category |
|---|---|---|---|---|---|---|
| 1 | soup | Legacy Protocol D | 12.87 | 1450638 | Pilot Assessment | protein |
| 2 | starter | Regional Programme | 35.45 | 5844284 | Baseline Survey | vegetable |
| 3 | main | Seasonal Standard | 29.24 | template_ivacode_pagata_20det40ind | Distributed Corridor A | dairy |
| 4 | dessert | Integrated Framework A | 29.99 | 2087735 | Adaptive Series | grain |

This view connects `MenuCourse` with `FoodIngredient` to reveal the ingredient composition of each course. It answers: what ingredient is used in each menu course, and what are that ingredient's properties? A row might show course id `1` (`Legacy Protocol D`) paired with ingredient `1450638` (`Pilot Assessment`, category `protein`, allergen `false`, origin `baseline-origin-61`). This allows a chef or allergen manager to verify that the soup course uses a non-allergenic protein sourced from baseline-origin-61. Another row could pair course id `2` (`Regional Programme`) with ingredient `5844284` (`Baseline Survey`, category `vegetable`, allergen `true`, origin `pilot-origin-62`), flagging that the starter contains an allergenic vegetable.

**View `vw_dining_package_menu_course_detail`**

```sql
CREATE VIEW vw_dining_package_menu_course_detail AS
SELECT a.id, a.packageId, a.packageName, b.id AS course_id, b.courseIdentifier AS course_courseIdentifier, b.courseName AS course_courseName
FROM DiningPackage a
  JOIN DiningPackageMenuCourse j ON j.packageId = a.id
  JOIN MenuCourse b ON b.id = j.courseId;
```

| id | packageId | packageName | course_id | course_courseIdentifier | course_courseName |
|---|---|---|---|---|---|
| 100 | 9424918 | Legacy Standard D | 1 | soup | Legacy Protocol D |
| 100 | 9424918 | Legacy Standard D | 2 | starter | Regional Programme |
| 101 | account_pymes_1044 | Regional Framework | 2 | starter | Regional Programme |
| 101 | account_pymes_1044 | Regional Framework | 3 | main | Seasonal Standard |
| 102 | 5844275 | Seasonal Protocol | 3 | main | Seasonal Standard |
| 102 | 5844275 | Seasonal Protocol | 4 | dessert | Integrated Framework A |
| 103 | 2106710 | Integrated Programme A | 4 | dessert | Integrated Framework A |
| 103 | 2106710 | Integrated Programme A | 1 | soup | Legacy Protocol D |

This view brings together `DiningPackage`, `DiningPackageMenuCourse`, and `MenuCourse` to produce a detailed listing of every course within every package. It answers: what courses are included in each dining package, and what are their individual prices? A row might show package `100` (`Legacy Standard D`, total `43.48`) containing course id `1` (`Legacy Protocol D`, price `12.87`). This enables a manager to verify that the sum of individual course prices aligns with the package's total price. Another row could show package `101` (`Regional Framework`, total `25.36`) containing course id `2` (`Regional Programme`, price `35.45`), which may indicate that the package price is discounted relative to the sum of its courses.

**View `vw_dining_package_restaurant_outlet`**

```sql
CREATE VIEW vw_dining_package_restaurant_outlet AS
SELECT a.id, a.packageId, a.packageName, a.totalPrice, b.id AS outlet_id, b.outletId AS outlet_outletId, b.outletName AS outlet_outletName
FROM DiningPackage a JOIN RestaurantOutlet b ON a.outletId = b.id;
```

| id | packageId | packageName | totalPrice | outlet_id | outlet_outletId | outlet_outletName |
|---|---|---|---|---|---|---|
| 100 | 9424918 | Legacy Standard D | 43.48 | 1 | 48753442 | Extended Review |
| 101 | account_pymes_1044 | Regional Framework | 25.36 | 2 | 2618568 | Pilot Initiative A |
| 102 | 5844275 | Seasonal Protocol | 16.11 | 3 | 9085247 | Baseline Model |
| 103 | 2106710 | Integrated Programme A | 14.31 | 4 | 2125 | Distributed Cluster |

This view joins `DiningPackage` with `RestaurantOutlet` to answer: which restaurant outlet serves which dining package? A row might show outlet `1` (`Extended Review`) serving package `100` (`Legacy Standard D`, total `43.48`, service charge `4.95` percent). This tells a regional manager that the Extended Review location offers the Legacy Standard D package at a relatively low service charge rate. Another row could show outlet `2` (`Pilot Initiative A`) serving package `101` (`Regional Framework`, total `25.36`, service charge `7.90` percent), indicating a different pricing strategy at that location.

**View `vw_food_ingredient_menu_course`**

```sql
CREATE VIEW vw_food_ingredient_menu_course AS
SELECT a.ingredientId, a.ingredientName, a.category, a.allergenFlag, b.id AS course_id, b.courseIdentifier AS course_courseIdentifier, b.courseName AS course_courseName
FROM FoodIngredient a JOIN MenuCourse b ON a.courseId = b.id;
```

| ingredientId | ingredientName | category | allergenFlag | course_id | course_courseIdentifier | course_courseName |
|---|---|---|---|---|---|---|
| 1450638 | Pilot Assessment | protein | false | 1 | soup | Legacy Protocol D |
| 5844284 | Baseline Survey | vegetable | true | 2 | starter | Regional Programme |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | dairy | false | 3 | main | Seasonal Standard |
| 2087735 | Adaptive Series | grain | true | 4 | dessert | Integrated Framework A |

This view reverses the ingredient-to-course relationship, joining `FoodIngredient` with `MenuCourse` to answer: which menu course uses each ingredient, and what is that course's pricing and dietary profile? A row might show ingredient `1450638` (`Pilot Assessment`, category `protein`) used in course id `1` (`Legacy Protocol D`, price `12.87`, vegetarian `true`). This allows a procurement manager to trace a protein ingredient back to the courses that consume it. Another row could show ingredient `5844284` (`Baseline Survey`, category `vegetable`, allergen `true`) used in course id `2` (`Regional Programme`, price `35.45`, vegan `true`), providing a clear allergen warning for that dish.

**View `vw_restaurant_outlet_dining_package`**

```sql
CREATE VIEW vw_restaurant_outlet_dining_package AS
SELECT a.id, a.outletId, a.outletName, a.addressLine1, b.id AS package_id, b.packageId AS package_packageId, b.packageName AS package_packageName
FROM RestaurantOutlet a JOIN DiningPackage b ON a.packageId = b.id;
```

| id | outletId | outletName | addressLine1 | package_id | package_packageId | package_packageName |
|---|---|---|---|---|---|---|
| 1 | 48753442 | Extended Review | adaptive-address-77 | 100 | 9424918 | Legacy Standard D |
| 2 | 2618568 | Pilot Initiative A | distributed-address-78 | 101 | account_pymes_1044 | Regional Framework |
| 3 | 9085247 | Baseline Model | baseline-address-79 | 102 | 5844275 | Seasonal Protocol |
| 4 | 2125 | Distributed Cluster | pilot-address-80 | 103 | 2106710 | Integrated Programme A |

This view joins `RestaurantOutlet` with `DiningPackage` to answer: what dining package is associated with each restaurant outlet, and what are the package's financial details? A row might show outlet `1` (`Extended Review`, city `integrated-city-34`) linked to package `100` (`Legacy Standard D`, total `43.48`, includes champagne cocktail `false`, service charge `4.95` percent). This gives a location manager a quick summary of the package offerings at their venue. Another row could show outlet `4` (`Distributed Cluster`, city `legacy-city-37`) linked to package `103` (`Integrated Programme A`, total `14.31`, includes champagne cocktail `true`, service charge `13.80` percent), revealing a premium package with a high service charge at that location.

**View `vw_restaurant_outlet_restaurant_staff`**

```sql
CREATE VIEW vw_restaurant_outlet_restaurant_staff AS
SELECT a.id, a.outletId, a.outletName, a.addressLine1, b.id AS staff_id, b.staffId AS staff_staffId, b.staffName AS staff_staffName
FROM RestaurantOutlet a JOIN RestaurantStaff b ON a.staffId = b.id;
```

| id | outletId | outletName | addressLine1 | staff_id | staff_staffId | staff_staffName |
|---|---|---|---|---|---|---|
| 1 | 48753442 | Extended Review | adaptive-address-77 | 100 | 937735 | Jim Henson |
| 2 | 2618568 | Pilot Initiative A | distributed-address-78 | 101 | 3158139 | Purnima Medical |
| 3 | 9085247 | Baseline Model | baseline-address-79 | 102 | 8189502 | Deanna Turner |
| 4 | 2125 | Distributed Cluster | pilot-address-80 | 103 | 69438 | Kimberly Myers |

This view joins `RestaurantOutlet` with `RestaurantStaff` to answer: which staff member is assigned to each restaurant outlet, and what is their role and shift schedule? A row might show outlet `1` (`Extended Review`) assigned to staff `100` (`Jim Henson`, role `waiter`, shift `2024-11-04T22:30:00` to `2023-06-07T05:51:00`, does not receive service charge share). This helps a scheduling manager verify that each outlet has adequate staffing. Another row could show outlet `2` (`Pilot Initiative A`) assigned to staff `101` (`Purnima Medical`, role `runner`, shift `2025-04-15T05:47:00` to `2024-11-18T12:08:00`, receives service charge share `true`), indicating that this runner is eligible for service charge distribution.

**View `vw_restaurant_staff_restaurant_outlet`**

```sql
CREATE VIEW vw_restaurant_staff_restaurant_outlet AS
SELECT a.id, a.staffId, a.staffName, a.roleType, b.id AS outlet_id, b.outletId AS outlet_outletId, b.outletName AS outlet_outletName
FROM RestaurantStaff a JOIN RestaurantOutlet b ON a.outletId = b.id;
```

| id | staffId | staffName | roleType | outlet_id | outlet_outletId | outlet_outletName |
|---|---|---|---|---|---|---|
| 100 | 937735 | Jim Henson | waiter | 1 | 48753442 | Extended Review |
| 101 | 3158139 | Purnima Medical | runner | 2 | 2618568 | Pilot Initiative A |
| 102 | 8189502 | Deanna Turner | chef | 3 | 9085247 | Baseline Model |
| 103 | 69438 | Kimberly Myers | kitchen_porter | 4 | 2125 | Distributed Cluster |

This view reverses the outlet-to-staff relationship, joining `RestaurantStaff` with `RestaurantOutlet` to answer: which restaurant outlet does each staff member work at, and what are the outlet's details? A row might show staff `100` (`Jim Henson`, role `waiter`) working at outlet `1` (`Extended Review`, city `integrated-city-34`, postal code `9125611`). This provides a staff-centric view useful for payroll and shift management. Another row could show staff `103` (`Kimberly Myers`, role `kitchen_porter`) working at outlet `4` (`Distributed Cluster`, city `legacy-city-37`, postal code `4060635`), confirming the kitchen porter's assignment to the fourth location.

**View `vw_restaurant_staff_menu_course`**

```sql
CREATE VIEW vw_restaurant_staff_menu_course AS
SELECT a.id, a.staffId, a.staffName, a.roleType, b.id AS course_id, b.courseIdentifier AS course_courseIdentifier, b.courseName AS course_courseName
FROM RestaurantStaff a JOIN MenuCourse b ON a.courseId = b.id;
```

| id | staffId | staffName | roleType | course_id | course_courseIdentifier | course_courseName |
|---|---|---|---|---|---|---|
| 100 | 937735 | Jim Henson | waiter | 1 | soup | Legacy Protocol D |
| 101 | 3158139 | Purnima Medical | runner | 2 | starter | Regional Programme |
| 102 | 8189502 | Deanna Turner | chef | 3 | main | Seasonal Standard |
| 103 | 69438 | Kimberly Myers | kitchen_porter | 4 | dessert | Integrated Framework A |

This view joins `RestaurantStaff` with `MenuCourse` to answer: which menu course is associated with each staff member, and what are the course's details? A row might show staff `100` (`Jim Henson`, role `waiter`) linked to course id `1` (`Legacy Protocol D`, price `12.87`, vegetarian `true`). This could indicate that the waiter is responsible for serving or preparing that course. Another row could show staff `102` (`Deanna Turner`, role `chef`) linked to course id `3` (`Seasonal Standard`, price `29.24`, vegan `false`), suggesting the chef's specialty or assigned dish.

**View `vw_service_charge_record_dining_package`**

```sql
CREATE VIEW vw_service_charge_record_dining_package AS
SELECT a.id, a.recordId, a.transactionDate, a.totalChargeAmount, b.id AS package_id, b.packageId AS package_packageId, b.packageName AS package_packageName
FROM ServiceChargeRecord a JOIN DiningPackage b ON a.packageId = b.id;
```

| id | recordId | transactionDate | totalChargeAmount | package_id | package_packageId | package_packageName |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 2023-02-25T01:39:00 | 10,296 | 100 | 9424918 | Legacy Standard D |
| 101 | 10445619 | 2024-07-09T08:56:00 | 13,785 | 101 | account_pymes_1044 | Regional Framework |
| 102 | 9568457 | 2025-12-20T15:13:00 | 89.53 | 102 | 5844275 | Seasonal Protocol |
| 103 | 20743593 | 2022-05-04T22:30:00 | 9,957 | 103 | 2106710 | Integrated Programme A |

This view joins `ServiceChargeRecord` with `DiningPackage` to answer: which dining package is associated with each service charge transaction, and what are the package's terms? A row might show record `100` (transaction date `2023-02-25T01:39:00`, total charge `10,296`, charge percentage `15.70`, payment method `cash`) linked to package `100` (`Legacy Standard D`, total `43.48`, service charge `4.95` percent). This allows a finance manager to reconcile the recorded service charge against the package's standard rate. Another row could show record `101` (transaction date `2024-07-09T08:56:00`, total charge `13,785`, charge percentage `17.40`, payment method `credit_card`) linked to package `101` (`Regional Framework`, total `25.36`, service charge `7.90` percent), revealing a discrepancy between the recorded charge percentage and the package's standard rate that may warrant investigation.

**View `vw_service_charge_record_restaurant_staff`**

```sql
CREATE VIEW vw_service_charge_record_restaurant_staff AS
SELECT a.id, a.recordId, a.transactionDate, a.totalChargeAmount, b.id AS staff_id, b.staffId AS staff_staffId, b.staffName AS staff_staffName
FROM ServiceChargeRecord a JOIN RestaurantStaff b ON a.staffId = b.id;
```

| id | recordId | transactionDate | totalChargeAmount | staff_id | staff_staffId | staff_staffName |
|---|---|---|---|---|---|---|
| 100 | 10449530 | 2023-02-25T01:39:00 | 10,296 | 100 | 937735 | Jim Henson |
| 101 | 10445619 | 2024-07-09T08:56:00 | 13,785 | 101 | 3158139 | Purnima Medical |
| 102 | 9568457 | 2025-12-20T15:13:00 | 89.53 | 102 | 8189502 | Deanna Turner |
| 103 | 20743593 | 2022-05-04T22:30:00 | 9,957 | 103 | 69438 | Kimberly Myers |

This view joins `ServiceChargeRecord` with `RestaurantStaff` to answer: which staff member earned the service charge share for each transaction, and what are their role and eligibility details? A row might show record `100` (total charge `10,296`, charge percentage `15.70`, deducted by `Council Of The Great City Schools`) linked to staff `100` (`Jim Henson`, role `waiter`, does not receive service charge share). This tells a payroll administrator that although a service charge was recorded, this particular waiter is not eligible for a share. Another row could show record `101` (total charge `13,785`, charge percentage `17.40`, deducted by `Alaska Air Group Inc`) linked to staff `101` (`Purnima Medical`, role `runner`, receives service charge share `true`), confirming that this runner is eligible and should receive a portion of the recorded charge.

## Synthesis

The dining operation domain is held together by a network of explicit relationships: courses belong to packages, ingredients feed courses, outlets serve packages, staff work at outlets, and service charges are recorded against both packages and staff. The base tables store the atomic facts, while the junction table `DiningPackageMenuCourse` and the twelve views translate those facts into the operational questions that managers actually ask. A menu planner uses the course-to-package and course-to-ingredient views to design and price dishes. A location manager relies on the outlet-to-package and outlet-to-staff views to verify that each venue is properly equipped and staffed. A finance manager turns to the service charge views to reconcile transactions, verify eligibility, and audit discrepancies between recorded charge percentages and package-standard rates. Every row in every table, from `Legacy Protocol D` at `12.87` to `10,296` in service charges, is a data point in this interconnected system, and the views are the lenses through which those data points become actionable insight.