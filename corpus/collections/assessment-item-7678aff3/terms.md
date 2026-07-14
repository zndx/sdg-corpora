# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Assessment Item
- **genus**: `cco:ont00000995`
- **definition**: A discrete question or task within an examination paper, representing a measurable unit of student performance.
- **attributes**: itemIdentifier, sectionDesignation, questionNumber, subQuestionIndex, allocatedMarks, itemType, status
- **relations**: referencedBy→SourceMaterial, assessedBy→MarkingScheme

## Source Material
- **genus**: `cco:ont00000958`
- **definition**: A published educational text or handbook serving as the authoritative reference for assessment content.
- **attributes**: title, publisher, unitNumber, chapterNumber, pageReference, materialType
- **relations**: containsContentFor→AssessmentItem

## Marking Scheme
- **genus**: `cco:ont00000995`
- **definition**: A structured rubric defining the correct answers, required justifications, and point allocations for assessment items.
- **attributes**: schemeIdentifier, academicSession, subjectCode, totalMarks, durationMinutes, version
- **relations**: specifiesCriteriaFor→AssessmentItem

## Concept
- **genus**: `bfo:0000040`
- **definition**: A specific domain term, topic, or principle taught within the curriculum and tested by assessment items.
- **attributes**: conceptName, domainCategory, definitionText, complexityLevel
- **relations**: testedBy→AssessmentItem, partOfCurriculum→SourceMaterial

## Answer Key
- **genus**: `cco:ont00000995`
- **definition**: The definitive correct response or set of responses required to achieve full marks for a specific assessment item.
- **attributes**: keyIdentifier, responseText, isCorrect, alternativeAccepted, formatType
- **relations**: correspondsTo→AssessmentItem, demonstratesConcept→Concept

## Scoring Rule
- **genus**: `bfo:0000015`
- **definition**: A procedural instruction defining how partial or full marks are awarded based on specific content requirements or keywords.
- **attributes**: ruleIdentifier, requiredPoints, pointsAwarded, conditionType, penaltyApplied
- **relations**: appliesTo→AssessmentItem, evaluatesAnswer→AnswerKey
