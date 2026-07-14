# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Protected Disclosure
- **genus**: `cco:ont00000995`
- **definition**: A report, communication, or disclosure made in good faith that evidences suspected improper conduct for the purpose of correction or as part of an investigation.
- **attributes**: disclosureId, disclosureDate, disclosureMethod, isGoodFaith, subjectMatter, retaliationStatus
- **relations**: reportedBy→Whistleblower, investigatedBy→Investigation

## Whistleblower
- **genus**: `bfo:0000004`
- **definition**: Any person who makes a protected disclosure of suspected improper conduct to the College.
- **attributes**: personId, role, campusAffiliation, contactEmail, contactPhone, protectionStatus
- **relations**: madeDisclosure→ProtectedDisclosure

## Improper Conduct
- **genus**: `bfo:0000015`
- **definition**: Any action or activity that violates laws, misuses College resources, is economically wasteful, threatens health or safety, or is otherwise detrimental to the College.
- **attributes**: conductId, conductDate, conductType, severityLevel, isCriminal, description
- **relations**: reportedIn→ProtectedDisclosure, subjectOfInvestigation→Investigation

## Investigation
- **genus**: `bfo:0000015`
- **definition**: A fact-finding and analysis process conducted by authorized personnel to examine allegations of improper conduct.
- **attributes**: investigationId, startDate, endDate, status, findingsSummary, correctiveActionTaken
- **relations**: initiatedBy→ProtectedDisclosure, conductedBy→Investigator, examinesConduct→ImproperConduct

## Investigator
- **genus**: `bfo:0000004`
- **definition**: Any person authorized by the College to conduct fact-finding and analysis of allegations of improper conduct.
- **attributes**: personId, role, assignedCampus, authorizationDate, currentCaseLoad
- **relations**: conductsInvestigation→Investigation

## College Resource
- **genus**: `cco:ont00000995`
- **definition**: Assets, property, rights, or records owned, managed, or controlled by the College.
- **attributes**: resourceId, resourceType, description, value, owner
- **relations**: misusedIn→ImproperConduct
