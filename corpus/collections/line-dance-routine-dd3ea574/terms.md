# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Line Dance Routine
- **genus**: `bfo:0000040`
- **definition**: A choreographed sequence of footwork steps and calling suggestions designed for group performance to music.
- **attributes**: routineIdentifier, title, level, totalWallCount, totalCounts, bpm, trackStartOffset, choreographerName, dedicationText, creationDate
- **relations**: composedOf→DanceSection, performedTo→AudioTrack, createdBy→Choreographer

## Dance Section
- **genus**: `bfo:0000040`
- **definition**: A distinct segment of a line dance routine containing a specific set of steps and corresponding calling cues.
- **attributes**: sectionIndex, stepCountRange, footworkDescription, callingSuggestion, sectionIdentifier
- **relations**: partOf→LineDanceRoutine, containsStep→FootworkStep

## Footwork Step
- **genus**: `bfo:0000040`
- **definition**: A specific physical movement or maneuver executed by a dancer's feet during a routine.
- **attributes**: stepName, footUsed, direction, turnAngle, executionCount, stepType
- **relations**: executedIn→DanceSection

## Audio Track
- **genus**: `bfo:0000040`
- **definition**: A recorded musical piece to which a dance routine is choreographed and performed.
- **attributes**: trackTitle, artistName, albumTitle, tempoBpm, totalDurationSeconds
- **relations**: accompanies→LineDanceRoutine

## Choreographer
- **genus**: `bfo:0000040`
- **definition**: The individual responsible for designing and structuring the sequence of movements in a dance routine.
- **attributes**: choreographerName, nationality, creationDate, dedicationTarget
- **relations**: created→LineDanceRoutine
