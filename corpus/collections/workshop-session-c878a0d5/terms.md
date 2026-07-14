# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Workshop Session
- **genus**: `bfo:0000015`
- **definition**: A structured training event focused on water, sanitation, and hygiene (WASH) topics where participants engage in learning activities.
- **attributes**: sessionIdentifier, startDate, endDate, location, maxCapacity, currentAttendance, status
- **relations**: hasLearningEnvironment→LearningEnvironment, hasParticipant→Participant, deliversContent→LearningModule

## Learning Environment
- **genus**: `bfo:0000015`
- **definition**: The physical and psychological conditions established during a workshop to ensure participant safety, comfort, and engagement.
- **attributes**: environmentId, physicalSafetyLevel, emotionalSafetyLevel, hasGroupAgreement, stressReductionMeasures, accessibilityCompliance
- **relations**: isPartOf→WorkshopSession, supportsParticipant→Participant

## Participant
- **genus**: `cco:ont00000995`
- **definition**: An individual attending a WASH workshop who engages with the learning content and activities.
- **attributes**: participantId, fullName, email, registrationDate, attendanceStatus, priorKnowledgeLevel
- **relations**: attends→WorkshopSession, experiences→LearningEnvironment, demonstrates→PracticeActivity

## Learning Module
- **genus**: `cco:ont00000995`
- **definition**: A discrete unit of instructional content within a workshop, such as a lesson on waterborne diseases or hygiene practices.
- **attributes**: moduleId, title, durationMinutes, deliveryMethod, difficultyLevel, learningObjective
- **relations**: isDeliveredIn→WorkshopSession, connectsTo→ParticipantPriorKnowledge, enablesPractice→PracticeActivity

## Practice Activity
- **genus**: `bfo:0000015`
- **definition**: A structured exercise or task designed to reinforce learning concepts and skills through active participation.
- **attributes**: activityId, activityType, durationMinutes, requiredMaterials, successCriteria, isCompleted
- **relations**: isAssignedTo→WorkshopSession, isPerformedBy→Participant, reinforces→LearningModule

## Participant Prior Knowledge
- **genus**: `cco:ont00000995`
- **definition**: The existing knowledge, experiences, and reference points a participant brings to a workshop session.
- **attributes**: knowledgeId, topicArea, proficiencyLevel, sourceExperience, lastUpdated
- **relations**: belongs_to→Participant, is_connected_to→LearningModule
