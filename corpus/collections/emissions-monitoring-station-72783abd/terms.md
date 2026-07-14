# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Emissions Monitoring Station
- **genus**: `bfo:0000040`
- **definition**: A material entity that is a physical installation or apparatus used for measuring and recording continuous emissions from industrial sources.
- **attributes**: stationId, installationDate, lastCalibrationDate, operationalStatus, manufacturer, modelNumber
- **relations**: locatedAt→Site, monitorsSource→EmissionSource, maintainedBy→TestCrew

## Emission Source
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a physical facility or unit that releases pollutants into the atmosphere, such as boilers, turbines, or incinerators.
- **attributes**: sourceId, sourceType, commissioningDate, operationalStatus, fuelType, capacityMw
- **relations**: locatedAt→Site, hasMonitoringStation→EmissionsMonitoringStation, testedBy→TestCrew

## Test Crew
- **genus**: `bfo:0000004`
- **definition**: A social group of personnel organized to perform field testing, monitoring, and analysis of emissions monitoring systems and industrial sources.
- **attributes**: crewId, crewName, supervisorId, certificationLevel, activeSince
- **relations**: supervisedBy→ProjectManager, conductsTestOn→EmissionSource, operatesEquipment→EmissionsMonitoringStation

## Project Manager
- **genus**: `bfo:0000004`
- **definition**: A role played by a person who supervises test crews, manages air pollution test programs, and coordinates on-site equipment handling and operation procedures.
- **attributes**: managerId, fullName, officeLocation, certifications, yearsOfExperience
- **relations**: managesOffice→RegionalOffice, supervisesCrew→TestCrew, overseesProgram→EmissionsTestProgram

## Emissions Test Program
- **genus**: `bfo:0000015`
- **definition**: A planned activity or series of measurements involving the evaluation, testing, and analysis of continuous emissions monitoring systems and industrial sources.
- **attributes**: programId, programName, startDate, endDate, testType, status
- **relations**: targetsSource→EmissionSource, usesEquipment→EmissionsMonitoringStation, executedBy→TestCrew

## Regional Office
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a physical branch location or administrative facility where project managers and test crews are based and operations are coordinated.
- **attributes**: officeId, officeName, city, state, establishedDate
- **relations**: hostsManager→ProjectManager, supportsCrew→TestCrew
