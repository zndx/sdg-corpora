## Air Traffic Management and Flight Service Operations

Modern air traffic management relies on a distributed network of ground-based infrastructure, communication systems, and human operators working in concert to ensure the safe and efficient flow of aircraft across designated airspace. At the heart of this system are flight service stations, which serve as the primary coordination points for flight information, weather briefings, and en-route support. Each station occupies a defined geographic position, operates within a specific flight information region, and maintains communication links with both aircraft and air traffic controllers. The operational integrity of this network depends on precise record-keeping across multiple interrelated domains—station management, airspace classification, personnel assignment, communications infrastructure, aircraft tracking, and geographic positioning. Understanding how these records relate to one another is essential for anyone involved in the planning, monitoring, or auditing of air traffic services.

Flight service stations form the foundational layer of ground-based air navigation support. Each station is uniquely identified by a station identifier and a descriptive name, with an establishment date marking when it began operations. The operational status of a station—whether active, inactive, or under construction—determines its availability for service delivery. Stations cover a defined area, measured in standardized units, and employ a primary communication mode such as high frequency, very high frequency, single-sideband, or Morse code transmission. The parent organization responsible for each station ranges from corporate entities like Dow Chemical to public institutions such as The Library of Congress, reflecting the diverse governance structures across different regions.

**Table `FlightServiceStation`**

| stationId | stationIdentifier | stationName | establishmentDate | operationalStatus | coverageArea | primaryCommunicationMode | parentOrganization | locationCity | locationProvince | locationId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 2024-07-11 | active | 20.45 | HF | Dow Chemical | seasonal-location-23 | primary-location-94 | 100 |
| 2 | YVR | Distributed Series | 2025-12-22 | inactive | 23.90 | VHF | LDAP First Name Field | regional-location-24 | adaptive-location-95 | 101 |
| 3 | YUL | Adaptive Assessment | 2022-05-06 | under_construction | 27.35 | SSB | Standard Chartered | legacy-location-25 | distributed-location-96 | 102 |
| 4 | YEG | Primary Survey A | 2023-10-17 | active | 30.80 | Morse_code | The Library of Congress | compact-location-26 | baseline-location-97 | 103 |

The station at YQX, designated Baseline Corridor D, has been operational since July 2024 and maintains an active status with a coverage area of 20.45 units, communicating primarily via HF. In contrast, the YVR station, known as Distributed Series, was established more recently in December 2025 but currently holds an inactive status, covering 23.90 units with VHF capability. The YUL station, Adaptive Assessment, has been in service since May 2022 but remains under construction, operating with SSB across a 27.35-unit coverage area. The YEG station, Primary Survey A, established in October 2023, is active and covers the largest area at 30.80 units, using Morse code as its primary communication mode. Each station is associated with a parent organization and mapped to specific geographic locations, linking administrative responsibility with physical placement.

Flight information regions define the three-dimensional volumes of airspace for which flight information services and alerting services are provided. Each region carries a unique identifier and a descriptive name, classified by type—domestic, oceanic, or mixed—indicating the nature of the airspace it encompasses. The area size of a region, its upper and lower altitude limits, and the controlling authority responsible for it are all recorded as part of the region's operational profile. Some regions have overlapping designations, indicated by an overlap reference to another region, which signals shared or contested airspace boundaries that require careful coordination between controlling authorities.

**Table `FlightInformationRegion`**

| regionId | firIdentifier | firName | firType | areaSize | upperLimit | lowerLimit | controllingAuthority | overlapsRegionId |
|---|---|---|---|---|---|---|---|---|
| 1 | FIR-2566 | Extended Standard | domestic | 1.52 | compact-upper-32 | adaptive-lower-11 | integrated-controll-88 | 1 |
| 2 | FIR-2571 | Pilot Framework A | oceanic | 0.65 | composite-upper-33 | distributed-lower-12 | seasonal-controll-89 | 2 |
| 3 | FIR-2576 | Baseline Protocol | mixed | 0.43012016 | primary-upper-34 | baseline-lower-13 | regional-controll-90 | 3 |
| 4 | FIR-2581 | Distributed Programme | domestic | 0.6000001 | adaptive-upper-35 | pilot-lower-14 | legacy-controll-91 | 4 |

The region FIR-2566, classified as Extended Standard and designated domestic, covers an area of 1.52 square units with an upper limit described as compact-upper-32 and a lower limit of adaptive-lower-11, under the control of integrated-controll-88. This region overlaps with itself, suggesting a self-referential boundary condition or a data entry artifact requiring review. FIR-2571, Pilot Framework A, is an oceanic region of 0.65 square units with composite-upper-33 as its upper boundary and distributed-lower-12 as its lower boundary, controlled by seasonal-controll-89. The mixed-type region FIR-2576, Baseline Protocol, spans 0.43 square units between primary-upper-34 and baseline-lower-13, managed by regional-controll-90. FIR-2581, Distributed Programme, is a domestic region of 0.60 square units bounded by adaptive-upper-35 and pilot-lower-14, overseen by legacy-controll-91.

Air traffic controllers are the human operators who provide separation services, advisory support, and traffic flow management within their assigned regions. Each controller record captures their full name, the shift type they are assigned to—day, night, or midnight—their years of experience ranging from 7 to 16 years, and their certification level. The current assignment and contact method for each controller are also documented, with communication channels including HF, VHF, and interphone systems. Controllers are linked to specific flight service stations, establishing the operational pairing between personnel and ground infrastructure.

**Table `AirTrafficController`**

| controllerId | firstName | lastName | shiftType | yearsOfExperience | certificationLevel | currentAssignment | contactMethod | stationId |
|---|---|---|---|---|---|---|---|---|
| 7441148 | Stephanie Collins | Paul Allen | day | 7 | seasonal-certific-59 | legacy-current-43 | HF | 1 |
| 21248390 | Janice Johnston | Heather Beasley | night | 10 | regional-certific-60 | compact-current-44 | VHF | 2 |
| 727063 | Upal Saha | Audrey Taylor | midnight | 13 | legacy-certific-61 | composite-current-45 | interphone | 3 |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | day | 16 | compact-certific-62 | primary-current-46 | HF | 4 |

Stephanie Collins Paul Allen, assigned to a day shift with 7 years of experience and a seasonal certification, is contacted via HF and currently stationed at the YQX flight service station. Janice Johnston Heather Beasley works night shifts with 10 years of experience and a regional certification, reachable by VHF at the YVR station. Upal Saha Audrey Taylor operates on the midnight shift with 13 years of experience and a legacy certification, using interphone communication at the YUL station. Katherine Snyder Susan Wagner, the most experienced controller in the dataset with 16 years and a compact certification, works day shifts and is contacted via HF at the YEG station.

Communication systems provide the technical backbone enabling voice and data exchange between controllers, stations, and aircraft. Each system is identified by a system ID and name, operating within a specific frequency band—HF, VHF, or SSB—with a defined coverage range and signal quality rating. The data format used for digital communications varies, including Morse code, voice, AFTN (Aeronautical Fixed Telecommunication Network), and GIA formats. Encryption status indicates whether the system's transmissions are secured, and the last maintenance date provides a timestamp for the most recent service intervention.

**Table `CommunicationSystem`**

| id | systemId | systemName | frequencyBand | coverageRange | signalQuality | dataFormat | encryptionStatus | lastMaintenanceDate |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | HF | 6.20 | clear | Morse_code | false | 2024-03-27 |
| 2 | 3717623 | Regional Standard | VHF | 9.40 | weak | voice | true | 2025-08-11 |
| 3 | 7441161 | Seasonal Framework | SSB | 12.60 | noisy | AFTN | false | 2022-01-22 |
| 4 | 605963 | Integrated Protocol A | HF | 15.80 | clear | GIA | true | 2023-06-06 |

The Legacy Programme D system, identified by ID 8189503, operates on the HF band with a coverage range of 6.20 units, delivers clear signal quality, uses Morse code data format, is unencrypted, and was last maintained on March 27, 2024. Regional Standard (ID 3717623) uses VHF with a 9.40-unit range, exhibits weak signal quality, transmits in voice format, is encrypted, and received maintenance on August 11, 2025. Seasonal Framework (ID 7441161) operates on SSB with a 12.60-unit range, has noisy signal quality, uses AFTN data format, is unencrypted, and was last serviced on January 22, 2022. Integrated Protocol A (ID 605963) also uses HF with the widest coverage at 15.80 units, maintains clear signal quality, employs GIA data format, is encrypted, and was last maintained on June 6, 2023.

Aircraft records capture the operational details of individual aircraft in flight, including their registration number, type, operator, and flight number. Each record documents the departure and arrival airports, passenger count, cargo weight, current altitude, and current speed. Timestamps for creation and last update provide a temporal audit trail for each aircraft's record. The aircraft in the dataset span a range of operational profiles, from light cargo operations with minimal passenger loads to heavier configurations with significant cargo weights.

**Table `Aircraft`**

| id | registrationNumber | aircraftType | operator | flightNumber | departureAirport | arrivalAirport | passengerCount | cargoWeight | currentAltitude | currentSpeed | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | REG-2136 | primary-aircraft-34 | baseline-operator-31 | FLI-2053 | compact-departur-50 | legacy-arrival-49 | 13 | 218.0 | 12 | 30 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | REG-2142 | adaptive-aircraft-35 | pilot-operator-32 | FLI-2059 | composite-departur-51 | compact-arrival-50 | 10 | 0.05000001 | 19 | 33 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | REG-2148 | distributed-aircraft-36 | extended-operator-33 | FLI-2065 | primary-departur-52 | composite-arrival-51 | 7 | 3.24967074388476 | 26 | 36 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | REG-2154 | baseline-aircraft-37 | integrated-operator-34 | FLI-2071 | adaptive-departur-53 | primary-arrival-52 | 8 | 106.0 | 33 | 39 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Aircraft REG-2136, a primary-aircraft-34 operated by baseline-operator-31 on flight FLI-2053, departed from compact-departur-50 and is en route to legacy-arrival-49, carrying 13 passengers and 218.0 units of cargo at an altitude of 12 units and speed of 30 units. Aircraft REG-2142, an adaptive-aircraft-35 under pilot-operator-32 on flight FLI-2059, traveled from composite-departur-51 to compact-arrival-50 with 10 passengers and minimal cargo of 0.05 units, cruising at altitude 19 and speed 33. Aircraft REG-2148, a distributed-aircraft-36 operated by extended-operator-33 on flight FLI-2065, departed primary-departur-52 for composite-arrival-51, carrying 7 passengers and 3.25 units of cargo at altitude 26 and speed 36. Aircraft REG-2154, a baseline-aircraft-37 under integrated-operator-34 on flight FLI-2071, flew from adaptive-departur-53 to primary-arrival-52 with 8 passengers and 106.0 units of cargo at altitude 33 and speed 39.

Geographic locations anchor the entire air traffic management system to physical coordinates. Each location record includes a city name, province or state, country, latitude and longitude coordinates, elevation, and timezone designation. These geographic records are linked to flight service stations, providing the spatial reference framework necessary for navigation, route planning, and regulatory compliance.

**Table `GeographicLocation`**

| id | locationId | cityName | provinceState | country | latitude | longitude | elevation | timezone |
|---|---|---|---|---|---|---|---|---|
| 100 | 778556 | Regional Protocol | baseline-province-13 | compact-country-26 | 13.95 | 21.20 | 16.45 | regional-timezone-12 |
| 101 | 1250220 | Seasonal Programme D | pilot-province-14 | composite-country-27 | 17.90 | 25.40 | 18.90 | legacy-timezone-13 |
| 102 | 14511 | Integrated Standard | extended-province-15 | primary-country-28 | 21.85 | 29.60 | 21.35 | compact-timezone-14 |
| 103 | 611510 | Extended Framework | integrated-province-16 | adaptive-country-29 | 25.80 | 33.80 | 23.80 | composite-timezone-15 |

Location 778556, identified as Regional Protocol, sits in baseline-province-13 within compact-country-26 at coordinates 13.95 latitude and 21.20 longitude, with an elevation of 16.45 units in regional-timezone-12. Location 1250220, Seasonal Programme D, is located in pilot-province-14, composite-country-27, at 17.90 latitude and 25.40 longitude, elevation 18.90 units, in legacy-timezone-13. Location 14511, Integrated Standard, resides in extended-province-15, primary-country-28, at 21.85 latitude and 29.60 longitude, elevation 21.35 units, in compact-timezone-14. Location 611510, Extended Framework, is positioned in integrated-province-16, adaptive-country-29, at 25.80 latitude and 33.80 longitude, elevation 23.80 units, in composite-timezone-15.

The relationships between these entities are captured through a series of association tables that model the many-to-many and one-to-many connections inherent in air traffic operations. Flight service stations are linked to flight information regions, establishing which stations provide services within which airspace volumes. The same stations are also associated with air traffic controllers, defining the personnel responsible for operations at each location. Communication systems are tied to flight service stations, ensuring that each station has the technical infrastructure required for its operations.

**Table `FlightServiceStationFlightInformationRegion`**

| stationId | regionId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `FlightServiceStationAirTrafficController`**

| stationId | controllerId |
|---|---|
| 1 | 7441148 |
| 1 | 21248390 |
| 2 | 21248390 |
| 2 | 727063 |
| 3 | 727063 |
| 3 | lu_tax_code_template_m13 |
| 4 | lu_tax_code_template_m13 |
| 4 | 7441148 |

**Table `FlightServiceStationCommunicationSystem`**

| stationId | systemId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `FlightInformationRegionFlightServiceStation`**

| regionId | stationId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `AirTrafficControllerCommunicationSystem`**

| controllerId | systemId |
|---|---|
| 7441148 | 1 |
| 7441148 | 2 |
| 21248390 | 2 |
| 21248390 | 3 |
| 727063 | 3 |
| 727063 | 4 |
| lu_tax_code_template_m13 | 4 |
| lu_tax_code_template_m13 | 1 |

**Table `AirTrafficControllerFlightInformationRegion`**

| controllerId | regionId |
|---|---|
| 7441148 | 1 |
| 7441148 | 2 |
| 21248390 | 2 |
| 21248390 | 3 |
| 727063 | 3 |
| 727063 | 4 |
| lu_tax_code_template_m13 | 4 |
| lu_tax_code_template_m13 | 1 |

**Table `CommunicationSystemFlightServiceStation`**

| systemId | stationId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `CommunicationSystemAirTrafficController`**

| systemId | controllerId |
|---|---|
| 1 | 7441148 |
| 1 | 21248390 |
| 2 | 21248390 |
| 2 | 727063 |
| 3 | 727063 |
| 3 | lu_tax_code_template_m13 |
| 4 | lu_tax_code_template_m13 |
| 4 | 7441148 |

**Table `CommunicationSystemAircraft`**

| systemId | aircraftId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `AircraftFlightServiceStation`**

| aircraftId | stationId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `AircraftCommunicationSystem`**

| aircraftId | systemId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `AircraftFlightInformationRegion`**

| aircraftId | regionId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `GeographicLocationFlightServiceStation`**

| locationId | stationId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

These association tables collectively define the operational topology of the air traffic management network. A flight service station may serve multiple flight information regions, and a single region may be served by multiple stations. Controllers are assigned to stations but may also be associated with communication systems and regions independently, reflecting the flexibility required in shift-based operations. Communication systems connect to stations, controllers, and aircraft, forming a mesh of technical dependencies. Aircraft are linked to stations, communication systems, and regions, enabling real-time tracking and service provision. Geographic locations are tied to stations, providing the spatial grounding for all operational records.

The detail views synthesize these relationships into actionable information for operational managers and auditors. The flight service station to flight information region detail view answers the question of which stations operate within which airspace regions, combining station identifiers, names, and operational status with region identifiers, types, and controlling authorities. This view reveals, for example, that station YQX (Baseline Corridor D, active) operates within region FIR-2566 (Extended Standard, domestic), providing a clear picture of service coverage.

**View `v_flight_service_station_flight_information_region_detail`**

```sql
CREATE VIEW v_flight_service_station_flight_information_region_detail AS
SELECT a.stationId, a.stationIdentifier, a.stationName, b.regionId AS region_regionId, b.firIdentifier AS region_firIdentifier, b.firName AS region_firName
FROM FlightServiceStation a
  JOIN FlightServiceStationFlightInformationRegion j ON j.stationId = a.stationId
  JOIN FlightInformationRegion b ON b.regionId = j.regionId;
```

| stationId | stationIdentifier | stationName | region_regionId | region_firIdentifier | region_firName |
|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 1 | FIR-2566 | Extended Standard |
| 1 | YQX | Baseline Corridor D | 2 | FIR-2571 | Pilot Framework A |
| 2 | YVR | Distributed Series | 2 | FIR-2571 | Pilot Framework A |
| 2 | YVR | Distributed Series | 3 | FIR-2576 | Baseline Protocol |
| 3 | YUL | Adaptive Assessment | 3 | FIR-2576 | Baseline Protocol |
| 3 | YUL | Adaptive Assessment | 4 | FIR-2581 | Distributed Programme |
| 4 | YEG | Primary Survey A | 4 | FIR-2581 | Distributed Programme |
| 4 | YEG | Primary Survey A | 1 | FIR-2566 | Extended Standard |

The flight service station to air traffic controller detail view maps personnel to their assigned stations, showing controller names, shift types, experience levels, and the stations they serve. This view might show that Stephanie Collins Paul Allen, a day-shift controller with 7 years of experience, is assigned to station YQX, enabling managers to verify staffing levels and shift coverage across the network.

**View `v_flight_service_station_air_traffic_controller_detail`**

```sql
CREATE VIEW v_flight_service_station_air_traffic_controller_detail AS
SELECT a.stationId, a.stationIdentifier, a.stationName, b.controllerId AS controller_controllerId, b.firstName AS controller_firstName, b.lastName AS controller_lastName
FROM FlightServiceStation a
  JOIN FlightServiceStationAirTrafficController j ON j.stationId = a.stationId
  JOIN AirTrafficController b ON b.controllerId = j.controllerId;
```

| stationId | stationIdentifier | stationName | controller_controllerId | controller_firstName | controller_lastName |
|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 7441148 | Stephanie Collins | Paul Allen |
| 1 | YQX | Baseline Corridor D | 21248390 | Janice Johnston | Heather Beasley |
| 2 | YVR | Distributed Series | 21248390 | Janice Johnston | Heather Beasley |
| 2 | YVR | Distributed Series | 727063 | Upal Saha | Audrey Taylor |
| 3 | YUL | Adaptive Assessment | 727063 | Upal Saha | Audrey Taylor |
| 3 | YUL | Adaptive Assessment | lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner |
| 4 | YEG | Primary Survey A | lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner |
| 4 | YEG | Primary Survey A | 7441148 | Stephanie Collins | Paul Allen |

The flight service station to communication system detail view reveals the technical infrastructure supporting each station, pairing station identifiers with communication system names, frequency bands, and signal quality ratings. A row in this view might indicate that station YQX relies on the Legacy Programme D system operating on HF with clear signal quality, informing maintenance scheduling and redundancy planning.

**View `v_flight_service_station_communication_system_detail`**

```sql
CREATE VIEW v_flight_service_station_communication_system_detail AS
SELECT a.stationId, a.stationIdentifier, a.stationName, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM FlightServiceStation a
  JOIN FlightServiceStationCommunicationSystem j ON j.stationId = a.stationId
  JOIN CommunicationSystem b ON b.id = j.systemId;
```

| stationId | stationIdentifier | stationName | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 1 | 8189503 | Legacy Programme D |
| 1 | YQX | Baseline Corridor D | 2 | 3717623 | Regional Standard |
| 2 | YVR | Distributed Series | 2 | 3717623 | Regional Standard |
| 2 | YVR | Distributed Series | 3 | 7441161 | Seasonal Framework |
| 3 | YUL | Adaptive Assessment | 3 | 7441161 | Seasonal Framework |
| 3 | YUL | Adaptive Assessment | 4 | 605963 | Integrated Protocol A |
| 4 | YEG | Primary Survey A | 4 | 605963 | Integrated Protocol A |
| 4 | YEG | Primary Survey A | 1 | 8189503 | Legacy Programme D |

The flight service station geographic location view provides the spatial context for each station, combining station identifiers with city names, coordinates, and timezone information. This view might show that station YQX is located at Regional Protocol in baseline-province-13 at coordinates 13.95 and 21.20, enabling geographic analysis of station distribution and coverage gaps.

**View `v_flight_service_station_geographic_location`**

```sql
CREATE VIEW v_flight_service_station_geographic_location AS
SELECT a.stationId, a.stationIdentifier, a.stationName, a.establishmentDate, b.id AS location_id, b.locationId AS location_locationId, b.cityName AS location_cityName
FROM FlightServiceStation a JOIN GeographicLocation b ON a.locationId = b.id;
```

| stationId | stationIdentifier | stationName | establishmentDate | location_id | location_locationId | location_cityName |
|---|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 2024-07-11 | 100 | 778556 | Regional Protocol |
| 2 | YVR | Distributed Series | 2025-12-22 | 101 | 1250220 | Seasonal Programme D |
| 3 | YUL | Adaptive Assessment | 2022-05-06 | 102 | 14511 | Integrated Standard |
| 4 | YEG | Primary Survey A | 2023-10-17 | 103 | 611510 | Extended Framework |

The flight information region to flight service station detail view inverts the perspective, showing which stations serve each region. This is particularly useful for identifying regions with multiple supporting stations versus those relying on a single point of service. The flight information region self-reference view captures the overlap relationships between regions, highlighting areas where airspace boundaries intersect and coordination is critical.

**View `v_flight_information_region_flight_service_station_detail`**

```sql
CREATE VIEW v_flight_information_region_flight_service_station_detail AS
SELECT a.regionId, a.firIdentifier, a.firName, b.stationId AS station_stationId, b.stationIdentifier AS station_stationIdentifier, b.stationName AS station_stationName
FROM FlightInformationRegion a
  JOIN FlightInformationRegionFlightServiceStation j ON j.regionId = a.regionId
  JOIN FlightServiceStation b ON b.stationId = j.stationId;
```

| regionId | firIdentifier | firName | station_stationId | station_stationIdentifier | station_stationName |
|---|---|---|---|---|---|
| 1 | FIR-2566 | Extended Standard | 1 | YQX | Baseline Corridor D |
| 1 | FIR-2566 | Extended Standard | 2 | YVR | Distributed Series |
| 2 | FIR-2571 | Pilot Framework A | 2 | YVR | Distributed Series |
| 2 | FIR-2571 | Pilot Framework A | 3 | YUL | Adaptive Assessment |
| 3 | FIR-2576 | Baseline Protocol | 3 | YUL | Adaptive Assessment |
| 3 | FIR-2576 | Baseline Protocol | 4 | YEG | Primary Survey A |
| 4 | FIR-2581 | Distributed Programme | 4 | YEG | Primary Survey A |
| 4 | FIR-2581 | Distributed Programme | 1 | YQX | Baseline Corridor D |

**View `v_flight_information_region_flight_information_region`**

```sql
CREATE VIEW v_flight_information_region_flight_information_region AS
SELECT a.regionId, a.firIdentifier, a.firName, a.firType, b.regionId AS region_regionId, b.firIdentifier AS region_firIdentifier, b.firName AS region_firName
FROM FlightInformationRegion a JOIN FlightInformationRegion b ON a.overlapsRegionId = b.regionId;
```

| regionId | firIdentifier | firName | firType | region_regionId | region_firIdentifier | region_firName |
|---|---|---|---|---|---|---|
| 1 | FIR-2566 | Extended Standard | domestic | 1 | FIR-2566 | Extended Standard |
| 2 | FIR-2571 | Pilot Framework A | oceanic | 2 | FIR-2571 | Pilot Framework A |
| 3 | FIR-2576 | Baseline Protocol | mixed | 3 | FIR-2576 | Baseline Protocol |
| 4 | FIR-2581 | Distributed Programme | domestic | 4 | FIR-2581 | Distributed Programme |

The air traffic controller to flight service station view provides a personnel-centric perspective, listing each controller alongside their assigned station, shift type, and years of experience. This view supports workforce planning and certification compliance audits. The air traffic controller to communication system detail view reveals which communication systems each controller can access, pairing controller names and shift types with system frequency bands and encryption status.

**View `v_air_traffic_controller_flight_service_station`**

```sql
CREATE VIEW v_air_traffic_controller_flight_service_station AS
SELECT a.controllerId, a.firstName, a.lastName, a.shiftType, b.stationId AS station_stationId, b.stationIdentifier AS station_stationIdentifier, b.stationName AS station_stationName
FROM AirTrafficController a JOIN FlightServiceStation b ON a.stationId = b.stationId;
```

| controllerId | firstName | lastName | shiftType | station_stationId | station_stationIdentifier | station_stationName |
|---|---|---|---|---|---|---|
| 7441148 | Stephanie Collins | Paul Allen | day | 1 | YQX | Baseline Corridor D |
| 21248390 | Janice Johnston | Heather Beasley | night | 2 | YVR | Distributed Series |
| 727063 | Upal Saha | Audrey Taylor | midnight | 3 | YUL | Adaptive Assessment |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | day | 4 | YEG | Primary Survey A |

**View `v_air_traffic_controller_communication_system_detail`**

```sql
CREATE VIEW v_air_traffic_controller_communication_system_detail AS
SELECT a.controllerId, a.firstName, a.lastName, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM AirTrafficController a
  JOIN AirTrafficControllerCommunicationSystem j ON j.controllerId = a.controllerId
  JOIN CommunicationSystem b ON b.id = j.systemId;
```

| controllerId | firstName | lastName | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|
| 7441148 | Stephanie Collins | Paul Allen | 1 | 8189503 | Legacy Programme D |
| 7441148 | Stephanie Collins | Paul Allen | 2 | 3717623 | Regional Standard |
| 21248390 | Janice Johnston | Heather Beasley | 2 | 3717623 | Regional Standard |
| 21248390 | Janice Johnston | Heather Beasley | 3 | 7441161 | Seasonal Framework |
| 727063 | Upal Saha | Audrey Taylor | 3 | 7441161 | Seasonal Framework |
| 727063 | Upal Saha | Audrey Taylor | 4 | 605963 | Integrated Protocol A |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | 4 | 605963 | Integrated Protocol A |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | 1 | 8189503 | Legacy Programme D |

The air traffic controller to flight information region detail view connects personnel to the airspace regions they control, showing controller names, shift types, and region identifiers with types and area sizes. This view is essential for verifying that controllers are assigned to regions appropriate to their certification level and experience.

**View `v_air_traffic_controller_flight_information_region_detail`**

```sql
CREATE VIEW v_air_traffic_controller_flight_information_region_detail AS
SELECT a.controllerId, a.firstName, a.lastName, b.regionId AS region_regionId, b.firIdentifier AS region_firIdentifier, b.firName AS region_firName
FROM AirTrafficController a
  JOIN AirTrafficControllerFlightInformationRegion j ON j.controllerId = a.controllerId
  JOIN FlightInformationRegion b ON b.regionId = j.regionId;
```

| controllerId | firstName | lastName | region_regionId | region_firIdentifier | region_firName |
|---|---|---|---|---|---|
| 7441148 | Stephanie Collins | Paul Allen | 1 | FIR-2566 | Extended Standard |
| 7441148 | Stephanie Collins | Paul Allen | 2 | FIR-2571 | Pilot Framework A |
| 21248390 | Janice Johnston | Heather Beasley | 2 | FIR-2571 | Pilot Framework A |
| 21248390 | Janice Johnston | Heather Beasley | 3 | FIR-2576 | Baseline Protocol |
| 727063 | Upal Saha | Audrey Taylor | 3 | FIR-2576 | Baseline Protocol |
| 727063 | Upal Saha | Audrey Taylor | 4 | FIR-2581 | Distributed Programme |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | 4 | FIR-2581 | Distributed Programme |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | 1 | FIR-2566 | Extended Standard |

The communication system to flight service station detail view documents the technical dependencies between infrastructure and stations, pairing system names and frequency bands with station identifiers and operational statuses. This view supports infrastructure audits and capacity planning. The communication system to air traffic controller detail view reveals the communication channels available to each controller, showing system frequency bands, signal quality, and encryption status alongside controller shift assignments.

**View `v_communication_system_flight_service_station_detail`**

```sql
CREATE VIEW v_communication_system_flight_service_station_detail AS
SELECT a.id, a.systemId, a.systemName, b.stationId AS station_stationId, b.stationIdentifier AS station_stationIdentifier, b.stationName AS station_stationName
FROM CommunicationSystem a
  JOIN CommunicationSystemFlightServiceStation j ON j.systemId = a.id
  JOIN FlightServiceStation b ON b.stationId = j.stationId;
```

| id | systemId | systemName | station_stationId | station_stationIdentifier | station_stationName |
|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 1 | YQX | Baseline Corridor D |
| 1 | 8189503 | Legacy Programme D | 2 | YVR | Distributed Series |
| 2 | 3717623 | Regional Standard | 2 | YVR | Distributed Series |
| 2 | 3717623 | Regional Standard | 3 | YUL | Adaptive Assessment |
| 3 | 7441161 | Seasonal Framework | 3 | YUL | Adaptive Assessment |
| 3 | 7441161 | Seasonal Framework | 4 | YEG | Primary Survey A |
| 4 | 605963 | Integrated Protocol A | 4 | YEG | Primary Survey A |
| 4 | 605963 | Integrated Protocol A | 1 | YQX | Baseline Corridor D |

**View `v_communication_system_air_traffic_controller_detail`**

```sql
CREATE VIEW v_communication_system_air_traffic_controller_detail AS
SELECT a.id, a.systemId, a.systemName, b.controllerId AS controller_controllerId, b.firstName AS controller_firstName, b.lastName AS controller_lastName
FROM CommunicationSystem a
  JOIN CommunicationSystemAirTrafficController j ON j.systemId = a.id
  JOIN AirTrafficController b ON b.controllerId = j.controllerId;
```

| id | systemId | systemName | controller_controllerId | controller_firstName | controller_lastName |
|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 7441148 | Stephanie Collins | Paul Allen |
| 1 | 8189503 | Legacy Programme D | 21248390 | Janice Johnston | Heather Beasley |
| 2 | 3717623 | Regional Standard | 21248390 | Janice Johnston | Heather Beasley |
| 2 | 3717623 | Regional Standard | 727063 | Upal Saha | Audrey Taylor |
| 3 | 7441161 | Seasonal Framework | 727063 | Upal Saha | Audrey Taylor |
| 3 | 7441161 | Seasonal Framework | lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner |
| 4 | 605963 | Integrated Protocol A | lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner |
| 4 | 605963 | Integrated Protocol A | 7441148 | Stephanie Collins | Paul Allen |

The communication system to aircraft detail view connects aircraft to the communication systems they use, pairing registration numbers and flight numbers with system frequency bands and data formats. This view is critical for ensuring that aircraft are equipped with compatible communication technology for their assigned routes.

**View `v_communication_system_aircraft_detail`**

```sql
CREATE VIEW v_communication_system_aircraft_detail AS
SELECT a.id, a.systemId, a.systemName, b.id AS aircraft_id, b.registrationNumber AS aircraft_registrationNumber, b.aircraftType AS aircraft_aircraftType
FROM CommunicationSystem a
  JOIN CommunicationSystemAircraft j ON j.systemId = a.id
  JOIN Aircraft b ON b.id = j.aircraftId;
```

| id | systemId | systemName | aircraft_id | aircraft_registrationNumber | aircraft_aircraftType |
|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | 1 | REG-2136 | primary-aircraft-34 |
| 1 | 8189503 | Legacy Programme D | 2 | REG-2142 | adaptive-aircraft-35 |
| 2 | 3717623 | Regional Standard | 2 | REG-2142 | adaptive-aircraft-35 |
| 2 | 3717623 | Regional Standard | 3 | REG-2148 | distributed-aircraft-36 |
| 3 | 7441161 | Seasonal Framework | 3 | REG-2148 | distributed-aircraft-36 |
| 3 | 7441161 | Seasonal Framework | 4 | REG-2154 | baseline-aircraft-37 |
| 4 | 605963 | Integrated Protocol A | 4 | REG-2154 | baseline-aircraft-37 |
| 4 | 605963 | Integrated Protocol A | 1 | REG-2136 | primary-aircraft-34 |

The aircraft to flight service station detail view links aircraft to the stations providing them services, showing registration numbers, flight numbers, and departure airports alongside station identifiers and operational statuses. This view supports flight tracking and service accountability. The aircraft to communication system detail view reveals the communication capabilities available to each aircraft, pairing registration numbers with system frequency bands and encryption status.

**View `v_aircraft_flight_service_station_detail`**

```sql
CREATE VIEW v_aircraft_flight_service_station_detail AS
SELECT a.id, a.registrationNumber, a.aircraftType, b.stationId AS station_stationId, b.stationIdentifier AS station_stationIdentifier, b.stationName AS station_stationName
FROM Aircraft a
  JOIN AircraftFlightServiceStation j ON j.aircraftId = a.id
  JOIN FlightServiceStation b ON b.stationId = j.stationId;
```

| id | registrationNumber | aircraftType | station_stationId | station_stationIdentifier | station_stationName |
|---|---|---|---|---|---|
| 1 | REG-2136 | primary-aircraft-34 | 1 | YQX | Baseline Corridor D |
| 1 | REG-2136 | primary-aircraft-34 | 2 | YVR | Distributed Series |
| 2 | REG-2142 | adaptive-aircraft-35 | 2 | YVR | Distributed Series |
| 2 | REG-2142 | adaptive-aircraft-35 | 3 | YUL | Adaptive Assessment |
| 3 | REG-2148 | distributed-aircraft-36 | 3 | YUL | Adaptive Assessment |
| 3 | REG-2148 | distributed-aircraft-36 | 4 | YEG | Primary Survey A |
| 4 | REG-2154 | baseline-aircraft-37 | 4 | YEG | Primary Survey A |
| 4 | REG-2154 | baseline-aircraft-37 | 1 | YQX | Baseline Corridor D |

**View `v_aircraft_communication_system_detail`**

```sql
CREATE VIEW v_aircraft_communication_system_detail AS
SELECT a.id, a.registrationNumber, a.aircraftType, b.id AS system_id, b.systemId AS system_systemId, b.systemName AS system_systemName
FROM Aircraft a
  JOIN AircraftCommunicationSystem j ON j.aircraftId = a.id
  JOIN CommunicationSystem b ON b.id = j.systemId;
```

| id | registrationNumber | aircraftType | system_id | system_systemId | system_systemName |
|---|---|---|---|---|---|
| 1 | REG-2136 | primary-aircraft-34 | 1 | 8189503 | Legacy Programme D |
| 1 | REG-2136 | primary-aircraft-34 | 2 | 3717623 | Regional Standard |
| 2 | REG-2142 | adaptive-aircraft-35 | 2 | 3717623 | Regional Standard |
| 2 | REG-2142 | adaptive-aircraft-35 | 3 | 7441161 | Seasonal Framework |
| 3 | REG-2148 | distributed-aircraft-36 | 3 | 7441161 | Seasonal Framework |
| 3 | REG-2148 | distributed-aircraft-36 | 4 | 605963 | Integrated Protocol A |
| 4 | REG-2154 | baseline-aircraft-37 | 4 | 605963 | Integrated Protocol A |
| 4 | REG-2154 | baseline-aircraft-37 | 1 | 8189503 | Legacy Programme D |

The aircraft to flight information region detail view connects aircraft to the airspace regions they traverse, showing registration numbers, flight numbers, and current altitudes alongside region identifiers, types, and altitude limits. This view is essential for verifying that aircraft are operating within appropriate airspace classifications and altitude constraints.

**View `v_aircraft_flight_information_region_detail`**

```sql
CREATE VIEW v_aircraft_flight_information_region_detail AS
SELECT a.id, a.registrationNumber, a.aircraftType, b.regionId AS region_regionId, b.firIdentifier AS region_firIdentifier, b.firName AS region_firName
FROM Aircraft a
  JOIN AircraftFlightInformationRegion j ON j.aircraftId = a.id
  JOIN FlightInformationRegion b ON b.regionId = j.regionId;
```

| id | registrationNumber | aircraftType | region_regionId | region_firIdentifier | region_firName |
|---|---|---|---|---|---|
| 1 | REG-2136 | primary-aircraft-34 | 1 | FIR-2566 | Extended Standard |
| 1 | REG-2136 | primary-aircraft-34 | 2 | FIR-2571 | Pilot Framework A |
| 2 | REG-2142 | adaptive-aircraft-35 | 2 | FIR-2571 | Pilot Framework A |
| 2 | REG-2142 | adaptive-aircraft-35 | 3 | FIR-2576 | Baseline Protocol |
| 3 | REG-2148 | distributed-aircraft-36 | 3 | FIR-2576 | Baseline Protocol |
| 3 | REG-2148 | distributed-aircraft-36 | 4 | FIR-2581 | Distributed Programme |
| 4 | REG-2154 | baseline-aircraft-37 | 4 | FIR-2581 | Distributed Programme |
| 4 | REG-2154 | baseline-aircraft-37 | 1 | FIR-2566 | Extended Standard |

The geographic location to flight service station detail view provides a location-centric perspective, showing each geographic location alongside the stations it supports, including station identifiers, names, and operational statuses. This view supports geographic analysis of service coverage and identification of underserved areas.

**View `v_geographic_location_flight_service_station_detail`**

```sql
CREATE VIEW v_geographic_location_flight_service_station_detail AS
SELECT a.id, a.locationId, a.cityName, b.stationId AS station_stationId, b.stationIdentifier AS station_stationIdentifier, b.stationName AS station_stationName
FROM GeographicLocation a
  JOIN GeographicLocationFlightServiceStation j ON j.locationId = a.id
  JOIN FlightServiceStation b ON b.stationId = j.stationId;
```

| id | locationId | cityName | station_stationId | station_stationIdentifier | station_stationName |
|---|---|---|---|---|---|
| 100 | 778556 | Regional Protocol | 1 | YQX | Baseline Corridor D |
| 100 | 778556 | Regional Protocol | 2 | YVR | Distributed Series |
| 101 | 1250220 | Seasonal Programme D | 2 | YVR | Distributed Series |
| 101 | 1250220 | Seasonal Programme D | 3 | YUL | Adaptive Assessment |
| 102 | 14511 | Integrated Standard | 3 | YUL | Adaptive Assessment |
| 102 | 14511 | Integrated Standard | 4 | YEG | Primary Survey A |
| 103 | 611510 | Extended Framework | 4 | YEG | Primary Survey A |
| 103 | 611510 | Extended Framework | 1 | YQX | Baseline Corridor D |

Together, these tables and views form a comprehensive record of the air traffic management ecosystem. The base tables capture the fundamental entities—stations, regions, controllers, communication systems, aircraft, and locations—while the association tables define the operational relationships between them. The detail views synthesize these relationships into queryable formats that support operational oversight, compliance auditing, and strategic planning. Every record, from the establishment date of a flight service station to the encryption status of a communication system, contributes to a complete picture of how air traffic services are organized, delivered, and monitored across the network.