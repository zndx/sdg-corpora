# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Sales Activity Record
- **genus**: `cco:ont00000995`
- **definition**: A record of a telemarketing or sales activity including calls, appointments, and client interactions.
- **attributes**: activityId, activityDate, activityType, durationMinutes, outcome, notes
- **relations**: conductedBy→SalesAdministrator, targets→ProspectiveCustomer, generates→SalesReport

## Prospective Customer
- **genus**: `cco:ont00000995`
- **definition**: A potential client identified through business directories or existing client leads.
- **attributes**: customerId, companyName, contactPerson, contactEmail, contactPhone, leadSource, status
- **relations**: contactedBy→SalesActivityRecord, receives→Quotation

## Quotation
- **genus**: `cco:ont00000995`
- **definition**: A formal proposal or price estimate prepared for new or existing clients.
- **attributes**: quotationId, issueDate, expiryDate, totalAmount, status, description
- **relations**: preparedFor→ProspectiveCustomer, preparedBy→SalesAdministrator, relatedTo→SalesActivityRecord

## Sales Report
- **genus**: `cco:ont00000995`
- **definition**: A weekly report summarizing telemarketing activities, new prospects, and sales outcomes.
- **attributes**: reportId, reportDate, totalCalls, newProspects, appointmentsSet, status
- **relations**: generatedBy→SalesAdministrator, covers→SalesActivityRecord

## Sales Administrator
- **genus**: `bfo:0000015`
- **definition**: An individual performing telemarketing, sales, and administrative activities for Medtech software products.
- **attributes**: adminId, fullName, department, officeLocation, weeklyHours, salaryGrade
- **relations**: reportsTo→MarketingManager, conducts→SalesActivityRecord, prepares→Quotation, generates→SalesReport

## Marketing Manager
- **genus**: `bfo:0000015`
- **definition**: The manager to whom the Sales Administrator reports and oversees the Sales team.
- **attributes**: managerId, fullName, department, officeLocation
- **relations**: supervises→SalesAdministrator
