## Ontology-Grounded Relational Modeling in Property Assessment Administration

Property tax assessment is a domain where legal obligations, physical assets, and administrative authority intersect in tightly regulated cycles. A property owner receives an assessment notice specifying the taxable value of their parcel for a given tax year; if the owner qualifies for relief, they file a property exemption application; both processes are overseen by a Board of Assessors, whose members are appointed by a Chief Appraiser; and the Board convenes in formal meetings to adjudicate notices and exemptions. The ontology underlying this domain recognizes six principal entity types—Assessment Notice, Property Exemption, Board Meeting, Board of Assessors, Chief Appraiser, and Property Parcel—each with distinct attributes and cardinality-bounded relationships that materialize as a normalized relational schema. The following chapter explains how the conceptual model maps to tables, columns, foreign keys, and derived views.

**Table `AssessmentNotice`**

| id | noticeIdentifier | propertyType | noticePeriod | taxYear | status | issueDate | parcelLandUseCode | appraiserId |
|---|---|---|---|---|---|---|---|---|
| 100 | NOT-2678 | Real Property | 21-Day | 26 | Pending | 2023-02-01 | IVC10 | 1 |
| 101 | NOT-2679 | Personal Property | 30-Day | 36 | Submitted for Approval | 2024-07-12 | 1202-0001-S | 2 |
| 102 | NOT-2680 | Non-Homesteaded Mobile Home | 21-Day | 46 | Approved | 2025-12-23 | 82873 | 3 |
| 103 | NOT-2681 | Real Property | 30-Day | 56 | Rejected | 2022-05-07 | 1336178 | 4 |

The `AssessmentNotice` table captures the administrative act of informing a property owner of their assessed value. Its primary key `id` is a surrogate integer (values 100–103), while `noticeIdentifier` provides a human-readable code such as `NOT-2678`. The `propertyType` column distinguishes between `Real Property`, `Personal Property`, and `Non-Homesteaded Mobile Home`, reflecting the ontology's classification of taxable assets. The `noticePeriod` column constrains the owner's response window to either `21-Day` or `30-Day` intervals. The `taxYear` column stores the fiscal year as an integer (26, 36, 46, 56), and `status` tracks the lifecycle state through `Pending`, `Submitted for Approval`, `Approved`, and `Rejected`. The `issueDate` records when the notice was issued (e.g., `2023-02-01`), while `parcelLandUseCode` (such as `IVC10` or `1202-0001-S`) links the notice to a specific land-use classification. Finally, `appraiserId` is a foreign key referencing the `ChiefAppraiser` table, establishing that each notice is authored by a single appointed appraiser.

**Table `PropertyExemption`**

| exemptionId | exemptionIdentifier | exemptionType | taxYear | reductionAmount | status | applicationDate | parcelLandUseCode | assessorsId |
|---|---|---|---|---|---|---|---|---|
| 1 | EXE-2099 | Personal Property | 26 | 5.06 | Pending | 2022-05-16 | IVC10 | 1 |
| 2 | EXE-2103 | Conservation Use | 36 | 76,784 | Submitted for Approval | 2023-10-27 | 1202-0001-S | 2 |
| 3 | EXE-2107 | Homestead | 46 | 1,979 | Approved | 2024-03-11 | 82873 | 3 |
| 4 | EXE-2111 | Disability | 56 | 89.53 | Rejected | 2025-08-22 | 1336178 | 4 |

The `PropertyExemption` table models the owner's request for tax relief. Its surrogate primary key `exemptionId` (1–4) pairs with the business key `exemptionIdentifier` (e.g., `EXE-2099`). The `exemptionType` column enumerates categories including `Personal Property`, `Conservation Use`, `Homestead`, and `Disability`, each corresponding to a distinct statutory relief program. The `taxYear` column again anchors the exemption to a fiscal period, while `reductionAmount` quantifies the monetary benefit (ranging from `5.06` to `76,784`). The `status` column mirrors the assessment notice lifecycle with the same four states. The `applicationDate` records when the owner submitted the request (e.g., `2022-05-16`), and `parcelLandUseCode` provides a secondary land-use reference. The `assessorsId` column is a foreign key to `BoardOfAssessors`, indicating which board reviews the exemption.

**Table `BoardMeeting`**

| id | meetingIdentifier | meetingDate | meetingType | status | quorumPresent | noticeId | exemptionId | assessorsId |
|---|---|---|---|---|---|---|---|---|
| 1 | MEE-2370 | 2023-10-23T21:39:00 | Regular | Scheduled | true | 100 | 1 | 1 |
| 2 | MEE-2377 | 2024-03-07T04:56:00 | Special | In Progress | false | 101 | 2 | 2 |
| 3 | MEE-2384 | 2025-08-18T11:13:00 | Executive Session | Concluded | true | 102 | 3 | 3 |
| 4 | MEE-2391 | 2022-01-02T18:30:00 | Regular | Adjourned | false | 103 | 4 | 4 |

The `BoardMeeting` table records formal gatherings of the Board of Assessors. Its surrogate key `id` (1–4) pairs with `meetingIdentifier` (e.g., `MEE-2370`). The `meetingDate` column stores ISO-8601 timestamps such as `2023-10-23T21:39:00`, while `meetingType` distinguishes `Regular`, `Special`, and `Executive Session` meetings. The `status` column tracks the meeting's progress through `Scheduled`, `In Progress`, `Concluded`, and `Adjourned`. The `quorumPresent` boolean indicates whether a法定 quorum was achieved. Critically, `BoardMeeting` carries three foreign keys: `noticeId` references `AssessmentNotice`, `exemptionId` references `PropertyExemption`, and `assessorsId` references `BoardOfAssessors`. This design encodes the domain fact that each meeting adjudicates a specific notice and exemption under the authority of a specific board.

**Table `BoardOfAssessors`**

| id | boardIdentifier | jurisdiction | establishedDate | currentSession | meetingId | appraiserId |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | regional-jurisdic-30 | 2024-03-27 | compact-current-20 | 1 | 1 |
| 2 | BOA-2652 | legacy-jurisdic-31 | 2025-08-11 | composite-current-21 | 2 | 2 |
| 3 | BOA-2653 | compact-jurisdic-32 | 2022-01-22 | primary-current-22 | 3 | 3 |
| 4 | BOA-2654 | composite-jurisdic-33 | 2023-06-06 | adaptive-current-23 | 4 | 4 |

The `BoardOfAssessors` table represents the governing body responsible for review and adjudication. Its surrogate key `id` (1–4) pairs with `boardIdentifier` (e.g., `BOA-2651`). The `jurisdiction` column identifies the geographic scope (e.g., `regional-jurisdic-30`, `legacy-jurisdic-31`), while `establishedDate` records when the board was constituted (e.g., `2024-03-27`). The `currentSession` column stores a session descriptor such as `compact-current-20`. The `meetingId` foreign key references `BoardMeeting`, and `appraiserId` references `ChiefAppraiser`, establishing that each board is associated with a specific meeting and overseen by a specific appraiser.

**Table `ChiefAppraiser`**

| appraiserId | appraiserIdentifier | appointmentDate | currentTermEnd | officeLocation | noticeId | exemptionId | assessorsId |
|---|---|---|---|---|---|---|---|
| 1 | APP-2799 | 2022-05-03 | 2023-06-08 | composite-office-99 | 100 | 1 | 1 |
| 2 | APP-2803 | 2023-10-14 | 2024-11-19 | primary-office-100 | 101 | 2 | 2 |
| 3 | APP-2807 | 2024-03-25 | 2025-04-03 | adaptive-office-101 | 102 | 3 | 3 |
| 4 | APP-2811 | 2025-08-09 | 2022-09-14 | distributed-office-102 | 103 | 4 | 4 |

The `ChiefAppraiser` table models the appointed official who oversees assessment operations. Its surrogate key `appraiserId` (1–4) pairs with `appraiserIdentifier` (e.g., `APP-2799`). The `appointmentDate` records when the official was appointed (e.g., `2022-05-03`), and `currentTermEnd` specifies the term's expiration (e.g., `2023-06-08`). The `officeLocation` column identifies the physical office (e.g., `composite-office-99`). The table carries three foreign keys: `noticeId` references `AssessmentNotice`, `exemptionId` references `PropertyExemption`, and `assessorsId` references `BoardOfAssessors`, encoding the appraiser's operational relationships to notices, exemptions, and boards.

**Table `PropertyParcel`**

| parcelIdentifier | address | landUseCode | assessedValue | taxYear | isHomesteaded | noticeId | exemptionId |
|---|---|---|---|---|---|---|---|
| PAR-2364 | distributed-address-72 | IVC10 | 4.70 | 26 | false | 100 | 1 |
| PAR-2368 | baseline-address-73 | 1202-0001-S | 8.40 | 36 | true | 101 | 2 |
| PAR-2372 | pilot-address-74 | 82873 | 12.10 | 46 | false | 102 | 3 |
| PAR-2376 | extended-address-75 | 1336178 | 15.80 | 56 | true | 103 | 4 |

The `PropertyParcel` table represents the physical asset being assessed. Its business key `parcelIdentifier` (e.g., `PAR-2364`) serves as the primary key. The `address` column stores the property location (e.g., `distributed-address-72`), and `landUseCode` (e.g., `IVC10`, `1202-0001-S`) classifies the parcel's use. The `assessedValue` column records the monetary valuation (ranging from `4.70` to `15.80`), and `taxYear` anchors the assessment to a fiscal period. The `isHomesteaded` boolean indicates whether the property qualifies for homestead protection. The table carries two foreign keys: `noticeId` references `AssessmentNotice` and `exemptionId` references `PropertyExemption`, linking each parcel to its corresponding notice and exemption records.

The schema's normalization strategy distributes domain facts across six tables, with foreign keys encoding the ontology's relationship axioms. The `AssessmentNotice` table's `appraiserId` column creates a many-to-one relationship with `ChiefAppraiser`, meaning each notice is authored by exactly one appraiser. The `PropertyExemption` table's `assessorsId` column creates a many-to-one relationship with `BoardOfAssessors`. The `BoardMeeting` table is the most connected entity, carrying foreign keys to all three of `AssessmentNotice`, `PropertyExemption`, and `BoardOfAssessors`, which reflects the domain rule that a meeting simultaneously adjudicates a notice and an exemption under a board's authority. The `BoardOfAssessors` table's `meetingId` and `appraiserId` columns create relationships back to `BoardMeeting` and `ChiefAppraiser` respectively. The `ChiefAppraiser` table's three foreign keys (`noticeId`, `exemptionId`, `assessorsId`) create relationships to `AssessmentNotice`, `PropertyExemption`, and `BoardOfAssessors`. The `PropertyParcel` table's two foreign keys (`noticeId`, `exemptionId`) link parcels to their corresponding notices and exemptions.

The views materialize the most common join patterns as virtual tables, each answering a specific domain question by reconstructing a fact from the normalized tables.

**View `vw_assessment_notice_property_parcel`**

```sql
CREATE VIEW vw_assessment_notice_property_parcel AS
SELECT a.id, a.noticeIdentifier, a.propertyType, a.noticePeriod, b.parcelIdentifier AS parcel_parcelIdentifier, b.address AS parcel_address, b.landUseCode AS parcel_landUseCode
FROM AssessmentNotice a JOIN PropertyParcel b ON a.parcelLandUseCode = b.landUseCode;
```

| id | noticeIdentifier | propertyType | noticePeriod | parcel_parcelIdentifier | parcel_address | parcel_landUseCode |
|---|---|---|---|---|---|---|
| 100 | NOT-2678 | Real Property | 21-Day | PAR-2364 | distributed-address-72 | IVC10 |
| 101 | NOT-2679 | Personal Property | 30-Day | PAR-2368 | baseline-address-73 | 1202-0001-S |
| 102 | NOT-2680 | Non-Homesteaded Mobile Home | 21-Day | PAR-2372 | pilot-address-74 | 82873 |
| 103 | NOT-2681 | Real Property | 30-Day | PAR-2376 | extended-address-75 | 1336178 |

This view joins `AssessmentNotice` with `PropertyParcel` on the `noticeId` column, answering the question: "Which property parcel is associated with a given assessment notice?" A representative row links notice `NOT-2678` (property type `Real Property`, status `Pending`) with parcel `PAR-2364` (address `distributed-address-72`, assessed value `4.70`, land use code `IVC10`). This join reconstructs the domain fact that a specific parcel's assessed value is communicated to the owner through a specific notice.

**View `vw_assessment_notice_chief_appraiser`**

```sql
CREATE VIEW vw_assessment_notice_chief_appraiser AS
SELECT a.id, a.noticeIdentifier, a.propertyType, a.noticePeriod, b.appraiserId AS appraiser_appraiserId, b.appraiserIdentifier AS appraiser_appraiserIdentifier, b.appointmentDate AS appraiser_appointmentDate
FROM AssessmentNotice a JOIN ChiefAppraiser b ON a.appraiserId = b.appraiserId;
```

| id | noticeIdentifier | propertyType | noticePeriod | appraiser_appraiserId | appraiser_appraiserIdentifier | appraiser_appointmentDate |
|---|---|---|---|---|---|---|
| 100 | NOT-2678 | Real Property | 21-Day | 1 | APP-2799 | 2022-05-03 |
| 101 | NOT-2679 | Personal Property | 30-Day | 2 | APP-2803 | 2023-10-14 |
| 102 | NOT-2680 | Non-Homesteaded Mobile Home | 21-Day | 3 | APP-2807 | 2024-03-25 |
| 103 | NOT-2681 | Real Property | 30-Day | 4 | APP-2811 | 2025-08-09 |

This view joins `AssessmentNotice` with `ChiefAppraiser` on the `appraiserId` column, answering: "Which chief appraiser authored a given assessment notice?" A representative row links notice `NOT-2678` with appraiser `APP-2799` (appointed `2022-05-03`, office `composite-office-99`). This join reconstructs the accountability chain from notice back to the responsible official.

**View `vw_property_exemption_property_parcel`**

```sql
CREATE VIEW vw_property_exemption_property_parcel AS
SELECT a.exemptionId, a.exemptionIdentifier, a.exemptionType, a.taxYear, b.parcelIdentifier AS parcel_parcelIdentifier, b.address AS parcel_address, b.landUseCode AS parcel_landUseCode
FROM PropertyExemption a JOIN PropertyParcel b ON a.parcelLandUseCode = b.landUseCode;
```

| exemptionId | exemptionIdentifier | exemptionType | taxYear | parcel_parcelIdentifier | parcel_address | parcel_landUseCode |
|---|---|---|---|---|---|---|
| 1 | EXE-2099 | Personal Property | 26 | PAR-2364 | distributed-address-72 | IVC10 |
| 2 | EXE-2103 | Conservation Use | 36 | PAR-2368 | baseline-address-73 | 1202-0001-S |
| 3 | EXE-2107 | Homestead | 46 | PAR-2372 | pilot-address-74 | 82873 |
| 4 | EXE-2111 | Disability | 56 | PAR-2376 | extended-address-75 | 1336178 |

This view joins `PropertyExemption` with `PropertyParcel` on the `exemptionId` column, answering: "Which property parcel is the subject of a given exemption application?" A representative row links exemption `EXE-2099` (type `Personal Property`, reduction amount `5.06`) with parcel `PAR-2364` (assessed value `4.70`, homestead status `false`). This join reconstructs the relationship between the relief request and the underlying asset.

**View `vw_property_exemption_board_of_assessors`**

```sql
CREATE VIEW vw_property_exemption_board_of_assessors AS
SELECT a.exemptionId, a.exemptionIdentifier, a.exemptionType, a.taxYear, b.id AS assessors_id, b.boardIdentifier AS assessors_boardIdentifier, b.jurisdiction AS assessors_jurisdiction
FROM PropertyExemption a JOIN BoardOfAssessors b ON a.assessorsId = b.id;
```

| exemptionId | exemptionIdentifier | exemptionType | taxYear | assessors_id | assessors_boardIdentifier | assessors_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | EXE-2099 | Personal Property | 26 | 1 | BOA-2651 | regional-jurisdic-30 |
| 2 | EXE-2103 | Conservation Use | 36 | 2 | BOA-2652 | legacy-jurisdic-31 |
| 3 | EXE-2107 | Homestead | 46 | 3 | BOA-2653 | compact-jurisdic-32 |
| 4 | EXE-2111 | Disability | 56 | 4 | BOA-2654 | composite-jurisdic-33 |

This view joins `PropertyExemption` with `BoardOfAssessors` on the `assessorsId` column, answering: "Which board reviews a given exemption application?" A representative row links exemption `EXE-2099` with board `BOA-2651` (jurisdiction `regional-jurisdic-30`, established `2024-03-27`). This join reconstructs the governance relationship between exemption applications and their reviewing authority.

**View `vw_board_meeting_assessment_notice`**

```sql
CREATE VIEW vw_board_meeting_assessment_notice AS
SELECT a.id, a.meetingIdentifier, a.meetingDate, a.meetingType, b.id AS notice_id, b.noticeIdentifier AS notice_noticeIdentifier, b.propertyType AS notice_propertyType
FROM BoardMeeting a JOIN AssessmentNotice b ON a.noticeId = b.id;
```

| id | meetingIdentifier | meetingDate | meetingType | notice_id | notice_noticeIdentifier | notice_propertyType |
|---|---|---|---|---|---|---|
| 1 | MEE-2370 | 2023-10-23T21:39:00 | Regular | 100 | NOT-2678 | Real Property |
| 2 | MEE-2377 | 2024-03-07T04:56:00 | Special | 101 | NOT-2679 | Personal Property |
| 3 | MEE-2384 | 2025-08-18T11:13:00 | Executive Session | 102 | NOT-2680 | Non-Homesteaded Mobile Home |
| 4 | MEE-2391 | 2022-01-02T18:30:00 | Regular | 103 | NOT-2681 | Real Property |

This view joins `BoardMeeting` with `AssessmentNotice` on the `noticeId` column, answering: "Which assessment notice is being adjudicated at a given board meeting?" A representative row links meeting `MEE-2370` (type `Regular`, status `Scheduled`, quorum `true`) with notice `NOT-2678` (property type `Real Property`, status `Pending`). This join reconstructs the adjudication context for each notice.

**View `vw_board_meeting_property_exemption`**

```sql
CREATE VIEW vw_board_meeting_property_exemption AS
SELECT a.id, a.meetingIdentifier, a.meetingDate, a.meetingType, b.exemptionId AS exemption_exemptionId, b.exemptionIdentifier AS exemption_exemptionIdentifier, b.exemptionType AS exemption_exemptionType
FROM BoardMeeting a JOIN PropertyExemption b ON a.exemptionId = b.exemptionId;
```

| id | meetingIdentifier | meetingDate | meetingType | exemption_exemptionId | exemption_exemptionIdentifier | exemption_exemptionType |
|---|---|---|---|---|---|---|
| 1 | MEE-2370 | 2023-10-23T21:39:00 | Regular | 1 | EXE-2099 | Personal Property |
| 2 | MEE-2377 | 2024-03-07T04:56:00 | Special | 2 | EXE-2103 | Conservation Use |
| 3 | MEE-2384 | 2025-08-18T11:13:00 | Executive Session | 3 | EXE-2107 | Homestead |
| 4 | MEE-2391 | 2022-01-02T18:30:00 | Regular | 4 | EXE-2111 | Disability |

This view joins `BoardMeeting` with `PropertyExemption` on the `exemptionId` column, answering: "Which exemption application is being adjudicated at a given board meeting?" A representative row links meeting `MEE-2370` with exemption `EXE-2099` (type `Personal Property`, reduction amount `5.06`). This join reconstructs the exemption-side of the adjudication context.

**View `vw_board_meeting_board_of_assessors`**

```sql
CREATE VIEW vw_board_meeting_board_of_assessors AS
SELECT a.id, a.meetingIdentifier, a.meetingDate, a.meetingType, b.id AS assessors_id, b.boardIdentifier AS assessors_boardIdentifier, b.jurisdiction AS assessors_jurisdiction
FROM BoardMeeting a JOIN BoardOfAssessors b ON a.assessorsId = b.id;
```

| id | meetingIdentifier | meetingDate | meetingType | assessors_id | assessors_boardIdentifier | assessors_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | MEE-2370 | 2023-10-23T21:39:00 | Regular | 1 | BOA-2651 | regional-jurisdic-30 |
| 2 | MEE-2377 | 2024-03-07T04:56:00 | Special | 2 | BOA-2652 | legacy-jurisdic-31 |
| 3 | MEE-2384 | 2025-08-18T11:13:00 | Executive Session | 3 | BOA-2653 | compact-jurisdic-32 |
| 4 | MEE-2391 | 2022-01-02T18:30:00 | Regular | 4 | BOA-2654 | composite-jurisdic-33 |

This view joins `BoardMeeting` with `BoardOfAssessors` on the `assessorsId` column, answering: "Which board convenes for a given meeting?" A representative row links meeting `MEE-2370` with board `BOA-2651` (jurisdiction `regional-jurisdic-30`). This join reconstructs the authority under which each meeting operates.

**View `vw_board_of_assessors_board_meeting`**

```sql
CREATE VIEW vw_board_of_assessors_board_meeting AS
SELECT a.id, a.boardIdentifier, a.jurisdiction, a.establishedDate, b.id AS meeting_id, b.meetingIdentifier AS meeting_meetingIdentifier, b.meetingDate AS meeting_meetingDate
FROM BoardOfAssessors a JOIN BoardMeeting b ON a.meetingId = b.id;
```

| id | boardIdentifier | jurisdiction | establishedDate | meeting_id | meeting_meetingIdentifier | meeting_meetingDate |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | regional-jurisdic-30 | 2024-03-27 | 1 | MEE-2370 | 2023-10-23T21:39:00 |
| 2 | BOA-2652 | legacy-jurisdic-31 | 2025-08-11 | 2 | MEE-2377 | 2024-03-07T04:56:00 |
| 3 | BOA-2653 | compact-jurisdic-32 | 2022-01-22 | 3 | MEE-2384 | 2025-08-18T11:13:00 |
| 4 | BOA-2654 | composite-jurisdic-33 | 2023-06-06 | 4 | MEE-2391 | 2022-01-02T18:30:00 |

This view joins `BoardOfAssessors` with `BoardMeeting` on the `meetingId` column, answering the inverse question: "Which meeting is associated with a given board?" A representative row links board `BOA-2651` with meeting `MEE-2370` (date `2023-10-23T21:39:00`, type `Regular`). This join reconstructs the board's meeting schedule from the board's perspective.

**View `vw_board_of_assessors_chief_appraiser`**

```sql
CREATE VIEW vw_board_of_assessors_chief_appraiser AS
SELECT a.id, a.boardIdentifier, a.jurisdiction, a.establishedDate, b.appraiserId AS appraiser_appraiserId, b.appraiserIdentifier AS appraiser_appraiserIdentifier, b.appointmentDate AS appraiser_appointmentDate
FROM BoardOfAssessors a JOIN ChiefAppraiser b ON a.appraiserId = b.appraiserId;
```

| id | boardIdentifier | jurisdiction | establishedDate | appraiser_appraiserId | appraiser_appraiserIdentifier | appraiser_appointmentDate |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | regional-jurisdic-30 | 2024-03-27 | 1 | APP-2799 | 2022-05-03 |
| 2 | BOA-2652 | legacy-jurisdic-31 | 2025-08-11 | 2 | APP-2803 | 2023-10-14 |
| 3 | BOA-2653 | compact-jurisdic-32 | 2022-01-22 | 3 | APP-2807 | 2024-03-25 |
| 4 | BOA-2654 | composite-jurisdic-33 | 2023-06-06 | 4 | APP-2811 | 2025-08-09 |

This view joins `BoardOfAssessors` with `ChiefAppraiser` on the `appraiserId` column, answering: "Which chief appraiser oversees a given board?" A representative row links board `BOA-2651` with appraiser `APP-2799` (appointed `2022-05-03`, term end `2023-06-08`). This join reconstructs the oversight relationship between boards and their supervising appraiser.

**View `vw_chief_appraiser_assessment_notice`**

```sql
CREATE VIEW vw_chief_appraiser_assessment_notice AS
SELECT a.appraiserId, a.appraiserIdentifier, a.appointmentDate, a.currentTermEnd, b.id AS notice_id, b.noticeIdentifier AS notice_noticeIdentifier, b.propertyType AS notice_propertyType
FROM ChiefAppraiser a JOIN AssessmentNotice b ON a.noticeId = b.id;
```

| appraiserId | appraiserIdentifier | appointmentDate | currentTermEnd | notice_id | notice_noticeIdentifier | notice_propertyType |
|---|---|---|---|---|---|---|
| 1 | APP-2799 | 2022-05-03 | 2023-06-08 | 100 | NOT-2678 | Real Property |
| 2 | APP-2803 | 2023-10-14 | 2024-11-19 | 101 | NOT-2679 | Personal Property |
| 3 | APP-2807 | 2024-03-25 | 2025-04-03 | 102 | NOT-2680 | Non-Homesteaded Mobile Home |
| 4 | APP-2811 | 2025-08-09 | 2022-09-14 | 103 | NOT-2681 | Real Property |

This view joins `ChiefAppraiser` with `AssessmentNotice` on the `noticeId` column, answering: "Which assessment notice is associated with a given chief appraiser?" A representative row links appraiser `APP-2799` with notice `NOT-2678` (property type `Real Property`, issue date `2023-02-01`). This join reconstructs the appraiser's portfolio of notices.

**View `vw_chief_appraiser_property_exemption`**

```sql
CREATE VIEW vw_chief_appraiser_property_exemption AS
SELECT a.appraiserId, a.appraiserIdentifier, a.appointmentDate, a.currentTermEnd, b.exemptionId AS exemption_exemptionId, b.exemptionIdentifier AS exemption_exemptionIdentifier, b.exemptionType AS exemption_exemptionType
FROM ChiefAppraiser a JOIN PropertyExemption b ON a.exemptionId = b.exemptionId;
```

| appraiserId | appraiserIdentifier | appointmentDate | currentTermEnd | exemption_exemptionId | exemption_exemptionIdentifier | exemption_exemptionType |
|---|---|---|---|---|---|---|
| 1 | APP-2799 | 2022-05-03 | 2023-06-08 | 1 | EXE-2099 | Personal Property |
| 2 | APP-2803 | 2023-10-14 | 2024-11-19 | 2 | EXE-2103 | Conservation Use |
| 3 | APP-2807 | 2024-03-25 | 2025-04-03 | 3 | EXE-2107 | Homestead |
| 4 | APP-2811 | 2025-08-09 | 2022-09-14 | 4 | EXE-2111 | Disability |

This view joins `ChiefAppraiser` with `PropertyExemption` on the `exemptionId` column, answering: "Which exemption application is associated with a given chief appraiser?" A representative row links appraiser `APP-2799` with exemption `EXE-2099` (type `Personal Property`, reduction amount `5.06`). This join reconstructs the appraiser's oversight of exemption applications.

**View `vw_chief_appraiser_board_of_assessors`**

```sql
CREATE VIEW vw_chief_appraiser_board_of_assessors AS
SELECT a.appraiserId, a.appraiserIdentifier, a.appointmentDate, a.currentTermEnd, b.id AS assessors_id, b.boardIdentifier AS assessors_boardIdentifier, b.jurisdiction AS assessors_jurisdiction
FROM ChiefAppraiser a JOIN BoardOfAssessors b ON a.assessorsId = b.id;
```

| appraiserId | appraiserIdentifier | appointmentDate | currentTermEnd | assessors_id | assessors_boardIdentifier | assessors_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | APP-2799 | 2022-05-03 | 2023-06-08 | 1 | BOA-2651 | regional-jurisdic-30 |
| 2 | APP-2803 | 2023-10-14 | 2024-11-19 | 2 | BOA-2652 | legacy-jurisdic-31 |
| 3 | APP-2807 | 2024-03-25 | 2025-04-03 | 3 | BOA-2653 | compact-jurisdic-32 |
| 4 | APP-2811 | 2025-08-09 | 2022-09-14 | 4 | BOA-2654 | composite-jurisdic-33 |

This view joins `ChiefAppraiser` with `BoardOfAssessors` on the `assessorsId` column, answering: "Which board is overseen by a given chief appraiser?" A representative row links appraiser `APP-2799` with board `BOA-2651` (jurisdiction `regional-jurisdic-30`). This join reconstructs the appraiser's governance responsibilities.

**View `vw_property_parcel_assessment_notice`**

```sql
CREATE VIEW vw_property_parcel_assessment_notice AS
SELECT a.parcelIdentifier, a.address, a.landUseCode, a.assessedValue, b.id AS notice_id, b.noticeIdentifier AS notice_noticeIdentifier, b.propertyType AS notice_propertyType
FROM PropertyParcel a JOIN AssessmentNotice b ON a.noticeId = b.id;
```

| parcelIdentifier | address | landUseCode | assessedValue | notice_id | notice_noticeIdentifier | notice_propertyType |
|---|---|---|---|---|---|---|
| PAR-2364 | distributed-address-72 | IVC10 | 4.70 | 100 | NOT-2678 | Real Property |
| PAR-2368 | baseline-address-73 | 1202-0001-S | 8.40 | 101 | NOT-2679 | Personal Property |
| PAR-2372 | pilot-address-74 | 82873 | 12.10 | 102 | NOT-2680 | Non-Homesteaded Mobile Home |
| PAR-2376 | extended-address-75 | 1336178 | 15.80 | 103 | NOT-2681 | Real Property |

This view joins `PropertyParcel` with `AssessmentNotice` on the `noticeId` column, answering the inverse question: "Which assessment notice corresponds to a given property parcel?" A representative row links parcel `PAR-2364` (address `distributed-address-72`, assessed value `4.70`) with notice `NOT-2678` (property type `Real Property`, status `Pending`). This join reconstructs the notice from the parcel's perspective.

**View `vw_property_parcel_property_exemption`**

```sql
CREATE VIEW vw_property_parcel_property_exemption AS
SELECT a.parcelIdentifier, a.address, a.landUseCode, a.assessedValue, b.exemptionId AS exemption_exemptionId, b.exemptionIdentifier AS exemption_exemptionIdentifier, b.exemptionType AS exemption_exemptionType
FROM PropertyParcel a JOIN PropertyExemption b ON a.exemptionId = b.exemptionId;
```

| parcelIdentifier | address | landUseCode | assessedValue | exemption_exemptionId | exemption_exemptionIdentifier | exemption_exemptionType |
|---|---|---|---|---|---|---|
| PAR-2364 | distributed-address-72 | IVC10 | 4.70 | 1 | EXE-2099 | Personal Property |
| PAR-2368 | baseline-address-73 | 1202-0001-S | 8.40 | 2 | EXE-2103 | Conservation Use |
| PAR-2372 | pilot-address-74 | 82873 | 12.10 | 3 | EXE-2107 | Homestead |
| PAR-2376 | extended-address-75 | 1336178 | 15.80 | 4 | EXE-2111 | Disability |

This view joins `PropertyParcel` with `PropertyExemption` on the `exemptionId` column, answering the inverse question: "Which exemption application corresponds to a given property parcel?" A representative row links parcel `PAR-2364` with exemption `EXE-2099` (type `Personal Property`, reduction amount `5.06`). This join reconstructs the exemption from the parcel's perspective.

The schema design reflects a deliberate trade-off between normalization and query convenience. The six base tables are in at least third normal form, eliminating redundant storage of identifiers, dates, and status values. Foreign keys enforce referential integrity across the ontology's relationship axioms: every assessment notice is authored by a chief appraiser, every exemption is reviewed by a board of assessors, every board meeting adjudicates a specific notice and exemption, and every property parcel is linked to its corresponding notice and exemption. The fourteen views materialize the most common join paths as virtual tables, allowing analysts to reconstruct domain facts—such as the full adjudication context of a meeting or the complete assessment history of a parcel—without repeating join logic. This architecture ensures that the relational schema remains a faithful, queryable reflection of the property assessment ontology, where each table, column, and view corresponds to a well-defined concept or relationship in the domain.