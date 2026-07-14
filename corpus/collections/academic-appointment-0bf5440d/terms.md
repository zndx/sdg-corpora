# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Appointment
- **genus**: `bfo:0000015`
- **definition**: A professional role or position held by an individual within an academic institution, involving teaching, research, or administrative duties.
- **attributes**: appointmentId, startDate, endDate, title, department, institutionName
- **relations**: heldAt→AcademicInstitution, heldBy→Person, partOf→AcademicDepartment

## Academic Institution
- **genus**: `bfo:0000040`
- **definition**: An organization established for the purpose of higher education, research, and academic instruction.
- **attributes**: institutionId, name, locationCity, locationState, locationCountry, foundingYear
- **relations**: hosts→AcademicDepartment, awards→AcademicAward

## Academic Department
- **genus**: `bfo:0000040`
- **definition**: A specialized division within an academic institution responsible for a specific field of study or administrative function.
- **attributes**: departmentId, name, parentInstitutionId, establishedDate
- **relations**: partOf→AcademicInstitution, employs→Person

## Law Enforcement Appointment
- **genus**: `bfo:0000015`
- **definition**: A professional role or position held by an individual within a law enforcement agency, involving policing, administration, or leadership duties.
- **attributes**: appointmentId, startDate, endDate, title, agencyName, jurisdiction
- **relations**: heldAt→LawEnforcementAgency, heldBy→Person, partOf→LawEnforcementDivision

## Law Enforcement Agency
- **genus**: `bfo:0000040`
- **definition**: An organization responsible for maintaining public order, enforcing laws, and providing police services within a specific jurisdiction.
- **attributes**: agencyId, name, locationCity, locationState, locationCountry, establishedYear
- **relations**: employs→Person, contains→LawEnforcementDivision

## Law Enforcement Division
- **genus**: `bfo:0000040`
- **definition**: A specialized unit or department within a law enforcement agency responsible for specific functions or jurisdictions.
- **attributes**: divisionId, name, parentAgencyId, establishedDate
- **relations**: partOf→LawEnforcementAgency, employs→Person

## Academic Award
- **genus**: `bfo:0000040`
- **definition**: A recognition or honor bestowed upon an individual for achievements in academia, research, or professional service.
- **attributes**: awardId, name, awardingOrganization, yearAwarded, citation
- **relations**: awardedTo→Person, awardedBy→AcademicInstitution

## Person
- **genus**: `bfo:0000002`
- **definition**: A human individual with distinct identity, roles, and attributes.
- **attributes**: personId, firstName, lastName, birthDate, nationality
- **relations**: holds→AcademicAppointment, holds→LawEnforcementAppointment, received→AcademicAward, graduatedFrom→AcademicInstitution
