## Dining Operations and Service Architecture

A modern dining establishment manages a complex web of interrelated records: menu courses are assembled from ingredients, bundled into dining packages, paired with beverages, and priced with service charges that flow to staff roles. Every transaction traces through this network of identifiers, and the operational integrity of the restaurant depends on maintaining consistent relationships across all of them. The following sections describe the core records, their attributes, and the joined views that answer practical questions about what is served, how it is priced, and who benefits from the revenue.

### Menu Courses

The menu is the central artifact of the dining operation. Each course carries a unique identifier, a human-readable name, and a description that communicates its character to guests. Boolean flags indicate whether a course is vegetarian or vegan, while a course_type column classifies it as Soup, Starter, Main, or Dessert. Every course is linked to a dining package and a primary food ingredient, establishing the two most important relationships in the system.

**Table `menu_courses`**

| id | course_identifier | course_name | course_description | is_vegetarian | is_vegan | course_type | dining_package_id | food_ingredient_id |
|---|---|---|---|---|---|---|---|---|
| 100 | COU-2154 | Legacy Protocol D | Integrated Framework A | true | false | Soup | 1 | 1 |
| 101 | COU-2158 | Regional Programme | Extended Protocol | false | true | Starter | 2 | 2 |
| 102 | COU-2162 | Seasonal Standard | Pilot Programme | true | false | Main | 3 | 3 |
| 103 | COU-2166 | Integrated Framework A | Baseline Standard D | false | true | Dessert | 4 | 4 |

Consider the first course, Legacy Protocol D (COU-2154). It is classified as a Soup, marked vegetarian but not vegan, and belongs to dining package 1. Its primary ingredient is identified by food_ingredient_id 1. The second course, Regional Programme, is a Starter that is vegan but not vegetarian, assigned to package 2 with ingredient 2. The third course, Seasonal Standard, is a Main dish that is vegetarian and sits in package 3 with ingredient 3. The fourth, Integrated Framework A, is a Dessert that is vegan and linked to package 4 with ingredient 4. These four courses form the backbone of the menu, each anchored to a specific package and ingredient.

### Dining Packages

Dining packages aggregate courses into sellable offerings. Each package has an identifier, a name, a total price, and a course count that indicates how many courses it contains. The includes_beverage flag signals whether the package comes with a drink, and the package_status column tracks availability — values such as Available, Unavailable, or Seasonal. A beverage_id ties the package to a specific beverage record.

**Table `dining_packages`**

| dining_package_id | package_identifier | package_name | total_price | course_count | includes_beverage | package_status | beverage_id |
|---|---|---|---|---|---|---|---|
| 1 | PAC-2606 | Legacy Standard D | 43.48 | 12 | true | Available | 100 |
| 2 | PAC-2611 | Regional Framework | 25.36 | 7 | false | Unavailable | 101 |
| 3 | PAC-2616 | Seasonal Protocol | 16.11 | 12 | true | Seasonal | 102 |
| 4 | PAC-2621 | Integrated Programme A | 14.31 | 13 | false | Available | 103 |

Legacy Standard D (PAC-2606) is priced at 43.48, contains 12 courses, includes a beverage, and is currently Available. Its associated beverage is BEV-2236. Regional Framework (PAC-2611) costs 25.36, has 7 courses, does not include a beverage, and is marked Unavailable. Seasonal Protocol (PAC-2616) is priced at 16.11, contains 12 courses, includes a beverage, and carries the Seasonal status. Integrated Programme A (PAC-2621) is the least expensive at 14.31, has 13 courses, excludes beverages, and is Available. The pricing and availability data allow the front-of-house team to present accurate options to guests.

### Beverages

Beverages are tracked as distinct records with their own identifiers, names, and types. The beverage_type column distinguishes between Cocktail, Wine, Beer, and Non-Alcoholic options. Serving temperature and alcohol_content provide operational details for preparation and compliance. Each beverage links to a menu course and a dining package, creating a bidirectional bridge between the drink list and the food offerings. Timestamps record when each beverage record was created and last updated.

**Table `beverages`**

| beverage_id | beverage_identifier | beverage_name | beverage_type | serving_temperature | alcohol_content | menu_course_id | dining_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | BEV-2236 | Compact Initiative | Cocktail | Chilled | 7.70 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | BEV-2237 | Legacy Model | Wine | Room Temperature | 10.40 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | BEV-2238 | Regional Cluster A | Beer | Warm | 13.10 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | BEV-2239 | Seasonal Review | Non-Alcoholic | Chilled | 15.80 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Compact Initiative (BEV-2236) is a Cocktail served Chilled with an alcohol content of 7.70. It is associated with menu course 100 and dining package 1, and was created on 2025-01-01. Legacy Model (BEV-2237) is a Wine served at Room Temperature with alcohol content 10.40, linked to course 101 and package 2, created on 2025-02-06. Regional Cluster A (BEV-2238) is a Beer served Warm with alcohol content 13.10, tied to course 102 and package 3, created on 2025-03-11. Seasonal Review (BEV-2239) is Non-Alcoholic, served Chilled, with alcohol content 15.80, connected to course 103 and package 4, created on 2025-04-16. The temperature and alcohol data are essential for kitchen and bar operations.

### Food Ingredients

Every menu course draws from at least one food ingredient. The food_ingredients table records the ingredient's name, category (such as Protein, Vegetable, Dairy, or Grain), an allergen_flag indicating whether the ingredient contains allergens, an origin_region that traces its provenance, and an is_organic flag. The menu_course_id column anchors the ingredient to the course that uses it.

**Table `food_ingredients`**

| id | ingredient_identifier | ingredient_name | ingredient_category | allergen_flag | origin_region | is_organic | menu_course_id |
|---|---|---|---|---|---|---|---|
| 1 | ING-2304 | Pilot Assessment | Protein | false | baseline-origin-61 | false | 100 |
| 2 | ING-2310 | Baseline Survey | Vegetable | true | pilot-origin-62 | true | 101 |
| 3 | ING-2316 | Distributed Corridor A | Dairy | false | extended-origin-63 | false | 102 |
| 4 | ING-2322 | Adaptive Series | Grain | true | integrated-origin-64 | true | 103 |

Pilot Assessment (ING-2304) is a Protein with no allergen flag, originating from baseline-origin-61, and is not organic. It is used in menu course 100. Baseline Survey (ING-2310) is a Vegetable with the allergen flag set to true, from pilot-origin-62, and is organic. It supports course 101. Distributed Corridor A (ING-2316) is a Dairy product with no allergen flag, from extended-origin-63, and is not organic; it feeds into course 102. Adaptive Series (ING-2322) is a Grain with the allergen flag true, from integrated-origin-64, and is organic, serving course 103. The allergen and organic data are critical for guest safety and dietary compliance.

### Service Charges

Service charges represent the financial layer of the dining operation. Each charge record specifies a charge_percentage, a charge_amount, and a distribution_method — either Shared or Direct. The is_mandatory flag indicates whether the charge is automatically applied. A calculation_date records when the charge was computed, and the dining_package_id links the charge to the package it applies to. Timestamps track creation and updates.

**Table `service_charges`**

| service_charge_id | charge_percentage | charge_amount | distribution_method | is_mandatory | calculation_date | dining_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 15.70 | 1,687 | Shared | true | 2025-04-11T15:45:00 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 17.40 | 16,447 | Direct | false | 2022-09-22T22:02:00 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 19.10 | 9.91 | Shared | true | 2023-02-06T05:19:00 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 20.80 | 0.04 | Direct | false | 2024-07-17T12:36:00 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The first service charge applies a 15.70 percent rate with an amount of 1,687, distributed via Shared method, and is mandatory. It is calculated on 2025-04-11 and applies to dining package 1. The second charge carries a 17.40 percent rate, an amount of 16,447, uses Direct distribution, is not mandatory, and was calculated on 2022-09-22 for package 2. The third charge has a 19.10 percent rate, an amount of 9.91, is Shared and mandatory, calculated on 2023-02-06 for package 3. The fourth charge applies 20.80 percent with an amount of 0.04, uses Direct distribution, is not mandatory, and was calculated on 2024-07-17 for package 4. The distribution method determines how revenue flows to staff.

### Staff Roles

Staff roles define the human element of the operation. Each role has an identifier, a name, and a department — either Front of House or Back of House. Boolean flags indicate whether the role receives service charges and whether it receives direct tips. The service_charge_id links the role to a specific charge record, and the menu_course_id ties the role to a menu course, indicating which courses the staff member supports.

**Table `staff_roles`**

| staff_role_id | role_identifier | role_name | department | receives_service_charge | receives_direct_tips | service_charge_id | menu_course_id |
|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Terry Pratchett | Front of House | true | true | 1 | 100 |
| 2 | ROL-2016 | Theodore Mcgrath | Back of House | false | false | 2 | 101 |
| 3 | ROL-2020 | Janice Johnston | Front of House | true | true | 3 | 102 |
| 4 | ROL-2024 | Theodore Mcgrath | Back of House | false | false | 4 | 103 |

Terry Pratchett (ROL-2012) works in Front of House, receives both service charges and direct tips, is linked to service charge 1, and supports menu course 100. Theodore Mcgrath (ROL-2016) is in Back of House, receives neither service charges nor direct tips, connects to service charge 2, and supports course 101. Janice Johnston (ROL-2020) is Front of House, receives both service charges and tips, links to service charge 3, and supports course 102. Theodore Mcgrath (ROL-2024) appears again in Back of House, receives neither charge nor tips, connects to service charge 4, and supports course 103. The dual receipt flags determine compensation structure.

### Package-Course and Charge-Role Associations

The packages_courses table records the many-to-many relationship between dining packages and menu courses, specifying which courses belong to which packages. The charges_roles table performs the same function for service charges and staff roles, documenting which charges flow to which roles. These association tables resolve the cardinality that the base tables alone cannot express.

**Table `packages_courses`**

| dining_package_id | menu_course_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `charges_roles`**

| service_charge_id | staff_role_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### Joined Views: Menu and Packages

The view vw_menu_course_dining_package joins menu courses with their parent dining packages, answering the question: for each course, what package does it belong to, and what are the package's pricing and availability details?

**View `vw_menu_course_dining_package`**

```sql
CREATE VIEW vw_menu_course_dining_package AS
SELECT a.id, a.course_identifier, a.course_name, a.course_description, b.dining_package_id AS package_dining_package_id, b.package_identifier AS package_package_identifier, b.package_name AS package_package_name
FROM menu_courses a JOIN dining_packages b ON a.dining_package_id = b.dining_package_id;
```

| id | course_identifier | course_name | course_description | package_dining_package_id | package_package_identifier | package_package_name |
|---|---|---|---|---|---|---|
| 100 | COU-2154 | Legacy Protocol D | Integrated Framework A | 1 | PAC-2606 | Legacy Standard D |
| 101 | COU-2158 | Regional Programme | Extended Protocol | 2 | PAC-2611 | Regional Framework |
| 102 | COU-2162 | Seasonal Standard | Pilot Programme | 3 | PAC-2616 | Seasonal Protocol |
| 103 | COU-2166 | Integrated Framework A | Baseline Standard D | 4 | PAC-2621 | Integrated Programme A |

Reading the first row of this view, Legacy Protocol D (COU-2154) is a vegetarian Soup in package Legacy Standard D (PAC-2606), which is priced at 43.48, contains 12 courses, includes a beverage, and is Available. The second row shows Regional Programme as a vegan Starter in Regional Framework (PAC-2611), priced at 25.36 with 7 courses, no beverage, and Unavailable status. This view is the primary reference for servers presenting course-level information to guests.

### Joined Views: Menu and Ingredients

The view vw_menu_course_food_ingredient connects each menu course to its primary food ingredient, revealing the ingredient's category, allergen status, origin, and organic status alongside the course details.

**View `vw_menu_course_food_ingredient`**

```sql
CREATE VIEW vw_menu_course_food_ingredient AS
SELECT a.id, a.course_identifier, a.course_name, a.course_description, b.id AS ingredient_id, b.ingredient_identifier AS ingredient_ingredient_identifier, b.ingredient_name AS ingredient_ingredient_name
FROM menu_courses a JOIN food_ingredients b ON a.food_ingredient_id = b.id;
```

| id | course_identifier | course_name | course_description | ingredient_id | ingredient_ingredient_identifier | ingredient_ingredient_name |
|---|---|---|---|---|---|---|
| 100 | COU-2154 | Legacy Protocol D | Integrated Framework A | 1 | ING-2304 | Pilot Assessment |
| 101 | COU-2158 | Regional Programme | Extended Protocol | 2 | ING-2310 | Baseline Survey |
| 102 | COU-2162 | Seasonal Standard | Pilot Programme | 3 | ING-2316 | Distributed Corridor A |
| 103 | COU-2166 | Integrated Framework A | Baseline Standard D | 4 | ING-2322 | Adaptive Series |

The first row pairs Legacy Protocol D with Pilot Assessment, a non-allergenic Protein from baseline-origin-61 that is not organic. The second row links Regional Programme to Baseline Survey, a Vegetable with allergens from pilot-origin-62 that is organic. The third row connects Seasonal Standard to Distributed Corridor A, a non-allergenic Dairy from extended-origin-63 that is not organic. The fourth row ties Integrated Framework A to Adaptive Series, a Grain with allergens from integrated-origin-64 that is organic. This view supports allergen disclosure and sourcing transparency.

### Joined Views: Package and Course Detail

The view vw_dining_package_menu_course_detail provides the inverse perspective: for each dining package, it lists the courses it contains along with their course-level attributes.

**View `vw_dining_package_menu_course_detail`**

```sql
CREATE VIEW vw_dining_package_menu_course_detail AS
SELECT a.dining_package_id, a.package_identifier, a.package_name, b.id AS course_id, b.course_identifier AS course_course_identifier, b.course_name AS course_course_name
FROM dining_packages a
  JOIN packages_courses j ON j.dining_package_id = a.dining_package_id
  JOIN menu_courses b ON b.id = j.menu_course_id;
```

| dining_package_id | package_identifier | package_name | course_id | course_course_identifier | course_course_name |
|---|---|---|---|---|---|
| 1 | PAC-2606 | Legacy Standard D | 100 | COU-2154 | Legacy Protocol D |
| 1 | PAC-2606 | Legacy Standard D | 101 | COU-2158 | Regional Programme |
| 2 | PAC-2611 | Regional Framework | 101 | COU-2158 | Regional Programme |
| 2 | PAC-2611 | Regional Framework | 102 | COU-2162 | Seasonal Standard |
| 3 | PAC-2616 | Seasonal Protocol | 102 | COU-2162 | Seasonal Standard |
| 3 | PAC-2616 | Seasonal Protocol | 103 | COU-2166 | Integrated Framework A |
| 4 | PAC-2621 | Integrated Programme A | 103 | COU-2166 | Integrated Framework A |
| 4 | PAC-2621 | Integrated Programme A | 100 | COU-2154 | Legacy Protocol D |

This view allows the operations team to verify that each package's course_count matches the actual number of courses linked to it, and to confirm that the courses within a package are consistent with the package's dietary claims.

### Joined Views: Package and Beverage

The view vw_dining_package_beverage joins dining packages with their associated beverages, answering which drink accompanies which package.

**View `vw_dining_package_beverage`**

```sql
CREATE VIEW vw_dining_package_beverage AS
SELECT a.dining_package_id, a.package_identifier, a.package_name, a.total_price, b.beverage_id AS beverage_beverage_id, b.beverage_identifier AS beverage_beverage_identifier, b.beverage_name AS beverage_beverage_name
FROM dining_packages a JOIN beverages b ON a.beverage_id = b.beverage_id;
```

| dining_package_id | package_identifier | package_name | total_price | beverage_beverage_id | beverage_beverage_identifier | beverage_beverage_name |
|---|---|---|---|---|---|---|
| 1 | PAC-2606 | Legacy Standard D | 43.48 | 100 | BEV-2236 | Compact Initiative |
| 2 | PAC-2611 | Regional Framework | 25.36 | 101 | BEV-2237 | Legacy Model |
| 3 | PAC-2616 | Seasonal Protocol | 16.11 | 102 | BEV-2238 | Regional Cluster A |
| 4 | PAC-2621 | Integrated Programme A | 14.31 | 103 | BEV-2239 | Seasonal Review |

The first row shows Legacy Standard D paired with Compact Initiative, a Chilled Cocktail with 7.70 alcohol content. The second row links Regional Framework to Legacy Model, a Room Temperature Wine at 10.40 alcohol. The third row connects Seasonal Protocol to Regional Cluster A, a Warm Beer at 13.10 alcohol. The fourth row ties Integrated Programme A to Seasonal Review, a Chilled Non-Alcoholic beverage at 15.80 alcohol. This view is essential for beverage inventory and pairing accuracy.

### Joined Views: Beverage and Course

The view vw_beverage_menu_course connects beverages back to their associated menu courses, providing a cross-reference between the drink list and the food menu.

**View `vw_beverage_menu_course`**

```sql
CREATE VIEW vw_beverage_menu_course AS
SELECT a.beverage_id, a.beverage_identifier, a.beverage_name, a.beverage_type, b.id AS course_id, b.course_identifier AS course_course_identifier, b.course_name AS course_course_name
FROM beverages a JOIN menu_courses b ON a.menu_course_id = b.id;
```

| beverage_id | beverage_identifier | beverage_name | beverage_type | course_id | course_course_identifier | course_course_name |
|---|---|---|---|---|---|---|
| 100 | BEV-2236 | Compact Initiative | Cocktail | 100 | COU-2154 | Legacy Protocol D |
| 101 | BEV-2237 | Legacy Model | Wine | 101 | COU-2158 | Regional Programme |
| 102 | BEV-2238 | Regional Cluster A | Beer | 102 | COU-2162 | Seasonal Standard |
| 103 | BEV-2239 | Seasonal Review | Non-Alcoholic | 103 | COU-2166 | Integrated Framework A |

Compact Initiative (BEV-2236) is linked to Legacy Protocol D (COU-2154), a vegetarian Soup. Legacy Model (BEV-2237) pairs with Regional Programme (COU-2158), a vegan Starter. Regional Cluster A (BEV-2238) accompanies Seasonal Standard (COU-2162), a vegetarian Main. Seasonal Review (BEV-2239) is paired with Integrated Framework A (COU-2166), a vegan Dessert. This view supports sommelier-style pairing recommendations.

### Joined Views: Beverage and Package

The view vw_beverage_dining_package presents beverages alongside their parent dining packages, combining beverage attributes with package pricing and status.

**View `vw_beverage_dining_package`**

```sql
CREATE VIEW vw_beverage_dining_package AS
SELECT a.beverage_id, a.beverage_identifier, a.beverage_name, a.beverage_type, b.dining_package_id AS package_dining_package_id, b.package_identifier AS package_package_identifier, b.package_name AS package_package_name
FROM beverages a JOIN dining_packages b ON a.dining_package_id = b.dining_package_id;
```

| beverage_id | beverage_identifier | beverage_name | beverage_type | package_dining_package_id | package_package_identifier | package_package_name |
|---|---|---|---|---|---|---|
| 100 | BEV-2236 | Compact Initiative | Cocktail | 1 | PAC-2606 | Legacy Standard D |
| 101 | BEV-2237 | Legacy Model | Wine | 2 | PAC-2611 | Regional Framework |
| 102 | BEV-2238 | Regional Cluster A | Beer | 3 | PAC-2616 | Seasonal Protocol |
| 103 | BEV-2239 | Seasonal Review | Non-Alcoholic | 4 | PAC-2621 | Integrated Programme A |

The first row shows Compact Initiative within Legacy Standard D, priced at 43.48 and Available. The second row places Legacy Model in Regional Framework at 25.36 and Unavailable. The third row connects Regional Cluster A to Seasonal Protocol at 16.11 with Seasonal status. The fourth row ties Seasonal Review to Integrated Programme A at 14.31 and Available. This view is useful for promotional bundling and package customization.

### Joined Views: Ingredient and Course

The view vw_food_ingredient_menu_course presents food ingredients alongside their associated menu courses, combining ingredient provenance and dietary flags with course-level metadata.

**View `vw_food_ingredient_menu_course`**

```sql
CREATE VIEW vw_food_ingredient_menu_course AS
SELECT a.id, a.ingredient_identifier, a.ingredient_name, a.ingredient_category, b.id AS course_id, b.course_identifier AS course_course_identifier, b.course_name AS course_course_name
FROM food_ingredients a JOIN menu_courses b ON a.menu_course_id = b.id;
```

| id | ingredient_identifier | ingredient_name | ingredient_category | course_id | course_course_identifier | course_course_name |
|---|---|---|---|---|---|---|
| 1 | ING-2304 | Pilot Assessment | Protein | 100 | COU-2154 | Legacy Protocol D |
| 2 | ING-2310 | Baseline Survey | Vegetable | 101 | COU-2158 | Regional Programme |
| 3 | ING-2316 | Distributed Corridor A | Dairy | 102 | COU-2162 | Seasonal Standard |
| 4 | ING-2322 | Adaptive Series | Grain | 103 | COU-2166 | Integrated Framework A |

Pilot Assessment (ING-2304) is a non-organic Protein from baseline-origin-61 with no allergen flag, used in Legacy Protocol D. Baseline Survey (ING-2310) is an organic Vegetable from pilot-origin-62 with allergens, used in Regional Programme. Distributed Corridor A (ING-2316) is a non-organic Dairy from extended-origin-63 with no allergens, used in Seasonal Standard. Adaptive Series (ING-2322) is an organic Grain from integrated-origin-64 with allergens, used in Integrated Framework A. This view supports supply chain audits and allergen reporting.

### Joined Views: Service Charge and Package

The view vw_service_charge_dining_package joins service charges with their associated dining packages, revealing how charges are applied across packages.

**View `vw_service_charge_dining_package`**

```sql
CREATE VIEW vw_service_charge_dining_package AS
SELECT a.service_charge_id, a.charge_percentage, a.charge_amount, a.distribution_method, b.dining_package_id AS package_dining_package_id, b.package_identifier AS package_package_identifier, b.package_name AS package_package_name
FROM service_charges a JOIN dining_packages b ON a.dining_package_id = b.dining_package_id;
```

| service_charge_id | charge_percentage | charge_amount | distribution_method | package_dining_package_id | package_package_identifier | package_package_name |
|---|---|---|---|---|---|---|
| 1 | 15.70 | 1,687 | Shared | 1 | PAC-2606 | Legacy Standard D |
| 2 | 17.40 | 16,447 | Direct | 2 | PAC-2611 | Regional Framework |
| 3 | 19.10 | 9.91 | Shared | 3 | PAC-2616 | Seasonal Protocol |
| 4 | 20.80 | 0.04 | Direct | 4 | PAC-2621 | Integrated Programme A |

The first row shows a 15.70 percent charge of 1,687 applied to Legacy Standard D via Shared distribution, mandatory, calculated on 2025-04-11. The second row links a 17.40 percent charge of 16,447 to Regional Framework via Direct distribution, not mandatory, calculated on 2022-09-22. The third row connects a 19.10 percent charge of 9.91 to Seasonal Protocol via Shared distribution, mandatory, calculated on 2023-02-06. The fourth row ties a 20.80 percent charge of 0.04 to Integrated Programme A via Direct distribution, not mandatory, calculated on 2024-07-17. This view is critical for financial reconciliation.

### Joined Views: Service Charge and Staff Role

The view vw_service_charge_staff_role_detail joins service charges with the staff roles that receive them, showing which roles benefit from which charges and under what conditions.

**View `vw_service_charge_staff_role_detail`**

```sql
CREATE VIEW vw_service_charge_staff_role_detail AS
SELECT a.service_charge_id, a.charge_percentage, a.charge_amount, b.staff_role_id AS role_staff_role_id, b.role_identifier AS role_role_identifier, b.role_name AS role_role_name
FROM service_charges a
  JOIN charges_roles j ON j.service_charge_id = a.service_charge_id
  JOIN staff_roles b ON b.staff_role_id = j.staff_role_id;
```

| service_charge_id | charge_percentage | charge_amount | role_staff_role_id | role_role_identifier | role_role_name |
|---|---|---|---|---|---|
| 1 | 15.70 | 1,687 | 1 | ROL-2012 | Terry Pratchett |
| 1 | 15.70 | 1,687 | 2 | ROL-2016 | Theodore Mcgrath |
| 2 | 17.40 | 16,447 | 2 | ROL-2016 | Theodore Mcgrath |
| 2 | 17.40 | 16,447 | 3 | ROL-2020 | Janice Johnston |
| 3 | 19.10 | 9.91 | 3 | ROL-2020 | Janice Johnston |
| 3 | 19.10 | 9.91 | 4 | ROL-2024 | Theodore Mcgrath |
| 4 | 20.80 | 0.04 | 4 | ROL-2024 | Theodore Mcgrath |
| 4 | 20.80 | 0.04 | 1 | ROL-2012 | Terry Pratchett |

The first row shows service charge 1 (15.70 percent, Shared, mandatory) flowing to Terry Pratchett (ROL-2012) in Front of House, who receives both service charges and direct tips and supports course 100. The second row links charge 2 (17.40 percent, Direct, not mandatory) to Theodore Mcgrath (ROL-2016) in Back of House, who receives neither charge nor tips and supports course 101. The third row connects charge 3 (19.10 percent, Shared, mandatory) to Janice Johnston (ROL-2020) in Front of House, who receives both and supports course 102. The fourth row ties charge 4 (20.80 percent, Direct, not mandatory) to Theodore Mcgrath (ROL-2024) in Back of House, who receives neither and supports course 103. This view clarifies compensation pathways.

### Joined Views: Staff Role and Service Charge

The view vw_staff_role_service_charge presents staff roles alongside their associated service charges, providing a role-centric perspective on compensation.

**View `vw_staff_role_service_charge`**

```sql
CREATE VIEW vw_staff_role_service_charge AS
SELECT a.staff_role_id, a.role_identifier, a.role_name, a.department, b.service_charge_id AS charge_service_charge_id, b.charge_percentage AS charge_charge_percentage, b.charge_amount AS charge_charge_amount
FROM staff_roles a JOIN service_charges b ON a.service_charge_id = b.service_charge_id;
```

| staff_role_id | role_identifier | role_name | department | charge_service_charge_id | charge_charge_percentage | charge_charge_amount |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Terry Pratchett | Front of House | 1 | 15.70 | 1,687 |
| 2 | ROL-2016 | Theodore Mcgrath | Back of House | 2 | 17.40 | 16,447 |
| 3 | ROL-2020 | Janice Johnston | Front of House | 3 | 19.10 | 9.91 |
| 4 | ROL-2024 | Theodore Mcgrath | Back of House | 4 | 20.80 | 0.04 |

Terry Pratchett (ROL-2012) in Front of House receives service charge 1, which is a 15.70 percent Shared mandatory charge. Theodore Mcgrath (ROL-2016) in Back of House receives service charge 2, a 17.40 percent Direct non-mandatory charge. Janice Johnston (ROL-2020) in Front of House receives service charge 3, a 19.10 percent Shared mandatory charge. Theodore Mcgrath (ROL-2024) in Back of House receives service charge 4, a 20.80 percent Direct non-mandatory charge. This view supports payroll processing and role-based reporting.

### Joined Views: Staff Role and Menu Course

The view vw_staff_role_menu_course connects staff roles to the menu courses they support, combining role department and compensation flags with course-level details.

**View `vw_staff_role_menu_course`**

```sql
CREATE VIEW vw_staff_role_menu_course AS
SELECT a.staff_role_id, a.role_identifier, a.role_name, a.department, b.id AS course_id, b.course_identifier AS course_course_identifier, b.course_name AS course_course_name
FROM staff_roles a JOIN menu_courses b ON a.menu_course_id = b.id;
```

| staff_role_id | role_identifier | role_name | department | course_id | course_course_identifier | course_course_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Terry Pratchett | Front of House | 100 | COU-2154 | Legacy Protocol D |
| 2 | ROL-2016 | Theodore Mcgrath | Back of House | 101 | COU-2158 | Regional Programme |
| 3 | ROL-2020 | Janice Johnston | Front of House | 102 | COU-2162 | Seasonal Standard |
| 4 | ROL-2024 | Theodore Mcgrath | Back of House | 103 | COU-2166 | Integrated Framework A |

The first row shows Terry Pratchett (ROL-2012) in Front of House supporting Legacy Protocol D (COU-2154), a vegetarian Soup in package 1. The second row links Theodore Mcgrath (ROL-2016) in Back of House to Regional Programme (COU-2158), a vegan Starter in package 2. The third row connects Janice Johnston (ROL-2020) in Front of House to Seasonal Standard (COU-2162), a vegetarian Main in package 3. The fourth row ties Theodore Mcgrath (ROL-2024) in Back of House to Integrated Framework A (COU-2166), a vegan Dessert in package 4. This view is essential for scheduling and course-level accountability.

### Synthesis

The dining operation is a tightly coupled system where every course, package, beverage, ingredient, charge, and role participates in a network of relationships. Menu courses anchor the food offering and link to packages and ingredients. Dining packages aggregate courses and beverages into sellable units with defined pricing and availability. Beverages bridge the drink list to both courses and packages. Food ingredients provide the provenance and safety data that courses depend on. Service charges capture the financial layer, and staff roles receive compensation through the charge distribution mechanism. The joined views translate these relationships into actionable information for servers, managers, and finance teams. Maintaining the integrity of these connections — ensuring that every course has a package, every package has a beverage, every charge has a role, and every ingredient has a course — is the foundational discipline of the operation.