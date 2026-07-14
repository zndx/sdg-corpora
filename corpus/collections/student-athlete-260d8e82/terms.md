# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student Athlete
- **genus**: `bfo:0000040`
- **definition**: A person who is enrolled in an academic institution and participates in intercollegiate athletics.
- **attributes**: studentId, fullName, enrollmentStatus, currentGpa, cumulativeGpa, semesterHoursEarned, degreeProgram, majorDeclared, semesterOfEnrollment
- **relations**: monitoredBy→ComplianceCoordinator, certifiedBy→CertifyingOfficer, reportedTo→HeadCoach, enrolledIn→AcademicTerm, pursuing→DegreeProgram

## Compliance Coordinator
- **genus**: `bfo:0000040`
- **definition**: An individual responsible for monitoring student-athlete eligibility and reporting status changes.
- **attributes**: employeeId, fullName, department, contactEmail, lastAuditDate
- **relations**: monitors→StudentAthlete, certifies→CreditHourRequirement, reportsTo→HeadCoach

## Certifying Officer
- **genus**: `bfo:0000040`
- **definition**: An individual in the Registrar's Office responsible for certifying student-athlete academic requirements.
- **attributes**: employeeId, fullName, office, contactEmail
- **relations**: certifies→CreditHourRequirement, notifies→HeadCoach, notifies→StudentAthlete

## Head Coach
- **genus**: `bfo:0000040`
- **definition**: An individual responsible for managing a sports team and ensuring compliance with eligibility rules.
- **attributes**: employeeId, fullName, sport, teamName, contactEmail
- **relations**: manages→StudentAthlete, receivesNotificationFrom→ComplianceCoordinator, receivesNotificationFrom→CertifyingOfficer, prohibits→StudentAthlete

## Academic Term
- **genus**: `bfo:0000040`
- **definition**: A defined period of instruction within an academic year, such as a semester or quarter.
- **attributes**: termId, termName, startDate, endDate, semesterHoursRequired, termType
- **relations**: contains→StudentAthlete, requires→CreditHourRequirement

## Credit Hour Requirement
- **genus**: `bfo:0000040`
- **definition**: A specific academic credit threshold that must be met to maintain student-athlete eligibility.
- **attributes**: requirementId, creditHoursRequired, requirementType, deadlineDate, status
- **relations**: appliesTo→StudentAthlete, certifiedBy→CertifyingOfficer, monitoredBy→ComplianceCoordinator, partOf→AcademicTerm

## Degree Program
- **genus**: `bfo:0000040`
- **definition**: A structured course of study leading to an academic degree, with specific course requirements.
- **attributes**: programId, programName, totalCreditsRequired, majorRequired, declarationDeadline
- **relations**: pursuedBy→StudentAthlete, requires→CreditHourRequirement
