# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Domiciliary Care Agency
- **genus**: `cco:ont00000995`
- **definition**: A registered provider organization that delivers domiciliary care services to individuals in their own homes.
- **attributes**: agencyId, agencyName, registeredAddress, contactTelephone, websiteUrl, registrationStatus, lastInspectionDate
- **relations**: hasRegisteredManager→RegisteredManager, conductedInspection→InspectionEvent, servesClient→CareRecipient

## Regulatory Inspection Event
- **genus**: `bfo:0000015`
- **definition**: A formal regulatory assessment activity conducted by the Care Quality Commission to evaluate compliance with health and social care standards.
- **attributes**: inspectionId, inspectionDate, inspectionType, overallRating, safetyRating, effectivenessRating, caringRating, responsiveRating, wellLedRating, publicationDate
- **relations**: evaluatedAgency→CareAgency, evaluatedBy→Inspector, generatedReport→InspectionReport

## Inspection Report Document
- **genus**: `cco:ont00000958`
- **definition**: A formal document recording the findings, ratings, and detailed observations resulting from a regulatory inspection.
- **attributes**: reportId, reportTitle, summaryOfFindings, complianceStatus, previousInspectionDate, previousComplianceStatus
- **relations**: documentsInspection→InspectionEvent, coversDomain→CareDomain

## Individual Receiving Care
- **genus**: `bfo:0000002`
- **definition**: A person receiving domiciliary care support and services in their own home.
- **attributes**: recipientId, firstName, lastName, address, supportNeedsAssessmentDate, dietaryPreferences, mentalCapacityStatus
- **relations**: receivesCareFrom→CareAgency, hasCarePlan→CarePlan, hasStaffAssignment→StaffAssignment

## Individual Care Plan
- **genus**: `cco:ont00000995`
- **definition**: A documented plan outlining the specific support, health, and personal needs of a care recipient, including dietary and medication requirements.
- **attributes**: carePlanId, planStartDate, planEndDate, reviewFrequency, nutritionMonitoring, hydrationMonitoring, medicationManagement
- **relations**: belongsToOne→CareRecipient, specifiesTasks→CareTask

## Staff Care Assignment
- **genus**: `bfo:0000015`
- **definition**: A scheduled or completed instance of a staff member providing care support to a specific recipient.
- **attributes**: assignmentId, scheduledDateTime, completedDateTime, staffCountRequired, assignmentStatus
- **relations**: assignedToRecipient→CareRecipient, performedBy→CareStaff, executesTask→CareTask

## Specific Care Activity
- **genus**: `bfo:0000015`
- **definition**: A discrete unit of care work, such as medication administration, meal preparation, or personal hygiene support.
- **attributes**: taskId, taskDescription, taskCategory, requiresTwoStaff
- **relations**: partOfPlan→CarePlan, performedDuring→StaffAssignment
