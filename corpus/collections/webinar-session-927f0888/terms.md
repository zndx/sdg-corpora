# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Webinar Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled educational presentation event conducted by the National Hurricane Center for students regarding hurricane science and meteorology.
- **attributes**: sessionIdentifier, scheduledStartDateTime, scheduledEndDateTime, registrationDeadline, maxParticipants, currentRegistrations, status, language
- **relations**: targetedAtGradeLevel→GradeLevel, targetedAtRegion→GeographicRegion, hostedBy→Meteorologist, recordedAs→VideoRecording, hasRegistrationLink→RegistrationLink

## Grade Level
- **genus**: `bfo:0000023`
- **definition**: A specific educational grade level designation used to categorize the target audience for educational content.
- **attributes**: gradeIdentifier, gradeNumber, description
- **relations**: participatesIn→WebinarSession

## Geographic Region
- **genus**: `bfo:0000004`
- **definition**: A specific geographic area, such as a country, state, or territory, identified as vulnerable to hurricanes or targeted for educational outreach.
- **attributes**: regionIdentifier, regionName, regionType, hurricaneVulnerability
- **relations**: receivesWebinar→WebinarSession

## Meteorologist
- **genus**: `bfo:0000002`
- **definition**: A professional scientist who studies atmospheric phenomena and is responsible for conducting educational webinars and providing weather information.
- **attributes**: meteorologistIdentifier, fullName, specialization, affiliation
- **relations**: conductsWebinar→WebinarSession

## Video Recording
- **genus**: `cco:ont00000995`
- **definition**: A digital video file capturing the content of a completed webinar session, made available for on-demand viewing.
- **attributes**: recordingIdentifier, hostingPlatform, accessUrl, publishDate, durationSeconds
- **relations**: isRecordingOf→WebinarSession

## Registration Link
- **genus**: `cco:ont00000958`
- **definition**: A unique web address (URL) used to register participants for a specific webinar session.
- **attributes**: linkIdentifier, url, expirationDate
- **relations**: linksToWebinar→WebinarSession
