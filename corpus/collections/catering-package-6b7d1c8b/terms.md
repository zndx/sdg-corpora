# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Catering Package
- **genus**: `cco:ont00000995`
- **definition**: A pre-configured food service offering defined by a specific guest count, menu composition, and price point.
- **attributes**: packageId, title, basePrice, epicPrice, servesCount, status
- **relations**: includesItem→MenuFoodItem, hasOption→MenuFoodItem, includesSide→MenuFoodItem

## Menu Food Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct culinary product or ingredient defined by its name, preparation method, and component ingredients.
- **attributes**: itemId, name, category, unitPrice, portionSize, isGlutenFree, isVegetarian
- **relations**: containsIngredient→Ingredient, servedWith→MenuFoodItem

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw food component or specific preparation used in the assembly of menu items.
- **attributes**: ingredientId, name, type, certification, isAllergen
- **relations**: usedIn→MenuFoodItem

## Sauce
- **genus**: `cco:ont00000995`
- **definition**: A liquid condiment or dipping sauce provided with specific menu items.
- **attributes**: sauceId, name, isHomemade, spiceLevel
- **relations**: servedWith→MenuFoodItem

## Order Line
- **genus**: `bfo:0000015`
- **definition**: A specific transactional instance of a catering package or food item being selected for service.
- **attributes**: lineId, quantity, unitPrice, totalPrice, selectedSauce, isEpicUpgrade
- **relations**: containsItem→MenuFoodItem, referencesPackage→CateringPackage, selectsSauce→Sauce
