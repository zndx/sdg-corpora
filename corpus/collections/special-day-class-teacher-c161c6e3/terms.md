# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Special Day Class Teacher
- **genus**: `bfo:0000040`
- **definition**: A credentialed professional who provides direct instruction and supervision for students with specific learning handicaps within a special day class setting.
- **attributes**: credentialType, employeeId, employmentStatus, salarySchedule, hireDate, lastEvaluationDate, supervisoryRole
- **relations**: assignedTo→SchoolSite, reportsTo→SitePrincipal, evaluates→Student, supervises→SupportPersonnel, participatesIn→IEPTeam

## Student
- **genus**: `bfo:0000004`
- **definition**: An identified pupil with specific learning handicaps who receives specialized instruction and services under an approved Individualized Education Program.
- **attributes**: studentId, enrollmentStatus, disabilityType, iepStatus, dateOfBirth, gradeLevel, primaryLanguage
- **relations**: hasIEP→IndividualizedEducationProgram, receivesInstructionFrom→SpecialDayClassTeacher, evaluatedBy→PreReferralTeam, assignedToClass→SpecialDayClass

## Individualized Education Program
- **genus**: `bfo:0000016`
- **definition**: A legally binding document outlining specific educational objectives, accommodations, and services for a student with a disability.
- **attributes**: iepId, creationDate, lastReviewDate, expirationDate, status, meetsFederalCompliance, meetsStateCompliance
- **relations**: coversStudent→Student, createdBy→IEPTeam, specifiesInstruction→InstructionalObjective, mandatesAccommodation→Accommodation

## Instructional Objective
- **genus**: `bfo:0000016`
- **definition**: A clearly defined goal in learning or behavior designed to reduce the handicapping effect of a pupil's disability, specify remedial instruction, or enhance pupil strengths.
- **attributes**: objectiveId, objectiveType, targetSkill, anticipatedAttainmentLevel, measurementMethod, dueDate, isRemedial
- **relations**: partOfIEP→IndividualizedEducationProgram, targetsStudent→Student, measuredBy→AssessmentInstrument

## Assessment Instrument
- **genus**: `bfo:0000016`
- **definition**: A standardized tool or method used to measure achievement levels, ascertain attainment of objectives, and evaluate the effectiveness of instructional programs.
- **attributes**: instrumentId, instrumentName, instrumentType, validityDate, reliabilityCoefficient, administeredBy
- **relations**: usedToMeasure→InstructionalObjective, administeredTo→Student, designedBy→EducationalSpecialist

## IEP Team
- **genus**: `bfo:0000002`
- **definition**: A collaborative group including teachers, administrators, parents, and specialists responsible for developing, reviewing, and evaluating Individualized Education Programs.
- **attributes**: teamId, teamName, meetingFrequency, lastMeetingDate, nextScheduledMeeting, complianceStatus
- **relations**: createsIEP→IndividualizedEducationProgram, includesMember→SpecialDayClassTeacher, includesMember→SitePrincipal, includesMember→Parent

## School Site
- **genus**: `bfo:0000002`
- **definition**: A physical location and administrative unit where educational services are delivered, including special day classes and support personnel.
- **attributes**: siteId, siteName, districtAffiliation, siteType, operationalStatus, capacity
- **relations**: hostsSpecialDayClass→SpecialDayClass, employsTeacher→SpecialDayClassTeacher, managedBy→SitePrincipal
