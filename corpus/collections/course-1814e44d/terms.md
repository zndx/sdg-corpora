# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Course
- **genus**: `cco:ont00000958`
- **definition**: A formally cataloged academic unit with a unique identifier, title, and credit value offered by an institution.
- **attributes**: courseCode, title, units, level, status
- **relations**: satisfiesRequirement→DegreeRequirement, belongsToList→CourseList

## Degree Requirement
- **genus**: `cco:ont00000958`
- **definition**: A specific academic obligation or criterion that must be fulfilled to earn a degree or complete a track.
- **attributes**: requirementId, title, category, minCourses, status
- **relations**: requiresCourse→Course, partOfProgram→AcademicProgram

## Academic Program
- **genus**: `cco:ont00000958`
- **definition**: A structured curriculum defining the requirements for a degree, major, or specialized track.
- **attributes**: programCode, title, degreeType, effectiveDate, status
- **relations**: containsRequirement→DegreeRequirement, awardedBy→Institution

## Course List
- **genus**: `cco:ont00000958`
- **definition**: A defined set of courses from which a student must select to satisfy a specific requirement.
- **attributes**: listId, title, selectionCount, status
- **relations**: containsCourse→Course, satisfiesRequirement→DegreeRequirement

## Subfield
- **genus**: `bfo:0000023`
- **definition**: A specialized area of study within a broader academic discipline.
- **attributes**: subfieldCode, title, discipline, status
- **relations**: offersCourse→Course, partOfDiscipline→AcademicProgram
