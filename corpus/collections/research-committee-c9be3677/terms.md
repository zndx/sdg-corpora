# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Research Committee Academic Board
- **genus**: `bfo:0000040`
- **definition**: A social group constituted to oversee and govern research activities within the institution.
- **attributes**: committeeIdentifier, establishedDate, governanceStatus
- **relations**: hasChair→ResearchExecutive, oversees→ResearchLaboratory

## Research Executive Officer
- **genus**: `bfo:0000002`
- **definition**: A person holding a specific administrative or academic role responsible for research management or technology transfer.
- **attributes**: executiveIdentifier, fullLegalName, appointmentDate, departmentCode
- **relations**: holdsRoleIn→ResearchCommittee, leads→ResearchLaboratory

## Doctoral School
- **genus**: `bfo:0000040`
- **definition**: An organizational unit responsible for the administration, training, and supervision of doctoral candidates within a specific academic domain.
- **attributes**: schoolCode, schoolName, academicFocus, memberLaboratoryCount, jurisdictionalScope
- **relations**: hasDirector→ResearchExecutive, comprises→ResearchLaboratory, isPartOf→DoctoralCollege

## Doctoral College
- **genus**: `bfo:0000040`
- **definition**: A regional or inter-university consortium that aggregates multiple doctoral schools to coordinate graduate training across a geographic area.
- **attributes**: collegeIdentifier, collegeName, geographicRegion, constituentSchoolCount
- **relations**: aggregates→DoctoralSchool

## Research Laboratory
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual organizational unit dedicated to conducting scientific research and generating knowledge.
- **attributes**: laboratoryIdentifier, laboratoryName, researchDomain, operationalStatus
- **relations**: assignedTo→DoctoralSchool, supervisedBy→ResearchExecutive
