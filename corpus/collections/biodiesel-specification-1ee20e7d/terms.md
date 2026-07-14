# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Biodiesel (B100) ASTM Specification
- **genus**: `cco:ont00000958`
- **definition**: A formal document specifying the required physical and chemical properties for B100 biodiesel fuel.
- **attributes**: specificationId, standardNumber, publicationYear, grade, isCritical
- **relations**: hasProperty→BiodieselProperty

## Biodiesel Fuel Property
- **genus**: `cco:ont00000995`
- **definition**: A measurable characteristic of B100 biodiesel fuel defined by an ASTM test method.
- **attributes**: propertyName, astmMethodNumber, unitOfMeasure, isCritical
- **relations**: definedIn→BiodieselSpecification, hasLimit→PropertyLimit

## Biodiesel Property Limit
- **genus**: `cco:ont00000995`
- **definition**: A specific threshold value for a biodiesel property, associated with a fuel grade.
- **attributes**: limitValue, limitType, grade
- **relations**: appliesToProperty→BiodieselProperty

## Biodiesel Fuel Blend
- **genus**: `cco:ont00000995`
- **definition**: A mixture of B100 biodiesel and petroleum diesel fuel.
- **attributes**: blendId, biodieselPercentage, petroleumDieselPercentage, blendDate, status
- **relations**: containsComponent→FuelComponent

## Fuel Component
- **genus**: `cco:ont00000995`
- **definition**: A constituent material used in a biodiesel blend, either B100 or petroleum diesel.
- **attributes**: componentId, componentType, volume, batchId
- **relations**: isPartOfBlend→BiodieselBlend, meetsSpecification→BiodieselSpecification
