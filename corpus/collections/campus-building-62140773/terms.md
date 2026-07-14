# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Campus Building
- **genus**: `bfo:0000040`
- **definition**: A physical structure on the William & Mary campus used for academic, residential, or administrative purposes.
- **attributes**: buildingId, buildingName, yearBuilt, buildingType, hasFiberOpticCable, numberOfFloors
- **relations**: housesDepartment→AcademicDepartment, containsRoom→CampusRoom, locatedInCampusArea→CampusArea

## Academic Department
- **genus**: `bfo:0000040`
- **definition**: An organizational unit within a university responsible for teaching and research in a specific field.
- **attributes**: departmentId, departmentName, parentUniversity, hasMuseum, offersGraduateProgram, numberOfStudents
- **relations**: locatedInBuilding→CampusBuilding, sponsorsEvent→CampusEvent, offersLanguage→Language

## Campus Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled activity or gathering occurring on the campus, such as a ball, screening, or philanthropy event.
- **attributes**: eventId, eventName, eventDate, eventLocation, isAnnual, charityBeneficiary
- **relations**: heldAtLocation→CampusArea, organizedBy→StudentOrganization, benefitsCharity→Charity

## Student Organization
- **genus**: `bfo:0000040`
- **definition**: A group of students organized for social, academic, or philanthropic purposes.
- **attributes**: orgId, orgName, orgType, isPhilanthropic, foundingYear
- **relations**: organizesEvent→CampusEvent, hasMember→Student, affiliatedWithDepartment→AcademicDepartment

## Campus Area
- **genus**: `bfo:0000040`
- **definition**: A designated physical space on the campus, such as a garden, quad, or parking lot.
- **attributes**: areaId, areaName, areaType, isWirelessEnabled, areaDescription
- **relations**: surroundedByBuilding→CampusBuilding, containsStatue→Statue, adjacentToArea→CampusArea

## Statue
- **genus**: `bfo:0000040`
- **definition**: A sculptural representation of a person or entity located on the campus grounds.
- **attributes**: statueId, statueName, dedicatedPerson, giftFrom, dedicationYear, isDecoratedByStudents
- **relations**: locatedInArea→CampusArea, commemoratesPerson→HistoricalFigure

## Historical Figure
- **genus**: `bfo:0000002`
- **definition**: A notable person from history who has a connection to the institution or location.
- **attributes**: figureId, fullName, birthYear, deathYear, foundedInstitution, enrollmentDate
- **relations**: commemoratedByStatue→Statue, alumnusOf→Institution

## Charity
- **genus**: `bfo:0000040`
- **definition**: An organization dedicated to providing aid and support to specific groups in need.
- **attributes**: charityId, charityName, targetBeneficiaries, location, isLocal
- **relations**: benefitsFromEvent→CampusEvent, receivesDonation→StudentOrganization
