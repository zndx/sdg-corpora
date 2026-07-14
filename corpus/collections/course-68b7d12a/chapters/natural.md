## Restaurant Menu Architecture and Ingredient Traceability

Modern restaurant operations require precise coordination between culinary offerings, ingredient sourcing, and pricing structures. A restaurant presents its menu to diners through a hierarchy of courses—first course, second course, dessert—each containing specific dishes prepared from identifiable ingredients. Fixed-price menus bundle multiple courses at a set price per person, valid within defined date ranges and tied to a particular establishment. This chapter documents the data structures that capture these relationships, enabling restaurants to manage their offerings, track ingredient provenance, and present coherent tasting menus to customers.

The foundation of any menu system is the course. Courses define the structural sequence of a meal, each assigned a position number and a type that indicates its role in the dining progression.

**Table `courses`**

| id | course_number | course_type | is_choice | description | fixed_price_menu_id |
|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | false | Extended Survey | 1 |
| 101 | 2 | SECOND COURSE | true | Pilot Corridor A | 2 |
| 102 | 3 | DESSERT | false | Baseline Series | 3 |
| 103 | 1 | FIRST COURSE | true | Distributed Assessment | 4 |

A course such as the one identified as 100 carries the label "Extended Survey" and is classified as a FIRST COURSE. It is not a choice item, meaning diners receive it as a standard part of the meal sequence. The course is associated with fixed-price menu 1, anchoring it within a broader tasting experience. Course 101, labeled "Pilot Corridor A," is a SECOND COURSE and is marked as a choice item, giving diners the option to select or decline it. Course 102, "Baseline Series," is a DESSERT, while course 103, "Distributed Assessment," is another FIRST COURSE that is available as a choice. The `is_choice` flag distinguishes between mandatory courses and optional selections within a tasting menu structure.

Each course becomes tangible through menu items—the actual dishes served to diners.

**Table `menu_items`**

| id | item_name | price | is_available | preparation_method | serving_size | allergen_info | course_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | true | pilot-preparat-56 | primary-serving-40 | distributed-allergen-72 | 100 |
| 2 | Integrated Corridor | 35.45 | false | extended-preparat-57 | adaptive-serving-41 | baseline-allergen-73 | 101 |
| 3 | Extended Series D | 29.24 | true | integrated-preparat-58 | distributed-serving-42 | pilot-allergen-74 | 102 |
| 4 | Pilot Assessment | 29.99 | false | seasonal-preparat-59 | baseline-serving-43 | extended-allergen-75 | 103 |

Menu item 1, "Seasonal Survey," is priced at 12.87 and is currently available. It is prepared using the method designated "pilot-preparat-56" and served in the portion size labeled "primary-serving-40." Its allergen information is recorded as "distributed-allergen-72." This item belongs to course 100, linking the dish to its position in the meal sequence. Menu item 2, "Integrated Corridor," costs 35.45 but is not currently available; it is associated with course 101 and uses the preparation method "extended-preparat-57." Menu item 3, "Extended Series D," is available at 29.24 and belongs to course 102, while menu item 4, "Pilot Assessment," is unavailable and priced at 29.99, linked to course 103. The `preparation_method`, `serving_size`, and `allergen_info` fields encode operational details that kitchen staff and service personnel reference during meal preparation and guest communication.

Ingredients form the building blocks of every menu item, and their properties must be tracked for quality, sourcing, and safety purposes.

**Table `ingredients`**

| id | ingredient_name | is_allergen | origin | is_organic |
|---|---|---|---|---|
| 1 | Pilot Assessment | false | distributed-origin-66 | false |
| 2 | Baseline Survey | true | baseline-origin-67 | true |
| 3 | Distributed Corridor A | false | pilot-origin-68 | false |
| 4 | Adaptive Series | true | extended-origin-69 | true |

Ingredient 1, named "Pilot Assessment," is not classified as an allergen, originates from "distributed-origin-66," and is not organic. Ingredient 2, "Baseline Survey," is flagged as an allergen, comes from "baseline-origin-67," and is certified organic. Ingredient 3, "Distributed Corridor A," is non-allergenic and sourced from "pilot-origin-68," while ingredient 4, "Adaptive Series," is an allergen from "extended-origin-69" and is organic. The `is_allergen` flag is critical for guest safety, the `origin` field supports provenance tracking, and `is_organic` communicates sourcing standards to health-conscious diners.

Fixed-price menus aggregate courses into a single offering with a unified price, validity period, and tax treatment.

**Table `fixed_price_menus`**

| id | menu_name | price_per_person | tax_included | gratuity_included | valid_from | valid_until | restaurant_id |
|---|---|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | false | true | 2025-12-17T11:09:00 | 2023-06-09T17:15:00 | 100 |
| 2 | Baseline Initiative | 18.59 | true | false | 2022-05-01T18:26:00 | 2024-11-20T00:32:00 | 101 |
| 3 | Distributed Model A | 47.66 | false | true | 2023-10-12T01:43:00 | 2025-04-04T07:49:00 | 102 |
| 4 | Adaptive Cluster | 19.72 | true | false | 2024-03-23T08:00:00 | 2022-09-15T14:06:00 | 103 |

Fixed-price menu 1, "Pilot Review," is priced at 17.12 per person, excludes tax but includes gratuity, and is valid from 2025-12-17 through 2023-06-09 at restaurant 100. The date range indicates the menu's operational window. Fixed-price menu 2, "Baseline Initiative," costs 18.59 per person, includes tax but excludes gratuity, and runs from 2022-05-01 to 2024-11-20 at restaurant 101. Fixed-price menu 3, "Distributed Model A," is the premium option at 47.66 per person, excludes tax, includes gratuity, and is valid from 2023-10-12 to 2025-04-04 at restaurant 102. Fixed-price menu 4, "Adaptive Cluster," costs 19.72 per person, includes tax, excludes gratuity, and spans from 2024-03-23 to 2022-09-15 at restaurant 103. The `tax_included` and `gratuity_included` flags determine how the displayed price translates to the final bill.

Every fixed-price menu belongs to a single restaurant, and each restaurant may offer multiple menus.

**Table `restaurants`**

| id | restaurant_name | address | phone | operating_hours | cuisine_type |
|---|---|---|---|---|---|
| 100 | Baseline Protocol D | distributed-address-72 | compact-phone-26 | pilot-operatin-50 | integrated-cuisine-52 |
| 101 | Distributed Programme | baseline-address-73 | composite-phone-27 | extended-operatin-51 | seasonal-cuisine-53 |
| 102 | Adaptive Standard | pilot-address-74 | primary-phone-28 | integrated-operatin-52 | regional-cuisine-54 |
| 103 | Primary Framework A | extended-address-75 | adaptive-phone-29 | seasonal-operatin-53 | legacy-cuisine-55 |

Restaurant 100, "Baseline Protocol D," is located at "distributed-address-72" and can be reached at "compact-phone-26." Its operating hours are described as "pilot-operatin-50" and it serves "integrated-cuisine-52." Restaurant 101, "Distributed Programme," is at "baseline-address-73," reachable at "composite-phone-27," operates under "extended-operatin-51," and specializes in "seasonal-cuisine-53." Restaurant 102, "Adaptive Standard," is located at "pilot-address-74," contactable at "primary-phone-28," with hours "integrated-operatin-52" and cuisine type "regional-cuisine-54." Restaurant 103, "Primary Framework A," is at "extended-address-75," phone "adaptive-phone-29," operating hours "seasonal-operatin-53," and serves "legacy-cuisine-55." The restaurant record serves as the anchor for all menus and, by extension, all courses and menu items offered on the premises.

The relationships between these entities are captured through junction tables that map many-to-many associations. The `courses_items` table links courses to the menu items that fulfill them.

**Table `courses_items`**

| course_id | menu_item_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

This table shows that course 100 contains two menu items: items 1 and 2. Course 101 also contains two items: 2 and 3. Course 102 contains items 3 and 4, and course 103 contains items 4 and 1. A single menu item can appear in multiple courses, and a course can contain multiple menu items, reflecting the flexibility of menu design where a dish might be offered as either a first or second course depending on the menu configuration.

The `items_ingredients` table records which ingredients are used in each menu item.

**Table `items_ingredients`**

| menu_item_id | ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This junction table establishes the composition of every dish, enabling ingredient-level traceability from the menu item down to the raw ingredient.

The `ingredients_items` table provides an alternative linkage between ingredients and menu items.

**Table `ingredients_items`**

| ingredient_id | menu_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table serves as a complementary mapping, ensuring that ingredient-to-item relationships are captured from both directions for data integrity and query flexibility.

The `menus_courses` table associates courses with fixed-price menus.

**Table `menus_courses`**

| fixed_price_menu_id | course_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

This table determines which courses appear in which tasting menus, defining the sequence and composition of each fixed-price offering.

The `restaurants_menus` table links restaurants to their fixed-price menus.

**Table `restaurants_menus`**

| restaurant_id | fixed_price_menu_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

This table establishes which menus are available at which establishment, ensuring that menu offerings are correctly attributed to the restaurant that serves them.

With these base tables and relationships in place, the system provides several views that join the data to answer specific operational questions.

**View `v_course_menu_item_detail`**

```sql
CREATE VIEW v_course_menu_item_detail AS
SELECT a.id, a.course_number, a.course_type, b.id AS item_id, b.item_name AS item_item_name, b.price AS item_price
FROM courses a
  JOIN courses_items j ON j.course_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | course_number | course_type | item_id | item_item_name | item_price |
|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | 1 | Seasonal Survey | 12.87 |
| 100 | 1 | FIRST COURSE | 2 | Integrated Corridor | 35.45 |
| 101 | 2 | SECOND COURSE | 2 | Integrated Corridor | 35.45 |
| 101 | 2 | SECOND COURSE | 3 | Extended Series D | 29.24 |
| 102 | 3 | DESSERT | 3 | Extended Series D | 29.24 |
| 102 | 3 | DESSERT | 4 | Pilot Assessment | 29.99 |
| 103 | 1 | FIRST COURSE | 4 | Pilot Assessment | 29.99 |
| 103 | 1 | FIRST COURSE | 1 | Seasonal Survey | 12.87 |

This view answers the question: "What menu items are available within each course, and what are their details?" It joins courses with menu items to present a complete picture of course composition. For example, the view would show that course 100 ("Extended Survey," a FIRST COURSE) contains menu item 1 ("Seasonal Survey," priced at 12.87, available) and menu item 2 ("Integrated Corridor," priced at 35.45, unavailable). This allows kitchen managers to verify that every course has its expected dishes and to check availability status at a glance.

**View `v_course_fixed_price_menu`**

```sql
CREATE VIEW v_course_fixed_price_menu AS
SELECT a.id, a.course_number, a.course_type, a.is_choice, b.id AS menu_id, b.menu_name AS menu_menu_name, b.price_per_person AS menu_price_per_person
FROM courses a JOIN fixed_price_menus b ON a.fixed_price_menu_id = b.id;
```

| id | course_number | course_type | is_choice | menu_id | menu_menu_name | menu_price_per_person |
|---|---|---|---|---|---|---|
| 100 | 1 | FIRST COURSE | false | 1 | Pilot Review | 17.12 |
| 101 | 2 | SECOND COURSE | true | 2 | Baseline Initiative | 18.59 |
| 102 | 3 | DESSERT | false | 3 | Distributed Model A | 47.66 |
| 103 | 1 | FIRST COURSE | true | 4 | Adaptive Cluster | 19.72 |

This view answers: "Which fixed-price menu does each course belong to, and what are the menu's pricing details?" By joining courses with fixed-price menus, it reveals the broader context of each course. For instance, course 100 ("Extended Survey") is part of fixed-price menu 1 ("Pilot Review," priced at 17.12 per person, tax excluded, gratuity included). Course 101 ("Pilot Corridor A") belongs to fixed-price menu 2 ("Baseline Initiative," 18.59 per person, tax included, gratuity excluded). This view is essential for understanding how individual courses contribute to the overall value proposition of a tasting menu.

**View `v_menu_item_course`**

```sql
CREATE VIEW v_menu_item_course AS
SELECT a.id, a.item_name, a.price, a.is_available, b.id AS course_id, b.course_number AS course_course_number, b.course_type AS course_course_type
FROM menu_items a JOIN courses b ON a.course_id = b.id;
```

| id | item_name | price | is_available | course_id | course_course_number | course_course_type |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | true | 100 | 1 | FIRST COURSE |
| 2 | Integrated Corridor | 35.45 | false | 101 | 2 | SECOND COURSE |
| 3 | Extended Series D | 29.24 | true | 102 | 3 | DESSERT |
| 4 | Pilot Assessment | 29.99 | false | 103 | 1 | FIRST COURSE |

This view answers: "Which course does each menu item belong to, and what is the course's classification?" It reverses the perspective from the previous view, starting from the dish and revealing its structural role. Menu item 1 ("Seasonal Survey") belongs to course 100, which is a FIRST COURSE with the description "Extended Survey." Menu item 2 ("Integrated Corridor") is part of course 101, a SECOND COURSE described as "Pilot Corridor A." This view helps service staff understand the sequence in which dishes should be presented and ensures that menu items are correctly categorized.

**View `v_menu_item_ingredient_detail`**

```sql
CREATE VIEW v_menu_item_ingredient_detail AS
SELECT a.id, a.item_name, a.price, b.id AS ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_allergen AS ingredient_is_allergen
FROM menu_items a
  JOIN items_ingredients j ON j.menu_item_id = a.id
  JOIN ingredients b ON b.id = j.ingredient_id;
```

| id | item_name | price | ingredient_id | ingredient_ingredient_name | ingredient_is_allergen |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.87 | 1 | Pilot Assessment | false |
| 1 | Seasonal Survey | 12.87 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 35.45 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 35.45 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 29.24 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 29.24 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 29.99 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 29.99 | 1 | Pilot Assessment | false |

This view answers: "What ingredients compose each menu item, and what are their properties?" It joins menu items with ingredients through the items-ingredients relationship, providing a complete ingredient profile for every dish. For example, the view would reveal which of the four ingredients—Pilot Assessment, Baseline Survey, Distributed Corridor A, or Adaptive Series—are used in menu item 1 ("Seasonal Survey") and whether any of them are allergens. This is the primary tool for allergen management and ingredient verification.

**View `v_ingredient_menu_item_detail`**

```sql
CREATE VIEW v_ingredient_menu_item_detail AS
SELECT a.id, a.ingredient_name, a.is_allergen, b.id AS item_id, b.item_name AS item_item_name, b.price AS item_price
FROM ingredients a
  JOIN ingredients_items j ON j.ingredient_id = a.id
  JOIN menu_items b ON b.id = j.menu_item_id;
```

| id | ingredient_name | is_allergen | item_id | item_item_name | item_price |
|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | 1 | Seasonal Survey | 12.87 |
| 1 | Pilot Assessment | false | 2 | Integrated Corridor | 35.45 |
| 2 | Baseline Survey | true | 2 | Integrated Corridor | 35.45 |
| 2 | Baseline Survey | true | 3 | Extended Series D | 29.24 |
| 3 | Distributed Corridor A | false | 3 | Extended Series D | 29.24 |
| 3 | Distributed Corridor A | false | 4 | Pilot Assessment | 29.99 |
| 4 | Adaptive Series | true | 4 | Pilot Assessment | 29.99 |
| 4 | Adaptive Series | true | 1 | Seasonal Survey | 12.87 |

This view answers: "Which menu items use a given ingredient, and what are those items' details?" It inverts the previous perspective, starting from an ingredient and listing all dishes that contain it. If ingredient 2 ("Baseline Survey," an allergen from "baseline-origin-67" that is organic) is used in a menu item, this view surfaces that association along with the item's name, price, and availability. This view is critical for allergen recalls and for marketing organic ingredients to diners.

**View `v_fixed_price_menu_course_detail`**

```sql
CREATE VIEW v_fixed_price_menu_course_detail AS
SELECT a.id, a.menu_name, a.price_per_person, b.id AS course_id, b.course_number AS course_course_number, b.course_type AS course_course_type
FROM fixed_price_menus a
  JOIN menus_courses j ON j.fixed_price_menu_id = a.id
  JOIN courses b ON b.id = j.course_id;
```

| id | menu_name | price_per_person | course_id | course_course_number | course_course_type |
|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | 100 | 1 | FIRST COURSE |
| 1 | Pilot Review | 17.12 | 101 | 2 | SECOND COURSE |
| 2 | Baseline Initiative | 18.59 | 101 | 2 | SECOND COURSE |
| 2 | Baseline Initiative | 18.59 | 102 | 3 | DESSERT |
| 3 | Distributed Model A | 47.66 | 102 | 3 | DESSERT |
| 3 | Distributed Model A | 47.66 | 103 | 1 | FIRST COURSE |
| 4 | Adaptive Cluster | 19.72 | 103 | 1 | FIRST COURSE |
| 4 | Adaptive Cluster | 19.72 | 100 | 1 | FIRST COURSE |

This view answers: "What courses are included in each fixed-price menu, and what are their characteristics?" It joins fixed-price menus with courses, providing a complete course-by-course breakdown of each tasting menu. For fixed-price menu 1 ("Pilot Review"), the view would show course 100 ("Extended Survey," a FIRST COURSE, not a choice). For fixed-price menu 2 ("Baseline Initiative"), it would show course 101 ("Pilot Corridor A," a SECOND COURSE, available as a choice). This view enables menu planners to verify that each tasting menu has a balanced progression of courses.

**View `v_fixed_price_menu_restaurant`**

```sql
CREATE VIEW v_fixed_price_menu_restaurant AS
SELECT a.id, a.menu_name, a.price_per_person, a.tax_included, b.id AS restaurant_id, b.restaurant_name AS restaurant_restaurant_name, b.address AS restaurant_address
FROM fixed_price_menus a JOIN restaurants b ON a.restaurant_id = b.id;
```

| id | menu_name | price_per_person | tax_included | restaurant_id | restaurant_restaurant_name | restaurant_address |
|---|---|---|---|---|---|---|
| 1 | Pilot Review | 17.12 | false | 100 | Baseline Protocol D | distributed-address-72 |
| 2 | Baseline Initiative | 18.59 | true | 101 | Distributed Programme | baseline-address-73 |
| 3 | Distributed Model A | 47.66 | false | 102 | Adaptive Standard | pilot-address-74 |
| 4 | Adaptive Cluster | 19.72 | true | 103 | Primary Framework A | extended-address-75 |

This view answers: "Which restaurant offers each fixed-price menu, and what are the restaurant's details?" It joins fixed-price menus with restaurants, providing the establishment context for every menu. Fixed-price menu 1 ("Pilot Review," 17.12 per person) is offered at restaurant 100 ("Baseline Protocol D"), which serves "integrated-cuisine-52." Fixed-price menu 3 ("Distributed Model A," 47.66 per person) is offered at restaurant 102 ("Adaptive Standard"), specializing in "regional-cuisine-54." This view is essential for multi-location operators who need to track which menus are available at which restaurants.

**View `v_restaurant_fixed_price_menu_detail`**

```sql
CREATE VIEW v_restaurant_fixed_price_menu_detail AS
SELECT a.id, a.restaurant_name, a.address, b.id AS menu_id, b.menu_name AS menu_menu_name, b.price_per_person AS menu_price_per_person
FROM restaurants a
  JOIN restaurants_menus j ON j.restaurant_id = a.id
  JOIN fixed_price_menus b ON b.id = j.fixed_price_menu_id;
```

| id | restaurant_name | address | menu_id | menu_menu_name | menu_price_per_person |
|---|---|---|---|---|---|
| 100 | Baseline Protocol D | distributed-address-72 | 1 | Pilot Review | 17.12 |
| 100 | Baseline Protocol D | distributed-address-72 | 2 | Baseline Initiative | 18.59 |
| 101 | Distributed Programme | baseline-address-73 | 2 | Baseline Initiative | 18.59 |
| 101 | Distributed Programme | baseline-address-73 | 3 | Distributed Model A | 47.66 |
| 102 | Adaptive Standard | pilot-address-74 | 3 | Distributed Model A | 47.66 |
| 102 | Adaptive Standard | pilot-address-74 | 4 | Adaptive Cluster | 19.72 |
| 103 | Primary Framework A | extended-address-75 | 4 | Adaptive Cluster | 19.72 |
| 103 | Primary Framework A | extended-address-75 | 1 | Pilot Review | 17.12 |

This view answers: "What is the complete picture of each restaurant's fixed-price menus, including pricing, validity, and inclusions?" It joins restaurants with their fixed-price menus, presenting a comprehensive overview of each establishment's tasting menu offerings. Restaurant 100 ("Baseline Protocol D") offers fixed-price menu 1 ("Pilot Review") at 17.12 per person, valid from 2025-12-17 to 2023-06-09, with tax excluded and gratuity included. Restaurant 102 ("Adaptive Standard") offers fixed-price menu 3 ("Distributed Model A") at 47.66 per person, valid from 2023-10-12 to 2025-04-04, with tax excluded and gratuity included. This view supports strategic decisions about menu pricing, seasonal availability, and competitive positioning across locations.

The data structures described above form a coherent system for managing restaurant menus at every level of detail. Courses provide the structural backbone of the dining experience, menu items translate those courses into specific dishes with pricing and preparation instructions, and ingredients supply the traceability needed for safety and quality assurance. Fixed-price menus aggregate courses into curated tasting experiences, while restaurants anchor all offerings to a physical location with its own identity and service standards. The junction tables ensure that these relationships are flexible enough to support complex menu configurations, and the views synthesize the data into actionable formats for different operational roles—from kitchen managers verifying course composition to service staff communicating allergen information to guests. Together, these records enable restaurants to maintain consistency across their offerings while retaining the flexibility to adapt menus to seasonal availability, ingredient sourcing, and evolving culinary strategies.