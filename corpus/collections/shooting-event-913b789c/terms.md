# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Shooting Event
- **genus**: `bfo:0000015`
- **definition**: A competitive shooting activity defined by weapon type, distance, and gender category.
- **attributes**: eventCode, genderCategory, qualificationScore, finalScore, finalRank, medalAwarded
- **relations**: hasParticipant→Shooter, heldAt→Championship

## Shooter
- **genus**: `bfo:0000040`
- **definition**: A human athlete who participates in a shooting event.
- **attributes**: shooterId, fullName, nationality, isOlympicChampion
- **relations**: competesIn→ShootingEvent, represents→NationalTeam

## National Team
- **genus**: `bfo:0000040`
- **definition**: A group of shooters representing a specific country in a championship.
- **attributes**: teamCode, countryName, totalScore, teamRank, teamMedal
- **relations**: competesIn→ShootingEvent, hasMember→Shooter

## Championship
- **genus**: `bfo:0000015`
- **definition**: A multi-day international shooting competition held at a specific location.
- **attributes**: championshipName, editionNumber, hostCity, hostCountry, startDate, endDate
- **relations**: hostsEvent→ShootingEvent, heldIn→Location

## Location
- **genus**: `bfo:0000002`
- **definition**: A specific geographical place where a championship is held.
- **attributes**: cityName, countryName
