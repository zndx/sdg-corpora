# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Building Shape
- **genus**: `bfo:0000040`
- **definition**: A spatial entity representing the geometric configuration of a building's ground plan and vertical division.
- **attributes**: shapeId, groundPlanType, verticalDivisionType, volume, surfaceArea, shapeFactor, aerodynamicCoefficient
- **relations**: hasEnergySimulation→EnergySimulation, hasGlazingRatio→GlazingRatio

## Energy Simulation
- **genus**: `bfo:0000015`
- **definition**: A computational process that models the energy flows and performance of a building based on its geometric and material properties.
- **attributes**: simulationId, simulationDate, energyConsumption, heatingLoad, coolingLoad, ventilationRate, indoorTemperature, outdoorTemperature
- **relations**: analyzesBuildingShape→BuildingShape, usesBuildingMaterial→BuildingMaterial

## Glazing Ratio
- **genus**: `bfo:0000040`
- **definition**: A quantitative attribute representing the percentage of glazing area relative to the total wall area of a building facade.
- **attributes**: glazingRatioId, wallArea, glazingArea, ratioPercentage, orientation
- **relations**: appliedToBuildingShape→BuildingShape

## Building Material
- **genus**: `bfo:0000040`
- **definition**: A physical substance used in the construction of a building's envelope or structure, characterized by its thermal and structural properties.
- **attributes**: materialId, materialName, thermalConductivity, density, thickness, installationDate
- **relations**: usedInEnergySimulation→EnergySimulation

## Optimization Process
- **genus**: `bfo:0000015`
- **definition**: A methodological activity aimed at minimizing costs or maximizing efficiency in the use of auxiliary structures or building design parameters.
- **attributes**: processId, startDate, endDate, costReduction, efficiencyGain, status
- **relations**: optimizesBuildingShape→BuildingShape, usesEnergySimulationData→EnergySimulation
