# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Capacity Assessment
- **genus**: `bfo:0000015`
- **definition**: A decision-making process or activity performed by a clinician or assessor to determine whether a specific individual possesses the mental capacity to make a particular decision at a specific time.
- **attributes**: assessmentIdentifier, assessmentDate, decisionTopic, assessorRole, outcome, supportProvided
- **relations**: assesses→Individual, evaluates→DecisionContext, triggers→BestInterestDetermination

## Individual
- **genus**: `bfo:0000002`
- **definition**: A real, independent continuant entity representing a human person whose capacity and best interests are the subject of assessment and decision-making processes.
- **attributes**: individualIdentifier, dateOfBirth, legalStatus, primaryLanguage, communicationNeeds
- **relations**: subjectOf→CapacityAssessment, beneficiaryOf→BestInterestDetermination, representedBy→LegalRepresentative

## Decision Context
- **genus**: `bfo:0000040`
- **definition**: A specific matter, choice, or action requiring a decision, such as medical treatment, financial management, or living arrangements, which serves as the focus of a capacity assessment.
- **attributes**: contextIdentifier, decisionCategory, urgencyLevel, riskLevel, description
- **relations**: evaluatedBy→CapacityAssessment, subjectOf→BestInterestDetermination, involves→Intervention

## Best Interest Determination
- **genus**: `bfo:0000015`
- **definition**: A formal process or activity conducted when an individual lacks capacity, involving the evaluation of options and selection of a course of action that maximizes the individual's well-being and rights.
- **attributes**: determinationIdentifier, determinationDate, leastRestrictiveOption, consultationParticipants, outcomeDescription, reviewDate
- **relations**: concerns→Individual, addresses→DecisionContext, resultsIn→Intervention, performedBy→LegalRepresentative

## Intervention
- **genus**: `bfo:0000015`
- **definition**: A specific action, treatment, or decision implemented on behalf of an individual who lacks capacity, representing the practical application of a best interest determination.
- **attributes**: interventionIdentifier, interventionType, startDate, endDate, restrictivenessLevel, status
- **relations**: affects→Individual, implements→BestInterestDetermination, relatedTo→DecisionContext

## Legal Representative
- **genus**: `bfo:0000003`
- **definition**: A real, dependent continuant entity representing a person or body (such as a guardian, attorney, or family member) authorized to make decisions or act on behalf of an individual who lacks capacity.
- **attributes**: representativeIdentifier, relationshipType, authorizationDate, scopeOfAuthority, contactInformation
- **relations**: represents→Individual, conducts→BestInterestDetermination, authorizes→Intervention
