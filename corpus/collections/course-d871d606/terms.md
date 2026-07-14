# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Course
- **genus**: `bfo:0000040`
- **definition**: A structured educational unit offered within a degree program, identified by a code and title, with associated credit value and prerequisite requirements.
- **attributes**: courseCode, title, creditValue, isPrerequisite, category
- **relations**: hasPrerequisite→Course, satisfiesRequirement→DegreeRequirement

## Degree Requirement
- **genus**: `bfo:0000040`
- **definition**: A mandatory or optional educational component required for the completion of a degree program, categorized by type and credit value.
- **attributes**: requirementId, category, requiredCredits, isOptional, effectiveDate
- **relations**: requiresCourse→Course, partOfDegree→DegreeProgram

## Degree Program
- **genus**: `bfo:0000040`
- **definition**: A structured academic program leading to a Master of Business Administration degree, defined by its curriculum, credit requirements, and effective date.
- **attributes**: programCode, programName, totalRequiredCredits, effectiveDate, status
- **relations**: hasRequirement→DegreeRequirement, offersConcentration→Concentration

## Concentration
- **genus**: `bfo:0000040`
- **definition**: A specialized track within a degree program, composed of a set of elective courses that students may choose to fulfill part of their degree requirements.
- **attributes**: concentrationId, name, requiredElectives, status
- **relations**: includesCourse→Course, partOfDegree→DegreeProgram
