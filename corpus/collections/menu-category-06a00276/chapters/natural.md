## The Architecture of a Restaurant Menu

A restaurant menu is more than a list of dishes and prices; it is a structured system of relationships between categories, ingredients, cheese varieties, and side options. Understanding how these elements interlock is essential for menu planning, inventory management, and customer-facing ordering systems. The records below capture the full scope of a menu's composition, from high-level categories down to individual ingredient classifications and substitution rules.

The foundation of any menu lies in its categories. Categories group food items into logical sections that guide customer selection. In this system, categories carry a display order that determines their presentation sequence, along with timestamps tracking when each category was created and last modified.

**Table `menu_categories`**

| menu_category_id | category_name | display_order | created_at | updated_at |
|---|---|---|---|---|
| 1 | Salads | 43 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Sandwiches | 52 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Other Favorites | 61 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Salads | 70 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Four categories are currently defined, each with a distinct display order. The "Salads" category appears twice in the system—once at display order 43 and again at 70—suggesting either a reorganization in progress or parallel salad sections. "Sandwiches" occupies display order 52, while "Other Favorites" sits at 61. The creation dates span from January through April 2025, indicating a menu that has been iteratively expanded.

Food items are the individual dishes offered to customers. Each item carries a name, a base price, a serving weight measured in kilograms, and dietary flags indicating whether it is vegetarian or gluten-free. Allergen codes provide additional safety information for customers with dietary restrictions.

**Table `food_items`**

| food_item_id | item_name | base_price | serving_weight | is_vegetarian | is_gluten_free | allergen_codes | menu_category_id | cheese_type_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | true | true | extended-allergen-15 | 1 | 1 |
| 2 | Integrated Corridor | 12.87 | 1.48 | false | false | integrated-allergen-16 | 2 | 2 |
| 3 | Extended Series D | 17.41 | 0.635 | true | true | seasonal-allergen-17 | 3 | 3 |
| 4 | Pilot Assessment | 18.59 | 1.42 | false | false | regional-allergen-18 | 4 | 4 |

The menu features four distinct items. "Seasonal Survey" is priced at 12.72 with a serving weight of 0.96 kg and is both vegetarian and gluten-free, carrying the allergen code "extended-allergen-15". "Integrated Corridor" costs 12.87, weighs 1.48 kg, and contains neither vegetarian nor gluten-free designations. "Extended Series D" is the most expensive at 17.41, with a lighter serving of 0.635 kg, and is vegetarian and gluten-free. "Pilot Assessment" rounds out the selection at 18.59 with a substantial 1.42 kg serving. Each item is associated with a cheese type, ranging from Cheddar to Provolone.

Ingredients form the building blocks of food items. The ingredient registry tracks whether each ingredient is raw, cooked, a condiment, or itself a side dish. A self-referential field allows ingredients to be classified as subtypes of other ingredients, enabling hierarchical ingredient taxonomies.

**Table `food_ingredients`**

| food_ingredient_id | ingredient_name | is_raw | is_cooked | is_condiment | is_side_dish | is_subtype_of_food_ingredient_id |
|---|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | false | false | false | 1 |
| 2 | Baseline Survey | true | true | true | true | 2 |
| 3 | Distributed Corridor A | false | false | false | false | 3 |
| 4 | Adaptive Series | true | true | true | true | 4 |

Four ingredients are registered. "Pilot Assessment" is neither raw nor cooked, nor is it a condiment or side dish, and it references itself as its own subtype. "Baseline Survey" is simultaneously raw, cooked, a condiment, and a side dish—a multi-state ingredient that defies simple categorization. "Distributed Corridor A" is a plain ingredient with no special properties. "Adaptive Series" mirrors "Baseline Survey" in its multi-state classification.

Cheese types are cataloged separately, allowing food items to reference a specific cheese variety rather than embedding cheese details within each dish record.

**Table `cheese_types`**

| cheese_type_id | cheese_name |
|---|---|
| 1 | Cheddar |
| 2 | American |
| 3 | Swiss |
| 4 | Provolone |

Four cheese varieties are available: Cheddar, American, Swiss, and Provolone. These map directly to the cheese type identifiers used in the food items table, creating a clean separation between cheese metadata and dish composition.

Side dishes represent optional accompaniments that can be substituted for one another. Each side dish has a name, a substitution cost that quantifies the price adjustment when swapping, a flag indicating whether it is the default side, and a reference to the food item it accompanies. A self-referential field enables side dishes to substitute for other side dishes.

**Table `side_dishes`**

| side_dish_id | side_name | substitution_cost | is_default_side | food_item_id | substitutes_for_side_dish_id |
|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | 1 |
| 2 | Extended Standard | 43.48 | false | 2 | 2 |
| 3 | Pilot Framework | 29.24 | true | 3 | 3 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | 4 |

Four side dishes are defined. "Integrated Programme A" costs 37.54 to substitute, is marked as the default side, and accompanies food item 1. "Extended Standard" has a substitution cost of 43.48 and is not the default. "Pilot Framework" costs 29.24 to substitute and is the default side for its associated item. "Baseline Protocol D" rounds out the selection at 32.21 substitution cost with no default designation.

## Cross-Reference Tables

The relationships between categories, items, ingredients, and cheese types are managed through dedicated cross-reference tables. These tables resolve many-to-many relationships that cannot be expressed through simple foreign keys alone.

The categories-to-items mapping allows a single food item to belong to multiple menu categories, and a category to contain multiple items.

**Table `categories_items`**

| menu_category_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This mapping reveals that food items are not restricted to a single category. Food item 1 ("Seasonal Survey") appears in both category 1 (Salads) and category 4 (Salads), reinforcing the dual presence of salad sections. Food item 2 ("Integrated Corridor") spans categories 1 and 2, appearing in both Salads and Sandwiches. Food item 3 ("Extended Series D") connects categories 2 and 3, while food item 4 ("Pilot Assessment") links categories 3 and 4. This overlapping structure suggests a menu where items can be discovered through multiple browsing paths.

The items-to-ingredients relationship table documents which ingredients compose each food item.

**Table `items_ingredients`**

| food_item_id | food_ingredient_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table establishes the ingredient composition of food items, enabling traceability from dish to component. The specific mappings define which ingredients are required for each menu offering.

The ingredients-to-items table provides the reverse mapping, showing which food items use each ingredient.

**Table `ingredients_items`**

| food_ingredient_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This bidirectional relationship ensures that ingredient usage can be traced from either direction—whether starting from a dish and finding its components, or starting from an ingredient and identifying all dishes that contain it. This is critical for allergen management and inventory planning.

The types-to-items table links cheese types to food items.

**Table `types_items`**

| cheese_type_id | food_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This mapping connects each cheese variety to the dishes that feature it, supporting cheese-specific menu filtering and ingredient cost calculations.

## View-Based Reporting

The system provides several pre-joined views that combine data from multiple tables to answer specific operational questions. Each view presents a different lens on the menu's structure.

The view joining menu categories with food items provides a comprehensive listing of every dish within its category context.

**View `vw_menu_category_food_item_detail`**

```sql
CREATE VIEW vw_menu_category_food_item_detail AS
SELECT a.menu_category_id, a.category_name, a.display_order, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM menu_categories a
  JOIN categories_items j ON j.menu_category_id = a.menu_category_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| menu_category_id | category_name | display_order | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|
| 1 | Salads | 43 | 1 | Seasonal Survey | 12.72 |
| 1 | Salads | 43 | 2 | Integrated Corridor | 12.87 |
| 2 | Sandwiches | 52 | 2 | Integrated Corridor | 12.87 |
| 2 | Sandwiches | 52 | 3 | Extended Series D | 17.41 |
| 3 | Other Favorites | 61 | 3 | Extended Series D | 17.41 |
| 3 | Other Favorites | 61 | 4 | Pilot Assessment | 18.59 |
| 4 | Salads | 70 | 4 | Pilot Assessment | 18.59 |
| 4 | Salads | 70 | 1 | Seasonal Survey | 12.72 |

This view answers the question: "What food items belong to each menu category, and what are their details?" Reading the first row, we see that "Seasonal Survey" (food item 1) is categorized under "Salads" (category 1), priced at 12.72, and is both vegetarian and gluten-free. The second row shows "Integrated Corridor" (food item 2) also appearing under "Salads" (category 1), priced at 12.87, with no vegetarian or gluten-free designation. This view is essential for generating category-based menu layouts and verifying that items are properly categorized.

The complementary view joins food items with their menu categories, presenting the relationship from the item's perspective.

**View `vw_food_item_menu_category`**

```sql
CREATE VIEW vw_food_item_menu_category AS
SELECT a.food_item_id, a.item_name, a.base_price, a.serving_weight, b.menu_category_id AS category_menu_category_id, b.category_name AS category_category_name, b.display_order AS category_display_order
FROM food_items a JOIN menu_categories b ON a.menu_category_id = b.menu_category_id;
```

| food_item_id | item_name | base_price | serving_weight | category_menu_category_id | category_category_name | category_display_order |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | 1 | Salads | 43 |
| 2 | Integrated Corridor | 12.87 | 1.48 | 2 | Sandwiches | 52 |
| 3 | Extended Series D | 17.41 | 0.635 | 3 | Other Favorites | 61 |
| 4 | Pilot Assessment | 18.59 | 1.42 | 4 | Salads | 70 |

This view answers: "Which menu categories is each food item listed under?" The first row reveals that "Seasonal Survey" appears in the "Salads" category, while the second row shows "Integrated Corridor" is listed under "Sandwiches". This perspective is useful for inventory reports organized by dish and for verifying category assignments.

The food item and ingredient detail view combines dish information with ingredient data.

**View `vw_food_item_food_ingredient_detail`**

```sql
CREATE VIEW vw_food_item_food_ingredient_detail AS
SELECT a.food_item_id, a.item_name, a.base_price, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_raw AS ingredient_is_raw
FROM food_items a
  JOIN items_ingredients j ON j.food_item_id = a.food_item_id
  JOIN food_ingredients b ON b.food_ingredient_id = j.food_ingredient_id;
```

| food_item_id | item_name | base_price | ingredient_food_ingredient_id | ingredient_ingredient_name | ingredient_is_raw |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 1 | Pilot Assessment | false |
| 1 | Seasonal Survey | 12.72 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 12.87 | 2 | Baseline Survey | true |
| 2 | Integrated Corridor | 12.87 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 17.41 | 3 | Distributed Corridor A | false |
| 3 | Extended Series D | 17.41 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 18.59 | 4 | Adaptive Series | true |
| 4 | Pilot Assessment | 18.59 | 1 | Pilot Assessment | false |

This view answers: "What ingredients compose each food item, and what are the properties of those ingredients?" The joined result connects each dish to its component ingredients, showing whether each ingredient is raw, cooked, a condiment, or a side dish. This is critical for allergen reporting, nutritional analysis, and kitchen preparation instructions.

The food item and cheese type view links dishes to their specific cheese varieties.

**View `vw_food_item_cheese_type`**

```sql
CREATE VIEW vw_food_item_cheese_type AS
SELECT a.food_item_id, a.item_name, a.base_price, a.serving_weight, b.cheese_type_id AS type_cheese_type_id, b.cheese_name AS type_cheese_name
FROM food_items a JOIN cheese_types b ON a.cheese_type_id = b.cheese_type_id;
```

| food_item_id | item_name | base_price | serving_weight | type_cheese_type_id | type_cheese_name |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 12.72 | 0.96 | 1 | Cheddar |
| 2 | Integrated Corridor | 12.87 | 1.48 | 2 | American |
| 3 | Extended Series D | 17.41 | 0.635 | 3 | Swiss |
| 4 | Pilot Assessment | 18.59 | 1.42 | 4 | Provolone |

This view answers: "Which cheese type is associated with each food item?" The first row shows "Seasonal Survey" paired with "Cheddar", while the second row links "Integrated Corridor" to "American" cheese. This view supports cheese-specific menu filtering, allergen reporting for dairy-sensitive customers, and cheese inventory tracking.

The food ingredient and food item detail view presents ingredients alongside the dishes they appear in.

**View `vw_food_ingredient_food_item_detail`**

```sql
CREATE VIEW vw_food_ingredient_food_item_detail AS
SELECT a.food_ingredient_id, a.ingredient_name, a.is_raw, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM food_ingredients a
  JOIN ingredients_items j ON j.food_ingredient_id = a.food_ingredient_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| food_ingredient_id | ingredient_name | is_raw | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | 1 | Seasonal Survey | 12.72 |
| 1 | Pilot Assessment | false | 2 | Integrated Corridor | 12.87 |
| 2 | Baseline Survey | true | 2 | Integrated Corridor | 12.87 |
| 2 | Baseline Survey | true | 3 | Extended Series D | 17.41 |
| 3 | Distributed Corridor A | false | 3 | Extended Series D | 17.41 |
| 3 | Distributed Corridor A | false | 4 | Pilot Assessment | 18.59 |
| 4 | Adaptive Series | true | 4 | Pilot Assessment | 18.59 |
| 4 | Adaptive Series | true | 1 | Seasonal Survey | 12.72 |

This view answers: "Which food items use each ingredient?" Reading from the ingredient side, we can identify all dishes containing a particular ingredient. This is essential for reverse allergen lookup—if a customer reports an allergy to a specific ingredient, this view reveals every dish that contains it.

The food ingredient self-join view reveals the hierarchical relationships between ingredients.

**View `vw_food_ingredient_food_ingredient`**

```sql
CREATE VIEW vw_food_ingredient_food_ingredient AS
SELECT a.food_ingredient_id, a.ingredient_name, a.is_raw, a.is_cooked, b.food_ingredient_id AS ingredient_food_ingredient_id, b.ingredient_name AS ingredient_ingredient_name, b.is_raw AS ingredient_is_raw
FROM food_ingredients a JOIN food_ingredients b ON a.is_subtype_of_food_ingredient_id = b.food_ingredient_id;
```

| food_ingredient_id | ingredient_name | is_raw | is_cooked | ingredient_food_ingredient_id | ingredient_ingredient_name | ingredient_is_raw |
|---|---|---|---|---|---|---|
| 1 | Pilot Assessment | false | false | 1 | Pilot Assessment | false |
| 2 | Baseline Survey | true | true | 2 | Baseline Survey | true |
| 3 | Distributed Corridor A | false | false | 3 | Distributed Corridor A | false |
| 4 | Adaptive Series | true | true | 4 | Adaptive Series | true |

This view answers: "How do ingredients relate to their parent ingredients in the subtype hierarchy?" The self-referential join connects each ingredient to its parent, enabling the system to traverse the ingredient taxonomy. For example, if "Pilot Assessment" is a subtype of itself, this relationship is captured and queryable.

The cheese type and food item detail view presents cheese varieties alongside their associated dishes.

**View `vw_cheese_type_food_item_detail`**

```sql
CREATE VIEW vw_cheese_type_food_item_detail AS
SELECT a.cheese_type_id, a.cheese_name, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM cheese_types a
  JOIN types_items j ON j.cheese_type_id = a.cheese_type_id
  JOIN food_items b ON b.food_item_id = j.food_item_id;
```

| cheese_type_id | cheese_name | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|
| 1 | Cheddar | 1 | Seasonal Survey | 12.72 |
| 1 | Cheddar | 2 | Integrated Corridor | 12.87 |
| 2 | American | 2 | Integrated Corridor | 12.87 |
| 2 | American | 3 | Extended Series D | 17.41 |
| 3 | Swiss | 3 | Extended Series D | 17.41 |
| 3 | Swiss | 4 | Pilot Assessment | 18.59 |
| 4 | Provolone | 4 | Pilot Assessment | 18.59 |
| 4 | Provolone | 1 | Seasonal Survey | 12.72 |

This view answers: "Which food items feature each cheese type?" Reading from the cheese perspective, we can identify all dishes that use a particular cheese variety. This supports cheese inventory management, cheese-specific promotions, and allergen reporting for dairy-sensitive customers.

The side dish and food item view links side dishes to their parent dishes.

**View `vw_side_dish_food_item`**

```sql
CREATE VIEW vw_side_dish_food_item AS
SELECT a.side_dish_id, a.side_name, a.substitution_cost, a.is_default_side, b.food_item_id AS item_food_item_id, b.item_name AS item_item_name, b.base_price AS item_base_price
FROM side_dishes a JOIN food_items b ON a.food_item_id = b.food_item_id;
```

| side_dish_id | side_name | substitution_cost | is_default_side | item_food_item_id | item_item_name | item_base_price |
|---|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | Seasonal Survey | 12.72 |
| 2 | Extended Standard | 43.48 | false | 2 | Integrated Corridor | 12.87 |
| 3 | Pilot Framework | 29.24 | true | 3 | Extended Series D | 17.41 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | Pilot Assessment | 18.59 |

This view answers: "Which side dish is associated with each food item, and what are the substitution details?" The first row shows "Integrated Programme A" as the side dish for food item 1, with a substitution cost of 37.54 and default-side status. This view is essential for the ordering system, where customers select or substitute side dishes.

The side dish self-join view reveals substitution relationships between side dishes.

**View `vw_side_dish_side_dish`**

```sql
CREATE VIEW vw_side_dish_side_dish AS
SELECT a.side_dish_id, a.side_name, a.substitution_cost, a.is_default_side, b.side_dish_id AS dish_side_dish_id, b.side_name AS dish_side_name, b.substitution_cost AS dish_substitution_cost
FROM side_dishes a JOIN side_dishes b ON a.substitutes_for_side_dish_id = b.side_dish_id;
```

| side_dish_id | side_name | substitution_cost | is_default_side | dish_side_dish_id | dish_side_name | dish_substitution_cost |
|---|---|---|---|---|---|---|
| 1 | Integrated Programme A | 37.54 | true | 1 | Integrated Programme A | 37.54 |
| 2 | Extended Standard | 43.48 | false | 2 | Extended Standard | 43.48 |
| 3 | Pilot Framework | 29.24 | true | 3 | Pilot Framework | 29.24 |
| 4 | Baseline Protocol D | 32.21 | false | 4 | Baseline Protocol D | 32.21 |

This view answers: "Which side dishes can substitute for other side dishes?" The self-referential join captures the substitution hierarchy, enabling the system to validate substitution requests and calculate appropriate price adjustments. This is critical for the ordering workflow, where customers may request alternative sides.

## Synthesis

The menu system presented here demonstrates a comprehensive approach to structuring food service data. Categories organize items for customer discovery, while cross-reference tables enable flexible many-to-many relationships between categories, items, ingredients, and cheese types. The self-referential fields in ingredients and side dishes support hierarchical taxonomies and substitution rules. The pre-joined views provide ready-made lenses for answering common operational questions—from allergen tracing to inventory planning to menu layout generation. Together, these records form a coherent framework for managing a restaurant menu's complexity, ensuring that every dish can be traced to its components, categorized appropriately, and presented with accurate pricing and dietary information.