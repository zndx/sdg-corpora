# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Protein Structure
- **genus**: `cco:ont00000995`
- **definition**: A three-dimensional conformational arrangement of a polypeptide chain, modeled or characterized computationally.
- **attributes**: structureId, pdbCode, resolution, method, dateResolved, chainCount, rmsdValue
- **relations**: modeledUsing→SoftwareTool, associatedWithProtein→Protein

## Protein
- **genus**: `cco:ont00000995`
- **definition**: A biological macromolecule composed of amino acid polymers, such as an ABA receptor or a proteolytic enzyme.
- **attributes**: proteinId, uniprotAccession, geneName, organism, molecularWeight, sequenceLength, function
- **relations**: hasStructure→ProteinStructure, inhibits→SmallMolecule, involvedInPathogenesis→Pathogen

## Small Molecule
- **genus**: `cco:ont00000995`
- **definition**: A low molecular weight organic compound, such as a drug candidate, toxin, or natural product.
- **attributes**: moleculeId, smiles, iupacName, molecularFormula, molecularWeight, activityClass, toxicityScore, optimizationStatus
- **relations**: targets→Protein, usedInFormulation→FoodFormulation

## Molecular Dynamics Simulation
- **genus**: `bfo:0000015`
- **definition**: A computational process simulating the physical movements of atoms and molecules over time.
- **attributes**: simulationId, startTime, endTime, duration, temperature, pressure, forceField, convergenceStatus
- **relations**: usesSoftware→SoftwareTool, simulatesStructure→ProteinStructure

## Software Tool
- **genus**: `cco:ont00000958`
- **definition**: A computational program or package used for modeling, simulation, or analysis in chemical biology.
- **attributes**: toolId, toolName, version, licenseType, primaryFunction, developer
- **relations**: usedFor→MolecularDynamicsSimulation, usedFor→ProteinStructure, usedFor→SmallMolecule

## Pathogen
- **genus**: `cco:ont00000995`
- **definition**: A microorganism capable of causing disease, such as Rhizoctonia solani.
- **attributes**: pathogenId, scientificName, commonName, hostPlant, diseaseName, geographicDistribution
- **relations**: causesDiseaseIn→CropPlant, producesEnzyme→Protein

## Crop Plant
- **genus**: `cco:ont00000995`
- **definition**: A cultivated plant species grown for agricultural purposes.
- **attributes**: plantId, speciesName, variety, growthStage, stressToleranceLevel, yieldMetric
- **relations**: affectedBy→Pathogen, treatedWith→SmallMolecule

## Food Formulation
- **genus**: `cco:ont00000995`
- **definition**: A prepared mixture or compound designed for application in the food industry, such as a natural colorant.
- **attributes**: formulationId, productCode, colorantSource, concentration, phLevel, shelfLife, regulatoryStatus
- **relations**: contains→SmallMolecule, intendedFor→FoodIndustryApplication

## Food Industry Application
- **genus**: `bfo:0000015`
- **definition**: A specific use case or process within the food industry where a formulation is applied.
- **attributes**: applicationId, applicationType, targetFoodMatrix, dosage, efficacyScore
- **relations**: usesFormulation→FoodFormulation
