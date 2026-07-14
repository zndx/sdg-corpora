# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Indoor Air Quality Measurement
- **genus**: `bfo:0000015`
- **definition**: A measurement event recording the concentration of specific pollutants within an indoor environment at a specific time and location.
- **attributes**: measurementId, timestamp, pollutantConcentration, unitOfMeasure, measurementMethod, sensorCalibrationDate
- **relations**: measuredAt→IndoorEnvironment, measuredBy→MonitoringDevice, recordsPollutant→IndoorPollutant

## Indoor Environment
- **genus**: `bfo:0000040`
- **definition**: A bounded physical space where human activities occur, such as a home, school, or healthcare facility, characterized by its structural and environmental properties.
- **attributes**: environmentId, environmentType, buildingAge, ventilationRate, occupancyLevel, lastInspectionDate
- **relations**: locatedIn→LocalAuthority, contains→IndoorPollutant, monitoredBy→MonitoringDevice

## Indoor Pollutant
- **genus**: `bfo:0000040`
- **definition**: A substance or agent present in an indoor environment that poses a risk to human health, such as carbon monoxide, formaldehyde, or particulate matter.
- **attributes**: pollutantId, pollutantName, sourceType, toxicityLevel, regulatoryLimit, healthImpactCategory
- **relations**: originatesFrom→PollutantSource, affects→VulnerablePopulation

## Pollutant Source
- **genus**: `bfo:0000040`
- **definition**: A specific object, activity, or material within an indoor environment that emits or generates indoor air pollutants.
- **attributes**: sourceId, sourceName, sourceCategory, emissionRate, installationDate, maintenanceStatus
- **relations**: locatedIn→IndoorEnvironment, emits→IndoorPollutant

## Vulnerable Population
- **genus**: `bfo:0000002`
- **definition**: A demographic group that is disproportionately affected by indoor air pollution due to factors such as age, health status, or socioeconomic conditions.
- **attributes**: populationGroupId, groupType, prevalenceRate, riskFactor, healthOutcome
- **relations**: exposedTo→IndoorPollutant, residesIn→IndoorEnvironment

## Policy Instrument
- **genus**: `bfo:0000015`
- **definition**: A regulatory, informational, or financial tool implemented by government bodies to mitigate indoor air pollution and protect public health.
- **attributes**: instrumentId, instrumentName, instrumentType, issuingAuthority, effectiveDate, enforcementLevel
- **relations**: targets→IndoorPollutant, appliesTo→IndoorEnvironment, implementedBy→GovernmentDepartment

## Government Department
- **genus**: `bfo:0000004`
- **definition**: A public administrative body responsible for specific policy areas related to indoor air quality, such as health, housing, or environment.
- **attributes**: departmentId, departmentName, departmentCode, responsibilityArea, ministerialLead, establishedDate
- **relations**: oversees→PolicyInstrument, coordinatesWith→GovernmentDepartment
