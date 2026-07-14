# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Biodiesel Fuel Grade
- **genus**: `cco:ont00000995`
- **definition**: A specific commercial grade of pure biodiesel fuel (B100) defined by its sulfur content limit and other ASTM D6751 properties.
- **attributes**: gradeCode, sulfurLimit, flashPointMin, cetaneMin, cloudPointMax, acidNumberMax, freeGlycerinMax, totalGlycerinMax
- **relations**: testedBy→ASTMTestMethod, hasProperty→FuelProperty

## Biodiesel Quality Property
- **genus**: `cco:ont00000995`
- **definition**: A measurable physical or chemical characteristic of a biodiesel fuel sample that must conform to ASTM D6751 specifications.
- **attributes**: propertyName, specificationLimit, unitOfMeasure, isCritical, testCondition
- **relations**: conformsTo→BiodieselGrade, measuredIn→FuelSample

## Biodiesel Fuel Sample
- **genus**: `cco:ont00000995`
- **definition**: A physical aliquot of pure biodiesel (B100) collected from a production batch or storage tank for quality testing.
- **attributes**: sampleId, collectionDate, sourceBatchId, storageTemperature, sampleVolume, sampleStatus
- **relations**: testedFor→FuelProperty, belongsBatch→ProductionBatch, testedBy→ASTMTestMethod

## Biodiesel Production Batch
- **genus**: `cco:ont00000995`
- **definition**: A discrete quantity of biodiesel fuel produced in a single manufacturing run or process cycle.
- **attributes**: batchId, productionDate, productionFacilityId, totalVolume, feedstockType, batchStatus
- **relations**: yieldsSample→FuelSample, meetsGrade→BiodieselGrade, storedIn→StorageTank

## ASTM Standard Test Method
- **genus**: `cco:ont00000958`
- **definition**: A standardized laboratory procedure defined by ASTM International for measuring a specific fuel property.
- **attributes**: astmNumber, methodDescription, applicableGrade, isBQ9000Critical
- **relations**: measuresProperty→FuelProperty, appliesToSample→FuelSample

## Fuel Storage Tank
- **genus**: `cco:ont00000995`
- **definition**: A physical container used for storing bulk biodiesel fuel (B100) or petroleum diesel blends.
- **attributes**: tankId, tankCapacity, currentFillLevel, tankMaterial, lastInspectionDate, tankStatus
- **relations**: holdsBatch→ProductionBatch, holdsSample→FuelSample
