# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Bullying Incident
- **genus**: `bfo:0000015`
- **definition**: A repeated or intentional harmful behavior involving an imbalance of power between individuals or groups within the college community.
- **attributes**: incidentId, incidentDate, severityLevel, isRepeated, isCyberBullying, description, location, status
- **relations**: reportedBy→Person, targetedBy→Person, perpetratedBy→Person, classifiedAs→BullyingType, handledBy→StaffRole

## Person
- **genus**: `bfo:0000004`
- **definition**: An individual within the college community, including students, staff, and governors.
- **attributes**: personId, fullName, role, yearGroup, emailAddress, isVulnerable, specialNeeds
- **relations**: assignedTo→StaffRole, involvedIn→BullyingIncident

## Staff Role
- **genus**: `bfo:0000023`
- **definition**: A specific responsibility or position held by staff members within the college, such as Student Progress Leader or Headteacher.
- **attributes**: roleId, roleName, responsibilities, isPolicyOwner, yearGroup
- **relations**: heldBy→Person, manages→BullyingIncident

## Bullying Type
- **genus**: `bfo:0000015`
- **definition**: A specific category or form of bullying behavior, such as cyberbullying, racist bullying, or physical assault.
- **attributes**: typeId, typeName, description, isCyberBullying, isPhysical, isVerbal
- **relations**: classifiedAs→BullyingIncident

## Policy Review
- **genus**: `bfo:0000015`
- **definition**: A scheduled or ad-hoc evaluation of the anti-bullying policy to assess its effectiveness and make necessary updates.
- **attributes**: reviewId, reviewDate, reviewStatus, reviewer, findings, recommendations
- **relations**: conductedBy→Person, updates→PolicyDocument

## Policy Document
- **genus**: `cco:ont00000958`
- **definition**: The official anti-bullying policy document maintained by the college, including its versions and revisions.
- **attributes**: documentId, title, version, effectiveDate, expiryDate, status
- **relations**: updatedBy→PolicyReview
