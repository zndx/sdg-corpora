# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cancer Waiting Time Target
- **genus**: `bfo:0000015`
- **definition**: A regulatory performance target defining the maximum allowable time between a clinical event and the initiation of cancer treatment, measured as a duration in days.
- **attributes**: targetDuration, triggeringClinicalEvent, tolerancePercentage, implementationDate, status
- **relations**: appliesTo→CancerType, monitoredBy→NHSBoard

## Cancer Type
- **genus**: `cco:ont00000995`
- **definition**: A specific classification of primary cancer disease used to stratify patient cohorts for waiting time performance monitoring.
- **attributes**: cancerName, anatomicalRegion, isPrimary, clinicalCode
- **relations**: monitoredUnder→CancerWaitingTimeTarget

## NHS Board
- **genus**: `bfo:0000015`
- **definition**: A regional administrative and delivery unit of the National Health Service responsible for healthcare provision and performance reporting within a specific geographic area.
- **attributes**: boardName, isIslandBoard, region, reportingStatus
- **relations**: monitors→CancerWaitingTimeTarget, reports→WaitingTimeStatistic

## Waiting Time Statistic
- **genus**: `cco:ont00000995`
- **definition**: A quantitative record of patient performance against cancer waiting time targets for a specific reporting period, including compliance percentages and percentile calculations.
- **attributes**: reportingPeriod, compliancePercentage, eligiblePatientCount, treatmentStartCount, percentile90, dataQuality
- **relations**: measures→CancerWaitingTimeTarget, reportedBy→NHSBoard, stratifiedBy→CancerType

## Patient Cohort
- **genus**: `cco:ont00000995`
- **definition**: A defined group of adult patients with a newly diagnosed primary cancer, filtered by age and referral route, used as the denominator for waiting time performance calculations.
- **attributes**: ageThreshold, diagnosisDate, referralRoute, cohortSize
- **relations**: belongs_to→CancerType, monitored_by→NHSBoard
