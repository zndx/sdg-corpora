# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000040`
- **definition**: An individual enrolled in the Worcester Polytechnic Institute academic community who is subject to the institution's code of conduct and responsibilities.
- **attributes**: studentId, firstName, lastName, emailAddress, enrollmentStatus, enrollmentYear
- **relations**: subjectTo→CodeOfConduct, subjectTo→InterimSuspension, subjectTo→NoContactDirective, participatesIn→StudentActivity

## Code of Conduct
- **genus**: `cco:ont00000958`
- **definition**: The formal document outlining the rights, responsibilities, and behavioral standards expected of students at Worcester Polytechnic Institute.
- **attributes**: documentId, title, effectiveDate, versionNumber, approvalDate, issuingBody
- **relations**: governs→Student, defines→InterimSuspension, defines→NoContactDirective, defines→StudentActivity

## Interim Suspension
- **genus**: `bfo:0000015`
- **definition**: A temporary administrative action terminating a student's presence on campus prior to a formal hearing due to safety concerns.
- **attributes**: suspensionId, impositionDate, hearingDate, issuingAuthority, reason, status
- **relations**: appliesTo→Student, triggers→Hearing, issuedBy→DeanOfStudentsStaff

## No Contact Directive
- **genus**: `cco:ont00000958`
- **definition**: A directive restricting verbal, written, or third-party contact between specific students involved in a conduct matter.
- **attributes**: directiveId, issueDate, issuingOffice, contactType, status
- **relations**: restrictsContactBetween→Student, issuedBy→DeanOfStudentsStaff

## Student Activity
- **genus**: `bfo:0000015`
- **definition**: A co-curricular or residential engagement, such as Greek life or campus organizations, governed by student contracts and agreements.
- **attributes**: activityId, activityName, category, status, governingPolicy
- **relations**: hasParticipant→Student, subjectTo→CodeOfConduct, managedBy→DeanOfStudentsStaff

## Conduct Hearing
- **genus**: `bfo:0000015`
- **definition**: A formal proceeding conducted by the Campus Hearing Board to review matters related to interim suspensions or conduct violations.
- **attributes**: hearingId, scheduledDate, status, outcome
- **relations**: reviews→InterimSuspension, conductedBy→CampusHearingBoard, involves→Student

## Campus Hearing Board
- **genus**: `bfo:0000040`
- **definition**: A designated body authorized to conduct formal hearings regarding student conduct matters and interim suspensions.
- **attributes**: boardId, boardName, establishedDate
- **relations**: conducts→Hearing, oversees→Student

## Dean of Students Staff
- **genus**: `bfo:0000040`
- **definition**: Administrative personnel responsible for the administration of the judicial system and authority to impose administrative sanctions.
- **attributes**: staffId, roleTitle, department
- **relations**: issues→InterimSuspension, issues→NoContactDirective, manages→StudentActivity
