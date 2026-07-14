# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Census Record
- **genus**: `cco:ont00000995`
- **definition**: A statistical record of population, housing, and establishment data collected during a national census.
- **attributes**: censusYear, totalPopulation, region, dataStatus, recordIdentifier
- **relations**: coversRegion→GeographicRegion, containsDemographicData→DemographicStatistic

## Demographic Statistic
- **genus**: `cco:ont00000995`
- **definition**: A quantified measure of population characteristics such as age distribution, fertility rates, or mortality.
- **attributes**: statisticType, value, unit, year, region
- **relations**: derivedFromCensus→CensusRecord, describesPopulation→PopulationGroup

## Population Group
- **genus**: `bfo:0000015`
- **definition**: A defined subset of the population characterized by specific demographic attributes such as age or status.
- **attributes**: groupName, ageRangeStart, ageRangeEnd, totalCount, percentageOfTotal
- **relations**: partOfTerritory→GeographicRegion, exhibitsHealthIndicator→HealthIndicator

## Health Indicator
- **genus**: `cco:ont00000995`
- **definition**: A measured value representing the health status, medical care access, or nutritional condition of a population.
- **attributes**: indicatorName, percentage, year, region, dataSource
- **relations**: appliesToGroup→PopulationGroup, measuredBySurvey→HealthSurvey

## Health Survey
- **genus**: `cco:ont00000958`
- **definition**: A structured data collection instrument used to gather information on family health, nutrition, and medical care.
- **attributes**: surveyName, surveyYear, issuingBody, sampleSize, status
- **relations**: coversRegion→GeographicRegion, generatesIndicators→HealthIndicator

## Geographic Region
- **genus**: `bfo:0000015`
- **definition**: A defined territorial area such as the West Bank or Gaza Strip used for statistical aggregation.
- **attributes**: regionName, regionCode, populationDensity, areaSqKm, administrativeLevel
- **relations**: containsPopulation→PopulationGroup, hostsSurveyData→HealthSurvey

## Educational Enrollment
- **genus**: `cco:ont00000995`
- **definition**: A statistical record of student enrollment in educational institutions within a specific academic period.
- **attributes**: academicYear, totalStudents, femalePercentage, region, schoolStage
- **relations**: occursInRegion→GeographicRegion, relatedToTeacherCount→TeacherCount

## Teacher Count
- **genus**: `cco:ont00000995`
- **definition**: A statistical record of the number of teachers employed in educational institutions within a specific period.
- **attributes**: academicYear, totalTeachers, malePercentage, femalePercentage, region
- **relations**: servesRegion→GeographicRegion, supportsEnrollment→EducationalEnrollment
