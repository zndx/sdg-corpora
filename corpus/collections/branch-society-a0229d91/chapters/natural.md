The governance of regional medical practice rests on a network of branch societies, scheduled meetings, physician memberships, and standing committees that convene at fixed locations. Each organization maintains its own calendar, tracks attendance, and records outcomes. The data model captures these relationships through a set of base tables and a collection of joined views that answer operational questions about who attended what, where, and under which organizational umbrella.

## Branch Societies and Their Meeting Cadence

**Table `BranchSociety`**

| societyId | branchCode | geographicArea | meetingFrequency | primaryAddress | meetingId | physicianId |
|---|---|---|---|---|---|---|
| 1 | Central | composite-geograph-15 | 30 | extended-primary-63 | 1 | 1 |
| 2 | East | primary-geograph-16 | 40 | integrated-primary-64 | 2 | 2 |
| 3 | North | adaptive-geograph-17 | 50 | seasonal-primary-65 | 3 | 3 |
| 4 | Northwest | distributed-geograph-18 | 60 | regional-primary-66 | 4 | 4 |

A branch society is the foundational organizational unit, identified by a numeric `societyId` and a descriptive `branchCode` such as Central, East, North, or Northwest. Each society covers a distinct `geographicArea`—for example, composite-geograph-15 for the Central branch—and publishes a `meetingFrequency` measured in days between gatherings, ranging from 30 to 60 across the four societies. The `primaryAddress` field (extended-primary-63, integrated-primary-64, and so on) anchors the society's mailing or administrative location. The `meetingId` and `physicianId` columns tie each society to its lead meeting and its primary physician contact, creating a one-to-one linkage that serves as the entry point for all downstream queries.

## Branch Meetings: Scheduling and Status Tracking

**Table `BranchMeeting`**

| meetingId | meetingDate | startTime | durationHours | location | topic | status | societyId | physicianId |
|---|---|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | extended-location-99 | distributed-topic-60 | scheduled | 1 | 1 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | integrated-location-100 | baseline-topic-61 | completed | 2 | 2 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | seasonal-location-101 | pilot-topic-62 | cancelled | 3 | 3 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | regional-location-102 | extended-topic-63 | scheduled | 4 | 4 |

Branch meetings are the operational events scheduled by each society. The `meetingId` column mirrors the society's reference, so meeting 1 belongs to society 1, meeting 2 to society 2, and so forth. Each record carries a `meetingDate` in ISO 8601 format—2023-10-23T21:39:00 for the first entry, 2024-03-07T04:56:00 for the second—alongside a `startTime` token (regional-start-54, legacy-start-55) that encodes the time-of-day convention. The `durationHours` field varies substantially: the first meeting runs 3.70 hours, while the fourth extends to 14.80 hours, reflecting the range of meeting formats from brief check-ins to full-day sessions. The `location` column (extended-location-99, integrated-location-100) points to the venue, and the `topic` field (distributed-topic-60, baseline-topic-61, pilot-topic-62, extended-topic-63) describes the subject matter. A `status` column records whether the meeting is scheduled, completed, or cancelled; in the sample data, meetings 1 and 4 are scheduled, meeting 2 is completed, and meeting 3 is cancelled. The `societyId` and `physicianId` columns re-establish the organizational and personnel context for each meeting.

## Physicians: Credentials and Membership

**Table `Physician`**

| physicianId | physicianID | fullName | age | yearsInPractice | primaryAddress | membershipStatus | societyId | meetingId | committeeCode |
|---|---|---|---|---|---|---|---|---|---|
| 1 | PHY-2677 | Theodore Mcgrath | 35 | 27 | extended-primary-63 | active | 1 | 1 | 7441158 |
| 2 | PHY-2682 | Account Name | 40 | 35 | integrated-primary-64 | inactive | 2 | 2 | 2933476 |
| 3 | PHY-2687 | Saipan International Airport | 45 | 43 | seasonal-primary-65 | pending | 3 | 3 | 6926352 |
| 4 | PHY-2692 | Norma Fisher | 50 | 51 | regional-primary-66 | active | 4 | 4 | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 |

The physician table stores individual practitioner records. Each row has a numeric `physicianId` that aligns with the meeting and society identifiers, a unique `physicianID` string such as PHY-2677 or PHY-2682, and a `fullName`—Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher. The `age` ranges from 35 to 50, and `yearsInPractice` spans 27 to 51 years, indicating a mix of early-career and veteran practitioners. The `primaryAddress` (extended-primary-63, integrated-primary-64, seasonal-primary-65, regional-primary-66) mirrors the society addresses, suggesting that physicians are geographically anchored to their branch. The `membershipStatus` field takes values of active, inactive, or pending; in the dataset, physicians 1 and 4 are active, physician 2 is inactive, and physician 3 is pending. The `societyId` and `meetingId` columns link each physician to their branch society and lead meeting, while the `committeeCode` column (7441158, 2933476, 6926352, 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0) connects the physician to a standing committee, with codes that are either numeric or UUID-formatted.

## Committees: Standing Bodies and Schedules

**Table `Committee`**

| committeeName | committeeCode | meetingFrequency | meetingTime | meetingLocation | appointmentMonth | locationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| Composite Cluster | 7441158 | 30 | integrated-meeting-58 | legacy-meeting-43 | 20 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Compact Review A | 2933476 | 40 | seasonal-meeting-59 | compact-meeting-44 | 25 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Legacy Initiative | 6926352 | 50 | regional-meeting-60 | composite-meeting-45 | 30 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| Regional Model | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 60 | legacy-meeting-61 | primary-meeting-46 | 35 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Committees are standing bodies that operate on their own calendars. The `committeeName` field (Composite Cluster, Compact Review A, Legacy Initiative, Regional Model) identifies each body, while the `committeeCode` serves as the primary key and matches the physician-level codes seen above. The `meetingFrequency` (30, 40, 50, 60) parallels the society-level frequencies, and `meetingTime` and `meetingLocation` tokens (integrated-meeting-58, legacy-meeting-43, etc.) describe when and where the committee convenes. The `appointmentMonth` field (20, 25, 30, 35) likely encodes a month offset or a fiscal period. The `locationId` column ties the committee to a physical venue, and `createdAt` and `updatedAt` timestamps record the committee's lifecycle—Composite Cluster was created on 2025-01-01 and last updated on 2025-01-02, while Regional Model was created on 2025-04-16 and updated on 2025-04-23.

## Locations: Venues and Facilities

**Table `Location`**

| id | locationID | address | city | state | venueType | meetingId | hostsMeetingMeetingId |
|---|---|---|---|---|---|---|---|
| 1 | LOC-2154 | distributed-address-72 | integrated-city-34 | distributed-state-84 | office | 1 | 1 |
| 2 | LOC-2157 | baseline-address-73 | seasonal-city-35 | baseline-state-85 | museum | 2 | 2 |
| 3 | LOC-2160 | pilot-address-74 | regional-city-36 | pilot-state-86 | capitol | 3 | 3 |
| 4 | LOC-2163 | extended-address-75 | legacy-city-37 | extended-state-87 | community_center | 4 | 4 |

Locations represent the physical venues where meetings and committees take place. Each location has a numeric `id`, a `locationID` string (LOC-2154, LOC-2157, LOC-2160, LOC-2163), and an `address` (distributed-address-72, baseline-address-73, pilot-address-74, extended-address-75). The `city` and `state` fields (integrated-city-34 / distributed-state-84, seasonal-city-35 / baseline-state-85, etc.) provide geographic context. The `venueType` column classifies the facility as an office, museum, capitol, or community_center. The `meetingId` and `hostsMeetingMeetingId` columns link the location to the branch meeting it hosts, with both columns sharing the same value in the sample data, indicating a direct one-to-one mapping.

## Committee Meetings: Event-Level Records

**Table `CommitteeMeeting`**

| meetingId | meetingDate | startTime | durationHours | agenda | status | committeeCode | locationId |
|---|---|---|---|---|---|---|---|
| 1 | 2023-10-23T21:39:00 | regional-start-54 | 3.70 | compact-agenda-56 | scheduled | 7441158 | 1 |
| 2 | 2024-03-07T04:56:00 | legacy-start-55 | 7.40 | composite-agenda-57 | completed | 2933476 | 2 |
| 3 | 2025-08-18T11:13:00 | compact-start-56 | 11.10 | primary-agenda-58 | cancelled | 6926352 | 3 |
| 4 | 2022-01-02T18:30:00 | composite-start-57 | 14.80 | adaptive-agenda-59 | scheduled | 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 | 4 |

Committee meetings are the individual events scheduled by standing committees. The `meetingId` column (1 through 4) aligns with the branch meeting identifiers, and the `meetingDate` and `startTime` fields follow the same format as branch meetings. The `durationHours` values (3.70, 7.40, 11.10, 14.80) mirror the branch meeting durations exactly, suggesting a synchronized scheduling model. The `agenda` field (compact-agenda-56, composite-agenda-57, primary-agenda-58, adaptive-agenda-59) describes the meeting's content. The `status` column again records scheduled, completed, or cancelled states. The `committeeCode` links the meeting to its parent committee, and the `locationId` points to the venue.

## Committee-Physician Assignments

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

The CommitteePhysician table records which physicians serve on which committees. This association table bridges the Physician and Committee tables, enabling many-to-many relationships where a physician may serve on multiple committees and a committee may include multiple physicians. The table's structure supports tracking of roles, tenure, and participation status within each committee assignment.

## Committee Meeting Attendance

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

The CommitteeMeetingPhysician table records attendance at individual committee meetings. This association table links CommitteeMeeting records to Physician records, capturing who attended which meeting. It enables tracking of participation rates, quorum compliance, and attendance patterns across the committee system.

## Branch Society and Meeting Relationships

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

This view joins BranchSociety with BranchMeeting on their shared identifiers, answering the question of which meetings belong to which society. The result confirms that society 1 (Central) hosts meeting 1, society 2 (East) hosts meeting 2, and so on. Each row presents the society's geographic area alongside the meeting's date, duration, and status, providing a consolidated schedule view.

## Branch Society and Physician Relationships

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

This view links BranchSociety to Physician, revealing which physicians are associated with each branch society. The joined result shows that physician 1 (Theodore Mcgrath, active) belongs to society 1 (Central), physician 2 (Account Name, inactive) to society 2 (East), and so forth. The view surfaces the physician's years in practice and membership status alongside the society's meeting frequency and geographic area, enabling analysis of experience levels across branches.

## Branch Meeting and Society Context

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

This view reverses the perspective, starting from meetings and pulling in their parent society's details. Meeting 1 (scheduled, 3.70 hours, topic distributed-topic-60) is shown alongside society 1's branch code (Central) and geographic area (composite-geograph-15). This orientation is useful for operations teams who manage meetings and need to know the organizational context at a glance.

## Branch Meeting and Physician Attendance

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

This view connects branch meetings to their associated physicians, answering which physician is linked to each meeting. Meeting 1 (2023-10-23, extended-location-99) is paired with physician 1 (Theodore Mcgrath, 27 years in practice, active). Meeting 3 (2025-08-18, cancelled, pilot-topic-62) is paired with physician 3 (Saipan International Airport, pending status). The view supports attendance planning and conflict checking.

## Physician and Branch Society Affiliation

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

This view presents physicians alongside their branch society information, providing a practitioner-centric view of organizational membership. Physician 1 (Theodore Mcgrath, age 35, active) is shown with society 1 (Central, meeting frequency 30, geographic area composite-geograph-15). The view enables queries about which societies employ physicians of a given experience level or membership status.

## Physician and Branch Meeting Participation

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

This view links physicians to their branch meetings, showing which meetings each practitioner is associated with. Physician 2 (Account Name, inactive, 35 years in practice) is linked to meeting 2 (completed, 7.40 hours, baseline-topic-61). The view supports tracking of meeting participation by individual practitioner and can be used to identify inactive physicians who may need re-engagement.

## Physician and Committee Membership

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

This view connects physicians to their assigned committees, revealing the committee service obligations of each practitioner. Physician 1 (Theodore Mcgrath) is assigned to committee 7441158 (Composite Cluster), which meets every 30 days at location 1. Physician 4 (Norma Fisher, active, 51 years in practice) is assigned to committee 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 (Regional Model), which meets every 60 days. The view surfaces the committee's appointment month and creation date alongside the physician's membership status.

## Committee and Location Association

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

This view joins Committee with Location, showing where each standing committee convenes. Composite Cluster (committee code 7441158, meeting frequency 30) meets at location 1 (LOC-2154, distributed-address-72, integrated-city-34, venue type office). Compact Review A (2933476) meets at location 2 (LOC-2157, baseline-address-73, seasonal-city-35, museum). The view supports facility management and venue allocation analysis.

## Committee and Physician Detail

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

This view provides a detailed record of committee membership, joining Committee with CommitteePhysician and Physician. It answers which physicians serve on which committees, with what status and role. The result surfaces the committee name, meeting frequency, and appointment month alongside the physician's full name, age, years in practice, and membership status, enabling comprehensive analysis of committee composition and expertise distribution.

## Location and Branch Meeting Association

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

This view links locations to the branch meetings they host, answering which venue is used for which meeting. Location 1 (LOC-2154, office, distributed-address-72) hosts meeting 1 (2023-10-23, scheduled, distributed-topic-60). Location 3 (LOC-2160, capitol, pilot-address-74) hosts meeting 3 (2025-08-18, cancelled, pilot-topic-62). The view supports venue utilization analysis and scheduling conflict detection.

## Location and Committee Meeting Association

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

This view connects locations to committee meetings, showing which venues are used for committee events. Location 1 hosts committee meeting 1 (compact-agenda-56, scheduled, 3.70 hours) for committee 7441158 (Composite Cluster). Location 4 hosts committee meeting 4 (adaptive-agenda-59, scheduled, 14.80 hours) for committee 3e9b5c70-8fcd-11eb-924d-9cd76263cbd0 (Regional Model). The view enables analysis of venue usage patterns across both branch and committee events.

## Committee Meeting and Committee Association

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

This view joins CommitteeMeeting with Committee, linking individual meeting events to their parent standing body. Committee meeting 1 (2023-10-23, compact-agenda-56, scheduled) belongs to committee 7441158 (Composite Cluster, meeting frequency 30, appointment month 20). Committee meeting 3 (2025-08-18, primary-agenda-58, cancelled) belongs to committee 6926352 (Legacy Initiative, meeting frequency 50, appointment month 30). The view supports tracking of committee meeting completion rates and scheduling adherence.

## Committee Meeting and Location Association

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

This view connects committee meetings to their venues, showing where each committee event takes place. Committee meeting 2 (2024-03-07, composite-agenda-57, completed, 7.40 hours) is held at location 2 (LOC-2157, baseline-address-73, museum). Committee meeting 4 (2022-01-02, adaptive-agenda-59, scheduled, 14.80 hours) is held at location 4 (LOC-2163, extended-address-75, community_center). The view supports venue logistics and capacity planning for committee events.

## Committee Meeting and Physician Attendance Detail

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

This view provides the most granular attendance record, joining CommitteeMeeting with CommitteeMeetingPhysician and Physician. It answers which physicians attended which committee meetings, with what status and role. The result surfaces the meeting date, agenda, and status alongside the physician's full name, age, years in practice, and membership status, enabling detailed analysis of participation patterns, quorum compliance, and engagement levels across the committee system.

## Synthesis

The data model for regional medical governance captures a multi-layered organizational structure: branch societies anchor geographic areas and schedule meetings; physicians hold memberships in societies and committees; committees convene at fixed locations on regular frequencies; and every meeting—branch or committee—is tracked with its date, duration, topic, and attendance. The base tables store the raw records, while the joined views answer the operational questions that administrators and practitioners need: which society hosts which meeting, which physician serves on which committee, where events take place, and who attended. The consistent use of shared identifiers across tables—societyId, meetingId, physicianId, committeeCode, and locationId—ensures that any query can traverse the full chain from organization to event to participant to venue.