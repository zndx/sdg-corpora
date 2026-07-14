# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Bullying Incident
- **genus**: `bfo:0000015`
- **definition**: A deliberate act or series of acts by an individual or group that causes harm, distress, or damage to another person's property, reputation, or social standing, characterized by an imbalance of power.
- **attributes**: incidentId, dateReported, severityLevel, incidentType, status, location, description
- **relations**: involvesVictim→Student, involvesPerpetrator→Student, recordedBy→StaffMember, escalatedTo→ExternalAuthority

## Student
- **genus**: `bfo:0000002`
- **definition**: An individual enrolled in the school who participates in the educational environment and is subject to the school's policies and code of conduct.
- **attributes**: studentId, fullName, gradeLevel, enrollmentStatus, dateOfBirth, guardianContactId
- **relations**: hasGuardian→Parent, involvedInIncidentAsVictim→BullyingIncident, involvedInIncidentAsPerpetrator→BullyingIncident, receivesCounseling→SupportService

## Staff Member
- **genus**: `bfo:0000002`
- **definition**: An employee of the school, including teachers, coordinators, and administrative personnel, responsible for implementing policies and responding to incidents.
- **attributes**: staffId, fullName, role, employmentStatus, department, cybersafetyTrained
- **relations**: reportsIncident→BullyingIncident, providesSupportTo→Student, assignedToClassroom→Classroom

## Parent
- **genus**: `bfo:0000002`
- **definition**: A legal guardian or caregiver of a student who is engaged with the school community and responsible for the student's welfare and education.
- **attributes**: parentId, fullName, contactNumber, emailAddress, relationshipToStudent
- **relations**: hasChild→Student, notifiedOfIncident→BullyingIncident, participatesInConciliation→BullyingIncident

## Support Service
- **genus**: `cco:ont00000995`
- **definition**: A professional service or intervention provided to students or staff to address the consequences of bullying, such as counseling, welfare coordination, or conflict resolution.
- **attributes**: serviceId, serviceType, providerName, startDate, endDate, status
- **relations**: providedTo→Student, facilitatedBy→StaffMember, relatedToIncident→BullyingIncident

## External Authority
- **genus**: `bfo:0000002`
- **definition**: An outside organization or agency, such as police or government departments, that may be involved in the investigation or resolution of serious bullying incidents.
- **attributes**: authorityId, authorityName, contactPerson, contactNumber, authorityType
- **relations**: receivesReportFrom→BullyingIncident, providesSupportTo→StaffMember
