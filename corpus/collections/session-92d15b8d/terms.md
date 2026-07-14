# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Scheduled Academic Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled academic session within the ARRALD program, representing a discrete block of instructional or discussion time.
- **attributes**: sessionIdentifier, startTime, endTime, title, status
- **relations**: deliveredBy→FacultyMember, partOf→ProgramDay, coversTopic→AcademicTopic

## Program Day
- **genus**: `bfo:0000015`
- **definition**: A single calendar day on which the ARRALD program activities occur, serving as a container for multiple sessions.
- **attributes**: date, dayNumber, location
- **relations**: containsSession→Session, partOf→ARRALDProgram

## Faculty Member
- **genus**: `cco:ont00000995`
- **definition**: An individual with academic or clinical expertise who delivers instruction or leads discussions within the program.
- **attributes**: facultyId, fullName, credential, affiliation
- **relations**: deliversSession→Session, specializesIn→AcademicTopic

## Academic Topic
- **genus**: `bfo:0000015`
- **definition**: A specific subject matter or skill area addressed during a session, such as leadership theory or communication skills.
- **attributes**: topicId, topicName, category
- **relations**: coveredIn→Session

## ARRALD Program
- **genus**: `bfo:0000015`
- **definition**: The overarching Radiology Resident Academic Leadership Development program, encompassing all scheduled days and sessions.
- **attributes**: programId, programName, startDate, endDate, organizingBody
- **relations**: containsDay→ProgramDay, administersTo→Resident

## Resident Participant
- **genus**: `cco:ont00000995`
- **definition**: A radiology resident participating in the ARRALD program for academic leadership development.
- **attributes**: residentId, fullName, institution, yearOfTraining
- **relations**: enrolledIn→ARRALDProgram, attendsSession→Session
