# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A discrete food or beverage product offered for sale on a restaurant menu, characterized by its name, price, and ingredient composition.
- **attributes**: itemId, name, price, category, isVegetarian, description, weightGrams
- **relations**: containsIngredient→Ingredient, servedInCourse→MenuCourse

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw food substance or component used in the preparation of a menu item, such as a specific type of olive, spice, or protein.
- **attributes**: ingredientId, name, type, originRegion, allergenFlag
- **relations**: usedIn→MenuItem

## Menu Course
- **genus**: `cco:ont00000995`
- **definition**: A structured grouping of menu items that constitute a specific stage of a dining experience, such as starters, mains, or desserts.
- **attributes**: courseId, name, sequenceOrder
- **relations**: includesMenuItem→MenuItem

## Pricing Tier
- **genus**: `cco:ont00000995`
- **definition**: A defined pricing structure for a multi-course meal package, specifying the cost based on the number of courses selected.
- **attributes**: tierId, courseCount, price, validDays, validStart, validEnd
- **relations**: appliesToMenu→MenuCourse

## Dining Occasion
- **genus**: `bfo:0000015`
- **definition**: A specific temporal context or event type for which a menu is designed, such as a pre-theatre meal, characterized by time constraints and specific offerings.
- **attributes**: occasionId, name, durationMinutes, isAvailable
- **relations**: featuresMenu→PricingTier
