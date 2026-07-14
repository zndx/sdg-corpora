# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Drone Detection System
- **genus**: `bfo:0000040`
- **definition**: A physical system designed to detect, identify, and track unmanned aerial vehicles using radio frequency signals and data processing.
- **attributes**: systemIdentifier, manufacturer, modelNumber, deploymentStatus, effectiveRangeMeters, lastFirmwareVersion
- **relations**: uses→UpgradeModule, processes→DroneSignal, monitors→AirspaceZone

## Upgrade Module
- **genus**: `bfo:0000040`
- **definition**: A hardware dongle or USB device that enables encryption support and firmware updates for drone detection systems.
- **attributes**: moduleSerialNumber, firmwareVersion, encryptionStandard, authenticationStatus, sessionKey, compatibilityStatus
- **relations**: connectsTo→DroneDetectionSystem, communicatesWith→ManufacturerServer, contains→FirmwareCode

## Drone Signal
- **genus**: `bfo:0000040`
- **definition**: A radio frequency transmission emitted by a drone containing identification and flight data.
- **attributes**: signalId, droneSerialNumber, flightStatus, pilotLocation, encryptionStatus, timestamp
- **relations**: detectedBy→DroneDetectionSystem, originatesFrom→Drone, processedBy→UpgradeModule

## Manufacturer Server
- **genus**: `bfo:0000040`
- **definition**: A remote server operated by the drone manufacturer that handles authentication, encryption key distribution, and firmware updates.
- **attributes**: serverId, serverLocation, accessLevel, lastMaintenanceDate, securityAuditStatus
- **relations**: authenticates→UpgradeModule, distributes→EncryptionKey, monitors→DroneDetectionSystem

## Airspace Zone
- **genus**: `bfo:0000040`
- **definition**: A defined geographic area with specific flight restrictions or surveillance requirements.
- **attributes**: zoneId, zoneType, altitudeLimitMeters, radiusMeters, enforcementLevel
- **relations**: monitoredBy→DroneDetectionSystem, contains→Drone

## Drone
- **genus**: `bfo:0000040`
- **definition**: An unmanned aerial vehicle capable of emitting identification signals and performing flight operations.
- **attributes**: droneId, manufacturer, model, serialNumber, operationalStatus
- **relations**: emits→DroneSignal, operatesIn→AirspaceZone
