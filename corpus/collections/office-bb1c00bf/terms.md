# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## ALICO Office
- **genus**: `bfo:0000040`
- **definition**: A physical or organizational location where ALICO conducts business operations, such as the Wilmington headquarters or regional offices.
- **attributes**: officeId, city, region, country, isActive, establishedDate
- **relations**: hosts→Server, uses→SoftwareVersion

## enterprise Server
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual enterprise computing system used for production, development, or testing environments.
- **attributes**: serverId, model, partitionType, iparCount, status, lastHealthCheckDate
- **relations**: locatedIn→Office, runs→SoftwareVersion, generates→SystemMetric

## Application Software Version
- **genus**: `bfo:0000040`
- **definition**: A specific release or 'flavor' of an application deployed across ALICO offices, tracked to ensure correct maintenance and upgrades.
- **attributes**: softwareId, applicationName, versionNumber, releaseDate, isObsolete, maintenanceStatus
- **relations**: deployedTo→Office, installedOn→Server

## System Performance Metric
- **genus**: `bfo:0000015`
- **definition**: A recorded measurement of system resource usage, such as disk space, CPU utilization, or job counts, captured at specific intervals.
- **attributes**: metricId, metricType, value, timestamp, unit, isAnomalous
- **relations**: measuredOn→Server, recordedBy→MonitoringTool

## System Monitoring Application
- **genus**: `bfo:0000040`
- **definition**: A software application (e.g., Vision Director) used to automate system administration, collect metrics, and audit historical activity.
- **attributes**: toolId, toolName, version, vendor, isAutomated, lastRunDate
- **relations**: installedOn→Server, collects→SystemMetric

## Security Audit Record
- **genus**: `bfo:0000040`
- **definition**: A historical record of system activities, user actions, and job executions used for security auditing and troubleshooting.
- **attributes**: logId, actionType, userId, timestamp, status, isSuspicious
- **relations**: generatedBy→MonitoringTool, relatedTo→SystemMetric
