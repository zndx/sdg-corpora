# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Award
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition or honor bestowed upon an individual or entity for demonstrated excellence in a specific field.
- **attributes**: awardId, awardName, awardYear, awardDescription, awardStatus
- **relations**: awardedTo→Person, awardedBy→Organization

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being who is the subject of the award and the program director.
- **attributes**: personId, firstName, lastName, degree, certification, birthDate
- **relations**: holdsPosition→Position, receivedAward→Award, affiliatedWith→Organization

## Position
- **genus**: `bfo:0000023`
- **definition**: A role or job title held by a person within an organization.
- **attributes**: positionId, positionTitle, startDate, endDate, responsibilities
- **relations**: heldBy→Person, partOf→Organization

## Organization
- **genus**: `bfo:0000002`
- **definition**: A structured group of people with a particular purpose, such as a school district or professional society.
- **attributes**: orgId, orgName, orgType, foundingDate, headquartersLocation
- **relations**: employs→Person, awards→Award, hasCampus→Campus

## Campus
- **genus**: `bfo:0000002`
- **definition**: A physical location or institution where educational activities take place, such as a school campus.
- **attributes**: campusId, campusName, campusLevel, enrollment, location
- **relations**: partOf→Organization, hasProgram→Program

## Program
- **genus**: `bfo:0000015`
- **definition**: A structured set of activities or services, such as a child nutrition program, implemented within an organization.
- **attributes**: programId, programName, programType, startDate, endDate, budget
- **relations**: implementedAt→Campus, managedBy→Person, hasPolicy→Policy

## Policy
- **genus**: `cco:ont00000995`
- **definition**: A formal guideline or rule established by an organization to govern operations and decision-making.
- **attributes**: policyId, policyName, policyType, effectiveDate, status
- **relations**: partOf→Program, appliesTo→Campus
