Corporate governance structures are the scaffolding that holds organizations together, defining who holds authority, how decisions flow, and which bodies oversee critical functions. At the heart of this architecture sit directors—individuals entrusted with fiduciary responsibility—boards that convene to exercise collective oversight, and committees that drill down into specialized domains such as audit, remuneration, and nominations. These entities do not exist in isolation; they are bound together by explicit membership relationships and anchored to corporate entities that operate under specific jurisdictions and legal forms. Understanding how directors, boards, committees, and corporate entities interlock is essential for anyone tasked with governance compliance, organizational design, or regulatory reporting.

## The Director Record

**Table `Director`**

| id | directorId | fullName | roleType | appointmentDate | status | boardId | committeeId |
|---|---|---|---|---|---|---|---|
| 1 | 195339 | Theodore Mcgrath | Executive Director | 2022-05-03 | active | 1 | 100 |
| 2 | 9125611 | Account Name | Non-Executive Director | 2023-10-14 | inactive | 2 | 101 |
| 3 | 2933481 | Saipan International Airport | Independent Non-executive Director | 2024-03-25 | resigned | 3 | 102 |
| 4 | 2087758 | Norma Fisher | Executive Director | 2025-08-09 | active | 4 | 103 |

The Director table is the primary roster of individuals holding governance positions. Each row captures a director's unique identifier (`directorId`), full name, role classification, appointment date, and current status. Role types distinguish between Executive Director, Non-Executive Director, and Independent Non-executive Director—categories that carry different expectations regarding day-to-day involvement and objectivity. The `status` field tracks whether a director is currently active, has resigned, or is otherwise inactive.

Consider the first entry: Theodore Mcgrath, bearing director ID 195339, was appointed as an Executive Director on 2022-05-03 and holds active status. He is associated with board ID 1 and committee ID 100. By contrast, Account Name (director ID 9125611), a Non-Executive Director appointed on 2023-10-14, carries inactive status and is linked to board ID 2 and committee ID 101. Saipan International Airport, listed as an Independent Non-executive Director with ID 2933481, has resigned from board ID 3 and committee ID 102. Norma Fisher, appointed most recently on 2025-08-09 as an Executive Director, is active on board ID 4 and committee ID 103. The `appointmentDate` column provides a chronological anchor for tenure tracking, while the `boardId` and `committeeId` columns establish the director's primary organizational affiliations.

## The Board Record

**Table `Board`**

| boardId | establishmentDate | jurisdiction | status |
|---|---|---|---|
| 1 | 2024-07-11 | regional-jurisdic-30 | active |
| 2 | 2025-12-22 | legacy-jurisdic-31 | dissolved |
| 3 | 2022-05-06 | compact-jurisdic-32 | restructuring |
| 4 | 2023-10-17 | composite-jurisdic-33 | active |

Boards are the central governing bodies, each identified by a `boardId` and characterized by an establishment date, a jurisdictional designation, and a current operational status. The jurisdiction field encodes the regulatory or geographic scope under which the board operates—values such as `regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, and `composite-jurisdic-33` reflect distinct regulatory frameworks. The `status` field indicates whether the board is active, dissolved, or undergoing restructuring.

Board ID 1 was established on 2024-07-11 under the regional-jurisdic-30 framework and remains active. Board ID 2, established later on 2025-12-22 under legacy-jurisdic-31, has been dissolved. Board ID 3, dating back to 2022-05-06 under compact-jurisdic-32, is currently in restructuring. Board ID 4, established on 2023-10-17 under composite-jurisdic-33, is active. These status values are critical for compliance reporting: dissolved boards no longer exercise authority, while restructuring boards may have modified decision-making protocols.

## The Board Committee Record

**Table `BoardCommittee`**

| committeeId | committeeName | establishmentDate | status | directorId |
|---|---|---|---|---|
| 100 | Audit Committee | 2024-07-11 | active | 1 |
| 101 | Remuneration Committee | 2025-12-22 | inactive | 2 |
| 102 | Nomination Committee | 2022-05-06 | dissolved | 3 |
| 103 | Audit Committee | 2023-10-17 | active | 4 |

Committees are specialized sub-bodies within boards, each assigned a `committeeId`, a descriptive `committeeName`, an establishment date, a status, and a `directorId` that identifies the committee's presiding or lead director. The committee names in the dataset—Audit Committee, Remuneration Committee, and Nomination Committee—reflect standard governance functions. Audit Committees oversee financial reporting integrity; Remuneration Committees handle compensation policy; Nomination Committees manage board composition and succession planning.

Committee ID 100, the Audit Committee, was established on 2024-07-11, is active, and is led by director ID 1 (Theodore Mcgrath). Committee ID 101, the Remuneration Committee, established on 2025-12-22, carries inactive status and is led by director ID 2 (Account Name). Committee ID 102, the Nomination Committee, established on 2022-05-06, is dissolved and led by director ID 3 (Saipan International Airport). Committee ID 103, another Audit Committee, was established on 2023-10-17, is active, and is led by director ID 4 (Norma Fisher). The presence of two Audit Committees under different board jurisdictions illustrates how governance functions can be replicated across organizational units.

## The Corporate Entity Record

**Table `CorporateEntity`**

| id | entityId | legalName | incorporationDate | jurisdiction | stockCode | entityType | boardId |
|---|---|---|---|---|---|---|---|
| 1 | 1996912 | Adaptive Model | 2025-08-22 | regional-jurisdic-30 | b10c552a-8fcd-11eb-924d-9cd76263cbd0 | Limited Liability Company | 1 |
| 2 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Primary Cluster | 2022-01-06 | legacy-jurisdic-31 | 3990177 | Corporation | 2 |
| 3 | 9736894 | Composite Review D | 2023-06-17 | compact-jurisdic-32 | 1210-0006-M | Partnership | 3 |
| 4 | 974946 | Compact Initiative | 2024-11-01 | composite-jurisdic-33 | 5243 | Limited Liability Company | 4 |

Corporate entities are the legal organizations that boards govern. Each entity record includes an `id`, a unique `entityId`, a `legalName`, an `incorporationDate`, a `jurisdiction`, a `stockCode`, an `entityType`, and a `boardId` linking the entity to its overseeing board. Entity types range from Limited Liability Company to Corporation to Partnership, each carrying distinct legal and regulatory implications.

Entity ID 1996912, legally named Adaptive Model, was incorporated on 2025-08-22 under the regional-jurisdic-30 framework as a Limited Liability Company with stock code b10c552a-8fcd-11eb-924d-9cd76263cbd0, and is overseen by board ID 1. Entity 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0, Primary Cluster, was incorporated on 2022-01-06 under legacy-jurisdic-31 as a Corporation with stock code 3990177, overseen by board ID 2. Entity 9736894, Composite Review D, incorporated on 2023-06-17 under compact-jurisdic-32 as a Partnership with stock code 1210-0006-M, is overseen by board ID 3. Entity 974946, Compact Initiative, incorporated on 2024-11-01 under composite-jurisdic-33 as a Limited Liability Company with stock code 5243, is overseen by board ID 4. The `boardId` foreign key directly ties each corporate entity to its governing board, forming the backbone of organizational accountability.

## Membership: The BoardDirector Junction

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

The BoardDirector table establishes the many-to-many relationship between directors and boards. A director may serve on multiple boards, and a board may comprise multiple directors. The table contains only two columns—`boardId` and `directorId`—each referencing the primary keys of their respective tables.

The membership matrix reveals that director ID 1 (Theodore Mcgrath) serves on boards 1 and 4. Director ID 2 (Account Name) serves on boards 1 and 2. Director ID 3 (Saipan International Airport) serves on boards 2 and 3. Director ID 4 (Norma Fisher) serves on boards 3 and 4. This cross-assignment pattern creates a chain of board participation: each director bridges two adjacent boards in the sequence, which has implications for knowledge transfer and governance consistency across the organizational portfolio.

## Membership: The BoardCommitteeDirector Junction

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

The BoardCommitteeDirector table similarly establishes the many-to-many relationship between directors and committees. Committee membership is not automatically determined by a director's primary committee assignment in the Director table; this junction table provides the authoritative record of which directors serve on which committees.

Director ID 1 serves on committees 100 and 103—both Audit Committees. Director ID 2 serves on committees 100 and 101, spanning Audit and Remuneration functions. Director ID 3 serves on committees 101 and 102, covering Remuneration and Nomination. Director ID 4 serves on committees 102 and 103, covering Nomination and Audit. Notably, director ID 1's dual membership on both Audit Committees (100 and 103) suggests a specialized focus on financial oversight across multiple board jurisdictions.

## Director-Board Affiliation View

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

The view `v_director_board` joins the Director table with the Board table to present each director alongside their board's establishment date, jurisdiction, and status. This join answers the question: which board does each director serve on, and what is the current standing of that board?

Reading the first row: Theodore Mcgrath (director ID 195339, Executive Director, active) is affiliated with board ID 1, which was established on 2024-07-11 under regional-jurisdic-30 and remains active. The second row shows Account Name (director ID 9125611, Non-Executive Director, inactive) affiliated with board ID 2, established on 2025-12-22 under legacy-jurisdic-31 and currently dissolved. The third row pairs Saipan International Airport (director ID 2933481, Independent Non-executive Director, resigned) with board ID 3, established on 2022-05-06 under compact-jurisdic-32 and in restructuring. The fourth row links Norma Fisher (director ID 2087758, Executive Director, active) to board ID 4, established on 2023-10-17 under composite-jurisdic-33 and active. This view is particularly useful for compliance audits, where one must verify that active directors are not assigned to dissolved boards.

## Director-Board-Committee Affiliation View

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

The view `v_director_board_committee` extends the previous join by incorporating the BoardCommittee table, presenting each director alongside both their board and committee information. This join answers the question: which director serves on which board and committee combination, and what are the statuses of all three entities?

The first row shows Theodore Mcgrath on board ID 1 (active, regional-jurisdic-30) and committee ID 100 (Audit Committee, active, established 2024-07-11). The second row places Account Name on board ID 2 (dissolved, legacy-jurisdic-31) and committee ID 101 (Remuneration Committee, inactive, established 2025-12-22). The third row links Saipan International Airport to board ID 3 (restructuring, compact-jurisdic-32) and committee ID 102 (Nomination Committee, dissolved, established 2022-05-06). The fourth row connects Norma Fisher to board ID 4 (active, composite-jurisdic-33) and committee ID 103 (Audit Committee, active, established 2023-10-17). This view is essential for governance health checks, revealing situations where a director's committee is dissolved or inactive while their board remains active—a potential gap in oversight coverage.

## Board-Director Detail View

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

The view `v_board_director_detail` joins the Board table with the BoardDirector junction and the Director table to produce a detailed roster of each board's membership. This join answers the question: which directors serve on each board, and what are their individual roles and statuses?

Board ID 1 (established 2024-07-11, regional-jurisdic-30, active) has two directors: Theodore Mcgrath (Executive Director, active, appointed 2022-05-03) and Account Name (Non-Executive Director, inactive, appointed 2023-10-14). Board ID 2 (established 2025-12-22, legacy-jurisdic-31, dissolved) also has two directors: Account Name and Saipan International Airport (Independent Non-executive Director, resigned, appointed 2024-03-25). Board ID 3 (established 2022-05-06, compact-jurisdic-32, restructuring) comprises Saipan International Airport and Norma Fisher (Executive Director, active, appointed 2025-08-09). Board ID 4 (established 2023-10-17, composite-jurisdic-33, active) has Norma Fisher and Theodore Mcgrath. This view enables board composition analysis, revealing that every board has exactly two directors and that director assignments follow a cyclic pattern across the four boards.

## Board Committee-Director View

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

The view `v_board_committee_director` joins the BoardCommittee table with the BoardCommitteeDirector junction and the Director table to produce a roster of each committee's membership. This join answers the question: which directors serve on each committee, and what are their individual roles?

Committee ID 100 (Audit Committee, active, established 2024-07-11, led by director ID 1) has two members: Theodore Mcgrath (Executive Director, active) and Account Name (Non-Executive Director, inactive). Committee ID 101 (Remuneration Committee, inactive, established 2025-12-22, led by director ID 2) has two members: Account Name and Saipan International Airport (Independent Non-executive Director, resigned). Committee ID 102 (Nomination Committee, dissolved, established 2022-05-06, led by director ID 3) has two members: Saipan International Airport and Norma Fisher (Executive Director, active). Committee ID 103 (Audit Committee, active, established 2023-10-17, led by director ID 4) has two members: Norma Fisher and Theodore Mcgrath. This view is critical for committee quorum analysis and for identifying directors who may be over-committed across multiple active committees.

## Board Committee-Director Detail View

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

The view `v_board_committee_director_detail` performs a three-way join across BoardCommittee, BoardCommitteeDirector, and Director, enriching committee membership with full director profiles. This join answers the question: for each committee, who are its members, what are their roles and statuses, and what is the committee's own standing?

The first row shows committee ID 100 (Audit Committee, active, established 2024-07-11) with member Theodore Mcgrath (director ID 195339, Executive Director, active, appointed 2022-05-03). The second row shows the same committee with member Account Name (director ID 9125611, Non-Executive Director, inactive, appointed 2023-10-14). The third row presents committee ID 101 (Remuneration Committee, inactive, established 2025-12-22) with member Account Name (Non-Executive Director, inactive). The fourth row shows the same committee with member Saipan International Airport (Independent Non-executive Director, resigned). The fifth and sixth rows cover committee ID 102 (Nomination Committee, dissolved) with Saipan International Airport and Norma Fisher respectively. The final two rows cover committee ID 103 (Audit Committee, active) with Norma Fisher and Theodore Mcgrath. This view provides the most granular picture of committee composition, enabling detailed analysis of role diversity and status alignment within each committee.

## Corporate Entity-Board View

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

The view `v_corporate_entity_board` joins the CorporateEntity table with the Board table to present each corporate entity alongside its governing board's details. This join answers the question: which board governs each corporate entity, and what is the board's current operational status?

Entity 1996912 (Adaptive Model, Limited Liability Company, incorporated 2025-08-22, stock code b10c552a-8fcd-11eb-924d-9cd76263cbd0, jurisdiction regional-jurisdic-30) is governed by board ID 1, which was established on 2024-07-11, operates under regional-jurisdic-30, and is active. Entity 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 (Primary Cluster, Corporation, incorporated 2022-01-06, stock code 3990177, jurisdiction legacy-jurisdic-31) is governed by board ID 2, established on 2025-12-22, operating under legacy-jurisdic-31, and dissolved. Entity 9736894 (Composite Review D, Partnership, incorporated 2023-06-17, stock code 1210-0006-M, jurisdiction compact-jurisdic-32) is governed by board ID 3, established on 2022-05-06, operating under compact-jurisdic-32, and in restructuring. Entity 974946 (Compact Initiative, Limited Liability Company, incorporated 2024-11-01, stock code 5243, jurisdiction composite-jurisdic-33) is governed by board ID 4, established on 2023-10-17, operating under composite-jurisdic-33, and active. This view is indispensable for regulatory reporting, as it links each legal entity to the governance body responsible for its oversight, and flags entities whose boards are no longer active.

## Synthesis

The governance data model presented here captures the essential relationships between directors, boards, committees, and corporate entities through a combination of direct foreign-key associations and junction tables. Directors hold primary affiliations to boards and committees through the Director table, while the BoardDirector and BoardCommitteeDirector tables provide the authoritative membership records that support many-to-many relationships. Corporate entities are anchored to boards through the boardId foreign key, creating a clear line of accountability from legal entity to governing body. The six views derived from these base tables answer the most common governance queries: which directors serve on which boards, which committees have which members, and which boards govern which entities. Together, these tables and views form a complete operational picture of the governance structure, enabling compliance verification, composition analysis, and regulatory reporting across all organizational units.