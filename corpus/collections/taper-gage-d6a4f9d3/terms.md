# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Taper Gage
- **genus**: `cco:ont00000995`
- **definition**: A manufactured precision measuring instrument designed to verify the dimensions and angles of tapered workpieces.
- **attributes**: gageType, toolNumber, markSize, status, largeEndDiameter, smallEndDiameter, taperPerFoot, taperPerInch, taperTolerance, includedAngle
- **relations**: hasSpecification→GageSpecification, manufacturedBy→Manufacturer, requestedBy→Requestor

## Gage Specification
- **genus**: `cco:ont00000958`
- **definition**: A formal record of the dimensional and angular requirements for a specific tapered gage, including tolerances and geometric constraints.
- **attributes**: largeEndDiameter, smallEndDiameter, taperPerFoot, taperPerInch, taperTolerance, halfAngle, includedAngle, hasSteps, stepLocation
- **relations**: specifies→TaperGage

## Requestor
- **genus**: `bfo:0000040`
- **definition**: An individual or organizational entity that initiates a request for the manufacture of a tapered gage.
- **attributes**: name, company, phone, email
- **relations**: requests→TaperGage

## Manufacturer
- **genus**: `bfo:0000040`
- **definition**: An entity responsible for the fabrication and calibration of the tapered gage according to the provided specifications.
- **attributes**: name, contactEmail
- **relations**: manufactures→TaperGage
