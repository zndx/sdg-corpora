# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cyber Incident
- **genus**: `bfo:0000015`
- **definition**: A discrete cybersecurity event involving unauthorized access, attack, damage, or theft against an organization's digital assets.
- **attributes**: incidentId, timestamp, severityLevel, dwellTime, status, falsePositiveFlag
- **relations**: detectedBy→ThreatDetectionSystem, investigatedBy→SecurityAnalyst, affects→DigitalAsset, triggers→IncidentResponsePlan

## Threat Detection System
- **genus**: `cco:ont00000995`
- **definition**: A technological component or service that monitors, correlates, and identifies potential cyber threats across various environments.
- **attributes**: systemId, systemName, deploymentType, monitoringStatus, lastScanDate, aiEnabled
- **relations**: monitors→DigitalAsset, generates→SecurityEvent, partOf→SecurityPlatform

## Security Event
- **genus**: `bfo:0000015`
- **definition**: A recorded instance of activity within a monitored environment that may indicate a security threat or policy violation.
- **attributes**: eventId, eventType, sourceIp, destinationIp, timestamp, correlationScore
- **relations**: originatesFrom→ThreatDetectionSystem, relatesTo→CyberIncident, triggers→AutomatedResponse

## Digital Asset
- **genus**: `bfo:0000015`
- **definition**: A tangible or intangible resource owned or managed by an organization that holds value and requires protection.
- **attributes**: assetId, assetName, assetType, osType, criticalityLevel, lastComplianceCheck
- **relations**: protectedBy→SecurityPlatform, hosts→SecurityEvent, ownedBy→Organization

## Security Platform
- **genus**: `cco:ont00000995`
- **definition**: A unified software platform that integrates multiple security tools and services for holistic threat detection and response.
- **attributes**: platformId, platformName, version, deploymentDate, complianceFramework, isOpenXdr
- **relations**: integrates→ThreatDetectionSystem, manages→SecurityIncident, provides→AutomatedResponse

## Automated Response
- **genus**: `bfo:0000015`
- **definition**: A pre-configured action or workflow executed automatically by a security system to mitigate a detected threat.
- **attributes**: responseId, responseType, executionTime, successStatus, triggerEventId
- **relations**: triggeredBy→SecurityEvent, executedOn→DigitalAsset, partOf→SecurityPlatform
