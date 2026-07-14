# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Mathematical Concept
- **genus**: `bfo:0000040`
- **definition**: An abstract entity representing a fundamental mathematical idea or principle taught in algebra courses.
- **attributes**: conceptId, conceptName, conceptType, difficultyLevel, prerequisiteConceptId
- **relations**: prerequisiteFor→MathematicalConcept, taughtIn→Course

## Academic Course
- **genus**: `bfo:0000040`
- **definition**: A structured educational program designed to teach specific mathematical concepts and applications.
- **attributes**: courseCode, courseTitle, courseLevel, creditHours, semesterOffered
- **relations**: teachesConcept→MathematicalConcept, usesTextbook→Textbook

## Educational Textbook
- **genus**: `bfo:0000040`
- **definition**: A published educational resource containing mathematical concepts, applications, and problem-solving processes.
- **attributes**: isbn10, isbn13, title, edition, publicationDate, publisher, price
- **relations**: coversConcept→MathematicalConcept, usedInCourse→Course

## Problem Solving Process
- **genus**: `bfo:0000040`
- **definition**: A structured five-step method for approaching and solving mathematical problems.
- **attributes**: processId, stepNumber, stepDescription, isMandatory
- **relations**: partOf→Course, appliesToConcept→MathematicalConcept

## Student
- **genus**: `bfo:0000004`
- **definition**: An individual enrolled in an academic course to learn mathematical concepts and applications.
- **attributes**: studentId, firstName, lastName, enrollmentDate, academicLevel
- **relations**: enrolledIn→Course, learnsConcept→MathematicalConcept

## Assessment
- **genus**: `bfo:0000040`
- **definition**: A formal evaluation tool used to measure student understanding of mathematical concepts.
- **attributes**: assessmentId, assessmentType, dateGiven, maxScore, passingScore
- **relations**: testsConcept→MathematicalConcept, takenBy→Student
