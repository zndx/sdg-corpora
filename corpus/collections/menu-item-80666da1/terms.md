# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct culinary offering listed on a restaurant menu, characterized by its name, price, and descriptive attributes.
- **attributes**: itemId, name, price, weight, cookingTime, isVegetarian, isVegan, category
- **relations**: containsIngredient→Ingredient, servedWith→SideDish, belongsToList→MenuSection

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of a menu item.
- **attributes**: ingredientId, name, isAllergen, allergenCategory, origin, form
- **relations**: usedIn→MenuItem

## Side Dish
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item served alongside a main course, often with optional preparation variations.
- **attributes**: sideId, name, price, preparationStyle, isVegetarian, isVegan
- **relations**: accompanies→MenuItem, containsIngredient→Ingredient

## Sauce
- **genus**: `cco:ont00000995`
- **definition**: A liquid or semi-liquid condiment served with menu items, often with a separate price.
- **attributes**: sauceId, name, price, baseIngredient, isSpicy
- **relations**: servedWith→MenuItem, containsIngredient→Ingredient

## Menu Section
- **genus**: `cco:ont00000995`
- **definition**: A categorical grouping of menu items, such as Starters, Mains, or Sides.
- **attributes**: sectionId, name, sortOrder
- **relations**: containsItem→MenuItem
