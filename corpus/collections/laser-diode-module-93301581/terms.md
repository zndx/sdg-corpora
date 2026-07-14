# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Laser Diode Module
- **genus**: `cco:ont00000995`
- **definition**: A manufactured optoelectronic assembly comprising a laser diode chip, a monitor photodiode, and polarization-maintaining fiber pigtails within a coaxial package.
- **attributes**: partNumber, centerWavelength, outputPower, thresholdCurrent, operatingCurrent, operatingVoltage, monitorCurrent, pdReverseVoltage
- **relations**: hasFiberAssembly→FiberAssembly, hasPackageStyle→PackageStyle, hasConnector→FiberConnector

## Fiber Assembly
- **genus**: `cco:ont00000995`
- **definition**: The polarization-maintaining optical fiber assembly coupled to the laser diode, including the fiber core, cladding, and length specifications.
- **attributes**: fiberType, fiberCore, fiberLength
- **relations**: isPartOf→LaserDiodeModule

## Package Style
- **genus**: `cco:ont00000995`
- **definition**: The physical housing and mechanical configuration of the laser diode module, specifically a coaxial package with defined pinout.
- **attributes**: styleName, pinConfiguration

## Fiber Connector
- **genus**: `cco:ont00000995`
- **definition**: The mechanical interface used to connect the pigtailed fiber to external optical systems, such as an FC connector.
- **attributes**: connectorType

## Environmental Specification
- **genus**: `cco:ont00000995`
- **definition**: The operational and storage environmental limits defining the safe operating conditions for the laser diode module.
- **attributes**: operatingTemperatureMin, operatingTemperatureMax, storageTemperatureMin, storageTemperatureMax, solderingTemperature, solderingDuration
- **relations**: appliesTo→LaserDiodeModule

## Application Domain
- **genus**: `bfo:0000023`
- **definition**: The intended use case or functional role of the laser diode module in medical or sensing contexts.
- **attributes**: domainName
- **relations**: isUsedIn→LaserDiodeModule
