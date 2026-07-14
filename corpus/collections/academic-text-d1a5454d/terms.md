# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Text
- **genus**: `cco:ont00000958`
- **definition**: A published educational resource, such as a textbook or e-text, containing structured instructional material on a specific subject.
- **attributes**: isbn, edition, publicationDate, format, suggestedRetailPrice, title
- **relations**: hasAuthor→AcademicAuthor, partOfPackage→AccessCardPackage, hasAccessPlatform→DigitalPlatform

## Academic Author
- **genus**: `bfo:0000015`
- **definition**: An individual who has written or contributed to the creation of an academic text or educational material.
- **attributes**: authorId, fullName, affiliation, role
- **relations**: authored→AcademicText

## Access Card Package
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital bundle containing an access card or code that grants users entry to an online educational platform and associated digital content.
- **attributes**: packageId, accessDuration, platformName, status, activationDate
- **relations**: grantsAccessTo→DigitalPlatform, includesText→AcademicText

## Digital Platform
- **genus**: `bfo:0000015`
- **definition**: An online system or service that hosts educational content, exercises, and assessment tools for students and instructors.
- **attributes**: platformId, platformName, version, provider, isAvailable
- **relations**: hostsContent→AcademicText, providesExercises→StatisticalExercise

## Statistical Exercise
- **genus**: `cco:ont00000995`
- **definition**: A specific problem, question, or task designed to test or reinforce statistical concepts and analytical skills.
- **attributes**: exerciseId, exerciseType, difficultyLevel, isUpdated, conceptCovered
- **relations**: isPartOf→DigitalPlatform, testsConcept→StatisticalConcept

## Statistical Concept
- **genus**: `bfo:0000015`
- **definition**: A fundamental principle, method, or theoretical framework within the field of statistics used for data analysis and interpretation.
- **attributes**: conceptId, conceptName, category, isCore
- **relations**: isTestedBy→StatisticalExercise
