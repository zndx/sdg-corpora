## Ontology-Grounded Relational Modelling of the Shell-Reading Domain

The domain under examination captures a clinical-educational workflow in which shell readings—structured interpretive sessions—are linked to psychological concepts, student analyses, and training activities. Each reading represents a discrete event anchored to a client or organization, a timestamp, and a thematic label; shells encode the symbolic artefacts invoked during those readings; student interpretations record the analytical responses of trainees; psychological concepts provide the diagnostic taxonomy; and training sessions document the instructional context. The relational schema materialises this ontology through a set of base tables, junction tables that enforce many-to-many cardinalities, and a suite of materialised views that reconstruct domain facts for reporting. The following sections walk through the entity types, their attributes, the foreign-key topology, and the view-level joins that answer concrete analytical questions.

**Table `ShellReading`**

| id | readingId | clientName | sessionDate | primaryTheme | emotionalValence | interpretationConfidence |
|---|---|---|---|---|---|---|
| 1 | 8881 | Mercy Helpline | 2022-09-11T20:24:00 | compact-primary-92 | neutral | 20.70 |
| 2 | 325439 | Tasha Rodriguez | 2023-02-22T03:41:00 | composite-primary-93 | positive | 24.40 |
| 3 | 6926364 | Glen Taylor | 2024-07-06T10:58:00 | primary-primary-94 | negative | 28.10 |
| 4 | 4985166 | Nicole Andrews | 2025-12-17T17:15:00 | adaptive-primary-95 | traumatic | 31.80 |

The `ShellReading` table is the event core of the domain. Each row captures a single reading session identified by the surrogate key `id` and the business key `readingId`. The column `clientName` stores the name of the organisation or individual associated with the reading—for example, `Mercy Helpline` in row 1 and `Nicole Andrews` in row 4. The `sessionDate` column records the ISO-8601 timestamp of the session, such as `2022-09-11T20:24:00` for the first reading. The `primaryTheme` column carries a thematic code like `compact-primary-92` or `adaptive-primary-95`, while `emotionalValence` classifies the affective tone as `neutral`, `positive`, `negative`, or `traumatic`. Finally, `interpretationConfidence` holds a numeric score—ranging from `20.70` to `31.80` across the sample—that quantifies the analyst's certainty in the reading's interpretation. This table is the primary anchor: every other base table references it through a `readingId` foreign key, ensuring that shells, student interpretations, and training sessions are always traceable to a concrete event.

**Table `Shell`**

| id | shellId | catalogNumber | commonName | symbolicMeaning | speciesType | readingId | conceptId |
|---|---|---|---|---|---|---|---|
| 100 | 1250195 | 13 | Seasonal Review | distributed-symbolic-84 | Textile Cone | 1 | 1 |
| 101 | 5917277 | 16 | Integrated Initiative | baseline-symbolic-85 | Tadpole Triton | 2 | 2 |
| 102 | 4277009 | 19 | Extended Model D | pilot-symbolic-86 | Inner Child | 3 | 3 |
| 103 | 3001009030110 | 22 | Pilot Cluster | extended-symbolic-87 | Unknown | 4 | 4 |

The `Shell` table models the symbolic artefacts deployed during readings. Its surrogate key `id` (e.g., `100`, `101`) is distinct from the business identifier `shellId` (e.g., `1250195`, `5917277`). The `catalogNumber` column provides a numeric catalogue reference, while `commonName` stores a human-readable label such as `Seasonal Review` or `Pilot Cluster`. The `symbolicMeaning` column carries a coded meaning like `distributed-symbolic-84`, and `speciesType` classifies the shell type—`Textile Cone`, `Tadpole Triton`, `Inner Child`, or `Unknown`. Crucially, `Shell` carries two foreign keys: `readingId` links the shell to the session in which it was invoked, and `conceptId` links it to a psychological concept. In the sample data, shell `100` (catalogue number `13`, common name `Seasonal Review`) is associated with reading `1` and concept `1`, establishing the first cross-entity relationship in the model.

**Table `StudentInterpretation`**

| interpretationId | studentName | interpretationText | certaintyLevel | recordedDate | isJournalEntry | readingId | conceptId |
|---|---|---|---|---|---|---|---|
| 4985159 | Distributed Standard | composite-interpre-39 | definitive | 2022-09-10T20:24:00 | true | 1 | 1 |
| gd_acc_260002 | Adaptive Framework D | primary-interpre-40 | questioning | 2023-02-21T03:41:00 | false | 2 | 2 |
| e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 | alternative | 2024-07-05T10:58:00 | true | 3 | 3 |
| Penjualan | Composite Programme | distributed-interpre-42 | uncertain | 2025-12-16T17:15:00 | false | 4 | 4 |

Student interpretations are captured in `StudentInterpretation`, which records the analytical responses produced by trainees. The primary key `interpretationId` is a string identifier—`4985159` for the first row, `gd_acc_260002` for the second, and a UUID `e359b6fe-8fd1-11eb-924d-9cd76263cbd0` for the third. The `studentName` column stores the analyst's name, such as `Distributed Standard` or `Penjualan`. The `interpretationText` column holds the coded interpretation label (e.g., `composite-interpre-39`), while `certaintyLevel` classifies the student's confidence as `definitive`, `questioning`, `alternative`, or `uncertain`. The `recordedDate` column timestamps the entry, and `isJournalEntry` is a boolean flag indicating whether the interpretation was recorded as a journal entry. Like `Shell`, this table carries two foreign keys—`readingId` and `conceptId`—that tie each interpretation to a specific session and a specific psychological concept.

**Table `PsychologicalConcept`**

| id | conceptId | conceptName | category | severityLevel | shellId | interpretationId |
|---|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | Childhood Trauma | mild | 100 | 4985159 |
| 2 | 392497 | Baseline Review | Transformation | moderate | 101 | gd_acc_260002 |
| 3 | 2106713 | Distributed Initiative A | Loss | severe | 102 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 |
| 4 | 4463648 | Adaptive Model | Inner Child | critical | 103 | Penjualan |

The `PsychologicalConcept` table provides the diagnostic taxonomy. Its surrogate key `id` (1–4) is distinct from the business key `conceptId` (e.g., `884350`, `392497`). The `conceptName` column stores the human-readable concept label—`Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, `Adaptive Model`—while `category` assigns a thematic classification. The `severityLevel` column encodes clinical severity as `mild`, `moderate`, `severe`, or `critical`. Two foreign keys, `shellId` and `interpretationId`, link each concept to a specific shell and a specific student interpretation, forming a bridge between the symbolic artefact and the analytical response. For instance, concept `1` (conceptId `884350`, name `Pilot Cluster`, category `Childhood Trauma`, severity `mild`) is linked to shell `100` and interpretation `4985159`.

**Table `TrainingSession`**

| sessionId | sessionTitle | durationMinutes | classLevel | instructorName | sessionStatus | readingId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Review | 35 | Class 1 | Legacy Cluster D | scheduled | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Integrated Initiative | 38 | Class 2 | Regional Review | completed | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Extended Model D | 41 | Level II | Seasonal Initiative | archived | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Pilot Cluster | 44 | Class 1 | Integrated Model A | scheduled | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Training sessions document the instructional context in which readings are studied. The surrogate key `sessionId` (1–4) is distinct from the business-relevant `sessionTitle` (e.g., `Seasonal Review`, `Integrated Initiative`). The `durationMinutes` column records the session length—`35`, `38`, `41`, `44` minutes—while `classLevel` indicates the instructional tier (`Class 1`, `Class 2`, `Level II`). The `instructorName` column stores the instructor identifier, such as `Legacy Cluster D` or `Integrated Model A`, and `sessionStatus` tracks the lifecycle state as `scheduled`, `completed`, or `archived`. The `readingId` foreign key ties each session to a reading, and `createdAt` / `updatedAt` columns record the audit timestamps. In the sample, session `1` (title `Seasonal Review`, duration `35` minutes, status `scheduled`) is linked to reading `1`.

The many-to-many relationships between readings and shells, readings and interpretations, and sessions and interpretations are materialised through three junction tables.

**Table `ShellReadingShell`**

| readingId | shellId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `ShellReadingShell` junction table resolves the many-to-many relationship between `ShellReading` and `Shell`. Each row pairs a `readingId` with a `shellId`, allowing a single reading to be associated with multiple shells and vice versa. In the sample data, reading `1` is linked to shells `100` and `101`; reading `2` to shells `101` and `102`; reading `3` to shells `102` and `103`; and reading `4` to shells `103` and `100`. This creates a cyclic dependency pattern where shells `100` and `103` each appear in two readings, demonstrating that the model supports overlapping symbolic deployments across sessions.

**Table `ShellReadingStudentInterpretation`**

| readingId | interpretationId |
|---|---|
| 1 | 4985159 |
| 1 | gd_acc_260002 |
| 2 | gd_acc_260002 |
| 2 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 |
| 3 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 |
| 3 | Penjualan |
| 4 | Penjualan |
| 4 | 4985159 |

The `ShellReadingStudentInterpretation` junction table resolves the many-to-many relationship between `ShellReading` and `StudentInterpretation`. Each row pairs a `readingId` with an `interpretationId`, enabling multiple student interpretations per reading and multiple readings per interpretation. This structure supports the pedagogical scenario in which a single reading is analysed by multiple students and a student's interpretive framework is applied across multiple readings.

**Table `TrainingSessionStudentInterpretation`**

| sessionId | interpretationId |
|---|---|
| 1 | 4985159 |
| 1 | gd_acc_260002 |
| 2 | gd_acc_260002 |
| 2 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 |
| 3 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 |
| 3 | Penjualan |
| 4 | Penjualan |
| 4 | 4985159 |

The `TrainingSessionStudentInterpretation` junction table resolves the many-to-many relationship between `TrainingSession` and `StudentInterpretation`. Each row pairs a `sessionId` with an `interpretationId`, allowing a training session to encompass multiple student interpretations and a student's interpretation to be discussed across multiple sessions. This junction is the key to reconstructing the instructional narrative: it answers which student analyses were examined in which training contexts.

The following views materialise the most common analytical queries by joining the normalised tables back into denormalised, fact-level result sets.

**View `v_shell_reading_shell_detail`**

```sql
CREATE VIEW v_shell_reading_shell_detail AS
SELECT a.id, a.readingId, a.clientName, b.id AS shell_id, b.shellId AS shell_shellId, b.catalogNumber AS shell_catalogNumber
FROM ShellReading a
  JOIN ShellReadingShell j ON j.readingId = a.id
  JOIN Shell b ON b.id = j.shellId;
```

| id | readingId | clientName | shell_id | shell_shellId | shell_catalogNumber |
|---|---|---|---|---|---|
| 1 | 8881 | Mercy Helpline | 100 | 1250195 | 13 |
| 1 | 8881 | Mercy Helpline | 101 | 5917277 | 16 |
| 2 | 325439 | Tasha Rodriguez | 101 | 5917277 | 16 |
| 2 | 325439 | Tasha Rodriguez | 102 | 4277009 | 19 |
| 3 | 6926364 | Glen Taylor | 102 | 4277009 | 19 |
| 3 | 6926364 | Glen Taylor | 103 | 3001009030110 | 22 |
| 4 | 4985166 | Nicole Andrews | 103 | 3001009030110 | 22 |
| 4 | 4985166 | Nicole Andrews | 100 | 1250195 | 13 |

This view joins `ShellReading` with `ShellReadingShell` and `Shell` to produce a detail-level record for every shell deployed in every reading. The result answers the question: "Which shells were used in which readings, and what are their symbolic properties?" Each row contains the reading's `clientName`, `sessionDate`, and `emotionalValence` alongside the shell's `commonName`, `speciesType`, and `symbolicMeaning`. For reading `1` (client `Mercy Helpline`, date `2022-09-11T20:24:00`, valence `neutral`), the view produces two rows: one for shell `100` (common name `Seasonal Review`, species `Textile Cone`) and one for shell `101` (common name `Integrated Initiative`, species `Tadpole Triton`). This view is the primary diagnostic tool for correlating emotional valence with symbolic deployment patterns.

**View `v_shell_reading_student_interpretation_detail`**

```sql
CREATE VIEW v_shell_reading_student_interpretation_detail AS
SELECT a.id, a.readingId, a.clientName, b.interpretationId AS interpretation_interpretationId, b.studentName AS interpretation_studentName, b.interpretationText AS interpretation_interpretationText
FROM ShellReading a
  JOIN ShellReadingStudentInterpretation j ON j.readingId = a.id
  JOIN StudentInterpretation b ON b.interpretationId = j.interpretationId;
```

| id | readingId | clientName | interpretation_interpretationId | interpretation_studentName | interpretation_interpretationText |
|---|---|---|---|---|---|
| 1 | 8881 | Mercy Helpline | 4985159 | Distributed Standard | composite-interpre-39 |
| 1 | 8881 | Mercy Helpline | gd_acc_260002 | Adaptive Framework D | primary-interpre-40 |
| 2 | 325439 | Tasha Rodriguez | gd_acc_260002 | Adaptive Framework D | primary-interpre-40 |
| 2 | 325439 | Tasha Rodriguez | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 |
| 3 | 6926364 | Glen Taylor | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 |
| 3 | 6926364 | Glen Taylor | Penjualan | Composite Programme | distributed-interpre-42 |
| 4 | 4985166 | Nicole Andrews | Penjualan | Composite Programme | distributed-interpre-42 |
| 4 | 4985166 | Nicole Andrews | 4985159 | Distributed Standard | composite-interpre-39 |

This view joins `ShellReading` with `ShellReadingStudentInterpretation` and `StudentInterpretation` to produce a detail-level record for every student interpretation applied to every reading. The result answers: "Which students interpreted which readings, and with what certainty?" Each row contains the reading's `clientName` and `primaryTheme` alongside the student's `studentName`, `interpretationText`, and `certaintyLevel`. For reading `1` (client `Mercy Helpline`, theme `compact-primary-92`), the view surfaces the interpretation by student `Distributed Standard` (text `composite-interpre-39`, certainty `definitive`). This view supports pedagogical analysis of student performance and confidence calibration.

**View `v_shell_shell_reading`**

```sql
CREATE VIEW v_shell_shell_reading AS
SELECT a.id, a.shellId, a.catalogNumber, a.commonName, b.id AS reading_id, b.readingId AS reading_readingId, b.clientName AS reading_clientName
FROM Shell a JOIN ShellReading b ON a.readingId = b.id;
```

| id | shellId | catalogNumber | commonName | reading_id | reading_readingId | reading_clientName |
|---|---|---|---|---|---|---|
| 100 | 1250195 | 13 | Seasonal Review | 1 | 8881 | Mercy Helpline |
| 101 | 5917277 | 16 | Integrated Initiative | 2 | 325439 | Tasha Rodriguez |
| 102 | 4277009 | 19 | Extended Model D | 3 | 6926364 | Glen Taylor |
| 103 | 3001009030110 | 22 | Pilot Cluster | 4 | 4985166 | Nicole Andrews |

This view joins `Shell` with `ShellReadingShell` and `ShellReading` to produce a reading-centric view of shells. The result answers: "For each shell, which readings invoked it, and what were the reading characteristics?" Each row contains the shell's `commonName` and `speciesType` alongside the reading's `clientName`, `sessionDate`, and `emotionalValence`. For shell `100` (common name `Seasonal Review`, species `Textile Cone`), the view produces two rows: one for reading `1` (client `Mercy Helpline`, valence `neutral`) and one for reading `4` (client `Nicole Andrews`, valence `traumatic`). This view is useful for tracking how a single symbolic artefact is re-deployed across sessions with different emotional contexts.

**View `v_shell_psychological_concept`**

```sql
CREATE VIEW v_shell_psychological_concept AS
SELECT a.id, a.shellId, a.catalogNumber, a.commonName, b.id AS concept_id, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName
FROM Shell a JOIN PsychologicalConcept b ON a.conceptId = b.id;
```

| id | shellId | catalogNumber | commonName | concept_id | concept_conceptId | concept_conceptName |
|---|---|---|---|---|---|---|
| 100 | 1250195 | 13 | Seasonal Review | 1 | 884350 | Pilot Cluster |
| 101 | 5917277 | 16 | Integrated Initiative | 2 | 392497 | Baseline Review |
| 102 | 4277009 | 19 | Extended Model D | 3 | 2106713 | Distributed Initiative A |
| 103 | 3001009030110 | 22 | Pilot Cluster | 4 | 4463648 | Adaptive Model |

This view joins `Shell` with `PsychologicalConcept` on `shellId` to produce a concept-centric view of shells. The result answers: "Which psychological concepts are associated with which shells, and what are their severity profiles?" Each row contains the shell's `commonName` and `symbolicMeaning` alongside the concept's `conceptName`, `category`, and `severityLevel`. For shell `100` (common name `Seasonal Review`, symbolic meaning `distributed-symbolic-84`), the view surfaces concept `1` (name `Pilot Cluster`, category `Childhood Trauma`, severity `mild`). This view supports the clinical analysis of symbolic artefacts in relation to diagnostic categories.

**View `v_student_interpretation_shell_reading`**

```sql
CREATE VIEW v_student_interpretation_shell_reading AS
SELECT a.interpretationId, a.studentName, a.interpretationText, a.certaintyLevel, b.id AS reading_id, b.readingId AS reading_readingId, b.clientName AS reading_clientName
FROM StudentInterpretation a JOIN ShellReading b ON a.readingId = b.id;
```

| interpretationId | studentName | interpretationText | certaintyLevel | reading_id | reading_readingId | reading_clientName |
|---|---|---|---|---|---|---|
| 4985159 | Distributed Standard | composite-interpre-39 | definitive | 1 | 8881 | Mercy Helpline |
| gd_acc_260002 | Adaptive Framework D | primary-interpre-40 | questioning | 2 | 325439 | Tasha Rodriguez |
| e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 | alternative | 3 | 6926364 | Glen Taylor |
| Penjualan | Composite Programme | distributed-interpre-42 | uncertain | 4 | 4985166 | Nicole Andrews |

This view joins `StudentInterpretation` with `ShellReadingStudentInterpretation` and `ShellReading` to produce a reading-centric view of student interpretations. The result answers: "For each student interpretation, which reading was it applied to, and what were the reading characteristics?" Each row contains the student's `studentName` and `certaintyLevel` alongside the reading's `clientName`, `sessionDate`, and `emotionalValence`. For student `Distributed Standard` (certainty `definitive`), the view surfaces reading `1` (client `Mercy Helpline`, date `2022-09-11T20:24:00`, valence `neutral`). This view supports the analysis of student interpretive patterns across different reading contexts.

**View `v_student_interpretation_psychological_concept`**

```sql
CREATE VIEW v_student_interpretation_psychological_concept AS
SELECT a.interpretationId, a.studentName, a.interpretationText, a.certaintyLevel, b.id AS concept_id, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName
FROM StudentInterpretation a JOIN PsychologicalConcept b ON a.conceptId = b.id;
```

| interpretationId | studentName | interpretationText | certaintyLevel | concept_id | concept_conceptId | concept_conceptName |
|---|---|---|---|---|---|---|
| 4985159 | Distributed Standard | composite-interpre-39 | definitive | 1 | 884350 | Pilot Cluster |
| gd_acc_260002 | Adaptive Framework D | primary-interpre-40 | questioning | 2 | 392497 | Baseline Review |
| e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 | alternative | 3 | 2106713 | Distributed Initiative A |
| Penjualan | Composite Programme | distributed-interpre-42 | uncertain | 4 | 4463648 | Adaptive Model |

This view joins `StudentInterpretation` with `PsychologicalConcept` on `interpretationId` to produce a concept-centric view of student interpretations. The result answers: "Which psychological concepts are associated with which student interpretations, and what are the severity profiles?" Each row contains the student's `studentName` and `interpretationText` alongside the concept's `conceptName`, `category`, and `severityLevel`. For student `Distributed Standard` (interpretation text `composite-interpre-39`), the view surfaces concept `1` (name `Pilot Cluster`, category `Childhood Trauma`, severity `mild`). This view supports the pedagogical analysis of how student interpretations map onto clinical concepts.

**View `v_psychological_concept_shell`**

```sql
CREATE VIEW v_psychological_concept_shell AS
SELECT a.id, a.conceptId, a.conceptName, a.category, b.id AS shell_id, b.shellId AS shell_shellId, b.catalogNumber AS shell_catalogNumber
FROM PsychologicalConcept a JOIN Shell b ON a.shellId = b.id;
```

| id | conceptId | conceptName | category | shell_id | shell_shellId | shell_catalogNumber |
|---|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | Childhood Trauma | 100 | 1250195 | 13 |
| 2 | 392497 | Baseline Review | Transformation | 101 | 5917277 | 16 |
| 3 | 2106713 | Distributed Initiative A | Loss | 102 | 4277009 | 19 |
| 4 | 4463648 | Adaptive Model | Inner Child | 103 | 3001009030110 | 22 |

This view joins `PsychologicalConcept` with `Shell` on `shellId` to produce a shell-centric view of psychological concepts. The result answers: "For each psychological concept, which shell is associated with it, and what are the shell's properties?" Each row contains the concept's `conceptName` and `severityLevel` alongside the shell's `commonName`, `speciesType`, and `symbolicMeaning`. For concept `1` (name `Pilot Cluster`, severity `mild`), the view surfaces shell `100` (common name `Seasonal Review`, species `Textile Cone`, symbolic meaning `distributed-symbolic-84`). This view is the inverse of `v_shell_psychological_concept` and supports bidirectional clinical analysis.

**View `v_psychological_concept_student_interpretation`**

```sql
CREATE VIEW v_psychological_concept_student_interpretation AS
SELECT a.id, a.conceptId, a.conceptName, a.category, b.interpretationId AS interpretation_interpretationId, b.studentName AS interpretation_studentName, b.interpretationText AS interpretation_interpretationText
FROM PsychologicalConcept a JOIN StudentInterpretation b ON a.interpretationId = b.interpretationId;
```

| id | conceptId | conceptName | category | interpretation_interpretationId | interpretation_studentName | interpretation_interpretationText |
|---|---|---|---|---|---|---|
| 1 | 884350 | Pilot Cluster | Childhood Trauma | 4985159 | Distributed Standard | composite-interpre-39 |
| 2 | 392497 | Baseline Review | Transformation | gd_acc_260002 | Adaptive Framework D | primary-interpre-40 |
| 3 | 2106713 | Distributed Initiative A | Loss | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 |
| 4 | 4463648 | Adaptive Model | Inner Child | Penjualan | Composite Programme | distributed-interpre-42 |

This view joins `PsychologicalConcept` with `StudentInterpretation` on `interpretationId` to produce an interpretation-centric view of psychological concepts. The result answers: "For each psychological concept, which student interpretation is associated with it, and what are the interpretive characteristics?" Each row contains the concept's `conceptName` and `category` alongside the student's `studentName`, `certaintyLevel`, and `interpretationText`. For concept `1` (name `Pilot Cluster`, category `Childhood Trauma`), the view surfaces student `Distributed Standard` (certainty `definitive`, interpretation text `composite-interpre-39`). This view supports the analysis of how clinical concepts are expressed through student interpretive language.

**View `v_training_session_shell_reading`**

```sql
CREATE VIEW v_training_session_shell_reading AS
SELECT a.sessionId, a.sessionTitle, a.durationMinutes, a.classLevel, b.id AS reading_id, b.readingId AS reading_readingId, b.clientName AS reading_clientName
FROM TrainingSession a JOIN ShellReading b ON a.readingId = b.id;
```

| sessionId | sessionTitle | durationMinutes | classLevel | reading_id | reading_readingId | reading_clientName |
|---|---|---|---|---|---|---|
| 1 | Seasonal Review | 35 | Class 1 | 1 | 8881 | Mercy Helpline |
| 2 | Integrated Initiative | 38 | Class 2 | 2 | 325439 | Tasha Rodriguez |
| 3 | Extended Model D | 41 | Level II | 3 | 6926364 | Glen Taylor |
| 4 | Pilot Cluster | 44 | Class 1 | 4 | 4985166 | Nicole Andrews |

This view joins `TrainingSession` with `ShellReadingShell` and `ShellReading` to produce a reading-centric view of training sessions. The result answers: "Which readings were studied in which training sessions, and what were the session characteristics?" Each row contains the session's `sessionTitle`, `durationMinutes`, and `sessionStatus` alongside the reading's `clientName`, `sessionDate`, and `emotionalValence`. For session `1` (title `Seasonal Review`, duration `35` minutes, status `scheduled`), the view surfaces reading `1` (client `Mercy Helpline`, date `2022-09-11T20:24:00`, valence `neutral`). This view supports the instructional analysis of which readings are prioritised in which training contexts.

**View `v_training_session_student_interpretation_detail`**

```sql
CREATE VIEW v_training_session_student_interpretation_detail AS
SELECT a.sessionId, a.sessionTitle, a.durationMinutes, b.interpretationId AS interpretation_interpretationId, b.studentName AS interpretation_studentName, b.interpretationText AS interpretation_interpretationText
FROM TrainingSession a
  JOIN TrainingSessionStudentInterpretation j ON j.sessionId = a.sessionId
  JOIN StudentInterpretation b ON b.interpretationId = j.interpretationId;
```

| sessionId | sessionTitle | durationMinutes | interpretation_interpretationId | interpretation_studentName | interpretation_interpretationText |
|---|---|---|---|---|---|
| 1 | Seasonal Review | 35 | 4985159 | Distributed Standard | composite-interpre-39 |
| 1 | Seasonal Review | 35 | gd_acc_260002 | Adaptive Framework D | primary-interpre-40 |
| 2 | Integrated Initiative | 38 | gd_acc_260002 | Adaptive Framework D | primary-interpre-40 |
| 2 | Integrated Initiative | 38 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 |
| 3 | Extended Model D | 41 | e359b6fe-8fd1-11eb-924d-9cd76263cbd0 | Primary Protocol | adaptive-interpre-41 |
| 3 | Extended Model D | 41 | Penjualan | Composite Programme | distributed-interpre-42 |
| 4 | Pilot Cluster | 44 | Penjualan | Composite Programme | distributed-interpre-42 |
| 4 | Pilot Cluster | 44 | 4985159 | Distributed Standard | composite-interpre-39 |

This view joins `TrainingSession` with `TrainingSessionStudentInterpretation` and `StudentInterpretation` to produce a detail-level record for every student interpretation discussed in every training session. The result answers: "Which student interpretations were examined in which training sessions, and with what interpretive characteristics?" Each row contains the session's `sessionTitle`, `classLevel`, and `instructorName` alongside the student's `studentName`, `certaintyLevel`, and `interpretationText`. For session `1` (title `Seasonal Review`, class level `Class 1`, instructor `Legacy Cluster D`), the view surfaces the interpretation by student `Distributed Standard` (certainty `definitive`, interpretation text `composite-interpre-39`). This view is the primary tool for reconstructing the instructional narrative and evaluating student performance within training contexts.

The relational schema presented here demonstrates a disciplined normalisation of a clinical-educational ontology. The five base tables capture the core entity types—readings, shells, student interpretations, psychological concepts, and training sessions—each with a clear primary key and a set of descriptive attributes. The three junction tables resolve the many-to-many relationships that arise naturally in this domain: readings share shells, readings attract multiple interpretations, and training sessions encompass multiple interpretations. The ten views materialise the most common analytical queries by joining these normalised tables back into denormalised, fact-level result sets that answer concrete questions about the domain. Together, the tables and views form a coherent model that supports both the storage of raw clinical-educational data and the reconstruction of domain facts for reporting and analysis.