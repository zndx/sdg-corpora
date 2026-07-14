# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Participating Organization
- **genus**: `cco:ont00000995`
- **definition**: A legal or informal entity such as a Farmers' Producer Organization, Company, Interest Group, or Farmers' Club that applies to participate in the Sufal Bangla Project for the Ahare Bangla Food Festival.
- **attributes**: organizationId, legalName, organizationType, registrationDate, contactPerson, contactPhone, contactEmail, enrollmentStatus
- **relations**: submitsApplicationFor→FestivalEnrollment, displaysProductsAt→FestivalStall

## Festival Enrollment
- **genus**: `cco:ont00000995`
- **definition**: The formal application record submitted by a participating organization to enroll in the Sufal Bangla Project for a specific agricultural food festival.
- **attributes**: enrollmentId, submissionDate, festivalName, festivalStartDate, festivalEndDate, venueName, venueCity, evaluationOutcome
- **relations**: isSubmittedBy→ParticipatingOrganization, isEvaluatedBy→QualityAssessment, grantsAccessTo→FestivalStall

## Quality Assessment
- **genus**: `bfo:0000015`
- **definition**: The measurement and evaluation process conducted to determine the quality and standard of products submitted by a participating organization for festival enrollment.
- **attributes**: assessmentId, assessmentDate, qualityScore, standardCompliance, assessorName, assessmentMethod
- **relations**: evaluatesProductsOf→FestivalEnrollment, performedBy→ProjectDirector

## Festival Stall
- **genus**: `bfo:0000023`
- **definition**: A designated physical space or booth at the Ahare Bangla Food Festival where participating organizations display and sell their agricultural products.
- **attributes**: stallId, stallLocationCode, stallSize, stallStatus, utilityAccess
- **relations**: isAssignedTo→FestivalEnrollment, hostsProductsFrom→AgriculturalProduct

## Agricultural Product
- **genus**: `cco:ont00000995`
- **definition**: A tangible agricultural produce or processed product offered for display and sale by a participating organization at the festival.
- **attributes**: productId, productName, productCategory, weight, unitOfMeasure, price, expiryDate
- **relations**: isOfferedBy→FestivalStall, isProducedBy→ParticipatingOrganization

## Project Director
- **genus**: `bfo:0000023`
- **definition**: The official role held by the individual responsible for managing the Sufal Bangla Project and overseeing the evaluation and enrollment process for the festival.
- **attributes**: directorId, fullName, officeLocation, officeAddress, officeCity, officePincode
- **relations**: oversees→QualityAssessment, manages→FestivalEnrollment
