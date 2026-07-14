# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Lecture Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled instructional period where lecture notes and computational examples are delivered to students.
- **attributes**: sessionIdentifier, scheduledDate, durationMinutes, topic, status
- **relations**: uses→LectureNote, uses→ComputationalExample

## Lecture Note
- **genus**: `cco:ont00000958`
- **definition**: A textual or digital document containing instructional material for a specific lecture session.
- **attributes**: noteIdentifier, title, format, pageCount, lastModified
- **relations**: belongs_to→LectureSession

## Computational Example
- **genus**: `cco:ont00000995`
- **definition**: A digital artifact representing a solved problem or demonstration using computational software.
- **attributes**: exampleIdentifier, title, softwareVersion, fileSizeBytes, status
- **relations**: delivered_in→LectureSession, stored_as→NotebookFile

## Notebook File
- **genus**: `cco:ont00000958`
- **definition**: A digital file containing computational code, output, and narrative text in a specific notebook format.
- **attributes**: fileIdentifier, fileName, fileExtension, creationDate, checksum
- **relations**: contains→ComputationalExample

## Textbook
- **genus**: `cco:ont00000958`
- **definition**: A published educational book providing comprehensive instruction on a subject.
- **attributes**: isbn, title, author, publisher, publicationYear, price
- **relations**: supplements→LectureSession

## Software Package
- **genus**: `bfo:0000015`
- **definition**: A computational tool or system used to perform calculations, simulations, or data analysis.
- **attributes**: packageIdentifier, name, version, developer, licenseType
- **relations**: used_by→ComputationalExample
