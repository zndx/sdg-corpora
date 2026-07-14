# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Happy Hour Special
- **genus**: `bfo:0000015`
- **definition**: A time-limited promotional offer for discounted beverages and food items available during specific hours.
- **attributes**: startTime, endTime, discountPercentage, isActive
- **relations**: includes→Beverage, includes→FoodItem

## Beverage
- **genus**: `cco:ont00000995`
- **definition**: A consumable liquid product, including craft beers, wines, and cocktails.
- **attributes**: beverageType, brand, volume, unit, price
- **relations**: availableDuring→HappyHourSpecial

## Food Item
- **genus**: `cco:ont00000995`
- **definition**: A prepared food product offered for sale, including small plates and desserts.
- **attributes**: name, category, price, servingSize, ingredients
- **relations**: availableDuring→HappyHourSpecial

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed component used in the preparation of food items.
- **attributes**: name, type, origin
- **relations**: usedIn→FoodItem

## Dipping Sauce
- **genus**: `cco:ont00000995`
- **definition**: A liquid or semi-liquid condiment served alongside food items for dipping.
- **attributes**: name, flavorProfile, spiciness
- **relations**: servedWith→FoodItem
