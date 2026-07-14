# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Protected Area
- **genus**: `cco:ont00000995`
- **definition**: A designated geographical region within the Alpine Convention area that is managed for conservation purposes, such as national parks, nature reserves, or landscape parks.
- **attributes**: identifier, name, areaSize, establishmentDate, managementStatus, zoningClassification, countryCode
- **relations**: managedBy→ManagementUnit, locatedIn→AlpineRegion, participatesIn→Project

## Management Unit
- **genus**: `cco:ont00000995`
- **definition**: The administrative body or institution responsible for the day-to-day governance, planning, and conservation activities of a specific protected area.
- **attributes**: unitId, unitName, headquartersLocation, establishmentDate, legalStatus, contactEmail
- **relations**: oversees→ProtectedArea, coordinatesWith→ALPARC

## Project
- **genus**: `bfo:0000015`
- **definition**: A coordinated, temporary endeavor undertaken to achieve specific conservation, research, or management goals within the Alpine region, often funded by European programmes.
- **attributes**: projectId, projectName, startDate, endDate, fundingSource, projectStatus, budgetAmount, primaryObjective
- **relations**: initiatedBy→ALPARC, involvesPartner→ProtectedArea, involvesPartner→ManagementUnit, executedBy→ProjectLeader

## Project Leader
- **genus**: `bfo:0000023`
- **definition**: A professional role responsible for managing tasks, coordinating partners, and organizing events for international conservation projects within the ALPARC network.
- **attributes**: employeeId, fullName, contractStartDate, contractEndDate, primaryLanguage, secondaryLanguage, educationLevel, yearsExperience
- **relations**: employedBy→ALPARC, managesProject→Project, coordinatesWith→ManagementUnit

## ALPARC Organization
- **genus**: `cco:ont00000995`
- **definition**: The central coordinating network and association that facilitates cooperation, project management, and knowledge exchange among Alpine protected areas.
- **attributes**: orgId, orgName, headquartersCity, headquartersCountry, foundingYear, websiteUrl, totalMembers
- **relations**: coordinates→Project, employs→ProjectLeader, coordinatesWith→ManagementUnit

## Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled gathering, workshop, or symposium organized to facilitate knowledge exchange, professional development, or project coordination among protected area managers.
- **attributes**: eventId, eventName, eventDate, eventType, location, organizer, attendanceCount
- **relations**: organizedBy→ALPARC, attendedBy→ManagementUnit, attendedBy→ProjectLeader
