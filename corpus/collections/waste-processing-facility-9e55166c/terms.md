# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Waste Processing Facility
- **genus**: `bfo:0000040`
- **definition**: A material entity that serves as the physical location where municipal solid waste and recyclable materials are received, processed, and converted into energy or landfill-bound refuse.
- **attributes**: facilityId, facilityName, location, operationalStatus, wasteCapacityTonsPerDay, energyOutputMWhPerDay, lastInspectionDate
- **relations**: processesWaste→WasteStream, locatedInJurisdiction→Jurisdiction, employsStaff→StaffMember

## Waste Stream
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a specific category of municipal solid waste or recyclable material delivered by private haulers for processing.
- **attributes**: streamId, streamType, sourceJurisdiction, deliveryFrequency, averageWeightTons, contaminationRatePercent
- **relations**: deliveredToFacility→WasteProcessingFacility, processedBySystem→IntegratedWasteSystem

## Integrated Waste System
- **genus**: `bfo:0000015`
- **definition**: A multi-step process activity employed by the authority to dispose of and process trash, saving landfill capacity and creating clean, renewable energy.
- **attributes**: systemId, systemName, efficiencyRating, landfillCapacitySavedPercent, energyGeneratedMWh, lastAuditDate
- **relations**: processesWasteStream→WasteStream, operatedByFacility→WasteProcessingFacility, generatesEnergy→EnergyOutput

## Energy Output
- **genus**: `bfo:0000040`
- **definition**: A material entity representing the clean, renewable electricity generated as a byproduct of the integrated waste processing system.
- **attributes**: outputId, energyType, quantityMWh, gridConnectionStatus, qualityStandard, measurementDate
- **relations**: producedBySystem→IntegratedWasteSystem, suppliesToGrid→PowerGrid

## Power Grid
- **genus**: `bfo:0000040`
- **definition**: A material entity representing the electrical infrastructure network to which renewable energy from waste processing is supplied.
- **attributes**: gridId, gridOperator, voltageLevel, capacityMVA, lastMaintenanceDate
- **relations**: receivesEnergyFrom→EnergyOutput, servesRegion→Jurisdiction

## Staff Member
- **genus**: `bfo:0000023`
- **definition**: A role played by a person who is employed by the authority to perform specific operational, accounting, or IT functions.
- **attributes**: staffId, fullName, roleTitle, employmentStatus, yearsOfExperience, educationLevel
- **relations**: worksAtFacility→WasteProcessingFacility, reportsTo→StaffMember, managesSystem→IntegratedWasteSystem

## Jurisdiction
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a geographic area, such as a county or city, whose residents and businesses generate waste managed by the authority.
- **attributes**: jurisdictionId, jurisdictionName, jurisdictionType, population, wasteGenerationRateTonsPerCapita
- **relations**: suppliesWasteToFacility→WasteProcessingFacility, servedByGrid→PowerGrid
