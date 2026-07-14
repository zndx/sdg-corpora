# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Graphics Accelerator
- **genus**: `cco:ont00000995`
- **definition**: A physical hardware component designed to accelerate graphics rendering and parallel computing tasks within a workstation or desktop system.
- **attributes**: manufacturerPartNumber, eanNumber, gpuArchitecture, memoryCapacityBytes, memoryInterfaceWidth, memoryBandwidthGbps, maxPowerConsumptionWatts, formFactor, thermalSolution
- **relations**: supportsApi→GraphicsApi, supportsApi→ComputeApi, deliversDisplayOutput→DisplayConnector, installedIn→WorkstationEnclosure

## Graphics Application Programming Interface
- **genus**: `cco:ont00000958`
- **definition**: A standardized software interface and specification that defines how a graphics accelerator interacts with 3D graphics applications and the underlying hardware.
- **attributes**: apiName, specificationVersion, conformanceStatus, standardBody
- **relations**: supportedBy→GraphicsAccelerator

## Compute Application Programming Interface
- **genus**: `cco:ont00000958`
- **definition**: A standardized software interface and specification that defines how a graphics accelerator executes parallel computing tasks and manages memory for general-purpose processing.
- **attributes**: apiName, specificationVersion, programmingLanguageSupport, featureSet
- **relations**: supportedBy→GraphicsAccelerator

## Display Connector
- **genus**: `cco:ont00000995`
- **definition**: A physical port or interface on a graphics accelerator that connects to a display device to transmit video and audio signals.
- **attributes**: connectorType, specificationVersion, maxResolutionX, maxResolutionY, refreshRateHz, colorDepthBits, supportsAudio, supportsHdcp
- **relations**: connectedTo→GraphicsAccelerator, requiresAdapter→Adapter

## Display Adapter
- **genus**: `cco:ont00000995`
- **definition**: A passive or active hardware component used to convert a display connector on a graphics accelerator to a different physical or signal standard.
- **attributes**: manufacturerPartNumber, sourceConnectorType, targetConnectorType, quantityIncluded
- **relations**: suppliedWith→GraphicsAccelerator, usedWith→DisplayConnector

## Workstation Enclosure
- **genus**: `cco:ont00000995`
- **definition**: A physical chassis or case designed to house computer components, including graphics accelerators, in a desktop, mid-tower, or small form factor system.
- **attributes**: enclosureType, availableExpansionSlots, powerSupplyWatts, supportedFormFactors
- **relations**: houses→GraphicsAccelerator

## Software Driver
- **genus**: `cco:ont00000958`
- **definition**: A software component that provides an interface between the operating system and the graphics accelerator hardware, enabling application execution and hardware control.
- **attributes**: driverName, version, supportedOperatingSystem, bitArchitecture, installationGuideUrl
- **relations**: controls→GraphicsAccelerator
