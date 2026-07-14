# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Didactical Situation
- **genus**: `bfo:0000015`
- **definition**: A structured educational interaction between a teacher and students centered on a specific mathematical problem or concept.
- **attributes**: situationId, title, periodStart, periodEnd, status, description
- **relations**: describes→MathematicalConcept, involves→EducationalActor, uses→DidacticInstrument

## Mathematical Concept
- **genus**: `bfo:0000040`
- **definition**: An abstract mathematical object, property, or relationship that serves as the subject of instruction within a didactical situation.
- **attributes**: conceptId, name, domain, complexityLevel, prerequisiteConceptId, isAbstract
- **relations**: isSubjectOf→DidacticalSituation, requires→MathematicalConcept

## Educational Actor
- **genus**: `bfo:0000004`
- **definition**: A person participating in a didactical situation, specifically a teacher or a student.
- **attributes**: actorId, role, institution, yearsOfExperience, demographicGroup
- **relations**: participatesIn→DidacticalSituation, affiliatedWith→EducationalInstitution

## Didactic Instrument
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital tool, artifact, or resource used to facilitate the learning of mathematical concepts within a didactical situation.
- **attributes**: instrumentId, title, type, publicationYear, authorName, isDigital
- **relations**: supports→MathematicalConcept, usedIn→DidacticalSituation

## Didactic Institution
- **genus**: `bfo:0000040`
- **definition**: An organizational body or system that establishes the rules, norms, and constraints governing the didactical situation.
- **attributes**: institutionId, name, jurisdiction, foundingYear, type
- **relations**: governs→DidacticalSituation, employs→EducationalActor

## Learning Outcome
- **genus**: `bfo:0000015`
- **definition**: A measurable change in a student's knowledge, skill, or understanding resulting from a didactical situation.
- **attributes**: outcomeId, assessmentScore, masteryLevel, dateAssessed, isAchieved
- **relations**: resultsFrom→DidacticalSituation, measures→MathematicalConcept, attributedTo→EducationalActor
