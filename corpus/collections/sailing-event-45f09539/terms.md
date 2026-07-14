# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Sailing Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled recreational sailing activity conducted by Mission Creek Sail Tours on San Francisco Bay.
- **attributes**: eventId, eventDate, eventType, status, maxCapacity, actualParticipants
- **relations**: hasCaptain→Captain, hasCrew→CrewMember, usesVessel→Sailboat, occursAt→Dock

## Captain
- **genus**: `bfo:0000023`
- **definition**: A USCG licensed professional who operates the sailboat and manages safety during a sailing event.
- **attributes**: captainId, licenseNumber, yearsExperience, currentStatus
- **relations**: commands→Sailboat, manages→SailingEvent

## Crew Member
- **genus**: `bfo:0000023`
- **definition**: A participant in a sailing event who assists with sailing tasks or observes under the captain's direction.
- **attributes**: crewId, pfdRequired, pfdWorn, role
- **relations**: participatesIn→SailingEvent, assignedTo→Sailboat

## Sailboat
- **genus**: `cco:ont00000995`
- **definition**: A vessel designed for sailing, featuring sails, a keel, and rigging, used for recreational tours on San Francisco Bay.
- **attributes**: vesselId, vesselName, designHeelAngle, keelMaterial, currentHeelAngle, status
- **relations**: mooredAt→Dock, equippedWith→PFD, participatesIn→SailingEvent

## Dock
- **genus**: `bfo:0000023`
- **definition**: A fixed structure at the edge of San Francisco Bay where sailboats are prepared, rigged, and launched.
- **attributes**: dockId, dockName, location, capacity
- **relations**: hosts→SailingEvent, moors→Sailboat

## Personal Flotation Device
- **genus**: `cco:ont00000995`
- **definition**: A safety garment required for participants during races and optionally during introductory sails to prevent drowning.
- **attributes**: pfdId, size, certificationStandard
- **relations**: wornBy→CrewMember, storedOn→Sailboat
