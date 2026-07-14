# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Canapé
- **genus**: `cco:ont00000995`
- **definition**: A small, prepared piece of food, typically served on a bread or cracker base, intended for a single bite.
- **attributes**: canapeId, name, price, category, dietaryClassification, recommendedCountPerPerson
- **relations**: servedIn→BreadBase, containsIngredient→FoodIngredient, measuredBy→PricingScheme

## Bread Base
- **genus**: `cco:ont00000995`
- **definition**: The foundational edible component, such as bread, cracker, or pastry, upon which a canapé or appetizer is assembled.
- **attributes**: baseId, name, type
- **relations**: supportsCanape→Canape

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A distinct edible substance or component used in the preparation of a dish or canapé.
- **attributes**: ingredientId, name, category, isAllergen
- **relations**: composesCanape→Canape, composesBowl→TastingBowl

## Tasting Bowl
- **genus**: `cco:ont00000995`
- **definition**: A portioned serving of food presented in a bowl, typically consisting of multiple ingredients and intended for sharing or sampling.
- **attributes**: bowlId, name, price, category, dietaryClassification, recommendedCountPerPerson
- **relations**: containsIngredient→FoodIngredient, measuredBy→PricingScheme

## Pricing Scheme
- **genus**: `cco:ont00000958`
- **definition**: A structured set of rules and values defining the cost associated with specific food items or categories.
- **attributes**: schemeId, pricePoint, currency, validFrom
- **relations**: appliesToCanape→Canape, appliesToBowl→TastingBowl
