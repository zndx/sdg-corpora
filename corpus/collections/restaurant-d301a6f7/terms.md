# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Restaurant
- **genus**: `bfo:0000040`
- **definition**: A commercial establishment providing food and beverage service to the public.
- **attributes**: restaurantId, name, city, state, operatingSince, corkageFee, hasGrandAward, grandAwardYear
- **relations**: hasWineSpectatorGrandAward→WineAward, hasChef→Person, hasOwner→Person, hostsWineDinner→Event

## Wine Award
- **genus**: `bfo:0000040`
- **definition**: A formal recognition or accolade granted to a restaurant or wine list based on specific criteria.
- **attributes**: awardId, awardName, issuingOrganization, awardYear, minimumSelections, isGrandAward
- **relations**: awardedTo→Restaurant, grantedBy→Organization

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being, including owners, chefs, winemakers, and celebrities.
- **attributes**: personId, firstName, lastName, role, isCelebrity
- **relations**: ownsRestaurant→Restaurant, worksAsChef→Restaurant, producesWine→Wine, hasVineyard→Vineyard

## Wine
- **genus**: `bfo:0000040`
- **definition**: An alcoholic beverage made from fermented grapes, including specific vintages and producers.
- **attributes**: wineId, producer, vintage, variety, appellation, vineyardSource, parkerRating, containsResveratrol
- **relations**: producedBy→Person, sourcedFromVineyard→Vineyard, servedAt→Restaurant, pairsWithFood→Food

## Vineyard
- **genus**: `bfo:0000040`
- **definition**: A piece of land dedicated to the cultivation of grapevines.
- **attributes**: vineyardId, name, location, acres, averageVineAge, ownershipType
- **relations**: suppliesWine→Wine, ownedBy→Person

## Event
- **genus**: `bfo:0000003`
- **definition**: A scheduled activity or occurrence, such as a wine dinner or a cooking class.
- **attributes**: eventId, eventName, eventType, date, minParticipants, isSpecialMenu
- **relations**: hostedBy→Restaurant, featuresWine→Wine, featuresWinemaker→Person

## Food
- **genus**: `bfo:0000040`
- **definition**: A substance consumed to provide nutritional support, including specific ingredients and dishes.
- **attributes**: foodId, name, category, isStaining, preparationMethod
- **relations**: pairsWithWine→Wine, servedAt→Restaurant

## Chemical
- **genus**: `bfo:0000040`
- **definition**: A substance with distinct molecular composition, such as resveratrol found in wine.
- **attributes**: chemicalId, name, locationInWine, biologicalEffect, testedOnOrganism
- **relations**: foundIn→Wine, studiedBy→Person
