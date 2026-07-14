# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Tournament Game
- **genus**: `bfo:0000015`
- **definition**: A competitive correspondence chess match between two players or teams, governed by ICCF rules and tracked via move cards or electronic transmission.
- **attributes**: gameId, startDate, endDate, timeControl, status, notationAgreement, transmissionMode, isTeamEvent
- **relations**: hasPlayer→Player, hasTournamentDirector→TournamentDirector, hasTeam→Team, hasMoveCard→MoveCard

## Player
- **genus**: `bfo:0000015`
- **definition**: An individual chess competitor participating in a tournament game, responsible for making moves and managing time.
- **attributes**: playerId, fullName, emailAddress, countryCode, isTeamCaptain, vacationPeriods, totalTimeUsed, accumulatedTime
- **relations**: participatesIn→TournamentGame, representsTeam→Team, contactedBy→TournamentDirector, contactedBy→TeamCaptain

## Team
- **genus**: `bfo:00000995`
- **definition**: A group of players competing together in a team tournament event, represented by a designated Team Captain.
- **attributes**: teamId, teamName, countryCode, captainId, registrationDate, status
- **relations**: hasCaptain→TeamCaptain, hasMember→Player, competesIn→TournamentGame

## Team Captain
- **genus**: `bfo:0000023`
- **definition**: A player who serves as the official liaison between their team and the Tournament Director for administrative and dispute resolution purposes.
- **attributes**: captainId, fullName, emailAddress, teamId, notificationPreference
- **relations**: representsTeam→Team, contacts→TournamentDirector, contacts→OpposingTeamCaptain

## Move Card
- **genus**: `bfo:00000995`
- **definition**: A physical or electronic record containing a player's move, time usage, and postmark or transmission timestamp.
- **attributes**: cardId, moveNumber, playerId, moveNotation, timeUsed, postmarkDate, transmissionTimestamp, isAmbiguous, status
- **relations**: belongsGame→TournamentGame, submittedBy→Player, receivedBy→Player, verifiedBy→TournamentDirector

## Tournament Director
- **genus**: `bfo:0000023`
- **definition**: An official responsible for enforcing ICCF rules, managing game status, resolving disputes, and recording forfeits or penalties.
- **attributes**: tdId, fullName, emailAddress, jurisdiction, activeGamesCount, disputeResolutionLog
- **relations**: oversees→TournamentGame, contacts→Player, contacts→TeamCaptain, verifies→MoveCard
