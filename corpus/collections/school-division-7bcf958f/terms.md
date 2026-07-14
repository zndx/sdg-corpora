# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## School Division
- **genus**: `bfo:0000040`
- **definition**: A public school administrative jurisdiction within Virginia that participates in the regional magnet school program.
- **attributes**: divisionId, divisionName, region, establishedDate, totalEnrollment, districtType
- **relations**: servesStudents→Student, partnersWith→RegionalSchoolBoard

## Student
- **genus**: `bfo:0000004`
- **definition**: An enrolled individual attending the magnet school who has been selected based on aptitude and interest.
- **attributes**: studentId, firstName, lastName, dateOfBirth, gradeLevel, enrollmentStatus, gpa, isHonorsStudent
- **relations**: residesIn→SchoolDivision, enrolledIn→Course, participatesIn→ExtracurricularActivity, awarded→Diploma

## Course
- **genus**: `bfo:0000040`
- **definition**: A structured academic offering within the magnet school's curriculum, including government, international studies, sciences, and arts.
- **attributes**: courseCode, courseTitle, department, credits, isVerified, isAdvanced, semester
- **relations**: taughtBy→FacultyMember, prerequisiteOf→Course, fulfillsRequirement→DiplomaRequirement

## Faculty Member
- **genus**: `bfo:0000004`
- **definition**: A professional educator employed by the magnet school who shapes the challenging curriculum.
- **attributes**: facultyId, firstName, lastName, department, yearsOfExperience, isTenured, hireDate
- **relations**: teaches→Course, advises→Student, servesOn→PlanningCommittee

## Diploma
- **genus**: `bfo:0000040`
- **definition**: A formal credential awarded to students who meet the magnet school's graduation requirements, including the Governor's School Seal.
- **attributes**: diplomaId, issueDate, hasSeal, totalCreditsEarned, isAdvancedStudies
- **relations**: awardedTo→Student, requires→DiplomaRequirement

## Diploma Requirement
- **genus**: `bfo:0000040`
- **definition**: A specific academic or administrative condition that must be satisfied for graduation, such as minimum credit units or verified credits.
- **attributes**: requirementId, description, minimumCredits, isVerified, regulationCode
- **relations**: satisfiedBy→Course, partOf→Diploma

## Extracurricular Activity
- **genus**: `bfo:0000040`
- **definition**: A non-academic program or club offered by the school, such as athletics, arts, or student organizations.
- **attributes**: activityId, activityName, category, isCompetitive, season
- **relations**: hasParticipants→Student, sponsoredBy→SchoolDivision
