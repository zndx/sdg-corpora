# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## School Library Program
- **genus**: `cco:ont00000995`
- **definition**: A structured educational service and resource hub within a school designed to support student learning and information literacy.
- **attributes**: programId, name, establishedDate, lastReviewDate, fundingLevel, operationalStatus, collectionSize, serviceHours
- **relations**: locatedIn→School, staffedBy→TeacherLibrarian, serves→Student, meetsStandard→InformationLiteracyStandard

## Teacher-Librarian
- **genus**: `bfo:0000023`
- **definition**: A qualified professional who combines teaching and library science expertise to support curriculum and information literacy within a school library program.
- **attributes**: employeeId, fullName, certificationLevel, yearsOfExperience, employmentStatus, specialization, hireDate
- **relations**: employedBy→School, worksIn→SchoolLibraryProgram, collaboratesWith→ClassroomTeacher, manages→InformationResource

## Information Resource
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital item, such as a book, database, or electronic tool, curated for educational use within a school library.
- **attributes**: resourceId, title, formatType, acquisitionDate, conditionStatus, curriculumAlignment, accessRestriction, lastCatalogedDate
- **relations**: heldBy→SchoolLibraryProgram, usedBy→Student, supports→CurriculumStandard, categorizedBy→SubjectClassification

## Student
- **genus**: `bfo:0000015`
- **definition**: An individual enrolled in a school who participates in educational activities and utilizes library resources to develop information literacy skills.
- **attributes**: studentId, fullName, gradeLevel, enrollmentDate, literacyProficiency, attendanceRate, specialNeedsFlag
- **relations**: enrolledIn→School, uses→SchoolLibraryProgram, borrows→InformationResource, guidedBy→TeacherLibrarian

## Information Literacy Standard
- **genus**: `cco:ont00000958`
- **definition**: A defined criterion or benchmark outlining the required skills and competencies for students to effectively find, evaluate, and use information.
- **attributes**: standardId, standardCode, description, effectiveDate, reviewCycle, complianceLevel, targetGradeLevel
- **relations**: appliedTo→SchoolLibraryProgram, measuredBy→AssessmentMetric, guides→CurriculumStandard

## Assessment Metric
- **genus**: `bfo:0000015`
- **definition**: A specific measurement or evaluation procedure used to determine the extent to which a student or program meets information literacy standards.
- **attributes**: metricId, metricName, measurementType, administeredDate, scoreThreshold, resultStatus, raterId
- **relations**: evaluates→Student, validates→InformationLiteracyStandard, conductedBy→TeacherLibrarian, recordsResultIn→AssessmentRecord

## Assessment Record
- **genus**: `cco:ont00000995`
- **definition**: A formal document or dataset entry capturing the outcome of an assessment metric applied to a student or program.
- **attributes**: recordId, assessmentDate, rawScore, normalizedScore, feedbackNotes, reviewStatus, dataIntegrityCheck
- **relations**: generatedFrom→AssessmentMetric, documentsPerformanceOf→Student, storedIn→SchoolLibraryProgram
