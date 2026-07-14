The air navigation ecosystem is a distributed network of service stations, controlled airspace regions, human controllers, communication infrastructures, aircraft in transit, and the geographic coordinates that anchor them all. Each component carries its own identity and attributes, and the relationships between them—station-to-region assignments, controller-to-station deployments, aircraft-to-system associations—form a richly normalized schema. The relational model captures this ecosystem by decomposing it into six base entity tables, nine junction tables that materialize many-to-many associations, and sixteen derived views that reassemble domain facts for operational queries.

## Base Entities and Their Attributes

The foundation of the schema consists of six entity tables, each representing a distinct concept in the air navigation domain. The `FlightServiceStation` table records the physical and administrative properties of air navigation service stations. Each station is identified by a surrogate `stationId` and a human-readable `stationIdentifier` such as `YQX`, `YVR`, `YUL`, or `YEG`. The `stationName` column carries descriptive labels like "Baseline Corridor D" and "Primary Survey A", while `establishmentDate` records the date the station was commissioned, ranging from `2022-05-06` for YUL to `2025-12-22` for YVR. The `operationalStatus` column constrains stations to values such as `active`, `inactive`, or `under_construction`, and `coverageArea` stores a numeric measure of the station's service radius in nautical miles—values like `20.45`, `23.90`, `27.35`, and `30.80` appear across the four sample rows. Communication capabilities are captured in `primaryCommunicationMode`, which takes values like `HF`, `VHF`, `SSB`, and `Morse_code`. Administrative metadata includes `parentOrganization` (e.g., "Dow Chemical", "The Library of Congress"), `locationCity`, `locationProvince`, and a foreign key `locationId` that links to the `GeographicLocation` table.

**Table `FlightServiceStation`**

| stationId | stationIdentifier | stationName | establishmentDate | operationalStatus | coverageArea | primaryCommunicationMode | parentOrganization | locationCity | locationProvince | locationId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | YQX | Baseline Corridor D | 2024-07-11 | active | 20.45 | HF | Dow Chemical | seasonal-location-23 | primary-location-94 | 100 |
| 2 | YVR | Distributed Series | 2025-12-22 | inactive | 23.90 | VHF | LDAP First Name Field | regional-location-24 | adaptive-location-95 | 101 |
| 3 | YUL | Adaptive Assessment | 2022-05-06 | under_construction | 27.35 | SSB | Standard Chartered | legacy-location-25 | distributed-location-96 | 102 |
| 4 | YEG | Primary Survey A | 2023-10-17 | active | 30.80 | Morse_code | The Library of Congress | compact-location-26 | baseline-location-97 | 103 |

The `FlightInformationRegion` table models the controlled airspace volumes managed by air traffic services. Each region has a `regionId`, a `firIdentifier` such as `FIR-2566` or `FIR-2581`, and a `firName` like "Extended Standard" or "Distributed Programme". The `firType` column classifies regions as `domestic`, `oceanic`, or `mixed`. Spatial extent is captured through `areaSize` (a numeric value such as `1.52` or `0.43012016`), `upperLimit`, and `lowerLimit`, which store altitude boundary identifiers like `compact-upper-32` and `baseline-lower-13`. The `controllingAuthority` column references the organization responsible for the region, and `overlapsRegionId` is a self-referencing foreign key indicating that a region may overlap with another—each of the four sample rows has its `overlapsRegionId` matching its own `regionId`, suggesting self-referential overlap declarations.

**Table `FlightInformationRegion`**

| regionId | firIdentifier | firName | firType | areaSize | upperLimit | lowerLimit | controllingAuthority | overlapsRegionId |
|---|---|---|---|---|---|---|---|---|
| 1 | FIR-2566 | Extended Standard | domestic | 1.52 | compact-upper-32 | adaptive-lower-11 | integrated-controll-88 | 1 |
| 2 | FIR-2571 | Pilot Framework A | oceanic | 0.65 | composite-upper-33 | distributed-lower-12 | seasonal-controll-89 | 2 |
| 3 | FIR-2576 | Baseline Protocol | mixed | 0.43012016 | primary-upper-34 | baseline-lower-13 | regional-controll-90 | 3 |
| 4 | FIR-2581 | Distributed Programme | domestic | 0.6000001 | adaptive-upper-35 | pilot-lower-14 | legacy-controll-91 | 4 |

Personnel are represented by the `AirTrafficController` table. Controllers are identified by `controllerId`, which in the sample data includes both numeric identifiers like `7441148` and `21248390` and a code-style identifier `lu_tax_code_template_m13`. The `firstName` and `lastName` columns store names such as "Stephanie Collins" and "Katherine Snyder". The `shiftType` column constrains assignments to `day`, `night`, or `midnight`, while `yearsOfExperience` ranges from `7` to `16`. The `certificationLevel` column holds values like `seasonal-certific-59` and `compact-certific-62`, and `currentAssignment` stores assignment identifiers such as `legacy-current-43`. The `contactMethod` column mirrors the communication modes found in stations, taking values like `HF`, `VHF`, and `interphone`. A foreign key `stationId` links each controller to their assigned `FlightServiceStation`.

**Table `AirTrafficController`**

| controllerId | firstName | lastName | shiftType | yearsOfExperience | certificationLevel | currentAssignment | contactMethod | stationId |
|---|---|---|---|---|---|---|---|---|
| 7441148 | Stephanie Collins | Paul Allen | day | 7 | seasonal-certific-59 | legacy-current-43 | HF | 1 |
| 21248390 | Janice Johnston | Heather Beasley | night | 10 | regional-certific-60 | compact-current-44 | VHF | 2 |
| 727063 | Upal Saha | Audrey Taylor | midnight | 13 | legacy-certific-61 | composite-current-45 | interphone | 3 |
| lu_tax_code_template_m13 | Katherine Snyder | Susan Wagner | day | 16 | compact-certific-62 | primary-current-46 | HF | 4 |

The `CommunicationSystem` table catalogs the radio and data-link infrastructures supporting air-ground communications. Each system has a surrogate `id`, a `systemId` (e.g., `8189503`, `3717623`), and a `systemName` such as "Legacy Programme D" or "Integrated Protocol A". The `frequencyBand` column takes values `HF`, `VHF`, or `SSB`, while `coverageRange` stores a numeric range measure (values like `6.20`, `9.40`, `12.60`, `15.80`). Signal quality is captured in `signalQuality` with values `clear`, `weak`, or `noisy`. The `dataFormat` column specifies the protocol used—`Morse_code`, `voice`, `AFTN`, or `GIA`—and `encryptionStatus` is a boolean indicating whether the system is encrypted. `lastMaintenanceDate` records the most recent maintenance event.

**Table `CommunicationSystem`**

| id | systemId | systemName | frequencyBand | coverageRange | signalQuality | dataFormat | encryptionStatus | lastMaintenanceDate |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189503 | Legacy Programme D | HF | 6.20 | clear | Morse_code | false | 2024-03-27 |
| 2 | 3717623 | Regional Standard | VHF | 9.40 | weak | voice | true | 2025-08-11 |
| 3 | 7441161 | Seasonal Framework | SSB | 12.60 | noisy | AFTN | false | 2022-01-22 |
| 4 | 605963 | Integrated Protocol A | HF | 15.80 | clear | GIA | true | 2023-06-06 |

The `Aircraft` table tracks individual aircraft in the operational fleet. Each row carries a surrogate `id`, a `registrationNumber` such as `REG-2136` or `REG-2154`, and an `aircraftType` like `primary-aircraft-34` or `baseline-aircraft-37`. The `operator` column identifies the operating entity (e.g., `baseline-operator-31`), and `flightNumber` provides the flight identifier such as `FLI-2053`. Departure and arrival airports are stored as `departureAirport` and `arrivalAirport` with identifiers like `compact-departur-50` and `legacy-arrival-49`. Operational telemetry includes `passengerCount` (values `13`, `10`, `7`, `8`), `cargoWeight` (ranging from `0.05000001` to `218.0`), `currentAltitude`, and `currentSpeed`. Timestamps `createdAt` and `updatedAt` record the aircraft's lifecycle events, with sample values spanning from `2025-01-01` to `2025-04-23`.

**Table `Aircraft`**

| id | registrationNumber | aircraftType | operator | flightNumber | departureAirport | arrivalAirport | passengerCount | cargoWeight | currentAltitude | currentSpeed | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | REG-2136 | primary-aircraft-34 | baseline-operator-31 | FLI-2053 | compact-departur-50 | legacy-arrival-49 | 13 | 218.0 | 12 | 30 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | REG-2142 | adaptive-aircraft-35 | pilot-operator-32 | FLI-2059 | composite-departur-51 | compact-arrival-50 | 10 | 0.05000001 | 19 | 33 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | REG-2148 | distributed-aircraft-36 | extended-operator-33 | FLI-2065 | primary-departur-52 | composite-arrival-51 | 7 | 3.24967074388476 | 26 | 36 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | REG-2154 | baseline-aircraft-37 | integrated-operator-34 | FLI-2071 | adaptive-departur-53 | primary-arrival-52 | 8 | 106.0 | 33 | 39 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `GeographicLocation` table provides the spatial reference framework for the entire domain. Each location has a surrogate `id` (matching the `locationId` foreign keys in `FlightServiceStation`), a `locationId` such as `778556` or `1250220`, and descriptive columns `cityName`, `provinceState`, and `country` with values like "Regional Protocol", `baseline-province-13`, and `compact-country-26`. The `latitude` and `longitude` columns store geographic coordinates (e.g., `13.95`, `21.20`), `elevation` stores altitude (e.g., `16.45`), and `timezone` stores timezone identifiers like `regional-timezone-12`.

**Table `GeographicLocation`**

| id | locationId | cityName | provinceState | country | latitude | longitude | elevation | timezone |
|---|---|---|---|---|---|---|---|---|
| 100 | 778556 | Regional Protocol | baseline-province-13 | compact-country-26 | 13.95 | 21.20 | 16.45 | regional-timezone-12 |
| 101 | 1250220 | Seasonal Programme D | pilot-province-14 | composite-country-27 | 17.90 | 25.40 | 18.90 | legacy-timezone-13 |
| 102 | 14511 | Integrated Standard | extended-province-15 | primary-country-28 | 21.85 | 29.60 | 21.35 | compact-timezone-14 |
| 103 | 611510 | Extended Framework | integrated-province-16 | adaptive-country-29 | 25.80 | 33.80 | 23.80 | composite-timezone-15 |

## Junction Tables and Many-to-Many Relationships

The six base entities are connected through nine junction tables that materialize the many-to-many relationships inherent in the air navigation domain. These tables follow a consistent naming convention: the source entity name concatenated with the target entity name, forming composite keys from the two foreign keys.

The `FlightServiceStationFlightInformationRegion` table links stations to the flight information regions they serve. The `FlightServiceStationAirTrafficController` table records which controllers are assigned to which stations. The `FlightServiceStationCommunicationSystem` table associates stations with their communication systems. The `FlightInformationRegionFlightServiceStation` table provides the reverse mapping from regions to stations, enabling queries that start from the airspace perspective.

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

The `AirTrafficControllerCommunicationSystem` table links controllers to the communication systems they operate or monitor. The `AirTrafficControllerFlightInformationRegion` table assigns controllers to specific flight information regions. The `CommunicationSystemFlightServiceStation` table provides the reverse mapping from communication systems to stations. The `CommunicationSystemAirTrafficController` table provides the reverse mapping from communication systems to controllers.

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

The `CommunicationSystemAircraft` table associates aircraft with the communication systems they use. The `AircraftFlightServiceStation` table links aircraft to the service stations responsible for their airspace. The `AircraftCommunicationSystem` table provides the reverse mapping from communication systems to aircraft. The `AircraftFlightInformationRegion` table links aircraft to the flight information regions they are operating within. The `GeographicLocationFlightServiceStation` table anchors stations to their geographic coordinates.

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

Each junction table's primary key is the composite of its two foreign key columns, ensuring that each relationship instance is recorded exactly once. This normalization eliminates redundancy and supports flexible querying across the domain.

## Derived Views and Domain Facts

The sixteen views in the schema reassemble normalized data into domain-meaningful result sets. Each view performs a join across the base and junction tables to answer a specific operational question.

The view `v_flight_service_station_flight_information_region_detail` joins `FlightServiceStation` with `FlightServiceStationFlightInformationRegion` and `FlightInformationRegion` to produce a comprehensive listing of which stations serve which FIRs. A sample row would show station `YQX` (Baselines Corridor D) serving region `FIR-2566` (Extended Standard), answering the question: "Which flight information regions does this station cover?"

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

The view `v_flight_service_station_air_traffic_controller_detail` joins `FlightServiceStation` with `FlightServiceStationAirTrafficController` and `AirTrafficController` to list the controllers assigned to each station. A sample row would pair station `YVR` with controller "Janice Johnston" (shift: `night`, experience: `10` years), answering: "Which controllers are deployed at this station?"

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

The view `v_flight_service_station_communication_system_detail` joins `FlightServiceStation` with `FlightServiceStationCommunicationSystem` and `CommunicationSystem` to show the communication systems available at each station. A sample row would link station `YUL` with system "Seasonal Framework" (frequency band: `SSB`, signal quality: `noisy`), answering: "What communication infrastructure supports this station?"

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

The view `v_flight_service_station_geographic_location` joins `FlightServiceStation` with `GeographicLocationFlightServiceStation` and `GeographicLocation` to provide the full geographic context for each station. A sample row would show station `YEG` (Primary Survey A) located at coordinates `25.80`, `33.80` in the "Extended Framework" city, answering: "Where is this station geographically positioned?"

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

The view `v_flight_information_region_flight_service_station_detail` joins `FlightInformationRegion` with `FlightInformationRegionFlightServiceStation` and `FlightServiceStation` to reverse the station-to-region perspective, listing which stations operate within each FIR. A sample row would show region `FIR-2571` (Pilot Framework A, oceanic type) served by station `YVR` (Distributed Series), answering: "Which stations operate in this flight information region?"

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

The view `v_flight_information_region_flight_information_region` appears to be a self-join or identity view on `FlightInformationRegion`, possibly used to expose the self-referential overlap relationships. A sample row would show region `FIR-2576` (Baseline Protocol, mixed type) with its overlap reference to itself, answering: "Which regions overlap with this region?"

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

The view `v_air_traffic_controller_flight_service_station` joins `AirTrafficController` with `FlightServiceStationAirTrafficController` and `FlightServiceStation` to list the station assignments for each controller. A sample row would show controller "Upal Saha" (midnight shift, `13` years experience) assigned to station `YUL` (Adaptive Assessment), answering: "Which station is this controller assigned to?"

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

The view `v_air_traffic_controller_communication_system_detail` joins `AirTrafficController` with `AirTrafficControllerCommunicationSystem` and `CommunicationSystem` to show the communication systems associated with each controller. A sample row would pair controller "Stephanie Collins" with a system operating on the `HF` band with `clear` signal quality, answering: "What communication systems does this controller use?"

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

The view `v_air_traffic_controller_flight_information_region_detail` joins `AirTrafficController` with `AirTrafficControllerFlightInformationRegion` and `FlightInformationRegion` to show which FIRs each controller is responsible for. A sample row would show controller "Katherine Snyder" (day shift, `16` years experience) assigned to region `FIR-2581` (Distributed Programme, domestic type), answering: "Which flight information regions does this controller manage?"

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

The view `v_communication_system_flight_service_station_detail` joins `CommunicationSystem` with `CommunicationSystemFlightServiceStation` and `FlightServiceStation` to show which stations use each communication system. A sample row would link system "Integrated Protocol A" (HF band, `GIA` data format, encrypted) to station `YEG` (Primary Survey A), answering: "Which stations rely on this communication system?"

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

The view `v_communication_system_air_traffic_controller_detail` joins `CommunicationSystem` with `CommunicationSystemAirTrafficController` and `AirTrafficController` to show which controllers operate each communication system. A sample row would pair system "Regional Standard" (VHF band, `voice` format, encrypted) with controller "Janice Johnston", answering: "Which controllers are trained on this communication system?"

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

The view `v_communication_system_aircraft_detail` joins `CommunicationSystem` with `CommunicationSystemAircraft` and `Aircraft` to show which aircraft use each communication system. A sample row would link system "Legacy Programme D" (HF band, `Morse_code` format) to aircraft `REG-2136` (flight `FLI-2053`, `13` passengers), answering: "Which aircraft operate on this communication system?"

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

The view `v_aircraft_flight_service_station_detail` joins `Aircraft` with `AircraftFlightServiceStation` and `FlightServiceStation` to show which service station is responsible for each aircraft. A sample row would show aircraft `REG-2142` (flight `FLI-2059`, `10` passengers, cargo weight `0.05000001`) under the jurisdiction of station `YVR` (Distributed Series), answering: "Which station provides air navigation services for this aircraft?"

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

The view `v_aircraft_communication_system_detail` joins `Aircraft` with `AircraftCommunicationSystem` and `CommunicationSystem` to show the communication systems available to each aircraft. A sample row would pair aircraft `REG-2148` (flight `FLI-2065`, `7` passengers) with system "Seasonal Framework" (SSB band, `AFTN` data format), answering: "What communication systems does this aircraft have access to?"

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

The view `v_aircraft_flight_information_region_detail` joins `Aircraft` with `AircraftFlightInformationRegion` and `FlightInformationRegion` to show which FIR each aircraft is currently operating within. A sample row would show aircraft `REG-2154` (flight `FLI-2071`, `8` passengers, altitude `33`, speed `39`) operating in region `FIR-2566` (Extended Standard, domestic type), answering: "In which flight information region is this aircraft currently flying?"

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

The view `v_geographic_location_flight_service_station_detail` joins `GeographicLocation` with `GeographicLocationFlightServiceStation` and `FlightServiceStation` to show which stations are located at each geographic coordinate. A sample row would link location `778556` (city: "Regional Protocol", coordinates `13.95`, `21.20`) to station `YQX` (Baselines Corridor D), answering: "Which stations are located at this geographic position?"

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

## Synthesis

The air navigation schema demonstrates a disciplined approach to relational modeling: six base entities capture the core concepts of the domain, nine junction tables materialize the many-to-many relationships between them, and sixteen views reassemble the normalized data into operationally meaningful perspectives. The design ensures that every domain fact—whether it concerns which controller serves which station, which aircraft operates in which FIR, or which communication system supports which station—can be reconstructed through well-defined joins. The use of surrogate keys alongside natural identifiers (such as `YQX`, `FIR-2566`, `REG-2136`) provides both referential stability and human readability. The geographic anchoring through `GeographicLocation` and the self-referential overlap declarations in `FlightInformationRegion` add spatial and topological richness to the model. Together, these tables and views form a comprehensive relational representation of the air navigation ecosystem, capable of supporting both operational queries and analytical reporting across the full spectrum of air traffic management activities.