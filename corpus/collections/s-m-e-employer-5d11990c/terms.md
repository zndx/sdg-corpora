# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Small and Medium-sized Enterprise Employer
- **genus**: `cco:ont00000995`
- **definition**: A commercial business entity operating in the UK economy with fewer than 250 employees, serving as the primary unit of analysis for growth and performance metrics.
- **attributes**: employerId, employeeCount, commercialSector, region, exportStatus, trainingCommitment
- **relations**: recordedIn→SurveyWave, measuredBy→GrowthPerformance, financedBy→FinanceAccess

## Survey Wave
- **genus**: `bfo:0000015`
- **definition**: A specific temporal instance of data collection, either from the Annual Small Business Survey (ASBS) or the Business Barometer series, capturing SME characteristics at a defined point in time.
- **attributes**: waveId, surveyType, startDate, endDate, economicPeriod, sampleSize
- **relations**: covers→SMEEmployer, conductedBy→ResearchAgency

## Research Agency
- **genus**: `cco:ont00000995`
- **definition**: The external organization responsible for executing the survey methodology and data collection for the study.
- **attributes**: agencyName, contractId
- **relations**: executed→SurveyWave

## Growth Performance
- **genus**: `bfo:0000015`
- **definition**: A measured outcome assessing the change in an SME's operational scale, specifically tracking fluctuations in employment levels and financial turnover over a 12-month period.
- **attributes**: employmentChange, turnoverChange, measurementPeriod, growthAmbition
- **relations**: appliesTo→SMEEmployer, observedIn→SurveyWave

## Finance Access
- **genus**: `bfo:0000015`
- **definition**: A process measuring the availability and supply of financial resources to an SME, influenced by banking sector conditions and recessionary pressures.
- **attributes**: accessStatus, financeType, bankingSectorImpact, amountRequested, amountApproved
- **relations**: appliesTo→SMEEmployer, observedIn→SurveyWave

## Policy Instrument
- **genus**: `cco:ont00000995`
- **definition**: A strategic measure or framework developed by government bodies to support the SME sector during periods of economic instability and recession.
- **attributes**: instrumentId, instrumentName, issuingBody, targetSector, effectiveDate
- **relations**: targets→SMEEmployer, addresses→FinanceAccess
