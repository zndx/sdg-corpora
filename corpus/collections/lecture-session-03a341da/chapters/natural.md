## The Architecture of Academic Knowledge Management

Modern research institutions and educational organizations manage vast ecosystems of instructional content, computational artifacts, and mathematical theory. At the heart of this ecosystem lies a structured framework for tracking lecture sessions, their associated documentation, executable examples, underlying mathematical concepts, and the digital repositories that store them. This chapter examines how these five core entities interrelate, how cross-reference tables enable many-to-many associations, and how materialized views provide practitioners with ready-made lenses for querying the interconnected data. The domain spans scheduled sessions with distinct lifecycle statuses, versioned lecture notes in multiple formats, computational examples authored by individuals and governed by licenses, mathematical concepts organized by category and complexity, and digital repositories with defined storage capacities and access controls. Together, these records form a coherent knowledge graph that supports curriculum planning, resource discovery, and content governance.

## Lecture Sessions and Their Lifecycle

Lecture sessions represent the foundational scheduling unit of the instructional calendar. Each session carries a unique identifier, a human-readable session code, a scheduled date, a planned duration, a topic label, and a status reflecting its current state in the lifecycle.

**Table `lecture_sessions`**

| id | session_identifier | scheduled_date | duration_minutes | topic | status |
|---|---|---|---|---|---|
| 1000 | SES-2443 | 2024-11-27 | 35 | distributed-topic-60 | scheduled |
| 1001 | SES-2449 | 2025-04-11 | 38 | baseline-topic-61 | in_progress |
| 1002 | SES-2455 | 2022-09-22 | 41 | pilot-topic-62 | completed |
| 1003 | SES-2461 | 2023-02-06 | 44 | extended-topic-63 | cancelled |

The session codes follow a consistent pattern such as SES-2443, SES-2449, and so on, providing a stable reference across all downstream artifacts. Sessions are assigned to topics like distributed-topic-60, baseline-topic-61, pilot-topic-62, and extended-topic-63, which serve as thematic anchors for associated notes and examples. The status field distinguishes between four states: scheduled, in_progress, completed, and cancelled. A session such as SES-2443 on 2024-11-27 with a 35-minute duration remains in the scheduled state, while SES-2449 on 2025-04-11 with a 38-minute duration has progressed to in_progress. The session SES-2455 dated 2022-09-22 with a 41-minute duration is marked completed, and SES-2461 on 2023-02-06 with a 44-minute duration carries the cancelled status. Duration values range from 35 to 44 minutes, reflecting the variability in session length across the curriculum.

## Lecture Notes and Documentation

Lecture notes constitute the documented output of instructional sessions. Each note is identified by a unique internal ID, a note identifier, a title, a version number, a page count, a last-modified timestamp, a file format, and foreign keys linking it to its parent session and to a computational example.

**Table `lecture_notes`**

| id | note_id | title | version_number | page_count | last_modified | format | lecture_session_id | computational_example_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | account_pymes_100 | Compact Initiative | 16 | 6 | 2022-05-05T04:36:00 | pdf | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5917294 | Legacy Model | 27 | 7 | 2023-10-16T11:53:00 | docx | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9568439 | Regional Cluster A | 38 | 0 | 2024-03-27T18:10:00 | markdown | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 168556 | Seasonal Review | 49 | 15 | 2025-08-11T01:27:00 | pdf | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Notes are authored in multiple formats: pdf, docx, and markdown. The note Compact Initiative (note_id account_pymes_100) is a 6-page PDF at version 16, last modified on 2022-05-05, and is linked to session 1000 and computational example 100. The note Legacy Model (note_id 5917294) is a 7-page DOCX at version 27, last modified on 2023-10-16, associated with session 1001 and example 101. Regional Cluster A (note_id 9568439) is a 0-page Markdown document at version 38, last modified on 2024-03-27, tied to session 1002 and example 102. Seasonal Review (note_id 168556) is a 15-page PDF at version 49, last modified on 2025-08-11, connected to session 1003 and example 103. The version numbers range from 16 to 49, and the page counts span from 0 to 15, indicating that some notes are still in draft or template form. Each note also carries creation and update timestamps that track its editorial history.

## Computational Examples and Artifacts

Computational examples are executable or reference artifacts that illustrate the mathematical concepts discussed in lectures. Each example has an internal ID, an example identifier, a title, a file format, a file size in bytes, a creation date, an author, a license, and a foreign key to the digital repository that hosts it.

**Table `computational_examples`**

| id | example_id | title | file_format | file_size_bytes | creation_date | author | license | digital_repository_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 10445646 | Compact Initiative | nb | 32 | 2022-01-13 | Norma Fisher | baseline-license-43 | 1 |
| 101 | 5844277 | Legacy Model | m | 38 | 2023-06-24 | Daniel Abbott | pilot-license-44 | 2 |
| 102 | 1250207 | Regional Cluster A | cdf | 44 | 2024-11-08 | Chris Bennett | extended-license-45 | 3 |
| 103 | 4627 | Seasonal Review | nb | 50 | 2025-04-19 | Ernest Hemingway | integrated-license-46 | 4 |

The examples share titles with their associated lecture notes, creating a clear thematic pairing: Compact Initiative, Legacy Model, Regional Cluster A, and Seasonal Review. File formats include nb (notebook), m (MATLAB or similar), and cdf (computable document format). File sizes are compact, ranging from 32 to 50 bytes, suggesting these are lightweight reference artifacts rather than large datasets. Authors include Norma Fisher, Daniel Abbott, Chris Bennett, and Ernest Hemingway. Licenses follow a naming convention such as baseline-license-43, pilot-license-44, extended-license-45, and integrated-license-46, providing a structured governance model for artifact reuse. Each example is stored in a digital repository identified by the foreign key, linking the artifact to its physical or virtual storage location.

## Mathematical Concepts and Prerequisites

Mathematical concepts form the theoretical backbone of the curriculum. Each concept carries a concept ID, a name, a category, a complexity level, a prerequisite concept label, and foreign keys to the computational example and lecture session that illustrate or teach it.

**Table `mathematical_concepts`**

| concept_id | name | category | complexity_level | prerequisite_concepts | computational_example_id | lecture_session_id |
|---|---|---|---|---|---|---|
| 884350 | Extended Review | calculus | 37 | distributed-prerequi-72 | 100 | 1000 |
| 392497 | Pilot Initiative A | differential_equations | 45 | baseline-prerequi-73 | 101 | 1001 |
| 2106713 | Baseline Model | linear_algebra | 53 | pilot-prerequi-74 | 102 | 1002 |
| 4463648 | Distributed Cluster | numerical_methods | 61 | extended-prerequi-75 | 103 | 1003 |

Concepts span diverse mathematical domains: calculus, differential_equations, linear_algebra, and numerical_methods. The complexity levels range from 37 to 61, providing a quantitative measure of conceptual difficulty. Extended Review belongs to calculus at complexity level 37, with prerequisite distributed-prerequi-72, and is illustrated by example 100 in session 1000. Pilot Initiative A falls under differential_equations at complexity level 45, with prerequisite baseline-prerequi-73, and is illustrated by example 101 in session 1001. Baseline Model is a linear_algebra concept at complexity level 53, with prerequisite pilot-prerequi-74, illustrated by example 102 in session 1002. Distributed Cluster is a numerical_methods concept at complexity level 61, with prerequisite extended-prerequi-75, illustrated by example 103 in session 1003. The prerequisite labels follow a consistent naming pattern, enabling the construction of dependency chains across the curriculum.

## Digital Repositories and Storage

Digital repositories are the storage infrastructure that hosts computational examples and lecture notes. Each repository has an internal ID, a repository identifier, a name, a storage path, a total capacity in gigabytes, a last-backup timestamp, and an access level.

**Table `digital_repositories`**

| id | repository_id | name | storage_path | total_capacity_g_b | last_backup | access_level |
|---|---|---|---|---|---|---|
| 1 | 611503 | Extended Review | compact-storage-32 | 13.70 | 2022-09-14T08:48:00 | public |
| 2 | 2106692 | Pilot Initiative A | composite-storage-33 | 16.40 | 2023-02-25T15:05:00 | restricted |
| 3 | 884340 | Baseline Model | primary-storage-34 | 19.10 | 2024-07-09T22:22:00 | private |
| 4 | 884350 | Distributed Cluster | adaptive-storage-35 | 21.80 | 2025-12-20T05:39:00 | public |

Repository names mirror the mathematical concept names, creating a semantic alignment: Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster. Storage paths follow a structured naming convention such as compact-storage-32, composite-storage-33, primary-storage-34, and adaptive-storage-35. Capacities range from 13.70 GB to 21.80 GB, with the adaptive-storage-35 repository offering the largest capacity. Access levels are categorized as public, restricted, or private, providing a governance mechanism for content distribution. The last-backup timestamps span from 2022-09-14 to 2025-12-20, reflecting the ongoing maintenance of the storage infrastructure.

## Cross-Referencing Sessions and Notes

The sessions_notes table resolves the many-to-many relationship between lecture sessions and lecture notes. A single session may have multiple associated notes, and a note may be referenced by multiple sessions.

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

The association pattern reveals a structured progression: session 1000 is linked to notes 1 and 2, session 1001 to notes 2 and 3, session 1002 to notes 3 and 4, and session 1003 to notes 4 and 1. This creates a cyclic dependency where each note participates in two sessions, and each session references two notes. Note 1 (Compact Initiative) appears in sessions 1000 and 1003, note 2 (Legacy Model) in sessions 1000 and 1001, note 3 (Regional Cluster A) in sessions 1001 and 1002, and note 4 (Seasonal Review) in sessions 1002 and 1003. This overlapping structure supports iterative review and cross-referencing across the curriculum.

## Linking Examples to Sessions

The sessions_examples table establishes the relationship between lecture sessions and computational examples. Like sessions_notes, this is a many-to-many association table.

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

The association pattern mirrors that of sessions_notes: session 1000 links to examples 100 and 101, session 1001 to examples 101 and 102, session 1002 to examples 102 and 103, and session 1003 to examples 103 and 100. Each example participates in exactly two sessions, creating a ring structure that ensures every computational artifact is reviewed in multiple instructional contexts. Example 100 (Compact Initiative) appears in sessions 1000 and 1003, example 101 (Legacy Model) in sessions 1000 and 1001, example 102 (Regional Cluster A) in sessions 1001 and 1002, and example 103 (Seasonal Review) in sessions 1002 and 1003.

## Associating Examples with Concepts

The examples_concepts table connects computational examples to mathematical concepts, enabling the mapping of theoretical content to practical demonstrations.

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

Each computational example is associated with exactly one mathematical concept, forming a direct one-to-one mapping: example 100 maps to concept 884350 (Extended Review), example 101 to concept 392497 (Pilot Initiative A), example 102 to concept 2106713 (Baseline Model), and example 103 to concept 4463648 (Distributed Cluster). This clean mapping ensures that every executable artifact has a clear theoretical grounding, and every mathematical concept has at least one practical illustration.

## Connecting Repositories to Examples

The repositories_examples table links digital repositories to computational examples, specifying which repository hosts which artifact.

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

The association is straightforward: repository 1 hosts example 100, repository 2 hosts example 101, repository 3 hosts example 102, and repository 4 hosts example 103. Each repository stores exactly one example, and each example is stored in exactly one repository. This one-to-one mapping simplifies artifact retrieval and backup management.

## Connecting Repositories to Notes

The repositories_notes table establishes the relationship between digital repositories and lecture notes, specifying which repository stores which note.

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

The mapping follows the same one-to-one pattern: repository 1 stores note 1, repository 2 stores note 2, repository 3 stores note 3, and repository 4 stores note 4. This alignment ensures that all artifacts related to a given topic — the session, the note, the example, and the concept — are co-located within the same repository, simplifying access control and backup operations.

## Session-to-Note Detail View

The view v_lecture_session_lecture_note_detail joins lecture sessions with their associated notes, providing a comprehensive record of which notes belong to which sessions.

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

This view answers the question: "What documentation was produced for each lecture session?" Reading the row for session SES-2443 (id 1000), the view reveals that two notes are associated: Compact Initiative (note_id account_pymes_100, 6 pages, PDF format) and Legacy Model (note_id 5917294, 7 pages, DOCX format). For session SES-2449 (id 1001), the view shows Legacy Model and Regional Cluster A (note_id 9568439, 0 pages, Markdown format). This view is essential for curriculum auditors who need to verify that each session has adequate documentation coverage.

## Session-to-Example Detail View

The view v_lecture_session_computational_example_detail joins lecture sessions with their associated computational examples, revealing the practical artifacts tied to each instructional event.

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

This view answers: "Which computational examples were demonstrated during each session?" For session SES-2443 (id 1000), the view shows Compact Initiative (example_id 10445646, notebook format, authored by Norma Fisher, baseline-license-43) and Legacy Model (example_id 5844277, MATLAB format, authored by Daniel Abbott, pilot-license-44). For session SES-2455 (id 1002), the view displays Regional Cluster A (example_id 1250207, CDF format, authored by Chris Bennett, extended-license-45) and Seasonal Review (example_id 4627, notebook format, authored by Ernest Hemingway, integrated-license-46). This view supports instructors preparing for upcoming sessions by surfacing the examples they need to review.

## Note-to-Session View

The view v_lecture_note_lecture_session joins lecture notes with their parent sessions, providing a reverse lookup from documentation back to the instructional event.

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

This view answers: "Which lecture session produced this note?" Reading the row for note Compact Initiative (note_id account_pymes_100), the view identifies session SES-2443 (id 1000), scheduled on 2024-11-27, with topic distributed-topic-60 and status scheduled. For note Seasonal Review (note_id 168556), the view identifies session SES-2461 (id 1003), scheduled on 2023-02-06, with topic extended-topic-63 and status cancelled. This view is particularly useful for content managers who need to trace the origin of a note and assess whether the parent session was ultimately delivered.

## Note-to-Example View

The view v_lecture_note_computational_example joins lecture notes with their associated computational examples, revealing the practical artifact that complements each note.

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

This view answers: "Which computational example accompanies this lecture note?" For note Compact Initiative (note_id account_pymes_100), the view shows example Compact Initiative (example_id 10445646, notebook format, 32 bytes, authored by Norma Fisher). For note Regional Cluster A (note_id 9568439), the view shows example Regional Cluster A (example_id 1250207, CDF format, 44 bytes, authored by Chris Bennett). The consistent naming between notes and examples reinforces the thematic pairing and makes it easy for practitioners to locate the executable counterpart to any given document.

## Example-to-Concept Detail View

The view v_computational_example_mathematical_concept_detail joins computational examples with their underlying mathematical concepts, providing a theoretical grounding for each artifact.

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

This view answers: "What mathematical concept does this computational example illustrate?" For example Compact Initiative (example_id 10445646), the view reveals concept Extended Review (concept_id 884350), categorized as calculus with complexity level 37 and prerequisite distributed-prerequi-72. For example Seasonal Review (example_id 4627), the view reveals concept Distributed Cluster (concept_id 4463648), categorized as numerical_methods with complexity level 61 and prerequisite extended-prerequi-75. This view is essential for curriculum designers who need to verify that examples are appropriately matched to the complexity levels of the concepts they illustrate.

## Example-to-Repository View

The view v_computational_example_digital_repository joins computational examples with their hosting digital repositories, providing storage and access information for each artifact.

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

This view answers: "Where is this computational example stored, and who can access it?" For example Compact Initiative (example_id 10445646), the view shows repository Extended Review (repository_id 611503), stored at compact-storage-32 with 13.70 GB capacity, last backed up on 2022-09-14, with public access. For example Legacy Model (example_id 5844277), the view shows repository Pilot Initiative A (repository_id 2106692), stored at composite-storage-33 with 16.40 GB capacity, last backed up on 2023-02-25, with restricted access. This view supports storage administrators in monitoring repository utilization and access governance.

## Concept-to-Example View

The view v_mathematical_concept_computational_example joins mathematical concepts with their illustrating computational examples, providing a forward lookup from theory to practice.

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

This view answers: "Which computational example demonstrates this mathematical concept?" For concept Extended Review (concept_id 884350, calculus, complexity 37), the view shows example Compact Initiative (example_id 10445646, notebook format, authored by Norma Fisher). For concept Distributed Cluster (concept_id 4463648, numerical_methods, complexity 61), the view shows example Seasonal Review (example_id 4627, notebook format, authored by Ernest Hemingway). This view is valuable for instructors selecting examples that match the theoretical depth of their current lesson.

## Concept-to-Session View

The view v_mathematical_concept_lecture_session joins mathematical concepts with the lecture sessions that teach them, providing a curriculum map from theory to instructional event.

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

This view answers: "Which lecture session covers this mathematical concept?" For concept Extended Review (concept_id 884350, calculus, complexity 37), the view shows session SES-2443 (id 1000), scheduled on 2024-11-27, with topic distributed-topic-60 and status scheduled. For concept Baseline Model (concept_id 2106713, linear_algebra, complexity 53), the view shows session SES-2455 (id 1002), scheduled on 2022-09-22, with topic pilot-topic-62 and status completed. This view enables curriculum planners to verify that each mathematical concept is adequately covered in the instructional schedule.

## Repository-to-Example Detail View

The view v_digital_repository_computational_example_detail joins digital repositories with their hosted computational examples, providing a comprehensive inventory of repository contents.

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

This view answers: "What computational examples are stored in this repository, and what are their characteristics?" For repository Extended Review (repository_id 611503, public access, 13.70 GB), the view shows example Compact Initiative (example_id 10445646, notebook format, 32 bytes, authored by Norma Fisher, baseline-license-43). For repository Baseline Model (repository_id 884340, private access, 19.10 GB), the view shows example Regional Cluster A (example_id 1250207, CDF format, 44 bytes, authored by Chris Bennett, extended-license-45). This view is essential for storage administrators auditing repository contents and for compliance officers verifying license compliance.

## Repository-to-Note Detail View

The view v_digital_repository_lecture_note_detail joins digital repositories with their hosted lecture notes, providing a complete inventory of stored documentation.

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

This view answers: "What lecture notes are stored in this repository, and what are their properties?" For repository Extended Review (repository_id 611503, public access, 13.70 GB), the view shows note Compact Initiative (note_id account_pymes_100, 6 pages, PDF format, version 16, last modified 2022-05-05). For repository Baseline Model (repository_id 884340, private access, 19.10 GB), the view shows note Regional Cluster A (note_id 9568439, 0 pages, Markdown format, version 38, last modified 2024-03-27). This view supports content governance by providing a clear picture of which notes reside in which repositories and their current version states.

## Synthesis

The domain of academic knowledge management is built upon five core entities — lecture sessions, lecture notes, computational examples, mathematical concepts, and digital repositories — interconnected through a network of foreign keys and cross-reference tables. The base tables capture the essential attributes of each entity, from session scheduling and note versioning to example licensing and repository access controls. The cross-reference tables (sessions_notes, sessions_examples, examples_concepts, repositories_examples, repositories_notes) resolve many-to-many relationships and establish the structural integrity of the knowledge graph. The materialized views provide practitioners with purpose-built lenses for querying the data: session-to-note and session-to-example views support instructional planning, note-to-session and note-to-example views support content tracing, example-to-concept and concept-to-example views support curriculum alignment, and repository-to-example and repository-to-note views support storage governance. Together, these tables and views form a coherent, queryable representation of the instructional ecosystem, enabling organizations to manage their academic content with precision and transparency.