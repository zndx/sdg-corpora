The Homeowners Association (HOA) domain captures the lifecycle of property lots, their resident members, and the enforcement mechanisms that keep community standards in check. At its core, the model tracks individual parcels of land—each identified by a lot code such as `LOT-2079` or `LOT-2100`—and associates them with the people who hold membership rights, the violations that arise on those parcels, the financial assessments levied in response, and the remedial actions taken to resolve them. A governance layer of HOA boards and management companies sits atop this operational data, providing oversight and accountability. The following sections walk through how each entity type is represented as a relational table, how foreign keys encode cardinality-bounded relationships, and how the materialized views reconstruct the domain facts that stakeholders need to answer concrete questions about the community.

## Base Tables and Entity Types

The foundation of the schema consists of seven base tables, each corresponding to a distinct entity type in the HOA domain. The first table, `h_o_a_lots`, stores the canonical record for every parcel under the association's jurisdiction. Its primary key `h_o_a_lot_id` is an integer surrogate, while the business identifier `lot_identifier` carries human-readable codes like `LOT-2079`, `LOT-2086`, `LOT-2093`, and `LOT-2100`. The column `legal_description` holds descriptive strings such as `Composite Protocol` and `Regional Framework`, and `county` records the jurisdictional county (e.g., `primary-county-52`, `adaptive-county-53`). The `parcel_number` column mirrors the lot identifier with a `PAR-` prefix (`PAR-2554`, `PAR-2556`, etc.). Timestamps `created_at` and `updated_at` track the lifecycle of each lot record, with values like `2025-01-01 00:14:00` and `2025-01-02 00:41:00` for the first row.

**Table `h_o_a_lots`**

| h_o_a_lot_id | lot_identifier | legal_description | county | parcel_number | h_o_a_violation_id | h_o_a_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | LOT-2079 | Composite Protocol | primary-county-52 | PAR-2554 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | LOT-2086 | Compact Programme A | adaptive-county-53 | PAR-2556 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | LOT-2093 | Legacy Standard | distributed-county-54 | PAR-2558 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | LOT-2100 | Regional Framework | baseline-county-55 | PAR-2560 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The second table, `h_o_a_members`, represents the people who hold membership in the association. Its primary key `h_o_a_member_id` is an integer, and the business identifier `member_identifier` carries codes such as `MEM-2656` and `MEM-2668`. The columns `voting_rights_status` and `recreational_access_status` are categorical fields that take values like `active` and `suspended`—for instance, member `MEM-2656` (Christopher Wilson) has `active` status in both dimensions, while member `MEM-2660` (Charles Larsen) is `suspended` in both. The `contact_email` column stores the member's email address, and the foreign key `h_o_a_lot_id` binds each member to exactly one lot, establishing a many-to-one relationship from members to lots. The column `h_o_a_violation_id` on this table creates a direct link from a member to a specific violation record.

**Table `h_o_a_members`**

| h_o_a_member_id | member_identifier | voting_rights_status | recreational_access_status | contact_email | h_o_a_lot_id | h_o_a_violation_id |
|---|---|---|---|---|---|---|
| 1000 | MEM-2656 | active | active | Christopher Wilson | 1 | 1 |
| 1001 | MEM-2660 | suspended | suspended | Charles Larsen | 2 | 2 |
| 1002 | MEM-2664 | active | active | Mary Alvarez | 3 | 3 |
| 1003 | MEM-2668 | suspended | suspended | April Snyder | 4 | 4 |

The third table, `h_o_a_violations`, is the central enforcement entity. Its primary key `h_o_a_violation_id` is an integer, and the business identifier `violation_identifier` carries codes like `VIO-2384` and `VIO-2405`. The column `violation_type` is categorical, with values such as `distributed-violatio-54`, `baseline-violatio-55`, `pilot-violatio-56`, and `extended-violatio-57`. The `severity_level` column takes values from the set `{minor, moderate, major}`—for example, `VIO-2384` is `minor`, while `VIO-2398` is `major`. The boolean column `is_continuing` indicates whether the violation persists (values `true` and `false`), and `reported_date` stores the ISO-8601 timestamp of the report (e.g., `2025-04-27T03:09:00`). The `resolution_status` column is categorical, with values including `pending`, `under_review`, `resolved`, and `escalated`. The foreign key `h_o_a_lot_id` binds each violation to the lot on which it occurred, and `h_o_a_member_id` binds it to the member responsible. Additional foreign keys `h_o_a_assessment_id` and `h_o_a_remedial_action_id` link the violation to its associated financial assessment and remedial action, respectively.

**Table `h_o_a_violations`**

| h_o_a_violation_id | violation_identifier | violation_type | severity_level | is_continuing | reported_date | resolution_status | h_o_a_lot_id | h_o_a_member_id | h_o_a_assessment_id | h_o_a_remedial_action_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | VIO-2384 | distributed-violatio-54 | minor | true | 2025-04-27T03:09:00 | pending | 1 | 1000 | 1000 | 1 |
| 2 | VIO-2391 | baseline-violatio-55 | moderate | false | 2022-09-11T10:26:00 | under_review | 2 | 1001 | 1001 | 2 |
| 3 | VIO-2398 | pilot-violatio-56 | major | true | 2023-02-22T17:43:00 | resolved | 3 | 1002 | 1002 | 3 |
| 4 | VIO-2405 | extended-violatio-57 | minor | false | 2024-07-06T00:00:00 | escalated | 4 | 1003 | 1003 | 4 |

The fourth table, `h_o_a_assessments`, records the financial consequences of violations. Its primary key `h_o_a_assessment_id` is an integer, and the business identifier `assessment_identifier` carries codes such as `ASS-2505` and `ASS-2520`. The column `assessment_type` is categorical, with values like `fine`, `late_charge`, and `abatement_cost`. The `amount` column stores the monetary value (e.g., `13.49`, `25.47`, `19.72`, `12.74`), and `due_date` stores the payment deadline as a date (e.g., `2024-11-11`, `2025-04-22`). The `payment_status` column is categorical, with values including `pending`, `paid`, `delinquent`, and `under_lien`. The `issuance_date` column stores the ISO-8601 timestamp when the assessment was issued. The foreign key `h_o_a_lot_id` binds each assessment to the lot it concerns, `h_o_a_violation_id` links it to the triggering violation, and `h_o_a_board_id` links it to the board that authorized it.

**Table `h_o_a_assessments`**

| h_o_a_assessment_id | assessment_identifier | assessment_type | amount | due_date | payment_status | issuance_date | h_o_a_lot_id | h_o_a_violation_id | h_o_a_board_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | ASS-2505 | fine | 13.49 | 2024-11-11 | pending | 2022-01-17T12:36:00 | 1 | 1 | 1 |
| 1001 | ASS-2510 | late_charge | 25.47 | 2025-04-22 | paid | 2023-06-01T19:53:00 | 2 | 2 | 2 |
| 1002 | ASS-2515 | abatement_cost | 19.72 | 2022-09-06 | delinquent | 2024-11-12T02:10:00 | 3 | 3 | 3 |
| 1003 | ASS-2520 | fine | 12.74 | 2023-02-17 | under_lien | 2025-04-23T09:27:00 | 4 | 4 | 4 |

The fifth table, `h_o_a_remedial_actions`, captures the corrective measures taken in response to violations. Its primary key is `id` (an integer), and the business identifier `action_identifier` carries codes such as `ACT-2345` and `ACT-2360`. The column `action_type` is categorical, with values like `direct_resolution`, `management_intervention`, `monetary_fine`, and `self_help_abatement`. The `initiation_date` column stores the ISO-8601 timestamp when the action began (e.g., `2025-12-09T11:57:00`), and the `status` column is categorical, with values including `initiated`, `in_progress`, `completed`, and `failed`. The `cost_incurred` column stores the monetary cost (e.g., `12.74`, `12.34`, `12.36`, `19.93`). The foreign key `h_o_a_violation_id` binds each action to the violation it addresses, `h_o_a_member_id` links it to the member responsible for carrying it out, and `h_o_a_assessment_id` links it to the associated financial assessment. Timestamps `created_at` and `updated_at` track the lifecycle of each action record.

**Table `h_o_a_remedial_actions`**

| id | action_identifier | action_type | initiation_date | status | cost_incurred | h_o_a_violation_id | h_o_a_member_id | h_o_a_assessment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACT-2345 | direct_resolution | 2025-12-09T11:57:00 | initiated | 12.74 | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ACT-2350 | management_intervention | 2022-05-20T18:14:00 | in_progress | 12.34 | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ACT-2355 | monetary_fine | 2023-10-04T01:31:00 | completed | 12.36 | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ACT-2360 | self_help_abatement | 2024-03-15T08:48:00 | failed | 19.93 | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The sixth table, `h_o_a_boards`, represents the governance bodies of the association. Its primary key `h_o_a_board_id` is an integer, and the business identifier `board_identifier` carries codes such as `BOA-2651` and `BOA-2654`. The `meeting_date` column stores the date of the board meeting (e.g., `2023-10-23`, `2024-03-07`), and the boolean column `quorum_status` indicates whether a quorum was present (`true` or `false`). The foreign key `h_o_a_assessment_id` links each board to the assessment it authorized, and `h_o_a_remedial_action_id` links it to the remedial action it oversaw.

**Table `h_o_a_boards`**

| h_o_a_board_id | board_identifier | meeting_date | quorum_status | h_o_a_assessment_id | h_o_a_remedial_action_id |
|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23 | true | 1000 | 1 |
| 2 | BOA-2652 | 2024-03-07 | false | 1001 | 2 |
| 3 | BOA-2653 | 2025-08-18 | true | 1002 | 3 |
| 4 | BOA-2654 | 2022-01-02 | false | 1003 | 4 |

The seventh table, `h_o_a_management_companies`, represents the external management organizations contracted by the association. While no sample rows are shown in the reference data, this table exists as a base entity in the schema, providing the organizational context for board-level decisions and enforcement actions.

**Table `h_o_a_management_companies`**

| h_o_a_management_company_id | company_identifier | company_name | contract_start_date | h_o_a_violation_id | h_o_a_board_id |
|---|---|---|---|---|---|
| 1 | Feedback Ratings | Feedback Rating | 2022-01-26 | 1 | 1 |
| 2 | PTNK Photography Club | Virgin Group | 2023-06-10 | 2 | 2 |
| 3 | Feedback Ratings | United Technologies | 2024-11-21 | 3 | 3 |
| 4 | Identity Alliance | Link Title | 2025-04-05 | 4 | 4 |

## Foreign-Key Relationships and Cardinality

The foreign keys across these seven tables encode a directed acyclic graph of relationships that mirrors the HOA's operational workflow. The relationship from `h_o_a_lots` to `h_o_a_members` is one-to-many: each lot can have multiple members, but each member is bound to exactly one lot via the `h_o_a_lot_id` foreign key in `h_o_a_members`. The relationship from `h_o_a_lots` to `h_o_a_violations` is also one-to-many: each lot can have multiple violations, but each violation is bound to exactly one lot via the `h_o_a_lot_id` foreign key in `h_o_a_violations`. The relationship from `h_o_a_violations` to `h_o_a_assessments` is one-to-one in the sample data (each violation has exactly one assessment), but the schema supports one-to-many: a single violation could generate multiple assessments over time. The relationship from `h_o_a_violations` to `h_o_a_remedial_actions` is similarly one-to-one in the sample data but supports one-to-many. The relationship from `h_o_a_assessments` to `h_o_a_boards` is one-to-many: each assessment is authorized by exactly one board, but each board can authorize multiple assessments. The relationship from `h_o_a_remedial_actions` to `h_o_a_boards` is one-to-many: each remedial action is overseen by exactly one board, but each board can oversee multiple actions. The relationship from `h_o_a_members` to `h_o_a_violations` is one-to-many: each member can be associated with multiple violations via the `h_o_a_violation_id` foreign key in `h_o_a_members`.

## Materialized Views

The materialized views in this schema are denormalized join projections that reconstruct domain facts from the normalized base tables. Each view answers a specific analytical question by joining two or more base tables along their foreign-key relationships. The naming convention `v_<entity_a>_<entity_b>` indicates that the view joins entity A to entity B, with entity A as the driving (left) table.

The view `v_h_o_a_lot_h_o_a_violation` joins `h_o_a_lots` to `h_o_a_violations` on `h_o_a_lot_id`, answering the question: "Which violations occurred on which lots?" For the first row, it reconstructs the fact that lot `LOT-2079` (with legal description `Composite Protocol` and parcel `PAR-2554`) is associated with violation `VIO-2384` of type `distributed-violatio-54` at `minor` severity, reported on `2025-04-27T03:09:00` with status `pending`.

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

The view `v_h_o_a_lot_h_o_a_assessment` joins `h_o_a_lots` to `h_o_a_assessments` on `h_o_a_lot_id`, answering: "What financial assessments are tied to which lots?" For the first row, it reconstructs the fact that lot `LOT-2079` has assessment `ASS-2505` of type `fine` in the amount of `13.49`, due on `2024-11-11` with status `pending`.

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

The view `v_h_o_a_member_h_o_a_lot` joins `h_o_a_members` to `h_o_a_lots` on `h_o_a_lot_id`, answering: "Which members are associated with which lots?" For the first row, it reconstructs the fact that member `MEM-2656` (Christopher Wilson, with `active` voting and recreational status) is associated with lot `LOT-2079`.

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

The view `v_h_o_a_member_h_o_a_violation` joins `h_o_a_members` to `h_o_a_violations` on `h_o_a_violation_id`, answering: "Which violations are associated with which members?" For the first row, it reconstructs the fact that member `MEM-2656` (Christopher Wilson) is associated with violation `VIO-2384` of type `distributed-violatio-54` at `minor` severity.

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

The view `v_h_o_a_violation_h_o_a_lot` joins `h_o_a_violations` to `h_o_a_lots` on `h_o_a_lot_id`, answering: "Which lots are associated with which violations?" This is the inverse perspective of `v_h_o_a_lot_h_o_a_violation`. For the first row, it reconstructs the fact that violation `VIO-2384` (type `distributed-violatio-54`, severity `minor`, reported `2025-04-27T03:09:00`, status `pending`) occurred on lot `LOT-2079` with legal description `Composite Protocol`.

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

The view `v_h_o_a_violation_h_o_a_member` joins `h_o_a_violations` to `h_o_a_members` on `h_o_a_member_id`, answering: "Which members are associated with which violations?" This is the inverse perspective of `v_h_o_a_member_h_o_a_violation`. For the first row, it reconstructs the fact that violation `VIO-2384` is associated with member `MEM-2656` (Christopher Wilson, `active` voting and recreational status).

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

The view `v_h_o_a_violation_h_o_a_assessment` joins `h_o_a_violations` to `h_o_a_assessments` on `h_o_a_assessment_id`, answering: "What financial assessments are tied to which violations?" For the first row, it reconstructs the fact that violation `VIO-2384` (type `distributed-violatio-54`, severity `minor`, status `pending`) is associated with assessment `ASS-2505` of type `fine` in the amount of `13.49`, due on `2024-11-11` with status `pending`.

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

The view `v_h_o_a_violation_h_o_a_remedial_action` joins `h_o_a_violations` to `h_o_a_remedial_actions` on `h_o_a_remedial_action_id`, answering: "What remedial actions are tied to which violations?" For the first row, it reconstructs the fact that violation `VIO-2384` is associated with remedial action `ACT-2345` of type `direct_resolution`, initiated on `2025-12-09T11:57:00` with status `initiated` and cost `12.74`.

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

The view `v_h_o_a_assessment_h_o_a_lot` joins `h_o_a_assessments` to `h_o_a_lots` on `h_o_a_lot_id`, answering: "Which lots are associated with which assessments?" This is the inverse perspective of `v_h_o_a_lot_h_o_a_assessment`. For the first row, it reconstructs the fact that assessment `ASS-2505` (type `fine`, amount `13.49`, due `2024-11-11`, status `pending`) is associated with lot `LOT-2079` with legal description `Composite Protocol`.

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

The view `v_h_o_a_assessment_h_o_a_violation` joins `h_o_a_assessments` to `h_o_a_violations` on `h_o_a_violation_id`, answering: "Which violations triggered which assessments?" This is the inverse perspective of `v_h_o_a_violation_h_o_a_assessment`. For the first row, it reconstructs the fact that assessment `ASS-2505` (type `fine`, amount `13.49`, status `pending`) was triggered by violation `VIO-2384` (type `distributed-violatio-54`, severity `minor`, status `pending`).

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

The view `v_h_o_a_assessment_h_o_a_board` joins `h_o_a_assessments` to `h_o_a_boards` on `h_o_a_board_id`, answering: "Which boards authorized which assessments?" For the first row, it reconstructs the fact that assessment `ASS-2505` (type `fine`, amount `13.49`, status `pending`) was authorized by board `BOA-2651` on `2023-10-23` with quorum status `true`.

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

The view `v_h_o_a_remedial_action_h_o_a_violation` joins `h_o_a_remedial_actions` to `h_o_a_violations` on `h_o_a_violation_id`, answering: "Which violations triggered which remedial actions?" This is the inverse perspective of `v_h_o_a_violation_h_o_a_remedial_action`. For the first row, it reconstructs the fact that remedial action `ACT-2345` (type `direct_resolution`, status `initiated`, cost `12.74`) was triggered by violation `VIO-2384` (type `distributed-violatio-54`, severity `minor`, status `pending`).

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

The view `v_h_o_a_remedial_action_h_o_a_member` joins `h_o_a_remedial_actions` to `h_o_a_members` on `h_o_a_member_id`, answering: "Which members are responsible for which remedial actions?" For the first row, it reconstructs the fact that remedial action `ACT-2345` (type `direct_resolution`, status `initiated`, cost `12.74`) is the responsibility of member `MEM-2656` (Christopher Wilson, `active` voting and recreational status).

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

The view `v_h_o_a_remedial_action_h_o_a_assessment` joins `h_o_a_remedial_actions` to `h_o_a_assessments` on `h_o_a_assessment_id`, answering: "Which assessments are associated with which remedial actions?" For the first row, it reconstructs the fact that remedial action `ACT-2345` (type `direct_resolution`, status `initiated`, cost `12.74`) is associated with assessment `ASS-2505` (type `fine`, amount `13.49`, status `pending`).

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

The view `v_h_o_a_board_h_o_a_assessment` joins `h_o_a_boards` to `h_o_a_assessments` on `h_o_a_assessment_id`, answering: "Which assessments were authorized by which boards?" This is the inverse perspective of `v_h_o_a_assessment_h_o_a_board`. For the first row, it reconstructs the fact that board `BOA-2651` (meeting date `2023-10-23`, quorum `true`) authorized assessment `ASS-2505` (type `fine`, amount `13.49`, status `pending`).

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

The view `v_h_o_a_board_h_o_a_remedial_action` joins `h_o_a_boards` to `h_o_a_remedial_actions` on `h_o_a_remedial_action_id`, answering: "Which remedial actions were overseen by which boards?" For the first row, it reconstructs the fact that board `BOA-2651` (meeting date `2023-10-23`, quorum `true`) oversaw remedial action `ACT-2345` (type `direct_resolution`, status `initiated`, cost `12.74`).

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

The view `v_h_o_a_management_company_h_o_a_violation` joins `h_o_a_management_companies` to `h_o_a_violations`, answering: "Which violations are associated with which management companies?" This view provides the organizational context for enforcement actions, linking the external management entity to the specific violations it oversees.

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

The view `v_h_o_a_management_company_h_o_a_board` joins `h_o_a_management_companies` to `h_o_a_boards`, answering: "Which boards are managed by which management companies?" This view provides the organizational context for governance, linking the external management entity to the specific boards it manages.

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

## Closing Synthesis

The HOA domain model demonstrates a clean separation between operational entities (lots, members, violations, assessments, remedial actions, boards, management companies) and analytical projections (the materialized views). The base tables encode a normalized relational schema where foreign keys establish cardinality-bounded relationships: one lot to many members, one lot to many violations, one violation to one or more assessments, one violation to one or more remedial actions, one assessment to one board, and one remedial action to one board. The materialized views reconstruct the domain facts that stakeholders need by joining these normalized tables along their foreign-key relationships, each view answering a specific question by presenting the joined result as a denormalized fact table. The representative values in the data—lot codes like `LOT-2079`, member names like Christopher Wilson, violation types like `distributed-violatio-54`, assessment amounts like `13.49`, and remedial action types like `direct_resolution`—ground the abstract schema in concrete operational reality, making the model both analytically useful and operationally faithful.