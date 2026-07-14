# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Textbook
- **genus**: `cco:ont00000995`
- **definition**: A published instructional book or workbook assigned to a specific grade level and subject for primary education.
- **attributes**: isbn, title, publisher, edition, price, subject, gradeLevel, partIdentifier
- **relations**: assignedTo→GradeLevel, publishedBy→Publisher, partOf→CurriculumSet

## Exercise Book
- **genus**: `cco:ont00000995`
- **definition**: A physical notebook or pad of paper used by students for writing exercises, assignments, and practice work.
- **attributes**: code, description, size, lineType, unitPrice, requiredQuantity, subject, isCompulsory
- **relations**: assignedTo→GradeLevel, usedFor→Subject

## Stationery Item
- **genus**: `cco:ont00000995`
- **definition**: A non-book educational supply or material used in the classroom or for homework, such as files, folders, or art supplies.
- **attributes**: code, description, unitPrice, requiredQuantity, isCompulsory, color
- **relations**: assignedTo→GradeLevel, usedFor→Subject

## Grade Level
- **genus**: `bfo:0000015`
- **definition**: A specific academic year or cohort within a primary school system, defining the curriculum and materials required.
- **attributes**: gradeNumber, academicYear, schoolName
- **relations**: requires→Textbook, requires→ExerciseBook, requires→StationeryItem

## Subject
- **genus**: `bfo:0000015`
- **definition**: An academic discipline or area of study taught within the primary school curriculum.
- **attributes**: name, languageCode
- **relations**: uses→Textbook, uses→ExerciseBook

## Publisher
- **genus**: `cco:ont00000995`
- **definition**: An organization responsible for the production and distribution of educational textbooks and workbooks.
- **attributes**: name
- **relations**: publishes→Textbook
