# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Curriculum Topic
- **genus**: `bfo:0000040`
- **definition**: A distinct area of mathematical study or skill within the Year 8 curriculum, such as Geometry or Algebra.
- **attributes**: topicId, topicName, bfoGenus, complexityLevel, isCore
- **relations**: containsSubtopic→CurriculumSubtopic, requiresPrerequisite→CurriculumTopic

## Curriculum Subtopic
- **genus**: `bfo:0000040`
- **definition**: A specific, granular skill or concept within a broader Curriculum Topic, such as 'Pythagoras' Theorem' or 'Standard Form'.
- **attributes**: subtopicId, subtopicName, bfoGenus, isAbstract, difficultyRating
- **relations**: isPartOfTopic→CurriculumTopic, isMeasuredBy→AssessmentItem

## Assessment Item
- **genus**: `cco:ont00000995`
- **definition**: A specific problem, question, or task used to evaluate a student's mastery of a Curriculum Subtopic.
- **attributes**: itemId, itemText, itemType, maxScore, timeLimitSeconds, isPublic
- **relations**: targetsSubtopic→CurriculumSubtopic, isAttemptedBy→StudentResponse

## Student Response
- **genus**: `cco:ont00000995`
- **definition**: A recorded answer or solution provided by a student in response to a specific Assessment Item.
- **attributes**: responseId, responseValue, isCorrect, scoreEarned, responseTimestamp, attemptNumber
- **relations**: isForItem→AssessmentItem, isSubmittedBy→Student

## Student
- **genus**: `bfo:0000004`
- **definition**: An individual learner enrolled in the Year 8 curriculum who engages with topics and submits responses.
- **attributes**: studentId, studentName, enrollmentYear, isActive, learningProfile
- **relations**: submitsResponse→StudentResponse, enrolledIn→CurriculumTopic
