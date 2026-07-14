## Community Governance and Enforcement

A homeowners association operates as a self-governing body that manages shared property standards, collects financial obligations, and enforces community rules across a defined set of residential lots. The operational backbone of any such association consists of property records, member rosters, violation tracking, financial assessments, remedial action logs, board meeting minutes, and the management companies that may be contracted to handle day-to-day administration. Understanding how these pieces interlock is essential for anyone responsible for community compliance, financial oversight, or dispute resolution. The records below capture a snapshot of one such association's operations, spanning four residential lots, four members, and a full lifecycle of violations from initial report through remedial action.

**Table `h_o_a_lots`**

| h_o_a_lot_id | lot_identifier | legal_description | county | parcel_number | h_o_a_violation_id | h_o_a_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | LOT-2079 | Composite Protocol | primary-county-52 | PAR-2554 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | LOT-2086 | Compact Programme A | adaptive-county-53 | PAR-2556 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | LOT-2093 | Legacy Standard | distributed-county-54 | PAR-2558 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | LOT-2100 | Regional Framework | baseline-county-55 | PAR-2560 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The lot table anchors the entire system. Each row represents a distinct parcel within the community, identified by a short code such as LOT-2079 or LOT-2100, and linked to a legal description like "Composite Protocol" or "Regional Framework." The county field records the jurisdiction—primary-county-52, adaptive-county-53, and so on—while the parcel number (PAR-2554 through PAR-2560) ties the lot to the county assessor's records. Timestamps for creation and last update provide an audit trail. In this association, four lots are tracked, each with a corresponding violation and assessment record that ties the property to the enforcement and financial workflows described below.

**Table `h_o_a_members`**

| h_o_a_member_id | member_identifier | voting_rights_status | recreational_access_status | contact_email | h_o_a_lot_id | h_o_a_violation_id |
|---|---|---|---|---|---|---|
| 1000 | MEM-2656 | active | active | Christopher Wilson | 1 | 1 |
| 1001 | MEM-2660 | suspended | suspended | Charles Larsen | 2 | 2 |
| 1002 | MEM-2664 | active | active | Mary Alvarez | 3 | 3 |
| 1003 | MEM-2668 | suspended | suspended | April Snyder | 4 | 4 |

Members are the people who hold rights and obligations within the community. The member table records each person's identifier (MEM-2656 through MEM-2668), their voting and recreational access statuses, and a contact email. Two members—Christopher Wilson and Mary Alvarez—hold active status across both dimensions, while Charles Larsen and April Snyder are suspended from voting and recreational access, reflecting the enforcement actions taken against them. Each member is linked to a specific lot via the lot foreign key, establishing the ownership or occupancy relationship that grounds all subsequent enforcement and billing activity.

**Table `h_o_a_violations`**

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | is_continuing | reported_date | resolution_status | h_o_a_lot_id | h_o_a_member_id | h_o_a_assessment_id | h_o_a_remedial_action_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | true | 2025-04-27T03:09:00 | pending | 1 | 1000 | 1000 | 1 |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | false | 2022-09-11T10:26:00 | under_review | 2 | 1001 | 1001 | 2 |
| 3 | VIO-2398 | pilot-violatio-56 | major | true | 2023-02-22T17:43:00 | resolved | 3 | 1002 | 1002 | 3 |
| 4 | VIO-2405 | extended-violatio-57 | minor | false | 2024-07-06T00:00:00 | escalated | 4 | 1003 | 1003 | 4 |

Violations are the engine of community enforcement. Each violation record captures the nature of the infraction through a type label such as distributed-violatio-54 or baseline-violatio-55, a severity level ranging from minor to major, and a flag indicating whether the violation is continuing. The reported date and resolution status (pending, under_review, resolved, escalated) track the lifecycle of each case. In this dataset, four violations are recorded against the four lots. VIO-2384, a minor distributed violation on LOT-2079, remains pending and is continuing. VIO-2398, a major pilot violation on LOT-2093, has been resolved despite being a continuing violation at the time of reporting. VIO-2405 on LOT-2100 has been escalated, indicating the association determined the issue warranted heightened attention.

**Table `h_o_a_assessments`**

| h_o_a_assessment_id | assessment_identifier | assessment_type | amount | due_date | payment_status | issuance_date | h_o_a_lot_id | h_o_a_violation_id | h_o_a_board_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | ASS-2505 | fine | 13.49 | 2024-11-11 | pending | 2022-01-17T12:36:00 | 1 | 1 | 1 |
| 1001 | ASS-2510 | late_charge | 25.47 | 2025-04-22 | paid | 2023-06-01T19:53:00 | 2 | 2 | 2 |
| 1002 | ASS-2515 | abatement_cost | 19.72 | 2022-09-06 | delinquent | 2024-11-12T02:10:00 | 3 | 3 | 3 |
| 1003 | ASS-2520 | fine | 12.74 | 2023-02-17 | under_lien | 2025-04-23T09:27:00 | 4 | 4 | 4 |

Assessments represent the financial side of enforcement and maintenance. Each assessment carries a type—fine, late_charge, or abatement_cost—along with a dollar amount, a due date, and a payment status that ranges from paid to delinquent to under_lien. The issuance date marks when the charge was formally created. ASS-2505 is a $13.49 fine issued against LOT-2079 that remains pending. ASS-2510, a $25.47 late charge on LOT-2086, has been paid. ASS-2515, an abatement cost of $19.72 on LOT-2093, is delinquent. ASS-2520, a $12.74 fine on LOT-2100, sits under lien, meaning the association has begun formal collection proceedings. Every assessment is tied to a specific lot and a specific violation, creating a direct financial consequence for each infraction.

**Table `h_o_a_remedial_actions`**

| id | action_identifier | action_type | initiation_date | status | cost_incurred | h_o_a_violation_id | h_o_a_member_id | h_o_a_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACT-2345 | direct_resolution | 2025-12-09T11:57:00 | initiated | 12.74 | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ACT-2350 | management_intervention | 2022-05-20T18:14:00 | in_progress | 12.34 | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ACT-2355 | monetary_fine | 2023-10-04T01:31:00 | completed | 12.36 | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ACT-2360 | self_help_abatement | 2024-03-15T08:48:00 | failed | 19.93 | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Remedial actions are the association's response to violations. The action table records what was done—direct_resolution, management_intervention, monetary_fine, or self_help_abatement—when it was initiated, its current status (initiated, in_progress, completed, failed), and the cost incurred. ACT-2345, a direct resolution initiated on 2025-12-09 for VIO-2384, cost $12.74 and remains in the initiated stage. ACT-2350, a management intervention for VIO-2391, is in progress at a cost of $12.34. ACT-2355, a monetary fine for VIO-2398, was completed at a cost of $12.36. ACT-2360, a self-help abatement for VIO-2405, has failed and cost $19.93. Each action is linked to a violation, a member, and an assessment, forming a complete chain from infraction through financial charge to corrective measure.

**Table `h_o_a_boards`**

| h_o_a_board_id | board_identifier | meeting_date | quorum_status | h_o_a_assessment_id | h_o_a_remedial_action_id |
|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23 | true | 1000 | 1 |
| 2 | BOA-2652 | 2024-03-07 | false | 1001 | 2 |
| 3 | BOA-2653 | 2025-08-18 | true | 1002 | 3 |
| 4 | BOA-2654 | 2022-01-02 | false | 1003 | 4 |

The board table records governance decisions. Each row represents a board meeting on a given date with a quorum status indicating whether the meeting was valid. BOA-2651 met on 2023-10-23 with quorum present; BOA-2652 on 2024-03-07 lacked quorum; BOA-2653 on 2025-08-18 had quorum; and BOA-2654 on 2022-01-02 did not. Each board meeting is associated with a specific assessment and remedial action, documenting the governance body's approval or oversight of financial and enforcement decisions.

**Table `h_o_a_management_companies`**

| h_o_a_management_company_id | company_identifier | company_name | contract_start_date | h_o_a_violation_id | h_o_a_board_id |
|---|---|---|---|---|---|
| 1 | Feedback Ratings | Feedback Rating | 2022-01-26 | 1 | 1 |
| 2 | PTNK Photography Club | Virgin Group | 2023-06-10 | 2 | 2 |
| 3 | Feedback Ratings | United Technologies | 2024-11-21 | 3 | 3 |
| 4 | Identity Alliance | Link Title | 2025-04-05 | 4 | 4 |

Management companies provide external administrative support. While the table structure mirrors the other base tables with identifier, name, contact, and status fields, the actual records for this association are not enumerated here. In practice, a management company would be linked to board meetings and violations, serving as the operational bridge between the volunteer board and the day-to-day enforcement of community rules.

### Cross-Reference Views

The base tables capture individual entities, but the real operational picture emerges when they are joined. The following views answer specific investigative questions by combining data across tables.

**View `v_h_o_a_lot_h_o_a_violation`**

```sql
CREATE VIEW v_h_o_a_lot_h_o_a_violation AS
SELECT a.h_o_a_lot_id, a.lot_identifier, a.legal_description, a.county, b.h_o_a_violation_id AS violation_h_o_a_violation_id, b.violation_identifier AS violation_violation_identifier, b.violation_type AS violation_violation_type
FROM h_o_a_lots a JOIN h_o_a_violations b ON a.h_o_a_violation_id = b.h_o_a_violation_id;
```

| h_o_a_lot_id | lot_identifier | legal_description | county | violation_h_o_a_violation_id | violation_violation_identifier | violation_violation_type |
|---|---|---|---|---|---|---|
| 1 | LOT-2079 | Composite Protocol | primary-county-52 | 1 | VIO-2384 | distributed-violatio-54 |
| 2 | LOT-2086 | Compact Programme A | adaptive-county-53 | 2 | VIO-2391 | baseline-violatio-55 |
| 3 | LOT-2093 | Legacy Standard | distributed-county-54 | 3 | VIO-2398 | pilot-violatio-56 |
| 4 | LOT-2100 | Regional Framework | baseline-county-55 | 4 | VIO-2405 | extended-violatio-57 |

This view answers the question: which violations are associated with which lots? It joins the lot table to the violations table, producing rows that pair LOT-2079 with VIO-2384 (a continuing, minor, pending distributed violation) and LOT-2093 with VIO-2398 (a continuing, major, resolved pilot violation). The view makes it immediately clear that LOT-2093 carries the most severe infraction in the community, even though that particular violation has been resolved.

**View `v_h_o_a_lot_h_o_a_assessment`**

```sql
CREATE VIEW v_h_o_a_lot_h_o_a_assessment AS
SELECT a.h_o_a_lot_id, a.lot_identifier, a.legal_description, a.county, b.h_o_a_assessment_id AS assessment_h_o_a_assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_type AS assessment_assessment_type
FROM h_o_a_lots a JOIN h_o_a_assessments b ON a.h_o_a_assessment_id = b.h_o_a_assessment_id;
```

| h_o_a_lot_id | lot_identifier | legal_description | county | assessment_h_o_a_assessment_id | assessment_assessment_identifier | assessment_assessment_type |
|---|---|---|---|---|---|---|
| 1 | LOT-2079 | Composite Protocol | primary-county-52 | 1000 | ASS-2505 | fine |
| 2 | LOT-2086 | Compact Programme A | adaptive-county-53 | 1001 | ASS-2510 | late_charge |
| 3 | LOT-2093 | Legacy Standard | distributed-county-54 | 1002 | ASS-2515 | abatement_cost |
| 4 | LOT-2100 | Regional Framework | baseline-county-55 | 1003 | ASS-2520 | fine |

This view links lots to their financial assessments. LOT-2079 carries ASS-2505, a $13.49 fine in pending status. LOT-2086 carries ASS-2510, a $25.47 late charge that has been paid. LOT-2093 carries ASS-2515, a $19.72 abatement cost that is delinquent. LOT-2100 carries ASS-2520, a $12.74 fine under lien. The view reveals that two of the four lots have outstanding financial obligations, with LOT-2093's delinquency and LOT-2100's lien status representing the most urgent collection priorities.

**View `v_h_o_a_member_h_o_a_lot`**

```sql
CREATE VIEW v_h_o_a_member_h_o_a_lot AS
SELECT a.h_o_a_member_id, a.member_identifier, a.voting_rights_status, a.recreational_access_status, b.h_o_a_lot_id AS lot_h_o_a_lot_id, b.lot_identifier AS lot_lot_identifier, b.legal_description AS lot_legal_description
FROM h_o_a_members a JOIN h_o_a_lots b ON a.h_o_a_lot_id = b.h_o_a_lot_id;
```

| h_o_a_member_id | member_identifier | voting_rights_status | recreational_access_status | lot_h_o_a_lot_id | lot_lot_identifier | lot_legal_description |
|---|---|---|---|---|---|---|
| 1000 | MEM-2656 | active | active | 1 | LOT-2079 | Composite Protocol |
| 1001 | MEM-2660 | suspended | suspended | 2 | LOT-2086 | Compact Programme A |
| 1002 | MEM-2664 | active | active | 3 | LOT-2093 | Legacy Standard |
| 1003 | MEM-2668 | suspended | suspended | 4 | LOT-2100 | Regional Framework |

This view connects members to the lots they occupy or own. Christopher Wilson (MEM-2656, active) is linked to LOT-2079. Charles Larsen (MEM-2660, suspended) to LOT-2086. Mary Alvarez (MEM-2664, active) to LOT-2093. April Snyder (MEM-2668, suspended) to LOT-2100. The suspension status of Larsen and Snyder aligns with the violations and assessments on their respective lots, confirming that the enforcement actions have been applied consistently.

**View `v_h_o_a_member_h_o_a_violation`**

```sql
CREATE VIEW v_h_o_a_member_h_o_a_violation AS
SELECT a.h_o_a_member_id, a.member_identifier, a.voting_rights_status, a.recreational_access_status, b.h_o_a_violation_id AS violation_h_o_a_violation_id, b.violation_identifier AS violation_violation_identifier, b.violation_type AS violation_violation_type
FROM h_o_a_members a JOIN h_o_a_violations b ON a.h_o_a_violation_id = b.h_o_a_violation_id;
```

| h_o_a_member_id | member_identifier | voting_rights_status | recreational_access_status | violation_h_o_a_violation_id | violation_violation_identifier | violation_violation_type |
|---|---|---|---|---|---|---|
| 1000 | MEM-2656 | active | active | 1 | VIO-2384 | distributed-violatio-54 |
| 1001 | MEM-2660 | suspended | suspended | 2 | VIO-2391 | baseline-violatio-55 |
| 1002 | MEM-2664 | active | active | 3 | VIO-2398 | pilot-violatio-56 |
| 1003 | MEM-2668 | suspended | suspended | 4 | VIO-2405 | extended-violatio-57 |

This view answers which members have violations on their records. Christopher Wilson has VIO-2384 (minor, pending, continuing). Charles Larsen has VIO-2391 (moderate, under_review, not continuing). Mary Alvarez has VIO-2398 (major, resolved, continuing). April Snyder has VIO-2405 (minor, escalated, not continuing). The view shows that even active members like Wilson and Alvarez carry violations, and that resolution status does not always correlate with membership status—Alvarez remains active despite a major violation.

**View `v_h_o_a_violation_h_o_a_lot`**

```sql
CREATE VIEW v_h_o_a_violation_h_o_a_lot AS
SELECT a.h_o_a_violation_id, a.violation_identifier, a.violation_type, a.severity_level, b.h_o_a_lot_id AS lot_h_o_a_lot_id, b.lot_identifier AS lot_lot_identifier, b.legal_description AS lot_legal_description
FROM h_o_a_violations a JOIN h_o_a_lots b ON a.h_o_a_lot_id = b.h_o_a_lot_id;
```

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | lot_h_o_a_lot_id | lot_lot_identifier | lot_legal_description |
|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | 1 | LOT-2079 | Composite Protocol |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | 2 | LOT-2086 | Compact Programme A |
| 3 | VIO-2398 | pilot-violatio-56 | major | 3 | LOT-2093 | Legacy Standard |
| 4 | VIO-2405 | extended-violatio-57 | minor | 4 | LOT-2100 | Regional Framework |

This view presents the same lot-violation relationship from the violation side, answering: for each violation, which lot is it on? VIO-2384 is on LOT-2079 (Composite Protocol, PAR-2554). VIO-2391 is on LOT-2086 (Compact Programme A, PAR-2556). VIO-2398 is on LOT-2093 (Legacy Standard, PAR-2558). VIO-2405 is on LOT-2100 (Regional Framework, PAR-2560). This orientation is useful when starting from a violation identifier and needing to locate the property.

**View `v_h_o_a_violation_h_o_a_member`**

```sql
CREATE VIEW v_h_o_a_violation_h_o_a_member AS
SELECT a.h_o_a_violation_id, a.violation_identifier, a.violation_type, a.severity_level, b.h_o_a_member_id AS member_h_o_a_member_id, b.member_identifier AS member_member_identifier, b.voting_rights_status AS member_voting_rights_status
FROM h_o_a_violations a JOIN h_o_a_members b ON a.h_o_a_member_id = b.h_o_a_member_id;
```

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | member_h_o_a_member_id | member_member_identifier | member_voting_rights_status |
|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | 1000 | MEM-2656 | active |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | 1001 | MEM-2660 | suspended |
| 3 | VIO-2398 | pilot-violatio-56 | major | 1002 | MEM-2664 | active |
| 4 | VIO-2405 | extended-violatio-57 | minor | 1003 | MEM-2668 | suspended |

This view pairs each violation with the member responsible. VIO-2384 is attributable to Christopher Wilson (MEM-2656). VIO-2391 to Charles Larsen (MEM-2660). VIO-2398 to Mary Alvarez (MEM-2664). VIO-2405 to April Snyder (MEM-2668). The view confirms a one-to-one mapping in this dataset: each violation corresponds to exactly one member, and each member has exactly one violation.

**View `v_h_o_a_violation_h_o_a_assessment`**

```sql
CREATE VIEW v_h_o_a_violation_h_o_a_assessment AS
SELECT a.h_o_a_violation_id, a.violation_identifier, a.violation_type, a.severity_level, b.h_o_a_assessment_id AS assessment_h_o_a_assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_type AS assessment_assessment_type
FROM h_o_a_violations a JOIN h_o_a_assessments b ON a.h_o_a_assessment_id = b.h_o_a_assessment_id;
```

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | assessment_h_o_a_assessment_id | assessment_assessment_identifier | assessment_assessment_type |
|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | 1000 | ASS-2505 | fine |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | 1001 | ASS-2510 | late_charge |
| 3 | VIO-2398 | pilot-violatio-56 | major | 1002 | ASS-2515 | abatement_cost |
| 4 | VIO-2405 | extended-violatio-57 | minor | 1003 | ASS-2520 | fine |

This view connects violations to their financial consequences. VIO-2384 generated ASS-2505 ($13.49 fine, pending). VIO-2391 generated ASS-2510 ($25.47 late charge, paid). VIO-2398 generated ASS-2515 ($19.72 abatement cost, delinquent). VIO-2405 generated ASS-2520 ($12.74 fine, under lien). The view makes it clear that every violation has a corresponding assessment, and that payment outcomes vary widely—from fully paid to under formal lien.

**View `v_h_o_a_violation_h_o_a_remedial_action`**

```sql
CREATE VIEW v_h_o_a_violation_h_o_a_remedial_action AS
SELECT a.h_o_a_violation_id, a.violation_identifier, a.violation_type, a.severity_level, b.id AS action_id, b.action_identifier AS action_action_identifier, b.action_type AS action_action_type
FROM h_o_a_violations a JOIN h_o_a_remedial_actions b ON a.h_o_a_remedial_action_id = b.id;
```

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | action_id | action_action_identifier | action_action_type |
|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | 1 | ACT-2345 | direct_resolution |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | 2 | ACT-2350 | management_intervention |
| 3 | VIO-2398 | pilot-violatio-56 | major | 3 | ACT-2355 | monetary_fine |
| 4 | VIO-2405 | extended-violatio-57 | minor | 4 | ACT-2360 | self_help_abatement |

This view links violations to the corrective actions taken. VIO-2384 triggered ACT-2345 (direct_resolution, initiated, $12.74). VIO-2391 triggered ACT-2350 (management_intervention, in_progress, $12.34). VIO-2398 triggered ACT-2355 (monetary_fine, completed, $12.36). VIO-2405 triggered ACT-2360 (self_help_abatement, failed, $19.93). The view reveals that remedial approaches vary significantly: some violations are resolved through direct resolution, others through board-level management intervention, and one self-help attempt has failed entirely.

**View `v_h_o_a_assessment_h_o_a_lot`**

```sql
CREATE VIEW v_h_o_a_assessment_h_o_a_lot AS
SELECT a.h_o_a_assessment_id, a.assessment_identifier, a.assessment_type, a.amount, b.h_o_a_lot_id AS lot_h_o_a_lot_id, b.lot_identifier AS lot_lot_identifier, b.legal_description AS lot_legal_description
FROM h_o_a_assessments a JOIN h_o_a_lots b ON a.h_o_a_lot_id = b.h_o_a_lot_id;
```

| h_o_a_assessment_id | assessment_identifier | assessment_type | amount | lot_h_o_a_lot_id | lot_lot_identifier | lot_legal_description |
|---|---|---|---|---|---|---|
| 1000 | ASS-2505 | fine | 13.49 | 1 | LOT-2079 | Composite Protocol |
| 1001 | ASS-2510 | late_charge | 25.47 | 2 | LOT-2086 | Compact Programme A |
| 1002 | ASS-2515 | abatement_cost | 19.72 | 3 | LOT-2093 | Legacy Standard |
| 1003 | ASS-2520 | fine | 12.74 | 4 | LOT-2100 | Regional Framework |

This view presents the assessment-to-lot relationship from the assessment side. ASS-2505 ($13.49 fine) is on LOT-2079. ASS-2510 ($25.47 late charge) is on LOT-2086. ASS-2515 ($19.72 abatement cost) is on LOT-2093. ASS-2520 ($12.74 fine) is on LOT-2100. This orientation is useful for financial reporting, allowing an administrator to start from a charge and locate the responsible property.

**View `v_h_o_a_assessment_h_o_a_violation`**

```sql
CREATE VIEW v_h_o_a_assessment_h_o_a_violation AS
SELECT a.h_o_a_assessment_id, a.assessment_identifier, a.assessment_type, a.amount, b.h_o_a_violation_id AS violation_h_o_a_violation_id, b.violation_identifier AS violation_violation_identifier, b.violation_type AS violation_violation_type
FROM h_o_a_assessments a JOIN h_o_a_violations b ON a.h_o_a_violation_id = b.h_o_a_violation_id;
```

| h_o_a_assessment_id | assessment_identifier | assessment_type | amount | violation_h_o_a_violation_id | violation_violation_identifier | violation_violation_type |
|---|---|---|---|---|---|---|
| 1000 | ASS-2505 | fine | 13.49 | 1 | VIO-2384 | distributed-violatio-54 |
| 1001 | ASS-2510 | late_charge | 25.47 | 2 | VIO-2391 | baseline-violatio-55 |
| 1002 | ASS-2515 | abatement_cost | 19.72 | 3 | VIO-2398 | pilot-violatio-56 |
| 1003 | ASS-2520 | fine | 12.74 | 4 | VIO-2405 | extended-violatio-57 |

This view pairs assessments with their originating violations. ASS-2505 stems from VIO-2384 (distributed-violatio-54, minor). ASS-2510 from VIO-2391 (baseline-violatio-55, moderate). ASS-2515 from VIO-2398 (pilot-violatio-56, major). ASS-2520 from VIO-2405 (extended-violatio-57, minor). The view confirms that assessment types align with violation severity: the major violation (VIO-2398) generated an abatement cost rather than a simple fine, while the minor violations generated standard fines.

**View `v_h_o_a_assessment_h_o_a_board`**

```sql
CREATE VIEW v_h_o_a_assessment_h_o_a_board AS
SELECT a.h_o_a_assessment_id, a.assessment_identifier, a.assessment_type, a.amount, b.h_o_a_board_id AS board_h_o_a_board_id, b.board_identifier AS board_board_identifier, b.meeting_date AS board_meeting_date
FROM h_o_a_assessments a JOIN h_o_a_boards b ON a.h_o_a_board_id = b.h_o_a_board_id;
```

| h_o_a_assessment_id | assessment_identifier | assessment_type | amount | board_h_o_a_board_id | board_board_identifier | board_meeting_date |
|---|---|---|---|---|---|---|
| 1000 | ASS-2505 | fine | 13.49 | 1 | BOA-2651 | 2023-10-23 |
| 1001 | ASS-2510 | late_charge | 25.47 | 2 | BOA-2652 | 2024-03-07 |
| 1002 | ASS-2515 | abatement_cost | 19.72 | 3 | BOA-2653 | 2025-08-18 |
| 1003 | ASS-2520 | fine | 12.74 | 4 | BOA-2654 | 2022-01-02 |

This view connects assessments to the board meetings that approved them. ASS-2505 was reviewed at BOA-2651 (2023-10-23, quorum present). ASS-2510 at BOA-2652 (2024-03-07, no quorum). ASS-2515 at BOA-2653 (2025-08-18, quorum present). ASS-2520 at BOA-2654 (2022-01-02, no quorum). The quorum status is significant: assessments approved at meetings without quorum (BOA-2652 and BOA-2654) may be subject to legal challenge, as the board lacked the minimum membership required to make binding decisions.

**View `v_h_o_a_remedial_action_h_o_a_violation`**

```sql
CREATE VIEW v_h_o_a_remedial_action_h_o_a_violation AS
SELECT a.id, a.action_identifier, a.action_type, a.initiation_date, b.h_o_a_violation_id AS violation_h_o_a_violation_id, b.violation_identifier AS violation_violation_identifier, b.violation_type AS violation_violation_type
FROM h_o_a_remedial_actions a JOIN h_o_a_violations b ON a.h_o_a_violation_id = b.h_o_a_violation_id;
```

| id | action_identifier | action_type | initiation_date | violation_h_o_a_violation_id | violation_violation_identifier | violation_violation_type |
|---|---|---|---|---|---|---|
| 1 | ACT-2345 | direct_resolution | 2025-12-09T11:57:00 | 1 | VIO-2384 | distributed-violatio-54 |
| 2 | ACT-2350 | management_intervention | 2022-05-20T18:14:00 | 2 | VIO-2391 | baseline-violatio-55 |
| 3 | ACT-2355 | monetary_fine | 2023-10-04T01:31:00 | 3 | VIO-2398 | pilot-violatio-56 |
| 4 | ACT-2360 | self_help_abatement | 2024-03-15T08:48:00 | 4 | VIO-2405 | extended-violatio-57 |

This view presents remedial actions from the violation perspective. ACT-2345 addresses VIO-2384. ACT-2350 addresses VIO-2391. ACT-2355 addresses VIO-2398. ACT-2360 addresses VIO-2405. The view confirms that each violation has exactly one remedial action assigned, and that action types range from direct resolution to management intervention to monetary fine to self-help abatement.

**View `v_h_o_a_remedial_action_h_o_a_member`**

```sql
CREATE VIEW v_h_o_a_remedial_action_h_o_a_member AS
SELECT a.id, a.action_identifier, a.action_type, a.initiation_date, b.h_o_a_member_id AS member_h_o_a_member_id, b.member_identifier AS member_member_identifier, b.voting_rights_status AS member_voting_rights_status
FROM h_o_a_remedial_actions a JOIN h_o_a_members b ON a.h_o_a_member_id = b.h_o_a_member_id;
```

| id | action_identifier | action_type | initiation_date | member_h_o_a_member_id | member_member_identifier | member_voting_rights_status |
|---|---|---|---|---|---|---|
| 1 | ACT-2345 | direct_resolution | 2025-12-09T11:57:00 | 1000 | MEM-2656 | active |
| 2 | ACT-2350 | management_intervention | 2022-05-20T18:14:00 | 1001 | MEM-2660 | suspended |
| 3 | ACT-2355 | monetary_fine | 2023-10-04T01:31:00 | 1002 | MEM-2664 | active |
| 4 | ACT-2360 | self_help_abatement | 2024-03-15T08:48:00 | 1003 | MEM-2668 | suspended |

This view links remedial actions to the members affected. ACT-2345 affects Christopher Wilson (MEM-2656). ACT-2350 affects Charles Larsen (MEM-2660). ACT-2355 affects Mary Alvarez (MEM-2664). ACT-2360 affects April Snyder (MEM-2668). The view reinforces the one-to-one mapping across the entire enforcement chain: each member has one violation, one assessment, and one remedial action.

**View `v_h_o_a_remedial_action_h_o_a_assessment`**

```sql
CREATE VIEW v_h_o_a_remedial_action_h_o_a_assessment AS
SELECT a.id, a.action_identifier, a.action_type, a.initiation_date, b.h_o_a_assessment_id AS assessment_h_o_a_assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_type AS assessment_assessment_type
FROM h_o_a_remedial_actions a JOIN h_o_a_assessments b ON a.h_o_a_assessment_id = b.h_o_a_assessment_id;
```

| id | action_identifier | action_type | initiation_date | assessment_h_o_a_assessment_id | assessment_assessment_identifier | assessment_assessment_type |
|---|---|---|---|---|---|---|
| 1 | ACT-2345 | direct_resolution | 2025-12-09T11:57:00 | 1000 | ASS-2505 | fine |
| 2 | ACT-2350 | management_intervention | 2022-05-20T18:14:00 | 1001 | ASS-2510 | late_charge |
| 3 | ACT-2355 | monetary_fine | 2023-10-04T01:31:00 | 1002 | ASS-2515 | abatement_cost |
| 4 | ACT-2360 | self_help_abatement | 2024-03-15T08:48:00 | 1003 | ASS-2520 | fine |

This view connects remedial actions to their associated assessments. ACT-2345 corresponds to ASS-2505 ($13.49). ACT-2350 to ASS-2510 ($25.47). ACT-2355 to ASS-2515 ($19.72). ACT-2360 to ASS-2520 ($12.74). The view allows an administrator to trace the full cost chain from violation through assessment to the actual remedial expenditure, which is essential for budgeting and audit purposes.

**View `v_h_o_a_board_h_o_a_assessment`**

```sql
CREATE VIEW v_h_o_a_board_h_o_a_assessment AS
SELECT a.h_o_a_board_id, a.board_identifier, a.meeting_date, a.quorum_status, b.h_o_a_assessment_id AS assessment_h_o_a_assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_type AS assessment_assessment_type
FROM h_o_a_boards a JOIN h_o_a_assessments b ON a.h_o_a_assessment_id = b.h_o_a_assessment_id;
```

| h_o_a_board_id | board_identifier | meeting_date | quorum_status | assessment_h_o_a_assessment_id | assessment_assessment_identifier | assessment_assessment_type |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23 | true | 1000 | ASS-2505 | fine |
| 2 | BOA-2652 | 2024-03-07 | false | 1001 | ASS-2510 | late_charge |
| 3 | BOA-2653 | 2025-08-18 | true | 1002 | ASS-2515 | abatement_cost |
| 4 | BOA-2654 | 2022-01-02 | false | 1003 | ASS-2520 | fine |

This view presents board meetings alongside the assessments they reviewed. BOA-2651 (2023-10-23, quorum) reviewed ASS-2505. BOA-2652 (2024-03-07, no quorum) reviewed ASS-2510. BOA-2653 (2025-08-18, quorum) reviewed ASS-2515. BOA-2654 (2022-01-02, no quorum) reviewed ASS-2520. The alternating quorum pattern suggests that two of the four board meetings may not have produced legally binding decisions, which could affect the enforceability of the associated assessments.

**View `v_h_o_a_board_h_o_a_remedial_action`**

```sql
CREATE VIEW v_h_o_a_board_h_o_a_remedial_action AS
SELECT a.h_o_a_board_id, a.board_identifier, a.meeting_date, a.quorum_status, b.id AS action_id, b.action_identifier AS action_action_identifier, b.action_type AS action_action_type
FROM h_o_a_boards a JOIN h_o_a_remedial_actions b ON a.h_o_a_remedial_action_id = b.id;
```

| h_o_a_board_id | board_identifier | meeting_date | quorum_status | action_id | action_action_identifier | action_action_type |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23 | true | 1 | ACT-2345 | direct_resolution |
| 2 | BOA-2652 | 2024-03-07 | false | 2 | ACT-2350 | management_intervention |
| 3 | BOA-2653 | 2025-08-18 | true | 3 | ACT-2355 | monetary_fine |
| 4 | BOA-2654 | 2022-01-02 | false | 4 | ACT-2360 | self_help_abatement |

This view pairs board meetings with the remedial actions they authorized. BOA-2651 authorized ACT-2345 (direct_resolution). BOA-2652 authorized ACT-2350 (management_intervention). BOA-2653 authorized ACT-2355 (monetary_fine). BOA-2654 authorized ACT-2360 (self_help_abatement). The view provides a governance audit trail, showing which board meeting approved which corrective measure.

**View `v_h_o_a_management_company_h_o_a_violation`**

```sql
CREATE VIEW v_h_o_a_management_company_h_o_a_violation AS
SELECT a.h_o_a_management_company_id, a.company_identifier, a.company_name, a.contract_start_date, b.h_o_a_violation_id AS violation_h_o_a_violation_id, b.violation_identifier AS violation_violation_identifier, b.violation_type AS violation_violation_type
FROM h_o_a_management_companies a JOIN h_o_a_violations b ON a.h_o_a_violation_id = b.h_o_a_violation_id;
```

| h_o_a_management_company_id | company_identifier | company_name | contract_start_date | violation_h_o_a_violation_id | violation_violation_identifier | violation_violation_type |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Feedback Rating | 2022-01-26 | 1 | VIO-2384 | distributed-violatio-54 |
| 2 | PTNK Photography Club | Virgin Group | 2023-06-10 | 2 | VIO-2391 | baseline-violatio-55 |
| 3 | Feedback Ratings | United Technologies | 2024-11-21 | 3 | VIO-2398 | pilot-violatio-56 |
| 4 | Identity Alliance | Link Title | 2025-04-05 | 4 | VIO-2405 | extended-violatio-57 |

This view would connect management companies to the violations they administered. In this dataset, the management company records are not enumerated, but the view structure supports tracking which external administrator handled each violation case—a useful feature for accountability and performance evaluation of contracted services.

**View `v_h_o_a_management_company_h_o_a_board`**

```sql
CREATE VIEW v_h_o_a_management_company_h_o_a_board AS
SELECT a.h_o_a_management_company_id, a.company_identifier, a.company_name, a.contract_start_date, b.h_o_a_board_id AS board_h_o_a_board_id, b.board_identifier AS board_board_identifier, b.meeting_date AS board_meeting_date
FROM h_o_a_management_companies a JOIN h_o_a_boards b ON a.h_o_a_board_id = b.h_o_a_board_id;
```

| h_o_a_management_company_id | company_identifier | company_name | contract_start_date | board_h_o_a_board_id | board_board_identifier | board_meeting_date |
|---|---|---|---|---|---|---|
| 1 | Feedback Ratings | Feedback Rating | 2022-01-26 | 1 | BOA-2651 | 2023-10-23 |
| 2 | PTNK Photography Club | Virgin Group | 2023-06-10 | 2 | BOA-2652 | 2024-03-07 |
| 3 | Feedback Ratings | United Technologies | 2024-11-21 | 3 | BOA-2653 | 2025-08-18 |
| 4 | Identity Alliance | Link Title | 2025-04-05 | 4 | BOA-2654 | 2022-01-02 |

This view would connect management companies to the board meetings they supported. Again, the management company records are not populated in this dataset, but the relationship enables tracking which company staff attended or facilitated board meetings, providing a record of external administrative involvement in governance decisions.

### Synthesis

The records in this association tell a coherent story of community enforcement. Four lots, four members, four violations, four assessments, four remedial actions, and four board meetings form a tightly coupled system where each infraction triggers a financial charge and a corrective response, all documented through board governance. The data reveals patterns worth noting: two members are suspended, two assessments are delinquent or under lien, two board meetings lacked quorum, and one remedial action has failed. These are not anomalies but operational realities that any practitioner must track, report, and act upon. The views described above provide the analytical lenses through which an administrator can investigate any aspect of the association's enforcement lifecycle, from property-level compliance to board-level governance validity.