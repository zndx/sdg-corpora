# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Parasitic Weed Species
- **genus**: `bfo:0000040`
- **definition**: A distinct taxonomic species of parasitic plant that infects host crops in agricultural systems.
- **attributes**: speciesCode, commonName, parasiticType, chlorophyllPresence, seedProductionRate, seedLongevityYears, seedSizeMicrograms, germinationCueRequired
- **relations**: parasitises→CropSpecies, infects→AgriculturalField, exhibits→GerminationRequirement

## Crop Species
- **genus**: `bfo:0000040`
- **definition**: A cultivated plant species grown for agricultural production in African farming systems.
- **attributes**: scientificName, cropType, growthRegion, isHostForStriga, isHostForRhamphicarpa
- **relations**: isParasitizedBy→ParasiticWeedSpecies, growsIn→AgriculturalField

## Agricultural Field
- **genus**: `bfo:0000004`
- **definition**: A specific parcel of land used for crop cultivation with defined soil and hydrological characteristics.
- **attributes**: fieldId, landscapePosition, soilDrainage, soilMoistureLevel, primaryCrop, affectedHouseholds
- **relations**: hosts→CropSpecies, infestedBy→ParasiticWeedSpecies, locatedIn→GeographicRegion

## Germination Requirement
- **genus**: `bfo:0000015`
- **definition**: The specific biochemical or environmental conditions necessary for a parasitic weed seed to initiate germination.
- **attributes**: requirementType, cueSubstance, moistureThreshold, hostRootProximityRequired
- **relations**: requiredBy→ParasiticWeedSpecies

## Geographic Region
- **genus**: `bfo:0000004`
- **definition**: A defined geographical area in Africa where specific agricultural and ecological conditions prevail.
- **attributes**: regionCode, regionName, climateZone, dominantSoilType
- **relations**: contains→AgriculturalField
