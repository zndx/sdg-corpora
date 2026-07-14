## Corporate Governance as a Normalised Relational Model

Corporate governance data captures the relationships between people, boards, committees, and the legal entities they oversee. In this domain, a director holds a role within a board and may serve on one or more committees; a board is an organisational body established under a jurisdiction; a committee is a sub-body of a board; and a corporate entity is a legal organisation that is governed by a board. The schema models these concepts in a way that separates identity from membership, allowing any director to appear on multiple boards and committees without data duplication. The following sections walk through the entity types, their attributes, the foreign-key relationships that bind them, and the views that reconstruct the domain facts from the normalised tables.

### The Director Entity

The `Director` table is the central person table in the model. Each row represents an individual or organisation that holds a governance role. The primary key is `id`, a surrogate integer, while `directorId` is the natural business identifier. The `fullName` column carries the human-readable name, `roleType` classifies the governance role (Executive Director, Non-Executive Director, Independent Non-executive Director), `appointmentDate` records when the appointment took effect, and `status` tracks the current lifecycle state (active, inactive, resigned). The columns `boardId` and `committeeId` are foreign keys that point to the `Board` and `BoardCommittee` tables respectively, anchoring each director to a specific board and committee assignment.

**Table `Director`**

| id | directorId | fullName | roleType | appointmentDate | status | boardId | committeeId |
|---|---|---|---|---|---|---|---|
| 1 | 195339 | Theodore Mcgrath | Executive Director | 2022-05-03 | active | 1 | 100 |
| 2 | 9125611 | Account Name | Non-Executive Director | 2023-10-14 | inactive | 2 | 101 |
| 3 | 2933481 | Saipan International Airport | Independent Non-executive Director | 2024-03-25 | resigned | 3 | 102 |
| 4 | 2087758 | Norma Fisher | Executive Director | 2025-08-09 | active | 4 | 103 |

The four rows in `Director` illustrate the full range of role types and statuses. Theodore Mcgrath (row 1, `directorId` 195339) is an Executive Director appointed on 2022-05-03 and currently active, assigned to board 1 and committee 100. Account Name (row 2, `directorId` 9125611) is a Non-Executive Director whose status is inactive, linked to board 2 and committee 101. Saipan International Airport (row 3, `directorId` 2933481) holds the title Independent Non-executive Director, has resigned, and is associated with board 3 and committee 102. Norma Fisher (row 4, `directorId` 2087758) is an Executive Director, active since 2025-08-09, on board 4 and committee 103. The presence of both integer and UUID-style `directorId` values across the dataset reflects the flexibility of the natural identifier column.

### The Board Entity

The `Board` table defines the governance bodies themselves. Its primary key is `boardId`, and each row carries an `establishmentDate`, a `jurisdiction` code (such as `regional-jurisdic-30` or `legacy-jurisdic-31`), and a `status` that can be active, dissolved, or restructuring.

**Table `Board`**

| boardId | establishmentDate | jurisdiction | status |
|---|---|---|---|
| 1 | 2024-07-11 | regional-jurisdic-30 | active |
| 2 | 2025-12-22 | legacy-jurisdic-31 | dissolved |
| 3 | 2022-05-06 | compact-jurisdic-32 | restructuring |
| 4 | 2023-10-17 | composite-jurisdic-33 | active |

Board 1 was established on 2024-07-11 under `regional-jurisdic-30` and is active. Board 2, established 2025-12-22 under `legacy-jurisdic-31`, is dissolved. Board 3, established 2022-05-06 under `compact-jurisdic-32`, is in restructuring. Board 4, established 2023-10-17 under `composite-jurisdic-33`, is active. The jurisdiction codes are domain-specific strings that classify the regulatory or geographic scope of each board.

### The BoardCommittee Entity

Committees are sub-organisations of boards. The `BoardCommittee` table stores each committee's `committeeId` as primary key, a `committeeName` (Audit Committee, Remuneration Committee, Nomination Committee), an `establishmentDate`, a `status`, and a `directorId` foreign key that identifies the chair or lead director for that committee.

**Table `BoardCommittee`**

| committeeId | committeeName | establishmentDate | status | directorId |
|---|---|---|---|---|
| 100 | Audit Committee | 2024-07-11 | active | 1 |
| 101 | Remuneration Committee | 2025-12-22 | inactive | 2 |
| 102 | Nomination Committee | 2022-05-06 | dissolved | 3 |
| 103 | Audit Committee | 2023-10-17 | active | 4 |

Committee 100 is the Audit Committee, established 2024-07-11, active, chaired by director 1. Committee 101 is the Remuneration Committee, established 2025-12-22, inactive, chaired by director 2. Committee 102 is the Nomination Committee, established 2022-05-06, dissolved, chaired by director 3. Committee 103 is the Audit Committee, established 2023-10-17, active, chaired by director 4. The `directorId` column creates a direct one-to-one link from each committee to its lead director, while the many-to-many membership of directors on committees is captured separately in the junction table described below.

### The CorporateEntity Entity

The `CorporateEntity` table represents the legal organisations that are governed by boards. Its primary key is `id`, and it carries `entityId` (the natural business identifier), `legalName`, `incorporationDate`, `jurisdiction`, `stockCode`, `entityType` (Limited Liability Company, Corporation, Partnership), and a `boardId` foreign key linking the entity to its governing board.

**Table `CorporateEntity`**

| id | entityId | legalName | incorporationDate | jurisdiction | stockCode | entityType | boardId |
|---|---|---|---|---|---|---|---|
| 1 | 1996912 | Adaptive Model | 2025-08-22 | regional-jurisdic-30 | b10c552a-8fcd-11eb-924d-9cd76263cbd0 | Limited Liability Company | 1 |
| 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Primary Cluster | 2022-01-06 | legacy-jurisdic-31 | 3990177 | Corporation | 2 |
| 3 | 9736894 | Composite Review D | 2023-06-17 | compact-jurisdic-32 | 1210-0006-M | Partnership | 3 |
| 4 | 974946 | Compact Initiative | 2024-11-01 | composite-jurisdic-33 | 5243 | Limited Liability Company | 4 |

Entity 1 (id 1, `entityId` 1996912) is named Adaptive Model, incorporated 2025-08-22, under `regional-jurisdic-30`, with stock code `b10c552a-8fcd-11eb-924d-9cd76263cbd0`, structured as a Limited Liability Company, governed by board 1. Entity 2 (`entityId` 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0) is Primary Cluster, incorporated 2022-01-06, under `legacy-jurisdic-31`, stock code 3990177, a Corporation governed by board 2. Entity 3 is Composite Review D, incorporated 2023-06-17, under `compact-jurisdic-32`, stock code 1210-0006-M, a Partnership governed by board 3. Entity 4 is Compact Initiative, incorporated 2024-11-01, under `composite-jurisdic-33`, stock code 5243, a Limited Liability Company governed by board 4. The `entityId` column accepts both integer and UUID formats, reflecting the heterogeneity of real-world entity identifiers.

### Membership Junction Tables

The relationships between directors and boards, and between directors and committees, are modelled as many-to-many associations using junction tables. This design allows a single director to serve on multiple boards and multiple committees independently.

The `BoardDirector` table is the junction between `Board` and `Director`. Its composite primary key is (`boardId`, `directorId`), and each row asserts that a given director sits on a given board.

**Table `BoardDirector`**

| boardId | directorId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The eight rows show that director 1 serves on boards 1 and 4, director 2 serves on boards 1 and 2, director 3 serves on boards 2 and 3, and director 4 serves on boards 3 and 4. This creates a cyclic pattern of board membership: each director is associated with exactly two boards, and each board has exactly two directors. The junction table is the only place where this many-to-many relationship is materialised; the `boardId` column in `Director` and the `boardId` in `CorporateEntity` serve as convenience foreign keys for single-assignment scenarios but do not enforce the full membership graph.

The `BoardCommitteeDirector` table is the junction between `BoardCommittee` and `Director`. Its composite primary key is (`committeeId`, `directorId`), and each row asserts that a given director is a member of a given committee.

**Table `BoardCommitteeDirector`**

| committeeId | directorId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

Director 1 is a member of committees 100 and 103. Director 2 is a member of committees 100 and 101. Director 3 is a member of committees 101 and 102. Director 4 is a member of committees 102 and 103. As with the board junction, each director appears on exactly two committees, and each committee has exactly two members. The `committeeId` column in `Director` provides a convenience link to a single committee assignment but the junction table is the authoritative source for full membership.

### Reconstructing Facts with Views

The base tables store atomic facts in normalised form. Views join these tables to answer domain questions. Each view section below interprets the result of a join, reading concrete rows as evidence.

#### View `v_director_board`

This view joins `Director` with `Board` on `boardId`, producing one row per director with the board's establishment date, jurisdiction, and status appended. It answers the question: "For each director, which board do they belong to, and what are that board's properties?"

**View `v_director_board`**

```sql
CREATE VIEW v_director_board AS
SELECT a.id, a.directorId, a.fullName, a.roleType, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate, b.jurisdiction AS board_jurisdiction
FROM Director a JOIN Board b ON a.boardId = b.boardId;
```

| id | directorId | fullName | roleType | board_boardId | board_establishmentDate | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 195339 | Theodore Mcgrath | Executive Director | 1 | 2024-07-11 | regional-jurisdic-30 |
| 2 | 9125611 | Account Name | Non-Executive Director | 2 | 2025-12-22 | legacy-jurisdic-31 |
| 3 | 2933481 | Saipan International Airport | Independent Non-executive Director | 3 | 2022-05-06 | compact-jurisdic-32 |
| 4 | 2087758 | Norma Fisher | Executive Director | 4 | 2023-10-17 | composite-jurisdic-33 |

Reading the first row: Theodore Mcgrath (directorId 195339, role Executive Director, status active) is assigned to board 1, which was established on 2024-07-11, operates under `regional-jurisdic-30`, and is active. The second row shows Account Name (directorId 9125611, Non-Executive Director, inactive) on board 2, established 2025-12-22, under `legacy-jurisdic-31`, status dissolved. The join is a simple foreign-key lookup from `Director.boardId` to `Board.boardId`.

#### View `v_director_board_committee`

This view extends the previous join by also bringing in `BoardCommittee` via `Director.committeeId`. It answers: "For each director, which board and which committee are they assigned to, and what are the properties of both?"

**View `v_director_board_committee`**

```sql
CREATE VIEW v_director_board_committee AS
SELECT a.id, a.directorId, a.fullName, a.roleType, b.committeeId AS committee_committeeId, b.committeeName AS committee_committeeName, b.establishmentDate AS committee_establishmentDate
FROM Director a JOIN BoardCommittee b ON a.committeeId = b.committeeId;
```

| id | directorId | fullName | roleType | committee_committeeId | committee_committeeName | committee_establishmentDate |
|---|---|---|---|---|---|---|
| 1 | 195339 | Theodore Mcgrath | Executive Director | 100 | Audit Committee | 2024-07-11 |
| 2 | 9125611 | Account Name | Non-Executive Director | 101 | Remuneration Committee | 2025-12-22 |
| 3 | 2933481 | Saipan International Airport | Independent Non-executive Director | 102 | Nomination Committee | 2022-05-06 |
| 4 | 2087758 | Norma Fisher | Executive Director | 103 | Audit Committee | 2023-10-17 |

Row 1 shows Theodore Mcgrath on board 1 (established 2024-07-11, `regional-jurisdic-30`, active) and committee 100 (Audit Committee, established 2024-07-11, active). Row 3 shows Saipan International Airport on board 3 (established 2022-05-06, `compact-jurisdic-32`, restructuring) and committee 102 (Nomination Committee, established 2022-05-06, dissolved). The view demonstrates how a single director row can carry both board-level and committee-level context simultaneously.

#### View `v_board_director_detail`

This view joins `Board` with `Director` through the `BoardDirector` junction table, answering: "Which directors serve on each board?" Unlike `v_director_board`, which is keyed by director, this view is keyed by board and enumerates all directors on that board.

**View `v_board_director_detail`**

```sql
CREATE VIEW v_board_director_detail AS
SELECT a.boardId, a.establishmentDate, a.jurisdiction, b.id AS director_id, b.directorId AS director_directorId, b.fullName AS director_fullName
FROM Board a
  JOIN BoardDirector j ON j.boardId = a.boardId
  JOIN Director b ON b.id = j.directorId;
```

| boardId | establishmentDate | jurisdiction | director_id | director_directorId | director_fullName |
|---|---|---|---|---|---|
| 1 | 2024-07-11 | regional-jurisdic-30 | 1 | 195339 | Theodore Mcgrath |
| 1 | 2024-07-11 | regional-jurisdic-30 | 2 | 9125611 | Account Name |
| 2 | 2025-12-22 | legacy-jurisdic-31 | 2 | 9125611 | Account Name |
| 2 | 2025-12-22 | legacy-jurisdic-31 | 3 | 2933481 | Saipan International Airport |
| 3 | 2022-05-06 | compact-jurisdic-32 | 3 | 2933481 | Saipan International Airport |
| 3 | 2022-05-06 | compact-jurisdic-32 | 4 | 2087758 | Norma Fisher |
| 4 | 2023-10-17 | composite-jurisdic-33 | 4 | 2087758 | Norma Fisher |
| 4 | 2023-10-17 | composite-jurisdic-33 | 1 | 195339 | Theodore Mcgrath |

Board 1 (established 2024-07-11, `regional-jurisdic-30`, active) has two directors: Theodore Mcgrath (Executive Director, active) and Account Name (Non-Executive Director, inactive). Board 2 (established 2025-12-22, `legacy-jurisdic-31`, dissolved) has Account Name and Saipan International Airport. Board 3 (established 2022-05-06, `compact-jurisdic-32`, restructuring) has Saipan International Airport and Norma Fisher. Board 4 (established 2023-10-17, `composite-jurisdic-33`, active) has Norma Fisher and Theodore Mcgrath. The junction table `BoardDirector` is the bridge that allows a board to have multiple directors and a director to appear on multiple boards.

#### View `v_board_committee_director`

This view joins `BoardCommittee` with `Director` through the `BoardCommitteeDirector` junction table, answering: "Which directors serve on each committee?" It is keyed by committee and enumerates all members.

**View `v_board_committee_director`**

```sql
CREATE VIEW v_board_committee_director AS
SELECT a.committeeId, a.committeeName, a.establishmentDate, a.status, b.id AS director_id, b.directorId AS director_directorId, b.fullName AS director_fullName
FROM BoardCommittee a JOIN Director b ON a.directorId = b.id;
```

| committeeId | committeeName | establishmentDate | status | director_id | director_directorId | director_fullName |
|---|---|---|---|---|---|---|
| 100 | Audit Committee | 2024-07-11 | active | 1 | 195339 | Theodore Mcgrath |
| 101 | Remuneration Committee | 2025-12-22 | inactive | 2 | 9125611 | Account Name |
| 102 | Nomination Committee | 2022-05-06 | dissolved | 3 | 2933481 | Saipan International Airport |
| 103 | Audit Committee | 2023-10-17 | active | 4 | 2087758 | Norma Fisher |

Committee 100 (Audit Committee, established 2024-07-11, active) has two members: Theodore Mcgrath (Executive Director, active) and Account Name (Non-Executive Director, inactive). Committee 101 (Remuneration Committee, established 2025-12-22, inactive) has Account Name and Saipan International Airport. Committee 102 (Nomination Committee, established 2022-05-06, dissolved) has Saipan International Airport and Norma Fisher. Committee 103 (Audit Committee, established 2023-10-17, active) has Norma Fisher and Theodore Mcgrath. The view reconstructs the committee membership graph from the normalised junction table.

#### View `v_board_committee_director_detail`

This view joins `BoardCommittee`, `Director`, and `BoardCommitteeDirector` together, producing a detailed roster that includes the committee's name, establishment date, and status alongside the director's full name, role type, appointment date, and status. It answers: "For each committee, who are its members and what are their full governance profiles?"

**View `v_board_committee_director_detail`**

```sql
CREATE VIEW v_board_committee_director_detail AS
SELECT a.committeeId, a.committeeName, a.establishmentDate, b.id AS director_id, b.directorId AS director_directorId, b.fullName AS director_fullName
FROM BoardCommittee a
  JOIN BoardCommitteeDirector j ON j.committeeId = a.committeeId
  JOIN Director b ON b.id = j.directorId;
```

| committeeId | committeeName | establishmentDate | director_id | director_directorId | director_fullName |
|---|---|---|---|---|---|
| 100 | Audit Committee | 2024-07-11 | 1 | 195339 | Theodore Mcgrath |
| 100 | Audit Committee | 2024-07-11 | 2 | 9125611 | Account Name |
| 101 | Remuneration Committee | 2025-12-22 | 2 | 9125611 | Account Name |
| 101 | Remuneration Committee | 2025-12-22 | 3 | 2933481 | Saipan International Airport |
| 102 | Nomination Committee | 2022-05-06 | 3 | 2933481 | Saipan International Airport |
| 102 | Nomination Committee | 2022-05-06 | 4 | 2087758 | Norma Fisher |
| 103 | Audit Committee | 2023-10-17 | 4 | 2087758 | Norma Fisher |
| 103 | Audit Committee | 2023-10-17 | 1 | 195339 | Theodore Mcgrath |

Row 1 shows committee 100 (Audit Committee, established 2024-07-11, active) with member Theodore Mcgrath (Executive Director, appointed 2022-05-03, active). Row 2 shows the same committee with member Account Name (Non-Executive Director, appointed 2023-10-14, inactive). Row 5 shows committee 102 (Nomination Committee, established 2022-05-06, dissolved) with member Saipan International Airport (Independent Non-executive Director, appointed 2024-03-25, resigned). This view is the most detailed committee-level report, combining all attributes from both the committee and director entities.

#### View `v_corporate_entity_board`

This view joins `CorporateEntity` with `Board` on `boardId`, answering: "Which board governs each corporate entity, and what are that board's properties?" It links the legal entity layer to the governance layer.

**View `v_corporate_entity_board`**

```sql
CREATE VIEW v_corporate_entity_board AS
SELECT a.id, a.entityId, a.legalName, a.incorporationDate, b.boardId AS board_boardId, b.establishmentDate AS board_establishmentDate, b.jurisdiction AS board_jurisdiction
FROM CorporateEntity a JOIN Board b ON a.boardId = b.boardId;
```

| id | entityId | legalName | incorporationDate | board_boardId | board_establishmentDate | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 1996912 | Adaptive Model | 2025-08-22 | 1 | 2024-07-11 | regional-jurisdic-30 |
| 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Primary Cluster | 2022-01-06 | 2 | 2025-12-22 | legacy-jurisdic-31 |
| 3 | 9736894 | Composite Review D | 2023-06-17 | 3 | 2022-05-06 | compact-jurisdic-32 |
| 4 | 974946 | Compact Initiative | 2024-11-01 | 4 | 2023-10-17 | composite-jurisdic-33 |

Entity 1 (Adaptive Model, Limited Liability Company, incorporated 2025-08-22, stock code `b10c552a-8fcd-11eb-924d-9cd76263cbd0`) is governed by board 1 (established 2024-07-11, `regional-jurisdic-30`, active). Entity 2 (Primary Cluster, Corporation, incorporated 2022-01-06, stock code 3990177) is governed by board 2 (established 2025-12-22, `legacy-jurisdic-31`, dissolved). Entity 3 (Composite Review D, Partnership, incorporated 2023-06-17, stock code 1210-0006-M) is governed by board 3 (established 2022-05-06, `compact-jurisdic-32`, restructuring). Entity 4 (Compact Initiative, Limited Liability Company, incorporated 2024-11-01, stock code 5243) is governed by board 4 (established 2023-10-17, `composite-jurisdic-33`, active). The jurisdiction of the corporate entity matches the jurisdiction of its governing board in every row, reflecting a design invariant that entities are governed by boards within their own jurisdiction.

### Synthesis

The schema models corporate governance as a set of four entity types — Director, Board, BoardCommittee, and CorporateEntity — connected by two many-to-many junction tables (BoardDirector, BoardCommitteeDirector) and two one-to-many foreign keys (Director.boardId → Board, CorporateEntity.boardId → Board). The junction tables are the structural heart of the model: they allow directors to serve on multiple boards and committees without duplication, while the convenience columns in Director provide a fast path for single-assignment lookups. The six views reconstruct the domain facts by joining these normalised tables: `v_director_board` and `v_director_board_committee` answer person-centric questions, `v_board_director_detail` and `v_board_committee_director` answer board- and committee-centric questions, `v_board_committee_director_detail` provides the most detailed committee roster, and `v_corporate_entity_board` links the legal entity layer to the governance layer. Every view is a deterministic reconstruction of the base tables; no view introduces new data, and the full domain state can be recovered by querying the base tables directly.