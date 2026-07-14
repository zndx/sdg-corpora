# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Admission Criteria
- **genus**: `cco:ont00000995`
- **definition**: A formal set of requirements and standards that applicants must satisfy to be considered for enrollment in an academic program.
- **attributes**: criteriaId, effectiveDate, minimumGPA, status, description
- **relations**: appliesTo→AcademicProgram, requires→PrerequisiteCourse, requires→StandardizedExam, requires→ExperientialRequirement

## Academic Program
- **genus**: `cco:ont00000995`
- **definition**: A structured educational offering within an institution, such as a degree, certificate, or concentration, with defined learning outcomes and requirements.
- **attributes**: programId, programName, degreeLevel, departmentId, status, totalCreditsRequired
- **relations**: hasAdmissionCriteria→AdmissionCriteria, offeredBy→Department, includes→Course

## Prerequisite Course
- **genus**: `cco:ont00000995`
- **definition**: A specific course that must be successfully completed before a student can enroll in a target course or program.
- **attributes**: courseCode, courseTitle, credits, departmentId, status
- **relations**: requiredBy→AdmissionCriteria, offeredBy→Department

## Standardized Exam
- **genus**: `cco:ont00000995`
- **definition**: A formal assessment instrument used to measure academic readiness or aptitude for admission into a program.
- **attributes**: examCode, examName, status, administeredBy, lastUsedDate
- **relations**: requiredBy→AdmissionCriteria

## Experiential Requirement
- **genus**: `cco:ont00000995`
- **definition**: A non-academic requirement involving practical exposure, work hours, or field experience necessary for program admission.
- **attributes**: requirementId, description, minimumHours, verificationMethod, status
- **relations**: requiredBy→AdmissionCriteria

## Department
- **genus**: `cco:ont00000995`
- **definition**: An administrative unit within an educational institution responsible for academic programs, faculty, and curriculum oversight.
- **attributes**: departmentId, departmentName, collegeId, chairpersonName, status
- **relations**: offers→AcademicProgram, offers→PrerequisiteCourse, oversees→AdmissionCriteria
