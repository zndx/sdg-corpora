# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Lab Activity
- **genus**: `bfo:0000015`
- **definition**: A structured educational activity conducted in a laboratory setting to teach plant and microbial biology concepts.
- **attributes**: activityId, title, description, durationMinutes, difficultyLevel, status
- **relations**: taughtBy→FacultyMember, attendedBy→Student, usesMaterial→LabMaterial

## Faculty Member
- **genus**: `bfo:0000003`
- **definition**: A person who holds a teaching or research position at an academic institution and is responsible for developing and delivering educational content.
- **attributes**: facultyId, firstName, lastName, department, email, yearsOfService
- **relations**: develops→LabActivity, coordinates→TeachingAssistant

## Student
- **genus**: `bfo:0000003`
- **definition**: An individual enrolled in an academic program who participates in educational activities such as laboratory sessions.
- **attributes**: studentId, firstName, lastName, major, enrollmentStatus
- **relations**: enrolledIn→Course, attended→LabActivity

## Teaching Assistant
- **genus**: `bfo:0000003`
- **definition**: A person, often a graduate student, who assists faculty members in teaching and supervising laboratory activities.
- **attributes**: taId, firstName, lastName, assignedCourse, hoursPerWeek
- **relations**: assists→FacultyMember, supervises→Student

## Course
- **genus**: `bfo:0000015`
- **definition**: A structured educational unit offered by an academic institution that includes lectures, labs, and assessments.
- **attributes**: courseCode, courseName, credits, semester, department
- **relations**: includesLab→LabActivity, taughtBy→FacultyMember

## Lab Material
- **genus**: `cco:ont00000995`
- **definition**: Physical or digital resources required to conduct a laboratory activity, such as specimens, equipment, or software.
- **attributes**: materialId, name, quantity, unit, storageLocation
- **relations**: usedIn→LabActivity
