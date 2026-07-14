# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Information Logistics Strategy
- **genus**: `bfo:0000015`
- **definition**: A coordinated enterprise-wide plan to systematically pursue long-range aggregate goals for information logistics in sync with IT and business strategy.
- **attributes**: strategyIdentifier, formulationDate, implementationStatus, targetOrganizationalScope, alignmentWithITStrategy, alignmentWithBusinessStrategy
- **relations**: influencedBy→SuccessFactor, evaluatedBy→EmpiricalStudy, implementedBy→OrganizationalUnit

## Critical Success Factor
- **genus**: `bfo:0000015`
- **definition**: A specific organizational or operational factor identified as significantly influencing the success of an information logistics strategy implementation.
- **attributes**: factorName, factorCategory, validationStatus, influenceStrength, measurementMethod
- **relations**: contributesTo→InformationLogisticsStrategy, measuredIn→EmpiricalStudy

## Empirical Investigation
- **genus**: `cco:ont00000995`
- **definition**: A structured causal analysis conducted to identify and validate relationships between success factors and organizational performance in information logistics.
- **attributes**: studyIdentifier, conductedDate, methodology, sampleSize, publicationStatus, journalName
- **relations**: investigates→InformationLogisticsStrategy, identifies→SuccessFactor, measures→OrganizationalPerformance

## Organizational Performance Metric
- **genus**: `bfo:0000015`
- **definition**: A measurable outcome or indicator reflecting the effectiveness and efficiency of an organization's information logistics strategy implementation.
- **attributes**: metricName, measurementDate, value, unitOfMeasure, performanceCategory
- **relations**: resultOf→InformationLogisticsStrategy, recordedIn→EmpiricalStudy

## Organizational Unit
- **genus**: `bfo:0000015`
- **definition**: A distinct functional division or department within an enterprise responsible for implementing or utilizing information logistics strategies.
- **attributes**: unitIdentifier, unitName, departmentType, implementationRole
- **relations**: implements→InformationLogisticsStrategy, utilizes→AnalyticalInformationSystem

## Analytical Information System
- **genus**: `cco:ont00000995`
- **definition**: An enterprise application component designed to deliver analytical information to stakeholders for decision-making purposes, extending traditional business intelligence.
- **attributes**: systemIdentifier, systemName, systemType, deploymentDate, coverageScope
- **relations**: supports→OrganizationalUnit, extends→AnalyticalInformationSystem
