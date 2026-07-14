Infrastructure lifecycle management in modern civil engineering demands rigorous tracking of phased construction activities, the inspections that validate them, and the regulatory frameworks that govern every deliverable. The domain under study models a sequence of infrastructure phases—each a bounded period of construction or assessment work—alongside the inspection events that occur within them, the test sheets that record material and system performance, the drawings that document design intent, and the deficiencies that arise when work falls short of specification. Regulations provide the normative layer, contractors bear responsibility for corrective action, and developers orchestrate the overall programme. The relational schema materialises this ontology through a carefully normalised set of base tables, junction tables that resolve many-to-many associations, and a rich collection of views that reassemble domain facts for reporting and analysis.

## The Core Entities

The backbone of the schema is the `InfrastructurePhase` table, which captures each discrete period of construction or assessment activity. Every phase carries a surrogate primary key `phaseId`, a business identifier `phaseIdentifier` such as `PHA-2052`, and a human-readable `phaseName` like `Baseline Series D` or `Distributed Assessment`. Temporal boundaries are recorded in `startDate` and `endDate` — for example, phase `PHA-2052` spans from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` — and a `status` column tracks the lifecycle state with values including `planned`, `in_progress`, `completed`, and `failed`. A boolean `isGuaranteed` flag indicates whether the phase falls under a warranty or guarantee period.

**Table `InfrastructurePhase`**

| phaseId | phaseIdentifier | phaseName | startDate | endDate | status | isGuaranteed |
|---|---|---|---|---|---|---|
| 1 | PHA-2052 | Baseline Series D | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | false |
| 2 | PHA-2056 | Distributed Assessment | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | in_progress | true |
| 3 | PHA-2060 | Adaptive Survey | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | false |
| 4 | PHA-2064 | Primary Corridor A | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | true |

Inspection events are the operational heartbeat of the system. The `InspectionEvent` table stores each inspection with a surrogate `id` (e.g., `100`), a business `inspectionId` that may be a name like `BJanecke` or a numeric code like `575199`, and an `inspectionType` drawn from `final`, `re-inspection`, and `punch-list`. The `inspectionDate` records when the event occurred, while `inspectorRole` identifies the responsible party — values include `City_Engineering`, `Developer_Representative`, and `Contractor`. Quantitative fields `deficiencyCount` and `punchListItems` capture the number of issues found and open punch-list items respectively, as seen in row `100` which reports `32` deficiencies and `42` punch-list items. The `status` column mirrors the phase lifecycle with values like `scheduled`, `in_progress`, `completed`, and `failed`. Free-text `notes` provide additional context, and the `phaseId` foreign key anchors each inspection to its parent phase.

**Table `InspectionEvent`**

| id | inspectionId | inspectionType | inspectionDate | inspectorRole | deficiencyCount | punchListItems | status | notes | phaseId | deficiencyId | sheetTestSheetId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | final | 2025-12-03T23:09:00 | City_Engineering | 32 | 42 | scheduled | extended-notes-75 | 1 | 13910633 | 2106711 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 575199 | re-inspection | 2022-05-14T06:26:00 | Developer_Representative | 11 | 45 | in_progress | integrated-notes-76 | 2 | 8387527 | 5006448 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | state_uk_4 | punch-list | 2023-10-25T13:43:00 | Contractor | 50 | 48 | completed | seasonal-notes-77 | 3 | 9474 | 3001009030020 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 8350011 | final | 2024-03-09T20:00:00 | City_Engineering | 88 | 51 | failed | regional-notes-78 | 4 | client-focus | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Test sheets record the results of material and system testing. The `TestSheet` table uses `testSheetId` as its primary key — a mix of numeric identifiers like `2106711` and UUIDs such as `c7460a44-8fcc-11eb-924d-9cd76263cbd0`. The `testType` column distinguishes between `sanitary_sewer`, `storm_sewer`, `pressure`, and `flow` tests. Each sheet records a `testDate`, a `resultStatus` of `pass`, `fail`, or `pending_review`, and an `approvedBy` field naming the approving authority. The `testSpecification` column holds values like `compact-test-80` and `adaptive-test-83`, while `isElectronic` flags whether the test was conducted electronically. Foreign keys `phaseId`, `eventId`, and `regulationId` link the test to its phase, its parent inspection event, and the applicable regulation.

**Table `TestSheet`**

| testSheetId | testType | testDate | resultStatus | approvedBy | approvalDate | testSpecification | isElectronic | phaseId | eventId | regulationId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 2106711 | sanitary_sewer | 2024-11-13T22:42:00 | pass | regional-approved-54 | 2023-10-10T21:27:00 | compact-test-80 | false | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 5006448 | storm_sewer | 2025-04-24T05:59:00 | fail | legacy-approved-55 | 2024-03-21T04:44:00 | composite-test-81 | true | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3001009030020 | pressure | 2022-09-08T12:16:00 | pending_review | compact-approved-56 | 2025-08-05T11:01:00 | primary-test-82 | false | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | flow | 2023-02-19T19:33:00 | pass | composite-approved-57 | 2022-01-16T18:18:00 | adaptive-test-83 | true | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Drawings document the design artefacts associated with each phase. The `Drawing` table uses a surrogate `id` (e.g., `1000`) alongside a business `drawingId` that may be numeric (`2839514`) or a UUID. The `drawingType` distinguishes between `stub_out`, `as_built`, and `infrastructure` drawings. Submission metadata includes `submissionDate`, `format` (`electronic` or `paper`), `status` (`draft`, `submitted`, `approved`, `rejected`), and `fileSize` in megabytes — row `1003` records a `254.85016` MB paper drawing. The `isElectronic` flag and foreign keys `phaseId`, `regulationId`, and `referencesPhaseId` (which allows a drawing to reference another phase) complete the entity.

**Table `Drawing`**

| id | drawingId | drawingType | submissionDate | format | status | fileSize | isElectronic | phaseId | regulationId | referencesPhaseId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2839514 | stub_out | 2025-04-24T03:57:00 | electronic | draft | 61.0 | false | 1 | 1 | 1 |
| 1001 | 2618575 | as_built | 2022-09-08T10:14:00 | paper | submitted | 1.33 | true | 2 | 2 | 2 |
| 1002 | 5f927026-8fcd-11eb-924d-9cd76263cbd0 | infrastructure | 2023-02-19T17:31:00 | electronic | approved | 11.0 | false | 3 | 3 | 3 |
| 1003 | 26648045 | stub_out | 2024-07-03T00:48:00 | paper | rejected | 254.85016 | true | 4 | 4 | 4 |

Deficiencies capture defects identified during inspections. The `Deficiency` table uses `deficiencyId` as its primary key — values range from integers like `13910633` to the string `client-focus`. The `description` field provides a human-readable label such as `Extended Survey` or `Pilot Corridor A`. Severity is classified as `minor`, `major`, or `critical`, and temporal tracking uses `identifiedDate` and `correctedDate`. The `status` column records the remediation state with values including `open`, `in_progress`, `closed`, and `rejected`. A boolean `requiresReInspection` indicates whether the correction must be verified. Foreign keys `eventId`, `contractorId`, and `verifiedByEventId` link the deficiency to its originating inspection, the responsible contractor, and the verification inspection event.

**Table `Deficiency`**

| deficiencyId | description | severity | identifiedDate | correctedDate | status | requiresReInspection | eventId | contractorId | verifiedByEventId |
|---|---|---|---|---|---|---|---|---|---|
| 13910633 | Extended Survey | minor | 2022-01-10T12:00:00 | 2025-12-21T23:33:00 | open | false | 100 | 1000 | 100 |
| 8387527 | Pilot Corridor A | major | 2023-06-21T19:17:00 | 2022-05-05T06:50:00 | in_progress | true | 101 | 1001 | 101 |
| 9474 | Baseline Series | critical | 2024-11-05T02:34:00 | 2023-10-16T13:07:00 | closed | false | 102 | 1002 | 102 |
| client-focus | Distributed Assessment | minor | 2025-04-16T09:51:00 | 2024-03-27T20:24:00 | rejected | true | 103 | 1003 | 103 |

Regulations provide the normative framework. The `Regulation` table uses a surrogate `id` and stores a business `ruleId`, a `ruleNumber` such as `RUL-2640`, and a `ruleTitle` like `Integrated Assessment A`. The `effectiveDate` marks when the regulation took effect, `issuingAuthority` names the body (e.g., `extended-issuing-33`), and `isElectronicRequired` indicates whether electronic submission is mandatory. The `scope` column holds values like `integrated-scope-52` and `legacy-scope-55`. Foreign keys `sheetTestSheetId`, `drawingId`, and `phaseId` link each regulation to its associated test sheet, drawing, and phase.

**Table `Regulation`**

| id | ruleId | ruleNumber | ruleTitle | effectiveDate | issuingAuthority | isElectronicRequired | scope | sheetTestSheetId | drawingId | phaseId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1437602 | RUL-2640 | Integrated Assessment A | 2023-02-14 | extended-issuing-33 | true | integrated-scope-52 | 2106711 | 1000 | 1 |
| 2 | 325452 | RUL-2647 | Extended Survey | 2024-07-25 | integrated-issuing-34 | false | seasonal-scope-53 | 5006448 | 1001 | 2 |
| 3 | 9246325 | RUL-2654 | Pilot Corridor | 2025-12-09 | seasonal-issuing-35 | true | regional-scope-54 | 3001009030020 | 1002 | 3 |
| 4 | 14985260 | RUL-2661 | Baseline Series D | 2022-05-20 | regional-issuing-36 | false | legacy-scope-55 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1003 | 4 |

Contractors and Developers are the organisational actors. The `Contractor` table records entities responsible for construction and remediation work, while the `Developer` table captures the organisations that initiate and fund infrastructure programmes. Both tables provide the organisational context for deficiencies and phases respectively.

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

## Junction Tables and Many-to-Many Relationships

The schema employs three junction tables to resolve many-to-many relationships between infrastructure phases and their associated artefacts. The `InfrastructurePhaseInspectionEvent` junction table links phases to the inspection events that occur within them, enabling a single phase to host multiple inspections and a single inspection to be associated with multiple phases.

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

Similarly, `InfrastructurePhaseTestSheet` connects phases to their test sheets, allowing a phase to accumulate numerous test records and a test sheet to be referenced across phases.

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

The `InfrastructurePhaseDrawing` junction table serves the same purpose for drawings, supporting the many-to-many association between phases and design documents.

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

These junction tables are the structural glue that permits flexible, denormalised reporting through the view layer while preserving normalised storage in the base tables.

## Views as Domain Fact Reconstructors

The view layer reassembles normalised data into domain-meaningful records. Each view answers a specific analytical question by joining the appropriate base and junction tables.

The view `vw_infrastructure_phase_inspection_event_detail` reconstructs the complete picture of an inspection event within its phase context, joining `InspectionEvent` with `InfrastructurePhase` and the junction table. It answers the question: "What inspection occurred in which phase, and what were its quantitative outcomes?" Row `100` of the underlying data shows that inspection `BJanecke` of type `final` occurred in phase `PHA-2052` (`Baseline Series D`), with `32` deficiencies and `42` punch-list items, and was conducted by `City_Engineering`.

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

The view `vw_infrastructure_phase_test_sheet_detail` joins `TestSheet` with `InfrastructurePhase` through the junction table, answering: "Which tests were performed in which phase, and what were their results?" Row `2106711` reveals that a `sanitary_sewer` test with result `pass`, approved by `regional-approved-54`, was conducted in phase `PHA-2052` under specification `compact-test-80`.

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

The view `vw_infrastructure_phase_drawing_detail` joins `Drawing` with `InfrastructurePhase` via the junction table, answering: "Which drawings are associated with which phase, and what is their submission status?" Row `1000` shows a `stub_out` drawing (`2839514`) in `draft` format, submitted electronically with a file size of `61.0` MB, linked to phase `PHA-2052`.

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

The view `vw_inspection_event_infrastructure_phase` inverts the perspective, presenting each inspection event alongside its parent phase details. It answers: "Given an inspection, which phase does it belong to, and what is that phase's lifecycle state?" Row `101` shows inspection `575199` of type `re-inspection` belonging to phase `PHA-2056` (`Distributed Assessment`), which has status `in_progress` and is guaranteed.

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

The view `vw_inspection_event_deficiency` joins `InspectionEvent` with `Deficiency`, answering: "What deficiencies were identified during a given inspection, and what are their severity and remediation status?" Row `100` links inspection `BJanecke` to deficiency `13910633` (`Extended Survey`), classified as `minor` severity with status `open` and not requiring re-inspection.

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

The view `vw_inspection_event_test_sheet` joins `InspectionEvent` with `TestSheet`, answering: "Which test sheets are associated with a given inspection event?" Row `100` connects inspection `BJanecke` to test sheet `2106711`, a `sanitary_sewer` test that passed.

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

The view `vw_test_sheet_infrastructure_phase` joins `TestSheet` with `InfrastructurePhase`, answering: "Which phase did a given test sheet belong to, and what was that phase's status?" Row `2106711` links the `sanitary_sewer` test to phase `PHA-2052` (`Baseline Series D`), which was in `planned` status.

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

The view `vw_test_sheet_inspection_event` joins `TestSheet` with `InspectionEvent`, answering: "Which inspection event triggered a given test sheet?" Row `2106711` traces back to inspection `BJanecke` of type `final`.

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

The view `vw_test_sheet_regulation` joins `TestSheet` with `Regulation`, answering: "Which regulation governs a given test sheet?" Row `2106711` is governed by regulation `RUL-2640` (`Integrated Assessment A`), issued by `extended-issuing-33` with scope `integrated-scope-52`.

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

The view `vw_drawing_infrastructure_phase` joins `Drawing` with `InfrastructurePhase`, answering: "Which phase is a given drawing associated with, and what is that phase's lifecycle state?" Row `1000` links drawing `2839514` (`stub_out`, `draft`) to phase `PHA-2052` (`Baseline Series D`).

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

The view `vw_drawing_regulation` joins `Drawing` with `Regulation`, answering: "Which regulation governs a given drawing?" Row `1000` is governed by regulation `RUL-2640` (`Integrated Assessment A`).

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

The view `vw_deficiency_inspection_event` joins `Deficiency` with `InspectionEvent`, answering: "Which inspection event identified a given deficiency, and what were the inspection's quantitative outcomes?" Row `13910633` (`Extended Survey`, `minor`, `open`) was identified during inspection `BJanecke` which recorded `32` total deficiencies and `42` punch-list items.

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

The view `vw_deficiency_contractor` joins `Deficiency` with `Contractor`, answering: "Which contractor is responsible for correcting a given deficiency?" Row `13910633` is assigned to contractor `1000`.

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

The view `vw_regulation_test_sheet` joins `Regulation` with `TestSheet`, answering: "Which test sheets are governed by a given regulation?" Row `1` (`RUL-2640`) governs test sheet `2106711` (`sanitary_sewer`, `pass`).

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

The view `vw_regulation_drawing` joins `Regulation` with `Drawing`, answering: "Which drawings are governed by a given regulation?" Row `1` (`RUL-2640`) governs drawing `1000` (`stub_out`, `draft`).

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

The view `vw_regulation_infrastructure_phase` joins `Regulation` with `InfrastructurePhase`, answering: "Which phase is governed by a given regulation, and what is that phase's lifecycle state?" Row `1` (`RUL-2640`) governs phase `PHA-2052` (`Baseline Series D`), which was in `planned` status.

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

The view `vw_contractor_deficiency` joins `Contractor` with `Deficiency`, answering: "Which deficiencies is a given contractor responsible for, and what are their severity and status?" Row `1000` is responsible for deficiency `13910633` (`Extended Survey`, `minor`, `open`).

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

The view `vw_contractor_developer` joins `Contractor` with `Developer`, answering: "Which developer engaged a given contractor?" This view provides the organisational chain of responsibility from developer through contractor to the work performed.

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

The view `vw_developer_infrastructure_phase` joins `Developer` with `InfrastructurePhase`, answering: "Which developer initiated a given phase, and what is that phase's lifecycle state?" This view traces the ownership of each phase back to its sponsoring developer.

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

The view `vw_developer_contractor` joins `Developer` with `Contractor`, answering: "Which contractors has a given developer engaged?" This view maps the organisational network of development contracts.

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

The view `vw_developer_drawing` joins `Developer` with `Drawing`, answering: "Which drawings are associated with phases initiated by a given developer?" Row `1000` (`stub_out`, `draft`) traces back through its phase to the sponsoring developer.

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

## Synthesis

The schema models infrastructure lifecycle management as a network of interrelated entities anchored by `InfrastructurePhase`. Phases host inspection events, which in turn generate deficiencies and trigger test sheets. Drawings document the design intent for each phase, while regulations provide the normative constraints that govern tests, drawings, and phases alike. Contractors bear responsibility for deficiency remediation, and developers orchestrate the entire programme. The three junction tables — `InfrastructurePhaseInspectionEvent`, `InfrastructurePhaseTestSheet`, and `InfrastructurePhaseDrawing` — resolve the many-to-many relationships between phases and their artefacts, enabling flexible associations without data duplication. The view layer then reassembles these normalised fragments into domain-meaningful records: inspection details enriched with phase context, deficiency reports linked to their originating inspections and responsible contractors, test sheets traced to their governing regulations, and drawings mapped to their sponsoring developers. Together, the base tables, junction tables, and views form a coherent relational model that faithfully materialises the domain ontology while supporting the analytical queries that infrastructure managers depend upon.