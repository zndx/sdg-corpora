# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Item
- **genus**: `cco:ont00000995`
- **definition**: A distinct food or beverage product offered for sale by the catering establishment, characterized by its name, price, and composition.
- **attributes**: itemIdentifier, itemName, basePrice, category, isAvailable, minimumOrderQuantity
- **relations**: containsIngredient→FoodIngredient, servedWith→SideItem

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu items, tracked by its specific name and type.
- **attributes**: ingredientId, ingredientName, ingredientType, isAllergen, originRegion
- **relations**: usedIn→MenuItem

## Side Item
- **genus**: `cco:ont00000995`
- **definition**: A supplementary food product included with or available alongside a primary menu item, such as chips or dressings.
- **attributes**: sideId, sideName, sideType, isIncluded
- **relations**: includedWith→MenuItem

## Order Line
- **genus**: `cco:ont00000995`
- **definition**: A specific line item within a catering order, recording the quantity and specific variant of a menu item requested by a customer.
- **attributes**: lineId, quantity, unitPrice, lineTotal, specialInstructions
- **relations**: referencesMenuItem→MenuItem, partOfOrder→CateringOrder

## Catering Order
- **genus**: `cco:ont00000995`
- **definition**: A formal request for food preparation and delivery, characterized by its order number, status, and fulfillment details.
- **attributes**: orderId, orderDate, deliveryDate, orderStatus, totalAmount, contactPhone
- **relations**: containsLine→OrderLine
