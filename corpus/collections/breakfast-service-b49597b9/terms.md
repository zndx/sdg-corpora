# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Breakfast Service
- **genus**: `bfo:0000015`
- **definition**: A scheduled daily meal service offering a selection of food and beverage items during a fixed time window.
- **attributes**: serviceId, name, startTime, endTime, status, isBuffetStyle
- **relations**: offers→MenuOption, servesTo→GuestReservation

## Menu Option
- **genus**: `bfo:0000015`
- **definition**: A specific food or beverage item available within a breakfast service, often with customizable components.
- **attributes**: optionId, name, category, isGlutenFree, isVegetarian, isVegan, servingSize
- **relations**: partOf→BreakfastService, includesIngredient→FoodIngredient, hasBeverageChoice→BeverageType

## Food Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A raw or processed food component used in the preparation of menu options.
- **attributes**: ingredientId, name, origin, allergenFlag, isLocalSourced, storageTemp
- **relations**: usedIn→MenuOption

## Beverage Type
- **genus**: `cco:ont00000995`
- **definition**: A distinct category of drink served during the breakfast service.
- **attributes**: beverageId, name, type, servingTemp, caffeinated
- **relations**: servedWith→MenuOption

## Guest Reservation
- **genus**: `bfo:0000015`
- **definition**: A booking record for a guest to access the breakfast service.
- **attributes**: reservationId, guestName, checkInDate, roomNumber, dietaryRestrictions, status
- **relations**: bookedFor→BreakfastService, requestedOption→MenuOption
