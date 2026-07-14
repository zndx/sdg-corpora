# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Director Appointment
- **genus**: `bfo:0000015`
- **definition**: A formal organizational role assignment granting an individual authority and responsibilities within a corporate division.
- **attributes**: appointmentId, appointmentDate, divisionName, status, terminationDate
- **relations**: assignedTo→ProfessionalAdvisor, assignedToDivision→CorporateDivision

## Professional Advisor
- **genus**: `bfo:0000015`
- **definition**: A qualified individual holding a specific corporate role, possessing specialized education and access to firm-wide financial products.
- **attributes**: advisorId, firstName, lastName, corporateTitle, specialization, educationProgramCompleted, contactEmail, contactPhone
- **relations**: holdsAppointment→DirectorAppointment, affiliatedWith→CorporateDivision

## Corporate Division
- **genus**: `bfo:0000023`
- **definition**: A distinct organizational unit within a larger financial firm established to serve specific client demographics.
- **attributes**: divisionId, divisionName, parentOrganization, foundingDate, targetClientele
- **relations**: employsDirectors→ProfessionalAdvisor

## Client Profile
- **genus**: `cco:ont00000995`
- **definition**: A structured record representing a high-net-worth individual or professional entity requiring specialized financial services.
- **attributes**: clientId, clientType, assetProtectionStatus, careerPhase, financialFootingStatus
- **relations**: assignedAdvisor→ProfessionalAdvisor, receivesServiceFrom→FinancialProduct

## Financial Product
- **genus**: `cco:ont00000995`
- **definition**: A specific financial offering or service instrument designed to meet the unique wealth management needs of specialized client segments.
- **attributes**: productId, productName, productCategory, availabilityScope, targetSegment
- **relations**: providedByAdvisor→ProfessionalAdvisor, servesClient→ClientProfile
