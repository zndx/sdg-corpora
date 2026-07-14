# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Research Desk
- **genus**: `bfo:0000015`
- **definition**: A rapid-response research activity conducted by a knowledge management centre to support policy development and project implementation for international development agencies.
- **attributes**: deskIdentifier, agencyFundedBy, startDate, endDate, status, responseType
- **relations**: conductedBy→ProjectManager, fundedBy→DevelopmentAgency, produces→ResearchOutput

## Project Manager
- **genus**: `bfo:0000023`
- **definition**: A role held by an individual responsible for managing research desks, knowledge management initiatives, and information technology solutions in international development contexts.
- **attributes**: managerId, fullName, email, telephone, currentRole, institution
- **relations**: manages→ResearchDesk, affiliatedWith→Institution, holdsQualification→AcademicQualification

## Development Agency
- **genus**: `bfo:0000040`
- **definition**: An international organization or governmental body that commissions rapid-response research to support policy development and project implementation in international development.
- **attributes**: agencyCode, agencyName, countryOfOrigin, fundingProgram, establishedYear
- **relations**: commissions→ResearchDesk, funds→ResearchDesk

## Research Output
- **genus**: `cco:ont00000995`
- **definition**: A tangible or digital product resulting from a research desk activity, such as a report, case study, or policy brief, used to inform development policy and implementation.
- **attributes**: outputId, title, publicationDate, format, accessLevel, pageCount
- **relations**: producedBy→ResearchDesk, authoredBy→ProjectManager, cites→ResearchOutput

## Academic Qualification
- **genus**: `cco:ont00000995`
- **definition**: A formal educational credential awarded by an academic institution, representing specialized knowledge in fields such as management, engineering, or development studies.
- **attributes**: qualificationId, degreeType, fieldOfStudy, awardingInstitution, graduationYear, distinctionLevel
- **relations**: heldBy→ProjectManager, awardedBy→Institution

## Institution
- **genus**: `bfo:0000040`
- **definition**: An organizational entity such as a university, research centre, or NGO that employs project managers, awards academic qualifications, and hosts knowledge management initiatives.
- **attributes**: institutionCode, institutionName, country, institutionType, foundedYear, address
- **relations**: employs→ProjectManager, awards→AcademicQualification, hosts→ResearchDesk
