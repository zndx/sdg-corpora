# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cancer Waiting Time Target
- **genus**: `bfo:0000015`
- **definition**: A regulatory performance target defining the maximum allowable duration for a patient to wait between a clinical milestone and the initiation of cancer treatment.
- **attributes**: targetIdentifier, effectiveDate, tolerancePercentage, targetStatus, applicablePatientAgeMinimum
- **relations**: appliesTo→CancerType, monitoredBy→NHSBoard

## Cancer Type
- **genus**: `cco:ont00000995`
- **definition**: A specific pathological classification of primary cancer used for grouping patient cohorts and monitoring treatment waiting times.
- **attributes**: cancerTypeName, icd10Code, isPrimaryCancer
- **relations**: monitoredUnder→CancerWaitingTimeTarget

## NHS Board
- **genus**: `bfo:0000040`
- **definition**: A regional health service delivery organization responsible for administering healthcare resources and reporting performance statistics within a specific geographic area.
- **attributes**: boardName, isMainland, regionCode
- **relations**: reportsPerformanceFor→CancerWaitingTimeTarget, serves→Patient

## Patient Cohort
- **genus**: `bfo:0000040`
- **definition**: A defined aggregate of adult patients newly diagnosed with a specific primary cancer type, tracked for statistical analysis of waiting time performance.
- **attributes**: cohortIdentifier, diagnosisDateRangeStart, diagnosisDateRangeEnd, totalEligiblePatients, patientsTreatedWithinTarget, compliancePercentage
- **relations**: groupedBy→CancerType, trackedBy→NHSBoard, evaluatedAgainst→CancerWaitingTimeTarget

## Statistical Report
- **genus**: `cco:ont00000958`
- **definition**: A formal quarterly publication documenting the performance of NHS Boards against cancer waiting time targets, including compliance percentages and key findings.
- **attributes**: reportTitle, publicationDate, reportingPeriodStart, reportingPeriodEnd, statisticsClassification, publisherName
- **relations**: documents→PatientCohort, publishedBy→NHSBoard
