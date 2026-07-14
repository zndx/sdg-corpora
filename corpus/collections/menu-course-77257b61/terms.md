# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Course
- **genus**: `cco:ont00000995`
- **definition**: A distinct food item or dish offered as part of a structured dining experience.
- **attributes**: courseIdentifier, courseName, courseDescription, isVegetarian, isVegan, courseType
- **relations**: servedIn→DiningPackage, containsIngredient→FoodIngredient

## Dining Package
- **genus**: `cco:ont00000995`
- **definition**: A structured set of courses and beverages offered at a fixed price point.
- **attributes**: packageIdentifier, packageName, totalPrice, courseCount, includesBeverage, packageStatus
- **relations**: includesCourse→MenuCourse, includesBeverage→Beverage

## Beverage
- **genus**: `cco:ont00000995`
- **definition**: A drinkable item served to accompany or conclude a meal.
- **attributes**: beverageIdentifier, beverageName, beverageType, servingTemperature, alcoholContent
- **relations**: pairedWith→MenuCourse, includedIn→DiningPackage

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of a menu course.
- **attributes**: ingredientIdentifier, ingredientName, ingredientCategory, allergenFlag, originRegion, isOrganic
- **relations**: usedIn→MenuCourse, sourcedFrom→Supplier

## Service Charge
- **genus**: `bfo:0000015`
- **definition**: A calculated financial transaction representing a percentage of the bill allocated to staff.
- **attributes**: chargePercentage, chargeAmount, distributionMethod, isMandatory, calculationDate
- **relations**: appliedTo→DiningPackage, distributedTo→StaffRole

## Staff Role
- **genus**: `bfo:0000023`
- **definition**: A functional position within the restaurant responsible for service or preparation.
- **attributes**: roleIdentifier, roleName, department, receivesServiceCharge, receivesDirectTips
- **relations**: assignedTo→ServiceCharge, servesCourse→MenuCourse
