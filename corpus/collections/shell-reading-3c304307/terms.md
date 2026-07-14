# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Shell Reading
- **genus**: `cco:ont00000995`
- **definition**: A structured interpretive record of a client's shell casting, capturing the combination of shells drawn and the resulting thematic analysis.
- **attributes**: readingId, clientName, sessionDate, primaryTheme, emotionalValence, interpretationConfidence
- **relations**: containsShell→Shell, elicitedResponse→StudentInterpretation, conductedBy→ShellReader

## Shell
- **genus**: `cco:ont00000995`
- **definition**: A specific mollusk shell specimen used in divination, identified by a unique catalog number and associated symbolic meaning.
- **attributes**: shellId, catalogNumber, commonName, symbolicMeaning, speciesType
- **relations**: partOfReading→ShellReading, symbolizesConcept→PsychologicalConcept

## Student Interpretation
- **genus**: `cco:ont00000995`
- **definition**: A recorded analytical response from a training student regarding the symbolic meaning of a specific shell combination.
- **attributes**: interpretationId, studentName, interpretationText, certaintyLevel, recordedDate, isJournalEntry
- **relations**: analyzesReading→ShellReading, referencesConcept→PsychologicalConcept

## Psychological Concept
- **genus**: `bfo:0000015`
- **definition**: An abstract psychological theme, trauma, or developmental stage identified through the interpretation of shell symbols.
- **attributes**: conceptId, conceptName, category, severityLevel
- **relations**: symbolizedBy→Shell, interpretedBy→StudentInterpretation

## Training Session
- **genus**: `bfo:0000015`
- **definition**: A structured educational event in a shell reading curriculum where students analyze case studies and provide interpretive responses.
- **attributes**: sessionId, sessionTitle, durationMinutes, classLevel, instructorName, sessionStatus
- **relations**: includesReading→ShellReading, elicitedResponses→StudentInterpretation
