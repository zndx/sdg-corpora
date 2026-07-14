# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Game Match
- **genus**: `bfo:0000015`
- **definition**: A scheduled competitive contest between two affiliated teams governed by BAFA 5-on-5 rules.
- **attributes**: matchId, startDate, status, homeTeamId, awayTeamId, venueId, officialsCount
- **relations**: playedOn→PlayingField, supervisedBy→OfficiatingCrew, participatesTeam→Team

## Playing Field
- **genus**: `bfo:0000040`
- **definition**: A rectangular spatial enclosure with specific dimensions and markings designated for 5-on-5 football play.
- **attributes**: fieldId, lengthYards, widthYards, endZoneDepthYards, hasGoalPosts, hasHashMarks, hasNoRunZone, surfaceType
- **relations**: hostsMatch→GameMatch

## Team
- **genus**: `bfo:0000040`
- **definition**: A group of players affiliated with an organization, competing as a single unit in a match.
- **attributes**: teamId, teamName, affiliationId, maxSquadSize, minSquadSize, gender, ageGroup
- **relations**: competesIn→GameMatch, composedOf→Player

## Player
- **genus**: `bfo:0000006`
- **definition**: An individual athlete participating in a team, subject to positioning and participation rules.
- **attributes**: playerId, firstName, lastName, jerseyNumber, position, isEligibleToBlitz, stanceType
- **relations**: memberOf→Team, assignedTo→GameMatch

## Officiating Crew
- **genus**: `bfo:0000040`
- **definition**: A group of officials supervising a match according to IFAF mechanics and BAFA rules.
- **attributes**: crewId, mechanicsManualVersion, officialsCount, supervisionStatus
- **relations**: supervises→GameMatch

## Penalty
- **genus**: `bfo:0000015`
- **definition**: A sanction applied to a team for violating a specific rule during a down.
- **attributes**: penaltyId, ruleArticle, yardage, penaltyType, enforcedBy
- **relations**: occursIn→GameMatch, assessedAgainst→Team
