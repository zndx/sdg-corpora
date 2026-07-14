# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Chemical Substance
- **genus**: `bfo:0000040`
- **definition**: A material entity that is composed of atoms and molecules and has a specific chemical structure and properties.
- **attributes**: casNumber, commonName, molecularFormula, physicalState, solubilityInWater, solubilityInOrganicSolvents, meltingPoint, boilingPoint
- **relations**: hasCarcinogenicityStatus→CarcinogenicityAssessment, hasHalfLifeInHumans→PharmacokineticParameter, hasHalfLifeInRodents→PharmacokineticParameter, bindsToReceptor→BiologicalReceptor, isContaminantIn→CommercialProduct

## Carcinogenicity Assessment
- **genus**: `cco:ont00000995`
- **definition**: A record or dataset that documents the evaluation of a substance's potential to cause cancer in humans or animals.
- **attributes**: assessmentDate, carcinogenicityStatus, evidenceLevel, reportingBody, reportYear, reportTitle, isMutagenic, genotoxicityFindings
- **relations**: assessesChemical→ChemicalSubstance, basedOnHumanStudies→EpidemiologicalStudy, basedOnAnimalStudies→AnimalCarcinogenicityStudy, usesMechanismOfAction→MechanismOfCarcinogenesis

## Epidemiological Study
- **genus**: `bfo:0000015`
- **definition**: A research activity that investigates the distribution and determinants of health-related states or events in specified populations.
- **attributes**: studyId, studyStartDate, studyEndDate, populationSize, exposureLevel, cohortLocation, cancerTypesObserved, mortalityIncrease
- **relations**: studiesExposureTo→ChemicalSubstance, conductedBy→ResearchInstitution, publishedIn→ScientificPublication, evaluatedBy→CarcinogenicityAssessment

## Animal Carcinogenicity Study
- **genus**: `bfo:0000015`
- **definition**: A research activity that tests the carcinogenic potential of a substance in experimental animals.
- **attributes**: studyId, studyStartDate, studyEndDate, animalSpecies, exposureRoute, tissueSitesAffected, doseDependent, tumorIncidence
- **relations**: testsSubstanceOn→ChemicalSubstance, conductedBy→ResearchInstitution, publishedIn→ScientificPublication, evaluatedBy→CarcinogenicityAssessment

## Mechanism of Carcinogenesis
- **genus**: `bfo:0000015`
- **definition**: A biological process or activity that describes how a substance induces cancer at the molecular and cellular level.
- **attributes**: mechanismId, mechanismName, isNecessaryStep, isSufficientStep, observedInSpecies, biologicalResponse
- **relations**: initiatedBy→ChemicalSubstance, involvesReceptor→BiologicalReceptor, leadsTo→CarcinogenicityAssessment

## Biological Receptor
- **genus**: `bfo:0000040`
- **definition**: A macromolecule that receives signals and triggers a response in a cell.
- **attributes**: receptorId, receptorName, ubiquitousInVertebrates, affinityForTCDD, function
- **relations**: bindsWith→ChemicalSubstance, mediatesMechanism→MechanismOfCarcinogenesis

## Pharmacokinetic Parameter
- **genus**: `cco:ont00000995`
- **definition**: A measured or recorded value that describes the rate at which a substance is eliminated from the body.
- **attributes**: parameterId, parameterName, value, unit, species, sourceReference
- **relations**: describesChemical→ChemicalSubstance, measuredIn→Study
