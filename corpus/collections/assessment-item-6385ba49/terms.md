# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Assessment Item
- **genus**: `bfo:0000015`
- **definition**: A specific question or task within an examination paper that requires a candidate to demonstrate knowledge or skill.
- **attributes**: itemId, sectionDesignation, questionNumber, subQuestionLabel, marksAllotted, questionType, status
- **relations**: partOf→ExaminationPaper, referencesSource→SourceMaterial, testsConcept→Concept

## Examination Paper
- **genus**: `bfo:0000015`
- **definition**: A structured set of assessment items administered to candidates to evaluate their proficiency in a subject.
- **attributes**: paperId, subjectCode, classLevel, academicSession, maxTimeMinutes, totalMarks, totalQuestions, requiredAnswers, publicationDate
- **relations**: containsItem→AssessmentItem, assessesSubject→Subject

## Source Material
- **genus**: `cco:ont00000995`
- **definition**: A published educational resource, such as a textbook or handbook, from which assessment content is derived.
- **attributes**: materialId, title, publisher, edition, isbn, publicationYear, format
- **relations**: containsPage→SourcePage

## Source Page
- **genus**: `cco:ont00000995`
- **definition**: A specific page within a source material that contains the content relevant to an assessment item.
- **attributes**: pageId, pageNumber, unitNumber, chapterNumber, contentSnippet
- **relations**: partOf→SourceMaterial, citesConcept→Concept

## Concept
- **genus**: `bfo:0000015`
- **definition**: A specific topic, skill, or knowledge domain taught in the curriculum and assessed in the examination.
- **attributes**: conceptId, name, category, difficultyLevel, description
- **relations**: taughtIn→CurriculumUnit, testedBy→AssessmentItem

## Curriculum Unit
- **genus**: `bfo:0000015`
- **definition**: A distinct module or section of the educational syllabus covering a specific set of concepts.
- **attributes**: unitId, title, unitNumber, durationHours, learningOutcomes
- **relations**: containsConcept→Concept, partOfSubject→Subject

## Subject
- **genus**: `bfo:0000015`
- **definition**: An academic discipline or field of study for which the examination is conducted.
- **attributes**: subjectCode, name, classLevel, department, credits
- **relations**: hasUnit→CurriculumUnit, assessedBy→ExaminationPaper
