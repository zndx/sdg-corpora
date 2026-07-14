# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Protected Disclosure
- **genus**: `cco:ont00000995`
- **definition**: A report, communication, or disclosure made in good faith that evidences suspected improper conduct for the purpose of correction or during an investigation.
- **attributes**: disclosureId, disclosureDate, disclosureMethod, isGoodFaith, contentSummary, status
- **relations**: reportedBy→Whistleblower, allegesImproperConduct→ImproperConduct, triggersInvestigation→Investigation

## Whistleblower
- **genus**: `bfo:0000004`
- **definition**: A person who makes a protected disclosure of suspected improper conduct in good faith.
- **attributes**: whistleblowerId, role, campusAffiliation, isProtectedFromRetaliation, contactEmail, contactPhone
- **relations**: makesDisclosure→ProtectedDisclosure, affiliatedWith→CollegeCampus

## Improper Conduct
- **genus**: `bfo:0000015`
- **definition**: Any action or activity that violates laws, misuses college resources, is economically wasteful, threatens safety, constitutes scientific misconduct, or is otherwise detrimental to the college.
- **attributes**: conductId, conductType, description, occurrenceDate, severityLevel, isCriminal
- **relations**: isAllegedIn→ProtectedDisclosure, involvesSubject→InvestigationSubject, occursAt→CollegeCampus

## Investigation
- **genus**: `bfo:0000015`
- **definition**: A fact-finding and analysis process conducted by authorized personnel to examine allegations of improper conduct.
- **attributes**: investigationId, startDate, endDate, status, findingsSummary, correctiveActionTaken
- **relations**: investigates→ImproperConduct, conductedBy→Investigator, focusesOnSubject→InvestigationSubject, resultsFrom→ProtectedDisclosure

## Investigator
- **genus**: `bfo:0000004`
- **definition**: A person authorized by the college to conduct fact-finding and analysis of allegations of improper conduct.
- **attributes**: investigatorId, role, department, isAuthorized, contactEmail
- **relations**: conductsInvestigation→Investigation, employedBy→CollegeCampus

## Investigation Subject
- **genus**: `bfo:0000004`
- **definition**: A person who is the focus of an investigation into alleged improper conduct.
- **attributes**: subjectId, role, campusAffiliation, isSubjectOfRetaliation, contactEmail
- **relations**: isSubjectOf→Investigation, affiliatedWith→CollegeCampus

## College Campus
- **genus**: `bfo:0000004`
- **definition**: A physical or administrative location of the Palmer College of Chiropractic, including Davenport, West, and Florida campuses.
- **attributes**: campusId, campusName, legalEntity, address, isActive
- **relations**: hostsInvestigation→Investigation, employsInvestigator→Investigator, affiliatesWhistleblower→Whistleblower, affiliatesSubject→InvestigationSubject
