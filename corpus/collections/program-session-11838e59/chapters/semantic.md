## Domain Modelling and Relational Materialisation

The domain under study concerns the administration of program sessions across a network of facilities, each containing rooms equipped with specialised apparatus, served by a roster of participants who attend sessions under tiered pricing structures. At the ontology level, six core entity types exist: `ProgramSession`, `Facility`, `Room`, `PricingTier`, `Participant`, and `Equipment`. Two of these — `FacilityRoom` and `ParticipantProgramSession` — are not independent entities but junction tables that materialise many-to-many relationships between their parent types. The schema's design follows a normalised pattern in which every entity type maps to a base table, every attribute maps to a column, and every foreign-key relationship maps to a column referencing the primary key of the related table. Views then reassemble these normalised facts into denormalised projections that answer concrete domain questions.

**Table `ProgramSession`**

| id | sessionIdentifier | programName | dayOfWeek | startTime | endTime | seasonEndDate | isClosed | facilityId | tierId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SES-2443 | Extended Review | baseline-day-43 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 2022-01-16 | false | 1 | 1 |
| 2 | SES-2449 | Pilot Initiative A | pilot-day-44 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2023-06-27 | true | 2 | 2 |
| 3 | SES-2455 | Baseline Model | extended-day-45 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 2024-11-11 | false | 3 | 3 |
| 4 | SES-2461 | Distributed Cluster | integrated-day-46 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 2025-04-22 | true | 4 | 4 |

The `ProgramSession` table is the central scheduling entity. Each row represents a single session of a named programme, identified by a surrogate integer `id` and a human-readable `sessionIdentifier` such as `SES-2443` or `SES-2461`. The `programName` column carries descriptive labels like *Extended Review* and *Distributed Cluster A*, while `dayOfWeek` stores temporal qualifiers such as `baseline-day-43` and `pilot-day-44`. Temporal boundaries are captured by three timestamp columns: `startTime`, `endTime`, and `seasonEndDate`. A boolean flag `isClosed` indicates whether the session is currently open for registration — rows with `false` (e.g. `SES-2443`) denote active sessions, while `true` (e.g. `SES-2449`) marks closed ones. Two foreign keys anchor the session to its operational context: `facilityId` references the `Facility` table, and `tierId` references the `PricingTier` table. In the sample data, session 1 (`SES-2443`) is hosted at facility 1 under pricing tier 1, while session 4 (`SES-2461`) belongs to facility 4 and tier 4.

**Table `Facility`**

| facilityId | facilityIdentifier | facilityName | streetAddress | city | state | postalCode | phoneNumber | website |
|---|---|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | PHO-2092 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 2 | FAC-2067 | Extended Programme | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | PHO-2093 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 3 | FAC-2068 | Pilot Standard | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | PHO-2094 | https://www.nature.com/articles/nphoton.2008.245 |
| 4 | FAC-2069 | Baseline Framework D | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | PHO-2095 | https://bugs.launchpad.net/trove/+bug/1347114 |

The `Facility` table models physical locations where sessions take place. Its primary key is `facilityId`, a surrogate integer, while `facilityIdentifier` provides a human-readable code such as `FAC-2066` or `FAC-2069`. The `facilityName` column carries labels like *Integrated Protocol A* and *Baseline Framework D*. Address information is split across `streetAddress`, `city`, `state`, and `postalCode`, each storing synthetic values such as `composite-street-15` and `integrated-city-34`. Contact details are held in `phoneNumber` (e.g. `PHO-2092`) and `website` (e.g. `https://bugs.launchpad.net/murano/+bug/1294080`). Every row in `ProgramSession` carries a `facilityId` that points to exactly one row in `Facility`, enforcing a many-to-one relationship: many sessions can be hosted at a single facility, but each session belongs to exactly one facility.

**Table `Room`**

| id | roomIdentifier | roomName | roomType | hasChangingTables | allowsFood | requiresShoeRemoval | facilityId | equipmentId |
|---|---|---|---|---|---|---|---|---|
| 1 | ROO-2647 | Pilot Protocol | legacy-room-25 | false | true | true | 1 | 1000 |
| 2 | ROO-2654 | Baseline Programme | compact-room-26 | true | false | false | 2 | 1001 |
| 3 | ROO-2661 | Distributed Standard A | composite-room-27 | false | true | true | 3 | 1002 |
| 4 | ROO-2668 | Adaptive Framework | primary-room-28 | true | false | false | 4 | 1003 |

The `Room` table captures the sub-locations within facilities. Its primary key is `id`, and each room carries a `roomIdentifier` such as `ROO-2647` and a `roomName` like *Pilot Protocol*. The `roomType` column stores structural descriptors (`legacy-room-25`, `compact-room-26`), while three boolean columns — `hasChangingTables`, `allowsFood`, and `requiresShoeRemoval` — encode amenity constraints. A foreign key `facilityId` links each room to its parent `Facility`, and another foreign key `equipmentId` links each room to an `Equipment` record. In the sample data, room 1 (`ROO-2647`) resides at facility 1 and contains equipment 1000; room 2 (`ROO-2654`) is at facility 2 with equipment 1001.

**Table `PricingTier`**

| tierId | tierIdentifier | tierName | costPerChild | ticketCount | totalCost | paymentMethod | sessionId |
|---|---|---|---|---|---|---|---|
| 1 | TIE-2665 | Primary Corridor A | 25.47 | 39 | 61.82 | composite-payment-45 | 1 |
| 2 | TIE-2672 | Composite Series | 14.31 | 57 | 89.53 | primary-payment-46 | 2 |
| 3 | TIE-2679 | Compact Assessment | 32.21 | 4 | 29.24 | adaptive-payment-47 | 3 |
| 4 | TIE-2686 | Legacy Survey D | 19.97 | 10 | 13.94 | distributed-payment-48 | 4 |

The `PricingTier` table defines the cost structure associated with sessions. Its primary key is `tierId`, and each tier carries a `tierIdentifier` such as `TIE-2665` and a `tierName` like *Primary Corridor A*. The `costPerChild` column stores decimal values (e.g. `25.47`, `14.31`), while `ticketCount` holds integer counts (e.g. `39`, `57`). The `totalCost` column records a derived or negotiated amount (e.g. `61.82`, `89.53`), and `paymentMethod` stores textual descriptors such as `composite-payment-45`. A foreign key `sessionId` references `ProgramSession.id`, creating a one-to-one or one-to-many relationship depending on the cardinality constraints: each pricing tier is associated with a specific session. In the sample data, tier 1 (`TIE-2665`) is linked to session 1, and tier 4 (`TIE-2686`) to session 4.

**Table `Participant`**

| participantId | participantIdentifier | firstName | lastName | ageGroup | hasPhotoID | isSupervisor | registrationDate | isSupervisedByParticipantId |
|---|---|---|---|---|---|---|---|---|
| 1 | PAR-2722 | Stephanie Collins | Paul Allen | integrated-age-22 | true | true | 2023-06-19T17:27:00 | 1 |
| 2 | PAR-2725 | Janice Johnston | Heather Beasley | seasonal-age-23 | false | false | 2024-11-03T00:44:00 | 2 |
| 3 | PAR-2728 | Upal Saha | Audrey Taylor | regional-age-24 | true | true | 2025-04-14T07:01:00 | 3 |
| 4 | PAR-2731 | Katherine Snyder | Susan Wagner | legacy-age-25 | false | false | 2022-09-25T14:18:00 | 4 |

The `Participant` table models individuals who attend sessions. Its primary key is `participantId`, and each participant carries a `participantIdentifier` such as `PAR-2722` and a composite name split across `firstName` and `lastName` (e.g. *Stephanie Collins*, *Paul Allen*). The `ageGroup` column stores categorical labels like `integrated-age-22` and `seasonal-age-23`. Boolean flags `hasPhotoID` and `isSupervisor` capture identity and supervisory status, while `registrationDate` records the timestamp of enrolment (e.g. `2023-06-19T17:27:00`). A self-referencing foreign key `isSupervisedByParticipantId` points to another `Participant.participantId`, enabling a supervisor–supervisee hierarchy within the same table. In the sample data, participant 1 (`PAR-2722`) is a supervisor who is supervised by participant 1 (self-reference), while participant 2 (`PAR-2725`) is not a supervisor and is supervised by participant 2.

**Table `Equipment`**

| id | equipmentIdentifier | equipmentName | equipmentType | isSkidFree | isChangingTable | roomId |
|---|---|---|---|---|---|---|
| 1000 | EQU-2761 | Legacy Review D | integrated-equipmen-58 | true | false | 1 |
| 1001 | EQU-2763 | Regional Initiative | seasonal-equipmen-59 | false | true | 2 |
| 1002 | EQU-2765 | Seasonal Model | regional-equipmen-60 | true | false | 3 |
| 1003 | EQU-2767 | Integrated Cluster A | legacy-equipmen-61 | false | true | 4 |

The `Equipment` table records physical apparatus assigned to rooms. Its primary key is `id`, and each equipment item carries an `equipmentIdentifier` such as `EQU-2761` and an `equipmentName` like *Legacy Review D*. The `equipmentType` column stores categorical labels (`integrated-equipmen-58`, `seasonal-equipmen-59`), while two boolean columns — `isSkidFree` and `isChangingTable` — encode safety and amenity properties. A foreign key `roomId` links each equipment item to its parent `Room`. In the sample data, equipment 1000 (`EQU-2761`) is assigned to room 1, and equipment 1003 (`EQU-2767`) to room 4.

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

The `FacilityRoom` table is a junction table that materialises the many-to-many relationship between `Facility` and `Room`. It contains two columns — `facilityId` and `roomId` — each serving as a foreign key referencing the respective parent table. The composite primary key `(facilityId, roomId)` ensures that each facility–room pairing is unique. This table exists because a room may conceptually belong to multiple facilities (e.g. in a federated or shared-space model), and a facility may contain many rooms. The junction table decouples the relationship from the `Room` table's `facilityId` column, allowing for more flexible cardinality.

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

The `ParticipantProgramSession` table is a junction table that materialises the many-to-many relationship between `Participant` and `ProgramSession`. It contains two columns — `participantId` and `sessionId` — each serving as a foreign key referencing the respective parent table. The composite primary key `(participantId, sessionId)` ensures that each participant–session pairing is unique. This table allows a participant to attend multiple sessions and a session to accommodate multiple participants, which the direct foreign-key columns in either parent table could not express.

The foreign-key topology of the schema can be summarised as follows. `ProgramSession.facilityId` → `Facility.facilityId` and `ProgramSession.tierId` → `PricingTier.tierId` create two incoming relationships to the session entity. `Room.facilityId` → `Facility.facilityId` and `Room.equipmentId` → `Equipment.id` create two incoming relationships to the room entity. `PricingTier.sessionId` → `ProgramSession.id` creates a reverse relationship from pricing back to sessions. `Equipment.roomId` → `Room.id` creates a relationship from equipment to rooms. `Participant.isSupervisedByParticipantId` → `Participant.participantId` creates a self-referencing relationship within participants. The two junction tables, `FacilityRoom` and `ParticipantProgramSession`, each introduce a composite key and two foreign keys, bridging their respective entity pairs.

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

The view `v_program_session_facility` joins `ProgramSession` to `Facility` on `ProgramSession.facilityId = Facility.facilityId`, producing a single-row projection that answers the question: *which facility hosts which session, and what are the session's temporal and pricing attributes?* Reading the first row, we see that session `SES-2443` (*Extended Review*) is hosted at facility `FAC-2066` (*Integrated Protocol A*), located at `composite-street-15` in `integrated-city-34`. The second row shows session `SES-2449` (*Pilot Initiative A*) at facility `FAC-2067` (*Extended Programme*), located at `primary-street-16` in `seasonal-city-35`. This view collapses the two-table join into a flat fact table suitable for reporting on session–facility pairings.

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

The view `v_program_session_pricing_tier` joins `ProgramSession` to `PricingTier` on `ProgramSession.tierId = PricingTier.tierId`, answering the question: *what is the cost structure for each session?* The first row reveals that session `SES-2443` is associated with tier `TIE-2665` (*Primary Corridor A*), which charges `25.47` per child, allows `39` tickets, and has a total cost of `61.82` paid via `composite-payment-45`. The fourth row shows session `SES-2461` paired with tier `TIE-2686` (*Legacy Survey D*), charging `19.97` per child with `10` tickets and a total cost of `13.94` via `distributed-payment-48`. This view materialises the pricing fact without requiring the consumer to perform a join.

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

The view `v_facility_room_detail` joins `Facility` to `Room` on `Facility.facilityId = Room.facilityId`, answering the question: *which rooms belong to which facility, and what are their amenity profiles?* The first row shows that room `ROO-2647` (*Pilot Protocol*), a `legacy-room-25` type, resides at facility `FAC-2066` (*Integrated Protocol A*). It has changing tables (`false`), allows food (`true`), and requires shoe removal (`true`). The second row shows room `ROO-2654` (*Baseline Programme*), a `compact-room-26` type, at facility `FAC-2067` (*Extended Programme*), with changing tables (`true`), no food allowed (`false`), and no shoe removal required (`false`). This view is useful for facility-level room inventories.

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

The view `v_room_facility` performs the same join as `v_facility_room_detail` but from the room's perspective, answering: *which facility is each room located in?* The result is functionally equivalent to `v_facility_room_detail` but may differ in column ordering or aliasing. The first row confirms that room `ROO-2647` is at facility `FAC-2066` (*Integrated Protocol A*), and the fourth row confirms that room `ROO-2668` (*Adaptive Framework*) is at facility `FAC-2069` (*Baseline Framework D*). This view may serve as a canonical reference for room-to-facility lookups in applications that query from the room side.

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

The view `v_room_equipment` joins `Room` to `Equipment` on `Room.equipmentId = Equipment.id`, answering the question: *what equipment is assigned to each room?* The first row shows that room `ROO-2647` (*Pilot Protocol*) contains equipment `EQU-2761` (*Legacy Review D*), which is skid-free (`true`) but not a changing table (`false`). The second row shows room `ROO-2654` (*Baseline Programme*) containing equipment `EQU-2763` (*Regional Initiative*), which is not skid-free (`false`) but is a changing table (`true`). This view materialises the room–equipment assignment as a flat fact.

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

The view `v_pricing_tier_program_session` joins `PricingTier` to `ProgramSession` on `PricingTier.sessionId = ProgramSession.id`, answering the question: *which session does each pricing tier serve, and what are the session's scheduling details?* The first row shows that tier `TIE-2665` (*Primary Corridor A*) serves session `SES-2443` (*Extended Review*), which runs on `baseline-day-43` from `2024-03-27T14:42:00` to `2023-02-26T13:27:00` and closes on `2022-01-16`. The third row shows tier `TIE-2679` (*Compact Assessment*) serving session `SES-2455` (*Baseline Model*), which runs on `extended-day-45` from `2022-01-22T04:16:00` to `2025-12-21T03:01:00` and closes on `2024-11-11`. This view inverts the join direction of `v_program_session_pricing_tier`, serving queries that start from the pricing side.

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

The view `v_participant_program_session_detail` joins `Participant` through the junction table `ParticipantProgramSession` to `ProgramSession`, answering the question: *which participants are enrolled in which sessions, and what are their personal and session details?* The first row shows participant `PAR-2722` (*Stephanie Collins*), age group `integrated-age-22`, with photo ID (`true`) and supervisory status (`true`), enrolled in session `SES-2443` (*Extended Review*). The second row shows participant `PAR-2725` (*Janice Johnston*), age group `seasonal-age-23`, without photo ID (`false`) and not a supervisor (`false`), enrolled in session `SES-2449` (*Pilot Initiative A*). This view materialises the many-to-many enrolment fact as a flat row, combining personal attributes with session metadata in a single projection.

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

The view `v_participant_participant` performs a self-join on `Participant` using the `isSupervisedByParticipantId` foreign key, answering the question: *which participant supervises which other participant?* The first row shows that participant `PAR-2722` (*Stephanie Collins*) is supervised by participant `PAR-2722` (self-reference), indicating a root or standalone supervisor. The second row shows participant `PAR-2725` (*Janice Johnston*) supervised by participant `PAR-2725`, also a self-reference. The third row shows participant `PAR-2728` (*Upal Saha*) supervised by participant `PAR-2728`, and the fourth row shows participant `PAR-2731` (*Katherine Snyder*) supervised by participant `PAR-2731`. In this sample dataset, all participants reference themselves as their own supervisors, suggesting that the hierarchy is either not yet populated or that each participant is independently responsible. The view exposes both the supervisor and supervisee columns, enabling queries that traverse the supervisory chain.

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

The view `v_equipment_room` joins `Equipment` to `Room` on `Equipment.roomId = Room.id`, answering the question: *which room is each piece of equipment assigned to?* The first row shows that equipment `EQU-2761` (*Legacy Review D*), an `integrated-equipmen-58` type that is skid-free (`true`) but not a changing table (`false`), is assigned to room `ROO-2647` (*Pilot Protocol*). The fourth row shows equipment `EQU-2767` (*Integrated Cluster A*), a `legacy-equipmen-61` type that is not skid-free (`false`) but is a changing table (`true`), assigned to room `ROO-2668` (*Adaptive Framework*). This view inverts the join direction of `v_room_equipment`, serving queries that start from the equipment side.

The schema's design reflects a deliberate trade-off between normalisation and query convenience. The eight base tables are in at least third normal form: every non-key attribute is fully functionally dependent on its primary key, and no transitive dependencies exist. Foreign keys enforce referential integrity across entity boundaries, while the two junction tables (`FacilityRoom` and `ParticipantProgramSession`) correctly decompose many-to-many relationships that cannot be expressed through single-column foreign keys. The nine views then reassemble these normalised facts into denormalised projections that answer specific domain questions without requiring the consumer to write joins. Each view corresponds to a single join path through the schema graph, and together they cover all pairwise relationships between entity types: session–facility, session–pricing, facility–room, room–facility, room–equipment, pricing–session, participant–session (via junction), participant–participant (self-join), and equipment–room. This pattern — normalised base tables for write consistency, views for read convenience — is a standard relational modelling practice that separates the concerns of data integrity from data presentation.