# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Conference
- **genus**: `bfo:0000015`
- **definition**: A scheduled academic event organized by a learned society to facilitate the presentation and discussion of research.
- **attributes**: identifier, title, startDate, endDate, status, regionCode
- **relations**: hostedBy→AcademicInstitution, organizedBy→LearnedSociety, hasSteeringCommittee→SteeringCommittee, hasProgrammeCommittee→ProgrammeCommittee, hasLocalOrganizationCommittee→LocalOrganizationCommittee

## Learned Society
- **genus**: `bfo:0000015`
- **definition**: A non-profit scientific organization dedicated to promoting research and unifying theoretical and empirical approaches in a specific discipline.
- **attributes**: identifier, name, foundingYear, status, fundingModel
- **relations**: publishesJournal→AcademicJournal, publishesMonographSeries→MonographSeries, organizesConference→AcademicConference, awardsFellowship→Fellowship

## Academic Institution
- **genus**: `bfo:0000015`
- **definition**: A physical or virtual organization dedicated to higher education, research, and academic administration.
- **attributes**: identifier, name, city, country, postalCode, website
- **relations**: hostsConference→AcademicConference, hasDepartment→AcademicDepartment

## Academic Department
- **genus**: `bfo:0000015`
- **definition**: A sub-division of an academic institution responsible for a specific field of study and administration.
- **attributes**: identifier, name, headName, contactEmail, contactPhone
- **relations**: partOfInstitution→AcademicInstitution, membersLocalOrganizationCommittee→LocalOrganizationCommittee

## Steering Committee
- **genus**: `bfo:0000015`
- **definition**: The apex administrative body responsible for the overall conduct and oversight of an academic conference.
- **attributes**: identifier, role, responsibilityLevel
- **relations**: chairsConference→AcademicConference, hasMember→AcademicResearcher, interfacesWith→ProgrammeCommittee, interfacesWith→LocalOrganizationCommittee

## Programme Committee
- **genus**: `bfo:0000015`
- **definition**: The academic body responsible for selecting invited speakers, reviewing submitted papers, and preparing the conference schedule.
- **attributes**: identifier, chairName, selectionDeadline, membershipLimit
- **relations**: organizesConference→AcademicConference, hasChair→AcademicResearcher, selectsSpeaker→AcademicResearcher, reviewsPaper→AcademicPaper

## Local Organization Committee
- **genus**: `bfo:0000015`
- **definition**: The administrative body responsible for the logistical and operational tasks required to host an academic conference.
- **attributes**: identifier, convenorName, taskCategory
- **relations**: organizesConference→AcademicConference, hasMember→AcademicResearcher, managesVenue→AcademicInstitution

## Academic Researcher
- **genus**: `bfo:0000015`
- **definition**: A scholar or academic professional engaged in research, teaching, and publication within a specific discipline.
- **attributes**: identifier, fullName, affiliation, email, role, isFellow
- **relations**: affiliatedWith→AcademicInstitution, servesOn→SteeringCommittee, servesOn→ProgrammeCommittee, servesOn→LocalOrganizationCommittee, deliversLecture→AcademicLecture, submitsPaper→AcademicPaper

## Academic Lecture
- **genus**: `bfo:0000015`
- **definition**: A formal presentation or talk delivered by a researcher at an academic conference, often named after a distinguished figure or institution.
- **attributes**: identifier, title, lectureType, namedAfter, scheduledDate, venueRoom
- **relations**: partOfConference→AcademicConference, deliveredBy→AcademicResearcher, heldAt→AcademicInstitution

## Academic Paper
- **genus**: `bfo:0000015`
- **definition**: A scholarly manuscript submitted for review and potential presentation at an academic conference.
- **attributes**: identifier, title, submissionDate, status, isContributed, authorMembershipRequired
- **relations**: submittedTo→AcademicConference, authoredBy→AcademicResearcher, reviewedBy→ProgrammeCommittee
