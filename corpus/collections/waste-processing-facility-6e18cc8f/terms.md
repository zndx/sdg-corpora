# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Waste Processing Facility
- **genus**: `bfo:0000040`
- **definition**: A physical plant where municipal solid waste and recyclable materials are received, processed, and converted into energy or prepared for disposal.
- **attributes**: facilityId, facilityName, location, capacityTonsPerDay, operationalStatus, commissioningDate
- **relations**: processes→WasteStream, produces→EnergyOutput, locatedIn→Jurisdiction

## Waste Stream
- **genus**: `bfo:0000002`
- **definition**: A continuous flow of municipal solid waste and recyclable materials delivered by private haulers to a processing facility.
- **attributes**: streamId, wasteType, originJurisdiction, dailyVolumeTons, collectionFrequency, haulerContractId
- **relations**: deliveredTo→WasteProcessingFacility, originatesFrom→Jurisdiction

## Energy Output
- **genus**: `bfo:0000002`
- **definition**: Clean, renewable electricity generated from the processing of municipal solid waste.
- **attributes**: outputId, energyType, capacityMegawatts, dailyGenerationMWh, gridConnectionStatus, measurementDate
- **relations**: generatedBy→WasteProcessingFacility, supplies→GridDistribution

## Financial Report
- **genus**: `cco:ont00000995`
- **definition**: A formal record of financial activities, including budgeting, accounting, and risk management data for the organization.
- **attributes**: reportId, reportType, fiscalYear, reportingPeriodStart, reportingPeriodEnd, status, preparedByStaffId
- **relations**: covers→WasteProcessingFacility, preparedBy→FinancialStaff, approvedBy→ExecutiveTeam

## Financial Staff
- **genus**: `bfo:0000002`
- **definition**: An individual employed to perform accounting, budgeting, and financial analysis tasks within the organization.
- **attributes**: staffId, fullName, role, employmentStatus, hireDate, supervisorStaffId
- **relations**: prepares→FinancialReport, supervises→FinancialStaff, assignedTo→Department

## Department
- **genus**: `bfo:0000002`
- **definition**: An organizational unit responsible for specific functional areas such as finance, IT, or operations.
- **attributes**: departmentId, departmentName, headStaffId, budgetAllocation, establishedDate
- **relations**: employs→FinancialStaff, oversees→WasteProcessingFacility, manages→FinancialReport
