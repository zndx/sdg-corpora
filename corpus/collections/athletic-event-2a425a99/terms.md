# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Athletic Event
- **genus**: `bfo:0000040`
- **definition**: A scheduled sports competition or league activity occurring at a specific time and location.
- **attributes**: eventIdentifier, eventName, scheduledStart, scheduledEnd, status, sportType
- **relations**: heldAt→Facility, hasParticipant→Participant, hasRegistration→Registration

## Athletic Facility
- **genus**: `bfo:0000040`
- **definition**: A physical location such as a field, court, or complex used for athletic activities.
- **attributes**: facilityIdentifier, facilityName, locationAddress, capacity, isSecured, lastInspectionDate
- **relations**: hostsEvent→AthleticEvent, containsEquipment→Equipment

## Athletic Registration
- **genus**: `bfo:0000040`
- **definition**: A record of a participant's enrollment in a specific athletic event or league, including fee payment and roster details.
- **attributes**: registrationId, registrationDate, feeAmount, paymentStatus, rosterNumber
- **relations**: forEvent→AthleticEvent, byParticipant→Participant

## Athletic Participant
- **genus**: `bfo:0000040`
- **definition**: An individual registered to compete or attend an athletic event, subject to policy enforcement.
- **attributes**: participantId, fullName, age, isCPRCertified, drugScreenStatus, criminalCheckStatus
- **relations**: registeredFor→AthleticEvent, subjectToDiscipline→DisciplineReport

## Athletic Equipment
- **genus**: `bfo:0000040`
- **definition**: Physical items such as bases, balls, and coolers distributed for use during athletic events.
- **attributes**: equipmentId, equipmentName, condition, quantity, lastMaintenanceDate
- **relations**: usedInEvent→AthleticEvent, storedAt→Facility

## Discipline and Injury Report
- **genus**: `bfo:0000040`
- **definition**: A formal record documenting participant misconduct, injuries, or disputes requiring policy intervention.
- **attributes**: reportId, incidentDate, incidentType, severityLevel, resolved, forwardedToCoordinator
- **relations**: concernsParticipant→Participant, occurredAtEvent→AthleticEvent
