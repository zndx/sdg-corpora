# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Workshop Session
- **genus**: `bfo:0000015`
- **definition**: A structured educational event focused on water, sanitation, and hygiene (WASH) topics where participants engage in learning activities.
- **attributes**: sessionIdentifier, startDate, endDate, location, topic, status
- **relations**: requires→LearningEnvironment, delivers→LearningModule, attends→Participant

## Learning Environment
- **genus**: `bfo:0000015`
- **definition**: The physical and psychological conditions established during a workshop to ensure participants feel safe, respected, and able to focus.
- **attributes**: environmentId, safetyLevel, noiseLevel, lightingCondition, temperature, isSecure
- **relations**: supports→WorkshopSession, provides→PhysicalAmenity, establishes→GroupAgreement

## Participant
- **genus**: `cco:ont00000995`
- **definition**: An individual attending a WASH workshop who engages with the material and applies learned concepts.
- **attributes**: participantId, fullName, email, registrationDate, attendanceStatus, priorKnowledgeLevel
- **relations**: attends→WorkshopSession, experiences→MotivationType, demonstrates→PracticeActivity

## Motivation Type
- **genus**: `bfo:0000023`
- **definition**: A role or state describing the internal or external drivers influencing a participant's engagement and learning speed.
- **attributes**: motivationId, motivationCategory, intensity, triggerSource, isSustainable
- **relations**: influences→Participant, drives→LearningOutcome

## Practice Activity
- **genus**: `bfo:0000015`
- **definition**: A structured exercise or simulation designed to reinforce new knowledge and skills through meaningful repetition.
- **attributes**: activityId, activityName, durationMinutes, complexityLevel, isHandsOn, completionRate
- **relations**: isPartOf→WorkshopSession, performedBy→Participant, reinforces→LearningModule

## Learning Module
- **genus**: `cco:ont00000958`
- **definition**: A discrete unit of instructional content delivered during a workshop, such as a lesson on water-borne diseases.
- **attributes**: moduleId, title, contentFormat, durationMinutes, difficultyLevel, isRelevant
- **relations**: deliveredIn→WorkshopSession, connectsTo→ParticipantPriorKnowledge, assessedBy→PracticeActivity

## Physical Amenity
- **genus**: `cco:ont00000995`
- **definition**: A tangible resource or facility provided to meet the physical needs of participants, such as food or sanitation facilities.
- **attributes**: amenityId, amenityType, quantityProvided, isClean, isAccessible
- **relations**: providedIn→LearningEnvironment, consumedBy→Participant

## Group Agreement
- **genus**: `cco:ont00000958`
- **definition**: A set of rules or norms established at the beginning of a workshop to ensure respect and psychological safety among participants.
- **attributes**: agreementId, ruleDescription, isEnforced, violationCount
- **relations**: establishedBy→LearningEnvironment, governs→Participant
