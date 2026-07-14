# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Admission Application
- **genus**: `cco:ont00000958`
- **definition**: A formal request submitted by a student for a discretionary place in the F.1 academic year, containing personal details, academic records, and activity evidence.
- **attributes**: applicationId, academicYear, submissionDate, status, totalScore, rank, interviewDate, interviewResult
- **relations**: submittedBy→Student, evaluatedBy→AdmissionCommittee, hasAcademicRecord→AcademicRecord, hasInterviewScore→InterviewScore, hasActivityEvidence→ActivityEvidence

## Student
- **genus**: `bfo:0000002`
- **definition**: A person enrolled or applying for enrollment in the school, identified by official documentation.
- **attributes**: studentId, fullName, dateOfBirth, currentGradeLevel, schoolNumber
- **relations**: submittedApplication→AdmissionApplication, holdsIdentityDocument→IdentityDocument

## Academic Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record of a student's grades and scores in core subjects and overall performance during the P.5 and P.6 terms.
- **attributes**: recordId, gradeLevel, term, conductScore, academicScore, overallWeightedScore
- **relations**: partOfApplication→AdmissionApplication, containsSubjectGrade→SubjectGrade

## Subject Grade
- **genus**: `cco:ont00000995`
- **definition**: A specific grade and corresponding score achieved by a student in a core academic subject.
- **attributes**: subjectName, grade, score, term
- **relations**: recordedIn→AcademicRecord

## Interview Score
- **genus**: `cco:ont00000995`
- **definition**: A scored evaluation of a student's performance during an individual admission interview.
- **attributes**: scoreId, appearanceAndPoliteness, manner, totalInterviewScore, weighting
- **relations**: belongs_to_application→AdmissionApplication

## Activity Evidence
- **genus**: `cco:ont00000995`
- **definition**: Documentation of a student's participation and achievement in in-school or out-of-school extra-curricular activities.
- **attributes**: evidenceId, activityName, activityType, achievementLevel, awardedScore, isTopFive
- **relations**: supports_application→AdmissionApplication

## Identity Document
- **genus**: `cco:ont00000958`
- **definition**: An official document used to verify the identity and age of the applicant.
- **attributes**: documentId, documentType, issueDate, expiryDate, verificationStatus
- **relations**: belongs_to_student→Student
