# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Party Platter
- **genus**: `cco:ont00000995`
- **definition**: A pre-packaged food platter designed to serve a specific number of guests, containing a selection of sandwiches or main items.
- **attributes**: platterId, servesCount, basePrice, epicPrice, status, lastUpdated
- **relations**: contains→PlatterItem, includes→SideItem, includes→Beverage, includes→Dessert

## Platter Item
- **genus**: `cco:ont00000995`
- **definition**: A specific food item included in a party platter, such as a sandwich or chicken dish.
- **attributes**: itemId, itemName, quantity, category, isCrispy, isGrilled
- **relations**: partOf→PartyPlatter, servedWith→Sauce

## Side Item
- **genus**: `cco:ont00000995`
- **definition**: An additional food item that can be added to a platter or box lunch to enhance the meal.
- **attributes**: sideId, sideName, price, type, isAvailable
- **relations**: includedIn→PartyPlatter, includedIn→BoxLunch

## Beverage
- **genus**: `cco:ont00000995`
- **definition**: A drink item that can be added to a platter or box lunch.
- **attributes**: beverageId, beverageName, price, type, isAvailable
- **relations**: includedIn→PartyPlatter, includedIn→BoxLunch

## Dessert
- **genus**: `cco:ont00000995`
- **definition**: A sweet item that can be added to a platter or box lunch.
- **attributes**: dessertId, dessertName, price, type, isAvailable
- **relations**: includedIn→PartyPlatter, includedIn→BoxLunch

## Box Lunch
- **genus**: `cco:ont00000995`
- **definition**: A pre-packaged lunch box containing a wrap, a side, and optionally a dessert.
- **attributes**: lunchId, lunchName, price, status, lastUpdated
- **relations**: contains→Wrap, includes→SideItem, includes→Dessert

## Wrap
- **genus**: `cco:ont00000995`
- **definition**: A sandwich variant served in a wrap, containing various fillings.
- **attributes**: wrapId, wrapName, price, mainIngredient, isAvailable
- **relations**: includedIn→BoxLunch, contains→Ingredient

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A component used in the preparation of a wrap or platter item.
- **attributes**: ingredientId, ingredientName, type, isOrganic, isCertified
- **relations**: usedIn→Wrap, usedIn→PlatterItem
