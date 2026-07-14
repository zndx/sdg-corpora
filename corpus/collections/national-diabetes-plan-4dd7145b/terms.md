# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## National Diabetes Plan
- **genus**: `cco:ont00000958`
- **definition**: A formal government policy document outlining strategies for diabetes prevention, management, and care within a specific jurisdiction.
- **attributes**: planIdentifier, jurisdictionName, implementationStatus, adoptionDate, policyScope, responsibleAgency
- **relations**: coversJurisdiction→Jurisdiction, addressesHealthDomain→HealthDomain

## Healthcare Expenditure
- **genus**: `cco:ont00000995`
- **definition**: A financial record quantifying the monetary investment allocated for diabetes-related health services and prevention within a defined period.
- **attributes**: expenditureId, currencyCode, amountPerPerson, totalAmount, fiscalYear, coveragePercentage, allocationRegion
- **relations**: fundsJurisdiction→Jurisdiction, supportsHealthDomain→HealthDomain

## Surveillance Metric
- **genus**: `cco:ont00000995`
- **definition**: A recorded quantitative measure tracking the incidence, prevalence, or risk factors of diabetes and related conditions within a population.
- **attributes**: metricId, metricType, value, unit, measurementDate, populationAgeRange, dataSource
- **relations**: measuresPopulation→PopulationSegment, trackedByFramework→SurveillanceFramework

## Preventive Policy
- **genus**: `cco:ont00000958`
- **definition**: A regulatory or voluntary government action designed to reduce diabetes risk factors, such as advertising bans or industry agreements.
- **attributes**: policyId, policyName, policyType, implementationStatus, targetDemographic, effectiveDate, enforcingBody
- **relations**: appliesToJurisdiction→Jurisdiction, targetsHealthDomain→HealthDomain

## Health Service
- **genus**: `cco:ont00000995`
- **definition**: A specific medical or educational intervention provided to patients, such as self-management education or specialized care for specific groups.
- **attributes**: serviceId, serviceName, serviceCategory, availabilityStatus, targetGroup, geographicCoverage, costCoveragePercent
- **relations**: providedInJurisdiction→Jurisdiction, servesPopulation→PopulationSegment

## Jurisdiction
- **genus**: `bfo:0000002`
- **definition**: A defined geographical and administrative territory, such as a nation or local area, within which health policies and services are implemented.
- **attributes**: jurisdictionId, jurisdictionName, countryCode, administrativeLevel, populationCount, areaCode
- **relations**: containsPopulation→PopulationSegment, implementsPolicy→PreventivePolicy, hostsHealthService→HealthService

## Population Segment
- **genus**: `bfo:0000002`
- **definition**: A defined group of individuals within a jurisdiction characterized by specific demographic or clinical criteria, such as age range or diagnosis status.
- **attributes**: segmentId, segmentName, ageMin, ageMax, totalCount, diagnosedCount, undiagnosedCount, prevalenceRate
- **relations**: residesInJurisdiction→Jurisdiction, isMeasuredBy→SurveillanceMetric

## Surveillance Framework
- **genus**: `bfo:0000015`
- **definition**: A systematic process or protocol for routinely collecting, analyzing, and interpreting health data to monitor disease trends and policy effectiveness.
- **attributes**: frameworkId, frameworkName, adoptionStatus, frequency, scope, lastReviewDate
- **relations**: tracksMetric→SurveillanceMetric, operatesInJurisdiction→Jurisdiction
