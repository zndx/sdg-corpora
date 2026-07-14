# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Course
- **genus**: `bfo:0000015`
- **definition**: A distinct stage in a multi-course meal sequence, such as an appetizer, main, or dessert.
- **attributes**: courseNumber, courseType, isChoice, description
- **relations**: contains→MenuItem, servesAsPartOf→FixedPriceMenu

## MenuItem
- **genus**: `cco:ont00000995`
- **definition**: A specific food or beverage item offered as part of a menu, including its ingredients and preparation details.
- **attributes**: itemName, price, isAvailable, preparationMethod, servingSize, allergenInfo
- **relations**: isPartOf→Course, includesIngredient→Ingredient

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of a menu item.
- **attributes**: ingredientName, isAllergen, origin, isOrganic
- **relations**: isUsedIn→MenuItem

## FixedPriceMenu
- **genus**: `cco:ont00000958`
- **definition**: A complete meal offering with a set price per person, comprising multiple courses and items.
- **attributes**: menuName, pricePerPerson, taxIncluded, gratuityIncluded, validFrom, validUntil
- **relations**: includesCourse→Course, isServedAt→Restaurant

## Restaurant
- **genus**: `bfo:0000040`
- **definition**: A commercial establishment where food and beverages are prepared and served to customers.
- **attributes**: restaurantName, address, phone, operatingHours, cuisineType
- **relations**: servesMenu→FixedPriceMenu
