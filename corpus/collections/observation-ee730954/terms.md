# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A recorded astronomical observation event
- **genus**: `bfo:0000015`
- **definition**: A discrete act of observing a celestial body or phenomenon, recorded with specific parameters and context.
- **attributes**: observationIdentifier, observationDateTime, targetBodyName, targetBodyType, angularSeparation, instrumentUsed, observerName, weatherCondition
- **relations**: targeted→CelestialBody, performedBy→Observer, usedInstrument→Telescope

## A natural astronomical object
- **genus**: `bfo:0000040`
- **definition**: A physical object existing in space, such as a planet, star, comet, or moon, that can be observed.
- **attributes**: bodyIdentifier, bodyName, bodyType, rightAscension, declination, magnitude, discoveryDate, discovererName
- **relations**: observedIn→Observation

## An optical instrument for observing distant objects
- **genus**: `cco:ont00000995`
- **definition**: A manufactured optical device used to magnify and observe celestial bodies, characterized by its aperture, mounting, and accessories.
- **attributes**: telescopeIdentifier, manufacturer, apertureInches, mountingType, yearManufactured, currentLocation, status, accessories
- **relations**: usedInObservation→Observation, ownedBy→Observer

## A person who conducts astronomical observations
- **genus**: `bfo:0000002`
- **definition**: An individual who performs or records astronomical observations, often associated with specific instruments and locations.
- **attributes**: observerIdentifier, fullName, birthDate, deathDate, location, affiliation, role
- **relations**: performedObservation→Observation, ownedInstrument→Telescope

## A specific astronomical or historical occurrence
- **genus**: `bfo:0000015`
- **definition**: A discrete, time-bound occurrence of significance in astronomy or history, such as a conjunction, transit, or personal milestone.
- **attributes**: eventIdentifier, eventName, eventDateTime, eventType, location, participants, description
- **relations**: involvedCelestialBody→CelestialBody, observedBy→Observer
