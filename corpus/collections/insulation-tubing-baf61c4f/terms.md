# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Insulation Tubing
- **genus**: `cco:ont00000995`
- **definition**: A radiation cross-linked halogen-free heat-shrinkable tubing used to protect and insulate bus bars in electrical switchgear and substations.
- **attributes**: productCode, shrinkRatio, operatingTemperatureMin, operatingTemperatureMax, minimumShrinkTemperature, halogenFree, rohsCompliant, continuousLength
- **relations**: meetsSpecification→MaterialSpecification, appliedTo→BusBar, testedBy→TestMethod

## Bus Bar
- **genus**: `bfo:0000015`
- **definition**: A conductive metal bar used in electrical switchgear and substations to distribute electrical power, which can be rectangular or round in cross-section.
- **attributes**: barType, crossSectionWidth, crossSectionHeight, nominalDiameter, voltageRating, material
- **relations**: insulatedBy→InsulationTubing, locatedIn→SwitchgearAssembly

## Switchgear Assembly
- **genus**: `bfo:0000015`
- **definition**: An electrical assembly containing bus bars, switches, and protective devices used to control, protect, and isolate electrical equipment in substations.
- **attributes**: assemblyId, voltageLevel, installationDate, manufacturer, status
- **relations**: contains→BusBar, suppliedBy→Manufacturer

## Material Specification
- **genus**: `cco:ont00000995`
- **definition**: A set of physical and chemical properties defining the performance characteristics of the insulation tubing material, including mechanical, electrical, and thermal properties.
- **attributes**: specId, tensileStrength, elongationAtBreak, dielectricStrength, dielectricConstant, volumeResistance, oxygenIndex, copperCorrosionRate, coldBendTemperature
- **relations**: testedBy→TestMethod, definesMaterial→InsulationTubing

## Test Method
- **genus**: `bfo:0000015`
- **definition**: A standardized procedure used to evaluate the physical, electrical, or thermal properties of the insulation tubing material.
- **attributes**: methodCode, testType, standardBody, agingCondition
- **relations**: evaluatesProperty→MaterialSpecification, appliedTo→InsulationTubing

## Dimensional Profile
- **genus**: `cco:ont00000995`
- **definition**: A set of geometric measurements defining the as-supplied and recovered dimensions of the insulation tubing, including inside diameter, wall thickness, and compatible bus bar sizes.
- **attributes**: profileId, insideDiameterMin, insideDiameterMax, wallThicknessMin, rectangularBusBarWidth, rectangularBusBarHeight, roundBusBarDiameter, shrinkRatio
- **relations**: fitsBusBar→BusBar, specifiesFor→InsulationTubing
