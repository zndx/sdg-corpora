# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Case Review Protocol
- **genus**: `cco:ont00000958`
- **definition**: A structured assessment instrument used to evaluate the effectiveness of child welfare and Medicaid systems by reviewing case files and administrative data.
- **attributes**: protocolIdentifier, protocolName, versionNumber, reviewDate, status, scopeDescription, reviewerName
- **relations**: assessesDomain→SystemDomain, reviewedBy→ExpertReviewer, usedInLawsuit→LegalCase

## System Domain
- **genus**: `bfo:0000015`
- **definition**: A functional area of public service delivery, such as child welfare or education, for which a specific government agency holds responsibility.
- **attributes**: domainIdentifier, domainName, responsibleAgency, assessmentCriteria, isWithinJurisdiction
- **relations**: monitoredBy→CaseReviewProtocol, overseenBy→GovernmentAgency

## Government Agency
- **genus**: `bfo:0000015`
- **definition**: A public administrative body responsible for delivering specific social services, such as Medicaid, child welfare, or education.
- **attributes**: agencyIdentifier, agencyName, jurisdictionLevel, serviceType, establishedDate
- **relations**: overseesDomain→SystemDomain, defendantIn→LegalCase

## Expert Reviewer
- **genus**: `bfo:0000015`
- **definition**: A qualified professional engaged to evaluate the appropriateness and scope of assessment instruments for public systems.
- **attributes**: reviewerIdentifier, reviewerName, academicTitle, institution, yearsExperience, specialization, reviewDate
- **relations**: reviewsProtocol→CaseReviewProtocol, affiliatedWith→AcademicInstitution

## Academic Institution
- **genus**: `bfo:0000015`
- **definition**: A university or college where an expert reviewer holds a faculty position and conducts research.
- **attributes**: institutionIdentifier, institutionName, location, departmentName, collegeName
- **relations**: employsReviewer→ExpertReviewer

## Legal Case
- **genus**: `bfo:0000015`
- **definition**: A formal judicial proceeding involving a dispute between plaintiffs and defendants regarding public policy or service delivery.
- **attributes**: caseNumber, courtName, filingDate, caseType, status
- **relations**: namesDefendant→GovernmentAgency, usesProtocol→CaseReviewProtocol
