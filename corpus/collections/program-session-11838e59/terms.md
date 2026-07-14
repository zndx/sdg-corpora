# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Program Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled time block during which a specific ACT program (e.g., PlayStation) is offered to participants.
- **attributes**: sessionIdentifier, programName, dayOfWeek, startTime, endTime, seasonEndDate, isClosed
- **relations**: hasLocation→Facility, hasProgramType→ProgramType, hasPricingTier→PricingTier

## Facility
- **genus**: `bfo:00000995`
- **definition**: A physical location where ACT programs are hosted, including specific rooms and amenities.
- **attributes**: facilityIdentifier, facilityName, streetAddress, city, state, postalCode, phoneNumber, website
- **relations**: hasRoom→Room, hasOperatingHours→OperatingHours

## Room
- **genus**: `bfo:00000995`
- **definition**: A specific functional space within a facility, such as a gym, kitchen, or bathroom.
- **attributes**: roomIdentifier, roomName, roomType, hasChangingTables, allowsFood, requiresShoeRemoval
- **relations**: isPartOf→Facility, hasEquipment→Equipment

## Pricing Tier
- **genus**: `bfo:00000995`
- **definition**: A defined cost structure for participating in a program, including single-session and multi-session options.
- **attributes**: tierIdentifier, tierName, costPerChild, ticketCount, totalCost, paymentMethod
- **relations**: appliesTo→ProgramSession

## Participant
- **genus**: `bfo:00000995`
- **definition**: An individual (child or supervisor) registered for or attending a program session.
- **attributes**: participantIdentifier, firstName, lastName, ageGroup, hasPhotoID, isSupervisor, registrationDate
- **relations**: attends→ProgramSession, isSupervisedBy→Participant

## Equipment
- **genus**: `bfo:00000995`
- **definition**: Physical items used within a room, such as mats or changing tables.
- **attributes**: equipmentIdentifier, equipmentName, equipmentType, isSkidFree, isChangingTable
- **relations**: isLocatedIn→Room
