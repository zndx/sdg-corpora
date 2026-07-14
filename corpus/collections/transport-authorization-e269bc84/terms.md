# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Transport Authorization
- **genus**: `cco:ont00000958`
- **definition**: A legal record of consent and indemnification by a guardian authorizing a taxi service to transport a minor.
- **attributes**: authorizationId, requestDate, faxNumber, emailAddress, serviceDate, paymentStatus, supervisionStatus
- **relations**: authorizesTransportFor→MinorPassenger, authoredBy→Guardian, referencesEmergencyContact→EmergencyContact, specifiesPickupLocation→Location, specifiesDropoffLocation→Location

## Minor Passenger
- **genus**: `bfo:0000040`
- **definition**: A human under the age of 18 who is the subject of the transport authorization.
- **attributes**: passengerName, age, minimumAge, isUnaccompanied
- **relations**: isAuthorizedBy→TransportAuthorization, isGuardedBy→Guardian

## Guardian
- **genus**: `bfo:0000040`
- **definition**: A parent or legal guardian who provides consent and contact information for the minor.
- **attributes**: guardianName, contactPhone, homePhone, signatureDate
- **relations**: authoredAuthorization→TransportAuthorization, hasGuardianshipOver→MinorPassenger

## Emergency Contact
- **genus**: `bfo:0000040`
- **definition**: An individual other than the parent/guardian designated to be contacted in case of an emergency.
- **attributes**: contactName, contactPhone
- **relations**: isReferencedBy→TransportAuthorization

## Location
- **genus**: `bfo:0000004`
- **definition**: A physical address or geographic point used for taxi pick-up or drop-off.
- **attributes**: addressLine, locationType, supervisionRequired
- **relations**: isPickupFor→TransportAuthorization, isDropoffFor→TransportAuthorization

## Transport Service
- **genus**: `bfo:0000015`
- **definition**: The actual taxi ride or trip event involving the minor, pickup, and drop-off.
- **attributes**: serviceId, pickupTime, dropoffTime, serviceStatus
- **relations**: isAuthorizedBy→TransportAuthorization, transports→MinorPassenger, originatesAt→Location, terminatesAt→Location
