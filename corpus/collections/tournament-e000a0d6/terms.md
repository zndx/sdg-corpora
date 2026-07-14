# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Tournament
- **genus**: `bfo:0000040`
- **definition**: A structured competitive event for chess games governed by ICCF rules.
- **attributes**: tournamentId, startDate, endDate, format, status, timeControl, tdId
- **relations**: hasPlayer→Player, hasGame→ChessGame, hasCaptain→TeamCaptain

## Player
- **genus**: `bfo:0000002`
- **definition**: A human participant in a chess tournament or team.
- **attributes**: playerId, fullName, email, country, rating, status
- **relations**: participatesIn→Tournament, playsInGame→ChessGame, belongsTeam→Team

## Team
- **genus**: `bfo:0000040`
- **definition**: A group of players competing together in a team tournament.
- **attributes**: teamId, teamName, country, captainId
- **relations**: hasPlayer→Player, hasCaptain→TeamCaptain, competesIn→Tournament

## Team Captain
- **genus**: `bfo:0000002`
- **definition**: A designated player responsible for coordinating team communications and moves.
- **attributes**: captainId, fullName, email, teamId
- **relations**: leadsTeam→Team, communicatesWith→TournamentDirector

## Tournament Director
- **genus**: `bfo:0000002`
- **definition**: An official responsible for enforcing rules, managing disputes, and recording results.
- **attributes**: tdId, fullName, email, jurisdiction
- **relations**: oversees→Tournament, managesGame→ChessGame, handlesDispute→Dispute

## Chess Game
- **genus**: `bfo:0000015`
- **definition**: A single contest between two players, tracked via move cards or electronic transmission.
- **attributes**: gameId, startDate, endDate, status, timeControl, notationType, transmissionMethod, moveCount
- **relations**: hasPlayer1→Player, hasPlayer2→Player, partOfTournament→Tournament, hasMoveCard→MoveCard, hasDispute→Dispute

## Move Card
- **genus**: `cco:ont00000995`
- **definition**: A physical or electronic record containing a player's move, time used, and postmark.
- **attributes**: cardId, gameId, playerId, moveNotation, timeUsed, totalTime, postmarkDate, transmissionDate, status
- **relations**: belongsGame→ChessGame, submittedBy→Player, recordedBy→TournamentDirector

## Dispute
- **genus**: `bfo:0000015`
- **definition**: A conflict or ambiguity in a game requiring resolution by the Tournament Director.
- **attributes**: disputeId, gameId, type, status, resolution
- **relations**: arisesIn→ChessGame, resolvedBy→TournamentDirector, involvesPlayer→Player
