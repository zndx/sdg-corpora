# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## MESA Academic Support Program
- **genus**: `bfo:0000015`
- **definition**: A structured academic support and enrichment program designed to increase student success and transfer rates in math-based STEM degrees at community colleges.
- **attributes**: programId, programName, hostInstitution, locationBuilding, locationRoom, contactPhone, contactFax, transferRate, totalStudentsServed, underrepresentedPercentage
- **relations**: serves→StudentEnrollment, offers→SupportService, defines→MathBasedDegree

## Student Program Enrollment Record
- **genus**: `cco:ont00000995`
- **definition**: A record of a specific student's participation in the MESA program, tracking their academic trajectory and demographic data.
- **attributes**: enrollmentId, studentId, major, ethnicity, transferStatus, targetUniversity, enrollmentDate, graduationDate
- **relations**: participatesIn→MESAProgram, enrolledIn→Course, transferredTo→FourYearUniversity

## MESA Support Service
- **genus**: `bfo:0000015`
- **definition**: A specific academic, professional, or social service activity provided to MESA students to enhance their educational experience.
- **attributes**: serviceId, serviceName, serviceType, description, frequency, isMandatory
- **relations**: providedBy→MESAProgram, attendedBy→StudentEnrollment

## Academic Course
- **genus**: `cco:ont00000995`
- **definition**: A specific academic class offered at the college, particularly those contributing to a math-based degree requirement.
- **attributes**: courseCode, courseTitle, department, isMathBased, prerequisite, credits
- **relations**: satisfies→MathBasedDegree, takenBy→StudentEnrollment

## Math-Based Degree Definition
- **genus**: `cco:ont00000958`
- **definition**: A classification of academic degrees that require a specific sequence of advanced mathematics or science courses.
- **attributes**: degreeName, requiresConsecutiveMath, requiresPhysicsOrChemOrBio, targetInstitution
- **relations**: requires→Course, pursuedBy→StudentEnrollment

## Target Transfer University
- **genus**: `bfo:0000015`
- **definition**: A four-year institution where MESA students transfer to complete their bachelor's degrees.
- **attributes**: universityName, acceptsTransfer, location
- **relations**: receives→StudentEnrollment
