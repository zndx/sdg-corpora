# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage product offered for sale by the catering establishment, characterized by its name, price, and composition.
- **attributes**: itemId, name, price, category, status, minimumOrderQuantity
- **relations**: containsIngredient→Ingredient, servedWithSide→SideDish, partOfCategory→MenuCategory

## Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw food component used in the preparation of menu items, tracked by its specific name and role in recipes.
- **attributes**: ingredientId, name, type, allergenFlag, sourcingRegion
- **relations**: usedInMenuItem→MenuItem, suppliedByVendor→Vendor

## Menu Category
- **genus**: `cco:ont00000958`
- **definition**: A logical grouping of menu items that share a common meal type or preparation style, used for organizational and ordering purposes.
- **attributes**: categoryId, name, displayOrder, includesSide
- **relations**: containsMenuItem→MenuItem, appliesToOrderType→OrderType

## Side Dish
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food item provided with main courses, such as chips or dips, that accompanies the primary menu item.
- **attributes**: sideId, name, isHouseMade, includedInPrice
- **relations**: accompaniesMenuItem→MenuItem, servedWithCategory→MenuCategory

## Order Type
- **genus**: `cco:ont00000958`
- **definition**: A classification of customer purchase based on volume, timing, or specific constraints, such as minimum quantity requirements.
- **attributes**: orderTypeId, name, minimumQuantity, requiresAdvanceNotice
- **relations**: appliesToMenuItem→MenuItem, enforcedByPolicy→Policy

## Policy
- **genus**: `cco:ont00000958`
- **definition**: A business rule or constraint governing the sale and fulfillment of menu items, such as minimum order thresholds or preparation requirements.
- **attributes**: policyId, description, effectiveDate, isActive
- **relations**: governsOrderType→OrderType, appliesToMenuItem→MenuItem
