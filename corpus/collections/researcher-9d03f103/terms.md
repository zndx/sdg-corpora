# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Researcher
- **genus**: `bfo:0000040`
- **definition**: A human being engaged in systematic investigation to establish facts and reach new conclusions in a scientific or scholarly field.
- **attributes**: researcherId, nationality, careerStage, gender, sector, primaryField
- **relations**: residesIn→GeographicLocation, participatedIn→SurveyResponse, participatedIn→TelephoneInterview

## Survey Response
- **genus**: `cco:ont00000995`
- **definition**: A completed instance of the online survey instrument capturing a researcher's background, preferences, and experiences regarding India-EU research collaboration.
- **attributes**: responseId, submissionDate, respondentStatus, totalScore, completionStatus
- **relations**: recordedBy→Researcher, addressedTo→PolicyInstrument

## Telephone Interview
- **genus**: `bfo:0000015`
- **definition**: A structured conversational process conducted via telephone to gather qualitative insights from researchers about their needs and perceptions.
- **attributes**: interviewId, startDate, endDate, durationMinutes, interviewerId
- **relations**: conductedWith→Researcher, conductedWith→GeographicLocation, yielded→QualitativeInsight

## Geographic Location
- **genus**: `bfo:0000002`
- **definition**: A specific spatial region, city, or country where a researcher is based or where research activities take place.
- **attributes**: locationId, locationName, countryCode, regionType
- **relations**: hosted→Researcher, hosted→TelephoneInterview

## Policy Instrument
- **genus**: `cco:ont00000958`
- **definition**: A formal mechanism, network, or program designed to facilitate research collaboration, mobility, or information exchange between entities.
- **attributes**: instrumentId, instrumentName, launchDate, status, targetGroup
- **relations**: targetedAt→Researcher, informedBy→SurveyResponse, informedBy→TelephoneInterview

## Qualitative Insight
- **genus**: `cco:ont00000995`
- **definition**: A recorded finding, opinion, or perception derived from the analysis of interview data regarding researcher needs and collaboration barriers.
- **attributes**: insightId, theme, sentiment, priorityLevel, summaryText
- **relations**: derivedFrom→TelephoneInterview, supports→PolicyInstrument
