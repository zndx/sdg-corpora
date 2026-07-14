# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Colloquium Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled academic presentation event where a speaker discusses a specific research topic to an audience.
- **attributes**: identifier, title, scheduledDate, startTime, endTime, status, registrationRequired
- **relations**: presentedBy→Speaker, heldAt→Venue, partOf→Series, hasAbstract→Abstract

## Academic Speaker
- **genus**: `bfo:0000015`
- **definition**: An individual who delivers a presentation or lecture at an academic event.
- **attributes**: identifier, fullName, highestDegree, degreeGrantingInstitution, department, affiliation
- **relations**: delivers→Colloquium, affiliatedWith→Institution

## Physical Event Location
- **genus**: `bfo:0000015`
- **definition**: A specific physical location or room where an academic event takes place.
- **attributes**: identifier, buildingName, roomNumber, floor, capacity, locationType
- **relations**: hosts→Colloquium, locatedIn→Building

## Academic Event Series
- **genus**: `bfo:0000015`
- **definition**: A recurring collection of academic events organized under a common theme or department.
- **attributes**: identifier, name, academicTerm, organizingDepartment, frequency
- **relations**: contains→Colloquium, organizedBy→Department

## Event Description Document
- **genus**: `cco:ont00000958`
- **definition**: A textual summary or description of the content and purpose of an academic presentation.
- **attributes**: identifier, url, wordCount, language, lastModified, accessLevel
- **relations**: describes→Colloquium, createdBy→Speaker

## Academic Department
- **genus**: `bfo:0000015`
- **definition**: An administrative division within an educational institution responsible for academic programs and events.
- **attributes**: identifier, name, code, parentInstitution, establishedDate
- **relations**: organizes→Series, partOf→Institution

## Educational Organization
- **genus**: `bfo:0000015`
- **definition**: A formal organization dedicated to education, research, and academic activities.
- **attributes**: identifier, name, type, location, foundedDate
- **relations**: contains→Department, grants→Degree

## Academic Qualification
- **genus**: `bfo:0000015`
- **definition**: An academic title conferred by an educational institution upon completion of a course of study.
- **attributes**: identifier, name, level, field, issuingInstitution
- **relations**: awardedBy→Institution, heldBy→Speaker
