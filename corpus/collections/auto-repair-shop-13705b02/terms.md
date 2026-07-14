# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Auto Repair Shop
- **genus**: `bfo:0000040`
- **definition**: A material entity that is a business establishment providing automotive repair and maintenance services.
- **attributes**: shopId, shopName, establishedDate, shopType, dailyProductionTarget, currentDailyProduction, isProfitable
- **relations**: employs→Technician, serves→Customer, uses→DiagnosticTool

## Technician
- **genus**: `bfo:0000004`
- **definition**: A material entity that is a person employed by an auto repair shop to perform automotive repair and maintenance tasks.
- **attributes**: technicianId, firstName, lastName, hourlyRate, skillLevel, isAssignedToRepair
- **relations**: worksAt→AutoRepairShop, performs→RepairTask

## Repair Task
- **genus**: `bfo:0000015`
- **definition**: A process that involves diagnosing, repairing, or maintaining a vehicle component or system.
- **attributes**: taskId, taskDescription, estimatedDuration, actualDuration, taskStatus, laborCost
- **relations**: performedBy→Technician, relatedTo→Customer, uses→DiagnosticTool

## Customer
- **genus**: `bfo:0000004`
- **definition**: A material entity that is a person or entity that receives automotive repair and maintenance services from an auto repair shop.
- **attributes**: customerId, firstName, lastName, contactNumber, satisfactionScore, isRavingFan
- **relations**: receivesServiceFrom→AutoRepairShop, hasRepairTask→RepairTask

## Diagnostic Tool
- **genus**: `bfo:0000040`
- **definition**: A material entity that is a device or software application used to diagnose and troubleshoot automotive issues.
- **attributes**: toolId, toolName, toolType, isFree, lastCalibrationDate
- **relations**: usedBy→Technician, supports→RepairTask
