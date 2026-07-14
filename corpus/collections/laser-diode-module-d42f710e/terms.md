# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Laser Diode Module
- **genus**: `cco:ont00000995`
- **definition**: A manufactured optoelectronic assembly containing a laser diode, photodiode, and polarization-maintaining fiber with a coaxial package.
- **attributes**: partNumber, centerWavelength, outputPower, monitorCurrent, thresholdCurrent, operatingCurrent, operatingVoltage, fiberLength
- **relations**: hasConnector→FiberConnector, usesFiberType→OpticalFiber, hasPackageStyle→PackageStyle

## Fiber Connector
- **genus**: `cco:ont00000995`
- **definition**: A mechanical interface used to connect the pigtailed polarization-maintaining fiber to external optical systems.
- **attributes**: connectorType, fiberLength

## Optical Fiber
- **genus**: `cco:ont00000995`
- **definition**: A polarization-maintaining (PM) optical fiber used to transmit light from the laser diode.
- **attributes**: fiberType, fiberCore

## Package Style
- **genus**: `cco:ont00000995`
- **definition**: The physical housing configuration of the laser diode module, specifically a coaxial package.
- **attributes**: packageStyle

## Photodiode
- **genus**: `cco:ont00000995`
- **definition**: A built-in monitoring photodiode integrated within the laser diode module to measure output power.
- **attributes**: pdReverseVoltage, monitorCurrent

## Operating Condition
- **genus**: `bfo:0000015`
- **definition**: A set of environmental and electrical parameters defining the operational state of the laser diode module.
- **attributes**: operatingTemperature, storageTemperature, solderingTemperature, reverseVoltage
- **relations**: appliesTo→LaserDiodeModule
