# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Conference
- **genus**: `bfo:0000015`
- **definition**: A scheduled, organized event where researchers gather to present and discuss scholarly work.
- **attributes**: identifier, title, startDate, endDate, locationCity, locationCountry, status
- **relations**: hostedBy→AcademicInstitution, organizedBy→SteeringCommittee, includesSession→AcademicSession

## Academic Institution
- **genus**: `bfo:0000040`
- **definition**: An organized entity such as a university or department dedicated to education and research.
- **attributes**: institutionName, departmentName, city, postalCode, country, telephone, websiteUrl
- **relations**: hostsEvent→AcademicConference, emplores→AcademicResearcher

## Steering Committee
- **genus**: `bfo:0000040`
- **definition**: A governing body responsible for the overall planning and execution of an academic event.
- **attributes**: committeeName, role, responsibilityLevel
- **relations**: organizesEvent→AcademicConference, hasMember→AcademicResearcher

## Academic Researcher
- **genus**: `bfo:0000002`
- **definition**: A person engaged in scholarly research, teaching, or presentation at an academic event.
- **attributes**: fullName, affiliation, emailAddress, roleAtEvent, isFellow
- **relations**: speaksAt→AcademicSession, affiliatedWith→AcademicInstitution, servesOn→SteeringCommittee

## Academic Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled segment of an academic conference dedicated to specific topics or presentations.
- **attributes**: sessionTitle, sessionType, scheduledDate, venueRoom, status
- **relations**: partOfEvent→AcademicConference, featuresSpeaker→AcademicResearcher

## Research Presentation
- **genus**: `bfo:0000015`
- **definition**: A specific academic talk or paper delivery within a conference session.
- **attributes**: presentationTitle, submissionStatus, presentationType, abstractText
- **relations**: deliveredBy→AcademicResearcher, presentedIn→AcademicSession
