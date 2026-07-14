# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Quality Assurance System
- **genus**: `bfo:0000015`
- **definition**: A coordinated set of procedures, standards, and activities implemented to ensure and improve the quality of higher education programs and institutions within the East African Community region.
- **attributes**: systemIdentifier, implementationDate, status, region, frameworkVersion
- **relations**: developedBy→RegionalCommission, appliedTo→AcademicProgram, measuredBy→QualityBenchmark

## Regional Commission
- **genus**: `bfo:0000015`
- **definition**: An institutional body responsible for coordinating, developing, and overseeing the implementation of quality assurance frameworks and higher education policies across the East African Community partner states.
- **attributes**: commissionCode, establishedDate, jurisdiction, commissionType, operationalStatus
- **relations**: oversees→QualityAssuranceSystem, collaboratesWith→University, reportsTo→EACSecretariat

## Academic Program
- **genus**: `bfo:0000015`
- **definition**: A structured curriculum and set of learning outcomes offered by a higher education institution, subject to quality assurance benchmarks and regional qualification frameworks.
- **attributes**: programCode, programName, qualificationLevel, creditHours, accreditationStatus, learningOutcomes
- **relations**: offeredBy→University, assessedBy→QualityAssuranceSystem, mapsTo→RegionalQualificationFramework

## University
- **genus**: `bfo:0000015`
- **definition**: A higher education institution operating within the East African Community, participating in regional quality assurance initiatives and contributing to human resource development and research.
- **attributes**: universityCode, institutionName, country, establishedYear, institutionType, qaComplianceLevel
- **relations**: participatesIn→QualityAssuranceSystem, offers→AcademicProgram, regulatedBy→RegionalCommission

## Quality Benchmark
- **genus**: `bfo:0000015`
- **definition**: A standardized metric or criterion used to evaluate the performance and quality of academic programs and institutions against regional and international standards.
- **attributes**: benchmarkId, metricName, targetValue, measurementUnit, evaluationFrequency, status
- **relations**: definesCriteriaFor→AcademicProgram, monitoredBy→RegionalCommission, validatedBy→ExpertPanel

## Expert Panel
- **genus**: `bfo:0000015`
- **definition**: A group of specialists commissioned to provide technical expertise, review quality assurance frameworks, and validate benchmarks during the consultative development process.
- **attributes**: panelId, panelName, expertiseDomain, commissioningBody, panelStatus
- **relations**: advises→RegionalCommission, validates→QualityBenchmark, consultedBy→University
