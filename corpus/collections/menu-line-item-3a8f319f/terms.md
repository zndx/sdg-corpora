# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Line Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct purchasable offering on the dessert and beverage menu, including its name, description, and base price.
- **attributes**: itemIdentifier, displayName, basePrice, category, servingSize, isAlaModeAvailable
- **relations**: containsIngredient→Ingredient, hasBasePrice→PricePoint, hasOptionalTopping→ToppingOption

## Ingredient
- **genus**: `bfo:0000040`
- **definition**: A physical food substance used as a component in the preparation of menu items.
- **attributes**: ingredientId, name, state, isAllergen, origin
- **relations**: isComponentOf→MenuLineItem

## Price Point
- **genus**: `cco:ont00000995`
- **definition**: A specific monetary value associated with a menu item or an add-on option.
- **attributes**: priceId, amount, currencyCode, priceType
- **relations**: isPriceFor→MenuLineItem

## Topping Option
- **genus**: `bfo:0000040`
- **definition**: A selectable add-on component or modification that can be applied to a base menu item.
- **attributes**: optionId, optionName, isChoiceBased, associatedPriceId
- **relations**: isApplicableTo→MenuLineItem, isRealizedBy→Ingredient

## Beverage Serving
- **genus**: `bfo:0000040`
- **definition**: A specific volume of a prepared drink offered on the menu.
- **attributes**: servingId, volumeOz, preparationMethod, isSweetened
- **relations**: isServingOf→MenuLineItem
