# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Forest Plantation
- **genus**: `bfo:0000040`
- **definition**: A managed forest area established through planting activities for timber, carbon sequestration, or conservation purposes.
- **attributes**: plantationId, areaHectares, establishmentYear, certificationStatus, primarySpecies, landUseHistory
- **relations**: locatedIn→Country, managedBy→Company, produces→WoodProduct

## Wood Product
- **genus**: `bfo:0000040`
- **definition**: A processed or raw timber product derived from forest plantations, including sawn timber, poles, pulp, and charcoal.
- **attributes**: productId, productName, productCategory, productionVolume, productionYear, revenueUSD
- **relations**: derivedFrom→ForestPlantation, soldTo→Market

## Carbon Credit
- **genus**: `bfo:0000040`
- **definition**: A tradable certificate representing a verified reduction or sequestration of greenhouse gas emissions, generated through forestry or bio-energy projects.
- **attributes**: creditId, standard, issueDate, volumeTonnesCO2, revenueUSD, projectType
- **relations**: generatedBy→ForestPlantation, soldTo→Buyer

## Industrial Facility
- **genus**: `bfo:0000040`
- **definition**: A physical plant or mill used for processing timber into wood products, including sawmills, pole treatment plants, and charcoal production facilities.
- **attributes**: facilityId, facilityName, location, operationalStatus, capacity, revenueUSD
- **relations**: locatedIn→Country, operatedBy→Company, processes→WoodProduct

## Company
- **genus**: `bfo:0000040`
- **definition**: A private Norwegian entity engaged in forestation, wood manufacturing, and carbon credit generation in East Africa.
- **attributes**: companyId, companyName, foundingYear, headquarters, shareholderCount, employeeCount
- **relations**: owns→ForestPlantation, operates→IndustrialFacility, generates→CarbonCredit

## Country
- **genus**: `bfo:0000040`
- **definition**: A sovereign state in East Africa where the company operates forest plantations and industrial facilities.
- **attributes**: countryCode, countryName, region
- **relations**: contains→ForestPlantation, contains→IndustrialFacility
