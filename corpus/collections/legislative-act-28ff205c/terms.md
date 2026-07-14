# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legislative Act
- **genus**: `bfo:0000040`
- **definition**: A statutory or regulatory measure enacted by a legislative body that alters legal permissions or restrictions.
- **attributes**: actIdentifier, jurisdiction, enactmentDate, status, targetChemicalClass, legalEffect
- **relations**: targets→ChemicalSubstance, enactedBy→LegislativeBody, affects→PublicHealthRisk

## Governor
- **genus**: `bfo:0000002`
- **definition**: An elected official serving as the chief executive of a US state.
- **attributes**: governorId, fullName, state, termStartDate, termEndDate, priorProfession, commuteMode
- **relations**: residesIn→State, usesVehicle→Vehicle, commutesTo→GovernmentOffice

## Vehicle
- **genus**: `bfo:0000040`
- **definition**: A manufactured means of transport used for commuting or official duties.
- **attributes**: vehicleId, make, model, year, fuelType, emissionLevel
- **relations**: operatedBy→Driver, usedBy→Governor

## Driver
- **genus**: `bfo:0000002`
- **definition**: A person or role responsible for operating a vehicle.
- **attributes**: driverId, fullName, employer, licenseNumber, shiftStatus
- **relations**: operates→Vehicle, employedBy→StateGovernment

## Disposable Product
- **genus**: `bfo:0000040`
- **definition**: A manufactured item designed for single-use or short-term disposal.
- **attributes**: productCode, productName, materialComposition, shelfLife, disposalMethod, plannedObsolescence
- **relations**: consumedBy→Consumer, disposedIn→WasteFacility

## Consumer
- **genus**: `bfo:0000002`
- **definition**: An individual who purchases or uses goods and services.
- **attributes**: consumerId, fullName, residenceState, lifestyleType
- **relations**: purchases→DisposableProduct, residesIn→State

## Health Index
- **genus**: `bfo:0000040`
- **definition**: A composite metric evaluating population well-being based on life expectancy, happiness, and resource consumption.
- **attributes**: indexId, indexName, calculationDate, lifeExpectancyScore, happinessScore, ecologicalFootprint, globalRank
- **relations**: measures→State, derivedFrom→SurveyData

## State
- **genus**: `bfo:0000040`
- **definition**: A constituent political entity of the United States with defined geographic and legal boundaries.
- **attributes**: stateCode, stateName, population, gdp, pesticideBanStatus, happyPlanetRank
- **relations**: hasGovernor→Governor, subjectTo→LegislativeAct, rankedIn→HealthIndex
