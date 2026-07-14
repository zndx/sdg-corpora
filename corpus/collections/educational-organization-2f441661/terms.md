# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Educational Organization
- **genus**: `cco:ont00000995`
- **definition**: A formally established nonprofit or independent institution providing education, training, or academic programs.
- **attributes**: organizationId, name, foundingDate, legalStatus, tuitionPolicy, isStateSupported
- **relations**: occupies→Building, hasMember→Person, offersProgram→EducationalProgram, receivesFundingFrom→FundingSource

## Building
- **genus**: `bfo:0000040`
- **definition**: A physical structure with a roof and walls, standing more or less permanently in one place, used for educational or administrative purposes.
- **attributes**: buildingId, address, district, constructionYear, lastRenovationDate, leaseTermYears, leaseStartDate, leaseGrantor
- **relations**: locatedIn→City, houses→EducationalOrganization, contains→Room

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being who holds a role within an educational organization, academic institution, or government body.
- **attributes**: personId, fullName, role, affiliation, email, isDraftExempt
- **relations**: leads→EducationalOrganization, teachesAt→EducationalOrganization, represents→GovernmentBody, awarded→Award

## Educational Program
- **genus**: `bfo:0000015`
- **definition**: A structured academic offering such as a college, curriculum, or training module delivered by an educational organization.
- **attributes**: programId, programName, programType, targetAudience, isDraftExempt, enrollmentCount
- **relations**: offeredBy→EducationalOrganization, deliveredAt→Building, hasStudent→Person

## Award
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition or stipend granted to individuals for academic achievement or meritorious service.
- **attributes**: awardId, awardName, grantingAuthority, awardDate, monetaryValue
- **relations**: givenTo→Person, sponsoredBy→GovernmentBody

## Government Body
- **genus**: `bfo:0000040`
- **definition**: A municipal, regional, or national administrative entity that grants leases, issues stipends, or enacts legislation.
- **attributes**: bodyId, bodyName, jurisdictionLevel, headOfficial
- **relations**: grantsLeaseTo→EducationalOrganization, issuesStipendsFor→Award, enactsLegislationFor→Policy

## Policy
- **genus**: `bfo:0000015`
- **definition**: A legislative or administrative rule affecting student status, funding, or institutional operations.
- **attributes**: policyId, policyTitle, effectiveDate, status, affectsDraftExemption
- **relations**: enactedBy→GovernmentBody, impacts→EducationalProgram
