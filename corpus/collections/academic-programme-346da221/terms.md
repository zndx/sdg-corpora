# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Academic Programme
- **genus**: `bfo:0000040`
- **definition**: A structured educational offering that defines the curriculum, requirements, and outcomes for a specific field of study.
- **attributes**: programmeId, programmeName, degreeLevel, departmentId, startDate, status, creditHours, durationYears
- **relations**: offeredBy→AcademicDepartment, includesCourse→Course

## Academic Department
- **genus**: `bfo:0000040`
- **definition**: An organizational unit within a university responsible for a specific academic discipline or group of disciplines.
- **attributes**: departmentId, departmentName, schoolId, establishmentDate, status, headOfDepartmentId, contactEmail, contactPhone
- **relations**: belongsToMany→AcademicSchool, offersProgramme→AcademicProgramme, employsFaculty→FacultyMember

## Academic School
- **genus**: `bfo:0000040`
- **definition**: A higher-level organizational unit within a university that groups related academic departments.
- **attributes**: schoolId, schoolName, universityId, establishmentDate, status, deanId, contactEmail, contactPhone
- **relations**: containsDepartment→AcademicDepartment, partOfUniversity→University

## University
- **genus**: `bfo:0000040`
- **definition**: A higher education institution established by legislative act, providing academic programs and conducting research.
- **attributes**: universityId, universityName, legalName, establishmentDate, status, campusLocation, totalCampusAreaAcres, fundingSource, accreditationBody, accreditationStatus
- **relations**: containsSchool→AcademicSchool, employsFaculty→FacultyMember, enrollsStudent→Student

## Faculty Member
- **genus**: `bfo:0000040`
- **definition**: An individual employed by a university to teach, conduct research, and provide academic services.
- **attributes**: facultyId, firstName, lastName, title, departmentId, schoolId, universityId, employmentStatus, hireDate, contactEmail, contactPhone
- **relations**: teachesCourse→Course, conductsResearch→ResearchProject, supervisesStudent→Student

## Student
- **genus**: `bfo:0000040`
- **definition**: An individual enrolled in an academic program at a university, pursuing educational objectives.
- **attributes**: studentId, firstName, lastName, dateOfBirth, gender, enrollmentDate, expectedGraduationDate, academicStanding, contactEmail, contactPhone, address, emergencyContactName, emergencyContactPhone
- **relations**: enrolledInProgramme→AcademicProgramme, takesCourse→Course, supervisedBy→FacultyMember

## Course
- **genus**: `bfo:0000040`
- **definition**: A structured unit of instruction within an academic program, covering specific topics and learning outcomes.
- **attributes**: courseId, courseCode, courseName, creditHours, semester, year, status, prerequisiteCourseId, departmentId, schoolId, universityId
- **relations**: partOfProgramme→AcademicProgramme, taughtBy→FacultyMember, takenBy→Student

## Research Project
- **genus**: `bfo:0000040`
- **definition**: A structured investigation or study conducted by faculty or students to generate new knowledge or solve a problem.
- **attributes**: projectId, projectTitle, startDate, endDate, status, fundingAmount, fundingSource, departmentId, schoolId, universityId
- **relations**: conductedBy→FacultyMember, involvesStudent→Student, partOfDepartment→AcademicDepartment
