Infrastructure compliance management operates at the intersection of construction scheduling, quality assurance, and regulatory oversight. Municipal and private developers coordinate across multiple project phases, each requiring documented inspections, standardized test protocols, engineered drawings, and corrective action tracking. The records captured in this system form a complete audit trail: every phase carries a lifecycle status, every inspection event generates deficiencies when standards are not met, every test sheet records whether a physical system passed or failed its evaluation, and every drawing submission anchors design intent to a specific regulatory framework. Understanding how these records interlock is essential for practitioners who manage large-scale infrastructure programs.

## Infrastructure Phases

**Table `InfrastructurePhase`**

| phaseId | phaseIdentifier | phaseName | startDate | endDate | status | isGuaranteed |
|---|---|---|---|---|---|---|
| 1 | PHA-2052 | Baseline Series D | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | false |
| 2 | PHA-2056 | Distributed Assessment | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | in_progress | true |
| 3 | PHA-2060 | Adaptive Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | false |
| 4 | PHA-2064 | Primary Corridor A | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | true |

An infrastructure phase represents a discrete segment of a development program, identified by a structured code such as `PHA-2052` and a descriptive name like `Baseline Series D`. Each phase carries a start date and an end date, a lifecycle status, and a flag indicating whether the phase remains under a guarantee period. In the current dataset, four phases are recorded. Phase `PHA-2052`, named `Baseline Series D`, is marked as `planned` with a start date of `2022-09-05` and is not under guarantee. Phase `PHA-2056`, `Distributed Assessment`, is `in_progress` and carries a guarantee. Phase `PHA-2060`, `Adaptive Survey`, has reached `completed` status without a guarantee. Phase `PHA-2064`, `Primary Corridor A`, is the only phase with a `failed` status, and it is also under guarantee. The status field drives downstream workflows: a `failed` phase triggers intensified inspection and deficiency remediation, while a `completed` phase may still carry outstanding test results awaiting final approval.

## Inspection Events

**Table `InspectionEvent`**

| id | inspectionId | inspectionType | inspectionDate | inspectorRole | deficiencyCount | punchListItems | status | notes | phaseId | deficiencyId | sheetTestSheetId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | final | 2025-12-03T23:09:00 | City_Engineering | 32 | 42 | scheduled | extended-notes-75 | 1 | 13910633 | 2106711 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 575199 | re-inspection | 2022-05-14T06:26:00 | Developer_Representative | 11 | 45 | in_progress | integrated-notes-76 | 2 | 8387527 | 5006448 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | state_uk_4 | punch-list | 2023-10-25T13:43:00 | Contractor | 50 | 48 | completed | seasonal-notes-77 | 3 | 9474 | 3001009030020 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 8350011 | final | 2024-03-09T20:00:00 | City_Engineering | 88 | 51 | failed | regional-notes-78 | 4 | client-focus | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Inspection events document the physical or procedural review of an infrastructure phase. Each event carries a unique identifier, an inspection type drawn from the set `final`, `re-inspection`, `punch-list`, and a date on which the review occurred. The `inspectorRole` field records the organizational affiliation of the reviewer — values in the data include `City_Engineering`, `Developer_Representative`, and `Contractor`. The event also tracks a `deficiencyCount`, the number of `punchListItems`, and a status such as `scheduled`, `in_progress`, `completed`, or `failed`. Event `100`, identified as `BJanecke`, is a `final` inspection conducted by `City_Engineering` on `2025-12-03` against phase `PHA-2052`; it recorded 32 deficiencies and 42 punch list items and remains `scheduled`. Event `101`, `575199`, is a `re-inspection` by the `Developer_Representative` on `2022-05-14` for phase `PHA-2056`, with 11 deficiencies and 45 punch list items, currently `in_progress`. Event `102`, `state_uk_4`, is a `punch-list` review by the `Contractor` on `2023-10-25` for phase `PHA-2060`, logging 50 deficiencies and 48 punch list items, and marked `completed`. Event `103`, `8350011`, is a `final` inspection by `City_Engineering` on `2024-03-09` for phase `PHA-2064`, with 88 deficiencies and 51 punch list items, and a `failed` status. Each event also references a specific deficiency and a test sheet, linking the inspection to both corrective actions and physical test results.

## Test Sheets

**Table `TestSheet`**

| testSheetId | testType | testDate | resultStatus | approvedBy | approvalDate | testSpecification | isElectronic | phaseId | eventId | regulationId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 2106711 | sanitary_sewer | 2024-11-13T22:42:00 | pass | regional-approved-54 | 2023-10-10T21:27:00 | compact-test-80 | false | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 5006448 | storm_sewer | 2025-04-24T05:59:00 | fail | legacy-approved-55 | 2024-03-21T04:44:00 | composite-test-81 | true | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3001009030020 | pressure | 2022-09-08T12:16:00 | pending_review | compact-approved-56 | 2025-08-05T11:01:00 | primary-test-82 | false | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 | pass | composite-approved-57 | 2022-01-16T18:18:00 | adaptive-test-83 | true | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Test sheets record the results of standardized physical evaluations performed on infrastructure systems. The `testType` field distinguishes between `sanitary_sewer`, `storm_sewer`, `pressure`, and `flow` evaluations. Each sheet carries a `testDate`, a `resultStatus` of `pass`, `fail`, or `pending_review`, and an `approvedBy` value identifying the approving authority. The `testSpecification` field names the protocol used — values include `compact-test-80`, `composite-test-81`, `primary-test-82`, and `adaptive-test-83`. The `isElectronic` flag indicates whether the test was conducted using electronic instrumentation. Test sheet `2106711` documents a `sanitary_sewer` test dated `2024-11-13` that `pass`ed under the `compact-test-80` specification; it was approved by `regional-approved-54` on `2023-10-10` and is not electronic. Test sheet `5006448` records a `storm_sewer` test on `2025-04-24` that `fail`ed under `composite-test-81`; it was approved by `legacy-approved-55` and is electronic. Test sheet `3001009030020` is a `pressure` test from `2022-09-08` with a `pending_review` status under `primary-test-82`, not electronic. Test sheet `c7460a44-8fcc-11eb-924d-9cd76263cbd0` documents a `flow` test from `2023-02-19` that `pass`ed under `adaptive-test-83`, approved by `composite-approved-57`, and is electronic. Each test sheet is tied to an infrastructure phase and, where applicable, to an inspection event.

## Drawings

**Table `Drawing`**

| id | drawingId | drawingType | submissionDate | format | status | fileSize | isElectronic | phaseId | regulationId | referencesPhaseId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2839514 | stub_out | 2025-04-24T03:57:00 | electronic | draft | 61.0 | false | 1 | 1 | 1 |
| 1001 | 2618575 | as_built | 2022-09-08T10:14:00 | paper | submitted | 1.33 | true | 2 | 2 | 2 |
| 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure | 2023-02-19T17:31:00 | electronic | approved | 11.0 | false | 3 | 3 | 3 |
| 1003 | 26648045 | stub_out | 2024-07-03T00:48:00 | paper | rejected | 254.85016 | true | 4 | 4 | 4 |

Engineering drawings serve as the design record for each infrastructure phase. The `drawingType` field categorizes submissions as `stub_out`, `as_built`, or `infrastructure`. The `format` field distinguishes `electronic` from `paper` submissions, while `status` tracks the review outcome as `draft`, `submitted`, `approved`, or `rejected`. The `fileSize` field records the document size in megabytes, and `isElectronic` indicates whether the drawing was submitted digitally. Drawing `1000` is a `stub_out` type, submitted in `electronic` format with a `draft` status and a file size of `61.0` MB. Drawing `1001` is an `as_built` type, submitted as `paper` with a `submitted` status and a file size of `1.33` MB. Drawing `1002`, identified by the UUID `5f927026-8fcd-11eb-924d-9cd76263cbd0`, is an `infrastructure` type in `electronic` format with an `approved` status and a file size of `11.0` MB. Drawing `1003` is a `stub_out` type submitted as `paper` with a `rejected` status and a file size of `254.85016` MB. Each drawing references a regulation and an infrastructure phase, anchoring the design to both the applicable rule and the project segment it supports.

## Deficiencies

**Table `Deficiency`**

| deficiencyId | description | severity | identifiedDate | correctedDate | status | requiresReInspection | eventId | contractorId | verifiedByEventId |
|---|---|---|---|---|---|---|---|---|---|
| 13910633 | Extended Survey | minor | 2022-01-10T12:00:00 | 2025-12-21T23:33:00 | open | false | 100 | 1000 | 100 |
| 8387527 | Pilot Corridor A | major | 2023-06-21T19:17:00 | 2022-05-05T06:50:00 | in_progress | true | 101 | 1001 | 101 |
| 9474 | Baseline Series | critical | 2024-11-05T02:34:00 | 2023-10-16T13:07:00 | closed | false | 102 | 1002 | 102 |
| client-focus | Distributed Assessment | minor | 2025-04-16T09:51:00 | 2024-03-27T20:24:00 | rejected | true | 103 | 1003 | 103 |

Deficiencies capture deviations from standards identified during inspections. Each deficiency carries a `description`, a `severity` level of `minor`, `major`, or `critical`, an `identifiedDate`, and a `correctedDate`. The `status` field tracks the remediation state as `open`, `in_progress`, `closed`, or `rejected`. The `requiresReInspection` flag indicates whether the deficiency triggers a follow-up review. Deficiency `13910633`, described as `Extended Survey`, is classified as `minor` severity, identified on `2022-01-10`, corrected on `2025-12-21`, and remains `open` without requiring re-inspection. Deficiency `8387527`, `Pilot Corridor A`, is `major` severity, identified on `2023-06-21`, corrected on `2022-05-05`, and is `in_progress` with re-inspection required. Deficiency `9474`, `Baseline Series`, is `critical` severity, identified on `2024-11-05`, corrected on `2023-10-16`, and is `closed` without re-inspection. Deficiency `client-focus`, `Distributed Assessment`, is `minor` severity, identified on `2025-04-16`, corrected on `2024-03-27`, and has a `rejected` status with re-inspection required. Each deficiency is linked to an inspection event and a contractor, establishing accountability for remediation.

## Regulations

**Table `Regulation`**

| id | ruleId | ruleNumber | ruleTitle | effectiveDate | issuingAuthority | isElectronicRequired | scope | sheetTestSheetId | drawingId | phaseId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1437602 | RUL-2640 | Integrated Assessment A | 2023-02-14 | extended-issuing-33 | true | integrated-scope-52 | 2106711 | 1000 | 1 |
| 2 | 325452 | RUL-2647 | Extended Survey | 2024-07-25 | integrated-issuing-34 | false | seasonal-scope-53 | 5006448 | 1001 | 2 |
| 3 | 9246325 | RUL-2654 | Pilot Corridor | 2025-12-09 | seasonal-issuing-35 | true | regional-scope-54 | 3001009030020 | 1002 | 3 |
| 4 | 14985260 | RUL-2661 | Baseline Series D | 2022-05-20 | regional-issuing-36 | false | legacy-scope-55 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1003 | 4 |

Regulations define the rules governing infrastructure construction and inspection. Each regulation carries a `ruleNumber` such as `RUL-2640`, a `ruleTitle` like `Integrated Assessment A`, an `effectiveDate`, and an `issuingAuthority` such as `extended-issuing-33`. The `isElectronicRequired` flag indicates whether electronic compliance documentation is mandatory, and the `scope` field describes the regulatory reach — values include `integrated-scope-52`, `seasonal-scope-53`, `regional-scope-54`, and `legacy-scope-55`. Regulation `1`, rule `RUL-2640` titled `Integrated Assessment A`, became effective on `2023-02-14` under `extended-issuing-33`, requires electronic documentation, and covers `integrated-scope-52`. Regulation `2`, rule `RUL-2647` titled `Extended Survey`, effective `2024-07-25` under `integrated-issuing-34`, does not require electronic documentation and covers `seasonal-scope-53`. Regulation `3`, rule `RUL-2654` titled `Pilot Corridor`, effective `2025-12-09` under `seasonal-issuing-35`, requires electronic documentation and covers `regional-scope-54`. Regulation `4`, rule `RUL-2661` titled `Baseline Series D`, effective `2022-05-20` under `regional-issuing-36`, does not require electronic documentation and covers `legacy-scope-55`. Each regulation is associated with a test sheet, a drawing, and an infrastructure phase, forming the regulatory backbone of the compliance framework.

## Contractors and Developers

**Table `Contractor`**

| id | contractorId | contractorName | licenseNumber | contactEmail | status | deficiencyId | developerId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | info | Baseline Series D | LIC-2589 | Christopher Wilson | active | 13910633 | 8350025 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | template_impcode_pagata_0 | Distributed Assessment | LIC-2596 | Charles Larsen | suspended | 8387527 | 32829 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 69431 | Adaptive Survey | LIC-2603 | Mary Alvarez | terminated | 9474 | state_uk_22 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | default_chart_a_tax_15 | Primary Corridor A | LIC-2610 | April Snyder | active | client-focus | 1996932 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `Developer`**

| developerId | developerName | contactEmail | representativeName | phaseId | contractorId | drawingId |
|---|---|---|---|---|---|---|
| 8350025 | Composite Protocol | Christopher Wilson | Integrated Protocol A | 1 | 1000 | 1000 |
| 32829 | Compact Programme A | Charles Larsen | Extended Programme | 2 | 1001 | 1001 |
| state_uk_22 | Legacy Standard | Mary Alvarez | Pilot Standard | 3 | 1002 | 1002 |
| 1996932 | Regional Framework | April Snyder | Baseline Framework D | 4 | 1003 | 1003 |

Contractors execute the physical work and bear responsibility for deficiency remediation. Developers fund and initiate infrastructure programs, engaging contractors to deliver construction. The contractor records track organizational identifiers and contact details, while developer records capture the sponsoring entities. In the current dataset, contractor `1000` is associated with deficiency `13910633` and event `100`, contractor `1001` with deficiency `8387527` and event `101`, contractor `1002` with deficiency `9474` and event `102`, and contractor `1003` with deficiency `client-focus` and event `103`. The developer records establish the organizational hierarchy under which these contractors operate, linking each contractor to its sponsoring developer entity.

## Phase-to-Event, Phase-to-Test, and Phase-to-Drawing Relationships

**Table `InfrastructurePhaseInspectionEvent`**

| phaseId | eventId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `InfrastructurePhaseTestSheet`**

| phaseId | sheetTestSheetId |
|---|---|
| 1 | 2106711 |
| 1 | 5006448 |
| 2 | 5006448 |
| 2 | 3001009030020 |
| 3 | 3001009030020 |
| 3 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 2106711 |

**Table `InfrastructurePhaseDrawing`**

| phaseId | drawingId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The association tables formalize the many-to-many relationships between infrastructure phases and their operational records. `InfrastructurePhaseInspectionEvent` links each phase to one or more inspection events, enabling a single phase to undergo multiple reviews across its lifecycle. `InfrastructurePhaseTestSheet` connects phases to their physical test records, allowing a phase to accumulate test results from different evaluation types. `InfrastructurePhaseDrawing` ties engineering drawings to phases, supporting multiple drawing submissions per phase as designs evolve. These association tables ensure that the audit trail remains complete: every inspection, test, and drawing can be traced back to the phase it evaluates, and every phase can be reconstructed from its constituent records.

## Detailed Inspection and Phase Records

**View `vw_infrastructure_phase_inspection_event_detail`**

```sql
CREATE VIEW vw_infrastructure_phase_inspection_event_detail AS
SELECT a.phaseId, a.phaseIdentifier, a.phaseName, b.id AS event_id, b.inspectionId AS event_inspectionId, b.inspectionType AS event_inspectionType
FROM InfrastructurePhase a
  JOIN InfrastructurePhaseInspectionEvent j ON j.phaseId = a.phaseId
  JOIN InspectionEvent b ON b.id = j.eventId;
```

| phaseId | phaseIdentifier | phaseName | event_id | event_inspectionId | event_inspectionType |
|---|---|---|---|---|---|
| 1 | PHA-2052 | Baseline Series D | 100 | BJanecke | final |
| 1 | PHA-2052 | Baseline Series D | 101 | 575199 | re-inspection |
| 2 | PHA-2056 | Distributed Assessment | 101 | 575199 | re-inspection |
| 2 | PHA-2056 | Distributed Assessment | 102 | state_uk_4 | punch-list |
| 3 | PHA-2060 | Adaptive Survey | 102 | state_uk_4 | punch-list |
| 3 | PHA-2060 | Adaptive Survey | 103 | 8350011 | final |
| 4 | PHA-2064 | Primary Corridor A | 103 | 8350011 | final |
| 4 | PHA-2064 | Primary Corridor A | 100 | BJanecke | final |

This view joins the infrastructure phase with its associated inspection event, answering the question of which inspections were performed on which phases and with what outcomes. The joined record for phase `PHA-2052` and event `100` shows a `final` inspection by `City_Engineering` with 32 deficiencies and 42 punch list items, still `scheduled`. The record for phase `PHA-2056` and event `101` shows a `re-inspection` by the `Developer_Representative` with 11 deficiencies, currently `in_progress`. This view is the primary tool for compliance officers tracking which phases have been reviewed and which remain pending.

## Deficiency and Inspection Event Detail

**View `vw_infrastructure_phase_test_sheet_detail`**

```sql
CREATE VIEW vw_infrastructure_phase_test_sheet_detail AS
SELECT a.phaseId, a.phaseIdentifier, a.phaseName, b.testSheetId AS sheet_testSheetId, b.testType AS sheet_testType, b.testDate AS sheet_testDate
FROM InfrastructurePhase a
  JOIN InfrastructurePhaseTestSheet j ON j.phaseId = a.phaseId
  JOIN TestSheet b ON b.testSheetId = j.sheetTestSheetId;
```

| phaseId | phaseIdentifier | phaseName | sheet_testSheetId | sheet_testType | sheet_testDate |
|---|---|---|---|---|---|
| 1 | PHA-2052 | Baseline Series D | 2106711 | sanitary_sewer | 2024-11-13T22:42:00 |
| 1 | PHA-2052 | Baseline Series D | 5006448 | storm_sewer | 2025-04-24T05:59:00 |
| 2 | PHA-2056 | Distributed Assessment | 5006448 | storm_sewer | 2025-04-24T05:59:00 |
| 2 | PHA-2056 | Distributed Assessment | 3001009030020 | pressure | 2022-09-08T12:16:00 |
| 3 | PHA-2060 | Adaptive Survey | 3001009030020 | pressure | 2022-09-08T12:16:00 |
| 3 | PHA-2060 | Adaptive Survey | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 |
| 4 | PHA-2064 | Primary Corridor A | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 |
| 4 | PHA-2064 | Primary Corridor A | 2106711 | sanitary_sewer | 2024-11-13T22:42:00 |

**View `vw_infrastructure_phase_drawing_detail`**

```sql
CREATE VIEW vw_infrastructure_phase_drawing_detail AS
SELECT a.phaseId, a.phaseIdentifier, a.phaseName, b.id AS drawing_id, b.drawingId AS drawing_drawingId, b.drawingType AS drawing_drawingType
FROM InfrastructurePhase a
  JOIN InfrastructurePhaseDrawing j ON j.phaseId = a.phaseId
  JOIN Drawing b ON b.id = j.drawingId;
```

| phaseId | phaseIdentifier | phaseName | drawing_id | drawing_drawingId | drawing_drawingType |
|---|---|---|---|---|---|
| 1 | PHA-2052 | Baseline Series D | 1000 | 2839514 | stub_out |
| 1 | PHA-2052 | Baseline Series D | 1001 | 2618575 | as_built |
| 2 | PHA-2056 | Distributed Assessment | 1001 | 2618575 | as_built |
| 2 | PHA-2056 | Distributed Assessment | 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure |
| 3 | PHA-2060 | Adaptive Survey | 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure |
| 3 | PHA-2060 | Adaptive Survey | 1003 | 26648045 | stub_out |
| 4 | PHA-2064 | Primary Corridor A | 1003 | 26648045 | stub_out |
| 4 | PHA-2064 | Primary Corridor A | 1000 | 2839514 | stub_out |

**View `vw_inspection_event_infrastructure_phase`**

```sql
CREATE VIEW vw_inspection_event_infrastructure_phase AS
SELECT a.id, a.inspectionId, a.inspectionType, a.inspectionDate, b.phaseId AS phase_phaseId, b.phaseIdentifier AS phase_phaseIdentifier, b.phaseName AS phase_phaseName
FROM InspectionEvent a JOIN InfrastructurePhase b ON a.phaseId = b.phaseId;
```

| id | inspectionId | inspectionType | inspectionDate | phase_phaseId | phase_phaseIdentifier | phase_phaseName |
|---|---|---|---|---|---|---|
| 100 | BJanecke | final | 2025-12-03T23:09:00 | 1 | PHA-2052 | Baseline Series D |
| 101 | 575199 | re-inspection | 2022-05-14T06:26:00 | 2 | PHA-2056 | Distributed Assessment |
| 102 | state_uk_4 | punch-list | 2023-10-25T13:43:00 | 3 | PHA-2060 | Adaptive Survey |
| 103 | 8350011 | final | 2024-03-09T20:00:00 | 4 | PHA-2064 | Primary Corridor A |

**View `vw_inspection_event_deficiency`**

```sql
CREATE VIEW vw_inspection_event_deficiency AS
SELECT a.id, a.inspectionId, a.inspectionType, a.inspectionDate, b.deficiencyId AS deficiency_deficiencyId, b.description AS deficiency_description, b.severity AS deficiency_severity
FROM InspectionEvent a JOIN Deficiency b ON a.deficiencyId = b.deficiencyId;
```

| id | inspectionId | inspectionType | inspectionDate | deficiency_deficiencyId | deficiency_description | deficiency_severity |
|---|---|---|---|---|---|---|
| 100 | BJanecke | final | 2025-12-03T23:09:00 | 13910633 | Extended Survey | minor |
| 101 | 575199 | re-inspection | 2022-05-14T06:26:00 | 8387527 | Pilot Corridor A | major |
| 102 | state_uk_4 | punch-list | 2023-10-25T13:43:00 | 9474 | Baseline Series | critical |
| 103 | 8350011 | final | 2024-03-09T20:00:00 | client-focus | Distributed Assessment | minor |

The deficiency-detail view pairs each inspection event with its associated deficiencies, revealing the corrective action burden for each review. Event `100` is linked to deficiency `13910633` (`Extended Survey`, `minor`, `open`), while event `102` is linked to deficiency `9474` (`Baseline Series`, `critical`, `closed`). The inspection-event-to-phase view reverses the relationship, showing which phase each event evaluates. The inspection-event-to-deficiency view aggregates all deficiencies arising from a single event, enabling practitioners to assess the severity distribution of findings within a given review.

## Test Sheet and Phase Relationships

**View `vw_inspection_event_test_sheet`**

```sql
CREATE VIEW vw_inspection_event_test_sheet AS
SELECT a.id, a.inspectionId, a.inspectionType, a.inspectionDate, b.testSheetId AS sheet_testSheetId, b.testType AS sheet_testType, b.testDate AS sheet_testDate
FROM InspectionEvent a JOIN TestSheet b ON a.sheetTestSheetId = b.testSheetId;
```

| id | inspectionId | inspectionType | inspectionDate | sheet_testSheetId | sheet_testType | sheet_testDate |
|---|---|---|---|---|---|---|
| 100 | BJanecke | final | 2025-12-03T23:09:00 | 2106711 | sanitary_sewer | 2024-11-13T22:42:00 |
| 101 | 575199 | re-inspection | 2022-05-14T06:26:00 | 5006448 | storm_sewer | 2025-04-24T05:59:00 |
| 102 | state_uk_4 | punch-list | 2023-10-25T13:43:00 | 3001009030020 | pressure | 2022-09-08T12:16:00 |
| 103 | 8350011 | final | 2024-03-09T20:00:00 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 |

**View `vw_test_sheet_infrastructure_phase`**

```sql
CREATE VIEW vw_test_sheet_infrastructure_phase AS
SELECT a.testSheetId, a.testType, a.testDate, a.resultStatus, b.phaseId AS phase_phaseId, b.phaseIdentifier AS phase_phaseIdentifier, b.phaseName AS phase_phaseName
FROM TestSheet a JOIN InfrastructurePhase b ON a.phaseId = b.phaseId;
```

| testSheetId | testType | testDate | resultStatus | phase_phaseId | phase_phaseIdentifier | phase_phaseName |
|---|---|---|---|---|---|---|
| 2106711 | sanitary_sewer | 2024-11-13T22:42:00 | pass | 1 | PHA-2052 | Baseline Series D |
| 5006448 | storm_sewer | 2025-04-24T05:59:00 | fail | 2 | PHA-2056 | Distributed Assessment |
| 3001009030020 | pressure | 2022-09-08T12:16:00 | pending_review | 3 | PHA-2060 | Adaptive Survey |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 | pass | 4 | PHA-2064 | Primary Corridor A |

**View `vw_test_sheet_inspection_event`**

```sql
CREATE VIEW vw_test_sheet_inspection_event AS
SELECT a.testSheetId, a.testType, a.testDate, a.resultStatus, b.id AS event_id, b.inspectionId AS event_inspectionId, b.inspectionType AS event_inspectionType
FROM TestSheet a JOIN InspectionEvent b ON a.eventId = b.id;
```

| testSheetId | testType | testDate | resultStatus | event_id | event_inspectionId | event_inspectionType |
|---|---|---|---|---|---|---|
| 2106711 | sanitary_sewer | 2024-11-13T22:42:00 | pass | 100 | BJanecke | final |
| 5006448 | storm_sewer | 2025-04-24T05:59:00 | fail | 101 | 575199 | re-inspection |
| 3001009030020 | pressure | 2022-09-08T12:16:00 | pending_review | 102 | state_uk_4 | punch-list |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 | pass | 103 | 8350011 | final |

The test-sheet-to-phase view connects each physical test to the infrastructure phase it evaluates. Test sheet `2106711` (`sanitary_sewer`, `pass`) is tied to phase `PHA-2052`, while test sheet `5006448` (`storm_sewer`, `fail`) is tied to phase `PHA-2056`. The test-sheet-to-inspection-event view links test results to the inspections that prompted them, enabling practitioners to correlate physical test outcomes with the procedural reviews that triggered them. Event `100` is associated with test sheet `2106711`, and event `101` with test sheet `5006448`.

## Regulatory Oversight

**View `vw_test_sheet_regulation`**

```sql
CREATE VIEW vw_test_sheet_regulation AS
SELECT a.testSheetId, a.testType, a.testDate, a.resultStatus, b.id AS regulation_id, b.ruleId AS regulation_ruleId, b.ruleNumber AS regulation_ruleNumber
FROM TestSheet a JOIN Regulation b ON a.regulationId = b.id;
```

| testSheetId | testType | testDate | resultStatus | regulation_id | regulation_ruleId | regulation_ruleNumber |
|---|---|---|---|---|---|---|
| 2106711 | sanitary_sewer | 2024-11-13T22:42:00 | pass | 1 | 1437602 | RUL-2640 |
| 5006448 | storm_sewer | 2025-04-24T05:59:00 | fail | 2 | 325452 | RUL-2647 |
| 3001009030020 | pressure | 2022-09-08T12:16:00 | pending_review | 3 | 9246325 | RUL-2654 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 | pass | 4 | 14985260 | RUL-2661 |

**View `vw_drawing_infrastructure_phase`**

```sql
CREATE VIEW vw_drawing_infrastructure_phase AS
SELECT a.id, a.drawingId, a.drawingType, a.submissionDate, b.phaseId AS phase_phaseId, b.phaseIdentifier AS phase_phaseIdentifier, b.phaseName AS phase_phaseName
FROM Drawing a JOIN InfrastructurePhase b ON a.phaseId = b.phaseId;
```

| id | drawingId | drawingType | submissionDate | phase_phaseId | phase_phaseIdentifier | phase_phaseName |
|---|---|---|---|---|---|---|
| 1000 | 2839514 | stub_out | 2025-04-24T03:57:00 | 1 | PHA-2052 | Baseline Series D |
| 1001 | 2618575 | as_built | 2022-09-08T10:14:00 | 2 | PHA-2056 | Distributed Assessment |
| 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure | 2023-02-19T17:31:00 | 3 | PHA-2060 | Adaptive Survey |
| 1003 | 26648045 | stub_out | 2024-07-03T00:48:00 | 4 | PHA-2064 | Primary Corridor A |

**View `vw_drawing_regulation`**

```sql
CREATE VIEW vw_drawing_regulation AS
SELECT a.id, a.drawingId, a.drawingType, a.submissionDate, b.id AS regulation_id, b.ruleId AS regulation_ruleId, b.ruleNumber AS regulation_ruleNumber
FROM Drawing a JOIN Regulation b ON a.regulationId = b.id;
```

| id | drawingId | drawingType | submissionDate | regulation_id | regulation_ruleId | regulation_ruleNumber |
|---|---|---|---|---|---|---|
| 1000 | 2839514 | stub_out | 2025-04-24T03:57:00 | 1 | 1437602 | RUL-2640 |
| 1001 | 2618575 | as_built | 2022-09-08T10:14:00 | 2 | 325452 | RUL-2647 |
| 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure | 2023-02-19T17:31:00 | 3 | 9246325 | RUL-2654 |
| 1003 | 26648045 | stub_out | 2024-07-03T00:48:00 | 4 | 14985260 | RUL-2661 |

**View `vw_regulation_test_sheet`**

```sql
CREATE VIEW vw_regulation_test_sheet AS
SELECT a.id, a.ruleId, a.ruleNumber, a.ruleTitle, b.testSheetId AS sheet_testSheetId, b.testType AS sheet_testType, b.testDate AS sheet_testDate
FROM Regulation a JOIN TestSheet b ON a.sheetTestSheetId = b.testSheetId;
```

| id | ruleId | ruleNumber | ruleTitle | sheet_testSheetId | sheet_testType | sheet_testDate |
|---|---|---|---|---|---|---|
| 1 | 1437602 | RUL-2640 | Integrated Assessment A | 2106711 | sanitary_sewer | 2024-11-13T22:42:00 |
| 2 | 325452 | RUL-2647 | Extended Survey | 5006448 | storm_sewer | 2025-04-24T05:59:00 |
| 3 | 9246325 | RUL-2654 | Pilot Corridor | 3001009030020 | pressure | 2022-09-08T12:16:00 |
| 4 | 14985260 | RUL-2661 | Baseline Series D | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 |

**View `vw_regulation_drawing`**

```sql
CREATE VIEW vw_regulation_drawing AS
SELECT a.id, a.ruleId, a.ruleNumber, a.ruleTitle, b.id AS drawing_id, b.drawingId AS drawing_drawingId, b.drawingType AS drawing_drawingType
FROM Regulation a JOIN Drawing b ON a.drawingId = b.id;
```

| id | ruleId | ruleNumber | ruleTitle | drawing_id | drawing_drawingId | drawing_drawingType |
|---|---|---|---|---|---|---|
| 1 | 1437602 | RUL-2640 | Integrated Assessment A | 1000 | 2839514 | stub_out |
| 2 | 325452 | RUL-2647 | Extended Survey | 1001 | 2618575 | as_built |
| 3 | 9246325 | RUL-2654 | Pilot Corridor | 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure |
| 4 | 14985260 | RUL-2661 | Baseline Series D | 1003 | 26648045 | stub_out |

**View `vw_regulation_infrastructure_phase`**

```sql
CREATE VIEW vw_regulation_infrastructure_phase AS
SELECT a.id, a.ruleId, a.ruleNumber, a.ruleTitle, b.phaseId AS phase_phaseId, b.phaseIdentifier AS phase_phaseIdentifier, b.phaseName AS phase_phaseName
FROM Regulation a JOIN InfrastructurePhase b ON a.phaseId = b.phaseId;
```

| id | ruleId | ruleNumber | ruleTitle | phase_phaseId | phase_phaseIdentifier | phase_phaseName |
|---|---|---|---|---|---|---|
| 1 | 1437602 | RUL-2640 | Integrated Assessment A | 1 | PHA-2052 | Baseline Series D |
| 2 | 325452 | RUL-2647 | Extended Survey | 2 | PHA-2056 | Distributed Assessment |
| 3 | 9246325 | RUL-2654 | Pilot Corridor | 3 | PHA-2060 | Adaptive Survey |
| 4 | 14985260 | RUL-2661 | Baseline Series D | 4 | PHA-2064 | Primary Corridor A |

Regulatory views anchor every test sheet, drawing, and phase to the rules that govern them. The test-sheet-to-regulation view shows that test sheet `2106711` is governed by regulation `RUL-2640` (`Integrated Assessment A`), while test sheet `5006448` falls under regulation `RUL-2647` (`Extended Survey`). The drawing-to-phase view confirms that drawing `1000` (`stub_out`, `draft`) is associated with phase `PHA-2052`, and drawing `1002` (`infrastructure`, `approved`) with phase `PHA-2060`. The drawing-to-regulation view links drawing `1000` to regulation `RUL-2640` and drawing `1001` to regulation `RUL-2647`. The regulation-to-phase view establishes that regulation `RUL-2640` applies to phase `PHA-2052`, regulation `RUL-2647` to phase `PHA-2056`, regulation `RUL-2654` to phase `PHA-2060`, and regulation `RUL-2661` to phase `PHA-2064`. These regulatory linkages ensure that every physical test, every drawing submission, and every phase of construction can be traced to the specific rule that mandates it.

## Contractor Accountability

**View `vw_deficiency_inspection_event`**

```sql
CREATE VIEW vw_deficiency_inspection_event AS
SELECT a.deficiencyId, a.description, a.severity, a.identifiedDate, b.id AS event_id, b.inspectionId AS event_inspectionId, b.inspectionType AS event_inspectionType
FROM Deficiency a JOIN InspectionEvent b ON a.eventId = b.id;
```

| deficiencyId | description | severity | identifiedDate | event_id | event_inspectionId | event_inspectionType |
|---|---|---|---|---|---|---|
| 13910633 | Extended Survey | minor | 2022-01-10T12:00:00 | 100 | BJanecke | final |
| 8387527 | Pilot Corridor A | major | 2023-06-21T19:17:00 | 101 | 575199 | re-inspection |
| 9474 | Baseline Series | critical | 2024-11-05T02:34:00 | 102 | state_uk_4 | punch-list |
| client-focus | Distributed Assessment | minor | 2025-04-16T09:51:00 | 103 | 8350011 | final |

**View `vw_deficiency_contractor`**

```sql
CREATE VIEW vw_deficiency_contractor AS
SELECT a.deficiencyId, a.description, a.severity, a.identifiedDate, b.id AS contractor_id, b.contractorId AS contractor_contractorId, b.contractorName AS contractor_contractorName
FROM Deficiency a JOIN Contractor b ON a.contractorId = b.id;
```

| deficiencyId | description | severity | identifiedDate | contractor_id | contractor_contractorId | contractor_contractorName |
|---|---|---|---|---|---|---|
| 13910633 | Extended Survey | minor | 2022-01-10T12:00:00 | 1000 | info | Baseline Series D |
| 8387527 | Pilot Corridor A | major | 2023-06-21T19:17:00 | 1001 | template_impcode_pagata_0 | Distributed Assessment |
| 9474 | Baseline Series | critical | 2024-11-05T02:34:00 | 1002 | 69431 | Adaptive Survey |
| client-focus | Distributed Assessment | minor | 2025-04-16T09:51:00 | 1003 | default_chart_a_tax_15 | Primary Corridor A |

**View `vw_contractor_deficiency`**

```sql
CREATE VIEW vw_contractor_deficiency AS
SELECT a.id, a.contractorId, a.contractorName, a.licenseNumber, b.deficiencyId AS deficiency_deficiencyId, b.description AS deficiency_description, b.severity AS deficiency_severity
FROM Contractor a JOIN Deficiency b ON a.deficiencyId = b.deficiencyId;
```

| id | contractorId | contractorName | licenseNumber | deficiency_deficiencyId | deficiency_description | deficiency_severity |
|---|---|---|---|---|---|---|
| 1000 | info | Baseline Series D | LIC-2589 | 13910633 | Extended Survey | minor |
| 1001 | template_impcode_pagata_0 | Distributed Assessment | LIC-2596 | 8387527 | Pilot Corridor A | major |
| 1002 | 69431 | Adaptive Survey | LIC-2603 | 9474 | Baseline Series | critical |
| 1003 | default_chart_a_tax_15 | Primary Corridor A | LIC-2610 | client-focus | Distributed Assessment | minor |

**View `vw_contractor_developer`**

```sql
CREATE VIEW vw_contractor_developer AS
SELECT a.id, a.contractorId, a.contractorName, a.licenseNumber, b.developerId AS developer_developerId, b.developerName AS developer_developerName, b.contactEmail AS developer_contactEmail
FROM Contractor a JOIN Developer b ON a.developerId = b.developerId;
```

| id | contractorId | contractorName | licenseNumber | developer_developerId | developer_developerName | developer_contactEmail |
|---|---|---|---|---|---|---|
| 1000 | info | Baseline Series D | LIC-2589 | 8350025 | Composite Protocol | Christopher Wilson |
| 1001 | template_impcode_pagata_0 | Distributed Assessment | LIC-2596 | 32829 | Compact Programme A | Charles Larsen |
| 1002 | 69431 | Adaptive Survey | LIC-2603 | state_uk_22 | Legacy Standard | Mary Alvarez |
| 1003 | default_chart_a_tax_15 | Primary Corridor A | LIC-2610 | 1996932 | Regional Framework | April Snyder |

The contractor accountability views trace deficiencies back to the responsible organizations. The deficiency-to-inspection-event view shows that deficiency `13910633` arose from event `100`, deficiency `8387527` from event `101`, deficiency `9474` from event `102`, and deficiency `client-focus` from event `103`. The contractor-to-deficiency view assigns contractor `1000` to deficiency `13910633`, contractor `1001` to deficiency `8387527`, contractor `1002` to deficiency `9474`, and contractor `1003` to deficiency `client-focus`. The contractor-to-developer view establishes the organizational chain: each contractor operates under a specific developer, ensuring that funding responsibility aligns with execution responsibility.

## Developer Oversight

**View `vw_developer_infrastructure_phase`**

```sql
CREATE VIEW vw_developer_infrastructure_phase AS
SELECT a.developerId, a.developerName, a.contactEmail, a.representativeName, b.phaseId AS phase_phaseId, b.phaseIdentifier AS phase_phaseIdentifier, b.phaseName AS phase_phaseName
FROM Developer a JOIN InfrastructurePhase b ON a.phaseId = b.phaseId;
```

| developerId | developerName | contactEmail | representativeName | phase_phaseId | phase_phaseIdentifier | phase_phaseName |
|---|---|---|---|---|---|---|
| 8350025 | Composite Protocol | Christopher Wilson | Integrated Protocol A | 1 | PHA-2052 | Baseline Series D |
| 32829 | Compact Programme A | Charles Larsen | Extended Programme | 2 | PHA-2056 | Distributed Assessment |
| state_uk_22 | Legacy Standard | Mary Alvarez | Pilot Standard | 3 | PHA-2060 | Adaptive Survey |
| 1996932 | Regional Framework | April Snyder | Baseline Framework D | 4 | PHA-2064 | Primary Corridor A |

**View `vw_developer_contractor`**

```sql
CREATE VIEW vw_developer_contractor AS
SELECT a.developerId, a.developerName, a.contactEmail, a.representativeName, b.id AS contractor_id, b.contractorId AS contractor_contractorId, b.contractorName AS contractor_contractorName
FROM Developer a JOIN Contractor b ON a.contractorId = b.id;
```

| developerId | developerName | contactEmail | representativeName | contractor_id | contractor_contractorId | contractor_contractorName |
|---|---|---|---|---|---|---|
| 8350025 | Composite Protocol | Christopher Wilson | Integrated Protocol A | 1000 | info | Baseline Series D |
| 32829 | Compact Programme A | Charles Larsen | Extended Programme | 1001 | template_impcode_pagata_0 | Distributed Assessment |
| state_uk_22 | Legacy Standard | Mary Alvarez | Pilot Standard | 1002 | 69431 | Adaptive Survey |
| 1996932 | Regional Framework | April Snyder | Baseline Framework D | 1003 | default_chart_a_tax_15 | Primary Corridor A |

**View `vw_developer_drawing`**

```sql
CREATE VIEW vw_developer_drawing AS
SELECT a.developerId, a.developerName, a.contactEmail, a.representativeName, b.id AS drawing_id, b.drawingId AS drawing_drawingId, b.drawingType AS drawing_drawingType
FROM Developer a JOIN Drawing b ON a.drawingId = b.id;
```

| developerId | developerName | contactEmail | representativeName | drawing_id | drawing_drawingId | drawing_drawingType |
|---|---|---|---|---|---|---|
| 8350025 | Composite Protocol | Christopher Wilson | Integrated Protocol A | 1000 | 2839514 | stub_out |
| 32829 | Compact Programme A | Charles Larsen | Extended Programme | 1001 | 2618575 | as_built |
| state_uk_22 | Legacy Standard | Mary Alvarez | Pilot Standard | 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure |
| 1996932 | Regional Framework | April Snyder | Baseline Framework D | 1003 | 26648045 | stub_out |

The developer oversight views provide a top-down perspective on the compliance program. The developer-to-phase view shows which developer sponsors each infrastructure phase, enabling program managers to assess the distribution of work across sponsoring entities. The developer-to-contractor view maps the contracting relationships, revealing which contractors are engaged by which developers. The developer-to-drawing view links engineering submissions to their sponsoring developers, ensuring that design accountability flows from the developer through the contractor to the physical record.

## Synthesis

The infrastructure compliance system captures a complete lifecycle of construction oversight. Infrastructure phases provide the scheduling backbone, each carrying a status that drives downstream workflows. Inspection events record the procedural reviews performed against those phases, generating deficiencies when standards are not met. Test sheets document the physical evaluations of infrastructure systems, with results ranging from `pass` to `fail` to `pending_review`. Drawings anchor design intent to specific phases and regulations, while deficiencies track the corrective actions required by inspection findings. Regulations provide the rule framework, and contractors and developers establish the organizational accountability chain. The association tables and detail views interlock these records into a navigable audit trail, enabling practitioners to trace any phase back through its inspections, tests, drawings, deficiencies, and regulatory obligations. This integrated record structure supports both operational management of individual projects and programmatic oversight across the full portfolio of infrastructure development.