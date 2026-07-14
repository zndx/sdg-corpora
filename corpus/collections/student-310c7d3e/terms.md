# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000004`
- **definition**: A person enrolled in an academic program at the university.
- **attributes**: idNumber, name, signatureDate
- **relations**: hasAdvisor→AcademicAdvisor, enrolledIn→DegreeProgram, hasTransferCredits→TransferCreditRecord

## Academic Advisor
- **genus**: `bfo:0000004`
- **definition**: A faculty or staff member assigned to guide a student's academic progress.
- **attributes**: name
- **relations**: advises→Student

## Degree Program
- **genus**: `bfo:0000040`
- **definition**: A structured curriculum defining the requirements for an academic degree.
- **attributes**: name, level, totalCreditsRequired, minimumGPA, upperDivisionCreditsRequired
- **relations**: requiresCourse→Course

## Course
- **genus**: `bfo:0000040`
- **definition**: A specific academic class with a prefix, title, and credit value.
- **attributes**: prefix, title, credits, isUpperDivision, isWaived
- **relations**: satisfiesRequirement→CurriculumRequirement

## Curriculum Requirement
- **genus**: `bfo:0000040`
- **definition**: A specific category of coursework or proficiency required for degree completion.
- **attributes**: name, requiredCredits, status
- **relations**: requiresCourse→Course, partOfProgram→DegreeProgram

## Transfer Credit Record
- **genus**: `cco:ont00000995`
- **definition**: A record of academic credits earned at another institution and applied to the current degree.
- **attributes**: sourceInstitution, creditsApplied, evaluationStatus
- **relations**: appliedToStudent→Student, satisfiesRequirement→CurriculumRequirement
