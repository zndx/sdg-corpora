# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage offering available for order at the restaurant, defined by its name, composition, and price.
- **attributes**: itemId, name, category, price, description, isGlutenFree, isBaked, isBreaded, isGrilled, isFried, isPanSeared
- **relations**: containsIngredient→Ingredient, servedWithSide→SideDish, servedWithSide→Salad

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu items, characterized by its type, origin, and state.
- **attributes**: ingredientId, name, type, origin, state, isLocallyGrown, isWildCaught
- **relations**: usedIn→MenuItem

## Side Dish
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item served alongside a main course, selected from a predefined list of options.
- **attributes**: sideId, name, type, isIncluded
- **relations**: accompanies→MenuItem

## Salad
- **genus**: `cco:ont00000995`
- **definition**: A cold dish composed of mixed ingredients, typically greens and vegetables, often served as a starter or side.
- **attributes**: saladId, name, baseGreens, dressing, isChefSpecial
- **relations**: containsIngredient→Ingredient, accompanies→MenuItem

## Pizza
- **genus**: `cco:ont00000995`
- **definition**: A baked dish consisting of a flattened dough base topped with sauce, cheese, and various ingredients.
- **attributes**: pizzaId, name, sauceType, crustType, isSpecialty
- **relations**: containsIngredient→Ingredient

## Topping
- **genus**: `cco:ont00000995`
- **definition**: An additional ingredient added to a pizza or other dish, categorized by its pricing tier and type.
- **attributes**: toppingId, name, tier, priceAdjustment
- **relations**: addedTo→Pizza
