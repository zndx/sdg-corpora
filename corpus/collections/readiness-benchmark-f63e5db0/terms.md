# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## College Readiness Benchmark
- **genus**: `bfo:0000015`
- **definition**: A standardized score threshold on a specific assessment domain that indicates a student is prepared for credit-bearing coursework without developmental intervention.
- **attributes**: benchmarkId, assessmentDomain, minimumScore, assessmentType, effectiveDate, expirationMonths, isMandatory, scoreScale
- **relations**: appliesTo→CourseLevel, measuredBy→AssessmentInstrument

## Postsecondary Course Level
- **genus**: `bfo:0000015`
- **definition**: A specific academic course or curriculum track within a public postsecondary institution that requires or grants college readiness status.
- **attributes**: courseCode, institutionCode, courseTitle, creditHours, isDevelopmental, isCreditBearing, department, semesterOffered
- **relations**: requiresBenchmark→ReadinessBenchmark, fulfillsOutcome→LearningOutcome

## Standardized Assessment Instrument
- **genus**: `cco:ont00000995`
- **definition**: A formal testing mechanism or exam used to measure student proficiency and determine college readiness status.
- **attributes**: instrumentCode, instrumentName, format, administeringBody, validityPeriodMonths, isDeprecated, versionNumber
- **relations**: definesBenchmark→ReadinessBenchmark, administers→StudentAssessmentRecord

## Curriculum Learning Outcome
- **genus**: `bfo:0000015`
- **definition**: A specific educational objective or competency that students must demonstrate mastery in through transitional, developmental, or supplemental coursework.
- **attributes**: outcomeId, domain, objectiveText, proficiencyLevel, assessmentMethod, isMandatory, lastReviewedDate
- **relations**: requiredBy→CourseLevel, supportsDomain→ReadinessBenchmark

## Student Test Score Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record of a student's performance on a specific standardized assessment, used to determine eligibility for credit-bearing coursework.
- **attributes**: recordId, studentId, testDate, score, percentile, isExpired, testingCenter, scoreReportId
- **relations**: generatedBy→AssessmentInstrument, evaluates→ReadinessBenchmark, belongs→StudentProfile

## Student Academic Profile
- **genus**: `bfo:0000015`
- **definition**: A comprehensive record of a student's academic history, including admission factors, test scores, and enrollment status at a public postsecondary institution.
- **attributes**: studentId, admissionStatus, highSchoolGPA, classRank, hasGED, enrollmentDate, institutionCode, isDevelopmentalRequired
- **relations**: contains→StudentAssessmentRecord, enrolledIn→CourseLevel, meets→ReadinessBenchmark
