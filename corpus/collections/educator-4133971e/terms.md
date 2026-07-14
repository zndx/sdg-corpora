# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Educator
- **genus**: `bfo:0000040`
- **definition**: A person who engages in the practice of teaching or education.
- **attributes**: educatorId, firstName, lastName, yearsOfExperience, specialization, membershipStatus
- **relations**: affiliatedWith→Chapter, participatesIn→Program

## Chapter
- **genus**: `bfo:0000040`
- **definition**: A local organizational unit of the Delta Kappa Gamma Society.
- **attributes**: chapterId, chapterName, location, foundingDate, currentMembers
- **relations**: hosts→Program, hasMember→Educator

## Program
- **genus**: `bfo:0000040`
- **definition**: A structured event or activity designed to support and celebrate educators.
- **attributes**: programId, programTitle, duration, status, targetAudience
- **relations**: hostedBy→Chapter, attends→Educator

## Specialization
- **genus**: `bfo:0000040`
- **definition**: A specific area of expertise or focus within the field of education.
- **attributes**: specializationId, specializationName, description
- **relations**: hasEducator→Educator
