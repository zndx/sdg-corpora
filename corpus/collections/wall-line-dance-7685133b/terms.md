# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Wall Line Dance
- **genus**: `bfo:0000015`
- **definition**: A choreographed sequence of footwork steps performed in a line formation, structured into sections with specific counts and timing.
- **attributes**: danceId, title, level, totalCounts, musicBpm, startOffsetSeconds, choreographerName, choreographyDate, dedicationText
- **relations**: hasSection→DanceSection, performedTo→MusicTrack

## Dance Section
- **genus**: `bfo:0000015`
- **definition**: A discrete segment of a wall line dance containing a specific range of counts, actual footwork instructions, and a calling suggestion.
- **attributes**: sectionId, sectionNumber, countRange, actualFootwork, callingSuggestion, stepCount
- **relations**: partOf→WallLineDance, containsStep→DanceStep

## Dance Step
- **genus**: `bfo:0000015`
- **definition**: A single movement instruction within a dance section, specifying foot placement, direction, and type of motion.
- **attributes**: stepId, stepName, footUsed, direction, turnAngle, executionOrder
- **relations**: partOfSection→DanceSection

## Music Track
- **genus**: `cco:ont00000995`
- **definition**: A recorded audio track used as the musical accompaniment for a dance, characterized by tempo, artist, album, and title.
- **attributes**: trackId, title, artistName, albumTitle, tempoBpm, durationSeconds, releaseYear
- **relations**: accompanies→WallLineDance

## Dance Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled performance or competition instance where a specific wall line dance is executed by participants.
- **attributes**: eventId, eventName, eventDate, location, competitionLevel, participantCount
- **relations**: featuresDance→WallLineDance, heldAt→Venue

## Venue
- **genus**: `bfo:0000015`
- **definition**: A physical location or facility where a dance event takes place, identified by name and geographic coordinates.
- **attributes**: venueId, venueName, city, country, floorType, capacity
- **relations**: hostsEvent→DanceEvent
