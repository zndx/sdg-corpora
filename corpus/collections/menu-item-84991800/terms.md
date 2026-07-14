# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage product offered for sale on the restaurant's menu.
- **attributes**: menuId, name, basePrice, category, isVegetarian, isVegan, isGlutenFree, servingTime
- **relations**: containsIngredient→Ingredient, servedWithSide→SideDish, hasPriceOption→PriceOption

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu items.
- **attributes**: ingredientId, name, type, isHouseMade, origin
- **relations**: usedIn→MenuItem

## Side Dish
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item served alongside a main menu item.
- **attributes**: sideId, name, price, portionType
- **relations**: servedWith→MenuItem

## Price Option
- **genus**: `cco:ont00000995`
- **definition**: A specific pricing configuration for a menu item, including base price, portion size, or add-ons.
- **attributes**: optionId, price, type, description
- **relations**: appliesTo→MenuItem, modifiesIngredient→Ingredient

## Bread Type
- **genus**: `cco:ont00000995`
- **definition**: A specific variety of house-made bread used for sandwiches and toast.
- **attributes**: breadId, name, isHouseMade
- **relations**: usedIn→MenuItem
