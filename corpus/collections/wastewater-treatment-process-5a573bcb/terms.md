# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Wastewater Treatment Process
- **genus**: `bfo:0000015`
- **definition**: An industrial activity involving the application of photocatalysis or photo-electrocatalysis to remove hazardous pollutants from industrial effluents.
- **attributes**: processIdentifier, processType, efficiencyRating, resourceConsumptionRate, status, targetPollutantClass
- **relations**: treats→IndustrialEffluent, developedBy→ResearchProject, utilizes→CatalyticMaterial

## Industrial Effluent
- **genus**: `cco:ont00000995`
- **definition**: A liquid waste stream discharged from industrial facilities containing dissolved, toxic, and non-biodegradable pollutants.
- **attributes**: effluentIdentifier, sourceIndustry, pollutantConcentration, biodegradabilityStatus, toxicityLevel, sampleCollectionDate
- **relations**: treatedBy→WastewaterTreatmentProcess, contains→ChemicalPollutant, originatesFrom→IndustrialFacility

## Catalytic Material
- **genus**: `cco:ont00000995`
- **definition**: A nanotechnology-based material designed to facilitate photocatalytic or photo-electrocatalytic reactions for pollutant degradation.
- **attributes**: materialIdentifier, materialClass, synthesisMethod, surfaceArea, bandGapEnergy, patentStatus
- **relations**: usedIn→WastewaterTreatmentProcess, developedBy→ResearchProject, composedOf→ChemicalElement

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A funded scientific investigation aimed at developing advanced water treatment technologies, such as the DST Water Mission or ONGC Funded Project.
- **attributes**: projectIdentifier, fundingAgency, startDate, endDate, projectStatus, grantAmount
- **relations**: develops→WastewaterTreatmentProcess, develops→CatalyticMaterial, collaboratesWith→ResearchInstitution

## Research Institution
- **genus**: `bfo:0000015`
- **definition**: An academic or industrial organization involved in the research, development, or dissemination of water treatment technologies.
- **attributes**: institutionIdentifier, institutionName, country, institutionType, establishmentDate
- **relations**: collaboratesWith→ResearchProject, awards→AcademicDegree, hosts→Researcher

## Chemical Pollutant
- **genus**: `cco:ont00000995`
- **definition**: A specific toxic, hazardous, or persistent chemical substance found in industrial wastewater, such as dyes or heavy metals.
- **attributes**: pollutantIdentifier, chemicalName, casRegistryNumber, molecularWeight, pollutantClass, concentrationThreshold
- **relations**: presentIn→IndustrialEffluent, targetedBy→WastewaterTreatmentProcess, composedOf→ChemicalElement

## Chemical Element
- **genus**: `cco:ont00000995`
- **definition**: A fundamental chemical substance that constitutes the atomic building blocks of catalytic materials and chemical pollutants.
- **attributes**: elementSymbol, atomicNumber, atomicMass, electronegativity, stateAtSTP
- **relations**: constitutes→CatalyticMaterial, constitutes→ChemicalPollutant
