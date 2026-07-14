## Relational Modelling of the Restaurant Dining Domain

The restaurant dining domain captures the interplay between culinary offerings, service operations, and financial accounting within a multi-outlet hospitality chain. At its core, the model distinguishes between the static catalogue of menu items and dining packages, the dynamic logistics of outlet staffing and service charges, and the compositional links that bind ingredients to courses and packages to outlets. The relational schema normalises these concerns into seven base tables and eleven analytical views, each view reconstructing a domain fact by joining the appropriate normalised tables. The following sections walk through the entity types, their attributes, the foreign-key scaffolding that connects them, and the view-level joins that answer business questions.

### Base Tables and Their Attributes

The catalogue of culinary items lives in `MenuCourse`, which records each dish with a surrogate primary key `id`, a business-level `courseIdentifier` such as `soup` or `starter`, and a human-readable `courseName` like `Legacy Protocol D` or `Regional Programme`. The `price` column stores the per-portion cost (e.g. `12.87` for the soup entry), while boolean flags `isVegetarian` and `isVegan` encode dietary constraints. A free-text `description` field provides additional context, and two foreign keys — `packageId` and `ingredientId` — anchor the course to its parent dining package and to its source ingredient respectively.

**Table `MenuCourse`**

| id | courseIdentifier | courseName | price | isVegetarian | isVegan | description | packageId | ingredientId |
|---|---|---|---|---|---|---|---|---|
| 1 | soup | Legacy Protocol D | 12.87 | true | false | Extended Survey | 100 | 1450638 |
| 2 | starter | Regional Programme | 35.45 | false | true | Pilot Corridor A | 101 | 5844284 |
| 3 | main | Seasonal Standard | 29.24 | true | false | Baseline Series | 102 | template_ivacode_pagata_20det40ind |
| 4 | dessert | Integrated Framework A | 29.99 | false | true | Distributed Assessment | 103 | 2087735 |

The `DiningPackage` table defines the bundled offerings sold to customers. Each row carries a surrogate `id` (e.g. `100`), a business identifier `packageId` such as `9424918` or the string `account_pymes_1044`, and a `packageName` like `Legacy Standard D`. The `totalPrice` (e.g. `43.48`) and `currencyCode` (e.g. `gd_fp_eu_acc3`) capture the monetary value, while `includesChampagneCocktail` is a boolean that signals premium inclusions. The `serviceChargePercentage` (e.g. `4.95`) records the default surcharge rate, and the foreign key `outletId` links the package to the physical restaurant location.

**Table `DiningPackage`**

| id | packageId | packageName | totalPrice | currencyCode | includesChampagneCocktail | serviceChargePercentage | outletId |
|---|---|---|---|---|---|---|---|
| 100 | 9424918 | Legacy Standard D | 43.48 | gd_fp_eu_acc3 | false | 4.95 | 1 |
| 101 | account_pymes_1044 | Regional Framework | 25.36 | managing-resources | true | 7.90 | 2 |
| 102 | 5844275 | Seasonal Protocol | 16.11 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | false | 10.85 | 3 |
| 103 | 2106710 | Integrated Programme A | 14.31 | 10445649 | true | 13.80 | 4 |

Ingredients are catalogued in `FoodIngredient`, which stores the `ingredientId` (e.g. `1450638` or the composite `template_ivacode_pagata_20det40ind`), the `ingredientName` such as `Pilot Assessment`, a `category` (`protein`, `vegetable`, `dairy`, `grain`), an `allergenFlag` indicating whether the ingredient triggers an allergy warning, an `originRegion` like `baseline-origin-61`, and a `courseId` foreign key that points back to the `MenuCourse` row consuming the ingredient.

**Table `FoodIngredient`**

| ingredientId | ingredientName | category | allergenFlag | originRegion | courseId |
|---|---|---|---|---|---|
| 1450638 | Pilot Assessment | protein | false | baseline-origin-61 | 1 |
| 5844284 | Baseline Survey | vegetable | true | pilot-origin-62 | 2 |
| template_ivacode_pagata_20det40ind | Distributed Corridor A | dairy | false | extended-origin-63 | 3 |
| 2087735 | Adaptive Series | grain | true | integrated-origin-64 | 4 |

Physical locations are modelled in `RestaurantOutlet`. Each outlet has a surrogate `id` (e.g. `1`), a business `outletId` such as `48753442`, an `outletName` like `Extended Review`, and address fields `addressLine1` and `city` (e.g. `integrated-city-34`). The `postalCode` stores values ranging from numeric codes like `9125611` to geohash-style strings such as `ChIJt4hBkzhu5kcRJJDUNqGUpso`. The `operatingHours` column holds abbreviated strings like `pilot-operatin-50`. Two foreign keys, `packageId` and `staffId`, tie the outlet to its default dining package and to its assigned staff member, while `createdAt` and `updatedAt` timestamps track the lifecycle of the outlet record.

**Table `RestaurantOutlet`**

| id | outletId | outletName | addressLine1 | city | postalCode | operatingHours | packageId | staffId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 48753442 | Extended Review | adaptive-address-77 | integrated-city-34 | 9125611 | pilot-operatin-50 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2618568 | Pilot Initiative A | distributed-address-78 | seasonal-city-35 | ChIJt4hBkzhu5kcRJJDUNqGUpso | extended-operatin-51 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9085247 | Baseline Model | baseline-address-79 | regional-city-36 | 3001009030200 | integrated-operatin-52 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2125 | Distributed Cluster | pilot-address-80 | legacy-city-37 | 4060635 | seasonal-operatin-53 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Staffing information resides in `RestaurantStaff`. The surrogate `id` (e.g. `100`) maps to a business `staffId` such as `937735` or `3158139`. The `staffName` column holds names like `Jim Henson` and `Purnima Medical`, while `roleType` distinguishes positions (`waiter`, `runner`, `chef`, `kitchen_porter`). Shift boundaries are recorded in `shiftStart` and `shiftEnd` as ISO-8601 timestamps (e.g. `2024-11-04T22:30:00`), and `receivesServiceChargeShare` is a boolean indicating whether the staff member participates in the service charge pool. The foreign key `outletId` links the staff member to their assigned outlet, and `courseId` references a menu course.

**Table `RestaurantStaff`**

| id | staffId | staffName | roleType | shiftStart | shiftEnd | receivesServiceChargeShare | outletId | courseId |
|---|---|---|---|---|---|---|---|---|
| 100 | 937735 | Jim Henson | waiter | 2024-11-04T22:30:00 | 2023-06-07T05:51:00 | false | 1 | 1 |
| 101 | 3158139 | Purnima Medical | runner | 2025-04-15T05:47:00 | 2024-11-18T12:08:00 | true | 2 | 2 |
| 102 | 8189502 | Deanna Turner | chef | 2022-09-26T12:04:00 | 2025-04-02T19:25:00 | false | 3 | 3 |
| 103 | 69438 | Kimberly Myers | kitchen_porter | 2023-02-10T19:21:00 | 2022-09-13T02:42:00 | true | 4 | 4 |

Financial transactions are captured in `ServiceChargeRecord`. Each row has a surrogate `id` (e.g. `100`), a business `recordId` such as `10449530`, and a `transactionDate` (e.g. `2023-02-25T01:39:00`). The `totalChargeAmount` stores the monetary value (e.g. `10,296`), and `chargePercentage` records the applied rate (e.g. `15.70`). The `paymentMethod` column distinguishes `cash` from `credit_card`, while `isDeductedByCompany` holds the name of the deducting organisation (e.g. `Council Of The Great City Schools`). Foreign keys `packageId` and `staffId` link the charge to the originating dining package and to the staff member on duty.

**Table `ServiceChargeRecord`**

| id | recordId | transactionDate | totalChargeAmount | chargePercentage | paymentMethod | isDeductedByCompany | packageId | staffId |
|---|---|---|---|---|---|---|---|---|
| 100 | 10449530 | 2023-02-25T01:39:00 | 10,296 | 15.70 | cash | Council Of The Great City Schools | 100 | 100 |
| 101 | 10445619 | 2024-07-09T08:56:00 | 13,785 | 17.40 | credit_card | Alaska Air Group Inc | 101 | 101 |
| 102 | 9568457 | 2025-12-20T15:13:00 | 89.53 | 19.10 | cash | Amazon.com Inc. | 102 | 102 |
| 103 | 20743593 | 2022-05-04T22:30:00 | 9,957 | 20.80 | credit_card | School District of Philadelphia | 103 | 103 |

The many-to-many relationship between dining packages and menu courses is resolved through the junction table `DiningPackageMenuCourse`. This table does not appear as a standalone payload block in the reference, but it exists in the schema as the bridge that allows a single package to contain multiple courses and a single course to appear in multiple packages. The junction table's composite key pairs `packageId` with `courseId`, enforcing referential integrity against `DiningPackage` and `MenuCourse` respectively.

### Analytical Views

Views in this schema serve as denormalised lenses that reconstruct domain facts from the normalised base tables. Each view answers a specific business question by joining the relevant tables and projecting a flat result set.

The view `vw_menu_course_dining_package` joins `MenuCourse` to `DiningPackage` on the `packageId` foreign key, producing a flat row that pairs each course with its parent package. For example, the course `Legacy Protocol D` (identifier `soup`, price `12.87`) appears alongside the package `Legacy Standard D` (total price `43.48`, currency `gd_fp_eu_acc3`, service charge `4.95%`). This view answers the question: "Which package does each menu course belong to, and what are the package-level financial terms?"

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

The view `vw_menu_course_food_ingredient` joins `MenuCourse` to `FoodIngredient` on the `ingredientId` foreign key, revealing the ingredient composition of each course. The course `Legacy Protocol D` maps to the ingredient `Pilot Assessment` (category `protein`, allergen flag `false`, origin `baseline-origin-61`). The course `Regional Programme` maps to `Baseline Survey` (category `vegetable`, allergen flag `true`, origin `pilot-origin-62`). This view answers: "What ingredient is associated with each menu course, and what are its dietary properties?"

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

The view `vw_dining_package_menu_course_detail` joins `DiningPackage` to `MenuCourse` through the junction table `DiningPackageMenuCourse`, producing a detailed listing of every course within every package. For instance, the package `Regional Framework` (total price `25.36`, includes champagne cocktail `true`) is shown with its constituent courses. This view answers: "What courses are included in each dining package, and what are the package-level pricing and service charge details?"

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

The view `vw_dining_package_restaurant_outlet` joins `DiningPackage` to `RestaurantOutlet` on the `outletId` foreign key, linking each package to the physical location where it is offered. The package `Legacy Standard D` (total price `43.48`) is associated with the outlet `Extended Review` located in `integrated-city-34`. This view answers: "At which outlet is each dining package available, and what are the outlet's address and operating details?"

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

The view `vw_food_ingredient_menu_course` is the inverse of `vw_menu_course_food_ingredient`: it joins `FoodIngredient` to `MenuCourse` on `courseId`, presenting each ingredient alongside the courses that use it. The ingredient `Distributed Corridor A` (category `dairy`, origin `extended-origin-63`) is linked to the course `Seasonal Standard` (price `29.24`, vegetarian `true`). This view answers: "Which menu courses consume each ingredient, enabling allergen and sourcing traceability?"

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

The view `vw_restaurant_outlet_dining_package` joins `RestaurantOutlet` to `DiningPackage` on `packageId`, presenting each outlet alongside its default dining package. The outlet `Extended Review` (outlet ID `48753442`, postal code `9125611`) is paired with the package `Legacy Standard D` (total price `43.48`, service charge `4.95%`). This view answers: "What is the default dining package for each outlet, and how do the outlet's operating hours align with the package's pricing?"

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

The view `vw_restaurant_outlet_restaurant_staff` joins `RestaurantOutlet` to `RestaurantStaff` on `outletId`, mapping each outlet to its assigned staff member. The outlet `Extended Review` is linked to staff member `Jim Henson` (role `waiter`, shift `2024-11-04T22:30:00` to `2023-06-07T05:51:00`, does not receive service charge share). This view answers: "Which staff member is assigned to each outlet, and what are their role and shift details?"

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

The view `vw_restaurant_staff_restaurant_outlet` is the inverse of the previous view: it joins `RestaurantStaff` to `RestaurantOutlet` on `outletId`, presenting each staff member alongside their assigned outlet. The staff member `Purnima Medical` (role `runner`, receives service charge share `true`) is associated with the outlet `Pilot Initiative A` (outlet ID `2618568`, city `seasonal-city-35`). This view answers: "At which outlet does each staff member work, and what are the outlet's location details?"

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

The view `vw_restaurant_staff_menu_course` joins `RestaurantStaff` to `MenuCourse` on `courseId`, linking staff members to the menu courses they are associated with. The staff member `Deanna Turner` (role `chef`, shift `2022-09-26T12:04:00` to `2025-04-02T19:25:00`) is linked to the course `Seasonal Standard` (price `29.24`, vegetarian `true`). This view answers: "Which menu courses are associated with each staff member, enabling role-based menu assignment?"

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

The view `vw_service_charge_record_dining_package` joins `ServiceChargeRecord` to `DiningPackage` on `packageId`, connecting each service charge transaction to its originating package. The record with ID `10449530` (transaction date `2023-02-25T01:39:00`, total charge `10,296`, percentage `15.70`, payment method `cash`, deducted by `Council Of The Great City Schools`) is linked to the package `Legacy Standard D` (total price `43.48`, service charge `4.95%`). This view answers: "Which dining package generated each service charge transaction, and what were the financial terms?"

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

The view `vw_service_charge_record_restaurant_staff` joins `ServiceChargeRecord` to `RestaurantStaff` on `staffId`, linking each service charge transaction to the staff member on duty. The record `10445619` (transaction date `2024-07-09T08:56:00`, total charge `13,785`, percentage `17.40`, payment method `credit_card`, deducted by `Alaska Air Group Inc`) is associated with staff member `Purnima Medical` (role `runner`, receives service charge share `true`). This view answers: "Which staff member was on duty when each service charge was recorded, and did they participate in the charge share?"

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

### Synthesis

The relational schema for the restaurant dining domain achieves a clean separation of concerns: menu and package catalogues are stored independently of outlet logistics and financial records, with foreign keys and a junction table providing the connective tissue. The seven base tables — `MenuCourse`, `DiningPackage`, `FoodIngredient`, `RestaurantOutlet`, `RestaurantStaff`, `ServiceChargeRecord`, and `DiningPackageMenuCourse` — encode entity types and their cardinality-bounded relationships as columns, foreign keys, and a composite junction. The eleven views then materialise domain facts by joining these normalised tables, each view answering a distinct business question with a flat, query-ready result set. Representative values such as the course `Legacy Protocol D` priced at `12.87`, the package `Regional Framework` at `25.36` with champagne cocktail included, the ingredient `Pilot Assessment` of category `protein`, the outlet `Extended Review` in `integrated-city-34`, the staff member `Jim Henson` as `waiter`, and the service charge record `10449530` for `10,296` at `15.70%` illustrate how the abstract schema maps to concrete domain data. This architecture supports both operational queries against the normalised base tables and analytical reporting through the denormalised views.

## Data appendix

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
