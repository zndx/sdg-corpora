# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Domiciliary Care Agency
- **genus**: `cco:ont00000995`
- **definition**: A registered care service organization that provides in-home support to individuals living in their own residences.
- **attributes**: registrationNumber, legalName, physicalAddress, telephone, website, operationalStatus
- **relations**: hasRegisteredManager→RegisteredManager, conductedInspection→RegulatoryInspection

## Registered Manager
- **genus**: `bfo:0000023`
- **definition**: A person legally responsible for the management and operation of a care service, registered with the regulatory authority.
- **attributes**: managerId, fullName, registrationDate, legalResponsibilityScope
- **relations**: manages→DomiciliaryCareAgency

## Regulatory Inspection
- **genus**: `bfo:0000015`
- **definition**: A formal evaluation process conducted by a regulatory body to assess compliance with health and social care standards.
- **attributes**: inspectionId, inspectionDate, publicationDate, noticePeriod, inspectionType, overallComplianceStatus
- **relations**: evaluated→DomiciliaryCareAgency, assignedRating→ServiceRating

## Service Rating
- **genus**: `cco:ont00000995`
- **definition**: A scored assessment of a care service's performance across specific quality domains.
- **attributes**: ratingId, safetyRating, effectivenessRating, caringRating, responsivenessRating, wellLedRating
- **relations**: partOfInspection→RegulatoryInspection

## Care Plan
- **genus**: `cco:ont00000958`
- **definition**: A documented record outlining the specific support, medical, and personal needs of an individual receiving care.
- **attributes**: planId, lastReviewDate, dietaryRequirements, medicationRegimen, riskAssessmentStatus
- **relations**: assignedToPerson→CareRecipient, monitoredByStaff→CareStaff

## Care Recipient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving domiciliary care services in their own home.
- **attributes**: recipientId, dateOfBirth, mentalCapacityStatus, primaryLanguage
- **relations**: receivesCareFrom→DomiciliaryCareAgency, hasCarePlan→CarePlan

## Care Staff
- **genus**: `bfo:0000004`
- **definition**: Personnel employed by the agency to provide direct support and care to recipients.
- **attributes**: staffId, securityClearanceStatus, trainingCompletionDate, employmentStatus
- **relations**: employedBy→DomiciliaryCareAgency, supports→CareRecipient
