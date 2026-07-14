# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Product Specification
- **genus**: `cco:ont00000958`
- **definition**: A formal record defining the technical parameters, dimensions, and performance criteria for a construction material.
- **attributes**: productIdentifier, brandName, documentType, designSulfateClass, jointType, availabilityStatus
- **relations**: specifies→MaterialProperty, appliesTo→ProductVariant

## Material Property
- **genus**: `bfo:0000015`
- **definition**: A measurable physical or mechanical characteristic of a construction material under specific conditions.
- **attributes**: propertyType, measuredValue, unitOfMeasure, conditionLocation, moistureContent
- **relations**: measuredFor→ProductSpecification, appliesTo→ProductVariant

## Product Variant
- **genus**: `cco:ont00000995`
- **definition**: A specific manufactured configuration of a product defined by its face dimensions and joint type.
- **attributes**: variantIdentifier, faceLength, faceWidth, unit, hasHandholds
- **relations**: definedBy→ProductSpecification, exhibits→MaterialProperty, hasDimension→DimensionalSpec

## Dimensional Specification
- **genus**: `cco:ont00000995`
- **definition**: A record of the physical size and weight parameters for a specific product variant.
- **attributes**: thickness, weight, weightUnit, densityCondition, moistureAdjustment
- **relations**: appliesTo→ProductVariant
