# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Flight Service Station
- **genus**: `bfo:0000040`
- **definition**: A physical facility or organizational unit providing aeronautical information services, air traffic services, and communications to aircraft in flight.
- **attributes**: stationIdentifier, stationName, establishmentDate, operationalStatus, coverageArea, primaryCommunicationMode, parentOrganization, locationCity, locationProvince
- **relations**: covers→FlightInformationRegion, employs→AirTrafficController, uses→CommunicationSystem, locatedIn→GeographicLocation

## Flight Information Region
- **genus**: `bfo:0000040`
- **definition**: A defined volume of airspace within which flight information service and alerting service are provided.
- **attributes**: firIdentifier, firName, firType, areaSize, upperLimit, lowerLimit, controllingAuthority
- **relations**: coveredBy→FlightServiceStation, contains→AirspaceSector, overlaps→FlightInformationRegion

## Air Traffic Controller
- **genus**: `bfo:0000040`
- **definition**: A qualified professional responsible for providing air traffic services, including separation, sequencing, and information to aircraft.
- **attributes**: controllerId, firstName, lastName, shiftType, yearsOfExperience, certificationLevel, currentAssignment, contactMethod
- **relations**: worksAt→FlightServiceStation, monitors→CommunicationSystem, serves→FlightInformationRegion

## Communication System
- **genus**: `bfo:0000040`
- **definition**: A technical infrastructure enabling voice and data transmission between ground stations and aircraft, including HF, VHF, and digital networks.
- **attributes**: systemId, systemName, frequencyBand, coverageRange, signalQuality, dataFormat, encryptionStatus, lastMaintenanceDate
- **relations**: usedBy→FlightServiceStation, supports→AirTrafficController, transmitsTo→Aircraft

## Aircraft
- **genus**: `bfo:0000040`
- **definition**: A vehicle capable of flight, including commercial airliners, cargo planes, and private aircraft operating within controlled airspace.
- **attributes**: registrationNumber, aircraftType, operator, flightNumber, departureAirport, arrivalAirport, passengerCount, cargoWeight, currentAltitude, currentSpeed
- **relations**: monitoredBy→FlightServiceStation, communicatesWith→CommunicationSystem, operatesIn→FlightInformationRegion

## Geographic Location
- **genus**: `bfo:0000040`
- **definition**: A specific physical place on Earth's surface, defined by coordinates and administrative boundaries, used for station placement and coverage mapping.
- **attributes**: locationId, cityName, provinceState, country, latitude, longitude, elevation, timezone
- **relations**: hosts→FlightServiceStation, contains→AirspaceSector
