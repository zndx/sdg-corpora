# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Physical School Location
- **genus**: `bfo:0000040`
- **definition**: A material entity representing the physical premises where the educational institution conducts its operations and classes.
- **attributes**: streetAddress, city, state, postalCode, country, buildingFloors, totalAreaSqFt
- **relations**: contains→Classroom, contains→ComputerLab, contains→AdministrativeOffice, locatedIn→Jurisdiction

## Classroom
- **genus**: `bfo:0000040`
- **definition**: A physical room within the school facility designated for instructional activities.
- **attributes**: roomIdentifier, capacity, equipmentInventory
- **relations**: locatedIn→PhysicalLocation, hosts→InstructionalSession

## Instructional Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled period of teaching and learning activity conducted for students.
- **attributes**: sessionIdentifier, startDate, endDate, status
- **relations**: heldIn→Classroom, instructedBy→FacultyMember, enrolls→Student

## Faculty Member
- **genus**: `bfo:0000023`
- **definition**: A qualified individual holding the role of an instructor or teacher within the institution.
- **attributes**: employeeId, fullName, nativeLanguage, qualificationLevel, certificationType, employmentStatus
- **relations**: employedBy→Institution, conducts→InstructionalSession, receives→ProfessionalDevelopment

## Student
- **genus**: `bfo:0000004`
- **definition**: A person enrolled in the institution's educational programs.
- **attributes**: studentId, fullName, nationality, visaStatus, enrollmentDate, currentLevel
- **relations**: enrolledIn→InstructionalSession, submits→StudentSurvey, holds→I20Form

## Student Survey
- **genus**: `cco:ont00000995`
- **definition**: A record of feedback collected from students regarding the ESL program and teachers.
- **attributes**: surveyId, collectionDate, feedbackCategory, satisfactionScore, comments
- **relations**: submittedBy→Student, evaluates→FacultyMember, reviews→InstructionalSession

## Accreditation
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition granted by an accrediting agency validating the institution's compliance with educational standards.
- **attributes**: accreditationId, issuingAgency, startDate, endDate, status
- **relations**: grantedTo→Institution, issuedBy→AccreditingBody

## I-20 Form
- **genus**: `cco:ont00000995`
- **definition**: A certificate of eligibility for nonimmigrant student status issued by the institution via the SEVIS system.
- **attributes**: formId, issueDate, sevisId, programStartDate, programEndDate, fundingSource
- **relations**: issuedTo→Student, issuedBy→Institution
