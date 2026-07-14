# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Pastoral Community
- **genus**: `bfo:0000040`
- **definition**: A human social group whose livelihood is primarily based on pastoralism, such as the Gabra, Rendille, or Dasanech peoples in Northern Kenya.
- **attributes**: communityName, territoryName, primaryLivelihood, historicalPresence
- **relations**: inhabits→Territory, practices→WaterManagementPractice, shiftsTo→AlternativeLivelihood

## Territory
- **genus**: `bfo:0000004`
- **definition**: A defined geographical area, such as the Chalbi desert or Marsabit County, shaped by water resources and used by pastoral communities.
- **attributes**: territoryName, location, areaSize, dominantEcosystem
- **relations**: contains→WellWateredPlace, borders→Territory, usedBy→PastoralCommunity

## Well-Watered Place
- **genus**: `bfo:0000004`
- **definition**: A specific location within arid lands that has reliable access to water, serving as a nexus for socio-ecological adaptation and territorial delimitation.
- **attributes**: placeName, waterSource, reliability, socioEcologicalNiche
- **relations**: locatedIn→Territory, supports→PastoralCommunity, influences→WaterManagementPractice

## Water Management Practice
- **genus**: `bfo:0000015`
- **definition**: Traditional or modern methods used by pastoral communities to manage water resources in arid and semi-arid lands.
- **attributes**: practiceName, conservationLevel, historicalPeriod, effectiveness
- **relations**: practicedBy→PastoralCommunity, appliedIn→Territory, adaptedTo→HydrologicalStress

## Hydrological Stress
- **genus**: `bfo:0000015`
- **definition**: A condition of water scarcity or limited availability in arid and semi-arid lands, impacting pastoral livelihoods and water management.
- **attributes**: stressLevel, duration, affectedArea, impactOnLivelihood
- **relations**: affects→PastoralCommunity, occursIn→Territory, influences→WaterManagementPractice

## Alternative Livelihood
- **genus**: `bfo:0000015`
- **definition**: Non-pastoral economic activities adopted by pastoral communities in response to environmental or socio-economic changes, such as agro-pastoralism or wage labor.
- **attributes**: livelihoodType, adoptionRate, primaryDrivers, sustainability
- **relations**: adoptedBy→PastoralCommunity, replaces→Pastoralism, supportedBy→WellWateredPlace
