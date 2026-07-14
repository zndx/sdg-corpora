# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Support System
- **genus**: `cco:ont00000995`
- **definition**: A physical plant system or component that provides essential services (e.g., cooling, power) to safety-related equipment, distinguished from safety-related equipment itself by its functional rather than operability-defined status.
- **attributes**: systemIdentifier, systemName, isTechnicalSpecificationBound, operabilityStatus, riskSignificanceLevel
- **relations**: hasLCO→LimitingConditionOfOperation, hasHazardBarrier→HazardBarrier, requiresMaintenance→MaintenanceAction, hasAlternateTemporarySystem→AlternateTemporarySystem

## Limiting Condition of Operation
- **genus**: `cco:ont00000995`
- **definition**: A specific state or condition defined in technical specifications that must be met for a support system to be considered operable and for the plant to operate safely.
- **attributes**: lcoIdentifier, lcoDescription, isNecessary, isRequired, complianceDeadline
- **relations**: appliesToSupportSystem→SupportSystem, isPartOfTechnicalSpec→TechnicalSpecification

## Hazard Barrier
- **genus**: `bfo:0000015`
- **definition**: A physical or administrative control measure designed to prevent the release of hazards or mitigate their consequences, subject to specific regulatory initiatives.
- **attributes**: barrierIdentifier, barrierType, effectivenessRating, regulatoryInitiative
- **relations**: protectsSupportSystem→SupportSystem, mitigatesHazard→Hazard

## Alternate Temporary System
- **genus**: `cco:ont00000995`
- **definition**: A provisional system deployed to maintain functionality when a primary support system is inoperable, subject to specific acceptability criteria and evaluation.
- **attributes**: atsIdentifier, deploymentDate, removalDate, acceptabilityStatus, evaluationCriteriaMet
- **relations**: replacesSupportSystem→SupportSystem, subjectToEvaluation→AcceptabilityEvaluation

## Acceptability Evaluation
- **genus**: `bfo:0000015`
- **definition**: A formal assessment process to determine if an alternate temporary system meets the required criteria for acceptability, considering risk and functional capability.
- **attributes**: evaluationId, evaluationDate, riskConsiderationIncluded, result, evaluatorLicenseeId
- **relations**: evaluatesSystem→AlternateTemporarySystem, usesCriteria→EvaluationCriteria

## Maintenance Action
- **genus**: `bfo:0000015`
- **definition**: A planned or unplanned activity performed on a support system to restore or maintain its operability or functionality, coordinated with technical specifications.
- **attributes**: maintenanceId, startDate, endDate, actionType, completesOnSchedule
- **relations**: performedOnSystem→SupportSystem, satisfiesLCO→LimitingConditionOfOperation, partOfMaintenanceRule→MaintenanceRule

## Snubber
- **genus**: `cco:ont00000995`
- **definition**: A mechanical device used to limit vibration or movement in piping and equipment, specifically addressed under TSTF 372 for operability and functionality distinctions.
- **attributes**: snubberId, location, isOperable, isFunctional, regulatoryAddress
- **relations**: installedInSystem→SupportSystem, requiresInspection→MaintenanceAction
