# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Category
- **genus**: `bfo:0000040`
- **definition**: A classification grouping menu items by meal period or preparation style, such as breakfast, brunch, or sandwich.
- **attributes**: categoryCode, categoryLabel, availabilityStart, availabilityEnd
- **relations**: contains→MenuItem

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage product offered for sale, defined by its ingredients, preparation method, and pricing tiers.
- **attributes**: itemCode, itemName, basePrice, isVegetarian, isVegan, isGlutenFree, servingStyle
- **relations**: belongs_to_category→MenuCategory, contains_ingredient→FoodIngredient

## Food Ingredient
- **genus**: `bfo:0000040`
- **definition**: A raw or processed food component used in the preparation of menu items, such as proteins, vegetables, cheeses, or breads.
- **attributes**: ingredientCode, ingredientName, isProtein, isDairy, isGlutenSource, allergenCategory
- **relations**: used_in→MenuItem

## Pricing Tier
- **genus**: `cco:ont00000958`
- **definition**: A specific price point associated with a menu item based on portion size, customization, or meal period.
- **attributes**: tierCode, tierLabel, price, portionSize, isAddOn
- **relations**: applies_to→MenuItem, includes_addon→PricingAddon

## Pricing Add-On
- **genus**: `cco:ont00000995`
- **definition**: An optional modification or extra component that can be added to a base menu item for an additional fee.
- **attributes**: addonCode, addonName, additionalCost, addonType
- **relations**: modifies→MenuItem

## Bread Type
- **genus**: `bfo:0000040`
- **definition**: A specific variety of house-made bread used as a base for sandwiches or toast, defined by its flour type and preparation.
- **attributes**: breadCode, breadName, isHouseMade, isGlutenFree, isVegan
- **relations**: used_in→MenuItem
