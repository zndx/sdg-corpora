# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Annual Memorial Parade Event
- **genus**: `bfo:0000040`
- **definition**: A scheduled public procession and commemorative event honoring military service members and those who made the ultimate sacrifice.
- **attributes**: eventDate, startTime, locationCity, locationState, locationZip, organizingMunicipality, isDieselPoweredAllowed, candyThrowingProhibited
- **relations**: hasParticipant→ParticipatingOrganization, hasEntry→ParadeEntry

## Community Organization Participating in Parade
- **genus**: `bfo:0000040`
- **definition**: A civic, military, or community group formally registered to participate in the parade with a designated entry.
- **attributes**: organizationName, contactPersonName, contactPhone, contactEmail, streetAddress, city, state, zipCode, authorizationSignature, submissionStatus
- **relations**: submitsEntry→ParadeEntry, designatesDriver→VehicleOperator

## Parade Entry Unit
- **genus**: `bfo:0000040`
- **definition**: A specific unit, float, vehicle, or group registered to march or drive in the parade procession.
- **attributes**: entryType, numberOfParticipants, isDieselPowered, giveAwayMethod, entryStatus
- **relations**: belongsToMany→ParticipatingOrganization, usesVehicle→ParadeVehicle, hasOperator→VehicleOperator

## Parade Entry Vehicle
- **genus**: `bfo:0000040`
- **definition**: A motorized or non-motorized vehicle used to transport participants or display floats in the parade.
- **attributes**: vehicleType, isDieselPowered, vehicleIdentifier, vehicleStatus
- **relations**: carriesEntry→ParadeEntry

## Designated Driver for Parade Entry
- **genus**: `bfo:0000040`
- **definition**: The individual designated to operate the vehicle for a specific parade entry, verified by license and signature.
- **attributes**: fullName, driversLicenseNumber, operatorSignature, operatorStatus
- **relations**: operatesEntry→ParadeEntry, isMemberOf→ParticipatingOrganization
