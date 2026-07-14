# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Nonprofit Organization
- **genus**: `cco:ont00000995`
- **definition**: A legally recognized not-for-profit entity established to provide community-based programs and services to a specific demographic.
- **attributes**: legalName, taxExemptStatus, foundingYear, operationalStatus, foundingLocation
- **relations**: providesProgram→CommunityProgram, convenedCoalition→CommunityCoalition, foundedBy→Person

## Community Program
- **genus**: `bfo:0000015`
- **definition**: A structured educational or preventive intervention activity designed to address specific at-risk behaviors and developmental needs of adolescent females.
- **attributes**: programName, targetAgeRange, totalParticipants, programDurationYears, primaryFocusArea, evidenceBasedStatus
- **relations**: deliveredBy→NonprofitOrganization, evaluatedBy→ResearchInstitution, partOfCurriculum→EducationalCurriculum

## Educational Curriculum
- **genus**: `cco:ont00000995`
- **definition**: A formally structured set of instructional sessions and holistic approaches designed to teach self-esteem and avoidance of at-risk behaviors.
- **attributes**: curriculumTitle, totalSessions, pedagogicalApproach, approvalAgency, approvalStatus
- **relations**: authoredBy→Person, usedInProgram→CommunityProgram, evaluatedBy→ResearchInstitution

## Person
- **genus**: `bfo:0000002`
- **definition**: A human individual who serves as a founder, executive, faculty member, author, or consultant within the domain of youth development and community services.
- **attributes**: fullName, birthPlace, highestDegree, degreeField, professionalRole, yearsOfExperience
- **relations**: founded→NonprofitOrganization, taughtAt→EducationalInstitution, authored→EducationalCurriculum, consultedFor→GovernmentAgency

## Research Institution
- **genus**: `cco:ont00000995`
- **definition**: An academic or independent entity responsible for evaluating the efficacy of evidence-based programs and conducting sociological research.
- **attributes**: institutionName, evaluationStatus, evaluationOutcome, hostingInstitute
- **relations**: evaluatesProgram→CommunityProgram, evaluatesCurriculum→EducationalCurriculum, affiliatedWith→University

## Government Agency
- **genus**: `cco:ont00000995`
- **definition**: A federal or state entity that provides grant funding, regulatory approval, or review panels for community health and human services.
- **attributes**: agencyName, jurisdictionLevel, approvalGranted, grantReviewRole
- **relations**: approvesCurriculum→EducationalCurriculum, fundsProgram→CommunityProgram, reviewedBy→Person
