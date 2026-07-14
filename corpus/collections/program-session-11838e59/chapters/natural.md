## Program Operations and Resource Management

The administration of structured programs across distributed facilities requires careful coordination of sessions, spaces, personnel, and financial arrangements. At the core of this operation lies a system that tracks individual program sessions, assigns them to physical locations, manages participant enrollment, and maintains detailed records of equipment and pricing structures. Each session carries a unique identifier such as SES-2443 or SES-2449, is associated with a named program like Extended Review or Pilot Initiative A, and operates within defined temporal boundaries. The system captures scheduling details including the day of the week, start and end times, and seasonal deadlines, while also tracking whether a session has reached capacity through a closure flag.

**Table `ProgramSession`**

| id | sessionIdentifier | programName | dayOfWeek | startTime | endTime | seasonEndDate | isClosed | facilityId | tierId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | Extended Review | baseline-day-43 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 2022-01-16 | false | 1 | 1 |
| 2 | SES-2449 | Pilot Initiative A | pilot-day-44 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2023-06-27 | true | 2 | 2 |
| 3 | SES-2455 | Baseline Model | extended-day-45 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 2024-11-11 | false | 3 | 3 |
| 4 | SES-2461 | Distributed Cluster | integrated-day-46 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 2025-04-22 | true | 4 | 4 |

Program sessions form the central organizing unit of the operation. Each session is anchored to a specific facility through a foreign-key reference, ensuring that every scheduled activity has a physical home. The session records span multiple program types—Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster—each with distinct scheduling patterns. For instance, session SES-2443 operates under the Extended Review program with a baseline-day-43 designation, running from 14:42 on March 27, 2024, with a season end date of January 16, 2022. Session SES-2449, designated as Pilot Initiative A, carries a pilot-day-44 label and is marked as closed, indicating it has reached its enrollment limit. The temporal attributes of these sessions vary considerably: SES-2455 (Baseline Model) begins at 04:16 on January 22, 2022, while SES-2461 (Distributed Cluster) starts at 11:33 on June 6, 2023. The closure status provides an operational signal—sessions SES-2449 and SES-2461 are closed, while SES-2443 and SES-2455 remain open for enrollment.

**Table `Facility`**

| facilityId | facilityIdentifier | facilityName | streetAddress | city | state | postalCode | phoneNumber | website |
|---|---|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | PHO-2092 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 2 | FAC-2067 | Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | PHO-2093 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 3 | FAC-2068 | Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | PHO-2094 | https://www.nature.com/articles/nphoton.2008.245 |
| 4 | FAC-2069 | Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | PHO-2095 | https://bugs.launchpad.net/trove/+bug/1347114 |

Facilities serve as the geographic and administrative anchors for all program sessions. The facility registry maintains four primary locations, each identified by codes such as FAC-2066 and FAC-2067, and named according to their operational designation—Integrated Protocol A, Extended Programme, Pilot Standard, and Baseline Framework D. Contact information is maintained for each site, including street addresses like composite-street-15, cities such as integrated-city-34, and postal codes ranging from numeric formats like 9125611 to alphanumeric identifiers like ChIJt4hBkzhu5kcRJJDUNqGUpso. Phone numbers follow the PHO-2092 convention, and web resources link to external documentation sites. The facility records establish the physical infrastructure within which rooms are organized and sessions are delivered.

**Table `Room`**

| id | roomIdentifier | roomName | roomType | hasChangingTables | allowsFood | requiresShoeRemoval | facilityId | equipmentId |
|---|---|---|---|---|---|---|---|---|
| 1 | ROO-2647 | Pilot Protocol | legacy-room-25 | false | true | true | 1 | 1000 |
| 2 | ROO-2654 | Baseline Programme | compact-room-26 | true | false | false | 2 | 1001 |
| 3 | ROO-2661 | Distributed Standard A | composite-room-27 | false | true | true | 3 | 1002 |
| 4 | ROO-2668 | Adaptive Framework | primary-room-28 | true | false | false | 4 | 1003 |

Rooms represent the specific spaces within facilities where program activities take place. Each room carries an identifier such as ROO-2647 or ROO-2654 and is classified by type—legacy-room-25, compact-room-26, composite-room-27, and primary-room-28. The room registry captures operational constraints through boolean flags: changing table availability, food permissions, and shoe removal requirements. Room ROO-2647 (Pilot Protocol) permits food but requires shoe removal and lacks changing tables, while ROO-2654 (Baseline Programme) provides changing tables but prohibits food and does not require shoe removal. Each room is assigned to a facility—ROO-2647 through ROO-2668 are distributed across facilities 1 through 4 respectively—and each is associated with a piece of equipment, creating a direct link between the physical space and its primary apparatus.

**Table `PricingTier`**

| tierId | tierIdentifier | tierName | costPerChild | ticketCount | totalCost | paymentMethod | sessionId |
|---|---|---|---|---|---|---|---|
| 1 | TIE-2665 | Primary Corridor A | 25.47 | 39 | 61.82 | composite-payment-45 | 1 |
| 2 | TIE-2672 | Composite Series | 14.31 | 57 | 89.53 | primary-payment-46 | 2 |
| 3 | TIE-2679 | Compact Assessment | 32.21 | 4 | 29.24 | adaptive-payment-47 | 3 |
| 4 | TIE-2686 | Legacy Survey D | 19.97 | 10 | 13.94 | distributed-payment-48 | 4 |

Pricing tiers define the financial structure applied to program sessions. Each tier carries an identifier such as TIE-2665 or TIE-2672 and a descriptive name like Primary Corridor A or Composite Series. The cost structure includes a per-child rate—ranging from 14.31 for the Composite Series to 32.21 for the Compact Assessment—along with a ticket count that indicates the number of participants covered, from as few as 4 tickets to as many as 57. The total cost reflects the aggregate financial arrangement, with values such as 61.82 and 89.53 appearing across the tiers. Payment methods are categorized as composite-payment-45, primary-payment-46, adaptive-payment-47, and distributed-payment-48. Each pricing tier is linked to a specific session through a session identifier, establishing the financial terms for that particular program offering.

**Table `Participant`**

| participantId | participantIdentifier | firstName | lastName | ageGroup | hasPhotoID | isSupervisor | registrationDate | isSupervisedByParticipantId |
|---|---|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Stephanie Collins | Paul Allen | integrated-age-22 | true | true | 2023-06-19T17:27:00 | 1 |
| 2 | PAR-2725 | Janice Johnston | Heather Beasley | seasonal-age-23 | false | false | 2024-11-03T00:44:00 | 2 |
| 3 | PAR-2728 | Upal Saha | Audrey Taylor | regional-age-24 | true | true | 2025-04-14T07:01:00 | 3 |
| 4 | PAR-2731 | Katherine Snyder | Susan Wagner | legacy-age-25 | false | false | 2022-09-25T14:18:00 | 4 |

Participants are the individuals enrolled in program sessions, each recorded with a unique identifier such as PAR-2722 or PAR-2725. The participant registry captures full names—Stephanie Collins, Janice Johnston, Upal Saha, and Katherine Snyder—along with age group classifications including integrated-age-22, seasonal-age-23, regional-age-24, and legacy-age-25. Administrative attributes track whether a participant possesses photo identification, holds a supervisory role, and when they registered. Registration dates span from September 25, 2022, through April 14, 2025. The supervision structure includes a self-referential link: each participant record contains a field indicating which other participant supervises them, with values such as PAR-2722 being supervised by PAR-2722 itself, and PAR-2725 supervised by PAR-2725, establishing a hierarchical supervision chain within the program.

**Table `Equipment`**

| id | equipmentIdentifier | equipmentName | equipmentType | isSkidFree | isChangingTable | roomId |
|---|---|---|---|---|---|---|
| 1000 | EQU-2761 | Legacy Review D | integrated-equipmen-58 | true | false | 1 |
| 1001 | EQU-2763 | Regional Initiative | seasonal-equipmen-59 | false | true | 2 |
| 1002 | EQU-2765 | Seasonal Model | regional-equipmen-60 | true | false | 3 |
| 1003 | EQU-2767 | Integrated Cluster A | legacy-equipmen-61 | false | true | 4 |

Equipment records catalog the apparatus assigned to each room. Equipment identifiers such as EQU-2761 and EQU-2763 correspond to items like Legacy Review D and Regional Initiative, classified by type as integrated-equipmen-58, seasonal-equipmen-59, regional-equipmen-60, and legacy-equipmen-61. The equipment registry tracks two key operational properties: whether the item is skid-free, indicated by the isSkidFree flag, and whether it includes a changing table, indicated by isChangingTable. Equipment EQU-2761 (Legacy Review D) is skid-free but lacks a changing table, while EQU-2763 (Regional Initiative) is not skid-free but does include a changing table. Each equipment item is assigned to a specific room, creating a one-to-one mapping between apparatus and space.

**Table `FacilityRoom`**

| facilityId | roomId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The FacilityRoom table establishes the explicit relationship between facilities and their constituent rooms. This junction table resolves the many-to-many relationship that may exist between facilities and rooms, ensuring that each room is properly associated with its parent facility. The records in this table confirm that rooms ROO-2647 through ROO-2668 are each assigned to facilities 1 through 4 respectively, mirroring the facilityId field in the Room table but providing a normalized structure for querying room-to-facility relationships. This separation allows for scenarios where a room might be associated with multiple facilities or where facility boundaries shift over time.

**Table `ParticipantProgramSession`**

| participantId | sessionId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The ParticipantProgramSession table records the enrollment of participants in specific program sessions. This junction table links participant identifiers to session identifiers, creating the many-to-many relationship that allows participants to enroll in multiple sessions and sessions to accommodate multiple participants. The records in this table form the basis for all enrollment reporting, attendance tracking, and capacity management. Each enrollment record represents a concrete commitment by a participant to attend a specific session, enabling the system to track utilization rates and manage waitlists.

**View `v_program_session_facility`**

```sql
CREATE VIEW v_program_session_facility AS
SELECT a.id, a.sessionIdentifier, a.programName, a.dayOfWeek, b.facilityId AS facility_facilityId, b.facilityIdentifier AS facility_facilityIdentifier, b.facilityName AS facility_facilityName
FROM ProgramSession a JOIN Facility b ON a.facilityId = b.facilityId;
```

| id | sessionIdentifier | programName | dayOfWeek | facility_facilityId | facility_facilityIdentifier | facility_facilityName |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | Extended Review | baseline-day-43 | 1 | FAC-2066 | Integrated Protocol A |
| 2 | SES-2449 | Pilot Initiative A | pilot-day-44 | 2 | FAC-2067 | Extended Programme |
| 3 | SES-2455 | Baseline Model | extended-day-45 | 3 | FAC-2068 | Pilot Standard |
| 4 | SES-2461 | Distributed Cluster | integrated-day-46 | 4 | FAC-2069 | Baseline Framework D |

The v_program_session_facility view joins program sessions with their host facilities, answering the fundamental question of which session operates at which location. This view combines the session-level attributes—sessionIdentifier, programName, dayOfWeek, startTime, endTime, seasonEndDate, and isClosed—with the facility-level details including facilityIdentifier, facilityName, streetAddress, city, state, postalCode, phoneNumber, and website. Reading the first row of this view reveals that session SES-2443 (Extended Review) operates at facility FAC-2066 (Integrated Protocol A), located at composite-street-15 in integrated-city-34, with postal code 9125611 and phone number PHO-2092. The second row shows that session SES-2449 (Pilot Initiative A) is hosted at facility FAC-2067 (Extended Programme) on primary-street-16 in seasonal-city-35, with the postal identifier ChIJt4hBkzhu5kcRJJDUNqGUpso. This view enables administrators to produce location-based schedules and to verify that session assignments align with facility capabilities.

**View `v_program_session_pricing_tier`**

```sql
CREATE VIEW v_program_session_pricing_tier AS
SELECT a.id, a.sessionIdentifier, a.programName, a.dayOfWeek, b.tierId AS tier_tierId, b.tierIdentifier AS tier_tierIdentifier, b.tierName AS tier_tierName
FROM ProgramSession a JOIN PricingTier b ON a.tierId = b.tierId;
```

| id | sessionIdentifier | programName | dayOfWeek | tier_tierId | tier_tierIdentifier | tier_tierName |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | Extended Review | baseline-day-43 | 1 | TIE-2665 | Primary Corridor A |
| 2 | SES-2449 | Pilot Initiative A | pilot-day-44 | 2 | TIE-2672 | Composite Series |
| 3 | SES-2455 | Baseline Model | extended-day-45 | 3 | TIE-2679 | Compact Assessment |
| 4 | SES-2461 | Distributed Cluster | integrated-day-46 | 4 | TIE-2686 | Legacy Survey D |

The v_program_session_pricing_tier view connects program sessions with their associated pricing tiers, providing a complete financial picture for each session. This join brings together session attributes with tier-level financial data including tierIdentifier, tierName, costPerChild, ticketCount, totalCost, and paymentMethod. The first row of this view shows that session SES-2443 is priced under tier TIE-2665 (Primary Corridor A), with a cost of 25.47 per child, 39 tickets available, a total cost of 61.82, and composite-payment-45 as the payment method. The second row reveals that session SES-2449 uses tier TIE-2672 (Composite Series), priced at 14.31 per child with 57 tickets, a total cost of 89.53, and primary-payment-46 as the payment method. This view is essential for financial reconciliation and for communicating pricing information to participants and administrators.

**View `v_facility_room_detail`**

```sql
CREATE VIEW v_facility_room_detail AS
SELECT a.facilityId, a.facilityIdentifier, a.facilityName, b.id AS room_id, b.roomIdentifier AS room_roomIdentifier, b.roomName AS room_roomName
FROM Facility a
  JOIN FacilityRoom j ON j.facilityId = a.facilityId
  JOIN Room b ON b.id = j.roomId;
```

| facilityId | facilityIdentifier | facilityName | room_id | room_roomIdentifier | room_roomName |
|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | 1 | ROO-2647 | Pilot Protocol |
| 1 | FAC-2066 | Integrated Protocol A | 2 | ROO-2654 | Baseline Programme |
| 2 | FAC-2067 | Extended Programme | 2 | ROO-2654 | Baseline Programme |
| 2 | FAC-2067 | Extended Programme | 3 | ROO-2661 | Distributed Standard A |
| 3 | FAC-2068 | Pilot Standard | 3 | ROO-2661 | Distributed Standard A |
| 3 | FAC-2068 | Pilot Standard | 4 | ROO-2668 | Adaptive Framework |
| 4 | FAC-2069 | Baseline Framework D | 4 | ROO-2668 | Adaptive Framework |
| 4 | FAC-2069 | Baseline Framework D | 1 | ROO-2647 | Pilot Protocol |

The v_facility_room_detail view merges facility information with room specifications, answering the question of which rooms are available at which facilities and what their operational characteristics are. This join combines facility attributes with room-level details including roomIdentifier, roomName, roomType, hasChangingTables, allowsFood, and requiresShoeRemoval. The first row shows that facility FAC-2066 (Integrated Protocol A) contains room ROO-2647 (Pilot Protocol), classified as legacy-room-25, which does not have changing tables, permits food, and requires shoe removal. The second row indicates that facility FAC-2067 (Extended Programme) houses room ROO-2654 (Baseline Programme), a compact-room-26 type that provides changing tables, prohibits food, and does not require shoe removal. This view supports facility managers in matching room capabilities to program requirements and in communicating space restrictions to participants.

**View `v_room_facility`**

```sql
CREATE VIEW v_room_facility AS
SELECT a.id, a.roomIdentifier, a.roomName, a.roomType, b.facilityId AS facility_facilityId, b.facilityIdentifier AS facility_facilityIdentifier, b.facilityName AS facility_facilityName
FROM Room a JOIN Facility b ON a.facilityId = b.facilityId;
```

| id | roomIdentifier | roomName | roomType | facility_facilityId | facility_facilityIdentifier | facility_facilityName |
|---|---|---|---|---|---|---|
| 1 | ROO-2647 | Pilot Protocol | legacy-room-25 | 1 | FAC-2066 | Integrated Protocol A |
| 2 | ROO-2654 | Baseline Programme | compact-room-26 | 2 | FAC-2067 | Extended Programme |
| 3 | ROO-2661 | Distributed Standard A | composite-room-27 | 3 | FAC-2068 | Pilot Standard |
| 4 | ROO-2668 | Adaptive Framework | primary-room-28 | 4 | FAC-2069 | Baseline Framework D |

The v_room_facility view provides a streamlined perspective on room-to-facility relationships, focusing on the structural hierarchy of spaces within the facility network. This view presents room identifiers alongside their parent facility identifiers and names, enabling straightforward queries about which facility contains a given room. The first row confirms that room ROO-2647 (Pilot Protocol) belongs to facility FAC-2066 (Integrated Protocol A), while the second row shows that room ROO-2654 (Baseline Programme) is part of facility FAC-2067 (Extended Programme). This hierarchical view is particularly useful for navigation, reporting, and ensuring that room assignments are consistent with facility boundaries.

**View `v_room_equipment`**

```sql
CREATE VIEW v_room_equipment AS
SELECT a.id, a.roomIdentifier, a.roomName, a.roomType, b.id AS equipment_id, b.equipmentIdentifier AS equipment_equipmentIdentifier, b.equipmentName AS equipment_equipmentName
FROM Room a JOIN Equipment b ON a.equipmentId = b.id;
```

| id | roomIdentifier | roomName | roomType | equipment_id | equipment_equipmentIdentifier | equipment_equipmentName |
|---|---|---|---|---|---|---|
| 1 | ROO-2647 | Pilot Protocol | legacy-room-25 | 1000 | EQU-2761 | Legacy Review D |
| 2 | ROO-2654 | Baseline Programme | compact-room-26 | 1001 | EQU-2763 | Regional Initiative |
| 3 | ROO-2661 | Distributed Standard A | composite-room-27 | 1002 | EQU-2765 | Seasonal Model |
| 4 | ROO-2668 | Adaptive Framework | primary-room-28 | 1003 | EQU-2767 | Integrated Cluster A |

The v_room_equipment view links rooms with their assigned equipment, answering the question of what apparatus is available in each space. This join combines room attributes with equipment details including equipmentIdentifier, equipmentName, equipmentType, isSkidFree, and isChangingTable. The first row reveals that room ROO-2647 (Pilot Protocol) contains equipment EQU-2761 (Legacy Review D), classified as integrated-equipmen-58, which is skid-free but does not include a changing table. The second row shows that room ROO-2654 (Baseline Programme) is equipped with EQU-2763 (Regional Initiative), a seasonal-equipmen-59 type that is not skid-free but does provide a changing table. This view is critical for operational planning, ensuring that rooms have the appropriate equipment for their intended use, and for maintenance scheduling.

**View `v_pricing_tier_program_session`**

```sql
CREATE VIEW v_pricing_tier_program_session AS
SELECT a.tierId, a.tierIdentifier, a.tierName, a.costPerChild, b.id AS session_id, b.sessionIdentifier AS session_sessionIdentifier, b.programName AS session_programName
FROM PricingTier a JOIN ProgramSession b ON a.sessionId = b.id;
```

| tierId | tierIdentifier | tierName | costPerChild | session_id | session_sessionIdentifier | session_programName |
|---|---|---|---|---|---|---|
| 1 | TIE-2665 | Primary Corridor A | 25.47 | 1 | SES-2443 | Extended Review |
| 2 | TIE-2672 | Composite Series | 14.31 | 2 | SES-2449 | Pilot Initiative A |
| 3 | TIE-2679 | Compact Assessment | 32.21 | 3 | SES-2455 | Baseline Model |
| 4 | TIE-2686 | Legacy Survey D | 19.97 | 4 | SES-2461 | Distributed Cluster |

The v_pricing_tier_program_session view presents the pricing structure from the perspective of the pricing tier, showing which sessions are governed by each tier. This join combines tier-level financial data with session attributes, providing a complete picture of how pricing is distributed across sessions. The first row shows that tier TIE-2665 (Primary Corridor A), with a cost of 25.47 per child and 39 tickets, applies to session SES-2443 (Extended Review), using composite-payment-45. The second row indicates that tier TIE-2672 (Composite Series), priced at 14.31 per child with 57 tickets, governs session SES-2449 (Pilot Initiative A), with primary-payment-46 as the payment method. This view supports financial analysis by revealing the pricing strategy applied to each program offering.

**View `v_participant_program_session_detail`**

```sql
CREATE VIEW v_participant_program_session_detail AS
SELECT a.participantId, a.participantIdentifier, a.firstName, b.id AS session_id, b.sessionIdentifier AS session_sessionIdentifier, b.programName AS session_programName
FROM Participant a
  JOIN ParticipantProgramSession j ON j.participantId = a.participantId
  JOIN ProgramSession b ON b.id = j.sessionId;
```

| participantId | participantIdentifier | firstName | session_id | session_sessionIdentifier | session_programName |
|---|---|---|---|---|---|
| 1 | PAR-2722 | Stephanie Collins | 1 | SES-2443 | Extended Review |
| 1 | PAR-2722 | Stephanie Collins | 2 | SES-2449 | Pilot Initiative A |
| 2 | PAR-2725 | Janice Johnston | 2 | SES-2449 | Pilot Initiative A |
| 2 | PAR-2725 | Janice Johnston | 3 | SES-2455 | Baseline Model |
| 3 | PAR-2728 | Upal Saha | 3 | SES-2455 | Baseline Model |
| 3 | PAR-2728 | Upal Saha | 4 | SES-2461 | Distributed Cluster |
| 4 | PAR-2731 | Katherine Snyder | 4 | SES-2461 | Distributed Cluster |
| 4 | PAR-2731 | Katherine Snyder | 1 | SES-2443 | Extended Review |

The v_participant_program_session_detail view joins participant records with their session enrollments, providing a comprehensive view of who is enrolled in which sessions. This join combines participant attributes—including participantIdentifier, firstName, lastName, ageGroup, hasPhotoID, isSupervisor, and registrationDate—with session-level details such as sessionIdentifier, programName, dayOfWeek, startTime, endTime, seasonEndDate, and isClosed. The first row shows that participant PAR-2722 (Stephanie Collins), in the integrated-age-22 group, with photo identification and supervisory status, registered on June 19, 2023, and is enrolled in session SES-2443 (Extended Review), which runs on baseline-day-43 starting at 14:42 on March 27, 2024, with a season end date of January 16, 2022, and is currently open. The second row reveals that participant PAR-2725 (Janice Johnston), in the seasonal-age-23 group without photo identification and without supervisory status, registered on November 3, 2024, and is enrolled in session SES-2449 (Pilot Initiative A), which operates on pilot-day-44 starting at 21:59 on August 11, 2025, with a season end date of June 27, 2023, and is currently closed. This view is essential for enrollment management, attendance tracking, and communication with participants.

**View `v_participant_participant`**

```sql
CREATE VIEW v_participant_participant AS
SELECT a.participantId, a.participantIdentifier, a.firstName, a.lastName, b.participantId AS participant_participantId, b.participantIdentifier AS participant_participantIdentifier, b.firstName AS participant_firstName
FROM Participant a JOIN Participant b ON a.isSupervisedByParticipantId = b.participantId;
```

| participantId | participantIdentifier | firstName | lastName | participant_participantId | participant_participantIdentifier | participant_firstName |
|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Stephanie Collins | Paul Allen | 1 | PAR-2722 | Stephanie Collins |
| 2 | PAR-2725 | Janice Johnston | Heather Beasley | 2 | PAR-2725 | Janice Johnston |
| 3 | PAR-2728 | Upal Saha | Audrey Taylor | 3 | PAR-2728 | Upal Saha |
| 4 | PAR-2731 | Katherine Snyder | Susan Wagner | 4 | PAR-2731 | Katherine Snyder |

The v_participant_participant view exposes the self-referential supervision structure within the participant registry, revealing which participant supervises which other participant. This view presents each participant alongside their supervisor, enabling the tracing of supervision chains through the program. The first row shows that participant PAR-2722 (Stephanie Collins) is supervised by participant PAR-2722, indicating a self-supervision or top-level supervisory role. The second row indicates that participant PAR-2725 (Janice Johnston) is supervised by PAR-2725, following the same pattern. This hierarchical structure supports accountability and ensures that each participant has a designated supervisor, which is critical for safety, communication, and program governance.

**View `v_equipment_room`**

```sql
CREATE VIEW v_equipment_room AS
SELECT a.id, a.equipmentIdentifier, a.equipmentName, a.equipmentType, b.id AS room_id, b.roomIdentifier AS room_roomIdentifier, b.roomName AS room_roomName
FROM Equipment a JOIN Room b ON a.roomId = b.id;
```

| id | equipmentIdentifier | equipmentName | equipmentType | room_id | room_roomIdentifier | room_roomName |
|---|---|---|---|---|---|---|
| 1000 | EQU-2761 | Legacy Review D | integrated-equipmen-58 | 1 | ROO-2647 | Pilot Protocol |
| 1001 | EQU-2763 | Regional Initiative | seasonal-equipmen-59 | 2 | ROO-2654 | Baseline Programme |
| 1002 | EQU-2765 | Seasonal Model | regional-equipmen-60 | 3 | ROO-2661 | Distributed Standard A |
| 1003 | EQU-2767 | Integrated Cluster A | legacy-equipmen-61 | 4 | ROO-2668 | Adaptive Framework |

The v_equipment_room view presents equipment records alongside their assigned rooms, providing a reverse perspective from the room_equipment view by starting from the equipment and showing where it is located. This join combines equipment attributes with room details including roomIdentifier, roomName, roomType, hasChangingTables, allowsFood, and requiresShoeRemoval. The first row shows that equipment EQU-2761 (Legacy Review D), classified as integrated-equipmen-58 and skid-free, is located in room ROO-2647 (Pilot Protocol), a legacy-room-25 type that permits food and requires shoe removal. The second row reveals that equipment EQU-2763 (Regional Initiative), a seasonal-equipmen-59 type with a changing table, is assigned to room ROO-2654 (Baseline Programme), a compact-room-26 that prohibits food and does not require shoe removal. This view supports equipment inventory management and ensures that apparatus is correctly positioned within the facility.

## Synthesis

The program operations system integrates eight core data entities into a coherent operational framework. Program sessions serve as the central organizing unit, each anchored to a facility, a pricing tier, and a set of enrolled participants. Facilities provide the physical infrastructure, containing rooms that are equipped with specialized apparatus and governed by operational constraints. Participants are enrolled in sessions through explicit enrollment records, with supervision hierarchies ensuring accountability. The views derived from these base tables answer the practical questions that administrators face daily: which session runs where, what does it cost, who is enrolled, and what equipment is available in each room. Together, these records and their relationships form the operational backbone of a distributed program management system, enabling precise coordination of people, places, and resources.