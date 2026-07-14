# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Health Information Technology System
- **genus**: `cco:ont00000995`
- **definition**: A software-based information system deployed in clinical settings for data collection, documentation, retrieval, and order entry.
- **attributes**: systemIdentifier, systemName, deploymentDate, systemType, usabilityScore, interoperabilityStandard, isStandardized
- **relations**: deployedIn→EmergencyDepartment, usedBy→Clinician, designedBy→ITParticipant, testedFor→UsabilityAssessment

## Emergency Department
- **genus**: `bfo:0000015`
- **definition**: A high-volume, high-risk clinical unit within a hospital providing immediate medical care.
- **attributes**: departmentCode, locationName, patientVolume, averageWaitTime, staffingLevel, operationalStatus
- **relations**: partOf→Hospital, employs→Clinician, uses→HealthInformationTechnologySystem

## Clinician
- **genus**: `bfo:0000023`
- **definition**: A medical professional providing direct patient care and interacting with health information technology systems.
- **attributes**: clinicianID, specialty, yearsOfExperience, moraleLevel, productivityMetric, isCertified
- **relations**: worksIn→EmergencyDepartment, uses→HealthInformationTechnologySystem, supervisedBy→HospitalManager

## Hospital Manager
- **genus**: `bfo:0000023`
- **definition**: An administrative role responsible for hospital operations, data collection requirements, and resource allocation.
- **attributes**: managerID, departmentAssigned, yearsInRole, focusArea
- **relations**: manages→EmergencyDepartment, requires→HealthInformationTechnologySystem

## Usability Assessment
- **genus**: `bfo:0000015`
- **definition**: A measurement process evaluating the effectiveness, efficiency, and satisfaction of a health information technology system.
- **attributes**: assessmentID, assessmentDate, score, testSubjectGroup, isCompleted
- **relations**: assesses→HealthInformationTechnologySystem, conductedBy→ITParticipant

## IT Participant
- **genus**: `bfo:0000023`
- **definition**: A technical professional involved in the design, implementation, or assessment of health information technology systems.
- **attributes**: participantID, skillLevel, roleInProject, affiliatedOrganization
- **relations**: designed→HealthInformationTechnologySystem, conductedAssessment→UsabilityAssessment
