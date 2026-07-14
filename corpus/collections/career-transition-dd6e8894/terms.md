# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Career Transition
- **genus**: `bfo:0000015`
- **definition**: A process in which an individual shifts from one occupational state to another, such as moving from traditional retirement into paid later-life work or a second career.
- **attributes**: transitionId, transitionType, startDate, endDate, description
- **relations**: involvesParticipant→OlderAdult, observedInPhase→ResearchPhase

## Older Adult
- **genus**: `bfo:0000040`
- **definition**: An individual aged 60 or older who is the subject of career development research, particularly regarding later-life work and retirement transitions.
- **attributes**: participantId, age, gender, employmentStatus, previousOccupation
- **relations**: undergoesTransition→CareerTransition, providesDataFor→ResearchPhase

## Research Phase
- **genus**: `bfo:0000015`
- **definition**: A distinct stage of the Redirection Project's empirical investigation, such as Phase 1 (volunteer work), Phase 2 (volunteer work), or Phase 3 (practitioner perspectives).
- **attributes**: phaseId, phaseNumber, focusArea, startDate, endDate, status
- **relations**: ledBy→PrincipalInvestigator, supportedBy→ResearchCoordinator, assistedBy→ResearchAssistant

## Principal Investigator
- **genus**: `bfo:0000040`
- **definition**: The lead researcher responsible for the design, execution, and oversight of the Redirection Project.
- **attributes**: investigatorId, fullName, title, affiliation, contactEmail
- **relations**: leadsPhase→ResearchPhase

## Research Coordinator
- **genus**: `bfo:0000040`
- **definition**: A staff member responsible for the administrative and operational management of the research project.
- **attributes**: coordinatorId, fullName, role, startDate, endDate
- **relations**: supportsPhase→ResearchPhase

## Research Assistant
- **genus**: `bfo:0000040`
- **definition**: A student or junior researcher providing assistance with data collection, analysis, or project completion.
- **attributes**: assistantId, fullName, degree, institution
- **relations**: assistsPhase→ResearchPhase

## Funding Grant
- **genus**: `cco:ont00000995`
- **definition**: A financial award provided by an organization to support the research project.
- **attributes**: grantId, funderName, amount, awardDate, purpose
- **relations**: fundsPhase→ResearchPhase
