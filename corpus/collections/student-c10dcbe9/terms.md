# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000040`
- **definition**: A person taking courses at the University, either full-time or part-time, pursuing undergraduate, graduate, or professional studies, enrolled in person or online.
- **attributes**: studentId, fullName, enrollmentStatus, studyLevel, residenceStatus, admissionNotificationDate
- **relations**: subjectOf→ConductViolation, memberOf→UniversityCommunity

## Faculty Member
- **genus**: `bfo:0000040`
- **definition**: A person hired by the University to conduct classroom or teaching activities or who is otherwise considered by the University to be a member of its faculty.
- **attributes**: facultyId, fullName, department, employmentStatus, hireDate
- **relations**: teaches→Course, memberOf→UniversityCommunity

## University Official
- **genus**: `bfo:0000040`
- **definition**: A person employed by the University, performing assigned administrative or professional responsibilities and the Board of Regents and its members.
- **attributes**: officialId, fullName, role, department, employmentStatus, hireDate
- **relations**: administers→StudentCode, memberOf→UniversityCommunity

## Conduct Violation
- **genus**: `bfo:0000015`
- **definition**: An act of proscribed conduct by a student that violates the Student Code of Conduct.
- **attributes**: violationId, description, dateOfIncident, location, severityLevel, status
- **relations**: committedBy→Student, reportedBy→UniversityCommunity, adjudicatedBy→StudentConductBoard, sanctionedBy→StudentConductAdministrator

## Student Conduct Board
- **genus**: `bfo:0000015`
- **definition**: A group of persons authorized by the Vice President of Student Affairs to determine whether a student has violated the Student Code and to recommend sanctions.
- **attributes**: boardId, composition, authorizationDate, status
- **relations**: adjudicates→ConductViolation, authorizedBy→UniversityOfficial

## Student Conduct Administrator
- **genus**: `bfo:0000015`
- **definition**: A University official authorized on a case-by-case basis by the Vice President of Student Affairs to impose sanctions upon any student(s) found to have violated the Student Code.
- **attributes**: administratorId, authorizationDate, caseAuthorization, status
- **relations**: imposesSanctionsOn→ConductViolation, authorizedBy→UniversityOfficial

## University Premises
- **genus**: `bfo:0000002`
- **definition**: All land, buildings, facilities, and other property in the possession of or owned, used, or controlled by the University, including all adjacent streets and sidewalks.
- **attributes**: premisesId, name, type, location
- **relations**: siteOf→ConductViolation
