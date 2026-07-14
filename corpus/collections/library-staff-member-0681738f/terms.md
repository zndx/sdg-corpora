# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Library Staff Member
- **genus**: `bfo:0000040`
- **definition**: A person employed by Oesterle Library in a professional or support capacity.
- **attributes**: staffId, fullName, startDate, endDate, currentRole, employmentStatus
- **relations**: employedAt→Library, holdsRole→LibraryRole, supervised→LibraryStaffMember

## Library Role
- **genus**: `bfo:0000023`
- **definition**: A functional position or job title held by a staff member within the library.
- **attributes**: roleCode, roleTitle, department, responsibilityLevel
- **relations**: heldBy→LibraryStaffMember, partOfDepartment→LibraryDepartment

## Library Department
- **genus**: `bfo:0000040`
- **definition**: A functional subdivision within the library organization.
- **attributes**: deptCode, deptName, location
- **relations**: containsRole→LibraryRole, locatedIn→Library

## Library
- **genus**: `bfo:0000040`
- **definition**: The physical and organizational entity of Oesterle Library.
- **attributes**: libraryId, libraryName, institution, establishedDate
- **relations**: employs→LibraryStaffMember, containsDepartment→LibraryDepartment, hostsEvent→LibraryEvent

## Library Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled activity or presentation hosted by the library.
- **attributes**: eventId, eventName, eventDate, eventTime, location, seriesName
- **relations**: hostedBy→Library, featuresSpeaker→ExternalSpeaker, partOfSeries→EventSeries

## External Speaker
- **genus**: `bfo:0000040`
- **definition**: A person invited to present at a library event who is not a staff member.
- **attributes**: speakerId, fullName, affiliation, expertise
- **relations**: presentedAt→LibraryEvent, affiliatedWith→Institution

## Event Series
- **genus**: `bfo:0000015`
- **definition**: A recurring collection of library events under a common theme.
- **attributes**: seriesId, seriesName, frequency
- **relations**: includesEvent→LibraryEvent, organizedBy→Library

## Student Assistant
- **genus**: `bfo:0000040`
- **definition**: A student employed by the library in a support role.
- **attributes**: studentId, fullName, major, graduationYear, employmentStatus
- **relations**: worksAt→Library, assignedToRole→LibraryRole, supervisedBy→LibraryStaffMember
