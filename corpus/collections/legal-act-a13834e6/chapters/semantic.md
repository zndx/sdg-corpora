The domain under examination is a governance-and-finance registry in which legal instruments, monetary operations, appointed agents, and oversight bodies are tracked across a lifecycle of planning, execution, and archival. Every fact in the system is anchored to a unique identifier—`ACT-2177`, `AGE-2772`, `BOA-2651`, `DOC-2128`—and the relational schema captures not only the attributes of each entity but also the chains of authority and dependency that bind them. The seven base tables store the canonical records; the nineteen views materialise the join paths that answer the operational questions auditors, compliance officers, and system architects actually ask.

## The Base Tables

The schema is built around seven core tables. Each table stores one entity type and its directly observable attributes. Primary keys are surrogate integers; business identifiers live in separate columns so that the relational model remains stable even when external codes change.

**Table `legal_acts`**

| legal_act_id | act_identifier | act_title | issuing_body | effective_date | legal_status | fund_operation_id | cites_legal_act_id |
|---|---|---|---|---|---|---|---|
| 1 | ACT-2177 | Regional Corridor | baseline-issuing-13 | 2023-02-14T13:27:00 | active | 100 | 1 |
| 2 | ACT-2182 | Seasonal Series D | pilot-issuing-14 | 2024-07-25T20:44:00 | repealed | 101 | 2 |
| 3 | ACT-2187 | Integrated Assessment | extended-issuing-15 | 2025-12-09T03:01:00 | amended | 102 | 3 |
| 4 | ACT-2192 | Extended Survey | integrated-issuing-16 | 2022-05-20T10:18:00 | active | 103 | 4 |

The `legal_acts` table records the statutory instruments that authorise or constrain fund operations. Each row carries an `act_identifier` such as `ACT-2177` or `ACT-2182`, a human-readable `act_title` like *Regional Corridor* or *Seasonal Series D*, and an `issuing_body` (e.g. `baseline-issuing-13`). The `effective_date` marks when the act takes legal force, while `legal_status` tracks its current standing—`active`, `repealed`, or `amended`. Two foreign keys link this table to other entities: `fund_operation_id` points to the `fund_operations` row that the act governs, and `cites_legal_act_id` creates a self-referential chain so that one act can reference another (row 1 cites act 1, row 2 cites act 2, and so on).

**Table `fund_operations`**

| fund_operation_id | operation_code | operation_type | start_date | end_date | status | legal_act_id | agent_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 4221 | currency_monitoring | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 468 | ecu_creation | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | dissolved | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Fund operations are the operational heart of the registry. The `fund_operations` table stores each monetary action with an `operation_code` that may be a short numeric string (`4221`, `468`) or a UUID-like value (`e29bafe2-8fd1-11eb-924d-9cd76263cbd0`). The `operation_type` enum—`currency_monitoring`, `short_term_financing`, `ecu_creation`, `loan_administration`—classifies the nature of the work. A `start_date` and `end_date` bracket the operational window, and the `status` column (`planned`, `active`, `completed`, `dissolved`) reflects the lifecycle stage. The `legal_act_id` foreign key ties the operation to its authorising act, while `agent_id` identifies the person or body responsible for execution. Timestamps `created_at` and `updated_at` provide an audit trail.

**Table `agents`**

| agent_id | agent_identifier | agent_name | appointment_date | termination_date | agent_type | board_of_governors_id | fund_operation_id | archive_location_id |
|---|---|---|---|---|---|---|---|---|
| 100 | AGE-2772 | Alfred Tennyson | 2022-05-03T16:12:00 | 2022-09-11T20:24:00 | administrative | 1 | 100 | 1000 |
| 101 | AGE-2774 | Peter Mcdowell | 2023-10-14T23:29:00 | 2023-02-22T03:41:00 | technical | 2 | 101 | 1001 |
| 102 | AGE-2776 | Kimberly Maynard | 2024-03-25T06:46:00 | 2024-07-06T10:58:00 | transitional | 3 | 102 | 1002 |
| 103 | AGE-2778 | Kenneth Smith | 2025-08-09T13:03:00 | 2025-12-17T17:15:00 | administrative | 4 | 103 | 1003 |

Agents are the individuals or organisations appointed to carry out fund operations. The `agents` table stores an `agent_identifier` (`AGE-2772`, `AGE-2774`), a `agent_name` (Alfred Tennyson, Peter Mcdowell, Kimberly Maynard, Kenneth Smith), and an `agent_type` (`administrative`, `technical`, `transitional`). Appointment and termination dates bound the agent's tenure. Three foreign keys connect the agent to the wider model: `board_of_governors_id` links the agent to the oversight board that appointed them, `fund_operation_id` ties the agent to the operation they execute, and `archive_location_id` points to the physical or digital repository where the agent's records are stored.

**Table `board_of_governorses`**

| board_of_governors_id | board_identifier | meeting_date | meeting_location | attendance_status | decision_outcome | agent_id | fund_operation_id | board_meeting_id |
|---|---|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23T21:39:00 | legacy-meeting-43 | quorum_present | approved | 100 | 100 | 100 |
| 2 | BOA-2652 | 2024-03-07T04:56:00 | compact-meeting-44 | quorum_absent | rejected | 101 | 101 | 101 |
| 3 | BOA-2653 | 2025-08-18T11:13:00 | composite-meeting-45 | adjourned | deferred | 102 | 102 | 102 |
| 4 | BOA-2654 | 2022-01-02T18:30:00 | primary-meeting-46 | quorum_present | approved | 103 | 103 | 103 |

The `board_of_governorses` table captures the decisions of the governing body. Each row represents a board session identified by `board_identifier` (e.g. `BOA-2651`) and dated by `meeting_date`. The `meeting_location` (such as `legacy-meeting-43` or `compact-meeting-44`) and `attendance_status` (`quorum_present`, `quorum_absent`, `adjourned`) document the procedural context. The `decision_outcome` column records whether the board `approved`, `rejected`, or `deferred` the matter at hand. Foreign keys `agent_id`, `fund_operation_id`, and `board_meeting_id` connect the board decision to the agent involved, the operation under consideration, and the formal meeting record.

**Table `board_meetings`**

| id | meeting_identifier | meeting_date | agenda_item | minutes_status | confidentiality_level | board_of_governors_id | document_id | fund_operation_id |
|---|---|---|---|---|---|---|---|---|
| 100 | MEE-2370 | 2023-10-23T21:39:00 | seasonal-agenda-71 | draft | public | 1 | 1 | 100 |
| 101 | MEE-2377 | 2024-03-07T04:56:00 | regional-agenda-72 | approved | restricted | 2 | 2 | 101 |
| 102 | MEE-2384 | 2025-08-18T11:13:00 | legacy-agenda-73 | archived | confidential | 3 | 3 | 102 |
| 103 | MEE-2391 | 2022-01-02T18:30:00 | compact-agenda-74 | draft | public | 4 | 4 | 103 |

Board meetings are the formal convenings at which governance decisions are recorded. The `board_meetings` table uses `id` as its primary key (100, 101, 102, 103) and stores a `meeting_identifier` (`MEE-2370`, `MEE-2377`), a `meeting_date`, and an `agenda_item` (`seasonal-agenda-71`, `regional-agenda-72`). The `minutes_status` (`draft`, `approved`, `archived`) and `confidentiality_level` (`public`, `restricted`, `confidential`) capture the document's administrative state. Three foreign keys—`board_of_governors_id`, `document_id`, and `fund_operation_id`—link the meeting to the board decision, the supporting document, and the operation discussed.

**Table `documents`**

| document_id | document_identifier | document_title | creation_date | language | access_status | agent_id | fund_operation_id | archive_location_id | legal_act_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2022-01-13T12:24:00 | DEUTSCH | open | 100 | 100 | 1000 | 1 |
| 2 | DOC-2129 | Legacy Assessment | 2023-06-24T19:41:00 | ENGLISH | restricted | 101 | 101 | 1001 | 2 |
| 3 | DOC-2130 | Regional Survey A | 2024-11-08T02:58:00 | FRANÇAIS | confidential | 102 | 102 | 1002 | 3 |
| 4 | DOC-2131 | Seasonal Corridor | 2025-04-19T09:15:00 | ITALIANO | open | 103 | 103 | 1003 | 4 |

Documents are the artefacts produced during the governance lifecycle. The `documents` table stores a `document_identifier` (`DOC-2128`, `DOC-2129`), a `document_title` (*Compact Series*, *Legacy Assessment*), a `creation_date`, and a `language` code (`DEUTSCH`, `ENGLISH`, `FRANÇAIS`, `ITALIANO`). The `access_status` (`open`, `restricted`, `confidential`) controls who may read the document. Foreign keys connect the document to its authoring `agent_id`, the `fund_operation_id` it supports, the `archive_location_id` where it is stored, and the `legal_act_id` it references.

**Table `archive_locations`**

| id | location_identifier | location_name | city | country | access_policy | document_id | archive_location_id |
|---|---|---|---|---|---|---|---|
| 1000 | LOC-2721 | Legacy Review D | integrated-city-34 | compact-country-26 | open | 1 | 1000 |
| 1001 | LOC-2726 | Regional Initiative | seasonal-city-35 | composite-country-27 | restricted | 2 | 1001 |
| 1002 | LOC-2731 | Seasonal Model | regional-city-36 | primary-country-28 | confidential | 3 | 1002 |
| 1003 | LOC-2736 | Integrated Cluster A | legacy-city-37 | adaptive-country-29 | open | 4 | 1003 |

The `archive_locations` table provides the physical or logical repository for documents and agent records. While the table definition is not expanded here, its primary key is referenced by `archive_location_id` in both the `agents` and `documents` tables, ensuring that every artefact can be traced to a specific storage location.

## Foreign-Key Topology

The foreign-key graph forms a directed acyclic structure with a few intentional cycles created by the views. At the core, `legal_acts` → `fund_operations` → `agents` → `board_of_governorses` → `board_meetings` → `documents` → `legal_acts` creates a closed loop of authority: an act authorises an operation, the operation is executed by an agent, the agent is overseen by a board, the board convenes in a meeting, the meeting produces a document, and the document cites the act. The `cites_legal_act_id` self-reference in `legal_acts` and the `board_meeting_id` in `board_of_governorses` add intra-table links that model citation chains and meeting-to-decision relationships.

The `fund_operations` table sits at the centre of the graph. Every other table either points to it directly (`legal_acts.fund_operation_id`, `board_of_governorses.fund_operation_id`, `board_meetings.fund_operation_id`, `documents.fund_operation_id`) or reaches it through a chain of joins. This centrality is why the majority of views are anchored on `fund_operations`.

## The Views

Each view is a named join that reconstructs a domain fact from the normalised tables. The views fall into natural clusters: those that pair legal acts with fund operations, those that connect agents to their oversight and operational contexts, those that trace board decisions through meetings and documents, and those that locate documents and agents within archive infrastructure.

### Legal Act Views

**View `legal_act_fund_operation_view`**

```sql
CREATE VIEW legal_act_fund_operation_view AS
SELECT a.legal_act_id, a.act_identifier, a.act_title, a.issuing_body, b.fund_operation_id AS operation_fund_operation_id, b.operation_code AS operation_operation_code, b.operation_type AS operation_operation_type
FROM legal_acts a JOIN fund_operations b ON a.fund_operation_id = b.fund_operation_id;
```

| legal_act_id | act_identifier | act_title | issuing_body | operation_fund_operation_id | operation_operation_code | operation_operation_type |
|---|---|---|---|---|---|---|
| 1 | ACT-2177 | Regional Corridor | baseline-issuing-13 | 100 | 4221 | currency_monitoring |
| 2 | ACT-2182 | Seasonal Series D | pilot-issuing-14 | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing |
| 3 | ACT-2187 | Integrated Assessment | extended-issuing-15 | 102 | 468 | ecu_creation |
| 4 | ACT-2192 | Extended Survey | integrated-issuing-16 | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration |

The `legal_act_fund_operation_view` joins `legal_acts` to `fund_operations` on the `fund_operation_id` foreign key. It answers the question: *which fund operation does this legal act authorise?* Row 1 shows that act `ACT-2177` (*Regional Corridor*, issued by `baseline-issuing-13`) authorises fund operation `4221` of type `currency_monitoring`, which was `planned` and ran from `2022-09-05` to `2022-09-01`. The view materialises the authorisation link that the base table stores as a column.

**View `legal_act_legal_act_view`**

```sql
CREATE VIEW legal_act_legal_act_view AS
SELECT a.legal_act_id, a.act_identifier, a.act_title, a.issuing_body, b.legal_act_id AS act_legal_act_id, b.act_identifier AS act_act_identifier, b.act_title AS act_act_title
FROM legal_acts a JOIN legal_acts b ON a.cites_legal_act_id = b.legal_act_id;
```

| legal_act_id | act_identifier | act_title | issuing_body | act_legal_act_id | act_act_identifier | act_act_title |
|---|---|---|---|---|---|---|
| 1 | ACT-2177 | Regional Corridor | baseline-issuing-13 | 1 | ACT-2177 | Regional Corridor |
| 2 | ACT-2182 | Seasonal Series D | pilot-issuing-14 | 2 | ACT-2182 | Seasonal Series D |
| 3 | ACT-2187 | Integrated Assessment | extended-issuing-15 | 3 | ACT-2187 | Integrated Assessment |
| 4 | ACT-2192 | Extended Survey | integrated-issuing-16 | 4 | ACT-2192 | Extended Survey |

The `legal_act_legal_act_view` performs a self-join on `legal_acts` using the `cites_legal_act_id` column. It answers: *which legal act does this act cite?* Row 1 reveals that `ACT-2177` cites act 1 (itself), row 2 that `ACT-2182` cites act 2, and so on. In the sample data the citation chain is reflexive; in production these links would form a directed acyclic graph of legal dependencies.

### Fund Operation Views

**View `fund_operation_legal_act_view`**

```sql
CREATE VIEW fund_operation_legal_act_view AS
SELECT a.fund_operation_id, a.operation_code, a.operation_type, a.start_date, b.legal_act_id AS act_legal_act_id, b.act_identifier AS act_act_identifier, b.act_title AS act_act_title
FROM fund_operations a JOIN legal_acts b ON a.legal_act_id = b.legal_act_id;
```

| fund_operation_id | operation_code | operation_type | start_date | act_legal_act_id | act_act_identifier | act_act_title |
|---|---|---|---|---|---|---|
| 100 | 4221 | currency_monitoring | 2022-09-05T20:24:00 | 1 | ACT-2177 | Regional Corridor |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing | 2023-02-16T03:41:00 | 2 | ACT-2182 | Seasonal Series D |
| 102 | 468 | ecu_creation | 2024-07-27T10:58:00 | 3 | ACT-2187 | Integrated Assessment |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration | 2025-12-11T17:15:00 | 4 | ACT-2192 | Extended Survey |

The `fund_operation_legal_act_view` joins `fund_operations` back to `legal_acts` via `legal_act_id`. It answers the inverse question: *which legal act authorises this fund operation?* Row 100 (`4221`, `currency_monitoring`) is authorised by act `ACT-2177` (*Regional Corridor*, `active`), while row 103 (`5f90e206-…`, `loan_administration`, `dissolved`) is authorised by act `ACT-2192` (*Extended Survey*, `active`). This view is the primary query path for compliance audits that start from an operation and need to verify its legal basis.

**View `fund_operation_agent_view`**

```sql
CREATE VIEW fund_operation_agent_view AS
SELECT a.fund_operation_id, a.operation_code, a.operation_type, a.start_date, b.agent_id AS agent_agent_id, b.agent_identifier AS agent_agent_identifier, b.agent_name AS agent_agent_name
FROM fund_operations a JOIN agents b ON a.agent_id = b.agent_id;
```

| fund_operation_id | operation_code | operation_type | start_date | agent_agent_id | agent_agent_identifier | agent_agent_name |
|---|---|---|---|---|---|---|
| 100 | 4221 | currency_monitoring | 2022-09-05T20:24:00 | 100 | AGE-2772 | Alfred Tennyson |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing | 2023-02-16T03:41:00 | 101 | AGE-2774 | Peter Mcdowell |
| 102 | 468 | ecu_creation | 2024-07-27T10:58:00 | 102 | AGE-2776 | Kimberly Maynard |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration | 2025-12-11T17:15:00 | 103 | AGE-2778 | Kenneth Smith |

The `fund_operation_agent_view` joins `fund_operations` to `agents` on `agent_id`. It answers: *which agent is executing this fund operation?* Row 100 (`currency_monitoring`) is executed by Alfred Tennyson (`AGE-2772`, `administrative`), appointed on `2022-05-03` and terminated on `2022-09-11`. Row 101 (`short_term_financing`) is executed by Peter Mcdowell (`AGE-2774`, `technical`). The view surfaces the human or organisational actor responsible for each monetary action.

### Agent Views

**View `agent_board_of_governors_view`**

```sql
CREATE VIEW agent_board_of_governors_view AS
SELECT a.agent_id, a.agent_identifier, a.agent_name, a.appointment_date, b.board_of_governors_id AS governors_board_of_governors_id, b.board_identifier AS governors_board_identifier, b.meeting_date AS governors_meeting_date
FROM agents a JOIN board_of_governorses b ON a.board_of_governors_id = b.board_of_governors_id;
```

| agent_id | agent_identifier | agent_name | appointment_date | governors_board_of_governors_id | governors_board_identifier | governors_meeting_date |
|---|---|---|---|---|---|---|
| 100 | AGE-2772 | Alfred Tennyson | 2022-05-03T16:12:00 | 1 | BOA-2651 | 2023-10-23T21:39:00 |
| 101 | AGE-2774 | Peter Mcdowell | 2023-10-14T23:29:00 | 2 | BOA-2652 | 2024-03-07T04:56:00 |
| 102 | AGE-2776 | Kimberly Maynard | 2024-03-25T06:46:00 | 3 | BOA-2653 | 2025-08-18T11:13:00 |
| 103 | AGE-2778 | Kenneth Smith | 2025-08-09T13:03:00 | 4 | BOA-2654 | 2022-01-02T18:30:00 |

The `agent_board_of_governors_view` joins `agents` to `board_of_governorses` on `board_of_governors_id`. It answers: *which board oversees this agent?* Alfred Tennyson (`AGE-2772`) is overseen by board `BOA-2651`, which met on `2023-10-23` at `legacy-meeting-43` with `quorum_present` and an `approved` outcome. Peter Mcdowell (`AGE-2774`) is overseen by board `BOA-2652`, which met on `2024-03-07` at `compact-meeting-44` with `quorum_absent` and a `rejected` outcome. The view is essential for governance audits that trace accountability from agent to board.

**View `agent_fund_operation_view`**

```sql
CREATE VIEW agent_fund_operation_view AS
SELECT a.agent_id, a.agent_identifier, a.agent_name, a.appointment_date, b.fund_operation_id AS operation_fund_operation_id, b.operation_code AS operation_operation_code, b.operation_type AS operation_operation_type
FROM agents a JOIN fund_operations b ON a.fund_operation_id = b.fund_operation_id;
```

| agent_id | agent_identifier | agent_name | appointment_date | operation_fund_operation_id | operation_operation_code | operation_operation_type |
|---|---|---|---|---|---|---|
| 100 | AGE-2772 | Alfred Tennyson | 2022-05-03T16:12:00 | 100 | 4221 | currency_monitoring |
| 101 | AGE-2774 | Peter Mcdowell | 2023-10-14T23:29:00 | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing |
| 102 | AGE-2776 | Kimberly Maynard | 2024-03-25T06:46:00 | 102 | 468 | ecu_creation |
| 103 | AGE-2778 | Kenneth Smith | 2025-08-09T13:03:00 | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration |

The `agent_fund_operation_view` joins `agents` to `fund_operations` on `fund_operation_id`. It answers: *which fund operation is this agent assigned to?* Kimberly Maynard (`AGE-2776`, `transitional`) is assigned to operation `468` (`ecu_creation`, `completed`), which ran from `2024-07-27` to `2024-07-23`. Kenneth Smith (`AGE-2778`, `administrative`) is assigned to operation `5f90e206-…` (`loan_administration`, `dissolved`). This view is the operational counterpart to the board view, focusing on execution rather than oversight.

**View `agent_archive_location_view`**

```sql
CREATE VIEW agent_archive_location_view AS
SELECT a.agent_id, a.agent_identifier, a.agent_name, a.appointment_date, b.id AS location_id, b.location_identifier AS location_location_identifier, b.location_name AS location_location_name
FROM agents a JOIN archive_locations b ON a.archive_location_id = b.id;
```

| agent_id | agent_identifier | agent_name | appointment_date | location_id | location_location_identifier | location_location_name |
|---|---|---|---|---|---|---|
| 100 | AGE-2772 | Alfred Tennyson | 2022-05-03T16:12:00 | 1000 | LOC-2721 | Legacy Review D |
| 101 | AGE-2774 | Peter Mcdowell | 2023-10-14T23:29:00 | 1001 | LOC-2726 | Regional Initiative |
| 102 | AGE-2776 | Kimberly Maynard | 2024-03-25T06:46:00 | 1002 | LOC-2731 | Seasonal Model |
| 103 | AGE-2778 | Kenneth Smith | 2025-08-09T13:03:00 | 1003 | LOC-2736 | Integrated Cluster A |

The `agent_archive_location_view` joins `agents` to `archive_locations` on `archive_location_id`. It answers: *where are this agent's records stored?* Alfred Tennyson's records are at location `1000`, Peter Mcdowell's at `1001`, Kimberly Maynard's at `1002`, and Kenneth Smith's at `1003`. The view supports physical and digital retrieval workflows.

### Board of Governors Views

**View `board_of_governors_agent_view`**

```sql
CREATE VIEW board_of_governors_agent_view AS
SELECT a.board_of_governors_id, a.board_identifier, a.meeting_date, a.meeting_location, b.agent_id AS agent_agent_id, b.agent_identifier AS agent_agent_identifier, b.agent_name AS agent_agent_name
FROM board_of_governorses a JOIN agents b ON a.agent_id = b.agent_id;
```

| board_of_governors_id | board_identifier | meeting_date | meeting_location | agent_agent_id | agent_agent_identifier | agent_agent_name |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23T21:39:00 | legacy-meeting-43 | 100 | AGE-2772 | Alfred Tennyson |
| 2 | BOA-2652 | 2024-03-07T04:56:00 | compact-meeting-44 | 101 | AGE-2774 | Peter Mcdowell |
| 3 | BOA-2653 | 2025-08-18T11:13:00 | composite-meeting-45 | 102 | AGE-2776 | Kimberly Maynard |
| 4 | BOA-2654 | 2022-01-02T18:30:00 | primary-meeting-46 | 103 | AGE-2778 | Kenneth Smith |

The `board_of_governors_agent_view` joins `board_of_governorses` to `agents` on `agent_id`. It answers: *which agent was the subject of this board decision?* Board `BOA-2651` (meeting `2023-10-23`, `approved`) concerned agent Alfred Tennyson (`AGE-2772`). Board `BOA-2652` (meeting `2024-03-07`, `rejected`) concerned agent Peter Mcdowell (`AGE-2774`). This view inverts the agent-to-board relationship and is useful for board-level reporting.

**View `board_of_governors_fund_operation_view`**

```sql
CREATE VIEW board_of_governors_fund_operation_view AS
SELECT a.board_of_governors_id, a.board_identifier, a.meeting_date, a.meeting_location, b.fund_operation_id AS operation_fund_operation_id, b.operation_code AS operation_operation_code, b.operation_type AS operation_operation_type
FROM board_of_governorses a JOIN fund_operations b ON a.fund_operation_id = b.fund_operation_id;
```

| board_of_governors_id | board_identifier | meeting_date | meeting_location | operation_fund_operation_id | operation_operation_code | operation_operation_type |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23T21:39:00 | legacy-meeting-43 | 100 | 4221 | currency_monitoring |
| 2 | BOA-2652 | 2024-03-07T04:56:00 | compact-meeting-44 | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing |
| 3 | BOA-2653 | 2025-08-18T11:13:00 | composite-meeting-45 | 102 | 468 | ecu_creation |
| 4 | BOA-2654 | 2022-01-02T18:30:00 | primary-meeting-46 | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration |

The `board_of_governors_fund_operation_view` joins `board_of_governorses` to `fund_operations` on `fund_operation_id`. It answers: *which fund operation was the subject of this board decision?* Board `BOA-2653` (meeting `2025-08-18`, `deferred`) concerned operation `468` (`ecu_creation`, `completed`). Board `BOA-2654` (meeting `2022-01-02`, `approved`) concerned operation `5f90e206-…` (`loan_administration`, `dissolved`). The view connects governance decisions to their operational targets.

**View `board_of_governors_board_meeting_view`**

```sql
CREATE VIEW board_of_governors_board_meeting_view AS
SELECT a.board_of_governors_id, a.board_identifier, a.meeting_date, a.meeting_location, b.id AS meeting_id, b.meeting_identifier AS meeting_meeting_identifier, b.meeting_date AS meeting_meeting_date
FROM board_of_governorses a JOIN board_meetings b ON a.board_meeting_id = b.id;
```

| board_of_governors_id | board_identifier | meeting_date | meeting_location | meeting_id | meeting_meeting_identifier | meeting_meeting_date |
|---|---|---|---|---|---|---|
| 1 | BOA-2651 | 2023-10-23T21:39:00 | legacy-meeting-43 | 100 | MEE-2370 | 2023-10-23T21:39:00 |
| 2 | BOA-2652 | 2024-03-07T04:56:00 | compact-meeting-44 | 101 | MEE-2377 | 2024-03-07T04:56:00 |
| 3 | BOA-2653 | 2025-08-18T11:13:00 | composite-meeting-45 | 102 | MEE-2384 | 2025-08-18T11:13:00 |
| 4 | BOA-2654 | 2022-01-02T18:30:00 | primary-meeting-46 | 103 | MEE-2391 | 2022-01-02T18:30:00 |

The `board_of_governors_board_meeting_view` joins `board_of_governorses` to `board_meetings` on `board_meeting_id`. It answers: *which formal meeting record corresponds to this board decision?* Board `BOA-2651` corresponds to meeting `MEE-2370` (agenda `seasonal-agenda-71`, `draft` minutes, `public` confidentiality). Board `BOA-2653` corresponds to meeting `MEE-2384` (agenda `legacy-agenda-73`, `archived` minutes, `confidential` confidentiality). This view is critical for audit trails that require matching a board resolution to its formal meeting documentation.

### Board Meeting Views

**View `board_meeting_board_of_governors_view`**

```sql
CREATE VIEW board_meeting_board_of_governors_view AS
SELECT a.id, a.meeting_identifier, a.meeting_date, a.agenda_item, b.board_of_governors_id AS governors_board_of_governors_id, b.board_identifier AS governors_board_identifier, b.meeting_date AS governors_meeting_date
FROM board_meetings a JOIN board_of_governorses b ON a.board_of_governors_id = b.board_of_governors_id;
```

| id | meeting_identifier | meeting_date | agenda_item | governors_board_of_governors_id | governors_board_identifier | governors_meeting_date |
|---|---|---|---|---|---|---|
| 100 | MEE-2370 | 2023-10-23T21:39:00 | seasonal-agenda-71 | 1 | BOA-2651 | 2023-10-23T21:39:00 |
| 101 | MEE-2377 | 2024-03-07T04:56:00 | regional-agenda-72 | 2 | BOA-2652 | 2024-03-07T04:56:00 |
| 102 | MEE-2384 | 2025-08-18T11:13:00 | legacy-agenda-73 | 3 | BOA-2653 | 2025-08-18T11:13:00 |
| 103 | MEE-2391 | 2022-01-02T18:30:00 | compact-agenda-74 | 4 | BOA-2654 | 2022-01-02T18:30:00 |

The `board_meeting_board_of_governors_view` joins `board_meetings` to `board_of_governorses` on `board_of_governors_id`. It answers: *which board decision was recorded in this meeting?* Meeting `MEE-2370` (agenda `seasonal-agenda-71`, `public`) recorded board decision `BOA-2651` (`approved`). Meeting `MEE-2384` (agenda `legacy-agenda-73`, `confidential`) recorded board decision `BOA-2653` (`deferred`). This view is the primary path for retrieving board decisions from meeting records.

**View `board_meeting_document_view`**

```sql
CREATE VIEW board_meeting_document_view AS
SELECT a.id, a.meeting_identifier, a.meeting_date, a.agenda_item, b.document_id AS document_document_id, b.document_identifier AS document_document_identifier, b.document_title AS document_document_title
FROM board_meetings a JOIN documents b ON a.document_id = b.document_id;
```

| id | meeting_identifier | meeting_date | agenda_item | document_document_id | document_document_identifier | document_document_title |
|---|---|---|---|---|---|---|
| 100 | MEE-2370 | 2023-10-23T21:39:00 | seasonal-agenda-71 | 1 | DOC-2128 | Compact Series |
| 101 | MEE-2377 | 2024-03-07T04:56:00 | regional-agenda-72 | 2 | DOC-2129 | Legacy Assessment |
| 102 | MEE-2384 | 2025-08-18T11:13:00 | legacy-agenda-73 | 3 | DOC-2130 | Regional Survey A |
| 103 | MEE-2391 | 2022-01-02T18:30:00 | compact-agenda-74 | 4 | DOC-2131 | Seasonal Corridor |

The `board_meeting_document_view` joins `board_meetings` to `documents` on `document_id`. It answers: *which document supports this meeting?* Meeting `MEE-2370` is supported by document `DOC-2128` (*Compact Series*, `DEUTSCH`, `open`). Meeting `MEE-2384` is supported by document `DOC-2130` (*Regional Survey A*, `FRANÇAIS`, `confidential`). The view links meeting artefacts to their documentary evidence.

**View `board_meeting_fund_operation_view`**

```sql
CREATE VIEW board_meeting_fund_operation_view AS
SELECT a.id, a.meeting_identifier, a.meeting_date, a.agenda_item, b.fund_operation_id AS operation_fund_operation_id, b.operation_code AS operation_operation_code, b.operation_type AS operation_operation_type
FROM board_meetings a JOIN fund_operations b ON a.fund_operation_id = b.fund_operation_id;
```

| id | meeting_identifier | meeting_date | agenda_item | operation_fund_operation_id | operation_operation_code | operation_operation_type |
|---|---|---|---|---|---|---|
| 100 | MEE-2370 | 2023-10-23T21:39:00 | seasonal-agenda-71 | 100 | 4221 | currency_monitoring |
| 101 | MEE-2377 | 2024-03-07T04:56:00 | regional-agenda-72 | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing |
| 102 | MEE-2384 | 2025-08-18T11:13:00 | legacy-agenda-73 | 102 | 468 | ecu_creation |
| 103 | MEE-2391 | 2022-01-02T18:30:00 | compact-agenda-74 | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration |

The `board_meeting_fund_operation_view` joins `board_meetings` to `fund_operations` on `fund_operation_id`. It answers: *which fund operation was discussed in this meeting?* Meeting `MEE-2370` discussed operation `4221` (`currency_monitoring`, `planned`). Meeting `MEE-2391` discussed operation `5f90e206-…` (`loan_administration`, `dissolved`). This view is essential for operational reviews that trace meetings to the monetary actions they addressed.

### Document Views

**View `document_agent_view`**

```sql
CREATE VIEW document_agent_view AS
SELECT a.document_id, a.document_identifier, a.document_title, a.creation_date, b.agent_id AS agent_agent_id, b.agent_identifier AS agent_agent_identifier, b.agent_name AS agent_agent_name
FROM documents a JOIN agents b ON a.agent_id = b.agent_id;
```

| document_id | document_identifier | document_title | creation_date | agent_agent_id | agent_agent_identifier | agent_agent_name |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2022-01-13T12:24:00 | 100 | AGE-2772 | Alfred Tennyson |
| 2 | DOC-2129 | Legacy Assessment | 2023-06-24T19:41:00 | 101 | AGE-2774 | Peter Mcdowell |
| 3 | DOC-2130 | Regional Survey A | 2024-11-08T02:58:00 | 102 | AGE-2776 | Kimberly Maynard |
| 4 | DOC-2131 | Seasonal Corridor | 2025-04-19T09:15:00 | 103 | AGE-2778 | Kenneth Smith |

The `document_agent_view` joins `documents` to `agents` on `agent_id`. It answers: *which agent authored or is associated with this document?* Document `DOC-2128` (*Compact Series*, `DEUTSCH`, `open`) is associated with agent Alfred Tennyson (`AGE-2772`). Document `DOC-2130` (*Regional Survey A*, `FRANÇAIS`, `confidential`) is associated with agent Kimberly Maynard (`AGE-2776`). The view supports document provenance queries.

**View `document_fund_operation_view`**

```sql
CREATE VIEW document_fund_operation_view AS
SELECT a.document_id, a.document_identifier, a.document_title, a.creation_date, b.fund_operation_id AS operation_fund_operation_id, b.operation_code AS operation_operation_code, b.operation_type AS operation_operation_type
FROM documents a JOIN fund_operations b ON a.fund_operation_id = b.fund_operation_id;
```

| document_id | document_identifier | document_title | creation_date | operation_fund_operation_id | operation_operation_code | operation_operation_type |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2022-01-13T12:24:00 | 100 | 4221 | currency_monitoring |
| 2 | DOC-2129 | Legacy Assessment | 2023-06-24T19:41:00 | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | short_term_financing |
| 3 | DOC-2130 | Regional Survey A | 2024-11-08T02:58:00 | 102 | 468 | ecu_creation |
| 4 | DOC-2131 | Seasonal Corridor | 2025-04-19T09:15:00 | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | loan_administration |

The `document_fund_operation_view` joins `documents` to `fund_operations` on `fund_operation_id`. It answers: *which fund operation does this document support?* Document `DOC-2128` supports operation `4221` (`currency_monitoring`). Document `DOC-2131` (*Seasonal Corridor*, `ITALIANO`, `open`) supports operation `5f90e206-…` (`loan_administration`). This view is the primary path for retrieving documents by operational context.

**View `document_archive_location_view`**

```sql
CREATE VIEW document_archive_location_view AS
SELECT a.document_id, a.document_identifier, a.document_title, a.creation_date, b.id AS location_id, b.location_identifier AS location_location_identifier, b.location_name AS location_location_name
FROM documents a JOIN archive_locations b ON a.archive_location_id = b.id;
```

| document_id | document_identifier | document_title | creation_date | location_id | location_location_identifier | location_location_name |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2022-01-13T12:24:00 | 1000 | LOC-2721 | Legacy Review D |
| 2 | DOC-2129 | Legacy Assessment | 2023-06-24T19:41:00 | 1001 | LOC-2726 | Regional Initiative |
| 3 | DOC-2130 | Regional Survey A | 2024-11-08T02:58:00 | 1002 | LOC-2731 | Seasonal Model |
| 4 | DOC-2131 | Seasonal Corridor | 2025-04-19T09:15:00 | 1003 | LOC-2736 | Integrated Cluster A |

The `document_archive_location_view` joins `documents` to `archive_locations` on `archive_location_id`. It answers: *where is this document stored?* Document `DOC-2128` is stored at location `1000`. Document `DOC-2130` is stored at location `1002`. The view supports retrieval and archival workflows.

**View `document_legal_act_view`**

```sql
CREATE VIEW document_legal_act_view AS
SELECT a.document_id, a.document_identifier, a.document_title, a.creation_date, b.legal_act_id AS act_legal_act_id, b.act_identifier AS act_act_identifier, b.act_title AS act_act_title
FROM documents a JOIN legal_acts b ON a.legal_act_id = b.legal_act_id;
```

| document_id | document_identifier | document_title | creation_date | act_legal_act_id | act_act_identifier | act_act_title |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2022-01-13T12:24:00 | 1 | ACT-2177 | Regional Corridor |
| 2 | DOC-2129 | Legacy Assessment | 2023-06-24T19:41:00 | 2 | ACT-2182 | Seasonal Series D |
| 3 | DOC-2130 | Regional Survey A | 2024-11-08T02:58:00 | 3 | ACT-2187 | Integrated Assessment |
| 4 | DOC-2131 | Seasonal Corridor | 2025-04-19T09:15:00 | 4 | ACT-2192 | Extended Survey |

The `document_legal_act_view` joins `documents` to `legal_acts` on `legal_act_id`. It answers: *which legal act does this document reference?* Document `DOC-2128` (*Compact Series*) references act `ACT-2177` (*Regional Corridor*, `active`). Document `DOC-2131` (*Seasonal Corridor*) references act `ACT-2192` (*Extended Survey*, `active`). This view is critical for compliance checks that verify documents against their authorising legal instruments.

### Archive Location Views

**View `archive_location_document_view`**

```sql
CREATE VIEW archive_location_document_view AS
SELECT a.id, a.location_identifier, a.location_name, a.city, b.document_id AS document_document_id, b.document_identifier AS document_document_identifier, b.document_title AS document_document_title
FROM archive_locations a JOIN documents b ON a.document_id = b.document_id;
```

| id | location_identifier | location_name | city | document_document_id | document_document_identifier | document_document_title |
|---|---|---|---|---|---|---|
| 1000 | LOC-2721 | Legacy Review D | integrated-city-34 | 1 | DOC-2128 | Compact Series |
| 1001 | LOC-2726 | Regional Initiative | seasonal-city-35 | 2 | DOC-2129 | Legacy Assessment |
| 1002 | LOC-2731 | Seasonal Model | regional-city-36 | 3 | DOC-2130 | Regional Survey A |
| 1003 | LOC-2736 | Integrated Cluster A | legacy-city-37 | 4 | DOC-2131 | Seasonal Corridor |

The `archive_location_document_view` joins `archive_locations` to `documents` on `archive_location_id`. It answers: *which documents are stored at this archive location?* Location `1000` holds document `DOC-2128` (*Compact Series*, `open`). Location `1002` holds document `DOC-2130` (*Regional Survey A*, `confidential`). The view supports inventory and retrieval queries at the archive level.

**View `archive_location_archive_location_view`**

```sql
CREATE VIEW archive_location_archive_location_view AS
SELECT a.id, a.location_identifier, a.location_name, a.city, b.id AS location_id, b.location_identifier AS location_location_identifier, b.location_name AS location_location_name
FROM archive_locations a JOIN archive_locations b ON a.archive_location_id = b.id;
```

| id | location_identifier | location_name | city | location_id | location_location_identifier | location_location_name |
|---|---|---|---|---|---|---|
| 1000 | LOC-2721 | Legacy Review D | integrated-city-34 | 1000 | LOC-2721 | Legacy Review D |
| 1001 | LOC-2726 | Regional Initiative | seasonal-city-35 | 1001 | LOC-2726 | Regional Initiative |
| 1002 | LOC-2731 | Seasonal Model | regional-city-36 | 1002 | LOC-2731 | Seasonal Model |
| 1003 | LOC-2736 | Integrated Cluster A | legacy-city-37 | 1003 | LOC-2736 | Integrated Cluster A |

The `archive_location_archive_location_view` performs a self-join on `archive_locations`. It answers: *which archive locations are related to each other?* In the sample data the self-reference is reflexive, but in production this link would model hierarchical or federated archive structures where one location references another.

## Synthesis

The schema models a governance-and-finance registry as a network of seven base tables linked by foreign keys that encode authorisation, execution, oversight, and archival relationships. The nineteen views materialise the join paths that answer the domain's core questions: which act authorises which operation, which agent executes which operation, which board oversees which agent, which meeting records which decision, and which document supports which operation. Every view is a named reconstruction of a domain fact from the normalised tables, and every row in every view can be traced back to concrete records—`ACT-2177`, `AGE-2772`, `BOA-2651`, `DOC-2128`—that anchor the model in the operational reality of the registry.