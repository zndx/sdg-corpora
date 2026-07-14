# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A specific food or beverage offering available on the restaurant's menu, characterized by its name, price, and composition.
- **attributes**: menuItemId, name, price, category, isGlutenFree, isAvailableForOrder, cookingMethod
- **relations**: containsIngredient→FoodIngredient, servedWith→FoodIngredient, hasSizeOption→MenuItemSize

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A distinct edible component used in the preparation of menu items, including vegetables, proteins, cheeses, sauces, and garnishes.
- **attributes**: ingredientId, name, type, isAllergen, isVegetarian, isVegan, isGlutenFree
- **relations**: usedIn→MenuItem

## Menu Item Size
- **genus**: `cco:ont00000995`
- **definition**: A specific size variant of a menu item that may have a different price or composition, such as different weights for steaks.
- **attributes**: sizeId, weightOz, price, description
- **relations**: variantOf→MenuItem

## Pizza Topping
- **genus**: `cco:ont00000995`
- **definition**: A specific ingredient available for customization on pizza items, selected from a predefined list.
- **attributes**: toppingId, name, type, isExtraCost, extraCostAmount
- **relations**: usedOn→MenuItem

## Add-On Option
- **genus**: `cco:ont00000995`
- **definition**: An optional extra item that can be added to a base menu item for an additional fee, such as extra protein or sides.
- **attributes**: addOnId, name, additionalPrice, type
- **relations**: availableFor→MenuItem
