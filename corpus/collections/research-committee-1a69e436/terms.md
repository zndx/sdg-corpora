# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Research Committee Academic Board
- **genus**: `bfo:0000040`
- **definition**: A research committee academic board that governs research activities within the institution.
- **attributes**: committeeId, name, establishedDate, status
- **relations**: hasVicePresident→ResearchVicePresident, hasMember→AcademicBoardMember

## Vice-president of Research
- **genus**: `bfo:0000040`
- **definition**: A senior administrative role responsible for overseeing research activities and the research committee.
- **attributes**: officialName, title, appointmentDate, status
- **relations**: oversees→ResearchCommittee, oversees→ScientificBureau

## Scientific Bureau
- **genus**: `bfo:0000040`
- **definition**: A scientific bureau that supports the research committee in evaluating and managing research proposals.
- **attributes**: bureauId, name, establishedDate, status
- **relations**: hasMember→AcademicBoardMember

## Doctoral School
- **genus**: `bfo:0000040`
- **definition**: An organizational unit responsible for doctoral training, research supervision, and academic administration.
- **attributes**: schoolId, name, code, establishedDate, status
- **relations**: hasDirector→DoctoralSchoolDirector, hasLaboratory→ResearchLaboratory, isPartOf→DoctoralCollege

## Director of Doctoral School
- **genus**: `bfo:0000040`
- **definition**: An academic administrator responsible for leading a specific doctoral school.
- **attributes**: officialName, title, appointmentDate, status
- **relations**: directs→DoctoralSchool

## Doctoral College
- **genus**: `bfo:0000040`
- **definition**: A regional or inter-university body that groups together multiple doctoral schools.
- **attributes**: collegeId, name, establishedDate, status
- **relations**: hasMemberSchool→DoctoralSchool

## Research Laboratory
- **genus**: `bfo:0000040`
- **definition**: A research laboratory that conducts scientific research and is affiliated with a doctoral school.
- **attributes**: labId, name, establishedDate, status
- **relations**: isAffiliatedWith→DoctoralSchool

## Research and Technology Transfer Department
- **genus**: `bfo:0000040`
- **definition**: A department responsible for managing technology transfer and commercialization of research outcomes.
- **attributes**: departmentId, name, establishedDate, status
- **relations**: hasAdministrativeDirector→AdministrativeDirector, hasVicePresident→TechnologyTransferVicePresident

## Administrative Director
- **genus**: `bfo:0000040`
- **definition**: An administrative role responsible for the day-to-day management of a department.
- **attributes**: officialName, title, appointmentDate, status
- **relations**: manages→TechnologyTransferDepartment

## Vice-President in charge of Research and Technology Transfer
- **genus**: `bfo:0000040`
- **definition**: A senior administrative role responsible for overseeing research and technology transfer activities.
- **attributes**: officialName, title, appointmentDate, status
- **relations**: oversees→TechnologyTransferDepartment
