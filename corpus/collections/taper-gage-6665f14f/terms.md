# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Taper Gage
- **genus**: `cco:ont00000995`
- **definition**: A manufactured precision measuring instrument designed to verify the dimensions and taper of mating cylindrical components.
- **attributes**: gageType, toolNumber, markSize, largeEndDiameter, smallEndDiameter, taperRate, taperTolerance, includedAngle
- **relations**: measuredBy→DimensionalSpecification, hasSpecification→ToleranceRequirement

## Dimensional Specification
- **genus**: `cco:ont00000958`
- **definition**: A formal record of the geometric parameters defining a specific gage, including diameters, angles, and taper rates.
- **attributes**: largeEndDiameter, smallEndDiameter, taperRatePerFoot, taperRatePerInch, halfAngle, includedAngle
- **relations**: defines→TaperGage

## Tolerance Requirement
- **genus**: `cco:ont00000958`
- **definition**: A constraint specification defining the allowable manufacturing deviations for the gage's critical dimensions.
- **attributes**: largeEndTolerance, taperTolerancePerInch, referenceStandard
- **relations**: appliesTo→TaperGage

## Gage Step
- **genus**: `bfo:0000040`
- **definition**: A physical geometric feature, such as a shoulder or step, located at either the large or small end of a taper gage.
- **attributes**: location, isPresent
- **relations**: partOf→TaperGage
