# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Component Part
- **genus**: `cco:ont00000995`
- **definition**: A manufactured discrete electronic component, such as a silicon controlled rectifier, characterized by specific electrical and mechanical properties.
- **attributes**: partNumber, basePartNumber, suffix, caseStyle, markingStyle, isRoHsCompliant, isHighReliability, screeningStandard
- **relations**: hasElectricalSpec→ElectricalSpecification, hasMechanicalSpec→MechanicalSpecification, hasRating→ElectricalRating

## Electrical Specification
- **genus**: `cco:ont00000995`
- **definition**: A set of electrical performance parameters and limits for a discrete electronic component, measured under defined conditions.
- **attributes**: testAmbientTemperature, testConditionDescription, blockingVoltageRating, dcOnStateCurrent, repetitivePeakOnStateCurrent, peakSurgeCurrent, peakGateCurrent, averageGateCurrent, reverseGateVoltage, junctionTemperatureRange
- **relations**: appliesTo→ComponentPart

## Electrical Rating
- **genus**: `cco:ont00000995`
- **definition**: A specific maximum or nominal electrical value assigned to a component, representing a limit or characteristic under defined conditions.
- **attributes**: symbol, value, unit, condition, isRepetitive, isSurge
- **relations**: assignedTo→ComponentPart

## Mechanical Specification
- **genus**: `cco:ont00000995`
- **definition**: The physical construction details of a component, including its case style, pinout, and marking conventions.
- **attributes**: caseStyle, markingStyle, pinoutDescription, storageTemperatureRange
- **relations**: defines→ComponentPart

## Screening Standard
- **genus**: `cco:ont00000958`
- **definition**: A documented set of procedures and criteria used to qualify high-reliability electronic components, such as military specifications.
- **attributes**: standardCode, level, description
- **relations**: qualifies→ComponentPart
