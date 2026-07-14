## Domain Modelling and Relational Materialization

The domain under examination concerns the governance and operational logistics of physician-led branch societies, their affiliated committees, and the meetings that bind them together. At its core, the model captures a network of organizational entities—branch societies, committees, and geographic locations—alongside the people (physicians) who participate in them, and the scheduled meetings that serve as the temporal anchors for all interactions. The relational schema materializes this network through a set of normalized base tables, each representing a distinct entity type with its own primary key, and a suite of materialized views that reassemble the normalized facts into domain-meaningful projections. The design follows a star-like pattern where the central entities are linked through foreign keys and, where many-to-many relationships arise, through explicit junction tables.

**Table `BranchSociety`**

| societyId | branchCode | geographicArea | meetingFrequency | primaryAddress | meetingId | physicianId |
|---|---|---|---|---|---|---|
| 1 | Central | composite-geograph-15 | 30 | extended-primary-63 | 1 | 1 |
| 2 | East | primary-geograph-16 | 40 | integrated-primary-64 | 2 | 2 |
| 3 | North | adaptive-geograph-17 | 50 | seasonal-primary-65 | 3 | 3 |
| 4 | Northwest | distributed-geograph-18 | 60 | regional-primary-66 | 4 | 4 |

The `BranchSociety` table is the organizational root of the schema. Each row represents a branch society identified by `societyId` (a sequential integer surrogate key) and distinguished by a `branchCode` such as `Central`, `East`, `North`, or `Northwest`. The `geographicArea` column carries a coded descriptor like `composite-geograph-15` or `primary-geograph-16`, while `meetingFrequency` stores an integer—30, 40, 50, or 60—that likely denotes a recurring interval in days. The `primaryAddress` field holds coded address strings such as `extended-primary-63`. The table also carries `meetingId` and `physicianId` columns, which function as foreign keys pointing to the `BranchMeeting` and `Physician` tables respectively, thereby embedding a direct association between each society and its associated meeting and physician. In the sample data, society 1 (`Central`) is linked to meeting 1 and physician 1, establishing a one-to-one alignment across the three tables for the first record.

**Table `BranchMeeting`**

| meetingId | meetingDate | startTime | durationHours | location | topic | status | societyId | physicianId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | extended-location-99 | distributed-topic-60 | scheduled | 1 | 1 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | integrated-location-100 | baseline-topic-61 | completed | 2 | 2 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | seasonal-location-101 | pilot-topic-62 | cancelled | 3 | 3 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | regional-location-102 | extended-topic-63 | scheduled | 4 | 4 |

`BranchMeeting` captures the scheduling dimension of branch society activities. Its primary key is `meetingId`, which is shared with `BranchSociety` to enforce a one-to-one correspondence at the branch level. The `meetingDate` column stores ISO-8601 timestamps such as `2023-10-23T21:39:00` or `2024-03-07T04:56:00`. The `startTime` column carries coded start-time descriptors like `regional-start-54` or `legacy-start-55`, while `durationHours` is a decimal value—3.70, 7.40, 11.10, or 14.80—that quantifies the meeting length. The `location` column references a coded location string (e.g., `extended-location-99`), and `topic` stores the meeting subject matter as a coded string such as `distributed-topic-60`. The `status` column is an enumerated field with values `scheduled`, `completed`, or `cancelled`, as seen in the sample rows. Foreign keys `societyId` and `physicianId` link each meeting back to its parent society and its assigned physician, completing the triad of society–meeting–physician at the branch level.

**Table `Physician`**

| physicianId | physicianID | fullName | age | yearsInPractice | primaryAddress | membershipStatus | societyId | meetingId | committeeCode |
|---|---|---|---|---|---|---|---|---|---|
| 1 | PHY-2677 | Theodore Mcgrath | 35 | 27 | extended-primary-63 | active | 1 | 1 | 7441158 |
| 2 | PHY-2682 | Account Name | 40 | 35 | integrated-primary-64 | inactive | 2 | 2 | 2933476 |
| 3 | PHY-2687 | Saipan International Airport | 45 | 43 | seasonal-primary-65 | pending | 3 | 3 | 6926352 |
| 4 | PHY-2692 | Norma Fisher | 50 | 51 | regional-primary-66 | active | 4 | 4 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 |

The `Physician` table is the person entity of the domain. Its primary key is `physicianId`, with a secondary human-readable identifier `physicianID` such as `PHY-2677` or `PHY-2682`. The `fullName` column holds names like `Theodore Mcgrath` or `Norma Fisher`, while `age` and `yearsInPractice` are integer attributes (35 and 27 for the first physician, 50 and 51 for the fourth). The `primaryAddress` column mirrors the address coding seen in `BranchSociety`. The `membershipStatus` column is an enumerated field with values `active`, `inactive`, or `pending`. Foreign keys `societyId` and `meetingId` tie each physician to a branch society and a branch meeting, while `committeeCode` links the physician to a committee (discussed below), establishing the physician as a bridge between the branch society layer and the committee layer.

**Table `Committee`**

| committeeName | committeeCode | meetingFrequency | meetingTime | meetingLocation | appointmentMonth | locationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| Composite Cluster | 7441158 | 30 | integrated-meeting-58 | legacy-meeting-43 | 20 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Compact Review A | 2933476 | 40 | seasonal-meeting-59 | compact-meeting-44 | 25 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Legacy Initiative | 6926352 | 50 | regional-meeting-60 | composite-meeting-45 | 30 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 | legacy-meeting-61 | primary-meeting-46 | 35 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`Committee` models the governance sub-structures within the domain. Its primary key is `committeeCode`, which in the sample data takes both integer values (`7441158`, `2933476`, `6926352`) and a UUID (`3e9b5c70-8fcd-11eb-924d-9cd76263cbd0`). The `committeeName` column carries descriptive names such as `Composite Cluster`, `Compact Review A`, `Legacy Initiative`, and `Regional Model`. The `meetingFrequency` column stores integers (30 through 60), `meetingTime` and `meetingLocation` are coded strings, and `appointmentMonth` is an integer (20 through 35). The `locationId` foreign key links the committee to a `Location` record, while `createdAt` and `updatedAt` are timestamp columns recording the committee's lifecycle. This table is the anchor for the committee–location and committee–physician relationships.

**Table `Location`**

| id | locationID | address | city | state | venueType | meetingId | hostsMeetingMeetingId |
|---|---|---|---|---|---|---|---|
| 1 | LOC-2154 | distributed-address-72 | integrated-city-34 | distributed-state-84 | office | 1 | 1 |
| 2 | LOC-2157 | baseline-address-73 | seasonal-city-35 | baseline-state-85 | museum | 2 | 2 |
| 3 | LOC-2160 | pilot-address-74 | regional-city-36 | pilot-state-86 | capitol | 3 | 3 |
| 4 | LOC-2163 | extended-address-75 | legacy-city-37 | extended-state-87 | community_center | 4 | 4 |

`Location` is the geographic entity table. Its primary key is `id` (integer), with a secondary identifier `locationID` such as `LOC-2154` or `LOC-2157`. The `address`, `city`, and `state` columns carry coded strings like `distributed-address-72`, `integrated-city-34`, and `distributed-state-84`. The `venueType` column is an enumerated field with values `office`, `museum`, `capitol`, and `community_center`. The `meetingId` and `hostsMeetingMeetingId` columns are foreign keys referencing `BranchMeeting`, indicating that each location is associated with a branch meeting and may also serve as the host for a specific meeting instance.

**Table `CommitteeMeeting`**

| meetingId | meetingDate | startTime | durationHours | agenda | status | committeeCode | locationId |
|---|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | compact-agenda-56 | scheduled | 7441158 | 1 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | composite-agenda-57 | completed | 2933476 | 2 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | primary-agenda-58 | cancelled | 6926352 | 3 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | adaptive-agenda-59 | scheduled | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 4 |

`CommitteeMeeting` captures the scheduled meetings of committees, distinct from branch meetings. Its primary key is `meetingId`, which is shared with `BranchMeeting` to allow cross-referencing. The `meetingDate` and `startTime` columns mirror the branch meeting schema, while `durationHours` is again a decimal. The `agenda` column stores coded strings such as `compact-agenda-56` or `adaptive-agenda-59`. The `status` column uses the same enumerated values (`scheduled`, `completed`, `cancelled`). Foreign keys `committeeCode` and `locationId` link each committee meeting to its parent committee and its venue, forming the committee-layer equivalent of the society–meeting–location triad.

**Table `CommitteePhysician`**

| committeeCode | physicianId |
|---|---|
| 7441158 | 1 |
| 7441158 | 2 |
| 2933476 | 2 |
| 2933476 | 3 |
| 6926352 | 3 |
| 6926352 | 4 |
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 4 |
| 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 1 |

The `CommitteePhysician` table is the junction table that materializes the many-to-many relationship between `Committee` and `Physician`. In a normalized design, a physician may belong to multiple committees and a committee may comprise multiple physicians. This table resolves that relationship by storing pairs of `committeeCode` and `physicianId`, each pair forming a composite foreign key referencing the respective parent tables. The presence of this junction table is what allows the schema to support flexible committee membership without denormalizing either the `Committee` or `Physician` entity.

**Table `CommitteeMeetingPhysician`**

| meetingId | physicianId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`CommitteeMeetingPhysician` is the second junction table, resolving the many-to-many relationship between `CommitteeMeeting` and `Physician`. Just as `CommitteePhysician` links people to committees, this table links people to specific committee meeting instances. A physician may attend multiple committee meetings, and a committee meeting may have multiple attending physicians. The table stores pairs of `meetingId` and `physicianId`, each pair forming a composite foreign key. This design ensures that attendance records are granular and independently queryable.

With the base tables defined, the schema provides a suite of materialized views that reassemble the normalized data into domain-meaningful projections. Each view is a named join that answers a specific analytical question.

**View `v_branch_society_branch_meeting`**

```sql
CREATE VIEW v_branch_society_branch_meeting AS
SELECT a.societyId, a.branchCode, a.geographicArea, a.meetingFrequency, b.meetingId AS meeting_meetingId, b.meetingDate AS meeting_meetingDate, b.startTime AS meeting_startTime
FROM BranchSociety a JOIN BranchMeeting b ON a.meetingId = b.meetingId;
```

| societyId | branchCode | geographicArea | meetingFrequency | meeting_meetingId | meeting_meetingDate | meeting_startTime |
|---|---|---|---|---|---|---|
| 1 | Central | composite-geograph-15 | 30 | 1 | 2023-10-23T21:39:00 | regional-start-54 |
| 2 | East | primary-geograph-16 | 40 | 2 | 2024-03-07T04:56:00 | legacy-start-55 |
| 3 | North | adaptive-geograph-17 | 50 | 3 | 2025-08-18T11:13:00 | compact-start-56 |
| 4 | Northwest | distributed-geograph-18 | 60 | 4 | 2022-01-02T18:30:00 | composite-start-57 |

The view `v_branch_society_branch_meeting` joins `BranchSociety` to `BranchMeeting` on their shared `societyId`/`meetingId` relationship. It answers the question: "What are the scheduling details of each branch society's meeting?" Reading the first row, we see that society `Central` (societyId 1) holds its meeting on `2023-10-23T21:39:00` with a duration of 3.70 hours, status `scheduled`, and topic `distributed-topic-60`. This view is the primary operational dashboard for branch society meeting logistics.

**View `v_branch_society_physician`**

```sql
CREATE VIEW v_branch_society_physician AS
SELECT a.societyId, a.branchCode, a.geographicArea, a.meetingFrequency, b.physicianId AS physician_physicianId, b.physicianID AS physician_physicianID, b.fullName AS physician_fullName
FROM BranchSociety a JOIN Physician b ON a.physicianId = b.physicianId;
```

| societyId | branchCode | geographicArea | meetingFrequency | physician_physicianId | physician_physicianID | physician_fullName |
|---|---|---|---|---|---|---|
| 1 | Central | composite-geograph-15 | 30 | 1 | PHY-2677 | Theodore Mcgrath |
| 2 | East | primary-geograph-16 | 40 | 2 | PHY-2682 | Account Name |
| 3 | North | adaptive-geograph-17 | 50 | 3 | PHY-2687 | Saipan International Airport |
| 4 | Northwest | distributed-geograph-18 | 60 | 4 | PHY-2692 | Norma Fisher |

`v_branch_society_physician` joins `BranchSociety` to `Physician` on `societyId`. It answers: "Which physician is associated with each branch society?" The first row shows that society `Central` is associated with physician `Theodore Mcgrath` (physicianId 1), who is `active`, age 35, with 27 years in practice. This view supports organizational roster queries.

**View `v_branch_meeting_branch_society`**

```sql
CREATE VIEW v_branch_meeting_branch_society AS
SELECT a.meetingId, a.meetingDate, a.startTime, a.durationHours, b.societyId AS society_societyId, b.branchCode AS society_branchCode, b.geographicArea AS society_geographicArea
FROM BranchMeeting a JOIN BranchSociety b ON a.societyId = b.societyId;
```

| meetingId | meetingDate | startTime | durationHours | society_societyId | society_branchCode | society_geographicArea |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | 1 | Central | composite-geograph-15 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | 2 | East | primary-geograph-16 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | 3 | North | adaptive-geograph-17 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | 4 | Northwest | distributed-geograph-18 |

`v_branch_meeting_branch_society` is the inverse of the first view, joining `BranchMeeting` to `BranchSociety`. It answers: "Which branch society does each meeting belong to?" The first row shows that meeting 1, held on `2023-10-23T21:39:00` with topic `distributed-topic-60`, belongs to society `Central`. This orientation is useful when starting from a meeting record and needing to resolve its organizational parent.

**View `v_branch_meeting_physician`**

```sql
CREATE VIEW v_branch_meeting_physician AS
SELECT a.meetingId, a.meetingDate, a.startTime, a.durationHours, b.physicianId AS physician_physicianId, b.physicianID AS physician_physicianID, b.fullName AS physician_fullName
FROM BranchMeeting a JOIN Physician b ON a.physicianId = b.physicianId;
```

| meetingId | meetingDate | startTime | durationHours | physician_physicianId | physician_physicianID | physician_fullName |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | 1 | PHY-2677 | Theodore Mcgrath |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | 2 | PHY-2682 | Account Name |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | 3 | PHY-2687 | Saipan International Airport |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | 4 | PHY-2692 | Norma Fisher |

`v_branch_meeting_physician` joins `BranchMeeting` to `Physician` on `physicianId`. It answers: "Which physician is assigned to each branch meeting?" The first row shows that meeting 1 (topic `distributed-topic-60`, status `scheduled`) is assigned to physician `Theodore Mcgrath`. This view supports attendance and responsibility queries at the meeting level.

**View `v_physician_branch_society`**

```sql
CREATE VIEW v_physician_branch_society AS
SELECT a.physicianId, a.physicianID, a.fullName, a.age, b.societyId AS society_societyId, b.branchCode AS society_branchCode, b.geographicArea AS society_geographicArea
FROM Physician a JOIN BranchSociety b ON a.societyId = b.societyId;
```

| physicianId | physicianID | fullName | age | society_societyId | society_branchCode | society_geographicArea |
|---|---|---|---|---|---|---|
| 1 | PHY-2677 | Theodore Mcgrath | 35 | 1 | Central | composite-geograph-15 |
| 2 | PHY-2682 | Account Name | 40 | 2 | East | primary-geograph-16 |
| 3 | PHY-2687 | Saipan International Airport | 45 | 3 | North | adaptive-geograph-17 |
| 4 | PHY-2692 | Norma Fisher | 50 | 4 | Northwest | distributed-geograph-18 |

`v_physician_branch_society` joins `Physician` to `BranchSociety` on `societyId`. It answers: "Which branch society does each physician belong to?" The first row shows that physician `Theodore Mcgrath` (PHY-2677) belongs to society `Central`. This view is the physician-centric counterpart to `v_branch_society_physician`.

**View `v_physician_branch_meeting`**

```sql
CREATE VIEW v_physician_branch_meeting AS
SELECT a.physicianId, a.physicianID, a.fullName, a.age, b.meetingId AS meeting_meetingId, b.meetingDate AS meeting_meetingDate, b.startTime AS meeting_startTime
FROM Physician a JOIN BranchMeeting b ON a.meetingId = b.meetingId;
```

| physicianId | physicianID | fullName | age | meeting_meetingId | meeting_meetingDate | meeting_startTime |
|---|---|---|---|---|---|---|
| 1 | PHY-2677 | Theodore Mcgrath | 35 | 1 | 2023-10-23T21:39:00 | regional-start-54 |
| 2 | PHY-2682 | Account Name | 40 | 2 | 2024-03-07T04:56:00 | legacy-start-55 |
| 3 | PHY-2687 | Saipan International Airport | 45 | 3 | 2025-08-18T11:13:00 | compact-start-56 |
| 4 | PHY-2692 | Norma Fisher | 50 | 4 | 2022-01-02T18:30:00 | composite-start-57 |

`v_physician_branch_meeting` joins `Physician` to `BranchMeeting` on `physicianId`. It answers: "Which branch meetings is each physician assigned to?" The first row shows that physician `Theodore Mcgrath` is assigned to meeting 1, held on `2023-10-23T21:39:00` with duration 3.70 hours and status `scheduled`. This view supports physician workload and scheduling analysis.

**View `v_physician_committee`**

```sql
CREATE VIEW v_physician_committee AS
SELECT a.physicianId, a.physicianID, a.fullName, a.age, b.committeeName AS committee_committeeName, b.committeeCode AS committee_committeeCode, b.meetingFrequency AS committee_meetingFrequency
FROM Physician a JOIN Committee b ON a.committeeCode = b.committeeCode;
```

| physicianId | physicianID | fullName | age | committee_committeeName | committee_committeeCode | committee_meetingFrequency |
|---|---|---|---|---|---|---|
| 1 | PHY-2677 | Theodore Mcgrath | 35 | Composite Cluster | 7441158 | 30 |
| 2 | PHY-2682 | Account Name | 40 | Compact Review A | 2933476 | 40 |
| 3 | PHY-2687 | Saipan International Airport | 45 | Legacy Initiative | 6926352 | 50 |
| 4 | PHY-2692 | Norma Fisher | 50 | Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 |

`v_physician_committee` joins `Physician` to `Committee` on `committeeCode`. It answers: "Which committee is each physician affiliated with?" The first row shows that physician `Theodore Mcgrath` is affiliated with committee `Composite Cluster` (committeeCode `7441158`). This view bridges the physician and committee layers, revealing the governance affiliations of each physician.

**View `v_committee_location`**

```sql
CREATE VIEW v_committee_location AS
SELECT a.committeeName, a.committeeCode, a.meetingFrequency, a.meetingTime, b.id AS location_id, b.locationID AS location_locationID, b.address AS location_address
FROM Committee a JOIN Location b ON a.locationId = b.id;
```

| committeeName | committeeCode | meetingFrequency | meetingTime | location_id | location_locationID | location_address |
|---|---|---|---|---|---|---|
| Composite Cluster | 7441158 | 30 | integrated-meeting-58 | 1 | LOC-2154 | distributed-address-72 |
| Compact Review A | 2933476 | 40 | seasonal-meeting-59 | 2 | LOC-2157 | baseline-address-73 |
| Legacy Initiative | 6926352 | 50 | regional-meeting-60 | 3 | LOC-2160 | pilot-address-74 |
| Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 | legacy-meeting-61 | 4 | LOC-2163 | extended-address-75 |

`v_committee_location` joins `Committee` to `Location` on `locationId`. It answers: "Where does each committee hold its meetings?" The first row shows that committee `Composite Cluster` is associated with location 1, which has address `distributed-address-72`, city `integrated-city-34`, and venue type `office`. This view supports venue allocation and geographic analysis of committee activities.

**View `v_committee_physician_detail`**

```sql
CREATE VIEW v_committee_physician_detail AS
SELECT a.committeeName, a.committeeCode, a.meetingFrequency, b.physicianId AS physician_physicianId, b.physicianID AS physician_physicianID, b.fullName AS physician_fullName
FROM Committee a
  JOIN CommitteePhysician j ON j.committeeCode = a.committeeCode
  JOIN Physician b ON b.physicianId = j.physicianId;
```

| committeeName | committeeCode | meetingFrequency | physician_physicianId | physician_physicianID | physician_fullName |
|---|---|---|---|---|---|
| Composite Cluster | 7441158 | 30 | 1 | PHY-2677 | Theodore Mcgrath |
| Composite Cluster | 7441158 | 30 | 2 | PHY-2682 | Account Name |
| Compact Review A | 2933476 | 40 | 2 | PHY-2682 | Account Name |
| Compact Review A | 2933476 | 40 | 3 | PHY-2687 | Saipan International Airport |
| Legacy Initiative | 6926352 | 50 | 3 | PHY-2687 | Saipan International Airport |
| Legacy Initiative | 6926352 | 50 | 4 | PHY-2692 | Norma Fisher |
| Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 | 4 | PHY-2692 | Norma Fisher |
| Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 | 1 | PHY-2677 | Theodore Mcgrath |

`v_committee_physician_detail` joins `Committee` to `CommitteePhysician` and then to `Physician`, resolving the many-to-many relationship. It answers: "Which physicians serve on which committees, with full physician detail?" The first row shows that committee `Composite Cluster` includes physician `Theodore Mcgrath` (PHY-2677), age 35, with 27 years in practice and `active` membership status. This view is the primary roster query for committee membership.

**View `v_location_branch_meeting`**

```sql
CREATE VIEW v_location_branch_meeting AS
SELECT a.id, a.locationID, a.address, a.city, b.meetingId AS meeting_meetingId, b.meetingDate AS meeting_meetingDate, b.startTime AS meeting_startTime
FROM Location a JOIN BranchMeeting b ON a.meetingId = b.meetingId;
```

| id | locationID | address | city | meeting_meetingId | meeting_meetingDate | meeting_startTime |
|---|---|---|---|---|---|---|
| 1 | LOC-2154 | distributed-address-72 | integrated-city-34 | 1 | 2023-10-23T21:39:00 | regional-start-54 |
| 2 | LOC-2157 | baseline-address-73 | seasonal-city-35 | 2 | 2024-03-07T04:56:00 | legacy-start-55 |
| 3 | LOC-2160 | pilot-address-74 | regional-city-36 | 3 | 2025-08-18T11:13:00 | compact-start-56 |
| 4 | LOC-2163 | extended-address-75 | legacy-city-37 | 4 | 2022-01-02T18:30:00 | composite-start-57 |

`v_location_branch_meeting` joins `Location` to `BranchMeeting` on `meetingId`. It answers: "Which branch meetings are held at each location?" The first row shows that location 1 (venue type `office`) hosts branch meeting 1, which has topic `distributed-topic-60` and status `scheduled`. This view supports venue utilization analysis at the branch level.

**View `v_location_committee_meeting`**

```sql
CREATE VIEW v_location_committee_meeting AS
SELECT a.id, a.locationID, a.address, a.city, b.meetingId AS meeting_meetingId, b.meetingDate AS meeting_meetingDate, b.startTime AS meeting_startTime
FROM Location a JOIN CommitteeMeeting b ON a.hostsMeetingMeetingId = b.meetingId;
```

| id | locationID | address | city | meeting_meetingId | meeting_meetingDate | meeting_startTime |
|---|---|---|---|---|---|---|
| 1 | LOC-2154 | distributed-address-72 | integrated-city-34 | 1 | 2023-10-23T21:39:00 | regional-start-54 |
| 2 | LOC-2157 | baseline-address-73 | seasonal-city-35 | 2 | 2024-03-07T04:56:00 | legacy-start-55 |
| 3 | LOC-2160 | pilot-address-74 | regional-city-36 | 3 | 2025-08-18T11:13:00 | compact-start-56 |
| 4 | LOC-2163 | extended-address-75 | legacy-city-37 | 4 | 2022-01-02T18:30:00 | composite-start-57 |

`v_location_committee_meeting` joins `Location` to `CommitteeMeeting` on `locationId`. It answers: "Which committee meetings are held at each location?" The first row shows that location 1 hosts committee meeting 1, which has agenda `compact-agenda-56`, status `scheduled`, and belongs to committee `Composite Cluster`. This view supports venue utilization analysis at the committee level.

**View `v_committee_meeting_committee`**

```sql
CREATE VIEW v_committee_meeting_committee AS
SELECT a.meetingId, a.meetingDate, a.startTime, a.durationHours, b.committeeName AS committee_committeeName, b.committeeCode AS committee_committeeCode, b.meetingFrequency AS committee_meetingFrequency
FROM CommitteeMeeting a JOIN Committee b ON a.committeeCode = b.committeeCode;
```

| meetingId | meetingDate | startTime | durationHours | committee_committeeName | committee_committeeCode | committee_meetingFrequency |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | Composite Cluster | 7441158 | 30 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | Compact Review A | 2933476 | 40 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | Legacy Initiative | 6926352 | 50 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 |

`v_committee_meeting_committee` joins `CommitteeMeeting` to `Committee` on `committeeCode`. It answers: "Which committee does each committee meeting belong to?" The first row shows that meeting 1 (agenda `compact-agenda-56`, status `scheduled`, duration 3.70 hours) belongs to committee `Composite Cluster`. This view is the primary operational dashboard for committee meeting logistics.

**View `v_committee_meeting_location`**

```sql
CREATE VIEW v_committee_meeting_location AS
SELECT a.meetingId, a.meetingDate, a.startTime, a.durationHours, b.id AS location_id, b.locationID AS location_locationID, b.address AS location_address
FROM CommitteeMeeting a JOIN Location b ON a.locationId = b.id;
```

| meetingId | meetingDate | startTime | durationHours | location_id | location_locationID | location_address |
|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | 1 | LOC-2154 | distributed-address-72 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | 2 | LOC-2157 | baseline-address-73 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | 3 | LOC-2160 | pilot-address-74 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | 4 | LOC-2163 | extended-address-75 |

`v_committee_meeting_location` joins `CommitteeMeeting` to `Location` on `locationId`. It answers: "Where is each committee meeting held?" The first row shows that committee meeting 1 (agenda `compact-agenda-56`, status `scheduled`) is held at location 1, which has venue type `office` and address `distributed-address-72`. This view supports venue logistics for committee meetings.

**View `v_committee_meeting_physician_detail`**

```sql
CREATE VIEW v_committee_meeting_physician_detail AS
SELECT a.meetingId, a.meetingDate, a.startTime, b.physicianId AS physician_physicianId, b.physicianID AS physician_physicianID, b.fullName AS physician_fullName
FROM CommitteeMeeting a
  JOIN CommitteeMeetingPhysician j ON j.meetingId = a.meetingId
  JOIN Physician b ON b.physicianId = j.physicianId;
```

| meetingId | meetingDate | startTime | physician_physicianId | physician_physicianID | physician_fullName |
|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 1 | PHY-2677 | Theodore Mcgrath |
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 2 | PHY-2682 | Account Name |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 2 | PHY-2682 | Account Name |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 3 | PHY-2687 | Saipan International Airport |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 3 | PHY-2687 | Saipan International Airport |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 4 | PHY-2692 | Norma Fisher |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 4 | PHY-2692 | Norma Fisher |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 1 | PHY-2677 | Theodore Mcgrath |

`v_committee_meeting_physician_detail` joins `CommitteeMeeting` to `CommitteeMeetingPhysician` and then to `Physician`, resolving the many-to-many attendance relationship. It answers: "Which physicians attend each committee meeting, with full physician detail?" The first row shows that committee meeting 1 (agenda `compact-agenda-56`, status `scheduled`) is attended by physician `Theodore Mcgrath` (PHY-2677), age 35, with 27 years in practice and `active` membership status. This view is the primary attendance query for committee meetings.

The schema as a whole embodies a clean separation between entity persistence and analytical projection. The eight base tables store the canonical facts of the domain—societies, meetings, physicians, committees, locations, and their relationships—while the fourteen views provide pre-joined, domain-meaningful lenses over that data. Every view is a deterministic reconstruction of a domain fact from the normalized tables: either a simple one-to-one join (such as `v_branch_society_branch_meeting`) or a multi-hop join through a junction table (such as `v_committee_physician_detail` or `v_committee_meeting_physician_detail`). The foreign key relationships—`BranchSociety.societyId → BranchMeeting.societyId`, `BranchMeeting.physicianId → Physician.physicianId`, `Committee.locationId → Location.id`, `CommitteeMeeting.committeeCode → Committee.committeeCode`, and the composite keys in `CommitteePhysician` and `CommitteeMeetingPhysician`—form a connected graph that ensures referential integrity across the entire model. The result is a schema that is both normalized for update efficiency and richly queryable through its view layer, allowing analysts to answer organizational, scheduling, and attendance questions without manually constructing joins.