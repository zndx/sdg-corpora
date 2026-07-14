# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Data Center Facility
- **genus**: `bfo:0000040`
- **definition**: A physical facility housing computing infrastructure, network equipment, and storage systems, selected for proximity to internet landing stations and reliable power.
- **attributes**: location, powerSupplyReliability, guardingSchedule, accessControlLevel, hostsNationalInterconnect, latencyReductionStrategy
- **relations**: contains→Server, securedBy→PhysicalSecurityMeasure, connectedTo→Network

## Remote Server
- **genus**: `bfo:0000040`
- **definition**: A remote Linux server configured with the RACS client setup to interact with the RACS server for access validation and log pushing.
- **attributes**: serverId, osType, racsClientInstalled, accessLevel, lastLogPush, status
- **relations**: managedBy→RACS, generates→AccessLog, stores→UserData

## Rediff Access Control System
- **genus**: `bfo:0000040`
- **definition**: A web-based application that controls remote server access, collects access logs, and provides reporting and diagnostic capabilities.
- **attributes**: systemId, version, deploymentType, haEnabled, lastAuditDate, complianceStandard
- **relations**: manages→Server, uses→UMM, generates→AccessReport, stores→AccessLog

## User Management Module
- **genus**: `bfo:0000040`
- **definition**: A centralized user management and authentication server that manages the central user database accessible by other applications in the Rediff network.
- **attributes**: moduleId, databaseType, authenticationProtocol, registeredApplications, lastSyncDate, status
- **relations**: authenticates→User, manages→Role, providesAccessTo→Application

## Access Log Entry
- **genus**: `bfo:0000040`
- **definition**: A record of access activities on remote servers, including details of operations executed, used for reporting and analysis.
- **attributes**: logId, timestamp, userId, serverId, operationType, status
- **relations**: generatedBy→Server, recordedBy→RACS, performedBy→User

## Corporate Network
- **genus**: `bfo:0000040`
- **definition**: A mesh of interconnected networks peered with major ISPs, providing seamless and always available services, secured by firewalls and VPNs.
- **attributes**: networkId, peeringISPs, firewallEnabled, vpnRequired, tlsVersion, ddosProtectionEnabled
- **relations**: connects→DataCenter, securedBy→IntrusionDetectionSystem, monitoredBy→ArbourSystem

## DDoS Monitoring and Filtering System
- **genus**: `bfo:0000040`
- **definition**: A system that monitors and analyzes customer traffic in real-time to detect and filter DDoS attacks, ensuring optimum bandwidth utilization.
- **attributes**: systemId, monitoringSchedule, alertProactive, filteringAutomatic, lastAnalysisDate, status
- **relations**: monitors→Network, filters→DDoSAffectedTraffic
