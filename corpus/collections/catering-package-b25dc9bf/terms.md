# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Catering Package
- **genus**: `cco:ont00000995`
- **definition**: A defined meal service offering (e.g., buffet, boxed lunch) with a specific set of food and beverage items and a base price.
- **attributes**: packageId, packageName, mealPeriod, basePricePerPerson, isBuffet, includesDessert
- **relations**: includesItem→FoodBeverageItem, servedWith→BeverageSelection, chargedWith→ServiceCharge

## Food or Beverage Item
- **genus**: `cco:ont00000995`
- **definition**: A specific food or beverage component (e.g., scrambled eggs, orange juice, pretzels) that constitutes a catering package.
- **attributes**: itemId, itemName, itemCategory, isSeasonal, isHousemade, allergenInfo
- **relations**: includedIn→CateringPackage, pairedWith→BeverageSelection

## Beverage Selection
- **genus**: `cco:ont00000995`
- **definition**: A standardized set of beverages (e.g., coffee, tea, sodas, waters) provided with a catering package.
- **attributes**: selectionId, selectionName, includesHotBeverages, includesColdBeverages, includesAlcohol
- **relations**: servedWith→CateringPackage, containsItem→FoodBeverageItem

## Service Charge
- **genus**: `bfo:0000015`
- **definition**: A mandatory financial surcharge (percentage or fixed fee) applied to the total cost of a catering event.
- **attributes**: chargeId, chargeType, chargeValue, chargeName, appliesToGroupSize
- **relations**: appliesTo→CateringPackage

## Sandwich Variety
- **genus**: `cco:ont00000995`
- **definition**: A specific configuration of meats, cheeses, and breads offered within a boxed lunch or sandwich board.
- **attributes**: varietyId, varietyName, breadType, primaryProtein, includesCheese
- **relations**: partOf→CateringPackage, servedWith→BoxedLunchSide

## Boxed Lunch Side
- **genus**: `cco:ont00000995`
- **definition**: A standard accompaniment (e.g., granola bar, chips, fruit, cookie) included with every boxed lunch variety.
- **attributes**: sideId, sideName, sideCategory
- **relations**: accompanies→SandwichVariety
