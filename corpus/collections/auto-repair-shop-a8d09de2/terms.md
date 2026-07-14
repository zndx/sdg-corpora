# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Auto Repair Shop
- **genus**: `cco:ont00000995`
- **definition**: A business entity that provides automotive repair and maintenance services to customers.
- **attributes**: shopId, shopName, establishedDate, shopType, dailyProductionTarget, customerSatisfactionScore, isProfitable
- **relations**: employs→Technician, serves→Customer, uses→ScanTool

## Automotive Technician
- **genus**: `bfo:0000023`
- **definition**: A person performing automotive repair and maintenance tasks within an auto repair shop.
- **attributes**: techId, fullName, hourlyRate, skillLevel, isOwner, dailyTasksCompleted
- **relations**: worksAt→AutoRepairShop, performs→RepairJob

## Automotive Repair Job
- **genus**: `bfo:0000015`
- **definition**: A specific automotive repair or maintenance task performed on a vehicle.
- **attributes**: jobId, jobType, startTime, endTime, laborCost, partsCost, status
- **relations**: assignedTo→Technician, performedOn→Vehicle, generates→Invoice

## Customer Vehicle
- **genus**: `cco:ont00000995`
- **definition**: A motor vehicle brought to an auto repair shop for service or repair.
- **attributes**: vin, make, model, year, mileage, customerName
- **relations**: ownedBy→Customer, receives→RepairJob

## Auto Repair Customer
- **genus**: `bfo:0000004`
- **definition**: An individual or entity that engages an auto repair shop for vehicle service.
- **attributes**: customerId, fullName, contactPhone, emailAddress, totalVisits, satisfactionRating
- **relations**: submits→Vehicle, paysFor→Invoice

## Service Invoice
- **genus**: `cco:ont00000958`
- **definition**: A financial record detailing charges for automotive repair services and parts.
- **attributes**: invoiceId, issueDate, totalAmount, taxAmount, paymentStatus, dueDate
- **relations**: generatedFrom→RepairJob, issuedTo→Customer
