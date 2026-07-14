# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Faculty Researcher
- **genus**: `bfo:0000040`
- **definition**: A human scholar holding a faculty position who engages in research and publication activities.
- **attributes**: researcherId, fullName, age, isMarried, highestDegree, university, researchField, publicationCount
- **relations**: holdsRank→AcademicRank, worksAt→University, specializesIn→ResearchField, hasCoreCharacteristics→CoreCharacteristic

## Academic Rank
- **genus**: `bfo:0000023`
- **definition**: A formal title or position held by a faculty member within a university hierarchy.
- **attributes**: rankCode, rankTitle, level, responsibilities
- **relations**: heldBy→FacultyResearcher

## University
- **genus**: `bfo:0000004`
- **definition**: An educational institution where faculty members conduct research and teach.
- **attributes**: universityId, universityName, location, country, researchOutputRank
- **relations**: employs→FacultyResearcher

## Research Field
- **genus**: `bfo:0000004`
- **definition**: A specific academic discipline or area of study in which a researcher specializes.
- **attributes**: fieldCode, fieldName, category
- **relations**: studiedBy→FacultyResearcher

## Core Characteristic
- **genus**: `bfo:0000016`
- **definition**: An intrinsic personal trait or quality that influences a researcher's productivity and behavior.
- **attributes**: traitId, traitName, description, impactLevel
- **relations**: exhibitedBy→FacultyResearcher

## Publication
- **genus**: `cco:ont00000958`
- **definition**: A scholarly work produced and disseminated by a researcher, contributing to scientific literature.
- **attributes**: publicationId, title, publicationDate, journalName, isInternational, citationCount
- **relations**: authoredBy→FacultyResearcher, publishedIn→Journal

## Journal
- **genus**: `cco:ont00000958`
- **definition**: A periodical publication in which scholarly articles are published.
- **attributes**: journalId, journalName, issn, isInternational, impactFactor
- **relations**: hostsPublication→Publication
