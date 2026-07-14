# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Medical Device
- **genus**: `bfo:0000040`
- **definition**: A physical or software-based medical instrument, implant, or system used for diagnosis, treatment, or monitoring of patients.
- **attributes**: deviceIdentifier, manufacturer, modelNumber, serialNumber, operatingSystem, firmwareVersion, isNetworkCapable, isCurrentlyConnected, deploymentDate, expectedServiceLifeYears
- **relations**: hasRiskScore→CyberRiskScore, locatedIn→ClinicalSite, managedBy→ClinicalEngineeringTeam, subjectTo→CyberThreat

## Cyber Risk Score
- **genus**: `bfo:0000015`
- **definition**: A quantitative or qualitative assessment of the cybersecurity vulnerability and potential impact of a medical device or system.
- **attributes**: scoreValue, riskLevel, assessmentDate, scoringMethodology, isPrioritizedForResponse, responseAction
- **relations**: appliesTo→MedicalDevice, derivedFrom→CyberThreat

## Cyber Threat
- **genus**: `bfo:0000015`
- **definition**: A malicious activity, exploit, or vulnerability that targets medical devices or healthcare networks.
- **attributes**: threatIdentifier, threatType, targetOperatingSystem, targetDeviceModel, discoveryDate, severityLevel, isExploited, mitigationStatus
- **relations**: affects→MedicalDevice, monitoredBy→NetworkMonitoringSolution

## Clinical Site
- **genus**: `bfo:0000002`
- **definition**: A physical or virtual location where medical devices are deployed and patient care is delivered, such as a hospital, outpatient clinic, or home care setting.
- **attributes**: siteIdentifier, siteName, siteType, address, isConnectedToNetwork, totalDevicesAtSite, lastAuditDate
- **relations**: hosts→MedicalDevice, managedBy→ClinicalEngineeringTeam

## Clinical Engineering Team
- **genus**: `bfo:0000040`
- **definition**: A group of IT and clinical engineering personnel responsible for managing, maintaining, and securing medical devices and related infrastructure.
- **attributes**: teamIdentifier, teamName, hasCIO, hasCISO, responsibilityScope, isFormalized
- **relations**: manages→MedicalDevice, manages→ClinicalSite, implements→CybersecurityProgram

## Cybersecurity Program
- **genus**: `bfo:0000015`
- **definition**: A formalized set of policies, processes, and tools implemented by a healthcare organization to manage and mitigate cybersecurity risks associated with medical devices and networks.
- **attributes**: programIdentifier, programName, isFormalized, hasRiskScoringProcess, hasNetworkMonitoring, hasDeviceInventoryManagement, hasDefinedRoles, implementationDate
- **relations**: implementedBy→ClinicalEngineeringTeam, covers→MedicalDevice, monitors→CyberThreat

## Network Monitoring Solution
- **genus**: `bfo:0000040`
- **definition**: A software or hardware system that provides real-time visibility into network traffic, device connectivity, and potential cybersecurity threats.
- **attributes**: solutionIdentifier, solutionName, isRealTime, monitorsDeviceInventory, detectsVulnerabilities, lastScanDate, alertThreshold
- **relations**: monitors→MedicalDevice, monitors→CyberThreat, deployedAt→ClinicalSite
