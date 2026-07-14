# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Chain Lubricant
- **genus**: `cco:ont00000995`
- **definition**: A formulated chemical substance applied to chain drives to reduce friction, wear, and corrosion.
- **attributes**: lubricantId, chemicalFamily, baseName, viscosityGrade, isTacky, isSolubleMoly, isEP, isAerosol
- **relations**: hasOperatingCondition→OperatingCondition, hasManufacturer→Manufacturer

## Operating Condition
- **genus**: `bfo:0000015`
- **definition**: A specific set of environmental and mechanical parameters defining the operational context of a chain drive.
- **attributes**: conditionId, temperatureMin, temperatureMax, loadLevel, isWet, isExposedToForeignMaterials
- **relations**: requiresLubricant→ChainLubricant, appliesToChainDrive→ChainDrive

## Chain Drive
- **genus**: `bfo:0000040`
- **definition**: A mechanical system transmitting power via a chain engaging with sprockets.
- **attributes**: driveId, driveType, isCriticalOperation, installationDate
- **relations**: usesLubricant→ChainLubricant, experiencesCondition→OperatingCondition, containsSprocket→Sprocket

## Sprocket
- **genus**: `cco:ont00000995`
- **definition**: A toothed wheel that engages with a chain to transmit rotational motion.
- **attributes**: sprocketId, toothCount, pitchDiameter, material
- **relations**: partOfDrive→ChainDrive, contactsChain→Chain

## Chain
- **genus**: `cco:ont00000995`
- **definition**: A series of connected links used to transmit mechanical power.
- **attributes**: chainId, linkType, pitch, material
- **relations**: partOfDrive→ChainDrive, engagesSprocket→Sprocket

## Manufacturer
- **genus**: `bfo:0000004`
- **definition**: An organization or entity responsible for producing the lubricant.
- **attributes**: manufacturerId, name, supportPhone
- **relations**: producesLubricant→ChainLubricant
