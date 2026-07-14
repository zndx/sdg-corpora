# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Discretionary Place Application
- **genus**: `cco:ont00000958`
- **definition**: A formal submission record by a student and guardian seeking admission to a specific secondary school grade through a discretionary allocation process.
- **attributes**: applicationId, submissionDate, academicYear, status, totalScore, rank, interviewDate
- **relations**: submittedBy→Student, submittedTo→School, evaluatedBy→AdmissionCommittee, hasAcademicRecord→AcademicRecord, hasInterviewScore→InterviewScore, hasExtracurricularRecord→ExtracurricularRecord

## Student
- **genus**: `bfo:0000040`
- **definition**: A human individual enrolled in a primary school seeking admission to a secondary school grade.
- **attributes**: studentId, fullName, dateOfBirth, currentGrade, currentSchool
- **relations**: submitsApplication→DiscretionaryPlaceApplication, holdsAcademicRecord→AcademicRecord

## Academic Record
- **genus**: `cco:ont00000995`
- **definition**: A compiled record of a student's grades and scores in core subjects and overall conduct for a specific academic period.
- **attributes**: recordId, gradeLevel, term, conductScore, academicScore, totalWeightedScore
- **relations**: belongs_to_student→Student, contains_subject_grade→SubjectGrade

## Subject Grade
- **genus**: `cco:ont00000995`
- **definition**: A specific grade and corresponding numerical score achieved by a student in a core academic subject.
- **attributes**: subjectName, letterGrade, numericScore
- **relations**: part_of_record→AcademicRecord

## Interview Score
- **genus**: `bfo:0000015`
- **definition**: A measurement of a student's performance during an individual admission interview, including appearance, politeness, and manner.
- **attributes**: appearanceScore, politenessScore, mannerScore, totalInterviewScore, interviewDate
- **relations**: evaluates_student→Student, linked_to_application→DiscretionaryPlaceApplication

## Extracurricular Record
- **genus**: `cco:ont00000995`
- **definition**: A record of a student's participation and achievement in in-school or out-of-school extra-curricular activities.
- **attributes**: activityName, activityType, achievementLevel, scorePoints
- **relations**: belongs_to_student→Student, linked_to_application→DiscretionaryPlaceApplication

## School
- **genus**: `bfo:0000002`
- **definition**: An educational institution managing the discretionary place allocation process and student admissions.
- **attributes**: schoolCode, schoolName, allocatedPlaces, officeLocation, websiteUrl
- **relations**: receives_applications→DiscretionaryPlaceApplication, manages_committee→AdmissionCommittee

## Admission Committee
- **genus**: `bfo:0000040`
- **definition**: A group of school staff responsible for evaluating applications, conducting interviews, and determining admission rankings.
- **attributes**: committeeId, evaluationDate, resultReleaseDate
- **relations**: evaluates_applications→DiscretionaryPlaceApplication, part_of_school→School
