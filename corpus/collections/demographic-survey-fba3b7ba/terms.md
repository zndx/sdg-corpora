# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Demographic Survey
- **genus**: `cco:ont00000958`
- **definition**: A statistical survey instrument and resulting dataset capturing population structure, age distribution, and household composition metrics for a defined territory and time period.
- **attributes**: surveyId, surveyYear, territory, totalPopulationCount, childPopulationCount, childPopulationPercentage, underFivePercentage, fiveToNinePercentage, tenToFourteenPercentage, fifteenToSeventeenPercentage
- **relations**: conductedBy→StatisticalBureau, coversTerritory→GeographicRegion

## Health Mortality Record
- **genus**: `cco:ont00000995`
- **definition**: A recorded instance of infant or child death data, categorized by cause, age group, gender, and geographic region, sourced from health ministry statistics.
- **attributes**: recordId, causeOfDeath, causePercentage, malePercentage, femalePercentage, ageGroup, recordYear, region
- **relations**: recordedInRegion→GeographicRegion, categorizedByCause→MedicalCondition

## Education Enrollment
- **genus**: `cco:ont00000995`
- **definition**: A statistical record of student enrollment, dropout rates, and failure rates across educational levels for a specific academic year and gender.
- **attributes**: enrollmentId, academicYear, educationLevel, totalStudents, dropoutRate, maleDropoutRate, femaleDropoutRate, failureRate, maleFailureRate, femaleFailureRate
- **relations**: measuredInRegion→GeographicRegion, partOfSurvey→DemographicSurvey

## Child Labor Statistic
- **genus**: `cco:ont00000995`
- **definition**: A statistical record quantifying the participation of children in the labor market, including employment rates, wage averages, and working hours by gender and region.
- **attributes**: laborStatId, statYear, employmentRate, maleEmploymentRate, femaleEmploymentRate, schoolAndWorkRate, averageDailyWage, weeklyWorkingHours, currencyCode
- **relations**: recordedInRegion→GeographicRegion, derivedFromSurvey→DemographicSurvey

## Poverty Index
- **genus**: `cco:ont00000995`
- **definition**: A statistical measure of household and child poverty levels based on consumption patterns, disaggregated by region and household composition.
- **attributes**: povertyIndexId, indexYear, householdPovertyRate, childPovertyRate, poorHouseholdsWithChildrenPercent, region
- **relations**: measuredInRegion→GeographicRegion, derivedFromSurvey→DemographicSurvey

## Geographic Region
- **genus**: `bfo:0000023`
- **definition**: A spatial planning entity representing a specific administrative or geographic territory such as the West Bank or Gaza Strip, used as a container for regional statistics.
- **attributes**: regionId, regionName, country
- **relations**: containsDemographicData→DemographicSurvey, containsHealthData→HealthMortalityRecord, containsEducationData→EducationEnrollment, containsLaborData→ChildLaborStatistic, containsPovertyData→PovertyIndex

## Statistical Bureau
- **genus**: `bfo:0000040`
- **definition**: An organizational role or entity responsible for conducting surveys, collecting data, and issuing statistical press releases regarding population and social conditions.
- **attributes**: bureauId, bureauName, location, contactPhone, contactEmail
- **relations**: conductsSurvey→DemographicSurvey, issuesPressRelease→StatisticalBureau
