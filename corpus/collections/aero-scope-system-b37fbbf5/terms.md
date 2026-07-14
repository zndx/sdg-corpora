# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## AeroScope Detection System
- **genus**: `bfo:0000040`
- **definition**: A hardware and software platform used by military and law enforcement to detect, identify, and track drones in real time.
- **attributes**: systemId, firmwareVersion, detectionRangeKm, status, lastMaintenanceDate
- **relations**: uses→DongleModule, monitors→Drone, connectedTo→NetworkSegment

## AeroScope Upgrade Dongle
- **genus**: `bfo:0000040`
- **definition**: A USB hardware device that enables encryption support and firmware updates for the AeroScope system.
- **attributes**: dongleId, firmwareHash, manufactureDate, encryptionSupport, securityRiskLevel
- **relations**: authenticatesWith→DjiServer, contains→FirmwareCode, pluggedInto→AeroScopeSystem

## Small Unmanned Aircraft System
- **genus**: `bfo:0000040`
- **definition**: A consumer or commercial drone capable of transmitting flight data and location information.
- **attributes**: serialNumber, manufacturer, flightStatus, lastKnownLocation, encryptionStatus
- **relations**: detectedBy→AeroScopeSystem, transmitsDataTo→DataPackage, ownedBy→Pilot

## Encrypted Drone Data Packet
- **genus**: `bfo:0000040`
- **definition**: A structured data transmission containing drone flight status, path, and pilot location, encrypted by the DongleModule.
- **attributes**: packageId, timestamp, payloadSizeBytes, encryptionAlgorithm, decryptionStatus
- **relations**: generatedBy→Drone, processedBy→AeroScopeSystem, contains→FlightPathPoint

## Drone Flight Path Coordinate
- **genus**: `bfo:0000040`
- **definition**: A single geographic coordinate and timestamp representing a point in a drone's flight trajectory.
- **attributes**: pointId, latitude, longitude, altitudeMeters, timestamp
- **relations**: partOf→DataPackage, recordedBy→AeroScopeSystem

## DJI Authentication Server
- **genus**: `bfo:0000040`
- **definition**: A remote server operated by DJI that validates encryption keys and processes authentication requests from DongleModules.
- **attributes**: serverId, ipAddress, lastCommunicationTime, responseLatencyMs, securityAuditStatus
- **relations**: authenticates→DongleModule, stores→EncryptionKey, communicatesWith→NetworkSegment

## Drone Data Encryption Key
- **genus**: `bfo:0000040`
- **definition**: A cryptographic key used to encrypt and decrypt drone data signals, managed by DJI servers and validated by DongleModules.
- **attributes**: keyId, algorithmType, keyLengthBits, expirationDate, usageCount
- **relations**: issuedBy→DjiServer, usedBy→DongleModule, encrypts→DataPackage

## Government Network Segment
- **genus**: `bfo:0000040`
- **definition**: A secured portion of a government or military network where AeroScope systems are connected or accessed.
- **attributes**: segmentId, securityLevel, firewallEnabled, lastAuditDate, connectedDevicesCount
- **relations**: hosts→AeroScopeSystem, communicatesWith→DjiServer, monitoredBy→SecurityPolicy

## Network Security Policy
- **genus**: `bfo:0000040`
- **definition**: A set of rules and configurations governing access, encryption, and monitoring of network segments containing AeroScope systems.
- **attributes**: policyId, policyName, effectiveDate, lastReviewDate, complianceStatus
- **relations**: appliesTo→NetworkSegment, enforcedBy→FirewallRule, auditedBy→SecurityAudit

## Network Security Audit
- **genus**: `bfo:0000040`
- **definition**: A formal review and assessment of a network segment's compliance with security policies and identification of vulnerabilities.
- **attributes**: auditId, auditDate, auditorName, findingsCount, riskRating
- **relations**: assesses→NetworkSegment, evaluates→SecurityPolicy, documents→VulnerabilityReport

## Security Vulnerability Report
- **genus**: `bfo:0000040`
- **definition**: A documented record of identified security weaknesses in a network segment or system, resulting from a security audit.
- **attributes**: reportId, vulnerabilityType, severityScore, discoveryDate, remediationStatus
- **relations**: generatedBy→SecurityAudit, pertainsTo→NetworkSegment, references→SecurityPolicy
