# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Menu Course
- **genus**: `cco:ont00000995`
- **definition**: A single dish or beverage item offered as part of a structured multi-course dining experience.
- **attributes**: courseIdentifier, courseName, price, isVegetarian, isVegan, description
- **relations**: partOfMenu→DiningPackage, containsIngredient→FoodIngredient

## Dining Package
- **genus**: `cco:ont00000995`
- **definition**: A bundled offering of multiple menu courses and beverages sold at a fixed price.
- **attributes**: packageId, packageName, totalPrice, currencyCode, includesChampagneCocktail, serviceChargePercentage
- **relations**: includesCourse→MenuCourse, appliesToRestaurant→RestaurantOutlet

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu courses.
- **attributes**: ingredientId, ingredientName, category, allergenFlag, originRegion
- **relations**: usedInCourse→MenuCourse, suppliedByVendor→FoodSupplier

## Restaurant Outlet
- **genus**: `bfo:0000015`
- **definition**: A physical location where dining services are provided to customers.
- **attributes**: outletId, outletName, addressLine1, city, postalCode, operatingHours
- **relations**: hostsPackage→DiningPackage, employsStaff→RestaurantStaff

## Restaurant Staff
- **genus**: `bfo:0000023`
- **definition**: An individual performing a specific role within the restaurant's service or kitchen operations.
- **attributes**: staffId, staffName, roleType, shiftStart, shiftEnd, receivesServiceChargeShare
- **relations**: worksAtOutlet→RestaurantOutlet, servesCourse→MenuCourse

## Service Charge Record
- **genus**: `cco:ont00000995`
- **definition**: A financial record tracking the collection and distribution of service charges to staff.
- **attributes**: recordId, transactionDate, totalChargeAmount, chargePercentage, paymentMethod, isDeductedByCompany
- **relations**: linkedToPackage→DiningPackage, distributedToStaff→RestaurantStaff
