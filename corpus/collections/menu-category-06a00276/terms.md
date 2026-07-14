# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Category
- **genus**: `bfo:0000040`
- **definition**: A distinct section of the restaurant's food service offering, such as Salads or Sandwiches.
- **attributes**: categoryName, displayOrder
- **relations**: contains→FoodItem

## Food Item
- **genus**: `bfo:0000040`
- **definition**: A specific dish or food product available for purchase at the establishment.
- **attributes**: itemName, basePrice, servingWeight, isVegetarian, isGlutenFree, allergenCodes
- **relations**: belongs_to→MenuCategory, contains_ingredient→FoodIngredient, has_cheese_option→CheeseType

## Food Ingredient
- **genus**: `bfo:0000040`
- **definition**: A distinct component or sub-recipe used in the preparation of a food item.
- **attributes**: ingredientName, isRaw, isCooked, isCondiment, isSideDish
- **relations**: used_in→FoodItem, is_subtype_of→FoodIngredient

## Cheese Type
- **genus**: `bfo:0000040`
- **definition**: A specific variety of cheese available as a topping or ingredient for certain food items.
- **attributes**: cheeseName
- **relations**: available_for→FoodItem

## Side Dish
- **genus**: `bfo:0000040`
- **definition**: A supplementary food item served alongside a main dish or available as a substitution.
- **attributes**: sideName, substitutionCost, isDefaultSide
- **relations**: served_with→FoodItem, substitutes_for→SideDish
