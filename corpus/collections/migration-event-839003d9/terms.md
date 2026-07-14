# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Migration Event
- **genus**: `bfo:0000015`
- **definition**: A discrete movement of a Russian citizen across Georgia's border into the country, either as a transit or permanent relocation.
- **attributes**: eventIdentifier, arrivalDate, departureCountry, destinationCity, purposeOfStay, isTransit
- **relations**: originatedFrom→Country, arrivedIn→City, involves→Migrant

## Russian Migrant
- **genus**: `bfo:0000004`
- **definition**: A Russian citizen who has relocated to Georgia, either temporarily or permanently, often fleeing mobilization or political conditions.
- **attributes**: migrantId, nationality, residenceStatus, employmentType, salaryLevel, languageProficiency, integrationIntent
- **relations**: participatedIn→MigrationEvent, residesIn→City, employs→Business, perceivedBy→Local

## Georgian Local
- **genus**: `bfo:0000004`
- **definition**: A citizen or resident of Georgia who holds opinions and perceptions about Russian migrants and their integration.
- **attributes**: localId, nationality, residenceCity, languageProficiency, perceptionOfMigrants, employmentSector
- **relations**: perceives→Migrant, residesIn→City, employs→Business

## Georgian City
- **genus**: `bfo:0000002`
- **definition**: A population center in Georgia where Russian migrants have resettled, such as Tbilisi or Batumi.
- **attributes**: cityId, cityName, region, populationDensity, costOfLivingIndex
- **relations**: hosts→Migrant, hosts→Local, hosts→Business

## Migrant-Owned Business
- **genus**: `bfo:0000040`
- **definition**: A commercial venture established by Russian migrants in Georgia, such as restaurants, bars, or cafes, often catering to a Russophone clientele.
- **attributes**: businessId, businessName, businessType, targetClientele, establishmentDate, operatingStatus
- **relations**: ownedBy→Migrant, locatedIn→City, serves→Local

## Survey Response
- **genus**: `cco:ont00000995`
- **definition**: A recorded response from a survey probing opinions and perceptions of Russian migrants in Georgia, collected by CRRC-Georgia.
- **attributes**: responseId, surveyDate, respondentType, perceptionScore, integrationAssessment, languageBarrierPerception
- **relations**: collectedFrom→Local, collectedFrom→Migrant, about→Migrant
