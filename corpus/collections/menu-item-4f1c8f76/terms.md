# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A specific dish or beverage offered for sale on a restaurant menu, characterized by its name, price, and descriptive attributes.
- **attributes**: itemId, name, price, description, weight, cookingTime, isVegetarian, isVegan
- **relations**: belongsCategory→MenuCategory, containsIngredient→Ingredient, servedWith→SideDish

## Menu Category
- **genus**: `cco:ont00000958`
- **definition**: A grouping or section of a restaurant menu that organizes items by type or theme.
- **attributes**: categoryId, name, sortOrder
- **relations**: containsMenuItem→MenuItem

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu items.
- **attributes**: ingredientId, name, isAllergen, allergenType
- **relations**: usedInMenuItem→MenuItem

## Side Dish
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item served alongside a main course, often with its own pricing and description.
- **attributes**: sideId, name, price, description, isVegetarian, isVegan
- **relations**: servedWithMenuItem→MenuItem

## Sauce
- **genus**: `cco:ont00000995`
- **definition**: A liquid or semi-liquid condiment or accompaniment served with food items, often with a specific price and description.
- **attributes**: sauceId, name, price, description
- **relations**: accompaniesMenuItem→MenuItem
