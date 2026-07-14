# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Director
- **genus**: `bfo:0000040`
- **definition**: A person who serves on the board of directors of a corporate entity, holding specific roles and functions within the organization's governance structure.
- **attributes**: directorId, fullName, roleType, appointmentDate, status
- **relations**: servesOn→Board, holdsRoleIn→BoardCommittee

## Board of Directors
- **genus**: `bfo:0000040`
- **definition**: The collective governing body of a corporate entity, composed of directors who exercise oversight and strategic decision-making authority.
- **attributes**: boardId, establishmentDate, jurisdiction, status
- **relations**: composedOf→Director

## Board Committee
- **genus**: `bfo:0000040`
- **definition**: A sub-group of the board of directors established to handle specific governance functions such as audit, remuneration, or nomination matters.
- **attributes**: committeeId, committeeName, establishmentDate, status
- **relations**: hasChairperson→Director, hasMember→Director

## Corporate Entity
- **genus**: `bfo:0000040`
- **definition**: A legally recognized organization incorporated under specific jurisdictional laws, possessing limited liability and governed by a board of directors.
- **attributes**: entityId, legalName, incorporationDate, jurisdiction, stockCode, entityType
- **relations**: governedBy→Board
