## Ontology-Grounded Relational Modelling of a Lecture-Note-Example Ecosystem

The domain under examination is a structured educational content management system in which lecture sessions, lecture notes, computational examples, mathematical concepts, and digital repositories are interrelated through a carefully normalised relational schema. The system tracks scheduled and completed teaching events, the notes produced for those events, executable computational artefacts authored by individuals, the mathematical ideas those examples illustrate, and the storage repositories that host them. Every entity type is captured as a base table with a surrogate primary key, and the many-to-many relationships that naturally arise between them are resolved through junction tables. Views then reassemble the normalised facts into denormalised projections that answer concrete analytical questions.

**Table `lecture_sessions`**

| id | session_identifier | scheduled_date | duration_minutes | topic | status |
|---|---|---|---|---|---|
| 1000 | SES-2443 | 2024-11-27 | 35 | distributed-topic-60 | scheduled |
| 1001 | SES-2449 | 2025-04-11 | 38 | baseline-topic-61 | in_progress |
| 1002 | SES-2455 | 2022-09-22 | 41 | pilot-topic-62 | completed |
| 1003 | SES-2461 | 2023-02-06 | 44 | extended-topic-63 | cancelled |

The `lecture_sessions` table anchors the entire model. Each row represents a discrete teaching event identified by a human-readable `session_identifier` such as `SES-2443`, `SES-2449`, `SES-2455`, or `SES-2461`. The `scheduled_date` column records the calendar date of the session, while `duration_minutes` constrains the length of the event to values like 35, 38, 41, or 44 minutes. The `topic` column carries a domain label — for instance `distributed-topic-60`, `baseline-topic-61`, `pilot-topic-62`, or `extended-topic-63` — and `status` enumerates the lifecycle state of the session as `scheduled`, `in_progress`, `completed`, or `cancelled`. The surrogate `id` column (1000–1003) serves as the primary key and the foreign-key target for downstream tables.

**Table `lecture_notes`**

| id | note_id | title | version_number | page_count | last_modified | format | lecture_session_id | computational_example_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | account_pymes_100 | Compact Initiative | 16 | 6 | 2022-05-05T04:36:00 | pdf | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5917294 | Legacy Model | 27 | 7 | 2023-10-16T11:53:00 | docx | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9568439 | Regional Cluster A | 38 | 0 | 2024-03-27T18:10:00 | markdown | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 168556 | Seasonal Review | 49 | 15 | 2025-08-11T01:27:00 | pdf | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Lecture notes are stored in `lecture_notes`, a table that not only captures note metadata but also embeds two foreign keys: `lecture_session_id` and `computational_example_id`. Each note carries a `note_id` (e.g. `account_pymes_100`, `5917294`, `9568439`, `168556`), a `title` such as `Compact Initiative` or `Legacy Model`, a `version_number` ranging from 16 to 49, a `page_count` (0–15), a `last_modified` timestamp, a `format` (`pdf`, `docx`, or `markdown`), and audit columns `created_at` and `updated_at`. The `lecture_session_id` column (values 1000–1003) references `lecture_sessions.id`, while `computational_example_id` (values 100–103) references `computational_examples.id`. This dual foreign-key design means that a single note can be associated with one lecture session and one computational example directly, without requiring a junction table for this particular pairing.

**Table `computational_examples`**

| id | example_id | title | file_format | file_size_bytes | creation_date | author | license | digital_repository_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 10445646 | Compact Initiative | nb | 32 | 2022-01-13 | Norma Fisher | baseline-license-43 | 1 |
| 101 | 5844277 | Legacy Model | m | 38 | 2023-06-24 | Daniel Abbott | pilot-license-44 | 2 |
| 102 | 1250207 | Regional Cluster A | cdf | 44 | 2024-11-08 | Chris Bennett | extended-license-45 | 3 |
| 103 | 4627 | Seasonal Review | nb | 50 | 2025-04-19 | Ernest Hemingway | integrated-license-46 | 4 |

The `computational_examples` table stores executable artefacts. Each row has a surrogate `id` (100–103), a business `example_id` (e.g. `10445646`, `5844277`, `1250207`, `4627`), a `title` matching the note titles (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), a `file_format` (`nb`, `m`, or `cdf`), a `file_size_bytes` (32–50), a `creation_date`, an `author` name (Norma Fisher, Daniel Abbott, Chris Bennett, Ernest Hemingway), a `license` identifier (`baseline-license-43`, `pilot-license-44`, `extended-license-45`, `integrated-license-46`), and a `digital_repository_id` foreign key pointing to `digital_repositories.id`.

**Table `mathematical_concepts`**

| concept_id | name | category | complexity_level | prerequisite_concepts | computational_example_id | lecture_session_id |
|---|---|---|---|---|---|---|
| 884350 | Extended Review | calculus | 37 | distributed-prerequi-72 | 100 | 1000 |
| 392497 | Pilot Initiative A | differential_equations | 45 | baseline-prerequi-73 | 101 | 1001 |
| 2106713 | Baseline Model | linear_algebra | 53 | pilot-prerequi-74 | 102 | 1002 |
| 4463648 | Distributed Cluster | numerical_methods | 61 | extended-prerequi-75 | 103 | 1003 |

Mathematical concepts are captured in `mathematical_concepts`, which stores the abstract ideas that computational examples illustrate. The table uses `concept_id` as its primary key (values 884350, 392497, 2106713, 4463648), and includes `name` (e.g. `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), `category` (`calculus`, `differential_equations`, `linear_algebra`, `numerical_methods`), `complexity_level` (37–61), `prerequisite_concepts` (such as `distributed-prerequi-72` or `baseline-prerequi-73`), and two foreign keys: `computational_example_id` referencing `computational_examples.id` and `lecture_session_id` referencing `lecture_sessions.id`. Like `lecture_notes`, this table embeds direct foreign keys to two other base tables rather than relying solely on junction tables.

**Table `digital_repositories`**

| id | repository_id | name | storage_path | total_capacity_g_b | last_backup | access_level |
|---|---|---|---|---|---|---|
| 1 | 611503 | Extended Review | compact-storage-32 | 13.70 | 2022-09-14T08:48:00 | public |
| 2 | 2106692 | Pilot Initiative A | composite-storage-33 | 16.40 | 2023-02-25T15:05:00 | restricted |
| 3 | 884340 | Baseline Model | primary-storage-34 | 19.10 | 2024-07-09T22:22:00 | private |
| 4 | 884350 | Distributed Cluster | adaptive-storage-35 | 21.80 | 2025-12-20T05:39:00 | public |

The `digital_repositories` table models the storage infrastructure. Each row has a surrogate `id` (1–4), a business `repository_id` (e.g. `611503`, `2106692`, `884340`, `884350`), a `name` matching the mathematical concept names, a `storage_path` (`compact-storage-32`, `composite-storage-33`, `primary-storage-34`, `adaptive-storage-35`), a `total_capacity_g_b` (13.70–21.80), a `last_backup` timestamp, and an `access_level` (`public`, `restricted`, or `private`). The `computational_examples` table references this table via `digital_repository_id`, establishing a one-to-many relationship: one repository can host multiple computational examples.

The remaining base tables are pure junction tables that resolve many-to-many relationships. The `sessions_notes` junction table links `lecture_sessions` to `lecture_notes`. Its two columns, `lecture_session_id` and `lecture_note_id`, form a composite primary key. The data shows that session 1000 is associated with notes 1 and 2, session 1001 with notes 2 and 3, session 1002 with notes 3 and 4, and session 1003 with notes 4 and 1 — confirming that each session can have multiple notes and each note can belong to multiple sessions.

**Table `sessions_notes`**

| lecture_session_id | lecture_note_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `sessions_examples` junction table resolves the many-to-many relationship between `lecture_sessions` and `computational_examples`. Its columns `lecture_session_id` and `computational_example_id` together form the composite primary key.

**Table `sessions_examples`**

| lecture_session_id | computational_example_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `examples_concepts` junction table links `computational_examples` to `mathematical_concepts`. Its columns `computational_example_id` and `concept_id` form the composite primary key.

**Table `examples_concepts`**

| computational_example_id | concept_id |
|---|---|
| 100 | 884350 |
| 100 | 392497 |
| 101 | 392497 |
| 101 | 2106713 |
| 102 | 2106713 |
| 102 | 4463648 |
| 103 | 4463648 |
| 103 | 884350 |

The `repositories_examples` junction table resolves the many-to-many relationship between `digital_repositories` and `computational_examples`. Its columns `digital_repository_id` and `computational_example_id` form the composite primary key.

**Table `repositories_examples`**

| digital_repository_id | computational_example_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `repositories_notes` junction table links `digital_repositories` to `lecture_notes`. Its columns `digital_repository_id` and `lecture_note_id` form the composite primary key.

**Table `repositories_notes`**

| digital_repository_id | lecture_note_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

With the base schema established, the views reassemble normalised facts into denormalised projections. Each view answers a specific analytical question by joining the relevant base and junction tables.

**View `v_lecture_session_lecture_note_detail`**

```sql
CREATE VIEW v_lecture_session_lecture_note_detail AS
SELECT a.id, a.session_identifier, a.scheduled_date, b.id AS note_id, b.note_id AS note_note_id, b.title AS note_title
FROM lecture_sessions a
  JOIN sessions_notes j ON j.lecture_session_id = a.id
  JOIN lecture_notes b ON b.id = j.lecture_note_id;
```

| id | session_identifier | scheduled_date | note_id | note_note_id | note_title |
|---|---|---|---|---|---|
| 1000 | SES-2443 | 2024-11-27 | 1 | account_pymes_100 | Compact Initiative |
| 1000 | SES-2443 | 2024-11-27 | 2 | 5917294 | Legacy Model |
| 1001 | SES-2449 | 2025-04-11 | 2 | 5917294 | Legacy Model |
| 1001 | SES-2449 | 2025-04-11 | 3 | 9568439 | Regional Cluster A |
| 1002 | SES-2455 | 2022-09-22 | 3 | 9568439 | Regional Cluster A |
| 1002 | SES-2455 | 2022-09-22 | 4 | 168556 | Seasonal Review |
| 1003 | SES-2461 | 2023-02-06 | 4 | 168556 | Seasonal Review |
| 1003 | SES-2461 | 2023-02-06 | 1 | account_pymes_100 | Compact Initiative |

The view `v_lecture_session_lecture_note_detail` joins `lecture_sessions` to `lecture_notes` through the `sessions_notes` junction table, producing a denormalised row for every session-note pairing. It answers the question: "Which lecture notes are associated with which lecture sessions, and what are their metadata attributes?" Reading the first two rows as evidence, session `SES-2443` (id 1000) is linked to note `account_pymes_100` (Compact Initiative, 6 pages, pdf format) and to note `5917294` (Legacy Model, 7 pages, docx format). The join reconstructs the domain fact that a single lecture session can have multiple notes, each with its own versioning, format, and modification history.

**View `v_lecture_session_computational_example_detail`**

```sql
CREATE VIEW v_lecture_session_computational_example_detail AS
SELECT a.id, a.session_identifier, a.scheduled_date, b.id AS example_id, b.example_id AS example_example_id, b.title AS example_title
FROM lecture_sessions a
  JOIN sessions_examples j ON j.lecture_session_id = a.id
  JOIN computational_examples b ON b.id = j.computational_example_id;
```

| id | session_identifier | scheduled_date | example_id | example_example_id | example_title |
|---|---|---|---|---|---|
| 1000 | SES-2443 | 2024-11-27 | 100 | 10445646 | Compact Initiative |
| 1000 | SES-2443 | 2024-11-27 | 101 | 5844277 | Legacy Model |
| 1001 | SES-2449 | 2025-04-11 | 101 | 5844277 | Legacy Model |
| 1001 | SES-2449 | 2025-04-11 | 102 | 1250207 | Regional Cluster A |
| 1002 | SES-2455 | 2022-09-22 | 102 | 1250207 | Regional Cluster A |
| 1002 | SES-2455 | 2022-09-22 | 103 | 4627 | Seasonal Review |
| 1003 | SES-2461 | 2023-02-06 | 103 | 4627 | Seasonal Review |
| 1003 | SES-2461 | 2023-02-06 | 100 | 10445646 | Compact Initiative |

The view `v_lecture_session_computational_example_detail` joins `lecture_sessions` to `computational_examples` through the `sessions_examples` junction table. It answers: "Which computational examples are associated with which lecture sessions, and what are their file and licensing attributes?" A representative row shows session `SES-2443` linked to example `10445646` (Compact Initiative, authored by Norma Fisher, nb format, 32 bytes, baseline-license-43). This view allows an analyst to trace from a scheduled teaching event to the executable artefacts used during that session.

**View `v_lecture_note_lecture_session`**

```sql
CREATE VIEW v_lecture_note_lecture_session AS
SELECT a.id, a.note_id, a.title, a.version_number, b.id AS session_id, b.session_identifier AS session_session_identifier, b.scheduled_date AS session_scheduled_date
FROM lecture_notes a JOIN lecture_sessions b ON a.lecture_session_id = b.id;
```

| id | note_id | title | version_number | session_id | session_session_identifier | session_scheduled_date |
|---|---|---|---|---|---|---|
| 1 | account_pymes_100 | Compact Initiative | 16 | 1000 | SES-2443 | 2024-11-27 |
| 2 | 5917294 | Legacy Model | 27 | 1001 | SES-2449 | 2025-04-11 |
| 3 | 9568439 | Regional Cluster A | 38 | 1002 | SES-2455 | 2022-09-22 |
| 4 | 168556 | Seasonal Review | 49 | 1003 | SES-2461 | 2023-02-06 |

The view `v_lecture_note_lecture_session` performs the inverse join of `v_lecture_session_lecture_note_detail`, starting from `lecture_notes` and joining to `lecture_sessions` via `sessions_notes`. It answers: "For each lecture note, which lecture session(s) is it associated with?" A row for note `account_pymes_100` (Compact Initiative, version 16, 6 pages) reveals its association with session `SES-2443` (topic: distributed-topic-60, status: scheduled). This perspective is useful when auditing notes from the note side rather than from the session side.

**View `v_lecture_note_computational_example`**

```sql
CREATE VIEW v_lecture_note_computational_example AS
SELECT a.id, a.note_id, a.title, a.version_number, b.id AS example_id, b.example_id AS example_example_id, b.title AS example_title
FROM lecture_notes a JOIN computational_examples b ON a.computational_example_id = b.id;
```

| id | note_id | title | version_number | example_id | example_example_id | example_title |
|---|---|---|---|---|---|---|
| 1 | account_pymes_100 | Compact Initiative | 16 | 100 | 10445646 | Compact Initiative |
| 2 | 5917294 | Legacy Model | 27 | 101 | 5844277 | Legacy Model |
| 3 | 9568439 | Regional Cluster A | 38 | 102 | 1250207 | Regional Cluster A |
| 4 | 168556 | Seasonal Review | 49 | 103 | 4627 | Seasonal Review |

The view `v_lecture_note_computational_example` joins `lecture_notes` to `computational_examples` directly, using the `lecture_session_id` and `computational_example_id` foreign keys embedded in `lecture_notes`. It answers: "Which computational examples are linked to which lecture notes?" A row shows note `account_pymes_100` (Compact Initiative) linked to example `10445646` (also titled Compact Initiative, authored by Norma Fisher, nb format). The view confirms that notes and examples can share titles, suggesting a deliberate naming convention that ties the documentation artefact to its executable counterpart.

**View `v_computational_example_mathematical_concept_detail`**

```sql
CREATE VIEW v_computational_example_mathematical_concept_detail AS
SELECT a.id, a.example_id, a.title, b.concept_id AS concept_concept_id, b.name AS concept_name, b.category AS concept_category
FROM computational_examples a
  JOIN examples_concepts j ON j.computational_example_id = a.id
  JOIN mathematical_concepts b ON b.concept_id = j.concept_id;
```

| id | example_id | title | concept_concept_id | concept_name | concept_category |
|---|---|---|---|---|---|
| 100 | 10445646 | Compact Initiative | 884350 | Extended Review | calculus |
| 100 | 10445646 | Compact Initiative | 392497 | Pilot Initiative A | differential_equations |
| 101 | 5844277 | Legacy Model | 392497 | Pilot Initiative A | differential_equations |
| 101 | 5844277 | Legacy Model | 2106713 | Baseline Model | linear_algebra |
| 102 | 1250207 | Regional Cluster A | 2106713 | Baseline Model | linear_algebra |
| 102 | 1250207 | Regional Cluster A | 4463648 | Distributed Cluster | numerical_methods |
| 103 | 4627 | Seasonal Review | 4463648 | Distributed Cluster | numerical_methods |
| 103 | 4627 | Seasonal Review | 884350 | Extended Review | calculus |

The view `v_computational_example_mathematical_concept_detail` joins `computational_examples` to `mathematical_concepts` through the `examples_concepts` junction table. It answers: "Which mathematical concepts does each computational example illustrate, and what are their complexity and prerequisite attributes?" A representative row shows example `10445646` (Compact Initiative, nb format, authored by Norma Fisher) linked to concept `Extended Review` in the `calculus` category with complexity level 37 and prerequisite `distributed-prerequi-72`. This view is essential for curriculum mapping, as it reveals the mathematical depth of each executable example.

**View `v_computational_example_digital_repository`**

```sql
CREATE VIEW v_computational_example_digital_repository AS
SELECT a.id, a.example_id, a.title, a.file_format, b.id AS repository_id, b.repository_id AS repository_repository_id, b.name AS repository_name
FROM computational_examples a JOIN digital_repositories b ON a.digital_repository_id = b.id;
```

| id | example_id | title | file_format | repository_id | repository_repository_id | repository_name |
|---|---|---|---|---|---|---|
| 100 | 10445646 | Compact Initiative | nb | 1 | 611503 | Extended Review |
| 101 | 5844277 | Legacy Model | m | 2 | 2106692 | Pilot Initiative A |
| 102 | 1250207 | Regional Cluster A | cdf | 3 | 884340 | Baseline Model |
| 103 | 4627 | Seasonal Review | nb | 4 | 884350 | Distributed Cluster |

The view `v_computational_example_digital_repository` joins `computational_examples` to `digital_repositories` through the `repositories_examples` junction table. It answers: "Which digital repository hosts each computational example, and what are the repository's storage and access attributes?" A row shows example `10445646` (Compact Initiative, nb format) hosted in repository `611503` (Extended Review, compact-storage-32, 13.70 GB capacity, public access). This view supports storage auditing and access-control analysis.

**View `v_mathematical_concept_computational_example`**

```sql
CREATE VIEW v_mathematical_concept_computational_example AS
SELECT a.concept_id, a.name, a.category, a.complexity_level, b.id AS example_id, b.example_id AS example_example_id, b.title AS example_title
FROM mathematical_concepts a JOIN computational_examples b ON a.computational_example_id = b.id;
```

| concept_id | name | category | complexity_level | example_id | example_example_id | example_title |
|---|---|---|---|---|---|---|
| 884350 | Extended Review | calculus | 37 | 100 | 10445646 | Compact Initiative |
| 392497 | Pilot Initiative A | differential_equations | 45 | 101 | 5844277 | Legacy Model |
| 2106713 | Baseline Model | linear_algebra | 53 | 102 | 1250207 | Regional Cluster A |
| 4463648 | Distributed Cluster | numerical_methods | 61 | 103 | 4627 | Seasonal Review |

The view `v_mathematical_concept_computational_example` joins `mathematical_concepts` to `computational_examples` through the `examples_concepts` junction table, providing the inverse perspective of `v_computational_example_mathematical_concept_detail`. It answers: "For each mathematical concept, which computational examples illustrate it?" A row for concept `Extended Review` (calculus, complexity 37) shows its association with example `10445646` (Compact Initiative, nb format, authored by Norma Fisher). This view is useful when planning a curriculum from the mathematical-concept side rather than from the example side.

**View `v_mathematical_concept_lecture_session`**

```sql
CREATE VIEW v_mathematical_concept_lecture_session AS
SELECT a.concept_id, a.name, a.category, a.complexity_level, b.id AS session_id, b.session_identifier AS session_session_identifier, b.scheduled_date AS session_scheduled_date
FROM mathematical_concepts a JOIN lecture_sessions b ON a.lecture_session_id = b.id;
```

| concept_id | name | category | complexity_level | session_id | session_session_identifier | session_scheduled_date |
|---|---|---|---|---|---|---|
| 884350 | Extended Review | calculus | 37 | 1000 | SES-2443 | 2024-11-27 |
| 392497 | Pilot Initiative A | differential_equations | 45 | 1001 | SES-2449 | 2025-04-11 |
| 2106713 | Baseline Model | linear_algebra | 53 | 1002 | SES-2455 | 2022-09-22 |
| 4463648 | Distributed Cluster | numerical_methods | 61 | 1003 | SES-2461 | 2023-02-06 |

The view `v_mathematical_concept_lecture_session` joins `mathematical_concepts` to `lecture_sessions` directly, using the `lecture_session_id` foreign key embedded in `mathematical_concepts`. It answers: "Which lecture sessions are associated with which mathematical concepts?" A row shows concept `Extended Review` (calculus, complexity 37) linked to session `SES-2443` (topic: distributed-topic-60, status: scheduled). This direct foreign-key path bypasses the `examples_concepts` junction table, providing a shortcut from concept to session.

**View `v_digital_repository_computational_example_detail`**

```sql
CREATE VIEW v_digital_repository_computational_example_detail AS
SELECT a.id, a.repository_id, a.name, b.id AS example_id, b.example_id AS example_example_id, b.title AS example_title
FROM digital_repositories a
  JOIN repositories_examples j ON j.digital_repository_id = a.id
  JOIN computational_examples b ON b.id = j.computational_example_id;
```

| id | repository_id | name | example_id | example_example_id | example_title |
|---|---|---|---|---|---|
| 1 | 611503 | Extended Review | 100 | 10445646 | Compact Initiative |
| 1 | 611503 | Extended Review | 101 | 5844277 | Legacy Model |
| 2 | 2106692 | Pilot Initiative A | 101 | 5844277 | Legacy Model |
| 2 | 2106692 | Pilot Initiative A | 102 | 1250207 | Regional Cluster A |
| 3 | 884340 | Baseline Model | 102 | 1250207 | Regional Cluster A |
| 3 | 884340 | Baseline Model | 103 | 4627 | Seasonal Review |
| 4 | 884350 | Distributed Cluster | 103 | 4627 | Seasonal Review |
| 4 | 884350 | Distributed Cluster | 100 | 10445646 | Compact Initiative |

The view `v_digital_repository_computational_example_detail` joins `digital_repositories` to `computational_examples` through the `repositories_examples` junction table. It answers: "Which computational examples are stored in each digital repository, and what are their file and licensing attributes?" A row for repository `611503` (Extended Review, compact-storage-32, 13.70 GB, public access) shows it hosts example `10445646` (Compact Initiative, nb format, 32 bytes, authored by Norma Fisher, baseline-license-43). This view supports capacity planning and license compliance auditing.

**View `v_digital_repository_lecture_note_detail`**

```sql
CREATE VIEW v_digital_repository_lecture_note_detail AS
SELECT a.id, a.repository_id, a.name, b.id AS note_id, b.note_id AS note_note_id, b.title AS note_title
FROM digital_repositories a
  JOIN repositories_notes j ON j.digital_repository_id = a.id
  JOIN lecture_notes b ON b.id = j.lecture_note_id;
```

| id | repository_id | name | note_id | note_note_id | note_title |
|---|---|---|---|---|---|
| 1 | 611503 | Extended Review | 1 | account_pymes_100 | Compact Initiative |
| 1 | 611503 | Extended Review | 2 | 5917294 | Legacy Model |
| 2 | 2106692 | Pilot Initiative A | 2 | 5917294 | Legacy Model |
| 2 | 2106692 | Pilot Initiative A | 3 | 9568439 | Regional Cluster A |
| 3 | 884340 | Baseline Model | 3 | 9568439 | Regional Cluster A |
| 3 | 884340 | Baseline Model | 4 | 168556 | Seasonal Review |
| 4 | 884350 | Distributed Cluster | 4 | 168556 | Seasonal Review |
| 4 | 884350 | Distributed Cluster | 1 | account_pymes_100 | Compact Initiative |

The view `v_digital_repository_lecture_note_detail` joins `digital_repositories` to `lecture_notes` through the `repositories_notes` junction table. It answers: "Which lecture notes are stored in each digital repository, and what are their metadata attributes?" A row for repository `611503` (Extended Review, compact-storage-32, 13.70 GB, public access) shows it hosts note `account_pymes_100` (Compact Initiative, version 16, 6 pages, pdf format, last modified 2022-05-05). This view enables storage-level auditing of note artefacts.

The schema as a whole demonstrates a disciplined approach to ontology-grounded relational modelling. Five core entity types — lecture sessions, lecture notes, computational examples, mathematical concepts, and digital repositories — are each captured in a dedicated base table with a surrogate primary key and domain-specific attributes. Many-to-many relationships between sessions and notes, sessions and examples, examples and concepts, repositories and examples, and repositories and notes are resolved through five junction tables, each with a composite primary key formed from the two participating foreign keys. Two additional tables (`lecture_notes` and `mathematical_concepts`) embed direct foreign keys to two other base tables, creating shortcut paths that bypass junction tables for certain analytical queries. The ten views then reassemble these normalised facts into denormalised projections, each answering a specific analytical question by joining the relevant base and junction tables. Reading concrete rows — such as session `SES-2443` linked to note `account_pymes_100` and example `10445646`, which in turn illustrates concept `Extended Review` stored in repository `611503` — the schema reveals a coherent, traceable chain from teaching event through documentation, executable artefact, mathematical idea, and storage infrastructure.