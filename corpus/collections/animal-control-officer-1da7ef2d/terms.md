# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Animal Control Officer
- **genus**: `bfo:0000002`
- **definition**: A human agent employed by a municipal animal services department to enforce animal control ordinances, manage animal populations, and ensure public safety.
- **attributes**: employeeId, fullName, certificationLevel, licenseStatus, onCallStatus, safetyCoordinatorRole
- **relations**: performs→VectorControlActivity, supervises→AnimalCareSpecialist, respondsTo→AnimalEmergency, holds→Certification

## Vector Control Activity
- **genus**: `bfo:0000015`
- **definition**: A municipal service process involving the calibration, preparation, and spraying of residential streets to control disease-carrying organisms.
- **attributes**: activityId, sprayDate, treatedArea, chemicalAgent, calibrationStatus, reportStatus
- **relations**: conductedBy→AnimalControlOfficer, usesEquipment→Sprayer, generatesReport→ActivityReport, targets→ResidentialStreet

## Animal Emergency
- **genus**: `bfo:0000015`
- **definition**: An urgent, unplanned event involving animals occurring outside normal business hours that requires immediate intervention.
- **attributes**: emergencyId, incidentDateTime, severityLevel, location, resolutionStatus, requiresImmobilization
- **relations**: respondedBy→AnimalControlOfficer, involvesAnimal→Animal, triggers→IncidentReport, occursAt→ResidentialStreet

## Animal
- **genus**: `bfo:0000004`
- **definition**: A living organism under the jurisdiction of the animal services department, including pets, wildlife, or strays.
- **attributes**: animalId, species, breed, weightKg, healthStatus, microchipId
- **relations**: implicatedIn→AnimalEmergency, heldBy→AnimalControlOfficer, subjectTo→Sedative, containedIn→TransportUnit

## Safety Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled departmental gathering facilitated by a safety coordinator to review protocols, discuss concerns, and document attendance.
- **attributes**: meetingId, meetingDate, facilitator, attendanceCount, notesStatus, concernsRaised
- **relations**: facilitatedBy→AnimalControlOfficer, attends→AnimalControlOfficer, generates→MeetingNotes, triggers→FollowUpAction

## Incident Report
- **genus**: `cco:ont00000958`
- **definition**: A formal record documenting an accident, injury, or emergency event involving staff or animals, used for administrative and safety tracking.
- **attributes**: reportId, reportDate, reportType, injuredParty, description, reviewStatus
- **relations**: documents→AnimalEmergency, completedBy→AnimalControlOfficer, references→SafetyMeeting, storedIn→ActivityReport
