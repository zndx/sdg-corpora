# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Canapé
- **genus**: `cco:ont00000995`
- **definition**: A small, prepared piece of food, typically served as an appetizer or finger food at a reception.
- **attributes**: canapeId, name, unitPrice, dietaryCategory, description, servingSize
- **relations**: servedIn→CanapeCategory, containsIngredient→Ingredient

## Canapé Category
- **genus**: `cco:ont00000958`
- **definition**: A classification used to group canapés based on their flavor profile, such as savory or sweet.
- **attributes**: categoryId, categoryName, recommendedServingSize, eventType
- **relations**: includesCanape→Canape

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A distinct food component or substance used in the preparation of a canapé or tasting dish.
- **attributes**: ingredientId, name, category, allergenFlag
- **relations**: usedIn→Canape

## Tasting Dish
- **genus**: `cco:ont00000995`
- **definition**: A portioned food item served in a bowl or mini dish, typically as a main or substantial appetizer.
- **attributes**: dishId, name, unitPrice, dietaryCategory, description, servingSize
- **relations**: servedIn→DishCategory, containsIngredient→Ingredient

## Dish Category
- **genus**: `cco:ont00000958`
- **definition**: A classification used to group tasting dishes based on their flavor profile, such as savory or sweet.
- **attributes**: categoryId, categoryName, recommendedServingSize, eventType
- **relations**: includesDish→TastingDish
