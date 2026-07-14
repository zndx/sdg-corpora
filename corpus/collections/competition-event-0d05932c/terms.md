# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Competition Event
- **genus**: `bfo:0000040`
- **definition**: A scheduled competitive event for industrial maintenance mechanics involving written and practical assessments.
- **attributes**: eventId, eventTitle, eventYear, eventStatus, registrationDeadline, totalScoreWeight
- **relations**: hasParticipant→Competitor, hasAssessment→Assessment, hasScoreSheet→ScoreSheet

## Competitor
- **genus**: `bfo:0000004`
- **definition**: An individual registered to participate in a millwright competition, possessing required skills and tools.
- **attributes**: competitorId, firstName, lastName, apprenticeLevel, registrationStatus, contactEmail, contactPhone
- **relations**: participatesIn→CompetitionEvent, submitsScore→ScoreSheet, usesTool→Tool

## Assessment
- **genus**: `bfo:0000040`
- **definition**: A structured evaluation component of the competition, either written or practical, with defined scoring criteria.
- **attributes**: assessmentId, assessmentType, durationMinutes, scoreWeightPercentage, maxScore, assessmentStatus
- **relations**: partOfEvent→CompetitionEvent, takenBy→Competitor, hasCriteria→ScoreSheet

## Tool
- **genus**: `bfo:0000040`
- **definition**: A physical instrument or device required or provided for use during the competition's practical performance test.
- **attributes**: toolId, toolName, toolCategory, brandReference, specification, toolStatus
- **relations**: usedBy→Competitor, requiredFor→Assessment

## Score Sheet
- **genus**: `bfo:0000040`
- **definition**: A structured document recording judging criteria and maximum points for competition assessments.
- **attributes**: scoreSheetId, scoreSheetVersion, totalMaxPoints, safetyScopeIncluded, isSample, lastUpdated
- **relations**: usedFor→Assessment, completedBy→Competitor, partOfEvent→CompetitionEvent
