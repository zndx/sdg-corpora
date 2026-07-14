# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## School Site
- **genus**: `bfo:0000040`
- **definition**: A physical location and building complex where the school operates, including its address and geographic coordinates.
- **attributes**: siteId, streetAddress, city, county, postalCode, country, latitude, longitude
- **relations**: hasSite→InspectionEvent, hosts→CurriculumProgramme, hosts→StaffMember, hosts→StudentEnrolment

## Inspection Event
- **genus**: `bfo:0000015`
- **definition**: A formal evaluation process conducted by an external body to assess the school's performance, quality of education, and compliance with standards.
- **attributes**: inspectionId, startDate, endDate, inspectionType, overallEffectiveness, qualityOfEducation, behaviourAndAttitudes, personalDevelopment, leadershipAndManagement, welfareAndSafeguarding
- **relations**: evaluates→SchoolSite, assesses→CurriculumProgramme, assesses→StudentOutcome, assesses→StaffPerformance

## Curriculum Programme
- **genus**: `bfo:0000040`
- **definition**: A structured set of educational content, subjects, and learning objectives designed to meet the needs of students, including vocational and academic pathways.
- **attributes**: programmeId, programmeName, subjectArea, targetAgeGroup, isCore, isVocational, sequencingStrategy, phonicsApproach
- **relations**: deliveredAt→SchoolSite, deliveredTo→StudentEnrolment, includes→LearningActivity, supports→StudentOutcome

## Student Enrolment
- **genus**: `bfo:0000040`
- **definition**: A record of a student's registration and participation in the school, including their personal details, attendance, and educational needs.
- **attributes**: enrolmentId, studentId, dateOfBirth, gender, attendanceRate, persistentAbsence, ehcPlan, ehcPlanId, currentYearGroup, isSixthForm
- **relations**: enrolledAt→SchoolSite, enrolledIn→CurriculumProgramme, hasOutcome→StudentOutcome, hasStaff→StaffMember

## Student Outcome
- **genus**: `bfo:0000040`
- **definition**: A measurable result of a student's educational journey, including qualifications achieved, destinations, and personal development milestones.
- **attributes**: outcomeId, outcomeType, qualificationName, qualificationGrade, destinationType, destinationProvider, achievementDate, isSuccessful
- **relations**: achievedBy→StudentEnrolment, supportedBy→CurriculumProgramme, supportedBy→StaffMember

## Staff Member
- **genus**: `bfo:0000040`
- **definition**: An individual employed by the school to deliver education, provide pastoral care, or support student development, including teachers, clinical team members, and administrative staff.
- **attributes**: staffId, staffName, role, specialism, isQualified, yearsOfService, workloadWellbeing
- **relations**: employedAt→SchoolSite, delivers→CurriculumProgramme, supports→StudentEnrolment, supports→StudentOutcome

## Learning Activity
- **genus**: `bfo:0000015`
- **definition**: A specific educational activity or experience designed to enhance student learning, such as trips, workshops, or extracurricular events.
- **attributes**: activityId, activityName, activityType, location, date, participantCount, isOptional
- **relations**: organisedBy→StaffMember, participatedIn→StudentEnrolment, supports→CurriculumProgramme
