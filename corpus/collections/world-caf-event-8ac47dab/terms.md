# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## World Café Event
- **genus**: `bfo:0000040`
- **definition**: A structured qualitative research gathering designed to facilitate dialogue and collect expertise on burglary prevention.
- **attributes**: eventIdentifier, eventDate, location, status, durationMinutes, participantCount, moderatorCount, breakCount
- **relations**: hasSession→DiscussionSession, hasModerator→FieldModerator, hasParticipant→FieldParticipant, usesMethodology→QualitativeMethodology, supportsProject→SecurityProject

## Discussion Session
- **genus**: `bfo:0000040`
- **definition**: A timed, thematic sub-group conversation within a World Café event where participants exchange views on specific burglary prevention topics.
- **attributes**: sessionIdentifier, startTime, endTime, durationMinutes, theme, tableNumber, status, notesSummary
- **relations**: partOfEvent→WorldCaféEvent, hasModerator→FieldModerator, hasParticipant→FieldParticipant, generatesInsight→PreventionInsight, movesToNextSession→DiscussionSession

## Field Moderator
- **genus**: `bfo:0000002`
- **definition**: A practitioner facilitating a discussion session, responsible for guiding dialogue, preventing substantive pitfalls, and summarizing key points for subsequent groups.
- **attributes**: moderatorIdentifier, fullName, expertiseArea, role, sessionCount, availabilityStatus
- **relations**: facilitatesSession→DiscussionSession, employedByProject→SecurityProject, collaboratesWith→FieldModerator

## Field Participant
- **genus**: `bfo:0000002`
- **definition**: A practitioner from the daily practice of security or prevention who contributes opinions and visions to the World Café discussions.
- **attributes**: participantIdentifier, fullName, organization, role, motivationLevel, previousExperience
- **relations**: attendsSession→DiscussionSession, providesInsight→PreventionInsight, employedByProject→SecurityProject

## Prevention Insight
- **genus**: `bfo:0000040`
- **definition**: A qualitative finding, opinion, or vision regarding burglary prevention collected from participants, representing a supporting trend or new idea.
- **attributes**: insightIdentifier, content, sourceSession, theme, qualityRating, isRecurring, isNewElement
- **relations**: generatedBySession→DiscussionSession, providedByParticipant→FieldParticipant, addressesTopic→BurglaryPreventionTopic, usedInReport→ProjectReport

## Burglary Prevention Topic
- **genus**: `bfo:0000002`
- **definition**: A specific theme or issue within the domain of domestic burglary prevention that is discussed and analyzed during the World Café.
- **attributes**: topicIdentifier, topicName, category, complexityLevel, isPrimaryFocus
- **relations**: discussedInSession→DiscussionSession, hasInsight→PreventionInsight, partOfProject→SecurityProject

## Security Project
- **genus**: `bfo:0000040`
- **definition**: A European initiative aimed at controlling the burglary phenomenon through awareness raising, practice exchange, and strengthening cooperation within the security chain.
- **attributes**: projectIdentifier, projectName, startDate, endDate, fundingSource, status, objectives
- **relations**: organizesEvent→WorldCaféEvent, employsModerator→FieldModerator, engagesParticipant→FieldParticipant, addressesTopic→BurglaryPreventionTopic, producesReport→ProjectReport

## Project Report
- **genus**: `bfo:0000040`
- **definition**: A document summarizing the findings, conclusions, and insights derived from the World Café event and the broader security project.
- **attributes**: reportIdentifier, title, publicationDate, status, wordCount, containsInsights
- **relations**: derivedFromEvent→WorldCaféEvent, includesInsight→PreventionInsight, producedByProject→SecurityProject
