# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Network Device
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual piece of networking hardware or software that processes and forwards data packets within a local area network or across the internet.
- **attributes**: deviceId, deviceType, ipAddress, firmwareVersion, status, lastHeartbeat
- **relations**: configuredBy→ServiceLevelAgreement, partOf→NetworkSegment, measuredBy→PerformanceMetric

## Service Level Agreement
- **genus**: `bfo:0000040`
- **definition**: A formal contract between an Internet Service Provider and a customer or between network segments that defines the level of service, quality of service parameters, and resource allocation guarantees.
- **attributes**: slaId, providerId, customerClass, maxBandwidth, latencyThreshold, packetLossLimit, effectiveDate, expirationDate
- **relations**: governs→NetworkDevice, definesQoSFor→TrafficClass, monitoredBy→ResourceManagementSystem

## Traffic Class
- **genus**: `bfo:0000040`
- **definition**: A categorization of network traffic flows based on quality of service requirements, such as latency, bandwidth, and jitter, used for differentiated services (DiffServ) handling.
- **attributes**: trafficClassId, dscpCode, priorityLevel, bandwidthAllocation, maxLatency, jitterTolerance
- **relations**: mappedTo→NetworkDevice, subjectTo→ServiceLevelAgreement, classifiedBy→CallAdmissionControl

## Call Admission Control
- **genus**: `bfo:0000015`
- **definition**: A process or mechanism that determines whether a new network connection or data flow should be admitted to the network based on available resources and current load, preventing congestion.
- **attributes**: cacId, algorithmType, currentLoad, thresholdUtilization, decisionStatus, timestamp
- **relations**: evaluates→TrafficClass, enforces→ServiceLevelAgreement, partOf→ResourceManagementSystem

## Resource Management System
- **genus**: `bfo:0000015`
- **definition**: A two-tier system (ATTRM) that plans and manages network resources, allocating bandwidth and capacity based on service level agreements and traffic engineering principles to optimize long-term revenue and efficiency.
- **attributes**: rmsId, systemVersion, optimizationGoal, totalCapacity, allocatedCapacity, lastOptimizationRun
- **relations**: manages→NetworkDevice, implements→ServiceLevelAgreement, contains→CallAdmissionControl, monitors→PerformanceMetric

## Performance Metric
- **genus**: `bfo:0000015`
- **definition**: A recorded measurement of network performance indicators such as bandwidth usage, latency, packet loss, or jitter, used to evaluate the effectiveness of resource management and service level agreements.
- **attributes**: metricId, metricType, value, unit, sampleTime, sourceDeviceId
- **relations**: measuredOn→NetworkDevice, validates→ServiceLevelAgreement, feeds→ResourceManagementSystem
