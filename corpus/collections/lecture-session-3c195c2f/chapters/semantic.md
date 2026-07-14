## Ontology-Grounded Relational Modelling of a Lecture-Centric Academic Domain

The domain under examination concerns the organisation of academic lecture sessions, their associated artefacts, and the scholarly resources that support them. At its core, the ontology distinguishes between scheduled teaching events, the notes produced for those events, the computational examples that illustrate concepts, the notebook files that implement those examples, the textbooks that provide theoretical grounding, and the software packages that enable execution. Each entity type materialises as a base table with a surrogate primary key, and relationships between them are expressed through foreign keys and junction tables that enforce the cardinality constraints of the underlying conceptual model. The materialised schema therefore supports both a normalised storage layer and a set of denormalised views that reconstruct domain facts for analytical consumption.

**Table `lecture_sessions`**

| lecture_session_id | session_identifier | scheduled_date | duration_minutes | topic | status |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2024-11-27 | 35 | distributed-topic-60 | scheduled |
| 2 | SES-2449 | 2025-04-11 | 38 | baseline-topic-61 | completed |
| 3 | SES-2455 | 2022-09-22 | 41 | pilot-topic-62 | cancelled |
| 4 | SES-2461 | 2023-02-06 | 44 | extended-topic-63 | scheduled |

The `lecture_sessions` table is the central event entity. Each row represents a discrete teaching occasion identified by a surrogate `lecture_session_id` and a human-readable `session_identifier` such as `SES-2443`. The `scheduled_date` column anchors the session in calendar time, while `duration_minutes` captures the planned length — values like 35, 38, 41, and 44 minutes appear across the four sample rows. The `topic` column carries a domain-specific label (e.g. `distributed-topic-60`, `baseline-topic-61`), and `status` constrains the session lifecycle to one of `scheduled`, `completed`, or `cancelled`. This table is the anchor to which lecture notes, computational examples, and textbooks are linked, forming the spine of the relational model.

**Table `lecture_notes`**

| id | note_identifier | title | format | page_count | last_modified | lecture_session_id |
|---|---|---|---|---|---|---|
| 1 | NOT-2576 | Compact Initiative | legacy-format-25 | 6 | 2022-05-05T04:36:00 | 1 |
| 2 | NOT-2579 | Legacy Model | compact-format-26 | 7 | 2023-10-16T11:53:00 | 2 |
| 3 | NOT-2582 | Regional Cluster A | composite-format-27 | 0 | 2024-03-27T18:10:00 | 3 |
| 4 | NOT-2585 | Seasonal Review | primary-format-28 | 15 | 2025-08-11T01:27:00 | 4 |

Lecture notes are captured in the `lecture_notes` table, which stores metadata about the artefacts produced for each session. The surrogate `id` serves as the primary key, while `note_identifier` (e.g. `NOT-2576`, `NOT-2579`) provides a stable external reference. The `title` column carries descriptive names such as "Compact Initiative" and "Legacy Model", and `format` records the structural type of the note — values like `legacy-format-25`, `compact-format-26`, `composite-format-27`, and `primary-format-28` appear in the data. The `page_count` column is a cardinality-bounded integer that can be zero, as seen in the row for "Regional Cluster A" (page_count = 0). The `last_modified` timestamp provides auditability, and the `lecture_session_id` column is a foreign key referencing `lecture_sessions.lecture_session_id`, establishing a direct one-to-many relationship: a single lecture session may have multiple associated notes.

**Table `computational_examples`**

| id | example_identifier | title | software_version | file_size_bytes | status | lecture_session_id |
|---|---|---|---|---|---|---|
| 1000 | EXA-2550 | Compact Initiative | seasonal-software-47 | 32 | draft | 1 |
| 1001 | EXA-2551 | Legacy Model | regional-software-48 | 38 | reviewed | 2 |
| 1002 | EXA-2552 | Regional Cluster A | legacy-software-49 | 44 | published | 3 |
| 1003 | EXA-2553 | Seasonal Review | compact-software-50 | 50 | draft | 4 |

The `computational_examples` table models executable illustrations tied to lecture sessions. Its surrogate `id` is the primary key, and `example_identifier` (e.g. `EXA-2550`, `EXA-2551`) provides an external handle. The `title` column mirrors the naming convention of lecture notes ("Compact Initiative", "Legacy Model", "Regional Cluster A", "Seasonal Review"), while `software_version` records the version of software used (e.g. `seasonal-software-47`, `regional-software-48`). The `file_size_bytes` column stores the size of the example artefact, and `status` constrains the example lifecycle to `draft`, `reviewed`, or `published`. The `lecture_session_id` foreign key links each example back to its parent session, mirroring the relationship structure of `lecture_notes`.

**Table `notebook_files`**

| notebook_file_id | file_identifier | file_name | file_extension | creation_date | checksum | computational_example_id |
|---|---|---|---|---|---|---|
| 1 | FIL-2398 | Compact Standard | baseline-file-67 | 2022-01-13 | integrated-checksum-40 | 1000 |
| 2 | FIL-2400 | Legacy Framework | pilot-file-68 | 2023-06-24 | seasonal-checksum-41 | 1001 |
| 3 | FIL-2402 | Regional Protocol A | extended-file-69 | 2024-11-08 | regional-checksum-42 | 1002 |
| 4 | FIL-2404 | Seasonal Programme | integrated-file-70 | 2025-04-19 | legacy-checksum-43 | 1003 |

Notebook files represent the concrete implementation artefacts of computational examples. The `notebook_files` table uses `notebook_file_id` as its surrogate primary key and `file_identifier` (e.g. `FIL-2398`, `FIL-2400`) as an external reference. The `file_name` column carries human-readable names such as "Compact Standard" and "Legacy Framework", while `file_extension` records the file type. The `creation_date` column provides a timestamp, and `checksum` stores an integrity hash (e.g. `integrated-checksum-40`, `seasonal-checksum-41`). The `computational_example_id` foreign key establishes a direct link to the `computational_examples` table, meaning each notebook file is an implementation of exactly one computational example.

**Table `textbooks`**

| textbook_id | isbn | title | author | publisher | publication_year | price |
|---|---|---|---|---|---|---|
| 100 | 2618568 | Compact Initiative | Norma Fisher | pilot-publishe-50 | 25 | 12.87 |
| 101 | 4277024 | Legacy Model | Daniel Abbott | extended-publishe-51 | 33 | 35.45 |
| 102 | 1208-0004-M | Regional Cluster A | Chris Bennett | integrated-publishe-52 | 41 | 29.24 |
| 103 | 3717612 | Seasonal Review | Ernest Hemingway | seasonal-publishe-53 | 49 | 29.99 |

Textbooks are stored in the `textbooks` table as independent scholarly resources. The surrogate `textbook_id` is the primary key, and `isbn` provides a standard bibliographic identifier (e.g. `2618568`, `4277024`, `1208-0004-M`). The `title` column carries book titles such as "Compact Initiative" and "Legacy Model", while `author` stores the author's name (e.g. "Norma Fisher", "Daniel Abbott", "Chris Bennett", "Ernest Hemingway"). The `publisher` column records the publishing entity (e.g. `pilot-publishe-50`, `extended-publishe-51`), `publication_year` stores the year of publication, and `price` captures the cost. Textbooks are not directly linked to lecture sessions through a foreign key in this table; instead, the relationship is mediated through the junction table `textbooks_sessions`.

**Table `software_packages`**

| id | package_identifier | name | version | developer | license_type | computational_example_id |
|---|---|---|---|---|---|---|
| 1 | PAC-2606 | Extended Review | seasonal-version-71 | extended-develope-63 | regional-license-78 | 1000 |
| 2 | PAC-2611 | Pilot Initiative A | regional-version-72 | integrated-develope-64 | legacy-license-79 | 1001 |
| 3 | PAC-2616 | Baseline Model | legacy-version-73 | seasonal-develope-65 | compact-license-80 | 1002 |
| 4 | PAC-2621 | Distributed Cluster | compact-version-74 | regional-develope-66 | composite-license-81 | 1003 |

Software packages are modelled in the `software_packages` table, which records the tools used to execute computational examples. The surrogate `id` is the primary key, and `package_identifier` (e.g. `PAC-2606`, `PAC-2611`) provides an external reference. The `name` column carries package names such as "Extended Review" and "Pilot Initiative A", while `version` records the software version (e.g. `seasonal-version-71`, `regional-version-72`). The `developer` column stores the developer name (e.g. `extended-develope-63`, `integrated-develope-64`), and `license_type` records the licensing model (e.g. `regional-license-78`, `legacy-license-79`). The `computational_example_id` foreign key links each software package to the computational example it supports, establishing a one-to-many relationship: a single computational example may reference multiple software packages.

The cardinality-bounded relationships between these base tables are enforced through foreign keys and junction tables. The `sessions_notes` junction table mediates the many-to-many relationship between `lecture_sessions` and `lecture_notes`, allowing a single lecture session to be associated with multiple notes and a single note to be referenced by multiple sessions. Similarly, `sessions_examples` mediates the many-to-many relationship between `lecture_sessions` and `computational_examples`. The `examples_files` junction table links `computational_examples` to `notebook_files`, and `textbooks_sessions` links `textbooks` to `lecture_sessions`. These junction tables ensure that the normalised schema faithfully represents the ontology's relationship structure without introducing redundant data.

**Table `sessions_notes`**

| lecture_session_id | lecture_note_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `sessions_notes` junction table resolves the many-to-many relationship between lecture sessions and lecture notes. Its composite key consists of the foreign keys referencing `lecture_sessions.lecture_session_id` and `lecture_notes.id`, ensuring that each pairing of session and note is recorded exactly once. This design allows a lecture session to have multiple notes and a note to be associated with multiple sessions, reflecting the flexible pedagogical structure of the domain.

**Table `sessions_examples`**

| lecture_session_id | computational_example_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `sessions_examples` junction table mediates the many-to-many relationship between lecture sessions and computational examples. Like `sessions_notes`, it uses a composite key of foreign keys referencing `lecture_sessions.lecture_session_id` and `computational_examples.id`. This structure supports the scenario where a single session may present multiple computational examples and a single example may be reused across sessions.

**Table `examples_files`**

| computational_example_id | notebook_file_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `examples_files` junction table links computational examples to notebook files. Its composite key references `computational_examples.id` and `notebook_files.notebook_file_id`, enabling a single computational example to be implemented by multiple notebook files and a single notebook file to serve multiple examples. This flexibility accommodates iterative development and multiple implementation approaches.

**Table `textbooks_sessions`**

| textbook_id | lecture_session_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `textbooks_sessions` junction table connects textbooks to lecture sessions. Its composite key references `textbooks.textbook_id` and `lecture_sessions.lecture_session_id`, allowing any textbook to be referenced by any session and any session to draw on multiple textbooks. This decoupling supports a rich curriculum where resources are shared across sessions.

The materialised schema supports a set of views that reconstruct domain facts by joining the normalised tables. These views answer specific analytical questions by denormalising the data into a form suitable for reporting and exploration.

**View `vw_lecture_session_lecture_note_detail`**

```sql
CREATE VIEW vw_lecture_session_lecture_note_detail AS
SELECT a.lecture_session_id, a.session_identifier, a.scheduled_date, b.id AS note_id, b.note_identifier AS note_note_identifier, b.title AS note_title
FROM lecture_sessions a
  JOIN sessions_notes j ON j.lecture_session_id = a.lecture_session_id
  JOIN lecture_notes b ON b.id = j.lecture_note_id;
```

| lecture_session_id | session_identifier | scheduled_date | note_id | note_note_identifier | note_title |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2024-11-27 | 1 | NOT-2576 | Compact Initiative |
| 1 | SES-2443 | 2024-11-27 | 2 | NOT-2579 | Legacy Model |
| 2 | SES-2449 | 2025-04-11 | 2 | NOT-2579 | Legacy Model |
| 2 | SES-2449 | 2025-04-11 | 3 | NOT-2582 | Regional Cluster A |
| 3 | SES-2455 | 2022-09-22 | 3 | NOT-2582 | Regional Cluster A |
| 3 | SES-2455 | 2022-09-22 | 4 | NOT-2585 | Seasonal Review |
| 4 | SES-2461 | 2023-02-06 | 4 | NOT-2585 | Seasonal Review |
| 4 | SES-2461 | 2023-02-06 | 1 | NOT-2576 | Compact Initiative |

The view `vw_lecture_session_lecture_note_detail` joins `lecture_sessions` with `lecture_notes` to produce a detailed record of each session-note pairing. It answers the question: "What notes were produced for each lecture session, and what are their metadata properties?" Reading the sample data, the row for session `SES-2443` (topic: `distributed-topic-60`, status: `scheduled`) is paired with note `NOT-2576` ("Compact Initiative", format: `legacy-format-25`, page_count: 6). The row for session `SES-2449` (topic: `baseline-topic-61`, status: `completed`) is paired with note `NOT-2579` ("Legacy Model", format: `compact-format-26`, page_count: 7). This view effectively flattens the session-note relationship into a single analytical row.

**View `vw_lecture_session_computational_example_detail`**

```sql
CREATE VIEW vw_lecture_session_computational_example_detail AS
SELECT a.lecture_session_id, a.session_identifier, a.scheduled_date, b.id AS example_id, b.example_identifier AS example_example_identifier, b.title AS example_title
FROM lecture_sessions a
  JOIN sessions_examples j ON j.lecture_session_id = a.lecture_session_id
  JOIN computational_examples b ON b.id = j.computational_example_id;
```

| lecture_session_id | session_identifier | scheduled_date | example_id | example_example_identifier | example_title |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2024-11-27 | 1000 | EXA-2550 | Compact Initiative |
| 1 | SES-2443 | 2024-11-27 | 1001 | EXA-2551 | Legacy Model |
| 2 | SES-2449 | 2025-04-11 | 1001 | EXA-2551 | Legacy Model |
| 2 | SES-2449 | 2025-04-11 | 1002 | EXA-2552 | Regional Cluster A |
| 3 | SES-2455 | 2022-09-22 | 1002 | EXA-2552 | Regional Cluster A |
| 3 | SES-2455 | 2022-09-22 | 1003 | EXA-2553 | Seasonal Review |
| 4 | SES-2461 | 2023-02-06 | 1003 | EXA-2553 | Seasonal Review |
| 4 | SES-2461 | 2023-02-06 | 1000 | EXA-2550 | Compact Initiative |

The view `vw_lecture_session_computational_example_detail` joins `lecture_sessions` with `computational_examples` to present each session alongside its associated computational examples. It answers: "What computational examples were presented in each lecture session, and what are their execution properties?" For session `SES-2443` (topic: `distributed-topic-60`), the view surfaces example `EXA-2550` ("Compact Initiative", software_version: `seasonal-software-47`, file_size_bytes: 32, status: `draft`). For session `SES-2449` (topic: `baseline-topic-61`), it surfaces example `EXA-2551` ("Legacy Model", software_version: `regional-software-48`, file_size_bytes: 38, status: `reviewed`). This view is particularly useful for tracking the lifecycle status of examples across sessions.

**View `vw_lecture_note_lecture_session`**

```sql
CREATE VIEW vw_lecture_note_lecture_session AS
SELECT a.id, a.note_identifier, a.title, a.format, b.lecture_session_id AS session_lecture_session_id, b.session_identifier AS session_session_identifier, b.scheduled_date AS session_scheduled_date
FROM lecture_notes a JOIN lecture_sessions b ON a.lecture_session_id = b.lecture_session_id;
```

| id | note_identifier | title | format | session_lecture_session_id | session_session_identifier | session_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | NOT-2576 | Compact Initiative | legacy-format-25 | 1 | SES-2443 | 2024-11-27 |
| 2 | NOT-2579 | Legacy Model | compact-format-26 | 2 | SES-2449 | 2025-04-11 |
| 3 | NOT-2582 | Regional Cluster A | composite-format-27 | 3 | SES-2455 | 2022-09-22 |
| 4 | NOT-2585 | Seasonal Review | primary-format-28 | 4 | SES-2461 | 2023-02-06 |

The view `vw_lecture_note_lecture_session` presents lecture notes alongside their parent session information, effectively inverting the perspective of `vw_lecture_session_lecture_note_detail`. It answers: "For each lecture note, which session did it belong to, and what were the session's properties?" The row for note `NOT-2576` ("Compact Initiative", format: `legacy-format-25`, page_count: 6) shows its parent session `SES-2443` with topic `distributed-topic-60` and status `scheduled`. The row for note `NOT-2585` ("Seasonal Review", format: `primary-format-28`, page_count: 15) shows its parent session `SES-2461` with topic `extended-topic-63` and status `scheduled`. This view is useful for auditing notes from the perspective of the note author.

**View `vw_computational_example_lecture_session`**

```sql
CREATE VIEW vw_computational_example_lecture_session AS
SELECT a.id, a.example_identifier, a.title, a.software_version, b.lecture_session_id AS session_lecture_session_id, b.session_identifier AS session_session_identifier, b.scheduled_date AS session_scheduled_date
FROM computational_examples a JOIN lecture_sessions b ON a.lecture_session_id = b.lecture_session_id;
```

| id | example_identifier | title | software_version | session_lecture_session_id | session_session_identifier | session_scheduled_date |
|---|---|---|---|---|---|---|
| 1000 | EXA-2550 | Compact Initiative | seasonal-software-47 | 1 | SES-2443 | 2024-11-27 |
| 1001 | EXA-2551 | Legacy Model | regional-software-48 | 2 | SES-2449 | 2025-04-11 |
| 1002 | EXA-2552 | Regional Cluster A | legacy-software-49 | 3 | SES-2455 | 2022-09-22 |
| 1003 | EXA-2553 | Seasonal Review | compact-software-50 | 4 | SES-2461 | 2023-02-06 |

The view `vw_computational_example_lecture_session` presents computational examples alongside their parent session information. It answers: "For each computational example, which session did it support, and what were the session's scheduling properties?" The row for example `EXA-2550` ("Compact Initiative", software_version: `seasonal-software-47`, status: `draft`) shows its parent session `SES-2443` with scheduled_date `2024-11-27` and duration 35 minutes. The row for example `EXA-2552` ("Regional Cluster A", software_version: `legacy-software-49`, status: `published`) shows its parent session `SES-2455` with scheduled_date `2022-09-22` and duration 41 minutes. This view is valuable for tracking example publication status against session scheduling.

**View `vw_computational_example_notebook_file_detail`**

```sql
CREATE VIEW vw_computational_example_notebook_file_detail AS
SELECT a.id, a.example_identifier, a.title, b.notebook_file_id AS file_notebook_file_id, b.file_identifier AS file_file_identifier, b.file_name AS file_file_name
FROM computational_examples a
  JOIN examples_files j ON j.computational_example_id = a.id
  JOIN notebook_files b ON b.notebook_file_id = j.notebook_file_id;
```

| id | example_identifier | title | file_notebook_file_id | file_file_identifier | file_file_name |
|---|---|---|---|---|---|
| 1000 | EXA-2550 | Compact Initiative | 1 | FIL-2398 | Compact Standard |
| 1000 | EXA-2550 | Compact Initiative | 2 | FIL-2400 | Legacy Framework |
| 1001 | EXA-2551 | Legacy Model | 2 | FIL-2400 | Legacy Framework |
| 1001 | EXA-2551 | Legacy Model | 3 | FIL-2402 | Regional Protocol A |
| 1002 | EXA-2552 | Regional Cluster A | 3 | FIL-2402 | Regional Protocol A |
| 1002 | EXA-2552 | Regional Cluster A | 4 | FIL-2404 | Seasonal Programme |
| 1003 | EXA-2553 | Seasonal Review | 4 | FIL-2404 | Seasonal Programme |
| 1003 | EXA-2553 | Seasonal Review | 1 | FIL-2398 | Compact Standard |

The view `vw_computational_example_notebook_file_detail` joins `computational_examples` with `notebook_files` to present each example alongside its implementation artefact. It answers: "What notebook file implements each computational example, and what are the file's metadata properties?" The row for example `EXA-2550` ("Compact Initiative", software_version: `seasonal-software-47`) is paired with file `FIL-2398` ("Compact Standard", extension: `baseline-file-67`, creation_date: `2022-01-13`, checksum: `integrated-checksum-40`). The row for example `EXA-2551` ("Legacy Model", software_version: `regional-software-48`) is paired with file `FIL-2400` ("Legacy Framework", extension: `pilot-file-68`, creation_date: `2023-06-24`, checksum: `seasonal-checksum-41`). This view is essential for traceability between abstract examples and concrete implementations.

**View `vw_notebook_file_computational_example`**

```sql
CREATE VIEW vw_notebook_file_computational_example AS
SELECT a.notebook_file_id, a.file_identifier, a.file_name, a.file_extension, b.id AS example_id, b.example_identifier AS example_example_identifier, b.title AS example_title
FROM notebook_files a JOIN computational_examples b ON a.computational_example_id = b.id;
```

| notebook_file_id | file_identifier | file_name | file_extension | example_id | example_example_identifier | example_title |
|---|---|---|---|---|---|---|
| 1 | FIL-2398 | Compact Standard | baseline-file-67 | 1000 | EXA-2550 | Compact Initiative |
| 2 | FIL-2400 | Legacy Framework | pilot-file-68 | 1001 | EXA-2551 | Legacy Model |
| 3 | FIL-2402 | Regional Protocol A | extended-file-69 | 1002 | EXA-2552 | Regional Cluster A |
| 4 | FIL-2404 | Seasonal Programme | integrated-file-70 | 1003 | EXA-2553 | Seasonal Review |

The view `vw_notebook_file_computational_example` inverts the perspective of `vw_computational_example_notebook_file_detail`, presenting notebook files alongside their parent computational example. It answers: "For each notebook file, which computational example does it implement, and what are the example's properties?" The row for file `FIL-2398` ("Compact Standard", extension: `baseline-file-67`, creation_date: `2022-01-13`) shows its parent example `EXA-2550` with title "Compact Initiative" and status `draft`. The row for file `FIL-2404` ("Seasonal Programme", extension: `integrated-file-70`, creation_date: `2025-04-19`) shows its parent example `EXA-2553` with title "Seasonal Review" and status `draft`. This view supports file-centric auditing and version control workflows.

**View `vw_textbook_lecture_session_detail`**

```sql
CREATE VIEW vw_textbook_lecture_session_detail AS
SELECT a.textbook_id, a.isbn, a.title, b.lecture_session_id AS session_lecture_session_id, b.session_identifier AS session_session_identifier, b.scheduled_date AS session_scheduled_date
FROM textbooks a
  JOIN textbooks_sessions j ON j.textbook_id = a.textbook_id
  JOIN lecture_sessions b ON b.lecture_session_id = j.lecture_session_id;
```

| textbook_id | isbn | title | session_lecture_session_id | session_session_identifier | session_scheduled_date |
|---|---|---|---|---|---|
| 100 | 2618568 | Compact Initiative | 1 | SES-2443 | 2024-11-27 |
| 100 | 2618568 | Compact Initiative | 2 | SES-2449 | 2025-04-11 |
| 101 | 4277024 | Legacy Model | 2 | SES-2449 | 2025-04-11 |
| 101 | 4277024 | Legacy Model | 3 | SES-2455 | 2022-09-22 |
| 102 | 1208-0004-M | Regional Cluster A | 3 | SES-2455 | 2022-09-22 |
| 102 | 1208-0004-M | Regional Cluster A | 4 | SES-2461 | 2023-02-06 |
| 103 | 3717612 | Seasonal Review | 4 | SES-2461 | 2023-02-06 |
| 103 | 3717612 | Seasonal Review | 1 | SES-2443 | 2024-11-27 |

The view `vw_textbook_lecture_session_detail` joins `textbooks` with `lecture_sessions` through the `textbooks_sessions` junction table to present each textbook alongside the sessions that reference it. It answers: "Which lecture sessions draw on each textbook, and what are the session's scheduling properties?" The row for textbook `2618568` ("Compact Initiative" by Norma Fisher, publisher: `pilot-publishe-50`, year: 25, price: 12.87) is paired with session `SES-2443` (topic: `distributed-topic-60`, status: `scheduled`). The row for textbook `4277024` ("Legacy Model" by Daniel Abbott, publisher: `extended-publishe-51`, year: 33, price: 35.45) is paired with session `SES-2449` (topic: `baseline-topic-61`, status: `completed`). This view supports curriculum planning and resource allocation analysis.

**View `vw_software_package_computational_example`**

```sql
CREATE VIEW vw_software_package_computational_example AS
SELECT a.id, a.package_identifier, a.name, a.version, b.id AS example_id, b.example_identifier AS example_example_identifier, b.title AS example_title
FROM software_packages a JOIN computational_examples b ON a.computational_example_id = b.id;
```

| id | package_identifier | name | version | example_id | example_example_identifier | example_title |
|---|---|---|---|---|---|---|
| 1 | PAC-2606 | Extended Review | seasonal-version-71 | 1000 | EXA-2550 | Compact Initiative |
| 2 | PAC-2611 | Pilot Initiative A | regional-version-72 | 1001 | EXA-2551 | Legacy Model |
| 3 | PAC-2616 | Baseline Model | legacy-version-73 | 1002 | EXA-2552 | Regional Cluster A |
| 4 | PAC-2621 | Distributed Cluster | compact-version-74 | 1003 | EXA-2553 | Seasonal Review |

The view `vw_software_package_computational_example` joins `software_packages` with `computational_examples` to present each software package alongside the example it supports. It answers: "Which computational example uses each software package, and what are the example's properties?" The row for package `PAC-2606` ("Extended Review", version: `seasonal-version-71`, developer: `extended-develope-63`, license: `regional-license-78`) is paired with example `EXA-2550` ("Compact Initiative", software_version: `seasonal-software-47`, status: `draft`). The row for package `PAC-2621` ("Distributed Cluster", version: `compact-version-74`, developer: `regional-develope-66`, license: `composite-license-81`) is paired with example `EXA-2553` ("Seasonal Review", software_version: `compact-software-50`, status: `draft`). This view is critical for license compliance auditing and software dependency management.

The relational schema presented here demonstrates a clean separation between the normalised storage layer and the analytical view layer. The base tables enforce referential integrity through foreign keys and junction tables, faithfully representing the ontology's entity types and cardinality-bounded relationships. The views then reconstruct domain facts by joining these normalised tables, providing denormalised perspectives that answer specific analytical questions. This two-layer architecture supports both data integrity at the storage level and analytical flexibility at the presentation level, embodying the principle that a well-designed relational schema should serve both operational and analytical workloads without compromise. The concrete values observed across the tables — session identifiers like `SES-2443`, note titles like "Compact Initiative", example statuses like `draft` and `published`, file checksums like `integrated-checksum-40`, textbook prices like 12.87, and software licenses like `regional-license-78` — collectively illustrate a domain where pedagogical events, scholarly resources, and computational artefacts are tightly interwoven and systematically tracked.