# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Lecture Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled instructional event where lecture notes and computational examples are delivered to students.
- **attributes**: sessionIdentifier, scheduledDate, durationMinutes, topic, status
- **relations**: uses→LectureNote, delivers→ComputationalExample

## Lecture Note
- **genus**: `cco:ont00000958`
- **definition**: A structured document containing textual explanations, diagrams, and theoretical content for a specific lecture.
- **attributes**: noteId, title, versionNumber, pageCount, lastModified, format
- **relations**: belongs_to→LectureSession, references→ComputationalExample

## Computational Example
- **genus**: `cco:ont00000995`
- **definition**: A reusable computational artifact, such as a Mathematica notebook, demonstrating a specific scientific or engineering concept.
- **attributes**: exampleId, title, fileFormat, fileSizeBytes, creationDate, author, license
- **relations**: demonstrates→MathematicalConcept, storedIn→DigitalRepository

## Mathematical Concept
- **genus**: `bfo:0000015`
- **definition**: An abstract theoretical construct or method, such as a function type or differential equation, used in scientific computation.
- **attributes**: conceptId, name, category, complexityLevel, prerequisiteConcepts
- **relations**: appliedIn→ComputationalExample, taughtIn→LectureSession

## Digital Repository
- **genus**: `cco:ont00000958`
- **definition**: A persistent storage system or file directory where computational artifacts and lecture materials are archived.
- **attributes**: repositoryId, name, storagePath, totalCapacityGB, lastBackup, accessLevel
- **relations**: hosts→ComputationalExample, hosts→LectureNote
