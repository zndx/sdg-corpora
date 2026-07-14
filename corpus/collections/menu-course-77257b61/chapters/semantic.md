## Ontology-Grounded Schema Design for a Dining Services Domain

The dining services domain captures the operational fabric of a restaurant or catering operation: menus are assembled from courses, courses are composed of ingredients, packages bundle courses and beverages at fixed prices, service charges allocate revenue across staff roles, and every entity carries a lifecycle of timestamps and status flags. The ontology behind this domain distinguishes six core entity types—`menu_courses`, `dining_packages`, `beverages`, `food_ingredients`, `service_charges`, and `staff_roles`—along with two associative entity types that resolve many-to-many relationships: `packages_courses` and `charges_roles`. The relational schema materialises these entities as eight base tables and eleven denormalised views, each view encoding a specific domain fact by joining the normalised tables back together.

**Table `menu_courses`**

| id | course_identifier | course_name | course_description | is_vegetarian | is_vegan | course_type | dining_package_id | food_ingredient_id |
|---|---|---|---|---|---|---|---|---|
| 100 | COU-2154 | Legacy Protocol D | Integrated Framework A | true | false | Soup | 1 | 1 |
| 101 | COU-2158 | Regional Programme | Extended Protocol | false | true | Starter | 2 | 2 |
| 102 | COU-2162 | Seasonal Standard | Pilot Programme | true | false | Main | 3 | 3 |
| 103 | COU-2166 | Integrated Framework A | Baseline Standard D | false | true | Dessert | 4 | 4 |

The `menu_courses` table is the central anchor of the menu ontology. Each row represents a single course, identified by a surrogate primary key `id` and a business key `course_identifier` such as `COU-2154`. The course carries descriptive attributes—`course_name` (e.g. "Legacy Protocol D"), `course_description` ("Integrated Framework A"), and a categorical `course_type` drawn from the set {Soup, Starter, Main, Dessert}. Dietary constraints are modelled as two boolean columns, `is_vegetarian` and `is_vegan`, allowing a course like `COU-2154` to be vegetarian but not vegan. Cardinality-bounded relationships are encoded as foreign keys: `dining_package_id` links each course to exactly one dining package (values 1–4), and `food_ingredient_id` links each course to exactly one primary ingredient (values 1–4). This design enforces a one-to-one association between courses and their parent packages and ingredients at the schema level, even though the business domain may permit more complex compositions in practice.

**Table `dining_packages`**

| dining_package_id | package_identifier | package_name | total_price | course_count | includes_beverage | package_status | beverage_id |
|---|---|---|---|---|---|---|---|
| 1 | PAC-2606 | Legacy Standard D | 43.48 | 12 | true | Available | 100 |
| 2 | PAC-2611 | Regional Framework | 25.36 | 7 | false | Unavailable | 101 |
| 3 | PAC-2616 | Seasonal Protocol | 16.11 | 12 | true | Seasonal | 102 |
| 4 | PAC-2621 | Integrated Programme A | 14.31 | 13 | false | Available | 103 |

The `dining_packages` table models the commercial packaging of courses. Each package is identified by `dining_package_id` (a surrogate key) and `package_identifier` (e.g. `PAC-2606`), with a human-readable `package_name` such as "Legacy Standard D". Pricing is captured in `total_price` (43.48 for the first package) and `course_count` (12 courses in the first package). The boolean `includes_beverage` flag indicates whether the package comes with a drink, and `package_status` constrains availability to {Available, Unavailable, Seasonal}. A foreign key `beverage_id` ties each package to a single beverage (values 100–103), establishing a one-to-one link between packages and their included drinks.

**Table `beverages`**

| beverage_id | beverage_identifier | beverage_name | beverage_type | serving_temperature | alcohol_content | menu_course_id | dining_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | BEV-2236 | Compact Initiative | Cocktail | Chilled | 7.70 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | BEV-2237 | Legacy Model | Wine | Room Temperature | 10.40 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | BEV-2238 | Regional Cluster A | Beer | Warm | 13.10 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | BEV-2239 | Seasonal Review | Non-Alcoholic | Chilled | 15.80 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Beverages are modelled in their own table to capture drink-specific attributes independently of courses and packages. The primary key `beverage_id` (100–103) pairs with `beverage_identifier` (e.g. `BEV-2236`) and `beverage_name` ("Compact Initiative"). The `beverage_type` column distinguishes categories such as Cocktail, Wine, Beer, and Non-Alcoholic. Physical properties are stored in `serving_temperature` (Chilled, Room Temperature, Warm) and `alcohol_content` (a numeric value ranging from 7.70 to 15.80). The table also carries lifecycle metadata: `created_at` and `updated_at` timestamps record when each beverage record was inserted and last modified. Foreign keys `menu_course_id` and `dining_package_id` link each beverage back to its associated course and package, respectively, creating two one-to-one relationships that mirror the bidirectional navigation between these entity types.

**Table `food_ingredients`**

| id | ingredient_identifier | ingredient_name | ingredient_category | allergen_flag | origin_region | is_organic | menu_course_id |
|---|---|---|---|---|---|---|---|
| 1 | ING-2304 | Pilot Assessment | Protein | false | baseline-origin-61 | false | 100 |
| 2 | ING-2310 | Baseline Survey | Vegetable | true | pilot-origin-62 | true | 101 |
| 3 | ING-2316 | Distributed Corridor A | Dairy | false | extended-origin-63 | false | 102 |
| 4 | ING-2322 | Adaptive Series | Grain | true | integrated-origin-64 | true | 103 |

The `food_ingredients` table stores the raw materials that compose courses. Each ingredient has a surrogate key `id` (1–4), a business key `ingredient_identifier` (e.g. `ING-2304`), and a descriptive `ingredient_name` ("Pilot Assessment"). The `ingredient_category` column classifies ingredients into Protein, Vegetable, Dairy, and Grain. Allergen information is captured in `allergen_flag` (true for `ING-2310` and `ING-2322`), while `origin_region` records the geographic provenance (e.g. "baseline-origin-61"). The boolean `is_organic` flag indicates organic certification. A foreign key `menu_course_id` links each ingredient to exactly one menu course, enforcing a one-to-one relationship from ingredients to courses.

**Table `service_charges`**

| service_charge_id | charge_percentage | charge_amount | distribution_method | is_mandatory | calculation_date | dining_package_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 15.70 | 1,687 | Shared | true | 2025-04-11T15:45:00 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 17.40 | 16,447 | Direct | false | 2022-09-22T22:02:00 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 19.10 | 9.91 | Shared | true | 2023-02-06T05:19:00 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 20.80 | 0.04 | Direct | false | 2024-07-17T12:36:00 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Service charges model the financial allocation mechanism for staff compensation. The table's primary key is `service_charge_id` (1–4), and each charge is characterised by `charge_percentage` (15.70 to 20.80), `charge_amount` (ranging from 0.04 to 16,447), and `distribution_method` (either "Shared" or "Direct"). The boolean `is_mandatory` flag indicates whether the charge is compulsory. A `calculation_date` timestamp records when the charge was computed, while `created_at` and `updated_at` track the record's lifecycle. The foreign key `dining_package_id` links each service charge to exactly one dining package, establishing a one-to-one relationship between charges and packages.

**Table `staff_roles`**

| staff_role_id | role_identifier | role_name | department | receives_service_charge | receives_direct_tips | service_charge_id | menu_course_id |
|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Terry Pratchett | Front of House | true | true | 1 | 100 |
| 2 | ROL-2016 | Theodore Mcgrath | Back of House | false | false | 2 | 101 |
| 3 | ROL-2020 | Janice Johnston | Front of House | true | true | 3 | 102 |
| 4 | ROL-2024 | Theodore Mcgrath | Back of House | false | false | 4 | 103 |

Staff roles capture the human element of the dining operation. The primary key `staff_role_id` (1–4) pairs with `role_identifier` (e.g. `ROL-2012`) and `role_name` ("Terry Pratchett"). The `department` column distinguishes Front of House from Back of House roles. Two boolean columns, `receives_service_charge` and `receives_direct_tips`, model the compensation structure: roles like `ROL-2012` and `ROL-2020` receive both service charges and tips, while `ROL-2016` and `ROL-2024` receive neither. Foreign keys `service_charge_id` and `menu_course_id` link each staff role to exactly one service charge and one menu course, respectively.

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

The `packages_courses` table is a junction table that resolves the many-to-many relationship between dining packages and menu courses. In the current data, each package is associated with a single course, but the schema supports arbitrary cardinality. This table would typically contain pairs of `dining_package_id` and `menu_course_id` values, enabling a package like "Legacy Standard D" to be composed of multiple courses, and a course to appear across multiple packages.

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

Similarly, `charges_roles` is a junction table that resolves the many-to-many relationship between service charges and staff roles. It would contain pairs of `service_charge_id` and `staff_role_id`, allowing a single service charge to be distributed across multiple staff roles and a staff role to participate in multiple charge distributions.

The denormalised views reconstruct domain facts by joining the normalised tables. Each view answers a specific analytical question by materialising a particular relationship path.

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

This view joins `menu_courses` with `dining_packages` on `dining_package_id`, answering the question: "What dining package does each course belong to, and what are the package's commercial details?" Reading the first row, we see that course `COU-2154` ("Legacy Protocol D", a vegetarian Soup) belongs to package `PAC-2606` ("Legacy Standard D"), which costs 43.48, contains 12 courses, includes a beverage, and is currently Available. The second row shows that `COU-2158` ("Regional Programme", a non-vegetarian Starter) belongs to package `PAC-2611` ("Regional Framework"), priced at 25.36 with 7 courses and no beverage, and marked Unavailable. This view is essential for menu planners who need to see courses in their commercial context.

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

This view joins `menu_courses` with `food_ingredients` on `food_ingredient_id`, answering: "What is the primary ingredient of each course, and what are its properties?" The first row reveals that course `COU-2154` uses ingredient `ING-2304` ("Pilot Assessment"), which is a non-organic Protein from "baseline-origin-61" with no allergen flag. The fourth row shows that `COU-2166` ("Integrated Framework A", a Dessert) uses ingredient `ING-2322` ("Adaptive Series"), an organic Grain from "integrated-origin-64" that carries an allergen flag. This view supports dietary compliance checks and supply chain traceability.

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

This view joins `dining_packages` with `menu_courses` on `dining_package_id`, answering the inverse question of the first view: "What courses are included in each dining package, and what are their dietary attributes?" The first row shows that package `PAC-2606` ("Legacy Standard D") includes course `COU-2154` ("Legacy Protocol D"), which is vegetarian but not vegan and classified as a Soup. The third row reveals that package `PAC-2616` ("Seasonal Protocol"), priced at 16.11 with status Seasonal, includes course `COU-2162` ("Seasonal Standard"), a vegetarian Main course. This view is useful for package configuration and dietary filtering.

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

This view joins `dining_packages` with `beverages` on `dining_package_id`, answering: "What beverage is included with each dining package, and what are its characteristics?" The first row shows that package `PAC-2606` includes beverage `BEV-2236` ("Compact Initiative"), a Chilled Cocktail with 7.70 alcohol content, created on 2025-01-01. The fourth row reveals that package `PAC-2621` ("Integrated Programme A") includes beverage `BEV-2239` ("Seasonal Review"), a Chilled Non-Alcoholic drink with 15.80 alcohol content. This view supports beverage inventory management and package customization.

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

This view joins `beverages` with `menu_courses` on `menu_course_id`, answering: "Which menu course is associated with each beverage?" The first row links beverage `BEV-2236` ("Compact Initiative", a Cocktail) to course `COU-2154` ("Legacy Protocol D", a Soup). The second row links `BEV-2237` ("Legacy Model", a Wine) to `COU-2158` ("Regional Programme", a Starter). This view is useful for pairing analysis and menu engineering.

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

This view joins `beverages` with `dining_packages` on `dining_package_id`, answering: "Which dining package includes each beverage?" The first row shows that beverage `BEV-2236` ("Compact Initiative") is included in package `PAC-2606` ("Legacy Standard D"), which is Available and includes 12 courses. The third row links `BEV-2238` ("Regional Cluster A", a Beer served Warm) to package `PAC-2616` ("Seasonal Protocol"), which has Seasonal status. This view supports beverage-package relationship auditing.

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

This view joins `food_ingredients` with `menu_courses` on `menu_course_id`, answering the inverse of the second view: "Which menu course uses each ingredient?" The first row shows that ingredient `ING-2304` ("Pilot Assessment", a Protein) is used in course `COU-2154` ("Legacy Protocol D"). The fourth row reveals that `ING-2322` ("Adaptive Series", an organic Grain) is used in course `COU-2166` ("Integrated Framework A", a Dessert). This view supports ingredient utilisation analysis and allergen impact assessment.

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

This view joins `service_charges` with `dining_packages` on `dining_package_id`, answering: "What service charge applies to each dining package?" The first row shows that package `PAC-2606` ("Legacy Standard D") has a service charge of 15.70% amounting to 1,687, distributed via the Shared method and marked as mandatory. The fourth row reveals that package `PAC-2621` ("Integrated Programme A") has a charge of 20.80% amounting to 0.04, distributed Direct and not mandatory. This view is critical for financial reconciliation and pricing transparency.

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

This view joins `service_charges` with `staff_roles` on `service_charge_id`, answering: "Which staff roles are compensated by each service charge?" The first row shows that service charge 1 (15.70%, Shared, mandatory) compensates staff role `ROL-2012` ("Terry Pratchett") in the Front of House department, who receives both service charges and direct tips. The third row links charge 3 (19.10%, Shared, mandatory) to role `ROL-2020` ("Janice Johnston"), also in Front of House with dual compensation. This view supports payroll allocation and compensation policy analysis.

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

This view joins `staff_roles` with `service_charges` on `service_charge_id`, answering the inverse: "Which service charge compensates each staff role?" The first row shows that role `ROL-2012` ("Terry Pratchett", Front of House) is compensated by service charge 1 (15.70%, Shared, mandatory). The second row reveals that `ROL-2016` ("Theodore Mcgrath", Back of House) is compensated by charge 2 (17.40%, Direct, not mandatory) and receives neither service charges nor direct tips. This view is useful for staff compensation auditing.

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

This view joins `staff_roles` with `menu_courses` on `menu_course_id`, answering: "Which menu course is associated with each staff role?" The first row links role `ROL-2012` ("Terry Pratchett", Front of House) to course `COU-2154` ("Legacy Protocol D", a vegetarian Soup). The fourth row connects `ROL-2024` ("Theodore Mcgrath", Back of House) to course `COU-2166` ("Integrated Framework A", a Dessert). This view supports operational staffing analysis, revealing which staff members are responsible for which courses.

The schema design reflects a deliberate trade-off between normalisation and query convenience. The eight base tables enforce first normal form with atomic values, surrogate primary keys, and explicit foreign key constraints that encode the ontology's cardinality-bounded relationships. The two junction tables (`packages_courses` and `charges_roles`) preserve the potential for many-to-many relationships even when the current data exhibits one-to-one associations. The eleven views materialise the most common analytical queries as virtual tables, each view answering a specific domain question by joining the appropriate pair of base tables. For example, the view `vw_menu_course_dining_package` answers "what package owns this course?" while `vw_dining_package_menu_course_detail` answers the inverse "what courses belong to this package?"—demonstrating how the same foreign key relationship can be navigated in either direction depending on the analytical need. The schema's structure ensures that every domain fact—whether it concerns a course's dietary attributes, a package's pricing, a beverage's alcohol content, an ingredient's allergen status, a service charge's distribution method, or a staff role's compensation structure—can be reconstructed from the normalised tables through well-defined join paths, providing both data integrity and analytical flexibility.