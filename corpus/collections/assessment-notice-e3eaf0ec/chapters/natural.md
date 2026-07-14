## The Assessment Record

**Table `AssessmentNotice`**

| id | noticeIdentifier | propertyType | noticePeriod | taxYear | status | issueDate | parcelLandUseCode | appraiserId |
|---|---|---|---|---|---|---|---|---|
| 100 | NOT-2678 | Real Property | 21-Day | 26 | Pending | 2023-02-01 | IVC10 | 1 |
| 101 | NOT-2679 | Personal Property | 30-Day | 36 | Submitted for Approval | 2024-07-12 | 1202-0001-S | 2 |
| 102 | NOT-2680 | Non-Homesteaded Mobile Home | 21-Day | 46 | Approved | 2025-12-23 | 82873 | 3 |
| 103 | NOT-2681 | Real Property | 30-Day | 56 | Rejected | 2022-05-07 | 1336178 | 4 |

Every property tax cycle begins with the issuance of an assessment notice, a formal document that communicates the appraised value of a parcel to its owner. The notice carries a unique identifier such as NOT-2678, NOT-2679, NOT-2680, or NOT-2681, and classifies the underlying asset by property type—Real Property, Personal Property, Non-Homesteaded Mobile Home, or other categories. The notice period, typically 21-Day or 30-Day, defines the window during which the property owner may contest the valuation. Each notice is tied to a specific tax year, ranging from 26 through 56 in the current dataset, and progresses through a lifecycle of statuses: Pending, Submitted for Approval, Approved, or Rejected. The issuing appraiser is tracked via the appraiserId foreign key, and the parcel's land use code—such as IVC10, 1202-0001-S, 82873, or 1336178—anchors the notice to the physical parcel on the ground.

## Property Parcels and Valuation

**Table `PropertyParcel`**

| parcelIdentifier | address | landUseCode | assessedValue | taxYear | isHomesteaded | noticeId | exemptionId |
|---|---|---|---|---|---|---|---|
| PAR-2364 | distributed-address-72 | IVC10 | 4.70 | 26 | false | 100 | 1 |
| PAR-2368 | baseline-address-73 | 1202-0001-S | 8.40 | 36 | true | 101 | 2 |
| PAR-2372 | pilot-address-74 | 82873 | 12.10 | 46 | false | 102 | 3 |
| PAR-2376 | extended-address-75 | 1336178 | 15.80 | 56 | true | 103 | 4 |

A property parcel represents the fundamental unit of assessment: a defined tract of land or structure with a measurable assessed value. The parcel table stores the parcel identifier (PAR-2364, PAR-2368, PAR-2372, PAR-2376), the physical address (distributed-address-72, baseline-address-73, pilot-address-74, extended-address-75), and the land use code that determines applicable tax treatment. The assessed value—4.70, 8.40, 12.10, and 15.80 in the current records—reflects the appraiser's estimate of fair market value for the given tax year. The isHomesteaded flag indicates whether the property qualifies for homestead protections, which directly affects exemption eligibility. Each parcel is linked to its originating assessment notice and any associated exemption through the noticeId and exemptionId columns.

## Exemptions and Relief

**Table `PropertyExemption`**

| exemptionId | exemptionIdentifier | exemptionType | taxYear | reductionAmount | status | applicationDate | parcelLandUseCode | assessorsId |
|---|---|---|---|---|---|---|---|---|
| 1 | EXE-2099 | Personal Property | 26 | 5.06 | Pending | 2022-05-16 | IVC10 | 1 |
| 2 | EXE-2103 | Conservation Use | 36 | 76,784 | Submitted for Approval | 2023-10-27 | 1202-0001-S | 2 |
| 3 | EXE-2107 | Homestead | 46 | 1,979 | Approved | 2024-03-11 | 82873 | 3 |
| 4 | EXE-2111 | Disability | 56 | 89.53 | Rejected | 2025-08-22 | 1336178 | 4 |

Property tax exemptions reduce the taxable value of a parcel, providing relief for specific categories of property or property owners. The exemption table records each exemption with a unique identifier (EXE-2099, EXE-2103, EXE-2107, EXE-2111) and type—Personal Property, Conservation Use, Homestead, or Disability. The reductionAmount column quantifies the dollar value subtracted from the assessed value, ranging from modest reductions like 5.06 for EXE-2099 to substantial relief of 76,784 for the Conservation Use exemption EXE-2103. Each exemption carries a status (Pending, Submitted for Approval, Approved, Rejected) and an applicationDate that establishes the timeline for review. The assessorsId column routes the exemption to the appropriate Board of Assessors member for processing.

## The Chief Appraiser's Office

**Table `ChiefAppraiser`**

| appraiserId | appraiserIdentifier | appointmentDate | currentTermEnd | officeLocation | noticeId | exemptionId | assessorsId |
|---|---|---|---|---|---|---|---|
| 1 | APP-2799 | 2022-05-03 | 2023-06-08 | composite-office-99 | 100 | 1 | 1 |
| 2 | APP-2803 | 2023-10-14 | 2024-11-19 | primary-office-100 | 101 | 2 | 2 |
| 3 | APP-2807 | 2024-03-25 | 2025-04-03 | adaptive-office-101 | 102 | 3 | 3 |
| 4 | APP-2811 | 2025-08-09 | 2022-09-14 | distributed-office-102 | 103 | 4 | 4 |

The Chief Appraiser is the official responsible for valuing all taxable property within a jurisdiction. Each appraiser record includes an identifier (APP-2799, APP-2803, APP-2807, APP-2811), an appointmentDate marking the start of their tenure, and a currentTermEnd date that defines the expiration of their authority. The officeLocation—composite-office-99, primary-office-100, adaptive-office-101, distributed-office-102—indicates the physical base of operations. The appraiser's workload is tracked through the noticeId, exemptionId, and assessorsId columns, which link each Chief Appraiser to the specific notices they issue, exemptions they process, and the Board of Assessors they serve.

## Board of Assessors

**Table `BoardOfAssessors`**

| id | boardIdentifier | jurisdiction | establishedDate | currentSession | meetingId | appraiserId |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | regional-jurisdic-30 | 2024-03-27 | compact-current-20 | 1 | 1 |
| 2 | BOA-2652 | legacy-jurisdic-31 | 2025-08-11 | composite-current-21 | 2 | 2 |
| 3 | BOA-2653 | compact-jurisdic-32 | 2022-01-22 | primary-current-22 | 3 | 3 |
| 4 | BOA-2654 | composite-jurisdic-33 | 2023-06-06 | adaptive-current-23 | 4 | 4 |

The Board of Assessors is the quasi-judicial body that hears appeals of property valuations and exemption denials. Each board is identified by a unique code (BOA-2651, BOA-2652, BOA-2653, BOA-2654) and operates within a defined jurisdiction—regional-jurisdic-30, legacy-jurisdic-31, compact-jurisdic-32, composite-jurisdic-33. The establishedDate records when the board was constituted, while the currentSession field (compact-current-20, composite-current-21, primary-current-22, adaptive-current-23) tracks the active session designation. The meetingId column links the board to its scheduled meetings, and the appraiserId column identifies the Chief Appraiser assigned to support the board's work.

## Board Meetings

**Table `BoardMeeting`**

| id | meetingIdentifier | meetingDate | meetingType | status | quorumPresent | noticeId | exemptionId | assessorsId |
|---|---|---|---|---|---|---|---|---|
| 1 | MEE-2370 | 2023-10-23T21:39:00 | Regular | Scheduled | true | 100 | 1 | 1 |
| 2 | MEE-2377 | 2024-03-07T04:56:00 | Special | In Progress | false | 101 | 2 | 2 |
| 3 | MEE-2384 | 2025-08-18T11:13:00 | Executive Session | Concluded | true | 102 | 3 | 3 |
| 4 | MEE-2391 | 2022-01-02T18:30:00 | Regular | Adjourned | false | 103 | 4 | 4 |

Board meetings are the formal proceedings where assessment appeals and exemption disputes are resolved. Each meeting carries an identifier (MEE-2370, MEE-2377, MEE-2384, MEE-2391) and a meetingDate with precise timestamp information. Meetings are classified by type—Regular, Special, Executive Session—and progress through statuses: Scheduled, In Progress, Concluded, or Adjourned. The quorumPresent flag indicates whether the required number of board members was present to conduct binding business. Each meeting is associated with a specific assessment notice, property exemption, and Board of Assessors through the noticeId, exemptionId, and assessorsId columns, creating a complete audit trail from initial notice through final determination.

## Tracing Assessments to Parcels

The view vw_assessment_notice_property_parcel joins the assessment notice with its underlying property parcel, answering the question: which physical parcel does a given notice concern, and what is its assessed value? In the joined result, row NOT-2678 links to parcel PAR-2364 at distributed-address-72 with land use code IVC10 and an assessed value of 4.70 for tax year 26. Row NOT-2679 connects to PAR-2368 at baseline-address-73, land use 1202-0001-S, valued at 8.40 for tax year 36. This view is essential for auditors verifying that the notice issued matches the parcel actually being valued.

The complementary view vw_property_parcel_assessment_notice reverses the perspective, starting from the parcel and showing the associated notice. Parcel PAR-2364 (IVC10, value 4.70, non-homesteaded) is linked to notice NOT-2678 issued on 2023-02-01 with status Pending. Parcel PAR-2368 (1202-0001-S, value 8.40, homesteaded) connects to notice NOT-2679 issued on 2024-07-12 with status Submitted for Approval. This orientation supports parcel-centric queries, such as identifying all notices affecting a given tract.

The view vw_property_parcel_property_exemption connects parcels to their exemptions, revealing which properties receive tax relief. Parcel PAR-2364 (value 4.70, non-homesteaded) is associated with exemption EXE-2099, a Personal Property exemption with a reduction of 5.06. Parcel PAR-2368 (value 8.40, homesteaded) carries exemption EXE-2103, a Conservation Use exemption reducing the taxable value by 76,784. The view makes it straightforward to identify parcels that have exemptions and those that do not.

## The Appraiser's Portfolio

The view vw_assessment_notice_chief_appraiser links each assessment notice to the Chief Appraiser who issued it. Notice NOT-2678 (Real Property, 21-Day period, status Pending) was issued by appraiser APP-2799, appointed on 2022-05-03 and based at composite-office-99. Notice NOT-2679 (Personal Property, 30-Day period, Submitted for Approval) was issued by APP-2803, appointed on 2023-10-14 and located at primary-office-100. This view supports workload analysis and accountability tracking across the appraisal division.

The view vw_chief_appraiser_assessment_notice presents the same relationship from the appraiser's perspective. Appraiser APP-2799 (term ending 2023-06-08) is responsible for notice NOT-2678, while APP-2803 (term ending 2024-11-19) handles NOT-2679. The view enables supervisors to assess each appraiser's current caseload and verify that notices are being issued by appraisers whose terms are still active.

The view vw_chief_appraiser_property_exemption connects appraisers to the exemptions they process. Appraiser APP-2799 is linked to exemption EXE-2099 (Personal Property, reduction 5.06, status Pending), while APP-2803 handles EXE-2103 (Conservation Use, reduction 76,784, Submitted for Approval). This relationship ensures that exemption processing is traceable to the responsible appraiser and supports quality review of exemption determinations.

The view vw_chief_appraiser_board_of_assessors links each Chief Appraiser to the Board of Assessors they serve. Appraiser APP-2799 supports board BOA-2651 (regional-jurisdic-30, established 2024-03-27), and APP-2803 supports BOA-2652 (legacy-jurisdic-31, established 2025-08-11). This view clarifies the organizational structure and ensures that the correct appraiser is available to present valuation evidence at board hearings.

## Exemptions in Context

The view vw_property_exemption_property_parcel joins exemptions to their underlying parcels, answering which property receives which type of relief. Exemption EXE-2099 (Personal Property, reduction 5.06, Pending) applies to parcel PAR-2364 at distributed-address-72 with land use code IVC10. Exemption EXE-2103 (Conservation Use, reduction 76,784, Submitted for Approval) applies to parcel PAR-2368 at baseline-address-73 with land use 1202-0001-S. This view is critical for verifying that exemptions are applied to the correct parcels and that the reduction amounts are consistent with the property characteristics.

The view vw_property_exemption_board_of_assessors connects exemptions to the Board of Assessors that reviews them. Exemption EXE-2099 is routed to board BOA-2651 (regional-jurisdic-30), and EXE-2103 to BOA-2652 (legacy-jurisdic-31). This relationship ensures that exemption appeals are heard by the correct jurisdictional board and supports tracking of exemption processing timelines across different boards.

## Board Meeting Records

The view vw_board_meeting_assessment_notice links board meetings to the assessment notices they address. Meeting MEE-2370 (Regular type, Scheduled status, quorum present) concerns notice NOT-2678 (Real Property, Pending). Meeting MEE-2377 (Special type, In Progress status, no quorum) addresses notice NOT-2679 (Personal Property, Submitted for Approval). This view enables the tracking of which notices have been brought before the board and the outcome of those proceedings.

The view vw_board_meeting_property_exemption connects meetings to the exemptions under consideration. Meeting MEE-2370 reviews exemption EXE-2099 (Personal Property, reduction 5.06), while MEE-2377 considers EXE-2103 (Conservation Use, reduction 76,784). The view provides a complete picture of exemption appeals, including the meeting type and whether a quorum was present for binding action.

The view vw_board_meeting_board_of_assessors ties meetings to the specific board convening. Meeting MEE-2370 is convened by board BOA-2651 (regional-jurisdic-30), and MEE-2377 by BOA-2652 (legacy-jurisdic-31). This view confirms that meetings are properly constituted and that the correct board is hearing each case.

## Board of Assessors Relationships

The view vw_board_of_assessors_board_meeting presents the board's meeting schedule from the board's perspective. Board BOA-2651 (regional-jurisdic-30, session compact-current-20) has scheduled meeting MEE-2370 on 2023-10-23. Board BOA-2652 (legacy-jurisdic-31, session composite-current-21) has meeting MEE-2377 on 2024-03-07. This view supports calendar management and ensures that boards are meeting at appropriate intervals.

The view vw_board_of_assessors_chief_appraiser links each Board of Assessors to its supporting Chief Appraiser. Board BOA-2651 is supported by appraiser APP-2799 (appointed 2022-05-03, term ending 2023-06-08), and BOA-2652 by APP-2803 (appointed 2023-10-14, term ending 2024-11-19). This relationship ensures that each board has access to the valuation expertise needed to adjudicate appeals.

## Closing Synthesis

The property assessment ecosystem operates through interconnected records that trace a parcel from initial valuation through potential exemption and, if contested, to board review. The assessment notice initiates the cycle, the property parcel defines what is being valued, the exemption determines whether relief applies, the Chief Appraiser performs the work, the Board of Assessors provides oversight, and the Board Meeting records the formal proceedings. Each view described above answers a specific operational question—linking notices to parcels, appraisers to their assignments, exemptions to their jurisdictions, and meetings to their cases—creating a comprehensive audit trail that supports transparency, accountability, and efficient administration of the property tax system.

## Data appendix

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
