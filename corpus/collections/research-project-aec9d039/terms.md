# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A coordinated scientific investigation with defined objectives, funding, and temporal boundaries.
- **attributes**: projectIdentifier, projectTitle, fundingAgency, startDate, endDate, projectStatus
- **relations**: conductedBy→Researcher, produces→Publication, fundedBy→FundingAgency

## Publication
- **genus**: `cco:ont00000958`
- **definition**: A formal record of research findings, such as a book, journal article, or conference paper.
- **attributes**: publicationIdentifier, title, publicationDate, publicationType, language, peerReviewed
- **relations**: authoredBy→Researcher, publishedIn→Journal, partOfProject→ResearchProject

## Researcher
- **genus**: `bfo:0000002`
- **definition**: An individual engaged in systematic investigation and knowledge production.
- **attributes**: researcherId, fullName, institution, department, role
- **relations**: affiliatedWith→Institution, conducts→ResearchProject, authored→Publication

## Institution
- **genus**: `bfo:0000040`
- **definition**: An established organization or academic body providing infrastructure for research and education.
- **attributes**: institutionId, institutionName, country, institutionType
- **relations**: employs→Researcher, hosts→ResearchProject

## Journal
- **genus**: `cco:ont00000958`
- **definition**: A periodical publication series that disseminates peer-reviewed scientific articles.
- **attributes**: journalId, journalName, issn, publisher, impactFactor
- **relations**: publishes→Publication, editedBy→EditorialBoard

## Editorial Board
- **genus**: `bfo:0000002`
- **definition**: A group of experts responsible for overseeing the content and quality of a scientific journal.
- **attributes**: boardId, role, appointmentDate
- **relations**: servesOn→Journal, memberOf→Researcher
