# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Carpet
- **genus**: `cco:ont00000995`
- **definition**: A woven textile floor covering or wall hanging produced in West and Central Asia, serving functional, decorative, and ceremonial purposes.
- **attributes**: carpetId, designStyle, originRegion, productionDate, dimensions, materialComposition, currentLocation, conditionStatus
- **relations**: producedBy→Workshop, displayedIn→RoyalHousehold, tradedTo→MarketRegion, exhibitsPattern→DesignPattern

## Carpet Workshop
- **genus**: `bfo:0000015`
- **definition**: A state-sponsored or private production facility where carpets were designed, woven, and finished through a division of labor.
- **attributes**: workshopId, location, establishedDate, patron, specialization, productionVolume, operationalStatus
- **relations**: employs→Craftsperson, produces→Carpet, supplies→MarketRegion

## Carpet Craftsperson
- **genus**: `bfo:0000023`
- **definition**: An individual worker engaged in specific stages of carpet production, such as spinning, dyeing, or knotting.
- **attributes**: craftspersonId, role, gender, region, yearsOfExperience, affiliatedWorkshop
- **relations**: worksAt→Workshop, specializesIn→CraftProcess

## Carpet Design Pattern
- **genus**: `cco:ont00000995`
- **definition**: A visual motif or structural arrangement used in carpet weaving, such as vegetal arabesques, geometric tessellations, or garden layouts.
- **attributes**: patternId, patternType, complexityLevel, culturalOrigin, visualImpact, repetitionFrequency
- **relations**: usedIn→Carpet, inspiredBy→CulturalConcept

## Royal Household
- **genus**: `bfo:0000015`
- **definition**: A royal residence or administrative unit where valuable carpets were stored, rotated, and displayed to project power and wealth.
- **attributes**: householdId, location, rulingDynasty, storageCapacity, rotationPeriod, custodianName
- **relations**: stores→Carpet, manages→CarpetHouse, displays→DesignPattern

## Carpet Market Region
- **genus**: `bfo:0000015`
- **definition**: A geographic area where carpets were traded, consumed, or culturally integrated, such as Europe or the Far East.
- **attributes**: regionId, regionName, importVolume, primaryUse, culturalAdoption, tradeRoute
- **relations**: imports→Carpet, suppliedBy→Workshop
