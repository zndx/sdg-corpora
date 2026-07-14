# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Decision Capacity Assessment
- **genus**: `bfo:0000015`
- **definition**: A measurement process evaluating whether a specific individual possesses the functional capacity to make a particular decision at a specific time.
- **attributes**: assessmentId, assessmentDate, decisionTopic, assessorId, capacityStatus, supportProvided
- **relations**: evaluates→Person, assesses→DecisionTopic, conductedBy→Professional

## Individual
- **genus**: `bfo:0000002`
- **definition**: A real human being who is the subject of capacity assessments and potential decision-making interventions.
- **attributes**: personId, legalName, dateOfBirth, jurisdiction, vulnerableStatus
- **relations**: hasAssessment→DecisionAssessment, subjectOf→BestInterestDetermination

## Decision Subject
- **genus**: `bfo:0000003`
- **definition**: A specific matter or choice requiring a decision, such as medical treatment, financial management, or living arrangements.
- **attributes**: topicId, categoryCode, urgencyLevel, description
- **relations**: assessedIn→DecisionAssessment, resolvedBy→BestInterestDetermination

## Best Interest Determination
- **genus**: `bfo:0000015`
- **definition**: A formal decision-making process and resulting record where a decision is made on behalf of a person lacking capacity, strictly adhering to their best interests and least restrictive principles.
- **attributes**: determinationId, decisionDate, chosenOption, restrictivenessLevel, justificationText, status
- **relations**: appliesTo→Person, addresses→DecisionTopic, basedOnAssessment→DecisionAssessment, madeBy→Professional

## Authorized Decision Maker
- **genus**: `bfo:0000002`
- **definition**: A qualified individual (e.g., clinician, social worker, legal guardian) authorized to conduct capacity assessments and make best interest determinations.
- **attributes**: professionalId, fullName, licenseNumber, roleType, jurisdiction
- **relations**: conducts→DecisionAssessment, makes→BestInterestDetermination
