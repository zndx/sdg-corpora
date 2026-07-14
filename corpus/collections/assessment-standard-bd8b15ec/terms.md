# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Assessment Standard
- **genus**: `cco:ont00000958`
- **definition**: A formalized unit of learning and assessment defined by NZQA, specifying a skill, knowledge area, or performance outcome to be demonstrated by a student.
- **attributes**: standardNumber, version, level, credits, literacyOrNumeracyRequirement, fullTitle, methodOfAssessment, assessmentOpportunitiesOffered
- **relations**: partOf→Course, measuredBy→AssessmentEvent

## Course
- **genus**: `cco:ont00000995`
- **definition**: A structured educational program or subject offering, such as a Year 12 Music course, designed to develop specific skills and knowledge in students.
- **attributes**: courseCode, yearLevel, subjectArea, totalCredits, endorsableStatus, teacherName, description
- **relations**: contains→AssessmentStandard, taughtBy→Teacher

## Assessment Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled instance or opportunity for a student to demonstrate competence against a specific assessment standard, occurring at a specific time and method.
- **attributes**: eventDate, method, status, opportunityNumber
- **relations**: covers→AssessmentStandard, conductedFor→Course

## Teacher
- **genus**: `bfo:0000023`
- **definition**: An individual role or person responsible for instructing, assessing, and managing a specific educational course or subject area.
- **attributes**: fullName, employeeId, department, signatureStatus
- **relations**: instructs→Course

## Qualification
- **genus**: `cco:ont00000995`
- **definition**: A formal credential or certification awarded upon the successful completion of a course or set of standards, such as NCEA levels or University Entrance.
- **attributes**: qualificationName, issuingBody, creditsRequired, endorsementEligible
- **relations**: awardedFor→Course
