# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Corporate Responsibility Programme
- **genus**: `cco:ont00000995`
- **definition**: A structured initiative or programme managed by a corporate entity to address social, environmental, and ethical responsibilities, such as community engagement and strategic philanthropy.
- **attributes**: programmeIdentifier, programmeName, startDate, status, scope
- **relations**: managedBy→ExecutiveRole, hasComponent→CSRComponent

## Corporate Social Responsibility Component
- **genus**: `cco:ont00000995`
- **definition**: A distinct functional area or sub-programme within a broader corporate responsibility framework, such as community engagement or strategic philanthropy.
- **attributes**: componentIdentifier, componentName, componentType, budget, targetAudience
- **relations**: partOf→CorporateResponsibilityProgramme, targetsRegion→GeographicRegion

## Executive Role
- **genus**: `bfo:0000023`
- **definition**: A specific position of authority and responsibility held by an individual within a corporate structure, defining their scope of management and oversight.
- **attributes**: roleIdentifier, roleTitle, department, startDate, endDate, employmentStatus
- **relations**: heldBy→Professional, oversees→BusinessUnit, managesProgramme→CorporateResponsibilityProgramme

## Business Unit
- **genus**: `cco:ont00000995`
- **definition**: A distinct operational division or segment of a corporation responsible for specific products, services, or markets.
- **attributes**: unitIdentifier, unitName, sector, revenue, employeeCount
- **relations**: partOf→Corporation, managedBy→ExecutiveRole, operatesIn→GeographicRegion

## Geographic Region
- **genus**: `bfo:0000002`
- **definition**: A defined spatial area or jurisdiction where corporate activities, programmes, or business units are located or operate.
- **attributes**: regionCode, regionName, regionType, population, primaryLanguage
- **relations**: contains→BusinessUnit, hostsProgramme→CSRComponent

## Professional
- **genus**: `bfo:0000004`
- **definition**: An individual who engages in a specific career or occupation, possessing qualifications and experience in a particular field.
- **attributes**: professionalId, fullName, birthDate, currentEmployer, primaryExpertise
- **relations**: holdsRole→ExecutiveRole, educatedAt→EducationalInstitution, previouslyEmployedAt→Corporation

## Educational Institution
- **genus**: `cco:ont00000995`
- **definition**: An organization dedicated to education, research, and the granting of academic degrees or certifications.
- **attributes**: institutionId, institutionName, location, foundingYear, institutionType
- **relations**: awardedDegreeTo→Professional, locatedIn→GeographicRegion

## Public Awareness Campaign
- **genus**: `bfo:0000015`
- **definition**: A coordinated series of activities and communications designed to raise awareness, influence behavior, or promote a specific cause or product across multiple regions.
- **attributes**: campaignId, campaignTitle, launchDate, endDate, reach, campaignStatus
- **relations**: designedBy→Professional, implementedIn→GeographicRegion, supportsProgramme→CSRComponent
