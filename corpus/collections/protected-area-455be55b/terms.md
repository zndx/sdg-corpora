# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Protected Area
- **genus**: `cco:ont00000995`
- **definition**: A geographically defined territory designated for conservation of biodiversity and natural/cultural heritage within the Alpine Convention perimeter.
- **attributes**: identifier, name, areaHectares, establishedDate, protectionLevel, administeringEntity, isALPARCMember
- **relations**: locatedIn→AlpineRegion, managedBy→ProtectedAreaAdministration, participatesIn→TransalpineEcologicalNetwork, monitoredBy→FaunaMonitoringProgram

## Alpine Region
- **genus**: `bfo:0000004`
- **definition**: The geographical and political space covered by the Alpine Convention, spanning multiple sovereign states.
- **attributes**: regionCode, totalAreaHectares, memberStates, perimeterDefinitionDate
- **relations**: contains→ProtectedArea, governedBy→AlpineConvention

## Transalpine Ecological Network
- **genus**: `cco:ont00000995`
- **definition**: A coordinated system of protected areas and ecological corridors designed to maintain biodiversity across Alpine borders.
- **attributes**: networkId, name, establishedDate, totalCorridorLengthKm, status, coordinatingEntity
- **relations**: includes→ProtectedArea, coordinatedBy→ALPARC, supports→FaunaMonitoringProgram

## ALPARC Network
- **genus**: `cco:ont00000995`
- **definition**: The network organization coordinating protected area management, project implementation, and expertise exchange across the Alpine Convention area.
- **attributes**: organizationId, name, foundedDate, headquartersCity, headquartersCountry, totalMemberAreas, coveragePercentage
- **relations**: coordinates→TransalpineEcologicalNetwork, manages→JointEuropeanProject, employs→ProjectLeader, organizes→ProfessionalEvent

## Joint European Project
- **genus**: `bfo:0000015`
- **definition**: A time-bound, collaborative initiative funded under European programmes to achieve conservation or sustainable development goals in Alpine protected areas.
- **attributes**: projectCode, title, startDate, endDate, fundingSource, budgetEuros, status, deliverableCount
- **relations**: involves→ProtectedArea, coordinatedBy→ALPARC, managedBy→ProjectLeader, produces→Publication

## Project Leader
- **genus**: `bfo:0000023`
- **definition**: A professional role responsible for managing and coordinating international conservation projects, events, and working groups within ALPARC.
- **attributes**: employeeId, fullName, contractStartDate, contractEndDate, weeklyHours, primaryLanguage, secondaryLanguage, hasDrivingLicense, yearsExperience
- **relations**: manages→JointEuropeanProject, coordinates→WorkingGroup, employedBy→ALPARC, basedIn→OfficeLocation

## Professional Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled gathering such as a conference, workshop, or symposium organized to facilitate knowledge exchange, project coordination, or training among protected area managers.
- **attributes**: eventId, title, eventType, startDate, endDate, locationCity, locationCountry, participantCount, status, topic
- **relations**: organizedBy→ALPARC, attendedBy→ProtectedAreaAdministration, supports→JointEuropeanProject, coordinatedBy→ProjectLeader
