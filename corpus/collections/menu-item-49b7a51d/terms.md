# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage product offered for sale on the restaurant's menu, characterized by its name, price, and composition.
- **attributes**: menuItemId, name, price, category, isAlcoholic, isSpicy
- **relations**: containsIngredient→Ingredient, servedWithSide→SideItem, hasPreparationMethod→PreparationMethod

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw food component or substance used in the preparation of menu items, tracked by its type and specific variety.
- **attributes**: ingredientId, name, type, isAllergen, isSeasonal
- **relations**: isComponentOf→MenuItem, isUsedIn→PreparationMethod

## Side Item
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item served alongside a main dish, often with an associated cost or included by default.
- **attributes**: sideItemId, name, price, isIncluded
- **relations**: isServedWith→MenuItem, containsIngredient→Ingredient

## Preparation Method
- **genus**: `bfo:0000015`
- **definition**: A specific culinary process or technique applied to ingredients to create a menu item, such as frying, baking, or flambéing.
- **attributes**: methodId, name, cookingTemperature, cookingDuration
- **relations**: transformsIngredient→Ingredient, producesMenuItem→MenuItem

## Drink Variant
- **genus**: `cco:ont00000995`
- **definition**: A specific variation of a cocktail or beverage, defined by its base alcohol, mixers, and garnish.
- **attributes**: variantId, name, baseAlcohol, price, alcoholContent
- **relations**: containsIngredient→Ingredient, isVariantOf→MenuItem

## Omelette Add-On
- **genus**: `cco:ont00000995`
- **definition**: An optional ingredient or topping that can be added to a base omelette for an additional fee.
- **attributes**: addOnId, name, additionalCost, category
- **relations**: isAddedTo→MenuItem, isIngredient→Ingredient
