# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Breeding Program
- **genus**: `bfo:0000015`
- **definition**: A structured selection and evaluation process for North American Hanoverian Jumper horses.
- **attributes**: programId, programName, startDate, status

## Horse
- **genus**: `cco:ont00000995`
- **definition**: A registered North American Hanoverian Jumper horse subject to breeding program evaluation.
- **attributes**: horseId, horseName, registrationNumber, dateOfBirth, sex, breed, status
- **relations**: evaluatedBy→BreedingProgram, hasOwner→Owner, hasSire→Horse, hasDam→Horse

## Owner
- **genus**: `bfo:0000023`
- **definition**: A person or entity holding legal ownership of a horse.
- **attributes**: ownerId, ownerName, address, city, state, zipCode, phone, email
- **relations**: owns→Horse

## Performance Test
- **genus**: `bfo:0000015`
- **definition**: A formal evaluation of a horse's jumping ability and performance.
- **attributes**: testId, testDate, jumpingScore, breedingValue, testType
- **relations**: conductedOn→Horse, evaluatedBy→Evaluator

## Evaluator
- **genus**: `bfo:0000023`
- **definition**: A person or organization responsible for conducting performance tests and evaluations.
- **attributes**: evaluatorId, evaluatorName, organization, role
- **relations**: evaluates→PerformanceTest

## Competition Record
- **genus**: `cco:ont00000995`
- **definition**: A documented record of a horse's participation and success in jumping competitions.
- **attributes**: recordId, competitionName, competitionLevel, competitionDate, result, competitionType
- **relations**: participatedIn→Horse, recordedBy→Evaluator

## Pedigree
- **genus**: `cco:ont00000995`
- **definition**: A documented lineage of a horse's ancestors, focusing on jumping sires.
- **attributes**: pedigreeId, sireName, damName, grandSireName, grandDamName, jumpingSireCount
- **relations**: describes→Horse, includesSire→Horse, includesDam→Horse
