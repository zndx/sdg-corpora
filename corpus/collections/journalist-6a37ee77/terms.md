# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Journalist
- **genus**: `bfo:0000040`
- **definition**: A person who engages in the profession of journalism, including reporting, anchoring, and broadcasting news.
- **attributes**: callsign, birthDate, deathDate, birthPlace, educationInstitution, primaryEmployer, isRetired
- **relations**: employedBy→NewsOrganization, coveredEvent→HistoricalEvent

## News Organization
- **genus**: `bfo:0000040`
- **definition**: An institutional entity that produces and disseminates news content, such as a wire service, television network, or radio station.
- **attributes**: organizationName, foundingYear, headquartersLocation, organizationType, isDefunct
- **relations**: employs→Journalist, producedContent→BroadcastProgram

## Broadcast Program
- **genus**: `bfo:0000040`
- **definition**: A specific media production intended for radio or television transmission, including news segments, documentaries, and special reports.
- **attributes**: programTitle, broadcastDate, network, durationMinutes, isDocumentary, directorName, premiereVenue
- **relations**: producedBy→NewsOrganization, featuresJournalist→Journalist, aboutSubject→HistoricalEvent

## Historical Event
- **genus**: `bfo:0000040`
- **definition**: A significant occurrence in history that is reported on or documented by journalists and media organizations.
- **attributes**: eventName, eventDate, location, eventCategory, isVerified
- **relations**: reportedOn→Journalist, documentedIn→BroadcastProgram

## Media Personality
- **genus**: `bfo:0000040`
- **definition**: A public figure known for their role in broadcasting or journalism, often recognized for their professional demeanor and public trust.
- **attributes**: fullName, callsign, recognitionTitle, yearsActive, isRetired
- **relations**: associatedWith→NewsOrganization, coveredEvent→HistoricalEvent
