# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Security Camera
- **genus**: `bfo:0000040`
- **definition**: A dedicated physical device installed at the Teton County Library to provide real-time surveillance and recorded archival video data for safety and security purposes.
- **attributes**: cameraId, location, installationDate, isAudioEnabled, status
- **relations**: monitors→LibraryProperty, records→VideoSurveillanceData

## Library Property
- **genus**: `bfo:0000004`
- **definition**: The physical land, buildings, and grounds owned or operated by the Teton County Library that are subject to security camera surveillance.
- **attributes**: propertyId, address, propertyType, squareFootage, lastInspectionDate
- **relations**: hasCamera→SecurityCamera, contains→SecurityIncident

## Video Surveillance Data
- **genus**: `bfo:0000040`
- **definition**: Recorded archival video footage captured by security cameras, used for investigating incidents, assessing security risks, and cooperating with law enforcement.
- **attributes**: dataId, captureDateTime, durationSeconds, dataFormat, storageStatus, accessLevel
- **relations**: capturedBy→SecurityCamera, relatedTo→SecurityIncident, storedIn→DataStorageSystem

## Security Incident
- **genus**: `bfo:0000015`
- **definition**: An event occurring on library property that involves illegal behavior, policy violations, or security concerns requiring investigation or response.
- **attributes**: incidentId, incidentDateTime, incidentType, severityLevel, status, reportedBy
- **relations**: occurredAt→LibraryProperty, hasEvidence→VideoSurveillanceData, investigatedBy→StaffMember, reportedTo→LawEnforcementAgency

## Staff Member
- **genus**: `bfo:0000002`
- **definition**: An employee of the Teton County Library authorized to access security camera data or investigate security incidents.
- **attributes**: staffId, fullName, role, accessLevel, hireDate
- **relations**: accesses→VideoSurveillanceData, investigates→SecurityIncident, reportsTo→StaffMember

## Law Enforcement Agency
- **genus**: `bfo:0000004`
- **definition**: An external governmental body, such as local police or the Wyoming Department of Family Services, that requests or receives video surveillance data for investigations.
- **attributes**: agencyId, agencyName, agencyType, contactEmail, contactPhone
- **relations**: requestsData→VideoSurveillanceData, investigates→SecurityIncident

## Data Storage System
- **genus**: `bfo:0000040`
- **definition**: The digital infrastructure used to store and manage recorded video surveillance data from library security cameras.
- **attributes**: systemId, systemName, storageCapacityGB, lastBackupDate, encryptionStatus
- **relations**: stores→VideoSurveillanceData
